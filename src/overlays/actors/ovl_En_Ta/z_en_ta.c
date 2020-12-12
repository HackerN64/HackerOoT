/*
 * File: z_en_ta.c
 * Overlay: ovl_En_Ta
 * Description: Talon
 */

#include "z_en_ta.h"
#include "vt.h"

#define FLAGS 0x00000009

#define THIS ((EnTa*)thisx)

void EnTa_Init(Actor* thisx, GlobalContext* globalCtx);
void EnTa_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnTa_Update(Actor* thisx, GlobalContext* globalCtx);
void EnTa_Draw(Actor* thisx, GlobalContext* globalCtx);

void func_80B14634(EnTa* this, GlobalContext* globalCtx);
void func_80B146F8(EnTa* this, GlobalContext* globalCtx);
void func_80B14754(EnTa* this, GlobalContext* globalCtx);
void func_80B14C18(EnTa* this, GlobalContext* globalCtx);
void func_80B14CAC(EnTa* this, GlobalContext* globalCtx);
void func_80B14D98(EnTa* this, GlobalContext* globalCtx);
void func_80B154FC(EnTa* this, GlobalContext* globalCtx);
void func_80B16504(EnTa* this, GlobalContext* globalCtx);
void func_80B16608(EnTa* this, GlobalContext* globalCtx);
void func_80B166CC(EnTa* this);
void func_80B16700(EnTa* this);
void func_80B167C0(EnTa* this);
void func_80B167FC(EnTa* this);
void func_80B16854(EnTa* this);
void func_80B16938(EnTa* this);

const ActorInit En_Ta_InitVars = {
    ACTOR_EN_TA,
    ACTORTYPE_NPC,
    FLAGS,
    OBJECT_TA,
    sizeof(EnTa),
    (ActorFunc)EnTa_Init,
    (ActorFunc)EnTa_Destroy,
    (ActorFunc)EnTa_Update,
    (ActorFunc)EnTa_Draw,
};

static ColliderCylinderInit sCylinderInit = {
    { COLTYPE_UNK10, 0x00, 0x09, 0x39, 0x10, COLSHAPE_CYLINDER },
    { 0x00, { 0x00000000, 0x00, 0x00 }, { 0x00000004, 0x00, 0x00 }, 0x00, 0x01, 0x01 },
    { 30, 40, 0, { 0, 0, 0 } },
};

Vec3f D_80B16E7C = {
    1100.0f,
    1000.0f,
    0.0f,
};

UNK_TYPE D_80B16E88[] = {
    0x06007F80,
    0x06006EC0,
    0x060072C0,
};

extern AnimationHeader D_060017E8;
extern AnimationHeader D_06001C94;
extern UNK_TYPE D_06006DC0;
extern FlexSkeletonHeader D_0600B7B8;
extern AnimationHeader D_0600BF38;
extern AnimationHeader D_0600C48C;
extern AnimationHeader D_0600C858;
extern AnimationHeader D_0600CD50;
extern AnimationHeader D_0600CF28;
extern AnimationHeader D_0600E3D8;

void func_80B13AA0(EnTa* this, EnTaActionFunc arg1, EnTaUnkFunc arg2) {
    this->unk_25C = arg1;
    this->unk_260 = arg2;
}

void func_80B13AAC(EnTa* this, GlobalContext* globalCtx) {
    u16 faceReaction = Text_GetFaceReaction(globalCtx, 24);

    if (gSaveContext.eventInf[0] & 0x400) {
        if (gSaveContext.eventInf[0] & 0x100) {
            if (gSaveContext.itemGetInf[0] & 4) {
                this->actor.textId = 0x2088;
            } else {
                this->actor.textId = 0x2086;
            }
        } else {
            this->actor.textId = 0x2085;
        }
        gSaveContext.eventInf[0] &= ~0x100;
    } else if (faceReaction == 0) {
        if (gSaveContext.infTable[7] & 0x4000) {
            if (gSaveContext.itemGetInf[0] & 4) {
                this->actor.textId = 0x208B;
            } else {
                this->actor.textId = 0x207F;
            }
        } else {
            this->actor.textId = 0x207E;
        }
    } else {
        this->actor.textId = faceReaction;
    }
}

