#ifndef _Z_EN_BOM_CHU_H_
#define _Z_EN_BOM_CHU_H_

#include "ultra64.h"
#include "global.h"

struct EnBomChu;

typedef void (*EnBomChuActionFunc)(struct EnBomChu*, GlobalContext*);

typedef struct EnBomChu {
    /* 0x0000 */ Actor actor;
    /* 0x014C */ EnBomChuActionFunc actionFunc;
    /* 0x0150 */ s16 timer;
    /* 0x0154 */ Vec3f unk_154;
    /* 0x0160 */ Vec3f unk_160;
    /* 0x016C */ Vec3f unk_16C;
    /* 0x0178 */ f32 unk_178;
    /* 0x017C */ s32 blure1Index;
    /* 0x0180 */ s32 blure2Index;
    /* 0x0184 */ ColliderJntSph collider;
    /* 0x01A4 */ ColliderJntSphElement colliderElements[1];
} EnBomChu; // size = 0x01E4

extern const ActorInit En_Bom_Chu_InitVars;

#endif
