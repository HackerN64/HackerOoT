#ifndef _Z_BG_BDAN_OBJECTS_H_
#define _Z_BG_BDAN_OBJECTS_H_

#include "ultra64.h"
#include "global.h"

struct BgBdanObjects;

typedef void (*BgBdanObjectsActionFunc)(struct BgBdanObjects*, GlobalContext*);

typedef struct BgBdanObjects {
    /* 0x0000 */ DynaPolyActor dyna;
    /* 0x0164 */ BgBdanObjectsActionFunc actionFunc;
    /* 0x0168 */ u8 unk_168;
    /* 0x016A */ s16 unk_16A;
    /* 0x016C */ ColliderCylinder collider;
    /* 0x01B8 */ s32 cameraSetting;
} BgBdanObjects; // size = 0x01BC

extern const ActorInit Bg_Bdan_Objects_InitVars;

#endif
