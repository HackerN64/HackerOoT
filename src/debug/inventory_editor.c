#include "config.h"

/**
 * TODO:
 * - bean bought flag
 * - @bug where pressing A when having broken knife or BGS does nothing
 * - code cleanup
 * - @bug when switching from info to hud edit
 * - @bug the magic bar doesn't update properly (in the misc screen and after closing it)
 * - improvement: add the possibility to remove the magic meter (draw "None"?)
 */

#include "global.h"

#include "assets/textures/parameter_static/parameter_static.h"
#include "assets/textures/icon_item_24_static/icon_item_24_static.h"
#include "assets/textures/icon_item_static/icon_item_static.h"

// Item ID corresponding to each slot, aside from bottles and trade items
static u8 sSlotToItems[] = {
    ITEM_DEKU_STICK, ITEM_DEKU_NUT,      ITEM_BOMB,       ITEM_BOW,      ITEM_ARROW_FIRE,  ITEM_DINS_FIRE,
    ITEM_SLINGSHOT,  ITEM_OCARINA_FAIRY, ITEM_BOMBCHU,    ITEM_HOOKSHOT, ITEM_ARROW_ICE,   ITEM_FARORES_WIND,
    ITEM_BOOMERANG,  ITEM_LENS_OF_TRUTH, ITEM_MAGIC_BEAN, ITEM_HAMMER,   ITEM_ARROW_LIGHT, ITEM_NAYRUS_LOVE,
};

static u8 sUpgradeTypes[] = { UPG_QUIVER,     UPG_BOMB_BAG,    UPG_STRENGTH,  UPG_SCALE,
                              UPG_BULLET_BAG, UPG_DEKU_STICKS, UPG_DEKU_NUTS, UPG_WALLET };

u8 InventoryEditor_GetItemFromSlot(InventoryEditor* this) {
    if (IS_INV_EDITOR_ACTIVE && this->pauseCtx->pageIndex == PAUSE_ITEM) {
        if (IS_IN_RANGE(this->common.selectedSlot, SLOT_BOTTLE_1, SLOT_BOTTLE_4)) {
            return this->itemDebug.bottleItems[this->common.selectedSlot - SLOT_BOTTLE_1];
        }

        if (this->common.selectedSlot == SLOT_TRADE_CHILD) {
            return this->itemDebug.childTradeItem;
        }

        if (this->common.selectedSlot == SLOT_TRADE_ADULT) {
            return this->itemDebug.adultTradeItem;
        }

        if (this->common.selectedSlot == SLOT_HOOKSHOT) {
            return this->itemDebug.hookshotType;
        }

        if (this->common.selectedSlot < ARRAY_COUNT(sSlotToItems)) {
            return sSlotToItems[this->common.selectedSlot];
        }
    }

    return ITEM_NONE;
}

void InventoryEditor_SetItemFromSlot(InventoryEditor* this) {
    if ((this->common.selectedSlot != SLOT_NONE) && (this->common.selectedItem != ITEM_NONE)) {
        if (IS_IN_RANGE(this->common.selectedSlot, SLOT_BOTTLE_1, SLOT_BOTTLE_4)) {
            this->itemDebug.bottleItems[this->common.selectedSlot - SLOT_BOTTLE_1] = this->common.selectedItem;
        }

        if (IS_IN_RANGE(this->common.selectedItem, ITEM_WEIRD_EGG, ITEM_SOLD_OUT)) {
            this->itemDebug.childTradeItem = this->common.selectedItem;
        }

        if (IS_IN_RANGE(this->common.selectedItem, ITEM_POCKET_EGG, ITEM_CLAIM_CHECK)) {
            this->itemDebug.adultTradeItem = this->common.selectedItem;
        }

        if (IS_IN_RANGE(this->common.selectedItem, ITEM_HOOKSHOT, ITEM_LONGSHOT)) {
            this->itemDebug.hookshotType = this->common.selectedItem;
        }
    }
}

void InventoryEditor_SetHUDAlpha(InventoryEditor* this) {
    InterfaceContext* interfaceCtx = &gDebug.play->interfaceCtx;

    interfaceCtx->bAlpha = this->elementsAlpha;
    interfaceCtx->aAlpha = this->elementsAlpha;
    interfaceCtx->cLeftAlpha = this->elementsAlpha;
    interfaceCtx->cDownAlpha = this->elementsAlpha;
    interfaceCtx->cRightAlpha = this->elementsAlpha;
    interfaceCtx->minimapAlpha = this->elementsAlpha;
    interfaceCtx->startAlpha = this->elementsAlpha;

    if (!this->miscDebug.showMiscScreen) {
        interfaceCtx->healthAlpha = this->elementsAlpha;
        interfaceCtx->magicAlpha = this->elementsAlpha;
    }
}

