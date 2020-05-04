#include "z_en_kusa.h"

#define FLAGS 0x00800010

#define THIS ((EnKusa*)thisx)

void EnKusa_Init(Actor* thisx, GlobalContext* globalCtx);
void EnKusa_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnKusa_Update(Actor* thisx, GlobalContext* globalCtx);

/*
const ActorInit En_Kusa_InitVars = {
    ACTOR_EN_KUSA,
    ACTORTYPE_PROP,
    FLAGS,
    OBJECT_GAMEPLAY_KEEP,
    sizeof(EnKusa),
    (ActorFunc)EnKusa_Init,
    (ActorFunc)EnKusa_Destroy,
    (ActorFunc)EnKusa_Update,
    NULL,
};
*/
#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kusa/func_80A9AFA0.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kusa/func_80A9AFAC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kusa/func_80A9B07C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kusa/func_80A9B140.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kusa/func_80A9B174.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kusa/func_80A9B1FC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kusa/func_80A9B21C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kusa/func_80A9B574.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kusa/func_80A9B630.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kusa/EnKusa_Init.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kusa/EnKusa_Destroy.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kusa/func_80A9B7EC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kusa/func_80A9B810.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kusa/func_80A9B89C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kusa/func_80A9B8D8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kusa/func_80A9BA98.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kusa/func_80A9BAD8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kusa/func_80A9BBB0.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kusa/func_80A9BC1C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kusa/func_80A9BEAC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kusa/func_80A9BEFC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kusa/func_80A9BF30.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kusa/func_80A9BF3C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kusa/func_80A9BFA8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kusa/func_80A9C00C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kusa/func_80A9C068.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kusa/EnKusa_Update.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kusa/func_80A9C164.s")
