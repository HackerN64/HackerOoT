/*
 * File: z_bg_spot18_obj.c
 * Overlay: Bg_Spot18_Obj
 * Description:
 */

#include "z_bg_spot18_obj.h"

#define FLAGS 0x00000000

#define THIS ((BgSpot18Obj*)thisx)

void BgSpot18Obj_Init(Actor* thisx, GlobalContext* globalCtx);
void BgSpot18Obj_Destroy(Actor* thisx, GlobalContext* globalCtx);
void BgSpot18Obj_Update(Actor* thisx, GlobalContext* globalCtx);
void BgSpot18Obj_Draw(Actor* thisx, GlobalContext* globalCtx);

s32 func_808B8910(BgSpot18Obj* this, GlobalContext* globalCtx);
s32 func_808B8A5C(BgSpot18Obj* this, GlobalContext* globalCtx);
s32 func_808B8A98(BgSpot18Obj* this, GlobalContext* globalCtx);
s32 func_808B8B08(BgSpot18Obj* this, GlobalContext* globalCtx);
s32 func_808B8BB4(BgSpot18Obj* this, GlobalContext* globalCtx);
s32 func_808B8C90(BgSpot18Obj* this, GlobalContext* globalCtx);
void func_808B8DC0(BgSpot18Obj* this);
void func_808B8DD0(BgSpot18Obj* this, GlobalContext* globalCtx);
void func_808B8E64(BgSpot18Obj* this);
void func_808B8E7C(BgSpot18Obj* this, GlobalContext* globalCtx);
void func_808B8EE0(BgSpot18Obj* this);
void func_808B8F08(BgSpot18Obj* this, GlobalContext* globalCtx);
void func_808B9030(BgSpot18Obj* this);
void func_808B9040(BgSpot18Obj* this, GlobalContext* globalCtx);

const ActorInit Bg_Spot18_Obj_InitVars = {
    ACTOR_BG_SPOT18_OBJ,
    ACTORTYPE_BG,
    FLAGS,
    OBJECT_SPOT18_OBJ,
    sizeof(BgSpot18Obj),
    (ActorFunc)BgSpot18Obj_Init,
    (ActorFunc)BgSpot18Obj_Destroy,
    (ActorFunc)BgSpot18Obj_Update,
    (ActorFunc)BgSpot18Obj_Draw,
};

static u8 D_808B90F0[2][2] = { { 0x01, 0x01 }, { 0x01, 0x00 } };

static f32 D_808B90F4[] = {
    0.1f,
    0.1f,
};

static UNK_TYPE D_808B90FC[] = {
    0x06002FE4,
    0x0600261C,
};

static u32 D_808B9104[] = {
    0,
    0,
};

static BgSpot18ObjInitFunc D_808B910C[] = {
    func_808B8A98,
    func_808B8910,
    func_808B8A5C,
    func_808B8B08,
};

static InitChainEntry sInitChain1[] = {
    ICHAIN_F32(minVelocityY, 65526, ICHAIN_CONTINUE),     ICHAIN_F32(gravity, 65532, ICHAIN_CONTINUE),
    ICHAIN_F32(uncullZoneForward, 1400, ICHAIN_CONTINUE), ICHAIN_F32(uncullZoneScale, 500, ICHAIN_CONTINUE),
    ICHAIN_F32(uncullZoneDownward, 800, ICHAIN_STOP),
};

static InitChainEntry sInitChain2[] = {
    ICHAIN_F32(uncullZoneForward, 1200, ICHAIN_CONTINUE),
    ICHAIN_F32(uncullZoneScale, 500, ICHAIN_CONTINUE),
    ICHAIN_F32(uncullZoneDownward, 700, ICHAIN_STOP),
};

static BgSpot18ObjInitFunc D_808B913C[] = {
    func_808B8BB4,
    func_808B8C90,
};

static Gfx* sDlists[] = {
    0x06002BC0,
    0x06002370,
};