void InventoryEditor_UpdateMiscScreen(InventoryEditor* this) {
    s16 dgnIndexToMapIndex[] = {
        SCENE_FOREST_TEMPLE,
        SCENE_FIRE_TEMPLE,
        SCENE_WATER_TEMPLE,
        SCENE_SPIRIT_TEMPLE,
        SCENE_SHADOW_TEMPLE,
        -1,
        SCENE_DEKU_TREE,
        SCENE_DODONGOS_CAVERN,
        SCENE_JABU_JABU,
        SCENE_BOTTOM_OF_THE_WELL,
        SCENE_ICE_CAVERN,
        SCENE_GANONS_TOWER,
        SCENE_GERUDO_TRAINING_GROUND,
        SCENE_THIEVES_HIDEOUT,
        SCENE_INSIDE_GANONS_CASTLE,
        SCENE_TREASURE_BOX_SHOP,
    };

    if (!this->miscDebug.stickMoved && ((gDebug.input->rel.stick_y > 30) || (gDebug.input->rel.stick_x < -30))) {
        this->miscDebug.hudCursorPos--;
        this->miscDebug.stickMoved = true;
    }

    if (!this->miscDebug.stickMoved && ((gDebug.input->rel.stick_y < -30) || (gDebug.input->rel.stick_x > 30))) {
        this->miscDebug.hudCursorPos++;
        this->miscDebug.stickMoved = true;
    }

    if ((gDebug.input->rel.stick_y == 0) && (gDebug.input->rel.stick_x == 0)) {
        this->miscDebug.stickMoved = false;
    }

    if (this->miscDebug.hudCursorPos > INVEDITOR_CURSOR_POS_MAP) {
        this->miscDebug.hudCursorPos = INVEDITOR_CURSOR_POS_HEARTS;
    }

    if (this->miscDebug.hudCursorPos < INVEDITOR_CURSOR_POS_HEARTS) {
        this->miscDebug.hudCursorPos = INVEDITOR_CURSOR_POS_MAP;
    }

    // dungeon change
    if (IS_IN_RANGE(this->miscDebug.hudCursorPos, INVEDITOR_CURSOR_POS_SMALL_KEYS, INVEDITOR_CURSOR_POS_MAP)) {
        if (CHECK_BTN_ALL(gDebug.input->press.button, BTN_R)) {
            this->miscDebug.hudDungeonIconIndex++;
            if (this->miscDebug.hudDungeonIconIndex == 5) { // light medallion
                this->miscDebug.hudDungeonIconIndex++;
            }
        }

        if (CHECK_BTN_ALL(gDebug.input->press.button, BTN_Z)) {
            this->miscDebug.hudDungeonIconIndex--;
            if (this->miscDebug.hudDungeonIconIndex == 5) { // light medallion
                this->miscDebug.hudDungeonIconIndex--;
            }
        }

        // texture safeguards
        if (this->miscDebug.hudDungeonIconIndex < 0) {
            this->miscDebug.hudDungeonIconIndex = 15;
        }

        if (this->miscDebug.hudDungeonIconIndex > 15) {
            this->miscDebug.hudDungeonIconIndex = 0;
        }

        this->miscDebug.mapIndex = dgnIndexToMapIndex[this->miscDebug.hudDungeonIconIndex];

        if (this->miscDebug.mapIndex == -1) {
            PRINTF("Something's wrong with the map index: %d\n", this->miscDebug.mapIndex);
            return;
        }
    }

    switch (this->miscDebug.hudCursorPos) {
        case INVEDITOR_CURSOR_POS_HEARTS:
            if (CHECK_BTN_ALL(gDebug.input->press.button, BTN_A)) {
                gSaveContext.save.info.playerData.isDoubleDefenseAcquired ^= 1;
                this->miscDebug.updateDefenseHearts = true;
            }

            if (this->miscDebug.updateDefenseHearts) {
                if (gSaveContext.save.info.playerData.isDoubleDefenseAcquired) {
                    // 20 because 20 hearts in total
                    gSaveContext.save.info.inventory.defenseHearts =
                        TIMER_INCR(gSaveContext.save.info.inventory.defenseHearts, 20, 1);
                }

                if (!gSaveContext.save.info.playerData.isDoubleDefenseAcquired) {
                    gSaveContext.save.info.inventory.defenseHearts =
                        TIMER_DECR(gSaveContext.save.info.inventory.defenseHearts, 0, 1);
                }

                if ((gSaveContext.save.info.inventory.defenseHearts == 20) ||
                    (gSaveContext.save.info.inventory.defenseHearts == 0)) {
                    this->miscDebug.updateDefenseHearts = false;
                }
            }

            if (this->common.changeBy != 0) {
                if (CHECK_BTN_ALL(gDebug.input->cur.button, BTN_Z)) {
                    gSaveContext.save.info.playerData.health += this->common.changeBy;
                } else {
                    // heart counter increments by 0x10 for 1 heart
                    gSaveContext.save.info.playerData.healthCapacity += this->common.changeBy * 16;
                    gSaveContext.healthAccumulator = 0x140; // Refill 20 hearts
                }

                if (gSaveContext.save.info.playerData.healthCapacity < 0) {
                    gSaveContext.save.info.playerData.healthCapacity = 0;
                }

                if (gSaveContext.save.info.playerData.health < 0) {
                    gSaveContext.save.info.playerData.health = 0;
                }
            }
            break;
        case INVEDITOR_CURSOR_POS_MAGIC:
            if (!CHECK_BTN_ALL(gDebug.input->cur.button, BTN_Z) && CHECK_BTN_ALL(gDebug.input->press.button, BTN_A)) {
                gSaveContext.save.info.playerData.isDoubleMagicAcquired ^= 1;
                gSaveContext.save.info.playerData.magicLevel = 0;
                gSaveContext.magicFillTarget =
                    gSaveContext.save.info.playerData.isDoubleMagicAcquired ? MAGIC_DOUBLE_METER : MAGIC_NORMAL_METER;
            }

            if (CHECK_BTN_ALL(gDebug.input->cur.button, BTN_Z) && CHECK_BTN_ALL(gDebug.input->press.button, BTN_A)) {
                gSaveContext.save.info.playerData.isMagicAcquired ^= 1;
                gSaveContext.save.info.playerData.magicLevel = 0;
            }

            if (this->common.changeBy != 0) {
                gSaveContext.save.info.playerData.magic += this->common.changeBy;

                if (gSaveContext.save.info.playerData.magic < 0) {
                    gSaveContext.save.info.playerData.magic = 0;
                }
            }
            break;
        case INVEDITOR_CURSOR_POS_RUPEES:
            if (this->common.changeBy != 0) {
                gSaveContext.save.info.playerData.rupees += this->common.changeBy;
            }

            if (gSaveContext.save.info.playerData.rupees < 0) {
                gSaveContext.save.info.playerData.rupees = 0;
            }
            break;
        case INVEDITOR_CURSOR_POS_SMALL_KEYS:
            if ((this->common.changeBy != 0) && (this->common.changeBy != 100) && (this->common.changeBy != -100)) {
                gSaveContext.save.info.inventory.dungeonKeys[this->miscDebug.mapIndex] += this->common.changeBy;

                if (gSaveContext.save.info.inventory.dungeonKeys[this->miscDebug.mapIndex] < 0) {
                    gSaveContext.save.info.inventory.dungeonKeys[this->miscDebug.mapIndex] = 0;
                }
            }
            break;
        case INVEDITOR_CURSOR_POS_BOSS_KEY:
        case INVEDITOR_CURSOR_POS_COMPASS:
        case INVEDITOR_CURSOR_POS_MAP:
            if (CHECK_BTN_ALL(gDebug.input->press.button, BTN_A)) {
                gSaveContext.save.info.inventory.dungeonItems[this->miscDebug.mapIndex] ^=
                    gBitFlags[this->miscDebug.hudCursorPos - INVEDITOR_CURSOR_POS_BOSS_KEY];
            }
            break;
        default:
            break;
    }
}

