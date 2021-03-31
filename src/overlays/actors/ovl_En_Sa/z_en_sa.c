#include "z_en_sa.h"
#include "overlays/actors/ovl_En_Elf/z_en_elf.h"

#define FLAGS 0x02000019

#define THIS ((EnSa*)thisx)

void EnSa_Init(Actor* thisx, GlobalContext* globalCtx);
void EnSa_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnSa_Update(Actor* thisx, GlobalContext* globalCtx);
void EnSa_Draw(Actor* thisx, GlobalContext* globalCtx);

void func_80AF6448(EnSa* this, GlobalContext* globalCtx);
void func_80AF67D0(EnSa* this, GlobalContext* globalCtx);
void func_80AF683C(EnSa* this, GlobalContext* globalCtx);
void func_80AF68E4(EnSa* this, GlobalContext* globalCtx);
void func_80AF6B20(EnSa* this, GlobalContext* globalCtx);

const ActorInit En_Sa_InitVars = {
    ACTOR_EN_SA,
    ACTORCAT_NPC,
    FLAGS,
    OBJECT_SA,
    sizeof(EnSa),
    (ActorFunc)EnSa_Init,
    (ActorFunc)EnSa_Destroy,
    (ActorFunc)EnSa_Update,
    (ActorFunc)EnSa_Draw,
};

static ColliderCylinderInit sCylinderInit = {
    {
        COLTYPE_NONE,
        AT_NONE,
        AC_NONE,
        OC1_ON | OC1_TYPE_ALL,
        OC2_TYPE_2,
        COLSHAPE_CYLINDER,
    },
    {
        ELEMTYPE_UNK0,
        { 0x00000000, 0x00, 0x00 },
        { 0x00000000, 0x00, 0x00 },
        TOUCH_NONE,
        BUMP_NONE,
        OCELEM_ON,
    },
    { 20, 46, 0, { 0, 0, 0 } },
};

static CollisionCheckInfoInit2 sColChkInfoInit = {
    0, 0, 0, 0, MASS_IMMOVABLE,
};

static struct_D_80AA1678 sAnimationInfo[] = {
    { 0x060021D8, 1.0f, ANIMMODE_LOOP, 0.0f },   { 0x0600E908, 1.0f, ANIMMODE_ONCE, -10.0f },
    { 0x0600F1D4, 1.0f, ANIMMODE_LOOP, -10.0f }, { 0x0600EBB0, 1.0f, ANIMMODE_LOOP, -10.0f },
    { 0x060021D8, 1.0f, ANIMMODE_LOOP, -10.0f }, { 0x06010C44, 1.0f, ANIMMODE_LOOP, -10.0f },
    { 0x0600BAEC, 1.0f, ANIMMODE_LOOP, -10.0f }, { 0x0600C500, 1.0f, ANIMMODE_ONCE, -10.0f },
    { 0x06001D50, 1.0f, ANIMMODE_ONCE, -10.0f }, { 0x0600CFD8, 1.0f, ANIMMODE_ONCE, -10.0f },
    { 0x0600D7E8, 1.0f, ANIMMODE_ONCE, -10.0f }, { 0x0600BAEC, 1.0f, ANIMMODE_LOOP, 0.0f },
};

static struct_80034EC0_Entry sAnimations[] = {
    { 0x0601291C, 1.0f, 0.0f, -1.0f, ANIMMODE_ONCE, -1.0f }, { 0x06011580, 1.0f, 0.0f, -1.0f, ANIMMODE_LOOP, -4.0f },
    { 0x06013008, 1.0f, 0.0f, -1.0f, ANIMMODE_LOOP, -1.0f }, { 0x0601186C, 1.0f, 0.0f, -1.0f, ANIMMODE_ONCE, -1.0f },
    { 0x06014470, 1.0f, 0.0f, -1.0f, ANIMMODE_LOOP, -1.0f }, { 0x06014850, 1.0f, 0.0f, -1.0f, ANIMMODE_ONCE, -1.0f },
    { 0x06011C38, 1.0f, 0.0f, -1.0f, ANIMMODE_LOOP, -1.0f }, { 0x06012100, 1.0f, 0.0f, -1.0f, ANIMMODE_LOOP, -1.0f },
    { 0x06015220, 1.0f, 0.0f, -1.0f, ANIMMODE_ONCE, -1.0f }, { 0x060021D8, 1.0f, 0.0f, -1.0f, ANIMMODE_LOOP, -8.0f },
};

