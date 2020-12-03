/*
 * File: z_en_dha.c
 * Overlay: ovl_En_Dha
 * Description: Dead Hand's Hand
 */

#include "z_en_dha.h"
#include "overlays/actors/ovl_En_Dh/z_en_dh.h"

#define FLAGS 0x00000015

#define THIS ((EnDha*)thisx)

void EnDha_Init(Actor* thisx, GlobalContext* globalCtx);
void EnDha_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnDha_Update(Actor* thisx, GlobalContext* globalCtx);
void EnDha_Draw(Actor* thisx, GlobalContext* globalCtx);

void func_809EC9C8(EnDha* this);
void func_809ECA50(EnDha* this, GlobalContext* globalCtx);
void func_809ECF60(EnDha* this);
void func_809ECF8C(EnDha* this, GlobalContext* globalCtx);
void EnDha_SetupDeath(EnDha* this);
void EnDha_Die(EnDha* this, GlobalContext* globalCtx);
void EnDha_UpdateHealth(EnDha* this, GlobalContext* globalCtx);

const ActorInit En_Dha_InitVars = {
    ACTOR_EN_DHA,
    ACTORTYPE_ENEMY,
    FLAGS,
    OBJECT_DH,
    sizeof(EnDha),
    (ActorFunc)EnDha_Init,
    (ActorFunc)EnDha_Destroy,
    (ActorFunc)EnDha_Update,
    (ActorFunc)EnDha_Draw,
};

static DamageTable sDamageTable = { {
    0x00, 0xF2, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF2, 0xF2, 0xF4, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF2, 0xF4, 0xF2, 0xF4, 0xF8, 0xF4, 0x00, 0x00, 0xF4, 0x00,
} };

static ColliderJntSphItemInit sJntSphItemsInit[] = {
    {
        { 0x00, { 0x00000000, 0x00, 0x00 }, { 0xFFCFFFFF, 0x00, 0x00 }, 0x00, 0x01, 0x00 },
        { 1, { { 0, 0, 0 }, 12 }, 100 },
    },
    {
        { 0x00, { 0x00000000, 0x00, 0x00 }, { 0xFFCFFFFF, 0x00, 0x00 }, 0x00, 0x01, 0x01 },
        { 2, { { 3200, 0, 0 }, 10 }, 100 },
    },
    {
        { 0x00, { 0x00000000, 0x00, 0x00 }, { 0xFFCFFFFF, 0x00, 0x00 }, 0x00, 0x01, 0x01 },
        { 3, { { 1200, 0, 0 }, 10 }, 100 },
    },
    {
        { 0x00, { 0x00000000, 0x00, 0x00 }, { 0xFFCFFFFF, 0x00, 0x00 }, 0x00, 0x01, 0x00 },
        { 4, { { 2700, 0, 0 }, 10 }, 100 },
    },
    {
        { 0x00, { 0x00000000, 0x00, 0x00 }, { 0xFFCFFFFF, 0x00, 0x00 }, 0x00, 0x01, 0x01 },
        { 5, { { 1200, 0, 0 }, 10 }, 100 },
    },
};

static ColliderJntSphInit sJntSphInit = {
    { COLTYPE_UNK6, 0x00, 0x09, 0x19, 0x10, COLSHAPE_JNTSPH },
    5,
    sJntSphItemsInit,
};

static InitChainEntry sInitChain[] = {
    ICHAIN_S8(naviEnemyId, 0x2E, ICHAIN_CONTINUE),
    ICHAIN_F32(unk_4C, 2000, ICHAIN_CONTINUE),
    ICHAIN_VEC3F_DIV1000(scale, 10, ICHAIN_STOP),
};

extern FlexSkeletonHeader D_06000BD8;
extern AnimationHeader D_060015B0;

void EnDha_SetupAction(EnDha* this, EnDhaActionFunc actionFunc) {
    this->actionFunc = actionFunc;
}

void EnDha_Init(Actor* thisx, GlobalContext* globalCtx) {
    EnDha* this = THIS;

    Actor_ProcessInitChain(&this->actor, sInitChain);
    this->actor.colChkInfo.damageTable = &sDamageTable;
    SkelAnime_InitFlex(globalCtx, &this->skelAnime, &D_06000BD8, &D_060015B0, this->limbDrawTable,
                       this->transitionDrawTable, 4);
    ActorShape_Init(&this->actor.shape, 0, ActorShadow_DrawFunc_Teardrop, 90.0f);
    this->actor.posRot2.pos = this->actor.posRot.pos;
    this->actor.posRot2.pos.y += 50.0f;
    this->actor.colChkInfo.mass = 0xFE;
    this->actor.colChkInfo.health = 8;
    this->unk_1CE = -0x4000;
    Collider_InitJntSph(globalCtx, &this->collider);
    Collider_SetJntSph(globalCtx, &this->collider, &this->actor, &sJntSphInit, this->colliderItem);
    this->actor.flags &= ~1;
    func_809EC9C8(this);
}

