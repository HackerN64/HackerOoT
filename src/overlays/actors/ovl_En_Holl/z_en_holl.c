#include "z_en_holl.h"

#define FLAGS 0x00000010

#define THIS ((EnHoll*)thisx)

// Horizontal Plane parameters

#define PLANE_Y_MIN -50.0f
#define PLANE_Y_MAX 200.0f

#define PLANE_HALFWIDTH 100.0f
#define PLANE_HALFWIDTH_2 200.0f

void EnHoll_Init(Actor* thisx, GlobalContext* globalCtx);
void EnHoll_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnHoll_Update(Actor* thisx, GlobalContext* globalCtx);
void EnHoll_Draw(Actor* thisx, GlobalContext* globalCtx);

void EnHoll_NextAction(EnHoll* this, GlobalContext* globalCtx);
void func_80A58DD4(EnHoll* this, GlobalContext* globalCtx);
void func_80A59014(EnHoll* this, GlobalContext* globalCtx);
void func_80A591C0(EnHoll* this, GlobalContext* globalCtx);
void func_80A593A4(EnHoll* this, GlobalContext* globalCtx);
void func_80A59520(EnHoll* this, GlobalContext* globalCtx);
void func_80A59618(EnHoll* this, GlobalContext* globalCtx);

const ActorInit En_Holl_InitVars = {
    ACTOR_EN_HOLL,
    ACTORTYPE_DOOR,
    FLAGS,
    OBJECT_GAMEPLAY_KEEP,
    sizeof(EnHoll),
    (ActorFunc)EnHoll_Init,
    (ActorFunc)EnHoll_Destroy,
    (ActorFunc)EnHoll_Update,
    (ActorFunc)EnHoll_Draw,
};

static EnHollActionFunc sActionFuncs[] = {
    func_80A58DD4, func_80A591C0, func_80A59520, func_80A59618, func_80A59014, func_80A593A4, func_80A59014,
};

static InitChainEntry sInitChain[] = {
    ICHAIN_F32(uncullZoneForward, 4000, ICHAIN_CONTINUE),
    ICHAIN_F32(uncullZoneScale, 400, ICHAIN_CONTINUE),
    ICHAIN_F32(uncullZoneDownward, 400, ICHAIN_STOP),
};

/**
 * These are all absolute distances in the relative z direction. That is, moving
 *   towards or away from the "face" of the loading plane regardless of orientation.
 * Moving within these distances of the load plane have the following effects:
 * [0] : Load the room on this side of the loading plane if not already loaded
 * [1] : Load the room on the other side of the loading plane
 * [2] : Fade Region (opaque -> transparent if approaching, transparent -> opaque if receding)
 * [3] : Transparent Region
 *
 * When traversing a loading plane of this kind, it attempts to:
 *   Load Current Room (fails as it is already loaded)
 *   Load Next Room
 *   Load Previous Room
 *   Load Next Room
 *
 *  @bug The striped nature of loading planes can cause some actors to unload due to
 *      conflicting Object Lists between the two rooms
 *
 *  @bug If you can get around to the other side of the loading plane without triggering it,
 *      you can load the room on the other side multiple times
 */
static f32 sHorizTriggerDists[2][4] = {
    { 200.0f, 150.0f, 100.0f, 50.0f },
    { 100.0f, 75.0f, 50.0f, 25.0f },
};

static Vtx sVertices[] = {
    VTX(0x55F0, 0x4E20, 0x0000, 0x0800, 0x0800, 255, 255, 255, 255),
    VTX(0xAA10, 0x4E20, 0x0000, 0x0000, 0x0800, 255, 255, 255, 255),
    VTX(0xAA10, 0xB1E0, 0x0000, 0x0000, 0x0000, 255, 255, 255, 255),
    VTX(0x55F0, 0xB1E0, 0x0000, 0x0800, 0x0000, 255, 255, 255, 255),
};

static Gfx sPlaneDlist[] = {
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    gsDPSetCombineMode(G_CC_PRIMITIVE, G_CC_PASS2),
    gsSPVertex(sVertices, 4, 0),
    gsSP2Triangles(0, 1, 2, 0, 0, 2, 3, 0),
    gsSPEndDisplayList(),
};

void EnHoll_SetupAction(EnHoll* this, EnHollActionFunc func) {
    this->actionFunc = func;
}

