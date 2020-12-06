#include "z_en_mb.h"

#define FLAGS 0x00000015

#define THIS ((EnMb*)thisx)

void EnMb_Init(Actor* thisx, GlobalContext* globalCtx);
void EnMb_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnMb_Update(Actor* thisx, GlobalContext* globalCtx);
void EnMb_Draw(Actor* thisx, GlobalContext* globalCtx);

const ActorInit En_Mb_InitVars = {
    ACTOR_EN_MB,
    ACTORTYPE_ENEMY,
    FLAGS,
    OBJECT_MB,
    sizeof(EnMb),
    (ActorFunc)EnMb_Init,
    (ActorFunc)EnMb_Destroy,
    (ActorFunc)EnMb_Update,
    (ActorFunc)EnMb_Draw,
};

extern FlexSkeletonHeader D_06008F38;
extern FlexSkeletonHeader D_06014190;
extern AnimationHeader D_060028E0;
extern AnimationHeader D_0600EBE4;
extern AnimationHeader D_060041A8;
extern AnimationHeader D_06009FC0;
extern AnimationHeader D_06002C10;
extern AnimationHeader D_06002F10;
extern AnimationHeader D_06009280;
extern AnimationHeader D_06001950;
extern AnimationHeader D_0600BE58;
extern AnimationHeader D_0600D5D4;
extern AnimationHeader D_0600E18C;
extern AnimationHeader D_0600B4BC;
extern AnimationHeader D_0600ABE0;
extern AnimationHeader D_0600095C;
extern AnimationHeader D_060016B4;
extern AnimationHeader D_060041A8;
extern AnimationHeader D_0600C44C;

void func_80AA68FC(EnMb* this, GlobalContext* globalCtx);
void func_80AA6898(EnMb* this);
void func_80AA7134(EnMb* this, GlobalContext* globalCtx);
void func_80AA6830(EnMb* this);
void func_80AA8E88(EnMb* this);
void func_80AA87D8(EnMb* this, GlobalContext* globalCtx);
void func_80AA77D0(EnMb* this, GlobalContext* globalCtx);
void func_80AA7CAC(EnMb* this, GlobalContext* globalCtx);
void func_80AA7310(EnMb* this, GlobalContext* globalCtx);
void func_80AA702C(EnMb* this, GlobalContext* globalCtx);
void func_80AA8514(EnMb* this, GlobalContext* globalCtx);
void func_80AA840C(EnMb* this, GlobalContext* globalCtx);
void func_80AA8DD8(EnMb* this, GlobalContext* globalCtx);
void func_80AA7938(EnMb* this, GlobalContext* globalCtx);
void func_80AA90A0(EnMb* this, GlobalContext* globalCtx);
void func_80AA8F50(EnMb* this, GlobalContext* globalCtx);
void func_80AA8FC8(EnMb* this);
void func_80AA71AC(EnMb* this, GlobalContext* globalCtx);
void func_80AA8AEC(EnMb* this, GlobalContext* globalCtx);
void func_80AA74BC(EnMb* this, GlobalContext* globalCtx);
void func_80AA800C(EnMb* this, GlobalContext* globalCtx);
void func_80AA7478(EnMb* this, GlobalContext* globalCtx);
void func_80AA8378(EnMb* this, GlobalContext* globalCtx);

void EnMb_SetupAction(EnMb* this, EnMbActionFunc actionFunc) {
    this->actionFunc = actionFunc;
}

static ColliderCylinderInit sCylinderInit = {
    { COLTYPE_UNK0, 0x00, 0x09, 0x39, 0x20, COLSHAPE_CYLINDER },
    { 0x01, { 0x00000000, 0x00, 0x00 }, { 0xFFCFFFFF, 0x00, 0x00 }, 0x00, 0x01, 0x01 },
    { 20, 70, 0, { 0, 0, 0 } },
};

static ColliderTrisItemInit sTrisItemsInit[2] = {
    {
        { 0x02, { 0x00000000, 0x00, 0x00 }, { 0xFFCFFFFF, 0x00, 0x00 }, 0x00, 0x0D, 0x00 },
        { { { -10.0f, 14.0f, 2.0f }, { -10.0f, -6.0f, 2.0f }, { 9.0f, 14.0f, 2.0f } } },
    },
    {
        { 0x02, { 0x00000000, 0x00, 0x00 }, { 0xFFCFFFFF, 0x00, 0x00 }, 0x00, 0x0D, 0x00 },
        { { { -10.0f, -6.0f, 2.0f }, { 9.0f, -6.0f, 2.0f }, { 9.0f, 14.0f, 2.0f } } },
    },
};

static ColliderTrisInit sTrisInit = {
    { COLTYPE_METAL_SHIELD, 0x00, 0x0D, 0x00, 0x00, COLSHAPE_TRIS },
    2,
    sTrisItemsInit,
};

static ColliderQuadInit sQuadInit = {
    { COLTYPE_UNK10, 0x11, 0x00, 0x00, 0x00, COLSHAPE_QUAD },
    { 0x00, { 0xFFCFFFFF, 0x00, 0x08 }, { 0x00000000, 0x00, 0x00 }, 0x01, 0x00, 0x00 },
    { { { 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f } } },
};

static DamageTable sDamageTable = {
    0x50, 0xF2, 0xF1, 0xF2, 0x10, 0xF2, 0xF2, 0xF2, 0xF1, 0xF2, 0xF4, 0xF2, 0x64, 0xF2, 0xF4, 0xF2,
    0xF2, 0x50, 0x63, 0x50, 0x00, 0x00, 0xF1, 0xF4, 0xF2, 0xF2, 0xF8, 0xF4, 0x50, 0x00, 0xF4, 0x00,
};

static DamageTable sBigMoblinDamageTable = {
    0x50, 0xF2, 0x00, 0xF2, 0x00, 0xF2, 0xF2, 0x10, 0xF1, 0xF2, 0xF4, 0xF2, 0x64, 0xF2, 0xF4, 0xF2,
    0xF2, 0x50, 0x63, 0x50, 0x00, 0x00, 0xF1, 0xF4, 0xF2, 0xF2, 0xF8, 0xF4, 0x50, 0x00, 0xF4, 0x00,
};

static InitChainEntry sInitChain[] = {
    ICHAIN_S8(naviEnemyId, 74, ICHAIN_CONTINUE),
    ICHAIN_F32_DIV1000(gravity, 64536, ICHAIN_CONTINUE),
    ICHAIN_F32(unk_4C, 5300, ICHAIN_STOP),
};

