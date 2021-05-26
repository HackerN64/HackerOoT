#ifndef _Z_BG_YDAN_HASI_H_
#define _Z_BG_YDAN_HASI_H_

#include "ultra64.h"
#include "global.h"

struct BgYdanHasi;

typedef void (*BgYdanHasiActionFunc)(struct BgYdanHasi*, GlobalContext*);

typedef struct BgYdanHasi {
    /* 0x0000 */ DynaPolyActor dyna;
    /* 0x0164 */ BgYdanHasiActionFunc actionFunc;
    /* 0x0168 */ u8 type;
    /* 0x016A */ s16 timer; //Also used as an offset for the water blocks Y position for a "bobbing" effect
} BgYdanHasi; // size = 0x016C

typedef enum {
    /* 0 */ HASI_WATER_BLOCK,
    /* 1 */ HASI_WATER,
    /* 2 */ HASI_THREE_BLOCKS
} HasiType;

extern const ActorInit Bg_Ydan_Hasi_InitVars;

#endif
