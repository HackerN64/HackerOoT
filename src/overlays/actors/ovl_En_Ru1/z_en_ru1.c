/*
 * File: z_en_ru1.c
 * Overlay: En_Ru1
 * Description:
 */

#include "z_en_ru1.h"
#include "vt.h"

#define FLAGS 0x04000011

#define THIS ((EnRu1*)thisx)

void EnRu1_Init(Actor* thisx, GlobalContext* globalCtx);
void EnRu1_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnRu1_Update(Actor* thisx, GlobalContext* globalCtx);
void EnRu1_Draw(Actor* thisx, GlobalContext* globalCtx);

void func_80AEC0B4(EnRu1* this, GlobalContext* globalCtx);
void func_80AEC100(EnRu1* this, GlobalContext* globalCtx);
void func_80AEC130(EnRu1* this, GlobalContext* globalCtx);
void func_80AEC17C(EnRu1* this, GlobalContext* globalCtx);
void func_80AEC1D4(EnRu1* this, GlobalContext* globalCtx);
void func_80AEC244(EnRu1* this, GlobalContext* globalCtx);
void func_80AEC2C0(EnRu1* this, GlobalContext* globalCtx);
void func_80AECA94(EnRu1* this, GlobalContext* globalCtx);
void func_80AECAB4(EnRu1* this, GlobalContext* globalCtx);
void func_80AECAD4(EnRu1* this, GlobalContext* globalCtx);
void func_80AECB18(EnRu1* this, GlobalContext* globalCtx);
void func_80AECB60(EnRu1* this, GlobalContext* globalCtx);
void func_80AECBB8(EnRu1* this, GlobalContext* globalCtx);
void func_80AECC1C(EnRu1* this, GlobalContext* globalCtx);
void func_80AECC84(EnRu1* this, GlobalContext* globalCtx);
void func_80AED304(EnRu1* this, GlobalContext* globalCtx);
void func_80AED324(EnRu1* this, GlobalContext* globalCtx);
void func_80AED344(EnRu1* this, GlobalContext* globalCtx);
void func_80AED374(EnRu1* this, GlobalContext* globalCtx);
void func_80AED3A4(EnRu1* this, GlobalContext* globalCtx);
void func_80AED3E0(EnRu1* this, GlobalContext* globalCtx);
void func_80AED414(EnRu1* this, GlobalContext* globalCtx);
void func_80AEF29C(EnRu1* this, GlobalContext* globalCtx);
void func_80AEF2AC(EnRu1* this, GlobalContext* globalCtx);
void func_80AEF2D0(EnRu1* this, GlobalContext* globalCtx);
void func_80AEF354(EnRu1* this, GlobalContext* globalCtx);
void func_80AEF3A8(EnRu1* this, GlobalContext* globalCtx);
void func_80AEEBD4(EnRu1* this, GlobalContext* globalCtx);
void func_80AEEC5C(EnRu1* this, GlobalContext* globalCtx);
void func_80AEECF0(EnRu1* this, GlobalContext* globalCtx);
void func_80AEED58(EnRu1* this, GlobalContext* globalCtx);
void func_80AEEDCC(EnRu1* this, GlobalContext* globalCtx);
void func_80AEEE34(EnRu1* this, GlobalContext* globalCtx);
void func_80AEEE9C(EnRu1* this, GlobalContext* globalCtx);
void func_80AEEF08(EnRu1* this, GlobalContext* globalCtx);
void func_80AEEF5C(EnRu1* this, GlobalContext* globalCtx);
void func_80AEF9D8(EnRu1* this, GlobalContext* globalCtx);
void func_80AEFA2C(EnRu1* this, GlobalContext* globalCtx);
void func_80AEFAAC(EnRu1* this, GlobalContext* globalCtx);
void func_80AEFB04(EnRu1* this, GlobalContext* globalCtx);
void func_80AEFB68(EnRu1* this, GlobalContext* globalCtx);
void func_80AEFCE8(EnRu1* this, GlobalContext* globalCtx);
void func_80AEFBC8(EnRu1* this, GlobalContext* globalCtx);
void func_80AEFC24(EnRu1* this, GlobalContext* globalCtx);
void func_80AEFECC(EnRu1* this, GlobalContext* globalCtx);
void func_80AEFF40(EnRu1* this, GlobalContext* globalCtx);

void func_80AF0278(EnRu1* this, GlobalContext* globalCtx, s32 limbIndex, Vec3s* rot);

void func_80AF03F4(EnRu1* this, GlobalContext* globalCtx);
void func_80AF0400(EnRu1* this, GlobalContext* globalCtx);
void func_80AF05D4(EnRu1* this, GlobalContext* globalCtx);

static ColliderCylinderInitType1 sCylinderInit1 = {
    {
        COLTYPE_HIT0,
        AT_NONE,
        AC_NONE,
        OC1_ON | OC1_TYPE_PLAYER,
        COLSHAPE_CYLINDER,
    },
    { 0x00, { 0x00000000, 0x00, 0x00 }, { 0x00000000, 0x00, 0x00 }, 0x00, 0x00, 0x01 },
    { 25, 80, 0, { 0 } },
};

static ColliderCylinderInitType1 sCylinderInit2 = {
    {
        COLTYPE_HIT0,
        AT_ON | AT_TYPE_PLAYER,
        AC_NONE,
        OC1_ON | OC1_TYPE_PLAYER,
        COLSHAPE_CYLINDER,
    },
    { 0x00, { 0x00000101, 0x00, 0x00 }, { 0x00000000, 0x00, 0x00 }, 0x01, 0x00, 0x01 },
    { 20, 30, 0, { 0 } },
};

static UNK_PTR D_80AF0858[] = {
    0x0600E3B8, 0x0600F238, 0x0600F638, 0x0600FE38, 0x06010238, 0x06010A38,
};

static UNK_PTR D_80AF0870[] = {
    0x0600E838,
    0x0600FA38,
    0x06010638,
};

static s32 sUnused = 0;

#include "z_en_ru1_cutscene_data.c" EARLY

static u32 D_80AF1938 = 0;

static EnRu1ActionFunc sActionFuncs[] = {
    func_80AEC0B4, func_80AEC100, func_80AEC130, func_80AEC17C, func_80AEC1D4, func_80AEC244, func_80AEC2C0,
    func_80AECA94, func_80AECAB4, func_80AECAD4, func_80AECB18, func_80AECB60, func_80AECBB8, func_80AECC1C,
    func_80AECC84, func_80AED304, func_80AED324, func_80AED344, func_80AED374, func_80AED3A4, func_80AED3E0,
    func_80AED414, func_80AEF29C, func_80AEF2AC, func_80AEF2D0, func_80AEF354, func_80AEF3A8, func_80AEEBD4,
    func_80AEEC5C, func_80AEECF0, func_80AEED58, func_80AEEDCC, func_80AEEE34, func_80AEEE9C, func_80AEEF08,
    func_80AEEF5C, func_80AEF9D8, func_80AEFA2C, func_80AEFAAC, func_80AEFB04, func_80AEFB68, func_80AEFCE8,
    func_80AEFBC8, func_80AEFC24, func_80AEFECC, func_80AEFF40,
};

static EnRu1PreLimbDrawFunc sPreLimbDrawFuncs[] = {
    func_80AF0278,
};

static Vec3f sMultVec = { 0.0f, 10.0f, 0.0f };

static EnRu1DrawFunc sDrawFuncs[] = {
    func_80AF03F4,
    func_80AF0400,
    func_80AF05D4,
};

const ActorInit En_Ru1_InitVars = {
    ACTOR_EN_RU1,
    ACTORCAT_NPC,
    FLAGS,
    OBJECT_RU1,
    sizeof(EnRu1),
    (ActorFunc)EnRu1_Init,
    (ActorFunc)EnRu1_Destroy,
    (ActorFunc)EnRu1_Update,
    (ActorFunc)EnRu1_Draw,
};

extern AnimationHeader D_06000690;
extern AnimationHeader D_06000E54;
extern AnimationHeader D_06001488;
extern AnimationHeader D_06002058;
extern AnimationHeader D_06002990;
extern AnimationHeader D_06002EC0;
extern AnimationHeader D_06003608;
extern AnimationHeader D_06003784;
extern AnimationHeader D_06004074;
extern AnimationHeader D_06004350;
extern AnimationHeader D_06004648;
extern AnimationHeader D_06004BF0;
extern AnimationHeader D_060063F4;
extern AnimationHeader D_06006B9C;
extern AnimationHeader D_06007534;
extern AnimationHeader D_060078E4;
extern AnimationHeader D_06008100;
extern AnimationHeader D_06008AA8;
extern AnimationHeader D_06009060;
extern AnimationHeader D_060097B8;
extern FlexSkeletonHeader D_06012700;
extern AnimationHeader D_06012E94;
extern AnimationHeader D_06013A64;

void func_80AEAC10(EnRu1* this, GlobalContext* globalCtx) {
    s32 pad[5];

    Collider_UpdateCylinder(&this->actor, &this->collider);
    CollisionCheck_SetOC(globalCtx, &globalCtx->colChkCtx, &this->collider.base);
}

void func_80AEAC54(EnRu1* this, GlobalContext* globalCtx) {
    s32 pad[5];

    Collider_UpdateCylinder(&this->actor, &this->collider2);
    if (this->unk_34C != 0) {
        CollisionCheck_SetOC(globalCtx, &globalCtx->colChkCtx, &this->collider2.base);
    } else if (this->actor.xzDistToPlayer > 32.0f) {
        this->unk_34C = 1;
    }
}

void func_80AEACDC(EnRu1* this, GlobalContext* globalCtx) {
    s32 pad[5];

    Collider_UpdateCylinder(&this->actor, &this->collider2);
    CollisionCheck_SetAT(globalCtx, &globalCtx->colChkCtx, &this->collider2.base);
}

void func_80AEAD20(Actor* thisx, GlobalContext* globalCtx) {
    EnRu1* this = THIS;

    Collider_InitCylinder(globalCtx, &this->collider);
    Collider_SetCylinderType1(globalCtx, &this->collider, &this->actor, &sCylinderInit1);

    Collider_InitCylinder(globalCtx, &this->collider2);
    Collider_SetCylinderType1(globalCtx, &this->collider2, &this->actor, &sCylinderInit2);
}

void func_80AEAD98(EnRu1* this, GlobalContext* globalCtx) {
    Collider_DestroyCylinder(globalCtx, &this->collider);
    Collider_DestroyCylinder(globalCtx, &this->collider2);
}

void func_80AEADD8(EnRu1* this) {
    this->unk_34C = 0;
}

u8 func_80AEADE0(EnRu1* this) {
    u8 params = this->actor.params >> 8;

    return params;
}

u8 func_80AEADF0(EnRu1* this) {
    s16 params = this->actor.params;

    return params;
}

void EnRu1_Destroy(Actor* thisx, GlobalContext* globalCtx) {
    EnRu1* this = THIS;

    func_80AEAD98(this, globalCtx);
}

void func_80AEAE1C(EnRu1* this) {
    s32 pad[3];
    s16* unk_25E = &this->unk_25E;
    s16* unk_25C = &this->unk_25C;

    if (DECR(*unk_25E) == 0) {
        *unk_25E = Rand_S16Offset(0x3C, 0x3C);
    }

    *unk_25C = *unk_25E;
    if (*unk_25C >= 3) {
        *unk_25C = 0;
    }
}

void func_80AEAEA4(EnRu1* this, s16 arg1) {
    this->unk_25C = arg1;
}

void func_80AEAEB8(EnRu1* this, s16 arg1) {
    this->unk_260 = arg1;
}

void func_80AEAECC(EnRu1* this, GlobalContext* globalCtx) {
    f32* velocityY = &this->actor.velocity.y;
    f32 velocityYHeld = *velocityY;

    *velocityY = -4.0f;
    Actor_UpdateBgCheckInfo(globalCtx, &this->actor, 19.0f, 25.0f, 30.0f, 7);
    *velocityY = velocityYHeld;
}

s32 func_80AEAF38(GlobalContext* globalCtx) {
    if (globalCtx->csCtx.state == 0) {
        return 1;
    }
    return 0;
}

