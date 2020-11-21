/*
 * File: z_en_wonder_item.c
 * Overlay: ovl_En_Wonder_Item
 * Description: Invisible Collectable; Used in MQ to create "Cow" switches
 */

#include "z_en_wonder_item.h"
#include "vt.h"

#define FLAGS 0x00000000

#define THIS ((EnWonderItem*)thisx)

void EnWonderItem_Init(Actor* thisx, GlobalContext* globalCtx);
void EnWonderItem_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnWonderItem_Update(Actor* thisx, GlobalContext* globalCtx);

void EnWonderItem_MultitagFree(EnWonderItem* this, GlobalContext* globalCtx);
void EnWonderItem_ProximityDrop(EnWonderItem* this, GlobalContext* globalCtx);
void EnWonderItem_InteractSwitch(EnWonderItem* this, GlobalContext* globalCtx);
void EnWonderItem_ProximitySwitch(EnWonderItem* this, GlobalContext* globalCtx);
void EnWonderItem_MultitagOrdered(EnWonderItem* this, GlobalContext* globalCtx);
void EnWonderItem_BombSoldier(EnWonderItem* this, GlobalContext* globalCtx);
void EnWonderItem_RollDrop(EnWonderItem* this, GlobalContext* globalCtx);

static ColliderCylinderInit sCylinderInit = {
    { COLTYPE_UNK10, 0x00, 0x09, 0x00, 0x20, COLSHAPE_CYLINDER },
    { 0x00, { 0x00000000, 0x00, 0x00 }, { 0xFFCFFFFF, 0x00, 0x00 }, 0x00, 0x01, 0x00 },
    { 20, 30, 0, { 0, 0, 0 } },
};

const ActorInit En_Wonder_Item_InitVars = {
    ACTOR_EN_WONDER_ITEM,
    ACTORTYPE_PROP,
    FLAGS,
    OBJECT_GAMEPLAY_KEEP,
    sizeof(EnWonderItem),
    (ActorFunc)EnWonderItem_Init,
    (ActorFunc)EnWonderItem_Destroy,
    (ActorFunc)EnWonderItem_Update,
    NULL,
};

static Vec3f sTagPointsFree[9];
static Vec3f sTagPointsOrdered[9];

void EnWonderItem_Destroy(Actor* thisx, GlobalContext* globalCtx) {
    s32 pad;
    EnWonderItem* this = THIS;

    if ((this->collider.dim.radius != 0) || (this->collider.dim.height != 0)) {
        Collider_DestroyCylinder(globalCtx, &this->collider);
    }
}

void EnWonderItem_DropCollectible(EnWonderItem* this, GlobalContext* globalCtx, s32 autoCollect) {
    static s16 dropTable[] = {
        ITEM00_NUTS,        ITEM00_HEART_PIECE,  ITEM00_MAGIC_LARGE,   ITEM00_MAGIC_SMALL,
        ITEM00_HEART,       ITEM00_ARROWS_SMALL, ITEM00_ARROWS_MEDIUM, ITEM00_ARROWS_LARGE,
        ITEM00_RUPEE_GREEN, ITEM00_RUPEE_BLUE,   ITEM00_RUPEE_RED,     ITEM00_FLEXIBLE,
    };
    s32 i;
    s32 randomDrop;

    func_80078884(NA_SE_SY_GET_ITEM);

    if (this->dropCount == 0) {
        this->dropCount++;
    }
    for (i = this->dropCount; i > 0; i--) {
        if (this->itemDrop < WONDERITEM_DROP_RANDOM) {
            if ((this->itemDrop == WONDERITEM_DROP_FLEXIBLE) || !autoCollect) {
                Item_DropCollectible(globalCtx, &this->actor.posRot.pos, dropTable[this->itemDrop]);
            } else {
                Item_DropCollectible(globalCtx, &this->actor.posRot.pos, dropTable[this->itemDrop] | 0x8000);
            }
        } else {
            randomDrop = this->itemDrop - WONDERITEM_DROP_RANDOM;
            if (!autoCollect) {
                Item_DropCollectibleRandom(globalCtx, NULL, &this->actor.posRot.pos, randomDrop);
            } else {
                Item_DropCollectibleRandom(globalCtx, NULL, &this->actor.posRot.pos, randomDrop | 0x8000);
            }
        }
    }
    if (this->switchFlag >= 0) {
        Flags_SetSwitch(globalCtx, this->switchFlag);
    }
    Actor_Kill(&this->actor);
}

