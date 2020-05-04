#include "z_en_kakasi3.h"

#define FLAGS 0x02000009

#define THIS ((EnKakasi3*)thisx)

void EnKakasi3_Init(Actor* thisx, GlobalContext* globalCtx);
void EnKakasi3_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnKakasi3_Update(Actor* thisx, GlobalContext* globalCtx);
void EnKakasi3_Draw(Actor* thisx, GlobalContext* globalCtx);

/*
const ActorInit En_Kakasi3_InitVars = {
    ACTOR_EN_KAKASI3,
    ACTORTYPE_NPC,
    FLAGS,
    OBJECT_KA,
    sizeof(EnKakasi3),
    (ActorFunc)EnKakasi3_Init,
    (ActorFunc)EnKakasi3_Destroy,
    (ActorFunc)EnKakasi3_Update,
    (ActorFunc)EnKakasi3_Draw,
};
*/
#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kakasi3/EnKakasi3_Destroy.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kakasi3/EnKakasi3_Init.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kakasi3/func_80A90E28.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kakasi3/func_80A90EBC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kakasi3/func_80A911F0.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kakasi3/func_80A91284.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kakasi3/func_80A91348.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kakasi3/func_80A915B8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kakasi3/func_80A91620.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kakasi3/func_80A91760.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kakasi3/func_80A917FC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kakasi3/func_80A9187C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kakasi3/func_80A918E4.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kakasi3/func_80A91A90.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kakasi3/EnKakasi3_Update.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kakasi3/EnKakasi3_Draw.s")
