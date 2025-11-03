#ifndef MAIN_H
#define MAIN_H

#include "ultra64.h"

extern s32 gScreenWidth;
extern s32 gScreenHeight;
extern u32 gSystemHeapSize;

/**
 * This variable being 1 indicates that the game is running on console
 * or an extremely accurate emulator that can be affected by RDP lag.
 */
extern u8 gRDPTimingsExist;

void Main(void* arg);

#endif