void EnMb_Init(Actor* thisx, GlobalContext* globalCtx) {
    EnMb* this = THIS;
    s32 pad;
    Player* player = PLAYER;
    s16 yawDiff;

    Actor_ProcessInitChain(&this->actor, sInitChain);
    ActorShape_Init(&this->actor.shape, 0.0f, ActorShadow_DrawFunc_Circle, 46.0f);
    this->actor.colChkInfo.mass = 0xFF;
    this->actor.colChkInfo.damageTable = &sDamageTable;
    Collider_InitCylinder(globalCtx, &this->collider1);
    Collider_SetCylinder(globalCtx, &this->collider1, &this->actor, &sCylinderInit);
    Collider_InitTris(globalCtx, &this->collider3);
    Collider_SetTris(globalCtx, &this->collider3, &this->actor, &sTrisInit, this->collider3Items);
    Collider_InitQuad(globalCtx, &this->collider2);
    Collider_SetQuad(globalCtx, &this->collider2, &this->actor, &sQuadInit);

    switch (this->actor.params) {
        case -1:
            SkelAnime_InitFlex(globalCtx, &this->skelAnime, &D_06008F38, &D_060028E0, this->limbDrawTable,
                               this->transitionDrawTable, 28);
            this->actor.colChkInfo.health = 2;
            this->actor.colChkInfo.mass = 0xFE;
            this->unk_360 = 1000.0f;
            this->unk_364 = 1750.0f;
            func_80AA6830(this);
            break;
        case 0:
            SkelAnime_InitFlex(globalCtx, &this->skelAnime, &D_06014190, &D_0600EBE4, this->limbDrawTable,
                               this->transitionDrawTable, 28);
            this->actor.colChkInfo.health = 6;
            this->actor.colChkInfo.mass = 0xFF;
            this->actor.colChkInfo.damageTable = &sBigMoblinDamageTable;
            Actor_SetScale(&this->actor, 0.02f);
            this->collider1.dim.height = 170;
            this->collider1.dim.radius = 45;
            this->actor.uncullZoneForward = 4000.0f;
            this->actor.uncullZoneScale = 800.0f;
            this->actor.uncullZoneDownward = 1800.0f;
            this->unk_364 = 710.0f;
            this->collider2.body.toucher.flags = 0x20000000;
            yawDiff = (this->actor.posRot.rot.y - Math_Vec3f_Yaw(&this->actor.posRot.pos, &player->actor.posRot.pos));

            if (ABS(yawDiff) > 0x4000) {
                this->actor.posRot.rot.y = thisx->posRot.rot.y + 0x8000;
                this->actor.shape.rot.y = thisx->posRot.rot.y;
                this->actor.posRot.pos.z = thisx->posRot.pos.z + 600.0f;
            }
            ActorShape_Init(&this->actor.shape, 0.0f, ActorShadow_DrawFunc_Teardrop, 90.0f);
            this->actor.flags &= ~1;
            this->actor.naviEnemyId++;
            func_80AA6898(this);
            break;
        default:
            SkelAnime_InitFlex(globalCtx, &this->skelAnime, &D_06008F38, &D_060028E0, this->limbDrawTable,
                               this->transitionDrawTable, 28);
            Actor_SetScale(&this->actor, 0.014f);
            this->path = (thisx->params & 0xFF00) >> 8;
            this->actor.params = 1;
            this->waypoint = 0;
            this->actor.colChkInfo.health = 1;
            this->actor.colChkInfo.mass = 0xFE;
            this->unk_360 = 350.0f;
            this->unk_364 = 1750.0f;
            this->actor.flags &= ~1;
            func_80AA68FC(this, globalCtx);
            break;
    }
}

void EnMb_Destroy(Actor* thisx, GlobalContext* globalCtx) {
    EnMb* this = THIS;

    Collider_DestroyTris(globalCtx, &this->collider3);
    Collider_DestroyCylinder(globalCtx, &this->collider1);
    Collider_DestroyQuad(globalCtx, &this->collider2);
}

void func_80AA6408(EnMb* this, GlobalContext* globalCtx) {
    s16 yaw = Math_Vec3f_Yaw(&this->actor.posRot.pos, &this->waypointPos);

    this->actor.shape.rot.y = yaw;
    this->actor.posRot.rot.y = yaw;
}

void func_80AA6444(EnMb* this, GlobalContext* globalCtx) {
    Path* path;
    Vec3s* pathPos;

    path = &globalCtx->setupPathList[this->path];

    if (this->waypoint == 0) {
        this->direction = 1;
    } else if (this->waypoint == (s8)(path->count - 1)) {
        this->direction = -1;
    }

    this->waypoint += this->direction;
    pathPos = &((Vec3s*)SEGMENTED_TO_VIRTUAL(path->points))[this->waypoint];
    this->waypointPos.x = pathPos->x;
    this->waypointPos.y = pathPos->y;
    this->waypointPos.z = pathPos->z;
}

s32 func_80AA652C(EnMb* this, GlobalContext* globalCtx) {
    Player* player;
    f32 xDist;
    f32 zDist;
    f32 cosAngle;
    f32 sinAngle;
    f32 xDistABS;
    f32 zDistABS;
    s16 phi_a2;

    player = PLAYER;
    phi_a2 = 0;
    if ((this->actor.posRot.rot.y < -0x62A2) || (this->actor.posRot.rot.y >= 0x62A3)) {
        phi_a2 = -0x8000;
    } else if (this->actor.posRot.rot.y < -0x20E0) {
        phi_a2 = -0x4000;
    } else {
        if (this->actor.posRot.rot.y >= 0x20E1) {
            phi_a2 = 0x4000;
        }
    }
    cosAngle = Math_Coss(phi_a2);
    sinAngle = Math_Sins(phi_a2);
    cosAngle = ABS(cosAngle);
    sinAngle = ABS(sinAngle);
    xDist = this->actor.posRot.pos.x - player->actor.posRot.pos.x;
    zDist = this->actor.posRot.pos.z - player->actor.posRot.pos.z;
    xDistABS = ABS(xDist);
    if (xDistABS < cosAngle * 37.0f + sinAngle * 400.0f) {
        if (0 <= zDist) {
            zDistABS = zDist;
        } else {
            zDistABS = -zDist;
        }
        if (zDistABS < (sinAngle * 37.0f) + (cosAngle * 400.0f)) {
            return 1;
        }
    }
    return 0;
}

void func_80AA66A0(EnMb* this, GlobalContext* globalCtx) {
    Path* path;
    s16 yawToPoints;
    Vec3f points;
    Vec3s* pointPath;
    s16 yawDiff;
    s32 pathCount;
    s32 pathIndex;
    s32 yawDiffABS;

    path = &globalCtx->setupPathList[this->path];
    for (pathIndex = 0, pathCount = path->count - 1; pathCount >= 0; pathCount--, pathIndex++) {
        pointPath = &((Vec3s*)SEGMENTED_TO_VIRTUAL(path->points))[pathIndex];
        points.x = pointPath->x;
        points.y = pointPath->y;
        points.z = pointPath->z;
        yawToPoints = Math_Vec3f_Yaw(&this->actor.posRot.pos, &points);
        yawDiff = yawToPoints - this->actor.yawTowardsLink;
        yawDiffABS = (yawDiff >= 0) ? yawDiff : -yawDiff;
        if (yawDiffABS <= 0x1770) {
            this->actor.posRot.rot.y = yawToPoints;
            if (pathIndex == this->waypoint) {
                this->direction = -this->direction;
            }
            this->waypointPos = points;
            this->waypoint = pathIndex;
            return;
        }
    }
}

void func_80AA6830(EnMb* this) {
    SkelAnime_ChangeAnimTransitionRepeat(&this->skelAnime, &D_060041A8, -4.0f);
    this->actor.speedXZ = 0.0f;
    this->unk_32A = Math_Rand_S16Offset(30, 50);
    this->unk_320 = 6;
    EnMb_SetupAction(this, func_80AA7134);
}

void func_80AA6898(EnMb* this) {
    SkelAnime_ChangeAnimDefaultRepeat(&this->skelAnime, &D_0600EBE4);
    this->actor.speedXZ = 0.0f;
    this->unk_32A = Math_Rand_S16Offset(30, 50);
    this->unk_320 = 6;
    EnMb_SetupAction(this, func_80AA8DD8);
}

void func_80AA68FC(EnMb* this, GlobalContext* globalCtx) {
    SkelAnime_ChangeAnimTransitionRepeat(&this->skelAnime, &D_060041A8, -4.0f);
    this->actor.speedXZ = 0.0f;
    this->unk_32A = Math_Rand_S16Offset(40, 80);
    this->unk_320 = 6;
    func_80AA6444(this, globalCtx);
    EnMb_SetupAction(this, func_80AA71AC);
}

void func_80AA6974(EnMb* this) {
    SkelAnime_ChangeAnim(&this->skelAnime, &D_06009FC0, 0.0f, 0.0f, SkelAnime_GetFrameCount(&D_06009FC0), 0, -4.0f);
    this->actor.speedXZ = 0.59999996f;
    this->unk_32A = Math_Rand_S16Offset(50, 70);
    this->unk_332 = 1;
    this->unk_320 = 9;
    EnMb_SetupAction(this, func_80AA87D8);
}

void func_80AA6A18(EnMb* this) {
    f32 frameCount;

    frameCount = SkelAnime_GetFrameCount(&D_06009FC0);
    this->actor.speedXZ = 0.59999996f;
    this->unk_32A = Math_Rand_S16Offset(50, 70);
    this->unk_332 = 1;
    this->unk_320 = 9;
    SkelAnime_ChangeAnim(&this->skelAnime, &D_06009FC0, 0.0f, 0.0f, frameCount, 1, -4.0f);
    EnMb_SetupAction(this, func_80AA8AEC);
}

