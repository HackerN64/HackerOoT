#ifndef _Z_BG_YDAN_MARUTA_H_
#define _Z_BG_YDAN_MARUTA_H_

#include "ultra64.h"
#include "global.h"

struct BgYdanMaruta;

typedef void (*BgYdanMarutaActionFunc)(struct BgYdanMaruta*, GlobalContext*);

typedef struct BgYdanMaruta {
    /* 0x0000 */ DynaPolyActor dyna;
    /* 0x0164 */ BgYdanMarutaActionFunc actionFunc;
    /* 0x0168 */ u8 unk_168;
    /* 0x016A */ s16 unk_16A;
    /* 0x016C */ ColliderTris collider;
    /* 0x018C */ ColliderTrisElement elements[2];
} BgYdanMaruta; // size = 0x0244

extern const ActorInit Bg_Ydan_Maruta_InitVars;

#endif
