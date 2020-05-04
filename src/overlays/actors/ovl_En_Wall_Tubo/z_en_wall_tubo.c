/*
 * File: z_en_wall_tubo.c
 * Overlay: ovl_En_Wall_Tubo
 * Description: Bombchu Bowling Alley Wall 2
 */

#include "z_en_wall_tubo.h"

#define FLAGS 0x00000010

#define THIS ((EnWallTubo*)thisx)

void EnWallTubo_Init(Actor* thisx, GlobalContext* globalCtx);
void EnWallTubo_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnWallTubo_Update(Actor* thisx, GlobalContext* globalCtx);

/*
const ActorInit En_Wall_Tubo_InitVars = {
    ACTOR_EN_WALL_TUBO,
    ACTORTYPE_PROP,
    FLAGS,
    OBJECT_GAMEPLAY_KEEP,
    sizeof(EnWallTubo),
    (ActorFunc)EnWallTubo_Init,
    (ActorFunc)EnWallTubo_Destroy,
    (ActorFunc)EnWallTubo_Update,
    NULL,
};
*/
#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Wall_Tubo/EnWallTubo_Init.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Wall_Tubo/EnWallTubo_Destroy.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Wall_Tubo/func_80B2EE5C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Wall_Tubo/func_80B2EE9C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Wall_Tubo/func_80B2F0B8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Wall_Tubo/EnWallTubo_Update.s")
