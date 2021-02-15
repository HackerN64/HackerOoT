#ifndef _Z_EN_SKB_H_
#define _Z_EN_SKB_H_

#include "ultra64.h"
#include "global.h"

struct EnSkb;

typedef void (*EnSkbActionFunc)(struct EnSkb*, GlobalContext*);

typedef struct EnSkb {
    /* 0x0000 */ Actor actor;
    /* 0x014C */ SkelAnime skelAnime;
    /* 0x0190 */ Vec3s limbDrawTable[20];
    /* 0x0208 */ Vec3s transitionDrawTable[20];
    /* 0x0280 */ u8 unk_280;
    /* 0x0281 */ u8 unk_281;
    /* 0x0282 */ u8 unk_282;
    /* 0x0283 */ u8 unk_283;
    /* 0x0284 */ EnSkbActionFunc actionFunc; 
    /* 0x0288 */ s16 unk_288;
    /* 0x028C */ struct_80032E24 unk_28C; 
    /* 0x02A4 */ ColliderJntSph collider;
    /* 0x02C4 */ ColliderJntSphElement colliderItem[2];
} EnSkb; // size = 0x0344

extern const ActorInit En_Skb_InitVars;

#endif