CsCmdActorAction* func_80AEAF58(GlobalContext* globalCtx, s32 npcActionIdx) {
    s32 pad[2];
    CsCmdActorAction* ret = NULL;

    if (!func_80AEAF38(globalCtx)) {
        ret = globalCtx->csCtx.npcActions[npcActionIdx];
    }
    return ret;
}

s32 func_80AEAFA0(GlobalContext* globalCtx, u16 action, s32 npcActionIdx) {
    CsCmdActorAction* csCmdNPCAction = func_80AEAF58(globalCtx, npcActionIdx);

    if ((csCmdNPCAction != NULL) && (csCmdNPCAction->action == action)) {
        return 1;
    }
    return 0;
}

s32 func_80AEAFE0(GlobalContext* globalCtx, u16 action, s32 npcActionIdx) {
    CsCmdActorAction* csCmdNPCAction = func_80AEAF58(globalCtx, npcActionIdx);

    if ((csCmdNPCAction != NULL) && (csCmdNPCAction->action != action)) {
        return 1;
    }
    return 0;
}

s32 func_80AEB020(EnRu1* this, GlobalContext* globalCtx) {
    Actor* actorIt = globalCtx->actorCtx.actorLists[ACTORCAT_NPC].head;
    EnRu1* someEnRu1;

    while (actorIt != NULL) {
        if (actorIt->id == ACTOR_EN_RU1) {
            someEnRu1 = actorIt;
            if (someEnRu1 != this) {
                if ((someEnRu1->action == 31) || (someEnRu1->action == 32) || (someEnRu1->action == 24)) {
                    return 1;
                }
            }
        }
        actorIt = actorIt->next;
    }
    return 0;
}

BgBdanObjects* func_80AEB088(GlobalContext* globalCtx) {
    Actor* actorIt = globalCtx->actorCtx.actorLists[ACTORCAT_BG].head;

    while (actorIt != NULL) {
        if (actorIt->id == ACTOR_BG_BDAN_OBJECTS && actorIt->params == 0) {
            return (BgBdanObjects*)actorIt;
        }
        actorIt = actorIt->next;
    }
    osSyncPrintf(VT_FGCOL(RED) "お立ち台が無い!!!!!!!!!!!!!!!!!!!!!!!!!\n" VT_RST);
    return NULL;
}

void func_80AEB0EC(EnRu1* this, s32 cameraSetting) {
    if (this->unk_28C != NULL) {
        this->unk_28C->cameraSetting = cameraSetting;
    }
}

s32 func_80AEB104(EnRu1* this) {
    if (this->unk_28C != NULL) {
        return this->unk_28C->cameraSetting;
    } else {
        return 0;
    }
}

Actor* func_80AEB124(GlobalContext* globalCtx) {
    Actor* actorIt = globalCtx->actorCtx.actorLists[ACTORCAT_BOSS].head;

    while (actorIt != NULL) {
        if ((actorIt->id == ACTOR_DEMO_EFFECT) && ((actorIt->params & 0xFF) == 0x15)) {
            return actorIt;
        }
        actorIt = actorIt->next;
    }
    return NULL;
}

s32 func_80AEB174(GlobalContext* globalCtx) {
    return (func_8010BDBC(&globalCtx->msgCtx) == 5) && (func_80106BC8(globalCtx));
}

s32 func_80AEB1B4(GlobalContext* globalCtx) {
    return func_8010BDBC(&globalCtx->msgCtx) == 2;
}

void func_80AEB1D8(EnRu1* this) {
    Actor* thisx = &this->actor;

    this->action = 36;
    this->drawConfig = 0;
    thisx->velocity.x = 0.0f;
    thisx->velocity.y = 0.0f;
    thisx->velocity.z = 0.0f;
    thisx->speedXZ = 0.0f;
    thisx->gravity = 0.0f;
    thisx->minVelocityY = 0.0f;
    func_80AEB0EC(this, 0);
}

void func_80AEB220(EnRu1* this, GlobalContext* globalCtx) {
    if ((func_80AEAF38(globalCtx)) && (this->actor.params == 0xA)) {
        func_80AEB1D8(this);
    }
}

void func_80AEB264(EnRu1* this, AnimationHeader* animation, u8 arg2, f32 transitionRate, s32 arg4) {
    s32 pad[2];
    AnimationHeader* animHeader = SEGMENTED_TO_VIRTUAL(animation);
    f32 frameCount = Animation_GetLastFrame(animHeader);
    f32 playbackSpeed;
    f32 unk0;
    f32 fc;

    if (arg4 == 0) {
        unk0 = 0.0f;
        fc = frameCount;
        playbackSpeed = 1.0f;
    } else {
        unk0 = frameCount;
        fc = 0.0f;
        playbackSpeed = -1.0f;
    }

    Animation_Change(&this->skelAnime, animHeader, playbackSpeed, unk0, fc, arg2, transitionRate);
}

s32 EnRu1_FrameUpdateMatrix(EnRu1* this) {
    // why?
    if (this->action != 32) {
        return SkelAnime_Update(&this->skelAnime);
    } else {
        return SkelAnime_Update(&this->skelAnime);
    }
}

void func_80AEB364(EnRu1* this, GlobalContext* globalCtx) {
    this->skelAnime.moveFlags |= 1;
    AnimationContext_SetMoveActor(globalCtx, &this->actor, &this->skelAnime, 1.0f);
}

void func_80AEB3A4(EnRu1* this, GlobalContext* globalCtx) {
    this->skelAnime.moveFlags |= 1;
    func_80AEB364(this, globalCtx);
}

void func_80AEB3CC(EnRu1* this) {
    this->skelAnime.moveFlags &= ~0x1;
}

void func_80AEB3DC(EnRu1* this, GlobalContext* globalCtx) {
    func_80AEB264(this, &D_06000690, 0, 0, 0);
    this->action = 0;
    this->drawConfig = 1;
    func_80AEAEA4(this, 4);
    func_80AEAEB8(this, 0);
}

CsCmdActorAction* func_80AEB438(GlobalContext* globalCtx) {
    return func_80AEAF58(globalCtx, 3);
}

s32 func_80AEB458(GlobalContext* globalCtx, u16 action) {
    return func_80AEAFA0(globalCtx, action, 3);
}

s32 func_80AEB480(GlobalContext* globalCtx, u16 action) {
    return func_80AEAFE0(globalCtx, action, 3);
}

void EnRu1_SpawnRipple(EnRu1* this, GlobalContext* globalCtx, s16 radiusMax, s16 life) {
    Vec3f pos;
    Actor* thisx = &this->actor;

    pos.x = thisx->world.pos.x;
    pos.y = thisx->world.pos.y + thisx->yDistToWater;
    pos.z = thisx->world.pos.z;
    EffectSsGRipple_Spawn(globalCtx, &pos, 100, radiusMax, life);
}

void func_80AEB50C(EnRu1* this, GlobalContext* globalCtx) {
    this->unk_270 += 1.0f;
    if (this->unk_270 >= kREG(3) + 10.0f) {
        EnRu1_SpawnRipple(this, globalCtx, kREG(1) + 500, 0);
        this->unk_270 = 0.0f;
    }
}

void func_80AEB59C(EnRu1* this, GlobalContext* globalCtx) {
    EnRu1_SpawnRipple(this, globalCtx, kREG(2) + 500, 0);
    EnRu1_SpawnRipple(this, globalCtx, kREG(2) + 500, kREG(3) + 10.0f);
    EnRu1_SpawnRipple(this, globalCtx, kREG(2) + 500, (kREG(3) + 10.0f) * 2.0f);
}

void func_80AEB680(EnRu1* this, GlobalContext* globalCtx) {
    Vec3f pos;
    Actor* thisx = &this->actor;

    pos.x = thisx->world.pos.x;
    pos.y = thisx->world.pos.y + thisx->yDistToWater;
    pos.z = thisx->world.pos.z;

    EffectSsGSplash_Spawn(globalCtx, &pos, 0, 0, 1, 0);
}

void func_80AEB6E0(EnRu1* this, GlobalContext* globalCtx) {
    SkelAnime* skelAnime = &this->skelAnime;

    if (skelAnime->baseTransl.y < skelAnime->jointTable[0].y) {
        skelAnime->moveFlags |= 3;
        AnimationContext_SetMoveActor(globalCtx, &this->actor, skelAnime, 1.0f);
    }
}

void func_80AEB738(EnRu1* this, GlobalContext* globalCtx) {
    SkelAnime* skelAnime = &this->skelAnime;

    skelAnime->baseTransl = skelAnime->jointTable[0];
    skelAnime->prevTransl = skelAnime->jointTable[0];
    if (skelAnime->baseTransl.y < skelAnime->jointTable[0].y) {
        skelAnime->moveFlags |= 3;
        AnimationContext_SetMoveActor(globalCtx, &this->actor, skelAnime, 1.0f);
    }
}

void func_80AEB7D0(EnRu1* this) {
    this->skelAnime.moveFlags &= ~0x3;
}

f32 func_80AEB7E0(CsCmdActorAction* csCmdNPCAction, GlobalContext* globalCtx) {
    s32 csCtxFrames = globalCtx->csCtx.frames;
    if ((csCtxFrames < csCmdNPCAction->endFrame) && (csCmdNPCAction->endFrame - csCmdNPCAction->startFrame > 0)) {
        return (Math_CosS(((csCtxFrames - csCmdNPCAction->startFrame) /
                           (f32)(csCmdNPCAction->endFrame - csCmdNPCAction->startFrame)) *
                          32768.0f) *
                -0.5f) +
               0.5f;
    }
    return 1.0f;
}

f32 func_80AEB87C(f32 arg0, s32 arg1, s32 arg2) {
    return (((f32)arg2 - arg1) * arg0) + arg1;
}

void func_80AEB89C(EnRu1* this, GlobalContext* globalCtx) {
    Actor* thisx = &this->actor;
    CsCmdActorAction* npcAction = func_80AEB438(globalCtx);
    s16 npcActionRotY;

    if (npcAction != NULL) {
        npcActionRotY = npcAction->rot.y;
        thisx->shape.rot.y = npcActionRotY;
        thisx->world.rot.y = npcActionRotY;
        thisx->world.pos.x = npcAction->startPos.x;
        thisx->world.pos.y = npcAction->startPos.y;
        thisx->world.pos.z = npcAction->startPos.z;
    }
}

void func_80AEB914(EnRu1* this, GlobalContext* globalCtx) {
    func_80AEB89C(this, globalCtx);
}

void func_80AEB934(EnRu1* this, GlobalContext* globalCtx) {
    func_80AEB89C(this, globalCtx);
}

void func_80AEB954(EnRu1* this, GlobalContext* globalCtx) {
    func_80AEB6E0(this, globalCtx);
}

void func_80AEB974(EnRu1* this, GlobalContext* globalCtx) {
    Vec3f* thisPos;
    f32 sp30;
    CsCmdActorAction* csCmdNPCAction = func_80AEB438(globalCtx);
    Actor* thisx = &this->actor;

    if (csCmdNPCAction != NULL) {
        sp30 = func_80AEB7E0(csCmdNPCAction, globalCtx);
        thisPos = &thisx->world.pos;
        thisPos->x = func_80AEB87C(sp30, csCmdNPCAction->startPos.x, csCmdNPCAction->endPos.x);
        thisPos->y = func_80AEB87C(sp30, csCmdNPCAction->startPos.y, csCmdNPCAction->endPos.y);
        thisPos->z = func_80AEB87C(sp30, csCmdNPCAction->startPos.z, csCmdNPCAction->endPos.z);
    }
}

void func_80AEBA0C(EnRu1* this, GlobalContext* globalCtx) {
    func_80AEB6E0(this, globalCtx);
}

