#include "z_bg_jya_bombchuiwa.h"
#include "overlays/effects/ovl_Effect_Ss_Kakera/z_eff_ss_kakera.h"

#define FLAGS 0x00000001

#define THIS ((BgJyaBombchuiwa*)thisx)

void BgJyaBombchuiwa_Init(Actor* thisx, GlobalContext* globalCtx);
void BgJyaBombchuiwa_Destroy(Actor* thisx, GlobalContext* globalCtx);
void BgJyaBombchuiwa_Update(Actor* thisx, GlobalContext* globalCtx);
void BgJyaBombchuiwa_Draw(Actor* thisx, GlobalContext* globalCtx);

void BgJyaBombchuiwa_WaitForExplosion(BgJyaBombchuiwa* this, GlobalContext* globalCtx);
void BgJyaBombchuiwa_SetupWaitForExplosion(BgJyaBombchuiwa* this, GlobalContext* globalCtx);
void func_808949B8(BgJyaBombchuiwa* this, GlobalContext* globalCtx);
void BgJyaBombchuiwa_CleanUpAfterExplosion(BgJyaBombchuiwa* this, GlobalContext* globalCtx);
void BgJyaBombchuiwa_SpawnLightRay(BgJyaBombchuiwa* this, GlobalContext* globalCtx);

const ActorInit Bg_Jya_Bombchuiwa_InitVars = {
    ACTOR_BG_JYA_BOMBCHUIWA,
    ACTORTYPE_BG,
    FLAGS,
    OBJECT_JYA_OBJ,
    sizeof(BgJyaBombchuiwa),
    (ActorFunc)BgJyaBombchuiwa_Init,
    (ActorFunc)BgJyaBombchuiwa_Destroy,
    (ActorFunc)BgJyaBombchuiwa_Update,
    (ActorFunc)BgJyaBombchuiwa_Draw,
};

static ColliderJntSphItemInit sJntSphItemsInit[1] = {
    {
        { 0x00, { 0x00000000, 0x00, 0x00 }, { 0x00000008, 0x00, 0x00 }, 0x00, 0x01, 0x01 },
        { 0, { { -300, 0, 0 }, 40 }, 100 },
    },
};

static ColliderJntSphInit sJntSphInit = {
    { COLTYPE_UNK10, 0x00, 0x09, 0x21, 0x20, COLSHAPE_JNTSPH },
    1,
    sJntSphItemsInit,
};

static InitChainEntry sInitChain[] = {
    ICHAIN_U8(unk_1F, 3, ICHAIN_CONTINUE),
    ICHAIN_VEC3F_DIV1000(scale, 100, ICHAIN_CONTINUE),
    ICHAIN_F32(uncullZoneForward, 1000, ICHAIN_CONTINUE),
    ICHAIN_F32(uncullZoneScale, 1000, ICHAIN_CONTINUE),
    ICHAIN_F32(uncullZoneDownward, 1000, ICHAIN_STOP),
};

extern Gfx D_0600EDC0[];
extern Gfx D_0600E8D0[];
extern Gfx D_060119B0[];
extern Gfx D_0600DC40[];
extern Gfx D_0600DB60[];

void BgJyaBombchuiwa_SetupCollider(BgJyaBombchuiwa* this, GlobalContext* globalCtx) {
    s32 pad;

    Collider_InitJntSph(globalCtx, &this->collider);
    Collider_SetJntSph(globalCtx, &this->collider, &this->actor, &sJntSphInit, &this->colliderItems);
}

void BgJyaBombchuiwa_SetDrawFlags(BgJyaBombchuiwa* this, u8 drawFlags) {
    this->drawFlags &= ~7;
    this->drawFlags |= drawFlags;
}

void BgJyaBombchuiwa_Init(Actor* thisx, GlobalContext* globalCtx) {
    BgJyaBombchuiwa* this = THIS;

    Actor_ProcessInitChain(thisx, &sInitChain);
    BgJyaBombchuiwa_SetupCollider(thisx, globalCtx);
    if (Flags_GetSwitch(globalCtx, thisx->params & 0x3F)) {
        BgJyaBombchuiwa_SpawnLightRay(this, globalCtx);
    } else {
        BgJyaBombchuiwa_SetupWaitForExplosion(this, globalCtx);
    }
    Actor_SetHeight(thisx, 0.0f);
}

