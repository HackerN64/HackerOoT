#ifndef _Z_EN_SDA_H_
#define _Z_EN_SDA_H_

#include <ultra64.h>
#include <global.h>

struct EnSda;

typedef struct EnSda {
    /* 0x0000 */ Actor actor;
} EnSda; // size = 0x014C

extern const ActorInit En_Sda_InitVars;

#endif
