#ifndef _Z_EN_TITE_H_
#define _Z_EN_TITE_H_

#include "ultra64.h"
#include "global.h"

struct EnTite;

typedef struct EnTite {
    /* 0x0000 */ Actor actor;
    /* 0x014C */ char unk_14C[0x22C];
} EnTite; // size = 0x0378

extern const ActorInit En_Tite_InitVars;

#endif