void EnWonderItem_Init(Actor* thisx, GlobalContext* globalCtx) {
    static u32 collisionTypes[] = {
        0x00000702 /* sword slash */, 0x0001F820 /* arrow */,     0x00000040 /* hammer */,   0x00000008 /* bomb */,
        0x00000004 /* slingshot */,   0x00000010 /* boomerang */, 0x00000080 /* hookshot */,
    };
    s32 pad;
    s16 colTypeIndex;
    EnWonderItem* this = THIS;
    s16 rotZover10;
    s16 tagIndex;

    osSyncPrintf("\n\n");
    // Mysterious mystery, very mysterious
    osSyncPrintf(VT_FGCOL(GREEN) "☆☆☆☆☆ 不思議不思議まか不思議 \t   ☆☆☆☆☆ %x\n" VT_RST, this->actor.params);
    this->actor.flags &= ~1;

    this->wonderMode = (this->actor.params >> 0xB) & 0x1F;
    this->itemDrop = (this->actor.params >> 6) & 0x1F;
    this->switchFlag = this->actor.params & 0x3F;
    if (this->switchFlag == 0x3F) {
        this->switchFlag = -1;
    }
    this->actor.unk_1F = 1;
    if ((this->switchFlag >= 0) && Flags_GetSwitch(globalCtx, this->switchFlag)) {
        osSyncPrintf(VT_FGCOL(GREEN) "☆☆☆☆☆ Ｙｏｕ ａｒｅ Ｓｈｏｃｋ！  ☆☆☆☆☆ %d\n" VT_RST, this->switchFlag);
        Actor_Kill(&this->actor);
        return;
    }
    switch (this->wonderMode) {
        case WONDERITEM_MULTITAG_FREE:
            this->numTagPoints = this->actor.posRot.rot.z & 0xF;
            rotZover10 = 0;
            if (this->actor.posRot.rot.z >= 10) {
                rotZover10 = this->actor.posRot.rot.z / 10;
                this->timerMod = rotZover10 * 20;
            }
            this->numTagPoints = this->actor.posRot.rot.z - rotZover10 * 10;
            // i.e timerMod = rot.z / 10 seconds, numTagPoints = rot.z % 10
            this->updateFunc = EnWonderItem_MultitagFree;
            break;
        case WONDERITEM_TAG_POINT_FREE:
            tagIndex = this->actor.posRot.rot.z & 0xFF;
            sTagPointsFree[tagIndex] = this->actor.posRot.pos;
            Actor_Kill(&this->actor);
            break;
        case WONDERITEM_PROXIMITY_DROP:
            this->dropCount = this->actor.posRot.rot.z & 0xFF;
            this->updateFunc = EnWonderItem_ProximityDrop;
            break;
        case WONDERITEM_INTERACT_SWITCH:
            colTypeIndex = this->actor.posRot.rot.z & 0xFF;
            Collider_InitCylinder(globalCtx, &this->collider);
            Collider_SetCylinder(globalCtx, &this->collider, &this->actor, &sCylinderInit);
            this->collider.body.bumper.flags = collisionTypes[colTypeIndex];
            this->collider.dim.radius = 20;
            this->collider.dim.height = 30;
            this->updateFunc = EnWonderItem_InteractSwitch;
            break;
        case WONDERITEM_UNUSED:
            break;
        case WONDERITEM_MULTITAG_ORDERED:
            this->numTagPoints = this->actor.posRot.rot.z & 0xF;
            rotZover10 = 0;
            if (this->actor.posRot.rot.z >= 10) {
                rotZover10 = this->actor.posRot.rot.z / 10;
                this->timerMod = rotZover10 * 20;
            }
            this->numTagPoints = this->actor.posRot.rot.z - rotZover10 * 10;
            // i.e timerMod = rot.z / 10 seconds, numTagPoints = rot.z % 10
            this->updateFunc = EnWonderItem_MultitagOrdered;
            break;
        case WONDERITEM_TAG_POINT_ORDERED:
            tagIndex = this->actor.posRot.rot.z & 0xFF;
            sTagPointsOrdered[tagIndex] = this->actor.posRot.pos;
            Actor_Kill(&this->actor);
            break;
        case WONDERITEM_PROXIMITY_SWITCH:
            this->updateFunc = EnWonderItem_ProximitySwitch;
            break;
        case WONDERITEM_BOMB_SOLDIER:
            Collider_InitCylinder(globalCtx, &this->collider);
            Collider_SetCylinder(globalCtx, &this->collider, &this->actor, &sCylinderInit);
            this->collider.body.bumper.flags = 0x00000004; // slingshot
            this->unkPos = this->actor.posRot.pos;
            this->collider.dim.radius = 35;
            this->collider.dim.height = 75;
            this->updateFunc = EnWonderItem_BombSoldier;
            break;
        case WONDERITEM_ROLL_DROP:
            this->dropCount = this->actor.posRot.rot.z & 0xFF;
            this->updateFunc = EnWonderItem_RollDrop;
            break;
        default:
            Actor_Kill(&this->actor);
            break;
    }
}

