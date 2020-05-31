/*
 * File: z_bg_haka_megane.c
 * Overlay: ovl_Bg_Haka_Megane
 * Description: Shadow Temple Fake Walls
 */

#include "z_bg_haka_megane.h"

#define FLAGS 0x000000B0

#define THIS ((BgHakaMegane*)thisx)

void BgHakaMegane_Init(Actor* thisx, GlobalContext* globalCtx);
void BgHakaMegane_Destroy(Actor* thisx, GlobalContext* globalCtx);
void BgHakaMegane_Update(Actor* thisx, GlobalContext* globalCtx);
void BgHakaMegane_Draw(Actor* thisx, GlobalContext* globalCtx);

void func_8087DB24(BgHakaMegane* this, GlobalContext* globalCtx);
void func_8087DBF0(BgHakaMegane* this, GlobalContext* globalCtx);
void BgHakaMegane_DoNothing(BgHakaMegane* this, GlobalContext* globalCtx);

const ActorInit Bg_Haka_Megane_InitVars = {
    ACTOR_BG_HAKA_MEGANE,
    ACTORTYPE_PROP,
    FLAGS,
    OBJECT_GAMEPLAY_KEEP,
    sizeof(BgHakaMegane),
    (ActorFunc)BgHakaMegane_Init,
    (ActorFunc)BgHakaMegane_Destroy,
    (ActorFunc)BgHakaMegane_Update,
    NULL,
};

static InitChainEntry sInitChain[] = {
    ICHAIN_VEC3F_DIV1000(scale, 100, ICHAIN_STOP),
};

static UNK_PTR sDynaAllocArg0[] = {
    0x06001830, 0x06001AB8, 0x00000000, 0x06004330, 0x060044D0, 0x00000000, 0x06004780,
    0x06004940, 0x00000000, 0x06004B00, 0x00000000, 0x06004CC0, 0x00000000,
};

static Gfx* sDLists[] = {
    0x06001060, 0x06001920, 0x060003F0, 0x060040F0, 0x060043B0, 0x06001120, 0x060045A0,
    0x060047F0, 0x060018F0, 0x060049B0, 0x06003CF0, 0x06004B70, 0x06002ED0,
};

extern Gfx D_06001250[];

void BgHakaMegane_Init(Actor* thisx, GlobalContext* globalCtx) {
    BgHakaMegane* this = THIS;

    Actor_ProcessInitChain(thisx, sInitChain);
    DynaPolyInfo_SetActorMove(&this->dyna, 0);

    if (thisx->params < 3) {
        this->objBankIndex = Object_GetIndex(&globalCtx->objectCtx, OBJECT_HAKACH_OBJECTS);
    } else {
        this->objBankIndex = Object_GetIndex(&globalCtx->objectCtx, OBJECT_HAKA_OBJECTS);
    }

    if (this->objBankIndex < 0) {
        Actor_Kill(thisx);
    } else {
        this->actionFunc = func_8087DB24;
    }
}

void BgHakaMegane_Destroy(Actor* thisx, GlobalContext* globalCtx) {
    BgHakaMegane* this = THIS;

    DynaPolyInfo_Free(globalCtx, &globalCtx->colCtx.dyna, this->dyna.dynaPolyId);
}

void func_8087DB24(BgHakaMegane* this, GlobalContext* globalCtx) {
    s32 localC;
    UNK_TYPE arg0;

    if (Object_IsLoaded(&globalCtx->objectCtx, this->objBankIndex)) {
        this->dyna.actor.objBankIndex = this->objBankIndex;
        this->dyna.actor.draw = BgHakaMegane_Draw;
        Actor_SetObjectDependency(globalCtx, &this->dyna.actor);
        if (globalCtx->roomCtx.curRoom.showInvisActors) {
            this->actionFunc = func_8087DBF0;
            arg0 = sDynaAllocArg0[this->dyna.actor.params];
            if (arg0 != 0) {
                DynaPolyInfo_Alloc(arg0, &localC);
                this->dyna.dynaPolyId =
                    DynaPolyInfo_RegisterActor(globalCtx, &globalCtx->colCtx.dyna, &this->dyna.actor, localC);
            }
        } else {
            this->actionFunc = BgHakaMegane_DoNothing;
        }
    }
}

void func_8087DBF0(BgHakaMegane* this, GlobalContext* globalCtx) {
    Actor* thisx = &this->dyna.actor;

    if (globalCtx->actorCtx.unk_03 != 0) {
        thisx->flags |= 0x80;
        func_8003EBF8(globalCtx, &globalCtx->colCtx.dyna, this->dyna.dynaPolyId);
    } else {
        thisx->flags &= ~0x80;
        func_8003EC50(globalCtx, &globalCtx->colCtx.dyna, this->dyna.dynaPolyId);
    }
}

void BgHakaMegane_DoNothing(BgHakaMegane* this, GlobalContext* globalCtx) {
}

void BgHakaMegane_Update(Actor* thisx, GlobalContext* globalCtx) {
    BgHakaMegane* this = THIS;

    this->actionFunc(this, globalCtx);
}

void BgHakaMegane_Draw(Actor* thisx, GlobalContext* globalCtx) {
    BgHakaMegane* this = THIS;

    if ((thisx->flags & 0x80) == 0x80) {
        Gfx_DrawDListXlu(globalCtx, sDLists[thisx->params]);
    } else {
        Gfx_DrawDListOpa(globalCtx, sDLists[thisx->params]);
    }

    if (thisx->params == 0) {
        Gfx_DrawDListXlu(globalCtx, D_06001250);
    }
}