void EnTa_Init(Actor* thisx, GlobalContext* globalCtx) {
    EnTa* this = THIS;
    GlobalContext* globalCtx2 = globalCtx;

    ActorShape_Init(&this->actor.shape, 0.0f, ActorShadow_DrawFunc_Circle, 36.0f);
    SkelAnime_InitFlex(globalCtx2, &this->skelAnime, &D_0600B7B8, &D_06001C94, this->limbDrawTable,
                       this->transitionDrawTable, 17);
    Collider_InitCylinder(globalCtx2, &this->collider);
    Collider_SetCylinder(globalCtx2, &this->collider, &this->actor, &sCylinderInit);

    this->actor.colChkInfo.mass = 0xFF;
    this->unk_2E0 = 0;
    this->unk_2CE = 0;
    this->unk_2E2 = 0;
    this->unk_2B6 = 20;
    this->unk_2B0 = func_80B166CC;
    Actor_SetScale(&this->actor, 0.01f);
    this->actor.unk_1F = 6;
    this->actor.velocity.y = -4.0f;
    this->actor.minVelocityY = -4.0f;
    this->actor.gravity = -1.0f;

    switch (this->actor.params) {
        case 1:
            osSyncPrintf(VT_FGCOL(CYAN) " 追放タロン \n" VT_RST);
            if (gSaveContext.eventChkInf[6] & 0x800) {
                Actor_Kill(&this->actor);
            } else if (LINK_IS_CHILD) {
                Actor_Kill(&this->actor);
            } else if (gSaveContext.eventChkInf[6] & 0x400) {
                func_80B13AA0(this, func_80B14CAC, func_80B167C0);
                this->unk_2B4 = 0;
                SkelAnime_ChangeAnimDefaultStop(&this->skelAnime, &D_06001C94);
                this->unk_2E4 = &D_06001C94;
            } else {
                func_80B13AA0(this, func_80B14754, func_80B167FC);
                this->unk_2B4 = 2;
                SkelAnime_ChangeAnimDefaultStop(&this->skelAnime, &D_0600CD50);
                this->unk_2E4 = &D_0600CD50;
                this->actor.shape.unk_10 = 54.0f;
            }
            break;
        case 2:
            osSyncPrintf(VT_FGCOL(CYAN) " 出戻りタロン \n" VT_RST);
            if (!(gSaveContext.eventChkInf[6] & 0x800)) {
                Actor_Kill(&this->actor);
            } else if (LINK_IS_CHILD) {
                Actor_Kill(&this->actor);
            } else if (globalCtx2->sceneNum == SCENE_MALON_STABLE && gSaveContext.nightFlag) {
                Actor_Kill(&this->actor);
                osSyncPrintf(VT_FGCOL(CYAN) " 夜はいない \n" VT_RST);
            } else {
                func_80B13AA0(this, func_80B14D98, func_80B167C0);
                this->unk_2B4 = 0;
                SkelAnime_ChangeAnimDefaultStop(&this->skelAnime, &D_06001C94);
                this->unk_2E4 = &D_06001C94;
            }
            break;
        default:
            osSyncPrintf(VT_FGCOL(CYAN) " その他のタロン \n" VT_RST);
            if (globalCtx2->sceneNum == SCENE_SPOT15) {
                if (gSaveContext.eventChkInf[1] & 0x10) {
                    Actor_Kill(&this->actor);
                } else if (gSaveContext.eventChkInf[1] & 0x8) {
                    func_80B13AA0(this, func_80B14C18, func_80B167C0);
                    this->unk_2B4 = 0;
                    SkelAnime_ChangeAnimDefaultStop(&this->skelAnime, &D_06001C94);
                    this->unk_2E4 = &D_06001C94;
                } else {
                    func_80B13AA0(this, func_80B14634, func_80B167FC);
                    this->unk_2B4 = 2;
                    SkelAnime_ChangeAnimDefaultStop(&this->skelAnime, &D_0600CD50);
                    this->unk_2E4 = &D_0600CD50;
                    this->actor.shape.unk_10 = 54.0f;
                }
            } else if (globalCtx2->sceneNum == SCENE_SOUKO) {
                osSyncPrintf(VT_FGCOL(CYAN) " ロンロン牧場の倉庫 の タロン\n" VT_RST);
                if (!(gSaveContext.eventChkInf[1] & 0x10)) {
                    Actor_Kill(&this->actor);
                } else if (LINK_IS_ADULT) {
                    Actor_Kill(&this->actor);
                } else {
                    if (!gSaveContext.nightFlag) {
                        this->actor.flags |= 0x10;
                        this->unk_2C4[0] = this->unk_2C4[1] = this->unk_2C4[2] = 7;
                        this->unk_2B8[0] = (EnNiw*)Actor_Spawn(
                            &globalCtx2->actorCtx, globalCtx2, ACTOR_EN_NIW, this->actor.posRot.pos.x + 5.0f,
                            this->actor.posRot.pos.y + 3.0f, this->actor.posRot.pos.z + 26.0f, 0, 0, 0, 0xD);
                        this->unk_2B8[1] = (EnNiw*)Actor_Spawn(
                            &globalCtx2->actorCtx, globalCtx2, ACTOR_EN_NIW, this->actor.posRot.pos.x - 20.0f,
                            this->actor.posRot.pos.y + 40.0f, this->actor.posRot.pos.z - 30.0f, 0, 0, 0, 0xD);
                        this->unk_2B8[2] = (EnNiw*)Actor_Spawn(
                            &globalCtx2->actorCtx, globalCtx2, ACTOR_EN_NIW, this->actor.posRot.pos.x + 20.0f,
                            this->actor.posRot.pos.y + 40.0f, this->actor.posRot.pos.z - 30.0f, 0, 0, 0, 0xD);
                        func_80B13AAC(this, globalCtx2);

                        if (gSaveContext.eventInf[0] & 0x400) {
                            func_80B13AA0(this, func_80B16608, func_80B16938);
                            SkelAnime_ChangeAnim(&this->skelAnime, &D_0600C48C, 1.0f,
                                                 SkelAnime_GetFrameCount(&D_0600C48C) - 1.0f,
                                                 SkelAnime_GetFrameCount(&D_0600C48C), 2, 0.0f);
                            gSaveContext.eventInf[0] &= ~0x400;
                        } else {
                            func_80B13AA0(this, func_80B16504, func_80B16854);
                            this->unk_2B4 = 0;
                            SkelAnime_ChangeAnimDefaultStop(&this->skelAnime, &D_060017E8);
                            this->unk_2E4 = &D_060017E8;
                        }
                    } else {
                        func_80B13AA0(this, func_80B146F8, func_80B167FC);
                        this->unk_2B4 = 2;
                        SkelAnime_ChangeAnimDefaultStop(&this->skelAnime, &D_0600CD50);
                        this->unk_2E4 = &D_0600CD50;
                        this->actor.shape.unk_10 = 54.0f;
                    }
                }
            } else {
                func_80B13AA0(this, func_80B14634, func_80B167FC);
                this->unk_2B4 = 2;
                SkelAnime_ChangeAnimDefaultStop(&this->skelAnime, &D_0600CD50);
                this->unk_2E4 = &D_0600CD50;
                this->actor.shape.unk_10 = 54.0f;
            }
            break;
    }
}

void func_80B14248(EnTa* this) {
    if (this->actor.shape.unk_10 > 36.0f) {
        this->actor.shape.unk_10 -= 0.8f;
    }
}

void EnTa_Destroy(Actor* thisx, GlobalContext* globalCtx) {
    EnTa* this = THIS;

    Collider_DestroyCylinder(globalCtx, &this->collider);

    if (this->actor.params != 1 && this->actor.params != 2 && globalCtx->sceneNum == SCENE_SOUKO) {
        gSaveContext.timer1State = 0;
    }

    if (this->unk_2E0 & 0x200) {
        func_800F5B58();
    }
}

s32 func_80B142F4(EnTa* this, GlobalContext* globalCtx, u16 textId) {
    if (func_8002F194(&this->actor, globalCtx)) {
        return true;
    }

    this->actor.textId = textId;

    if ((ABS((s16)(this->actor.yawTowardsLink - this->actor.shape.rot.y)) <= 0x4300) &&
        (this->actor.xzDistFromLink < 100.0f)) {
        this->unk_2E0 |= 1;
        func_8002F2CC(&this->actor, globalCtx, 100.0f);
    }
    return false;
}

