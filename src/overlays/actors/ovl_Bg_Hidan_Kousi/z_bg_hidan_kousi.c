/*
 * File: z_bg_hidan_kousi.c
 * Overlay: ovl_Bg_Hidan_Kousi
 * Description:
 */

#include "z_bg_hidan_kousi.h"

#define FLAGS 0x00000010

#define THIS ((BgHidanKousi*)thisx)

void BgHidanKousi_Init(Actor* thisx, GlobalContext* globalCtx);
void BgHidanKousi_Destroy(Actor* thisx, GlobalContext* globalCtx);
void BgHidanKousi_Update(Actor* thisx, GlobalContext* globalCtx);
void BgHidanKousi_Draw(Actor* thisx, GlobalContext* globalCtx);

void func_80889ACC(BgHidanKousi* this);
void func_80889B5C(BgHidanKousi* this, GlobalContext* globalCtx);
void func_80889BC0(BgHidanKousi* this, GlobalContext* globalCtx);
void func_80889C18(BgHidanKousi* this, GlobalContext* globalCtx);
void func_80889C90(BgHidanKousi* this, GlobalContext* globalCtx);
void func_80889D28(BgHidanKousi* this, GlobalContext* globalCtx);

static f32 D_80889E40[] = { 120.0f, 150.0f, 150.0f };

const ActorInit Bg_Hidan_Kousi_InitVars = {
    ACTOR_BG_HIDAN_KOUSI,
    ACTORCAT_PROP,
    FLAGS,
    OBJECT_HIDAN_OBJECTS,
    sizeof(BgHidanKousi),
    (ActorFunc)BgHidanKousi_Init,
    (ActorFunc)BgHidanKousi_Destroy,
    (ActorFunc)BgHidanKousi_Update,
    (ActorFunc)BgHidanKousi_Draw,
};

static InitChainEntry sInitChain[] = {
    ICHAIN_VEC3F_DIV1000(scale, 100, ICHAIN_STOP),
};

extern CollisionHeader D_0600E2CC, D_0600E380, D_0600E430;

static CollisionHeader* D_80889E70[] = {
    &D_0600E2CC,
    &D_0600E380,
    &D_0600E430,
};

static s16 D_80889E7C[] = {
    0x4000,
    0xC000,
    0xC000,
    0x0000,
};

static Gfx (*D_80889E84[])[] = {
    0x0600C798,
    0x0600BFA8,
    0x0600BB58,
};

void BgHidanKousi_SetupAction(BgHidanKousi* this, BgHidanKousiActionFunc actionFunc) {
    this->actionFunc = actionFunc;
}

void BgHidanKousi_Init(Actor* thisx, GlobalContext* globalCtx) {
    BgHidanKousi* this = THIS;
    s32 pad;
    CollisionHeader* colHeader = NULL;

    DynaPolyActor_Init(&this->dyna, DPM_UNK);
    Actor_SetFocus(thisx, 50.0f);
    osSyncPrintf("◯◯◯炎の神殿オブジェクト【格子(arg_data : %0x)】出現 (%d %d)\n", thisx->params, thisx->params & 0xFF,
                 ((s32)thisx->params >> 8) & 0xFF);

    Actor_ProcessInitChain(thisx, sInitChain);
    if (((thisx->params & 0xFF) < 0) || ((thisx->params & 0xFF) >= 3)) {
        osSyncPrintf("arg_data おかしい 【格子】\n");
    }

    CollisionHeader_GetVirtual(D_80889E70[thisx->params & 0xFF], &colHeader);
    this->dyna.bgId = DynaPoly_SetBgActor(globalCtx, &globalCtx->colCtx.dyna, thisx, colHeader);
    thisx->world.rot.y = D_80889E7C[this->dyna.actor.params & 0xFF] + thisx->shape.rot.y;
    if (Flags_GetSwitch(globalCtx, (thisx->params >> 8) & 0xFF)) {
        func_80889ACC(this);
        BgHidanKousi_SetupAction(this, func_80889D28);
    } else {
        BgHidanKousi_SetupAction(this, func_80889B5C);
    }
}

