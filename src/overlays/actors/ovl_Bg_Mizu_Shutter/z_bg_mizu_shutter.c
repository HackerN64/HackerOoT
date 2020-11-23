#include "z_bg_mizu_shutter.h"

#define FLAGS 0x00000010

#define THIS ((BgMizuShutter*)thisx)

#define SIZE_PARAM (((u16)this->dyna.actor.params >> 0xC) & 0xF)
#define TIMER_PARAM (((u16)this->dyna.actor.params >> 6) & 0x3F)

void BgMizuShutter_Init(BgMizuShutter* this, GlobalContext* globalCtx);
void BgMizuShutter_Destroy(BgMizuShutter* this, GlobalContext* globalCtx);
void BgMizuShutter_Update(BgMizuShutter* this, GlobalContext* globalCtx);
void BgMizuShutter_Draw(BgMizuShutter* this, GlobalContext* globalCtx);

void BgMizuShutter_WaitForTimer(BgMizuShutter* this, GlobalContext* globalCtx);
void BgMizuShutter_WaitForSwitch(BgMizuShutter* this, GlobalContext* globalCtx);
void BgMizuShutter_Move(BgMizuShutter* this, GlobalContext* globalCtx);
void BgMizuShutter_WaitForCutscene(BgMizuShutter* this, GlobalContext* globalCtx);

const ActorInit Bg_Mizu_Shutter_InitVars = {
    ACTOR_BG_MIZU_SHUTTER,
    ACTORTYPE_PROP,
    FLAGS,
    OBJECT_MIZU_OBJECTS,
    sizeof(BgMizuShutter),
    (ActorFunc)BgMizuShutter_Init,
    (ActorFunc)BgMizuShutter_Destroy,
    (ActorFunc)BgMizuShutter_Update,
    (ActorFunc)BgMizuShutter_Draw,
};

static Gfx* sDisplayLists[] = { 0x06007130, 0x060072D0 };
static CollisionHeader* sCollisionHeaders[] = { 0x06007250, 0x060073F0 };
static Vec3f sDisplacements[] = {
    { 0.0f, 100.0f, 0.0f },
    { 0.0f, 140.0f, 0.0f },
};
static InitChainEntry sInitChain[] = {
    ICHAIN_F32(uncullZoneScale, 1500, ICHAIN_CONTINUE),
    ICHAIN_F32(uncullZoneDownward, 1100, ICHAIN_CONTINUE),
    ICHAIN_F32(uncullZoneForward, 1000, ICHAIN_CONTINUE),
    ICHAIN_VEC3F_DIV1000(scale, 100, ICHAIN_STOP),
};

void BgMizuShutter_Init(BgMizuShutter* thisx, GlobalContext* globalCtx) {
    s32 pad;
    BgMizuShutter* this = THIS;
    s32 pad2;
    CollisionHeader* sp30 = NULL;
    s32 pad3;

    Actor_ProcessInitChain(&this->dyna.actor, sInitChain);
    this->displayList = sDisplayLists[SIZE_PARAM];
    DynaPolyInfo_SetActorMove(&this->dyna, 1);
    DynaPolyInfo_Alloc(sCollisionHeaders[SIZE_PARAM], &sp30);
    this->dyna.dynaPolyId = DynaPolyInfo_RegisterActor(globalCtx, &globalCtx->colCtx.dyna, &this->dyna.actor, sp30);
    if ((SIZE_PARAM == BGMIZUSHUTTER_SMALL) || (SIZE_PARAM == BGMIZUSHUTTER_LARGE)) {
        this->closedPos = this->dyna.actor.posRot.pos;
        this->timer = 0;
        this->timerMax = TIMER_PARAM * 20;
        Matrix_RotateY(this->dyna.actor.posRot.rot.y * (M_PI / 0x8000), 0);
        Matrix_RotateX(this->dyna.actor.posRot.rot.x * (M_PI / 0x8000), 1);
        Matrix_RotateZ(this->dyna.actor.posRot.rot.z * (M_PI / 0x8000), 1);
        Matrix_MultVec3f(&sDisplacements[SIZE_PARAM], &this->openPos);
        this->openPos.x += this->dyna.actor.posRot.pos.x;
        this->openPos.y += this->dyna.actor.posRot.pos.y;
        this->openPos.z += this->dyna.actor.posRot.pos.z;
        if (this->timerMax != 0x3F * 20) {
            Flags_UnsetSwitch(globalCtx, (u16)this->dyna.actor.params & 0x3F);
            this->dyna.actor.posRot.pos = this->closedPos;
        }
        if (Flags_GetSwitch(globalCtx, (u16)this->dyna.actor.params & 0x3F)) {
            this->dyna.actor.posRot.pos = this->openPos;
            this->actionFunc = BgMizuShutter_WaitForTimer;
        } else {
            this->actionFunc = BgMizuShutter_WaitForSwitch;
        }
    }
}

