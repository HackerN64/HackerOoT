#include "z_en_bubble.h"

#define FLAGS 0x00000001

#define THIS ((EnBubble*)thisx)

void EnBubble_Init(Actor* thisx, GlobalContext* globalCtx);
void EnBubble_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnBubble_Update(Actor* thisx, GlobalContext* globalCtx);
void EnBubble_Draw(Actor* thisx, GlobalContext* globalCtx);

void EnBubble_Wait(EnBubble* this, GlobalContext* globalCtx);
void EnBubble_Pop(EnBubble* this, GlobalContext* globalCtx);
void EnBubble_Regrow(EnBubble* this, GlobalContext* globalCtx);

extern Gfx D_06001000[];

const ActorInit En_Bubble_InitVars = {
    ACTOR_EN_BUBBLE,
    ACTORTYPE_ENEMY,
    FLAGS,
    OBJECT_BUBBLE,
    sizeof(EnBubble),
    (ActorFunc)EnBubble_Init,
    (ActorFunc)EnBubble_Destroy,
    (ActorFunc)EnBubble_Update,
    (ActorFunc)EnBubble_Draw,
};

static ColliderJntSphItemInit sJntSphItemsInit[] = {
    {
        { 0x00, { 0x00000000, 0x00, 0x04 }, { 0xFFCFD753, 0x00, 0x00 }, 0x00, 0x01, 0x01 },
        { 0x00, { { 0x0000, 0x0000, 0x0000 }, 16 }, 100 },
    },
    {
        { 0x00, { 0x00000000, 0x00, 0x00 }, { 0x00002824, 0x00, 0x00 }, 0x00, 0x79, 0x00 },
        { 0x00, { { 0x0000, 0x0000, 0x0000 }, 16 }, 100 },
    },
};

static ColliderJntSphInit sJntSphInit = {
    { COLTYPE_UNK6, 0x11, 0x09, 0x39, 0x10, COLSHAPE_JNTSPH },
    2,
    sJntSphItemsInit,
};

static CollisionCheckInfoInit2 sColChkInfoInit2 = {
    0x01, 0x0002, 0x0019, 0x0019, 0xFF,
};

static Vec3f sEffectAccel = { 0.0f, -0.5f, 0.0f };

static Color_RGBA8 sEffectPrimColor = { 255, 255, 255, 255 };

static Color_RGBA8 sEffectEnvColor = { 150, 150, 150, 0 };

void EnBubble_SetDimensions(EnBubble* this, f32 dim) {
    f32 a;
    f32 b;
    f32 c;
    f32 d;

    this->actor.flags |= 1;
    Actor_SetScale(&this->actor, 1.0f);
    this->actor.shape.unk_08 = 16.0f;
    this->graphicRotSpeed = 16.0f;
    this->graphicEccentricity = 0.08f;
    this->expansionWidth = dim;
    this->expansionHeight = dim;
    a = Rand_ZeroOne();
    b = Rand_ZeroOne();
    c = Rand_ZeroOne();
    this->unk_218 = 1.0f;
    this->unk_21C = 1.0f;
    d = (a * a) + (b * b) + (c * c);
    this->unk_1FC.x = a / d;
    this->unk_1FC.y = b / d;
    this->unk_1FC.z = c / d;
}

u32 func_809CBCBC(EnBubble* this) {
    ColliderBody* body = &this->colliderSphere.list->body;

    body->toucher.flags = 0x8;
    body->toucher.effect = 0;
    body->toucher.damage = 4;
    body->toucherFlags = 1;
    this->actor.velocity.y = 0.0f;
    return 6;
}

// only called in an unused actionFunc
u32 func_809CBCEC(EnBubble* this) {
    EnBubble_SetDimensions(this, -1.0f);
    return 12;
}

void EnBubble_DamagePlayer(EnBubble* this, GlobalContext* globalCtx) {
    s32 damage = -this->colliderSphere.list->body.toucher.damage;

    globalCtx->damagePlayer(globalCtx, damage);
    func_8002F7A0(globalCtx, &this->actor, 6.0f, this->actor.yawTowardsLink, 6.0f);
}