void func_80AEBA2C(EnRu1* this, GlobalContext* globalCtx) {
    s32 pad;
    Vec3f* unk_364 = &this->unk_364;
    Vec3f* thisPos;
    f32 temp_ret_2;
    CsCmdActorAction* csCmdNPCAction = func_80AEB438(globalCtx);
    Actor* thisx = &this->actor;

    if (csCmdNPCAction != NULL) {
        temp_ret_2 = func_80AEB7E0(csCmdNPCAction, globalCtx);
        thisPos = &thisx->world.pos;
        thisPos->x = func_80AEB87C(temp_ret_2, unk_364->x, csCmdNPCAction->endPos.x);
        thisPos->y = func_80AEB87C(temp_ret_2, unk_364->y, csCmdNPCAction->endPos.y);
        thisPos->z = func_80AEB87C(temp_ret_2, unk_364->z, csCmdNPCAction->endPos.z);
    }
}

void func_80AEBAFC(EnRu1* this) {
    if (this->unk_298 == 0) {
        func_80078914(&this->actor.projectedPos, NA_SE_EV_DIVE_INTO_WATER);
        this->unk_298 = 1;
    }
}

void func_80AEBB3C(EnRu1* this) {
    if (Animation_OnFrame(&this->skelAnime, 5.0f)) {
        func_80078914(&this->actor.projectedPos, NA_SE_PL_FACE_UP);
    }
}

void func_80AEBB78(EnRu1* this) {
    SkelAnime* skelAnime = &this->skelAnime;

    if ((((Animation_OnFrame(skelAnime, 4.0f)) || (Animation_OnFrame(skelAnime, 13.0f))) ||
         (Animation_OnFrame(skelAnime, 22.0f))) ||
        (Animation_OnFrame(skelAnime, 31.0f))) {
        func_80078914(&this->actor.projectedPos, NA_SE_PL_SWIM);
    }
}

void func_80AEBBF4(EnRu1* this) {
    if (Animation_OnFrame(&this->skelAnime, 8.0f)) {
        func_80078914(&this->actor.projectedPos, NA_SE_PL_SUBMERGE);
    }
}

void func_80AEBC30(GlobalContext* globalCtx) {
    Player* player;

    if (globalCtx->csCtx.frames == 0xCD) {
        player = PLAYER;
        Audio_PlaySoundGeneral(NA_SE_EV_DIVE_INTO_WATER, &player->actor.projectedPos, 4, &D_801333E0, &D_801333E0,
                               &D_801333E8);
    }
}

void func_80AEBC84(EnRu1* this, GlobalContext* globalCtx) {
    if (globalCtx->csCtx.frames == 0x82) {
        func_80078914(&this->actor.projectedPos, NA_SE_VO_RT_LAUGH_0);
    }
}

void func_80AEBCB8(EnRu1* this, UNK_TYPE arg1) {
    if (arg1 != 0) {
        Animation_Change(&this->skelAnime, &D_06012E94, 1.0f, 0, Animation_GetLastFrame(&D_06012E94), ANIMMODE_LOOP,
                         -8.0f);
    }
}

void func_80AEBD1C(EnRu1* this, GlobalContext* globalCtx) {
    if (func_80AEB480(globalCtx, 2)) {
        this->action = 1;
        this->drawConfig = 0;
        func_80AEB914(this, globalCtx);
        func_80AEAECC(this, globalCtx);
        func_80AEB680(this, globalCtx);
        func_80AEB59C(this, globalCtx);
    }
}

void func_80AEBD94(EnRu1* this, GlobalContext* globalCtx) {
    s32 pad[2];
    f32 frameCount;

    if (func_80AEB480(globalCtx, 3)) {
        frameCount = Animation_GetLastFrame(&D_06009060);
        func_80AEB934(this, globalCtx);
        func_80AEB738(this, globalCtx);
        Animation_Change(&this->skelAnime, &D_06009060, 1.0f, 0.0f, frameCount, ANIMMODE_ONCE, 0.0f);
        this->action = 2;
        this->drawConfig = 1;
    }
}

void func_80AEBE3C(EnRu1* this, GlobalContext* globalCtx, s32 arg2) {
    s32 pad[2];
    f32 frameCount;

    if (arg2 != 0) {
        frameCount = Animation_GetLastFrame(&D_06013A64);
        func_80AEB7D0(this);
        Animation_Change(&this->skelAnime, &D_06013A64, 1.0f, 0, frameCount, ANIMMODE_LOOP, -8.0f);
        this->action = 3;
    } else {
        func_80AEB954(this, globalCtx);
    }
}

void func_80AEBEC8(EnRu1* this, GlobalContext* globalCtx) {
    s32 pad[2];
    f32 frameCount;

    if (func_80AEB458(globalCtx, 6)) {
        frameCount = Animation_GetLastFrame(&D_06008AA8);
        func_80AEB738(this, globalCtx);
        Animation_Change(&this->skelAnime, &D_06008AA8, 1.0f, 0, frameCount, ANIMMODE_ONCE, -8.0f);
        this->action = 4;
    }
}

void func_80AEBF60(EnRu1* this, GlobalContext* globalCtx) {
    if (func_80AEB480(globalCtx, 6)) {
        func_80AEB7D0(this);
        this->action = 5;
        this->unk_364 = this->actor.world.pos;
        return;
    } else {
        func_80AEBA0C(this, globalCtx);
    }
}

void func_80AEBFD8(EnRu1* this, GlobalContext* globalCtx) {
    CsCmdActorAction* csCmdNPCAction = func_80AEB438(globalCtx);
    f32 frameCount;
    u16 csCtxFrames;
    u16 endFrame;

    if (csCmdNPCAction != NULL) {
        csCtxFrames = globalCtx->csCtx.frames;
        endFrame = csCmdNPCAction->endFrame;
        if (csCtxFrames >= endFrame - 2) {
            frameCount = Animation_GetLastFrame(&D_06008100);
            Animation_Change(&this->skelAnime, &D_06008100, 1.0, 0, frameCount, ANIMMODE_ONCE, -8.0f);
            this->action = 6;
        }
    }
}

void func_80AEC070(EnRu1* this, GlobalContext* globalCtx, UNK_TYPE arg2) {
    if ((func_80AEB458(globalCtx, 8)) && (arg2 != 0)) {
        Actor_Kill(&this->actor);
    }
}

void func_80AEC0B4(EnRu1* this, GlobalContext* globalCtx) {
    func_80AEB89C(this, globalCtx);
    EnRu1_FrameUpdateMatrix(this);
    func_80AEBC84(this, globalCtx);
    func_80AEBC30(globalCtx);
    func_80AEBD1C(this, globalCtx);
}

void func_80AEC100(EnRu1* this, GlobalContext* globalCtx) {
    func_80AEBAFC(this);
    func_80AEBD94(this, globalCtx);
}

void func_80AEC130(EnRu1* this, GlobalContext* globalCtx) {
    s32 something = EnRu1_FrameUpdateMatrix(this);

    func_80AEAECC(this, globalCtx);
    func_80AEBB3C(this);
    func_80AEBE3C(this, globalCtx, something);
}

void func_80AEC17C(EnRu1* this, GlobalContext* globalCtx) {
    func_80AEB974(this, globalCtx);
    func_80AEAECC(this, globalCtx);
    EnRu1_FrameUpdateMatrix(this);
    func_80AEB50C(this, globalCtx);
    func_80AEBEC8(this, globalCtx);
}

void func_80AEC1D4(EnRu1* this, GlobalContext* globalCtx) {
    s32 something;

    something = EnRu1_FrameUpdateMatrix(this);
    func_80AEAECC(this, globalCtx);
    func_80AEAE1C(this);
    func_80AEB50C(this, globalCtx);
    func_80AEBCB8(this, something);
    func_80AEBBF4(this);
    func_80AEBF60(this, globalCtx);
}

void func_80AEC244(EnRu1* this, GlobalContext* globalCtx) {
    s32 something;

    something = EnRu1_FrameUpdateMatrix(this);
    func_80AEBA2C(this, globalCtx);
    func_80AEAECC(this, globalCtx);
    func_80AEAE1C(this);
    func_80AEB50C(this, globalCtx);
    func_80AEBCB8(this, something);
    func_80AEBB78(this);
    func_80AEBFD8(this, globalCtx);
}

void func_80AEC2C0(EnRu1* this, GlobalContext* globalCtx) {
    s32 something;

    something = EnRu1_FrameUpdateMatrix(this);
    func_80AEAECC(this, globalCtx);
    func_80AEAE1C(this);
    func_80AEB50C(this, globalCtx);
    func_80AEC070(this, globalCtx, something);
}

void func_80AEC320(EnRu1* this, GlobalContext* globalCtx) {
    Actor* thisx = &this->actor;
    s8 actorRoom;

    if (!(gSaveContext.infTable[20] & 2)) {
        func_80AEB264(this, &D_060097B8, 0, 0, 0);
        this->action = 7;
        func_80AEAEB8(this, 1);
        return;
    }
    if ((gSaveContext.infTable[20] & 0x80) && (!(gSaveContext.infTable[20] & 1)) &&
        (!(gSaveContext.infTable[20] & 0x20))) {
        if (!func_80AEB020(this, globalCtx)) {
            func_80AEB264(this, &D_060097B8, 0, 0, 0);
            actorRoom = thisx->room;
            this->action = 22;
            thisx->room = -1;
            this->drawConfig = 0;
            this->roomNum1 = actorRoom;
            this->roomNum3 = actorRoom;
            this->roomNum2 = actorRoom;
        } else {
            Actor_Kill(thisx);
        }
    } else {
        Actor_Kill(thisx);
    }
}

void func_80AEC40C(EnRu1* this) {
    Actor* thisx = &this->actor;
    f32 unk_26C = this->unk_26C;

    if (unk_26C < 8.0f) {
        thisx->speedXZ = (((kREG(3) * 0.01f) + 2.7f) * 0.125f) * unk_26C;
    } else {
        thisx->speedXZ = (kREG(3) * 0.01f) + 2.7f;
    }
    thisx->velocity.y = -1.0f;
    Actor_MoveForward(thisx);
}

void func_80AEC4CC(EnRu1* this) {
    Actor* thisx = &this->actor;
    thisx->velocity.y = -1.0f;
    Actor_MoveForward(thisx);
}

void func_80AEC4F4(EnRu1* this) {
    Actor* thisx = &this->actor;
    f32* speedXZ = &thisx->speedXZ;
    f32* unk_26C = &this->unk_26C;

    if (this->unk_26C < 8.0f) {
        *unk_26C += 1.0f;
        *speedXZ *= (8.0f - *unk_26C) * 0.125f;
        thisx->velocity.y = -*unk_26C * (((kREG(4) * 0.01f) + 13.0f) * 0.125f);
    } else {
        *speedXZ = 0.0f;
        thisx->velocity.y = -((kREG(4) * 0.01f) + 13.0f);
    }
    Actor_MoveForward(thisx);
}

s32 func_80AEC5FC(EnRu1* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;
    Actor* thisx = &this->actor;
    f32 thisPosZ = thisx->world.pos.z;
    f32 playerPosZ = player->actor.world.pos.z;

    if ((playerPosZ - thisPosZ <= 265.0f) && (player->actor.world.pos.y >= thisx->world.pos.y)) {
        return 1;
    }
    return 0;
}

void func_80AEC650(EnRu1* this) {
    s32 pad[2];
    if (this->unk_280 == 0) {
        if ((Animation_OnFrame(&this->skelAnime, 2.0f)) || (Animation_OnFrame(&this->skelAnime, 7.0f))) {
            func_80078914(&this->actor.projectedPos, NA_SE_PL_WALK_DIRT);
        }
    }
}

void func_80AEC6B0(EnRu1* this) {
    func_80078914(&this->actor.projectedPos, NA_SE_EV_FALL_DOWN_DIRT);
    func_80078914(&this->actor.projectedPos, NA_SE_VO_RT_FALL);
}

void func_80AEC6E4(EnRu1* this, GlobalContext* globalCtx) {
    if ((func_80AEAFA0(globalCtx, 4, 3)) && (this->unk_280 == 0)) {
        Animation_Change(&this->skelAnime, &D_06003784, 1.0f, 0, Animation_GetLastFrame(&D_06003784), ANIMMODE_ONCE,
                         -8.0f);
        this->unk_280 = 1;
        func_80AEC6B0(this);
    }
}

