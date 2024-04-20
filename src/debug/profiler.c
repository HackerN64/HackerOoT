#include "global.h"
#include "debug.h"

#define CPU_CLOCK 93750000
#define RCP_CLOCK 62500000

#define PERF_RSP_OVERALL 0
#define PERF_AUDIO 1
#define PERF_GFX 2
#define PERF_RDP 3
#define PERF_RDP_NO_CMDS 4
#define PERF_FULLSYNC_WAIT 5
#define PERF_TMEM 6
#define PERF_FIFO_FULL 7
#define PERF_VTX_PROC 8
#define PERF_TRI_PROC 9
#define PERF_SELF 10
#define PERF_RDP_STALL_RAM 11
#define PERF_RSP_STALL_DMA 12
#define PERF_COUNT 13

#define NUM_FIR 10

static f32 perfTimes[PERF_COUNT][NUM_FIR];
static s32 firIdx;
static f32 perfAvgs[PERF_COUNT];
static u8 hasFifoFull;
extern const char* const gF3DEX3VersionNames[];

void Profiler_Init(Profiler* this) {
    s32 t, f;

    for(t = 0; t < PERF_COUNT; ++t){
        for(f = 0; f < NUM_FIR; ++f){
            perfTimes[t][f] = 0.0f;
        }
    }

    firIdx = 0;
    this->bShow = false;
    this->mode = PROFILING_MODE_DEFAULT;
    this->results = NULL;
}

void Profiler_UpdateMode(Profiler* this, Input* controller) {
    if (CHECK_BTN_ALL(controller->cur.button, BTN_R) && CHECK_BTN_ALL(controller->press.button, BTN_DLEFT)) {
        if (this->mode == PROFILING_MODE_DEFAULT) {
            this->mode = PROFILING_MODE_C;
        } else {
            this->mode--;
        }
    }

    if (CHECK_BTN_ALL(controller->cur.button, BTN_R) && CHECK_BTN_ALL(controller->press.button, BTN_DRIGHT)) {
        this->mode++;
        if (this->mode > PROFILING_MODE_C) {
            this->mode = PROFILING_MODE_DEFAULT;
        }
    }

    if (CHECK_BTN_ALL(controller->cur.button, BTN_R) && CHECK_BTN_ALL(controller->press.button, BTN_L)) {
        this->bShow ^= 1;
    }
}

f32 Profiler_CpuTimeToMs(OSTime t) {
    u32 counts = (u32)t;
    f32 f = (f32)(counts / 32);
    return f * (32.0f * 1000.0f / (f32)(CPU_CLOCK / 2));
}

f32 Profiler_RcpCyclesToMs(u32 cyc) {
    f32 f = (f32)(cyc / 32);
    return f * (32.0f * 1000.0f / (f32)(RCP_CLOCK));
}

void Profiler_PrintDefault(Profiler* this, GraphicsContext* gfxCtx, u8 baseX, u8 baseY) {
    Color_RGBA8 rgba = { 255, 255, 255, 255 };

    Print_SetInfos(&gDebug.printer, gfxCtx, baseX, baseY, rgba);
    Print_Screen(&gDebug.printer, "%5dTin\n", this->results->def.rspInTriCount);

    Print_SetInfos(&gDebug.printer, gfxCtx, baseX, baseY + 1, rgba);
    Print_Screen(&gDebug.printer, "%5dTo\n", this->results->def.rdpOutTriCount);

    Print_SetInfos(&gDebug.printer, gfxCtx, baseX, baseY + 2, rgba);
    Print_Screen(&gDebug.printer, "%5drct\n", this->results->def.rectCount);
}

void Profiler_PrintA(Profiler* this, GraphicsContext* gfxCtx, u8 baseX, u8 baseY) {
    Color_RGBA8 rgba = { 255, 255, 255, 255 };

    Print_SetInfos(&gDebug.printer, gfxCtx, baseX, baseY, rgba);
    Print_Screen(&gDebug.printer, "%5dfDL\n", this->results->a.fetchedDLCommandCount);
}

void Profiler_PrintB(Profiler* this, GraphicsContext* gfxCtx, u8 baseX, u8 baseY) {
    Color_RGBA8 rgba = { 255, 255, 255, 255 };

    Print_SetInfos(&gDebug.printer, gfxCtx, baseX, baseY, rgba);
    Print_Screen(&gDebug.printer, "%5dlit\n", this->results->b.litVertexCount);

    Print_SetInfos(&gDebug.printer, gfxCtx, baseX, baseY + 1, rgba);
    Print_Screen(&gDebug.printer, "%5docc\n", this->results->b.occlusionPlaneCullCount);

    Print_SetInfos(&gDebug.printer, gfxCtx, baseX, baseY + 2, rgba);
    Print_Screen(&gDebug.printer, "%5dclp\n", this->results->b.clippedTriCount);

    Print_SetInfos(&gDebug.printer, gfxCtx, baseX, baseY + 3, rgba);
    Print_Screen(&gDebug.printer, "%4d all\n", this->results->b.allOverlayLoadCount);

    Print_SetInfos(&gDebug.printer, gfxCtx, baseX, baseY + 4, rgba);
    Print_Screen(&gDebug.printer, "%4d 2lt\n", this->results->b.lightingOverlayLoadCount);

    Print_SetInfos(&gDebug.printer, gfxCtx, baseX, baseY + 5, rgba);
    Print_Screen(&gDebug.printer, "%4d 3cl\n", this->results->b.clippingOverlayLoadCount);

    Print_SetInfos(&gDebug.printer, gfxCtx, baseX, baseY + 6, rgba);
    Print_Screen(&gDebug.printer, "%4d 4m\n", this->results->b.miscOverlayLoadCount);
}