s32 EnBubble_Explosion(EnBubble* this, GlobalContext* globalCtx) {
    u32 i;
    Vec3f effectAccel;
    Vec3f effectVel;
    Vec3f effectPos;

    effectAccel = sEffectAccel;
    Math_SmoothStepToF(&this->expansionWidth, 4.0f, 0.1f, 1000.0f, 0.0f);
    Math_SmoothStepToF(&this->expansionHeight, 4.0f, 0.1f, 1000.0f, 0.0f);
    Math_SmoothStepToF(&this->graphicRotSpeed, 54.0f, 0.1f, 1000.0f, 0.0f);
    Math_SmoothStepToF(&this->graphicEccentricity, 0.2f, 0.1f, 1000.0f, 0.0f);
    this->actor.shape.unk_08 = ((this->expansionHeight + 1.0f) * 16.0f);

    if (DECR(this->explosionCountdown) != 0) {
        return -1;
    }
    effectPos.x = this->actor.posRot.pos.x;
    effectPos.y = this->actor.posRot.pos.y + this->actor.shape.unk_08;
    effectPos.z = this->actor.posRot.pos.z;
    for (i = 0; i < 20; i++) {
        effectVel.x = (Rand_ZeroOne() - 0.5f) * 7.0f;
        effectVel.y = Rand_ZeroOne() * 7.0f;
        effectVel.z = (Rand_ZeroOne() - 0.5f) * 7.0f;
        EffectSsDtBubble_SpawnCustomColor(globalCtx, &effectPos, &effectVel, &effectAccel, &sEffectPrimColor,
                                          &sEffectEnvColor, Rand_S16Offset(100, 50), 0x19, 0);
    }
    Item_DropCollectibleRandom(globalCtx, NULL, &this->actor.posRot.pos, 0x50);
    this->actor.flags &= ~0x1;
    return Rand_S16Offset(90, 60);
}

// only called in an unused actionFunc
u32 func_809CBFD4(EnBubble* this) {
    if (DECR(this->explosionCountdown) != 0) {
        return -1;
    }
    return func_809CBCEC(this);
}

// only called in an unused actionFunc
u32 func_809CC020(EnBubble* this) {
    this->expansionWidth += 0.083333336f;
    this->expansionHeight += 0.083333336f;

    if (DECR(this->explosionCountdown) != 0) {
        return 0;
    }
    return 1;
}

void EnBubble_Vec3fNormalizedRelfect(Vec3f* vec1, Vec3f* vec2, Vec3f* ret) {
    f32 norm;

    Math3D_Vec3fReflect(vec1, vec2, ret);
    norm = sqrtf((ret->x * ret->x) + (ret->y * ret->y) + (ret->z * ret->z));
    if (norm != 0.0f) {
        ret->x /= norm;
        ret->y /= norm;
        ret->z /= norm;
    } else {
        ret->x = ret->y = ret->z = 0.0f;
    }
}

void EnBubble_Vec3fNormalize(Vec3f* vec) {
    f32 norm;

    norm = sqrt((vec->x * vec->x) + (vec->y * vec->y) + (vec->z * vec->z));
    if (norm != 0.0f) {
        vec->x /= norm;
        vec->y /= norm;
        vec->z /= norm;
    } else {
        vec->x = vec->y = vec->z = 0.0f;
    }
}