extern CutsceneData D_02005730[];
extern CutsceneData D_02010E20[];

extern AnimationHeader D_06001D50;
extern Gfx D_06007B80[];
extern FlexSkeletonHeader D_0600B1A0;
extern AnimationHeader D_0600BAEC;
extern AnimationHeader D_0600C500;
extern AnimationHeader D_06012100;

s16 func_80AF5560(EnSa* this, GlobalContext* globalCtx) {
    s16 textState = func_8010BDBC(&globalCtx->msgCtx);

    if (this->unk_209 == 10 || this->unk_209 == 5 || this->unk_209 == 2 || this->unk_209 == 1) {
        if (textState != this->unk_209) {
            this->unk_208++;
        }
    }
    this->unk_209 = textState;
    return textState;
}

u16 func_80AF55E0(GlobalContext* globalCtx, Actor* thisx) {
    EnSa* this = THIS;
    u16 reaction = Text_GetFaceReaction(globalCtx, 0x10);

    if (reaction != 0) {
        return reaction;
    }
    if (CHECK_QUEST_ITEM(QUEST_SONG_SARIA)) {
        return 0x10AD;
    }
    if (CHECK_QUEST_ITEM(QUEST_KOKIRI_EMERALD)) {
        this->unk_208 = 0;
        this->unk_209 = 0;
        if (gSaveContext.infTable[0] & 0x20) {
            return 0x1048;
        } else {
            return 0x1047;
        }
    }
    if (gSaveContext.eventChkInf[0] & 4) {
        this->unk_208 = 0;
        this->unk_209 = 0;
        if (gSaveContext.infTable[0] & 8) {
            return 0x1032;
        } else {
            return 0x1031;
        }
    }
    if (gSaveContext.infTable[0] & 1) {
        this->unk_208 = 0;
        this->unk_209 = 0;
        if (gSaveContext.infTable[0] & 2) {
            return 0x1003;
        } else {
            return 0x1002;
        }
    }
    return 0x1001;
}

s16 func_80AF56F4(GlobalContext* globalCtx, Actor* thisx) {
    s16 ret = 1;
    EnSa* this = THIS;

    switch (func_80AF5560(this, globalCtx)) {
        case 2:
            switch (this->actor.textId) {
                case 0x1002:
                    gSaveContext.infTable[0] |= 2;
                    ret = 0;
                    break;
                case 0x1031:
                    gSaveContext.eventChkInf[0] |= 8;
                    gSaveContext.infTable[0] |= 8;
                    ret = 0;
                    break;
                case 0x1047:
                    gSaveContext.infTable[0] |= 0x20;
                    ret = 0;
                    break;
                default:
                    ret = 0;
                    break;
            }
            break;
        case 0:
        case 1:
        case 3:
        case 4:
        case 5:
        case 7:
        case 8:
        case 9:
            break;
    }
    return ret;
}

void func_80AF57D8(EnSa* this, GlobalContext* globalCtx) {
    if (globalCtx->sceneNum != SCENE_SPOT05 ||
        ABS((s16)(this->actor.yawTowardsPlayer - this->actor.shape.rot.y)) < 0x1555 || this->unk_1E0.unk_00 != 0) {
        func_800343CC(globalCtx, &this->actor, &this->unk_1E0.unk_00, this->collider.dim.radius + 30.0f, func_80AF55E0,
                      func_80AF56F4);
    }
}

f32 func_80AF5894(EnSa* this) {
    f32 endFrame = this->skelAnime.endFrame;
    f32 startFrame = this->skelAnime.startFrame;

    this->skelAnime.startFrame = endFrame;
    this->skelAnime.curFrame = endFrame;
    this->skelAnime.endFrame = startFrame;
    this->skelAnime.playSpeed = -1.0f;
    return startFrame;
}

void func_80AF58B8(EnSa* this) {
    switch (this->unk_20A) {
        case 0:
            func_80034EC0(&this->skelAnime, sAnimations, 3);
            this->unk_20A++;
        case 1:
            if (Animation_OnFrame(&this->skelAnime, this->skelAnime.endFrame)) {
                func_80034EC0(&this->skelAnime, sAnimations, 2);
                this->unk_20A++;
            }
            break;
    }
}

