/*
 * File: z_en_horse_ganon.c
 * Overlay: ovl_En_Horse_Ganon
 * Description: Ganondorf's Horse
 */

#include "z_en_horse_ganon.h"

#define FLAGS 0x00000010

#define THIS ((EnHorseGanon*)thisx)

typedef struct {
    /* 0x0 */ Vec3s unk_0;
    /* 0x6 */ u8 unk_6;
} unk_D_80A69248; // size = 0x8

void EnHorseGanon_Init(Actor* thisx, GlobalContext* globalCtx);
void EnHorseGanon_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnHorseGanon_Update(Actor* thisx, GlobalContext* globalCtx);
void EnHorseGanon_Draw(Actor* thisx, GlobalContext* globalCtx);

void func_80A68AC4(EnHorseGanon* this);
void func_80A68AF0(EnHorseGanon* this, GlobalContext* globalCtx);
void func_80A68DB0(EnHorseGanon* this, GlobalContext* globalCtx);

const ActorInit En_Horse_Ganon_InitVars = {
    ACTOR_EN_HORSE_GANON,
    ACTORCAT_BG,
    FLAGS,
    OBJECT_HORSE_GANON,
    sizeof(EnHorseGanon),
    (ActorFunc)EnHorseGanon_Init,
    (ActorFunc)EnHorseGanon_Destroy,
    (ActorFunc)EnHorseGanon_Update,
    (ActorFunc)EnHorseGanon_Draw,
};

static AnimationHeader* D_80A691B0[] = { 0x06004AA4, 0x06005264, 0x06005B78, 0x06002CE4, 0x06002650, 0x06003858 };

static f32 splaySpeeds[] = { 0.66666666f, 0.66666666f, 1.0f, 1.0f, 1.0f, 0.66666666f };

static ColliderCylinderInit sCylinderInit = {
    {
        COLTYPE_NONE,
        AT_NONE,
        AC_NONE,
        OC1_ON | OC1_TYPE_ALL,
        OC2_TYPE_1 | OC2_UNK1,
        COLSHAPE_CYLINDER,
    },
    {
        ELEMTYPE_UNK0,
        { 0x00000000, 0x00, 0x00 },
        { 0x00000000, 0x00, 0x00 },
        TOUCH_NONE,
        BUMP_NONE,
        OCELEM_ON,
    },
    { 40, 100, 0, { 0, 0, 0 } },
};

static ColliderJntSphElementInit sJntSphElementsInit[] = {
    {
        {
            ELEMTYPE_UNK0,
            { 0x00000000, 0x00, 0x00 },
            { 0x00000000, 0x00, 0x00 },
            TOUCH_NONE,
            BUMP_NONE,
            OCELEM_ON,
        },
        { 13, { { 0, 0, 0 }, 20 }, 100 },
    },
};

static ColliderJntSphInit sJntSphInit = {
    {
        COLTYPE_NONE,
        AT_NONE,
        AC_ON | AC_TYPE_PLAYER,
        OC1_ON | OC1_TYPE_ALL,
        OC2_TYPE_1 | OC2_UNK1,
        COLSHAPE_JNTSPH,
    },
    1,
    sJntSphElementsInit,
};

static CollisionCheckInfoInit sColChkInfoInit = { 10, 35, 100, MASS_HEAVY };

static unk_D_80A69248 D_80A69248[] = {
    { 0x09B8, 0x0126, 0x0E2C, 0x07 }, { 0x0C11, 0x017A, 0x1269, 0x07 }, { 0x064E, 0xFEFB, 0x1DAC, 0x07 },
    { 0x02F2, 0xFF45, 0x244F, 0x07 }, { 0xF96E, 0xFE0C, 0x3122, 0x07 }, { 0xF328, 0xFE0C, 0x32D5, 0x07 },
    { 0xEBEA, 0xFE5F, 0x2D6E, 0x07 }, { 0xE95E, 0xFE27, 0x2565, 0x07 }, { 0xE593, 0xFE0C, 0x20AC, 0x07 },
    { 0xE625, 0xFE77, 0x1B07, 0x07 }, { 0xEBB7, 0x007C, 0x1539, 0x07 }, { 0xF466, 0x0002, 0x11B9, 0x07 },
    { 0xF47B, 0xFFDD, 0x11AF, 0x07 }, { 0xF88D, 0xFFD1, 0x0BA2, 0x07 },
};

static s32 D_80A692B8[] = { 0, 16 };

static InitChainEntry sInitChain[] = {
    ICHAIN_F32(uncullZoneScale, 1200, ICHAIN_STOP),
};

static EnHorseGanonActionFunc sActionFuncs[] = { func_80A68AF0, func_80A68DB0 };

extern SkeletonHeader D_06008668;
extern AnimationHeader D_06004AA4;