s32 EnHoll_IsKokiriSetup8() {
    return gSaveContext.entranceIndex == 0x00EE && gSaveContext.sceneSetupIndex == 8;
}

void EnHoll_ChooseAction(EnHoll* this) {
    s32 action;

    action = (this->actor.params >> 6) & 7;
    EnHoll_SetupAction(this, sActionFuncs[action]);
    if (action != 0) {
        this->actor.draw = NULL;
    } else {
        this->planeAlpha = 255;
    }
}

void EnHoll_Init(Actor* thisx, GlobalContext* globalCtx) {
    EnHoll* this = THIS;

    Actor_ProcessInitChain(&this->actor, sInitChain);
    EnHoll_ChooseAction(this);
    this->unk_14F = 0;
}

void EnHoll_Destroy(Actor* thisx, GlobalContext* globalCtx) {
    s32 transitionActorIdx = (u16)thisx->params >> 0xA;
    TransitionActorEntry* transitionEntry = &globalCtx->transitionActorList[transitionActorIdx];

    transitionEntry->id = -transitionEntry->id;
}

void EnHoll_SwapRooms(GlobalContext* globalCtx) {
    Room tempRoom;
    RoomContext* roomCtx = &globalCtx->roomCtx;

    tempRoom = roomCtx->curRoom;
    roomCtx->curRoom = roomCtx->prevRoom;
    roomCtx->prevRoom = tempRoom;
    globalCtx->roomCtx.unk_30 ^= 1;
}

// Horizontal Planes
void func_80A58DD4(EnHoll* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;
    s32 phi_t0 = ((globalCtx->sceneNum == SCENE_JYASINZOU) ? 1 : 0) & 0xFFFFFFFF;
    Vec3f vec;
    f32 absZ;
    s32 transitionActorIdx;

    func_8002DBD0(&this->actor, &vec, &player->actor.posRot.pos);
    this->side = (vec.z < 0.0f) ? 0 : 1;
    absZ = fabsf(vec.z);
    if (vec.y > PLANE_Y_MIN && vec.y < PLANE_Y_MAX && fabsf(vec.x) < PLANE_HALFWIDTH &&
        absZ < sHorizTriggerDists[phi_t0][0]) {
        transitionActorIdx = (u16)this->actor.params >> 0xA;
        if (absZ > sHorizTriggerDists[phi_t0][1]) {
            if (globalCtx->roomCtx.prevRoom.num >= 0 && globalCtx->roomCtx.status == 0) {
                this->actor.room = globalCtx->transitionActorList[transitionActorIdx].sides[this->side].room;
                EnHoll_SwapRooms(globalCtx);
                func_80097534(globalCtx, &globalCtx->roomCtx);
            }
        } else {
            this->actor.room = globalCtx->transitionActorList[transitionActorIdx].sides[this->side ^ 1].room;
            if (globalCtx->roomCtx.prevRoom.num < 0) {
                func_8009728C(globalCtx, &globalCtx->roomCtx, this->actor.room);
            } else {
                this->planeAlpha = (255.0f / (sHorizTriggerDists[phi_t0][2] - sHorizTriggerDists[phi_t0][3])) *
                                   (absZ - sHorizTriggerDists[phi_t0][3]);
                this->planeAlpha = CLAMP(this->planeAlpha, 0, 255);
                if (globalCtx->roomCtx.curRoom.num != this->actor.room) {
                    EnHoll_SwapRooms(globalCtx);
                }
            }
        }
    }
}