void func_80B14398(EnTa* this, GlobalContext* globalCtx) {
    if (func_8002F334(&this->actor, globalCtx)) {
        func_80B13AA0(this, func_80B14754, func_80B167FC);
    }
}

void func_80B143D4(EnTa* this, GlobalContext* globalCtx) {
    if (func_8002F334(&this->actor, globalCtx)) {
        func_80B13AA0(this, func_80B146F8, func_80B167FC);
    }
}

void func_80B14410(EnTa* this) {
    if (LINK_IS_CHILD) {
        func_80B13AA0(this, func_80B14C18, func_80B167C0);
        gSaveContext.eventChkInf[1] |= 0x8;
    } else {
        func_80B13AA0(this, func_80B14CAC, func_80B167C0);
        gSaveContext.eventChkInf[6] |= 0x400;
    }
}

void func_80B1448C(EnTa* this, GlobalContext* globalCtx) {
    if (func_8002F334(&this->actor, globalCtx)) {
        func_80B14410(this);
    }
    func_80B14248(this);
    this->unk_2E0 |= 0x4;
}

void func_80B144D8(EnTa* this, GlobalContext* globalCtx) {
    if (func_8002F334(&this->actor, globalCtx)) {
        func_80B14410(this);
        this->unk_2B6 = 1;
        this->unk_2B0 = func_80B16700;
    }
    if (func_8010BDBC(&globalCtx->msgCtx) == 6) {
        this->unk_2B4 = 1;
        func_80B13AA0(this, func_80B1448C, func_80B167C0);
    }
    func_80B14248(this);
    this->unk_2E0 |= 4;
}

void func_80B14570(EnTa* this, GlobalContext* globalCtx) {
    this->unk_2E0 |= 4;

    if (this->unk_2CC == 0) {
        func_80B13AA0(this, func_80B144D8, func_80B167C0);
        this->unk_2CE = 3;
        this->unk_2CC = 60;
        SkelAnime_ChangeAnimDefaultStop(&this->skelAnime, &D_0600E3D8);
        this->unk_2E4 = &D_06001C94;
        Audio_PlayActorSound2(&this->actor, NA_SE_VO_TA_SURPRISE);
    }
}

void func_80B145F8(EnTa* this, GlobalContext* globalCtx) {
    if (func_8002F334(&this->actor, globalCtx)) {
        func_80B13AA0(this, func_80B14634, func_80B167FC);
    }
}

void func_80B14634(EnTa* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;

    if (func_8002F194(&this->actor, globalCtx)) {
        s32 exchangeItemId = func_8002F368(globalCtx);

        switch (exchangeItemId) {
            case EXCH_ITEM_CHICKEN:
                player->actor.textId = 0x702B;
                func_80B13AA0(this, func_80B14570, func_80B167C0);
                this->unk_2CC = 40;
                break;
            default:
                if (exchangeItemId != EXCH_ITEM_NONE) {
                    player->actor.textId = 0x702A;
                }
                func_80B13AA0(this, func_80B145F8, func_80B167FC);
                break;
        }
    } else {
        this->actor.textId = 0x702A;
        func_8002F298(&this->actor, globalCtx, 100.0f, 3);
    }
}

void func_80B146F8(EnTa* this, GlobalContext* globalCtx) {
    if (func_8002F194(&this->actor, globalCtx)) {
        func_80B13AA0(this, func_80B143D4, func_80B167FC);
    }
    this->actor.textId = 0x204B;
    func_8002F2CC(&this->actor, globalCtx, 100.0f);
}

void func_80B14754(EnTa* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;

    if (func_8002F194(&this->actor, globalCtx) != 0) {
        s32 exchangeItemId = func_8002F368(globalCtx);

        switch (exchangeItemId) {
            case EXCH_ITEM_POCKET_CUCCO:
                player->actor.textId = 0x702B;
                func_80B13AA0(this, func_80B14570, func_80B167C0);
                this->unk_2CC = 40;
                break;
            default:
                if (exchangeItemId != EXCH_ITEM_NONE) {
                    player->actor.textId = 0x5015;
                }
                func_80B13AA0(this, func_80B14398, func_80B167FC);
                break;
        }
    } else {
        this->actor.textId = 0x5015;
        func_8002F298(&this->actor, globalCtx, 100.0f, 6);
    }
}

void func_80B14818(EnTa* this, GlobalContext* globalCtx) {
    s32 framesMod12 = (s32)globalCtx->state.frames % 12;

    if (framesMod12 == 0 || framesMod12 == 6) {
        Audio_PlayActorSound2(&this->actor, NA_SE_PL_WALK_GROUND);
    }
    if (this->actor.speedXZ < 6.0f) {
        this->actor.speedXZ += 0.4f;
    }
    Actor_MoveForward(&this->actor);
}

void func_80B14898(EnTa* this, GlobalContext* globalCtx) {
    func_80033480(globalCtx, &this->actor.posRot.pos, 50.0f, 2, 250, 20, 1);
    func_80B14818(this, globalCtx);

    if (this->unk_2CC == 0) {
        Actor_Kill(&this->actor);
    }
}

void func_80B1490C(EnTa* this, GlobalContext* globalCtx) {
    this->actor.posRot.rot.y += 0xC00;
    this->actor.shape.rot.y += 0xC00;

    if (this->unk_2CC == 0) {
        func_80B13AA0(this, func_80B14898, func_80B167C0);
        this->unk_2CC = 60;
    }
}

void func_80B1496C(EnTa* this, GlobalContext* globalCtx) {
    func_80033480(globalCtx, &this->actor.posRot.pos, 50.0f, 2, 250, 20, 1);
    func_80B14818(this, globalCtx);

    if (this->unk_2CC == 0) {
        func_80B13AA0(this, func_80B1490C, func_80B167C0);
        this->unk_2CC = 5;
    }
}

void func_80B149F4(EnTa* this, GlobalContext* globalCtx) {
    this->actor.posRot.rot.y -= 0xD00;
    this->actor.shape.rot.y -= 0xD00;

    if (this->unk_2CC == 0) {
        func_80B13AA0(this, func_80B1496C, func_80B167C0);
        this->unk_2CC = 65;
    }
}

