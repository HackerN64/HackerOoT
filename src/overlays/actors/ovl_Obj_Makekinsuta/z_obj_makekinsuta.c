/*
 * File: z_obj_makekinsuta.c
 * Overlay: ovl_Obj_Makekinsuta
 * Description: Skulltula Sprouting from Bean Spot.
 */

#include <ultra64.h>
#include <global.h>
#include <vt.h>

typedef struct {
    /* 0x0000 */ Actor actor;
    /* 0x014C */ ActorFunc actionFunc;
    /* 0x150  */ s16 unk_150;
    /* 0x152  */ s16 unk_152;
} ObjMakekinsuta; // size = 0x0154

#define ROOM 0x00
#define FLAGS 0x00000010

static void ObjMakekinsuta_Init(ObjMakekinsuta* this, GlobalContext* globalCtx);
static void ObjMakekinsuta_Update(ObjMakekinsuta* this, GlobalContext* globalCtx);
static void func_80B98320(ObjMakekinsuta* this, GlobalContext* globalCtx);
static void func_80B983D4(ObjMakekinsuta* this, GlobalContext* globalCtx);

const ActorInit Obj_Makekinsuta_InitVars = {
    ACTOR_OBJ_MAKEKINSUTA,
    ACTORTYPE_ITEMACTION,
    ROOM,
    FLAGS,
    OBJECT_GAMEPLAY_KEEP,
    sizeof(ObjMakekinsuta),
    (ActorFunc)ObjMakekinsuta_Init,
    (ActorFunc)Actor_Noop,
    (ActorFunc)ObjMakekinsuta_Update,
    NULL,
};

static void ObjMakekinsuta_Init(ObjMakekinsuta* this, GlobalContext* globalCtx) {
    if ((this->actor.params & 0x6000) == 0x4000) {
        osSyncPrintf(VT_FGCOL(BLUE));
        // Translation: Gold Star Enemy(arg_data %x)
        osSyncPrintf("金スタ発生敵(arg_data %x)\n", this->actor.params);
        osSyncPrintf(VT_RST);
    } else {
        osSyncPrintf(VT_COL(YELLOW, BLACK));
        // Translation: Invalid Argument (arg_data %x)(%s %d)
        osSyncPrintf("引数不正 (arg_data %x)(%s %d)\n", this->actor.params, "../z_obj_makekinsuta.c", 119);
        osSyncPrintf(VT_RST);
    }
    this->actionFunc = func_80B98320;
}

static void func_80B98320(ObjMakekinsuta* this, GlobalContext* globalCtx) {
    if (this->unk_152 != 0) {
        if (this->unk_150 >= 0x3C && !func_8002DEEC(PLAYER)) {
            Actor_Spawn(&globalCtx->actorCtx, globalCtx, ACTOR_EN_SW, this->actor.posRot.pos.x,
                        this->actor.posRot.pos.y, this->actor.posRot.pos.z, 0, this->actor.shape.rot.y, 0,
                        (this->actor.params | 0x8000));
            this->actionFunc = &func_80B983D4;
            return;
        }
        this->unk_150 = this->unk_150 + 1;
        return;
    }
    this->unk_150 = 0;
}

static void func_80B983D4(ObjMakekinsuta* this, GlobalContext* globalCtx) {
}

static void ObjMakekinsuta_Update(ObjMakekinsuta* this, GlobalContext* globalCtx) {
    this->actionFunc(&this->actor, globalCtx);
}
