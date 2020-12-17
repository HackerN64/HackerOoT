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
    ACTORTYPE_PROP,
    FLAGS,
    OBJECT_BOMBIWA,
    sizeof(ObjBombiwa),
    (ActorFunc)ObjBombiwa_Init,
    (ActorFunc)ObjBombiwa_Destroy,
    (ActorFunc)ObjBombiwa_Update,
    (ActorFunc)ObjBombiwa_Draw,
};

static ColliderCylinderInit sCylinderInit = {
    { COLTYPE_UNK12, 0x00, 0x0D, 0x39, 0x20, COLSHAPE_CYLINDER },
    { 0x00, { 0x00000000, 0x00, 0x00 }, { 0x4FC1FFFE, 0x00, 0x00 }, 0x00, 0x01, 0x01 },
    { 55, 70, 0, { 0 } },
};

static CollisionCheckInfoInit sColChkInfoInit = {
    0x00,
    0x000C,
    0x003C,
    0xFF,
};

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
    Collider_CylinderUpdate(&this->actor, &this->collider);
}

void ObjBombiwa_Init(Actor* thisx, GlobalContext* globalCtx) {
    Actor_ProcessInitChain(thisx, sInitChain);
    ObjBombiwa_InitCollision(thisx, globalCtx);
    if ((Flags_GetSwitch(globalCtx, thisx->params & 0x3F) != 0)) {
        Actor_Kill(thisx);
    } else {
        func_80061ED4(&thisx->colChkInfo, NULL, &sColChkInfoInit);
        if (thisx->shape.rot.y == 0) {
            s16 rand = (s16)Math_Rand_ZeroFloat(65536.0f);
            thisx->posRot.rot.y = rand;
            thisx->shape.rot.y = rand;
        }
        thisx->shape.unk_08 = -200.0f;
        thisx->posRot.pos.y = thisx->initPosRot.pos.y + 20.0f;
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
        pos.x = ((Math_Rand_ZeroOne() - 0.5f) * 10.0f) + this->actor.initPosRot.pos.x;
        pos.y = ((Math_Rand_ZeroOne() * 5.0f) + this->actor.initPosRot.pos.y) + 8.0f;
        pos.z = ((Math_Rand_ZeroOne() - 0.5f) * 10.0f) + this->actor.initPosRot.pos.z;
        velocity.x = (Math_Rand_ZeroOne() - 0.5f) * 15.0f;
        velocity.y = (Math_Rand_ZeroOne() * 16.0f) + 5.0f;
        velocity.z = (Math_Rand_ZeroOne() - 0.5f) * 15.0f;
        scale = sEffectScales[i];
        arg5 = (scale >= 11) ? 37 : 33;
        EffectSsKakera_Spawn(globalCtx, &pos, &velocity, &pos, -400, arg5, 10, 2, 0, scale, 1, 0, 80, KAKERA_COLOR_NONE,
                             OBJECT_BOMBIWA, dlist);
    }
    func_80033480(globalCtx, &this->actor.posRot.pos, 60.0f, 8, 100, 160, 1);
}

void ObjBombiwa_Update(Actor* thisx, GlobalContext* globalCtx) {
    ObjBombiwa* this = THIS;
    s32 pad;

    if (func_80033684(globalCtx, &this->actor) != NULL ||
        ((this->collider.base.acFlags & 2) != 0 && (this->collider.body.acHitItem->toucher.flags & 0x40000040) != 0)) {
        ObjBombiwa_Break(this, globalCtx);
        Flags_SetSwitch(globalCtx, this->actor.params & 0x3F);
        Audio_PlaySoundAtPosition(globalCtx, &this->actor.posRot.pos, 80, NA_SE_EV_WALL_BROKEN);
        if (((this->actor.params >> 0xF) & 1) != 0) {
            func_80078884(NA_SE_SY_CORRECT_CHIME);
        }
        Actor_Kill(&this->actor);
    } else {
        this->collider.base.acFlags &= ~0x2;
        if (this->actor.xzDistFromLink < 800.0f) {
            CollisionCheck_SetAC(globalCtx, &globalCtx->colChkCtx, &this->collider);
            CollisionCheck_SetOC(globalCtx, &globalCtx->colChkCtx, &this->collider);
        }
    }
}

void ObjBombiwa_Draw(Actor* thisx, GlobalContext* globalCtx) {
    Gfx_DrawDListOpa(globalCtx, D_060009E0);
}
