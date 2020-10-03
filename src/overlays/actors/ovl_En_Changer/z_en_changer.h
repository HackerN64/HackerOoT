#ifndef _Z_EN_CHANGER_H_
#define _Z_EN_CHANGER_H_

#include "ultra64.h"
#include "global.h"

struct EnChanger;

typedef struct EnChanger {
    /* 0x0000 */ Actor actor;
    /* 0x014C */ char unk_14C[0x20];
} EnChanger; // size = 0x016C

extern const ActorInit En_Changer_InitVars;

#endif
