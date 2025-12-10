#include "segmented_address.h"
#include "play_state.h"
#include "printf.h"
#include "save.h"
#include "array_count.h"
#include "event_manager.h"

#define STRINGIFY(s) #s
#define EXPAND_AND_STRINGIFY(s) STRINGIFY(s)
#define log(...) PRINTF("Line " EXPAND_AND_STRINGIFY(__LINE__) " - " __VA_ARGS__);

static u8 EventManager_UnsignedCondition(u8 condType, u32 a, u32 b);
static u8 EventManager_SignedCondition(u8 condType, s32 a, s32 b);
static void EventManager_ProcessFlag(GameState* gameState, EventFlag* event, u8* pabFlags);
static void EventManager_ProcessGame(GameState* gameState, EventGame* event, u8* pabGame);
static void EventManager_ProcessTime(GameState* gameState, EventTime* event, u8* pabTime);
static u8 EventManager_Validate(u8* pabType, u8 length);

static u8 sEventActionType = EVENT_ACTION_TYPE_NONE;

// probably dumb
#define EventManager_ConditionImpl(condType, a, b) \
    {                                              \
        switch ((condType)) {                      \
            case EVENT_COND_EQUAL:                 \
                return (b) == (a);                 \
            case EVENT_COND_DIFF:                  \
                return (b) != (a);                 \
            case EVENT_COND_INFERIOR:              \
                return (b) < (a);                  \
            case EVENT_COND_SUPERIOR:              \
                return (b) > (a);                  \
            case EVENT_COND_INFERIOR_EQ:           \
                return (b) <= (a);                 \
            case EVENT_COND_SUPERIOR_EQ:           \
                return (b) >= (a);                 \
            default:                               \
                break;                             \
        }                                          \
    }

// most likely unnecessary but to make sure it's fine
static u8 EventManager_UnsignedCondition(u8 condType, u32 a, u32 b) {
    EventManager_ConditionImpl(condType, a, b);
    return true;
}

static u8 EventManager_SignedCondition(u8 condType, s32 a, s32 b) {
    EventManager_ConditionImpl(condType, a, b);
    return true;
}

// performs the necessary checks to handle flag events
static void EventManager_ProcessFlag(GameState* gameState, EventFlag* event, u8* pabFlags) {
    PlayState* play = (PlayState*)gameState;
    u8 allowDraw = true;

    // make sure this is the play state
    if (gSaveContext.gameMode == GAMEMODE_NORMAL) {
        switch (event->type) {
            case EVENT_FLAG_TYPE_SWITCH_FLAG:
                allowDraw = Flags_GetSwitch(play, event->flag) != 0;
                break;
            case EVENT_FLAG_TYPE_EVENTCHKINF_FLAG:
                allowDraw = Flags_GetEventChkInf(event->flag) != 0;
                break;
            case EVENT_FLAG_TYPE_INF_FLAG:
                allowDraw = Flags_GetInfTable(event->flag) != 0;
                break;
            case EVENT_FLAG_TYPE_COLLECTIBLE_FLAG:
                allowDraw = Flags_GetCollectible(play, event->flag) != 0;
                break;
            case EVENT_FLAG_TYPE_TREASURE_FLAG:
                allowDraw = Flags_GetTreasure(play, event->flag) != 0;
                break;
            case EVENT_FLAG_TYPE_TEMPCLEAR_FLAG:
                allowDraw = Flags_GetTempClear(play, event->flag) != 0;
                break;
            case EVENT_FLAG_TYPE_CLEAR_FLAG:
                allowDraw = Flags_GetClear(play, event->flag) != 0;
                break;
            default:
                break;
        }
    }

    pabFlags[event->type] = allowDraw;
}

