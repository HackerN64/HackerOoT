#include "global.h"
#include "z64.h"

static ProfilerState ProfilerState1;
static ProfilerState ProfilerState2;
ProfilerState* lastProfilerState;
ProfilerState* activeProfilerState;
u8 gProfilerMode = PROFILER_MODE_VIRTUAL_FPS;

void Profiler_RecordEventWithTime(u8 type, OSTime time){
    u32 prevInt = __osDisableInt();
    s32 e = activeProfilerState->eventIndex;
    if(e < PROFILER_EVENT_COUNT){
        activeProfilerState->eventTimes[e] = time;
        activeProfilerState->eventTypes[e] = type;
        (activeProfilerState->eventIndex)++;
    }
    __osRestoreInt(prevInt);
}

void Profiler_RecordEvent(u8 type){
    Profiler_RecordEventWithTime(type, osGetTime());
}

typedef enum {
    PERF_OVERALL,
    PERF_RDP,
    PERF_RSP_OVERALL,
    PERF_RSP_GFX,
    PERF_RSP_AUDIO,
    PERF_RSP_OTHER,
    PERF_RDP_CLK,
    PERF_RDP_NO_CMDS,
    PERF_FULLSYNC_WAIT,
    PERF_TMEM,
#if ENABLE_F3DEX3
    PERF_FIFO_FULL,
    PERF_VTX_PROC,
    PERF_TRI_PROC,
    PERF_SELF,
    PERF_RDP_STALL_RAM,
    PERF_RSP_STALL_DMA,
#endif
    PERF_COUNT
} PerfHistoryType;

#define NUM_FIR 8
static float perfHistory[PERF_COUNT][NUM_FIR];
static s32 firIdx;

void Profiler_Init() {
    bzero(&ProfilerState1, sizeof(ProfilerState));
    bzero(&ProfilerState2, sizeof(ProfilerState));
    lastProfilerState = &ProfilerState1;
    activeProfilerState = &ProfilerState2;
    
    for(s32 t=0; t<PERF_COUNT; ++t){
        for(s32 f=0; f<NUM_FIR; ++f){
            perfHistory[t][f] = 0.0f;
        }
    }
    firIdx = 0;
}

#define CPU_CLOCK 93750000
static f32 cpu_time_to_ms(OSTime t) {
    u32 counts = (u32)t;
    f32 f = (f32)(counts / 32);
    return f * (32.0f * 1000.0f / (f32)(CPU_CLOCK / 2));
}
#define RCP_CLOCK 62500000
static f32 rcp_cycles_to_ms(u32 cyc) {
    f32 f = (f32)(cyc / 32);
    return f * (32.0f * 1000.0f / (f32)(RCP_CLOCK));
}

void draw_counter_red_if_high(GfxPrint* printer, f32 value, f32 threshold, Color_RGBA8_u32 normalColor, const char* label){
    static const Color_RGBA8_u32 red = (Color_RGBA8_u32){{255, 0, 0, 255}};
    GfxPrint_SetColor32(printer, (value >= threshold) ? red.rgba : normalColor.rgba);
    GfxPrint_Printf(printer, "%5.2f%s\n", value, label);
}

void check_print_inconsistency_thresh(GfxPrint* printer, float dt, const char* desc, float thresh){
    if(fabsf(dt) > 0.03f){
        GfxPrint_Printf(printer, "%s %5.2f\n", desc, dt);
    }
}

void check_print_inconsistency(GfxPrint* printer, float dt, const char* desc){
    check_print_inconsistency_thresh(printer, dt, desc, 0.02f);
}

