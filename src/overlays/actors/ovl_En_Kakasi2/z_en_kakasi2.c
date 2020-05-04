#include "z_en_kakasi2.h"

#define FLAGS 0x0A000031

#define THIS ((EnKakasi2*)thisx)

void EnKakasi2_Init(Actor* thisx, GlobalContext* globalCtx);
void EnKakasi2_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnKakasi2_Update(Actor* thisx, GlobalContext* globalCtx);

/*
const ActorInit En_Kakasi2_InitVars = {
    ACTOR_EN_KAKASI2,
    ACTORTYPE_PROP,
    FLAGS,
    OBJECT_KA,
    sizeof(EnKakasi2),
    (ActorFunc)EnKakasi2_Init,
    (ActorFunc)EnKakasi2_Destroy,
    (ActorFunc)EnKakasi2_Update,
    NULL,
};
*/
#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kakasi2/EnKakasi2_Init.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kakasi2/EnKakasi2_Destroy.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kakasi2/func_80A90264.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kakasi2/func_80A904D8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kakasi2/func_80A90578.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kakasi2/func_80A9062C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kakasi2/func_80A906C4.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kakasi2/EnKakasi2_Update.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Kakasi2/func_80A90948.s")