void BgJyaBombchuiwa_Destroy(Actor* thisx, GlobalContext* globalCtx2) {
    GlobalContext* globalCtx = globalCtx2;
    BgJyaBombchuiwa* this = THIS;

    Collider_DestroyJntSph(globalCtx, &this->collider);
}

void BgJyaBombchuiwa_Break(BgJyaBombchuiwa* this, GlobalContext* globalCtx) {
    Vec3f pos;
    Vec3f velocity;
    s16 scale;
    s16 arg5;
    s16 arg6;
    s16 arg7;
    s32 i;

    for (i = 0; i < 20; i++) {
        pos.x = Math_Rand_ZeroOne() * 10.0f + this->actor.posRot.pos.x - 10.0f;
        pos.y = Math_Rand_ZeroOne() * 40.0f + this->actor.posRot.pos.y - 20.0f;
        pos.z = Math_Rand_ZeroOne() * 50.0f + this->actor.posRot.pos.z - 25.0f;
        velocity.x = Math_Rand_ZeroOne() * 3.0f - 0.3f;
        velocity.y = Math_Rand_ZeroOne() * 18.0f;
        velocity.z = (Math_Rand_ZeroOne() - 0.5f) * 15.0f;
        scale = (s32)(Math_Rand_ZeroOne() * 20.0f) + 1;
        if (scale > 10) {
            arg5 = 5;
        } else {
            arg5 = 1;
        }
        if (Math_Rand_ZeroOne() < 0.4f) {
            arg5 |= 0x40;
            arg6 = 0xC;
            arg7 = 8;
        } else {
            arg5 |= 0x20;
            arg6 = 0xC;
            arg7 = 8;
            if (scale < 8) {
                arg6 = 0x46;
                arg7 = 0x28;
            }
        }
        EffectSsKakera_Spawn(globalCtx, &pos, &velocity, &pos, -300, arg5, arg6, arg7, 0, scale, 1, 15, 80,
                             KAKERA_COLOR_NONE, OBJECT_JYA_OBJ, D_0600EDC0);
    }
    func_80033480(globalCtx, &this->actor.posRot.pos, 100.0f, 8, 100, 160, 0);
}

void BgJyaBombchuiwa_SetupWaitForExplosion(BgJyaBombchuiwa* this, GlobalContext* globalCtx) {
    this->actionFunc = BgJyaBombchuiwa_WaitForExplosion;
    BgJyaBombchuiwa_SetDrawFlags(this, 3);
    this->timer = 0;
}

void BgJyaBombchuiwa_WaitForExplosion(BgJyaBombchuiwa* this, GlobalContext* globalCtx) {
    if ((this->collider.base.acFlags & 2) || (this->timer > 0)) {
        if (this->timer == 0) {
            func_800800F8(globalCtx, 3410, -99, &this->actor, 0);
        }
        this->timer++;
        if (this->timer > 10) {
            BgJyaBombchuiwa_Break(this, globalCtx);
            BgJyaBombchuiwa_CleanUpAfterExplosion(this, globalCtx);
            Audio_PlaySoundAtPosition(globalCtx, &this->actor.posRot.pos, 40, NA_SE_EV_WALL_BROKEN);
        }
    } else {
        CollisionCheck_SetAC(globalCtx, &globalCtx->colChkCtx, &this->collider);
        CollisionCheck_SetOC(globalCtx, &globalCtx->colChkCtx, &this->collider);
    }
}

void BgJyaBombchuiwa_CleanUpAfterExplosion(BgJyaBombchuiwa* this, GlobalContext* globalCtx) {
    this->actionFunc = func_808949B8;
    BgJyaBombchuiwa_SetDrawFlags(this, 4);
    this->lightRayIntensity = 0.3f;
    this->timer = 0;
    this->actor.flags &= ~1;
}

void func_808949B8(BgJyaBombchuiwa* this, GlobalContext* globalCtx) {
    this->timer++;
    if (this->timer & 4) {
        func_80033480(globalCtx, &this->actor.posRot.pos, 60.0f, 3, 100, 100, 0);
    }
    if (Math_ApproxF(&this->lightRayIntensity, 1.0f, 0.028)) {
        BgJyaBombchuiwa_SpawnLightRay(this, globalCtx);
    }
}

