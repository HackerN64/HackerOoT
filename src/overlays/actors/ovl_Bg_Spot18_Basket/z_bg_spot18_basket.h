#ifndef _Z_BG_SPOT18_BASKET_H_
#define _Z_BG_SPOT18_BASKET_H_

#include "ultra64.h"
#include "global.h"

struct BgSpot18Basket;

typedef void (*BgSpot18BasketActionFunc)(struct BgSpot18Basket*, GlobalContext*);

typedef struct BgSpot18Basket {
    /* 0x0000 */ DynaPolyActor dyna;
    /* 0x0164 */ ColliderJntSph colliderJntSph;
    /* 0x0184 */ ColliderJntSphItem colliderJntSphItems[2];
    /* 0x0204 */ BgSpot18BasketActionFunc actionFunc;
    /* 0x0208 */ f32 unk_208;
    /* 0x020C */ s16 unk_20C;
    /* 0x020E */ s16 unk_20E;
    /* 0x0210 */ s16 unk_210;
    /* 0x0212 */ s16 unk_212;
    /* 0x0214 */ s16 unk_214;
    /* 0x0216 */ s16 unk_216;
    /* 0x0218 */ s16 unk_218;
    /* 0x021A */ u8 unk_21A;
    /* 0x021B */ u8 unk_21B;
} BgSpot18Basket; // size = 0x021C

extern const ActorInit Bg_Spot18_Basket_InitVars;

#endif

