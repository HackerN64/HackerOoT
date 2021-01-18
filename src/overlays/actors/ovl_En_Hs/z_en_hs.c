/*
 * File: z_en_hs.c
 * Overlay: ovl_En_Hs
 * Description: Carpenter's Son
 */

#include "z_en_hs.h"
#include "vt.h"

#define FLAGS 0x00000009

#define THIS ((EnHs*)thisx)

void EnHs_Init(Actor* thisx, GlobalContext* globalCtx);
void EnHs_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnHs_Update(Actor* thisx, GlobalContext* globalCtx);
void EnHs_Draw(Actor* thisx, GlobalContext* globalCtx);

void func_80A6E9AC(EnHs* this, GlobalContext* globalCtx);
void func_80A6E6B0(EnHs* this, GlobalContext* globalCtx);

const ActorInit En_Hs_InitVars = {
    ACTOR_EN_HS,
    ACTORCAT_NPC,
    FLAGS,
    OBJECT_HS,
    sizeof(EnHs),
    (ActorFunc)EnHs_Init,
    (ActorFunc)EnHs_Destroy,
    (ActorFunc)EnHs_Update,
    (ActorFunc)EnHs_Draw,
};

static ColliderCylinderInit sCylinderInit = {
    {
        COLTYPE_NONE,
        AT_NONE,
        AC_ON | AC_TYPE_ENEMY,
        OC1_ON | OC1_TYPE_ALL,
        OC2_TYPE_1,
        COLSHAPE_CYLINDER,
    },
    {
        ELEMTYPE_UNK0,
        { 0x00000000, 0x00, 0x00 },
        { 0xFFCFFFFF, 0x00, 0x00 },
        TOUCH_NONE,
        BUMP_ON,
        OCELEM_ON,
    },
    { 40, 40, 0, { 0, 0, 0 } },
};

extern AnimationHeader D_06000304;
extern AnimationHeader D_06000528;
extern AnimationHeader D_060005C0;
extern FlexSkeletonHeader D_06006260;

void func_80A6E3A0(EnHs* this, EnHsActionFunc actionFunc) {
    this->actionFunc = actionFunc;
}

void EnHs_Init(Actor* thisx, GlobalContext* globalCtx) {
    EnHs* this = THIS;
    s32 pad;

    ActorShape_Init(&this->actor.shape, 0.0f, ActorShadow_DrawCircle, 36.0f);
    SkelAnime_InitFlex(globalCtx, &this->skelAnime, &D_06006260, &D_060005C0, this->jointTable, this->morphTable, 16);
    Animation_PlayLoop(&this->skelAnime, &D_060005C0);
    Collider_InitCylinder(globalCtx, &this->collider);
    Collider_SetCylinder(globalCtx, &this->collider, &this->actor, &sCylinderInit);
    this->actor.colChkInfo.mass = MASS_IMMOVABLE;
    Actor_SetScale(&this->actor, 0.01f);

    if (LINK_IS_CHILD) {
        this->actor.params = 0;
    } else {
        this->actor.params = 1;
    }

    if (this->actor.params == 1) {
        // chicken shop (adult era)
        osSyncPrintf(VT_FGCOL(CYAN) " ヒヨコの店(大人の時) \n" VT_RST);
        func_80A6E3A0(this, func_80A6E9AC);
        if (gSaveContext.itemGetInf[3] & 1) {
            // chicken shop closed
            osSyncPrintf(VT_FGCOL(CYAN) " ヒヨコ屋閉店 \n" VT_RST);
            Actor_Kill(&this->actor);
        }
    } else {
        // chicken shop (child era)
        osSyncPrintf(VT_FGCOL(CYAN) " ヒヨコの店(子人の時) \n" VT_RST);
        func_80A6E3A0(this, func_80A6E9AC);
    }

    this->unk_2A8 = 0;
    this->actor.targetMode = 6;
}

void EnHs_Destroy(Actor* thisx, GlobalContext* globalCtx) {
    EnHs* this = THIS;

    Collider_DestroyCylinder(globalCtx, &this->collider);
}