void EnBubble_Fly(EnBubble* this, GlobalContext* globalCtx) {
    CollisionPoly* sp94;
    Actor* bumpActor;
    Vec3f sp84;
    Vec3f sp78;
    Vec3f sp6C;
    Vec3f sp60;
    Vec3f sp54;
    f32 bounceSpeed;
    s32 bgId;
    u8 bounceCount;

    if (this->colliderSphere.list[1].body.bumperFlags & 0x2) {
        bumpActor = this->colliderSphere.base.ac;
        this->normalizedBumpVelocity = bumpActor->velocity;
        EnBubble_Vec3fNormalize(&this->normalizedBumpVelocity);
        this->velocityFromBump.x += (this->normalizedBumpVelocity.x * 3.0f);
        this->velocityFromBump.y += (this->normalizedBumpVelocity.y * 3.0f);
        this->velocityFromBump.z += (this->normalizedBumpVelocity.z * 3.0f);
    }
    this->sinkSpeed -= 0.1f;
    if (this->sinkSpeed < this->actor.minVelocityY) {
        this->sinkSpeed = this->actor.minVelocityY;
    }
    sp54.x = this->velocityFromBounce.x + this->velocityFromBump.x;
    sp54.y = this->velocityFromBounce.y + this->velocityFromBump.y + this->sinkSpeed;
    sp54.z = this->velocityFromBounce.z + this->velocityFromBump.z;
    EnBubble_Vec3fNormalize(&sp54);

    sp78.x = this->actor.posRot.pos.x;
    sp78.y = this->actor.posRot.pos.y + this->actor.shape.unk_08;
    sp78.z = this->actor.posRot.pos.z;
    sp6C = sp78;

    sp6C.x += (sp54.x * 24.0f);
    sp6C.y += (sp54.y * 24.0f);
    sp6C.z += (sp54.z * 24.0f);
    if (BgCheck_EntityLineTest1(&globalCtx->colCtx, &sp78, &sp6C, &sp84, &sp94, 1, 1, 1, 0, &bgId) != 0) {
        sp60.x = COLPOLY_GET_NORMAL(sp94->normal.x);
        sp60.y = COLPOLY_GET_NORMAL(sp94->normal.y);
        sp60.z = COLPOLY_GET_NORMAL(sp94->normal.z);
        EnBubble_Vec3fNormalizedRelfect(&sp54, &sp60, &sp54);
        this->bounceDirection = sp54;
        bounceCount = this->bounceCount;
        this->bounceCount = ++bounceCount;
        if (bounceCount > (s16)(Rand_ZeroOne() * 10.0f)) {
            this->bounceCount = 0;
        }
        bounceSpeed = (this->bounceCount == 0) ? 3.6000001f : 3.0f;
        this->velocityFromBump.x = this->velocityFromBump.y = this->velocityFromBump.z = 0.0f;
        this->velocityFromBounce.x = (this->bounceDirection.x * bounceSpeed);
        this->velocityFromBounce.y = (this->bounceDirection.y * bounceSpeed);
        this->velocityFromBounce.z = (this->bounceDirection.z * bounceSpeed);
        this->sinkSpeed = 0.0f;
        Audio_PlayActorSound2(&this->actor, NA_SE_EN_AWA_BOUND);
        this->graphicRotSpeed = 128.0f;
        this->graphicEccentricity = 0.48f;
    } else if (this->actor.bgCheckFlags & 0x20 && sp54.y < 0.0f) {
        sp60.x = sp60.z = 0.0f;
        sp60.y = 1.0f;
        EnBubble_Vec3fNormalizedRelfect(&sp54, &sp60, &sp54);
        this->bounceDirection = sp54;
        bounceCount = this->bounceCount;
        this->bounceCount = ++bounceCount;
        if (bounceCount > (s16)(Rand_ZeroOne() * 10.0f)) {
            this->bounceCount = 0;
        }
        bounceSpeed = (this->bounceCount == 0) ? 3.6000001f : 3.0f;
        this->velocityFromBump.x = this->velocityFromBump.y = this->velocityFromBump.z = 0.0f;
        this->velocityFromBounce.x = (this->bounceDirection.x * bounceSpeed);
        this->velocityFromBounce.y = (this->bounceDirection.y * bounceSpeed);
        this->velocityFromBounce.z = (this->bounceDirection.z * bounceSpeed);
        this->sinkSpeed = 0.0f;
        Audio_PlayActorSound2(&this->actor, NA_SE_EN_AWA_BOUND);
        this->graphicRotSpeed = 128.0f;
        this->graphicEccentricity = 0.48f;
    }
    this->actor.velocity.x = this->velocityFromBounce.x + this->velocityFromBump.x;
    this->actor.velocity.y = this->velocityFromBounce.y + this->velocityFromBump.y + this->sinkSpeed;
    this->actor.velocity.z = this->velocityFromBounce.z + this->velocityFromBump.z;
    Math_ApproachF(&this->velocityFromBump.x, 0.0f, 0.3f, 0.1f);
    Math_ApproachF(&this->velocityFromBump.y, 0.0f, 0.3f, 0.1f);
    Math_ApproachF(&this->velocityFromBump.z, 0.0f, 0.3f, 0.1f);
}

