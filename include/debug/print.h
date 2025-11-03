#ifndef HACKEROOT_PRINT_H
#define HACKEROOT_PRINT_H

#include "config.h"
#include "ultra64.h"
#include "libu64/gfxprint.h"
#include "libu64/pad.h"
#include "math.h"
#include "color.h"

struct GraphicsContext;

typedef struct PrintUtils {
    struct GraphicsContext* gfxCtx;
    Gfx* dl;
    Gfx* gfxRef;
    GfxPrint gfxP;
} PrintUtils;

void Print_DebugPos(PrintUtils* this, Input* input, s16 posXChangeBy, s16 posYChangeBy);
void Print_Screen(PrintUtils* this, u8 x, u8 y, u32 rgba, const char* fmt, ...);
void Print_ScreenPx(PrintUtils* this, u8 x, u8 y, u32 rgba, const char* fmt, ...);

s32 GfxPrint_VPrintf(GfxPrint* this, const char* fmt, va_list args);

#endif
