#include "config.h"
#include "global.h"
#include "debug.h"
#include "controller.h"
#include "gfx.h"
#include "gfxalloc.h"

#if ENABLE_HACKER_DEBUG

void Print_DebugPos(PrintUtils* this, Input* input, s16 posXChangeBy, s16 posYChangeBy) {
    Vec2s pos;

    if (CHECK_BTN_ALL(input->cur.button, BTN_DUP)) {
        pos.x += posXChangeBy;
    }

    if (CHECK_BTN_ALL(input->cur.button, BTN_DDOWN)) {
        pos.x -= posXChangeBy;
    }

    if (CHECK_BTN_ALL(input->cur.button, BTN_DRIGHT)) {
        pos.y += posYChangeBy;
    }

    if (CHECK_BTN_ALL(input->cur.button, BTN_DLEFT)) {
        pos.y -= posYChangeBy;
    }

    if (CHECK_BTN_ALL(input->cur.button, BTN_DUP) || CHECK_BTN_ALL(input->cur.button, BTN_DDOWN)) {
        PRINTF("[HackerOoT:Print]: Pos X: %d\n", pos.x);
    }

    if (CHECK_BTN_ALL(input->cur.button, BTN_DRIGHT) || CHECK_BTN_ALL(input->cur.button, BTN_DLEFT)) {
        PRINTF("[HackerOoT:Print]: Pos Y: %d\n", pos.y);
    }

    Print_Screen(this, 3, 3, COLOR_WHITE, "current pos: x = %d, y = %d", pos.x, pos.y);
}

/**
 * Draws text
 *
 * @param this reference to a ``PrintUtils`` struct, usually ``&gDebug.printer``
 * @param fmt the text to print, can be formatted (``%d``, ``%08X``, etc...)
 * @param ... the variables to use for the format of the text
 */
void Print_Screen(PrintUtils* this, u8 x, u8 y, u32 rgba, const char* fmt, ...) {
    GfxPrint gfxP;
    Gfx *dl, *gfxRef;

    OPEN_DISPS(this->gfxCtx, __FILE__, __LINE__);

    dl = Gfx_Open(gfxRef = POLY_OPA_DISP);
    gSPDisplayList(OVERLAY_DISP++, dl);

    GfxPrint_Init(&gfxP);
    GfxPrint_Open(&gfxP, dl);

    GfxPrint_SetPos(&gfxP, x, y);
    GfxPrint_SetColor(&gfxP, (rgba >> 16) & 0xFF, (rgba >> 8) & 0xFF, rgba & 0xFF, 255);

    va_list args;
    va_start(args, fmt);

    GfxPrint_VPrintf(&gfxP, fmt, args);

    va_end(args);

    dl = GfxPrint_Close(&gfxP);
    GfxPrint_Destroy(&gfxP);

    gSPEndDisplayList(dl++);
    Gfx_Close(gfxRef, dl);
    POLY_OPA_DISP = dl;

    CLOSE_DISPS(this->gfxCtx, __FILE__, __LINE__);
}

/**
 * Draws text but use PosPx
 *
 * @param this reference to a ``PrintUtils`` struct, usually ``&gDebug.printer``
 * @param fmt the text to print, can be formatted (``%d``, ``%08X``, etc...)
 * @param ... the variables to use for the format of the text
 */
void Print_ScreenPx(PrintUtils* this, u8 x, u8 y, u32 rgba, const char* fmt, ...) {
    GfxPrint gfxP;
    Gfx *dl, *gfxRef;

    OPEN_DISPS(this->gfxCtx, __FILE__, __LINE__);

    dl = Gfx_Open(gfxRef = POLY_OPA_DISP);
    gSPDisplayList(OVERLAY_DISP++, dl);

    GfxPrint_Init(&gfxP);
    GfxPrint_Open(&gfxP, dl);

    GfxPrint_SetPosPx(&gfxP, x, y);
    GfxPrint_SetColor(&gfxP, (rgba >> 16) & 0xFF, (rgba >> 8) & 0xFF, rgba & 0xFF, 255);

    va_list args;
    va_start(args, fmt);

    GfxPrint_VPrintf(&gfxP, fmt, args);

    va_end(args);

    dl = GfxPrint_Close(&gfxP);
    GfxPrint_Destroy(&gfxP);

    gSPEndDisplayList(dl++);
    Gfx_Close(gfxRef, dl);
    POLY_OPA_DISP = dl;

    CLOSE_DISPS(this->gfxCtx, __FILE__, __LINE__);
}

#endif