void func_80B14A54(EnTa* this, GlobalContext* globalCtx) {
    func_80033480(globalCtx, &this->actor.posRot.pos, 50.0f, 2, 250, 20, 1);
    func_80B14818(this, globalCtx);

    if (this->unk_2CC == 20) {
        func_80106CCC(globalCtx);
    }
    if (this->unk_2CC == 0) {
        this->unk_2CC = 5;
        func_80B13AA0(this, func_80B149F4, func_80B167C0);
    }
}

void func_80B14AF4(EnTa* this, GlobalContext* globalCtx) {
    this->actor.posRot.rot.y -= 0xC00;
    this->actor.shape.rot.y -= 0xC00;

    if (this->unk_2CC == 0) {
        Audio_PlayActorSound2(&this->actor, NA_SE_VO_TA_CRY_1);
        func_80B13AA0(this, func_80B14A54, func_80B167C0);
        this->unk_2CC = 65;
        this->actor.flags |= 0x10;
    }
}

void func_80B14B6C(EnTa* this, GlobalContext* globalCtx) {
    if (func_8010BDBC(&globalCtx->msgCtx) == 5) {
        func_800800F8(globalCtx, 0x104F, -0x63, &this->actor, 0);
        func_80B13AA0(this, func_80B14AF4, func_80B167C0);
        this->unk_2CC = 5;
        gSaveContext.eventChkInf[1] |= 0x10;
        SkelAnime_ChangeAnimDefaultStop(&this->skelAnime, &D_0600CF28);
        this->unk_2E4 = &D_0600C858;
    }
    this->unk_2E0 |= 1;
}

void func_80B14C18(EnTa* this, GlobalContext* globalCtx) {
    if (func_80B142F4(this, globalCtx, 0x702C)) {
        func_80B13AA0(this, func_80B14B6C, func_80B167C0);
    }
    func_80B14248(this);
}

void func_80B14C60(EnTa* this, GlobalContext* globalCtx) {
    if (func_8002F334(&this->actor, globalCtx)) {
        func_80B13AA0(this, func_80B14CAC, func_80B167C0);
    }
    this->unk_2E0 |= 1;
}

void func_80B14CAC(EnTa* this, GlobalContext* globalCtx) {
    if (gSaveContext.eventChkInf[1] & 0x100) {
        if (func_80B142F4(this, globalCtx, 0x5017)) {
            func_80B13AA0(this, func_80B14C60, func_80B167C0);
            gSaveContext.eventChkInf[6] |= 0x800;
        }
    } else if (func_80B142F4(this, globalCtx, 0x5016)) {
        func_80B13AA0(this, func_80B14C60, func_80B167C0);
    }
    func_80B14248(this);
}

void func_80B14D4C(EnTa* this, GlobalContext* globalCtx) {
    if (func_8002F334(&this->actor, globalCtx)) {
        func_80B13AA0(this, func_80B14D98, func_80B167C0);
    }
    this->unk_2E0 |= 1;
}

void func_80B14D98(EnTa* this, GlobalContext* globalCtx) {
    if (func_80B142F4(this, globalCtx, 0x2055)) {
        func_80B13AA0(this, func_80B14D4C, func_80B167C0);
    }
}

s32 func_80B14DD8(void) {
    if (gSaveContext.rupees < 30) {
        return 0;
    } else if (!Inventory_HasEmptyBottle()) {
        return 1;
    } else {
        return 2;
    }
}

void func_80B14E28(EnTa* this, GlobalContext* globalCtx) {
    Vec3f b;
    Vec3f a;

    this->unk_2D0 = Gameplay_CreateSubCamera(globalCtx);
    this->unk_2D2 = globalCtx->activeCamera;
    Gameplay_ChangeCameraStatus(globalCtx, this->unk_2D2, 1);
    Gameplay_ChangeCameraStatus(globalCtx, this->unk_2D0, 7);

    b.x = 1053.0f;
    b.y = 11.0f;
    b.z = 22.0f;

    a.x = 1053.0f;
    a.y = 45.0f;
    a.z = -40.0f;

    Gameplay_CameraSetAtEye(globalCtx, this->unk_2D0, &a, &b);
}

void func_80B14EDC(EnTa* this, GlobalContext* globalCtx) {
    Gameplay_ChangeCameraStatus(globalCtx, this->unk_2D2, 7);
    Gameplay_ClearCamera(globalCtx, this->unk_2D0);
}

void func_80B14F20(EnTa* this, EnTaActionFunc arg1) {
    func_80B13AA0(this, arg1, func_80B16854);
    this->unk_2B4 = 2;
    SkelAnime_ChangeAnim(&this->skelAnime, &D_060017E8, 1.0f, 0.0f, SkelAnime_GetFrameCount(&D_060017E8), 2, -5.0f);
    this->unk_2E2 = 0;
    this->unk_2E4 = &D_060017E8;
}

void func_80B14FAC(EnTa* this, EnTaActionFunc arg1) {
    this->unk_2B4 = 1;
    func_80B13AA0(this, arg1, func_80B16938);
    this->unk_2E0 &= ~0x10;
    SkelAnime_ChangeAnim(&this->skelAnime, &D_0600C48C, 1.0f, 0.0f, SkelAnime_GetFrameCount(&D_0600C48C), 2, -5.0f);
}

void func_80B15034(EnTa* this, GlobalContext* globalCtx) {
    if ((func_8010BDBC(&globalCtx->msgCtx) == 5) && (func_80106BC8(globalCtx) != 0)) {
        func_80106CCC(globalCtx);
        func_80B14F20(this, func_80B16504);
        func_80B13AAC(this, globalCtx);
    }
    this->unk_2E0 |= 1;
}

s32 func_80B150AC(EnTa* this, GlobalContext* globalCtx, s32 idx) {
    Player* player = PLAYER;
    Actor* interactRangeActor;

    if (player->stateFlags1 & 0x800) {
        interactRangeActor = player->interactRangeActor;
        if (interactRangeActor != NULL && interactRangeActor->id == ACTOR_EN_NIW &&
            interactRangeActor == &this->unk_2B8[idx]->actor) {
            return true;
        }
    }
    return false;
}