s32 func_808B8910(BgSpot18Obj* this, GlobalContext* globalCtx) {
    s32 age;

    if (LINK_AGE_IN_YEARS == YEARS_ADULT) {
        age = 1;
    } else if (LINK_AGE_IN_YEARS == YEARS_CHILD) {
        age = 0;
    } else {
        osSyncPrintf("Error : リンク年齢不詳 (%s %d)(arg_data 0x%04x)\n", "../z_bg_spot18_obj.c", 182,
                     this->dyna.actor.params);
        return 0;
    }

    switch (D_808B90F0[this->dyna.actor.params & 0xF][age]) {
        case 0:
        case 1:
            if (D_808B90F0[this->dyna.actor.params & 0xF][age] == 0) {
                osSyncPrintf("出現しない Object (0x%04x)\n", this->dyna.actor.params);
            }
            return D_808B90F0[this->dyna.actor.params & 0xF][age];
        case 2:
            osSyncPrintf("Error : Obj出現判定が設定されていない(%s %d)(arg_data 0x%04x)\n", "../z_bg_spot18_obj.c", 202,
                         this->dyna.actor.params);
            break;
        default:
            osSyncPrintf("Error : Obj出現判定失敗(%s %d)(arg_data 0x%04x)\n", "../z_bg_spot18_obj.c", 210,
                         this->dyna.actor.params);
    }
    return 0;
}

s32 func_808B8A5C(BgSpot18Obj* this, GlobalContext* globalCtx) {
    Actor_SetScale(&this->dyna.actor, D_808B90F4[this->dyna.actor.params & 0xF]);
    return 1;
}

s32 func_808B8A98(BgSpot18Obj* this, GlobalContext* globalCtx) {
    s32 pad[2];
    s32 localC = 0;

    DynaPolyInfo_SetActorMove(&this->dyna.actor, 0);
    DynaPolyInfo_Alloc(D_808B90FC[this->dyna.actor.params & 0xF], &localC);
    this->dyna.dynaPolyId = DynaPolyInfo_RegisterActor(globalCtx, &globalCtx->colCtx.dyna, &this->dyna.actor, localC);
    return 1;
}

s32 func_808B8B08(BgSpot18Obj* this, GlobalContext* globalCtx) {
    this->dyna.actor.flags |= D_808B9104[this->dyna.actor.params & 0xF];
    return 1;
}

s32 func_808B8B38(BgSpot18Obj* this, GlobalContext* globalCtx) {
    s32 i;

    for (i = 0; i < ARRAY_COUNT(D_808B910C); i++) {
        if (D_808B910C[i](this, globalCtx) == 0) {
            return 0;
        }
    }
    return 1;
}

s32 func_808B8BB4(BgSpot18Obj* this, GlobalContext* globalCtx) {
    Actor_ProcessInitChain(&this->dyna.actor, sInitChain1);

    if (LINK_AGE_IN_YEARS == YEARS_CHILD) {
        func_808B9030(this);
    } else if (Flags_GetSwitch(globalCtx, (this->dyna.actor.params >> 8) & 0x3F)) {
        func_808B9030(this);
        this->dyna.actor.posRot.pos.x =
            (Math_Sins(this->dyna.actor.posRot.rot.y) * 80.0f) + this->dyna.actor.initPosRot.pos.x;
        this->dyna.actor.posRot.pos.z =
            (Math_Coss(this->dyna.actor.posRot.rot.y) * 80.0f) + this->dyna.actor.initPosRot.pos.z;
    } else {
        func_808B8E64(this);
    }
    return 1;
}

s32 func_808B8C90(BgSpot18Obj* this, GlobalContext* globalCtx) {
    Actor_ProcessInitChain(&this->dyna.actor, sInitChain2);
    func_808B8DC0(this);
    return 1;
}

s32 func_808B8CC8(BgSpot18Obj* this, GlobalContext* globalCtx) {
    if ((D_808B913C[this->dyna.actor.params & 0xF] != NULL) &&
        (!D_808B913C[this->dyna.actor.params & 0xF](this, globalCtx))) {
        return 0;
    }
    return 1;
}

void BgSpot18Obj_Init(Actor* thisx, GlobalContext* globalCtx) {
    BgSpot18Obj* this = THIS;

    osSyncPrintf("Spot18 Object [arg_data : 0x%04x]\n", this->dyna.actor.params);
    if (!func_808B8B38(this, globalCtx)) {
        Actor_Kill(&this->dyna.actor);
    } else if (!func_808B8CC8(this, globalCtx)) {
        Actor_Kill(&this->dyna.actor);
    }
}

