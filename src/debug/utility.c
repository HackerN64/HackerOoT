#include "config.h"
#include "global.h"

// adapted from: https://github.com/FazanaJ/HackerSM64/blob/1dabc52488e87628c4fae86c484fe7c5de47b82b/src/game/puppyprint.c
#define BLANK 0, 0, 0, ENVIRONMENT, 0, 0, 0, ENVIRONMENT

// Draws a blank rectangle with the specified coordinates containing a single color
void Debug_DrawColorRectangle(GraphicsContext* gfxCtx, Vec2s rectLeft, Vec2s rectRight, Color_RGBA8 rgba) {
    u8 r = rgba.r, g = rgba.g, b = rgba.b, a = rgba.a;
    s32 x1 = rectLeft.x, y1 = rectLeft.y, x2 = rectRight.x, y2 = rectRight.y;

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

        gDPSetCombineMode(OVERLAY_DISP++, BLANK, BLANK);
        gDPPipeSync(OVERLAY_DISP++);

        if (((ABS(x1 - x2) % 4) == 0) && (a == 255)) {
            gDPSetCycleType(OVERLAY_DISP++, G_CYC_FILL);
            gDPSetRenderMode(OVERLAY_DISP++, G_RM_NOOP, G_RM_NOOP);
            cycleadd = 1;
        } else {
            gDPSetCycleType(OVERLAY_DISP++, G_CYC_1CYCLE);

            if (a == 255) {
                gDPSetRenderMode(OVERLAY_DISP++, G_RM_OPA_SURF, G_RM_OPA_SURF2);
            } else {
                gDPSetRenderMode(OVERLAY_DISP++, G_RM_XLU_SURF, G_RM_XLU_SURF2);
            }

            cycleadd = 0;
        }

        gDPSetFillColor(OVERLAY_DISP++, (GPACK_RGBA5551(r, g, b, 1) << 16) | GPACK_RGBA5551(r, g, b, 1));
        gDPSetEnvColor(OVERLAY_DISP++, r, g, b, a);
        gDPFillRectangle(OVERLAY_DISP++, x1, y1, x2 - cycleadd, y2 - cycleadd);
        gDPPipeSync(OVERLAY_DISP++);

        CLOSE_DISPS(gfxCtx, __BASE_FILE__, __LINE__);
    }
}