void func_80B15100(EnTa* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;

    if ((func_8010BDBC(&globalCtx->msgCtx) == 5) && (func_80106BC8(globalCtx) != 0)) {
        s32 unk_2CA;

        SkelAnime_ChangeAnim(&this->skelAnime, &D_0600C48C, 1.0f, SkelAnime_GetFrameCount(&D_0600C48C) - 1.0f,
                             SkelAnime_GetFrameCount(&D_0600C48C), 2, 10.0f);
        this->unk_2E0 &= ~0x10;
        func_80106CCC(globalCtx);
        unk_2CA = this->unk_2CA;
        this->unk_25C = func_80B154FC;
        this->unk_2B8[unk_2CA]->actor.gravity = 0.1f;
        this->unk_2B8[unk_2CA]->actor.velocity.y = 0.0f;
        this->unk_2B8[unk_2CA]->actor.speedXZ = 0.0f;
        this->unk_2B8[unk_2CA]->actor.parent = NULL;

        if (player->interactRangeActor == &this->unk_2B8[unk_2CA]->actor) {
            player->interactRangeActor = NULL;
        }
        if (player->heldActor == &this->unk_2B8[unk_2CA]->actor) {
            player->heldActor = NULL;
        }
        player->stateFlags1 &= ~0x800;
        this->unk_2B8[unk_2CA] = NULL;
    }
    this->unk_2E0 |= 1;
}

void func_80B15260(EnTa* this, GlobalContext* globalCtx) {
    if (func_8002F194(&this->actor, globalCtx)) {
        this->unk_25C = func_80B15100;
        this->actor.flags &= ~0x10000;
    } else {
        func_8002F2CC(&this->actor, globalCtx, 1000.0f);
    }
    this->unk_2E0 |= 1;
}

s32 func_80B152D0(EnTa* this, GlobalContext* globalCtx) {
    s32 ct;
    s32 i;

    for (ct = 0, i = 0; i < ARRAY_COUNT(this->unk_2B8); i++) {
        if (this->unk_2B8[i] != NULL) {
            ct++;
        }
    }
    return ct;
}

void func_80B15308(EnTa* this) {
    if (this->unk_2E0 & 0x10) {
        if (this->unk_2E0 & 0x100) {
            SkelAnime_ChangeAnim(&this->skelAnime, &D_0600BF38, 1.0f, 17.0f, 22.0f, 2, 0.0f);
            this->unk_2E0 &= ~0x100;
        } else {
            SkelAnime_ChangeAnim(&this->skelAnime, &D_0600BF38, -1.0f, 21.0f, 16.0f, 2, 3.0f);
            this->unk_2E0 |= 0x100;
        }
        this->unk_2E0 &= ~0x10;
    }
}

void func_80B153D4(EnTa* this, GlobalContext* globalCtx) {
    func_80B15308(this);

    if (this->unk_2CC == 0) {
        if (this->unk_2E0 & 0x80) {
            this->unk_2E0 &= ~0x80;
            func_80B14EDC(this, globalCtx);
        }
    }
}

void func_80B15424(EnTa* this, GlobalContext* globalCtx) {
    func_80B15308(this);

    if ((func_8010BDBC(&globalCtx->msgCtx) == 5) && (func_80106BC8(globalCtx) != 0)) {
        globalCtx->nextEntranceIndex = 0x5E4;

        if (gSaveContext.eventInf[0] & 0x100) {
            globalCtx->fadeTransition = 46;
            gSaveContext.nextTransition = 3;
        } else {
            globalCtx->fadeTransition = 38;
            gSaveContext.nextTransition = 2;
        }

        globalCtx->sceneLoadFlag = 0x14;
        gSaveContext.eventInf[0] |= 0x400;
        this->unk_25C = func_80B153D4;
        this->unk_2CC = 22;
    }
}

void func_80B154FC(EnTa* this, GlobalContext* globalCtx) {
    s32 i;

    for (i = 0; i < ARRAY_COUNT(this->unk_2B8); i++) {
        if (this->unk_2B8[i] != NULL) {
            if (this->unk_2B8[i]->actor.gravity > -2.0f) {
                this->unk_2B8[i]->actor.gravity -= 0.03f;
            }

            if (func_80B150AC(this, globalCtx, i)) {
                if (this->unk_2C4[i] > 0) {
                    this->unk_2C4[i]--;
                } else {
                    this->unk_2CA = i;
                    SkelAnime_ChangeAnim(&this->skelAnime, &D_0600BF38, 1.0f, 8.0f, 29.0f, 2, -10.0f);
                    this->unk_2E0 &= ~0x10;

                    switch (func_80B152D0(this, globalCtx)) {
                        case 1:
                            gSaveContext.timer1State = 0;
                            func_8002DF54(globalCtx, &this->actor, 1);
                            func_8010B680(globalCtx, 0x2084, &this->actor);
                            this->unk_25C = func_80B15424;
                            SkelAnime_ChangeAnim(&this->skelAnime, &D_0600BF38, 1.0f, 8.0f, 29.0f, 2, -10.0f);
                            this->unk_2E0 &= ~0x10;
                            this->unk_2E0 &= ~0x100;
                            gSaveContext.eventInf[0] |= 0x100;
                            Audio_SetBGM(NA_BGM_STOP);
                            this->unk_2E0 &= ~0x200;
                            func_800F5C64(0x39);
                            return;
                        case 2:
                            this->actor.textId = 0x2083;
                            Audio_PlayActorSound2(&this->actor, NA_SE_VO_TA_CRY_1);
                            break;
                        case 3:
                            this->actor.textId = 0x2082;
                            Audio_PlayActorSound2(&this->actor, NA_SE_VO_TA_SURPRISE);
                            break;
                    }
                    this->unk_25C = func_80B15260;
                    this->actor.flags |= 0x10000;
                    func_8002F2CC(&this->actor, globalCtx, 1000.0f);
                    return;
                }
            } else {
                this->unk_2C4[i] = 7;
            }
        }
    }

    if (gSaveContext.timer1Value == 10) {
        func_800F5918();
    }

    if (gSaveContext.timer1Value == 0 && !Gameplay_InCsMode(globalCtx)) {
        Audio_SetBGM(NA_BGM_STOP);
        this->unk_2E0 &= ~0x200;
        func_80078884(NA_SE_SY_FOUND);
        gSaveContext.timer1State = 0;
        func_8002DF54(globalCtx, &this->actor, 1);
        func_8010B680(globalCtx, 0x2081, &this->actor);
        this->unk_25C = func_80B15424;
        func_80B14E28(this, globalCtx);
        gSaveContext.eventInf[0] &= ~0x100;
        this->unk_2E0 |= 0x80;
        SkelAnime_ChangeAnim(&this->skelAnime, &D_0600BF38, 1.0f, 8.0f, 29.0f, 2, -10.0f);
        this->unk_2E0 &= ~0x10;
        this->unk_2E0 &= ~0x100;
    }

    this->unk_2E0 |= 1;
}