void BgSpot18Obj_Destroy(Actor* thisx, GlobalContext* globalCtx) {
    BgSpot18Obj* this = THIS;

    DynaPolyInfo_Free(globalCtx, &globalCtx->colCtx.dyna, this->dyna.dynaPolyId);
}

void func_808B8DC0(BgSpot18Obj* this) {
    this->actionFunc = func_808B8DD0;
}

void func_808B8DD0(BgSpot18Obj* this, GlobalContext* globalCtx) {
}

void func_808B8DDC(BgSpot18Obj* this, GlobalContext* globalCtx) {
    func_8002E4B4(globalCtx, &this->dyna.actor, 20.0f, 46.0f, 0.0f, 28);
}

void func_808B8E20(BgSpot18Obj* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;

    if (fabsf(this->dyna.unk_150) > 0.001f) {
        this->dyna.unk_150 = 0.0f;
        player->stateFlags2 &= ~0x10;
    }
}

void func_808B8E64(BgSpot18Obj* this) {
    this->unk_168 = 20;
    this->actionFunc = func_808B8E7C;
}

void func_808B8E7C(BgSpot18Obj* this, GlobalContext* globalCtx) {
    if (this->dyna.unk_150 < -0.001f) {
        if (this->unk_168 <= 0) {
            func_808B8EE0(this);
        }
    } else {
        this->unk_168 = 20;
    }
    func_808B8E20(this, globalCtx);
}

void func_808B8EE0(BgSpot18Obj* this) {
    this->actionFunc = func_808B8F08;
    this->dyna.actor.posRot.rot.y = 0;
    this->dyna.actor.speedXZ = 0.0f;
    this->dyna.actor.velocity.z = 0.0f;
    this->dyna.actor.velocity.y = 0.0f;
    this->dyna.actor.velocity.x = 0.0f;
}

void func_808B8F08(BgSpot18Obj* this, GlobalContext* globalCtx) {
    s32 pad;
    Player* player = PLAYER;

    Math_ApproxF(&this->dyna.actor.speedXZ, 1.2f, 0.1f);
    Actor_MoveForward(&this->dyna.actor);
    func_808B8DDC(this, globalCtx);

    if (Math3D_Dist2DSq(this->dyna.actor.posRot.pos.x, this->dyna.actor.posRot.pos.z, this->dyna.actor.initPosRot.pos.x,
                        this->dyna.actor.initPosRot.pos.z) >= 6400.0f) {
        func_808B9030(this);
        this->dyna.actor.posRot.pos.x =
            (Math_Sins(this->dyna.actor.posRot.rot.y) * 80.0f) + this->dyna.actor.initPosRot.pos.x;
        this->dyna.actor.posRot.pos.z =
            (Math_Coss(this->dyna.actor.posRot.rot.y) * 80.0f) + this->dyna.actor.initPosRot.pos.z;
        this->dyna.unk_150 = 0.0f;
        player->stateFlags2 &= ~0x10;
        Flags_SetSwitch(globalCtx, (this->dyna.actor.params >> 8) & 0x3F);
        func_80078884(NA_SE_SY_CORRECT_CHIME);
        Audio_PlayActorSound2(&this->dyna.actor, NA_SE_EV_BLOCK_BOUND);
    } else {
        func_8002F974(&this->dyna.actor, NA_SE_EV_ROCK_SLIDE - SFX_FLAG);
    }
}

void func_808B9030(BgSpot18Obj* this) {
    this->actionFunc = func_808B9040;
}

void func_808B9040(BgSpot18Obj* this, GlobalContext* globalCtx) {
    func_808B8E20(this, globalCtx);
}

void BgSpot18Obj_Update(Actor* thisx, GlobalContext* globalCtx) {
    BgSpot18Obj* this = THIS;

    if (this->unk_168 > 0) {
        this->unk_168 -= 1;
    }
    this->actionFunc(this, globalCtx);
}

void BgSpot18Obj_Draw(Actor* thisx, GlobalContext* globalCtx) {
    Gfx_DrawDListOpa(globalCtx, sDlists[thisx->params & 0xF]);
}