void func_80AA6AC8(EnMb* this) {
    f32 frameCount;

    frameCount = SkelAnime_GetFrameCount(&D_06002C10);
    SkelAnime_ChangeAnimTransitionStop(&this->skelAnime, &D_06002C10, -4.0f);
    this->unk_320 = 10;
    this->actor.speedXZ = 0.0f;
    this->unk_32E = (s16)frameCount + 6;
    Audio_PlayActorSound2(&this->actor, NA_SE_EN_MORIBLIN_SPEAR_AT);
    if (this->actor.params == -1) {
        EnMb_SetupAction(this, func_80AA77D0);
    } else {
        EnMb_SetupAction(this, func_80AA7CAC);
    }
}

void func_80AA6B80(EnMb* this) {
    SkelAnime_ChangeAnimDefaultRepeat(&this->skelAnime, &D_06002F10);
    Audio_PlayActorSound2(&this->actor, NA_SE_EN_MORIBLIN_ATTACK);
    this->attackParams = 1;
    this->unk_320 = 10;
    this->unk_32E = 3;
    this->actor.speedXZ = 10.0f;
    EnMb_SetupAction(this, func_80AA800C);
}

void func_80AA6BF0(EnMb* this) {
    f32 frames;
    s16 yawDiff;
    s32 yawDiffABS;

    frames = SkelAnime_GetFrameCount(&D_0600B4BC);
    this->unk_320 = 10;
    SkelAnime_ChangeAnim(&this->skelAnime, &D_0600B4BC, 3.0f, 0.0f, frames, 3, 0.0f);
    this->unk_32E = 1;
    yawDiff = (this->actor.posRot.rot.y - this->actor.yawTowardsLink);

    if (yawDiff >= 0) {
        yawDiffABS = yawDiff;
    } else {
        yawDiffABS = 0 - yawDiff;
    }

    if (yawDiffABS < 0x259) {
        this->attackParams = 2;
    } else if (yawDiff >= 0) {
        this->attackParams = 1;
    } else {
        this->attackParams = 3;
    }

    EnMb_SetupAction(this, func_80AA7938);
}

void func_80AA6CC0(EnMb* this) {
    SkelAnime_ChangeAnimDefaultStop(&this->skelAnime, &D_06009280);
    this->unk_320 = 11;
    this->unk_32A = 0;
    this->unk_32E = 5;
    Audio_PlayActorSound2(&this->actor, NA_SE_EN_MORIBLIN_SLIDE);
    EnMb_SetupAction(this, func_80AA7310);
}

void func_80AA6D20(EnMb* this) {
    SkelAnime_ChangeAnimDefaultStop(&this->skelAnime, &D_06009280);
    this->unk_320 = 0xB;
    this->actor.bgCheckFlags &= ~1;
    this->unk_32A = 0;
    this->unk_32E = 50;
    this->actor.speedXZ = -8.0f;
    this->actor.velocity.y = 6.0f;
    Audio_PlayActorSound2(&this->actor, NA_SE_EN_MORIBLIN_SLIDE);
    EnMb_SetupAction(this, func_80AA74BC);
}

void func_80AA6DA4(EnMb* this) {
    f32 frameCount;

    frameCount = SkelAnime_GetFrameCount(&D_0600EBE4);
    this->unk_320 = 11;
    SkelAnime_ChangeAnim(&this->skelAnime, &D_0600EBE4, 5.0f, 0.0f, frameCount, 3, 0.0f);
    EnMb_SetupAction(this, func_80AA7478);
}

void func_80AA6E1C(EnMb* this) {
    SkelAnime_ChangeAnimDefaultStop(&this->skelAnime, &D_0600C44C);
    this->unk_320 = 3;
    this->unk_32A = 0;
    this->unk_32E = 20;
    Audio_PlayActorSound2(&this->actor, NA_SE_EN_MORIBLIN_DEAD);
    EnMb_SetupAction(this, func_80AA8378);
}

void func_80AA6E7C(EnMb* this) {
    f32 frames;

    frames = SkelAnime_GetFrameCount(&D_0600D5D4);
    this->unk_320 = 2;
    this->unk_32A = 0;
    this->unk_32E = 6;
    SkelAnime_ChangeAnim(&this->skelAnime, &D_0600D5D4, 1.0f, 4.0f, frames, 3, 0.0f);
    EnMb_SetupAction(this, func_80AA840C);
}

void func_80AA6F04(EnMb* this) {
    SkelAnime_ChangeAnimTransitionStop(&this->skelAnime, &D_0600BE58, -4.0f);
    this->unk_320 = 1;
    this->actor.flags &= ~1;
    this->collider1.dim.height = 80;
    this->collider1.dim.radius = 95;
    this->unk_32A = 30;
    this->actor.speedXZ = 0.0f;
    Audio_PlayActorSound2(&this->actor, NA_SE_EN_MORIBLIN_DEAD);
    EnMb_SetupAction(this, func_80AA8514);
}

void func_80AA6F8C(EnMb* this) {
    this->unk_320 = 5;
    this->actor.speedXZ = 0.0f;
    func_8003426C(&this->actor, 0, 0x78, 0, 0x50);
    if (this->unk_188 == 6) {
        this->unk_328 = 40;
    } else {
        if (this->actor.params != 0) {
            SkelAnime_ChangeAnimPlaybackStop(&this->skelAnime, &D_06001950, 0.0f);
        }
        Audio_PlayActorSound2(&this->actor, NA_SE_EN_GOMA_JR_FREEZE);
    }
    EnMb_SetupAction(this, func_80AA702C);
}

void func_80AA702C(EnMb* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;

    if ((player->stateFlags2 & 0x80) && (&this->actor == player->actor.parent)) {
        player->stateFlags2 &= ~0x80;
        player->actor.parent = NULL;
        player->unk_850 = 200;
        func_8002F71C(globalCtx, &this->actor, 4.0f, this->actor.posRot.rot.y, 4.0f);
        this->attackParams = 0;
    }
    if (this->actor.dmgEffectTimer == 0) {
        if (this->actor.params == 0) {
            if (this->actor.colChkInfo.health == 0) {
                func_80AA6F04(this);
            } else if (this->unk_320 == 3) {
                func_80AA6E7C(this);
            } else {
                func_80AA6898(this);
            }
        } else if (this->actor.colChkInfo.health == 0) {
            func_80AA8FC8(this);
        } else {
            func_80AA8E88(this);
        }
    }
}

void func_80AA7134(EnMb* this, GlobalContext* globalCtx) {
    s16 phi_v0;

    SkelAnime_FrameUpdateMatrix(&this->skelAnime);
    if (this->unk_32A == 0) {
        phi_v0 = 0;
    } else {
        this->unk_32A--;
        phi_v0 = this->unk_32A;
    }
    if (phi_v0 == 0) {
        if (func_800A56C8(&this->skelAnime, 0.0f) != 0) {
            func_80AA6974(this);
        }
    }
}

void func_80AA71AC(EnMb* this, GlobalContext* globalCtx) {
    f32 yDist;
    s16 yawDiff;
    f32 yDistAbs;
    s32 yawDiffAbs;

    SkelAnime_FrameUpdateMatrix(&this->skelAnime);
    if (this->unk_32A == 0) {
        this->unk_330 = Math_Vec3f_Yaw(&this->actor.posRot.pos, &this->waypointPos);
        if (Math_SmoothScaleMaxMinS(&this->actor.shape.rot.y, this->unk_330, 1, 0x3E8, 0) == 0) {
            this->actor.posRot.rot.y = this->actor.shape.rot.y;
            func_80AA6A18(this);
        }
    } else {
        this->unk_32A--;
        Math_SmoothScaleMaxMinS(&this->actor.shape.rot.y, this->actor.initPosRot.rot.y, 1, 0x3E8, 0);
    }
    yDist = this->actor.yDistFromLink;
    yDistAbs = ABS(yDist);
    if ((yDistAbs <= 20.0f) && func_80AA652C(this, globalCtx)) {
        yawDiff = this->actor.shape.rot.y - this->actor.yawTowardsLink;
        yawDiffAbs = ABS(yawDiff);
        if ((yawDiffAbs <= 0x4000) || (func_8002DDE4(globalCtx) != 0) && (this->actor.xzDistFromLink < 160.0f)) {
            func_80AA66A0(this, globalCtx);
            Audio_PlayActorSound2(&this->actor, NA_SE_EN_MORIBLIN_VOICE);
            func_80AA6AC8(this);
        }
    }
}

