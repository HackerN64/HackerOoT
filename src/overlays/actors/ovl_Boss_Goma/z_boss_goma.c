#include "z_boss_goma.h"

#define FLAGS 0x00000035

#define THIS ((BossGoma*)thisx)

void BossGoma_Init(Actor* thisx, GlobalContext* globalCtx);
void BossGoma_Destroy(Actor* thisx, GlobalContext* globalCtx);
void BossGoma_Update(Actor* thisx, GlobalContext* globalCtx);
void BossGoma_Draw(Actor* thisx, GlobalContext* globalCtx);

/*
const ActorInit Boss_Goma_InitVars = {
    ACTOR_BOSS_GOMA,
    ACTORTYPE_BOSS,
    FLAGS,
    OBJECT_GOMA,
    sizeof(BossGoma),
    (ActorFunc)BossGoma_Init,
    (ActorFunc)BossGoma_Destroy,
    (ActorFunc)BossGoma_Update,
    (ActorFunc)BossGoma_Draw,
};
*/
#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_80915A10.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_80915A40.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_80915A94.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/BossGoma_Init.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_80915DF8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/BossGoma_Destroy.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_80915F38.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_80916000.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_809160A4.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_8091612C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_809161B0.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_8091622C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_809162A8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_8091631C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_80916394.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_80916418.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_809164AC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_80916530.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_809165C0.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_80916668.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_809166D8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_8091674C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_809167C0.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_8091683C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_809168B0.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_80916AEC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_80916C9C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_80917D98.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_80918C08.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_80918D10.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_80918D6C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_80918FBC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_80919054.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_809190F8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_80919150.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_80919278.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_8091932C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_809193EC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_80919548.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_809195A4.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_8091960C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_80919704.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_80919974.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_80919A40.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_80919C38.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_80919E80.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_80919F8C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_8091A16C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_8091A2E8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/BossGoma_Update.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_8091A560.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_8091A9E8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_8091ABEC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_8091AC18.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/BossGoma_Draw.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Boss_Goma/func_8091ADA8.s")
