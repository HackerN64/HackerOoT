/*
 * File: z_bg_gnd_nisekabe.c
 * Overlay: ovl_Bg_Gnd_Nisekabe
 * Description: Ganon's Castle Fake Wall
 */

#include "z_bg_gnd_nisekabe.h"

#define FLAGS 0x00000010

#define THIS ((BgGndNisekabe*)thisx)

void BgGndNisekabe_Init(Actor* thisx, GlobalContext* globalCtx);
void BgGndNisekabe_Destroy(Actor* thisx, GlobalContext* globalCtx);
void BgGndNisekabe_Update(Actor* thisx, GlobalContext* globalCtx);
void BgGndNisekabe_Draw(Actor* thisx, GlobalContext* globalCtx);

const ActorInit Bg_Gnd_Nisekabe_InitVars = {
    ACTOR_BG_GND_NISEKABE,
    ACTORCAT_PROP,
    FLAGS,
    OBJECT_DEMO_KEKKAI,
    sizeof(BgGndNisekabe),
    (ActorFunc)BgGndNisekabe_Init,
    (ActorFunc)BgGndNisekabe_Destroy,
    (ActorFunc)BgGndNisekabe_Update,
    (ActorFunc)BgGndNisekabe_Draw,
};

static Gfx* sDLists[] = { 0x06009230, 0x0600A390, 0x0600B4A0 };

void BgGndNisekabe_Init(Actor* thisx, GlobalContext* globalCtx) {
    BgGndNisekabe* this = THIS;

    Actor_SetScale(&this->actor, 0.1);
    this->actor.uncullZoneForward = 3000.0;
}

void BgGndNisekabe_Destroy(Actor* thisx, GlobalContext* globalCtx) {
}

void BgGndNisekabe_Update(Actor* thisx, GlobalContext* globalCtx) {
    BgGndNisekabe* this = THIS;

    if (globalCtx->actorCtx.unk_03 != 0) {
        this->actor.flags |= 0x80;
    } else {
        this->actor.flags &= 0xFFFFFF7F;
    }
}

void BgGndNisekabe_Draw(Actor* thisx, GlobalContext* globalCtx) {
    BgGndNisekabe* this = THIS;
    u32 index = this->actor.params & 0xFF;

    if ((this->actor.flags & 0x80) == 0x80) {
        Gfx_DrawDListXlu(globalCtx, sDLists[index]);
    } else {
        Gfx_DrawDListOpa(globalCtx, sDLists[index]);
    }
}
