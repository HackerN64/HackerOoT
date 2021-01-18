#include "z_en_fr.h"

#define FLAGS 0x02000019

#define THIS ((EnFr*)thisx)

void EnFr_Init(Actor* thisx, GlobalContext* globalCtx);
void EnFr_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnFr_Update(Actor* thisx, GlobalContext* globalCtx);

extern UNK_TYPE D_05002470;
extern UNK_TYPE D_050036F0;
extern UNK_TYPE D_060007BC;
extern UNK_TYPE D_060011C0;
extern UNK_TYPE D_06001534;
extern UNK_TYPE D_0600B498;

/*
const ActorInit En_Fr_InitVars = {
    ACTOR_EN_FR,
    ACTORCAT_NPC,
    FLAGS,
    OBJECT_FR,
    sizeof(EnFr),
    (ActorFunc)EnFr_Init,
    (ActorFunc)EnFr_Destroy,
    (ActorFunc)EnFr_Update,
    NULL,
};
*/
#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1A9A0.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/EnFr_Init.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1AC0C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1AC34.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/EnFr_Update.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/EnFr_Destroy.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1AF6C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1AFF0.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1B09C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1B0F8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1B174.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1B19C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1B22C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1B2C8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1B464.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1B524.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1B638.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1B778.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1B8D0.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1B9D8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1BB34.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1BC14.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1BCB4.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1BD94.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1BDFC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1BE98.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1BF10.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1C05C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1C18C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1C1E4.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1C248.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1C344.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1C388.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1C400.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1C474.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1C524.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1C580.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1C718.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1C790.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1C7CC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1C830.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1C944.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1CAAC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1CB08.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1CB58.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1CC04.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1CC2C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fr/func_80A1CD24.s")
