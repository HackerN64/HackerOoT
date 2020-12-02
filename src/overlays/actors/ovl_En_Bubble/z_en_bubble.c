#include "z_en_bubble.h"

#define FLAGS 0x00000001

#define THIS ((EnBubble*)thisx)

void EnBubble_Init(Actor* thisx, GlobalContext* globalCtx);
void EnBubble_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnBubble_Update(Actor* thisx, GlobalContext* globalCtx);
void EnBubble_Draw(Actor* thisx, GlobalContext* globalCtx);

extern UNK_TYPE D_06001000;

/*
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
*/
#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bubble/func_809CBC00.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bubble/func_809CBCBC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bubble/func_809CBCEC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bubble/func_809CBD10.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bubble/func_809CBD78.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bubble/func_809CBFD4.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bubble/func_809CC020.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bubble/func_809CC074.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bubble/func_809CC0FC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bubble/func_809CC16C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bubble/func_809CC648.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bubble/func_809CC6E4.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bubble/func_809CC774.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bubble/EnBubble_Init.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bubble/EnBubble_Destroy.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bubble/func_809CC9B4.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bubble/func_809CCA60.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bubble/func_809CCAA8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bubble/func_809CCAF0.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bubble/EnBubble_Update.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bubble/EnBubble_Draw.s")
