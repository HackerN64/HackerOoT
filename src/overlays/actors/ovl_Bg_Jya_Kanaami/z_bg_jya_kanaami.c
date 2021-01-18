/*
 * File: z_bg_jya_kanaami.c
 * Overlay: Bg_Jya_Kanaami
 * Description: Climbable Metal Grating (Fire Temple)
 */

#include "z_bg_jya_kanaami.h"

#define FLAGS 0x00000000

#define THIS ((BgJyaKanaami*)thisx)

void BgJyaKanaami_Init(Actor* thisx, GlobalContext* globalCtx);
void BgJyaKanaami_Destroy(Actor* thisx, GlobalContext* globalCtx);
void BgJyaKanaami_Update(Actor* thisx, GlobalContext* globalCtx);
void BgJyaKanaami_Draw(Actor* thisx, GlobalContext* globalCtx);

void func_80899880(BgJyaKanaami* this);
void func_80899894(BgJyaKanaami* this, GlobalContext* globalCtx);
void func_8089993C(BgJyaKanaami* this);
void func_80899950(BgJyaKanaami* this, GlobalContext* globalCtx);
void func_80899A08(BgJyaKanaami* this);

const ActorInit Bg_Jya_Kanaami_InitVars = {
    ACTOR_BG_JYA_KANAAMI,
    ACTORCAT_BG,
    FLAGS,
    OBJECT_JYA_OBJ,
    sizeof(BgJyaKanaami),
    (ActorFunc)BgJyaKanaami_Init,
    (ActorFunc)BgJyaKanaami_Destroy,
    (ActorFunc)BgJyaKanaami_Update,
    (ActorFunc)BgJyaKanaami_Draw,
};

static InitChainEntry sInitChain[] = {
    ICHAIN_VEC3F_DIV1000(scale, 100, ICHAIN_CONTINUE),
    ICHAIN_F32(uncullZoneForward, 1000, ICHAIN_CONTINUE),
    ICHAIN_F32(uncullZoneScale, 700, ICHAIN_CONTINUE),
    ICHAIN_F32(uncullZoneDownward, 1000, ICHAIN_STOP),
};

extern Gfx D_0600F000[];
extern CollisionHeader D_0600F208;

void func_80899740(BgJyaKanaami* this, GlobalContext* globalCtx, CollisionHeader* collision, DynaPolyMoveFlag flag) {
    s32 pad;
    CollisionHeader* colHeader = NULL;
    s32 pad2;

    DynaPolyActor_Init(&this->actor, flag);
    CollisionHeader_GetVirtual(collision, &colHeader);
    this->bgId = DynaPoly_SetBgActor(globalCtx, &globalCtx->colCtx.dyna, &this->actor, colHeader);
    if (this->bgId == BG_ACTOR_MAX) {
        osSyncPrintf("Warning : move BG 登録失敗(%s %d)(name %d)(arg_data 0x%04x)\n", "../z_bg_jya_kanaami.c", 145,
                     this->actor.id, this->actor.params);
    }
}

void BgJyaKanaami_Init(Actor* thisx, GlobalContext* globalCtx) {
    BgJyaKanaami* this = THIS;

    func_80899740(this, globalCtx, &D_0600F208, 0);
    Actor_ProcessInitChain(&this->actor, sInitChain);
    if (Flags_GetSwitch(globalCtx, this->actor.params & 0x3F)) {
        func_80899A08(this);
    } else {
        func_80899880(this);
    }
    osSyncPrintf("(jya 金網)(arg_data 0x%04x)\n", this->actor.params);
}

void BgJyaKanaami_Destroy(Actor* thisx, GlobalContext* globalCtx) {
    BgJyaKanaami* this = THIS;

    DynaPoly_DeleteBgActor(globalCtx, &globalCtx->colCtx.dyna, this->bgId);
}

void func_80899880(BgJyaKanaami* this) {
    this->actionFunc = func_80899894;
    this->unk_16A = 0;
}

void func_80899894(BgJyaKanaami* this, GlobalContext* globalCtx) {
    if (Flags_GetSwitch(globalCtx, this->actor.params & 0x3F) || this->unk_16A > 0) {
        if (this->actor.world.pos.x > -1000.0f && this->unk_16A == 0) {
            func_800800F8(globalCtx, 0xD7A, -0x63, &this->actor, 0);
        }
        this->unk_16A += 1;
        if (this->unk_16A >= 0xA) {
            func_8089993C(this);
        }
    }
}

void func_8089993C(BgJyaKanaami* this) {
    this->actionFunc = func_80899950;
    this->unk_168 = 0;
}

void func_80899950(BgJyaKanaami* this, GlobalContext* globalCtx) {
    s32 pad[2];
    s32 var;
    this->unk_168 += 0x20;
    if (Math_ScaledStepToS(&this->actor.world.rot.x, 0x4000, this->unk_168)) {
        func_80899A08(this);
        Audio_PlayActorSound2(&this->actor, NA_SE_EV_TRAP_BOUND);
        var = Quake_Add(ACTIVE_CAM, 3);
        Quake_SetSpeed(var, 25000);
        Quake_SetQuakeValues(var, 2, 0, 0, 0);
        Quake_SetCountdown(var, 0x10);
    }
}

void func_80899A08(BgJyaKanaami* this) {
    this->actionFunc = 0;
    this->actor.world.rot.x = 0x4000;
}

void BgJyaKanaami_Update(Actor* thisx, GlobalContext* globalCtx) {
    BgJyaKanaami* this = THIS;

    if (this->actionFunc != NULL) {
        this->actionFunc(this, globalCtx);
    }
    this->actor.shape.rot.x = this->actor.world.rot.x;
}

void BgJyaKanaami_Draw(Actor* thisx, GlobalContext* globalCtx) {
    Gfx_DrawDListOpa(globalCtx, D_0600F000);
}
