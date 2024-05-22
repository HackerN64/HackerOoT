#include "global.h"
#include "z64.h"

static ProfilerState ProfilerState1;
static ProfilerState ProfilerState2;
static ProfilerState ProfilerState3;
ProfilerState* activeProfilerState = NULL;
ProfilerState* lastProfilerState = NULL;
ProfilerState* drawProfilerState = NULL;
u8 gProfilerMode = PROFILER_MODE_VIRTUAL_FPS;

void Profiler_RecordEventWithTime(u8 type, OSTime time){
    u32 prevInt = __osDisableInt();
    s32 e = activeProfilerState->numEvents;
    if(e < PROFILER_EVENT_COUNT){
        activeProfilerState->eventTimes[e] = time;
        activeProfilerState->eventTypes[e] = type;
        (activeProfilerState->numEvents)++;
    }
    __osRestoreInt(prevInt);
}

void Profiler_RecordEvent(u8 type){
    Profiler_RecordEventWithTime(type, osGetTime());
}

#define NUM_THREADS 11
static const u8 sThreadIdxToThreadId[NUM_THREADS] = {
    THREAD_ID_IDLE,
    THREAD_ID_FAULT,
    THREAD_ID_MAIN,
    THREAD_ID_GRAPH,
    THREAD_ID_SCHED,
    THREAD_ID_PADMGR,
    THREAD_ID_PIMGR,
    THREAD_ID_VIMGR,
    THREAD_ID_AUDIOMGR,
    THREAD_ID_DMAMGR,
    THREAD_ID_IRQMGR,
};
static const Color_RGBA8_u32 sThreadColor[NUM_THREADS] = {
    {{0xFF, 0xFF, 0xFF, 0xFF}},
    {{0xFF, 0x60, 0x00, 0xFF}},
    {{0x00, 0x00, 0xFF, 0xFF}},
    {{0x00, 0xFF, 0x00, 0xFF}},
    {{0xFF, 0xFF, 0x00, 0xFF}},
    {{0x40, 0x40, 0xFF, 0xFF}},
    {{0xFF, 0x80, 0x80, 0xFF}},
    {{0x40, 0x40, 0x40, 0xFF}},
    {{0xFF, 0x00, 0xB0, 0xFF}},
    {{0x90, 0xB0, 0xD0, 0xFF}},
    {{0x40, 0x00, 0x00, 0xFF}},
};
static const Color_RGBA8_u32 sGfxColor[4] = {
    {{0xFF, 0x80, 0xFF, 0xFF}},
    {{0xFF, 0xFF, 0x00, 0xFF}},
    {{0xC0, 0x60, 0x00, 0xFF}},
    {{0x00, 0xFF, 0x80, 0xFF}},
};
static const char* const sThreadShortName[NUM_THREADS] = {
    "idl",
    "flt",
    "mai",
    "grf",
    "sch",
    "pad",
    "pi ",
    "vi ",
    "aud",
    "dma",
    "irq",
};
#define MAX_THREAD_ID 20
static const s8 sThreadIdToThreadIdx[MAX_THREAD_ID] = {
    -1, 0, 1, 2, 3, 4, -1, 5, 6, 7, // 0 to 9
    8, -1, -1, -1, -1, -1, -1, -1, 9, 10
};

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
    PERF_THREAD_IDLE,
    PERF_THREAD_FAULT,
    PERF_THREAD_MAIN,
    PERF_THREAD_GRAPH,
    PERF_THREAD_SCHED,
    PERF_THREAD_PADMGR,
    PERF_THREAD_PIMGR,
    PERF_THREAD_VIMGR,
    PERF_THREAD_AUDIOMGR,
    PERF_THREAD_DMAMGR,
    PERF_THREAD_IRQMGR,
    PERF_COUNT
} PerfHistoryType;

#define NUM_FIR 8
static float perfHistory[PERF_COUNT][NUM_FIR];
static s32 firIdx;

