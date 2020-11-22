#include "z_bg_spot18_basket.h"
#include "vt.h"

#define FLAGS 0x00000010

#define THIS ((BgSpot18Basket*)thisx)

void BgSpot18Basket_Init(Actor* thisx, GlobalContext* globalCtx);
void BgSpot18Basket_Destroy(Actor* thisx, GlobalContext* globalCtx);
void BgSpot18Basket_Update(Actor* thisx, GlobalContext* globalCtx);
void BgSpot18Basket_Draw(Actor* thisx, GlobalContext* globalCtx);

void func_808B7BCC(BgSpot18Basket* this, GlobalContext* globalCtx);
void func_808B7AEC(BgSpot18Basket* this);
void func_808B7B58(BgSpot18Basket* this);
void func_808B7BB0(BgSpot18Basket* this);
void func_808B7D38(BgSpot18Basket* this);
void func_808B7F74(BgSpot18Basket* this);
void func_808B818C(BgSpot18Basket* this);
void func_808B7AFC(BgSpot18Basket* this, GlobalContext* globalCtx);
void func_808B7B6C(BgSpot18Basket* this, GlobalContext* globalCtx);
void func_808B7D50(BgSpot18Basket* this, GlobalContext* globalCtx);
void func_808B7FC0(BgSpot18Basket* this, GlobalContext* globalCtx);
void func_808B81A0(BgSpot18Basket* this, GlobalContext* globalCtx);

extern UNK_TYPE D_06002154;
extern Gfx D_060018B0[];

const ActorInit Bg_Spot18_Basket_InitVars = {
    ACTOR_BG_SPOT18_BASKET,
    ACTORTYPE_PROP,
    FLAGS,
    OBJECT_SPOT18_OBJ,
    sizeof(BgSpot18Basket),
    (ActorFunc)BgSpot18Basket_Init,
    (ActorFunc)BgSpot18Basket_Destroy,
    (ActorFunc)BgSpot18Basket_Update,
    (ActorFunc)BgSpot18Basket_Draw,
};

static ColliderJntSphItemInit sJntSphItemsInit[2] = {
    {
        { 0x00, { 0x00000000, 0x00, 0x00 }, { 0x00000000, 0x00, 0x00 }, 0x00, 0x00, 0x01 },
        { 0, { { 0, 2040, 0 }, 54 }, 100 },
    },
    {
        { 0x00, { 0x00000000, 0x00, 0x00 }, { 0x00000008, 0x00, 0x00 }, 0x00, 0x01, 0x00 },
        { 1, { { 0, 1400, 0 }, 13 }, 100 },
    },
};

static ColliderJntSphInit sJntSphInit = {
    { COLTYPE_UNK10, 0x00, 0x09, 0x09, 0x20, COLSHAPE_JNTSPH },
    2,
    sJntSphItemsInit,
};

static s16 D_808B85C8[] = { 0x8000, 0x2AAA, 0xD555, 0x0000 };

void func_808B7710(Actor* thisx, GlobalContext* globalCtx) {
    BgSpot18Basket* this = THIS;

    Collider_InitJntSph(globalCtx, &this->colliderJntSph);
    Collider_SetJntSph(globalCtx, &this->colliderJntSph, &this->dyna.actor, &sJntSphInit, &this->colliderJntSphItems);
    this->dyna.actor.colChkInfo.mass = 0xFF;
}

void func_808B7770(BgSpot18Basket* this, GlobalContext* globalCtx, f32 arg2) {
    static s16 D_808B85D0 = 0;
    Vec3f acceleration;
    Vec3f velocity;
    Vec3f position;
    f32 cosValue;
    s32 i;
    f32 randomValue;
    f32 sinValue;
    s32 count;

    for (i = 0, count = 2; i != count; i++) {
        if (globalCtx) {}
        if (!(arg2 < Math_Rand_ZeroOne())) {
            D_808B85D0 += 0x7530;

            sinValue = Math_Sins(D_808B85D0);
            cosValue = Math_Coss(D_808B85D0);

            randomValue = (Math_Rand_ZeroOne() * 35.0f) + 35.0f;

            position.x = (randomValue * sinValue) + this->dyna.actor.posRot.pos.x;
            position.y = this->dyna.actor.posRot.pos.y + 10.0f;
            position.z = (randomValue * cosValue) + this->dyna.actor.posRot.pos.z;

            velocity.x = sinValue;
            velocity.y = 0.0f;
            velocity.z = cosValue;

            acceleration.x = 0.0f;
            acceleration.y = 0.5f;
            acceleration.z = 0.0f;

            func_800286CC(globalCtx, &position, &velocity, &acceleration, ((Math_Rand_ZeroOne() * 16) + 80),
                          ((Math_Rand_ZeroOne() * 30) + 80));
        }
    }
}

