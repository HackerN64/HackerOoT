/*
 * File: z_en_po_desert.c
 * Overlay: ovl_En_Po_Desert
 * Description: Guide Poe (Haunted Wasteland)
 */

#include "z_en_po_desert.h"

#define FLAGS 0x00001090

#define THIS ((EnPoDesert*)thisx)

void EnPoDesert_Init(Actor* thisx, GlobalContext* globalCtx);
void EnPoDesert_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnPoDesert_Update(Actor* thisx, GlobalContext* globalCtx);
void EnPoDesert_Draw(Actor* thisx, GlobalContext* globalCtx);

void EnPoDesert_SetNextPathPoint(EnPoDesert* this, GlobalContext* globalCtx);
void EnPoDesert_WaitForPlayer(EnPoDesert* this, GlobalContext* globalCtx);
void EnPoDesert_MoveToNextPoint(EnPoDesert* this, GlobalContext* globalCtx);
void EnPoDesert_Disappear(EnPoDesert* this, GlobalContext* globalCtx);

const ActorInit En_Po_Desert_InitVars = {
    ACTOR_EN_PO_DESERT,
    ACTORCAT_BG,
    FLAGS,
    OBJECT_PO_FIELD,
    sizeof(EnPoDesert),
    (ActorFunc)EnPoDesert_Init,
    (ActorFunc)EnPoDesert_Destroy,
    (ActorFunc)EnPoDesert_Update,
    (ActorFunc)EnPoDesert_Draw,
};

