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

void Profiler_Init() {
    bzero(&ProfilerState1, sizeof(ProfilerState));
    bzero(&ProfilerState2, sizeof(ProfilerState));
    lastProfilerState = &ProfilerState1;
    activeProfilerState = &ProfilerState2;
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

void Profiler_Draw(GraphicsContext* gfxCtx) {
    ProfilerState* p = lastProfilerState;
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
        for(s32 e=0; e<p->eventIndex; ++e){
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
        GfxPrint_SetBasePosPx(&printer, 4, 4);
        GfxPrint_SetColor32(&printer, 0xFFFFFFFF);
        GfxPrint_Printf(&printer, "%4.1f", fps);
    }else{
        GfxPrint_SetBasePosPx(&printer, 252, 80);
        GfxPrint_SetColor32(&printer, 0xFFFFFFFF);
        GfxPrint_Printf(&printer, "TODO");
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