void Profiler_Init() {
    bzero(&ProfilerState1, sizeof(ProfilerState));
    bzero(&ProfilerState2, sizeof(ProfilerState));
    bzero(&ProfilerState3, sizeof(ProfilerState));
    activeProfilerState = &ProfilerState1;
    lastProfilerState = &ProfilerState2;
    drawProfilerState = &ProfilerState3;
    
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
    check_print_inconsistency_thresh(printer, dt, desc, 0.03f);
}

#define TRACE_OFF_X 8
#define TRACE_WIDTH_PER_FRAME 80

static Gfx* draw_trace(Gfx* gfx, s32 y, u8 startEvent, u8 endEvent, Color_RGBA8_u32 color, bool useArrows){
    ProfilerState* p = drawProfilerState;
    // No syncs needed when changing prim color
    gDPSetPrimColor(gfx++, 0, 0, color.r, color.g, color.b, 255);
    const s32 height = 3;
    const s32 traceScale = CPU_CLOCK / (2 * 60 * TRACE_WIDTH_PER_FRAME);
    s32 startX = TRACE_OFF_X;
    bool isActive = false;
    for(s32 e=0; e<=p->numEvents; ++e){
        bool isStart;
        OSTime t;
        if(e == p->numEvents){
            if(!isActive) break;
            isStart = false;
            t = p->traceEndTime;
        }else{
            isStart = p->eventTypes[e] == startEvent;
            bool isEnd = p->eventTypes[e] == endEvent;
            if(!isStart && !isEnd) continue;
            t = p->eventTimes[e];
        }
        s32 x = (s32)(t - p->traceStartTime) / traceScale + TRACE_OFF_X;
        if(isStart){
            startX = x;
            isActive = true;
            continue;
        }
        if(x <= startX) x = startX + 1;
        if(startX < TRACE_OFF_X) startX = TRACE_OFF_X;
        if(x > 320) x = 320;
        if(useArrows){
            gDPFillRectangle(gfx++, startX, y - 1, startX + 1, y + height + 1);
            gDPFillRectangle(gfx++, x,      y - 1, x      + 1, y + height + 1);
            gDPFillRectangle(gfx++, startX + 1, y + 1, startX + 4, y + 2);
            gDPFillRectangle(gfx++, x - 3,      y + 1, x,          y + 2);
        }else{
            gDPFillRectangle(gfx++, startX, y, x, y + height);
        }
        isActive = false;
    }
    return gfx;
}

