#ifndef HACKEROOT_PRINT_H
#define HACKEROOT_PRINT_H

#include "config.h"
#include "ultra64.h"
#include "gfxprint.h"
#include "z64math.h"
#include "color.h"

struct GraphicsContext;

typedef struct PrintUtils {
    GraphicsContext* gfxCtx;
    Gfx* dl;
    Gfx* gfxRef;
    GfxPrint gfxP;
    Vec3s pos; // Note: Z-Pos isn't used
    Color_RGBA8 rgba;
} PrintUtils;

void Print_DebugPos(PrintUtils* this, Input* input, s16 posXChangeBy, s16 posYChangeBy);
void Print_SetInfos(PrintUtils* this, GraphicsContext* gfxCtx, s16 x, s16 y, Color_RGBA8 rgba);
void Print_Screen(PrintUtils* this, const char* fmt, ...);

s32 GfxPrint_VPrintf(GfxPrint* this, const char* fmt, va_list args);

#endif
