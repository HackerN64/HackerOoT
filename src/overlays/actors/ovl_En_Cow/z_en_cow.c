/*
 * File: z_en_cow.c
 * Overlay: ovl_En_Cow
 * Description: Cow
 */

#include "z_en_cow.h"

#define FLAGS 0x00000009

#define THIS ((EnCow*)thisx)

void EnCow_Init(Actor* thisx, GlobalContext* globalCtx);
void EnCow_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnCow_Update(Actor* thisx, GlobalContext* globalCtx);
void EnCow_Draw(Actor* thisx, GlobalContext* globalCtx);
void func_809DFE98(Actor* thisx, GlobalContext* globalCtx);
void func_809E0070(Actor* thisx, GlobalContext* globalCtx);

void func_809DF494(EnCow* this, GlobalContext* globalCtx);
void func_809DF6BC(EnCow* this, GlobalContext* globalCtx);
void func_809DF778(EnCow* this, GlobalContext* globalCtx);
void func_809DF7D8(EnCow* this, GlobalContext* globalCtx);
void func_809DF870(EnCow* this, GlobalContext* globalCtx);
void func_809DF8FC(EnCow* this, GlobalContext* globalCtx);
void func_809DF96C(EnCow* this, GlobalContext* globalCtx);
void func_809DFA84(EnCow* this, GlobalContext* globalCtx);

const ActorInit En_Cow_InitVars = {
    ACTOR_EN_COW,
    ACTORTYPE_NPC,
    FLAGS,
    OBJECT_COW,
    sizeof(EnCow),
    (ActorFunc)EnCow_Init,
    (ActorFunc)EnCow_Destroy,
    (ActorFunc)EnCow_Update,
    (ActorFunc)EnCow_Draw,
};

static ColliderCylinderInit sCylinderInit = {
    { COLTYPE_UNK10, 0x00, 0x11, 0x39, 0x10, COLSHAPE_CYLINDER },
    { 0x00, { 0x00000000, 0x00, 0x00 }, { 0xFFCFFFFF, 0x00, 0x00 }, 0x00, 0x01, 0x01 },
    { 30, 40, 0, { 0, 0, 0 } },
};

static Vec3f D_809E010C = { 0.0f, -1300.0f, 1100.0f };

extern AnimationHeader D_060001CC;
extern FlexSkeletonHeader D_06004010;
extern AnimationHeader D_06004264;
extern AnimationHeader D_06004348;
extern FlexSkeletonHeader D_06004C30;
extern AnimationHeader D_06004E98;

void func_809DEE00(Vec3f* vec, s16 rotY) {
    f32 xCalc;
    f32 rotCalcTemp;

    rotCalcTemp = Math_Coss(rotY);
    xCalc = (Math_Sins(rotY) * vec->z) + (rotCalcTemp * vec->x);
    rotCalcTemp = Math_Sins(rotY);
    vec->z = (Math_Coss(rotY) * vec->z) + (-rotCalcTemp * vec->x);
    vec->x = xCalc;
}

void func_809DEE9C(EnCow* this) {
    Vec3f vec;

    vec.y = 0.0f;
    vec.x = 0.0f;
    vec.z = 30.0f;
    func_809DEE00(&vec, this->actor.shape.rot.y);
    this->colliders[0].dim.pos.x = this->actor.posRot.pos.x + vec.x;
    this->colliders[0].dim.pos.y = this->actor.posRot.pos.y;
    this->colliders[0].dim.pos.z = this->actor.posRot.pos.z + vec.z;

    vec.x = 0.0f;
    vec.y = 0.0f;
    vec.z = -20.0f;
    func_809DEE00(&vec, this->actor.shape.rot.y);
    this->colliders[1].dim.pos.x = this->actor.posRot.pos.x + vec.x;
    this->colliders[1].dim.pos.y = this->actor.posRot.pos.y;
    this->colliders[1].dim.pos.z = this->actor.posRot.pos.z + vec.z;
}

void func_809DEF94(EnCow* this) {
    Vec3f vec;

    VEC_SET(vec, 0.0f, 57.0f, -36.0f);

    func_809DEE00(&vec, this->actor.shape.rot.y);
    this->actor.posRot.pos.x += vec.x;
    this->actor.posRot.pos.y += vec.y;
    this->actor.posRot.pos.z += vec.z;
}