void Profiler_Draw(GraphicsContext* gfxCtx) {
    if(gProfilerMode == PROFILER_MODE_DISABLE){
        return;
    }
    
    {
        u32 prevInt = __osDisableInt();
        // Atomically swap last and draw.
        ProfilerState* temp = drawProfilerState;
        drawProfilerState = lastProfilerState;
        lastProfilerState = temp;
        __osRestoreInt(prevInt);
    }
    
    float perfAvgs[PERF_COUNT];
    ProfilerState* p = drawProfilerState;
    
    OPEN_DISPS(gfxCtx, "profiler.c", __LINE__);
    
    GfxPrint printer;
    GfxPrint_Init(&printer);
    Gfx* opaStart = POLY_OPA_DISP;
    Gfx* gfx = Gfx_Open(POLY_OPA_DISP);
    gSPDisplayList(OVERLAY_DISP++, gfx);
    GfxPrint_Open(&printer, gfx);
    printer.flags &= ~GFXP_FLAG_SHADOW;
    
    if(gProfilerMode == PROFILER_MODE_REAL_FPS || gProfilerMode == PROFILER_MODE_VIRTUAL_FPS){
        OSTime end = 0;
        if(gProfilerMode == PROFILER_MODE_REAL_FPS){
            end = p->traceEndTime;
        }else{
            for(s32 e=0; e<p->numEvents; ++e){
                if(p->eventTypes[e] == PROFILER_EVENT_TYPE_MAINGFXEND){
                    end = p->eventTimes[e];
                    break;
                }
            }
        }
        float fps;
        if(end == 0){
            fps = 0.0f;
        }else{
            float frameTime = cpu_time_to_ms(end - p->traceStartTime);
            fps = (frameTime <= 0.0f) ? 0.0f : (1000.0f / frameTime);
        }
        GfxPrint_SetBasePosPx(&printer, 6, 4);
        GfxPrint_SetColor32(&printer, 0xFFFFFFFF);
        GfxPrint_Printf(&printer, "%4.1f", fps);
    }else{
        OSTime tOverall = 0, tRDP = 0, tRSPOverall = 0, tRSPLastEnd = 0, tRSPGfx = 0,
            tRSPAudio = 0, tRSPOther = 0;
        OSTime tThreads[NUM_THREADS];
        for(s32 i=0; i<NUM_THREADS; ++i) tThreads[i] = 0;
        // Scheduler thread should always be the one running at start and end.
        tThreads[sThreadIdToThreadIdx[THREAD_ID_SCHED]] = -p->traceStartTime;
        
        for(s32 e=0; e<p->numEvents; ++e){
            OSTime t = p->eventTimes[e];
            u8 type = p->eventTypes[e];
            switch(type){
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
            default:
                s32 thread = 10000;
                if(type >= PROFILER_EVENT_TYPE_THREADEND){
                    thread = type - PROFILER_EVENT_TYPE_THREADEND;
                }else if(type >= PROFILER_EVENT_TYPE_THREADSTART){
                    t = -t;
                    thread = type - PROFILER_EVENT_TYPE_THREADSTART;
                }
                if(thread >= MAX_THREAD_ID) continue;
                s32 care = sThreadIdToThreadIdx[thread];
                if(care < 0) continue;
                tThreads[care] += t;
            }
        }
        tRSPOverall += tRSPLastEnd;
        // Scheduler thread should always be the one running at start and end.
        tThreads[sThreadIdToThreadIdx[THREAD_ID_SCHED]] += p->traceEndTime;
        
        #define FIX_COUNTER(ctr) if(ctr > 1000000000) ctr = 0
        FIX_COUNTER(tOverall);
        FIX_COUNTER(tRDP);
        FIX_COUNTER(tRSPOverall);
        FIX_COUNTER(tRSPGfx);
        FIX_COUNTER(tRSPAudio);
        FIX_COUNTER(tRSPOther);
        for(s32 i=0; i<NUM_THREADS; ++i) FIX_COUNTER(tThreads[i]);
        
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
        for(s32 i=0; i<NUM_THREADS; ++i){
            perfHistory[PERF_THREAD_IDLE + i][firIdx] = cpu_time_to_ms(tThreads[i]);
        }
        
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
        
        for(s32 i=0; i<PERF_COUNT; ++i){
            float avg = 0.0f;
            for(s32 f=0; f<NUM_FIR; ++f){
                avg += perfHistory[i][f];
            }
            avg *= (1.0f / (f32)NUM_FIR);
            perfAvgs[i] = avg;
        }
        
        GfxPrint_SetBasePosPx(&printer, 252, 64);
        
        if(gProfilerMode == PROFILER_MODE_GFX || gProfilerMode == PROFILER_MODE_GFX_TRACE
            || gProfilerMode == PROFILER_MODE_ALL_TRACE){
            // RSP times
            GfxPrint_SetColor32(&printer, sGfxColor[0].rgba);
            GfxPrint_Printf(&printer, "%5.2fe2e\n", perfAvgs[PERF_RSP_OVERALL]);
            GfxPrint_SetColor32(&printer, sGfxColor[1].rgba);
            GfxPrint_Printf(&printer, "%5.2faud\n", perfAvgs[PERF_RSP_AUDIO]);
            GfxPrint_SetColor32(&printer, sGfxColor[2].rgba);
            GfxPrint_Printf(&printer, "%5.2fjpg\n", perfAvgs[PERF_RSP_OTHER]);
            GfxPrint_SetColor32(&printer, sGfxColor[3].rgba);
            GfxPrint_Printf(&printer, "%5.2fgfx\n", perfAvgs[PERF_RSP_GFX]);
            if(gProfilerMode != PROFILER_MODE_GFX){
                GfxPrint_Printf(&printer, "\n");
            }
        }
        
        if(gProfilerMode == PROFILER_MODE_GFX){
            // Extended RSP times
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
        }
        
        if(gProfilerMode == PROFILER_MODE_CPU || gProfilerMode == PROFILER_MODE_CPU_TRACE
            || gProfilerMode == PROFILER_MODE_ALL_TRACE){
            for(s32 i=0; i<NUM_THREADS; ++i){
                GfxPrint_SetColor32(&printer, sThreadColor[i].rgba);
                GfxPrint_Printf(&printer, "%5.2f%s\n",
                    perfAvgs[PERF_THREAD_IDLE + i], sThreadShortName[i]);
            }
        }
        
        // Timing inconsistencies
        GfxPrint_SetBasePosPx(&printer, 100, 200);
        GfxPrint_SetColor32(&printer, 0xFF8080FF);
        check_print_inconsistency(&printer, perfAvgs[PERF_RDP] - perfAvgs[PERF_RDP_CLK], "RDP time meas err");
        check_print_inconsistency(&printer, perfAvgs[PERF_OVERALL] - perfAvgs[PERF_RDP], "All time > RDP");
    }
    
    gfx = GfxPrint_Close(&printer);
    GfxPrint_Destroy(&printer);

    if(gProfilerMode == PROFILER_MODE_GFX_TRACE || gProfilerMode == PROFILER_MODE_CPU_TRACE
        || gProfilerMode == PROFILER_MODE_ALL_TRACE){
        // Setup trace draw
        gDPPipeSync(gfx++);
        gDPSetCycleType(gfx++, G_CYC_1CYCLE);
        gDPSetCombineMode(gfx++, G_CC_PRIMITIVE, G_CC_PRIMITIVE);
        gDPSetRenderMode(gfx++, G_RM_NOOP, G_RM_NOOP2 | CVG_DST_FULL);
        gDPSetPrimColor(gfx++, 0, 0, 0, 0, 0, 255);
        for(s32 i=0; i<4; ++i){
            s32 x = TRACE_OFF_X + TRACE_WIDTH_PER_FRAME * i;
            gDPFillRectangle(gfx++, x, 56, x+1, 63);
        }
        s32 y = 66;
    
        if(gProfilerMode != PROFILER_MODE_CPU_TRACE){
            gfx = draw_trace(gfx, y, PROFILER_EVENT_TYPE_MAINGFXSTART,
                PROFILER_EVENT_TYPE_MAINGFXEND,  sGfxColor[0], true);
            y += 8;
            gfx = draw_trace(gfx, y, PROFILER_EVENT_TYPE_RSPAUDIOSTART,
                PROFILER_EVENT_TYPE_RSPAUDIOEND, sGfxColor[1], false);
            y += 8;
            gfx = draw_trace(gfx, y, PROFILER_EVENT_TYPE_RSPOTHERSTART,
                PROFILER_EVENT_TYPE_RSPOTHEREND, sGfxColor[2], false);
            y += 8;
            gfx = draw_trace(gfx, y, PROFILER_EVENT_TYPE_RSPGFXSTART,
                PROFILER_EVENT_TYPE_RSPGFXEND,   sGfxColor[3], false);
            y += 16;
        }
        if(gProfilerMode != PROFILER_MODE_GFX_TRACE){
            for(s32 i=0; i<NUM_THREADS; ++i){
                s32 id = sThreadIdxToThreadId[i];
                gfx = draw_trace(gfx, y, PROFILER_EVENT_TYPE_THREADSTART + id,
                    PROFILER_EVENT_TYPE_THREADEND + id, sThreadColor[i], false);
                y += 8;
            }
        }
        
        gDPPipeSync(gfx++);
    }
    
    gSPEndDisplayList(gfx++);
    Gfx_Close(opaStart, gfx);
    POLY_OPA_DISP = gfx;

    CLOSE_DISPS(gfxCtx, "profiler.c", __LINE__);
}

void Profiler_Destroy() {
    // nothing
}
