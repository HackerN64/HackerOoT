#include "global.h"

#if ENABLE_NEW_LETTERBOX

#include "gfx.h"
#include "main.h"
#include "z_lib.h"

typedef struct {
    /* 0x0 */ s8 letterboxTarget;
    /* 0x1 */ s8 letterboxSize;
    /* 0x2 */ s8 pillarboxTarget;
    /* 0x3 */ s8 pillarboxSize;
} ShrinkWindow; // size = 0x4

ShrinkWindow sShrinkWindow;
ShrinkWindow* sShrinkWindowPtr;

void ShrinkWindow_Letterbox_SetSizeTarget(s32 target) {
    sShrinkWindowPtr->letterboxTarget = target;
}

s32 ShrinkWindow_Letterbox_GetSizeTarget(void) {
    return sShrinkWindowPtr->letterboxTarget;
}

void ShrinkWindow_Letterbox_SetSize(s32 size) {
    sShrinkWindowPtr->letterboxSize = size;
}

s32 ShrinkWindow_Letterbox_GetSize(void) {
    return sShrinkWindowPtr->letterboxSize;
}

void ShrinkWindow_Pillarbox_SetSizeTarget(s32 target) {
    sShrinkWindowPtr->pillarboxTarget = target;
}

s32 ShrinkWindow_Pillarbox_GetSizeTarget(void) {
    return sShrinkWindowPtr->pillarboxTarget;
}

void ShrinkWindow_Pillarbox_SetSize(s32 size) {
    sShrinkWindowPtr->pillarboxSize = size;
}

s32 ShrinkWindow_Pillarbox_GetSize(void) {
    return sShrinkWindowPtr->pillarboxSize;
}

void ShrinkWindow_Init(void) {
    sShrinkWindowPtr = &sShrinkWindow;
    bzero(sShrinkWindowPtr, sizeof(sShrinkWindow));
}

void ShrinkWindow_Destroy(void) {
    sShrinkWindowPtr = NULL;
}

void ShrinkWindow_Update(s32 framerateDivisor) {
    s32 step = (framerateDivisor == 3) ? 10 : (30 / framerateDivisor);
    s32 nextSize;

    nextSize = sShrinkWindowPtr->letterboxSize;
    Math_StepToIGet(&nextSize, sShrinkWindowPtr->letterboxTarget, step);
    sShrinkWindowPtr->letterboxSize = nextSize;

    nextSize = sShrinkWindowPtr->pillarboxSize;
    Math_StepToIGet(&nextSize, sShrinkWindowPtr->pillarboxTarget, step);
    sShrinkWindowPtr->pillarboxSize = nextSize;
}

void ShrinkWindow_Draw(GraphicsContext* gfxCtx) {
    Gfx* gfx;
    s8 letterboxSize = sShrinkWindowPtr->letterboxSize;
    s8 pillarboxSize = sShrinkWindowPtr->pillarboxSize;

    if (letterboxSize > 0) {
        OPEN_DISPS(gfxCtx);

        gfx = OVERLAY_DISP;

        gDPPipeSync(gfx++);
        gDPSetCycleType(gfx++, G_CYC_FILL);
        gDPSetRenderMode(gfx++, G_RM_NOOP, G_RM_NOOP2);
        gDPSetFillColor(gfx++, (GPACK_RGBA5551(0, 0, 0, 1) << 16) | GPACK_RGBA5551(0, 0, 0, 1));
        gDPFillRectangle(gfx++, 0, 0, gScreenWidth - 1, letterboxSize - 1);
        gDPFillRectangle(gfx++, 0, gScreenHeight - letterboxSize, gScreenWidth - 1, gScreenHeight - 1);

        gDPPipeSync(gfx++);
        gDPSetCycleType(gfx++, G_CYC_1CYCLE);
        gDPSetRenderMode(gfx++, G_RM_XLU_SURF, G_RM_XLU_SURF2);
        gDPSetPrimColor(gfx++, 0, 0, 0, 0, 0, 0);
        gDPFillRectangle(gfx++, 0, letterboxSize, gScreenWidth, letterboxSize + 1);
        gDPFillRectangle(gfx++, 0, gScreenHeight - letterboxSize - 1, gScreenWidth, gScreenHeight - letterboxSize);

        gDPPipeSync(gfx++);
        OVERLAY_DISP = gfx++;

        CLOSE_DISPS(gfxCtx);
    }

    if (pillarboxSize > 0) {
        OPEN_DISPS(gfxCtx);

        gfx = OVERLAY_DISP;

        gDPPipeSync(gfx++);
        gDPSetCycleType(gfx++, G_CYC_FILL);
        gDPSetRenderMode(gfx++, G_RM_NOOP, G_RM_NOOP2);
        gDPSetFillColor(gfx++, (GPACK_RGBA5551(0, 0, 0, 1) << 16) | GPACK_RGBA5551(0, 0, 0, 1));

        gDPFillRectangle(gfx++, 0, 0, pillarboxSize - 1, gScreenHeight - 1);
        gDPFillRectangle(gfx++, gScreenWidth - pillarboxSize, 0, gScreenWidth - 1, gScreenHeight - 1);

        gDPPipeSync(gfx++);
        gDPSetCycleType(gfx++, G_CYC_1CYCLE);
        gDPSetRenderMode(gfx++, G_RM_XLU_SURF, G_RM_XLU_SURF2);
        gDPSetPrimColor(gfx++, 0, 0, 0, 0, 0, 0);

        gDPFillRectangle(gfx++, pillarboxSize, 0, pillarboxSize + 2, gScreenHeight);
        gDPFillRectangle(gfx++, gScreenWidth - pillarboxSize - 2, 0, gScreenWidth - pillarboxSize, gScreenHeight);

        gDPPipeSync(gfx++);
        OVERLAY_DISP = gfx++;

        CLOSE_DISPS(gfxCtx);
    }
}