void InventoryEditor_UpdateQuestScreen(InventoryEditor* this) {
    // clang-format off
    u8 slotToItem[] = {
        ITEM_MEDALLION_FOREST, ITEM_MEDALLION_FIRE,  ITEM_MEDALLION_WATER, ITEM_MEDALLION_SPIRIT,
        ITEM_MEDALLION_SHADOW, ITEM_MEDALLION_LIGHT, ITEM_SONG_MINUET,     ITEM_SONG_BOLERO,
        ITEM_SONG_SERENADE,    ITEM_SONG_REQUIEM,    ITEM_SONG_NOCTURNE,   ITEM_SONG_PRELUDE,
        ITEM_SONG_LULLABY,     ITEM_SONG_EPONA,      ITEM_SONG_SARIA,      ITEM_SONG_SUN,
        ITEM_SONG_TIME,        ITEM_SONG_STORMS,     ITEM_KOKIRI_EMERALD,  ITEM_GORON_RUBY,
        ITEM_ZORA_SAPPHIRE,    ITEM_STONE_OF_AGONY,  ITEM_GERUDOS_CARD,    ITEM_SKULL_TOKEN,
        ITEM_HEART_PIECE
    };
    // clang-format on

    this->common.selectedSlot = (this->common.selectedSlot == 231) ? 24 : this->common.selectedSlot;

    if (this->common.selectedSlot < ARRAY_COUNTU(slotToItem)) {
        u8 item = slotToItem[this->common.selectedSlot];

        if (CHECK_BTN_ALL(gDebug.input->press.button, BTN_A)) {
            u8 index = 0;

            if (IS_IN_RANGE(item, ITEM_MEDALLION_FOREST, ITEM_MEDALLION_LIGHT)) {
                index = item - ITEM_MEDALLION_FOREST + QUEST_MEDALLION_FOREST;
            } else if (IS_IN_RANGE(item, ITEM_SONG_MINUET, ITEM_SONG_STORMS)) {
                index = item - ITEM_SONG_MINUET + QUEST_SONG_MINUET;
            } else if (IS_IN_RANGE(item, ITEM_KOKIRI_EMERALD, ITEM_ZORA_SAPPHIRE)) {
                index = item - ITEM_KOKIRI_EMERALD + QUEST_KOKIRI_EMERALD;
            } else if ((item == ITEM_STONE_OF_AGONY) || (item == ITEM_GERUDOS_CARD)) {
                index = item - ITEM_STONE_OF_AGONY + QUEST_STONE_OF_AGONY;
            } else if (item == ITEM_SKULL_TOKEN) {
                index = item - ITEM_SKULL_TOKEN + QUEST_SKULL_TOKEN;
            }

            gSaveContext.save.info.inventory.questItems ^= gBitFlags[index];
        }

        if (this->common.changeBy != 0) {
            switch (item) {
                case ITEM_SKULL_TOKEN:
                    gSaveContext.save.info.inventory.gsTokens += this->common.changeBy;

                    if (gSaveContext.save.info.inventory.gsTokens < 0) {
                        gSaveContext.save.info.inventory.gsTokens = 999;
                    }

                    if (gSaveContext.save.info.inventory.gsTokens > 999) {
                        gSaveContext.save.info.inventory.gsTokens = 0;
                    }
                    break;
                case ITEM_HEART_PIECE:
                    if ((this->common.changeBy == 1) || (this->common.changeBy == -1)) {
                        gSaveContext.save.info.inventory.questItems +=
                            (this->common.changeBy << QUEST_HEART_PIECE_COUNT);
                    }

                    if (((gSaveContext.save.info.inventory.questItems & 0xF0000000) >> QUEST_HEART_PIECE_COUNT) > 3) {
                        u32 questItems = gSaveContext.save.info.inventory.questItems & 0x0FFFFFFF;
                        gSaveContext.save.info.inventory.questItems = (3 << QUEST_HEART_PIECE_COUNT) | questItems;
                    }
                    break;
                default:
                    break;
            }
        }
    }
}