void func_80AEC780(EnRu1* this, GlobalContext* globalCtx) {
    s32 pad;
    Player* player = PLAYER;

    if ((func_80AEC5FC(this, globalCtx)) && (!Gameplay_InCsMode(globalCtx)) && (!(player->stateFlags1 & 0x206000)) &&
        (player->actor.bgCheckFlags & 1)) {

        globalCtx->csCtx.segment = &D_80AF0880;
        gSaveContext.cutsceneTrigger = 1;
        player->linearVelocity = 0.0f;
        this->action = 8;
    }
}

void func_80AEC81C(EnRu1* this, GlobalContext* globalCtx) {
    Actor* thisx = &this->actor;
    CsCmdActorAction* csCmdNPCAction;
    s16 newRotY;

    if (func_80AEAFE0(globalCtx, 1, 3)) {
        csCmdNPCAction = globalCtx->csCtx.npcActions[3];
        thisx->world.pos.x = csCmdNPCAction->startPos.x;
        thisx->world.pos.y = csCmdNPCAction->startPos.y;
        thisx->world.pos.z = csCmdNPCAction->startPos.z;
        newRotY = csCmdNPCAction->rot.y;
        thisx->shape.rot.y = newRotY;
        thisx->world.rot.y = newRotY;
        this->action = 9;
        this->drawConfig = 1;
    }
}

void func_80AEC8B8(EnRu1* this, GlobalContext* globalCtx) {
    if (func_80AEAFA0(globalCtx, 3, 3)) {
        Animation_Change(&this->skelAnime, &D_06004074, 1.0f, 0, Animation_GetLastFrame(&D_06004074), ANIMMODE_ONCE,
                         -8.0f);
        this->action = 10;
    }
}

void func_80AEC93C(EnRu1* this, UNK_TYPE arg1) {
    if (arg1 != 0) {
        Animation_Change(&this->skelAnime, &D_060078E4, 1.0f, 0, Animation_GetLastFrame(&D_060078E4), ANIMMODE_LOOP,
                         -8.0f);
        this->actor.world.rot.y += 0x8000;
        this->action = 0xB;
        this->unk_26C = 0.0f;
    }
}

void func_80AEC9C4(EnRu1* this) {
    this->unk_26C += 1.0f;
    if (this->unk_26C >= 8.0f) {
        this->action = 12;
        this->unk_26C = 0.0f;
        this->actor.velocity.y = -1.0f;
    }
}

void func_80AECA18(EnRu1* this) {
    Actor* thisx = &this->actor;
    if (!(thisx->bgCheckFlags & 1)) {
        this->action = 13;
        this->unk_26C = 0.0f;
        thisx->velocity.y = 0.0f;
    }
}

void func_80AECA44(EnRu1* this, GlobalContext* globalCtx) {
    if (func_80AEAFA0(globalCtx, 5, 3)) {
        gSaveContext.infTable[20] |= 2;
        this->action = 14;
    }
}

void func_80AECA94(EnRu1* this, GlobalContext* globalCtx) {
    func_80AEC780(this, globalCtx);
}

void func_80AECAB4(EnRu1* this, GlobalContext* globalCtx) {
    func_80AEC81C(this, globalCtx);
}

void func_80AECAD4(EnRu1* this, GlobalContext* globalCtx) {
    EnRu1_FrameUpdateMatrix(this);
    func_80AEAE1C(this);
    func_80AEAECC(this, globalCtx);
    func_80AEC8B8(this, globalCtx);
}

void func_80AECB18(EnRu1* this, GlobalContext* globalCtx) {
    s32 something;

    something = EnRu1_FrameUpdateMatrix(this);
    func_80AEAE1C(this);
    func_80AEAECC(this, globalCtx);
    func_80AEC93C(this, something);
}

void func_80AECB60(EnRu1* this, GlobalContext* globalCtx) {
    func_80AEC40C(this);
    EnRu1_FrameUpdateMatrix(this);
    func_80AEAE1C(this);
    func_80AEAECC(this, globalCtx);
    func_80AEC650(this);
    func_80AEC9C4(this);
}

void func_80AECBB8(EnRu1* this, GlobalContext* globalCtx) {
    func_80AEC4CC(this);
    func_80AEC6E4(this, globalCtx);
    EnRu1_FrameUpdateMatrix(this);
    func_80AEAE1C(this);
    func_80AEAECC(this, globalCtx);
    func_80AEC650(this);
    func_80AECA18(this);
}

void func_80AECC1C(EnRu1* this, GlobalContext* globalCtx) {
    func_80AEC4F4(this);
    func_80AEC6E4(this, globalCtx);
    EnRu1_FrameUpdateMatrix(this);
    func_80AEAE1C(this);
    func_80AEAECC(this, globalCtx);
    func_80AEC650(this);
    func_80AECA44(this, globalCtx);
}

void func_80AECC84(EnRu1* this, GlobalContext* globalCtx) {
    if (globalCtx->csCtx.state == 0) {
        Actor_Kill(&this->actor);
    }
}

void func_80AECCB0(EnRu1* this, GlobalContext* globalCtx) {
    Actor* thisx = &this->actor;
    Vec3f* pos;
    s16 yawTowardsPlayer;
    f32 spawnX;
    f32 spawnY;
    f32 spawnZ;
    s32 pad[2];

    yawTowardsPlayer = thisx->yawTowardsPlayer;
    pos = &thisx->world.pos;
    spawnX = ((kREG(1) + 12.0f) * Math_SinS(yawTowardsPlayer)) + pos->x;
    spawnY = pos->y;
    spawnZ = ((kREG(1) + 12.0f) * Math_CosS(yawTowardsPlayer)) + pos->z;
    this->unk_278 = (DoorWarp1*)Actor_SpawnAsChild(&globalCtx->actorCtx, this, globalCtx, ACTOR_DOOR_WARP1, spawnX,
                                                   spawnY, spawnZ, 0, yawTowardsPlayer, 0, 5);
}

void func_80AECDA0(EnRu1* this, GlobalContext* globalCtx) {
    func_80AEB264(this, &D_06000E54, 0, 0, 0);
    this->action = 15;
    this->actor.shape.yOffset = -10000.0f;
    func_80AEAEA4(this, 5);
    func_80AEAEB8(this, 2);
}

void func_80AECE04(EnRu1* this, GlobalContext* globalCtx) {
    this->actor.shape.yOffset += (250.0f / 3.0f);
}

void func_80AECE20(EnRu1* this, GlobalContext* globalCtx) {
    Actor* thisx = &this->actor;
    Player* player = PLAYER;
    Vec3f* playerPos = &player->actor.world.pos;
    s16 shapeRotY = player->actor.shape.rot.y;
    s32 pad;
    f32 unk_27C = this->unk_27C;
    Vec3f* pos = &thisx->world.pos;

    pos->x = (Math_SinS(shapeRotY) * unk_27C) + playerPos->x;
    pos->y = playerPos->y;
    pos->z = (Math_CosS(shapeRotY) * unk_27C) + playerPos->z;
}

void func_80AECEB4(EnRu1* this, GlobalContext* globalCtx) {
    Actor* thisx = &this->actor;
    Player* player = PLAYER;
    Vec3f* player_unk_450 = &player->unk_450;
    Vec3f* pos = &thisx->world.pos;
    s16 shapeRotY = thisx->shape.rot.y;

    player_unk_450->x = ((kREG(2) + 30.0f) * Math_SinS(shapeRotY)) + pos->x;
    player_unk_450->z = ((kREG(2) + 30.0f) * Math_CosS(shapeRotY)) + pos->z;
}

s32 func_80AECF6C(EnRu1* this, GlobalContext* globalCtx) {
    s16* shapeRotY;
    Player* player = PLAYER;
    Player* otherPlayer;
    s16 temp_f16;
    f32 temp1;
    f32 temp2;
    s32 pad2[5];

    this->unk_26C += 1.0f;
    if ((player->actor.speedXZ == 0.0f) && (this->unk_26C >= 3.0f)) {
        otherPlayer = PLAYER;
        player->actor.world.pos.x = otherPlayer->unk_450.x;
        player->actor.world.pos.y = otherPlayer->unk_450.y;
        player->actor.world.pos.z = otherPlayer->unk_450.z;
        shapeRotY = &player->actor.shape.rot.y;
        temp1 = this->actor.world.pos.x - player->actor.world.pos.x;
        temp2 = this->actor.world.pos.z - player->actor.world.pos.z;
        temp_f16 = Math_FAtan2F(temp1, temp2) * 10430.3779296875f;
        if (*shapeRotY != temp_f16) {
            Math_SmoothStepToS(shapeRotY, temp_f16, 0x14, 0x1838, 0x64);
            player->actor.world.rot.y = *shapeRotY;
        } else {
            return 1;
        }
    }
    return 0;
}

s32 func_80AED084(EnRu1* this, UNK_TYPE arg1) {
    if (this->unk_278 != NULL && this->unk_278->unk_1EC == arg1) {
        return 1;
    }
    return 0;
}

void func_80AED0B0(EnRu1* this, UNK_TYPE arg1) {
    if (this->unk_278 != NULL) {
        this->unk_278->unk_1EC = arg1;
    }
}

void func_80AED0C8(EnRu1* this, GlobalContext* globalCtx) {
    this->action = 16;
}

void func_80AED0D8(EnRu1* this, GlobalContext* globalCtx) {
    this->action = 17;
    this->drawConfig = 1;
    this->actor.world.rot.y = this->actor.yawTowardsPlayer;
    this->actor.shape.rot.y = this->actor.yawTowardsPlayer;
    func_80AECCB0(this, globalCtx);
}

void func_80AED110(EnRu1* this) {
    Actor* thisx = &this->actor;
    if (thisx->shape.yOffset >= 0.0f) {
        this->action = 18;
        thisx->shape.yOffset = 0.0f;
        func_80AED0B0(this, 1);
    }
}

void func_80AED154(EnRu1* this, GlobalContext* globalCtx) {
    if (func_80AED084(this, 2)) {
        this->action = 0x13;
        this->unk_26C = 0.0f;
        func_80AECEB4(this, globalCtx);
    }
}

void func_80AED19C(EnRu1* this, s32 cond) {
    if (cond) {
        Animation_Change(&this->skelAnime, &D_06001488, 1.0f, 0, Animation_GetLastFrame(&D_06001488), ANIMMODE_ONCE,
                         -8.0f);
        this->action = 20;
        func_80AED0B0(this, 3);
    }
}

void func_80AED218(EnRu1* this, UNK_TYPE arg1) {
    if (func_80AED084(this, 4)) {
        if (arg1 != 0) {
            Animation_Change(&this->skelAnime, &D_06002058, 1.0f, 0, Animation_GetLastFrame(&D_06002058), ANIMMODE_LOOP,
                             -8.0f);
        }
    } else if (func_80AED084(this, 5)) {
        Animation_Change(&this->skelAnime, &D_06002990, 1.0f, 0, Animation_GetLastFrame(&D_06002990), ANIMMODE_ONCE,
                         -8.0f);
        this->action = 21;
        this->unk_27C = this->actor.xzDistToPlayer;
    }
}

void func_80AED304(EnRu1* this, GlobalContext* globalCtx) {
    func_80AED0C8(this, globalCtx);
}

void func_80AED324(EnRu1* this, GlobalContext* globalCtx) {
    func_80AED0D8(this, globalCtx);
}

void func_80AED344(EnRu1* this, GlobalContext* globalCtx) {
    func_80AECE04(this, globalCtx);
    EnRu1_FrameUpdateMatrix(this);
    func_80AED110(this);
}

void func_80AED374(EnRu1* this, GlobalContext* globalCtx) {
    EnRu1_FrameUpdateMatrix(this);
    func_80AED154(this, globalCtx);
}

void func_80AED3A4(EnRu1* this, GlobalContext* globalCtx) {
    EnRu1_FrameUpdateMatrix(this);
    func_80AED19C(this, func_80AECF6C(this, globalCtx));
}

void func_80AED3E0(EnRu1* this, GlobalContext* globalCtx) {
    func_80AEAECC(this, globalCtx);
    func_80AED218(this, EnRu1_FrameUpdateMatrix(this));
}

