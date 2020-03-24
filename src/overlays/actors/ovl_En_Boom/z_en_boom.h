#ifndef _Z_EN_BOOM_H_
#define _Z_EN_BOOM_H_

#include <ultra64.h>
#include <global.h>

typedef struct {
    /* 0x0000 */ Actor      actor;
    /* 0x014C */ Collider   collider;
    /* 0x0164 */ char       unk_164[0x68];
    /* 0x01CC */ Actor*     moveTo;      // actor boomerang moves toward
    /* 0x01D0 */ Actor*     grabbed;     // actor grabbed by the boomerang
    /* 0x01D4 */ u8         returnTimer; // returns to Link when 0
    /* 0x01D5 */ u8         activeTimer; // increments once every update
    /* 0x01D8 */ u32        effect;      // set by Effect_Add
    /* 0x01DC */ u32        unk_1DC[0x7];
    /* 0x01F8 */ ActorFunc  actionFunc;
} EnBoom; // size = 0x01FC

extern const ActorInit En_Boom_InitVars;

#endif
