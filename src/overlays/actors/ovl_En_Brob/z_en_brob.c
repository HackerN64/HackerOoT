/*
 * File: z_en_brob.c
 * Overlay: ovl_En_Brob
 * Description: Flobbery Muscle Block (Jabu-Jabu's Belly)
 */

#include "z_en_brob.h"

#define FLAGS 0x00000005

#define THIS ((EnBrob*)thisx)

void EnBrob_Init(Actor* thisx, GlobalContext* globalCtx);
void EnBrob_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnBrob_Update(Actor* thisx, GlobalContext* globalCtx);
void EnBrob_Draw(Actor* thisx, GlobalContext* globalCtx);

void func_809CADDC(EnBrob* this, GlobalContext* globalCtx);
void func_809CB054(EnBrob* this, GlobalContext* globalCtx);
void func_809CB114(EnBrob* this, GlobalContext* globalCtx);
void func_809CB218(EnBrob* this, GlobalContext* globalCtx);
void func_809CB2B8(EnBrob* this, GlobalContext* globalCtx);
void func_809CB354(EnBrob* this, GlobalContext* globalCtx);
void func_809CB458(EnBrob* this, GlobalContext* globalCtx);

extern AnimationHeader D_06000290;
extern FlexSkeletonHeader D_060015D8;
extern AnimationHeader D_06001678;
extern AnimationHeader D_06001750;
extern AnimationHeader D_06001958;
extern CollisionHeader D_06001A70;

const ActorInit En_Brob_InitVars = {
    ACTOR_EN_BROB,
    ACTORCAT_ENEMY,
    FLAGS,
    OBJECT_BROB,
    sizeof(EnBrob),
    (ActorFunc)EnBrob_Init,
    (ActorFunc)EnBrob_Destroy,
    (ActorFunc)EnBrob_Update,
    (ActorFunc)EnBrob_Draw,
};

static ColliderCylinderInit sCylinderInit = {
    {
        COLTYPE_HIT0,
        AT_ON | AT_TYPE_ENEMY,
        AC_ON | AC_TYPE_PLAYER,
        OC1_ON | OC1_TYPE_ALL,
        OC2_TYPE_1,
        COLSHAPE_CYLINDER,
    },
    {
        ELEMTYPE_UNK1,
        { 0xFFCFFFFF, 0x03, 0x08 },
        { 0xFFCFFFFF, 0x01, 0x00 },
        TOUCH_ON | TOUCH_SFX_NONE,
        BUMP_ON,
        OCELEM_ON,
    },
    { 8000, 11000, -5000, { 0, 0, 0 } },
};

static CollisionCheckInfoInit sColChkInfoInit = { 0, 60, 120, MASS_IMMOVABLE };

void EnBrob_Init(Actor* thisx, GlobalContext* globalCtx) {
    s32 pad;
    EnBrob* this = THIS;
    CollisionHeader* colHeader = NULL;

    SkelAnime_InitFlex(globalCtx, &this->skelAnime, &D_060015D8, &D_06001750, this->jointTable, this->morphTable, 10);
    DynaPolyActor_Init(&this->dyna, DPM_UNK);
    CollisionHeader_GetVirtual(&D_06001A70, &colHeader);
    this->dyna.bgId = DynaPoly_SetBgActor(globalCtx, &globalCtx->colCtx.dyna, thisx, colHeader);
    Collider_InitCylinder(globalCtx, &this->colliders[0]);
    Collider_SetCylinder(globalCtx, &this->colliders[0], &this->dyna.actor, &sCylinderInit);
    Collider_InitCylinder(globalCtx, &this->colliders[1]);
    Collider_SetCylinder(globalCtx, &this->colliders[1], &this->dyna.actor, &sCylinderInit);
    CollisionCheck_SetInfo(&thisx->colChkInfo, NULL, &sColChkInfoInit);
    if (((thisx->params >> 8) & 0xFF) == 0) {
        Actor_SetScale(&this->dyna.actor, 0.01f);
        thisx->params &= 0xFF;
        if (thisx->params != 0xFF) {
            thisx->scale.y *= (thisx->params & 0xFF) * (1.0f / 30.0f);
        }
    } else {
        Actor_SetScale(&this->dyna.actor, 0.005f);
        thisx->params &= 0xFF;
        if (thisx->params != 0xFF) {
            thisx->scale.y *= (thisx->params & 0xFF) * (2.0f / 30.0f);
        }
    }
    this->colliders[0].dim.radius *= thisx->scale.x;
    this->colliders[0].dim.height = thisx->scale.y * 12000.0f;
    this->colliders[0].dim.yShift = 0;
    this->colliders[1].dim.radius *= thisx->scale.x;
    this->colliders[1].dim.height *= thisx->scale.y;
    this->colliders[1].dim.yShift *= thisx->scale.y;
    this->actionFunc = NULL;
    thisx->flags &= ~1;
    func_809CADDC(this, globalCtx);
}