void func_80AF594C(EnSa* this) {
    switch (this->unk_20A) {
        case 0:
            func_80034EC0(&this->skelAnime, sAnimations, 8);
            this->unk_20A++;
        case 1:
            if (Animation_OnFrame(&this->skelAnime, this->skelAnime.endFrame)) {
                func_80034EC0(&this->skelAnime, sAnimations, 9);
                this->unk_20A++;
            }
            break;
    }
}

void func_80AF59E0(EnSa* this) {
    switch (this->unk_20A) {
        case 0:
            func_80034EC0(&this->skelAnime, sAnimations, 1);
            this->unk_20A++;
        case 1:
            if (Animation_OnFrame(&this->skelAnime, this->skelAnime.endFrame)) {
                func_80034EC0(&this->skelAnime, sAnimations, 7);
                this->unk_20A++;
            }
            break;
    }
}

void func_80AF5A74(EnSa* this) {
    switch (this->unk_20A) {
        case 0:
            func_80034EC0(&this->skelAnime, sAnimations, 1);
            func_80AF5894(this);
            this->unk_20A++;
        case 1:
            if (Animation_OnFrame(&this->skelAnime, this->skelAnime.endFrame)) {
                func_80034EC0(&this->skelAnime, sAnimations, 9);
                this->unk_20A++;
            }
            break;
    }
}

void func_80AF5B10(EnSa* this) {
    switch (this->unk_20A) {
        case 0:
            func_80034EC0(&this->skelAnime, sAnimations, 6);
            this->unk_20A++;
        case 1:
            if (Animation_OnFrame(&this->skelAnime, this->skelAnime.endFrame)) {
                func_80034EC0(&this->skelAnime, sAnimations, 4);
                this->unk_20A++;
            }
            break;
    }
}

void func_80AF5BA4(EnSa* this) {
    switch (this->unk_20A) {
        case 0:
            func_80034EC0(&this->skelAnime, sAnimations, 6);
            func_80AF5894(this);
            this->unk_20A++;
        case 1:
            if (Animation_OnFrame(&this->skelAnime, this->skelAnime.endFrame)) {
                func_80034EC0(&this->skelAnime, sAnimations, 9);
                this->unk_20A++;
            }
            break;
    }
}

void func_80AF5C40(EnSa* this) {
    switch (this->unk_20A) {
        case 0:
            func_80034EC0(&this->skelAnime, sAnimations, 5);
            this->unk_20A++;
        case 1:
            if (Animation_OnFrame(&this->skelAnime, this->skelAnime.endFrame)) {
                func_80034EC0(&this->skelAnime, sAnimations, 0);
                this->unk_20A++;
            }
            break;
    }
}

void func_80AF5CD4(EnSa* this, u8 arg1) {
    this->unk_20B = arg1;
    this->unk_20A = 0;
}

void func_80AF5CE4(EnSa* this) {
    switch (this->unk_20B) {
        case 1:
            func_80AF58B8(this);
            break;
        case 2:
            func_80AF594C(this);
            break;
        case 3:
            func_80AF59E0(this);
            break;
        case 4:
            func_80AF5A74(this);
            break;
        case 5:
            func_80AF5B10(this);
            break;
        case 6:
            func_80AF5BA4(this);
            break;
        case 7:
            func_80AF5C40(this);
            break;
    }
}

void func_80AF5D8C(EnSa* this, s32 action) {
    Animation_Change(&this->skelAnime, sAnimationInfo[action].animation, 1.0f, 0.0f,
                     Animation_GetLastFrame(sAnimationInfo[action].animation), sAnimationInfo[action].mode,
                     sAnimationInfo[action].transitionRate);
}

s32 func_80AF5DFC(EnSa* this, GlobalContext* globalCtx) {
    if (gSaveContext.cutsceneIndex >= 0xFFF0 && gSaveContext.cutsceneIndex != 0xFFFD) {
        if (globalCtx->sceneNum == SCENE_SPOT04) {
            return 4;
        }
        if (globalCtx->sceneNum == SCENE_SPOT05) {
            return 5;
        }
    }
    if (globalCtx->sceneNum == SCENE_KOKIRI_HOME5 && LINK_IS_CHILD &&
        INV_CONTENT(ITEM_OCARINA_FAIRY) == ITEM_OCARINA_FAIRY && !(gSaveContext.eventChkInf[4] & 1)) {
        return 1;
    }
    if (globalCtx->sceneNum == SCENE_SPOT05 && (gSaveContext.eventChkInf[4] & 1)) {
        return (CHECK_QUEST_ITEM(QUEST_SONG_SARIA)) ? 2 : 5;
    }
    if (globalCtx->sceneNum == SCENE_SPOT04 && !CHECK_QUEST_ITEM(QUEST_KOKIRI_EMERALD)) {
        if (gSaveContext.infTable[0] & 1) {
            return 1;
        }
        return 4;
    }
    return 0;
}

