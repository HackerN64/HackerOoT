#ifndef _Z_OBJ_MURE3_H_
#define _Z_OBJ_MURE3_H_

#include "ultra64.h"
#include "global.h"

struct ObjMure3;

typedef void (*ObjMure3ActionFunc)(struct ObjMure3*, GlobalContext*);
typedef void (*ObjMure3SpawnFunc)(struct ObjMure3*, GlobalContext*);

typedef struct ObjMure3 {
    /* 0x0000 */ Actor actor;
    /* 0x014C */ ObjMure3ActionFunc actionFunc;
    /* 0x0150 */ EnItem00* unk_150[7];
    /* 0x016C */ u16 unk_16C;
} ObjMure3; // size = 0x0170

extern const ActorInit Obj_Mure3_InitVars;

#endif