void InventoryEditor_UpdateEquipmentScreen(InventoryEditor* this) {
    static u8 slotTo[] = {
        ITEM_NONE, ITEM_SWORD_KOKIRI, ITEM_SWORD_MASTER,  ITEM_SWORD_BIGGORON,
        ITEM_NONE, ITEM_SHIELD_DEKU,  ITEM_SHIELD_HYLIAN, ITEM_SHIELD_MIRROR,
        ITEM_NONE, ITEM_TUNIC_KOKIRI, ITEM_TUNIC_GORON,   ITEM_TUNIC_ZORA,
        ITEM_NONE, ITEM_BOOTS_KOKIRI, ITEM_BOOTS_IRON,    ITEM_BOOTS_HOVER,
    };

    if (this->pauseCtx->cursorX[PAUSE_EQUIP] > 0) {
        this->common.selectedSlot = this->pauseCtx->cursorSlot[PAUSE_EQUIP];
    } else {
        this->common.selectedSlot = this->pauseCtx->cursorY[PAUSE_EQUIP] * 4;
    }

    if (CHECK_BTN_ALL(gDebug.input->press.button, BTN_CUP)) {
        this->equipDebug.showMiscUpgrades ^= 1;
    }

    if (CHECK_BTN_ALL(gDebug.input->press.button, BTN_A)) {
        // equipment and upgrades are handled differently
        if (!INVEDITOR_IS_UPGRADE(this->common) && (slotTo[this->common.selectedSlot] != ITEM_NONE)) {
            u8 value = slotTo[this->common.selectedSlot] - ITEM_SWORD_KOKIRI;
            u8 equip = value / 3;

            if (!CHECK_OWNED_EQUIP(equip, (value % 3))) {
                // give equipment for selected slot
                gSaveContext.save.info.inventory.equipment |= OWNED_EQUIP_FLAG(equip, (value % 3));
            } else {
                // delete equipment for selected slot
                gSaveContext.save.info.inventory.equipment &= ~OWNED_EQUIP_FLAG(equip, (value % 3));
            }
        } else {
            u8 slotIndex = this->common.selectedSlot / 4;
            u8 upgradeType;
            s32 upgradeValue;

            if (this->equipDebug.showMiscUpgrades) {
                slotIndex += 4;
            }

            upgradeType = sUpgradeTypes[slotIndex];
            upgradeValue = CUR_UPG_VALUE(upgradeType);

            if (upgradeValue == 0) {
                Inventory_ChangeUpgrade(upgradeType, this->equipDebug.upgradeSlots[slotIndex]);
            } else {
                this->equipDebug.upgradeSlots[slotIndex] = upgradeValue;
                Inventory_ChangeUpgrade(upgradeType, 0);
            }
        }
    }

    if (this->common.changeBy != 0) {
        u8 upgradeType = sUpgradeTypes[this->common.selectedSlot / 4];
        u8 maxValue = 2; // there's only two diving scale/wallet upgrades
        s8 value;

        switch (this->common.selectedSlot) {
            case SLOT_UPG_BOMB_BAG:
            case SLOT_UPG_STRENGTH:
            case SLOT_UPG_QUIVER:
                maxValue = 3;
                FALLTHROUGH;
            case SLOT_UPG_SCALE:
                if (this->equipDebug.showMiscUpgrades) {
                    upgradeType = sUpgradeTypes[(this->common.selectedSlot / 4) + 4];
                }

                value = CUR_UPG_VALUE(upgradeType) + this->common.changeBy;
                if (value < 1) {
                    value = maxValue;
                } else if (value > maxValue) {
                    value = 1;
                }

                Inventory_ChangeUpgrade(upgradeType, value);
                break;
            case SLOT_SWORD_BIGGORON: {
                u8 equipValue = EQUIP_INV_SWORD_KOKIRI;
                u16 swordHealth = 1;

                if (gSaveContext.save.info.playerData.bgsFlag) {
                    gSaveContext.save.info.playerData.bgsFlag = false;

                    if (this->common.changeBy > 0) {
                        swordHealth = 0;
                        equipValue = EQUIP_INV_SWORD_BROKENGIANTKNIFE;
                    } else {
                        swordHealth = 8;
                        equipValue = EQUIP_INV_SWORD_BIGGORON;
                    }
                } else {
                    if (gSaveContext.save.info.playerData.swordHealth > 0) {
                        if (this->common.changeBy > 0) {
                            if (gSaveContext.save.info.playerData.swordHealth > 0) {
                                gSaveContext.save.info.playerData.bgsFlag = true;
                            }
                        } else {
                            swordHealth = 0;
                            equipValue = EQUIP_INV_SWORD_BROKENGIANTKNIFE;
                        }
                    } else {
                        if (this->common.changeBy < 0) {
                            gSaveContext.save.info.playerData.bgsFlag = true;
                        } else {
                            swordHealth = 8;
                            equipValue = EQUIP_INV_SWORD_BIGGORON;
                        }
                    }
                }

                gSaveContext.save.info.playerData.swordHealth =
                    (swordHealth != 1) ? swordHealth : gSaveContext.save.info.playerData.swordHealth;
                if (equipValue != EQUIP_INV_SWORD_KOKIRI) {
                    gSaveContext.save.info.inventory.equipment |= OWNED_EQUIP_FLAG(EQUIP_TYPE_SWORD, equipValue);
                    if (equipValue == EQUIP_INV_SWORD_BIGGORON) {
                        gSaveContext.save.info.inventory.equipment &=
                            ~OWNED_EQUIP_FLAG(EQUIP_TYPE_SWORD, EQUIP_INV_SWORD_BROKENGIANTKNIFE);
                    }
                }
            } break;
            default:
                break;
        }
    }
}

void InventoryEditor_UpdateItemScreen(InventoryEditor* this) {
    InventoryEditor_SetItemFromSlot(this);

    // Delete and restore items
    if (CHECK_BTN_ALL(gDebug.input->press.button, BTN_A)) {
        if (gSaveContext.save.info.inventory.items[this->common.selectedSlot] == ITEM_NONE) {
            u8 item = INVEDITOR_GET_VARIABLE_ITEM(this); // restore the special item
            gSaveContext.save.info.inventory.items[this->common.selectedSlot] =
                (item == ITEM_NONE) ? sSlotToItems[this->common.selectedSlot] : item;
        } else {
            // Delete the selected item
            Inventory_DeleteItem(this->common.selectedItem, this->common.selectedSlot);
        }
    }

    // logic for the inventory screen
    if ((this->common.changeBy != 0) && (this->common.selectedItem != ITEM_NONE)) {
        u8 item = this->common.selectedItem;
        u8 slot = this->common.selectedSlot;
        u8 min = ITEM_NONE, max = ITEM_NONE;

        switch (this->common.selectedSlot) {
            case SLOT_DEKU_STICK:
            case SLOT_DEKU_NUT:
            case SLOT_BOMB:
            case SLOT_BOW:
            case SLOT_SLINGSHOT:
            case SLOT_BOMBCHU:
            case SLOT_MAGIC_BEAN:
                AMMO(this->common.selectedItem) += this->common.changeBy;

                if (AMMO(this->common.selectedItem) > 99) {
                    AMMO(this->common.selectedItem) = 0;
                }

                if (AMMO(this->common.selectedItem) < 0) {
                    AMMO(this->common.selectedItem) = 99;
                }
                break;
            case SLOT_BOTTLE_1:
            case SLOT_BOTTLE_2:
            case SLOT_BOTTLE_3:
            case SLOT_BOTTLE_4:
                min = ITEM_BOTTLE_EMPTY;
                max = ITEM_BOTTLE_POE;
                break;
            case SLOT_TRADE_ADULT:
                min = ITEM_POCKET_EGG;
                max = ITEM_CLAIM_CHECK;
                break;
            case SLOT_TRADE_CHILD:
                min = ITEM_WEIRD_EGG;
                max = ITEM_SOLD_OUT;
                break;
            case SLOT_HOOKSHOT:
                min = ITEM_HOOKSHOT;
                max = ITEM_LONGSHOT;
            default:
                break;
        }

        if (min != ITEM_NONE && max != ITEM_NONE) {
            INVEDITOR_UPDATE_ITEM(this->common, min, max)
        }
    }
}