void func_80AA7310(EnMb* this, GlobalContext* globalCtx) {
    s32 pad;

    Math_SmoothScaleMaxMinF(&this->actor.speedXZ, 0.0f, 0.5f, 1.0f, 0.0f);
    if (this->actor.speedXZ > 1.0f) {
        func_80033260(globalCtx, &this->actor, &this->actor.posRot.pos, 5.0f, 3, 4.0f, 0x64, 0xF, 0);
    }
    if (SkelAnime_FrameUpdateMatrix(&this->skelAnime) != 0) {
        if (this->unk_32A == 0) {
            this->unk_32E--;
            if (this->unk_32E == 0) {
                SkelAnime_ChangeAnim(&this->skelAnime, &D_06002C10, -1.0f, SkelAnime_GetFrameCount(&D_06002C10), 0.0f,
                                     2, 0.0f);
                this->unk_32A = 1;
                this->actor.speedXZ = 0.0f;
                Audio_PlayActorSound2(&this->actor, NA_SE_EN_MORIBLIN_SPEAR_NORM);
            }
        } else {
            if (this->actor.params < 0) {
                func_80AA6974(this);
                this->unk_32A = this->soundTimer = this->unk_32E = 80;
            } else {
                func_80AA68FC(this, globalCtx);
            }
        }
    }
}

void func_80AA7478(EnMb* this, GlobalContext* globalCtx) {
    this->attackParams = 0;
    if (SkelAnime_FrameUpdateMatrix(&this->skelAnime) != 0) {
        func_80AA6898(this);
    }
}

void func_80AA74BC(EnMb* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;
    f32 lastFrame;
    s16 yawDiff;

    if ((player->stateFlags2 & 0x80) && (&this->actor == player->actor.parent)) {
        player->stateFlags2 &= ~0x80;
        player->actor.parent = NULL;
        player->unk_850 = 200;
        func_8002F71C(globalCtx, &this->actor, 4.0f, this->actor.posRot.rot.y, 4.0f);
    }
    if (this->actor.bgCheckFlags & 1) {
        Math_SmoothScaleMaxMinF(&this->actor.speedXZ, 0.0f, 1.0f, 1.5f, 0.0f);
        if (1.0f < this->actor.speedXZ) {
            func_80033260(globalCtx, &this->actor, &this->actor.posRot.pos, 5.0f, 3, 4.0f, 0x64, 0xF, 0);
        }
        if (this->unk_32A != 0) {
            this->unk_32E--;
            if (this->unk_32E == 0) {
                yawDiff = this->actor.shape.rot.y - this->actor.yawTowardsLink;

                if ((ABS(this->actor.yDistFromLink) <= 20.0f) && (func_80AA652C(this, globalCtx) != 0) &&
                    (ABS(yawDiff) <= 0x4000) && (this->actor.xzDistFromLink <= 200.0f)) {
                    func_80AA6AC8(this);
                } else {
                    lastFrame = SkelAnime_GetFrameCount(&D_06002C10);
                    SkelAnime_ChangeAnim(&this->skelAnime, &D_06002C10, -1.0f, lastFrame, 0.0f, 2, 0.0f);
                    this->actor.speedXZ = 0.0f;
                    Audio_PlayActorSound2(&this->actor, NA_SE_EN_MORIBLIN_SPEAR_NORM);
                }

            } else if (this->actor.xzDistFromLink <= 160.0f) {
                this->actor.speedXZ = -5.0f;
            } else {
                this->actor.speedXZ = 0.0f;
            }
        }
        if (SkelAnime_FrameUpdateMatrix(&this->skelAnime) != 0) {
            if (this->unk_32A == 0) {
                lastFrame = SkelAnime_GetFrameCount(&D_06002F10);
                SkelAnime_ChangeAnim(&this->skelAnime, &D_06002F10, 0.5f, 0.0f, lastFrame, 1, 0.0f);
                this->unk_32A = 1;
            } else {
                yawDiff = (Math_Vec3f_Yaw(&this->actor.posRot.pos, &this->waypointPos) - this->actor.yawTowardsLink);

                if (ABS(yawDiff) <= 0x4000) {
                    func_80AA68FC(this, globalCtx);
                } else {
                    func_80AA6A18(this);
                }
            }
        }
    }
}

void func_80AA77D0(EnMb* this, GlobalContext* globalCtx) {
    s32 currentFrame;
    s16 yawDiff;

    yawDiff = this->actor.yawTowardsLink - this->actor.shape.rot.y;

    if (yawDiff < 0) {
        yawDiff = -yawDiff;
    }

    currentFrame = this->skelAnime.animCurrentFrame;

    if (SkelAnime_FrameUpdateMatrix(&this->skelAnime) != 0) {
        SkelAnime_ChangeAnimDefaultRepeat(&this->skelAnime, &D_06002F10);
        Audio_PlayActorSound2(&this->actor, NA_SE_EN_MORIBLIN_ATTACK);
    }

    if (this->unk_32E != 0) {
        this->unk_32E--;
        Math_SmoothScaleMaxMinS(&this->actor.posRot.rot.y, this->actor.yawTowardsLink, 1, 3000, 0);
    } else {
        this->actor.speedXZ = 10.0f;
        this->attackParams = 1;
        func_80033260(globalCtx, &this->actor, &this->actor.posRot.pos, 5.0f, 3, 4.0f, 0x64, 0xF, 0);
        if ((currentFrame != (s32)this->skelAnime.animCurrentFrame) &&
            (((s32)this->skelAnime.animCurrentFrame == 2) || ((s32)this->skelAnime.animCurrentFrame == 6))) {
            Audio_PlayActorSound2(&this->actor, NA_SE_EN_MORIBLIN_DASH);
        }
    }

    if (yawDiff > 5000) {
        this->attackParams = 0;
        func_80AA6CC0(this);
    }
}

void func_80AA7938(EnMb* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;
    s32 pad;
    Vec3f sp74;
    Vec3f sp68 = { 0.0f, 0.0f, 0.0f };
    f32 sp5C[] = { 18.0f, 18.0f, 0.0f };
    s16 sp54[] = { 20, 40, 0 };
    s16 sp4C[] = { -2500, 0, 3500 };

    Math_SmoothScaleMaxMinS(&this->actor.shape.rot.y, sp4C[this->attackParams - 1] + this->actor.posRot.rot.y, 1, 0x2EE,
                            0);

    if (this->collider2.base.atFlags & 2) {
        this->collider2.base.atFlags &= ~2;
        if (this->collider2.base.at == &player->actor) {
            u8 oldInvincibilityTimer = player->invincibilityTimer;

            if (player->invincibilityTimer < 0) {
                if (player->invincibilityTimer < -39) {
                    player->invincibilityTimer = 0;
                } else {
                    player->invincibilityTimer = 0;
                    globalCtx->damagePlayer(globalCtx, -8);
                }
            }

            func_8002F71C(globalCtx, &this->actor, ((650.0f - this->actor.xzDistFromLink) * 0.04f) + 4.0f,
                          this->actor.posRot.rot.y, 8.0f);

            player->invincibilityTimer = oldInvincibilityTimer;
        }
    }
    if (SkelAnime_FrameUpdateMatrix(&this->skelAnime)) {
        if (this->unk_32E != 0) {
            this->unk_32E--;
            if (this->unk_32E == 0) {
                f32 pad1 = SkelAnime_GetFrameCount(&D_0600ABE0);
                SkelAnime_ChangeAnim(&this->skelAnime, &D_0600ABE0, 1.5f, 0.0f, pad1, 3, 0.0f);
            }
        } else {
            sp74 = this->effSpawnPos;
            sp74.y = this->actor.groundY;
            Audio_PlayActorSound2(&this->actor, NA_SE_EN_MONBLIN_HAM_LAND);
            func_800AA000(this->actor.xzDistFromLink, 0xFF, 0x14, 0x96);
            EffectSsBlast_SpawnWhiteShockwave(globalCtx, &sp74, &sp68, &sp68);
            func_80033480(globalCtx, &sp74, 2.0f, 3, 0x12C, 0xB4, 1);
            Camera_AddQuake(&globalCtx->mainCamera, 2, 0x19, 5);
            func_800358DC(&this->actor, &sp74, &this->actor.posRot.rot, &sp5C, 20, &sp54, globalCtx, -1, 0);
            func_80AA6DA4(this);
        }
    } else {
        if ((this->unk_32E != 0) && (this->skelAnime.animCurrentFrame == 6.0f)) {
            Audio_PlayActorSound2(&this->actor, NA_SE_EN_MONBLIN_HAM_UP);

        } else if ((this->unk_32E == 0) && (this->skelAnime.animCurrentFrame == 3.0f)) {
            Audio_PlayActorSound2(&this->actor, NA_SE_EN_MONBLIN_HAM_DOWN);
        }
    }
}