void BgMizuShutter_Destroy(BgMizuShutter* thisx, GlobalContext* globalCtx) {
    s32 pad;
    BgMizuShutter* this = THIS;

    DynaPolyInfo_Free(globalCtx, &globalCtx->colCtx.dyna, this->dyna.dynaPolyId);
}

void BgMizuShutter_WaitForSwitch(BgMizuShutter* this, GlobalContext* globalCtx) {
    if (Flags_GetSwitch(globalCtx, (u16)this->dyna.actor.params & 0x3F)) {
        if (ABS(this->dyna.actor.posRot.rot.x) > 0x2C60) {
            func_800800F8(globalCtx, 0x119E, -0x63, &this->dyna.actor, 0);
        } else {
            func_80080480(globalCtx, &this->dyna.actor);
        }
        this->actionFunc = BgMizuShutter_WaitForCutscene;
        this->timer = 30;
    }
}

void BgMizuShutter_WaitForCutscene(BgMizuShutter* this, GlobalContext* globalCtx) {
    if (this->timer-- == 0) {
        Audio_PlayActorSound2(&this->dyna.actor, NA_SE_EV_METALDOOR_OPEN);
        this->actionFunc = BgMizuShutter_Move;
    }
}

void BgMizuShutter_Move(BgMizuShutter* this, GlobalContext* globalCtx) {
    if (Flags_GetSwitch(globalCtx, (u16)this->dyna.actor.params & 0x3F)) {
        Math_SmoothScaleMaxMinF(&this->dyna.actor.posRot.pos.x, this->openPos.x, 1.0f, 4.0f, 0.1f);
        Math_SmoothScaleMaxMinF(&this->dyna.actor.posRot.pos.y, this->openPos.y, 1.0f, 4.0f, 0.1f);
        Math_SmoothScaleMaxMinF(&this->dyna.actor.posRot.pos.z, this->openPos.z, 1.0f, 4.0f, 0.1f);
        if ((this->dyna.actor.posRot.pos.x == this->openPos.x) && (this->dyna.actor.posRot.pos.y == this->openPos.y) &&
            (this->dyna.actor.posRot.pos.z == this->openPos.z)) {
            this->timer = this->timerMax;
            this->actionFunc = BgMizuShutter_WaitForTimer;
        }
    } else {
        Math_SmoothScaleMaxMinF(&this->maxSpeed, 20.0f, 1.0f, 3.0f, 0.1f);
        Math_SmoothScaleMaxMinF(&this->dyna.actor.posRot.pos.x, this->closedPos.x, 1.0f, this->maxSpeed, 0.1f);
        Math_SmoothScaleMaxMinF(&this->dyna.actor.posRot.pos.y, this->closedPos.y, 1.0f, this->maxSpeed, 0.1f);
        Math_SmoothScaleMaxMinF(&this->dyna.actor.posRot.pos.z, this->closedPos.z, 1.0f, this->maxSpeed, 0.1f);
        if ((this->dyna.actor.posRot.pos.x == this->closedPos.x) &&
            (this->dyna.actor.posRot.pos.y == this->closedPos.y) &&
            (this->dyna.actor.posRot.pos.z == this->closedPos.z)) {
            func_800AA000(this->dyna.actor.xyzDistFromLinkSq, 0x78, 0x14, 0xA);
            Audio_PlayActorSound2(&this->dyna.actor, NA_SE_EV_STONE_BOUND);
            this->actionFunc = BgMizuShutter_WaitForSwitch;
        }
    }
}

void BgMizuShutter_WaitForTimer(BgMizuShutter* this, GlobalContext* globalCtx) {
    if (this->timerMax != 0x3F * 20) {
        this->timer--;
        func_8002F994(&this->dyna.actor, this->timer);
        if (this->timer == 0) {
            Audio_PlayActorSound2(&this->dyna.actor, NA_SE_EV_METALDOOR_CLOSE);
            Flags_UnsetSwitch(globalCtx, (u16)this->dyna.actor.params & 0x3F);
            this->actionFunc = BgMizuShutter_Move;
        }
    }
}

void BgMizuShutter_Update(BgMizuShutter* thisx, GlobalContext* globalCtx) {
    s32 pad;
    BgMizuShutter* this = THIS;

    this->actionFunc(this, globalCtx);
}

void BgMizuShutter_Draw(BgMizuShutter* thisx, GlobalContext* globalCtx) {
    s32 pad;
    BgMizuShutter* this = THIS;

    OPEN_DISPS(globalCtx->state.gfxCtx, "../z_bg_mizu_shutter.c", 410);
    func_80093D18(globalCtx->state.gfxCtx);
    gSPMatrix(POLY_OPA_DISP++, Matrix_NewMtx(globalCtx->state.gfxCtx, "../z_bg_mizu_shutter.c", 415),
              G_MTX_NOPUSH | G_MTX_LOAD | G_MTX_MODELVIEW);

    if (this->displayList != NULL) {
        gSPDisplayList(POLY_OPA_DISP++, this->displayList);
    }
    CLOSE_DISPS(globalCtx->state.gfxCtx, "../z_bg_mizu_shutter.c", 422);
}