void Profiler_Draw(GraphicsContext* gfxCtx) {
    ProfilerState* p = lastProfilerState;
    s32 numEvents = p->eventIndex;
    if(gProfilerMode == PROFILER_MODE_DISABLE){
        return;
    }
    
    OPEN_DISPS(gfxCtx, "profiler.c", __LINE__);
    
    GfxPrint printer;
    GfxPrint_Init(&printer);
    Gfx* opaStart = POLY_OPA_DISP;
    Gfx* gfx = Gfx_Open(POLY_OPA_DISP);
    gSPDisplayList(OVERLAY_DISP++, gfx);
    GfxPrint_Open(&printer, gfx);
    printer.flags &= ~GFXP_FLAG_SHADOW;
    
    if(gProfilerMode == PROFILER_MODE_REAL_FPS || gProfilerMode == PROFILER_MODE_VIRTUAL_FPS){
        // Get last total frametime
        OSTime start = 0, end = 0;
        for(s32 e=0; e<numEvents; ++e){
            if(p->eventTypes[e] == PROFILER_EVENT_TYPE_MAINGFXSTART){
                start = p->eventTimes[e];
            }else if(p->eventTypes[e] == PROFILER_EVENT_TYPE_MAINGFXEND){
                end = p->eventTimes[e];
                break;
            }
        }
        float fps;
        if(end == 0){
            fps = 0.0f;
        }else{
            float frameTime = cpu_time_to_ms(end - start);
            if(gProfilerMode == PROFILER_MODE_REAL_FPS){
                // Round up to the nearest 16.66 ms
                frameTime = ceilf(frameTime * (60.0f / 1000.0f)) * (1000.0f / 60.0f);
                if(frameTime < 50.0f) frameTime = 50.0f; // Cap to 20fps
            }
            fps = (frameTime <= 0.0f) ? 0.0f : (1000.0f / frameTime);
        }
        GfxPrint_SetBasePosPx(&printer, 6, 4);
        GfxPrint_SetColor32(&printer, 0xFFFFFFFF);
        GfxPrint_Printf(&printer, "%4.1f", fps);
    }else{
        OSTime tOverall = 0, tRDP = 0, tRSPOverall = 0, tRSPLastEnd = 0, tRSPGfx = 0,
            tRSPAudio = 0, tRSPOther = 0;
        for(s32 e=0; e<numEvents; ++e){
            OSTime t = p->eventTimes[e];
            switch(p->eventTypes[e]){
            case PROFILER_EVENT_TYPE_MAINGFXSTART:
                tOverall = tRDP = tRSPOverall = tRSPGfx = -t;
                break;
            case PROFILER_EVENT_TYPE_RDPEND:
                tRDP += t;
                break;
            case PROFILER_EVENT_TYPE_MAINGFXEND:
                tOverall += t;
                break;
            case PROFILER_EVENT_TYPE_RSPGFXSTART:
                tRSPGfx -= t;
                break;
            case PROFILER_EVENT_TYPE_RSPGFXEND:
                tRSPGfx += t;
                tRSPLastEnd = t;
                break;
            case PROFILER_EVENT_TYPE_RSPAUDIOSTART:
                tRSPAudio -= t;
                break;
            case PROFILER_EVENT_TYPE_RSPAUDIOEND:
                tRSPAudio += t;
                break;
            case PROFILER_EVENT_TYPE_RSPOTHERSTART:
                tRSPOther -= t;
                break;
            case PROFILER_EVENT_TYPE_RSPOTHEREND:
                tRSPOther += t;
                break;
            }
        }
        tRSPOverall += tRSPLastEnd;
        
        #define FIX_COUNTER(ctr) if(ctr > 1000000000) ctr = 0
        FIX_COUNTER(tOverall);
        FIX_COUNTER(tRDP);
        FIX_COUNTER(tRSPOverall);
        FIX_COUNTER(tRSPGfx);
        FIX_COUNTER(tRSPAudio);
        FIX_COUNTER(tRSPOther);
        
        firIdx %= NUM_FIR;
        perfHistory[PERF_OVERALL][firIdx] = cpu_time_to_ms(tOverall);
        perfHistory[PERF_RDP][firIdx] = cpu_time_to_ms(tRDP);
        perfHistory[PERF_RSP_OVERALL][firIdx] = cpu_time_to_ms(tRSPOverall);
        perfHistory[PERF_RSP_GFX][firIdx] = cpu_time_to_ms(tRSPGfx);
        perfHistory[PERF_RSP_AUDIO][firIdx] = cpu_time_to_ms(tRSPAudio);
        perfHistory[PERF_RSP_OTHER][firIdx] = cpu_time_to_ms(tRSPOther);
        float rdpOverallByCounter = rcp_cycles_to_ms(p->rdpClockCount);
        perfHistory[PERF_RDP_CLK][firIdx] = rdpOverallByCounter;
        perfHistory[PERF_RDP_NO_CMDS][firIdx] = rcp_cycles_to_ms(p->rdpClockCount - p->rdpCmdCount);
        perfHistory[PERF_FULLSYNC_WAIT][firIdx] = rcp_cycles_to_ms(p->rdpClockCount - p->rdpPipeCount);
        perfHistory[PERF_TMEM][firIdx] = rcp_cycles_to_ms(p->rdpTmemCount);
        
#if ENABLE_F3DEX3
        u8 ver = p->f3dex3Version & 3;
        bool hasFifoFull = ver == F3DEX3_PROF_DEF || ver == F3DEX3_PROF_A;
        perfHistory[PERF_FIFO_FULL][firIdx] = hasFifoFull ?
            rcp_cycles_to_ms(p->footer.def.stallRDPFifoFullCycles) : 0.0f;
        perfHistory[PERF_VTX_PROC][firIdx] = ver == F3DEX3_PROF_A ? 
            rcp_cycles_to_ms(p->footer.a.vertexProcCycles) : 0.0f;
        perfHistory[PERF_TRI_PROC][firIdx] = ver == F3DEX3_PROF_A ? 
            rcp_cycles_to_ms(p->footer.a.triProcCycles) : 0.0f;
        perfHistory[PERF_SELF][firIdx] = ver == F3DEX3_PROF_C ? 
            rcp_cycles_to_ms(p->footer.c.ex3UcodeCycles) : 0.0f;
        perfHistory[PERF_RDP_STALL_RAM][firIdx] =
            (ver == F3DEX3_PROF_C && p->footer.c.dlCommandCount != 0) ?
            rdpOverallByCounter * (1.0f - ((f32)p->footer.c.commandsSampledGclkActive
                / (f32)p->footer.c.dlCommandCount)) : 0.0f;
        perfHistory[PERF_RSP_STALL_DMA][firIdx] = ver == F3DEX3_PROF_C ? 
            rcp_cycles_to_ms(p->footer.c.stallDMACycles) : 0.0f;
#endif
        
        ++firIdx;
        firIdx %= NUM_FIR;
        
        float perfAvgs[PERF_COUNT];
        for(s32 p=0; p<PERF_COUNT; ++p){
            float avg = 0.0f;
            for(s32 f=0; f<NUM_FIR; ++f){
                avg += perfHistory[p][f];
            }
            avg *= (1.0f / (f32)NUM_FIR);
            perfAvgs[p] = avg;
        }
        
        // RSP times
        GfxPrint_SetBasePosPx(&printer, 252, 64);
        GfxPrint_SetColor32(&printer, 0xFF80FFFF);
        GfxPrint_Printf(&printer, "%5.2fe2e\n", perfAvgs[PERF_RSP_OVERALL]);
        GfxPrint_SetColor32(&printer, 0xFFFF00FF);
        GfxPrint_Printf(&printer, "%5.2faud\n", perfAvgs[PERF_RSP_AUDIO]);
        GfxPrint_SetColor32(&printer, 0xC06000FF);
        GfxPrint_Printf(&printer, "%5.2fjpg\n", perfAvgs[PERF_RSP_OTHER]);
        GfxPrint_SetColor32(&printer, 0x00FF80FF);
        GfxPrint_Printf(&printer, "%5.2fgfx\n", perfAvgs[PERF_RSP_GFX]);
#if ENABLE_F3DEX3
        f32 other = perfAvgs[PERF_RSP_GFX];
        if(hasFifoFull){
            GfxPrint_SetColor32(&printer, 0xFF6000FF);
            GfxPrint_Printf(&printer, "%5.2ffif\n", perfAvgs[PERF_FIFO_FULL]);
            other -= perfAvgs[PERF_FIFO_FULL];
            if(ver == F3DEX3_PROF_A){
                GfxPrint_SetColor32(&printer, 0xFF00FFFF);
                GfxPrint_Printf(&printer, "%5.2fVcy\n", perfAvgs[PERF_VTX_PROC]);
                other -= perfAvgs[PERF_VTX_PROC];
                GfxPrint_Printf(&printer, "%5.2fTcy\n", perfAvgs[PERF_TRI_PROC]);
                other -= perfAvgs[PERF_TRI_PROC];
            }
        }
        if(ver == F3DEX3_PROF_C){
            GfxPrint_SetColor32(&printer, 0xFF8000FF);
            GfxPrint_Printf(&printer, "%5.2fDMA\n", perfAvgs[PERF_RSP_STALL_DMA]);
            other -= perfAvgs[PERF_RSP_STALL_DMA];
        }
        if(hasFifoFull || ver == F3DEX3_PROF_C){
            GfxPrint_SetColor32(&printer, 0x00B000FF);
            GfxPrint_Printf(&printer, "%5.2foth\n", other);
        }
        if(ver == F3DEX3_PROF_C){
            static const Color_RGBA8_u32 selfColor = (Color_RGBA8_u32){{0, 180, 180, 255}};
            draw_counter_red_if_high(&printer, perfAvgs[PERF_RSP_GFX] - perfAvgs[PERF_SELF],
                0.3, selfColor, "slf");
        }
#endif
        GfxPrint_Printf(&printer, "\n");
        
        // RDP times
        static const Color_RGBA8_u32 rdpColor = (Color_RGBA8_u32){{100, 0, 255, 255}};
        GfxPrint_SetColor32(&printer, rdpColor.rgba);
        GfxPrint_Printf(&printer, "%5.2fRDP\n", perfAvgs[PERF_RDP_CLK]);
#if ENABLE_F3DEX3
        if(ver == F3DEX3_PROF_C){
            draw_counter_red_if_high(&printer, perfAvgs[PERF_RDP_STALL_RAM],
                0.3f * perfAvgs[PERF_RDP_CLK], rdpColor, "stl");
        }
#endif
        draw_counter_red_if_high(&printer, perfAvgs[PERF_RDP_NO_CMDS], 0.2, rdpColor, "/cm");
        draw_counter_red_if_high(&printer, perfAvgs[PERF_FULLSYNC_WAIT], 0.1, rdpColor, "fsy");
        draw_counter_red_if_high(&printer, perfAvgs[PERF_TMEM], 4.0, rdpColor, "tex");
        GfxPrint_Printf(&printer, "\n");
        
#if ENABLE_F3DEX3
        // Item counters
        GfxPrint_SetColor32(&printer, 0x802800FF);
        if(ver == F3DEX3_PROF_A || ver == F3DEX3_PROF_C){
            GfxPrint_Printf(&printer, "%5dDL\n", p->footer.a.dlCommandCount);
        }
        if(ver == F3DEX3_PROF_A){
            GfxPrint_Printf(&printer, "%5dfDL\n", p->footer.a.fetchedDLCommandCount);
        }
        if(ver == F3DEX3_PROF_C){
            GfxPrint_Printf(&printer, "%5dsml\n", p->footer.c.smallRDPCommandCount);
        }
        GfxPrint_SetColor32(&printer, 0x0040A0FF);
        if(ver == F3DEX3_PROF_DEF || ver == F3DEX3_PROF_B){
            GfxPrint_Printf(&printer, "%5dV\n", p->footer.def.vertexCount);
        }
        if(ver == F3DEX3_PROF_B){
            GfxPrint_Printf(&printer, "%5dlit\n", p->footer.b.litVertexCount);
        }
        if(ver == F3DEX3_PROF_DEF){
            GfxPrint_Printf(&printer, "%5dTin\n", p->footer.def.rspInTriCount);
            GfxPrint_Printf(&printer, "%5dTo\n", p->footer.def.rdpOutTriCount);
            GfxPrint_Printf(&printer, "%5drct\n", p->footer.def.rectCount);
        }
        if(ver == F3DEX3_PROF_B){
            GfxPrint_Printf(&printer, "%5docc\n", p->footer.b.occlusionPlaneCullCount);
            GfxPrint_Printf(&printer, "%5dclp\n", p->footer.b.clippedTriCount);
        }
        if(ver == F3DEX3_PROF_C){
            GfxPrint_Printf(&printer, "%5dmtx\n", p->footer.c.matrixCount);
        }
        if(ver == F3DEX3_PROF_B){
            GfxPrint_SetColor32(&printer, 0x00B0B0FF);
            GfxPrint_Printf(&printer, "%4d all\n", p->footer.b.allOverlayLoadCount);
            GfxPrint_Printf(&printer, "%4d 2lt\n", p->footer.b.lightingOverlayLoadCount);
            GfxPrint_Printf(&printer, "%4d 3cl\n", p->footer.b.clippingOverlayLoadCount);
            GfxPrint_Printf(&printer, "%4d 4m\n", p->footer.b.miscOverlayLoadCount);
        }
#endif
        
        // Timing inconsistencies
        GfxPrint_SetBasePosPx(&printer, 100, 200);
        GfxPrint_SetColor32(&printer, 0xFF8080FF);
        check_print_inconsistency(&printer, perfAvgs[PERF_RDP] - perfAvgs[PERF_RDP_CLK], "RDP time meas err");
        check_print_inconsistency(&printer, perfAvgs[PERF_OVERALL] - perfAvgs[PERF_RDP], "All time > RDP");
    }
    
    gfx = GfxPrint_Close(&printer);
    gSPEndDisplayList(gfx++);
    Gfx_Close(opaStart, gfx);
    POLY_OPA_DISP = gfx;
    GfxPrint_Destroy(&printer);

    CLOSE_DISPS(gfxCtx, "profiler.c", __LINE__);
}

void Profiler_Destroy() {
    // nothing
}