void func_80AA7CAC(EnMb* this, GlobalContext* globalCtx) {
    Player* player;
    s32 currentFrame;
    s32 sp4C;
    s32 sp48;

    player = PLAYER;
    sp4C = 0;
    sp48 = !func_800339B8(&this->actor, globalCtx, 110.0f, this->actor.posRot.rot.y);
    currentFrame = (s32)this->skelAnime.animCurrentFrame;
    if (SkelAnime_FrameUpdateMatrix(&this->skelAnime) != 0) {
        SkelAnime_ChangeAnimDefaultRepeat(&this->skelAnime, &D_06002F10);
        Audio_PlayActorSound2(&this->actor, NA_SE_EN_MORIBLIN_ATTACK);
    }
    if (this->unk_32E != 0) {
        this->unk_32E--;
        Math_SmoothScaleMaxMinS(&this->actor.shape.rot.y, this->actor.posRot.rot.y, 1, 0x1F40, 0);
        sp48 = 0;
    } else {
        this->actor.speedXZ = 10.0f;
        this->attackParams = 1;
        func_80033260(globalCtx, &this->actor, &this->actor.posRot.pos, 5.0f, 3, 4.0f, 0x64, 0xF, 0);
        if (currentFrame != (s32)this->skelAnime.animCurrentFrame) {
            if (((s32)this->skelAnime.animCurrentFrame == 2 || (s32)this->skelAnime.animCurrentFrame == 6)) {
                Audio_PlayActorSound2(&this->actor, NA_SE_EN_MORIBLIN_DASH);
            }
        }
    }
    if (this->collider2.base.atFlags & 2) {
        if (this->collider2.base.at == &player->actor) {
            if ((sp48 == 0) && !(player->stateFlags2 & 0x80)) {
                if (player->invincibilityTimer < 0) {
                    if (player->invincibilityTimer < -39) {
                        player->invincibilityTimer = 0;
                    } else {
                        player->invincibilityTimer = 0;
                        globalCtx->damagePlayer(globalCtx, -8);
                    }
                }
                if (!(this->collider2.base.atFlags & 4)) {
                    Audio_PlayActorSound2(&player->actor, NA_SE_PL_BODY_HIT);
                }
                if (globalCtx->grabPlayer(globalCtx, player) != 0) {
                    player->actor.parent = &this->actor;
                }
            }
            sp4C = 1;
        } else {
            this->collider2.base.atFlags &= ~2;
        }
    }
    if ((player->stateFlags2 & 0x80) && (&this->actor == player->actor.parent)) {
        player->actor.posRot.pos.x = this->actor.posRot.pos.x + (Math_Coss(this->actor.shape.rot.y) * 10.0f) +
                                     (Math_Sins(this->actor.shape.rot.y) * 89.0f);
        sp4C = 1;
        player->actor.posRot.pos.z = this->actor.posRot.pos.z + (Math_Sins(this->actor.shape.rot.y) * 10.0f) +
                                     (Math_Coss(this->actor.shape.rot.y) * 89.0f);
        player->unk_850 = 0;
        player->actor.speedXZ = 0.0f;
        player->actor.velocity.y = 0.0f;
    }
    if (sp48 != 0) {
        if ((sp4C != 0) || (player->stateFlags2 & 0x80)) {
            this->collider2.base.atFlags &= ~2;
            if (player->stateFlags2 & 0x80) {
                player->stateFlags2 &= ~0x80;
                player->actor.parent = NULL;
                player->unk_850 = 200;
                func_8002F71C(globalCtx, &this->actor, 4.0f, this->actor.posRot.rot.y, 4.0f);
            }
        }
        this->attackParams = 0;
        this->actor.speedXZ = -10.0f;
        func_80AA6D20(this);
    }
}

void func_80AA800C(EnMb* this, GlobalContext* globalCtx) {
    Player* player;
    s32 currentFrame;
    s32 sp54;
    s32 sp50;

    player = PLAYER;
    sp54 = 0;
    sp50 = !func_800339B8(&this->actor, globalCtx, 110.0f, this->actor.posRot.rot.y);
    currentFrame = (s32)this->skelAnime.animCurrentFrame;
    SkelAnime_FrameUpdateMatrix(&this->skelAnime);
    func_80033260(globalCtx, &this->actor, &this->actor.posRot.pos, 5.0f, 3, 4.0f, 0x64, 0xF, 0);
    if (currentFrame != (s32)this->skelAnime.animCurrentFrame) {
        if (((s32)this->skelAnime.animCurrentFrame == 2) || ((s32)this->skelAnime.animCurrentFrame == 6)) {
            Audio_PlayActorSound2(&this->actor, NA_SE_EN_MORIBLIN_DASH);
        }
    }
    if (this->collider2.base.atFlags & 2) {
        if (this->collider2.base.at == &player->actor) {
            if ((sp50 == 0) && !(player->stateFlags2 & 0x80)) {
                if (player->invincibilityTimer < 0) {
                    if (player->invincibilityTimer < -39) {
                        player->invincibilityTimer = 0;
                    } else {
                        player->invincibilityTimer = 0;
                        globalCtx->damagePlayer(globalCtx, -8);
                    }
                }
                if (!(this->collider2.base.atFlags & 4)) {
                    Audio_PlayActorSound2(&player->actor, NA_SE_PL_BODY_HIT);
                }
                if (globalCtx->grabPlayer(globalCtx, player) != 0) {
                    player->actor.parent = &this->actor;
                }
            }
            sp54 = 1;
        } else {
            this->collider2.base.atFlags &= ~2;
        }
    }
    if ((player->stateFlags2 & 0x80) && (&this->actor == player->actor.parent)) {
        player->actor.posRot.pos.x = this->actor.posRot.pos.x + (Math_Coss(this->actor.shape.rot.y) * 10.0f) +
                                     (Math_Sins(this->actor.shape.rot.y) * 89.0f);
        sp54 = 1;
        player->actor.posRot.pos.z = this->actor.posRot.pos.z + (Math_Sins(this->actor.shape.rot.y) * 10.0f) +
                                     (Math_Coss(this->actor.shape.rot.y) * 89.0f);
        player->unk_850 = 0;
        player->actor.speedXZ = 0.0f;
        player->actor.velocity.y = 0.0f;
    }
    if (sp50 != 0) {
        if ((sp54 != 0) || (player->stateFlags2 & 0x80)) {
            this->collider2.base.atFlags &= ~2;
            if (player->stateFlags2 & 0x80) {
                player->stateFlags2 &= ~0x80;
                player->actor.parent = NULL;
                player->unk_850 = 200;
                func_8002F71C(globalCtx, &this->actor, 4.0f, this->actor.posRot.rot.y, 4.0f);
            }
            this->attackParams = 0;
            this->actor.speedXZ = -10.0f;
            func_80AA6D20(this);
            this->unk_32E = 1;
        } else {
            this->unk_32E--;
            func_80AA6444(this, globalCtx);
        }
    }
    func_80AA6408(this, globalCtx);
    this->actor.shape.rot.y = this->actor.posRot.rot.y;
    if ((this->unk_32E == 0) && Math_Vec3f_DistXZ(&this->actor.initPosRot.pos, &this->actor.posRot.pos) < 80.0f) {
        this->attackParams = 0;
        func_80AA6CC0(this);
    }
}

void func_80AA8378(EnMb* this, GlobalContext* globalCtx) {
    if (SkelAnime_FrameUpdateMatrix(&this->skelAnime)) {
        if (this->unk_32E != 0) {
            SkelAnime_ChangeAnimDefaultStop(&this->skelAnime, &D_0600E18C);
            this->unk_32E = 0;
            func_800AA000(this->actor.xzDistFromLink, 0xFF, 0x14, 0x96);
            Camera_AddQuake(&globalCtx->mainCamera, 2, 25, 5);
        } else {
            func_80AA6898(this);
        }
    }
}