void func_80B1585C(EnTa* this, GlobalContext* globalCtx) {
    s32 i;

    if (this->unk_2CC > 35) {
        for (i = 1; i < ARRAY_COUNT(this->unk_2B8); i++) {
            if (this->unk_2B8[i] != NULL) {
                Math_SmoothScaleMaxMinS(&this->unk_2B8[i]->actor.posRot.rot.y, i * -10000 - 3000, 2, 0x800, 0x100);
                this->unk_2B8[i]->actor.shape.rot.y = this->unk_2B8[i]->actor.posRot.rot.y;
            }
        }
    } else if (this->unk_2CC == 35) {
        for (i = 0; i < ARRAY_COUNT(this->unk_2B8); i++) {
            this->unk_2C4[i] = (s32)(Math_Rand_CenteredFloat(6.0f) + 10.0f);

            if (this->unk_2B8[i] != NULL) {
                EnNiw* niw = this->unk_2B8[i];
                niw->unk_308 = 1;
                niw->actor.gravity = 0.0f;
            }
        }
    } else {
        for (i = 0; i < ARRAY_COUNT(this->unk_2B8); i++) {
            if (this->unk_2CC < 35 - this->unk_2C4[i]) {
                if (this->unk_2B8[i] != NULL) {
                    if (this->unk_2B8[i]->actor.gravity > -2.0f) {
                        this->unk_2B8[i]->actor.gravity -= 0.03f;
                    }
                }
            }
        }
    }

    if (this->unk_2CC == 0) {
        func_80B13AA0(this, func_80B154FC, func_80B16938);
        this->unk_2E0 &= ~0x10;
        SkelAnime_ChangeAnim(&this->skelAnime, &D_0600C48C, 1.0f, SkelAnime_GetFrameCount(&D_0600C48C) - 1.0f,
                             SkelAnime_GetFrameCount(&D_0600C48C), 2, 10.0f);
        func_8002DF54(globalCtx, &this->actor, 7);
    }
}

void func_80B15AD4(EnTa* this, GlobalContext* globalCtx) {
    if (this->unk_2CC == 0 && this->unk_2E0 & 0x20) {
        func_80B13AA0(this, func_80B1585C, func_80B16938);
        this->unk_2E0 &= ~0x10;
        SkelAnime_ChangeAnim(&this->skelAnime, &D_0600BF38, 1.0f, 1.0f, SkelAnime_GetFrameCount(&D_0600BF38), 2, 0.0f);
        this->unk_2CC = 50;
        func_80088B34(0x1E);
        func_800F5ACC(0x6C);
        this->unk_2E0 |= 0x200;
        func_80106CCC(globalCtx);
        func_8002DF54(globalCtx, &this->actor, 1);
    }

    if ((func_8010BDBC(&globalCtx->msgCtx) == 5) && (func_80106BC8(globalCtx) != 0)) {
        this->unk_2E0 |= 0x20;
    }

    this->unk_2E0 |= 1;
}

void func_80B15BF8(EnTa* this, GlobalContext* globalCtx) {
    if (this->unk_2E0 & 0x10) {
        func_80B13AA0(this, func_80B15AD4, func_80B16938);
        this->unk_2E0 &= ~0x10;
        SkelAnime_ChangeAnim(&this->skelAnime, &D_0600BF38, 1.0f, 0.0f, 1.0f, 2, 0.0f);
        this->unk_2CC = 5;
    }
    if ((func_8010BDBC(&globalCtx->msgCtx) == 5) && (func_80106BC8(globalCtx) != 0)) {
        this->unk_2E0 |= 0x20;
    }
    this->unk_2E0 |= 1;
}

void func_80B15CC8(EnTa* this, GlobalContext* globalCtx) {
    if (this->unk_2E0 & 0x10) {
        func_80B13AA0(this, func_80B15BF8, func_80B16938);
        this->unk_2E0 &= ~0x10;
        SkelAnime_ChangeAnim(&this->skelAnime, &D_0600BF38, -1.0f, 29.0f, 0.0f, 2, 10.0f);
    }
    if ((func_8010BDBC(&globalCtx->msgCtx) == 5) && (func_80106BC8(globalCtx) != 0)) {
        this->unk_2E0 |= 0x20;
    }
    this->unk_2E0 |= 1;
}

void func_80B15D90(EnTa* this, GlobalContext* globalCtx) {
    func_80B13AA0(this, func_80B15CC8, func_80B16938);
    this->unk_2E0 &= ~0x10;
    SkelAnime_ChangeAnim(&this->skelAnime, &D_0600BF38, 1.0f, 8.0f, 29.0f, 2, -10.0f);
    func_8010B720(globalCtx, 0x2080);
    this->unk_2E0 &= ~0x20;
}

void func_80B15E28(EnTa* this, GlobalContext* globalCtx) {
    if (func_8002F334(&this->actor, globalCtx)) {
        func_80B14F20(this, func_80B16504);
        func_80B13AAC(this, globalCtx);
    }
    this->unk_2E0 |= 1;
}

void func_80B15E80(EnTa* this, GlobalContext* globalCtx) {
    if (Actor_HasParent(&this->actor, globalCtx)) {
        this->actor.parent = NULL;
        this->unk_25C = func_80B15E28;
        if (!(this->unk_2E0 & 0x2)) {
            gSaveContext.itemGetInf[0] |= 4;
        }
        this->unk_2E0 &= ~0x2;
    } else if (this->unk_2E0 & 2) {
        func_8002F434(&this->actor, globalCtx, GI_MILK, 10000.0f, 50.0f);
    } else {
        func_8002F434(&this->actor, globalCtx, GI_MILK_BOTTLE, 10000.0f, 50.0f);
    }
    this->unk_2E0 |= 1;
}

