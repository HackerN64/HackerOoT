#ifndef _Z_BG_HAKA_SGAMI_H_
#define _Z_BG_HAKA_SGAMI_H_

#include "ultra64.h"
#include "global.h"

struct BgHakaSgami;

typedef void (*BgHakaSgamiActionFunc)(struct BgHakaSgami*, GlobalContext*);

typedef struct BgHakaSgami {
    /* 0x0000 */ Actor actor;
    /* 0x014C */ BgHakaSgamiActionFunc actionFunc;
    /* 0x0150 */ s8 requiredObjBankIndex;
    /* 0x0151 */ s8 unk_151;
    /* 0x0152 */ s16 timer;
    /* 0x0154 */ s32 blureEffectIndex[2];
    /* 0x015C */ ColliderCylinder colliderScytheCenter;
    /* 0x01A8 */ ColliderTris colliderScythe;
    /* 0x01C8 */ ColliderTrisElement colliderScytheItems[4];
} BgHakaSgami; // size = 0x0338

extern const ActorInit Bg_Haka_Sgami_InitVars;

#endif