void BgJyaBombchuiwa_SpawnLightRay(BgJyaBombchuiwa* this, GlobalContext* globalCtx) {
    this->actionFunc = NULL;
    this->lightRayIntensity = 153.0f;
    BgJyaBombchuiwa_SetDrawFlags(this, 4);
    if (Actor_Spawn(&globalCtx->actorCtx, globalCtx, ACTOR_MIR_RAY, this->actor.posRot.pos.x, this->actor.posRot.pos.y,
                    this->actor.posRot.pos.z, 0, 0, 0, 0) == NULL) {
        // Occurrence failure
        osSyncPrintf("Ｅｒｒｏｒ : Mir_Ray 発生失敗(%s %d)(arg_data 0x%04x)\n", "../z_bg_jya_bombchuiwa.c", 410,
                     this->actor.params);
    }
}

void BgJyaBombchuiwa_Update(Actor* thisx, GlobalContext* globalCtx) {
    BgJyaBombchuiwa* this = THIS;

    if (this->actionFunc != NULL) {
        this->actionFunc(this, globalCtx);
    }
}

void BgJyaBombchuiwa_DrawRock(GlobalContext* globalCtx) {
    OPEN_DISPS(globalCtx->state.gfxCtx, "../z_bg_jya_bombchuiwa.c", 436);
    func_80093D84(globalCtx->state.gfxCtx);
    gSPMatrix(POLY_XLU_DISP++, Matrix_NewMtx(globalCtx->state.gfxCtx, "../z_bg_jya_bombchuiwa.c", 439),
              G_MTX_NOPUSH | G_MTX_LOAD | G_MTX_MODELVIEW);
    gSPDisplayList(POLY_XLU_DISP++, D_060119B0);
    CLOSE_DISPS(globalCtx->state.gfxCtx, "../z_bg_jya_bombchuiwa.c", 443);
}

void BgJyaBombchuiwa_DrawLight(Actor* thisx, GlobalContext* globalCtx) {
    BgJyaBombchuiwa* this = THIS;

    OPEN_DISPS(globalCtx->state.gfxCtx, "../z_bg_jya_bombchuiwa.c", 453);
    func_80093D84(globalCtx->state.gfxCtx);
    gSPMatrix(POLY_XLU_DISP++, Matrix_NewMtx(globalCtx->state.gfxCtx, "../z_bg_jya_bombchuiwa.c", 457),
              G_MTX_NOPUSH | G_MTX_LOAD | G_MTX_MODELVIEW);
    gDPSetPrimColor(POLY_XLU_DISP++, 0, 0, 255, 255, 255, CLAMP_MAX((u32)(this->lightRayIntensity * 153.0f), 153));
    gSPDisplayList(POLY_XLU_DISP++, D_0600DC40);
    gDPPipeSync(POLY_XLU_DISP++);
    gDPSetPrimColor(POLY_XLU_DISP++, 0, 0, 255, 255, 255, CLAMP_MAX((u32)(this->lightRayIntensity * 255.0f), 255));
    gSPDisplayList(POLY_XLU_DISP++, D_0600DB60);
    CLOSE_DISPS(globalCtx->state.gfxCtx, "../z_bg_jya_bombchuiwa.c", 472);
}

void BgJyaBombchuiwa_Draw(Actor* thisx, GlobalContext* globalCtx) {
    static Vec3f D_80894F88 = { -920.0f, 480.0f, -889.0f };
    static Vec3s D_80894F94 = { 0, 0, 0 };
    BgJyaBombchuiwa* this = THIS;

    if (this->drawFlags & 1) {
        Gfx_DrawDListOpa(globalCtx, &D_0600E8D0);
        func_800628A4(0, &this->collider);
    }

    if (this->drawFlags & 2) {
        BgJyaBombchuiwa_DrawRock(globalCtx);
    }
    if (this->drawFlags & 4) {
        func_800D1694(D_80894F88.x, D_80894F88.y, D_80894F88.z, &D_80894F94);
        Matrix_Scale(this->actor.scale.x, this->actor.scale.y, this->actor.scale.z, MTXMODE_APPLY);
        if (this->drawFlags & 4) {
            BgJyaBombchuiwa_DrawLight(thisx, globalCtx);
        }
    }
}