void func_80A68660(unk_D_80A69248* data, s32 index, Vec3f* vec) {
    vec->x = data[index].unk_0.x;
    vec->y = data[index].unk_0.y;
    vec->z = data[index].unk_0.z;
}

void func_80A686A8(EnHorseGanon* this, GlobalContext* globalCtx) {
    Vec3f* tempPos;
    Vec3f vec;
    s16 y;

    func_80A68660(D_80A69248, this->unk_1EC, &vec);
    if (Math3D_Vec3f_DistXYZ(&vec, &this->actor.world.pos) <= 400.0f) {
        this->unk_1EC += 1;
        if (this->unk_1EC >= 14) {
            this->unk_1EC = 0;
            func_80A68660(D_80A69248, 0, &vec);
        }
    }

    tempPos = &this->actor.world.pos;
    y = Math_Vec3f_Yaw(tempPos, &vec) - this->actor.world.rot.y;
    if (y >= 301) {
        this->actor.world.rot.y += 300;
    } else if (y < -300) {
        this->actor.world.rot.y -= 300;
    } else {
        this->actor.world.rot.y += y;
    }
    this->actor.shape.rot.y = this->actor.world.rot.y;

    if (Actor_WorldDistXZToActor(&this->actor, &PLAYER->actor) <= 300.0f) {
        if (this->actor.speedXZ < 12.0f) {
            this->actor.speedXZ += 1.0f;
        } else {
            this->actor.speedXZ -= 1.0f;
        }
    } else if (this->actor.speedXZ < D_80A69248[this->unk_1EC].unk_6) {
        this->actor.speedXZ += 0.5f;
    } else {
        this->actor.speedXZ -= 0.5f;
    }
}

void func_80A68870(EnHorseGanon* this) {
    if ((this->skin.skelAnime.curFrame > D_80A692B8[this->soundCount]) &&
        (this->soundCount != 0 || !(this->skin.skelAnime.curFrame > D_80A692B8[1]))) {
        Audio_PlaySoundGeneral(NA_SE_EV_HORSE_WALK, &this->actor.projectedPos, 4, &D_801333E0, &D_801333E0,
                               &D_801333E8);

        this->soundCount++;
        if (this->soundCount >= 2) {
            this->soundCount = 0;
        }
    }
}

void EnHorseGanon_Init(Actor* thisx, GlobalContext* globalCtx) {
    EnHorseGanon* this = THIS;

    Actor_ProcessInitChain(&this->actor, sInitChain);
    Actor_SetScale(&this->actor, 0.0115f);

    this->actor.gravity = -3.5f;

    ActorShape_Init(&this->actor.shape, 0.0f, ActorShadow_DrawHorse, 20.0f);
    this->actor.speedXZ = 0.0f;
    this->actor.focus.pos = this->actor.world.pos;
    this->action = 0;
    this->actor.focus.pos.y += 70.0f;
    func_800A663C(globalCtx, &this->skin, &D_06008668, &D_06004AA4);
    this->currentAnimation = 0;
    Animation_PlayOnce(&this->skin.skelAnime, D_80A691B0[0]);

    Collider_InitCylinder(globalCtx, &this->colliderBody);
    Collider_SetCylinder(globalCtx, &this->colliderBody, &this->actor, &sCylinderInit);
    Collider_InitJntSph(globalCtx, &this->colliderHead);
    Collider_SetJntSph(globalCtx, &this->colliderHead, &this->actor, &sJntSphInit, this->headElements);

    CollisionCheck_SetInfo(&this->actor.colChkInfo, 0, &sColChkInfoInit);
    func_80A68AC4(this);
}

void EnHorseGanon_Destroy(Actor* thisx, GlobalContext* globalCtx) {
    EnHorseGanon* this = THIS;

    func_800A6888(globalCtx, &this->skin);
    Collider_DestroyCylinder(globalCtx, &this->colliderBody);
    Collider_DestroyJntSph(globalCtx, &this->colliderHead);
}

void func_80A68AC4(EnHorseGanon* this) {
    this->action = 0;
    Animation_PlayLoop(&this->skin.skelAnime, D_80A691B0[4]);
}

void func_80A68AF0(EnHorseGanon* this, GlobalContext* globalCtx) {
    this->actor.speedXZ = 0.0f;
    SkelAnime_Update(&this->skin.skelAnime);
}

