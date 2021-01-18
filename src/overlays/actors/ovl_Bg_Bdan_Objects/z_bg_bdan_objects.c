/*
 * File: z_bg_bdan_objects.c
 * Overlay: ovl_Bg_Bdan_Objects
 * Description: Lord Jabu-Jabu Objects
 */

#include "z_bg_bdan_objects.h"

#define FLAGS 0x00000010

#define THIS ((BgBdanObjects*)thisx)

void BgBdanObjects_Init(Actor* thisx, GlobalContext* globalCtx);
void BgBdanObjects_Destroy(Actor* thisx, GlobalContext* globalCtx);
void BgBdanObjects_Update(Actor* thisx, GlobalContext* globalCtx);
void BgBdanObjects_Draw(Actor* thisx, GlobalContext* globalCtx);

void func_8086C054(BgBdanObjects* this, GlobalContext* globalCtx);
void func_8086C1A0(BgBdanObjects* this, GlobalContext* globalCtx);
void func_8086C29C(BgBdanObjects* this, GlobalContext* globalCtx);
void func_8086C55C(BgBdanObjects* this, GlobalContext* globalCtx);
void func_8086C5BC(BgBdanObjects* this, GlobalContext* globalCtx);
void func_8086C618(BgBdanObjects* this, GlobalContext* globalCtx);
void func_8086C6EC(BgBdanObjects* this, GlobalContext* globalCtx);
void func_8086C76C(BgBdanObjects* this, GlobalContext* globalCtx);
void func_8086C7D0(BgBdanObjects* this, GlobalContext* globalCtx);
void BgBdanObjects_DoNothing(BgBdanObjects* this, GlobalContext* globalCtx);
void func_8086C874(BgBdanObjects* this, GlobalContext* globalCtx);
void func_8086C9A8(BgBdanObjects* this, GlobalContext* globalCtx);
void func_8086C9F0(BgBdanObjects* this, GlobalContext* globalCtx);
void func_8086CABC(BgBdanObjects* this, GlobalContext* globalCtx);
void func_8086CB10(BgBdanObjects* this, GlobalContext* globalCtx);
void func_8086CB8C(BgBdanObjects* this, GlobalContext* globalCtx);

const ActorInit Bg_Bdan_Objects_InitVars = {
    ACTOR_BG_BDAN_OBJECTS,
    ACTORCAT_BG,
    FLAGS,
    OBJECT_BDAN_OBJECTS,
    sizeof(BgBdanObjects),
    (ActorFunc)BgBdanObjects_Init,
    (ActorFunc)BgBdanObjects_Destroy,
    (ActorFunc)BgBdanObjects_Update,
    (ActorFunc)BgBdanObjects_Draw,
};

static ColliderCylinderInit sCylinderInit = {
    {
        COLTYPE_NONE,
        AT_ON | AT_TYPE_ENEMY,
        AC_NONE,
        OC1_NONE,
        OC2_TYPE_2,
        COLSHAPE_CYLINDER,
    },
    {
        ELEMTYPE_UNK0,
        { 0xFFCFFFFF, 0x00, 0x04 },
        { 0x00000000, 0x00, 0x00 },
        TOUCH_ON | TOUCH_SFX_HARD,
        BUMP_NONE,
        OCELEM_NONE,
    },
    { 0x00BB, 0x0050, 0x0000, { 0 } },
};

static InitChainEntry sInitChain[] = {
    ICHAIN_VEC3F_DIV1000(scale, 0x64, ICHAIN_STOP),
};

static Gfx* D_8086CDA0[] = {
    0x06008618,
    0x06004BE8,
    0x060038E8,
    0x06005200,
};

extern Gfx D_060038E8[];
extern CollisionHeader D_06005048;
extern CollisionHeader D_06005580;
extern CollisionHeader D_06008CE0;

s32 BgBdanObjects_GetContactRu1(BgBdanObjects* this, s32 arg1) {
    switch (arg1) {
        case 0:
            return this->cameraSetting == CAM_SET_NORMAL0;
        case 4:
            return gSaveContext.infTable[20] & 0x40;
        case 3:
            return this->cameraSetting == CAM_SET_DUNGEON1;
        default:
            osSyncPrintf("Bg_Bdan_Objects_Get_Contact_Ru1\nそんな受信モードは無い%d!!!!!!!!\n");
            return -1;
    }
}

