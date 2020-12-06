#ifndef _Z_DEMO_EC_H_
#define _Z_DEMO_EC_H_

#include "ultra64.h"
#include "global.h"

struct DemoEc;

typedef void (*DemoEcInitFunc)(struct DemoEc*, GlobalContext*);
typedef void (*DemoEcUpdateFunc)(struct DemoEc*, GlobalContext*);
typedef void (*DemoEcDrawFunc)(struct DemoEc*, GlobalContext*);

typedef struct DemoEc {
    /* 0x0000 */ Actor actor;
    /* 0x014C */ SkelAnime skelAnime;
    /* 0x0190 */ s16 eyeTexIndex;
    /* 0x0192 */ s16 blinkTimer;
    /* 0x0194 */ s32 updateMode;
    /* 0x0198 */ s32 drawConfig;
    /* 0x019C */ s32 npcAction;
    /* 0x01A0 */ s32 drawObjBankIndex;
    /* 0x01A4 */ s32 animObjBankIndex;
} DemoEc; // size = 0x01A8

extern const ActorInit Demo_Ec_InitVars;

#endif