void EnBrob_Destroy(Actor* thisx, GlobalContext* globalCtx) {
    EnBrob* this = THIS;

    DynaPoly_DeleteBgActor(globalCtx, &globalCtx->colCtx.dyna, this->dyna.bgId);
    Collider_DestroyCylinder(globalCtx, &this->colliders[0]);
    Collider_DestroyCylinder(globalCtx, &this->colliders[1]);
}

void func_809CADDC(EnBrob* this, GlobalContext* globalCtx) {
    func_8003EC50(globalCtx, &globalCtx->colCtx.dyna, this->dyna.bgId);
    this->timer = this->actionFunc == func_809CB2B8 ? 200 : 0;
    this->unk_1AE = 0;
    this->actionFunc = func_809CB054;
}

void func_809CAE44(EnBrob* this, GlobalContext* globalCtx) {
    Animation_PlayOnce(&this->skelAnime, &D_06001750);
    func_8003EBF8(globalCtx, &globalCtx->colCtx.dyna, this->dyna.bgId);
    this->unk_1AE = 1000;
    this->actionFunc = func_809CB114;
}

void func_809CAEA0(EnBrob* this) {
    Animation_MorphToLoop(&this->skelAnime, &D_06001958, -5.0f);
    this->unk_1AE = 8000;
    this->timer = 1200;
    this->actionFunc = func_809CB218;
}

void func_809CAEF4(EnBrob* this) {
    Animation_MorphToPlayOnce(&this->skelAnime, &D_06000290, -5.0f);
    this->unk_1AE -= 125.0f;
    Actor_SetColorFilter(&this->dyna.actor, 0, 0xFF, 0, 0x50);
    Audio_PlayActorSound2(&this->dyna.actor, NA_SE_EN_GOMA_JR_FREEZE);
    this->actionFunc = func_809CB2B8;
}

void func_809CAF88(EnBrob* this) {
    Animation_Change(&this->skelAnime, &D_06001750, -1.0f, Animation_GetLastFrame(&D_06001750), 0.0f, ANIMMODE_ONCE,
                     -5.0f);
    this->unk_1AE = 8250;
    this->actionFunc = func_809CB354;
}

void func_809CB008(EnBrob* this) {
    Animation_MorphToLoop(&this->skelAnime, &D_06001678, -5.0f);
    this->timer = 10;
    this->actionFunc = func_809CB458;
}

void func_809CB054(EnBrob* this, GlobalContext* globalCtx) {
    if (this->timer != 0) {
        this->timer--;
    }
    if (this->timer == 0) {
        if (func_8004356C(&this->dyna) != 0) {
            func_8002F71C(globalCtx, &this->dyna.actor, 5.0f, this->dyna.actor.yawTowardsPlayer, 1.0f);
            func_809CAE44(this, globalCtx);
        } else if (this->dyna.actor.xzDistToPlayer < 300.0f) {
            func_809CAE44(this, globalCtx);
        }
    } else if (this->timer >= 81) {
        this->dyna.actor.colorFilterTimer = 80;
    }
}