void InventoryEditor_UpdateInformationScreen(InventoryEditor* this) {
    // Background lifting/lowering animation
    if (this->showInfoScreen || this->miscDebug.showMiscScreen) {
        this->backgroundPosY = TIMER_DECR(this->backgroundPosY, INVEDITOR_BG_YPOS_TARGET, INVEDITOR_BG_ANIM_SPEED);
        this->titlePosY = TIMER_DECR(this->titlePosY, INVEDITOR_TITLE_YPOS_TARGET, INVEDITOR_TITLE_ANIM_SPEED);
        this->elementsAlpha = TIMER_DECR(this->elementsAlpha, 0, INVEDITOR_ALPHA_TRANS_SPEED);
    } else {
        this->backgroundPosY = TIMER_INCR(this->backgroundPosY, INVEDITOR_BG_YPOS, INVEDITOR_BG_ANIM_SPEED);
        this->titlePosY = TIMER_INCR(this->titlePosY, INVEDITOR_TITLE_YPOS, INVEDITOR_TITLE_ANIM_SPEED);
        this->elementsAlpha = TIMER_INCR(this->elementsAlpha, 255, INVEDITOR_ALPHA_TRANS_SPEED);
    }

    if (this->miscDebug.showMiscScreen) {
        this->miscDebug.hudTopPosY =
            TIMER_INCR(this->miscDebug.hudTopPosY, INVEDITOR_HUD_TOP_YPOS_TARGET, INVEDITOR_HUD_TOP_ANIM_SPEED);
        this->miscDebug.hudBottomPosY = TIMER_INCR(this->miscDebug.hudBottomPosY, INVEDITOR_HUD_BOTTOM_YPOS_TARGET,
                                                   INVEDITOR_HUD_BOTTOM_ANIM_SPEED);
        this->miscDebug.invertVal = TIMER_INCR(this->miscDebug.invertVal, INVEDITOR_HUD_BOTTOM_INVERT_TARGET,
                                               INVEDITOR_HUD_BOTTOM_INVERT_SPEED);
    } else {
        this->miscDebug.hudTopPosY =
            TIMER_DECR(this->miscDebug.hudTopPosY, INVEDITOR_HUD_TOP_YPOS, INVEDITOR_HUD_TOP_ANIM_SPEED);
        this->miscDebug.hudBottomPosY =
            TIMER_DECR(this->miscDebug.hudBottomPosY, INVEDITOR_HUD_BOTTOM_YPOS, INVEDITOR_HUD_BOTTOM_ANIM_SPEED);
        this->miscDebug.invertVal =
            TIMER_DECR(this->miscDebug.invertVal, INVEDITOR_HUD_BOTTOM_YPOS, INVEDITOR_HUD_BOTTOM_INVERT_SPEED);
    }

    if (!this->miscDebug.showMiscScreen) {
        InventoryEditor_SetHUDAlpha(this);
    }
}

void InventoryEditor_DrawRectangle(InventoryEditor* this, s32 leftX, s32 leftY, s32 rightX, s32 rightY,
                                   Color_RGBA8 rgba) {
    Vec2s leftPos = { leftX, leftY }, rightPos = { rightX, rightY };
    Debug_DrawColorRectangle(leftPos, rightPos, rgba);
}

void InventoryEditor_DrawMiscScreen(InventoryEditor* this) {
    // Cursor
    s32 leftX, leftY, rightX, rightY;
    Color_RGBA8 rgba = { 0, 50, 220, 100 };
    s32 cursorPos[INVEDITOR_CURSOR_POS_MAX][4] = {
        // { leftX, leftY, rightX, rightY },
        { 20, 55, 128, 77 },    // INVEDITOR_CURSOR_POS_HEARTS
        { 20, 77, 128, 90 },    // INVEDITOR_CURSOR_POS_MAGIC
        { 20, 90, 76, 106 },    // INVEDITOR_CURSOR_POS_RUPEES
        { 20, 105, 66, 123 },   // INVEDITOR_CURSOR_POS_SMALL_KEYS
        { 70, 105, 90, 123 },   // INVEDITOR_CURSOR_POS_BOSS_KEY
        { 97, 105, 117, 123 },  // INVEDITOR_CURSOR_POS_COMPASS
        { 124, 105, 144, 123 }, // INVEDITOR_CURSOR_POS_MAP
    };

    // Dungeon Icons
    u8 index = this->miscDebug.hudDungeonIconIndex;
    u8 width = ITEM_ICON_WIDTH;
    u8 height = ITEM_ICON_HEIGHT;
    u16 resizeFactor = 0;
    void* dgnIconTextures[] = {
        gQuestIconMedallionForestTex, gQuestIconMedallionFireTex,   gQuestIconMedallionWaterTex,
        gQuestIconMedallionSpiritTex, gQuestIconMedallionShadowTex, gQuestIconMedallionLightTex,
        gQuestIconKokiriEmeraldTex,   gQuestIconGoronRubyTex,       gQuestIconZoraSapphireTex,
        gItemIconLensOfTruthTex,      gItemIconBottleBlueFireTex,   gQuestIconDungeonBossKeyTex,
        gQuestIconGerudosCardTex,     gQuestIconSmallKeyTex,        gQuestIconMedallionLightTex,
        gQuestIconHeartPieceTex,
    };

    // Dungeon Items
    u8 i;
    u16 posX;
    void* dgnItemTextures[] = { gQuestIconDungeonBossKeyTex, gQuestIconDungeonCompassTex, gQuestIconDungeonMapTex };

    OPEN_DISPS(this->gfxCtx, __FILE__, __LINE__);

    // Cursor
    if ((this->miscDebug.hudCursorPos == INVEDITOR_CURSOR_POS_MAGIC) &&
        !gSaveContext.save.info.playerData.isDoubleMagicAcquired) {
        cursorPos[this->miscDebug.hudCursorPos][2] -= 48;
    }

    leftX = cursorPos[this->miscDebug.hudCursorPos][0];
    leftY = cursorPos[this->miscDebug.hudCursorPos][1];
    rightX = cursorPos[this->miscDebug.hudCursorPos][2];
    rightY = cursorPos[this->miscDebug.hudCursorPos][3];
    InventoryEditor_DrawRectangle(this, leftX, leftY, rightX, rightY, rgba);
    Gfx_SetupDL_39Overlay(this->gfxCtx);

    // Dungeon Icons
    if ((index <= 8) || IS_IN_RANGE(index, 11, 15)) {
        width = QUEST_ICON_WIDTH;
        height = QUEST_ICON_HEIGHT;
    } else {
        resizeFactor = 400;
    }
    gDPSetPrimColor(OVERLAY_DISP++, 0, 0, 255, 255, 255, 255);
    gDPLoadTextureBlock(OVERLAY_DISP++, dgnIconTextures[index], G_IM_FMT_RGBA, G_IM_SIZ_32b, width, height, 0,
                        G_TX_NOMIRROR | G_TX_WRAP, G_TX_NOMIRROR | G_TX_WRAP, G_TX_NOMASK, G_TX_NOMASK, G_TX_NOLOD,
                        G_TX_NOLOD);
    gSPTextureRectangle(OVERLAY_DISP++, 26 + 64, 417 + 75, 100 + 64, 490 + 75, G_TX_RENDERTILE, 0, 0,
                        (1 << 10) + 270 + resizeFactor, (1 << 10) + 270 + resizeFactor);

    // Dungeon Items
    for (posX = 258, i = 0; i < ARRAY_COUNTU(dgnItemTextures); posX += 110, i++) {
        Color_RGBA8 rgba;

        if (CHECK_DUNGEON_ITEM(i, this->miscDebug.mapIndex)) {
            rgba.r = rgba.g = rgba.b = rgba.a = 255;
        } else {
            rgba.r = rgba.g = rgba.b = rgba.a = 150;
        }

        gDPSetPrimColor(OVERLAY_DISP++, 0, 0, rgba.r, rgba.g, rgba.b, rgba.a);

        gDPLoadTextureBlock(OVERLAY_DISP++, dgnItemTextures[i], G_IM_FMT_RGBA, G_IM_SIZ_32b, QUEST_ICON_WIDTH,
                            QUEST_ICON_HEIGHT, 0, G_TX_NOMIRROR | G_TX_WRAP, G_TX_NOMIRROR | G_TX_WRAP, G_TX_NOMASK,
                            G_TX_NOMASK, G_TX_NOLOD, G_TX_NOLOD);

        gSPTextureRectangle(OVERLAY_DISP++, 26 + posX, 422, 95 + posX, 490, G_TX_RENDERTILE, 0, 0, (1 << 10) + 400,
                            (1 << 10) + 400);
    }

    CLOSE_DISPS(this->gfxCtx, __FILE__, __LINE__);
}