void func_80AF5F34(EnSa* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;
    s16 phi_a3 = 0;

    if (globalCtx->sceneNum == SCENE_SPOT04) {
        phi_a3 = (this->actionFunc == func_80AF68E4) ? 1 : 4;
    }
    if (globalCtx->sceneNum == SCENE_SPOT05) {
        phi_a3 = (this->skelAnime.animation == &D_0600BAEC) ? 1 : 3;
    }
    if (globalCtx->sceneNum == SCENE_SPOT05 && this->actionFunc == func_80AF6448 &&
        this->skelAnime.animation == &D_0600C500) {
        phi_a3 = 1;
    }
    if (globalCtx->sceneNum == SCENE_SPOT05 && this->actionFunc == func_80AF68E4 &&
        this->skelAnime.animation == &D_06001D50) {
        phi_a3 = 1;
    }
    this->unk_1E0.unk_18 = player->actor.world.pos;
    this->unk_1E0.unk_14 = 4.0f;
    func_80034A14(&this->actor, &this->unk_1E0, 2, phi_a3);
}

s32 func_80AF603C(EnSa* this) {
    if (this->skelAnime.animation != &D_0600BAEC && this->skelAnime.animation != &D_06001D50) {
        return 0;
    }
    if (this->unk_1E0.unk_00 != 0) {
        return 0;
    }
    this->unk_20E = 0;
    if (this->unk_212 != 2) {
        return 0;
    }
    return 1;
}

void func_80AF609C(EnSa* this) {
    s16 phi_v1;

    if (func_80AF603C(this) == 0) {
        if (this->unk_20E == 0) {
            phi_v1 = 0;
        } else {
            this->unk_20E--;
            phi_v1 = this->unk_20E;
        }
        if (phi_v1 == 0) {
            this->unk_212++;
            if (this->unk_212 < 3) {
                this->unk_214 = this->unk_212;
            } else {
                this->unk_20E = Rand_S16Offset(30, 30);
                this->unk_214 = 0;
                this->unk_212 = this->unk_214;
            }
        }
    }
}

void func_80AF6130(CsCmdActorAction* csAction, Vec3f* dst) {
    dst->x = csAction->startPos.x;
    dst->y = csAction->startPos.y;
    dst->z = csAction->startPos.z;
}

void func_80AF6170(CsCmdActorAction* csAction, Vec3f* dst) {
    dst->x = csAction->endPos.x;
    dst->y = csAction->endPos.y;
    dst->z = csAction->endPos.z;
}

void EnSa_Init(Actor* thisx, GlobalContext* globalCtx) {
    EnSa* this = THIS;
    s32 pad;

    ActorShape_Init(&this->actor.shape, 0.0f, ActorShadow_DrawCircle, 12.0f);
    SkelAnime_InitFlex(globalCtx, &this->skelAnime, &D_0600B1A0, NULL, this->jointTable, this->morphTable, 17);
    Collider_InitCylinder(globalCtx, &this->collider);
    Collider_SetCylinder(globalCtx, &this->collider, &this->actor, &sCylinderInit);
    CollisionCheck_SetInfo2(&this->actor.colChkInfo, NULL, &sColChkInfoInit);

    switch (func_80AF5DFC(this, globalCtx)) {
        case 2:
            func_80AF5D8C(this, 0xB);
            this->actionFunc = func_80AF6448;
            break;
        case 5:
            func_80AF5D8C(this, 0xB);
            this->actionFunc = func_80AF683C;
            break;
        case 1:
            this->actor.gravity = -1.0f;
            func_80AF5D8C(this, 0);
            this->actionFunc = func_80AF6448;
            break;
        case 4:
            this->unk_210 = 0;
            this->actor.gravity = -1.0f;
            globalCtx->csCtx.segment = SEGMENTED_TO_VIRTUAL(D_02010E20);
            gSaveContext.cutsceneTrigger = 1;
            func_80AF5D8C(this, 4);
            this->actionFunc = func_80AF68E4;
            break;
        case 3:
            this->unk_210 = 0;
            this->actor.gravity = -1.0f;
            func_80AF5D8C(this, 0);
            this->actionFunc = func_80AF68E4;
            break;
        case 0:
            Actor_Kill(&this->actor);
            return;
    }

    Actor_SetScale(&this->actor, 0.01f);

    this->actor.targetMode = 6;
    this->unk_1E0.unk_00 = 0;
    this->alpha = 255;
    this->unk_21A = this->actor.shape.rot;

    Actor_SpawnAsChild(&globalCtx->actorCtx, &this->actor, globalCtx, ACTOR_EN_ELF, this->actor.world.pos.x,
                       this->actor.world.pos.y, this->actor.world.pos.z, 0, 0, 0, FAIRY_KOKIRI);
}