u32 func_809CC648(EnBubble* this) {
    if (((this->colliderSphere.base.acFlags & 0x2) != 0) == false) {
        return false;
    }
    this->colliderSphere.base.acFlags &= ~0x2;
    if (this->colliderSphere.list[1].body.bumperFlags & 0x2) {
        this->unk_1F0.x = this->colliderSphere.base.ac->velocity.x / 10.0f;
        this->unk_1F0.y = this->colliderSphere.base.ac->velocity.y / 10.0f;
        this->unk_1F0.z = this->colliderSphere.base.ac->velocity.z / 10.0f;
        this->graphicRotSpeed = 128.0f;
        this->graphicEccentricity = 0.48f;
        return false;
    }
    this->unk_208 = 8;
    return true;
}

u32 EnBubble_DetectPop(EnBubble* this, GlobalContext* globalCtx) {
    if (DECR(this->unk_208) != 0 || this->actionFunc == EnBubble_Pop) {
        return false;
    }
    if (this->colliderSphere.base.maskB & 0x1) {
        this->colliderSphere.base.maskB &= ~0x1;
        EnBubble_DamagePlayer(this, globalCtx);
        this->unk_208 = 8;
        return true;
    }
    return func_809CC648(this);
}

void func_809CC774(EnBubble* this) {
    ColliderJntSphItemDim* dim;
    Vec3f src;
    Vec3f dest;

    dim = &this->colliderSphere.list[0].dim;
    src.x = dim->modelSphere.center.x;
    src.y = dim->modelSphere.center.y;
    src.z = dim->modelSphere.center.z;

    Matrix_MultVec3f(&src, &dest);
    dim->worldSphere.center.x = dest.x;
    dim->worldSphere.center.y = dest.y;
    dim->worldSphere.center.z = dest.z;
    dim->worldSphere.radius = dim->modelSphere.radius * (1.0f + this->expansionWidth);
    this->colliderSphere.list[1].dim = *dim;
}

void EnBubble_Init(Actor* thisx, GlobalContext* globalCtx) {
    EnBubble* this = THIS;
    u32 pad;

    ActorShape_Init(&this->actor.shape, 16.0f, ActorShadow_DrawFunc_Circle, 0.2f);
    Collider_InitJntSph(globalCtx, &this->colliderSphere);
    Collider_SetJntSph(globalCtx, &this->colliderSphere, &this->actor, &sJntSphInit, this->colliderSphereItems);
    func_80061EFC(&this->actor.colChkInfo, DamageTable_Get(9), &sColChkInfoInit2);
    this->actor.naviEnemyId = 0x16;
    this->bounceDirection.x = Rand_ZeroOne();
    this->bounceDirection.y = Rand_ZeroOne();
    this->bounceDirection.z = Rand_ZeroOne();
    EnBubble_Vec3fNormalize(&this->bounceDirection);
    this->velocityFromBounce.x = this->bounceDirection.x * 3.0f;
    this->velocityFromBounce.y = this->bounceDirection.y * 3.0f;
    this->velocityFromBounce.z = this->bounceDirection.z * 3.0f;
    EnBubble_SetDimensions(this, 0.0f);
    this->actionFunc = EnBubble_Wait;
}

void EnBubble_Destroy(Actor* thisx, GlobalContext* globalCtx) {
    EnBubble* this = THIS;

    Collider_DestroyJntSph(globalCtx, &this->colliderSphere);
}