void EnDha_Destroy(Actor* thisx, GlobalContext* globalCtx) {
    s32 pad;
    EnDha* this = THIS;

    Collider_DestroyJntSph(globalCtx, &this->collider);
}

void func_809EC9C8(EnDha* this) {
    SkelAnime_ChangeAnimDefaultRepeat(&this->skelAnime, &D_060015B0);
    this->unk_1C0 = 0;
    this->unk_1C8 = ((Math_Rand_ZeroOne() * 10.0f) + 5.0f);
    this->actor.speedXZ = 0.0f;
    this->actor.posRot.rot.y = this->actor.shape.rot.y;
    this->actor.initPosRot.rot.z = 1;
    EnDha_SetupAction(this, func_809ECA50);
}

void func_809ECA50(EnDha* this, GlobalContext* globalCtx) {
    Vec3f D_809ED740 = { 0.0f, 0.0f, 0.0f };
    Vec3f D_809ED74C = { 0.0f, 0.0f, 55.0f };
    Vec3f D_809ED758 = { 0.0f, 0.0f, -54.0f };
    Player* player = PLAYER;
    s32 pad;
    s32 pad2;
    Vec3f playerPos = player->actor.posRot.pos;
    Vec3s test;
    s16 result;
    s32 resultAbs;

    playerPos.x += Math_Sins(player->actor.shape.rot.y) * -5.0f;
    playerPos.z += Math_Coss(player->actor.shape.rot.y) * -5.0f;
    if (LINK_IS_CHILD) {
        playerPos.y += 38.0f;
    } else {
        playerPos.y += 56.0f;
    }
    if (this->actor.xzDistFromLink <= 100.0f) {
        this->unk_1D6.x = this->unk_1D0.z = this->unk_1D0.y = 0;
        if (Math_Vec3f_DistXYZ(&playerPos, &this->unk_1DC) <= 12.0f) {
            if (this->unk_1CC == 0) {
                if (globalCtx->grabPlayer(globalCtx, player)) {
                    this->unk_1CA = 0;
                    this->unk_1CC++;
                    if (this->actor.parent != NULL) {
                        this->actor.parent->params = ENDH_START_ATTACK_GRAB;
                    }
                    Audio_PlayActorSound2(&this->actor, NA_SE_EN_DEADHAND_GRIP);
                }
            } else {
                this->unk_1CA += 0x1194;
                this->unk_1D0.y = Math_Sins(this->unk_1CA) * 1820.0f;
                if (!(player->stateFlags2 & 0x80)) {
                    this->unk_1CC = 0;
                    func_809ECF60(this);
                    return;
                }
                if (this->unk_1CA < -0x6E6B) {
                    Audio_PlayActorSound2(&this->actor, NA_SE_EN_DEADHAND_GRIP);
                }
            }
            func_80035844(&this->unk_1E8, &playerPos, &this->unk_1D0.z, 0);
            this->unk_1D6.x -= this->actor.shape.rot.y + this->unk_1D0.y;
            this->unk_1D0.z -= this->actor.shape.rot.x + this->unk_1CE + this->unk_1D0.x;
        } else {
            if ((player->stateFlags2 & 0x80) && (&this->actor == player->actor.parent)) {
                player->stateFlags2 &= ~0x80;
                player->actor.parent = NULL;
                player->unk_850 = 200;
            }
            if (this->actor.initPosRot.rot.z != 0) {
                Audio_PlayActorSound2(&this->actor, NA_SE_EN_DEADHAND_HAND_AT);
                this->actor.initPosRot.rot.z = 0;
            }
        }
        this->actor.shape.rot.y = Math_Vec3f_Yaw(&this->actor.posRot.pos, &playerPos);
        Math_SmoothScaleMaxMinF(&this->unk_1DC.x, playerPos.x, 1.0f, 16.0f, 0.0f);
        Math_SmoothScaleMaxMinF(&this->unk_1DC.y, playerPos.y, 1.0f, 16.0f, 0.0f);
        Math_SmoothScaleMaxMinF(&this->unk_1DC.z, playerPos.z, 1.0f, 16.0f, 0.0f);
        func_80035844(&this->unk_1F4, &this->unk_1DC, &test, 0);
        Matrix_Translate(this->unk_1DC.x, this->unk_1DC.y, this->unk_1DC.z, MTXMODE_NEW);
        Matrix_RotateRPY(test.x, test.y, 0, MTXMODE_APPLY);
        Matrix_MultVec3f(&D_809ED758, &this->unk_1F4);
        Matrix_Translate(this->actor.posRot.pos.x, this->actor.posRot.pos.y, this->actor.posRot.pos.z, MTXMODE_NEW);
        func_80035844(&this->actor.posRot.pos, &this->unk_1F4, &test, 0);
        Matrix_RotateRPY(test.x, test.y, 0, MTXMODE_APPLY);
        Matrix_MultVec3f(&D_809ED74C, &this->unk_1F4);
        this->unk_1CE = Math_Vec3f_Pitch(&this->actor.posRot.pos, &this->unk_1F4);
        result = Math_Vec3f_Yaw(&this->actor.posRot.pos, &this->unk_1F4) - this->actor.shape.rot.y;
        resultAbs = ABS(result);
        if (resultAbs >= 0x4000) {
            this->unk_1CE = -0x8000 - this->unk_1CE;
        }
        this->unk_1D0.x = (Math_Vec3f_Pitch(&this->unk_1F4, &this->unk_1DC) - this->unk_1CE);
        if (this->unk_1D0.x < 0) {
            this->unk_1CE += this->unk_1D0.x * 2;
            this->unk_1D0.x *= -2;
        }
    } else {
        if ((player->stateFlags2 & 0x80) && (&this->actor == player->actor.parent)) {
            player->stateFlags2 &= ~0x80;
            player->actor.parent = NULL;
            player->unk_850 = 200;
        }
        this->actor.initPosRot.rot.z = 1;
        Math_SmoothScaleMaxMinS(&this->unk_1D0.x, 0, 1, 0x3E8, 0);
        Math_SmoothScaleMaxMinS(&this->unk_1CE, -0x4000, 1, 0x3E8, 0);
        SkelAnime_FrameUpdateMatrix(&this->skelAnime);
    }
}