// Horizontal Planes
#ifdef NON_MATCHING
// Small regalloc near the end
void func_80A59014(EnHoll* this, GlobalContext* globalCtx) {
    s32 pad;
    s32 pad1;
    Vec3f vec;
    TransitionActorEntry* transitionEntry;
    f32 planeHalfWidth;
    s32 pad2;
    Player* player = PLAYER;
    s32 useViewEye = gDbgCamEnabled != 0 || globalCtx->csCtx.state != 0;
    s32 transitionActorIdx;
    f32 absZ;
    s32 side;

    func_8002DBD0(&this->actor, &vec, (useViewEye) ? &globalCtx->view.eye : &player->actor.posRot.pos);
    planeHalfWidth = (((this->actor.params >> 6) & 7) == 6) ? PLANE_HALFWIDTH : PLANE_HALFWIDTH_2;
    if (EnHoll_IsKokiriSetup8() || (vec.y > PLANE_Y_MIN && vec.y < PLANE_Y_MAX && fabsf(vec.x) < planeHalfWidth &&
                                    fabsf(vec.z) < 100.0f && fabsf(vec.z) > 50.0f)) {
        transitionActorIdx = (u16)this->actor.params >> 0xA;
        side = (vec.z < 0.0f) ? 0 : 1;
        transitionEntry = &globalCtx->transitionActorList[transitionActorIdx];
        this->actor.room = transitionEntry->sides[side].room;
        if (this->actor.room != globalCtx->roomCtx.curRoom.num &&
            func_8009728C(globalCtx, &globalCtx->roomCtx, (u32)this->actor.room)) {
            EnHoll_SetupAction(this, EnHoll_NextAction);
        }
    }
}
#else
#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_En_Holl/func_80A59014.s")
#endif

// Vertical Planes
void func_80A591C0(EnHoll* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;
    f32 absY = fabsf(this->actor.yDistFromLink);
    s32 transitionActorIdx;

    if (this->actor.xzDistFromLink < 500.0f && absY < 700.0f) {
        transitionActorIdx = (u16)this->actor.params >> 0xA;
        if (absY < 95.0f) {
            globalCtx->unk_11E18 = 0xFF;
        } else if (absY > 605.0f) {
            globalCtx->unk_11E18 = 0;
        } else {
            globalCtx->unk_11E18 = (s16)(605.0f - absY) * 0.5f;
        }
        if (absY < 95.0f) {
            this->actor.room = globalCtx->transitionActorList[transitionActorIdx].sides[1].room;
            Math_SmoothScaleMaxMinF(&player->actor.posRot.pos.x, this->actor.posRot.pos.x, 1.0f, 50.0f, 10.0f);
            Math_SmoothScaleMaxMinF(&player->actor.posRot.pos.z, this->actor.posRot.pos.z, 1.0f, 50.0f, 10.0f);
            if (this->actor.room != globalCtx->roomCtx.curRoom.num &&
                func_8009728C(globalCtx, &globalCtx->roomCtx, this->actor.room) != 0) {
                EnHoll_SetupAction(this, EnHoll_NextAction);
                this->unk_14F = 1;
                player->actor.speedXZ = 0.0f;
            }
        }
    } else if (this->unk_14F != 0) {
        globalCtx->unk_11E18 = 0;
        this->unk_14F = 0;
    }
}

// Vertical Planes
void func_80A593A4(EnHoll* this, GlobalContext* globalCtx) {
    f32 absY;
    s32 side;
    s32 transitionActorIdx;

    if ((this->actor.xzDistFromLink < 120.0f) && (absY = fabsf(this->actor.yDistFromLink), absY < 200.0f)) {
        if (absY < 50.0f) {
            globalCtx->unk_11E18 = 0xFF;
        } else {
            globalCtx->unk_11E18 = (200.0f - absY) * 1.7f;
        }
        if (absY > 50.0f) {
            transitionActorIdx = (u16)this->actor.params >> 0xA;
            side = (0.0f < this->actor.yDistFromLink) ? 0 : 1;
            this->actor.room = globalCtx->transitionActorList[transitionActorIdx].sides[side].room;
            if (this->actor.room != globalCtx->roomCtx.curRoom.num &&
                func_8009728C(globalCtx, &globalCtx->roomCtx, this->actor.room) != 0) {
                EnHoll_SetupAction(this, EnHoll_NextAction);
                this->unk_14F = 1;
            }
        }
    } else if (this->unk_14F != 0) {
        this->unk_14F = 0;
        globalCtx->unk_11E18 = 0;
    }
}

// Vertical Planes
void func_80A59520(EnHoll* this, GlobalContext* globalCtx) {
    f32 absY;
    s8 side;
    s32 transitionActorIdx;

    if (this->actor.xzDistFromLink < 120.0f) {
        absY = fabsf(this->actor.yDistFromLink);
        if (absY < 200.0f && absY > 50.0f) {
            transitionActorIdx = (u16)this->actor.params >> 0xA;
            side = (0.0f < this->actor.yDistFromLink) ? 0 : 1;
            this->actor.room = globalCtx->transitionActorList[transitionActorIdx].sides[side].room;
            if (this->actor.room != globalCtx->roomCtx.curRoom.num &&
                func_8009728C(globalCtx, &globalCtx->roomCtx, this->actor.room) != 0) {
                EnHoll_SetupAction(this, EnHoll_NextAction);
            }
        }
    }
}