void EnCow_Init(Actor* thisx, GlobalContext* globalCtx) {
    EnCow* this = THIS;
    s32 pad;

    ActorShape_Init(&this->actor.shape, 0.0f, ActorShadow_DrawFunc_Circle, 72.0f);
    switch (this->actor.params) {
        case 0:
            SkelAnime_InitFlex(globalCtx, &this->skelAnime, &D_06004010, NULL, this->limbDrawTable,
                               this->transitionDrawTable, 6);
            SkelAnime_ChangeAnimDefaultRepeat(&this->skelAnime, &D_060001CC);
            Collider_InitCylinder(globalCtx, &this->colliders[0]);
            Collider_SetCylinder(globalCtx, &this->colliders[0], &this->actor, &sCylinderInit);
            Collider_InitCylinder(globalCtx, &this->colliders[1]);
            Collider_SetCylinder(globalCtx, &this->colliders[1], &this->actor, &sCylinderInit);
            func_809DEE9C(this);
            this->actionFunc = func_809DF96C;
            if (globalCtx->sceneNum == SCENE_LINK_HOME) {
                if (LINK_IS_CHILD) {
                    Actor_Kill(&this->actor);
                    return;
                }
                if (!(gSaveContext.eventChkInf[1] & 0x4000)) {
                    Actor_Kill(&this->actor);
                    return;
                }
            }
            Actor_SpawnAsChild(&globalCtx->actorCtx, &this->actor, globalCtx, ACTOR_EN_COW, this->actor.posRot.pos.x,
                               this->actor.posRot.pos.y, this->actor.posRot.pos.z, 0, this->actor.shape.rot.y, 0, 1);
            this->unk_278 = Math_Rand_ZeroFloat(1000.0f) + 40.0f;
            this->unk_27A = 0;
            this->actor.unk_1F = 6;
            DREG(53) = 0;
            break;
        case 1:
            SkelAnime_InitFlex(globalCtx, &this->skelAnime, &D_06004C30, NULL, this->limbDrawTable,
                               this->transitionDrawTable, 6);
            SkelAnime_ChangeAnimDefaultRepeat(&this->skelAnime, &D_06004348);
            this->actor.update = func_809DFE98;
            this->actor.draw = func_809E0070;
            this->actionFunc = func_809DFA84;
            func_809DEF94(this);
            this->actor.flags &= ~0x1;
            this->unk_278 = ((u32)(Math_Rand_ZeroFloat(1000.0f)) & 0xFFFF) + 40.0f;
            break;
    }
    this->actor.colChkInfo.mass = 0xFF;
    Actor_SetScale(&this->actor, 0.01f);
    this->unk_276 = 0;
}

void EnCow_Destroy(Actor* thisx, GlobalContext* globalCtx) {
    EnCow* this = THIS;

    if (this->actor.params == 0) {
        Collider_DestroyCylinder(globalCtx, &this->colliders[0]);
        Collider_DestroyCylinder(globalCtx, &this->colliders[1]);
    }
}

void func_809DF494(EnCow* this, GlobalContext* globalCtx) {
    if (this->unk_278 > 0) {
        this->unk_278 -= 1;
    } else {
        this->unk_278 = Math_Rand_ZeroFloat(500.0f) + 40.0f;
        SkelAnime_ChangeAnim(&this->skelAnime, &D_060001CC, 1.0f, this->skelAnime.animCurrentFrame,
                             SkelAnime_GetFrameCount(&D_060001CC), 2, 1.0f);
    }

    if ((this->actor.xzDistFromLink < 150.0f) && (!(this->unk_276 & 2))) {
        this->unk_276 |= 2;
        if (this->skelAnime.animation == &D_060001CC) {
            this->unk_278 = 0;
        }
    }

    this->unk_27A += 1;
    if (this->unk_27A >= 0x31) {
        this->unk_27A = 0;
    }

    // (1.0f / 100.0f) instead of 0.01f below is necessary so 0.01f doesn't get reused mistakenly
    if (this->unk_27A < 0x20) {
        this->actor.scale.x = ((Math_Sins(this->unk_27A << 0xA) * (1.0f / 100.0f)) + 1.0f) * 0.01f;
    } else {
        this->actor.scale.x = 0.01f;
    }

    if (this->unk_27A >= 0x11) {
        this->actor.scale.y = ((Math_Sins((this->unk_27A << 0xA) - 0x4000) * (1.0f / 100.0f)) + 1.0f) * 0.01f;
    } else {
        this->actor.scale.y = 0.01f;
    }
}

