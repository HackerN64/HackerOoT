#include "z_en_hy.h"

#define FLAGS 0x00000019

#define THIS ((EnHy*)thisx)

void EnHy_Init(Actor* thisx, GlobalContext* globalCtx);
void EnHy_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnHy_Update(Actor* thisx, GlobalContext* globalCtx);
void EnHy_Draw(Actor* thisx, GlobalContext* globalCtx);

extern UNK_TYPE D_06000BFC;
extern UNK_TYPE D_06000FE4;
extern UNK_TYPE D_060012E8;
extern UNK_TYPE D_06002160;
extern UNK_TYPE D_0600265C;
extern UNK_TYPE D_060033B4;
extern UNK_TYPE D_06005BC8;

/*
const ActorInit En_Hy_InitVars = {
    ACTOR_EN_HY,
    ACTORTYPE_NPC,
    FLAGS,
    OBJECT_GAMEPLAY_KEEP,
    sizeof(EnHy),
    (ActorFunc)EnHy_Init,
    (ActorFunc)EnHy_Destroy,
    (ActorFunc)EnHy_Update,
    (ActorFunc)EnHy_Draw,
};
*/
#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/func_80A6F5B0.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/func_80A6F6C0.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/func_80A6F744.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/func_80A6F790.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/func_80A6F7CC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/func_80A6F810.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/func_80A70058.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/func_80A705A4.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/func_80A70660.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/func_80A70698.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/func_80A70734.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/func_80A70834.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/func_80A70978.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/func_80A70AE4.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/func_80A70BAC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/func_80A70C08.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/func_80A70C44.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/func_80A70CD8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/EnHy_Init.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/EnHy_Destroy.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/func_80A70E34.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/func_80A710F8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/func_80A711B4.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/func_80A7127C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/func_80A712B4.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/func_80A712C0.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/func_80A7134C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/func_80A714C4.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/func_80A71530.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/EnHy_Update.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/func_80A716B8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/func_80A71A64.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/func_80A71BBC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Hy/EnHy_Draw.s")
