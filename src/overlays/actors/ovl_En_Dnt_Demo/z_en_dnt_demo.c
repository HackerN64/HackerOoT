#include "z_en_dnt_demo.h"

#define FLAGS 0x00000000

#define THIS ((EnDntDemo*)thisx)

void EnDntDemo_Init(Actor* thisx, GlobalContext* globalCtx);
void EnDntDemo_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnDntDemo_Update(Actor* thisx, GlobalContext* globalCtx);

/*
const ActorInit En_Dnt_Demo_InitVars = {
    ACTOR_EN_DNT_DEMO,
    ACTORCAT_PROP,
    FLAGS,
    OBJECT_GAMEPLAY_KEEP,
    sizeof(EnDntDemo),
    (ActorFunc)EnDntDemo_Init,
    (ActorFunc)EnDntDemo_Destroy,
    (ActorFunc)EnDntDemo_Update,
    NULL,
};
*/
#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Dnt_Demo/EnDntDemo_Destroy.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Dnt_Demo/EnDntDemo_Init.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Dnt_Demo/func_809F0AA4.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Dnt_Demo/func_809F1100.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Dnt_Demo/func_809F1374.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Dnt_Demo/EnDntDemo_Update.s")
