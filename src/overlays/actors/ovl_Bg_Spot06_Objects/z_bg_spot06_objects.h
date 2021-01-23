#ifndef _Z_BG_SPOT06_OBJECTS_H_
#define _Z_BG_SPOT06_OBJECTS_H_

#include "ultra64.h"
#include "global.h"

struct BgSpot06Objects;

typedef void (*BgSpot06ObjectsActionFunc)(struct BgSpot06Objects*, GlobalContext*);

typedef struct BgSpot06Objects {
    /* 0x0000 */ DynaPolyActor dyna;
    /* 0x0164 */ BgSpot06ObjectsActionFunc actionFunc;
    /* 0x0168 */ s16 switchFlag;
    /* 0x016A */ s16 timer;
    /* 0x016C */ f32 lakeHyliaWaterLevel;
    /* 0x0170 */ ColliderJntSph collider;
    /* 0x0190 */ ColliderJntSphElement colliderItem[1];
} BgSpot06Objects; // size = 0x01D0

extern const ActorInit Bg_Spot06_Objects_InitVars;

#endif
