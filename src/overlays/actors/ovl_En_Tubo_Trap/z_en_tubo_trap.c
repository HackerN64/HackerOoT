/*
 * File: z_en_tubo_trap.c
 * Overlay: ovl_En_Tubo_Trap
 * Description: Flying pot enemy
 */

#include "z_en_tubo_trap.h"
#include "overlays/effects/ovl_Effect_Ss_Kakera/z_eff_ss_kakera.h"
#include "vt.h"

#define FLAGS 0x00000010

#define THIS ((EnTuboTrap*)thisx)

void EnTuboTrap_Init(Actor* thisx, GlobalContext* globalCtx);
void EnTuboTrap_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnTuboTrap_Update(Actor* thisx, GlobalContext* globalCtx);
void EnTuboTrap_Draw(Actor* thisx, GlobalContext* globalCtx);

void EnTuboTrap_WaitForProximity(EnTuboTrap* this, GlobalContext* globalCtx);
void EnTuboTrap_Levitate(EnTuboTrap* this, GlobalContext* globalCtx);
void EnTuboTrap_Fly(EnTuboTrap* this, GlobalContext* globalCtx);

static ColliderCylinderInit sCylinderInit = {
    {
        COLTYPE_NONE,
        AT_ON | AT_TYPE_ENEMY,
        AC_ON | AC_TYPE_PLAYER,
        OC1_NONE,
        OC2_TYPE_2,
        COLSHAPE_CYLINDER,
    },
    {
        ELEMTYPE_UNK0,
        { 0xFFCFFFFF, 0x00, 0x04 },
        { 0xFFCFFFFF, 0x00, 0x00 },
        TOUCH_ON | TOUCH_SFX_NORMAL,
        BUMP_ON,
        OCELEM_NONE,
    },
    { 9, 23, 0, { 0 } },
};

const ActorInit En_Tubo_Trap_InitVars = {
    ACTOR_EN_TUBO_TRAP,
    ACTORCAT_PROP,
    FLAGS,
    OBJECT_GAMEPLAY_DANGEON_KEEP,
    sizeof(EnTuboTrap),
    (ActorFunc)EnTuboTrap_Init,
    (ActorFunc)EnTuboTrap_Destroy,
    (ActorFunc)EnTuboTrap_Update,
    (ActorFunc)EnTuboTrap_Draw,
};

extern Gfx D_05017A60[];
extern Gfx D_05017870[];

void EnTuboTrap_Init(Actor* thisx, GlobalContext* globalCtx) {
    EnTuboTrap* this = THIS;

    ActorShape_Init(&this->actor.shape, 0.0f, ActorShadow_DrawCircle, 2.0f);
    osSyncPrintf("\n\n");
    osSyncPrintf(VT_FGCOL(GREEN) "☆☆☆☆☆ 壷トラップ ☆☆☆☆☆ %x\n" VT_RST, this->actor.params); // "Urn Trap"
    Collider_InitCylinder(globalCtx, &this->collider);
    Collider_SetCylinder(globalCtx, &this->collider, &this->actor, &sCylinderInit);
    Actor_SetScale(&this->actor, 0.1f);
    this->actionFunc = EnTuboTrap_WaitForProximity;
}

void EnTuboTrap_Destroy(Actor* thisx, GlobalContext* globalCtx) {
    EnTuboTrap* this = THIS;

    Collider_DestroyCylinder(globalCtx, &this->collider);
}

void EnTuboTrap_DropCollectible(EnTuboTrap* this, GlobalContext* globalCtx) {
    s16 params = this->actor.params;
    s16 param3FF = (params >> 6) & 0x3FF;

    if (param3FF >= 0 && param3FF < 0x1A) {
        Item_DropCollectible(globalCtx, &this->actor.world.pos, param3FF | ((params & 0x3F) << 8));
    }
}

