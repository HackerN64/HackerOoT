/*
 * File: z_obj_ice_poly.c
 * Overlay: ovl_Obj_Ice_Poly
 * Description: Ice / Frozen Actors
 */

#include "z_obj_ice_poly.h"

#define FLAGS 0x00000010

#define THIS ((ObjIcePoly*)thisx)

void ObjIcePoly_Init(Actor* thisx, GlobalContext* globalCtx);
void ObjIcePoly_Destroy(Actor* thisx, GlobalContext* globalCtx);
void ObjIcePoly_Update(Actor* thisx, GlobalContext* globalCtx);
void ObjIcePoly_Draw(Actor* thisx, GlobalContext* globalCtx);

void ObjIcePoly_Idle(ObjIcePoly* this, GlobalContext* globalCtx);
void ObjIcePoly_Melt(ObjIcePoly* this, GlobalContext* globalCtx);

extern Gfx* D_04033EE0[];

const ActorInit Obj_Ice_Poly_InitVars = {
    ACTOR_OBJ_ICE_POLY,
    ACTORTYPE_PROP,
    FLAGS,
    OBJECT_GAMEPLAY_KEEP,
    sizeof(ObjIcePoly),
    (ActorFunc)ObjIcePoly_Init,
    (ActorFunc)ObjIcePoly_Destroy,
    (ActorFunc)ObjIcePoly_Update,
    (ActorFunc)ObjIcePoly_Draw,
};

static ColliderCylinderInit sCylinderInitIce = {
    { COLTYPE_UNK10, 0x11, 0x09, 0x39, 0x20, COLSHAPE_CYLINDER },
    { 0x00, { 0xFFCFFFFF, 0x02, 0x00 }, { 0x00020800, 0x00, 0x00 }, 0x19, 0x01, 0x01 },
    { 50, 120, 0, { 0, 0, 0 } },
};

static ColliderCylinderInit sCylinderInitHard = {
    { COLTYPE_UNK12, 0x00, 0x0D, 0x00, 0x20, COLSHAPE_CYLINDER },
    { 0x00, { 0x00000000, 0x00, 0x00 }, { 0x4E01F7F6, 0x00, 0x00 }, 0x00, 0x01, 0x00 },
    { 50, 120, 0, { 0, 0, 0 } },
};

static f32 sScale[] = { 0.5f, 1.0f, 1.5f };
static s16 sOffsetY[] = { -25, 0, -20 };
static Color_RGBA8 sColorWhite = { 250, 250, 250, 255 };
static Color_RGBA8 sColorGray = { 180, 180, 180, 255 };

void ObjIcePoly_Init(Actor* thisx, GlobalContext* globalCtx) {
    ObjIcePoly* this = THIS;

    this->unk_151 = (thisx->params >> 8) & 0xFF;
    thisx->params &= 0xFF;
    if (thisx->params < 0 || thisx->params >= 3) {
        Actor_Kill(thisx);
        return;
    }
    Actor_SetScale(thisx, sScale[thisx->params]);
    thisx->posRot.pos.y = sOffsetY[thisx->params] + thisx->initPosRot.pos.y;
    Collider_InitCylinder(globalCtx, &this->colliderIce);
    Collider_SetCylinder(globalCtx, &this->colliderIce, thisx, &sCylinderInitIce);
    Collider_InitCylinder(globalCtx, &this->colliderHard);
    Collider_SetCylinder(globalCtx, &this->colliderHard, thisx, &sCylinderInitHard);
    Collider_CylinderUpdate(thisx, &this->colliderIce);
    Collider_CylinderUpdate(thisx, &this->colliderHard);
    thisx->colChkInfo.mass = 0xFF;
    this->alpha = 255;
    this->colliderIce.dim.radius *= thisx->scale.x;
    this->colliderIce.dim.height *= thisx->scale.y;
    this->colliderHard.dim.radius *= thisx->scale.x;
    this->colliderHard.dim.height *= thisx->scale.y;
    Actor_SetHeight(thisx, thisx->scale.y * 30.0f);
    this->actionFunc = ObjIcePoly_Idle;
}

void ObjIcePoly_Destroy(Actor* thisx, GlobalContext* globalCtx) {
    s32 pad;
    ObjIcePoly* this = THIS;

    if ((this->actor.params >= 0) && (this->actor.params < 3)) {
        Collider_DestroyCylinder(globalCtx, &this->colliderIce);
        Collider_DestroyCylinder(globalCtx, &this->colliderHard);
    }
}

