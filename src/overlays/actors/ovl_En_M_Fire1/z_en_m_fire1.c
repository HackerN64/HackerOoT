/*
 * File: z_en_m_fire1.c
 * Overlay: ovl_En_M_Fire1
 * Description: Deku Nut Hitbox
 */

#include "z_en_m_fire1.h"

#define FLAGS 0x00000000

#define THIS ((EnMFire1*)thisx)

void EnMFire1_Init(Actor* thisx, GlobalContext* globalCtx);
void EnMFire1_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnMFire1_Update(Actor* thisx, GlobalContext* globalCtx);

const ActorInit En_M_Fire1_InitVars = {
    ACTOR_EN_M_FIRE1,
    ACTORCAT_MISC,
    FLAGS,
    OBJECT_GAMEPLAY_KEEP,
    sizeof(EnMFire1),
    (ActorFunc)EnMFire1_Init,
    (ActorFunc)EnMFire1_Destroy,
    (ActorFunc)EnMFire1_Update,
    NULL,
};

static ColliderCylinderInit sCylinderInit = { {
                                                  COLTYPE_NONE,
                                                  AT_ON | AT_TYPE_PLAYER,
                                                  AC_NONE,
                                                  OC1_NONE,
                                                  OC2_TYPE_PLAYER,
                                                  COLSHAPE_CYLINDER,
                                              },
                                              {
                                                  ELEMTYPE_UNK2,
                                                  { 0x00000001, 0x00, 0x00 },
                                                  { 0xFFCFFFFF, 0x00, 0x00 },
                                                  TOUCH_ON | TOUCH_SFX_NONE,
                                                  BUMP_NONE,
                                                  OCELEM_NONE,
                                              },
                                              { 200, 200, 0, { 0 } } };

void EnMFire1_Init(Actor* thisx, GlobalContext* globalCtx) {
    EnMFire1* this = THIS;
    s32 pad;

    if (this->actor.params < 0) {
        Actor_ChangeCategory(globalCtx, &globalCtx->actorCtx, &this->actor, ACTORCAT_ITEMACTION);
    }

    Collider_InitCylinder(globalCtx, &this->collider);
    Collider_SetCylinder(globalCtx, &this->collider, &this->actor, &sCylinderInit);
}

void EnMFire1_Destroy(Actor* thisx, GlobalContext* globalCtx) {
    EnMFire1* this = THIS;

    Collider_DestroyCylinder(globalCtx, &this->collider);
}

void EnMFire1_Update(Actor* thisx, GlobalContext* globalCtx) {
    EnMFire1* this = THIS;
    s32 pad;

    if (Math_StepToF(&this->unk_198, 1.0f, 0.2f)) {
        Actor_Kill(&this->actor);
    } else {
        Collider_UpdateCylinder(&this->actor, &this->collider);
        CollisionCheck_SetAT(globalCtx, &globalCtx->colChkCtx, &this->collider.base);
    }
}