void func_809CB114(EnBrob* this, GlobalContext* globalCtx) {
    f32 curFrame;

    if (SkelAnime_Update(&this->skelAnime)) {
        func_809CAEA0(this);
    } else {
        curFrame = this->skelAnime.curFrame;
        if (curFrame < 8.0f) {
            this->unk_1AE += 1000.0f;
        } else if (curFrame < 12.0f) {
            this->unk_1AE += 250.0f;
        } else {
            this->unk_1AE -= 250.0f;
        }
    }
}

void func_809CB218(EnBrob* this, GlobalContext* globalCtx) {
    SkelAnime_Update(&this->skelAnime);
    if (Animation_OnFrame(&this->skelAnime, 6.0f) || Animation_OnFrame(&this->skelAnime, 15.0f)) {
        Audio_PlayActorSound2(&this->dyna.actor, NA_SE_EN_BROB_WAVE);
    }
    if (this->timer != 0) {
        this->timer--;
    }
    if ((this->timer == 0) && (this->dyna.actor.xzDistToPlayer > 500.0f)) {
        func_809CAF88(this);
    }
}

void func_809CB2B8(EnBrob* this, GlobalContext* globalCtx) {
    if (SkelAnime_Update(&this->skelAnime)) {
        func_809CADDC(this, globalCtx);
    } else if (this->skelAnime.curFrame < 8.0f) {
        this->unk_1AE -= 1250.0f;
    }
    this->dyna.actor.colorFilterTimer = 0x50;
}

void func_809CB354(EnBrob* this, GlobalContext* globalCtx) {
    f32 curFrame;

    if (SkelAnime_Update(&this->skelAnime)) {
        func_809CADDC(this, globalCtx);
    } else {
        curFrame = this->skelAnime.curFrame;
        if (curFrame < 8.0f) {
            this->unk_1AE -= 1000.0f;
        } else if (curFrame < 12.0f) {
            this->unk_1AE -= 250.0f;
        } else {
            this->unk_1AE += 250.0f;
        }
    }
}

void func_809CB458(EnBrob* this, GlobalContext* globalCtx) {
    Vec3f pos;
    f32 dist1;
    f32 dist2;
    s32 i;

    SkelAnime_Update(&this->skelAnime);
    if (Animation_OnFrame(&this->skelAnime, 0) && (this->timer != 0)) {
        this->timer--;
    }

    dist1 = globalCtx->gameplayFrames % 2 ? 0.0f : this->dyna.actor.scale.x * 5500.0f;
    dist2 = this->dyna.actor.scale.x * 5500.0f;

    for (i = 0; i < 4; i++) {
        static Color_RGBA8 primColor = { 255, 255, 255, 255 };
        static Color_RGBA8 envColor = { 200, 255, 255, 255 };

        if (i % 2) {
            pos.x = this->dyna.actor.world.pos.x + dist1;
            pos.z = this->dyna.actor.world.pos.z + dist2;
        } else {
            pos.x = this->dyna.actor.world.pos.x + dist2;
            pos.z = this->dyna.actor.world.pos.z + dist1;
            dist1 = -dist1;
            dist2 = -dist2;
        }
        pos.y = (((Rand_ZeroOne() * 15000.0f) + 1000.0f) * this->dyna.actor.scale.y) + this->dyna.actor.world.pos.y;
        EffectSsLightning_Spawn(globalCtx, &pos, &primColor, &envColor, this->dyna.actor.scale.y * 8000.0f,
                                Rand_ZeroOne() * 65536.0f, 4, 1);
    }

    if (this->timer == 0) {
        func_809CAEA0(this);
    }
}

