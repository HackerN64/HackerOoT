#ifndef _Z_BG_HAKA_GATE_H_
#define _Z_BG_HAKA_GATE_H_

#include <ultra64.h>
#include <global.h>

typedef struct {
    /* 0x0000 */ Actor actor;
    /* 0x014C */ char unk_14C[0x28];
} BgHakaGate; // size = 0x0174

extern const ActorInit Bg_Haka_Gate_InitVars;

#endif
