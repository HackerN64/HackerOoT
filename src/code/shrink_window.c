#include "global.h"

typedef enum {
    /* 0 */ LETTERBOX_STATE_IDLE,
    /* 1 */ LETTERBOX_STATE_GROWING,
    /* 2 */ LETTERBOX_STATE_SHRINKING
} LetterboxState;

s32 sLetterboxState = LETTERBOX_STATE_IDLE;

s32 sLetterboxSizeTarget = 0;
s32 sLetterboxSize = 0;

void Letterbox_SetSizeTarget(s32 target) {
    if (HREG(80) == 0x13 && HREG(81) == 1) {
        osSyncPrintf("shrink_window_setval(%d)\n", target);
    }

    sLetterboxSizeTarget = target;
}

u32 Letterbox_GetSizeTarget(void) {
    return sLetterboxSizeTarget;
}

void Letterbox_SetSize(s32 size) {
    if (HREG(80) == 0x13 && HREG(81) == 1) {
        osSyncPrintf("shrink_window_setnowval(%d)\n", size);
    }

    sLetterboxSize = size;
}

u32 Letterbox_GetSize(void) {
    return sLetterboxSize;
}

void Letterbox_Init(void) {
    if (HREG(80) == 0x13 && HREG(81) == 1) {
        osSyncPrintf("shrink_window_init()\n");
    }

    sLetterboxState = LETTERBOX_STATE_IDLE;
    sLetterboxSizeTarget = 0;
    sLetterboxSize = 0;
}

void Letterbox_Destroy(void) {
    if (HREG(80) == 0x13 && HREG(81) == 1) {
        osSyncPrintf("shrink_window_cleanup()\n");
    }

    sLetterboxSize = 0;
}

void Letterbox_Update(s32 updateRate) {
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

    if (HREG(80) == 0x13) {
        if (HREG(94) != 0x13) {
            HREG(94) = 0x13;
            HREG(81) = 0;
            HREG(82) = 0;
            HREG(83) = 0;
            HREG(84) = 0;
            HREG(85) = 0;
            HREG(86) = 0;
            HREG(87) = 0;
            HREG(88) = 0;
            HREG(89) = 0;
        }

        HREG(83) = sLetterboxState;
        HREG(84) = sLetterboxSize;
        HREG(85) = sLetterboxSizeTarget;
        HREG(86) = step;
    }
}
