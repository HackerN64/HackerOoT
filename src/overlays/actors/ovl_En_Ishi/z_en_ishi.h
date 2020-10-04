#ifndef _Z_EN_ISHI_H_
#define _Z_EN_ISHI_H_

#include "ultra64.h"
#include "global.h"

typedef enum {
    /* 0x00 */ ROCK_SMALL,
    /* 0x01 */ ROCK_LARGE
} EnIshiType;

struct EnIshi;

typedef void (*EnIshiActionFunc)(struct EnIshi*, GlobalContext*);

typedef struct EnIshi {
    /* 0x0000 */ Actor actor;
    /* 0x014C */ EnIshiActionFunc actionFunc;
    /* 0x0150 */ ColliderCylinder collider;
} EnIshi; // size = 0x019C

extern const ActorInit En_Ishi_InitVars;

#endif
