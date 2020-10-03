#ifndef _Z_OBJ_HSBLOCK_H_
#define _Z_OBJ_HSBLOCK_H_

#include "ultra64.h"
#include "global.h"

struct ObjHsblock;

typedef void (*ObjHsblockActionFunc)(struct ObjHsblock*, GlobalContext*);

typedef struct ObjHsblock {
    /* 0x0000 */ DynaPolyActor dyna;
    /* 0x0164 */ ObjHsblockActionFunc actionFunc;
} ObjHsblock; // size = 0x0168

extern const ActorInit Obj_Hsblock_InitVars;

#endif