void EnWonderItem_MultitagFree(EnWonderItem* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;
    s32 prevTagFlags = this->tagFlags;
    s32 i;
    s32 mask;

    for (i = 0, mask = 1; i < this->numTagPoints; i++, mask <<= 1) {
        if (!(prevTagFlags & mask)) {
            f32 dx = player->actor.posRot.pos.x - sTagPointsFree[i].x;
            f32 dy = player->actor.posRot.pos.y - sTagPointsFree[i].y;
            f32 dz = player->actor.posRot.pos.z - sTagPointsFree[i].z;

            if (sqrtf(SQ(dx) + SQ(dy) + SQ(dz)) < 50.0f) {
                this->tagFlags |= mask;
                this->tagCount++;
                this->timer = this->timerMod + 81;
                return;
            }
            if (BREG(0) != 0) {
                DebugDisplay_AddObject(sTagPointsFree[i].x, sTagPointsFree[i].y, sTagPointsFree[i].z,
                                       this->actor.posRot.rot.x, this->actor.posRot.rot.y, this->actor.posRot.rot.z,
                                       1.0f, 1.0f, 1.0f, 0, 255, 0, 255, 4, globalCtx->state.gfxCtx);
            }
        }
    }
    if (this->timer == 1) {
        Actor_Kill(&this->actor);
        return;
    }
    if (this->tagCount == this->numTagPoints) {
        if (this->switchFlag >= 0) {
            Flags_SetSwitch(globalCtx, this->switchFlag);
        }
        EnWonderItem_DropCollectible(this, globalCtx, true);
    }
}

void EnWonderItem_ProximityDrop(EnWonderItem* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;

    if ((this->actor.xzDistFromLink < 50.0f) &&
        (fabsf(this->actor.posRot.pos.y - player->actor.posRot.pos.y) < 30.0f)) {
        EnWonderItem_DropCollectible(this, globalCtx, true);
    }
}

void EnWonderItem_InteractSwitch(EnWonderItem* this, GlobalContext* globalCtx) {
    if (this->collider.base.acFlags & 2) {
        this->collider.base.acFlags &= ~2;
        EnWonderItem_DropCollectible(this, globalCtx, false);
    }
}

void EnWonderItem_ProximitySwitch(EnWonderItem* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;

    if ((this->actor.xzDistFromLink < 50.0f) &&
        (fabsf(this->actor.posRot.pos.y - player->actor.posRot.pos.y) < 30.0f)) {
        if (this->switchFlag >= 0) {
            Flags_SetSwitch(globalCtx, this->switchFlag);
        }
        Actor_Kill(&this->actor);
    }
}

