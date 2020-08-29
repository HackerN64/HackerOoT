#include <ultra64.h>
#include <global.h>

#define FLAGS 0x00000010

#define THIS ((EnAObj*)thisx)

void EnAObj_Init(Actor* thisx, GlobalContext* globalCtx);
void EnAObj_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnAObj_Update(Actor* thisx, GlobalContext* globalCtx);
void EnAObj_Draw(Actor* thisx, GlobalContext* globalCtx);

void func_8001D204(EnAObj* this, GlobalContext* globalCtx);
void func_8001D25C(EnAObj* this, GlobalContext* globalCtx);
void func_8001D360(EnAObj* this, GlobalContext* globalCtx);
void func_8001D4A8(EnAObj* this, GlobalContext* globalCtx);
void func_8001D608(EnAObj* this, GlobalContext* globalCtx);

void func_8001D234(EnAObj* this, s16 params);
void func_8001D310(EnAObj* this, s16 params);
void func_8001D480(EnAObj* this, s16 params);
void func_8001D5C8(EnAObj* this, s16 params);

const ActorInit En_A_Obj_InitVars = {
    ACTOR_EN_A_OBJ,
    ACTORTYPE_PROP,
    FLAGS,
    OBJECT_GAMEPLAY_KEEP,
    sizeof(EnAObj),
    (ActorFunc)EnAObj_Init,
    (ActorFunc)EnAObj_Destroy,
    (ActorFunc)EnAObj_Update,
    (ActorFunc)EnAObj_Draw,
};

static ColliderCylinderInit sCylinderInit = {
    { COLTYPE_UNK10, 0x00, 0x39, 0x39, 0x20, COLSHAPE_CYLINDER },
    { 0x02, { 0x00000000, 0x00, 0x00 }, { 0xFFCFFFFF, 0x00, 0x00 }, 0x00, 0x01, 0x01 },
    { 25, 60, 0, { 0, 0, 0 } },
};

static UNK_PTR D_8011546C[] = {
    0x040394B0, 0x040394B0, 0x0403A120, 0x0403A480, 0x0403A7F0, 0x06000730,
};

static Gfx* D_80115484[] = {
    0x04039C00, 0x04039C00, 0x04039C00, 0x0403A2D0, 0x0403A2D0, 0x0403A630,
    0x06000210, 0x0403AB80, 0x0403A9B0, 0x0403C050, 0x0403C5B0, 0x0400D340,
};

void EnAObj_SetupAction(EnAObj* this, EnAObjActionFunc actionFunc) {
    this->actionFunc = actionFunc;
}

void EnAObj_Init(Actor* thisx, GlobalContext* globalCtx) {
    u32 sp34 = 0;
    s32 pad;
    EnAObj* this = THIS;
    f32 sp28;

    sp28 = 6.0f;

    this->textId = (thisx->params >> 8) & 0xFF;
    thisx->params &= 0xFF;

    switch (thisx->params) {
        case A_OBJ_BLOCK_SMALL:
            Actor_SetScale(thisx, 0.025f);
            break;
        case A_OBJ_BLOCK_LARGE:
            Actor_SetScale(thisx, 0.05f);
            break;
        case A_OBJ_BLOCK_HUGE:
        case A_OBJ_CUBE_SMALL:
        case A_OBJ_UNKNOWN_6:
            Actor_SetScale(thisx, 0.1f);
            break;
        case A_OBJ_BLOCK_SMALL_ROT:
            Actor_SetScale(thisx, 0.005f);
            break;
        case A_OBJ_BLOCK_LARGE_ROT:
        default:
            Actor_SetScale(thisx, 0.01f);
            break;
    }

    if (thisx->params >= 9) {
        sp28 = 12.0f;
    }

    ActorShape_Init(&thisx->shape, 0.0f, ActorShadow_DrawFunc_Circle, sp28);

    thisx->posRot2.pos = thisx->posRot.pos;
    this->dyna.dynaPolyId = -1;
    this->dyna.unk_160 = 0;
    this->dyna.unk_15C = 0;
    thisx->uncullZoneDownward = 1200.0f;
    thisx->uncullZoneScale = 200.0f;

    switch (thisx->params) {
        case A_OBJ_BLOCK_LARGE:
        case A_OBJ_BLOCK_HUGE:
            this->dyna.dynaPolyId = 1;
            Actor_ChangeType(globalCtx, &globalCtx->actorCtx, thisx, ACTORTYPE_BG);
            func_8001D5C8(this, thisx->params);
            break;
        case A_OBJ_BLOCK_SMALL_ROT:
        case A_OBJ_BLOCK_LARGE_ROT:
            this->dyna.dynaPolyId = 3;
            Actor_ChangeType(globalCtx, &globalCtx->actorCtx, thisx, ACTORTYPE_BG);
            func_8001D310(this, thisx->params);
            break;
        case A_OBJ_UNKNOWN_6:
            // clang-format off
            thisx->flags |= 0x1; this->dyna.dynaPolyId = 5; this->unk_178 = 10.0f;
            // clang-format on
            thisx->gravity = -2.0f;
            func_8001D234(this, thisx->params);
            break;
        case A_OBJ_GRASS_CLUMP:
        case A_OBJ_TREE_STUMP:
            this->dyna.dynaPolyId = 0;
            func_8001D234(this, thisx->params);
            break;
        case A_OBJ_SIGNPOST_OBLONG:
        case A_OBJ_SIGNPOST_ARROW:
            thisx->textId = (this->textId & 0xFF) | 0x300;
            // clang-format off
            thisx->flags |= 0x1 | 0x8; thisx->unk_4C = 500.0f;
            // clang-format on
            this->unk_178 = 45.0f;
            func_8001D234(this, thisx->params);
            Collider_InitCylinder(globalCtx, &this->collider);
            Collider_SetCylinder(globalCtx, &this->collider, thisx, &sCylinderInit);
            thisx->colChkInfo.mass = 0xFF;
            thisx->unk_1F = 0;
            break;
        case A_OBJ_KNOB:
            thisx->gravity = -1.5f;
            func_8001D480(this, thisx->params);
            break;
        default:
            thisx->gravity = -2.0f;
            func_8001D234(this, thisx->params);
            break;
    }

    if (thisx->params < 5) {
        thisx->colChkInfo.mass = 0xFF;
    }

    if (this->dyna.dynaPolyId != -1) {
        DynaPolyInfo_Alloc(D_8011546C[this->dyna.dynaPolyId], &sp34);
        this->dyna.dynaPolyId = DynaPolyInfo_RegisterActor(globalCtx, &globalCtx->colCtx.dyna, thisx, sp34);
    }
}

