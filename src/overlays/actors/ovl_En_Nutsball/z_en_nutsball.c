/*
 * File: z_en_nutsball.c
 * Overlay: ovl_En_Nutsball
 * Description: The projectile fired by deku scrubs and octoroks.
 */

#include "z_en_nutsball.h"

#define ROOM 0x00
#define FLAGS 0x00000010

static void EnNutsball_Init(EnNutsball* this, GlobalContext* globalCtx);
static void EnNutsball_Destroy(EnNutsball* this, GlobalContext* globalCtx);
static void EnNutsball_Update(EnNutsball* this, GlobalContext* globalCtx);
static void func_80ABBB34(EnNutsball* this, GlobalContext* globalCtx);
static void func_80ABBBA8(EnNutsball* this, GlobalContext* globalCtx);
static void EnNutsball_Draw(EnNutsball* this, GlobalContext* globalCtx);

const ActorInit En_Nutsball_InitVars = {
    ACTOR_EN_NUTSBALL,
    ACTORTYPE_PROP,
    ROOM,
    FLAGS,
    OBJECT_GAMEPLAY_KEEP,
    sizeof(EnNutsball),
    (ActorFunc)EnNutsball_Init,
    (ActorFunc)EnNutsball_Destroy,
    (ActorFunc)EnNutsball_Update,
    (ActorFunc)NULL,
};

static ColliderCylinderInit cylinderInitData = {
    0x0A, 0x11,       0x09, 0x39, 0x20,   0x01,   0x00,       0x00,   0x00,   0x00,   0x00,
    0x00, 0xFFCFFFFF, 0x00, 0x08, 0x00,   0x00,   0xFFCFFFFF, 0x00,   0x00,   0x00,   0x00,
    0x11, 0x01,       0x01, 0x00, 0x000D, 0x000D, 0x0000,     0x0000, 0x0000, 0x0000,
};

static s16 objectTbl[] = { OBJECT_DEKUNUTS, OBJECT_HINTNUTS, OBJECT_SHOPNUTS, OBJECT_DNS, OBJECT_DNK };
static u32 dListTbl[] = { 0x06002028, 0x060012F0, 0x06004008, 0x06002410, 0x06001890 };

static void EnNutsball_Init(EnNutsball* this, GlobalContext* globalCtx) {
    s32 pad[2];

    ActorShape_Init(&this->actor.shape, 400.0f, ActorShadow_DrawFunc_Circle, 13.0f);
    ActorCollider_AllocCylinder(globalCtx, &this->collider);
    ActorCollider_InitCylinder(globalCtx, &this->collider, &this->actor, &cylinderInitData);
    this->objBankIndex = Object_GetIndex(&globalCtx->objectCtx, objectTbl[this->actor.params]);

    if (this->objBankIndex < 0) {
        Actor_Kill(&this->actor);
    } else {
        this->actionFunc = (ActorFunc)func_80ABBB34;
    }
}

static void EnNutsball_Destroy(EnNutsball* this, GlobalContext* globalCtx) {
    ColliderCylinderMain* collider = &this->collider;
    ActorCollider_FreeCylinder(globalCtx, collider);
}

static void func_80ABBB34(EnNutsball* this, GlobalContext* globalCtx) {
    if (Object_IsLoaded(&globalCtx->objectCtx, this->objBankIndex)) {
        this->actor.objBankIndex = this->objBankIndex;
        this->actor.draw = (ActorFunc)EnNutsball_Draw;
        this->actor.shape.rot.y = 0;
        this->timer = 30;
        this->actionFunc = (ActorFunc)func_80ABBBA8;
        this->actor.speedXZ = 10.0f;
    }
}

static void func_80ABBBA8(EnNutsball* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;
    Vec3s sp4C;
    Vec3f sp40;

    this->timer--;

    if (this->timer == 0) {
        this->actor.gravity = -1;
    }

    this->actor.initPosRot.rot.z += 0x2AA8;

    if ((this->actor.bgCheckFlags & 8) || (this->actor.bgCheckFlags & 1) || (this->collider.base.colliderFlags & 2) ||
        (this->collider.base.collideFlags & 2) || (this->collider.base.maskA & 2)) {
        // Checking if the player is using a shield that reflects projectiles
        // And if so, reflects the projectile on impact
        if ((player->currentShield == 1) || ((player->currentShield == 2) && LINK_IS_ADULT)) {
            if ((this->collider.base.colliderFlags & 2) && (this->collider.base.colliderFlags & 0x10) &&
                (this->collider.base.colliderFlags & 4)) {
                this->collider.base.colliderFlags &= ~0x16;
                this->collider.base.colliderFlags |= 0x08;

                this->collider.body.toucher.flags = 2;
                func_800D20CC(&player->mf_A20, &sp4C, 0);
                this->actor.posRot.rot.y = sp4C.y + 0x8000;
                this->timer = 30;
                return;
            }
        }

        sp40.x = this->actor.posRot.pos.x;
        sp40.y = this->actor.posRot.pos.y + 4;
        sp40.z = this->actor.posRot.pos.z;

        func_800297A4(globalCtx, &sp40, 0x40C00000, 0, 7, 3, 15, -1, 10, 0);
        Audio_PlaySoundAtPosition(globalCtx, &this->actor.posRot.pos, 20, NA_SE_EN_OCTAROCK_ROCK);
        Actor_Kill(&this->actor);
    } else {
        if (this->timer == -300) {
            Actor_Kill(&this->actor);
        }
    }
}

static void EnNutsball_Update(EnNutsball* this, GlobalContext* globalCtx) {
    EnNutsball* nutsball = this;
    Player* player = PLAYER;
    s32 pad;

    if (!(player->stateFlags1 & 0x300000C0) || (nutsball->actionFunc == (ActorFunc)func_80ABBB34)) {
        nutsball->actionFunc(nutsball, globalCtx);

        Actor_MoveForward(&nutsball->actor);
        func_8002E4B4(globalCtx, &nutsball->actor, 10, cylinderInitData.dim.radius, cylinderInitData.dim.height, 5);
        ActorCollider_Cylinder_Update(&nutsball->actor, &nutsball->collider);

        nutsball->actor.flags |= 0x1000000;

        Actor_CollisionCheck_SetAT(globalCtx, &globalCtx->sub_11E60, &nutsball->collider);
        Actor_CollisionCheck_SetAC(globalCtx, &globalCtx->sub_11E60, &nutsball->collider);
        Actor_CollisionCheck_SetOT(globalCtx, &globalCtx->sub_11E60, &nutsball->collider);
    }
}

static void EnNutsball_Draw(EnNutsball* this, GlobalContext* globalCtx) {
    GraphicsContext* gfxCtx = globalCtx->state.gfxCtx;
    Gfx* gfxArr[5];

    func_800C6AC4(gfxArr, globalCtx->state.gfxCtx, "../z_en_nutsball.c", 327);

    func_80093D18(globalCtx->state.gfxCtx);
    Matrix_Mult(&globalCtx->mf_11DA0, MTXMODE_APPLY);
    Matrix_RotateZ(this->actor.initPosRot.rot.z * 9.58738e-05f, MTXMODE_APPLY);
    gSPMatrix(gfxCtx->polyOpa.p++, Matrix_NewMtx(globalCtx->state.gfxCtx, "../z_en_nutsball.c", 333),
              G_MTX_MODELVIEW | G_MTX_LOAD);
    gSPDisplayList(gfxCtx->polyOpa.p++, dListTbl[this->actor.params]);

    func_800C6B54(gfxArr, globalCtx->state.gfxCtx, "../z_en_nutsball.c", 337);
}
