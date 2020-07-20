#ifndef _Z_BG_HAKA_TUBO_H_
#define _Z_BG_HAKA_TUBO_H_

#include <ultra64.h>
#include <global.h>

struct BgHakaTubo;

typedef void (*BgHakaTuboActionFunc)(struct BgHakaTubo*, GlobalContext*);

typedef struct BgHakaTubo {
    /* 0x0000 */ DynaPolyActor dyna;
    /* 0x0164 */ BgHakaTuboActionFunc actionFunc;
    /* 0x0168 */ s16 dropTimer;
    /* 0x016A */ s16 fireScroll;
    /* 0x016C */ ColliderCylinder potCollider;
    /* 0x01B8 */ ColliderCylinder flamesCollider;
} BgHakaTubo; // size = 0x0204

extern const ActorInit Bg_Haka_Tubo_InitVars;

#endif