void func_809DF6BC(EnCow* this, GlobalContext* globalCtx) {
    if ((func_8010BDBC(&globalCtx->msgCtx) == 5) && (func_80106BC8(globalCtx) != 0)) {
        this->actor.flags &= ~0x10000;
        func_80106CCC(globalCtx);
        this->actionFunc = func_809DF96C;
    }
}

void func_809DF730(EnCow* this, GlobalContext* globalCtx) {
    if (func_8002F334(&this->actor, globalCtx)) {
        this->actor.flags &= ~0x10000;
        this->actionFunc = func_809DF96C;
    }
}

void func_809DF778(EnCow* this, GlobalContext* globalCtx) {
    if (Actor_HasParent(&this->actor, globalCtx)) {
        this->actor.parent = NULL;
        this->actionFunc = func_809DF730;
    } else {
        func_8002F434(&this->actor, globalCtx, GI_MILK, 10000.0f, 100.0f);
    }
}

void func_809DF7D8(EnCow* this, GlobalContext* globalCtx) {
    if ((func_8010BDBC(&globalCtx->msgCtx) == 5) && (func_80106BC8(globalCtx) != 0)) {
        this->actor.flags &= ~0x10000;
        func_80106CCC(globalCtx);
        this->actionFunc = func_809DF778;
        func_8002F434(&this->actor, globalCtx, GI_MILK, 10000.0f, 100.0f);
    }
}

void func_809DF870(EnCow* this, GlobalContext* globalCtx) {
    if ((func_8010BDBC(&globalCtx->msgCtx) == 5) && (func_80106BC8(globalCtx) != 0)) {
        if (Inventory_HasEmptyBottle()) {
            func_8010B720(globalCtx, 0x2007);
            this->actionFunc = func_809DF7D8;
        } else {
            func_8010B720(globalCtx, 0x2013);
            this->actionFunc = func_809DF6BC;
        }
    }
}

void func_809DF8FC(EnCow* this, GlobalContext* globalCtx) {
    if (func_8002F194(&this->actor, globalCtx)) {
        this->actionFunc = func_809DF870;
    } else {
        this->actor.flags |= 0x10000;
        func_8002F2CC(&this->actor, globalCtx, 170.0f);
        this->actor.textId = 0x2006;
    }
    func_809DF494(this, globalCtx);
}

void func_809DF96C(EnCow* this, GlobalContext* globalCtx) {
    if ((globalCtx->msgCtx.unk_E3EE == 0) || (globalCtx->msgCtx.unk_E3EE == 4)) {
        if (DREG(53) != 0) {
            if (this->unk_276 & 4) {
                this->unk_276 &= ~0x4;
                DREG(53) = 0;
            } else {
                if ((this->actor.xzDistFromLink < 150.0f) &&
                    (ABS((s16)(this->actor.yawTowardsLink - this->actor.shape.rot.y)) < 0x61A8)) {
                    DREG(53) = 0;
                    this->actionFunc = func_809DF8FC;
                    this->actor.flags |= 0x10000;
                    func_8002F2CC(&this->actor, globalCtx, 170.0f);
                    this->actor.textId = 0x2006;
                } else {
                    this->unk_276 |= 4;
                }
            }
        } else {
            this->unk_276 &= ~0x4;
        }
    }
    func_809DF494(this, globalCtx);
}

void func_809DFA84(EnCow* this, GlobalContext* globalCtx) {
    if (this->unk_278 > 0) {
        this->unk_278--;
    } else {
        this->unk_278 = Math_Rand_ZeroFloat(200.0f) + 40.0f;
        SkelAnime_ChangeAnim(&this->skelAnime, &D_06004348, 1.0f, this->skelAnime.animCurrentFrame,
                             SkelAnime_GetFrameCount(&D_06004348), 2, 1.0f);
    }

    if ((this->actor.xzDistFromLink < 150.0f) &&
        (ABS((s16)(this->actor.yawTowardsLink - this->actor.shape.rot.y)) >= 0x61A9) && (!(this->unk_276 & 2))) {
        this->unk_276 |= 2;
        if (this->skelAnime.animation == &D_06004348) {
            this->unk_278 = 0;
        }
    }
}

