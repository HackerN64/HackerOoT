#ifndef _Z_BG_MORI_IDOMIZU_H_
#define _Z_BG_MORI_IDOMIZU_H_

#include "ultra64.h"
#include "global.h"

struct BgMoriIdomizu;

typedef void (*BgMoriIdomizuActionFunc)(struct BgMoriIdomizu*, GlobalContext*);

typedef struct BgMoriIdomizu {
    /* 0x0000 */ Actor actor;
    /* 0x014C */ BgMoriIdomizuActionFunc actionFunc;
    /* 0x0150 */ f32 targetWaterLevel;
    /* 0x0154 */ s32 prevSwitchFlagSet;
    /* 0x0158 */ s16 isLoaded;
    /* 0x015A */ s16 drainTimer;
    /* 0x015C */ s8 moriTexObjIndex;
} BgMoriIdomizu; // size = 0x0160

extern const ActorInit Bg_Mori_Idomizu_InitVars;

#endif
