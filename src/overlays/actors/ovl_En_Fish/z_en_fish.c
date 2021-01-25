#include "z_en_fish.h"
#include "objects/gameplay_keep/gameplay_keep.h"

#define FLAGS 0x00000000

#define THIS ((EnFish*)thisx)

void EnFish_Init(Actor* thisx, GlobalContext* globalCtx);
void EnFish_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnFish_Update(Actor* thisx, GlobalContext* globalCtx);
void EnFish_Draw(Actor* thisx, GlobalContext* globalCtx);

/*
const ActorInit En_Fish_InitVars = {
    ACTOR_EN_FISH,
    ACTORCAT_ITEMACTION,
    FLAGS,
    OBJECT_GAMEPLAY_KEEP,
    sizeof(EnFish),
    (ActorFunc)EnFish_Init,
    (ActorFunc)EnFish_Destroy,
    (ActorFunc)EnFish_Update,
    (ActorFunc)EnFish_Draw,
};

static ColliderJntSphElementInit D_80A1701C[1] = {
    {
        {
            ELEMTYPE_UNK0,
            { 0x00000000, 0x00, 0x00 },
            { 0xFFCFFFFF, 0x00, 0x00 },
            TOUCH_NONE,
            BUMP_NONE,
            OCELEM_ON,
        },
        { 0, { { 0, 0, 0 }, 5 }, 100 },
    },
};

static ColliderJntSphInit D_80A17040 = {
    {
        COLTYPE_NONE,
        AT_NONE,
        AC_NONE,
        OC1_ON | OC1_TYPE_ALL,
        OC2_TYPE_1,
        COLSHAPE_JNTSPH,
    },
    1,
    D_80A1701C,
};
*/
#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/func_80A15280.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/func_80A152AC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/func_80A15310.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/func_80A15374.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/func_80A153AC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/func_80A15444.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/EnFish_Init.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/EnFish_Destroy.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/func_80A155D0.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/func_80A15688.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/func_80A15774.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/func_80A157A4.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/func_80A157FC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/func_80A158EC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/func_80A15944.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/func_80A15AD4.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/func_80A15B2C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/func_80A15D18.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/func_80A15D68.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/func_80A15F24.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/func_80A15F84.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/func_80A160BC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/func_80A16200.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/func_80A163DC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/func_80A16450.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/func_80A16618.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/func_80A16670.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/func_80A16898.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/func_80A169C8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/func_80A16A64.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/func_80A16C68.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/func_80A16DEC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/EnFish_Update.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Fish/EnFish_Draw.s")