// Horizontal Planes
void func_80A59618(EnHoll* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;
    Vec3f vec;
    f32 absZ;
    s32 side;
    s32 transitionActorIdx;

    if (!Flags_GetSwitch(globalCtx, this->actor.params & 0x3F)) {
        if (this->unk_14F != 0) {
            globalCtx->unk_11E18 = 0;
            this->unk_14F = 0;
        }
    } else {
        func_8002DBD0(&this->actor, &vec, &player->actor.posRot.pos);
        absZ = fabsf(vec.z);
        if (PLANE_Y_MIN < vec.y && vec.y < PLANE_Y_MAX && fabsf(vec.x) < PLANE_HALFWIDTH_2 && absZ < 100.0f) {
            this->unk_14F = 1;
            transitionActorIdx = (u16)this->actor.params >> 0xA;
            globalCtx->unk_11E18 = 0xFF - (s32)((absZ - 50.0f) * 5.9f);
            if (globalCtx->unk_11E18 >= 0x100) {
                globalCtx->unk_11E18 = 0xFF;
            } else if (globalCtx->unk_11E18 < 0) {
                globalCtx->unk_11E18 = 0;
            }
            if (absZ < 50.0f) {
                side = (vec.z < 0.0f) ? 0 : 1;
                this->actor.room = globalCtx->transitionActorList[transitionActorIdx].sides[side].room;
                if (this->actor.room != globalCtx->roomCtx.curRoom.num &&
                    func_8009728C(globalCtx, &globalCtx->roomCtx, this->actor.room) != 0) {
                    EnHoll_SetupAction(this, EnHoll_NextAction);
                }
            }
        } else if (this->unk_14F != 0) {
            globalCtx->unk_11E18 = 0;
            this->unk_14F = 0;
        }
    }
}

void EnHoll_NextAction(EnHoll* this, GlobalContext* globalCtx) {
    if (!EnHoll_IsKokiriSetup8() && globalCtx->roomCtx.status == 0) {
        func_80097534(globalCtx, &globalCtx->roomCtx);
        if (globalCtx->unk_11E18 == 0) {
            this->unk_14F = 0;
        }
        EnHoll_ChooseAction(this);
    }
}

void EnHoll_Update(Actor* thisx, GlobalContext* globalCtx) {
    EnHoll* this = THIS;
    this->actionFunc(this, globalCtx);
}

void EnHoll_Draw(Actor* thisx, GlobalContext* globalCtx) {
    EnHoll* this = THIS;
    Gfx* gfxP;
    u32 setupDLIdx;

    // Only draw the plane if not invisible
    if (this->planeAlpha != 0) {
        OPEN_DISPS(globalCtx->state.gfxCtx, "../z_en_holl.c", 805);
        if (this->planeAlpha == 255) {
            gfxP = POLY_OPA_DISP;
            setupDLIdx = 37;
        } else {
            gfxP = POLY_XLU_DISP;
            setupDLIdx = 0;
        }
        gfxP = Gfx_CallSetupDL(gfxP, setupDLIdx);
        if (this->side == 0) {
            Matrix_RotateY(M_PI, MTXMODE_APPLY);
        }

        gSPMatrix(gfxP++, Matrix_NewMtx(globalCtx->state.gfxCtx, "../z_en_holl.c", 824),
                  G_MTX_NOPUSH | G_MTX_LOAD | G_MTX_MODELVIEW);
        gDPSetPrimColor(gfxP++, 0, 0, 0, 0, 0, (u8)this->planeAlpha);
        gSPDisplayList(gfxP++, sPlaneDlist);

        if (this->planeAlpha == 255) {
            POLY_OPA_DISP = gfxP;
        } else {
            POLY_XLU_DISP = gfxP;
        }
        CLOSE_DISPS(globalCtx->state.gfxCtx, "../z_en_holl.c", 831);
    }
}
