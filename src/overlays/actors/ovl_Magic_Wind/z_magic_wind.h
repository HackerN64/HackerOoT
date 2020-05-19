#ifndef _Z_MAGIC_WIND_H_
#define _Z_MAGIC_WIND_H_

#include <ultra64.h>
#include <global.h>

struct MagicWind;

typedef void (*MagicWindFunc)(struct MagicWind* this, GlobalContext* globalCtx);

typedef struct MagicWind {
    /* 0x0000 */ Actor actor;
    /* 0x014C */ SkelAnimeCurve skelCurve;
    /* 0x016C */ s16 timer;
    /* 0x0170 */ MagicWindFunc actionFunc;
} MagicWind; // size = 0x0174

extern const ActorInit Magic_Wind_InitVars;

#endif