void Profiler_PrintC(Profiler* this, GraphicsContext* gfxCtx, u8 baseX, u8 baseY) {
    Color_RGBA8 rgba = { 255, 255, 255, 255 };

    Print_SetInfos(&gDebug.printer, gfxCtx, baseX, baseY, rgba);
    Print_Screen(&gDebug.printer, "%5dsml\n", this->results->c.smallRDPCommandCount);

    Print_SetInfos(&gDebug.printer, gfxCtx, baseX, baseY + 1, rgba);
    Print_Screen(&gDebug.printer, "%5.2fslf\n", perfAvgs[PERF_SELF]);

    Print_SetInfos(&gDebug.printer, gfxCtx, baseX, baseY + 2, rgba);
    Print_Screen(&gDebug.printer, "%5.2fDMA\n", perfAvgs[PERF_RSP_STALL_DMA]);

    Print_SetInfos(&gDebug.printer, gfxCtx, baseX, baseY + 3, rgba);
    Print_Screen(&gDebug.printer, "%5dmtx\n", this->results->c.matrixCount);

}

void Profiler_Update(Profiler* this) {
    s32 p, f;
    hasFifoFull = this->mode == PROFILING_MODE_DEFAULT || this->mode == PROFILING_MODE_A;

    perfTimes[PERF_FIFO_FULL][firIdx] = hasFifoFull ?
        Profiler_RcpCyclesToMs(this->results->def.stallRDPFifoFullCycles) : 0.0f;

    perfTimes[PERF_VTX_PROC][firIdx] = this->mode == PROFILING_MODE_A ? 
        Profiler_RcpCyclesToMs(this->results->a.vertexProcCycles) : 0.0f;

    perfTimes[PERF_TRI_PROC][firIdx] = this->mode == PROFILING_MODE_A ? 
        Profiler_RcpCyclesToMs(this->results->a.triProcCycles) : 0.0f;

    perfTimes[PERF_SELF][firIdx] = this->mode == PROFILING_MODE_C ? 
        Profiler_RcpCyclesToMs(this->results->c.ex3UcodeCycles) : 0.0f;

    perfTimes[PERF_RDP_STALL_RAM][firIdx] = 0.0f;
        // (this->mode == PROFILING_MODE_C && this->results->c.dlCommandCount != 0) ?
        // rdpOverallByCounter * (1.0f - ((f32)this->results->c.commandsSampledGclkActive
        //     / (f32)this->results->c.dlCommandCount)) : 0.0f;

    perfTimes[PERF_RSP_STALL_DMA][firIdx] = this->mode == PROFILING_MODE_C ? 
        Profiler_RcpCyclesToMs(this->results->c.stallDMACycles) : 0.0f;

    ++firIdx;
    firIdx %= NUM_FIR;

    for(p = 0; p < PERF_COUNT; ++p){
        float avg = 0.0f;
        for(f = 0; f < NUM_FIR; ++f){
            avg += perfTimes[p][f];
        }
        avg *= (1.0f / (f32)NUM_FIR);
        perfAvgs[p] = avg;
    }
}

void Profiler_Draw(Profiler* this, GraphicsContext* gfxCtx) {
    Color_RGBA8 rgba = { 255, 255, 255, 255 };
    Color_RGBA8 bg = { 0, 0, 0, 128 };
    Vec2s left = { 15, 55 };
    Vec2s right = { 115, 225 };
    PrintUtils* pPrint = &gDebug.printer;

    Debug_DrawColorRectangle(gfxCtx, left, right, bg);

    Print_SetInfos(pPrint, gfxCtx, 3, 7, rgba);
    Print_Screen(pPrint, "%s\n", gF3DEX3VersionNames[this->mode]);

    Print_SetInfos(pPrint, gfxCtx, 3, 8, rgba);
    Print_Screen(pPrint, "----------\n");

    Print_SetInfos(pPrint, gfxCtx, 3, 9, rgba);
    if ((this->mode == PROFILING_MODE_DEFAULT) || (this->mode == PROFILING_MODE_B)) {
        Print_Screen(pPrint, "%5dV\n", this->results->def.vertexCount);
    } else {
        Print_Screen(pPrint, "None\n");
    }

    Print_SetInfos(pPrint, gfxCtx, 3, 10, rgba);
    if ((this->mode == PROFILING_MODE_A) || (this->mode == PROFILING_MODE_C)) {
        Print_Screen(pPrint, "%5dDL\n", this->results->a.dlCommandCount);
    } else {
        Print_Screen(pPrint, "None\n");
    }

    Print_SetInfos(pPrint, gfxCtx, 3, 11, rgba);
    Print_Screen(pPrint, "----------\n");

    switch (this->mode) {
        case PROFILING_MODE_DEFAULT:
            Profiler_PrintDefault(this, gfxCtx, 3, 12);
            break;
        case PROFILING_MODE_A:
            Profiler_PrintA(this, gfxCtx, 3, 12);
            break;
        case PROFILING_MODE_B:
            Profiler_PrintB(this, gfxCtx, 3, 12);
            break;
        case PROFILING_MODE_C:
            Profiler_PrintC(this, gfxCtx, 3, 12);
            break;
        default:
            break;
    }
}
