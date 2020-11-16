#ifndef _Z_EN_CROW_H_
#define _Z_EN_CROW_H_

#include "ultra64.h"
#include "global.h"

struct EnCrow;

typedef void (*EnCrowActionFunc)(struct EnCrow*, GlobalContext*);

typedef struct EnCrow {
    /* 0x0000 */ Actor actor;
    /* 0x014C */ Vec3f bodyPartsPos[4];
    /* 0x017C */ SkelAnime skelAnime;
    /* 0x01C0 */ EnCrowActionFunc actionFunc;
    /* 0x01C4 */ s16 timer;
    /* 0x01C6 */ s16 aimRotX;
    /* 0x01C8 */ s16 aimRotY;
    /* 0x01CA */ Vec3s limbDrawTable[9];
    /* 0x0200 */ Vec3s transitionDrawTable[9];
    /* 0x0238 */ ColliderJntSph collider;
    /* 0x0258 */ ColliderJntSphItem colliderItems[1];
} EnCrow; // size = 0x0298

extern const ActorInit En_Crow_InitVars;

#endif
