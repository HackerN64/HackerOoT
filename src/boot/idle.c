#include "global.h"
#include "terminal.h"

// For retail BSS ordering, the block number of sMainThread must be 0 or
// just above (the exact upper bound depends on the block numbers assigned to
// extern variables declared in headers).
#pragma increment_block_number 60

OSThread sMainThread;
STACK(sMainStack, 0x900);
StackEntry sMainStackInfo;
OSMesg sPiMgrCmdBuff[50];
OSMesgQueue gPiMgrCmdQueue;
OSViMode gViConfigMode;
u8 gViConfigModeType;

s8 D_80009430 = 1;
vu8 gViConfigBlack = true;
u8 gViConfigAdditionalScanLines = 0;
u32 gViConfigFeatures = OS_VI_DITHER_FILTER_ON | OS_VI_GAMMA_OFF;
f32 gViConfigXScale = 1.0;
f32 gViConfigYScale = 1.0;

void Main_ThreadEntry(void* arg) {
    OSTime time;

    PRINTF2("mainx 実行開始\n");
    DmaMgr_Init();
    PRINTF2("codeセグメントロード中...");
    time = osGetTime();
    DMA_REQUEST_SYNC(_codeSegmentStart, (uintptr_t)_codeSegmentRomStart, _codeSegmentRomEnd - _codeSegmentRomStart,
                     "../idle.c", 238);
    time -= osGetTime();
    PRINTF2("\rcodeセグメントロード中...完了\n");
    PRINTF2("転送時間 %6.3f\n");
    bzero(_codeSegmentBssStart, _codeSegmentBssEnd - _codeSegmentBssStart);
    PRINTF2("codeセグメントBSSクリア完了\n");

#if ENABLE_HACKER_DEBUG
    PRINTF("[HackerOoT:Info]: Loading 'debug' segment...\n");
    DMA_REQUEST_SYNC(_debugSegmentStart, (uintptr_t)_debugSegmentRomStart, _debugSegmentRomEnd - _debugSegmentRomStart,
                     __BASE_FILE__, __LINE__);
    bzero(_debugSegmentBssStart, _debugSegmentBssEnd - _debugSegmentBssStart);
    PRINTF("[HackerOoT:Info]: Completed!\n");
#endif

    Main(arg);
    PRINTF2("mainx 実行終了\n");
}

void Idle_ThreadEntry(void* arg) {
    PRINTF2("アイドルスレッド(idleproc)実行開始\n");
    PRINTF2("作製者    : %s\n", gBuildTeam);
    PRINTF2("MAKEOPTION: %s\n", gBuildMakeOption);
    PRINTF2(VT_FGCOL(GREEN));
    PRINTF2("ＲＡＭサイズは %d キロバイトです(osMemSize/osGetMemSize)\n", (s32)osMemSize / 1024);
    PRINTF2("_bootSegmentEnd(%08x) 以降のＲＡＭ領域はクリアされました(boot)\n", _bootSegmentEnd);
    PRINTF2("Ｚバッファのサイズは %d キロバイトです\n", 0x96);
    PRINTF2("ダイナミックバッファのサイズは %d キロバイトです\n", 0x92);
    PRINTF2("ＦＩＦＯバッファのサイズは %d キロバイトです\n", 0x60);
    PRINTF2("ＹＩＥＬＤバッファのサイズは %d キロバイトです\n", 3);
    PRINTF2("オーディオヒープのサイズは %d キロバイトです\n",
            ((intptr_t)&gAudioHeap[ARRAY_COUNT(gAudioHeap)] - (intptr_t)gAudioHeap) / 1024);
    PRINTF2(VT_RST);

    osCreateViManager(OS_PRIORITY_VIMGR);

    gViConfigFeatures = OS_VI_GAMMA_OFF | OS_VI_DITHER_FILTER_ON;
    gViConfigXScale = 1.0f;
    gViConfigYScale = 1.0f;

    switch (osTvType) {
        case OS_TV_NTSC:
            gViConfigModeType = OS_VI_NTSC_LAN1;
            gViConfigMode = osViModeNtscLan1;
            break;

        case OS_TV_PAL:
            gViConfigModeType = OS_VI_FPAL_LAN1;
            gViConfigMode = gCustomViModePal60Lan1;
            break;

        case OS_TV_MPAL:
            gViConfigModeType = OS_VI_MPAL_LAN1;
            gViConfigMode = osViModeMpalLan1;
            break;
    }

    D_80009430 = 1;
    osViSetMode(&gViConfigMode);
    ViConfig_UpdateVi(true);
    osViBlack(true);
    osViSwapBuffer((void*)0x803DA80); //! @bug Invalid vram address (probably intended to be 0x803DA800)
    osCreatePiManager(OS_PRIORITY_PIMGR, &gPiMgrCmdQueue, sPiMgrCmdBuff, ARRAY_COUNT(sPiMgrCmdBuff));
    StackCheck_Init(&sMainStackInfo, sMainStack, STACK_TOP(sMainStack), 0, 0x400, "main");
    osCreateThread(&sMainThread, THREAD_ID_MAIN, Main_ThreadEntry, arg, STACK_TOP(sMainStack), THREAD_PRI_MAIN_INIT);
    osStartThread(&sMainThread);
    osSetThreadPri(NULL, OS_PRIORITY_IDLE);

    for (;;) {}
}