void BgBdanObjects_SetContactRu1(BgBdanObjects* this, s32 arg1) {
    switch (arg1) {
        case 1:
            this->cameraSetting = CAM_SET_NORMAL1;
            break;
        case 2:
            this->cameraSetting = CAM_SET_DUNGEON0;
            break;
        case 4:
            gSaveContext.infTable[20] |= 0x40;
            break;
        default:
            osSyncPrintf("Bg_Bdan_Objects_Set_Contact_Ru1\nそんな送信モードは無い%d!!!!!!!!\n");
    }
}

void BgBdanObjects_Init(Actor* thisx, GlobalContext* globalCtx) {
    BgBdanObjects* this = THIS;
    s32 pad;
    CollisionHeader* colHeader = NULL;

    Actor_ProcessInitChain(this, sInitChain);
    DynaPolyActor_Init(this, DPM_PLAYER);
    this->unk_168 = (thisx->params >> 8) & 0x3F;
    thisx->params &= 0xFF;
    if (thisx->params == 2) {
        thisx->flags |= 0x30;
        globalCtx->colCtx.colHeader->waterBoxes[7].ySurface = thisx->world.pos.y;
        this->actionFunc = func_8086C9A8;
        return;
    }
    if (thisx->params == 0) {
        CollisionHeader_GetVirtual(&D_06008CE0, &colHeader);
        Collider_InitCylinder(globalCtx, &this->collider);
        Collider_SetCylinder(globalCtx, &this->collider, this, &sCylinderInit);
        thisx->world.pos.y = (f32)(thisx->world.pos.y + -79.0f);
        if (Flags_GetClear(globalCtx, thisx->room)) {
            Flags_SetSwitch(globalCtx, this->unk_168);
            this->actionFunc = func_8086C6EC;
        } else {
            if (BgBdanObjects_GetContactRu1(this, 4)) {
                if (Actor_SpawnAsChild(&globalCtx->actorCtx, this, globalCtx, ACTOR_EN_BIGOKUTA, thisx->home.pos.x,
                                       thisx->home.pos.y, thisx->home.pos.z, 0, thisx->shape.rot.y + 0x8000, 0,
                                       3) != NULL) {
                    thisx->child->world.pos.z = thisx->child->home.pos.z + 263.0f;
                }
                thisx->world.rot.y = 0;
                this->actionFunc = func_8086C618;
                thisx->world.pos.y = thisx->home.pos.y + -70.0f;
            } else {
                Flags_SetSwitch(globalCtx, this->unk_168);
                this->unk_16A = 0;
                this->actionFunc = func_8086C054;
            }
        }
    } else {
        if (thisx->params == 1) {
            CollisionHeader_GetVirtual(&D_06005048, &colHeader);
            this->unk_16A = 0x200;
            this->unk_168 = 0;
            this->actionFunc = func_8086C874;
        } else {
            CollisionHeader_GetVirtual(&D_06005580, &colHeader);
            if (Flags_GetSwitch(globalCtx, this->unk_168)) {
                this->actionFunc = BgBdanObjects_DoNothing;
                thisx->world.pos.y = thisx->home.pos.y - 400.0f;
            } else {
                this->actionFunc = func_8086CB10;
            }
        }
    }
    this->dyna.bgId = DynaPoly_SetBgActor(globalCtx, &globalCtx->colCtx.dyna, thisx, colHeader);
}

void BgBdanObjects_Destroy(Actor* thisx, GlobalContext* globalCtx) {
    BgBdanObjects* this = THIS;

    DynaPoly_DeleteBgActor(globalCtx, &globalCtx->colCtx.dyna, this->dyna.bgId);
    if (thisx->params == 0) {
        Collider_DestroyCylinder(globalCtx, &this->collider);
    }
}