void func_80B15F54(EnTa* this, GlobalContext* globalCtx) {
    if ((func_8010BDBC(&globalCtx->msgCtx) == 5) && (func_80106BC8(globalCtx) != 0)) {
        func_80106CCC(globalCtx);
        this->unk_2E0 &= ~0x2;
        func_80B13AA0(this, func_80B15E80, func_80B16938);
        func_8002F434(&this->actor, globalCtx, GI_MILK_BOTTLE, 10000.0f, 50.0f);
    }
}

void func_80B15FE8(EnTa* this, GlobalContext* globalCtx) {
    if ((func_8010BDBC(&globalCtx->msgCtx) == 4) && (func_80106BC8(globalCtx) != 0)) {
        switch (globalCtx->msgCtx.choiceIndex) {
            case 0:
                switch (func_80B14DD8()) {
                    case 0:
                        func_8010B720(globalCtx, 0x85);
                        func_80B13AA0(this, func_80B15034, func_80B16938);
                        break;
                    case 1:
                        func_8010B720(globalCtx, 0x208A);
                        func_80B13AA0(this, func_80B15E28, func_80B16938);
                        break;
                    case 2:
                        this->unk_2E0 |= 2;
                        func_80B13AA0(this, func_80B15E80, func_80B16938);
                        Rupees_ChangeBy(-30);
                        func_8002F434(&this->actor, globalCtx, GI_MILK, 10000.0f, 50.0f);
                        break;
                }
                break;
            case 1:
                if (gSaveContext.rupees < 10) {
                    func_8010B720(globalCtx, 0x85);
                    func_80B13AA0(this, func_80B15034, func_80B16938);
                } else {
                    Rupees_ChangeBy(-10);
                    func_80B15D90(this, globalCtx);
                }
                break;
            case 2:
                func_80B14F20(this, func_80B16504);
                func_80B13AAC(this, globalCtx);
                break;
        }
    }

    if (this->unk_2E0 & 0x10) {
        this->unk_2E0 |= 1;
    }
}

void func_80B161C0(EnTa* this, GlobalContext* globalCtx) {
    s32 price;

    if (this->actor.textId == 0x2085) {
        price = 5;
    } else {
        price = 10;
    }

    if (func_8010BDBC(&globalCtx->msgCtx) == 4) {
        if (func_80106BC8(globalCtx) != 0) {
            switch (globalCtx->msgCtx.choiceIndex) {
                case 0:
                    if (gSaveContext.rupees < price) {
                        func_8010B720(globalCtx, 0x85);
                        func_80B13AA0(this, func_80B15034, func_80B16938);
                    } else {
                        Rupees_ChangeBy(-price);
                        func_80B15D90(this, globalCtx);
                    }
                    break;
                case 1:
                    func_80B14F20(this, func_80B16504);
                    func_80B13AAC(this, globalCtx);
                    break;
            }
        }
    }

    if (this->unk_2E0 & 0x10) {
        this->unk_2E0 |= 1;
    }
}

void func_80B162E8(EnTa* this, GlobalContext* globalCtx) {
    if ((func_8010BDBC(&globalCtx->msgCtx) == 4) && (func_80106BC8(globalCtx) != 0)) {
        func_8010B720(globalCtx, 0x2087);
        func_80B13AA0(this, func_80B15F54, func_80B16938);
    }

    if (this->unk_2E0 & 0x10) {
        this->unk_2E0 |= 1;
    }
}

void func_80B16364(EnTa* this, GlobalContext* globalCtx) {
    if ((func_8010BDBC(&globalCtx->msgCtx) == 5) && (func_80106BC8(globalCtx) != 0)) {
        gSaveContext.infTable[7] |= 0x4000;
        if (gSaveContext.itemGetInf[0] & 4) {
            func_8010B720(globalCtx, 0x208B);
            func_80B13AA0(this, func_80B15FE8, func_80B16938);
        } else {
            func_8010B720(globalCtx, 0x207F);
            func_80B13AA0(this, func_80B161C0, func_80B16938);
        }
    }

    if (this->unk_2E0 & 0x10) {
        this->unk_2E0 |= 1;
    }
}

void func_80B1642C(EnTa* this, GlobalContext* globalCtx) {
    if ((func_8010BDBC(&globalCtx->msgCtx) == 5) && (func_80106BC8(globalCtx) != 0)) {
        if (Inventory_HasEmptyBottle()) {
            func_80106CCC(globalCtx);
            this->unk_2E0 |= 2;
            func_80B13AA0(this, func_80B15E80, func_80B16938);
            func_8002F434(&this->actor, globalCtx, GI_MILK, 10000.0f, 50.0f);
        } else {
            func_8010B720(globalCtx, 0x208A);
            func_80B13AA0(this, func_80B15E28, func_80B16938);
        }
    }
}

void func_80B16504(EnTa* this, GlobalContext* globalCtx) {
    u16 faceReaction = Text_GetFaceReaction(globalCtx, 0x18);

    func_80B13AAC(this, globalCtx);

    if (func_80B142F4(this, globalCtx, this->actor.textId)) {
        Audio_PlayActorSound2(&this->actor, NA_SE_VO_TA_SURPRISE);

        if (faceReaction != 0) {
            func_80B14FAC(this, func_80B15E28);
        } else {
            gSaveContext.infTable[7] |= 0x4000;

            switch (this->actor.textId) {
                case 0x207E:
                case 0x207F:
                    func_80B14FAC(this, func_80B161C0);
                    break;
                case 0x208B:
                    func_80B14FAC(this, func_80B15FE8);
                    break;
                default:
                    func_80B14FAC(this, func_80B16364);
                    break;
            }
        }
    }
    this->unk_2E0 &= ~1;
}

void func_80B16608(EnTa* this, GlobalContext* globalCtx) {
    if (func_8002F194(&this->actor, globalCtx)) {
        switch (this->actor.textId) {
            case 0x2085:
                this->unk_25C = func_80B161C0;
                break;
            case 0x2086:
                this->unk_25C = func_80B162E8;
                break;
            case 0x2088:
                this->unk_25C = func_80B1642C;
                break;
        }
        this->actor.flags &= ~0x10000;
    } else {
        this->actor.flags |= 0x10000;
        func_8002F2CC(&this->actor, globalCtx, 1000.0f);
    }
    this->unk_2E0 |= 1;
}

