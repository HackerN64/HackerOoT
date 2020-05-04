#include "z_en_fw.h"

#define FLAGS 0x00000215

#define THIS ((EnFw*)thisx)

void EnFw_Init(Actor* thisx, GlobalContext* globalCtx);
void EnFw_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnFw_Update(Actor* thisx, GlobalContext* globalCtx);
void EnFw_Draw(Actor* thisx, GlobalContext* globalCtx);

/*
const ActorInit En_Fw_InitVars = {
    ACTOR_EN_FW,
    ACTORTYPE_ENEMY,
    FLAGS,
    OBJECT_FW,
    sizeof(EnFw),
    (ActorFunc)EnFw_Init,
    (ActorFunc)EnFw_Destroy,
    (ActorFunc)EnFw_Update,
    (ActorFunc)EnFw_Draw,
};
*/
#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fw/func_80A1E5A0.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fw/func_80A1E668.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fw/func_80A1E760.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fw/func_80A1E838.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fw/func_80A1E8F8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fw/EnFw_Init.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fw/EnFw_Destroy.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fw/func_80A1EC70.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fw/func_80A1ECD4.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fw/func_80A1F2A8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fw/func_80A1F39C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fw/EnFw_Update.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fw/func_80A1F52C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fw/func_80A1F544.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fw/EnFw_Draw.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fw/func_80A1F664.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fw/func_80A1F708.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fw/func_80A1F814.s")
