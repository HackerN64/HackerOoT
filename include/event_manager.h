#ifndef EVENT_MANAGER_H
#define EVENT_MANAGER_H

#include "ultra64.h"
#include "config.h"
#include "command_macros_base.h"

typedef enum EventCondition {
    EVENT_COND_NONE,
    EVENT_COND_EQUAL,       // b == a
    EVENT_COND_DIFF,        // b != a
    EVENT_COND_INFERIOR,    // b < a
    EVENT_COND_SUPERIOR,    // b > a
    EVENT_COND_INFERIOR_EQ, // b <= a
    EVENT_COND_SUPERIOR_EQ, // b >= a
} EventCondition;

typedef enum EventFlagType {
    EVENT_FLAG_TYPE_SWITCH_FLAG,
    EVENT_FLAG_TYPE_EVENTCHKINF_FLAG,
    EVENT_FLAG_TYPE_INF_FLAG,
    EVENT_FLAG_TYPE_COLLECTIBLE_FLAG,
    EVENT_FLAG_TYPE_TREASURE_FLAG,
    EVENT_FLAG_TYPE_TEMPCLEAR_FLAG,
    EVENT_FLAG_TYPE_CLEAR_FLAG,
    EVENT_FLAG_TYPE_MAX,
} EventFlagType;

typedef enum EventInvType {
    EVENT_INV_TYPE_ITEMS,
    EVENT_INV_TYPE_EQUIPMENT,
    EVENT_INV_TYPE_QUEST,
    EVENT_INV_TYPE_DUNGEON_ITEMS,
    EVENT_INV_TYPE_DUNGEON_KEYS,
    EVENT_INV_TYPE_GS_TOKENS,
    EVENT_INV_TYPE_MAX,
} EventInvType;

typedef enum EventGameType {
    EVENT_GAME_TYPE_AGE,
    EVENT_GAME_TYPE_HEALTH,
    EVENT_GAME_TYPE_RUPEES,
    EVENT_GAME_TYPE_MAGIC,
    EVENT_GAME_TYPE_INVENTORY,
    EVENT_GAME_TYPE_MAX,
} EventGameType;

typedef enum EventTimeType {
    EVENT_TIME_TYPE_CLOCK,
    EVENT_TIME_TYPE_CONDITIONAL,
    EVENT_TIME_TYPE_DAY,
    EVENT_TIME_TYPE_NIGHT,
    EVENT_TIME_TYPE_MAX,
} EventTimeType;

// only used by the system using this
//! TODO: add a type that can let a draw to complete its loop before freezing
typedef enum EventActionType {
    EVENT_ACTION_TYPE_NONE,          // no special behavior
    EVENT_ACTION_TYPE_INVERTED,      // inverts the event behavior
    EVENT_ACTION_TYPE_INVERTED_KEEP, // same as above but allows to continue to draw the last state
} EventActionType;

typedef enum EventType {
    EVENT_TYPE_NONE,
    EVENT_TYPE_FLAG,
    EVENT_TYPE_GAME,
    EVENT_TYPE_TIME,
    EVENT_TYPE_MAX,
} EventType;

typedef union EventData {
    s32 i;
    f32 f;
    s16 s[2];
    s8 b[4];
} EventData;

typedef union EventFlag {
    struct {
        u32 type; // see EventFlagType
        u32 flag;
    };
    s32 _words[2];
} EventFlag;