void EnSa_Destroy(Actor* thisx, GlobalContext* globalCtx) {
    EnSa* this = THIS;

    Collider_DestroyCylinder(globalCtx, &this->collider);
}

void func_80AF6448(EnSa* this, GlobalContext* globalCtx) {
    if (globalCtx->sceneNum == SCENE_SPOT04) {
        if (this->unk_1E0.unk_00 != 0) {
            switch (this->actor.textId) {
                case 0x1002:
                    if (this->unk_208 == 0 && this->unk_20B != 1) {
                        func_80AF5CD4(this, 1);
                        this->unk_216 = 1;
                    }
                    if (this->unk_208 == 2 && this->unk_20B != 2) {
                        func_80AF5CD4(this, 2);
                        this->unk_216 = 1;
                    }
                    if (this->unk_208 == 5) {
                        this->unk_216 = 0;
                    }
                    break;
                case 0x1003:
                    if (this->unk_208 == 0 && this->unk_20B != 4) {
                        func_80AF5CD4(this, 4);
                    }
                    break;
                case 0x1031:
                    if (this->unk_208 == 0 && this->unk_20B != 4 && this->skelAnime.animation == &D_06012100) {
                        func_80AF5CD4(this, 4);
                        this->unk_216 = 3;
                    }
                    if (this->unk_208 == 2 && this->unk_20B != 5) {
                        func_80AF5CD4(this, 5);
                        this->unk_216 = 2;
                    }
                    if (this->unk_208 == 4 && this->unk_20B != 6) {
                        func_80AF5CD4(this, 6);
                        this->unk_216 = 0;
                    }
                    break;
                case 0x1032:
                    if (this->unk_208 == 0 && this->unk_20B != 4 && this->skelAnime.animation == &D_06012100) {
                        func_80AF5CD4(this, 4);
                    }
                    break;
                case 0x1047:
                    if (this->unk_208 == 1 && this->unk_20B != 7) {
                        func_80AF5CD4(this, 7);
                    }
                    break;
                case 0x1048:
                    if (this->unk_208 == 0 && this->unk_20B != 7) {
                        func_80AF5CD4(this, 7);
                    }
                    break;
            }
        } else if (!CHECK_QUEST_ITEM(QUEST_KOKIRI_EMERALD) &&
                   ((gSaveContext.infTable[0] & 2) || (gSaveContext.infTable[0] & 8))) {
            if (this->unk_20B != 3) {
                func_80AF5CD4(this, 3);
            }
        } else {
            func_80AF5CD4(this, 0);
        }
        func_80AF5CE4(this);
    }
    if (this->skelAnime.animation == &D_0600C500) {
        this->skelAnime.playSpeed = -1.0f;
        if ((s32)this->skelAnime.curFrame == 0) {
            func_80AF5D8C(this, 6);
        }
    }
    if (this->unk_1E0.unk_00 != 0 && globalCtx->sceneNum == SCENE_SPOT05) {
        Animation_Change(&this->skelAnime, &D_0600C500, 1.0f, 0.0f, 10.0f, ANIMMODE_ONCE, -10.0f);
        this->actionFunc = func_80AF67D0;
    }
}

void func_80AF67D0(EnSa* this, GlobalContext* globalCtx) {
    if (this->unk_1E0.unk_00 == 0) {
        Animation_Change(&this->skelAnime, &D_0600C500, 0.0f, 10.0f, 0.0f, ANIMMODE_ONCE, -10.0f);
        this->actionFunc = func_80AF6448;
    }
}

