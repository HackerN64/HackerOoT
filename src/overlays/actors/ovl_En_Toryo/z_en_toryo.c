/*
 * File: z_en_tory.c
 * Overlay: ovl_En_Toryo
 * Description: Boss Carpenter
 */

#include "z_en_toryo.h"

#define FLAGS 0x00000009

#define THIS ((EnToryo*)thisx)

void EnToryo_Init(Actor* thisx, GlobalContext* globalCtx);
void EnToryo_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnToryo_Update(Actor* thisx, GlobalContext* globalCtx);
void EnToryo_Draw(Actor* thisx, GlobalContext* globalCtx);

extern UNK_TYPE D_06007150;

/*
const ActorInit En_Toryo_InitVars = {
    ACTOR_EN_TORYO,
    ACTORTYPE_NPC,
    FLAGS,
    OBJECT_TORYO,
    sizeof(EnToryo),
    (ActorFunc)EnToryo_Init,
    (ActorFunc)EnToryo_Destroy,
    (ActorFunc)EnToryo_Update,
    (ActorFunc)EnToryo_Draw,
};
*/
#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Toryo/EnToryo_Init.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Toryo/EnToryo_Destroy.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Toryo/func_80B203D8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Toryo/func_80B205CC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Toryo/func_80B20634.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Toryo/func_80B206A0.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Toryo/func_80B20768.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Toryo/func_80B20914.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Toryo/EnToryo_Update.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Toryo/EnToryo_Draw.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Toryo/func_80B20B04.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Toryo/func_80B20B94.s")