s32 func_80A6E53C(EnHs* this, GlobalContext* globalCtx, u16 textId, EnHsActionFunc actionFunc) {
    s16 yawDiff;

    if (func_8002F194(&this->actor, globalCtx)) {
        func_80A6E3A0(this, actionFunc);
        return 1;
    }

    this->actor.textId = textId;
    yawDiff = this->actor.yawTowardsPlayer - this->actor.shape.rot.y;
    if ((ABS(yawDiff) <= 0x2150) && (this->actor.xzDistToPlayer < 100.0f)) {
        this->unk_2A8 |= 1;
        func_8002F2CC(&this->actor, globalCtx, 100.0f);
    }

    return 0;
}

void func_80A6E5EC(EnHs* this, GlobalContext* globalCtx) {
    if (func_8002F334(&this->actor, globalCtx)) {
        func_80A6E3A0(this, func_80A6E6B0);
    }

    this->unk_2A8 |= 1;
}

void func_80A6E630(EnHs* this, GlobalContext* globalCtx) {
    if ((func_8010BDBC(&globalCtx->msgCtx) == 6) && func_80106BC8(globalCtx)) {
        func_80088AA0(180);
        func_80A6E3A0(this, func_80A6E6B0);
        gSaveContext.eventInf[1] &= ~1;
    }

    this->unk_2A8 |= 1;
}

void func_80A6E6B0(EnHs* this, GlobalContext* globalCtx) {
    func_80A6E53C(this, globalCtx, 0x10B6, func_80A6E5EC);
}

void func_80A6E6D8(EnHs* this, GlobalContext* globalCtx) {
    if (func_8002F334(&this->actor, globalCtx)) {
        func_80A6E3A0(this, func_80A6E9AC);
    }
}

void func_80A6E70C(EnHs* this, GlobalContext* globalCtx) {
    if (func_8002F334(&this->actor, globalCtx)) {
        func_80A6E3A0(this, func_80A6E9AC);
    }
}

void func_80A6E740(EnHs* this, GlobalContext* globalCtx) {
    if (Actor_HasParent(&this->actor, globalCtx)) {
        this->actor.parent = NULL;
        func_80A6E3A0(this, func_80A6E630);
    } else {
        func_8002F434(&this->actor, globalCtx, GI_ODD_MUSHROOM, 10000.0f, 50.0f);
    }

    this->unk_2A8 |= 1;
}

void func_80A6E7BC(EnHs* this, GlobalContext* globalCtx) {
    if ((func_8010BDBC(&globalCtx->msgCtx) == 4) && func_80106BC8(globalCtx)) {
        switch (globalCtx->msgCtx.choiceIndex) {
            case 0:
                func_80A6E3A0(this, func_80A6E740);
                func_8002F434(&this->actor, globalCtx, GI_ODD_MUSHROOM, 10000.0f, 50.0f);
                break;
            case 1:
                func_8010B720(globalCtx, 0x10B4);
                func_80A6E3A0(this, func_80A6E70C);
                break;
        }

        Animation_Change(&this->skelAnime, &D_060005C0, 1.0f, 0.0f, Animation_GetLastFrame(&D_060005C0), ANIMMODE_LOOP,
                         8.0f);
    }

    this->unk_2A8 |= 1;
}

void func_80A6E8CC(EnHs* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;

    if ((func_8010BDBC(&globalCtx->msgCtx) == 5) && func_80106BC8(globalCtx)) {
        func_8010B720(globalCtx, 0x10B3);
        func_80A6E3A0(this, func_80A6E7BC);
        Animation_Change(&this->skelAnime, &D_06000528, 1.0f, 0.0f, Animation_GetLastFrame(&D_06000528), ANIMMODE_LOOP,
                         8.0f);
    }

    if (this->unk_2AA > 0) {
        this->unk_2AA--;
        if (this->unk_2AA == 0) {
            func_8002F7DC(&player->actor, NA_SE_EV_CHICKEN_CRY_M);
        }
    }

    this->unk_2A8 |= 1;
}