void func_80AED414(EnRu1* this, GlobalContext* globalCtx) {
    func_80AECE20(this, globalCtx);
    func_80AEAECC(this, globalCtx);
    EnRu1_FrameUpdateMatrix(this);
}

void func_80AED44C(EnRu1* this, GlobalContext* globalCtx) {
    Actor* thisx = &this->actor;
    s8 actorRoom;

    if ((gSaveContext.infTable[20] & 2) && (!(gSaveContext.infTable[20] & 0x20)) &&
        (!(gSaveContext.infTable[20] & 1)) && (!(gSaveContext.infTable[20] & 0x80))) {
        if (!func_80AEB020(this, globalCtx)) {
            func_80AEB264(this, &D_060097B8, 0, 0, 0);
            actorRoom = thisx->room;
            this->action = 22;
            thisx->room = -1;
            this->roomNum1 = actorRoom;
            this->roomNum3 = actorRoom;
            this->roomNum2 = actorRoom;
        } else {
            Actor_Kill(thisx);
        }
    } else {
        Actor_Kill(thisx);
    }
}

void func_80AED4FC(EnRu1* this) {
    func_80078914(&this->actor.projectedPos, NA_SE_EV_LAND_DIRT);
}

void func_80AED520(EnRu1* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;

    Audio_PlaySoundGeneral(NA_SE_PL_PULL_UP_RUTO, &player->actor.projectedPos, 4, &D_801333E0, &D_801333E0,
                           &D_801333E8);
    func_80078914(&this->actor.projectedPos, NA_SE_VO_RT_LIFT);
}

void func_80AED57C(EnRu1* this) {
    if (this->actor.speedXZ != 0.0f) {
        func_80078914(&this->actor.projectedPos, NA_SE_VO_RT_THROW);
    }
}

void func_80AED5B8(EnRu1* this) {
    func_80078914(&this->actor.projectedPos, NA_SE_VO_RT_CRASH);
}

void func_80AED5DC(EnRu1* this) {
    func_80078914(&this->actor.projectedPos, NA_SE_VO_RT_UNBALLANCE);
}

void func_80AED600(EnRu1* this) {
    func_80078914(&this->actor.projectedPos, NA_SE_VO_RT_DISCOVER);
}

s32 func_80AED624(EnRu1* this, GlobalContext* globalCtx) {
    Actor* thisx = &this->actor;
    s8 curRoomNum = globalCtx->roomCtx.curRoom.num;

    if (this->roomNum2 != curRoomNum) {
        Actor_Kill(thisx);
        return 0;
    } else if (((this->roomNum1 != curRoomNum) || (this->roomNum2 != curRoomNum)) &&
               (thisx->yDistToWater > kREG(16) + 50.0f) && (this->action != 33)) {
        this->action = 33;
        this->drawConfig = 2;
        this->unk_2A8 = 0xFF;
        this->unk_2A4 = 0.0f;
    }
    return 1;
}

void func_80AED6DC(EnRu1* this, GlobalContext* globalCtx) {
    s8 curRoomNum = globalCtx->roomCtx.curRoom.num;

    this->roomNum2 = curRoomNum;
    this->unk_288 = 0.0f;
}

void func_80AED6F8(GlobalContext* globalCtx) {
    s8 curRoomNum;

    if ((!(gSaveContext.infTable[20] & 0x80))) {
        curRoomNum = globalCtx->roomCtx.curRoom.num;
        if (curRoomNum == 2) {
            gSaveContext.infTable[20] |= 0x80;
        }
    }
}

void func_80AED738(EnRu1* this, GlobalContext* globalCtx) {
    u32 temp_v0;

    if (func_80AED624(this, globalCtx)) {
        this->unk_2A4 += 1.0f;
        if (this->unk_2A4 < 20.0f) {
            temp_v0 = ((20.0f - this->unk_2A4) * 255.0f) / 20.0f;
            this->unk_2A8 = temp_v0;
            this->actor.shape.shadowAlpha = temp_v0;
        } else {
            Actor_Kill(&this->actor);
        }
    }
}

void func_80AED83C(EnRu1* this) {
    s32 pad2[2];
    Vec3s* tempPtr;
    Vec3s* tempPtr2;

    tempPtr = &this->unk_374.unk_08;
    Math_SmoothStepToS(&tempPtr->x, 0, 0x14, 0x1838, 0x64);
    Math_SmoothStepToS(&tempPtr->y, 0, 0x14, 0x1838, 0x64);
    tempPtr2 = &this->unk_374.unk_0E;
    Math_SmoothStepToS(&tempPtr2->x, 0, 0x14, 0x1838, 0x64);
    Math_SmoothStepToS(&tempPtr2->y, 0, 0x14, 0x1838, 0x64);
}

void func_80AED8DC(EnRu1* this) {
    s32 temp_hi;
    s16* unk_2AC = &this->unk_2AC;
    s16* someY = &this->unk_374.unk_08.y;
    s16* unk_29E = &this->unk_29E;
    s32 pad[2];

    if (DECR(*unk_2AC) == 0) {
        *unk_2AC = Rand_S16Offset(0xA, 0x19);
        temp_hi = *unk_2AC % 5;
        if (temp_hi == 0) {
            this->unk_2B0 = 1;
        } else if (temp_hi == 1) {
            this->unk_2B0 = 2;
        } else {
            this->unk_2B0 = 0;
        }
        *unk_29E = 0;
    }

    if (this->unk_2B0 == 0) {
        Math_SmoothStepToS(unk_29E, 0 - *someY, 1, 0x190, 0x190);
        Math_SmoothStepToS(someY, 0, 3, ABS(*unk_29E), 0x64);
    } else if (this->unk_2B0 == 1) {
        Math_SmoothStepToS(unk_29E, -0x2AAA - *someY, 1, 0x190, 0x190);
        Math_SmoothStepToS(someY, -0x2AAA, 3, ABS(*unk_29E), 0x64);
    } else {
        Math_SmoothStepToS(unk_29E, 0x2AAA - *someY, 1, 0x190, 0x190);
        Math_SmoothStepToS(someY, 0x2AAA, 3, ABS(*unk_29E), 0x64);
    }
}

void func_80AEDAE0(EnRu1* this, GlobalContext* globalCtx) {
    Actor* thisx = &this->actor;
    Actor* dyna = DynaPoly_GetActor(&globalCtx->colCtx, thisx->floorBgId);

    if (dyna == NULL || dyna->id == ACTOR_EN_BOX) {
        thisx->bgCheckFlags &= ~0x19;
    }
}

void func_80AEDB30(EnRu1* this, GlobalContext* globalCtx) {
    Actor* temp_dyna;
    f32* velocityY;
    f32* speedXZ;
    f32* gravity;
    s16 wallYaw;
    s16 rotY;
    s32 temp_a1_2;
    s32 temp_a0;
    s32 phi_v1;

    if (this->actor.bgCheckFlags & 1) {
        velocityY = &this->actor.velocity.y;
        temp_dyna = DynaPoly_GetActor(&globalCtx->colCtx, this->actor.floorBgId);
        if (*velocityY <= 0.0f) {
            speedXZ = &this->actor.speedXZ;
            if (temp_dyna != NULL) {
                if (temp_dyna->id != ACTOR_EN_BOX) {
                    *speedXZ = 0.0f;
                }
            } else {
                if (*speedXZ >= (kREG(27) * 0.01f) + 3.0f) {
                    *speedXZ *= (kREG(19) * 0.01f) + 0.8f;
                } else {
                    *speedXZ = 0.0f;
                }
            }
            gravity = &this->actor.gravity;
            if (temp_dyna != NULL) {
                if (temp_dyna->id != ACTOR_EN_BOX) {
                    *velocityY = 0.0f;
                    this->actor.minVelocityY = 0.0f;
                    *gravity = 0.0f;
                } else {
                    *velocityY *= -1.0f;
                }
            } else {
                *velocityY *= -((kREG(20) * 0.01f) + 0.6f);
                if (*velocityY <= -*gravity * ((kREG(20) * 0.01f) + 0.6f)) {
                    *velocityY = 0.0f;
                    this->actor.minVelocityY = 0.0f;
                    *gravity = 0.0f;
                }
            }
            func_80AED4FC(this);
        }
    }
    if (this->actor.bgCheckFlags & 0x10) {
        speedXZ = &this->actor.speedXZ;
        velocityY = &this->actor.velocity.y;
        if (*speedXZ >= (kREG(27) * 0.01f) + 3.0f) {
            *speedXZ *= (kREG(19) * 0.01f) + 0.8f;
        } else {
            *speedXZ = 0.0f;
        }
        if (*velocityY >= 0.0f) {
            *velocityY *= -((kREG(20) * 0.01f) + 0.6f);
            func_80AED4FC(this);
        }
    }
    if (this->actor.bgCheckFlags & 8) {
        speedXZ = &this->actor.speedXZ;
        if (*speedXZ != 0.0f) {
            rotY = this->actor.world.rot.y;
            wallYaw = this->actor.wallYaw;
            temp_a0 = (wallYaw * 2) - rotY;
            temp_a1_2 = temp_a0 + 0x8000;
            if ((s16)((temp_a0 - wallYaw) + 0x8000) >= 0) {
                phi_v1 = (s16)(temp_a1_2 - wallYaw);
            } else {
                phi_v1 = -(s16)(temp_a1_2 - wallYaw);
            }
            if (phi_v1 < 0x4001) {
                if (*speedXZ >= (kREG(27) * 0.01f) + 3.0f) {
                    *speedXZ *= (kREG(21) * 0.01f) + 0.6f;
                } else {
                    *speedXZ = 0.0f;
                }
                this->actor.world.rot.y = temp_a1_2;
                func_80AED4FC(this);
                func_80AED5B8(this);
            }
        }
    }
}

void func_80AEDEF4(EnRu1* this, GlobalContext* globalCtx) {
    f32* speedXZ = &this->actor.speedXZ;
    Actor* dyna = DynaPoly_GetActor(&globalCtx->colCtx, this->actor.floorBgId);

    if (dyna != NULL && dyna->id == ACTOR_EN_BOX) {
        if (*speedXZ != 0.0f) {
            *speedXZ *= 1.1f;
        } else {
            *speedXZ = 1.0f;
        }
    }
    if (*speedXZ >= (kREG(27) * 0.01f) + 3.0f) {
        *speedXZ *= (kREG(22) * 0.01f) + 0.98f;
    } else {
        *speedXZ = 0.0f;
    }
}

void func_80AEDFF4(EnRu1* this, GlobalContext* globalCtx) {
    func_80AEDB30(this, globalCtx);
    func_80AEDEF4(this, globalCtx);
    Actor_MoveForward(&this->actor);
}

void func_80AEE02C(EnRu1* this) {
    Actor* thisx = &this->actor;

    thisx->velocity.x = 0.0f;
    thisx->velocity.y = 0.0f;
    thisx->velocity.z = 0.0f;
    thisx->speedXZ = 0.0f;
    thisx->gravity = 0.0f;
    thisx->minVelocityY = 0.0f;
}

void func_80AEE050(EnRu1* this) {
    s32 pad;
    f32 sp28;
    f32 sp24;
    f32 temp_f10;
    EnRu1* thisx = this; // necessary to match

    if (this->unk_350 == 0) {
        if ((this->actor.minVelocityY == 0.0f) && (this->actor.speedXZ == 0.0f)) {
            this->unk_350 = 1;
            func_80AEE02C(this);
            this->unk_35C = 0;
            this->unk_358 = (this->actor.yDistToWater - 10.0f) * 0.5f;
            this->unk_354 = this->actor.world.pos.y + thisx->unk_358; // thisx only used here
        } else {
            this->actor.gravity = 0.0f;
            this->actor.minVelocityY *= 0.2f;
            this->actor.velocity.y *= 0.2f;
            if (this->actor.minVelocityY >= -0.1f) {
                this->actor.minVelocityY = 0.0f;
                this->actor.velocity.y = 0.0f;
            }
            this->actor.speedXZ *= 0.5f;
            if (this->actor.speedXZ <= 0.1f) {
                this->actor.speedXZ = 0.0f;
            }
            this->actor.velocity.x = Math_SinS(this->actor.world.rot.y) * this->actor.speedXZ;
            this->actor.velocity.z = Math_CosS(this->actor.world.rot.y) * this->actor.speedXZ;
            func_8002D7EC(this);
        }
    } else {
        if (this->unk_350 == 1) {
            if (this->unk_358 <= 1.0f) {
                func_80AEE02C(this);
                this->unk_350 = 2;
                this->unk_360 = 0.0f;
            } else {
                sp28 = this->unk_358;
                sp24 = this->unk_354;
                temp_f10 = Math_CosS(this->unk_35C) * -sp28;
                this->actor.world.pos.y = temp_f10 + sp24;
                this->unk_35C += 0x3E8;
                this->unk_358 *= 0.95f;
            }
        } else {
            this->unk_360 += 1.0f;
            if (this->unk_360 > 0.0f) {
                this->unk_350 = 3;
            }
        }
    }
}

