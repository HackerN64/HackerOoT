#ifndef _Z_EN_NUTSBALL_H_
#define _Z_EN_NUTSBALL_H_

#include "ultra64.h"
#include "global.h"

struct EnNutsball;

typedef void (*EnNutsballActionFunc)(struct EnNutsball*, GlobalContext*);

typedef struct EnNutsball {
    /* 0x0000 */ Actor actor;
    /* 0x014C */ EnNutsballActionFunc actionFunc;
    /* 0x0150 */ s8 objBankIndex;
    /* 0x0152 */ s16 timer;
    /* 0x0154 */ ColliderCylinder collider;
} EnNutsball; // size = 0x01A0

extern const ActorInit En_Nutsball_InitVars;

#endif
