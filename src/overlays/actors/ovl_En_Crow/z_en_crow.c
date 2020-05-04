#include "z_en_crow.h"

#define FLAGS 0x00005005

#define THIS ((EnCrow*)thisx)

void EnCrow_Init(Actor* thisx, GlobalContext* globalCtx);
void EnCrow_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnCrow_Update(Actor* thisx, GlobalContext* globalCtx);
void EnCrow_Draw(Actor* thisx, GlobalContext* globalCtx);

/*
const ActorInit En_Crow_InitVars = {
    ACTOR_EN_CROW,
    ACTORTYPE_ENEMY,
    FLAGS,
    OBJECT_CROW,
    sizeof(EnCrow),
    (ActorFunc)EnCrow_Init,
    (ActorFunc)EnCrow_Destroy,
    (ActorFunc)EnCrow_Update,
    (ActorFunc)EnCrow_Draw,
};
*/
#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Crow/EnCrow_Init.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Crow/EnCrow_Destroy.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Crow/func_809E0354.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Crow/func_809E0384.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Crow/func_809E03B4.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Crow/func_809E06D4.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Crow/func_809E06E8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Crow/func_809E0770.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Crow/func_809E0864.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Crow/func_809E0C8C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Crow/func_809E0E2C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Crow/func_809E0F54.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Crow/func_809E1004.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Crow/func_809E10A8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Crow/func_809E1174.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Crow/EnCrow_Update.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Crow/func_809E1434.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Crow/func_809E1520.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Crow/EnCrow_Draw.s")
