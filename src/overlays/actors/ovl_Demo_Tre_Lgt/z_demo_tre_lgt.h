#ifndef _Z_DEMO_TRE_LGT_H_
#define _Z_DEMO_TRE_LGT_H_

#include "ultra64.h"
#include "global.h"

struct DemoTreLgt;

typedef void (*DemoTreLgtActionFunc)(struct DemoTreLgt*, GlobalContext*);

typedef struct DemoTreLgt {
    /* 0x0000 */ Actor actor;
    /* 0x014C */ SkelAnimeCurve skelCurve;
    /* 0x016C */ s32 action;
    /* 0x0170 */ u32 unk_170; // some sort of alpha
    /* 0x0174 */ u32 unk_174; // another sort of alpha
    /* 0x0178 */ u8 status;
} DemoTreLgt; // size = 0x017C

typedef enum {
    /* 0x00 */ DEMO_TRE_LGT_ACTION_WAIT, // wait until animation is needed
    /* 0x01 */ DEMO_TRE_LGT_ACTION_ANIMATE
} DemoTreLgtAction;

extern const ActorInit Demo_Tre_Lgt_InitVars;

#endif