void func_8086C054(BgBdanObjects* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;

    if (BgBdanObjects_GetContactRu1(this, 0)) {
        if (this->dyna.actor.xzDistToPlayer < 250.0f) {
            BgBdanObjects_SetContactRu1(this, 1);
            this->unk_16A = 0x14;
            func_800800F8(globalCtx, 0xBFE, -0x63, &this->dyna.actor, 0);
            player->actor.world.pos.x = -1130.0f;
            player->actor.world.pos.y = -1025.0f;
            player->actor.world.pos.z = -3300.0f;
            func_800AA000(0.0f, 0xFF, 0x14, 0x96);
        }
    } else {
        if (this->unk_16A != 0) {
            if (this->unk_16A != 0) {
                this->unk_16A -= 1;
            }
            if (this->unk_16A == 0) {
                this->actionFunc = func_8086C1A0;
            }
        }
    }

    if (!Gameplay_InCsMode(globalCtx) && !BgBdanObjects_GetContactRu1(this, 0)) {
        this->dyna.actor.world.pos.y = this->dyna.actor.home.pos.y + -79.0f;
    } else {
        this->dyna.actor.world.pos.y = (this->dyna.actor.home.pos.y + -79.0f) - 5.0f;
    }
}

void func_8086C1A0(BgBdanObjects* this, GlobalContext* globalCtx) {
    if (Math_SmoothStepToF(&this->dyna.actor.world.pos.y, this->dyna.actor.home.pos.y + 500.0f, 0.5f, 7.5f, 1.0f) <
        0.1f) {
        Audio_PlayActorSound2(&this->dyna.actor, NA_SE_EV_BUYOSTAND_STOP_A);
        this->actionFunc = func_8086C29C;
        this->unk_16A = 0x1E;
        BgBdanObjects_SetContactRu1(this, 2);
        func_800AA000(0.0f, 0xFF, 0x14, 0x96);
    } else {
        if (this->unk_16A != 0) {
            this->unk_16A -= 1;
        }
        if (this->unk_16A == 0) {
            func_800AA000(0.0f, 0x78, 0x14, 0xA);
            this->unk_16A = 0xB;
        }
        func_8002F974(&this->dyna.actor, NA_SE_EV_BUYOSTAND_RISING - SFX_FLAG);
    }
}

void func_8086C29C(BgBdanObjects* this, GlobalContext* globalCtx) {
    s32 temp;

    if (this->unk_16A != 0) {
        this->unk_16A -= 1;
        if (this->unk_16A == 0) {
            temp = Quake_Add(ACTIVE_CAM, 1);
            Quake_SetSpeed(temp, 0x3A98);
            Quake_SetQuakeValues(temp, 0, 1, 0xFA, 1);
            Quake_SetCountdown(temp, 0xA);
        }
    }

    if (BgBdanObjects_GetContactRu1(this, 3)) {
        Actor_SpawnAsChild(&globalCtx->actorCtx, &this->dyna.actor, globalCtx, ACTOR_EN_BIGOKUTA,
                           this->dyna.actor.world.pos.x, this->dyna.actor.world.pos.y + 140.0f,
                           this->dyna.actor.world.pos.z, 0, this->dyna.actor.shape.rot.y + 0x8000, 0, 0);
        BgBdanObjects_SetContactRu1(this, 4);
        this->unk_16A = 0xA;
        this->actionFunc = func_8086C55C;
        func_8005B1A4(ACTIVE_CAM);
    }
}

void func_8086C3D8(BgBdanObjects* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;

    this->dyna.actor.velocity.y += 0.5f;
    if (Math_StepToF(&this->dyna.actor.world.pos.y, this->dyna.actor.home.pos.y + -70.0f,
                     this->dyna.actor.velocity.y)) {
        this->dyna.actor.world.rot.y = 0;
        this->unk_16A = 0x3C;
        Audio_PlayActorSound2(&this->dyna.actor, NA_SE_EV_BUYOSTAND_STOP_U);
        this->dyna.actor.child->world.pos.y = this->dyna.actor.world.pos.y + 140.0f;
        this->actionFunc = func_8086C5BC;
        func_800800F8(globalCtx, 0xC08, -0x63, this->dyna.actor.child, 0);
        player->actor.world.pos.x = -1130.0f;
        player->actor.world.pos.y = -1025.0f;
        player->actor.world.pos.z = -3500.0f;
        player->actor.shape.rot.y = 0x7530;
        player->actor.world.rot.y = player->actor.shape.rot.y;
        func_800AA000(0.0f, 0xFF, 0x1E, 0x96);
    } else {
        func_8002F974(&this->dyna.actor, NA_SE_EV_BUYOSTAND_FALL - SFX_FLAG);
        if (this->unk_16A != 0) {
            this->unk_16A -= 1;
        }
        if (this->unk_16A == 0) {
            func_800AA000(0.0f, 0x78, 0x14, 0xA);
            this->unk_16A = 0xB;
        }
        if (this->dyna.actor.child != NULL) {
            this->dyna.actor.child->world.pos.y = this->dyna.actor.world.pos.y + 140.0f;
        }
    }
}

