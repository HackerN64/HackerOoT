#include "config.h"

#if ENABLE_FRAMERATE_OPTIONS

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
    u8 checkR = FA_USE_BTN_COMBO ? CHECK_BTN_ALL(input->cur.button, FA_BTN_HOLD_FOR_COMBO) : true;

    if (checkR && CHECK_BTN_ALL(input->press.button, FA_PAUSE_CONTROL)) {
        frameAdvCtx->enabled = !frameAdvCtx->enabled;
    }

    if (!frameAdvCtx->enabled ||
        ((checkR && CHECK_BTN_ALL(input->press.button, FA_CONTROL)) || (checkR && (++frameAdvCtx->timer >= 9)))) {
        frameAdvCtx->timer = 0;
        return true;
    }

    return false;
}

#endif