void BgHidanKousi_Destroy(Actor* thisx, GlobalContext* globalCtx) {
    BgHidanKousi* this = THIS;
    DynaPoly_DeleteBgActor(globalCtx, &globalCtx->colCtx.dyna, this->dyna.bgId);
}

void func_80889ACC(BgHidanKousi* this) {
    s32 pad[2];
    Vec3s* rot = &this->dyna.actor.world.rot;
    f32 temp1 = D_80889E40[this->dyna.actor.params & 0xFF] * Math_SinS(rot->y);
    f32 temp2 = D_80889E40[this->dyna.actor.params & 0xFF] * Math_CosS(rot->y);
    Vec3f* initPos = &this->dyna.actor.home.pos;

    this->dyna.actor.world.pos.x = initPos->x + temp1;
    this->dyna.actor.world.pos.z = initPos->z + temp2;
}

void func_80889B5C(BgHidanKousi* this, GlobalContext* globalCtx) {
    if (Flags_GetSwitch(globalCtx, (this->dyna.actor.params >> 8) & 0xFF)) {
        BgHidanKousi_SetupAction(this, func_80889BC0);
        func_80080480(globalCtx, &this->dyna.actor);
        this->unk_168 = 0xC8;
    }
}

void func_80889BC0(BgHidanKousi* this, GlobalContext* globalCtx) {
    this->unk_168 -= 1;
    if (this->dyna.actor.category == func_8005B198() || (this->unk_168 <= 0)) {
        BgHidanKousi_SetupAction(this, func_80889C18);
    }
}

void func_80889C18(BgHidanKousi* this, GlobalContext* globalCtx) {
    this->dyna.actor.speedXZ += 0.2f;
    if (this->dyna.actor.speedXZ > 2.0f) {
        this->dyna.actor.speedXZ = 2.0f;
        BgHidanKousi_SetupAction(this, func_80889C90);
    }
    Actor_MoveForward(&this->dyna.actor);
    func_8002F974(&this->dyna.actor, NA_SE_EV_METALDOOR_SLIDE - SFX_FLAG);
}

void func_80889C90(BgHidanKousi* this, GlobalContext* globalCtx) {
    func_8002D7EC(&this->dyna.actor);
    if (D_80889E40[this->dyna.actor.params & 0xFF] <
        Math_Vec3f_DistXYZ(&this->dyna.actor.home.pos, &this->dyna.actor.world.pos)) {
        func_80889ACC(this);
        BgHidanKousi_SetupAction(this, func_80889D28);
        Audio_PlayActorSound2(&this->dyna.actor, NA_SE_EV_METALDOOR_STOP);
    } else {
        func_8002F974(&this->dyna.actor, NA_SE_EV_METALDOOR_SLIDE - SFX_FLAG);
    }
}

void func_80889D28(BgHidanKousi* this, GlobalContext* globalCtx) {
}

void BgHidanKousi_Update(Actor* thisx, GlobalContext* globalCtx) {
    BgHidanKousi* this = THIS;

    this->actionFunc(this, globalCtx);
}

void BgHidanKousi_Draw(Actor* thisx, GlobalContext* globalCtx) {
    OPEN_DISPS(globalCtx->state.gfxCtx, "../z_bg_hidan_kousi.c", 350);

    func_80093D18(globalCtx->state.gfxCtx);

    gSPMatrix(POLY_OPA_DISP++, Matrix_NewMtx(globalCtx->state.gfxCtx, "../z_bg_hidan_kousi.c", 354),
              G_MTX_NOPUSH | G_MTX_LOAD | G_MTX_MODELVIEW);
    gSPDisplayList(POLY_OPA_DISP++, D_80889E84[thisx->params & 0xFF]);

    CLOSE_DISPS(globalCtx->state.gfxCtx, "../z_bg_hidan_kousi.c", 359);
}