void func_80AF683C(EnSa* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;

    if (!(player->actor.world.pos.z >= -2220.0f) && !Gameplay_InCsMode(globalCtx)) {
        globalCtx->csCtx.segment = SEGMENTED_TO_VIRTUAL(D_02005730);
        gSaveContext.cutsceneTrigger = 1;
        this->actionFunc = func_80AF68E4;
    }
}

void func_80AF68E4(EnSa* this, GlobalContext* globalCtx) {
    s16 phi_v0;
    Vec3f startPos;
    Vec3f endPos;
    Vec3f D_80AF7448 = { 0.0f, 0.0f, 0.0f };
    CsCmdActorAction* csAction;
    f32 temp_f0;
    f32 gravity;

    if (globalCtx->csCtx.state == CS_STATE_IDLE) {
        this->actionFunc = func_80AF6B20;
        return;
    }
    csAction = globalCtx->csCtx.npcActions[1];
    if (csAction != NULL) {
        func_80AF6130(csAction, &startPos);
        func_80AF6170(csAction, &endPos);

        if (this->unk_210 == 0) {
            this->actor.world.pos = startPos;
        }
        if (this->unk_210 != csAction->action) {
            switch (csAction->action) {
                case 2:
                    this->unk_216 = 1;
                    break;
                case 9:
                    this->unk_216 = 1;
                    break;
                default:
                    this->unk_216 = 0;
                    break;
            }
            func_80AF5D8C(this, csAction->action);
            this->unk_210 = csAction->action;
        }
        if (phi_v0) {}
        if (csAction->action == 3) {
            if (this->unk_20C == 0) {
                phi_v0 = 0;
            } else {
                this->unk_20C--;
                phi_v0 = this->unk_20C;
            }
            if (phi_v0 == 0) {
                Audio_PlaySoundGeneral(NA_SE_PL_WALK_GROUND, &this->actor.projectedPos, 4, &D_801333E0, &D_801333E0,
                                       &D_801333E8);
                this->unk_20C = 8;
            }
        }
        this->actor.shape.rot.x = csAction->urot.x;
        this->actor.shape.rot.y = csAction->urot.y;
        this->actor.shape.rot.z = csAction->urot.z;
        this->actor.velocity = D_80AF7448;

        if (globalCtx->csCtx.frames < csAction->endFrame) {
            temp_f0 = csAction->endFrame - csAction->startFrame;
            this->actor.velocity.x = (endPos.x - startPos.x) / temp_f0;
            this->actor.velocity.y = (endPos.y - startPos.y) / temp_f0;
            gravity = this->actor.gravity;
            if (globalCtx->sceneNum == SCENE_SPOT05) {
                gravity = 0.0f;
            }
            this->actor.velocity.y += gravity;
            if (this->actor.velocity.y < this->actor.minVelocityY) {
                this->actor.velocity.y = this->actor.minVelocityY;
            }
            this->actor.velocity.z = (endPos.z - startPos.z) / temp_f0;
        }
    }
}

void func_80AF6B20(EnSa* this, GlobalContext* globalCtx) {
    if (globalCtx->sceneNum == SCENE_SPOT05) {
        Item_Give(globalCtx, ITEM_SONG_SARIA);
        func_80AF5D8C(this, 6);
    }

    if (globalCtx->sceneNum == SCENE_SPOT04) {
        func_80AF5D8C(this, 4);
        this->actor.world.pos = this->actor.home.pos;
        this->actor.world.rot = this->unk_21A;
        this->unk_216 = 0;
        gSaveContext.infTable[0] |= 1;
    }

    this->actionFunc = func_80AF6448;
}

void EnSa_Update(Actor* thisx, GlobalContext* globalCtx) {
    EnSa* this = THIS;
    s32 pad;

    Collider_UpdateCylinder(&this->actor, &this->collider);
    CollisionCheck_SetOC(globalCtx, &globalCtx->colChkCtx, &this->collider.base);
    SkelAnime_Update(&this->skelAnime);

    if (this->skelAnime.animation == &D_06001D50 && this->skelAnime.curFrame >= Animation_GetLastFrame(&D_06001D50)) {
        func_80AF5D8C(this, 6);
    }

    if (this->actionFunc != func_80AF68E4) {
        this->alpha = func_80034DD4(&this->actor, globalCtx, this->alpha, 400.0f);
    } else {
        this->alpha = 255;
    }

    this->actor.shape.shadowAlpha = this->alpha;

    if (this->actionFunc == func_80AF68E4) {
        this->actor.world.pos.x += this->actor.velocity.x;
        this->actor.world.pos.y += this->actor.velocity.y;
        this->actor.world.pos.z += this->actor.velocity.z;
    } else {
        func_8002D7EC(&this->actor);
    }

    if (globalCtx->sceneNum != SCENE_SPOT05) {
        Actor_UpdateBgCheckInfo(globalCtx, &this->actor, 0.0f, 0.0f, 0.0f, 4);
    }

    func_80AF609C(this);
    this->actionFunc(this, globalCtx);
    func_80AF57D8(this, globalCtx);
    func_80AF5F34(this, globalCtx);
}

