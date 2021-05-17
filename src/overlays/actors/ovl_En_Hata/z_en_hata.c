/*
 * File: z_en_hata.c
 * Overlay: ovl_En_Hata
 * Description: Wooden post with red cloth
 */

#include "z_en_hata.h"
#include "objects/object_hata/object_hata.h"

#define FLAGS 0x00000000

#define THIS ((EnHata*)thisx)

void EnHata_Init(Actor* thisx, GlobalContext* globalCtx);
void EnHata_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnHata_Update(Actor* thisx, GlobalContext* globalCtx);
void EnHata_Draw(Actor* thisx, GlobalContext* globalCtx);

const ActorInit En_Hata_InitVars = {
    ACTOR_EN_HATA,
    ACTORCAT_PROP,
    FLAGS,
    OBJECT_HATA,
    sizeof(EnHata),
    (ActorFunc)EnHata_Init,
    (ActorFunc)EnHata_Destroy,
    (ActorFunc)EnHata_Update,
    (ActorFunc)EnHata_Draw,
};

// Unused Collider and CollisionCheck data
static ColliderCylinderInit sCylinderInit = {
    {
        COLTYPE_NONE,
        AT_NONE,
        AC_ON | AC_TYPE_PLAYER,
        OC1_ON | OC1_TYPE_ALL,
        OC2_TYPE_2,
        COLSHAPE_CYLINDER,
    },
    {
        ELEMTYPE_UNK0,
        { 0x00000000, 0x00, 0x00 },
        { 0x00000080, 0x00, 0x00 },
        TOUCH_NONE | TOUCH_SFX_NORMAL,
        BUMP_ON | BUMP_HOOKABLE,
        OCELEM_ON,
    },
    { 16, 246, 0, { 0, 0, 0 } },
};

static CollisionCheckInfoInit2 sColChkInfoInit = { 0, 0, 0, 0, MASS_IMMOVABLE };

void EnHata_Init(Actor* thisx, GlobalContext* globalCtx) {
    EnHata* this = THIS;
    s32 pad;
    CollisionHeader* colHeader = NULL;
    f32 frameCount = Animation_GetLastFrame(&gFlagpoleFlapAnim);

    Actor_SetScale(&this->dyna.actor, 1.0f / 75.0f);
    SkelAnime_Init(globalCtx, &this->skelAnime, &gFlagpoleSkel, &gFlagpoleFlapAnim, NULL, NULL, 0);
    Animation_Change(&this->skelAnime, &gFlagpoleFlapAnim, 1.0f, 0.0f, frameCount, ANIMMODE_LOOP, 0.0f);
    DynaPolyActor_Init(&this->dyna, DPM_UNK);
    CollisionHeader_GetVirtual(&gFlagpoleCol, &colHeader);
    this->dyna.bgId = DynaPoly_SetBgActor(globalCtx, &globalCtx->colCtx.dyna, &this->dyna.actor, colHeader);
    this->dyna.actor.uncullZoneScale = 500.0f;
    this->dyna.actor.uncullZoneDownward = 550.0f;
    this->dyna.actor.uncullZoneForward = 2200.0f;
    this->invScale = 6;
    this->maxStep = 1000;
    this->minStep = 1;
    this->unk_278 = Rand_ZeroOne() * 0xFFFF;
}

void EnHata_Destroy(Actor* thisx, GlobalContext* globalCtx) {
    EnHata* this = THIS;

    SkelAnime_Free(&this->skelAnime, globalCtx);
    DynaPoly_DeleteBgActor(globalCtx, &globalCtx->colCtx.dyna, this->dyna.bgId);
}

void EnHata_Update(Actor* thisx, GlobalContext* globalCtx2) {
    GlobalContext* globalCtx = globalCtx2;
    EnHata* this = THIS;
    s32 pitch;
    Vec3f zeroVec = { 0.0f, 0.0f, 0.0f };
    Vec3f windVec;
    f32 sin;

    SkelAnime_Update(&this->skelAnime);

    // Rotate to hang down by default
    this->limbs[FLAGPOLE_LIMB_FLAG_1_BASE].y = this->limbs[FLAGPOLE_LIMB_FLAG_2_BASE].y = -0x4000;
    windVec.x = globalCtx->envCtx.unk_A8;
    windVec.y = globalCtx->envCtx.unk_AA;
    windVec.z = globalCtx->envCtx.unk_AC;

    if (globalCtx->envCtx.unk_B0 > 255.0f) {
        globalCtx->envCtx.unk_B0 = 255.0f;
    }

    if (globalCtx->envCtx.unk_B0 < 0.0f) {
        globalCtx->envCtx.unk_B0 = 0.0f;
    }

    if (Rand_ZeroOne() > 0.5f) {
        this->unk_278 += 6000;
    } else {
        this->unk_278 += 3000;
    }

    // Mimic varying wind gusts
    sin = Math_SinS(this->unk_278) * 80.0f;
    pitch = -Math_Vec3f_Pitch(&zeroVec, &windVec);
    pitch = ((s32)((15000 - pitch) * (1.0f - (globalCtx->envCtx.unk_B0 / (255.0f - sin))))) + pitch;
    Math_SmoothStepToS(&this->limbs[FLAGPOLE_LIMB_FLAG_1_HOIST_END_BASE].y, pitch, this->invScale, this->maxStep,
                       this->minStep);
    this->limbs[FLAGPOLE_LIMB_FLAG_2_HOIST_END_BASE].y = this->limbs[FLAGPOLE_LIMB_FLAG_1_HOIST_END_BASE].y;
    this->limbs[FLAGPOLE_LIMB_FLAG_1_HOIST_END_BASE].z = -Math_Vec3f_Yaw(&zeroVec, &windVec);
    this->limbs[FLAGPOLE_LIMB_FLAG_2_HOIST_END_BASE].z = this->limbs[FLAGPOLE_LIMB_FLAG_1_HOIST_END_BASE].z;
    this->skelAnime.playSpeed = (Rand_ZeroFloat(1.25f) + 2.75f) * (globalCtx->envCtx.unk_B0 / 255.0f);
}

s32 EnHata_OverrideLimbDraw(GlobalContext* globalCtx, s32 limbIndex, Gfx** dList, Vec3f* pos, Vec3s* rot, void* thisx) {
    EnHata* this = THIS;
    Vec3s* limbs;

    if (limbIndex == FLAGPOLE_LIMB_FLAG_2_BASE || limbIndex == FLAGPOLE_LIMB_FLAG_1_BASE ||
        limbIndex == FLAGPOLE_LIMB_FLAG_2_HOIST_END_BASE || limbIndex == FLAGPOLE_LIMB_FLAG_1_HOIST_END_BASE) {
        limbs = this->limbs;
        rot->x += limbs[limbIndex].x;
        rot->y += limbs[limbIndex].y;
        rot->z += limbs[limbIndex].z;
    }
    return false;
}

void EnHata_PostLimbDraw(GlobalContext* globalCtx, s32 limbIndex, Gfx** dList, Vec3s* rot, void* thisx) {
}

void EnHata_Draw(Actor* thisx, GlobalContext* globalCtx) {
    EnHata* this = THIS;

    func_800943C8(globalCtx->state.gfxCtx);
    Matrix_Scale(1.0f, 1.1f, 1.0f, MTXMODE_APPLY);
    SkelAnime_DrawOpa(globalCtx, this->skelAnime.skeleton, this->skelAnime.jointTable, EnHata_OverrideLimbDraw,
                      EnHata_PostLimbDraw, this);
}
