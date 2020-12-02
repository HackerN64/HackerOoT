/*
 * File: z_en_weiyer.c
 * Overlay: ovl_En_Weiyer
 * Description: Stinger (Water)
 */

#include "z_en_weiyer.h"

#define FLAGS 0x00000005

#define THIS ((EnWeiyer*)thisx)

void EnWeiyer_Init(Actor* thisx, GlobalContext* globalCtx);
void EnWeiyer_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnWeiyer_Update(Actor* thisx, GlobalContext* globalCtx);
void EnWeiyer_Draw(Actor* thisx, GlobalContext* globalCtx);

extern UNK_TYPE D_06000288;
extern UNK_TYPE D_06000FC0;
extern UNK_TYPE D_060012AC;
extern UNK_TYPE D_06003410;

/*
const ActorInit En_Weiyer_InitVars = {
    ACTOR_EN_WEIYER,
    ACTORTYPE_ENEMY,
    FLAGS,
    OBJECT_EI,
    sizeof(EnWeiyer),
    (ActorFunc)EnWeiyer_Init,
    (ActorFunc)EnWeiyer_Destroy,
    (ActorFunc)EnWeiyer_Update,
    (ActorFunc)EnWeiyer_Draw,
};
*/
#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Weiyer/EnWeiyer_Init.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Weiyer/EnWeiyer_Destroy.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Weiyer/func_80B32384.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Weiyer/func_80B32434.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Weiyer/func_80B32494.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Weiyer/func_80B32508.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Weiyer/func_80B32538.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Weiyer/func_80B325A0.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Weiyer/func_80B32660.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Weiyer/func_80B32724.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Weiyer/func_80B327B0.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Weiyer/func_80B327D8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Weiyer/func_80B32804.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Weiyer/func_80B328E8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Weiyer/func_80B32C2C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Weiyer/func_80B32D30.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Weiyer/func_80B32DEC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Weiyer/func_80B32E34.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Weiyer/func_80B33018.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Weiyer/func_80B331CC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Weiyer/func_80B332B4.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Weiyer/func_80B33338.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Weiyer/func_80B333B8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Weiyer/func_80B3349C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Weiyer/func_80B3368C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Weiyer/EnWeiyer_Update.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Weiyer/func_80B338D4.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Weiyer/EnWeiyer_Draw.s")
