/*
 * File: z_en_skjneedle.c
 * Overlay: ovl_En_Skjneedle
 * Description: Skullkid Needle Attack
 */

#include "z_en_skjneedle.h"

#define FLAGS 0x00000205

#define THIS ((EnSkjneedle*)thisx)

void EnSkjneedle_Init(Actor* thisx, GlobalContext* globalCtx);
void EnSkjneedle_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnSkjneedle_Update(Actor* thisx, GlobalContext* globalCtx);
void EnSkjneedle_Draw(Actor* thisx, GlobalContext* globalCtx);

s32 func_80B01F6C(EnSkjneedle* this);

extern Gfx D_06000EB0[];

const ActorInit En_Skjneedle_InitVars = {
    ACTOR_EN_SKJNEEDLE,
    ACTORCAT_ENEMY,
    FLAGS,
    OBJECT_SKJ,
    sizeof(EnSkjneedle),
    (ActorFunc)EnSkjneedle_Init,
    (ActorFunc)EnSkjneedle_Destroy,
    (ActorFunc)EnSkjneedle_Update,
    (ActorFunc)EnSkjneedle_Draw,
};

static ColliderCylinderInitType1 sCylinderInit = {
    {
        COLTYPE_HIT1,
        AT_ON | AT_TYPE_ENEMY,
        AC_ON | AC_TYPE_PLAYER,
        OC1_NONE,
        COLSHAPE_CYLINDER,
    },
    { 0x00, { 0xFFCFFFFF, 0x00, 0x08 }, { 0xFFCFFFFF, 0x00, 0x00 }, 0x01, 0x01, 0x01 },
    { 10, 4, -2, { 0, 0, 0 } },
};

static InitChainEntry sInitChain[] = {
    ICHAIN_U8(targetMode, 2, ICHAIN_CONTINUE),
    ICHAIN_F32(targetArrowOffset, 30, ICHAIN_STOP),
};

void EnSkjneedle_Init(Actor* thisx, GlobalContext* globalCtx) {
    EnSkjneedle* this = THIS;

    Actor_ProcessInitChain(&this->actor, sInitChain);
    Collider_InitCylinder(globalCtx, &this->collider);
    Collider_SetCylinderType1(globalCtx, &this->collider, &this->actor, &sCylinderInit);
    ActorShape_Init(&this->actor.shape, 0, ActorShadow_DrawCircle, 20.0f);
    thisx->flags &= ~0x1;
    Actor_SetScale(&this->actor, 0.01f);
}

void EnSkjneedle_Destroy(Actor* thisx, GlobalContext* globalCtx) {
    EnSkjneedle* this = THIS;

    Collider_DestroyCylinder(globalCtx, &this->collider);
}

s32 func_80B01F6C(EnSkjneedle* this) {
    if (this->collider.base.atFlags & AT_HIT) {
        this->collider.base.acFlags &= ~AC_HIT;
        return 1;
    }
    return 0;
}

void EnSkjneedle_Update(Actor* thisx, GlobalContext* globalCtx) {
    EnSkjneedle* this = THIS;
    GlobalContext* preserve = globalCtx; // workaround to store globalCtx in $s1 and not on the stack

    this->unk_1E0++;
    if (this->unk_1E2 != 0) {
        this->unk_1E2--;
    }
    if (func_80B01F6C(this) || this->unk_1E2 == 0) {
        Actor_Kill(&this->actor);
    } else {
        globalCtx = preserve; // workaround
        Actor_SetScale(&this->actor, 0.01f);
        Collider_UpdateCylinder(&this->actor, &this->collider);
        CollisionCheck_SetAT(globalCtx, &globalCtx->colChkCtx, &this->collider.base);
        CollisionCheck_SetOC(globalCtx, &globalCtx->colChkCtx, &this->collider.base);
        Actor_MoveForward(&this->actor);
        Actor_UpdateBgCheckInfo(globalCtx, &this->actor, 20.0f, 20.0f, 20.0f, 7);
    }
}

void EnSkjneedle_Draw(Actor* thisx, GlobalContext* globalCtx) {
    s32 pad;

    OPEN_DISPS(globalCtx->state.gfxCtx, "../z_en_skj_needle.c", 200);

    func_80093D18(globalCtx->state.gfxCtx);
    gSPMatrix(POLY_OPA_DISP++, Matrix_NewMtx(globalCtx->state.gfxCtx, "../z_en_skj_needle.c", 205),
              G_MTX_NOPUSH | G_MTX_LOAD | G_MTX_MODELVIEW);
    gSPDisplayList(POLY_OPA_DISP++, &D_06000EB0);

    CLOSE_DISPS(globalCtx->state.gfxCtx, "../z_en_skj_needle.c", 210);
}