static ColliderCylinderInit sColliderInit = {
    {
        COLTYPE_HIT3,
        AT_NONE,
        AC_NONE,
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
    { 25, 50, 20, { 0, 0, 0 } },
};

static InitChainEntry sInitChain[] = {
    ICHAIN_S8(naviEnemyId, 0x5C, ICHAIN_CONTINUE),
    ICHAIN_F32(uncullZoneForward, 2000, ICHAIN_CONTINUE),
    ICHAIN_F32(targetArrowOffset, 3200, ICHAIN_STOP),
};

extern SkeletonHeader D_06006A30;
extern AnimationHeader D_06000924;
extern AnimationHeader D_06001360;

extern Gfx D_06004BA0[];
extern Gfx D_06004CC0[];

void EnPoDesert_Init(Actor* thisx, GlobalContext* globalCtx) {
    s32 pad;
    EnPoDesert* this = THIS;

    Actor_ProcessInitChain(&this->actor, sInitChain);
    SkelAnime_Init(globalCtx, &this->skelAnime, &D_06006A30, &D_06000924, this->jointTable, this->morphTable, 10);
    Collider_InitCylinder(globalCtx, &this->collider);
    Collider_SetCylinder(globalCtx, &this->collider, &this->actor, &sColliderInit);
    this->lightColor.r = 255;
    this->lightColor.g = 255;
    this->lightColor.b = 210;
    this->lightColor.a = 255;
    this->lightNode = LightContext_InsertLight(globalCtx, &globalCtx->lightCtx, &this->lightInfo);
    Lights_PointNoGlowSetInfo(&this->lightInfo, this->actor.home.pos.x, this->actor.home.pos.y, this->actor.home.pos.z,
                              255, 255, 255, 200);
    ActorShape_Init(&this->actor.shape, 0.0f, ActorShadow_DrawCircle, 37.0f);
    this->currentPathPoint = 1;
    this->actor.params = (this->actor.params >> 8) & 0xFF;
    this->targetY = this->actor.world.pos.y;
    EnPoDesert_SetNextPathPoint(this, globalCtx);
}

void EnPoDesert_Destroy(Actor* thisx, GlobalContext* globalCtx) {
    EnPoDesert* this = THIS;

    LightContext_RemoveLight(globalCtx, &globalCtx->lightCtx, this->lightNode);
    Collider_DestroyCylinder(globalCtx, &this->collider);
}

void EnPoDesert_SetNextPathPoint(EnPoDesert* this, GlobalContext* globalCtx) {
    Path* path = &globalCtx->setupPathList[this->actor.params];
    Vec3s* pathPoint;

    Animation_MorphToLoop(&this->skelAnime, &D_06001360, -6.0f);
    pathPoint = &((Vec3s*)SEGMENTED_TO_VIRTUAL(path->points))[this->currentPathPoint];
    this->actor.home.pos.x = pathPoint->x;
    this->actor.home.pos.y = pathPoint->y;
    this->actor.home.pos.z = pathPoint->z;
    this->initDistToNextPoint = Actor_WorldDistXZToPoint(&this->actor, &this->actor.home.pos);
    this->initDistToNextPoint = CLAMP_MIN(this->initDistToNextPoint, 1.0f);
    this->currentPathPoint++;
    this->yDiff = this->actor.home.pos.y - this->actor.world.pos.y;
    this->actor.speedXZ = 0.0f;
    if (path->count == this->currentPathPoint) {
        this->currentPathPoint = 0;
    }
    this->actionFunc = EnPoDesert_WaitForPlayer;
}

void EnPoDesert_SetupMoveToNextPoint(EnPoDesert* this) {
    Animation_MorphToLoop(&this->skelAnime, &D_06000924, -5.0f);
    this->actionFunc = EnPoDesert_MoveToNextPoint;
}

void EnPoDesert_SetupDisappear(EnPoDesert* this) {
    Animation_MorphToPlayOnce(&this->skelAnime, &D_06001360, -6.0f);
    this->actionTimer = 16;
    this->actor.speedXZ = 0.0f;
    Audio_PlayActorSound2(&this->actor, NA_SE_EN_PO_DISAPPEAR);
    this->actionFunc = EnPoDesert_Disappear;
}

void EnPoDesert_UpdateSpeedModifier(EnPoDesert* this) {
    if (this->speedModifier == 0) {
        this->speedModifier = 32;
    }
    if (this->speedModifier != 0) {
        this->speedModifier--;
    }
    this->actor.world.pos.y = Math_SinS(this->speedModifier * 0x800) * 13.0f + this->targetY;
}

void EnPoDesert_WaitForPlayer(EnPoDesert* this, GlobalContext* globalCtx) {
    func_8002F974(&this->actor, NA_SE_EN_PO_FLY - SFX_FLAG);
    if (this->actor.xzDistToPlayer < 200.0f && (this->currentPathPoint != 2 || globalCtx->actorCtx.unk_03)) {
        if (this->currentPathPoint == 2) {
            if (Gameplay_InCsMode(globalCtx)) {
                this->actor.shape.rot.y += 0x800;
                return;
            }
            func_8010B680(globalCtx, 0x600B, NULL);
        }
        EnPoDesert_SetupMoveToNextPoint(this);
    } else {
        this->actor.shape.rot.y += 0x800;
    }
}

void EnPoDesert_MoveToNextPoint(EnPoDesert* this, GlobalContext* globalCtx) {
    f32 temp_f20;

    if (this->actionTimer != 0) {
        this->actionTimer--;
    }
    temp_f20 = sinf(this->actionTimer * (M_PI / 20.0f)) * 5.0f;
    this->actor.world.pos.x += temp_f20 * Math_CosS(this->actor.shape.rot.y);
    this->actor.world.pos.z += temp_f20 * Math_SinS(this->actor.shape.rot.y);
    if (this->actionTimer == 0) {
        this->actionTimer = 40;
    }
    temp_f20 = Actor_WorldDistXZToPoint(&this->actor, &this->actor.home.pos);
    this->actor.world.rot.y = Actor_WorldYawTowardPoint(&this->actor, &this->actor.home.pos);
    Math_ApproachS(&this->actor.shape.rot.y, this->actor.world.rot.y + 0x8000, 5, 0x400);
    this->actor.speedXZ = sinf(this->speedModifier * (M_PI / 32.0f)) * 2.5f + 5.5f;
    func_8002F974(&this->actor, NA_SE_EN_PO_FLY - SFX_FLAG);
    this->targetY = this->actor.home.pos.y - ((temp_f20 * this->yDiff) / this->initDistToNextPoint);
    if (temp_f20 < 40.0f) {
        if (this->currentPathPoint != 0) {
            EnPoDesert_SetNextPathPoint(this, globalCtx);
        } else {
            EnPoDesert_SetupDisappear(this);
        }
    }
}

void EnPoDesert_Disappear(EnPoDesert* this, GlobalContext* globalCtx) {
    if (this->actionTimer != 0) {
        this->actionTimer--;
    }
    this->actor.shape.rot.y += 0x2000;
    this->lightColor.a = this->actionTimer * 15.9375f;
    this->actor.shape.shadowAlpha = this->lightColor.a;
    if (this->actionTimer == 0) {
        Actor_Kill(&this->actor);
    }
}

void EnPoDesert_Update(Actor* thisx, GlobalContext* globalCtx) {
    EnPoDesert* this = THIS;
    s32 pad;

    SkelAnime_Update(&this->skelAnime);
    this->actionFunc(this, globalCtx);
    Actor_MoveForward(&this->actor);
    EnPoDesert_UpdateSpeedModifier(this);
    Actor_UpdateBgCheckInfo(globalCtx, &this->actor, 0.0f, 27.0f, 60.0f, 4);
    Actor_SetFocus(&this->actor, 42.0f);
    Collider_UpdateCylinder(&this->actor, &this->collider);
    CollisionCheck_SetOC(globalCtx, &globalCtx->colChkCtx, &this->collider.base);
    if (globalCtx->actorCtx.unk_03) {
        this->actor.flags |= 0x81;
        this->actor.shape.shadowDraw = ActorShadow_DrawCircle;
    } else {
        this->actor.shape.shadowDraw = NULL;
        this->actor.flags &= ~0x81;
    }
}

s32 EnPoDesert_OverrideLimbDraw(GlobalContext* globalCtx, s32 limbIndex, Gfx** dList, Vec3f* pos, Vec3s* rot,
                                void* thisx, Gfx** gfxP) {
    EnPoDesert* this = THIS;
    f32 mtxScale;

    if (this->actionFunc == EnPoDesert_Disappear && limbIndex == 7) {
        mtxScale = this->actionTimer * 0.0625f;
        Matrix_Scale(mtxScale, mtxScale, mtxScale, MTXMODE_APPLY);
    }
    if ((this->actor.flags & 0x80) != 0x80) {
        *dList = NULL;
    }
    return false;
}

void EnPoDesert_PostLimbDraw(GlobalContext* globalCtx, s32 limbIndex, Gfx** dList, Vec3s* rot, void* thisx,
                             Gfx** gfxP) {
    static Vec3f baseLightPos = { 0.0f, 1400.0f, 0.0f };

    EnPoDesert* this = THIS;
    f32 rand;
    Color_RGBA8 color;
    Vec3f lightPos;

    if (limbIndex == 7) {
        Matrix_MultVec3f(&baseLightPos, &lightPos);
        rand = Rand_ZeroOne();
        color.r = (s16)(rand * 30.0f) + 225;
        color.g = (s16)(rand * 100.0f) + 155;
        color.b = (s16)(rand * 160.0f) + 95;
        if ((this->actor.flags & 0x80) == 0x80) {
            gDPPipeSync((*gfxP)++);
            gDPSetEnvColor((*gfxP)++, color.r, color.g, color.b, 255);
            gSPMatrix((*gfxP)++, Matrix_NewMtx(globalCtx->state.gfxCtx, "../z_en_po_desert.c", 523),
                      G_MTX_NOPUSH | G_MTX_LOAD | G_MTX_MODELVIEW);
            gSPDisplayList((*gfxP)++, D_06004BA0);
            gSPDisplayList((*gfxP)++, D_06004CC0);
            gDPPipeSync((*gfxP)++);
            gDPSetEnvColor((*gfxP)++, this->lightColor.r, this->lightColor.g, this->lightColor.b, this->lightColor.a);
        }
        Lights_PointNoGlowSetInfo(&this->lightInfo, lightPos.x, lightPos.y, lightPos.z, color.r, color.g, color.b, 200);
    }
}

void EnPoDesert_Draw(Actor* thisx, GlobalContext* globalCtx) {
    EnPoDesert* this = THIS;

    OPEN_DISPS(globalCtx->state.gfxCtx, "../z_en_po_desert.c", 559);
    func_80093D84(globalCtx->state.gfxCtx);
    gSPSegment(POLY_XLU_DISP++, 0x0A, Gfx_EnvColor(globalCtx->state.gfxCtx, 255, 85, 0, 255));
    gSPSegment(POLY_XLU_DISP++, 0x08,
               Gfx_EnvColor(globalCtx->state.gfxCtx, this->lightColor.r, this->lightColor.g, this->lightColor.b,
                            this->lightColor.a));
    if (this->actionFunc == EnPoDesert_Disappear) {
        gSPSegment(POLY_XLU_DISP++, 0x0C, D_80116280);
    } else {
        gSPSegment(POLY_XLU_DISP++, 0x0C, D_80116280 + 2);
    }
    POLY_XLU_DISP = SkelAnime_Draw(globalCtx, this->skelAnime.skeleton, this->skelAnime.jointTable,
                                   EnPoDesert_OverrideLimbDraw, EnPoDesert_PostLimbDraw, &this->actor, POLY_XLU_DISP);
    CLOSE_DISPS(globalCtx->state.gfxCtx, "../z_en_po_desert.c", 597);
}