void EnAObj_Destroy(Actor* thisx, GlobalContext* globalCtx) {
    EnAObj* this = THIS;

    DynaPolyInfo_Free(globalCtx, &globalCtx->colCtx.dyna, this->dyna.dynaPolyId);

    switch (this->dyna.actor.params) {
        case A_OBJ_SIGNPOST_OBLONG:
        case A_OBJ_SIGNPOST_ARROW:
            Collider_DestroyCylinder(globalCtx, &this->collider);
    }
}

void func_8001D204(EnAObj* this, GlobalContext* globalCtx) {
    if (func_8002F334(&this->dyna.actor, globalCtx)) {
        func_8001D234(this, this->dyna.actor.params);
    }
}

void func_8001D234(EnAObj* this, s16 params) {
    EnAObj_SetupAction(this, func_8001D25C);
}

void func_8001D25C(EnAObj* this, GlobalContext* globalCtx) {
    s16 var;

    if (this->dyna.actor.textId != 0) {
        var = this->dyna.actor.yawTowardsLink - this->dyna.actor.shape.rot.y;
        if ((ABS(var) < 0x2800) || ((this->dyna.actor.params == 0xA) && (ABS(var) > 0x5800))) {
            if (func_8002F194(&this->dyna.actor, globalCtx)) {
                EnAObj_SetupAction(this, func_8001D204);
            } else {
                func_8002F2F4(&this->dyna.actor, globalCtx);
            }
        }
    }
}

void func_8001D310(EnAObj* this, s16 params) {
    this->unk_16E = 0;
    this->unk_168 = 10;
    this->dyna.actor.posRot.rot.y = 0;
    this->dyna.actor.shape.rot = this->dyna.actor.posRot.rot;
    EnAObj_SetupAction(this, func_8001D360);
}

void func_8001D360(EnAObj* this, GlobalContext* globalCtx) {
    if (this->unk_16E == 0) {
        if (this->dyna.unk_160 != 0) {
            this->unk_16E++;
            this->unk_170 = 20;

            if ((s16)(this->dyna.actor.yawTowardsLink + 0x4000) < 0) {
                this->unk_174 = -1000;
            } else {
                this->unk_174 = 1000;
            }

            if (this->dyna.actor.yawTowardsLink < 0) {
                this->unk_172 = -this->unk_174;
            } else {
                this->unk_172 = this->unk_174;
            }
        }
    } else {
        if (this->unk_168 != 0) {
            this->unk_168--;
        } else {
            this->dyna.actor.shape.rot.y += this->unk_172;
            this->dyna.actor.shape.rot.x += this->unk_174;
            this->unk_170--;
            this->dyna.actor.gravity = -1.0f;

            if (this->unk_170 == 0) {
                this->dyna.actor.posRot.pos = this->dyna.actor.initPosRot.pos;
                this->unk_16E = 0;
                this->unk_168 = 10;
                this->dyna.actor.velocity.y = 0.0f;
                this->dyna.actor.gravity = 0.0f;
                this->dyna.actor.shape.rot = this->dyna.actor.posRot.rot;
            }
        }
    }
}

