#ifndef _Z_EN_BROB_H_
#define _Z_EN_BROB_H_

#include "ultra64.h"
#include "global.h"

struct EnBrob;

typedef void (*EnBrobActionFunc)(struct EnBrob* this, GlobalContext* globalCtx);

typedef struct EnBrob {
    /* 0x0000 */ DynaPolyActor dyna;
    /* 0x0164 */ SkelAnime skelAnime;
    /* 0x01A8 */ EnBrobActionFunc actionFunc;
    /* 0x01AC */ s16 timer;
    /* 0x01AE */ s16 unk_1AE;
    /* 0x01B0 */ Vec3s jointTable[10];
    /* 0x01EC */ Vec3s morphTable[10];
    /* 0x0228 */ ColliderCylinder colliders[2];
} EnBrob; // size = 0x02C0

extern const ActorInit En_Brob_InitVars;

#endif
