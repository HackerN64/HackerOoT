#ifndef _Z_EN_KUSA_H_
#define _Z_EN_KUSA_H_

#include "ultra64.h"
#include "global.h"

struct EnKusa;

typedef void (*EnKusaActionFunc)(struct EnKusa*, GlobalContext*);

typedef struct EnKusa {
    /* 0x0000 */ Actor actor;
    /* 0x014C */ EnKusaActionFunc actionFunc;
    /* 0x0150 */ ColliderCylinder collider;
    /* 0x019C */ s16 timer;
    /* 0x019E */ s8 kusaTexObjIndex;
} EnKusa; // size = 0x01A0

extern const ActorInit En_Kusa_InitVars;

#endif
