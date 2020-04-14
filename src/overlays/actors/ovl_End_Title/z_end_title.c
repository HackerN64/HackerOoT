/*
 * File: z_end_title.c
 * Overlay: ovl_End_Title
 * Description: "The End" message
 */

#include "z_end_title.h"

#define FLAGS 0x00000030

void EndTitle_Init(EndTitle* this, GlobalContext* globalCtx);
void EndTitle_Destroy(EndTitle* this, GlobalContext* globalCtx);
void EndTitle_Update(EndTitle* this, GlobalContext* globalCtx);
void EndTitle_Draw(EndTitle* this, GlobalContext* globalCtx);

/*
const ActorInit End_Title_InitVars = {
    ACTOR_END_TITLE,
    ACTORTYPE_ITEMACTION,
    FLAGS,
    OBJECT_GAMEPLAY_KEEP,
    sizeof(EndTitle),
    (ActorFunc)EndTitle_Init,
    (ActorFunc)EndTitle_Destroy,
    (ActorFunc)EndTitle_Update,
    (ActorFunc)EndTitle_Draw,
};
*/
#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_End_Title/EndTitle_Init.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_End_Title/EndTitle_Destroy.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_End_Title/EndTitle_Update.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_End_Title/EndTitle_Draw.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_End_Title/func_80B65DA8.s")
