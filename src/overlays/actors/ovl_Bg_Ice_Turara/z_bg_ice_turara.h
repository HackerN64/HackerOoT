#ifndef _Z_BG_ICE_TURARA_H_
#define _Z_BG_ICE_TURARA_H_

#include "ultra64.h"
#include "global.h"

struct BgIceTurara;

typedef void (*BgIceTuraraActionFunc)(struct BgIceTurara*, GlobalContext*);

typedef enum {
    /* 0 */ TURARA_STALAGMITE,
    /* 1 */ TURARA_STALACTITE,
    /* 2 */ TURARA_STALACTITE_REGROW
} BgIceTuraraType;

typedef struct BgIceTurara {
    /* 0x0000 */ DynaPolyActor dyna;
    /* 0x0164 */ BgIceTuraraActionFunc actionFunc;
    /* 0x0168 */ s16 shiverTimer;
    /* 0x016C */ ColliderCylinder collider;
} BgIceTurara; // size = 0x01B8

extern const ActorInit Bg_Ice_Turara_InitVars;

#endif