void func_80A6E9AC(EnHs* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;
    s16 yawDiff;

    if (func_8002F194(&this->actor, globalCtx)) {
        if (func_8002F368(globalCtx) == 7) {
            player->actor.textId = 0x10B2;
            func_80A6E3A0(this, func_80A6E8CC);
            Animation_Change(&this->skelAnime, &D_06000304, 1.0f, 0.0f, Animation_GetLastFrame(&D_06000304),
                             ANIMMODE_LOOP, 8.0f);
            this->unk_2AA = 40;
            func_80078884(NA_SE_SY_TRE_BOX_APPEAR);
        } else {
            player->actor.textId = 0x10B1;
            func_80A6E3A0(this, func_80A6E6D8);
        }
    } else {
        yawDiff = this->actor.yawTowardsPlayer - this->actor.shape.rot.y;
        this->actor.textId = 0x10B1;
        if ((ABS(yawDiff) <= 0x2150) && (this->actor.xzDistToPlayer < 100.0f)) {
            func_8002F298(&this->actor, globalCtx, 100.0f, 7);
        }
    }
}

void EnHs_Update(Actor* thisx, GlobalContext* globalCtx) {
    EnHs* this = THIS;
    s32 pad;

    Collider_UpdateCylinder(thisx, &this->collider);
    CollisionCheck_SetOC(globalCtx, &globalCtx->colChkCtx, &this->collider.base);
    Actor_MoveForward(&this->actor);
    Actor_UpdateBgCheckInfo(globalCtx, &this->actor, 0.0f, 0.0f, 0.0f, 4);
    if (SkelAnime_Update(&this->skelAnime)) {
        this->skelAnime.curFrame = 0.0f;
    }

    this->actionFunc(this, globalCtx);

    if (this->unk_2A8 & 1) {
        func_80038290(globalCtx, &this->actor, &this->unk_29C, &this->unk_2A2, this->actor.focus.pos);
        this->unk_2A8 &= ~1;
    } else {
        Math_SmoothStepToS(&this->unk_29C.x, 12800, 6, 6200, 100);
        Math_SmoothStepToS(&this->unk_29C.y, 0, 6, 6200, 100);
        Math_SmoothStepToS(&this->unk_2A2.x, 0, 6, 6200, 100);
        Math_SmoothStepToS(&this->unk_2A2.y, 0, 6, 6200, 100);
    }
}

s32 EnHs_OverrideLimbDraw(GlobalContext* globalCtx, s32 limbIndex, Gfx** dList, Vec3f* pos, Vec3s* rot, void* thisx) {
    EnHs* this = THIS;

    switch (limbIndex) {
        case 9:
            rot->x += this->unk_29C.y;
            rot->z += this->unk_29C.x;
            break;
        case 10:
            *dList = NULL;
            return false;
        case 11:
            *dList = NULL;
            return false;
        case 12:
            if (this->actor.params == 1) {
                *dList = NULL;
                return false;
            }
            break;
        case 13:
            if (this->actor.params == 1) {
                *dList = NULL;
                return false;
            }
            break;
    }
    return false;
}

void EnHs_PostLimbDraw(GlobalContext* globalCtx, s32 limbIndex, Gfx** dList, Vec3s* rot, void* thisx) {
    static Vec3f D_80A6EDFC = { 300.0f, 1000.0f, 0.0f };
    EnHs* this = THIS;

    if (limbIndex == 9) {
        Matrix_MultVec3f(&D_80A6EDFC, &this->actor.focus.pos);
    }
}

void EnHs_Draw(Actor* thisx, GlobalContext* globalCtx) {
    EnHs* this = THIS;

    func_800943C8(globalCtx->state.gfxCtx);
    SkelAnime_DrawFlexOpa(globalCtx, this->skelAnime.skeleton, this->skelAnime.jointTable, this->skelAnime.dListCount,
                          EnHs_OverrideLimbDraw, EnHs_PostLimbDraw, this);
}