void func_8086C55C(BgBdanObjects* this, GlobalContext* globalCtx) {
    this->unk_16A -= 1;

    if (this->unk_16A == 0) {
        Flags_UnsetSwitch(globalCtx, this->unk_168);
    } else if (this->unk_16A == -0x28) {
        this->unk_16A = 0;
        this->actionFunc = func_8086C3D8;
    }
}

void func_8086C5BC(BgBdanObjects* this, GlobalContext* globalCtx) {
    if (this->unk_16A != 0) {
        this->unk_16A -= 1;
    }
    if (this->unk_16A == 0) {
        if (this->dyna.actor.child != NULL) {
            if (this->dyna.actor.child->params == 2) {
                this->actionFunc = func_8086C618;
            } else if (this->dyna.actor.child->params == 0) {
                this->dyna.actor.child->params = 1;
            }
        }
    }
}

void func_8086C618(BgBdanObjects* this, GlobalContext* globalCtx) {
    Collider_UpdateCylinder(&this->dyna.actor, &this->collider);
    CollisionCheck_SetAT(globalCtx, &globalCtx->colChkCtx, &this->collider.base);
    if (Flags_GetClear(globalCtx, this->dyna.actor.room)) {
        Flags_SetSwitch(globalCtx, this->unk_168);
        this->dyna.actor.home.rot.y = (s16)(this->dyna.actor.shape.rot.y + 0x2000) & 0xC000;
        this->actionFunc = func_8086C6EC;
    } else {
        this->dyna.actor.shape.rot.y += this->dyna.actor.world.rot.y;
        func_800F436C(&this->dyna.actor.projectedPos, 0x2063, ABS(this->dyna.actor.world.rot.y) / 512.0f);
    }
}

void func_8086C6EC(BgBdanObjects* this, GlobalContext* globalCtx) {
    s32 cond = Math_ScaledStepToS(&this->dyna.actor.shape.rot.y, this->dyna.actor.home.rot.y, 0x200);

    if (Math_StepToF(&this->dyna.actor.world.pos.y, this->dyna.actor.home.pos.y + -125.0f, 3.0f)) {
        if (cond) {
            this->actionFunc = func_8086C76C;
        }
    }
}

void func_8086C76C(BgBdanObjects* this, GlobalContext* globalCtx) {
    if (func_8004356C(&this->dyna.actor)) {
        if (this->dyna.actor.xzDistToPlayer < 120.0f) {
            this->actionFunc = func_8086C7D0;
            func_800800F8(globalCtx, 0xC12, -0x63, &this->dyna.actor, 0);
        }
    }
}

void func_8086C7D0(BgBdanObjects* this, GlobalContext* globalCtx) {
    if (Math_SmoothStepToF(&this->dyna.actor.world.pos.y, this->dyna.actor.home.pos.y + 965.0f, 0.5f, 15.0f, 0.2f) <
        0.01f) {
        Audio_PlayActorSound2(&this->dyna.actor, NA_SE_EV_BUYOSTAND_STOP_A);
        this->actionFunc = BgBdanObjects_DoNothing;
    } else {
        func_8002F974(&this->dyna.actor, NA_SE_EV_BUYOSTAND_RISING - SFX_FLAG);
    }
}

void BgBdanObjects_DoNothing(BgBdanObjects* this, GlobalContext* globalCtx) {
}

void func_8086C874(BgBdanObjects* this, GlobalContext* globalCtx) {
    if (this->unk_16A != 0) {
        this->unk_16A -= 1;
    }
    if (this->unk_168 == 0) {
        if (func_8004356C(&this->dyna.actor)) {
            this->cameraSetting = globalCtx->cameraPtrs[0]->setting;
            Camera_ChangeSetting(globalCtx->cameraPtrs[0], CAM_SET_NORMAL2);
            func_8005AD1C(globalCtx->cameraPtrs[0], 4);
            this->unk_168 = 0xAU;
        }
    } else {
        Camera_ChangeSetting(globalCtx->cameraPtrs[0], CAM_SET_NORMAL2);
        if (!func_8004356C(&this->dyna.actor)) {
            if (this->unk_168 != 0) {
                this->unk_168 -= 1;
            }
        }
        if (this->unk_168 == 0) {
            do {
            } while (0);
            Camera_ChangeSetting(globalCtx->cameraPtrs[0], (s16)this->cameraSetting);
            func_8005ACFC(globalCtx->cameraPtrs[0], 4);
        }
    }
    this->dyna.actor.world.pos.y =
        this->dyna.actor.home.pos.y - (sinf((f32)this->unk_16A * (M_PI / 256.0f)) * 471.239990234375f); // pi * 150
    if (this->unk_16A == 0) {
        this->unk_16A = 0x200;
    }
}

