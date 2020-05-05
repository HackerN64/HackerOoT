#ifndef _Z_EN_TR_H_
#define _Z_EN_TR_H_

#include <ultra64.h>
#include <global.h>

struct EnTr;

typedef struct EnTr {
    /* 0x0000 */ Actor actor;
    /* 0x014C */ char unk_14C[0x19C];
} EnTr; // size = 0x02E8

extern const ActorInit En_Tr_InitVars;

#endif
