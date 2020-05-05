#ifndef _Z_EN_BUBBLE_H_
#define _Z_EN_BUBBLE_H_

#include <ultra64.h>
#include <global.h>

struct EnBubble;

typedef struct EnBubble {
    /* 0x0000 */ Actor actor;
    /* 0x014C */ char unk_14C[0x114];
} EnBubble; // size = 0x0260

extern const ActorInit En_Bubble_InitVars;

#endif
