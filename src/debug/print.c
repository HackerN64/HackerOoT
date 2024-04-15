#include "config.h"
#include "global.h"
#include "debug.h"

void Print_DebugPos(PrintUtils* this, Input* input, s16 posXChangeBy, s16 posYChangeBy) {
    if (CHECK_BTN_ALL(input->cur.button, BTN_DUP)) {
        this->pos.x += posXChangeBy;
    }

    if (CHECK_BTN_ALL(input->cur.button, BTN_DDOWN)) {
        this->pos.x -= posXChangeBy;
    }

    if (CHECK_BTN_ALL(input->cur.button, BTN_DRIGHT)) {
        this->pos.y += posYChangeBy;
    }

    if (CHECK_BTN_ALL(input->cur.button, BTN_DLEFT)) {
        this->pos.y -= posYChangeBy;
    }

    if (CHECK_BTN_ALL(input->cur.button, BTN_DUP) || CHECK_BTN_ALL(input->cur.button, BTN_DDOWN)) {
        PRINTF("[HackerOoT:Print]: Pos X: %d\n", this->pos.x);
    }

    if (CHECK_BTN_ALL(input->cur.button, BTN_DRIGHT) || CHECK_BTN_ALL(input->cur.button, BTN_DLEFT)) {
        PRINTF("[HackerOoT:Print]: Pos Y: %d\n", this->pos.y);
    }
}

/**
 * Sets the required informations before using ``Print_Screen``
 * 
 * @param this reference to a ``PrintUtils`` struct, usually ``&gDebug.printer``
 * @param gfxCtx reference to graphics context
 * @param x the horizontal position of the text to print
 * @param y the vertical position of the text to print
 * @param rgba the color to use for the text to print
*/
void Print_SetInfos(PrintUtils* this, GraphicsContext* gfxCtx, s16 x, s16 y, Color_RGBA8 rgba) {
    this->gfxCtx = gfxCtx;
    this->pos.x = x;
    this->pos.y = y;
    this->rgba = rgba;
}

/**
 * Draws text
 * 
 * @param this reference to a ``PrintUtils`` struct, usually ``&gDebug.printer``
 * @param fmt the text to print, can be formatted (``%d``, ``%08X``, etc...)
 * @param ... the variables to use for the format of the text
*/
void Print_Screen(PrintUtils* this, const char* fmt, ...) {
    GfxPrint gfxP;
    Gfx *dl, *gfxRef;

    OPEN_DISPS(this->gfxCtx, __FILE__, __LINE__);

    dl = Gfx_Open(gfxRef = POLY_OPA_DISP);
    gSPDisplayList(OVERLAY_DISP++, dl);

    GfxPrint_Init(&gfxP);
    GfxPrint_Open(&gfxP, dl);

    GfxPrint_SetPos(&gfxP, this->pos.x, this->pos.y);
    GfxPrint_SetColor(&gfxP, this->rgba.r, this->rgba.g, this->rgba.b, this->rgba.a);

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