void InventoryEditor_DrawDigit(InventoryEditor* this, void* texture, u8 posX, u8 posY, s16 alpha) {
    //! @bug: the digits aren't moving with the rest of the equipment screen
    //! for now we stop drawing the digit if the current screen isn't the equipment one
    if (this->pauseCtx->pageIndex == PAUSE_EQUIP) {
        OPEN_DISPS(this->gfxCtx, __FILE__, __LINE__);

        DEBUG_DISP = Gfx_TextureIA8(DEBUG_DISP, texture, 8, 8, posX, posY, 8, 8, 1 << 10, 1 << 10);

        CLOSE_DISPS(this->gfxCtx, __FILE__, __LINE__);
    }
}

void InventoryEditor_DrawEquipmentUpgrades(InventoryEditor* this, u16 i, s16 alpha) {
    static u8 sUpgradeItems[] = { ITEM_QUIVER_30, ITEM_BOMB_BAG_20, ITEM_STRENGTH_GORONS_BRACELET, ITEM_SCALE_SILVER };
    static u8 sOtherUpgradeItem[] = { ITEM_BULLET_BAG_30, ITEM_DEKU_STICK, ITEM_DEKU_NUT, ITEM_ADULTS_WALLET };
    u8 upgradeValue;
    void* texture = NULL;
    void* ammoTexture = NULL;
    u8 posY = 0;

    if (!this->equipDebug.showMiscUpgrades) {
        upgradeValue = CUR_UPG_VALUE(sUpgradeTypes[i]);
        texture = gItemIcons[sUpgradeItems[i] + upgradeValue - 1];
    } else {
        u8 item = sOtherUpgradeItem[i];

        upgradeValue = CUR_UPG_VALUE(sUpgradeTypes[i + 4]);

        if (item == ITEM_DEKU_STICK || item == ITEM_DEKU_NUT) {
            texture = gItemIcons[item];
            posY = item == ITEM_DEKU_STICK ? 115 : 148;

            switch (upgradeValue) {
                case 1:
                    ammoTexture = item == ITEM_DEKU_STICK ? gAmmoDigit1Tex : gAmmoDigit2Tex;
                    break;
                case 2:
                    ammoTexture = item == ITEM_DEKU_STICK ? gAmmoDigit2Tex : gAmmoDigit3Tex;
                    break;
                case 3:
                    ammoTexture = item == ITEM_DEKU_STICK ? gAmmoDigit3Tex : gAmmoDigit4Tex;
                    break;
                default:
                    ammoTexture = NULL;
                    break;
            }
        } else {
            texture = gItemIcons[item + upgradeValue - 1];
        }
    }

    OPEN_DISPS(this->gfxCtx, __FILE__, __LINE__);

    if (upgradeValue != 0) {
        if (texture != NULL) {
            gDPLoadTextureBlock(POLY_OPA_DISP++, texture, G_IM_FMT_RGBA, G_IM_SIZ_32b, ITEM_ICON_WIDTH,
                                ITEM_ICON_HEIGHT, 0, G_TX_NOMIRROR | G_TX_WRAP, G_TX_NOMIRROR | G_TX_WRAP, G_TX_NOMASK,
                                G_TX_NOMASK, G_TX_NOLOD, G_TX_NOLOD);
            gSP1Quadrangle(POLY_OPA_DISP++, 0, 2, 3, 1, 0);
        }

        if (ammoTexture != NULL && posY != 0) {
            Gfx_SetupDL_39Debug(this->gfxCtx);
            gDPSetPrimColor(DEBUG_DISP++, 0, 0, 120, 255, 0, alpha);
            InventoryEditor_DrawDigit(this, ammoTexture, 58, posY, alpha);
            InventoryEditor_DrawDigit(this, gAmmoDigit0Tex, 64, posY, alpha);
        }
    }

    // draw page number
    gDPSetPrimColor(DEBUG_DISP++, 0, 0, 255, 255, 255, alpha);
    ammoTexture = this->equipDebug.showMiscUpgrades ? gAmmoDigit2Tex : gAmmoDigit1Tex;
    InventoryEditor_DrawDigit(this, ammoTexture, 56, 191, alpha);

    CLOSE_DISPS(this->gfxCtx, __FILE__, __LINE__);
}

void InventoryEditor_DrawInformationScreen(InventoryEditor* this) {
    s16 posY = this->titlePosY + 2;
    const char* ctrlsToPrint = NULL;

    // draw controls for the current inventory screen
    if (!this->miscDebug.showMiscScreen) {
        // clang-format off
        switch (this->pauseCtx->pageIndex) {
            case PAUSE_ITEM:
            case PAUSE_QUEST:
                ctrlsToPrint = (
                    "[C-Left]: Decrement" INVEDITOR_PRINT_NEWLINE
                    "[C-Right]: Increment" INVEDITOR_PRINT_NEWLINE
                    "[C-Up]: Hold to change by 10" INVEDITOR_PRINT_NEWLINE
                    "[A]: Delete/Give item" INVEDITOR_PRINT_NEWLINE
                );
                break;
            case PAUSE_EQUIP:
                ctrlsToPrint = (
                    "[C-Left/C-Right]: Change Upgrade Type" INVEDITOR_PRINT_NEWLINE
                    "[C-Up]: Show Other Upgrades" INVEDITOR_PRINT_NEWLINE
                    "[A]: Delete/Give item\n" INVEDITOR_PRINT_NEWLINE
                    "Other Upgrades:" INVEDITOR_PRINT_NEWLINE
                    "- Bullet Bag" INVEDITOR_PRINT_NEWLINE
                    "- Deku Stick Capacity" INVEDITOR_PRINT_NEWLINE
                    "- Nut Capacity" INVEDITOR_PRINT_NEWLINE
                    "- Wallet" INVEDITOR_PRINT_NEWLINE
                );
                break;
            default:
                ctrlsToPrint = NULL;
                break;
        }
        // clang-format on
    } else {
        ctrlsToPrint = "";
    }

    // draw build infos and controls for current inventory screen
    Print_Screen(&gDebug.printer, 2, posY, COLOR_WHITE, ("Build Version: %s"), gBuildGitVersion);

    if (ctrlsToPrint != NULL) {
        Print_Screen(&gDebug.printer, 2, (posY += 3), COLOR_WHITE, ctrlsToPrint);
    }

    Print_Screen(&gDebug.printer, 2, 28, COLOR_WHITE, "[B]: Misc Debug");
}