void EnTuboTrap_SpawnEffectsOnLand(EnTuboTrap* this, GlobalContext* globalCtx) {
    f32 rand;
    f32 cos;
    f32 sin;
    Vec3f pos;
    Vec3f velocity;
    s16 var;
    s32 arg5;
    s32 i;
    Vec3f* actorPos = &this->actor.world.pos;

    for (i = 0, var = 0; i < 15; i++, var += 20000) {
        sin = Math_SinS(var);
        cos = Math_CosS(var);
        pos.x = sin * 8.0f;
        pos.y = (Rand_ZeroOne() * 5.0f) + 2.0f;
        pos.z = cos * 8.0f;

        velocity.x = pos.x * 0.23f;
        velocity.y = (Rand_ZeroOne() * 5.0f) + 2.0f;
        velocity.z = pos.z * 0.23f;

        pos.x += actorPos->x;
        pos.y += actorPos->y;
        pos.z += actorPos->z;

        rand = Rand_ZeroOne();
        if (rand < 0.2f) {
            arg5 = 96;
        } else if (rand < 0.6f) {
            arg5 = 64;
        } else {
            arg5 = 32;
        }

        EffectSsKakera_Spawn(globalCtx, &pos, &velocity, actorPos, -240, arg5, 10, 10, 0,
                             (Rand_ZeroOne() * 65.0f) + 15.0f, 0, 32, 60, KAKERA_COLOR_NONE,
                             OBJECT_GAMEPLAY_DANGEON_KEEP, D_05017A60);
    }

    func_80033480(globalCtx, actorPos, 30.0f, 4, 20, 50, 0);
}

void EnTuboTrap_SpawnEffectsInWater(EnTuboTrap* this, GlobalContext* globalCtx) {
    f32 rand;
    f32 cos;
    f32 sin;
    Vec3f pos;
    Vec3f velocity;
    s16 var;
    s32 arg5;
    s32 i;
    Vec3f* actorPos = &this->actor.world.pos;

    pos = *actorPos;
    pos.y += this->actor.yDistToWater;

    EffectSsGSplash_Spawn(globalCtx, &pos, 0, 0, 0, 400);

    for (i = 0, var = 0; i < 15; i++, var += 20000) {
        sin = Math_SinS(var);
        cos = Math_CosS(var);
        pos.x = sin * 8.0f;
        pos.y = (Rand_ZeroOne() * 5.0f) + 2.0f;
        pos.z = cos * 8.0f;

        velocity.x = pos.x * 0.20f;
        velocity.y = (Rand_ZeroOne() * 4.0f) + 2.0f;
        velocity.z = pos.z * 0.20f;

        pos.x += actorPos->x;
        pos.y += actorPos->y;
        pos.z += actorPos->z;

        rand = Rand_ZeroOne();
        if (rand < 0.2f) {
            arg5 = 64;
        } else {
            arg5 = 32;
        }

        EffectSsKakera_Spawn(globalCtx, &pos, &velocity, actorPos, -180, arg5, 30, 30, 0,
                             (Rand_ZeroOne() * 65.0f) + 15.0f, 0, 32, 70, KAKERA_COLOR_NONE,
                             OBJECT_GAMEPLAY_DANGEON_KEEP, D_05017A60);
    }
}

void EnTuboTrap_HandleImpact(EnTuboTrap* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;
    Player* player2 = PLAYER;

    if ((this->actor.bgCheckFlags & 0x20) && (this->actor.yDistToWater > 15.0f)) {
        EnTuboTrap_SpawnEffectsInWater(this, globalCtx);
        Audio_PlaySoundAtPosition(globalCtx, &this->actor.world.pos, 40, NA_SE_EV_BOMB_DROP_WATER);
        EnTuboTrap_DropCollectible(this, globalCtx);
        Actor_Kill(&this->actor);
        return;
    }

    if (this->collider.base.atFlags & AT_BOUNCED) {
        this->collider.base.atFlags &= ~AT_BOUNCED;
        EnTuboTrap_SpawnEffectsOnLand(this, globalCtx);
        Audio_PlaySoundAtPosition(globalCtx, &this->actor.world.pos, 40, NA_SE_IT_SHIELD_REFLECT_SW);
        Audio_PlaySoundAtPosition(globalCtx, &this->actor.world.pos, 40, NA_SE_EV_POT_BROKEN);
        EnTuboTrap_DropCollectible(this, globalCtx);
        Actor_Kill(&this->actor);
        return;
    }

    if (this->collider.base.acFlags & AC_HIT) {
        this->collider.base.acFlags &= ~AC_HIT;
        EnTuboTrap_SpawnEffectsOnLand(this, globalCtx);
        Audio_PlaySoundAtPosition(globalCtx, &this->actor.world.pos, 40, NA_SE_EV_EXPLOSION);
        Audio_PlaySoundAtPosition(globalCtx, &this->actor.world.pos, 40, NA_SE_EV_POT_BROKEN);
        EnTuboTrap_DropCollectible(this, globalCtx);
        Actor_Kill(&this->actor);
        return;
    }

    if (this->collider.base.atFlags & AT_HIT) {
        this->collider.base.atFlags &= ~AT_HIT;
        if (this->collider.base.at == &player->actor) {
            EnTuboTrap_SpawnEffectsOnLand(this, globalCtx);
            Audio_PlaySoundAtPosition(globalCtx, &this->actor.world.pos, 40, NA_SE_EV_POT_BROKEN);
            Audio_PlaySoundAtPosition(globalCtx, &player2->actor.world.pos, 40, NA_SE_PL_BODY_HIT);
            EnTuboTrap_DropCollectible(this, globalCtx);
            Actor_Kill(&this->actor);
            return;
        }
    }

    if ((this->actor.bgCheckFlags & 8) || (this->actor.bgCheckFlags & 1)) {
        EnTuboTrap_SpawnEffectsOnLand(this, globalCtx);
        Audio_PlaySoundAtPosition(globalCtx, &this->actor.world.pos, 40, NA_SE_EV_POT_BROKEN);
        EnTuboTrap_DropCollectible(this, globalCtx);
        Actor_Kill(&this->actor);
        return;
    }
}