void func_8001D480(EnAObj* this, s16 params) {
    EnAObj_SetupAction(this, func_8001D4A8);
}

void func_8001D4A8(EnAObj* this, GlobalContext* globalCtx) {
    Math_SmoothScaleMaxMinF(&this->dyna.actor.speedXZ, 1.0f, 1.0f, 0.5f, 0.0f);
    this->dyna.actor.shape.rot.x = this->dyna.actor.shape.rot.x + (this->dyna.actor.posRot.rot.x >> 1);
    this->dyna.actor.shape.rot.z = this->dyna.actor.shape.rot.z + (this->dyna.actor.posRot.rot.z >> 1);

    if ((this->dyna.actor.speedXZ != 0.0f) && (this->dyna.actor.bgCheckFlags & 0x8)) {
        if (1) { // Necessary to match
            this->dyna.actor.posRot.rot.y =
                ((this->dyna.actor.wallPolyRot - this->dyna.actor.posRot.rot.y) + this->dyna.actor.wallPolyRot) -
                0x8000;
        }
        this->dyna.actor.bgCheckFlags &= ~0x8;
    }

    if (this->dyna.actor.bgCheckFlags & 0x2) {
        if (this->dyna.actor.velocity.y < -8.0f) {
            this->dyna.actor.velocity.y *= -0.6f;
            this->dyna.actor.speedXZ *= 0.6f;
            this->dyna.actor.bgCheckFlags &= ~0x3;
        } else {
            Actor_Kill(&this->dyna.actor);
        }
    }
}

void func_8001D5C8(EnAObj* this, s16 params) {
    this->dyna.actor.uncullZoneDownward = 1200.0f;
    this->dyna.actor.uncullZoneScale = 720.0f;
    EnAObj_SetupAction(this, func_8001D608);
}

void func_8001D608(EnAObj* this, GlobalContext* globalCtx) {
    this->dyna.actor.speedXZ += this->dyna.unk_150;
    this->dyna.actor.posRot.rot.y = this->dyna.unk_158;

    this->dyna.actor.speedXZ = (this->dyna.actor.speedXZ < -2.5f)
                                   ? -2.5f
                                   : ((this->dyna.actor.speedXZ > 2.5f) ? 2.5f : this->dyna.actor.speedXZ);

    Math_SmoothScaleMaxMinF(&this->dyna.actor.speedXZ, 0.0f, 1.0f, 1.0f, 0.0f);

    if (this->dyna.actor.speedXZ != 0.0f) {
        Audio_PlayActorSound2(&this->dyna.actor, NA_SE_EV_ROCK_SLIDE - SFX_FLAG);
    }

    this->dyna.unk_154 = 0.0f;
    this->dyna.unk_150 = 0.0f;
}

void EnAObj_Update(Actor* thisx, GlobalContext* globalCtx) {
    EnAObj* this = THIS;

    this->actionFunc(this, globalCtx);
    Actor_MoveForward(&this->dyna.actor);

    if (this->dyna.actor.gravity != 0.0f) {
        if (this->dyna.actor.params != A_OBJ_KNOB) {
            func_8002E4B4(globalCtx, &this->dyna.actor, 5.0f, 40.0f, 0.0f, 0x1D);
        } else {
            func_8002E4B4(globalCtx, &this->dyna.actor, 5.0f, 20.0f, 0.0f, 0x1D);
        }
    }

    this->dyna.actor.posRot2.pos = this->dyna.actor.posRot.pos;
    this->dyna.actor.posRot2.pos.y += this->unk_178;

    switch (this->dyna.actor.params) {
        case A_OBJ_SIGNPOST_OBLONG:
        case A_OBJ_SIGNPOST_ARROW:
            Collider_CylinderUpdate(&this->dyna.actor, &this->collider);
            CollisionCheck_SetOC(globalCtx, &globalCtx->colChkCtx, &this->collider);
    }
}

void EnAObj_Draw(Actor* thisx, GlobalContext* globalCtx) {
    s32 type = thisx->params;

    OPEN_DISPS(globalCtx->state.gfxCtx, "../z_en_a_keep.c", 701);

    func_80093D18(globalCtx->state.gfxCtx);

    if (type > A_OBJ_KNOB) {
        type = A_OBJ_KNOB;
    }

    if (thisx->params == A_OBJ_KNOB) {
        gDPSetPrimColor(oGfxCtx->polyOpa.p++, 0, 1, 60, 60, 60, 50);
    }

    gSPMatrix(oGfxCtx->polyOpa.p++, Matrix_NewMtx(globalCtx->state.gfxCtx, "../z_en_a_keep.c", 712),
              G_MTX_MODELVIEW | G_MTX_LOAD);
    gSPDisplayList(oGfxCtx->polyOpa.p++, D_80115484[type]);

    CLOSE_DISPS(globalCtx->state.gfxCtx, "../z_en_a_keep.c", 715);
}