void EnBrob_Update(Actor* thisx, GlobalContext* globalCtx2) {
    GlobalContext* globalCtx = globalCtx2;
    EnBrob* this = THIS;
    s32 i;
    s32 acHits[2];

    acHits[0] = (this->colliders[0].base.acFlags & AC_HIT) != 0;
    acHits[1] = (this->colliders[1].base.acFlags & AC_HIT) != 0;
    if ((acHits[0] && (this->colliders[0].info.acHitInfo->toucher.dmgFlags & 0x10)) ||
        (acHits[1] && (this->colliders[1].info.acHitInfo->toucher.dmgFlags & 0x10))) {

        for (i = 0; i < 2; i++) {
            this->colliders[i].base.atFlags &= ~(AT_HIT | AT_BOUNCED);
            this->colliders[i].base.acFlags &= ~AC_HIT;
        }

        func_809CAEF4(this);
    } else if ((this->colliders[0].base.atFlags & AT_HIT) || (this->colliders[1].base.atFlags & AT_HIT) ||
               (acHits[0] && (this->colliders[0].info.acHitInfo->toucher.dmgFlags & 0x100)) ||
               (acHits[1] && (this->colliders[1].info.acHitInfo->toucher.dmgFlags & 0x100))) {

        if (this->actionFunc == func_809CB114 && !(this->colliders[0].base.atFlags & AT_BOUNCED) &&
            !(this->colliders[1].base.atFlags & AT_BOUNCED)) {
            func_8002F71C(globalCtx, &this->dyna.actor, 5.0f, this->dyna.actor.yawTowardsPlayer, 1.0f);
        } else if (this->actionFunc != func_809CB114) {
            func_809CB008(this);
        }

        for (i = 0; i < 2; i++) {
            this->colliders[i].base.atFlags &= ~(AT_HIT | AT_BOUNCED);
            this->colliders[i].base.acFlags &= ~AC_HIT;
        }
    }
    this->actionFunc(this, globalCtx);
    if (this->actionFunc != func_809CB054 && this->actionFunc != func_809CB354) {
        if (this->actionFunc != func_809CB2B8) {
            CollisionCheck_SetAT(globalCtx, &globalCtx->colChkCtx, &this->colliders[0].base);
            CollisionCheck_SetAT(globalCtx, &globalCtx->colChkCtx, &this->colliders[1].base);
            if (this->actionFunc != func_809CB114) {
                CollisionCheck_SetAC(globalCtx, &globalCtx->colChkCtx, &this->colliders[0].base);
                CollisionCheck_SetAC(globalCtx, &globalCtx->colChkCtx, &this->colliders[1].base);
            }
        }
        CollisionCheck_SetOC(globalCtx, &globalCtx->colChkCtx, &this->colliders[0].base);
        CollisionCheck_SetOC(globalCtx, &globalCtx->colChkCtx, &this->colliders[1].base);
    }
}

void EnBrob_PostLimbDraw(GlobalContext* globalCtx, s32 limbIndex, Gfx** dList, Vec3s* rot, void* thisx) {
    EnBrob* this = THIS;
    MtxF mtx;

    Matrix_Get(&mtx);
    if (limbIndex == 3) {
        this->colliders[0].dim.pos.x = mtx.wx;
        this->colliders[0].dim.pos.y = mtx.wy;
        this->colliders[0].dim.pos.z = mtx.wz;
    } else if (limbIndex == 8) {
        this->colliders[1].dim.pos.x = mtx.wx;
        this->colliders[1].dim.pos.y = (mtx.wy + 7.0f);
        this->colliders[1].dim.pos.z = mtx.wz;
    }
}

void EnBrob_Draw(Actor* thisx, GlobalContext* globalCtx) {
    EnBrob* this = THIS;

    func_80093D18(globalCtx->state.gfxCtx);
    Matrix_Translate(0.0f, this->unk_1AE, 0.0f, MTXMODE_APPLY);
    SkelAnime_DrawFlexOpa(globalCtx, this->skelAnime.skeleton, this->skelAnime.jointTable, this->skelAnime.dListCount,
                          NULL, EnBrob_PostLimbDraw, this);
}