static InitChainEntry sInitChain[] = {
    ICHAIN_VEC3F_DIV1000(scale, 100, ICHAIN_CONTINUE),
    ICHAIN_F32(uncullZoneForward, 1000, ICHAIN_CONTINUE),
    ICHAIN_F32(uncullZoneScale, 500, ICHAIN_CONTINUE),
    ICHAIN_F32(uncullZoneDownward, 1000, ICHAIN_STOP),
};

void BgSpot18Basket_Init(Actor* thisx, GlobalContext* globalCtx) {
    BgSpot18Basket* this = THIS;
    Actor* actor = &this->dyna.actor;
    ColHeader* colHeader = NULL;

    DynaPolyInfo_SetActorMove(&this->dyna, DPM_UNK3);
    func_808B7710(this, globalCtx);
    DynaPolyInfo_Alloc(&D_06002154, &colHeader);

    this->dyna.dynaPolyId = DynaPolyInfo_RegisterActor(globalCtx, &globalCtx->colCtx.dyna, actor, colHeader);

    Actor_ProcessInitChain(actor, sInitChain);
    ActorShape_Init(&actor->shape, 0.0f, ActorShadow_DrawFunc_Circle, 15.0f);
    actor->initPosRot.pos.y += 0.01f;
    actor->posRot.pos.y = actor->initPosRot.pos.y;

    if (Flags_GetSwitch(globalCtx, (actor->params >> 8) & 0x3F)) {
        func_808B7BB0(this);
        return;
    }

    func_808B7AEC(this);
    Actor_SpawnAsChild(&globalCtx->actorCtx, actor, globalCtx, ACTOR_BG_SPOT18_FUTA, actor->posRot.pos.x,
                       actor->posRot.pos.y, actor->posRot.pos.z, actor->shape.rot.x, actor->shape.rot.y + 0x1555,
                       actor->shape.rot.z, -1);

    if (actor->child == NULL) {
        osSyncPrintf(VT_FGCOL(RED));
        osSyncPrintf("Ｅｒｒｏｒ : 変化壷蓋発生失敗(%s %d)\n", "../z_bg_spot18_basket.c", 351);
        osSyncPrintf(VT_RST);
        Actor_Kill(actor);
    }
}

void BgSpot18Basket_Destroy(Actor* thisx, GlobalContext* globalCtx) {
    BgSpot18Basket* this = THIS;

    DynaPolyInfo_Free(globalCtx, &globalCtx->colCtx.dyna, this->dyna.dynaPolyId);
    Collider_DestroyJntSph(globalCtx, &this->colliderJntSph);
}

void func_808B7AEC(BgSpot18Basket* this) {
    this->actionFunc = func_808B7AFC;
}

void func_808B7AFC(BgSpot18Basket* this, GlobalContext* globalCtx) {
    if (Flags_GetSwitch(globalCtx, (this->dyna.actor.params >> 8) & 0x3F)) {
        func_800800F8(globalCtx, 4220, 80, this, 0);
        func_808B7B58(this);
    }
}

void func_808B7B58(BgSpot18Basket* this) {
    this->actionFunc = func_808B7B6C;
    this->unk_216 = 0;
}

void func_808B7B6C(BgSpot18Basket* this, GlobalContext* globalCtx) {
    if (this->unk_216 > 20) {
        func_808B7BB0(this);
        this->dyna.actor.child->parent = NULL;
        this->dyna.actor.child = NULL;
    }
}

void func_808B7BB0(BgSpot18Basket* this) {
    this->actionFunc = func_808B7BCC;
    this->unk_210 = this->unk_20C = 0;
}

void func_808B7BCC(BgSpot18Basket* this, GlobalContext* globalCtx) {
    f32 positionDiff;
    Actor* colliderBaseAc;

    Math_ApproxS(&this->unk_210, 0x1F4, 0x1E);

    this->dyna.actor.shape.rot.y += this->unk_210;

    Math_ApproxF(&this->unk_208, 50.0f, 1.5f);
    Math_ApproxS(&this->unk_20C, 400, 15);

    this->unk_20E += this->unk_20C;

    this->dyna.actor.posRot.pos.x = (Math_Sins(this->unk_20E) * this->unk_208) + this->dyna.actor.initPosRot.pos.x;
    this->dyna.actor.posRot.pos.z = (Math_Coss(this->unk_20E) * this->unk_208) + this->dyna.actor.initPosRot.pos.z;

    if (this->colliderJntSph.base.acFlags & 2) {
        colliderBaseAc = this->colliderJntSph.base.ac;

        if (colliderBaseAc != NULL) {
            positionDiff = colliderBaseAc->posRot.pos.y - this->dyna.actor.posRot.pos.y;

            if (positionDiff > 120.0f && positionDiff < 200.0f) {
                if (Math3D_Dist2DSq(colliderBaseAc->posRot.pos.z, this->colliderJntSph.base.ac->posRot.pos.x,
                                    this->dyna.actor.posRot.pos.z, this->dyna.actor.posRot.pos.x) < SQ(32.0f)) {
                    func_800800F8(globalCtx, 4210, 240, this, 0);
                    func_808B7D38(this);
                    func_8003EBF8(globalCtx, &globalCtx->colCtx.dyna, this->dyna.dynaPolyId);
                }
            }
        }
    }
    func_8002F974(this, NA_SE_EV_ELEVATOR_MOVE - SFX_FLAG);
}

