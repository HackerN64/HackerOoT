/*
 * File: z_obj_bombiwa.c
 * Overlay: ovl_Obj_Bombiwa
 * Description: Round, brown, breakable boulder
 */

#include "z_obj_bombiwa.h"
#include "overlays/effects/ovl_Effect_Ss_Kakera/z_eff_ss_kakera.h"

#define FLAGS 0x00000000

#define THIS ((ObjBombiwa*)thisx)

void ObjBombiwa_Init(Actor* thisx, GlobalContext* globalCtx);
void ObjBombiwa_InitCollision(Actor* thisx, GlobalContext* globalCtx);
void ObjBombiwa_Destroy(Actor* thisx, GlobalContext* globalCtx);
void ObjBombiwa_Update(Actor* thisx, GlobalContext* globalCtx);
void ObjBombiwa_Draw(Actor* thisx, GlobalContext* globalCtx);

void ObjBombiwa_Break(ObjBombiwa* this, GlobalContext* globalCtx);

const ActorInit Obj_Bombiwa_InitVars = {
    ACTOR_OBJ_BOMBIWA,
    ACTORCAT_PROP,
    FLAGS,
    OBJECT_BOMBIWA,
    sizeof(ObjBombiwa),
    (ActorFunc)ObjBombiwa_Init,
    (ActorFunc)ObjBombiwa_Destroy,
    (ActorFunc)ObjBombiwa_Update,
    (ActorFunc)ObjBombiwa_Draw,
};

static ColliderCylinderInit sCylinderInit = {
    {
        COLTYPE_HARD,
        AT_NONE,
        AC_ON | AC_HARD | AC_TYPE_PLAYER,
        OC1_ON | OC1_TYPE_ALL,
        OC2_TYPE_2,
        COLSHAPE_CYLINDER,
    },
    {
        ELEMTYPE_UNK0,
        { 0x00000000, 0x00, 0x00 },
        { 0x4FC1FFFE, 0x00, 0x00 },
        TOUCH_NONE,
        BUMP_ON,
        OCELEM_ON,
    },
    { 55, 70, 0, { 0 } },
};

static CollisionCheckInfoInit sColChkInfoInit = { 0, 12, 60, MASS_IMMOVABLE };

static InitChainEntry sInitChain[] = {
    ICHAIN_VEC3F_DIV1000(scale, 0x64, ICHAIN_CONTINUE),
    ICHAIN_F32(uncullZoneForward, 0x7D0, ICHAIN_CONTINUE),
    ICHAIN_F32(uncullZoneScale, 0x15E, ICHAIN_CONTINUE),
    ICHAIN_F32(uncullZoneDownward, 0x3E8, ICHAIN_STOP),
};

static s16 sEffectScales[] = {
    17, 14, 10, 8, 7, 5, 3, 2,
};

extern Gfx D_060009E0[];

void ObjBombiwa_InitCollision(Actor* thisx, GlobalContext* globalCtx) {
    ObjBombiwa* this = THIS;

    Collider_InitCylinder(globalCtx, &this->collider);
    Collider_SetCylinder(globalCtx, &this->collider, &this->actor, &sCylinderInit);
    Collider_UpdateCylinder(&this->actor, &this->collider);
}

void ObjBombiwa_Init(Actor* thisx, GlobalContext* globalCtx) {
    Actor_ProcessInitChain(thisx, sInitChain);
    ObjBombiwa_InitCollision(thisx, globalCtx);
    if ((Flags_GetSwitch(globalCtx, thisx->params & 0x3F) != 0)) {
        Actor_Kill(thisx);
    } else {
        CollisionCheck_SetInfo(&thisx->colChkInfo, NULL, &sColChkInfoInit);
        if (thisx->shape.rot.y == 0) {
            s16 rand = (s16)Rand_ZeroFloat(65536.0f);
            thisx->world.rot.y = rand;
            thisx->shape.rot.y = rand;
        }
        thisx->shape.yOffset = -200.0f;
        thisx->world.pos.y = thisx->home.pos.y + 20.0f;
    }
}

void ObjBombiwa_Destroy(Actor* thisx, GlobalContext* globalCtx2) {
    GlobalContext* globalCtx = globalCtx2;
    ObjBombiwa* this = THIS;

    Collider_DestroyCylinder(globalCtx, &this->collider);
}

void ObjBombiwa_Break(ObjBombiwa* this, GlobalContext* globalCtx) {
    Vec3f pos;
    Vec3f velocity;
    Gfx** dlist;
    s16 arg5;
    s16 scale;
    s32 i;

    dlist = D_060009E0;
    for (i = 0; i < ARRAY_COUNT(sEffectScales); i++) {
        pos.x = ((Rand_ZeroOne() - 0.5f) * 10.0f) + this->actor.home.pos.x;
        pos.y = ((Rand_ZeroOne() * 5.0f) + this->actor.home.pos.y) + 8.0f;
        pos.z = ((Rand_ZeroOne() - 0.5f) * 10.0f) + this->actor.home.pos.z;
        velocity.x = (Rand_ZeroOne() - 0.5f) * 15.0f;
        velocity.y = (Rand_ZeroOne() * 16.0f) + 5.0f;
        velocity.z = (Rand_ZeroOne() - 0.5f) * 15.0f;
        scale = sEffectScales[i];
        arg5 = (scale >= 11) ? 37 : 33;
        EffectSsKakera_Spawn(globalCtx, &pos, &velocity, &pos, -400, arg5, 10, 2, 0, scale, 1, 0, 80, KAKERA_COLOR_NONE,
                             OBJECT_BOMBIWA, dlist);
    }
    func_80033480(globalCtx, &this->actor.world.pos, 60.0f, 8, 100, 160, 1);
}

void ObjBombiwa_Update(Actor* thisx, GlobalContext* globalCtx) {
    ObjBombiwa* this = THIS;
    s32 pad;

    if ((func_80033684(globalCtx, &this->actor) != NULL) ||
        ((this->collider.base.acFlags & AC_HIT) && (this->collider.info.acHitInfo->toucher.dmgFlags & 0x40000040))) {
        ObjBombiwa_Break(this, globalCtx);
        Flags_SetSwitch(globalCtx, this->actor.params & 0x3F);
        Audio_PlaySoundAtPosition(globalCtx, &this->actor.world.pos, 80, NA_SE_EV_WALL_BROKEN);
        if (((this->actor.params >> 0xF) & 1) != 0) {
            func_80078884(NA_SE_SY_CORRECT_CHIME);
        }
        Actor_Kill(&this->actor);
    } else {
        this->collider.base.acFlags &= ~AC_HIT;
        if (this->actor.xzDistToPlayer < 800.0f) {
            CollisionCheck_SetAC(globalCtx, &globalCtx->colChkCtx, &this->collider.base);
            CollisionCheck_SetOC(globalCtx, &globalCtx->colChkCtx, &this->collider.base);
        }
    }
}

void ObjBombiwa_Draw(Actor* thisx, GlobalContext* globalCtx) {
    Gfx_DrawDListOpa(globalCtx, D_060009E0);
}
