#ifndef _Z_EN_GOROIWA_H_
#define _Z_EN_GOROIWA_H_

#include "ultra64.h"
#include "global.h"

struct EnGoroiwa;

typedef void (*EnGoroiwaActionFunc)(struct EnGoroiwa*, GlobalContext*);

typedef struct EnGoroiwa {
    /* 0x0000 */ Actor actor;
    /* 0x014C */ EnGoroiwaActionFunc actionFunc;
    /* 0x0150 */ ColliderJntSph collider;
    /* 0x0170 */ ColliderJntSphElement colliderItems[1];
    /* 0x01B0 */ Vec3f unk_1B0;
    /* 0x01BC */ f32 unk_1BC;
    /* 0x01C0 */ f32 unk_1C0;
    /* 0x01C4 */ s16 waitTimer;
    /* 0x01C6 */ s16 unk_1C6;
    /* 0x01C8 */ s16 collisionTimer;
    /* 0x01CA */ s16 endWaypoint;
    /* 0x01CC */ s16 currentWaypoint;
    /* 0x01CE */ s16 nextWaypoint;
    /* 0x01D0 */ s16 pathDirection;
    /* 0x01D2 */ u8 isInKokiri;
    /* 0x01D3 */ u8 unk_1D3;
} EnGoroiwa; // size = 0x01D4

extern const ActorInit En_Goroiwa_InitVars;

#endif
