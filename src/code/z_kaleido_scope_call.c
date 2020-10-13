#include "global.h"
#include "vt.h"

void (*sKaleidoScopeUpdateFunc)(GlobalContext*);
void (*sKaleidoScopeDrawFunc)(GlobalContext*);
f32 D_80161398;
u32 D_8016139C;
void* D_801613A0;

extern void KaleidoScope_Update(GlobalContext*);
extern void KaleidoScope_Draw(GlobalContext*);

void KaleidoScopeCall_LoadPlayer() {
    KaleidoManagerOvl* playerActorOvl = &gKaleidoMgrOverlayTable[KALEIDO_OVL_PLAYER_ACTOR];

    if (gKaleidoMgrCurOvl != playerActorOvl) {
        if (gKaleidoMgrCurOvl) {
            osSyncPrintf(VT_FGCOL(GREEN));
            osSyncPrintf("カレイド領域 強制排除\n"); // Kaleido area forced exclusion
            osSyncPrintf(VT_RST);
            KaleidoManager_ClearOvl(gKaleidoMgrCurOvl);
        }
        osSyncPrintf(VT_FGCOL(GREEN));
        osSyncPrintf("プレイヤーアクター搬入\n"); // Player actor import
        osSyncPrintf(VT_RST);
        KaleidoManager_LoadOvl(playerActorOvl);
    }
}

void KaleidoScopeCall_Init(GlobalContext* globalCtx) {
    // Kaleidoscope replacement construct
    osSyncPrintf("カレイド・スコープ入れ替え コンストラクト \n");
    sKaleidoScopeUpdateFunc = KaleidoManager_GetRamAddr(KaleidoScope_Update);
    sKaleidoScopeDrawFunc = KaleidoManager_GetRamAddr(KaleidoScope_Draw);

    LOG_ADDRESS("kaleido_scope_move", KaleidoScope_Update, "../z_kaleido_scope_call.c", 98);
    LOG_ADDRESS("kaleido_scope_move_func", sKaleidoScopeUpdateFunc, "../z_kaleido_scope_call.c", 99);
    LOG_ADDRESS("kaleido_scope_draw", KaleidoScope_Draw, "../z_kaleido_scope_call.c", 100);
    LOG_ADDRESS("kaleido_scope_draw_func", sKaleidoScopeDrawFunc, "../z_kaleido_scope_call.c", 101);
    KaleidoSetup_Init(globalCtx);
}

void KaleidoScopeCall_Destroy(GlobalContext* globalCtx) {
    // Kaleidoscope replacement destruction
    osSyncPrintf("カレイド・スコープ入れ替え デストラクト \n");
    KaleidoSetup_Destroy(globalCtx);
}

void KaleidoScopeCall_Update(GlobalContext* globalCtx) {
    KaleidoManagerOvl* kaleidoScopeOvl = &gKaleidoMgrOverlayTable[KALEIDO_OVL_KALEIDO_SCOPE];
    PauseContext* pauseCtx = &globalCtx->pauseCtx;

    if (pauseCtx->state != 0 || pauseCtx->flag != 0) {
        if (pauseCtx->state == 1) {
            if (ShrinkWindow_GetCurrentVal() == 0) {
                HREG(80) = 7;
                HREG(82) = 3;
                R_PAUSE_MENU_MODE = 1;
                pauseCtx->unk_1E4 = 0;
                pauseCtx->unk_1EC = 0;
                pauseCtx->state = (pauseCtx->state & 0xFFFF) + 1;
            }
        } else if (pauseCtx->state == 8) {
            HREG(80) = 7;
            HREG(82) = 3;
            R_PAUSE_MENU_MODE = 1;
            pauseCtx->unk_1E4 = 0;
            pauseCtx->unk_1EC = 0;
            pauseCtx->state = (pauseCtx->state & 0xFFFF) + 1;
        } else if (pauseCtx->state == 2 || pauseCtx->state == 9) {
            osSyncPrintf("PR_KAREIDOSCOPE_MODE=%d\n", R_PAUSE_MENU_MODE);
            if (R_PAUSE_MENU_MODE >= 3) {
                pauseCtx->state++;
            }
        } else if (pauseCtx->state != 0) {
            if (gKaleidoMgrCurOvl != kaleidoScopeOvl) {
                if (gKaleidoMgrCurOvl != NULL) {
                    osSyncPrintf(VT_FGCOL(GREEN));
                    osSyncPrintf("カレイド領域 プレイヤー 強制排除\n"); // Kaleid Zone Player Forced Elimination
                    osSyncPrintf(VT_RST);
                    KaleidoManager_ClearOvl(gKaleidoMgrCurOvl);
                }
                osSyncPrintf(VT_FGCOL(GREEN));
                osSyncPrintf("カレイド領域 カレイドスコープ搬入\n"); // Kaleid area Kaleidoscope loading
                osSyncPrintf(VT_RST);
                KaleidoManager_LoadOvl(kaleidoScopeOvl);
            }

            if (gKaleidoMgrCurOvl == kaleidoScopeOvl) {
                sKaleidoScopeUpdateFunc(globalCtx);
                if (globalCtx->pauseCtx.state == 0 && globalCtx->pauseCtx.flag == 0) {
                    osSyncPrintf(VT_FGCOL(GREEN));
                    osSyncPrintf("カレイド領域 カレイドスコープ排出\n"); // Kaleid area Kaleidoscope emission
                    osSyncPrintf(VT_RST);
                    KaleidoManager_ClearOvl(kaleidoScopeOvl);
                    KaleidoScopeCall_LoadPlayer();
                }
            }
        }
    }
}

void KaleidoScopeCall_Draw(GlobalContext* globalCtx) {
    KaleidoManagerOvl* kaleidoScopeOvl = &gKaleidoMgrOverlayTable[KALEIDO_OVL_KALEIDO_SCOPE];

    if (R_PAUSE_MENU_MODE >= 3) {
        if ((globalCtx->pauseCtx.state >= 4 && globalCtx->pauseCtx.state < 8) ||
            (globalCtx->pauseCtx.state >= 11 && globalCtx->pauseCtx.state < 19)) {
            if (gKaleidoMgrCurOvl == kaleidoScopeOvl) {
                sKaleidoScopeDrawFunc(globalCtx);
            }
        }
    }
}
