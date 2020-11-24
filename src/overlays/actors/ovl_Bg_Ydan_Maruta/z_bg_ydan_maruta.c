/*
 * File: z_bg_ydan_maruta.c
 * Overlay: ovl_Bg_Ydan_Maruta
 * Description: Rotating spike log in Deku Tree
 */

#include "z_bg_ydan_maruta.h"

#define FLAGS 0x00000000

#define THIS ((BgYdanMaruta*)thisx)

void BgYdanMaruta_Init(Actor* thisx, GlobalContext* globalCtx);
void BgYdanMaruta_Destroy(Actor* thisx, GlobalContext* globalCtx);
void BgYdanMaruta_Update(Actor* thisx, GlobalContext* globalCtx);
void BgYdanMaruta_Draw(Actor* thisx, GlobalContext* globalCtx);

void func_808BEFF4(BgYdanMaruta* this, GlobalContext* globalCtx);
void BgYdanMaruta_DoNothing(BgYdanMaruta* this, GlobalContext* globalCtx);
void func_808BF078(BgYdanMaruta* this, GlobalContext* globalCtx);
void func_808BF108(BgYdanMaruta* this, GlobalContext* globalCtx);
void func_808BF1EC(BgYdanMaruta* this, GlobalContext* globalCtx);

const ActorInit Bg_Ydan_Maruta_InitVars = {
    ACTOR_BG_YDAN_MARUTA,
    ACTORTYPE_PROP,
    FLAGS,
    OBJECT_YDAN_OBJECTS,
    sizeof(BgYdanMaruta),
    (ActorFunc)BgYdanMaruta_Init,
    (ActorFunc)BgYdanMaruta_Destroy,
    (ActorFunc)BgYdanMaruta_Update,
    (ActorFunc)BgYdanMaruta_Draw,
};

static ColliderTrisItemInit sTrisItemInit[2] = {
    {
        { 0x00, { 0x20000000, 0x00, 0x04 }, { 0x00000004, 0x00, 0x00 }, 0x11, 0x01, 0x00 },
        { { { 220.0f, -10.0f, 0.0f }, { 220.0f, 10.0f, 0.0f }, { -220.0f, 10.0f, 0.0f } } },
    },
    {
        { 0x00, { 0x20000000, 0x00, 0x04 }, { 0x00000004, 0x00, 0x00 }, 0x11, 0x01, 0x00 },
        { { { 16.0f, 0.0f, 0.0f }, { 16.0f, 135.0f, 0.0f }, { -16.0f, 135.0f, 0.0f } } },
    },
};

static ColliderTrisInit sTrisInit = {
    { COLTYPE_UNK10, 0x11, 0x09, 0x00, 0x20, COLSHAPE_TRIS },
    2,
    sTrisItemInit,
};

static InitChainEntry sInitChain[] = {
    ICHAIN_VEC3F_DIV1000(scale, 100, ICHAIN_STOP),
};

extern UNK_TYPE D_060066A8;
extern Gfx D_06008D88[];
extern Gfx D_06006570[];

void BgYdanMaruta_Init(Actor* thisx, GlobalContext* globalCtx) {
    s32 pad;
    BgYdanMaruta* this = THIS;
    Vec3f sp4C[3];
    s32 i;
    f32 sinRotY;
    f32 cosRotY;
    s32 localConst = 0;
    ColliderTrisItemInit* items;

    Actor_ProcessInitChain(thisx, sInitChain);
    Collider_InitTris(globalCtx, &this->collider);
    Collider_SetTris(globalCtx, &this->collider, thisx, &sTrisInit, &this->colliderItems);

    this->unk_168 = thisx->params & 0xFFFF;
    thisx->params = (thisx->params >> 8) & 0xFF;

    if (thisx->params == 0) {
        items = &sTrisItemInit[0];
        this->actionFunc = func_808BEFF4;
    } else {
        items = &sTrisItemInit[1];
        DynaPolyInfo_SetActorMove(&this->dyna, 0);
        DynaPolyInfo_Alloc(&D_060066A8, &localConst);
        this->dyna.dynaPolyId = DynaPolyInfo_RegisterActor(globalCtx, &globalCtx->colCtx.dyna, thisx, localConst);
        thisx->initPosRot.pos.y += -280.0f;
        if (Flags_GetSwitch(globalCtx, this->unk_168)) {
            thisx->posRot.pos.y = thisx->initPosRot.pos.y;
            this->actionFunc = BgYdanMaruta_DoNothing;
        } else {
            this->actionFunc = func_808BF078;
        }
    }

    sinRotY = Math_Sins(thisx->shape.rot.y);
    cosRotY = Math_Coss(thisx->shape.rot.y);

    for (i = 0; i < 3; i++) {
        sp4C[i].x = (items->dim.vtx[i].x * cosRotY) + thisx->posRot.pos.x;
        sp4C[i].y = items->dim.vtx[i].y + thisx->posRot.pos.y;
        sp4C[i].z = thisx->posRot.pos.z - (items->dim.vtx[i].x * sinRotY);
    }

    func_800627A0(&this->collider, 0, &sp4C[0], &sp4C[1], &sp4C[2]);

    sp4C[1].x = (items->dim.vtx[2].x * cosRotY) + thisx->posRot.pos.x;
    sp4C[1].y = items->dim.vtx[0].y + thisx->posRot.pos.y;
    sp4C[1].z = thisx->posRot.pos.z - (items->dim.vtx[2].x * sinRotY);

    func_800627A0(&this->collider, 1, &sp4C[0], &sp4C[2], &sp4C[1]);
}