void EnCow_Update(Actor* thisx, GlobalContext* globalCtx) {
    EnCow* this = THIS;
    s32 pad;
    s16 targetX;
    s16 targetY;
    Player* player = PLAYER;

    CollisionCheck_SetOC(globalCtx, &globalCtx->colChkCtx, &this->colliders[0].base);
    if (globalCtx) {} // necessary to match
    CollisionCheck_SetOC(globalCtx, &globalCtx->colChkCtx, &this->colliders[1].base);
    Actor_MoveForward(thisx);
    func_8002E4B4(globalCtx, thisx, 0.0f, 0.0f, 0.0f, 4);
    if (SkelAnime_FrameUpdateMatrix(&this->skelAnime) != 0) {
        if (this->skelAnime.animation == &D_060001CC) {
            Audio_PlayActorSound2(thisx, NA_SE_EV_COW_CRY);
            SkelAnime_ChangeAnim(&this->skelAnime, &D_06004264, 1.0f, 0.0f, SkelAnime_GetFrameCount(&D_06004264), 2,
                                 1.0f);
        } else {
            SkelAnime_ChangeAnim(&this->skelAnime, &D_060001CC, 1.0f, 0.0f, SkelAnime_GetFrameCount(&D_060001CC), 0,
                                 1.0f);
        }
    }
    this->actionFunc(this, globalCtx);
    if ((thisx->xzDistFromLink < 150.0f) &&
        (ABS(Math_Vec3f_Yaw(&thisx->posRot.pos, &player->actor.posRot.pos)) < 0xC000)) {
        targetX = Math_Vec3f_Pitch(&thisx->posRot2.pos, &player->actor.posRot2.pos);
        targetY = Math_Vec3f_Yaw(&thisx->posRot2.pos, &player->actor.posRot2.pos) - thisx->shape.rot.y;

        if (targetX > 0x1000) {
            targetX = 0x1000;
        } else if (targetX < -0x1000) {
            targetX = -0x1000;
        }

        if (targetY > 0x2500) {
            targetY = 0x2500;
        } else if (targetY < -0x2500) {
            targetY = -0x2500;
        }

    } else {
        targetY = 0;
        targetX = 0;
    }
    Math_SmoothScaleMaxMinS(&this->someRot.x, targetX, 0xA, 0xC8, 0xA);
    Math_SmoothScaleMaxMinS(&this->someRot.y, targetY, 0xA, 0xC8, 0xA);
}

void func_809DFE98(Actor* thisx, GlobalContext* globalCtx) {
    EnCow* this = THIS;
    s32 pad;

    if (SkelAnime_FrameUpdateMatrix(&this->skelAnime) != 0) {
        if (this->skelAnime.animation == &D_06004348) {
            SkelAnime_ChangeAnim(&this->skelAnime, &D_06004E98, 1.0f, 0.0f, SkelAnime_GetFrameCount(&D_06004E98), 2,
                                 1.0f);
        } else {
            SkelAnime_ChangeAnim(&this->skelAnime, &D_06004348, 1.0f, 0.0f, SkelAnime_GetFrameCount(&D_06004348), 0,
                                 1.0f);
        }
    }
    this->actionFunc(this, globalCtx);
}

s32 EnCow_OverrideLimbDraw(GlobalContext* globalCtx, s32 limbIndex, Gfx** dList, Vec3f* pos, Vec3s* rot, void* thisx) {
    EnCow* this = THIS;

    if (limbIndex == 2) {
        rot->y += this->someRot.y;
        rot->x += this->someRot.x;
    }
    if (limbIndex == 5) {
        *dList = NULL;
    }
    return 0;
}

void EnCow_PostLimbDraw(GlobalContext* globalCtx, s32 limbIndex, Gfx** dList, Vec3s* rot, void* thisx) {
    EnCow* this = THIS;

    if (limbIndex == 2) {
        Matrix_MultVec3f(&D_809E010C, &this->actor.posRot2.pos);
    }
}

void EnCow_Draw(Actor* thisx, GlobalContext* globalCtx) {
    EnCow* this = THIS;

    func_800943C8(globalCtx->state.gfxCtx);
    SkelAnime_DrawFlexOpa(globalCtx, this->skelAnime.skeleton, this->skelAnime.limbDrawTbl, this->skelAnime.dListCount,
                          EnCow_OverrideLimbDraw, EnCow_PostLimbDraw, this);
}

void func_809E0070(Actor* thisx, GlobalContext* globalCtx) {
    EnCow* this = THIS;

    func_800943C8(globalCtx->state.gfxCtx);
    SkelAnime_DrawFlexOpa(globalCtx, this->skelAnime.skeleton, this->skelAnime.limbDrawTbl, this->skelAnime.dListCount,
                          NULL, NULL, this);
}
