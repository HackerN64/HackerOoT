#ifndef _Z_BG_GND_DARKMEIRO_H_
#define _Z_BG_GND_DARKMEIRO_H_

#include <ultra64.h>
#include <global.h>

struct BgGndDarkmeiro;

typedef void (*BgGndDarkmeiroActionFunc)(struct BgGndDarkmeiro*, GlobalContext*);

typedef struct BgGndDarkmeiro {
    /* 0x0000 */ DynaPolyActor dyna;
    /* 0x0164 */ char unk_164[0x8];
    /* 0x016C */ BgGndDarkmeiroActionFunc actionFunc;
} BgGndDarkmeiro; // size = 0x0170

extern const ActorInit Bg_Gnd_Darkmeiro_InitVars;

#endif
