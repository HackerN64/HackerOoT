#ifndef RAINBOW_H
#define RAINBOW_H

#include "ultra64/ultratypes.h"
#include "libc/stdbool.h"
#include "libc/stddef.h"
#include "color.h"

typedef enum ColorState {
    STATE_RED_TO_YELLOW,
    STATE_YELLOW_TO_GREEN,
    STATE_GREEN_TO_LIGHTBLUE,
    STATE_LIGHTBLUE_TO_BLUE,
    STATE_BLUE_TO_PINK,
    STATE_PINK_TO_RED,
    STATE_MAX
} ColorState;

typedef struct RainbowTarget {
    u8 state;
    Color_RGB8 color;
} RainbowTarget;

typedef struct Rainbow {
    Color_RGB8 color;
    u8 state;
    u8 speed;
    bool allowDebug;
} Rainbow;

void Rainbow_Debug(Rainbow* this);
void Rainbow_InitColor(Rainbow* this);
void Rainbow_Init(Rainbow* this);
bool Rainbow_CheckColor(Rainbow* this, Color_RGB8 rgb);
void Rainbow_UpdateColor(Rainbow* this);
void Rainbow_UpdateState(Rainbow* this, RainbowTarget target);
void Rainbow_Update(Rainbow* this);

void osSyncPrintf(const char* fmt, ...);

#endif
