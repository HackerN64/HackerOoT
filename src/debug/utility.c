#include "debug.h"
#include "config.h"
#include "controller.h"
#include "z64math.h"
#include "macros.h"
#include "gfx.h"

#if ENABLE_HACKER_DEBUG

/**
 * Static variables that sets the rectangle's position when using the configurator
 */
static Vec2s sRectLeft = { 0, 0 };
static Vec2s sRectRight = { SCREEN_WIDTH, SCREEN_HEIGHT };

/**
 * Draws a blank rectangle with the specified coordinates containing a single color
 *
 * @param rectLeft the position of the left corners, rectLeft.x for up-left, rectLeft.y for down-left
 * @param rectRight the position of the right corners, rectRight.x for up-right, rectRight.y for down-right
 * @param rgba the color to use for the rectangle
 */
void Debug_DrawColorRectangle(Vec2s rectLeft, Vec2s rectRight, Color_RGBA8 rgba) {
    u8 r = rgba.r, g = rgba.g, b = rgba.b, a = rgba.a;
    s32 x1 = rectLeft.x, y1 = rectLeft.y, x2 = rectRight.x, y2 = rectRight.y;
    GraphicsContext* gfxCtx = gDebug.printer.gfxCtx;

    if (x2 < x1) {
        u32 temp = x2;
        x2 = x1;
        x1 = temp;
    }

    if (y2 < y1) {
        u32 temp = y2;
        y2 = y1;
        y1 = temp;
    }

    if (x1 < 0) {
        x1 = 0;
    }

    if (y1 < 0) {
        y1 = 0;
    }

    if (x2 > SCREEN_WIDTH) {
        x2 = SCREEN_WIDTH;
    }

    if (y2 > SCREEN_HEIGHT) {
        y2 = SCREEN_HEIGHT;
    }

    {
        s32 cycleadd = 0;
        OPEN_DISPS(gfxCtx, __BASE_FILE__, __LINE__);
        gDPPipeSync(OVERLAY_DISP++);

        if (((ABS(x1 - x2) % 4) == 0) && (a == 255)) {
            gDPSetCycleType(OVERLAY_DISP++, G_CYC_FILL);
            gDPSetRenderMode(OVERLAY_DISP++, G_RM_NOOP, G_RM_NOOP);
            gDPSetFillColor(OVERLAY_DISP++, (GPACK_RGBA5551(r, g, b, 1) << 16) | GPACK_RGBA5551(r, g, b, 1));
            cycleadd = 1;
        } else {
            gDPSetCycleType(OVERLAY_DISP++, G_CYC_1CYCLE);
            gDPSetCombineMode(OVERLAY_DISP++, G_CC_PRIMITIVE, G_CC_PRIMITIVE);
            if (a == 255) {
                gDPSetRenderMode(OVERLAY_DISP++, G_RM_NOOP, G_RM_NOOP2 | CVG_DST_FULL);
            } else {
                gDPSetRenderMode(OVERLAY_DISP++, G_RM_XLU_SURF, G_RM_XLU_SURF2 | CVG_DST_SAVE);
            }
            gDPSetPrimColor(OVERLAY_DISP++, 0, 0, r, g, b, a);
            cycleadd = 0;
        }

        gDPFillRectangle(OVERLAY_DISP++, x1, y1, x2 - cycleadd, y2 - cycleadd);
        gDPPipeSync(OVERLAY_DISP++);

        CLOSE_DISPS(gfxCtx, __BASE_FILE__, __LINE__);
    }
}

/**
 * Draws a new rectangle with its coordinates to setup easily where the user wants it
 *
 * @param controller reference to a controller input (example: ``&play->state.input[0]``)
 *
 * @note Controls (hold):
 * @note Z + C-Up: increase ``sRectLeft.x``
 * @note Z + C-Down: decrease ``sRectLeft.x``
 * @note R + C-Up: increase ``sRectRight.x``
 * @note R + C-Down: decrease ``sRectRight.x``
 * @note Z + C-Left: decrease ``sRectLeft.y``
 * @note Z + C-Right: increase ``sRectLeft.y``
 * @note R + C-Left: decrease ``sRectRight.y``
 * @note R + C-Right: increase ``sRectRight.y``
 */
void Debug_ConfigureNewRectangle(Input* controller) {
    Color_RGBA8 rgba = { 128, 128, 128, 255 };
    GraphicsContext* gfxCtx = gDebug.printer.gfxCtx;

    if (CHECK_BTN_ALL(controller->cur.button, BTN_Z)) {
        if (CHECK_BTN_ALL(controller->cur.button, BTN_CUP)) {
            sRectLeft.x++;
        }

        if (CHECK_BTN_ALL(controller->cur.button, BTN_CRIGHT)) {
            sRectLeft.y++;
        }

        if (CHECK_BTN_ALL(controller->cur.button, BTN_CDOWN)) {
            sRectLeft.x--;
        }

        if (CHECK_BTN_ALL(controller->cur.button, BTN_CLEFT)) {
            sRectLeft.y--;
        }
    }

    if (CHECK_BTN_ALL(controller->cur.button, BTN_R)) {
        if (CHECK_BTN_ALL(controller->cur.button, BTN_CUP)) {
            sRectRight.x++;
        }

        if (CHECK_BTN_ALL(controller->cur.button, BTN_CRIGHT)) {
            sRectRight.y++;
        }

        if (CHECK_BTN_ALL(controller->cur.button, BTN_CDOWN)) {
            sRectRight.x--;
        }

        if (CHECK_BTN_ALL(controller->cur.button, BTN_CLEFT)) {
            sRectRight.y--;
        }
    }

    Debug_DrawColorRectangle(sRectLeft, sRectRight, rgba);
    Print_Screen(&gDebug.printer, 3, 2, COLOR_RED, "rectLeft: x = %d, y = %d", sRectLeft.x, sRectLeft.y);
    Print_Screen(&gDebug.printer, 3, 3, COLOR_RED, "rectRight: x = %d, y = %d", sRectRight.x, sRectRight.y);
}

#endif