void func_80AA840C(EnMb* this, GlobalContext* globalCtx) {
    s32 pad;

    if (SkelAnime_FrameUpdateMatrix(&this->skelAnime)) {
        if (this->unk_32E != 0) {
            this->unk_32E--;
            if (this->unk_32E == 0) {
                if (this->unk_32A == 0) {
                    SkelAnime_ChangeAnim(&this->skelAnime, &D_0600E18C, 3.0f, 0.0f,
                                         SkelAnime_GetFrameCount(&D_0600E18C), 3, 0.0f);
                    this->unk_32A = 1;
                    this->unk_32E = 6;
                } else {
                    SkelAnime_ChangeAnim(&this->skelAnime, &D_0600E18C, 3.0f, 0.0f,
                                         SkelAnime_GetFrameCount(&D_0600E18C), 3, 0.0f);
                }
            }
        } else {
            func_80AA6898(this);
        }
    }
}

void func_80AA8514(EnMb* this, GlobalContext* globalCtx) {
    static Vec3f D_80AA9D78 = { 0.0f, 0.0f, 0.0f };
    Vec3f effPosition;
    Vec3f temp;
    Vec3f effZeroVector;
    s32 effectsPerFrame;

    effPosition = this->actor.posRot.pos;
    effPosition.x += Math_Sins(this->actor.shape.rot.y) * -70.0f;
    effPosition.z += Math_Coss(this->actor.shape.rot.y) * -70.0f;
    Math_SmoothScaleMaxMinF(&this->actor.speedXZ, 0.0f, 1.0f, 0.5f, 0.0f);
    temp = effPosition;
    if (SkelAnime_FrameUpdateMatrix(&this->skelAnime) != 0) {
        if (this->unk_32A > 0) {
            effZeroVector = D_80AA9D78;
            this->unk_32A--;
            for (effectsPerFrame = 4; effectsPerFrame >= 0; effectsPerFrame--) {
                effPosition.x = Math_Rand_CenteredFloat(240.0f) + temp.x;
                effPosition.y = Math_Rand_CenteredFloat(15.0f) + (temp.y + 20.0f);
                effPosition.z = Math_Rand_CenteredFloat(240.0f) + temp.z;
                EffectSsDeadDb_Spawn(globalCtx, &effPosition, &effZeroVector, &effZeroVector, 0xE6, 7, 0xFF, 0xFF, 0xFF,
                                     0xFF, 0, 0xFF, 0, 1, 9, 1);
            }
        } else {
            Item_DropCollectibleRandom(globalCtx, &this->actor, &effPosition, 0xC0);
            Actor_Kill(&this->actor);
        }
    } else if (((s32)this->skelAnime.animCurrentFrame == 15) || ((s32)this->skelAnime.animCurrentFrame == 22)) {
        func_800AA000(this->actor.xzDistFromLink, 0xFF, 0x14, 0x96);
        func_80033260(globalCtx, &this->actor, &effPosition, 50.0f, 0xA, 3.0f, 0x190, 0x3C, 0);
        Audio_PlayActorSound2(&this->actor, NA_SE_EN_RIZA_DOWN);
        Camera_AddQuake(&globalCtx->mainCamera, 2, 0x19, 5);
    }
}

void func_80AA87D8(EnMb* this, GlobalContext* globalCtx) {
    s32 currentFrame;
    s32 sp48;
    s32 pad2;
    s32 pad;
    Player* player = PLAYER;
    s16 yawDiff;
    s16 yaw;
    f32 playbackSpeedABS;

    yawDiff = (this->actor.yawTowardsLink - this->actor.shape.rot.y);
    yawDiff = ABS(yawDiff);
    Math_SmoothScaleMaxMinF(&this->actor.speedXZ, 0.59999996f, 0.1f, 1.0f, 0.0f);
    this->skelAnime.animPlaybackSpeed = this->actor.speedXZ;
    currentFrame = this->skelAnime.animCurrentFrame;
    SkelAnime_FrameUpdateMatrix(&this->skelAnime);
    playbackSpeedABS = ABS(this->skelAnime.animPlaybackSpeed);

    sp48 = (this->skelAnime.animCurrentFrame - playbackSpeedABS);
    playbackSpeedABS = ABS(this->skelAnime.animPlaybackSpeed);
    if ((this->unk_32E == 0) &&
        (Math_Vec3f_DistXZ(&this->actor.initPosRot.pos, &player->actor.posRot.pos) < this->unk_364)) {
        Math_SmoothScaleMaxMinS(&this->actor.posRot.rot.y, this->actor.yawTowardsLink, 1, 750, 0);
        this->actor.flags |= 1;
        if (this->actor.xzDistFromLink < 500.0f) {
            if (yawDiff < 0x1388) {
                func_80AA6AC8(this);
            }
        }
    } else {
        this->actor.flags &= ~1;
        if ((this->unk_360 < Math_Vec3f_DistXZ(&this->actor.posRot.pos, &this->actor.initPosRot.pos)) ||
            (this->soundTimer != 0)) {
            yaw = Math_Vec3f_Yaw(&this->actor.posRot.pos, &this->actor.initPosRot);
            Math_SmoothScaleMaxMinS(&this->actor.posRot.rot.y, yaw, 1, 750, 0);
        } else {
        }
        if (this->soundTimer != 0) {
            this->soundTimer--;
        }
        if (this->unk_32E != 0) {
            this->unk_32E--;
        }
        if (this->soundTimer == 0) {
            Audio_PlayActorSound2(&this->actor, NA_SE_EN_MORIBLIN_VOICE);
        }
        this->unk_32A--;
        if (this->unk_32A == 0) {
            if (Math_Rand_ZeroOne() > 0.7f) {
                this->unk_32A = Math_Rand_S16Offset(50, 70);
                this->soundTimer = Math_Rand_S16Offset(15, 40);
            } else {
                func_80AA6830(this);
            }
        }
    }
    if (currentFrame != (s32)this->skelAnime.animCurrentFrame) {
        if (((sp48 <= 1) && ((s32)playbackSpeedABS + currentFrame >= 1)) ||
            ((sp48 <= 20) && (((s32)playbackSpeedABS + currentFrame >= 20)))) {
            Audio_PlayActorSound2(&this->actor, NA_SE_EN_MORIBLIN_WALK);
        }
    }
    this->actor.shape.rot.y = this->actor.posRot.rot.y;
}

void func_80AA8AEC(EnMb* this, GlobalContext* globalCtx) {
    s32 currentFrame;
    s32 temp_f6;
    s16 yawDiff;
    f32 yDistAbs;
    s32 yawDiffAbs;
    f32 playbackSpeedABS;

    if (Math_Vec3f_DistXZ(&this->waypointPos, &this->actor.posRot.pos) <= 8.0f ||
        Math_Rand_ZeroOne() < 0.1f && Math_Vec3f_DistXZ(&this->actor.initPosRot.pos, &this->actor.posRot.pos) <= 4.0f) {
        func_80AA68FC(this, globalCtx);
    } else {
        Math_SmoothScaleMaxMinF(&this->actor.speedXZ, 0.59999996f, 0.1f, 1.0f, 0.0f);
        this->skelAnime.animPlaybackSpeed = (this->actor.speedXZ + this->actor.speedXZ);
    }
    this->unk_330 = Math_Vec3f_Yaw(&this->actor.posRot.pos, &this->waypointPos);
    Math_SmoothScaleMaxMinS(&this->actor.posRot.rot.y, this->unk_330, 1, 0x5DC, 0);
    yDistAbs = (this->actor.yDistFromLink >= 0.0f) ? this->actor.yDistFromLink : -this->actor.yDistFromLink;
    if (yDistAbs <= 20.0f && func_80AA652C(this, globalCtx) != 0) {
        yawDiff = (this->actor.shape.rot.y - this->actor.yawTowardsLink);
        yawDiffAbs = ABS(yawDiff);
        if (yawDiffAbs <= 0x4000 || func_8002DDE4(globalCtx) != 0 && this->actor.xzDistFromLink < 160.0f) {
            func_80AA66A0(this, globalCtx);
            Audio_PlayActorSound2(&this->actor, NA_SE_EN_MORIBLIN_VOICE);
            func_80AA6AC8(this);
            return;
        }
    }
    if (this->soundTimer != 0) {
        this->soundTimer--;
    }
    if (this->unk_32E != 0) {
        this->unk_32E--;
    }
    if (this->soundTimer == 0) {
        Audio_PlayActorSound2(&this->actor, NA_SE_EN_MORIBLIN_VOICE);
        this->soundTimer = Math_Rand_S16Offset(30, 70);
    }
    currentFrame = this->skelAnime.animCurrentFrame;
    SkelAnime_FrameUpdateMatrix(&this->skelAnime);
    playbackSpeedABS = (this->skelAnime.animPlaybackSpeed >= 0.0f) ? this->skelAnime.animPlaybackSpeed
                                                                   : -this->skelAnime.animPlaybackSpeed;
    temp_f6 = this->skelAnime.animCurrentFrame - playbackSpeedABS;
    playbackSpeedABS = (this->skelAnime.animPlaybackSpeed >= 0.0f) ? this->skelAnime.animPlaybackSpeed
                                                                   : -this->skelAnime.animPlaybackSpeed;
    if (currentFrame != (s32)this->skelAnime.animCurrentFrame) {
        if (!(temp_f6 >= 2 || (s32)playbackSpeedABS + currentFrame <= 0) ||
            temp_f6 <= 20 && (s32)playbackSpeedABS + currentFrame >= 20) {
            Audio_PlayActorSound2(&this->actor, NA_SE_EN_MORIBLIN_WALK);
        }
    }
    this->actor.shape.rot.y = this->actor.posRot.rot.y;
}

