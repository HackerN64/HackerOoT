#include "z_en_bili.h"

#define FLAGS 0x00005005

#define THIS ((EnBili*)thisx)

void EnBili_Init(Actor* thisx, GlobalContext* globalCtx);
void EnBili_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnBili_Update(Actor* thisx, GlobalContext* globalCtx);
void EnBili_Draw(Actor* thisx, GlobalContext* globalCtx);

extern UNK_TYPE D_06000024;
extern UNK_TYPE D_06000064;
extern UNK_TYPE D_060000A4;
extern UNK_TYPE D_06005848;

/*
const ActorInit En_Bili_InitVars = {
    ACTOR_EN_BILI,
    ACTORTYPE_ENEMY,
    FLAGS,
    OBJECT_BL,
    sizeof(EnBili),
    (ActorFunc)EnBili_Init,
    (ActorFunc)EnBili_Destroy,
    (ActorFunc)EnBili_Update,
    (ActorFunc)EnBili_Draw,
};
*/
#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/EnBili_Init.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/EnBili_Destroy.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/func_809BF9BC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/func_809BFA14.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/func_809BFA8C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/func_809BFAE8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/func_809BFB40.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/func_809BFB5C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/func_809BFBC4.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/func_809BFC48.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/func_809BFCE8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/func_809BFD18.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/func_809BFD94.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/func_809BFF6C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/func_809C008C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/func_809C0174.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/func_809C0260.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/func_809C02B8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/func_809C04B4.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/func_809C0570.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/func_809C0600.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/func_809C067C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/func_809C06E0.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/func_809C0754.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/func_809C0980.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/func_809C09E0.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/func_809C0A70.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/EnBili_Update.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/func_809C0E08.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/func_809C1020.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/func_809C1240.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/func_809C13A8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Bili/EnBili_Draw.s")