s32 func_80AEE264(EnRu1* this, GlobalContext* globalCtx) {
    Actor* thisx = &this->actor;

    if (!func_8002F194(thisx, globalCtx)) {
        thisx->flags |= 9;
        if ((gSaveContext.infTable[20] & 8)) {
            thisx->textId = 0x404E;
            func_8002F2F4(thisx, globalCtx);
        } else if (gSaveContext.infTable[20] & 4) {
            thisx->textId = 0x404D;
            func_8002F2F4(thisx, globalCtx);
        } else {
            thisx->textId = 0x404C;
            func_8002F2F4(thisx, globalCtx);
        }
        return 0;
    }
    return 1;
}

void func_80AEE2F8(EnRu1* this, GlobalContext* globalCtx) {
    Actor* dyna;
    s32 floorBgId;
    if ((this->actor.bgCheckFlags & 1) && (this->actor.floorBgId != BGCHECK_SCENE)) {
        floorBgId = this->actor.floorBgId;
        dyna = DynaPoly_GetActor(&globalCtx->colCtx, floorBgId);
        if ((dyna != NULL) && (dyna->id == ACTOR_BG_BDAN_SWITCH)) {
            if (((dyna->params >> 8) & 0x3F) == 0x38) {
                gSaveContext.infTable[20] |= 1;
                return;
            }
        }
    }
    gSaveContext.infTable[20] &= ~0x1;
}

s32 func_80AEE394(EnRu1* this, GlobalContext* globalCtx) {
    s32 pad[2];
    CollisionContext* colCtx;
    DynaPolyActor* dynaActor;
    s32 floorBgId;

    if ((this->actor.bgCheckFlags & 1) && this->actor.floorBgId != BGCHECK_SCENE) {
        colCtx = &globalCtx->colCtx;
        floorBgId = this->actor.floorBgId; // necessary match, can't move this out of this block unfortunately
        dynaActor = DynaPoly_GetActor(colCtx, floorBgId);
        if (dynaActor != NULL && dynaActor->actor.id == ACTOR_BG_BDAN_OBJECTS && dynaActor->actor.params == 0 &&
            !Player_InCsMode(globalCtx) && globalCtx->msgCtx.unk_E300 == 0) {
            func_80AEE02C(this);
            globalCtx->csCtx.segment = &D_80AF10A4;
            gSaveContext.cutsceneTrigger = 1;
            this->action = 36;
            this->drawConfig = 0;
            this->unk_28C = (BgBdanObjects*)dynaActor;
            this->actor.shape.shadowAlpha = 0;
            return 1;
        }
    }
    return 0;
}

void func_80AEE488(EnRu1* this, GlobalContext* globalCtx) {
    Actor* thisx = &this->actor;
    s8 curRoomNum;

    if (Actor_HasParent(thisx, globalCtx)) {
        curRoomNum = globalCtx->roomCtx.curRoom.num;
        this->roomNum3 = curRoomNum;
        this->action = 31;
        func_80AED520(this, globalCtx);
    } else if ((!func_80AEE394(this, globalCtx)) && (!(thisx->bgCheckFlags & 1))) {
        thisx->minVelocityY = -((kREG(24) * 0.01f) + 6.8f);
        thisx->gravity = -((kREG(23) * 0.01f) + 1.3f);
        this->action = 28;
    }
}

void func_80AEE568(EnRu1* this, GlobalContext* globalCtx) {
    Actor* thisx = &this->actor;

    if (!func_80AEE394(this, globalCtx)) {
        if ((thisx->bgCheckFlags & 1) && (thisx->speedXZ == 0.0f) && (thisx->minVelocityY == 0.0f)) {
            func_80AEE02C(this);
            func_8002F580(this, globalCtx);
            this->action = 27;
            func_80AEADD8(this);
        } else if (thisx->yDistToWater > 0.0f) {
            this->action = 29;
            this->unk_350 = 0;
        }
    }
}

void func_80AEE628(EnRu1* this, GlobalContext* globalCtx) {
    s32 pad[2];
    s8 curRoomNum = globalCtx->roomCtx.curRoom.num;

    if (func_80AEAF38(globalCtx)) {
        Animation_Change(&this->skelAnime, &D_06006B9C, 1.0f, 0, Animation_GetLastFrame(&D_06006B9C), ANIMMODE_LOOP,
                         -8.0f);
        gSaveContext.infTable[20] |= 0x10;
        this->action = 31;
    }
    this->roomNum3 = curRoomNum;
}

s32 func_80AEE6D0(EnRu1* this, GlobalContext* globalCtx) {
    s32 pad;
    s8 curRoomNum = globalCtx->roomCtx.curRoom.num;

    if ((!(gSaveContext.infTable[20] & 0x10)) && (func_80AEB124(globalCtx) != 0)) {
        if (!Player_InCsMode(globalCtx)) {
            Animation_Change(&this->skelAnime, &D_06004648, 1.0f, 0, Animation_GetLastFrame(&D_06004350), ANIMMODE_LOOP,
                             -8.0f);
            func_80AED600(this);
            this->action = 34;
            this->unk_26C = 0.0f;
            globalCtx->csCtx.segment = &D_80AF1728;
            gSaveContext.cutsceneTrigger = 1;
        }
        this->roomNum3 = curRoomNum;
        return 1;
    }
    this->roomNum3 = curRoomNum;
    return 0;
}

void func_80AEE7C4(EnRu1* this, GlobalContext* globalCtx) {
    f32 frameCount;
    s32 pad[13];
    Player* player;
    f32* unk_370 = &this->unk_370;

    if (Actor_HasNoParent(this, globalCtx)) {
        frameCount = Animation_GetLastFrame(&D_06006B9C);
        Animation_Change(&this->skelAnime, &D_06006B9C, 1.0f, 0, frameCount, ANIMMODE_LOOP, -8.0f);
        func_80AED6DC(this, globalCtx);
        this->actor.speedXZ *= (kREG(25) * 0.01f) + 1.0f;
        this->actor.velocity.y *= (kREG(26) * 0.01f) + 1.0f;
        this->actor.minVelocityY = -((kREG(24) * 0.01f) + 6.8f);
        this->actor.gravity = -((kREG(23) * 0.01f) + 1.3f);
        func_80AED57C(this);
        this->action = 28;
        *unk_370 = 0.0f;
        return;
    }

    if (func_80AEE6D0(this, globalCtx)) {
        *unk_370 = 0.0f;
        return;
    }

    player = PLAYER;
    if (player->stateFlags2 & 0x10000000) {
        this->unk_370 += 1.0f;
        if (this->action != 32) {
            if (*unk_370 > 30.0f) {
                if (Rand_S16Offset(0, 3) == 0) {
                    frameCount = Animation_GetLastFrame(&D_06004350);
                    Animation_Change(&this->skelAnime, &D_06004350, 1.0f, 0, frameCount, ANIMMODE_LOOP, -8.0f);
                    func_80AED5DC(this);
                    this->action = 32;
                }
                *unk_370 = 0.0f;
            }
        } else {
            if (*unk_370 > 50.0f) {
                frameCount = Animation_GetLastFrame(&D_06006B9C);
                Animation_Change(&this->skelAnime, &D_06006B9C, 1.0f, 0, frameCount, ANIMMODE_LOOP, -8.0f);
                this->action = 31;
                *unk_370 = 0.0f;
            }
        }
    } else {
        frameCount = Animation_GetLastFrame(&D_06006B9C);
        Animation_Change(&this->skelAnime, &D_06006B9C, 1.0f, 0, frameCount, ANIMMODE_LOOP, -8.0f);
        *unk_370 = 0.0f;
    }
}

s32 func_80AEEAC8(EnRu1* this, GlobalContext* globalCtx) {
    if (this->actor.bgCheckFlags & 1) {
        func_80AEE02C(this);
        func_8002F580(this, globalCtx);
        this->action = 27;
        func_80AEADD8(this);
        return 1;
    }
    return 0;
}

void func_80AEEB24(EnRu1* this, GlobalContext* globalCtx) {
    Actor* thisx = &this->actor;

    if ((func_80AEEAC8(this, globalCtx) == 0) && (this->unk_350 == 3)) {
        this->action = 30;
        func_80AEE02C(this);
        thisx->gravity = -0.1f;
        thisx->minVelocityY = -((kREG(18) * 0.1f) + 0.7f);
    }
}

void func_80AEEBB4(EnRu1* this, GlobalContext* globalCtx) {
    func_8002F580(this, globalCtx);
}

void func_80AEEBD4(EnRu1* this, GlobalContext* globalCtx) {
    func_80AED83C(this);
    func_80AEAC54(this, globalCtx);
    func_80AEAECC(this, globalCtx);
    EnRu1_FrameUpdateMatrix(this);
    func_80AEAE1C(this);
    func_80AEEBB4(this, globalCtx);
    func_80AEE488(this, globalCtx);
    func_80AED624(this, globalCtx);
    func_80AEDAE0(this, globalCtx);
}

void func_80AEEC5C(EnRu1* this, GlobalContext* globalCtx) {
    func_80AED83C(this);
    func_80AEACDC(this, globalCtx);
    func_80AEAECC(this, globalCtx);
    func_80AEE2F8(this, globalCtx);
    func_80AEDFF4(this, globalCtx);
    EnRu1_FrameUpdateMatrix(this);
    func_80AEAE1C(this);
    func_80AEE568(this, globalCtx);
    func_80AED624(this, globalCtx);
    func_80AEDAE0(this, globalCtx);
}

void func_80AEECF0(EnRu1* this, GlobalContext* globalCtx) {
    func_80AED83C(this);
    func_80AEAECC(this, globalCtx);
    func_80AEE050(this);
    EnRu1_FrameUpdateMatrix(this);
    func_80AEAE1C(this);
    func_80AEEB24(this, globalCtx);
    func_80AED624(this, globalCtx);
}

void func_80AEED58(EnRu1* this, GlobalContext* globalCtx) {
    func_80AED83C(this);
    func_80AEAECC(this, globalCtx);
    Actor_MoveForward(&this->actor);
    EnRu1_FrameUpdateMatrix(this);
    func_80AEAE1C(this);
    func_80AEEAC8(this, globalCtx);
    func_80AED624(this, globalCtx);
    func_80AEDAE0(this, globalCtx);
}

void func_80AEEDCC(EnRu1* this, GlobalContext* globalCtx) {
    func_80AED8DC(this);
    EnRu1_FrameUpdateMatrix(this);
    func_80AEAECC(this, globalCtx);
    func_80AEE2F8(this, globalCtx);
    func_80AEAE1C(this);
    func_80AED6F8(globalCtx);
    func_80AEE7C4(this, globalCtx);
}

void func_80AEEE34(EnRu1* this, GlobalContext* globalCtx) {
    func_80AED83C(this);
    EnRu1_FrameUpdateMatrix(this);
    func_80AEAECC(this, globalCtx);
    func_80AEE2F8(this, globalCtx);
    func_80AEAE1C(this);
    func_80AED6F8(globalCtx);
    func_80AEE7C4(this, globalCtx);
}