void func_80AA8DD8(EnMb* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;
    s32 pad;
    s16 yawDiff;
    s32 yawDiffAbs;

    yawDiff = (this->actor.posRot.rot.y - this->actor.yawTowardsLink);
    SkelAnime_FrameUpdateMatrix(&this->skelAnime);
    if (Math_Vec3f_DistXZ(&this->actor.initPosRot.pos, &player->actor.posRot.pos) < this->unk_364) {
        if (!(player->stateFlags1 & 0x4000000)) {
            yawDiffAbs = ABS(yawDiff);
            if (yawDiffAbs < 0x3E80) {
                func_80AA6BF0(this);
            }
        }
    }
}

void func_80AA8E88(EnMb* this) {
    s16 yawDiff;
    s32 yawDiffABS;

    yawDiff = this->actor.yawTowardsLink - this->actor.shape.rot.y;
    yawDiffABS = ABS(yawDiff);
    if (yawDiffABS <= 0x4000) {
        SkelAnime_ChangeAnimTransitionStop(&this->skelAnime, &D_06001950, -4.0f);
        this->actor.speedXZ = -8.0f;
    } else {
        SkelAnime_ChangeAnimTransitionStop(&this->skelAnime, &D_0600095C, -4.0f);
        this->actor.speedXZ = 8.0f;
    }
    this->unk_32A = 30;
    this->unk_320 = 0;
    this->actor.shape.rot.y = this->actor.posRot.rot.y;
    Audio_PlayActorSound2(&this->actor, NA_SE_EN_MORIBLIN_DEAD);
    EnMb_SetupAction(this, func_80AA8F50);
}

void func_80AA8F50(EnMb* this, GlobalContext* globalCtx) {
    Math_SmoothScaleMaxMinF(&this->actor.speedXZ, 0.0f, 1.0f, 0.5f, 0.0f);
    if (SkelAnime_FrameUpdateMatrix(&this->skelAnime) != 0) {
        if (this->actor.params < 0) {
            func_80AA6830(this);
        } else {
            func_80AA6B80(this);
        }
    }
}

void func_80AA8FC8(EnMb* this) {
    s16 yawDiff;
    s32 yawDiffAbs;

    yawDiff = this->actor.yawTowardsLink - this->actor.shape.rot.y;
    yawDiffAbs = ABS(yawDiff);
    if (yawDiffAbs <= 0x4000) {
        SkelAnime_ChangeAnimTransitionStop(&this->skelAnime, &D_060016B4, -4.0f);
        this->actor.speedXZ = -8.0f;
    } else {
        SkelAnime_ChangeAnimTransitionStop(&this->skelAnime, &D_060016B4, -4.0f);
        this->actor.speedXZ = 8.0f;
    }
    this->actor.posRot.rot.y = this->actor.shape.rot.y;
    this->unk_32A = 30;
    this->unk_320 = 0;
    Audio_PlayActorSound2(&this->actor, NA_SE_EN_MORIBLIN_DEAD);
    this->actor.flags &= ~1;
    EnMb_SetupAction(this, func_80AA90A0);
}

void func_80AA90A0(EnMb* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;

    Math_SmoothScaleMaxMinF(&this->actor.speedXZ, 0.0f, 1.0f, 0.5f, 0.0f);
    if (player->stateFlags2 & 0x80) {
        if (&this->actor == player->actor.parent) {
            player->stateFlags2 &= ~0x80;
            player->actor.parent = NULL;
            player->unk_850 = 200;
            func_8002F71C(globalCtx, &this->actor, 4.0f, this->actor.posRot.rot.y, 4.0f);
            this->attackParams = 0;
        }
    }
    if (SkelAnime_FrameUpdateMatrix(&this->skelAnime) != 0) {
        if (this->unk_32A > 0) {
            Vec3f zeroVec = { 0.0f, 0.0f, 0.0f };
            s32 i;
            Vec3f effPos;

            this->actor.shape.unk_10 = 0.0f;
            this->unk_32A--;
            for (i = 4; i >= 0; i--) {
                effPos.x = Math_Rand_CenteredFloat(110.0f) + this->actor.posRot.pos.x;
                effPos.y = Math_Rand_CenteredFloat(15.0f) + (this->actor.posRot.pos.y + 20.0f);
                effPos.z = Math_Rand_CenteredFloat(110.0f) + this->actor.posRot.pos.z;

                EffectSsDeadDb_Spawn(globalCtx, &effPos, &zeroVec, &zeroVec, 0x64, 7, 0xFF, 0xFF, 0xFF, 0xFF, 0, 0xFF,
                                     0, 1, 9, 1);
            }
        } else {
            Item_DropCollectibleRandom(globalCtx, &this->actor, &this->actor.posRot.pos, 0xE0);
            Actor_Kill(&this->actor);
        }
    }
}

void func_80AA92B8(Actor* thisx, GlobalContext* globalCtx) {
    Vec3f D_80AA9D90 = { 1000.0f, 1500.0f, 0.0f };
    Vec3f D_80AA9D9C = { -1000.0f, 1500.0f, 0.0f };
    Vec3f D_80AA9DA8 = { 1000.0f, 1500.0f, 4500.0f };
    Vec3f D_80AA9DB4 = { -1000.0f, 1500.0f, 4500.0f };
    EnMb* this = THIS;

    if (this->actor.params > 0) {
        D_80AA9D90.x += 2000.0f;
        D_80AA9D90.z = -4000.0f;
        D_80AA9D9C.z = -4000.0f;
        D_80AA9DA8.x += 2000.0f;
        D_80AA9D9C.x -= 2000.0f;
        D_80AA9DB4.x -= 2000.0f;
        D_80AA9DA8.z += 4000.0f;
        D_80AA9DB4.z += 4000.0f;
    }
    Matrix_MultVec3f(&D_80AA9D90, &this->collider2.dim.quad[1]);
    Matrix_MultVec3f(&D_80AA9D9C, &this->collider2.dim.quad[0]);
    Matrix_MultVec3f(&D_80AA9DA8, &this->collider2.dim.quad[3]);
    Matrix_MultVec3f(&D_80AA9DB4, &this->collider2.dim.quad[2]);
    func_80062734(&this->collider2, &this->collider2.dim.quad[0], &this->collider2.dim.quad[1],
                  &this->collider2.dim.quad[2], &this->collider2.dim.quad[3]);
}