typedef union EventGame {
    struct {
        u8 type;     // see EventGameType
        u8 condType; // see EventCondition
        union {
            // EVENT_GAME_TYPE_AGE
            s8 age;

            // EVENT_GAME_TYPE_HEALTH
            s16 health;

            // EVENT_GAME_TYPE_RUPEES
            s16 rupees;

            // EVENT_GAME_TYPE_MAGIC
            s8 magic;

            // EVENT_GAME_TYPE_INVENTORY
            struct {
                u8 type; // see EventInvType
                union {
                    u8 itemId;
                    u8 upgradeType;
                    u8 unused;
                    u8 sceneId;
                    u8 questItem;
                };
                union {
                    // EVENT_INV_TYPE_ITEMS and EVENT_INV_TYPE_DUNGEON_KEYS
                    struct {
                        u8 obtained;
                        union {
                            s8 amount; // EVENT_INV_TYPE_ITEMS: -1 means no ammo check

                            // EVENT_INV_TYPE_EQUIPMENT
                            u8 swordHealth; // -1 means no sword health check
                            u8 upgradeValue;
                        };
                    };

                    // EVENT_INV_TYPE_DUNGEON_ITEMS

                    // EVENT_INV_TYPE_GS_TOKENS
                    s16 gsTokens;
                };
            } inventory;
        };
    };
    s32 _words[2];
} EventGame;

typedef union EventTime {
    struct {
        u8 type;    // see EventTimeType
        u8 isClock; // set to true to check for a specific time range
        union {
            u8 isRange;
            u8 nightFlag; // 0 for day, 1 for night
        };
        struct {
            u8 condType;
            u8 hour;
            u8 minute;
        } clocks[2];
    };
    s32 _words[3];
} EventTime;

typedef struct EventScriptEntry {
    EventData* script; // list of events to process, must be the same size as keyframeList
    u8 actionType;     // see EventActionType
} EventScriptEntry;

struct GameState;

u8 EventManager_GetFreezeType(void);
u8 EventManager_ProcessScript(struct GameState* gameState, EventScriptEntry* eventEntry);

// useful macros to declare an event entry

// generic flag macro
#define EVENT_FLAG(type, flag) EVENT_TYPE_FLAG, CMD_W((type)), CMD_W((flag))

// specific flag macros
#define EVENT_SWITCH_FLAG(flag) EVENT_FLAG(EVENT_FLAG_TYPE_SWITCH_FLAG, (flag))
#define EVENT_EVENTCHKINF_FLAG(flag) EVENT_FLAG(EVENT_FLAG_TYPE_EVENTCHKINF_FLAG, (flag))
#define EVENT_INF_FLAG(flag) EVENT_FLAG(EVENT_FLAG_TYPE_INF_FLAG, (flag))
#define EVENT_COLLECTIBLE_FLAG(flag) EVENT_FLAG(EVENT_FLAG_TYPE_COLLECTIBLE_FLAG, (flag))
#define EVENT_TREASURE_FLAG(flag) EVENT_FLAG(EVENT_FLAG_TYPE_TREASURE_FLAG, (flag))
#define EVENT_TEMPCLEAR_FLAG(flag) EVENT_FLAG(EVENT_FLAG_TYPE_TEMPCLEAR_FLAG, (flag))
#define EVENT_CLEAR_FLAG(flag) EVENT_FLAG(EVENT_FLAG_TYPE_CLEAR_FLAG, (flag))

// age macro
#define EVENT_AGE(age) EVENT_TYPE_GAME, CMD_BBBB(EVENT_GAME_TYPE_AGE, 0, (age), 0), CMD_W(0)

// health macro
#define EVENT_HEALTH(condType, amount) \
    EVENT_TYPE_GAME, CMD_BBBB(EVENT_GAME_TYPE_HEALTH, (condType), 0, (amount)), CMD_W(0)

// rupees macro
#define EVENT_RUPEES(condType, amount) \
    EVENT_TYPE_GAME, CMD_BBBB(EVENT_GAME_TYPE_RUPEES, (condType), 0, (amount)), CMD_W(0)

// magic macro
#define EVENT_MAGIC(condType, amount) \
    EVENT_TYPE_GAME, CMD_BBBB(EVENT_GAME_TYPE_MAGIC, (condType), 0, (amount)), CMD_W(0)