void func_80AEEE9C(EnRu1* this, GlobalContext* globalCtx) {
    func_80AED83C(this);
    func_80AEAECC(this, globalCtx);
    func_80AEDFF4(this, globalCtx);
    EnRu1_FrameUpdateMatrix(this);
    func_80AEAE1C(this);
    func_80AED738(this, globalCtx);
    func_80AED624(this, globalCtx);
}

void func_80AEEF08(EnRu1* this, GlobalContext* globalCtx) {
    func_80AED83C(this);
    EnRu1_FrameUpdateMatrix(this);
    func_80AEAECC(this, globalCtx);
    func_80AEAE1C(this);
    func_80AEE628(this, globalCtx);
}

void func_80AEEF5C(EnRu1* this, GlobalContext* globalCtx) {
}

void func_80AEEF68(EnRu1* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;
    s16 something;

    this->unk_374.unk_18 = player->actor.world.pos;
    this->unk_374.unk_14 = kREG(16) - 3.0f;
    something = kREG(17) + 0xC;
    func_80034A14(&this->actor, &this->unk_374, something, 2);
}

void func_80AEEFEC(EnRu1* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;
    s16 something;

    this->unk_374.unk_18 = player->actor.world.pos;
    this->unk_374.unk_14 = kREG(16) - 3.0f;
    something = kREG(17) + 0xC;
    func_80034A14(&this->actor, &this->unk_374, something, 4);
    this->actor.world.rot.y = this->actor.shape.rot.y;
}

void func_80AEF080(EnRu1* this) {
    if (Animation_OnFrame(&this->skelAnime, 11.0f)) {
        func_80078914(&this->actor.projectedPos, NA_SE_EV_LAND_DIRT);
    }
}

s32 func_80AEF0BC(EnRu1* this, GlobalContext* globalCtx) {
    s32 frameCount;

    if (gSaveContext.infTable[20] & 4) {
        frameCount = Animation_GetLastFrame(&D_06007534);
        Animation_Change(&this->skelAnime, &D_06007534, 1.0f, 0, frameCount, ANIMMODE_ONCE, -8.0f);
        globalCtx->msgCtx.msgMode = 0x37;
        this->action = 26;
        this->actor.flags &= ~0x9;
        return 1;
    }
    return 0;
}

void func_80AEF170(EnRu1* this, GlobalContext* globalCtx, s32 cond) {
    if (cond) {
        this->action = 25;
    }
}

void func_80AEF188(EnRu1* this, GlobalContext* globalCtx) {
    if (func_80AEB174(globalCtx) && !func_80AEF0BC(this, globalCtx)) {
        func_80106CCC(globalCtx);
        gSaveContext.infTable[20] |= 4;
        this->action = 24;
    }
}

void func_80AEF1F0(EnRu1* this, GlobalContext* globalCtx, UNK_TYPE arg2) {
    if (arg2 != 0) {
        Animation_Change(&this->skelAnime, &D_06006B9C, 1.0f, 0.0f, Animation_GetLastFrame(&D_06006B9C), ANIMMODE_LOOP,
                         0.0f);
        func_80106CCC(globalCtx);
        gSaveContext.infTable[20] |= 8;
        func_80AED6DC(this, globalCtx);
        func_8002F580(this, globalCtx);
        this->action = 27;
        func_80AEADD8(this);
    }
}

void func_80AEF29C(EnRu1* this, GlobalContext* globalCtx) {
    this->action = 23;
}

void func_80AEF2AC(EnRu1* this, GlobalContext* globalCtx) {
    this->action = 24;
    this->drawConfig = 1;
    this->actor.flags |= 9;
}

void func_80AEF2D0(EnRu1* this, GlobalContext* globalCtx) {
    s32 cond;

    func_80AEEF68(this, globalCtx);
    EnRu1_FrameUpdateMatrix(this);
    func_80AEAE1C(this);
    func_80AEAC10(this, globalCtx);
    func_80AEAECC(this, globalCtx);
    cond = func_80AEE264(this, globalCtx);
    func_80AED624(this, globalCtx);
    func_80AEF170(this, globalCtx, cond);
}

void func_80AEF354(EnRu1* this, GlobalContext* globalCtx) {
    func_80AEEFEC(this, globalCtx);
    EnRu1_FrameUpdateMatrix(this);
    func_80AEAE1C(this);
    func_80AEAECC(this, globalCtx);
    func_80AEF188(this, globalCtx);
}

void func_80AEF3A8(EnRu1* this, GlobalContext* globalCtx) {
    s32 something;

    func_80AED83C(this);
    something = EnRu1_FrameUpdateMatrix(this);
    func_80AEF080(this);
    func_80AEAE1C(this);
    func_80AEAECC(this, globalCtx);
    func_80AEF1F0(this, globalCtx, something);
}

void func_80AEF40C(EnRu1* this) {
    SkelAnime* skelAnime = &this->skelAnime;

    if ((Animation_OnFrame(skelAnime, 2.0f)) || (Animation_OnFrame(skelAnime, 7.0f)) ||
        (Animation_OnFrame(skelAnime, 12.0f)) || (Animation_OnFrame(skelAnime, 18.0f)) ||
        (Animation_OnFrame(skelAnime, 25.0f)) || (Animation_OnFrame(skelAnime, 33.0f))) {
        func_80078914(&this->actor.projectedPos, NA_SE_PL_WALK_DIRT);
    }
}

void func_80AEF4A8(EnRu1* this, GlobalContext* globalCtx) {
    Audio_PlaySoundAtPosition(globalCtx, &this->actor.projectedPos, 20, NA_SE_VO_RT_FALL);
}

void func_80AEF4E0(EnRu1* this) {
    if (Animation_OnFrame(&this->skelAnime, 5.0f)) {
        func_80078914(&this->actor.projectedPos, NA_SE_VO_RT_LAUGH_0);
    }
}

void func_80AEF51C(EnRu1* this) {
    func_80078914(&this->actor.projectedPos, NA_SE_VO_RT_THROW);
}

void func_80AEF540(EnRu1* this) {
    if (func_80AEB104(this) == 2) {
        func_80AEAEA4(this, 3);
        func_80AEAEB8(this, 2);
        if (this->skelAnime.mode != 2) {
            func_80AEB264(this, &D_06004BF0, 2, -8.0f, 0);
            func_80AEF51C(this);
        }
    }
}

void func_80AEF5B8(EnRu1* this) {
    f32 curFrame;

    if (D_80AF1938 == 0) {
        curFrame = this->skelAnime.curFrame;
        if (curFrame >= 60.0f) {
            func_80AEAEA4(this, 3);
            func_80AEAEB8(this, 0);
            func_80AED57C(this);
            D_80AF1938 = 1;
        }
    }
}

void func_80AEF624(EnRu1* this, GlobalContext* globalCtx) {
    Actor* thisx = &this->actor;
    f32 frameCount;
    CsCmdActorAction* csCmdNPCAction;
    CsCmdActorAction* csCmdNPCAction2;
    s16 newRotTmp;

    if (func_80AEAFE0(globalCtx, 1, 3)) {
        frameCount = Animation_GetLastFrame(&D_060063F4);
        // this weird part with the redundant variable is necessary to match for some reason
        csCmdNPCAction2 = globalCtx->csCtx.npcActions[3];
        csCmdNPCAction = csCmdNPCAction2;
        thisx->world.pos.x = csCmdNPCAction->startPos.x;
        thisx->world.pos.y = csCmdNPCAction->startPos.y;
        thisx->world.pos.z = csCmdNPCAction->startPos.z;
        newRotTmp = csCmdNPCAction->rot.x;
        thisx->shape.rot.x = newRotTmp;
        thisx->world.rot.x = newRotTmp;
        newRotTmp = csCmdNPCAction->rot.y;
        thisx->shape.rot.y = newRotTmp;
        thisx->world.rot.y = newRotTmp;
        newRotTmp = csCmdNPCAction->rot.z;
        thisx->shape.rot.z = newRotTmp;
        thisx->world.rot.z = newRotTmp;
        Animation_Change(&this->skelAnime, &D_060063F4, 1.0f, 0.0f, frameCount, ANIMMODE_ONCE, 0.0f);
        func_80AEB3A4(this, globalCtx);
        this->action = 37;
        this->drawConfig = 1;
        thisx->shape.shadowAlpha = 0xFF;
    }
}

void func_80AEF728(EnRu1* this, UNK_TYPE arg1) {
    if (arg1 != 0) {
        Animation_Change(&this->skelAnime, &D_06003608, 1.0f, 0.0f, Animation_GetLastFrame(&D_06003608), ANIMMODE_LOOP,
                         0.0f);
        func_80AEB3CC(this);
        this->action = 38;
    }
}

void func_80AEF79C(EnRu1* this, GlobalContext* globalCtx) {
    if (func_80AEAFE0(globalCtx, 2, 3)) {
        Animation_Change(&this->skelAnime, &D_06002EC0, 1.0f, 0, Animation_GetLastFrame(&D_06002EC0), ANIMMODE_ONCE,
                         -8.0f);
        this->action = 39;
    }
}

void func_80AEF820(EnRu1* this, UNK_TYPE arg1) {
    if (arg1 != 0) {
        Animation_Change(&this->skelAnime, &D_060097B8, 1.0f, 0, Animation_GetLastFrame(&D_060097B8), ANIMMODE_LOOP,
                         -8.0f);
        this->action = 40;
    }
}

void func_80AEF890(EnRu1* this, GlobalContext* globalCtx) {
    s32 pad[2];
    s8 curRoomNum;

    if ((gSaveContext.sceneSetupIndex < 4) && (func_80AEAF38(globalCtx))) {
        curRoomNum = globalCtx->roomCtx.curRoom.num;
        gSaveContext.infTable[20] |= 0x20;
        Flags_SetSwitch(globalCtx, func_80AEADE0(this));
        func_80AEB0EC(this, 1);
        this->action = 42;
        this->actor.room = curRoomNum;
    }
}

void func_80AEF930(EnRu1* this, GlobalContext* globalCtx) {
    Actor* thisx = &this->actor;

    if (func_80AEB104(this) == 3) {
        thisx->flags |= 9;
        thisx->textId = 0x4048;
        func_8010B720(globalCtx, thisx->textId);
        func_80AEF4A8(this, globalCtx);
        this->action = 43;
        this->drawConfig = 0;
    }
}

void func_80AEF99C(EnRu1* this, GlobalContext* globalCtx) {
    if (func_80AEB1B4(globalCtx) != 0) {
        func_80AEB0EC(this, 4);
        Actor_Kill(&this->actor);
    }
}

void func_80AEF9D8(EnRu1* this, GlobalContext* globalCtx) {
    func_80AED83C(this);
    EnRu1_FrameUpdateMatrix(this);
    func_80AEAE1C(this);
    func_80AEF624(this, globalCtx);
    func_80AEB220(this, globalCtx);
}

void func_80AEFA2C(EnRu1* this, GlobalContext* globalCtx) {
    s32 something;

    func_80AED83C(this);
    func_80AEB364(this, globalCtx);
    func_80AEAECC(this, globalCtx);
    something = EnRu1_FrameUpdateMatrix(this);
    func_80AEF4E0(this);
    func_80AEF5B8(this);
    func_80AEF40C(this);
    func_80AEF728(this, something);
    func_80AEB220(this, globalCtx);
}

void func_80AEFAAC(EnRu1* this, GlobalContext* globalCtx) {
    func_80AED83C(this);
    func_80AEAECC(this, globalCtx);
    EnRu1_FrameUpdateMatrix(this);
    func_80AEF79C(this, globalCtx);
    func_80AEB220(this, globalCtx);
}

void func_80AEFB04(EnRu1* this, GlobalContext* globalCtx) {
    s32 something;

    func_80AED83C(this);
    func_80AEAECC(this, globalCtx);
    something = EnRu1_FrameUpdateMatrix(this);
    func_80AEAE1C(this);
    func_80AEF820(this, something);
    func_80AEB220(this, globalCtx);
}

void func_80AEFB68(EnRu1* this, GlobalContext* globalCtx) {
    func_80AED83C(this);
    func_80AEAECC(this, globalCtx);
    EnRu1_FrameUpdateMatrix(this);
    func_80AEAE1C(this);
    func_80AEF890(this, globalCtx);
    func_80AEB220(this, globalCtx);
}

