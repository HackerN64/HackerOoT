#ifndef HACKEROOT_DEBUG_H
#define HACKEROOT_DEBUG_H

#include "config.h"
#include "ultra64.h"
#include "macros.h"
#include "padmgr.h"
#include "debug/print.h"

#define DEBUG_PRINT_VAR(var) PRINTF("%s: %d\n", #var, var)

typedef struct Debug {
    struct PlayState* play;
    Input* input;
    PrintUtils printer;
} Debug;

void Debug_DrawColorRectangle(GraphicsContext* gfxCtx, Vec2s rectLeft, Vec2s rectRight, Color_RGBA8 rgba);

#endif
