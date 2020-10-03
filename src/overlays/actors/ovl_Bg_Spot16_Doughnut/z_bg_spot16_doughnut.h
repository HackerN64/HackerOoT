#ifndef _Z_BG_SPOT16_DOUGHNUT_H_
#define _Z_BG_SPOT16_DOUGHNUT_H_

#include "ultra64.h"
#include "global.h"

struct BgSpot16Doughnut;

typedef struct BgSpot16Doughnut {
    /* 0x0000 */ Actor actor;
    /* 0x014C */ u16 fireFlag;
    /* 0x014E */ char pad[0x02];
    /* 0x0150 */ u8 envColorAlpha;
} BgSpot16Doughnut; // size = 0x0154

extern const ActorInit Bg_Spot16_Doughnut_InitVars;

#endif