// performs the necessary checks to handle game events
static void EventManager_ProcessGame(GameState* gameState, EventGame* event, u8* pabGame) {
    u8 allowDraw = true;
    u8 value;

    switch (event->type) {
        case EVENT_GAME_TYPE_AGE:
            allowDraw = event->age == gSaveContext.save.linkAge;
            break;
        case EVENT_GAME_TYPE_HEALTH:
            allowDraw =
                EventManager_SignedCondition(event->condType, event->health, gSaveContext.save.info.playerData.health);
            break;
        case EVENT_GAME_TYPE_RUPEES:
            allowDraw =
                EventManager_SignedCondition(event->condType, event->rupees, gSaveContext.save.info.playerData.rupees);
            break;
        case EVENT_GAME_TYPE_MAGIC:
            allowDraw =
                EventManager_SignedCondition(event->condType, event->magic, gSaveContext.save.info.playerData.magic);
            break;
        case EVENT_GAME_TYPE_INVENTORY:
            if (event->inventory.itemId == ITEM_NONE) {
                break;
            }

            switch (event->inventory.type) {
                case EVENT_INV_TYPE_ITEMS:
                    value = gSaveContext.save.info.inventory.items[event->inventory.itemId];
                    allowDraw = event->inventory.obtained ? value != ITEM_NONE : value == ITEM_NONE;

                    if (event->inventory.amount >= 0) {
                        allowDraw = allowDraw && EventManager_SignedCondition(event->condType, event->inventory.amount,
                                                                              AMMO(event->inventory.itemId));
                    }
                    break;
                case EVENT_INV_TYPE_EQUIPMENT:
                    // swords, shields, tunics and boots
                    if (event->inventory.itemId >= ITEM_SWORD_KOKIRI && event->inventory.itemId <= ITEM_BOOTS_HOVER) {
                        u8 itemId = event->inventory.itemId - ITEM_SWORD_KOKIRI;
                        value = CHECK_OWNED_EQUIP(itemId / 3, itemId % 3);
                        allowDraw = event->inventory.obtained ? value : !value;

                        if (event->inventory.itemId == ITEM_SWORD_BIGGORON && event->inventory.swordHealth != (u8)-1) {
                            allowDraw = allowDraw &&
                                        EventManager_UnsignedCondition(event->condType, event->inventory.swordHealth,
                                                                       gSaveContext.save.info.playerData.swordHealth);
                        }

                        break;
                    }

                    // upgrades
                    if (event->inventory.upgradeType < UPG_MAX) {
                        allowDraw = EventManager_UnsignedCondition(event->condType, event->inventory.upgradeValue,
                                                                   CUR_UPG_VALUE(event->inventory.upgradeType));
                        break;
                    }
                    break;
                case EVENT_INV_TYPE_QUEST:
                    value = CHECK_QUEST_ITEM(event->inventory.questItem);
                    allowDraw = event->inventory.obtained ? value : !value;
                    break;
                //! TODO: improve how dungeon items are handled in the game
                // case EVENT_INV_TYPE_DUNGEON_ITEMS:
                //     break;
                // case EVENT_INV_TYPE_DUNGEON_KEYS:
                //     if (event->inventory.sceneId < ARRAY_COUNT(gSaveContext.save.info.inventory.dungeonKeys)) {
                //         allowDraw = EventManager_SignedCondition(event->condType, event->inventory.amount,
                //         gSaveContext.save.info.inventory.dungeonKeys[event->inventory.sceneId]);
                //     }
                //     break;
                case EVENT_INV_TYPE_GS_TOKENS:
                    if (!CHECK_QUEST_ITEM(QUEST_SKULL_TOKEN)) {
                        allowDraw = false;
                        break;
                    }

                    allowDraw = EventManager_SignedCondition(event->condType, event->inventory.gsTokens,
                                                             gSaveContext.save.info.inventory.gsTokens);
                    break;
                default:
                    break;
            }
            break;
        default:
            break;
    }

    pabGame[event->type] = allowDraw;
}

// performs the necessary checks to handle time events
static void EventManager_ProcessTime(GameState* gameState, EventTime* event, u8* pabTime) {
    u8 allowDraw = true;

    if (event->isClock) {
        allowDraw = EventManager_UnsignedCondition(event->clocks[0].condType,
                                                   CLOCK_TIME(event->clocks[0].hour, event->clocks[0].minute),
                                                   gSaveContext.save.dayTime);

        if (event->isRange) {
            allowDraw =
                allowDraw && EventManager_UnsignedCondition(event->clocks[1].condType,
                                                            CLOCK_TIME(event->clocks[1].hour, event->clocks[1].minute),
                                                            gSaveContext.save.dayTime);
        }
    } else {
        allowDraw = event->nightFlag == gSaveContext.save.nightFlag;
    }

    pabTime[event->type] = allowDraw;
}

// returns false if a bool is in the array
static u8 EventManager_Validate(u8* pabType, u8 length) {
    u8 i;

    for (i = 0; i < length; i++) {
        if (!pabType[i]) {
            return false;
        }
    }

    return true;
}

u8 EventManager_GetFreezeType(void) {
    return sEventActionType;
}

// returns true when it should draw, otherwise returns false
u8 EventManager_ProcessScript(GameState* gameState, EventScriptEntry* eventEntry) {
    static u8 abFlag[EVENT_FLAG_TYPE_MAX];
    static u8 abGame[EVENT_GAME_TYPE_MAX];
    static u8 abTime[EVENT_TIME_TYPE_MAX];
    u8* script;
    s32 eventType;
    s32 i;

    script = SEGMENTED_TO_VIRTUAL(eventEntry->script);
    sEventActionType = eventEntry->actionType;

    memset(abFlag, true, sizeof(abFlag));
    memset(abGame, true, sizeof(abGame));
    memset(abTime, true, sizeof(abTime));

    do {
        memcpy(&eventType, script, sizeof(eventType));
        script += sizeof(eventType);

        switch (eventType) {
            case EVENT_TYPE_NONE:
                break;
            case EVENT_TYPE_FLAG:
                EventManager_ProcessFlag(gameState, (void*)script, abFlag);
                script += sizeof(EventFlag);
                break;
            case EVENT_TYPE_GAME:
                EventManager_ProcessGame(gameState, (void*)script, abGame);
                script += sizeof(EventGame);
                break;
            case EVENT_TYPE_TIME:
                EventManager_ProcessTime(gameState, (void*)script, abTime);
                script += sizeof(EventTime);
                break;
            default:
                eventType = EVENT_TYPE_NONE;
                break;
        }
    } while (eventType != EVENT_TYPE_NONE);

    if (!EventManager_Validate(abFlag, ARRAY_COUNT(abFlag))) {
        return false;
    }

    if (!EventManager_Validate(abGame, ARRAY_COUNT(abGame))) {
        return false;
    }

    if (!EventManager_Validate(abTime, ARRAY_COUNT(abTime))) {
        return false;
    }

    return true;
}
