#include "debug.h"
#include "z64collision_check.h"
#include "z64play.h"

#if ENABLE_HACKER_DEBUG

u8 ColliderView_Draw(void* unused) {
    CollisionCheckContext* colChkCtx = &gDebug.play->colChkCtx;
    u8 i;

    if (!gDebug.menu.bHitboxViewEnabled) {
        return true;
    }

    for (i = 0; i < colChkCtx->colATCount; i++) {
        Collider_Draw(gDebug.play, colChkCtx->colAT[i]);
    }

    for (i = 0; i < colChkCtx->colACCount; i++) {
        Collider_Draw(gDebug.play, colChkCtx->colAC[i]);
    }

    for (i = 0; i < colChkCtx->colOCCount; i++) {
        Collider* col = colChkCtx->colOC[i];
        if (col->ocFlags1 & OC1_ON) {
            Collider_Draw(gDebug.play, col);
        }
    }

    return true;
}

#endif