void func_809ECF60(EnDha* this) {
    this->unk_1C8 = 15;
    EnDha_SetupAction(this, func_809ECF8C);
}

void func_809ECF8C(EnDha* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;

    if ((player->stateFlags2 & 0x80) && (&this->actor == player->actor.parent)) {
        player->stateFlags2 &= ~0x80;
        player->actor.parent = NULL;
        player->unk_850 = 200;
    }
    Math_SmoothScaleMaxMinS(&this->unk_1D0.x, 0, 1, 2000, 0);
    Math_SmoothScaleMaxMinS(&this->unk_1D0.y, 0, 1, 600, 0);
    Math_SmoothScaleMaxMinS(&this->unk_1CE, -0x4000, 1, 2000, 0);
    SkelAnime_FrameUpdateMatrix(&this->skelAnime);
    this->unk_1C8--;
    if (this->unk_1C8 == 0) {
        func_809EC9C8(this);
    }
}

void EnDha_SetupDeath(EnDha* this) {
    this->unk_1C0 = 8;
    this->unk_1C8 = 300;

    if (this->actor.parent != NULL) {
        if (this->actor.parent->params != ENDH_DEATH) {
            Audio_PlayActorSound2(&this->actor, NA_SE_EN_DEADHAND_HAND_DEAD);
        }
        if (this->actor.parent->params <= ENDH_WAIT_UNDERGROUND) {
            this->actor.parent->params--;
        }
    }
    EnDha_SetupAction(this, EnDha_Die);
}

void EnDha_Die(EnDha* this, GlobalContext* globalCtx) {
    s16 result;
    Vec3f vector;
    Player* player = PLAYER;

    if ((player->stateFlags2 & 0x80) && (&this->actor == player->actor.parent)) {
        player->stateFlags2 &= ~0x80;
        player->actor.parent = NULL;
        player->unk_850 = 200;
    }
    Math_SmoothScaleMaxMinS(&this->unk_1D0.x, 0, 1, 0x7D0, 0);
    result = Math_SmoothScaleMaxMinS(&this->unk_1CE, -0x4000, 1, 0x7D0, 0);
    SkelAnime_FrameUpdateMatrix(&this->skelAnime);
    if (result == 0) {
        vector = this->actor.posRot.pos;

        if (this->unk_1C8 != 0) {
            if (-12000.0f < this->actor.shape.unk_08) {
                this->actor.shape.unk_08 -= 1000.0f;
                func_80033480(globalCtx, &vector, 7.0f, 1, 0x5A, 0x14, 1);
            } else {
                this->unk_1C8--;
                if ((this->actor.parent != NULL) && (this->actor.parent->params == ENDH_DEATH)) {
                    Actor_Kill(&this->actor);
                    return;
                }
            }
        } else {
            this->actor.shape.unk_08 += 500.0f;
            func_80033480(globalCtx, &vector, 7.0f, 1, 0x5A, 0x14, 1);
            if (this->actor.shape.unk_08 == 0.0f) {
                func_809EC9C8(this);
            }
        }
    }
}

