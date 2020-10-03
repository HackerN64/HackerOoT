#ifndef _Z_BG_SPOT12_SAKU_H_
#define _Z_BG_SPOT12_SAKU_H_

#include "ultra64.h"
#include "global.h"

struct BgSpot12Saku;

typedef void (*BgSpot12SakuActionFunc)(struct BgSpot12Saku*, GlobalContext*);

typedef struct BgSpot12Saku {
    /* 0x0000 */ DynaPolyActor dyna;
    /* 0x0164 */ BgSpot12SakuActionFunc actionFunc;
    /* 0x0168 */ s16 unk_168;
} BgSpot12Saku; // size = 0x016C

extern const ActorInit Bg_Spot12_Saku_InitVars;

#endif
