#ifndef PROFILER_H
#define PROFILER_H

#define F3DEX3_PROF_DEF 0
#define F3DEX3_PROF_A 1
#define F3DEX3_PROF_B 2
#define F3DEX3_PROF_C 3

typedef struct {  /* Default performance counters, if no CFG_PROFILING_* is enabled */
    /* Number of vertices processed by the RSP */
    u16 vertexCount;
    /* Number of tris actually drawn, after clipping and all types of culling */
    u16 rdpOutTriCount;
    /* Number of tris which processing started on the RSP (before clipping / culling) */
    u32 rspInTriCount:18;
    /* Number of fill rects and tex rects drawn */
    u32 rectCount:14;
    /* Number of cycles the RSP was stalled because the RDP FIFO was full */
    u32 stallRDPFifoFullCycles;
    /* Unused, zero */
    u32 dummy;
} F3DEX3ProfilingDefault;

typedef struct {  /* Counters for CFG_PROFILING_A */
    /* Number of cycles the RSP spent processing vertex commands, including vertex DMAs */
    u32 vertexProcCycles;
    /* Number of display list commands fetched from DRAM, >= dlCommandCount */
    u16 fetchedDLCommandCount;
    /* Number of display list commands executed */
    u16 dlCommandCount;
    /* Number of cycles the RSP was stalled because the RDP FIFO was full */
    u32 stallRDPFifoFullCycles;
    /* Number of cycles the RSP spent processing triangle commands, NOT including buffer flushes (i.e. FIFO full) */
    u32 triProcCycles;
} F3DEX3ProfilingA;

typedef struct {  /* Counters for CFG_PROFILING_B */
    /* Number of vertices processed by the RSP */
    u16 vertexCount;
    /* Number of vertices processed which had lighting enabled */
    u16 litVertexCount;
    /* Number of tris culled by the occlusion plane */
    u32 occlusionPlaneCullCount:18;
    /* Number of RSP/input triangles which got clipped */
    u32 clippedTriCount:14;
    /* Number of times any microcode overlay was loaded */
    u32 allOverlayLoadCount:18;
    /* Number of times overlay 2 (lighting) was loaded */
    u32 lightingOverlayLoadCount:14;
    /* Number of times overlay 3 (clipping) was loaded */
    u32 clippingOverlayLoadCount:18;
    /* Number of times overlay 4 (mIT matrix, matrix multiply, etc.) was loaded */
    u32 miscOverlayLoadCount:14;
} F3DEX3ProfilingB;

typedef struct {  /* Counters for CFG_PROFILING_C */
    /* Total cycles F3DEX3 believes it was running, not including SPLoadUcode */
    u32 ex3UcodeCycles;
    /* The "GCLK is alive" bit of the RDP status is sampled once every time a
    display list command is started. This counts the number of times that bit
    was 1. Divide by dlCommandCount to get an approximate measurement of the
    percentage of time the RDP was doing useful work, as opposed to waiting
    for framebuffer / Z buffer memory transactions to complete. */
    u16 commandsSampledGclkActive;
    /* Number of display list commands executed */
    u16 dlCommandCount;
    /* Number of commands sent to the RDP except for triangle commands */
    u32 smallRDPCommandCount:18;
    /* Number of matrix loads, of any type */
    u32 matrixCount:14;
    /* Number of cycles the RSP was stalled waiting for any DMAs: vertex loads,
    matrix loads, copying command buffers to the RDP FIFO, overlay loads, etc. */
    u32 stallDMACycles;
} F3DEX3ProfilingC;

typedef struct {
    union {
        F3DEX3ProfilingDefault def;
        F3DEX3ProfilingA a;
        F3DEX3ProfilingB b;
        F3DEX3ProfilingC c;
        u64 dummy_alignment[2];
    };
    u32 taskdataptr; /* Not a perf counter, can ignore */
    u32 ucode; /* Not a perf counter, can ignore */
} F3DEX3YieldDataFooter;

typedef struct {
    OSTime gfxTaskStartTime;
    OSTime gfxRspDoneTime;
    OSTime gfxTaskAllDoneTime;
    OSTime rspRecentStartTime;
    OSTime rspGfxTotalTime;
    OSTime rspAudioTotalTime;
    OSTime rspJpegTotalTime;
    u32 rdpClockCount; // counts clock (not gclk)
    u32 rdpCmdCount;  // counts cmd_busy "DP CMDBUF is not empty". RDP command shuffle FIFO not empty.
    u32 rdpPipeCount; // counts pipe_busy, which is true until fullsync is complete.
    u32 rdpTmemCount; // counts tmem_busy "DP TMEM is loading". Cycles valid tex data on copy bus, doesn't count waiting for RDRAM.
    F3DEX3YieldDataFooter footer;
    s8 f3dex3Version;
} SchedPerfInfo;

