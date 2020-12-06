/*
 * File: z_bg_bom_guard.c
 * Overlay: Bg_Bom_Guard
 * Description: Bombchu Bowling Alley Walls
 */

#include "vt.h"
#include "z_bg_bom_guard.h"
#include "overlays/actors/ovl_En_Bom_Bowl_Man/z_en_bom_bowl_man.h"

#define FLAGS 0x00000010

#define THIS ((BgBomGuard*)thisx)

void BgBomGuard_Init(Actor* thisx, GlobalContext* globalCtx);
void BgBomGuard_Destroy(Actor* thisx, GlobalContext* globalCtx);
void BgBomGuard_Update(Actor* thisx, GlobalContext* globalCtx);

void func_8086E638(BgBomGuard* this, GlobalContext* globalCtx);

const ActorInit Bg_Bom_Guard_InitVars = {
    ACTOR_BG_BOM_GUARD,
    ACTORTYPE_PROP,
    FLAGS,
    OBJECT_BOWL,
    sizeof(BgBomGuard),
    (ActorFunc)BgBomGuard_Init,
    (ActorFunc)BgBomGuard_Destroy,
    (ActorFunc)BgBomGuard_Update,
    NULL,
};

extern UNK_TYPE D_06001C40;

void BgBomGuard_SetupAction(BgBomGuard* this, BgBomGuardActionFunc actionFunc) {
    this->actionFunc = actionFunc;
}

void BgBomGuard_Init(Actor* thisx, GlobalContext* globalCtx) {
    BgBomGuard* this = THIS;
    s32 pad[2];
    s32 local_c = 0;

    DynaPolyInfo_SetActorMove(&this->dyna, 0);
    DynaPolyInfo_Alloc(&D_06001C40, &local_c);
    this->dyna.dynaPolyId = DynaPolyInfo_RegisterActor(globalCtx, &globalCtx->colCtx.dyna, thisx, local_c);

    osSyncPrintf("\n\n");
    osSyncPrintf(VT_FGCOL(GREEN) " ☆☆☆☆☆ 透明ガード出現 ☆☆☆☆☆ \n" VT_RST);

    thisx->scale.x = 1.0f;
    thisx->scale.y = 1.0f;
    thisx->scale.z = 1.0f;
    this->unk_16C = thisx->posRot.pos;
    BgBomGuard_SetupAction(this, func_8086E638);
}

void BgBomGuard_Destroy(Actor* thisx, GlobalContext* globalCtx) {
    BgBomGuard* this = THIS;

    DynaPolyInfo_Free(globalCtx, &globalCtx->colCtx.dyna, this->dyna.dynaPolyId);
}

void func_8086E638(BgBomGuard* this, GlobalContext* globalCtx) {
    Actor* it = globalCtx->actorCtx.actorList[ACTORTYPE_NPC].first;
    Actor* thisx = &this->dyna.actor;

    this->unk_168 = 0;

    while (it != 0) {
        if (it->id == ACTOR_EN_BOM_BOWL_MAN) {
            if ((((EnBomBowlMan*)it)->minigamePlayStatus != 0) && (fabsf(globalCtx->view.eye.x) > -20.0f) &&
                (fabsf(globalCtx->view.eye.y) > 110.0f)) {
                this->unk_168 = 1;
            }
            break;
        }
        it = it->next;
    }

    if (this->unk_168 == 0) {
        thisx->posRot.pos.y = sREG(64) + -200.0f;
    } else {
        thisx->posRot.pos.y = 0.0f;
    }
}

void BgBomGuard_Update(Actor* thisx, GlobalContext* globalCtx) {
    BgBomGuard* this = THIS;

    this->actionFunc(this, globalCtx);
}