void EnWonderItem_MultitagOrdered(EnWonderItem* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;
    s32 prevTagFlags = this->tagFlags;
    s32 i;
    s32 mask;

    for (i = 0, mask = 1; i < this->numTagPoints; i++, mask <<= 1) {
        if (!(prevTagFlags & mask)) {
            f32 dx = player->actor.posRot.pos.x - sTagPointsOrdered[i].x;
            f32 dy = player->actor.posRot.pos.y - sTagPointsOrdered[i].y;
            f32 dz = player->actor.posRot.pos.z - sTagPointsOrdered[i].z;

            if (sqrtf(SQ(dx) + SQ(dy) + SQ(dz)) < 50.0f) {
                if (prevTagFlags & mask) {
                    return;
                } else if (i == this->nextTag) {
                    this->tagFlags |= mask;
                    this->tagCount++;
                    this->nextTag++;
                    this->timer = this->timerMod + 81;
                    return;
                } else {
                    Actor_Kill(&this->actor);
                    return;
                }
            } else if (BREG(0) != 0) {
                DebugDisplay_AddObject(sTagPointsOrdered[i].x, sTagPointsOrdered[i].y, sTagPointsOrdered[i].z,
                                       this->actor.posRot.rot.x, this->actor.posRot.rot.y, this->actor.posRot.rot.z,
                                       1.0f, 1.0f, 1.0f, 0, 0, 255, 255, 4, globalCtx->state.gfxCtx);
            }
        }
    }
    if (this->timer == 1) {
        Actor_Kill(&this->actor);
        return;
    }
    if (this->tagCount == this->numTagPoints) {
        EnWonderItem_DropCollectible(this, globalCtx, true);
    }
}

void EnWonderItem_BombSoldier(EnWonderItem* this, GlobalContext* globalCtx) {
    if (this->collider.base.acFlags & 2) {
        this->collider.base.acFlags &= ~2;
        if (Actor_Spawn(&globalCtx->actorCtx, globalCtx, ACTOR_EN_HEISHI2, this->actor.posRot.pos.x,
                        this->actor.posRot.pos.y, this->actor.posRot.pos.z, 0, this->actor.yawTowardsLink, 0,
                        9) != NULL) {
            // Careless soldier spawned
            osSyncPrintf(VT_FGCOL(YELLOW) "☆☆☆☆☆ うっかり兵セット完了 ☆☆☆☆☆ \n" VT_RST);
        }
        if (this->switchFlag >= 0) {
            Flags_SetSwitch(globalCtx, this->switchFlag);
        }
        Actor_Kill(&this->actor);
    }
}

void EnWonderItem_RollDrop(EnWonderItem* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;

    if ((this->actor.xzDistFromLink < 50.0f) && (player->invincibilityTimer < 0) &&
        (fabsf(this->actor.posRot.pos.y - player->actor.posRot.pos.y) < 30.0f)) {
        EnWonderItem_DropCollectible(this, globalCtx, true);
    }
}

void EnWonderItem_Update(Actor* thisx, GlobalContext* globalCtx) {
    static s16 debugArrowColors[] = {
        255, 255, 0,   255, 0,   255, 0,   255, 255, 255, 0,   0, 0, 255, 0,   0, 0, 255, 128, 128,
        128, 128, 128, 0,   128, 0,   128, 0,   128, 0,   128, 0, 0, 0,   128, 0, 0, 0,   128,
    }; // These seem to be mistyped. Logically they should be s16[13][3] and be indexed as [colorIndex][i]
    s32 pad;
    EnWonderItem* this = THIS;
    s32 colorIndex;

    if (this->timer != 0) {
        this->timer--;
    }
    this->updateFunc(this, globalCtx);

    if (this->wonderMode == WONDERITEM_UNUSED) {
        Actor_SetHeight(&this->actor, this->unkHeight);
    }
    if ((this->wonderMode == WONDERITEM_INTERACT_SWITCH) || (this->wonderMode == WONDERITEM_BOMB_SOLDIER)) {
        Collider_CylinderUpdate(&this->actor, &this->collider);
        CollisionCheck_SetAC(globalCtx, &globalCtx->colChkCtx, &this->collider.base);
    }

    colorIndex = this->wonderMode;
    if (this->wonderMode > 12) {
        colorIndex = 0;
    }
    if (BREG(0) != 0) {
        DebugDisplay_AddObject(this->actor.posRot.pos.x, this->actor.posRot.pos.y, this->actor.posRot.pos.z,
                               this->actor.posRot.rot.x, this->actor.posRot.rot.y, this->actor.posRot.rot.z, 1.0f, 1.0f,
                               1.0f, debugArrowColors[colorIndex], debugArrowColors[colorIndex + 1],
                               debugArrowColors[colorIndex + 2], 255, 4, globalCtx->state.gfxCtx);
    }
}
