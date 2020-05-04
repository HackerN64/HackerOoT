#include "z_en_butte.h"

#define FLAGS 0x00000000

#define THIS ((EnButte*)thisx)

void EnButte_Init(Actor* thisx, GlobalContext* globalCtx);
void EnButte_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnButte_Update(Actor* thisx, GlobalContext* globalCtx);
void EnButte_Draw(Actor* thisx, GlobalContext* globalCtx);

/*
const ActorInit En_Butte_InitVars = {
    ACTOR_EN_BUTTE,
    ACTORTYPE_ITEMACTION,
    FLAGS,
    OBJECT_GAMEPLAY_FIELD_KEEP,
    sizeof(EnButte),
    (ActorFunc)EnButte_Init,
    (ActorFunc)EnButte_Destroy,
    (ActorFunc)EnButte_Update,
    (ActorFunc)EnButte_Draw,
};
*/
#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Butte/func_809CD070.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Butte/func_809CD0F8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Butte/func_809CD110.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Butte/func_809CD144.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Butte/EnButte_Init.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Butte/EnButte_Destroy.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Butte/func_809CD56C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Butte/func_809CD634.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Butte/func_809CD6FC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Butte/func_809CD79C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Butte/func_809CD7E8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Butte/func_809CDBCC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Butte/func_809CDC18.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Butte/func_809CDFC4.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Butte/func_809CE014.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Butte/func_809CE0D0.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Butte/func_809CE0EC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Butte/EnButte_Update.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Butte/EnButte_Draw.s")