extern SchedPerfInfo* volatile lastSchedPerfInfo;
extern SchedPerfInfo* volatile activeSchedPerfInfo;

// These are all inline functions because they're only called once. They would
// have just been directly included in the calling code, but this approach lets
// their functionality be separated visually.

static inline void Profiler_AudioCPUStart(){
    // TODO
}

static inline void Profiler_AudioCPUEnd(){
    // TODO
}

static inline void Profiler_GraphUpdateStart(){
    // TODO
}

static inline void Profiler_GraphWaitPrevFrameStart(){
    // TODO
}

static inline void Profiler_GraphWaitPrevFrameEnd(){
    // TODO
}

static inline void Profiler_GraphUpdateEnd(){
    // TODO
}

static inline void Profiler_RSPStart(u32 type, bool isFirstStartOfMainGfxTask){
    OSTime t = osGetTime();
    activeSchedPerfInfo->rspRecentStartTime = t;
    if(isFirstStartOfMainGfxTask){
        activeSchedPerfInfo->gfxTaskStartTime = t;
        activeSchedPerfInfo->rspGfxTotalTime = 0;
        activeSchedPerfInfo->rspAudioTotalTime = 0;
        activeSchedPerfInfo->rspJpegTotalTime = 0;
        activeSchedPerfInfo->f3dex3Version = TODO;
        osDpSetStatus(DPC_CLR_CLOCK_CTR | DPC_CLR_CMD_CTR | DPC_CLR_PIPE_CTR | DPC_CLR_TMEM_CTR);
    }
}

static inline void Profiler_RSPDone(OSTime t, u32 type){
    OSTime dt = t - activeSchedPerfInfo->rspRecentStartTime;
    activeSchedPerfInfo->rspRecentStartTime = 0;
    if (sc->curRSPTask->list.t.type == M_AUDTASK) {
        activeSchedPerfInfo->rspAudioTotalTime += dt;
    }else if(sc->curRSPTask->flags & OS_SC_NEEDS_RDP){
        activeSchedPerfInfo->rspGfxTotalTime += dt;
    }else{
        activeSchedPerfInfo->rspJpegTotalTime += dt;
    }
}

static inline void Profiler_RSPDoneNotYield(OSTime t, u32 flags){
    if((flags & OS_SC_NEEDS_RDP)){
        // This is the main graphics task, and it's done with the RSP
        activeSchedPerfInfo->gfxRspDoneTime = t;
        
        // Get F3DEX3 perf counters
        F3DEX3YieldDataFooter* footer = (F3DEX3YieldDataFooter*)(
            (u8*)gGfxSPTaskYieldBuffer +
            OS_YIELD_DATA_SIZE - sizeof(F3DEX3YieldDataFooter));
        osInvalDCache(footer, sizeof(F3DEX3YieldDataFooter));
        bcopy(footer, &activeSchedPerfInfo->footer, sizeof(F3DEX3YieldDataFooter));
    }
}

static inline void Profiler_RDPDone(){
    activeSchedPerfInfo->rdpTmemCount = IO_READ(DPC_TMEM_REG);
    activeSchedPerfInfo->rdpPipeCount = IO_READ(DPC_PIPEBUSY_REG);
    activeSchedPerfInfo->rdpCmdCount = IO_READ(DPC_BUFBUSY_REG);
    activeSchedPerfInfo->rdpClockCount = IO_READ(DPC_CLOCK_REG);
}

static inline void Profiler_TaskAllDone(u32 flags){
    if((flags & OS_SC_NEEDS_RDP)){
        // This is the main graphics task
        OSTime t = osGetTime();
        activeSchedPerfInfo->gfxTaskAllDoneTime = t;
        
        SchedPerfInfo* temp = activeSchedPerfInfo;
        activeSchedPerfInfo = lastSchedPerfInfo;
        lastSchedPerfInfo = temp;
        
        activeSchedPerfInfo->rspRecentStartTime = 0;
        activeSchedPerfInfo->gfxTaskStartTime = 0;
    }
}

static inline bool Profiler_GfxIsHung(){
    return OS_CYCLES_TO_USEC(osGetTime() - activeSchedPerfInfo->gfxTaskStartTime) > 1000000;
}

extern void Profiler_Init();
extern void Profiler_Draw();
extern void Profiler_Destroy();

#endif
