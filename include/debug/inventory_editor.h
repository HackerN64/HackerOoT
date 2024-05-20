#ifndef INVENTORY_EDITOR_H
#define INVENTORY_EDITOR_H

#include "config.h"
#include "z64pause.h"

typedef enum InvEditorCursorPos {
    INVEDITOR_CURSOR_POS_MIN = -1,
    INVEDITOR_CURSOR_POS_HEARTS,
    INVEDITOR_CURSOR_POS_MAGIC,
    INVEDITOR_CURSOR_POS_RUPEES,
    INVEDITOR_CURSOR_POS_SMALL_KEYS,
    INVEDITOR_CURSOR_POS_BOSS_KEY,
    INVEDITOR_CURSOR_POS_COMPASS,
    INVEDITOR_CURSOR_POS_MAP,
    INVEDITOR_CURSOR_POS_MAX
} InvEditorCursorPos;

typedef enum InvEditorTitleState {
    INVEDITOR_TITLE_STATE_MIN = -1,
    INVEDITOR_TITLE_STATE_NAME,
    INVEDITOR_TITLE_STATE_COMMANDS,
    INVEDITOR_TITLE_STATE_MISCDBG
} InvEditorTitleState;

typedef enum InvEditorCommonState {
    INVEDITOR_COMMON_STATE_MIN = -1,
    INVEDITOR_COMMON_STATE_UNREADY,
    INVEDITOR_COMMON_STATE_READY
} InvEditorCommonState;

typedef enum InvEditorState {
    INVEDITOR_STATE_MIN = -1,
    INVEDITOR_STATE_OFF,
    INVEDITOR_STATE_INIT,
    INVEDITOR_STATE_UPDATE,
    INVEDITOR_STATE_DESTROY
} InvEditorState;

typedef struct InventoryEditorCommon {
    InvEditorCommonState state;
    u8 selectedItem;
    u8 selectedSlot;
    s8 changeBy;
} InvEditorCommon;

typedef struct InvEditorItems {
    u8 childTradeItem;
    u8 adultTradeItem;
    u8 hookshotType;
    u8 bottleItems[4];
} InvEditorItems;

typedef struct InvEditorEquipment {
    u8 showMiscUpgrades;
    u8 upgradeSlots[8];
    u8 upgradeValues[8];
} InvEditorEquipment;

typedef struct InvEditorMisc {
    u8 showMiscScreen;
    u8 stickMoved;
    u8 updateDefenseHearts;
    InvEditorCursorPos hudCursorPos;
    s8 hudDungeonIconIndex;
    s16 hudTopPosY;
    s16 hudBottomPosY;
    s16 invertVal;
    s16 mapIndex;
} InvEditorMisc;

struct GraphicsContext;

typedef struct InventoryEditor {
    InvEditorState state;
    GraphicsContext* gfxCtx;
    PauseContext* pauseCtx;
    InvEditorCommon common;
    InvEditorItems itemDebug;
    InvEditorEquipment equipDebug;
    InvEditorMisc miscDebug;
    u8 titleTimer;
    InvEditorTitleState titleState;
    s16 titlePosY;
    s16 backgroundPosY;
    u8 showInfoScreen;
    s16 elementsAlpha;
    s16 miscElementsAlpha;
} InventoryEditor;

Gfx* Gfx_TextureIA8(Gfx* displayListHead, void* texture, s16 textureWidth, s16 textureHeight, s16 rectLeft, s16 rectTop,
                    s16 rectWidth, s16 rectHeight, u16 dsdx, u16 dtdy);

u8 InventoryEditor_GetItemFromSlot(InventoryEditor* this);
void InventoryEditor_SetItemFromSlot(InventoryEditor* this);
void InventoryEditor_SetHUDAlpha(InventoryEditor* this);
void InventoryEditor_UpdateMiscScreen(InventoryEditor* this);
void InventoryEditor_UpdateQuestScreen(InventoryEditor* this);
void InventoryEditor_UpdateEquipmentScreen(InventoryEditor* this);
void InventoryEditor_UpdateItemScreen(InventoryEditor* this);
void InventoryEditor_UpdateInformationScreen(InventoryEditor* this);
void InventoryEditor_DrawRectangle(InventoryEditor* this, s32 leftX, s32 leftY, s32 rightX, s32 rightY, Color_RGBA8 rgba);
void InventoryEditor_DrawMiscScreen(InventoryEditor* this);
void InventoryEditor_DrawEquipmentUpgrades(InventoryEditor* this, u16 i, s16 alpha);
void InventoryEditor_DrawInformationScreen(InventoryEditor* this);
void InventoryEditor_Init(InventoryEditor* this);
void InventoryEditor_Update(InventoryEditor* this);
void InventoryEditor_Draw(InventoryEditor* this);
bool InventoryEditor_Destroy(InventoryEditor* this);
void InventoryEditor_Main(InventoryEditor* this);