void InventoryEditor_Init(InventoryEditor* this) {
    u8 upgradeSlots[] = {
        ITEM_QUIVER_30,    ITEM_BOMB_BAG_20,   ITEM_STRENGTH_GORONS_BRACELET,
        ITEM_SCALE_SILVER, ITEM_BULLET_BAG_30, ITEM_DEKU_STICK,
        ITEM_DEKU_NUT,     ITEM_ADULTS_WALLET,
    };

    // Init general variables
    this->titleTimer = INVEDITOR_TITLE_TIMER;
    this->titleState = INVEDITOR_TITLE_STATE_NAME;
    this->showInfoScreen = false;
    this->miscDebug.showMiscScreen = false;
    this->backgroundPosY = INVEDITOR_BG_YPOS;
    this->titlePosY = INVEDITOR_TITLE_YPOS;
    this->common.changeBy = 0;

    if (this->common.state == INVEDITOR_COMMON_STATE_UNREADY) {
        u8 i = 0;

        // Init item debug values
        this->common.selectedItem = 0;
        this->common.selectedSlot = 0;
        this->itemDebug.childTradeItem = ITEM_WEIRD_EGG;
        this->itemDebug.adultTradeItem = ITEM_POCKET_EGG;
        this->itemDebug.hookshotType = ITEM_HOOKSHOT;

        for (i = 0; i < ARRAY_COUNTU(this->itemDebug.bottleItems); i++) {
            this->itemDebug.bottleItems[i] = ITEM_BOTTLE_EMPTY;
        }

        // Init equipment debug values
        this->equipDebug.showMiscUpgrades = false;

        for (i = 0; i < ARRAY_COUNTU(upgradeSlots); i++) {
            this->equipDebug.upgradeSlots[i] = upgradeSlots[i];
        }

        // Init misc debug
        this->miscDebug.hudTopPosY = INVEDITOR_HUD_TOP_YPOS;
        this->miscDebug.hudBottomPosY = INVEDITOR_HUD_BOTTOM_YPOS;
        this->miscDebug.invertVal = INVEDITOR_HUD_BOTTOM_YPOS;
        this->miscDebug.hudCursorPos = INVEDITOR_CURSOR_POS_HEARTS;
        this->miscDebug.hudDungeonIconIndex = 0;
        this->miscDebug.mapIndex = SCENE_FOREST_TEMPLE;
        this->miscDebug.stickMoved = false;
        this->miscDebug.updateDefenseHearts = false;

        // Update state to ready
        this->common.state = INVEDITOR_COMMON_STATE_READY;
    }
}

void InventoryEditor_Update(InventoryEditor* this) {
    this->common.changeBy = 0;

    if ((this->pauseCtx->pageIndex != PAUSE_MAP) && (this->pauseCtx->pageIndex != PAUSE_WORLD_MAP)) {
        this->common.selectedItem = this->pauseCtx->cursorItem[this->pauseCtx->pageIndex];
        this->common.selectedSlot = this->pauseCtx->cursorSlot[this->pauseCtx->pageIndex];
    }

    if (CHECK_BTN_ALL(gDebug.input->press.button, BTN_CLEFT)) {
        this->common.changeBy = -1;
    } else if (CHECK_BTN_ALL(gDebug.input->press.button, BTN_CRIGHT)) {
        this->common.changeBy = 1;
    }

    if (CHECK_BTN_ALL(gDebug.input->cur.button, BTN_CUP) && CHECK_BTN_ALL(gDebug.input->press.button, BTN_CLEFT)) {
        this->common.changeBy = -10;
    } else if (CHECK_BTN_ALL(gDebug.input->cur.button, BTN_CUP) &&
               CHECK_BTN_ALL(gDebug.input->press.button, BTN_CRIGHT)) {
        this->common.changeBy = 10;
    }

    if (this->miscDebug.showMiscScreen) {
        if (CHECK_BTN_ALL(gDebug.input->cur.button, BTN_R) && CHECK_BTN_ALL(gDebug.input->press.button, BTN_CLEFT)) {
            this->common.changeBy = -100;
        } else if (CHECK_BTN_ALL(gDebug.input->cur.button, BTN_R) &&
                   CHECK_BTN_ALL(gDebug.input->press.button, BTN_CRIGHT)) {
            this->common.changeBy = 100;
        }
    }

    //! TODO: make it so you can switch between misc and info screens
    //! currently there's an issue where the misc elements aren't showing properly

    // Toggle informations screen
    if (!this->miscDebug.showMiscScreen && CHECK_BTN_ALL(gDebug.input->press.button, BTN_CDOWN)) {
        this->showInfoScreen ^= 1;

        if (this->titleState == INVEDITOR_TITLE_STATE_MISCDBG) {
            this->titleState = INVEDITOR_TITLE_STATE_NAME;
        }
    }

    // Toggle Misc Debug
    if (!this->showInfoScreen && CHECK_BTN_ALL(gDebug.input->press.button, BTN_B)) {
        this->miscDebug.showMiscScreen ^= 1;

        if (this->miscDebug.showMiscScreen) {
            this->titleState = INVEDITOR_TITLE_STATE_MISCDBG;
        } else {
            this->titleState = INVEDITOR_TITLE_STATE_NAME;
        }
    }

    if (!this->showInfoScreen && this->miscDebug.showMiscScreen) {
        this->miscElementsAlpha = TIMER_INCR(this->miscElementsAlpha, 255, INVEDITOR_ALPHA_TRANS_SPEED);
        InventoryEditor_UpdateMiscScreen(this);
    } else {
        // Update the current screen if the cursor isn't on the L or R icons
        if ((this->pauseCtx->cursorSpecialPos != PAUSE_CURSOR_PAGE_LEFT) &&
            (this->pauseCtx->cursorSpecialPos != PAUSE_CURSOR_PAGE_RIGHT) && !this->showInfoScreen) {
            switch (this->pauseCtx->pageIndex) {
                case PAUSE_ITEM:
                    InventoryEditor_UpdateItemScreen(this);
                    break;
                case PAUSE_EQUIP:
                    InventoryEditor_UpdateEquipmentScreen(this);
                    break;
                case PAUSE_QUEST:
                    InventoryEditor_UpdateQuestScreen(this);
                    break;
                default:
                    break;
            }
        }
    }

    InventoryEditor_UpdateInformationScreen(this);

    // Update the printing state, used to switch between several texts on-screen
    this->titleTimer = TIMER_DECR(this->titleTimer, 0, 1);
    if (this->titleTimer == 0) {
        switch (this->titleState) {
            case INVEDITOR_TITLE_STATE_NAME:
                this->titleState = INVEDITOR_TITLE_STATE_COMMANDS;
                break;
            case INVEDITOR_TITLE_STATE_COMMANDS:
                this->titleState = INVEDITOR_TITLE_STATE_NAME;
                break;
            default:
                break;
        }

        this->titleTimer = INVEDITOR_TITLE_TIMER;
    }
}

