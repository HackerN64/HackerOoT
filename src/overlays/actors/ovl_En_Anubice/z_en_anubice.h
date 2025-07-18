#ifndef Z_EN_ANUBICE_H
#define Z_EN_ANUBICE_H

#include "ultra64.h"
#include "actor.h"

#include "assets/objects/object_anubice/object_anubice.h"

struct EnAnubice;

typedef void (*EnAnubiceActionFunc)(struct EnAnubice*, struct PlayState*);

typedef struct EnAnubice {
    /* 0x0000 */ Actor actor;
    /* 0x014C */ SkelAnime skelAnime;
    /* 0x0190 */ Vec3s jointTable[ANUBICE_LIMB_MAX];
    /* 0x01F0 */ Vec3s morphTable[ANUBICE_LIMB_MAX];
    /* 0x0250 */ EnAnubiceActionFunc actionFunc;
    /* 0x0254 */ s16 timeAlive;
    /* 0x0256 */ s16 isNearWall; // Technically any bg poly, but in practice usually a wall
    /* 0x0258 */ s16 fallTargetYaw;
    /* 0x025A */ s16 deathTimer;
    /* 0x025C */ s16 knockbackTimer;
    /* 0x025E */ s16 isMirroringPlayer;
    /* 0x0260 */ s16 isPlayerOutOfRange;
    /* 0x0262 */ s16 isKnockedback; // Hit by an attack without ANUBICE_DMG_REACT_FIRE
    /* 0x0264 */ s16 hasSearchedForFlameCircles;
    /* 0x0268 */ f32 hoverVelocityTimer;
    /* 0x026C */ f32 animLastFrame;
    /* 0x0270 */ f32 targetHeight;
    /* 0x0274 */ f32 playerHeightOffset; // How high above the player to hover at
    /* 0x0278 */ f32 headPitch; // Never changed from initial value 0
    /* 0x027C */ f32 focusHeightOffset;
    /* 0x0280 */ Vec3f headPos;
    /* 0x028C */ Vec3f fireballRot;
    /* 0x0298 */ Vec3f home;
    /* 0x02A4 */ Vec3f knockbackRecoveryVelocity;
    /* 0x02B0 */ struct BgHidanCurtain* flameCircles[5];
    /* 0x02C4 */ char unk_2C4[0x4]; // Possibly another element of flameCircles
    /* 0x02C8 */ ColliderCylinder collider;
} EnAnubice; // size = 0x0314

#endif