void func_808B7D38(BgSpot18Basket* this) {
    this->actionFunc = func_808B7D50;
    this->unk_216 = 0;
    this->unk_214 = 0;
}

void func_808B7D50(BgSpot18Basket* this, GlobalContext* globalCtx) {
    f32 tempValue2;
    f32 tempValue;

    if (this->unk_216 > 120) {
        Math_ApproxS(&this->unk_210, 0x3E8, 0x32);
    } else {
        Math_ApproxS(&this->unk_210, 0xBB8, 0x64);
    }

    this->dyna.actor.shape.rot.y = this->dyna.actor.shape.rot.y + this->unk_210;

    if (this->unk_216 < 70) {
        Math_ApproxF(&this->unk_208, 100.0f, 2.0f);
    } else {
        Math_ApproxF(&this->unk_208, 0.0f, 2.0f);
    }

    Math_ApproxS(&this->unk_20C, 1000, 20);

    this->unk_20E += this->unk_20C;

    this->dyna.actor.posRot.pos.x = (Math_Sins(this->unk_20E) * this->unk_208) + this->dyna.actor.initPosRot.pos.x;
    this->dyna.actor.posRot.pos.z = (Math_Coss(this->unk_20E) * this->unk_208) + this->dyna.actor.initPosRot.pos.z;

    this->unk_212 += 0xBB8;

    Math_ApproxS(&this->unk_214, 0x5DC, 0x1E);

    this->dyna.actor.shape.rot.x = Math_Coss(this->unk_212) * this->unk_214;
    this->dyna.actor.shape.rot.z = -Math_Sins(this->unk_212) * this->unk_214;

    if (this->unk_216 > 140) {
        func_808B7F74(this);
    }

    if (this->unk_216 < 80) {
        func_808B7770(this, globalCtx, 1.0f);
    } else {
        func_808B7770(this, globalCtx, 0.8f);
    }

    tempValue2 = (this->unk_210 - 500) * 0.0006f;

    tempValue = CLAMP(tempValue2, 0.0f, 1.5f);

    func_800F436C(&this->dyna.actor.projectedPos, NA_SE_EV_WALL_MOVE_SP - SFX_FLAG, tempValue);
}

void func_808B7F74(BgSpot18Basket* this) {
    s16 shapeRotY;

    shapeRotY = this->dyna.actor.shape.rot.y;
    this->actionFunc = func_808B7FC0;

    if ((shapeRotY < -0x2E93) || (shapeRotY >= 0x7C19)) {
        this->unk_218 = 2;
    } else if (shapeRotY < 0x26C2) {
        this->unk_218 = 1;
    } else {
        this->unk_218 = 0;
    }

    this->unk_216 = 0;
}

void func_808B7FC0(BgSpot18Basket* this, GlobalContext* globalCtx) {
    s32 pad;
    s32 tempUnk214;
    f32 tempUnk210;
    s16 arrayValue;
    f32 clampedTempUnk210;

    this->unk_212 += 0xBB8;

    if (this->unk_216 >= 13) {
        tempUnk214 = Math_ApproxS(&this->unk_214, 0, 55);
    } else {
        tempUnk214 = 0;
    }

    this->dyna.actor.shape.rot.x = Math_Coss(this->unk_212) * this->unk_214;
    this->dyna.actor.shape.rot.z = -Math_Sins(this->unk_212) * this->unk_214;

    Math_ApproxS(&this->unk_210, 0x1F4, 0xA);
    this->dyna.actor.shape.rot.y += this->unk_210;

    if (tempUnk214 != 0) {
        arrayValue = D_808B85C8[this->unk_218];

        if ((s16)(this->dyna.actor.shape.rot.y - arrayValue) >= 0) {
            this->dyna.actor.shape.rot.y = arrayValue;

            func_808B818C(this);
            func_8003EC50(globalCtx, &globalCtx->colCtx.dyna, this->dyna.dynaPolyId);
        }
    }

    if (this->unk_216 < 30) {
        func_808B7770(this, globalCtx, 0.5f);
    } else {
        func_808B7770(this, globalCtx, 0.3f);
    }

    tempUnk210 = (this->unk_210 - 500) * 0.0006f;

    clampedTempUnk210 = CLAMP(tempUnk210, 0.0f, 1.5f);

    func_800F436C(&this->dyna.actor.projectedPos, NA_SE_EV_WALL_MOVE_SP - SFX_FLAG, clampedTempUnk210);
}

