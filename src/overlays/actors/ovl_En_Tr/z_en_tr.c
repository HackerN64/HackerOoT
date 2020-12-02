/*
 * File: z_en_tr.c
 * Overlay: ovl_En_Tr
 * Description: Koume and Kotake
 */

#include "z_en_tr.h"

#define FLAGS 0x00000010

#define THIS ((EnTr*)thisx)

void EnTr_Init(Actor* thisx, GlobalContext* globalCtx);
void EnTr_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnTr_Update(Actor* thisx, GlobalContext* globalCtx);
void EnTr_Draw(Actor* thisx, GlobalContext* globalCtx);

extern UNK_TYPE D_060013CC;
extern UNK_TYPE D_06001CDC;
extern UNK_TYPE D_060035CC;
extern UNK_TYPE D_06003FC8;
extern UNK_TYPE D_060049C8;
extern UNK_TYPE D_0600C530;
extern UNK_TYPE D_06011688;

/*
const ActorInit En_Tr_InitVars = {
    ACTOR_EN_TR,
    ACTORTYPE_NPC,
    FLAGS,
    OBJECT_TR,
    sizeof(EnTr),
    (ActorFunc)EnTr_Init,
    (ActorFunc)EnTr_Destroy,
    (ActorFunc)EnTr_Update,
    (ActorFunc)EnTr_Draw,
};
*/
#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Tr/func_80B22CF0.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Tr/EnTr_Init.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Tr/EnTr_Destroy.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Tr/func_80B22E6C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Tr/func_80B22F1C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Tr/func_80B22F28.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Tr/func_80B230D8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Tr/func_80B23254.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Tr/func_80B234D4.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Tr/func_80B23690.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Tr/func_80B23820.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Tr/func_80B238E0.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Tr/func_80B239A8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Tr/func_80B23A88.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Tr/EnTr_Update.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Tr/func_80B23D74.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Tr/EnTr_Draw.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Tr/func_80B23FDC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Tr/func_80B24038.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Tr/func_80B24230.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Tr/func_80B242B4.s")
