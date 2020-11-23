#ifndef _Z_EN_IK_H_
#define _Z_EN_IK_H_

#include "ultra64.h"
#include "global.h"

struct EnIk;

typedef void (*EnIkActionFunc)(struct EnIk*, GlobalContext*);

typedef struct EnIk {
    /* 0x0000 */ Actor actor;
    /* 0x014C */ SkelAnime skelAnime;
    /* 0x0190 */ Vec3s limbDrawTable[30];
    /* 0x0244 */ Vec3s transitionDrawTable[30];
    /* 0x02F8 */ u8 unk_2F8;
    /* 0x02F9 */ u8 unk_2F9;
    /* 0x02FA */ u8 unk_2FA;
    /* 0x02FB */ u8 unk_2FB;
    /* 0x02FC */ u8 unk_2FC;
    /* 0x02FD */ u8 unk_2FD;
    /* 0x02FE */ s8 unk_2FE;
    /* 0x02FF */ s8 unk_2FF;
    /* 0x0300 */ s16 unk_300;
    /* 0x0302 */ s16 switchFlags;
    /* 0x0304 */ EnIkActionFunc actionFunc;
    /* 0x0308 */ struct_80032E24 unk_308;
    /* 0x0320 */ ColliderCylinder bodyCollider;
    /* 0x036C */ ColliderQuad axeCollider;
    /* 0x03EC */ ColliderTris shieldCollider;
    /* 0x040C */ ColliderTrisItem shieldColliderItems[2];
    /* 0x04C4 */ s32 blureIdx;
    /* 0x04C8 */ s32 action;
    /* 0x04CC */ s32 drawMode;
    /* 0x04D0 */ u32 npcAction;
    /* 0x04D4 */ s32 unk_4D4;
    /* 0x04D8 */ char unk_4D8[0x04];
} EnIk; // size = 0x04DC

extern const ActorInit En_Ik_InitVars;

#endif