#else

typedef enum LetterboxState {
    /* 0 */ LETTERBOX_STATE_IDLE,
    /* 1 */ LETTERBOX_STATE_GROWING,
    /* 2 */ LETTERBOX_STATE_SHRINKING
} LetterboxState;

s32 sLetterboxState = LETTERBOX_STATE_IDLE;

s32 sLetterboxSizeTarget = 0;
s32 sLetterboxSize = 0;

#endif

void Letterbox_SetSizeTarget(s32 target) {
#if ENABLE_NEW_LETTERBOX
    return ShrinkWindow_Letterbox_SetSizeTarget(target);
#else
    if (R_HREG_MODE == HREG_MODE_LETTERBOX && R_LETTERBOX_ENABLE_LOGS == 1) {
        PRINTF("shrink_window_setval(%d)\n", target);
    }

    sLetterboxSizeTarget = target;
#endif
}

u32 Letterbox_GetSizeTarget(void) {
#if ENABLE_NEW_LETTERBOX
    return ShrinkWindow_Letterbox_GetSizeTarget();
#else
    return sLetterboxSizeTarget;
#endif
}

void Letterbox_SetSize(s32 size) {
#if ENABLE_NEW_LETTERBOX
    return ShrinkWindow_Letterbox_SetSize(size);
#else
    if (R_HREG_MODE == HREG_MODE_LETTERBOX && R_LETTERBOX_ENABLE_LOGS == 1) {
        PRINTF("shrink_window_setnowval(%d)\n", size);
    }

    sLetterboxSize = size;
#endif
}

u32 Letterbox_GetSize(void) {
#if ENABLE_NEW_LETTERBOX
    return ShrinkWindow_Letterbox_GetSize();
#else
    return sLetterboxSize;
#endif
}

void Letterbox_Init(void) {
#if !ENABLE_NEW_LETTERBOX
    if (R_HREG_MODE == HREG_MODE_LETTERBOX && R_LETTERBOX_ENABLE_LOGS == 1) {
        PRINTF("shrink_window_init()\n");
    }

    sLetterboxState = LETTERBOX_STATE_IDLE;
    sLetterboxSizeTarget = 0;
    sLetterboxSize = 0;
#endif
}

void Letterbox_Destroy(void) {
#if !ENABLE_NEW_LETTERBOX
    if (R_HREG_MODE == HREG_MODE_LETTERBOX && R_LETTERBOX_ENABLE_LOGS == 1) {
        PRINTF("shrink_window_cleanup()\n");
    }

    sLetterboxSize = 0;
#endif
}

void Letterbox_Update(s32 updateRate) {
#if !ENABLE_NEW_LETTERBOX
    s32 step;

    if (updateRate == 3) {
        step = 10;
    } else {
        step = 30 / updateRate;
    }

    if (sLetterboxSize < sLetterboxSizeTarget) {
        if (sLetterboxState != LETTERBOX_STATE_GROWING) {
            sLetterboxState = LETTERBOX_STATE_GROWING;
        }

        if (sLetterboxSize + step < sLetterboxSizeTarget) {
            sLetterboxSize += step;
        } else {
            sLetterboxSize = sLetterboxSizeTarget;
        }
    } else if (sLetterboxSizeTarget < sLetterboxSize) {
        if (sLetterboxState != LETTERBOX_STATE_SHRINKING) {
            sLetterboxState = LETTERBOX_STATE_SHRINKING;
        }

        if (sLetterboxSizeTarget < sLetterboxSize - step) {
            sLetterboxSize -= step;
        } else {
            sLetterboxSize = sLetterboxSizeTarget;
        }
    } else {
        sLetterboxState = LETTERBOX_STATE_IDLE;
    }

    if (DEBUG_FEATURES && (R_HREG_MODE == HREG_MODE_LETTERBOX)) {
        if (R_LETTERBOX_INIT != HREG_MODE_LETTERBOX) {
            R_LETTERBOX_INIT = HREG_MODE_LETTERBOX;
            R_LETTERBOX_ENABLE_LOGS = 0;
            HREG(82) = 0; // this reg is not used in this mode
            R_LETTERBOX_STATE = 0;
            R_LETTERBOX_SIZE = 0;
            R_LETTERBOX_TARGET_SIZE = 0;
            R_LETTERBOX_STEP = 0;

            // these regs are not used in this mode
            HREG(87) = 0;
            HREG(88) = 0;
            HREG(89) = 0;
        }

        R_LETTERBOX_STATE = sLetterboxState;
        R_LETTERBOX_SIZE = sLetterboxSize;
        R_LETTERBOX_TARGET_SIZE = sLetterboxSizeTarget;
        R_LETTERBOX_STEP = step;
    }
#endif
}
