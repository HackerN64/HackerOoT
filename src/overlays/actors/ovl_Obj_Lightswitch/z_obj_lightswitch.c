/*
 * File: z_obj_lightswitch.c
 * Overlay: ovl_Obj_Lightswitch
 * Description: Sun Emblem Trigger (Spirit Temple)
 */

#include "z_obj_lightswitch.h"

#define FLAGS 0x00000010

#define THIS ((ObjLightswitch*)thisx)

void ObjLightswitch_Init(Actor* thisx, GlobalContext* globalCtx);
void ObjLightswitch_Destroy(Actor* thisx, GlobalContext* globalCtx);
void ObjLightswitch_Update(Actor* thisx, GlobalContext* globalCtx);
void ObjLightswitch_Draw(Actor* thisx, GlobalContext* globalCtx);

/*
const ActorInit Obj_Lightswitch_InitVars = {
    ACTOR_OBJ_LIGHTSWITCH,
    ACTORTYPE_SWITCH,
    FLAGS,
    OBJECT_LIGHTSWITCH,
    sizeof(ObjLightswitch),
    (ActorFunc)ObjLightswitch_Init,
    (ActorFunc)ObjLightswitch_Destroy,
    (ActorFunc)ObjLightswitch_Update,
    (ActorFunc)ObjLightswitch_Draw,
};
*/
#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Lightswitch/func_80B96BA0.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Lightswitch/func_80B96C3C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Lightswitch/func_80B96D00.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Lightswitch/func_80B96D80.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Lightswitch/ObjLightswitch_Init.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Lightswitch/ObjLightswitch_Destroy.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Lightswitch/func_80B971A8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Lightswitch/func_80B971D8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Lightswitch/func_80B972B8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Lightswitch/func_80B972D8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Lightswitch/func_80B973C8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Lightswitch/func_80B97400.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Lightswitch/func_80B97518.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Lightswitch/func_80B97540.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Lightswitch/func_80B97630.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Lightswitch/func_80B97648.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Lightswitch/func_80B97690.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Lightswitch/func_80B976A8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Lightswitch/ObjLightswitch_Update.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Lightswitch/func_80B977D0.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Lightswitch/func_80B97B50.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Lightswitch/ObjLightswitch_Draw.s")