void func_8086C9A8(BgBdanObjects* this, GlobalContext* globalCtx) {
    if (Flags_GetSwitch(globalCtx, this->unk_168)) {
        this->unk_16A = 0x64;
        this->actionFunc = func_8086C9F0;
    }
}

void func_8086C9F0(BgBdanObjects* this, GlobalContext* globalCtx) {
    if (this->unk_16A == 0) {
        if (Math_StepToF(&this->dyna.actor.world.pos.y, this->dyna.actor.home.pos.y, 0.5f)) {
            Flags_UnsetSwitch(globalCtx, this->unk_168);
            this->actionFunc = func_8086C9A8;
        }
        func_8002F948(this, NA_SE_EV_WATER_LEVEL_DOWN - SFX_FLAG);
    } else {
        if (Math_StepToF(&this->dyna.actor.world.pos.y, this->dyna.actor.home.pos.y + 75.0f, 0.5f)) {
            this->actionFunc = func_8086CABC;
        }
        func_8002F948(this, NA_SE_EV_WATER_LEVEL_DOWN - SFX_FLAG);
    }
    globalCtx->colCtx.colHeader->waterBoxes[7].ySurface = this->dyna.actor.world.pos.y;
}

void func_8086CABC(BgBdanObjects* this, GlobalContext* globalCtx) {
    if (this->unk_16A != 0) {
        this->unk_16A -= 1;
    }
    func_8002F994(&this->dyna.actor, this->unk_16A);
    if (this->unk_16A == 0) {
        this->actionFunc = func_8086C9F0;
    }
}

void func_8086CB10(BgBdanObjects* this, GlobalContext* globalCtx) {
    if (func_8004356C(&this->dyna.actor)) {
        Flags_SetSwitch(globalCtx, this->unk_168);
        this->unk_16A = 0x32;
        this->actionFunc = func_8086CB8C;
        this->dyna.actor.home.pos.y -= 200.0f;
        func_800800F8(globalCtx, 0xC1C, 0x33, &this->dyna.actor, 0);
    }
}

void func_8086CB8C(BgBdanObjects* this, GlobalContext* globalCtx) {
    if (this->unk_16A != 0) {
        this->unk_16A -= 1;
    }
    this->dyna.actor.world.pos.y = this->dyna.actor.home.pos.y - (cosf(this->unk_16A * (M_PI / 50.0f)) * 200.0f);
    if (this->unk_16A == 0) {
        Audio_PlayActorSound2(this, NA_SE_EV_BUYOSTAND_STOP_U);
        this->actionFunc = BgBdanObjects_DoNothing;
        Gameplay_CopyCamera(globalCtx, 0, -1);
    } else {
        func_8002F974(&this->dyna.actor, NA_SE_EV_BUYOSTAND_FALL - SFX_FLAG);
    }
}

void BgBdanObjects_Update(Actor* thisx, GlobalContext* globalCtx) {
    BgBdanObjects* this = THIS;

    Actor_SetFocus(thisx, 50.0f);
    this->actionFunc(this, globalCtx);
}

void BgBdanObjects_Draw(Actor* thisx, GlobalContext* globalCtx) {
    BgBdanObjects* this = THIS;

    if (thisx->params == 0) {
        if (this->actionFunc == func_8086C054) {
            if (((thisx->home.pos.y + -79.0f) - 5.0f) < thisx->world.pos.y) {
                Matrix_Translate(0.0f, -50.0f, 0.0f, MTXMODE_APPLY);
            }
        }
    }

    if (thisx->params == 2) {
        Gfx_DrawDListXlu(globalCtx, D_060038E8);
    } else {
        Gfx_DrawDListOpa(globalCtx, D_8086CDA0[thisx->params]);
    }
}