void EnTuboTrap_WaitForProximity(EnTuboTrap* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;
    f32 targetHeight;

    if (BREG(2) != 0) {
        osSyncPrintf(VT_FGCOL(GREEN) "☆☆☆☆☆ わて     ☆☆☆☆☆ %f\n" VT_RST, this->actor.world.pos.y);   // "You"
        osSyncPrintf(VT_FGCOL(GREEN) "☆☆☆☆☆ おいどん ☆☆☆☆☆ %f\n" VT_RST, player->actor.world.pos.y); // "Me"
        osSyncPrintf("\n\n");
    }

    if (this->actor.xzDistToPlayer < 200.0f && this->actor.world.pos.y <= player->actor.world.pos.y) {
        Actor_ChangeCategory(globalCtx, &globalCtx->actorCtx, &this->actor, ACTORCAT_ENEMY);
        this->actor.flags |= 1;
        targetHeight = 40.0f + -10.0f * gSaveContext.linkAge;

        this->targetY = player->actor.world.pos.y + targetHeight;
        if (this->targetY < this->actor.world.pos.y) {
            this->targetY = this->actor.world.pos.y + targetHeight;
        }

        this->originPos = this->actor.world.pos;
        Audio_PlayActorSound2(&this->actor, NA_SE_EV_POT_MOVE_START);
        this->actionFunc = EnTuboTrap_Levitate;
    }
}

void EnTuboTrap_Levitate(EnTuboTrap* this, GlobalContext* globalCtx) {
    this->actor.shape.rot.y += 5000;
    Math_ApproachF(&this->actor.world.pos.y, this->targetY, 0.8f, 3.0f);

    if (fabsf(this->actor.world.pos.y - this->targetY) < 10.0f) {
        this->actor.speedXZ = 10.0f;
        this->actor.world.rot.y = this->actor.yawTowardsPlayer;
        this->actionFunc = EnTuboTrap_Fly;
    }
}

void EnTuboTrap_Fly(EnTuboTrap* this, GlobalContext* globalCtx) {
    f32 dx = this->originPos.x - this->actor.world.pos.x;
    f32 dy = this->originPos.y - this->actor.world.pos.y;
    f32 dz = this->originPos.z - this->actor.world.pos.z;

    Audio_PlayActorSound2(&this->actor, NA_SE_EN_TUBOOCK_FLY - SFX_FLAG);

    if (240.0f < sqrtf(SQ(dx) + SQ(dy) + SQ(dz))) {
        Math_ApproachF(&this->actor.gravity, -3.0f, 0.2f, 0.5f);
    }

    this->actor.shape.rot.y += 5000;
    EnTuboTrap_HandleImpact(this, globalCtx);
}

void EnTuboTrap_Update(Actor* thisx, GlobalContext* globalCtx) {
    EnTuboTrap* this = THIS;
    s32 pad;

    this->actionFunc(this, globalCtx);
    Actor_MoveForward(&this->actor);
    Actor_UpdateBgCheckInfo(globalCtx, &this->actor, 10.0f, 10.0f, 20.0f, 0x1D);
    Actor_SetFocus(&this->actor, 0.0f);
    Collider_UpdateCylinder(&this->actor, &this->collider);
    CollisionCheck_SetAC(globalCtx, &globalCtx->colChkCtx, &this->collider.base);
    CollisionCheck_SetAT(globalCtx, &globalCtx->colChkCtx, &this->collider.base);
}

void EnTuboTrap_Draw(Actor* thisx, GlobalContext* globalCtx) {
    Gfx_DrawDListOpa(globalCtx, D_05017870);
}