void func_80AEFBC8(EnRu1* this, GlobalContext* globalCtx) {
    func_80AED83C(this);
    func_80AEAECC(this, globalCtx);
    EnRu1_FrameUpdateMatrix(this);
    func_80AEAE1C(this);
    func_80AEF540(this);
    func_80AEF930(this, globalCtx);
}

void func_80AEFC24(EnRu1* this, GlobalContext* globalCtx) {
    func_80AED83C(this);
    func_80AEF99C(this, globalCtx);
}

void func_80AEFC54(EnRu1* this, GlobalContext* globalCtx) {
    Actor* thisx = &this->actor;

    if ((gSaveContext.infTable[20] & 0x20) && (!(gSaveContext.infTable[20] & 0x40))) {
        func_80AEB264(this, &D_060097B8, 0, 0, 0);
        this->action = 41;
        this->unk_28C = func_80AEB088(globalCtx);
        func_80AEB0EC(this, 1);
        thisx->flags &= ~0x9;
    } else {
        Actor_Kill(thisx);
    }
}

void func_80AEFCE8(EnRu1* this, GlobalContext* globalCtx) {
    this->unk_28C = func_80AEB088(globalCtx);
    if (this->unk_28C != NULL) {
        this->action = 42;
        this->drawConfig = 1;
        func_80AEB0EC(this, 1);
    }
}

void func_80AEFD38(EnRu1* this, GlobalContext* globalCtx) {
    Actor* thisx = &this->actor;

    if ((gSaveContext.eventChkInf[3] & 0x80) && (gSaveContext.linkAge == 1)) {
        func_80AEB264(this, &D_060097B8, 0, 0, 0);
        thisx->flags &= ~0x10;
        this->action = 44;
        this->drawConfig = 1;
    } else {
        Actor_Kill(thisx);
    }
}

s32 func_80AEFDC0(EnRu1* this, GlobalContext* globalCtx) {
    Actor* thisx = &this->actor;

    if (!func_8002F194(thisx, globalCtx)) {
        thisx->flags |= 9;
        thisx->textId = Text_GetFaceReaction(globalCtx, 0x1F);
        if (thisx->textId == 0) {
            thisx->textId = 0x402C;
        }
        func_8002F2F4(thisx, globalCtx);
        return 0;
    }
    return 1;
}

s32 func_80AEFE38(EnRu1* this, GlobalContext* globalCtx) {
    if (func_8010BDBC(&globalCtx->msgCtx) == 2) {
        this->actor.flags &= ~0x9;
        return 1;
    }
    return 0;
}

void func_80AEFE84(EnRu1* this, GlobalContext* globalCtx, s32 cond) {
    if (cond) {
        this->action = 45;
    }
}

void func_80AEFE9C(EnRu1* this, GlobalContext* globalCtx) {
    if (func_80AEFE38(this, globalCtx)) {
        this->action = 44;
    }
}

void func_80AEFECC(EnRu1* this, GlobalContext* globalCtx) {
    func_80AEEF68(this, globalCtx);
    EnRu1_FrameUpdateMatrix(this);
    func_80AEAE1C(this);
    func_80AEAC10(this, globalCtx);
    func_80AEAECC(this, globalCtx);
    func_80AEFE84(this, globalCtx, func_80AEFDC0(this, globalCtx));
}

void func_80AEFF40(EnRu1* this, GlobalContext* globalCtx) {
    func_80AEEFEC(this, globalCtx);
    EnRu1_FrameUpdateMatrix(this);
    func_80AEAE1C(this);
    func_80AEAECC(this, globalCtx);
    func_80AEFE9C(this, globalCtx);
}

void func_80AEFF94(EnRu1* this, GlobalContext* globalCtx) {
    Actor* thisx = &this->actor;
    s8 actorRoom;

    if ((gSaveContext.infTable[20] & 2) && (gSaveContext.infTable[20] & 1) && (!(gSaveContext.infTable[20] & 0x20)) &&
        (!(func_80AEB020(this, globalCtx)))) {
        func_80AEB264(this, &D_060097B8, 0, 0, 0);
        actorRoom = thisx->room;
        this->action = 22;
        thisx->room = -1;
        this->drawConfig = 0;
        this->roomNum1 = actorRoom;
        this->roomNum3 = actorRoom;
        this->roomNum2 = actorRoom;
        osSyncPrintf("スイッチルトセット!!!!!!!!!!!!!!!!!!!!!!\n");
    } else {
        osSyncPrintf("スイッチルトセットしない!!!!!!!!!!!!!!!!!!!!!!\n");
        Actor_Kill(thisx);
    }
}

void func_80AF0050(EnRu1* this, GlobalContext* globalCtx) {
    func_80AEB264(this, &D_060097B8, 0, 0, 0);
    this->action = 36;
    this->roomNum1 = this->actor.room;
    this->unk_28C = func_80AEB088(globalCtx);
    this->actor.room = -1;
}

void EnRu1_Update(Actor* thisx, GlobalContext* globalCtx) {
    EnRu1* this = THIS;

    if (this->action < 0 || this->action >= 46 || sActionFuncs[this->action] == NULL) {
        osSyncPrintf(VT_FGCOL(RED) "メインモードがおかしい!!!!!!!!!!!!!!!!!!!!!!!!!\n" VT_RST);
        return;
    }
    sActionFuncs[this->action](this, globalCtx);
}

void EnRu1_Init(Actor* thisx, GlobalContext* globalCtx) {
    EnRu1* this = THIS;
    s32 pad;

    ActorShape_Init(&thisx->shape, 0.0f, ActorShadow_DrawCircle, 30.0f);
    SkelAnime_InitFlex(globalCtx, &this->skelAnime, &D_06012700, NULL, this->jointTable, this->morphTable, 17);
    func_80AEAD20(this, globalCtx);
    switch (func_80AEADF0(this)) {
        case 0:
            func_80AECDA0(this, globalCtx);
            break;
        case 1:
            func_80AEB3DC(this, globalCtx);
            break;
        case 2:
            func_80AEC320(this, globalCtx);
            break;
        case 3:
            func_80AED44C(this, globalCtx);
            break;
        case 4:
            func_80AEFC54(this, globalCtx);
            break;
        case 5:
            func_80AEFD38(this, globalCtx);
            break;
        case 6:
            func_80AEFF94(this, globalCtx);
            break;
        case 10:
            func_80AF0050(this, globalCtx);
            break;
        default:
            Actor_Kill(thisx);
            osSyncPrintf("該当 arge_data = %d 無し\n", func_80AEADF0(this));
            break;
    }
}

void func_80AF0278(EnRu1* this, GlobalContext* globalCtx, s32 limbIndex, Vec3s* rot) {
    Vec3s* vec1 = &this->unk_374.unk_0E;
    Vec3s* vec2 = &this->unk_374.unk_08;

    switch (limbIndex) {
        case 8:
            rot->x += vec1->y;
            rot->y -= vec1->x;
            break;
        case 15:
            rot->x += vec2->y;
            rot->z += vec2->x;
            break;
    }
}

s32 EnRu1_OverrideLimbDraw(GlobalContext* globalCtx, s32 limbIndex, Gfx** dList, Vec3f* pos, Vec3s* rot, void* thisx,
                           Gfx** gfx) {
    EnRu1* this = THIS;

    if ((this->unk_290 < 0) || (this->unk_290 > 0) || (*sPreLimbDrawFuncs[this->unk_290] == NULL)) {
        osSyncPrintf(VT_FGCOL(RED) "首回しモードがおかしい!!!!!!!!!!!!!!!!!!!!!!!!!\n" VT_RST);
    } else {
        sPreLimbDrawFuncs[this->unk_290](this, globalCtx, limbIndex, rot);
    }
    return false;
}

void EnRu1_PostLimbDraw(GlobalContext* globalCtx, s32 limbIndex, Gfx** dList, Vec3s* rot, void* thisx, Gfx** gfx) {
    EnRu1* this = THIS;
    Vec3f vec1;
    Vec3f vec2;

    if (limbIndex == 15) {
        vec1 = sMultVec;
        Matrix_MultVec3f(&vec1, &vec2);
        this->actor.focus.pos.x = vec2.x;
        this->actor.focus.pos.y = vec2.y;
        this->actor.focus.pos.z = vec2.z;
        this->actor.focus.rot.x = this->actor.world.rot.x;
        this->actor.focus.rot.y = this->actor.world.rot.y;
        this->actor.focus.rot.z = this->actor.world.rot.z;
    }
}

void func_80AF03F4(EnRu1* this, GlobalContext* globalCtx) {
}

void func_80AF0400(EnRu1* this, GlobalContext* globalCtx) {
    s32 pad[2];
    s16 temp = this->unk_25C;
    s32 addr1 = D_80AF0858[temp];
    s16 temp2 = this->unk_260;
    SkelAnime* skelAnime = &this->skelAnime;
    s32 addr2 = D_80AF0870[temp2];
    s32 pad1;

    OPEN_DISPS(globalCtx->state.gfxCtx, "../z_en_ru1.c", 1282);

    func_80093D18(globalCtx->state.gfxCtx);

    gSPSegment(POLY_OPA_DISP++, 0x08, SEGMENTED_TO_VIRTUAL(addr1));
    gSPSegment(POLY_OPA_DISP++, 0x09, SEGMENTED_TO_VIRTUAL(addr1));
    gSPSegment(POLY_OPA_DISP++, 0x09, SEGMENTED_TO_VIRTUAL(addr2));
    gDPSetEnvColor(POLY_OPA_DISP++, 0, 0, 0, 255);
    gSPSegment(POLY_OPA_DISP++, 0x0C, &D_80116280[2]);

    POLY_OPA_DISP = SkelAnime_DrawFlex(globalCtx, skelAnime->skeleton, skelAnime->jointTable, skelAnime->dListCount,
                                       EnRu1_OverrideLimbDraw, EnRu1_PostLimbDraw, this, POLY_OPA_DISP);

    CLOSE_DISPS(globalCtx->state.gfxCtx, "../z_en_ru1.c", 1309);
}

void func_80AF05D4(EnRu1* this, GlobalContext* globalCtx) {
    s32 pad[2];
    s16 temp = this->unk_25C;
    s32 addr1 = D_80AF0858[temp];
    s16 temp2 = this->unk_260;
    SkelAnime* skelAnime = &this->skelAnime;
    s32 addr2 = D_80AF0870[temp2];
    s32 pad1;

    OPEN_DISPS(globalCtx->state.gfxCtx, "../z_en_ru1.c", 1324);

    func_80093D84(globalCtx->state.gfxCtx);

    gSPSegment(POLY_XLU_DISP++, 0x08, SEGMENTED_TO_VIRTUAL(addr1));
    gSPSegment(POLY_XLU_DISP++, 0x09, SEGMENTED_TO_VIRTUAL(addr1));
    gSPSegment(POLY_XLU_DISP++, 0x09, SEGMENTED_TO_VIRTUAL(addr2));
    gDPSetEnvColor(POLY_XLU_DISP++, 0, 0, 0, this->unk_2A8);
    gSPSegment(POLY_XLU_DISP++, 0x0C, &D_80116280[0]);

    POLY_XLU_DISP = SkelAnime_DrawFlex(globalCtx, skelAnime->skeleton, skelAnime->jointTable, skelAnime->dListCount,
                                       EnRu1_OverrideLimbDraw, NULL, this, POLY_XLU_DISP);

    CLOSE_DISPS(globalCtx->state.gfxCtx, "../z_en_ru1.c", 1353);
}

void EnRu1_Draw(Actor* thisx, GlobalContext* globalCtx) {
    EnRu1* this = THIS;

    if (this->drawConfig < 0 || this->drawConfig >= 3 || sDrawFuncs[this->drawConfig] == 0) {
        osSyncPrintf(VT_FGCOL(RED) "描画モードがおかしい!!!!!!!!!!!!!!!!!!!!!!!!!\n" VT_RST);
        return;
    }
    sDrawFuncs[this->drawConfig](this, globalCtx);
}
