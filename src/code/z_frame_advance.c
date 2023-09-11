#include "config.h"

#ifdef ENABLE_FRAMERATE_OPTIONS

#include "global.h"

void FrameAdvance_Init(FrameAdvanceContext* frameAdvCtx) {
    frameAdvCtx->timer = 0;
    frameAdvCtx->enabled = false;
}

/**
 * Frame advance allows you to advance through the game one frame at a time on command.
 * To enable, hold R and press Dpad Down on the specified controller.
 * To advance a frame, hold Z and press R.
 * Holding Z and R will advance a frame every half second.
 *
 * This function returns true when frame advance is not active (game will run normally)
 */
s32 FrameAdvance_Update(FrameAdvanceContext* frameAdvCtx, Input* input) {
    // if the macro is set to true check R input, else simply return true

    if (CHECK_BTN_COMBO(FA_USE_BTN_COMBO, input, FA_BTN_HOLD_FOR_COMBO, FA_PAUSE_CONTROL)) {
        frameAdvCtx->enabled = !frameAdvCtx->enabled;
    }


    if (!frameAdvCtx->enabled ||
        (CHECK_BTN_COMBO(FA_USE_BTN_COMBO, input, FA_BTN_HOLD_FOR_COMBO, FA_CONTROL) ||
            (USE_BTN_COMBO(FA_USE_BTN_COMBO, input, FA_BTN_HOLD_FOR_COMBO) && (++frameAdvCtx->timer >= 9)))) {
        frameAdvCtx->timer = 0;
        return true;
    }

    return false;
}

#endif
