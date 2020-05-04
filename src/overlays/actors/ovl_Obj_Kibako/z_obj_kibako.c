/*
 * File: z_obj_kibako.c
 * Overlay: ovl_Obj_Kibako
 * Description: Small, Liftable Crate
 */

#include "z_obj_kibako.h"

#define FLAGS 0x04000010

#define THIS ((ObjKibako*)thisx)

void ObjKibako_Init(Actor* thisx, GlobalContext* globalCtx);
void ObjKibako_Destroy(Actor* thisx, GlobalContext* globalCtx);
void ObjKibako_Update(Actor* thisx, GlobalContext* globalCtx);
void ObjKibako_Draw(Actor* thisx, GlobalContext* globalCtx);

/*
const ActorInit Obj_Kibako_InitVars = {
    ACTOR_OBJ_KIBAKO,
    ACTORTYPE_PROP,
    FLAGS,
    OBJECT_GAMEPLAY_DANGEON_KEEP,
    sizeof(ObjKibako),
    (ActorFunc)ObjKibako_Init,
    (ActorFunc)ObjKibako_Destroy,
    (ActorFunc)ObjKibako_Update,
    (ActorFunc)ObjKibako_Draw,
};
*/
#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Kibako/func_80B94CA0.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Kibako/func_80B94D00.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Kibako/func_80B94D34.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Kibako/ObjKibako_Init.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Kibako/ObjKibako_Destroy.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Kibako/func_80B94E38.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Kibako/func_80B950B8.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Kibako/func_80B95334.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Kibako/func_80B9534C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Kibako/func_80B95540.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Kibako/func_80B95574.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Kibako/func_80B95638.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Kibako/func_80B9569C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Kibako/ObjKibako_Update.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Obj_Kibako/ObjKibako_Draw.s")
