/*
 * File: z_en_vase.c
 * Overlay: ovl_En_Vase
 * Description: An unused, orange pot based on ALTTP. Lacks collision.
 */

#include "z_en_vase.h"
#include "objects/object_vase/object_vase.h"

#define FLAGS 0x00000010

#define THIS ((EnVase*)thisx)

void EnVase_Init(Actor* thisx, GlobalContext* globalCtx);
void EnVase_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnVase_Draw(Actor* thisx, GlobalContext* globalCtx);

const ActorInit En_Vase_InitVars = {
    ACTOR_EN_VASE,
    ACTORCAT_PROP,
    FLAGS,
    OBJECT_VASE,
    sizeof(EnVase),
    (ActorFunc)EnVase_Init,
    (ActorFunc)EnVase_Destroy,
    (ActorFunc)Actor_Noop,
    (ActorFunc)EnVase_Draw,
};

void EnVase_Init(Actor* thisx, GlobalContext* globalCtx) {
    EnVase* this = THIS;

    Actor_SetScale(&this->actor, 0.01f);
    this->actor.focus.pos = this->actor.world.pos;
    ActorShape_Init(&this->actor.shape, 0.0f, ActorShadow_DrawCircle, 6.0f);
}

void EnVase_Destroy(Actor* thisx, GlobalContext* globalCtx) {
}

void EnVase_Draw(Actor* thisx, GlobalContext* globalCtx) {
    Gfx_DrawDListOpa(globalCtx, &gUnusedVaseDL);
}
