#ifndef PROFILER_INLINE_H
#define PROFILER_INLINE_H

#include "profiler.h"
#include "../variables.h"

extern void Profiler_RecordEventWithTime(u8 type, OSTime time);
extern void Profiler_RecordEvent(u8 type);

// These are all inline functions because they're only called once. They would
// have just been directly included in the calling code, but this approach lets
// their functionality be separated visually, and lets this get ported to other
// projects more easily.

static inline void Profiler_RSPStart(u32 type, bool isFirstStartOfMainGfxTask){
    OSTime t = osGetTime();
    u8 eventType;
    if(isFirstStartOfMainGfxTask){
        activeProfilerState->traceEndTime = t;

        {
            u32 prevInt = __osDisableInt();
            // Atomically swap last and active, and reset the important counter.
            ProfilerState* temp = activeProfilerState;
            activeProfilerState = lastProfilerState;
            lastProfilerState = temp;
            activeProfilerState->numEvents = 0;
            __osRestoreInt(prevInt);
        }

#if ENABLE_F3DEX3
        activeProfilerState->f3dex3Version = gLoadedF3DEX3Version;
#endif
        activeProfilerState->traceStartTime = t;

        osDpSetStatus(DPC_CLR_CLOCK_CTR | DPC_CLR_CMD_CTR | DPC_CLR_PIPE_CTR | DPC_CLR_TMEM_CTR);

        eventType = PROFILER_EVENT_TYPE_MAINGFXSTART;
    }else if(type == M_AUDTASK){
        eventType = PROFILER_EVENT_TYPE_RSPAUDIOSTART;
    }else if(type == M_GFXTASK){
        eventType = PROFILER_EVENT_TYPE_RSPGFXSTART;
    }else{
        eventType = PROFILER_EVENT_TYPE_RSPOTHERSTART;
    }
    activeProfilerState->lastRSPStartTime = t;
    Profiler_RecordEventWithTime(eventType, t);
}

static inline void Profiler_RSPDone(u32 type){
    u8 eventType;
    if (type == M_AUDTASK) {
        eventType = PROFILER_EVENT_TYPE_RSPAUDIOEND;
    }else if(type == M_GFXTASK){
        eventType = PROFILER_EVENT_TYPE_RSPGFXEND;
    }else{
        eventType = PROFILER_EVENT_TYPE_RSPOTHEREND;
    }
    Profiler_RecordEvent(eventType);
}

static inline void Profiler_RSPDoneNotYield(u32 flags){
    if((flags & OS_SC_NEEDS_RDP)){
        // This is the main graphics task, and it's done with the RSP
        Profiler_RecordEvent(PROFILER_EVENT_TYPE_RSPGFXLASTEND);
#if ENABLE_F3DEX3
        // Get F3DEX3 perf counters
        F3DEX3YieldDataFooter* footer = (F3DEX3YieldDataFooter*)(
            (u8*)gGfxSPTaskYieldBuffer +
            OS_YIELD_DATA_SIZE - sizeof(F3DEX3YieldDataFooter));
        osInvalDCache(footer, sizeof(F3DEX3YieldDataFooter));
        bcopy(footer, &activeProfilerState->footer, sizeof(F3DEX3YieldDataFooter));
#endif
    }
}

static inline void Profiler_RDPDone(){
    activeProfilerState->rdpTmemCount = IO_READ(DPC_TMEM_REG);
    activeProfilerState->rdpPipeCount = IO_READ(DPC_PIPEBUSY_REG);
    activeProfilerState->rdpCmdCount = IO_READ(DPC_BUFBUSY_REG);
    activeProfilerState->rdpClockCount = IO_READ(DPC_CLOCK_REG);
    Profiler_RecordEvent(PROFILER_EVENT_TYPE_RDPEND);
}

static inline void Profiler_TaskAllDone(u32 flags){
    if((flags & OS_SC_NEEDS_RDP)){
        Profiler_RecordEvent(PROFILER_EVENT_TYPE_MAINGFXEND);
    }
}

static inline bool Profiler_GfxIsHung(){
    OSTime t = osGetTime();
    return OS_CYCLES_TO_USEC(t - activeProfilerState->lastRSPStartTime) > 1000000
        || OS_CYCLES_TO_USEC(t - activeProfilerState->traceStartTime) > 1000000;
}

extern void Profiler_Init();
extern void Profiler_Draw(GraphicsContext* gfxCtx);
extern void Profiler_Destroy();

#endif
