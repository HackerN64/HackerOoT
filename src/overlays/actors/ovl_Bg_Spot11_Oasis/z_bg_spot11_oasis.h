#ifndef _Z_BG_SPOT11_OASIS_H_
#define _Z_BG_SPOT11_OASIS_H_

#include "ultra64.h"
#include "global.h"

struct BgSpot11Oasis;

typedef void (*BgSpot11OasisActionFunc)(struct BgSpot11Oasis*, GlobalContext*);

typedef struct BgSpot11Oasis {
    /* 0x0000 */ Actor actor;
    /* 0x014C */ BgSpot11OasisActionFunc actionFunc;
    /* 0x0150 */ u8 unk_150;
    /* 0x0151 */ u8 unk_151;
} BgSpot11Oasis; // size = 0x0154

extern const ActorInit Bg_Spot11_Oasis_InitVars;

#endif