void func_80B166CC(EnTa* this) {
    s16 temp_v0 = this->unk_2B6 - 1;

    if (temp_v0 != 0) {
        this->unk_2B6 = temp_v0;
    } else {
        this->unk_2B0 = func_80B16700;
    }
}

void func_80B16700(EnTa* this) {
    s16 temp2B6 = this->unk_2B6 - 1;

    if (temp2B6 != 0) {
        this->unk_2B6 = temp2B6;
    } else {
        s16 temp2B4 = this->unk_2B4 + 1;
        s16 temp2B6 = 3;

        if (temp2B4 >= temp2B6) {
            this->unk_2B4 = 0;
            if (this->unk_2CE > 0) {
                this->unk_2CE--;
                temp2B6 = 1;
            } else {
                temp2B6 = (s32)(Math_Rand_ZeroOne() * 60.0f) + 20;
            }
            this->unk_2B6 = temp2B6;
            this->unk_2B0 = func_80B166CC;
        } else {
            this->unk_2B4 = temp2B4;
            this->unk_2B6 = 1;
        }
    }
}

void func_80B167C0(EnTa* this) {
    if (SkelAnime_FrameUpdateMatrix(&this->skelAnime)) {
        SkelAnime_ChangeAnimDefaultStop(&this->skelAnime, this->unk_2E4);
    }
}

void func_80B167FC(EnTa* this) {
    if (SkelAnime_FrameUpdateMatrix(&this->skelAnime)) {
        SkelAnime_ChangeAnimDefaultStop(&this->skelAnime, this->unk_2E4);
        Audio_PlayActorSound2(&this->actor, NA_SE_VO_TA_SLEEP);
    }
    this->unk_2E0 |= 0xC;
}

void func_80B16854(EnTa* this) {
    if (this->unk_2E2 > 0) {
        this->unk_2E2--;
    } else {
        if (SkelAnime_FrameUpdateMatrix(&this->skelAnime)) {
            SkelAnime_ChangeAnimDefaultStop(&this->skelAnime, this->unk_2E4);
            this->unk_2E2 = Math_Rand_ZeroFloat(100.0f) + 100.0f;
        }

        if (this->skelAnime.animCurrentFrame < 96.0f && this->skelAnime.animCurrentFrame >= 53.0f) {
            this->unk_2B4 = 1;
        } else {
            this->unk_2B4 = 2;
        }
        this->unk_2E0 |= 8;
    }
    this->unk_2E0 |= 4;
}

void func_80B16938(EnTa* this) {
    if (!(this->unk_2E0 & 0x10)) {
        if (SkelAnime_FrameUpdateMatrix(&this->skelAnime)) {
            this->unk_2E0 |= 0x10;
        }
        this->unk_2E0 |= 8;
    }
}

void EnTa_Update(Actor* thisx, GlobalContext* globalCtx) {
    EnTa* this = THIS;
    s32 pad;

    Collider_CylinderUpdate(&this->actor, &this->collider);
    CollisionCheck_SetOC(globalCtx, &globalCtx->colChkCtx, &this->collider.base);
    Actor_MoveForward(&this->actor);
    func_8002E4B4(globalCtx, &this->actor, 0.0f, 0.0f, 0.0f, 4);
    this->unk_260(this);
    this->unk_25C(this, globalCtx);

    if (!(this->unk_2E0 & 4)) {
        this->unk_2B0(this);
    }

    if (this->unk_2E0 & 1) {
        func_80038290(globalCtx, &this->actor, &this->unk_2D4, &this->unk_2DA, this->actor.posRot2.pos);
    } else {
        Math_SmoothScaleMaxMinS(&this->unk_2D4.x, 0, 6, 6200, 100);
        Math_SmoothScaleMaxMinS(&this->unk_2D4.y, 0, 6, 6200, 100);
        Math_SmoothScaleMaxMinS(&this->unk_2DA.x, 0, 6, 6200, 100);
        Math_SmoothScaleMaxMinS(&this->unk_2DA.y, 0, 6, 6200, 100);
    }

    this->unk_2E0 &= ~0x5;

    if (this->unk_2CC > 0) {
        this->unk_2CC--;
    }
}

s32 EnTa_OverrideLimbDraw(GlobalContext* globalCtx, s32 limbIndex, Gfx** dList, Vec3f* pos, Vec3s* rot, void* thisx) {
    EnTa* this = THIS;

    switch (limbIndex) {
        case 8:
            rot->x += this->unk_2DA.y;
            rot->y -= this->unk_2DA.x;
            break;
        case 15:
            rot->x += this->unk_2D4.y;
            rot->z += this->unk_2D4.x;
            break;
    }

    if (this->unk_2E0 & 0x8) {
        this->unk_2E0 &= ~0x8;
    } else if ((limbIndex == 8) || (limbIndex == 10) || (limbIndex == 13)) {
        s32 limbIdx50 = limbIndex * 50;
        rot->y += Math_Sins(globalCtx->state.frames * (limbIdx50 + 0x814)) * 200.0f;
        rot->z += Math_Coss(globalCtx->state.frames * (limbIdx50 + 0x940)) * 200.0f;
    }

    return 0;
}

void EnTa_PostLimbDraw(GlobalContext* globalCtx, s32 limbIndex, Gfx** dList, Vec3s* rot, void* thisx) {
    EnTa* this = THIS;

    if (limbIndex == 15) {
        Matrix_MultVec3f(&D_80B16E7C, &this->actor.posRot2.pos);
    }
}

void EnTa_Draw(Actor* thisx, GlobalContext* globalCtx) {
    EnTa* this = THIS;
    s32 pad;

    OPEN_DISPS(globalCtx->state.gfxCtx, "../z_en_ta.c", 2381);

    func_800943C8(globalCtx->state.gfxCtx);

    gSPSegment(POLY_OPA_DISP++, 0x8, SEGMENTED_TO_VIRTUAL(D_80B16E88[this->unk_2B4]));
    gSPSegment(POLY_OPA_DISP++, 0x9, SEGMENTED_TO_VIRTUAL(&D_06006DC0));

    SkelAnime_DrawFlexOpa(globalCtx, this->skelAnime.skeleton, this->skelAnime.limbDrawTbl, this->skelAnime.dListCount,
                          EnTa_OverrideLimbDraw, EnTa_PostLimbDraw, this);

    CLOSE_DISPS(globalCtx->state.gfxCtx, "../z_en_ta.c", 2400);
}
