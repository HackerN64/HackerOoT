/*
 * File: z_bg_spot12_gate.c
 * Overlay: Bg_Spot12_Gate
 * Description: Haunted Wasteland Gate
 */

#include "z_bg_spot12_gate.h"

#define FLAGS 0x00000000

#define THIS ((BgSpot12Gate*)thisx)

void BgSpot12Gate_Init(Actor* thisx, GlobalContext* globalCtx);
void BgSpot12Gate_Destroy(Actor* thisx, GlobalContext* globalCtx);
void BgSpot12Gate_Update(Actor* thisx, GlobalContext* globalCtx);
void BgSpot12Gate_Draw(Actor* thisx, GlobalContext* globalCtx);

void func_808B30C0(BgSpot12Gate* this);
void func_808B30D8(BgSpot12Gate* this, GlobalContext* globalCtx);
void func_808B3134(BgSpot12Gate* this);
void func_808B314C(BgSpot12Gate* this, GlobalContext* globalCtx);
void func_808B317C(BgSpot12Gate* this);
void func_808B318C(BgSpot12Gate* this, GlobalContext* globalCtx);
void func_808B3274(BgSpot12Gate* this);
void func_808B3298(BgSpot12Gate* this, GlobalContext* globalCtx);

const ActorInit Bg_Spot12_Gate_InitVars = {
    ACTOR_BG_SPOT12_GATE,
    ACTORCAT_BG,
    FLAGS,
    OBJECT_SPOT12_OBJ,
    sizeof(BgSpot12Gate),
    (ActorFunc)BgSpot12Gate_Init,
    (ActorFunc)BgSpot12Gate_Destroy,
    (ActorFunc)BgSpot12Gate_Update,
    (ActorFunc)BgSpot12Gate_Draw,
};

static InitChainEntry sInitChain[] = {
    ICHAIN_VEC3F_DIV1000(scale, 100, ICHAIN_CONTINUE),
    ICHAIN_F32(uncullZoneForward, 2500, ICHAIN_CONTINUE),
    ICHAIN_F32(uncullZoneScale, 500, ICHAIN_CONTINUE),
    ICHAIN_F32(uncullZoneDownward, 1200, ICHAIN_STOP),
};

extern Gfx D_06001080[];
extern CollisionHeader D_060011EC;

void func_808B2F90(BgSpot12Gate* this, GlobalContext* globalCtx, CollisionHeader* collision, DynaPolyMoveFlag flags) {
    Actor* thisx = &this->dyna.actor;
    CollisionHeader* colHeader = NULL;
    s32 pad[2];

    DynaPolyActor_Init(thisx, flags);
    CollisionHeader_GetVirtual(collision, &colHeader);
    this->dyna.bgId = DynaPoly_SetBgActor(globalCtx, &globalCtx->colCtx.dyna, thisx, colHeader);
    if (this->dyna.bgId == BG_ACTOR_MAX) {
        osSyncPrintf("Warning : move BG 登録失敗(%s %d)(name %d)(arg_data 0x%04x)\n", "../z_bg_spot12_gate.c", 145,
                     thisx->id, thisx->params);
    }
}

void BgSpot12Gate_Init(Actor* thisx, GlobalContext* globalCtx) {
    BgSpot12Gate* this = THIS;

    func_808B2F90(this, globalCtx, &D_060011EC, DPM_UNK);
    Actor_ProcessInitChain(thisx, sInitChain);

    if (Flags_GetSwitch(globalCtx, thisx->params & 0x3F)) {
        func_808B3274(this);
    } else {
        func_808B30C0(this);
    }
}

void BgSpot12Gate_Destroy(Actor* thisx, GlobalContext* globalCtx) {
    BgSpot12Gate* this = THIS;

    DynaPoly_DeleteBgActor(globalCtx, &globalCtx->colCtx.dyna, this->dyna.bgId);
}

void func_808B30C0(BgSpot12Gate* this) {
    Actor* thisx = &this->dyna.actor;

    this->actionFunc = func_808B30D8;
    thisx->world.pos.y = thisx->home.pos.y;
}

void func_808B30D8(BgSpot12Gate* this, GlobalContext* globalCtx) {
    Actor* thisx = &this->dyna.actor;

    if (Flags_GetSwitch(globalCtx, thisx->params & 0x3F)) {
        func_808B3134(this);
        func_800800F8(globalCtx, 0x1040, -0x63, thisx, 0);
    }
}

void func_808B3134(BgSpot12Gate* this) {
    this->actionFunc = func_808B314C;
    this->unk_168 = 0x28;
}

void func_808B314C(BgSpot12Gate* this, GlobalContext* globalCtx) {
    if (this->unk_168 <= 0) {
        func_808B317C(this);
    }
}

void func_808B317C(BgSpot12Gate* this) {
    this->actionFunc = func_808B318C;
}

void func_808B318C(BgSpot12Gate* this, GlobalContext* globalCtx) {
    Actor* thisx = &this->dyna.actor;
    s32 var;

    Math_StepToF(&thisx->velocity.y, 1.6f, 0.03f);
    if (Math_StepToF(&thisx->world.pos.y, thisx->home.pos.y + 200.0f, thisx->velocity.y)) {
        func_808B3274(this);
        var = Quake_Add(ACTIVE_CAM, 3);
        Quake_SetSpeed(var, -0x3CB0);
        Quake_SetQuakeValues(var, 3, 0, 0, 0);
        Quake_SetCountdown(var, 0xC);
        Audio_PlayActorSound2(thisx, NA_SE_EV_BRIDGE_OPEN_STOP);
    } else {
        func_8002F974(thisx, NA_SE_EV_METALGATE_OPEN - SFX_FLAG);
    }
}

void func_808B3274(BgSpot12Gate* this) {
    Actor* thisx = &this->dyna.actor;

    this->actionFunc = func_808B3298;
    thisx->world.pos.y = thisx->home.pos.y + 200.0f;
}

void func_808B3298(BgSpot12Gate* this, GlobalContext* globalCtx) {
}

void BgSpot12Gate_Update(Actor* thisx, GlobalContext* globalCtx) {
    BgSpot12Gate* this = THIS;

    if (this->unk_168 > 0) {
        this->unk_168 -= 1;
    }
    this->actionFunc(this, globalCtx);
}

void BgSpot12Gate_Draw(Actor* thisx, GlobalContext* globalCtx) {
    Gfx_DrawDListOpa(globalCtx, D_06001080);
}
