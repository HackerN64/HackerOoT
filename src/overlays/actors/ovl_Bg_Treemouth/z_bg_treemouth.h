#ifndef _Z_BG_TREEMOUTH_H_
#define _Z_BG_TREEMOUTH_H_

#include "ultra64.h"
#include "global.h"

struct BgTreemouth;

typedef void (*BgTreemouthActionFunc)(struct BgTreemouth*, GlobalContext*);

typedef struct BgTreemouth {
    /* 0x0000 */ DynaPolyActor dyna;
    /* 0x0164 */ char unk_164[0x4];
    /* 0x0168 */ f32 unk_168;
    /* 0x016C */ BgTreemouthActionFunc actionFunc;
} BgTreemouth; // size = 0x0170

extern const ActorInit Bg_Treemouth_InitVars;

#endif