void func_808B818C(BgSpot18Basket* this) {
    this->actionFunc = func_808B81A0;
    this->unk_216 = 0;
}

static s16 D_808B85E4[] = { -0x0FA0, 0x0320, 0x0FA0 };

void func_808B81A0(BgSpot18Basket* this, GlobalContext* globalCtx) {
    s32 i;
    Actor* actor = &this->dyna.actor;
    Vec3f tempVector;
    EnItem00* collectible;

    if (this->unk_216 == 1) {
        tempVector.x = actor->posRot.pos.x;
        tempVector.y = actor->posRot.pos.y + 170.0f;
        tempVector.z = actor->posRot.pos.z;

        if (this->unk_218 == 0) {
            for (i = 0; i < ARRAY_COUNT(D_808B85E4); i++) {
                collectible = Item_DropCollectible(globalCtx, &tempVector, ITEM00_BOMBS_A);
                if (collectible != NULL) {
                    collectible->actor.velocity.y = 11.0f;
                    collectible->actor.posRot.rot.y = D_808B85E4[i];
                }
            }
        } else if (this->unk_218 == 1) {
            for (i = 0; i < ARRAY_COUNT(D_808B85E4); i++) {
                collectible = Item_DropCollectible(globalCtx, &tempVector, ITEM00_RUPEE_GREEN);
                if (collectible != NULL) {
                    collectible->actor.velocity.y = 11.0f;
                    collectible->actor.posRot.rot.y = D_808B85E4[i];
                }
            }
        } else if (this->unk_218 == 2) {
            if ((this->unk_21A != 0) || Flags_GetCollectible(globalCtx, (actor->params & 0x3F))) {
                collectible = Item_DropCollectible(globalCtx, &tempVector, ITEM00_RUPEE_PURPLE);
                if (collectible != NULL) {
                    collectible->actor.velocity.y = 11.0f;
                    collectible->actor.posRot.rot.y = D_808B85E4[1];
                }
            } else {
                collectible =
                    Item_DropCollectible(globalCtx, &tempVector, ((actor->params & 0x3F) << 8) | ITEM00_HEART_PIECE);
                if (collectible != NULL) {
                    collectible->actor.velocity.y = 11.0f;
                    collectible->actor.posRot.rot.y = D_808B85E4[1];
                    this->unk_21A = 1;
                }
            }

            collectible = Item_DropCollectible(globalCtx, &tempVector, ITEM00_RUPEE_RED);
            if (collectible != NULL) {
                collectible->actor.velocity.y = 11.0f;
                collectible->actor.posRot.rot.y = D_808B85E4[0];
            }

            collectible = Item_DropCollectible(globalCtx, &tempVector, ITEM00_RUPEE_BLUE);
            if (collectible != NULL) {
                collectible->actor.velocity.y = 11.0f;
                collectible->actor.posRot.rot.y = D_808B85E4[2];
            }
        }
    } else if (this->unk_216 == 2) {
        if (this->unk_218 == 2) {
            func_80078884(NA_SE_SY_CORRECT_CHIME);
        } else {
            func_80078884(NA_SE_SY_TRE_BOX_APPEAR);
        }
    } else if (this->unk_216 == 200) {
        func_808B7BB0(this);
    }
}

void BgSpot18Basket_Update(Actor* thisx, GlobalContext* globalCtx) {
    BgSpot18Basket* this = THIS;
    Vec3s temp;

    this->unk_216++;
    this->actionFunc(this, globalCtx);
    this->dyna.actor.groundY = func_8003C9A4(&globalCtx->colCtx, &this->dyna.actor.floorPoly, &temp, &this->dyna.actor,
                                             &this->dyna.actor.posRot);
    if (this->actionFunc != func_808B7AFC) {
        CollisionCheck_SetOC(globalCtx, &globalCtx->colChkCtx, &this->colliderJntSph);
        if (this->actionFunc != func_808B7B6C) {
            this->colliderJntSph.base.acFlags &= ~2;
            CollisionCheck_SetAC(globalCtx, &globalCtx->colChkCtx, &this->colliderJntSph);
        }
    }
}

void BgSpot18Basket_Draw(Actor* thisx, GlobalContext* globalCtx) {
    BgSpot18Basket* this = THIS;

    func_800628A4(0, &this->colliderJntSph);
    func_800628A4(1, &this->colliderJntSph);
    Gfx_DrawDListOpa(globalCtx, D_060018B0);
}