void func_80AA9440(Actor* thisx, GlobalContext* globalCtx) {
    static Vec3f D_80AA9DC0 = { 1000.0f, 0.0f, 0.0f };
    static Vec3f D_80AA9DCC = { 1000.0f, 0.0f, 0.0f };
    static Vec3f D_80AA9DD8 = { 1000.0f, -8000.0f, -1500.0f };
    static Vec3f D_80AA9DE4 = { 1000.0f, -9000.0f, 2000.0f };
    EnMb* this = THIS;

    Matrix_MultVec3f(&D_80AA9DC0, &this->collider2.dim.quad[1]);
    Matrix_MultVec3f(&D_80AA9DCC, &this->collider2.dim.quad[0]);
    Matrix_MultVec3f(&D_80AA9DD8, &this->collider2.dim.quad[3]);
    Matrix_MultVec3f(&D_80AA9DE4, &this->collider2.dim.quad[2]);
    func_80062734(&this->collider2, &this->collider2.dim.quad[0], &this->collider2.dim.quad[1],
                  &this->collider2.dim.quad[2], &this->collider2.dim.quad[3]);
}

void func_80AA94D8(EnMb* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;

    if (this->collider3.base.acFlags & 2) {
        this->collider3.base.acFlags &= ~0x82;
        this->collider1.base.acFlags &= ~2;
        return;
    }
    if ((this->collider1.base.acFlags & 2) && (this->unk_320 >= 5)) {
        this->collider1.base.acFlags &= ~2;
        if ((this->actor.colChkInfo.damageEffect != 0) && (this->actor.colChkInfo.damageEffect != 5)) {
            if ((player->stateFlags2 & 0x80) && &this->actor == player->actor.parent) {
                player->stateFlags2 &= ~0x80;
                player->actor.parent = NULL;
                player->unk_850 = 200;
                func_8002F71C(globalCtx, &this->actor, 6.0f, this->actor.posRot.rot.y, 6.0f);
            }
            this->unk_188 = this->actor.colChkInfo.damageEffect;
            this->attackParams = 0;
            func_80035650(&this->actor, &this->collider1.body, 0);
            if ((this->actor.colChkInfo.damageEffect == 1) || (this->actor.colChkInfo.damageEffect == 6)) {
                if (this->unk_320 != 5) {
                    Actor_ApplyDamage(&this->actor);
                    func_80AA6F8C(this);
                    return;
                }
            } else {
                Actor_ApplyDamage(&this->actor);
                func_8003426C(&this->actor, 0x4000, 0xFA, 0, 0xC);
                if (this->actor.params == 0) {
                    if (this->actor.colChkInfo.health == 0) {
                        func_80AA6F04(this);
                    } else if (this->unk_320 != 3) {
                        func_80AA6E1C(this);
                    }
                } else if (this->actor.colChkInfo.health == 0) {
                    func_80AA8FC8(this);
                } else {
                    func_80AA8E88(this);
                }
            }
        }
    }
}

void EnMb_Update(Actor* thisx, GlobalContext* globalCtx) {
    EnMb* this = THIS;
    s32 pad;

    func_80AA94D8(this, globalCtx);
    if (thisx->colChkInfo.damageEffect != 5) {
        this->actionFunc(this, globalCtx);
        Actor_MoveForward(thisx);
        func_8002E4B4(globalCtx, thisx, 40.0f, 40.0f, 70.0f, 0x1D);
        Actor_SetHeight(thisx, thisx->scale.x * 4500.0f);
        Collider_CylinderUpdate(thisx, &this->collider1);
        if (thisx->colChkInfo.health <= 0) {
            this->collider1.dim.pos.x += (Math_Sins(thisx->shape.rot.y) * (-4400.0f * thisx->scale.y));
            this->collider1.dim.pos.z += (Math_Coss(thisx->shape.rot.y) * (-4400.0f * thisx->scale.y));
        }
        CollisionCheck_SetOC(globalCtx, &globalCtx->colChkCtx, &this->collider1.base);
        if (this->unk_320 >= 5) {
            if ((thisx->params == 0) || (this->unk_320 != 10)) {
                CollisionCheck_SetAC(globalCtx, &globalCtx->colChkCtx, &this->collider1.base);
            }
        }
        if (this->unk_320 >= 6) {
            CollisionCheck_SetAC(globalCtx, &globalCtx->colChkCtx, &this->collider3.base);
        }
        if (this->attackParams > 0) {
            CollisionCheck_SetAT(globalCtx, &globalCtx->colChkCtx, &this->collider2.base);
        }
    }
}

void EnMb_PostLimbDraw(GlobalContext* globalCtx, s32 limbIndex, Gfx** dList, Vec3s* rot, void* thisx) {
    static Vec3f D_80AA9DF0 = { 1100.0f, -700.0f, 0.0f };
    static Vec3f D_80AA9DFC = { 0.0f, 0.0f, 0.0f };
    static Vec3f D_80AA9E08 = { 0.0f, -8000.0f, 0.0f };
    static Vec3f D_80AA9E14 = { 0.0f, 0.0f, 0.0f };
    s32 bodyPart;
    EnMb* this = THIS;
    Vec3f sp24;
    s32 sp34;

    bodyPart = -1;
    if (this->actor.params == 0) {
        if (limbIndex == 12) {
            Matrix_MultVec3f(&D_80AA9E08, &this->effSpawnPos);
            if (this->attackParams > 0) {
                func_80AA9440(&this->actor, globalCtx);
            }
        }
        func_8002BDB0(&this->actor, limbIndex, 0x16, &D_80AA9DFC, 0x1B, &D_80AA9DFC);
    }
    if (this->unk_328 != 0) {
        switch (limbIndex) {
            case 7:
                bodyPart = 0;
                break;
            case 12:
                bodyPart = 1;
                break;
            case 17:
                bodyPart = 2;
                break;
            case 9:
                bodyPart = 3;
                break;
            case 14:
                bodyPart = 4;
                break;
            case 6:
                bodyPart = 5;
                break;
            case 20:
                bodyPart = 6;
                break;
            case 25:
                bodyPart = 7;
                break;
            case 22:
                bodyPart = 8;
                break;
            case 27:
                bodyPart = 9;
                break;
        }
        if (bodyPart >= 0) {
            Matrix_MultVec3f(&D_80AA9E14, &sp24);
            this->bodyPartsPos[bodyPart].x = sp24.x;
            this->bodyPartsPos[bodyPart].y = sp24.y;
            this->bodyPartsPos[bodyPart].z = sp24.z;
        }
    }
}

void EnMb_Draw(Actor* thisx, GlobalContext* globalCtx) {
    static Vec3f D_80AA9E20[] = {
        { 4000.0f, 7000.0f, 3500.0f },
        { 4000.0f, 0.0f, 3500.0f },
        { -4000.0f, 7000.0f, 3500.0f },
    };
    static Vec3f D_80AA9E44[] = {
        { -4000.0f, 7000.0f, 3500.0f },
        { -4000.0f, 0.0f, 3500.0f },
        { 4000.0f, 0.0f, 3500.0f },
    };
    s32 i;
    f32 scale;
    Vec3f phi_s2[3];
    Vec3f phi_s0[3];
    s32 tempPosIndex;
    EnMb* this = THIS;

    func_80093D18(globalCtx->state.gfxCtx);
    SkelAnime_DrawFlexOpa(globalCtx, this->skelAnime.skeleton, this->skelAnime.limbDrawTbl, this->skelAnime.dListCount,
                          NULL, EnMb_PostLimbDraw, thisx);
    if (thisx->params != 0) {
        if (this->attackParams > 0) {
            func_80AA92B8(thisx, globalCtx);
        }
        for (i = 0; i < 3; i++) {
            Matrix_MultVec3f(&D_80AA9E20[i], &phi_s2[i]);
            Matrix_MultVec3f(&D_80AA9E44[i], &phi_s0[i]);
        }
        func_800627A0(&this->collider3, 0, &phi_s2[0], &phi_s2[1], &phi_s2[2]);
        func_800627A0(&this->collider3, 1, &phi_s0[0], &phi_s0[1], &phi_s0[2]);
    }
    if (this->unk_328 != 0) {
        thisx->dmgEffectTimer++;
        if (this->unk_328 >= 0) {
            this->unk_328--;
        }
        if ((this->unk_328 & 3) == 0) {
            scale = 2.5f;
            if (thisx->params == 0) {
                scale = 4.0f;
            }
            tempPosIndex = this->unk_328 >> 2;
            EffectSsEnIce_SpawnFlyingVec3s(globalCtx, thisx, &this->bodyPartsPos[tempPosIndex], 0x96, 0x96, 0x96, 0xFA,
                                           0xEB, 0xF5, 0xFF, scale);
        }
    }
}
