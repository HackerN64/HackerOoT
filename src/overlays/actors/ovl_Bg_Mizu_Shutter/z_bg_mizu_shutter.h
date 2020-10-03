#ifndef _Z_BG_MIZU_SHUTTER_H_
#define _Z_BG_MIZU_SHUTTER_H_

#include "ultra64.h"
#include "global.h"

struct BgMizuShutter;

typedef struct BgMizuShutter {
    /* 0x0000 */ Actor actor;
    /* 0x014C */ char unk_14C[0x44];
} BgMizuShutter; // size = 0x0190

extern const ActorInit Bg_Mizu_Shutter_InitVars;

#endif