// generic item macro
#define EVENT_ITEM_BASE(condType, itemId, obtained, amount)                                           \
    EVENT_TYPE_GAME, CMD_BBBB(EVENT_GAME_TYPE_INVENTORY, (condType), EVENT_INV_TYPE_ITEMS, (itemId)), \
        CMD_BBH((obtained), (amount), 0)

// item macro (either the player has the item or not)
#define EVENT_ITEM(itemId, obtained) EVENT_ITEM_BASE(EVENT_COND_NONE, itemId, obtained, -1)

// ammo macro (same as above but also check the amount)
#define EVENT_ITEM_AMMO(condType, itemId, amount) EVENT_ITEM_BASE(condType, itemId, true, amount)

// generic equipment macro
#define EVENT_EQUIPMENT_BASE(condType, itemIdOrUpgradeType, obtained, healthOrUpgrade)                                 \
    EVENT_TYPE_GAME, CMD_BBBB(EVENT_GAME_TYPE_INVENTORY, (condType), EVENT_INV_TYPE_EQUIPMENT, (itemIdOrUpgradeType)), \
        CMD_BBH((obtained), (healthOrUpgrade), 0)

// equipment macro (either the player has the equipment or not)
#define EVENT_EQUIPMENT(itemId, obtained) EVENT_EQUIPMENT_BASE(EVENT_COND_NONE, itemId, obtained, -1)

// biggoron sword macro (same as above but also check the sword's health)
#define EVENT_EQUIPMENT_BGS(condType, swordHealth) \
    EVENT_EQUIPMENT_BASE(condType, ITEM_SWORD_BIGGORON, true, swordHealth)

// upgrade macro
#define EVENT_EQUIPMENT_UPG(condType, upgradeType, upgradeValue) \
    EVENT_EQUIPMENT_BASE(condType, upgradeType, true, upgradeValue)

// quest items
#define EVENT_QUEST_ITEM(questItem, obtained)                                                                 \
    EVENT_TYPE_GAME, CMD_BBBB(EVENT_GAME_TYPE_INVENTORY, EVENT_COND_NONE, EVENT_INV_TYPE_QUEST, (questItem)), \
        CMD_BBH((obtained), 0, 0)

// skulltula tokens
#define EVENT_GS_TOKEN(condType, gsTokens) \
    EVENT_TYPE_GAME, CMD_BBBB(EVENT_GAME_TYPE_INVENTORY, (condType), EVENT_INV_TYPE_GS_TOKENS, 0), CMD_HH((gsTokens), 0)

// generic time macro
#define EVENT_TIME(type, isClock, isRangeOrNightFlag, condType1, hour1, minute1, condType2, hour2, minute2) \
    EVENT_TYPE_TIME, CMD_BBBB((type), (isClock), (isRangeOrNightFlag), (condType1)),                        \
        CMD_BBBB((hour1), (minute1), (condType2), (hour2)), CMD_BBH((minute2), 0, 0)

// specific time of day
#define EVENT_TIME_CLOCK(condType, hour, minute) \
    EVENT_TIME(EVENT_TIME_TYPE_CLOCK, true, false, condType, hour, minute, 0, 0, 0)

// conditional clock (for example: time1 != CLOCK_TIME(10, 0) && time2 < CLOCK_TIME(15, 0)
#define EVENT_TIME_CONDITIONAL(condType1, hour1, minute1, condType2, hour2, minute2) \
    EVENT_TIME(EVENT_TIME_TYPE_CONDITIONAL, true, true, condType1, hour1, minute1, condType2, hour2, minute2)

// check if this is currently daytime
#define EVENT_TIME_DAY() EVENT_TIME(EVENT_TIME_TYPE_DAY, false, 0, 0, 0, 0, 0, 0, 0)

// checks if the this is currently nighttime
#define EVENT_TIME_NIGHT() EVENT_TIME(EVENT_TIME_TYPE_NIGHT, false, 1, 0, 0, 0, 0, 0, 0)

// the process will end whenever this is the next type (or if an unknown type is found)
#define EVENT_END() EVENT_TYPE_NONE

#endif