void BgYdanMaruta_Destroy(Actor* thisx, GlobalContext* globalCtx) {
    BgYdanMaruta* this = THIS;

    Collider_DestroyTris(globalCtx, &this->collider);
    if (thisx->params == 1) {
        DynaPolyInfo_Free(globalCtx, &globalCtx->colCtx.dyna, this->dyna.dynaPolyId);
    }
}

void func_808BEFF4(BgYdanMaruta* this, GlobalContext* globalCtx) {
    if (this->collider.base.atFlags & 2) {
        func_8002F71C(globalCtx, &this->dyna.actor, 7.0f, this->dyna.actor.shape.rot.y, 6.0f);
    }
    this->dyna.actor.shape.rot.x += 0x360;
    CollisionCheck_SetAT(globalCtx, &globalCtx->colChkCtx, &this->collider);
    func_8002F974(&this->dyna.actor, NA_SE_EV_TOGE_STICK_ROLLING - SFX_FLAG);
}

void func_808BF078(BgYdanMaruta* this, GlobalContext* globalCtx) {
    if (this->collider.base.acFlags & 2) {
        this->unk_16A = 20;
        Flags_SetSwitch(globalCtx, this->unk_168);
        func_80078884(NA_SE_SY_CORRECT_CHIME);
        this->actionFunc = func_808BF108;
        func_800800F8(globalCtx, 0xBC2, 0x32, &this->dyna.actor, 0);
    } else {
        CollisionCheck_SetAC(globalCtx, &globalCtx->colChkCtx, &this->collider);
    }
}

void func_808BF108(BgYdanMaruta* this, GlobalContext* globalCtx) {
    s16 temp;

    if (this->unk_16A != 0) {
        this->unk_16A--;
    }
    if (this->unk_16A == 0) {
        this->actionFunc = func_808BF1EC;
    }

    if (1) {}

    temp = (this->unk_16A % 4) - 2;
    if (temp == -2) {
        temp = 0;
    } else {
        temp *= 2;
    }

    this->dyna.actor.posRot.pos.x =
        (Math_Coss(this->dyna.actor.shape.rot.y) * temp) + this->dyna.actor.initPosRot.pos.x;
    this->dyna.actor.posRot.pos.z =
        (Math_Sins(this->dyna.actor.shape.rot.y) * temp) + this->dyna.actor.initPosRot.pos.z;

    func_8002F974(&this->dyna.actor, NA_SE_EV_TRAP_OBJ_SLIDE - SFX_FLAG);
}

void func_808BF1EC(BgYdanMaruta* this, GlobalContext* globalCtx) {
    this->dyna.actor.velocity.y += 1.0f;
    if (Math_ApproxF(&this->dyna.actor.posRot.pos.y, this->dyna.actor.initPosRot.pos.y, this->dyna.actor.velocity.y)) {
        Audio_PlayActorSound2(&this->dyna.actor, NA_SE_EV_LADDER_DOUND);
        this->actionFunc = BgYdanMaruta_DoNothing;
    }
}

void BgYdanMaruta_DoNothing(BgYdanMaruta* this, GlobalContext* globalCtx) {
}

void BgYdanMaruta_Update(Actor* thisx, GlobalContext* globalCtx) {
    BgYdanMaruta* this = THIS;

    this->actionFunc(this, globalCtx);
}

void BgYdanMaruta_Draw(Actor* thisx, GlobalContext* globalCtx) {
    if (thisx->params == 0) {
        Gfx_DrawDListOpa(globalCtx, D_06008D88);
    } else {
        Gfx_DrawDListOpa(globalCtx, D_06006570);
    }
}