void InventoryEditor_Draw(InventoryEditor* this) {
    // draw background for the "debug mode" text
    Color_RGBA8 rgba = { 0, 0, 0, 220 };
    InventoryEditor_DrawRectangle(this, 0, this->backgroundPosY, SCREEN_WIDTH, SCREEN_HEIGHT, rgba);

    // draw bottom screen text, will be on top if in info mode
    switch (this->titleState) {
        case INVEDITOR_TITLE_STATE_NAME:
            Print_Screen(&gDebug.printer, 14, this->titlePosY, COLOR_WHITE, "[DEBUG MODE]");
            break;
        case INVEDITOR_TITLE_STATE_COMMANDS:
            Print_Screen(&gDebug.printer, 9, this->titlePosY, COLOR_WHITE, "[C-DOWN: INFORMATIONS]");
            break;
        case INVEDITOR_TITLE_STATE_MISCDBG:
            Print_Screen(&gDebug.printer, 14, this->titlePosY, COLOR_WHITE, "[MISC DEBUG]");
            break;
        default:
            break;
    }

    // draw the informations on the panel
    if ((this->showInfoScreen || this->miscDebug.showMiscScreen) && (this->titlePosY == INVEDITOR_TITLE_YPOS_TARGET)) {
        InventoryEditor_DrawInformationScreen(this);

        if (this->miscDebug.showMiscScreen) {
            u8 mapIndex = this->miscDebug.hudDungeonIconIndex;
            const char* dungeonNames[] = {
                // clang-format off
                "Forest Temple",           "Fire Temple",      "Water Temple",
                "Spirit Temple",           "Shadow Temple",    NULL,
                "Inside the Deku Tree",    "Dodongo's Cavern", "Jabu-Jabu's Belly",
                "Bottom of the Well",      "Ice Cavern",       "Ganon's Tower",
                "Gerudo Training Grounds", "Thieves Hideout",  "Ganon's Castle",
                "Treasure Chest Minigame"
                // clang-format on
            };

            if (dungeonNames[mapIndex] != NULL) {
                Print_Screen(&gDebug.printer, 6, 16, COLOR_WHITE, dungeonNames[mapIndex]);
                InventoryEditor_DrawMiscScreen(this);
            }
        }

        // draw separators (from top to bottom)
        {
            u8 i;
            s32 positions[][4] = {
                // { leftX, leftY, rightX, rightY },
                { 0, ((SCREEN_HEIGHT / 10) + 3), SCREEN_WIDTH, ((SCREEN_HEIGHT / 10) + 3) },
                { 0, ((SCREEN_HEIGHT / 5) + 4), SCREEN_WIDTH, ((SCREEN_HEIGHT / 5) + 5) },
            };

            rgba.r = rgba.g = rgba.b = rgba.a = 255;
            for (i = 0; i < ARRAY_COUNT(positions); i++) {
                InventoryEditor_DrawRectangle(this, positions[i][0], positions[i][1], positions[i][2], positions[i][3],
                                              rgba);
            }
        }
    }
}

bool InventoryEditor_Destroy(InventoryEditor* this) {
    // Restore alpha values for the HUD/Inventory
    if (this->showInfoScreen || this->miscDebug.showMiscScreen) {
        this->showInfoScreen = false;
        this->miscDebug.showMiscScreen = false;
    } else {
        // When the alpha hits 255 exit the inventory editor
        if ((this->elementsAlpha == 255) && (this->backgroundPosY == INVEDITOR_BG_YPOS)) {
            this->pauseCtx->cursorSpecialPos = PAUSE_CURSOR_PAGE_LEFT; // avoids having the cursor on a blank slot
            return true;
        }
    }

    // In order to make the transition properly we need to keep updating the info panel
    // and draw stuff until everything's back to normal
    InventoryEditor_UpdateInformationScreen(this);
    InventoryEditor_Draw(this);

    return false;
}

void InventoryEditor_Main(InventoryEditor* this) {
    switch (this->state) {
        case INVEDITOR_STATE_INIT:
            PRINTF("[INVENTORY EDITOR]: Init Start!\n");
            this->state = INVEDITOR_STATE_UPDATE;
            InventoryEditor_Init(this);
            PRINTF("[INVENTORY EDITOR]: Init Complete!\n");
            break;
        case INVEDITOR_STATE_UPDATE:
            if (CHECK_BTN_ALL(gDebug.input->press.button, BTN_L)) {
                this->state = INVEDITOR_STATE_DESTROY;
            }

            if (this->common.state == INVEDITOR_COMMON_STATE_READY) {
                InventoryEditor_Update(this);
                InventoryEditor_Draw(this);
            }
            break;
        case INVEDITOR_STATE_DESTROY:
            if (InventoryEditor_Destroy(this)) {
                this->state = INVEDITOR_STATE_OFF;
                PRINTF("[INVENTORY EDITOR]: Quitting!\n");
            }
            break;
        default:
            PRINTF("[INVENTORY EDITOR]: This state is not implemented yet.\n");
            break;
    }
}