void EnBubble_Wait(EnBubble* this, GlobalContext* globalCtx) {
    if (EnBubble_DetectPop(this, globalCtx)) {
        this->explosionCountdown = func_809CBCBC(this);
        this->actionFunc = EnBubble_Pop;
    } else {
        EnBubble_Fly(this, globalCtx);
        this->actor.shape.unk_08 = ((this->expansionHeight + 1.0f) * 16.0f);
        CollisionCheck_SetAC(globalCtx, &globalCtx->colChkCtx, &this->colliderSphere.base);
        CollisionCheck_SetOC(globalCtx, &globalCtx->colChkCtx, &this->colliderSphere.base);
    }
}

void EnBubble_Pop(EnBubble* this, GlobalContext* globalCtx) {
    if (EnBubble_Explosion(this, globalCtx) >= 0) {
        Audio_PlaySoundAtPosition(globalCtx, &this->actor.posRot.pos, 60, NA_SE_EN_AWA_BREAK);
        Actor_Kill(&this->actor);
    }
}

// unused
void EnBubble_Disappear(EnBubble* this, GlobalContext* globalCtx) {
    s32 temp_v0;

    temp_v0 = func_809CBFD4(this);
    if (temp_v0 >= 0) {
        this->actor.shape.shadowDrawFunc = ActorShadow_DrawFunc_Circle;
        this->explosionCountdown = temp_v0;
        this->actionFunc = EnBubble_Regrow;
    }
}

// unused
void EnBubble_Regrow(EnBubble* this, GlobalContext* globalCtx) {
    if (func_809CC020(this) != 0) {
        this->actionFunc = EnBubble_Wait;
    }
    CollisionCheck_SetAC(globalCtx, &globalCtx->colChkCtx, &this->colliderSphere.base);
    CollisionCheck_SetOC(globalCtx, &globalCtx->colChkCtx, &this->colliderSphere.base);
}

void EnBubble_Update(Actor* thisx, GlobalContext* globalCtx) {
    EnBubble* this = THIS;

    func_8002D7EC(&this->actor);
    func_8002E4B4(globalCtx, &this->actor, 16.0f, 16.0f, 0.0f, 7);
    this->actionFunc(this, globalCtx);
    Actor_SetHeight(&this->actor, this->actor.shape.unk_08);
}

void EnBubble_Draw(Actor* thisx, GlobalContext* globalCtx) {
    EnBubble* this = THIS;
    u32 pad;

    OPEN_DISPS(globalCtx->state.gfxCtx, "../z_en_bubble.c", 1175);

    if (this->actionFunc != EnBubble_Disappear) {
        func_80093D84(globalCtx->state.gfxCtx);
        Math_SmoothStepToF(&this->graphicRotSpeed, 16.0f, 0.2f, 1000.0f, 0.0f);
        Math_SmoothStepToF(&this->graphicEccentricity, 0.08f, 0.2f, 1000.0f, 0.0f);
        func_800D1FD4(&globalCtx->mf_11DA0);

        Matrix_Scale(this->expansionWidth + 1.0f, this->expansionHeight + 1.0f, 1.0f, MTXMODE_APPLY);
        Matrix_RotateZ(((f32)globalCtx->state.frames * 0.017453292f) * this->graphicRotSpeed, MTXMODE_APPLY);
        Matrix_Scale(this->graphicEccentricity + 1.0f, 1.0f, 1.0f, MTXMODE_APPLY);
        Matrix_RotateZ((-(f32)globalCtx->state.frames * 0.017453292f) * this->graphicRotSpeed, MTXMODE_APPLY);

        gSPMatrix(POLY_XLU_DISP++, Matrix_NewMtx(globalCtx->state.gfxCtx, "../z_en_bubble.c", 1220),
                  G_MTX_NOPUSH | G_MTX_LOAD | G_MTX_MODELVIEW);
        gSPDisplayList(POLY_XLU_DISP++, D_06001000);
    }

    CLOSE_DISPS(globalCtx->state.gfxCtx, "../z_en_bubble.c", 1226);

    if (this->actionFunc != EnBubble_Disappear) {
        this->actor.shape.unk_10 = (f32)((this->expansionWidth + 1.0f) * 0.2f);
        func_809CC774(this);
    }
}