// General
#define INVEDITOR_PRINT_NEWLINE "\n  "
#define INVEDITOR_ANIM_BASE_SPEED 16

#define INVEDITOR_BG_ANIM_SPEED INVEDITOR_ANIM_BASE_SPEED
#define INVEDITOR_BG_YPOS_TARGET 0
#define INVEDITOR_BG_YPOS 220

#define INVEDITOR_TITLE_TIMER 70 // frames
#define INVEDITOR_TITLE_ANIM_SPEED INVEDITOR_ANIM_BASE_SPEED / 8
#define INVEDITOR_TITLE_YPOS_TARGET 2
#define INVEDITOR_TITLE_YPOS 28

#define INVEDITOR_ALPHA_TRANS_SPEED INVEDITOR_ANIM_BASE_SPEED * 2

// Items
#define INVEDITOR_GET_BOTTLE_ITEM(invDebug)                                                      \
    (IS_IN_RANGE((invDebug)->common.selectedSlot, SLOT_BOTTLE_1, SLOT_BOTTLE_4)                     \
         ? (invDebug)->itemDebug.bottleItems[(invDebug)->common.selectedSlot - SLOT_BOTTLE_1] \
         : ITEM_NONE)

#define INVEDITOR_GET_CHILD_TRADE_ITEM(invDebug) \
    (((invDebug)->common.selectedSlot == SLOT_TRADE_CHILD) ? (invDebug)->itemDebug.childTradeItem : ITEM_NONE)

#define INVEDITOR_GET_ADULT_TRADE_ITEM(invDebug) \
    (((invDebug)->common.selectedSlot == SLOT_TRADE_ADULT) ? (invDebug)->itemDebug.adultTradeItem : ITEM_NONE)

#define INVEDITOR_GET_HOOKSHOT(invDebug) \
    (((invDebug)->common.selectedSlot == SLOT_HOOKSHOT) ? (invDebug)->itemDebug.hookshotType : ITEM_NONE)

#define INVEDITOR_GET_VARIABLE_ITEM(invDebug)                                                          \
    ((INVEDITOR_GET_BOTTLE_ITEM(invDebug) != ITEM_NONE)        ? INVEDITOR_GET_BOTTLE_ITEM(invDebug)      \
     : (INVEDITOR_GET_CHILD_TRADE_ITEM(invDebug) != ITEM_NONE) ? INVEDITOR_GET_CHILD_TRADE_ITEM(invDebug) \
     : (INVEDITOR_GET_ADULT_TRADE_ITEM(invDebug) != ITEM_NONE) ? INVEDITOR_GET_ADULT_TRADE_ITEM(invDebug) \
     : (INVEDITOR_GET_HOOKSHOT(invDebug) != ITEM_NONE)         ? INVEDITOR_GET_HOOKSHOT(invDebug)         \
                                                            : ITEM_NONE)

#define INVEDITOR_UPDATE_ITEM(invDbgCommon, min, max)                                                      \
    {                                                                                                   \
        if (IS_IN_RANGE(invDbgCommon.selectedItem, min, max)) {                                               \
            gSaveContext.save.info.inventory.items[invDbgCommon.selectedSlot] += invDbgCommon.changeBy; \
            if (gSaveContext.save.info.inventory.items[invDbgCommon.selectedSlot] > max) {              \
                gSaveContext.save.info.inventory.items[invDbgCommon.selectedSlot] = min;                \
            }                                                                                           \
                                                                                                        \
            if (gSaveContext.save.info.inventory.items[invDbgCommon.selectedSlot] < min) {              \
                gSaveContext.save.info.inventory.items[invDbgCommon.selectedSlot] = max;                \
            }                                                                                           \
        }                                                                                               \
    }

// Equipment
#define INVEDITOR_IS_UPGRADE(invDbgCommon)                                                                        \
    (((invDbgCommon).selectedSlot == SLOT_UPG_QUIVER) || ((invDbgCommon).selectedSlot == SLOT_UPG_BOMB_BAG) || \
     ((invDbgCommon).selectedSlot == SLOT_UPG_STRENGTH) || ((invDbgCommon).selectedSlot == SLOT_UPG_SCALE))

// Misc
#define INVEDITOR_HUD_TOP_ANIM_SPEED INVEDITOR_ANIM_BASE_SPEED / 5
#define INVEDITOR_HUD_TOP_YPOS_TARGET 35
#define INVEDITOR_HUD_TOP_YPOS 0

#define INVEDITOR_HUD_BOTTOM_ANIM_SPEED INVEDITOR_ANIM_BASE_SPEED / 2
#define INVEDITOR_HUD_BOTTOM_YPOS_TARGET 100
#define INVEDITOR_HUD_BOTTOM_YPOS 0
#define INVEDITOR_HUD_BOTTOM_INVERT_SPEED INVEDITOR_ANIM_BASE_SPEED / 16
#define INVEDITOR_HUD_BOTTOM_INVERT_TARGET 16

#endif