void EnDha_UpdateHealth(EnDha* this, GlobalContext* globalCtx) {
    if (!((this->unk_1C0 >= 8) || !(this->collider.base.acFlags & 2))) {
        this->collider.base.acFlags &= ~2;
        if (this->actor.colChkInfo.damageEffect == 0 || this->actor.colChkInfo.damageEffect == 6) {
            return;
        } else {
            func_8003426C(&this->actor, 0x4000, 0xFF, 0, 8);
            if (Actor_ApplyDamage(&this->actor) == 0) {
                EnDha_SetupDeath(this);
                this->actor.colChkInfo.health = 8;
                Item_DropCollectibleRandom(globalCtx, &this->actor, &this->actor.posRot.pos, 0xE0);
            } else {
                Audio_PlayActorSound2(&this->actor, NA_SE_EN_DEADHAND_DAMAGE);
                this->unk_1C0 = 9;
                func_809ECF60(this);
            }
        }
    }
    if ((this->actor.parent != NULL) && (this->actor.parent->params == ENDH_DEATH)) {
        EnDha_SetupDeath(this);
    }
}

void EnDha_Update(Actor* thisx, GlobalContext* globalCtx) {
    s32 pad;
    EnDha* this = THIS;

    if (this->actor.parent == NULL) {
        this->actor.parent = Actor_FindNearby(globalCtx, &this->actor, ACTOR_EN_DH, ACTORTYPE_ENEMY, 10000.0f);
    }
    EnDha_UpdateHealth(this, globalCtx);
    this->actionFunc(this, globalCtx);
    CollisionCheck_SetAC(globalCtx, &globalCtx->colChkCtx, &this->collider.base);
    CollisionCheck_SetOC(globalCtx, &globalCtx->colChkCtx, &this->collider.base);
}

s32 EnDha_OverrideLimbDraw(GlobalContext* globalCtx, s32 limbIndex, Gfx** dList, Vec3f* pos, Vec3s* rot, void* thisx) {
    EnDha* this = THIS;

    if (limbIndex == 1) {
        rot->y = -(s16)(this->unk_1CE + 0x4000);
        rot->z += this->unk_1D0.y;
    } else if (limbIndex == 2) {
        rot->z = this->unk_1D0.x;
        rot->y -= this->unk_1D0.y;
    } else if (limbIndex == 3) {
        rot->y = -this->unk_1D6.x;
        rot->z = -this->unk_1D0.z;
    }
    return 0;
}

void EnDha_OverridePostDraw(GlobalContext* globalCtx, s32 limbIndex, Gfx** dList, Vec3s* rot, void* thisx) {
    Vec3f D_809ED764 = { 1100.0f, 0.0f, 0.0f };
    Vec3f D_809ED770 = { 0.0f, 0.0f, 0.0f };

    EnDha* this = THIS;

    switch (limbIndex) {
        case 1:
            func_800628A4(2, &this->collider);
            func_800628A4(3, &this->collider);
            break;

        case 2:
            func_800628A4(4, &this->collider);
            func_800628A4(5, &this->collider);
            Matrix_MultVec3f(&D_809ED770, &this->unk_1F4);
            break;

        case 3:
            func_800628A4(1, &this->collider);
            Matrix_MultVec3f(&D_809ED764, &this->unk_1DC);
            Matrix_MultVec3f(&D_809ED770, &this->unk_1E8);
            break;
    }
}

void EnDha_Draw(Actor* thisx, GlobalContext* globalCtx) {
    s32 pad;
    EnDha* this = THIS;

    func_80093D18(globalCtx->state.gfxCtx);
    SkelAnime_DrawFlexOpa(globalCtx, this->skelAnime.skeleton, this->skelAnime.limbDrawTbl, this->skelAnime.dListCount,
                          EnDha_OverrideLimbDraw, EnDha_OverridePostDraw, this);
}
