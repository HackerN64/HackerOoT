/*
 * File: z_en_vase.c
 * Overlay: ovl_En_Vase
 * Description: An unused, orange pot based on ALTTP. Lacks collision.
 */

#include "z_en_vase.h"

#define FLAGS 0x00000010

#define THIS ((EnVase*)thisx)

void EnVase_Init(Actor* thisx, GlobalContext* globalCtx);
void EnVase_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnVase_Draw(Actor* thisx, GlobalContext* globalCtx);

const ActorInit En_Vase_InitVars = {
    ACTOR_EN_VASE,
    ACTORTYPE_PROP,
    FLAGS,
    OBJECT_VASE,
    sizeof(EnVase),
    (ActorFunc)EnVase_Init,
    (ActorFunc)EnVase_Destroy,
    (ActorFunc)Actor_Noop,
    (ActorFunc)EnVase_Draw,
};

extern Gfx D_06000000[];

void EnVase_Init(Actor* thisx, GlobalContext* globalCtx) {
    EnVase* this = THIS;

    Actor_SetScale(&this->actor, 0.01f);
    this->actor.posRot2.pos = this->actor.posRot.pos;
    ActorShape_Init(&this->actor.shape, 0.0f, ActorShadow_DrawFunc_Circle, 6.0f);
}

void EnVase_Destroy(Actor* thisx, GlobalContext* globalCtx) {
}

void EnVase_Draw(Actor* thisx, GlobalContext* globalCtx) {
    Gfx_DrawDListOpa(globalCtx, &D_06000000);
}
