#ifndef _Z_OBJ_MURE2_H_
#define _Z_OBJ_MURE2_H_

#include "ultra64.h"
#include "global.h"

struct ObjMure2;

typedef struct ObjMure2 {
    /* 0x0000 */ Actor actor;
    /* 0x014C */ char unk_14C[0x3C];
} ObjMure2; // size = 0x0188

extern const ActorInit Obj_Mure2_InitVars;

#endif