void ObjIcePoly_Idle(ObjIcePoly* this, GlobalContext* globalCtx) {
    static Vec3f zeroVec = { 0.0f, 0.0f, 0.0f };
    s32 pad;
    Vec3f pos;

    if (this->colliderIce.base.acFlags & 2) {
        this->meltTimer = -this->colliderIce.body.acHitItem->toucher.damage;
        this->actor.posRot2.rot.y = this->actor.yawTowardsLink;
        func_800800F8(globalCtx, 0x1400, 40, &this->actor, 0);
        this->actionFunc = ObjIcePoly_Melt;
    } else if (this->actor.parent != NULL) {
        this->actor.parent->freezeTimer = 40;
        CollisionCheck_SetAT(globalCtx, &globalCtx->colChkCtx, &this->colliderIce.base);
        CollisionCheck_SetAC(globalCtx, &globalCtx->colChkCtx, &this->colliderIce.base);
        CollisionCheck_SetOC(globalCtx, &globalCtx->colChkCtx, &this->colliderIce.base);
        CollisionCheck_SetAC(globalCtx, &globalCtx->colChkCtx, &this->colliderHard.base);
    } else {
        Actor_Kill(&this->actor);
    }
    pos.x = this->actor.posRot.pos.x +
            this->actor.scale.x * (Math_Rand_S16Offset(15, 15) * (Math_Rand_ZeroOne() < 0.5f ? -1 : 1));
    pos.y = this->actor.posRot.pos.y + this->actor.scale.y * Math_Rand_S16Offset(10, 90);
    pos.z = this->actor.posRot.pos.z +
            this->actor.scale.z * (Math_Rand_S16Offset(15, 15) * (Math_Rand_ZeroOne() < 0.5f ? -1 : 1));
    if ((globalCtx->gameplayFrames % 7) == 0) {
        EffectSsKiraKira_SpawnDispersed(globalCtx, &pos, &zeroVec, &zeroVec, &sColorWhite, &sColorGray, 2000, 5);
    }
}

void ObjIcePoly_Melt(ObjIcePoly* this, GlobalContext* globalCtx) {
    Vec3f accel;
    Vec3f vel;
    Vec3f pos;
    s32 i;

    accel.x = 0.0f;
    accel.y = this->actor.scale.y;
    accel.z = 0.0f;
    vel.x = 0.0f;
    vel.y = this->actor.scale.y;
    vel.z = 0.0f;

    for (i = 0; i < 2; i++) {
        pos.x = this->actor.posRot.pos.x +
                this->actor.scale.x * (Math_Rand_S16Offset(20, 20) * (Math_Rand_ZeroOne() < 0.5f ? -1 : 1));
        pos.y = this->actor.posRot.pos.y + this->actor.scale.y * Math_Rand_ZeroOne() * 50.0f;
        pos.z = this->actor.posRot.pos.z +
                this->actor.scale.x * (Math_Rand_S16Offset(20, 20) * (Math_Rand_ZeroOne() < 0.5f ? -1 : 1));
        func_8002829C(globalCtx, &pos, &vel, &accel, &sColorWhite, &sColorGray,
                      Math_Rand_S16Offset(0x15E, 0x64) * this->actor.scale.x, this->actor.scale.x * 20.0f);
    }
    if (this->meltTimer < 0) {
        if (this->actor.parent != NULL) {
            this->actor.parent->freezeTimer = 40;
        }
        this->meltTimer++;
        if (this->meltTimer == 0) {
            this->meltTimer = 40;
            Audio_PlayActorSound2(&this->actor, NA_SE_EV_ICE_MELT);
        }
    } else {
        if (this->meltTimer != 0) {
            this->meltTimer--;
        }
        this->actor.scale.y = sScale[this->actor.params] * (0.5f + (this->meltTimer * 0.0125f));
        this->alpha -= 6;
        if (this->meltTimer == 0) {
            Actor_Kill(&this->actor);
        }
    }
}

void ObjIcePoly_Update(Actor* thisx, GlobalContext* globalCtx) {
    s32 pad;
    ObjIcePoly* this = THIS;

    this->actionFunc(this, globalCtx);
}

void ObjIcePoly_Draw(Actor* thisx, GlobalContext* globalCtx) {
    s32 pad;
    ObjIcePoly* this = THIS;

    OPEN_DISPS(globalCtx->state.gfxCtx, "../z_obj_ice_poly.c", 421);
    func_80093D84(globalCtx->state.gfxCtx);
    func_8002ED80(&this->actor, globalCtx, 0);
    Matrix_RotateRPY(0x500, 0, -0x500, MTXMODE_APPLY);

    gSPMatrix(POLY_XLU_DISP++, Matrix_NewMtx(globalCtx->state.gfxCtx, "../z_obj_ice_poly.c", 428),
              G_MTX_NOPUSH | G_MTX_LOAD | G_MTX_MODELVIEW);
    gSPSegment(POLY_XLU_DISP++, 0x08,
               Gfx_TwoTexScroll(globalCtx->state.gfxCtx, 0, 0, globalCtx->gameplayFrames % 0x100, 0x20, 0x10, 1, 0,
                                (globalCtx->gameplayFrames * 2) % 0x100, 0x40, 0x20));
    gDPSetEnvColor(POLY_XLU_DISP++, 0, 50, 100, this->alpha);
    gSPDisplayList(POLY_XLU_DISP++, D_04033EE0);

    CLOSE_DISPS(globalCtx->state.gfxCtx, "../z_obj_ice_poly.c", 444);
}
