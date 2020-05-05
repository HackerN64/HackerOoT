#ifndef _Z_BG_MORI_HASHIRA4_H_
#define _Z_BG_MORI_HASHIRA4_H_

#include <ultra64.h>
#include <global.h>

struct BgMoriHashira4;

typedef struct BgMoriHashira4 {
    /* 0x0000 */ Actor actor;
    /* 0x014C */ char unk_14C[0x20];
} BgMoriHashira4; // size = 0x016C

extern const ActorInit Bg_Mori_Hashira4_InitVars;

#endif