s32 EnSa_OverrideLimbDraw(GlobalContext* globalCtx, s32 limbIndex, Gfx** dList, Vec3f* pos, Vec3s* rot, void* thisx,
                          Gfx** gfx) {
    EnSa* this = THIS;
    s32 pad;
    Vec3s sp18;

    if (limbIndex == 16) {
        Matrix_Translate(900.0f, 0.0f, 0.0f, MTXMODE_APPLY);
        sp18 = this->unk_1E0.unk_08;
        Matrix_RotateX(BINANG_TO_RAD(sp18.y), MTXMODE_APPLY);
        Matrix_RotateZ(BINANG_TO_RAD(sp18.x), MTXMODE_APPLY);
        Matrix_Translate(-900.0f, 0.0f, 0.0f, MTXMODE_APPLY);
    }

    if (limbIndex == 9) {
        sp18 = this->unk_1E0.unk_0E;
        Matrix_RotateY(BINANG_TO_RAD(sp18.y), MTXMODE_APPLY);
        Matrix_RotateX(BINANG_TO_RAD(sp18.x), MTXMODE_APPLY);
    }

    if (globalCtx->sceneNum == SCENE_SPOT05 && limbIndex == 15) {
        *dList = D_06007B80;
    }

    return 0;
}

void EnSa_PostLimbDraw(GlobalContext* globalCtx, s32 limbIndex, Gfx** dList, Vec3s* rot, void* thisx, Gfx** gfx) {
    EnSa* this = THIS;
    Vec3f D_80AF7454 = { 400.0, 0.0f, 0.0f };

    if (limbIndex == 16) {
        Matrix_MultVec3f(&D_80AF7454, &this->actor.focus.pos);
    }
}

void EnSa_Draw(Actor* thisx, GlobalContext* globalCtx) {
    static UNK_PTR D_80AF7460[] = { 0x06003588, 0x06004448, 0x06004648, 0x06004C48, 0x06003348 };
    static UNK_PTR D_80AF7474[] = { 0x06002F48, 0x06003C48, 0x06003848, 0x06004848, 0x06004E48 };

    EnSa* this = THIS;

    OPEN_DISPS(globalCtx->state.gfxCtx, "../z_en_sa.c", 1444);

    if (this->alpha == 255) {
        gSPSegment(POLY_OPA_DISP++, 0x08, SEGMENTED_TO_VIRTUAL(D_80AF7474[this->unk_212]));
        gSPSegment(POLY_OPA_DISP++, 0x09, SEGMENTED_TO_VIRTUAL(D_80AF7474[this->unk_214]));
        gSPSegment(POLY_OPA_DISP++, 0x0A, SEGMENTED_TO_VIRTUAL(D_80AF7460[this->unk_216]));
        func_80034BA0(globalCtx, &this->skelAnime, EnSa_OverrideLimbDraw, EnSa_PostLimbDraw, &this->actor, this->alpha);
    } else if (this->alpha != 0) {
        gSPSegment(POLY_XLU_DISP++, 0x08, SEGMENTED_TO_VIRTUAL(D_80AF7474[this->unk_212]));
        gSPSegment(POLY_XLU_DISP++, 0x09, SEGMENTED_TO_VIRTUAL(D_80AF7474[this->unk_214]));
        gSPSegment(POLY_XLU_DISP++, 0x0A, SEGMENTED_TO_VIRTUAL(D_80AF7460[this->unk_216]));
        func_80034CC4(globalCtx, &this->skelAnime, EnSa_OverrideLimbDraw, EnSa_PostLimbDraw, &this->actor, this->alpha);
    }

    CLOSE_DISPS(globalCtx->state.gfxCtx, "../z_en_sa.c", 1497);
}