void func_80A68B20(EnHorseGanon* this) {
    s32 animationChanged;
    f32 sp30;

    animationChanged = 0;
    this->action = 1;
    if (this->actor.speedXZ <= 3.0f) {
        if (this->currentAnimation != 2) {
            animationChanged = 1;
        }
        this->currentAnimation = 2;
    } else if (this->actor.speedXZ <= 6.0f) {
        if (this->currentAnimation != 3) {
            animationChanged = 1;
        }
        this->currentAnimation = 3;
    } else {
        if (this->currentAnimation != 4) {
            animationChanged = 1;
        }
        this->currentAnimation = 4;
    }

    if (this->currentAnimation == 2) {
        sp30 = this->actor.speedXZ / 3.0f;
    } else if (this->currentAnimation == 3) {
        sp30 = this->actor.speedXZ / 5.0f;
        Audio_PlaySoundGeneral(NA_SE_EV_HORSE_RUN, &this->actor.projectedPos, 4, &D_801333E0, &D_801333E0, &D_801333E8);
    } else if (this->currentAnimation == 4) {
        sp30 = this->actor.speedXZ / 7.0f;
        Audio_PlaySoundGeneral(NA_SE_EV_HORSE_RUN, &this->actor.projectedPos, 4, &D_801333E0, &D_801333E0, &D_801333E8);
    } else {
        sp30 = 1.0f;
    }

    if (animationChanged == 1) {
        Animation_Change(&this->skin.skelAnime, D_80A691B0[this->currentAnimation],
                         splaySpeeds[this->currentAnimation] * sp30 * 1.5f, 0.0f,
                         Animation_GetLastFrame(D_80A691B0[this->currentAnimation]), ANIMMODE_ONCE, -3.0f);
    } else {
        Animation_Change(&this->skin.skelAnime, D_80A691B0[this->currentAnimation],
                         splaySpeeds[this->currentAnimation] * sp30 * 1.5f, 0.0f,
                         Animation_GetLastFrame(D_80A691B0[this->currentAnimation]), ANIMMODE_ONCE, 0.0f);
    }
}

void func_80A68DB0(EnHorseGanon* this, GlobalContext* globalCtx) {
    if (this->currentAnimation == 2) {
        func_80A68870(this);
    }

    func_80A686A8(this, globalCtx);

    if (SkelAnime_Update(&this->skin.skelAnime) != 0) {
        func_80A68B20(this);
    }
}

void func_80A68E14(EnHorseGanon* this, GlobalContext* globalCtx) {
    s32 pad;
    CollisionPoly* col;
    f32 temp_ret;
    Vec3f v;
    s32 temp1;

    v.x = Math_SinS(this->actor.shape.rot.y) * 30.0f + this->actor.world.pos.x;
    v.y = this->actor.world.pos.y + 60.0f;
    v.z = Math_CosS(this->actor.shape.rot.y) * 30.0f + this->actor.world.pos.z;

    temp_ret = BgCheck_EntityRaycastFloor3(&globalCtx->colCtx, &col, &temp1, &v);

    this->unk_1F4 = temp_ret;
    this->actor.shape.rot.x = 10430.3779f * Math_FAtan2F(this->actor.world.pos.y - temp_ret, 30.0f);
}

void EnHorseGanon_Update(Actor* thisx, GlobalContext* globalCtx) {
    EnHorseGanon* this = THIS;
    s32 pad;

    sActionFuncs[this->action](this, globalCtx);
    Actor_MoveForward(&this->actor);
    Actor_UpdateBgCheckInfo(globalCtx, &this->actor, 20.0f, 55.0f, 100.0f, 29);
    this->actor.focus.pos = this->actor.world.pos;
    this->actor.focus.pos.y += 70.0f;
    Collider_UpdateCylinder(&this->actor, &this->colliderBody);
    CollisionCheck_SetOC(globalCtx, &globalCtx->colChkCtx, &this->colliderBody.base);
}

void func_80A68FA8(Actor* thisx, GlobalContext* globalCtx, PSkinAwb* skin) {
    Vec3f sp4C;
    Vec3f sp40;
    EnHorseGanon* this = THIS;
    s32 index;

    for (index = 0; index < this->colliderHead.count; index++) {
        sp4C.x = this->colliderHead.elements[index].dim.modelSphere.center.x;
        sp4C.y = this->colliderHead.elements[index].dim.modelSphere.center.y;
        sp4C.z = this->colliderHead.elements[index].dim.modelSphere.center.z;

        func_800A6408(skin, this->colliderHead.elements[index].dim.limb, &sp4C, &sp40);

        this->colliderHead.elements[index].dim.worldSphere.center.x = sp40.x;
        this->colliderHead.elements[index].dim.worldSphere.center.y = sp40.y;
        this->colliderHead.elements[index].dim.worldSphere.center.z = sp40.z;

        this->colliderHead.elements[index].dim.worldSphere.radius =
            this->colliderHead.elements[index].dim.modelSphere.radius * this->colliderHead.elements[index].dim.scale;
    }
    CollisionCheck_SetOC(globalCtx, &globalCtx->colChkCtx, &this->colliderHead.base);
}

void EnHorseGanon_Draw(Actor* thisx, GlobalContext* globalCtx) {
    EnHorseGanon* this = THIS;

    func_80A68E14(this, globalCtx);
    func_80093D18(globalCtx->state.gfxCtx);
    func_800A6330(&this->actor, globalCtx, &this->skin, func_80A68FA8, 1);
}
