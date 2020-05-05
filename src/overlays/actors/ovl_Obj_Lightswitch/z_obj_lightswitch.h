#ifndef _Z_OBJ_LIGHTSWITCH_H_
#define _Z_OBJ_LIGHTSWITCH_H_

#include <ultra64.h>
#include <global.h>

struct ObjLightswitch;

typedef struct ObjLightswitch {
    /* 0x0000 */ Actor actor;
    /* 0x014C */ char unk_14C[0x78];
} ObjLightswitch; // size = 0x01C4

extern const ActorInit Obj_Lightswitch_InitVars;

#endif
