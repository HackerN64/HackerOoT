#include "global.h"
#include "vt.h"

// these are the main substructs of save context.
// we are going to hold off on splitting save context until later on,
// so these temporary structs will live here for now.

typedef struct {
    /* 0x00 */ char newf[6]; // string "ZELDAZ"
    /* 0x06 */ s16 deaths;
    /* 0x08 */ char playerName[8];
    /* 0x10 */ s16 n64ddFlag;
    /* 0x12 */ s16 healthCapacity; // "max_life"
    /* 0x14 */ s16 health;         // "now_life"
    /* 0x16 */ s8 magicLevel;
    /* 0x17 */ s8 magic;
    /* 0x18 */ s16 rupees;
    /* 0x1A */ u16 swordHealth;
    /* 0x1C */ u16 naviTimer;
    /* 0x1E */ u8 magicAcquired;
    /* 0x1F */ u8 unk_1F;
    /* 0x20 */ u8 doubleMagic;
    /* 0x21 */ u8 doubleDefense;
    /* 0x22 */ u8 bgsFlag;
    /* 0x23 */ u8 ocarinaGameReward;
    /* 0x24 */ ItemEquips childEquips;
    /* 0x2E */ ItemEquips adultEquips;
    /* 0x38 */ u32 unk_38; // this may be incorrect, currently used for alignement
    /* 0x3C */ char unk_3C[0x0E];
    /* 0x4A */ s16 savedSceneNum;
} SavePlayerData; // size = 0x4C

typedef struct {
    /* 0x0000 */ SavePlayerData playerData; // "S_Private" substruct name
    /* 0x004C */ ItemEquips equips;
    /* 0x0058 */ Inventory inventory;
    /* 0x00B8 */ SavedSceneFlags sceneFlags[124];
    /* 0x0E48 */ FaroresWindData fw;
    /* 0x0E70 */ char unk_E70[0x10];
    /* 0x0E80 */ s32 gsFlags[6];
    /* 0x0E98 */ char unk_E98[0x10];
    /* 0x0EA8 */ s32 horseRaceRecord;
    /* 0x0EAC */ char unk_EAC[0x0C];
    /* 0x0EB8 */ u16 eventChkInf[14]; // "event_chk_inf"
    /* 0x0ED4 */ u16 itemGetInf[4];   // "item_get_inf"
    /* 0x0EDC */ u16 infTable[30];    // "inf_table"
    /* 0x0F18 */ char unk_F18[0x04];
    /* 0x0F1C */ u32 worldMapAreaData; // "area_arrival"
    /* 0x0F20 */ char unk_F20[0x4];
    /* 0x0F24 */ u8 scarecrowCustomSongSet;
    /* 0x0F25 */ u8 scarecrowCustomSong[0x360];
    /* 0x1285 */ char unk_1285[0x24];
    /* 0x12A9 */ u8 scarecrowSpawnSongSet;
    /* 0x12AA */ u8 scarecrowSpawnSong[0x80];
    /* 0x132A */ char unk_132A[0x02];
    /* 0x132C */ HorseData horseData;
    /* 0x1336 */ u16 checksum; // "check_sum"
} SaveInfo;                    // size = 0x1338

typedef struct {
    /* 0x00 */ s32 entranceIndex;
    /* 0x04 */ s32 linkAge; // 0: Adult; 1: Child
    /* 0x08 */ s32 cutsceneIndex;
    /* 0x0C */ u16 dayTime; // "zelda_time"
    /* 0x10 */ s32 nightFlag;
    /* 0x14 */ s32 numDays;
    /* 0x18 */ s32 unk_18;    // increments with numDays, gets reset by goron for bgs and one other use
    /* 0x1C */ SaveInfo info; // "information"
} Save;                       // size = 0x1354

#define SAVE_PLAYER_DATA (*((SavePlayerData*)&gSaveContext.newf))
#define SAVE_INFO (*((SaveInfo*)&gSaveContext.newf))

#define SLOT_SIZE (sizeof(SaveContext) + 0x28)
#define CHECKSUM_SIZE (sizeof(Save) / 2)

#define DEATHS OFFSETOF(SaveContext, deaths)
#define NAME OFFSETOF(SaveContext, playerName)
#define N64DD OFFSETOF(SaveContext, n64ddFlag)
#define HEALTH_CAP OFFSETOF(SaveContext, healthCapacity)
#define QUEST OFFSETOF(SaveContext, inventory.questItems)
#define DEFENSE OFFSETOF(SaveContext, inventory.defenseHearts)
#define HEALTH OFFSETOF(SaveContext, health)

#define SLOT_OFFSET(idx) (SLOT_SIZE * idx + 0x20)

u16 gSramSlotOffsets[][3] = {
    {
        SLOT_OFFSET(0),
        SLOT_OFFSET(1),
        SLOT_OFFSET(2),
    },
    {
        SLOT_OFFSET(3),
        SLOT_OFFSET(4),
        SLOT_OFFSET(5),
    },
};

char sZeldaMagic[] = { '\0', '\0', '\0', '\x98', '\x09', '\x10', '\x21', 'Z', 'E', 'L', 'D', 'A' };

SavePlayerData sNewSavePlayerData = {
    { '\0', '\0', '\0', '\0', '\0', '\0' },             // newf
    0,                                                  // deaths
    { 0x3E, 0x3E, 0x3E, 0x3E, 0x3E, 0x3E, 0x3E, 0x3E }, // playerName
    0,                                                  // n64ddFlag
    0x30,                                               // healthCapacity
    0x30,                                               // heartStatus
    0,                                                  // magicLevel
    0x30,                                               // magic
    0,                                                  // rupees
    0,                                                  // swordHealth
    0,                                                  // naviTimer
    0,                                                  // magicAcquired
    0,                                                  // unk_1F
    0,                                                  // doubleMagic
    0,                                                  // doubleDefense
    0,                                                  // bgsFlag
    0,                                                  // ocarinaGameReward
    {
        { ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE }, // buttonItems
        { SLOT_NONE, SLOT_NONE, SLOT_NONE },            // cButtonSlots
        0,                                              // equipment
    },                                                  // childEquips
    {
        { ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE }, // buttonItems
        { SLOT_NONE, SLOT_NONE, SLOT_NONE },            // cButtonSlots
        0,                                              // equipment
    },                                                  // adultEquips
    0,                                                  // unk_38
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },       // unk_3C
    0x34,                                               // savedSceneNum
};

ItemEquips sNewSaveEquips = {
    { ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE }, // buttonItems
    { SLOT_NONE, SLOT_NONE, SLOT_NONE },            // cButtonSlots
    0x1100,                                         // equipment
};

Inventory sNewSaveInventory = {
    { 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
      0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF }, // items
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },                         // ammo
    0x1100,                                                                     // equipment
    0,                                                                          // upgrades
    0,                                                                          // questItems
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },             // dungeonItems
    {
        0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
        0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
    }, // dungeonKeys
    0, // defenseHearts
    0, // gsTokens
};

u16 sNewSaveChecksum = 0;

/**
 *  Initialize new save.
 *  This save has an empty inventory with 3 hearts and single magic.
 */
void Sram_InitNewSave(void) {
    SaveContext* temp = &gSaveContext;

    bzero(&SAVE_INFO, sizeof(SaveInfo));
    gSaveContext.numDays = 0;
    gSaveContext.unk_18 = 0;

    SAVE_PLAYER_DATA = sNewSavePlayerData;
    gSaveContext.equips = sNewSaveEquips;
    gSaveContext.inventory = sNewSaveInventory;

    temp->checksum = sNewSaveChecksum;
    gSaveContext.horseData.scene = SCENE_SPOT00;
    gSaveContext.horseData.pos.x = -1840;
    gSaveContext.horseData.pos.y = 72;
    gSaveContext.horseData.pos.z = 5497;
    gSaveContext.horseData.angle = -0x6AD9;
    gSaveContext.magicLevel = 0;
    gSaveContext.infTable[29] = 1;
    gSaveContext.sceneFlags[5].swch = 0x40000000;
}

SavePlayerData sDebugSavePlayerData = {
    { 'Z', 'E', 'L', 'D', 'A', 'Z' },                   // newf
    0,                                                  // deaths
    { 0x15, 0x12, 0x17, 0x14, 0x3E, 0x3E, 0x3E, 0x3E }, // playerName ( "LINK" )
    0,                                                  // n64ddFlag
    0xE0,                                               // healthCapacity
    0xE0,                                               // health
    0,                                                  // magicLevel
    0x30,                                               // magic
    150,                                                // rupees
    8,                                                  // swordHealth
    0,                                                  // naviTimer
    1,                                                  // magicAcquired
    0,                                                  // unk_1F
    0,                                                  // doubleMagic
    0,                                                  // doubleDefense
    0,                                                  // bgsFlag
    0,                                                  // ocarinaGameReward
    {
        { ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE }, // buttonItems
        { SLOT_NONE, SLOT_NONE, SLOT_NONE },            // cButtonSlots
        0,                                              // equipment
    },                                                  // childEquips
    {
        { ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE }, // buttonItems
        { SLOT_NONE, SLOT_NONE, SLOT_NONE },            // cButtonSlots
        0,                                              // equipment
    },                                                  // adultEquips
    0,                                                  // unk_38
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },       // unk_3C
    0x51,                                               // savedSceneNum
};

ItemEquips sDebugSaveEquips = {
    { ITEM_SWORD_MASTER, ITEM_BOW, ITEM_BOMB, ITEM_OCARINA_FAIRY }, // buttonItems
    { SLOT_BOW, SLOT_BOMB, SLOT_OCARINA },                          // cButtonSlots
    0x1122,                                                         // equipment
};

Inventory sDebugSaveInventory = {
    {
        ITEM_STICK,     ITEM_NUT,           ITEM_BOMB,         ITEM_BOW,         ITEM_ARROW_FIRE,  ITEM_DINS_FIRE,
        ITEM_SLINGSHOT, ITEM_OCARINA_FAIRY, ITEM_BOMBCHU,      ITEM_HOOKSHOT,    ITEM_ARROW_ICE,   ITEM_FARORES_WIND,
        ITEM_BOOMERANG, ITEM_LENS,          ITEM_BEAN,         ITEM_HAMMER,      ITEM_ARROW_LIGHT, ITEM_NAYRUS_LOVE,
        ITEM_BOTTLE,    ITEM_POTION_RED,    ITEM_POTION_GREEN, ITEM_POTION_BLUE, ITEM_POCKET_EGG,  ITEM_WEIRD_EGG,
    },                                                              // items
    { 50, 50, 10, 30, 1, 1, 30, 1, 50, 1, 1, 1, 1, 1, 1, 1 },       // ammo
    0x7777,                                                         // equipment
    0x125249,                                                       // upgrades
    0x1E3FFFF,                                                      // questItems
    { 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, // dungeonItems
    { 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8 },    // dungeonKeys
    0,                                                              // defenseHearts
    0,                                                              // gsTokens
};

u16 sDebugSaveChecksum = 0;

/**
 *  Initialize debug save. This is also used on the Title Screen
 *  This save has a mostly full inventory with 10 hearts and single magic.
 *
 *  Some noteable flags that are set:
 *  Showed Mido sword/shield, met Deku Tree, Deku Tree mouth opened,
 *  used blue warp in Gohmas room, Zelda fled castle, light arrow cutscene watched,
 *  and set water level in Water Temple to lowest level.
 */
void Sram_InitDebugSave(void) {
    SaveContext* temp = &gSaveContext;

    bzero(&SAVE_INFO, sizeof(SaveInfo));
    gSaveContext.numDays = 0;
    gSaveContext.unk_18 = 0;

    SAVE_PLAYER_DATA = sDebugSavePlayerData;
    gSaveContext.equips = sDebugSaveEquips;
    gSaveContext.inventory = sDebugSaveInventory;

    temp->checksum = sDebugSaveChecksum;
    gSaveContext.horseData.scene = SCENE_SPOT00;
    gSaveContext.horseData.pos.x = -1840;
    gSaveContext.horseData.pos.y = 72;
    gSaveContext.horseData.pos.z = 5497;
    gSaveContext.horseData.angle = -0x6AD9;
    gSaveContext.infTable[0] |= 0x5009;
    gSaveContext.eventChkInf[0] |= 0x123F;
    gSaveContext.eventChkInf[8] |= 1;
    gSaveContext.eventChkInf[12] |= 0x10;

    if (LINK_AGE_IN_YEARS == YEARS_CHILD) {
        gSaveContext.equips.buttonItems[0] = ITEM_SWORD_KOKIRI;
        Inventory_ChangeEquipment(EQUIP_SWORD, 1);
        if (gSaveContext.fileNum == 0xFF) {
            gSaveContext.equips.buttonItems[1] = ITEM_SLINGSHOT;
            gSaveContext.equips.cButtonSlots[0] = SLOT_SLINGSHOT;
            Inventory_ChangeEquipment(EQUIP_SHIELD, 1);
        }
    }

    gSaveContext.entranceIndex = 0xCD;
    gSaveContext.magicLevel = 0;
    gSaveContext.sceneFlags[5].swch = 0x40000000;
}

/**
 *  Copy save currently on the buffer to Save Context and complete various tasks to open the save.
 *  This includes:
 *  - Set proper entrance depending on where the game was saved
 *  - If health is less than 3 hearts, give 3 hearts
 *  - If either scarecrow song is set, copy them from save context to the proper location
 *  - Handle a case where the player saved and quit after zelda cutscene but didnt get the song
 *  - Give and equip master sword if player is adult and doesnt have kokiri sword (bug?)
 *  - Revert any trade items that spoil
 */
#ifdef NON_MATCHING
// regalloc differences at the end
void Sram_OpenSave(SramContext* sramCtx) {
    static s16 dungeonEntrances[] = {
        0x0000, 0x0004, 0x0028, 0x0169, 0x0165, 0x0010, 0x0082, 0x0037,
        0x0098, 0x0088, 0x041B, 0x0008, 0x0486, 0x0467, 0x0179, 0x056C,
    };
    u16 i;
    u16 j;
    u8* ptr;

    osSyncPrintf("個人Ｆｉｌｅ作成\n"); // Create personal file
    i = gSramSlotOffsets[0][gSaveContext.fileNum];
    osSyncPrintf("ぽいんと＝%x(%d)\n", i, gSaveContext.fileNum); // Point=

    MemCopy(&gSaveContext, sramCtx->readBuff + i, sizeof(Save));

    osSyncPrintf(VT_FGCOL(YELLOW));
    osSyncPrintf("SCENE_DATA_ID = %d   SceneNo = %d\n", gSaveContext.savedSceneNum,
                 ((void)0, gSaveContext.entranceIndex));

    switch (gSaveContext.savedSceneNum) {
        case SCENE_YDAN:
        case SCENE_DDAN:
        case SCENE_BDAN:
        case SCENE_BMORI1:
        case SCENE_HIDAN:
        case SCENE_MIZUSIN:
        case SCENE_JYASINZOU:
        case SCENE_HAKADAN:
        case SCENE_HAKADANCH:
        case SCENE_ICE_DOUKUTO:
        case SCENE_GANON:
        case SCENE_MEN:
        case SCENE_GERUDOWAY:
        case SCENE_GANONTIKA:
            gSaveContext.entranceIndex = dungeonEntrances[gSaveContext.savedSceneNum];
            break;
        case SCENE_YDAN_BOSS:
            gSaveContext.entranceIndex = 0;
            break;
        case SCENE_DDAN_BOSS:
            gSaveContext.entranceIndex = 4;
            break;
        case SCENE_BDAN_BOSS:
            gSaveContext.entranceIndex = 0x28;
            break;
        case SCENE_MORIBOSSROOM:
            gSaveContext.entranceIndex = 0x169;
            break;
        case SCENE_FIRE_BS:
            gSaveContext.entranceIndex = 0x165;
            break;
        case SCENE_MIZUSIN_BS:
            gSaveContext.entranceIndex = 0x10;
            break;
        case SCENE_JYASINBOSS:
            gSaveContext.entranceIndex = 0x82;
            break;
        case SCENE_HAKADAN_BS:
            gSaveContext.entranceIndex = 0x37;
            break;
        case SCENE_GANON_SONOGO:
        case SCENE_GANONTIKA_SONOGO:
        case SCENE_GANON_BOSS:
        case SCENE_GANON_FINAL:
        case SCENE_GANON_DEMO:
            gSaveContext.entranceIndex = 0x41B;
            break;

        default:
            if (gSaveContext.savedSceneNum != SCENE_LINK_HOME) {
                gSaveContext.entranceIndex = (LINK_AGE_IN_YEARS == YEARS_CHILD) ? 0xBB : 0x5F4;
            } else {
                gSaveContext.entranceIndex = 0xBB;
            }
            break;
    }

    osSyncPrintf("scene_no = %d\n", gSaveContext.entranceIndex);
    osSyncPrintf(VT_RST);

    if (gSaveContext.health < 0x30) {
        gSaveContext.health = 0x30;
    }

    if (gSaveContext.scarecrowCustomSongSet) {
        osSyncPrintf(VT_FGCOL(BLUE));
        osSyncPrintf("\n====================================================================\n");

        MemCopy(gScarecrowCustomSongPtr, &gSaveContext.scarecrowCustomSong, 0x360);

        ptr = gScarecrowCustomSongPtr;
        for (i = 0; i < 0x360; i++, ptr++) {
            osSyncPrintf("%d, ", *ptr);
        }

        osSyncPrintf("\n====================================================================\n");
        osSyncPrintf(VT_RST);
    }

    if (gSaveContext.scarecrowSpawnSongSet) {
        osSyncPrintf(VT_FGCOL(GREEN));
        osSyncPrintf("\n====================================================================\n");

        MemCopy(gScarecrowSpawnSongPtr, &gSaveContext.scarecrowSpawnSong, 0x80);

        ptr = gScarecrowSpawnSongPtr;
        for (i = 0; i < 0x80; i++, ptr++) {
            osSyncPrintf("%d, ", *ptr);
        }

        osSyncPrintf("\n====================================================================\n");
        osSyncPrintf(VT_RST);
    }

    // if zelda cutscene has been watched but lullaby was not obtained, restore cutscene and take away letter
    if ((gSaveContext.eventChkInf[4] & 1) && !CHECK_QUEST_ITEM(QUEST_SONG_LULLABY)) {
        gSaveContext.eventChkInf[4] &= ~1;
        INV_CONTENT(ITEM_LETTER_ZELDA) = ITEM_CHICKEN;

        for (i = 1; i < 4; i++) {
            if (gSaveContext.equips.buttonItems[i] == ITEM_LETTER_ZELDA) {
                gSaveContext.equips.buttonItems[i] = ITEM_CHICKEN;
            }
        }
    }

    // check for owning kokiri sword.. to restore master sword? bug or debug feature?
    if (LINK_AGE_IN_YEARS == YEARS_ADULT && !CHECK_OWNED_EQUIP(EQUIP_SWORD, 1)) {
        gSaveContext.inventory.equipment |= gBitFlags[1] << gEquipShifts[EQUIP_SWORD];
        gSaveContext.equips.buttonItems[0] = ITEM_SWORD_MASTER;
        gSaveContext.equips.equipment &= ~0xF;
        gSaveContext.equips.equipment |= 2;
    }

    for (i = 0; i < ARRAY_COUNT(gSpoilingItems); i++) {
        if (INV_CONTENT(ITEM_TRADE_ADULT) == gSpoilingItems[i]) {
            INV_CONTENT(gSpoilingItemReverts[i]) = gSpoilingItemReverts[i];

            for (j = 1; j < 4; j++) {
                if (gSaveContext.equips.buttonItems[j] == gSpoilingItems[i]) {
                    gSaveContext.equips.buttonItems[j] = gSpoilingItemReverts[i];
                }
            }
        }
    }

    gSaveContext.magicLevel = 0;
}
#else
s16 dungeonEntrances[] = {
    0x0000, 0x0004, 0x0028, 0x0169, 0x0165, 0x0010, 0x0082, 0x0037,
    0x0098, 0x0088, 0x041B, 0x0008, 0x0486, 0x0467, 0x0179, 0x056C,
};
#pragma GLOBAL_ASM("asm/non_matchings/code/z_sram/Sram_OpenSave.s")
#endif

/**
 *  Write the contents of the Save Context to a main and backup slot in SRAM.
 *  Note: The whole Save Context is written even though only the `save` substruct is read back later
 */
void Sram_WriteSave(s32 unused) {
    u16 offset;
    u16 checksum;
    u16 j;
    u16* ptr;

    gSaveContext.checksum = 0;

    ptr = (u16*)&gSaveContext;
    checksum = 0;
    j = 0;

    for (offset = 0; offset < CHECKSUM_SIZE; offset++) {
        if (++j == 0x20U) {
            j = 0;
        }
        checksum += *ptr++;
    }

    gSaveContext.checksum = checksum;

    ptr = (u16*)&gSaveContext;
    checksum = 0;

    for (offset = 0; offset < CHECKSUM_SIZE; offset++) {
        if (++j == 0x20U) {
            j = 0;
        }
        checksum += *ptr++;
    }

    offset = gSramSlotOffsets[0][gSaveContext.fileNum];
    SsSram_ReadWrite(OS_K1_TO_PHYSICAL(0xA8000000) + offset, &gSaveContext, SLOT_SIZE, OS_WRITE);

    ptr = (u16*)&gSaveContext;
    checksum = 0;

    for (offset = 0; offset < CHECKSUM_SIZE; offset++) {
        if (++j == 0x20U) {
            j = 0;
        }
        checksum += *ptr++;
    }

    offset = gSramSlotOffsets[1][gSaveContext.fileNum];
    SsSram_ReadWrite(OS_K1_TO_PHYSICAL(0xA8000000) + offset, &gSaveContext, SLOT_SIZE, OS_WRITE);
}

/**
 *  For all 3 slots, verify that the checksum is correct. If corrupted, attempt to load a backup save.
 *  If backup is also corrupted, default to a new save (or debug save for slot 0 on debug rom).
 *
 *  After verifying all 3 saves, pass relevant data to File Select to be displayed.
 */
#ifdef NON_MATCHING
// There's a problem with how "offset" is loaded
void Sram_VerifyAndLoadAllSaves(FileChooseContext* fileChooseCtx, SramContext* sramCtx) {
    u16 slotNum; // 0x72
    u16 oldChecksum;
    u16 newChecksum;
    u16 dayTime; // 0x66
    // u16* offPtr;
    s32 offset;
    u16 i;
    u16 j;
    u16* ptr;

    osSyncPrintf("ＳＲＡＭ ＳＴＡＲＴ─ＬＯＡＤ\n");
    bzero(sramCtx->readBuff, SRAM_SIZE);
    SsSram_ReadWrite(OS_K1_TO_PHYSICAL(0xA8000000), sramCtx->readBuff, SRAM_SIZE, OS_READ);

    dayTime = gSaveContext.dayTime;

    for (slotNum = 0; slotNum < 3; slotNum++) {
        offset = gSramSlotOffsets[0][slotNum];
        osSyncPrintf("ぽいんと＝%x(%d)    SAVE_MAX=%d\n", offset, gSaveContext.fileNum, sizeof(Save));
        MemCopy(&gSaveContext, sramCtx->readBuff + offset, sizeof(Save));

        oldChecksum = gSaveContext.checksum;
        gSaveContext.checksum = 0;
        osSyncPrintf("\n＝＝＝＝＝＝＝＝＝＝＝＝＝  Ｓ（%d） ＝＝＝＝＝＝＝＝＝＝＝＝＝\n", slotNum);

        // j = 0;
        newChecksum = 0;
        ptr = (u16*)&gSaveContext;
        for (i = 0; i < CHECKSUM_SIZE; i++) {
            j += 2;
            newChecksum += *ptr++;
        }

        // SAVE checksum calculation
        osSyncPrintf("\nＳＡＶＥチェックサム計算  j=%x  mmm=%x  ", newChecksum, oldChecksum);

        if (oldChecksum != newChecksum) {
            // checksum didnt match, try backup save
            osSyncPrintf("ＥＲＲＯＲ！！！ ＝ %x(%d)\n", offset, slotNum);
            offset = gSramSlotOffsets[1][slotNum];
            MemCopy(&gSaveContext, sramCtx->readBuff + offset, sizeof(Save));

            oldChecksum = gSaveContext.checksum;
            gSaveContext.checksum = 0;
            osSyncPrintf("================= ＢＡＣＫ─ＵＰ ========================\n");

            newChecksum = 0;
            ptr = (u16*)&gSaveContext;
            for (i = 0; i < CHECKSUM_SIZE; i++) {
                j += 2;
                newChecksum += *ptr++;
            }
            // (B) SAVE checksum calculation
            osSyncPrintf("\n（Ｂ）ＳＡＶＥチェックサム計算  j=%x  mmm=%x  ", newChecksum, oldChecksum);

            if (oldChecksum != newChecksum) {
                // backup save didnt work, make new save
                // offPtr = &gSramSlotOffsets[1][slotNum];
                osSyncPrintf("ＥＲＲＯＲ！！！ ＝ %x(%d+3)\n", offset, slotNum);
                bzero(&gSaveContext.entranceIndex, sizeof(gSaveContext.entranceIndex));
                bzero(&gSaveContext.linkAge, sizeof(gSaveContext.linkAge));
                bzero(&gSaveContext.cutsceneIndex, sizeof(gSaveContext.cutsceneIndex));
                bzero(&gSaveContext.dayTime, sizeof(gSaveContext.dayTime));
                bzero(&gSaveContext.nightFlag, sizeof(gSaveContext.nightFlag));
                bzero(&gSaveContext.numDays, sizeof(gSaveContext.numDays));
                bzero(&gSaveContext.unk_18, sizeof(gSaveContext.unk_18));

                if (slotNum == 0) {
                    Sram_InitDebugSave();
                    gSaveContext.newf[0] = 'Z';
                    gSaveContext.newf[1] = 'E';
                    gSaveContext.newf[2] = 'L';
                    gSaveContext.newf[3] = 'D';
                    gSaveContext.newf[4] = 'A';
                    gSaveContext.newf[5] = 'Z';
                    osSyncPrintf("newf=%x,%x,%x,%x,%x,%x\n", gSaveContext.newf[0], gSaveContext.newf[1],
                                 gSaveContext.newf[2], gSaveContext.newf[3], gSaveContext.newf[4],
                                 gSaveContext.newf[5]);
                } else {
                    Sram_InitNewSave();
                }

                osSyncPrintf("\n--------------------------------------------------------------\n");

                j = 0;
                newChecksum = 0;
                ptr = (u16*)&gSaveContext;
                for (i = 0; i < CHECKSUM_SIZE; i++) {
                    osSyncPrintf("%x ", *ptr);
                    if (++j == 0x20) {
                        osSyncPrintf("\n");
                        j = 0;
                    }
                    newChecksum += *ptr++;
                }

                gSaveContext.checksum = newChecksum;
                osSyncPrintf("\nCheck_Sum=%x(%x)\n", gSaveContext.checksum, newChecksum);

                offset = gSramSlotOffsets[1][slotNum];
                SsSram_ReadWrite(OS_K1_TO_PHYSICAL(0xA8000000) + offset, &gSaveContext, SLOT_SIZE, OS_WRITE);

                osSyncPrintf("????#%x,%x,%x,%x,%x,%x\n", gSaveContext.newf[0], gSaveContext.newf[1],
                             gSaveContext.newf[2], gSaveContext.newf[3], gSaveContext.newf[4], gSaveContext.newf[5]);
                osSyncPrintf("\nぽいんと＝%x(%d+3)  check_sum=%x(%x)\n", offset, slotNum, gSaveContext.checksum,
                             newChecksum);
            }

            offset = gSramSlotOffsets[0][slotNum];
            SsSram_ReadWrite(OS_K1_TO_PHYSICAL(0xA8000000) + offset, &gSaveContext, SLOT_SIZE, OS_WRITE);

            osSyncPrintf("ぽいんと＝%x(%d)  check_sum=%x(%x)\n", offset, slotNum, gSaveContext.checksum, newChecksum);
        } else {
            // SAVE data OK! ! ! !
            osSyncPrintf("\nＳＡＶＥデータ ＯＫ！！！！\n");
        }
    }

    bzero(sramCtx->readBuff, SRAM_SIZE);
    SsSram_ReadWrite(OS_K1_TO_PHYSICAL(0xA8000000), sramCtx->readBuff, SRAM_SIZE, OS_READ);
    gSaveContext.dayTime = dayTime;

    osSyncPrintf("SAVECT=%x, NAME=%x, LIFE=%x, ITEM=%x,  64DD=%x,  HEART=%x\n", DEATHS, NAME, HEALTH_CAP, QUEST, N64DD,
                 DEFENSE);

    MemCopy(&fileChooseCtx->deaths[0], sramCtx->readBuff + SLOT_OFFSET(0) + DEATHS, sizeof(fileChooseCtx->deaths[0]));
    MemCopy(&fileChooseCtx->deaths[1], sramCtx->readBuff + SLOT_OFFSET(1) + DEATHS, sizeof(fileChooseCtx->deaths[0]));
    MemCopy(&fileChooseCtx->deaths[2], sramCtx->readBuff + SLOT_OFFSET(2) + DEATHS, sizeof(fileChooseCtx->deaths[0]));

    MemCopy(&fileChooseCtx->fileNames[0], sramCtx->readBuff + SLOT_OFFSET(0) + NAME,
            sizeof(fileChooseCtx->fileNames[0]));
    MemCopy(&fileChooseCtx->fileNames[1], sramCtx->readBuff + SLOT_OFFSET(1) + NAME,
            sizeof(fileChooseCtx->fileNames[0]));
    MemCopy(&fileChooseCtx->fileNames[2], sramCtx->readBuff + SLOT_OFFSET(2) + NAME,
            sizeof(fileChooseCtx->fileNames[0]));

    MemCopy(&fileChooseCtx->healthCapacities[0], sramCtx->readBuff + SLOT_OFFSET(0) + HEALTH_CAP,
            sizeof(fileChooseCtx->healthCapacities[0]));
    MemCopy(&fileChooseCtx->healthCapacities[1], sramCtx->readBuff + SLOT_OFFSET(1) + HEALTH_CAP,
            sizeof(fileChooseCtx->healthCapacities[0]));
    MemCopy(&fileChooseCtx->healthCapacities[2], sramCtx->readBuff + SLOT_OFFSET(2) + HEALTH_CAP,
            sizeof(fileChooseCtx->healthCapacities[0]));

    MemCopy(&fileChooseCtx->questItems[0], sramCtx->readBuff + SLOT_OFFSET(0) + QUEST,
            sizeof(fileChooseCtx->questItems[0]));
    MemCopy(&fileChooseCtx->questItems[1], sramCtx->readBuff + SLOT_OFFSET(1) + QUEST,
            sizeof(fileChooseCtx->questItems[0]));
    MemCopy(&fileChooseCtx->questItems[2], sramCtx->readBuff + SLOT_OFFSET(2) + QUEST,
            sizeof(fileChooseCtx->questItems[0]));

    MemCopy(&fileChooseCtx->n64ddFlags[0], sramCtx->readBuff + SLOT_OFFSET(0) + N64DD,
            sizeof(fileChooseCtx->n64ddFlags[0]));
    MemCopy(&fileChooseCtx->n64ddFlags[1], sramCtx->readBuff + SLOT_OFFSET(1) + N64DD,
            sizeof(fileChooseCtx->n64ddFlags[0]));
    MemCopy(&fileChooseCtx->n64ddFlags[2], sramCtx->readBuff + SLOT_OFFSET(2) + N64DD,
            sizeof(fileChooseCtx->n64ddFlags[0]));

    MemCopy(&fileChooseCtx->heartStatus[0], sramCtx->readBuff + SLOT_OFFSET(0) + DEFENSE,
            sizeof(fileChooseCtx->heartStatus[0]));
    MemCopy(&fileChooseCtx->heartStatus[1], sramCtx->readBuff + SLOT_OFFSET(1) + DEFENSE,
            sizeof(fileChooseCtx->heartStatus[0]));
    MemCopy(&fileChooseCtx->heartStatus[2], sramCtx->readBuff + SLOT_OFFSET(2) + DEFENSE,
            sizeof(fileChooseCtx->heartStatus[0]));

    MemCopy(&fileChooseCtx->nowLife[0], sramCtx->readBuff + SLOT_OFFSET(0) + HEALTH, sizeof(fileChooseCtx->nowLife[0]));
    MemCopy(&fileChooseCtx->nowLife[1], sramCtx->readBuff + SLOT_OFFSET(1) + HEALTH, sizeof(fileChooseCtx->nowLife[0]));
    MemCopy(&fileChooseCtx->nowLife[2], sramCtx->readBuff + SLOT_OFFSET(2) + HEALTH, sizeof(fileChooseCtx->nowLife[0]));

    osSyncPrintf("f_64dd=%d, %d, %d\n", fileChooseCtx->n64ddFlags[0], fileChooseCtx->n64ddFlags[1],
                 fileChooseCtx->n64ddFlags[2]);
    osSyncPrintf("heart_status=%d, %d, %d\n", fileChooseCtx->heartStatus[0], fileChooseCtx->heartStatus[1],
                 fileChooseCtx->heartStatus[2]);
    osSyncPrintf("now_life=%d, %d, %d\n", fileChooseCtx->nowLife[0], fileChooseCtx->nowLife[1],
                 fileChooseCtx->nowLife[2]);
}
#else
#pragma GLOBAL_ASM("asm/non_matchings/code/z_sram/Sram_VerifyAndLoadAllSaves.s")
#endif

void Sram_InitSave(FileChooseContext* fileChooseCtx, SramContext* sramCtx) {
    u16 offset;
    u16 j;
    u16* ptr;
    u16 checksum;

    if (fileChooseCtx->btnIdx != 0) {
        Sram_InitNewSave();
    } else {
        Sram_InitDebugSave();
    }

    gSaveContext.entranceIndex = 0xBB;
    gSaveContext.linkAge = 1;
    gSaveContext.dayTime = 0x6AAB;
    gSaveContext.cutsceneIndex = 0xFFF1;

    if (fileChooseCtx->btnIdx == 0) {
        gSaveContext.cutsceneIndex = 0;
    }

    for (offset = 0; offset < 8; offset++) {
        gSaveContext.playerName[offset] = fileChooseCtx->fileNames[fileChooseCtx->btnIdx][offset];
    }

    gSaveContext.newf[0] = 'Z';
    gSaveContext.newf[1] = 'E';
    gSaveContext.newf[2] = 'L';
    gSaveContext.newf[3] = 'D';
    gSaveContext.newf[4] = 'A';
    gSaveContext.newf[5] = 'Z';

    gSaveContext.n64ddFlag = fileChooseCtx->n64ddFlag;
    osSyncPrintf("６４ＤＤフラグ=%d\n", fileChooseCtx->n64ddFlag);
    osSyncPrintf("newf=%x,%x,%x,%x,%x,%x\n", gSaveContext.newf[0], gSaveContext.newf[1], gSaveContext.newf[2],
                 gSaveContext.newf[3], gSaveContext.newf[4], gSaveContext.newf[5]);
    osSyncPrintf("\n$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$\n");

    ptr = (u16*)&gSaveContext;
    j = 0;
    checksum = 0;

    for (offset = 0; offset < CHECKSUM_SIZE; offset++) {
        osSyncPrintf("%x ", *ptr);
        checksum += *ptr++;
        if (++j == 0x20u) {
            osSyncPrintf("\n");
            j = 0;
        }
    }

    gSaveContext.checksum = checksum;
    osSyncPrintf("\nチェックサム＝%x\n", gSaveContext.checksum); // Checksum = %x

    offset = gSramSlotOffsets[0][gSaveContext.fileNum];
    osSyncPrintf("I=%x no=%d\n", offset, gSaveContext.fileNum);
    MemCopy(sramCtx->readBuff + offset, &gSaveContext, sizeof(Save));

    offset = gSramSlotOffsets[1][gSaveContext.fileNum];
    osSyncPrintf("I=%x no=%d\n", offset, gSaveContext.fileNum + 3);
    MemCopy(sramCtx->readBuff + offset, &gSaveContext, sizeof(Save));

    SsSram_ReadWrite(OS_K1_TO_PHYSICAL(0xA8000000), sramCtx->readBuff, SRAM_SIZE, OS_WRITE);

    // SAVE end
    osSyncPrintf("ＳＡＶＥ終了\n");
    osSyncPrintf("z_common_data.file_no = %d\n", gSaveContext.fileNum);
    osSyncPrintf("SAVECT=%x, NAME=%x, LIFE=%x, ITEM=%x,  SAVE_64DD=%x\n", DEATHS, NAME, HEALTH_CAP, QUEST, N64DD);

    j = gSramSlotOffsets[0][gSaveContext.fileNum];

    MemCopy(&fileChooseCtx->deaths[gSaveContext.fileNum], sramCtx->readBuff + j + DEATHS,
            sizeof(fileChooseCtx->deaths[0]));
    MemCopy(&fileChooseCtx->fileNames[gSaveContext.fileNum], sramCtx->readBuff + j + NAME,
            sizeof(fileChooseCtx->fileNames[0]));
    MemCopy(&fileChooseCtx->healthCapacities[gSaveContext.fileNum], sramCtx->readBuff + j + HEALTH_CAP,
            sizeof(fileChooseCtx->healthCapacities[0]));
    MemCopy(&fileChooseCtx->questItems[gSaveContext.fileNum], sramCtx->readBuff + j + QUEST,
            sizeof(fileChooseCtx->questItems[0]));
    MemCopy(&fileChooseCtx->n64ddFlags[gSaveContext.fileNum], sramCtx->readBuff + j + N64DD,
            sizeof(fileChooseCtx->n64ddFlags[0]));
    MemCopy(&fileChooseCtx->heartStatus[gSaveContext.fileNum], sramCtx->readBuff + j + DEFENSE,
            sizeof(fileChooseCtx->heartStatus[0]));
    MemCopy(&fileChooseCtx->nowLife[gSaveContext.fileNum], sramCtx->readBuff + j + HEALTH,
            sizeof(fileChooseCtx->nowLife[0]));

    osSyncPrintf("f_64dd[%d]=%d\n", gSaveContext.fileNum, fileChooseCtx->n64ddFlags[gSaveContext.fileNum]);
    osSyncPrintf("heart_status[%d]=%d\n", gSaveContext.fileNum, fileChooseCtx->heartStatus[gSaveContext.fileNum]);
    osSyncPrintf("now_life[%d]=%d\n", gSaveContext.fileNum, fileChooseCtx->nowLife[gSaveContext.fileNum]);
}

void Sram_EraseSave(FileChooseContext* fileChooseCtx, SramContext* sramCtx) {
    s32 offset;

    Sram_InitNewSave();

    offset = gSramSlotOffsets[0][fileChooseCtx->selectedFileIdx];
    MemCopy(sramCtx->readBuff + offset, &gSaveContext, sizeof(Save));
    SsSram_ReadWrite(OS_K1_TO_PHYSICAL(0xA8000000) + offset, &gSaveContext, SLOT_SIZE, OS_WRITE);

    MemCopy(&fileChooseCtx->n64ddFlags[fileChooseCtx->selectedFileIdx], sramCtx->readBuff + offset + N64DD,
            sizeof(fileChooseCtx->n64ddFlags[0]));

    offset = gSramSlotOffsets[1][fileChooseCtx->selectedFileIdx];
    MemCopy(sramCtx->readBuff + offset, &gSaveContext, sizeof(Save));
    SsSram_ReadWrite(OS_K1_TO_PHYSICAL(0xA8000000) + offset, &gSaveContext, SLOT_SIZE, OS_WRITE);

    osSyncPrintf("ＣＬＥＡＲ終了\n");
}

void Sram_CopySave(FileChooseContext* fileChooseCtx, SramContext* sramCtx) {
    s32 offset;

    osSyncPrintf("ＲＥＡＤ=%d(%x)  ＣＯＰＹ=%d(%x)\n", fileChooseCtx->selectedFileIdx,
                 gSramSlotOffsets[0][fileChooseCtx->selectedFileIdx], fileChooseCtx->copyDestFileIdx,
                 gSramSlotOffsets[0][fileChooseCtx->copyDestFileIdx]);

    offset = gSramSlotOffsets[0][fileChooseCtx->selectedFileIdx];
    MemCopy(&gSaveContext, sramCtx->readBuff + offset, sizeof(Save));

    offset = gSramSlotOffsets[0][fileChooseCtx->copyDestFileIdx];
    MemCopy(sramCtx->readBuff + offset, &gSaveContext, sizeof(Save));

    offset = gSramSlotOffsets[1][fileChooseCtx->copyDestFileIdx];
    MemCopy(sramCtx->readBuff + offset, &gSaveContext, sizeof(Save));

    SsSram_ReadWrite(OS_K1_TO_PHYSICAL(0xA8000000), sramCtx->readBuff, SRAM_SIZE, OS_WRITE);

    offset = gSramSlotOffsets[0][fileChooseCtx->copyDestFileIdx];

    MemCopy(&fileChooseCtx->deaths[fileChooseCtx->copyDestFileIdx], sramCtx->readBuff + offset + DEATHS,
            sizeof(fileChooseCtx->deaths[0]));
    MemCopy(&fileChooseCtx->fileNames[fileChooseCtx->copyDestFileIdx], sramCtx->readBuff + offset + NAME,
            sizeof(fileChooseCtx->fileNames[0]));
    MemCopy(&fileChooseCtx->healthCapacities[fileChooseCtx->copyDestFileIdx], sramCtx->readBuff + offset + HEALTH_CAP,
            sizeof(fileChooseCtx->healthCapacities[0]));
    MemCopy(&fileChooseCtx->questItems[fileChooseCtx->copyDestFileIdx], sramCtx->readBuff + offset + QUEST,
            sizeof(fileChooseCtx->questItems[0]));
    MemCopy(&fileChooseCtx->n64ddFlags[fileChooseCtx->copyDestFileIdx], sramCtx->readBuff + offset + N64DD,
            sizeof(fileChooseCtx->n64ddFlags[0]));
    MemCopy(&fileChooseCtx->heartStatus[fileChooseCtx->copyDestFileIdx], sramCtx->readBuff + offset + DEFENSE,
            sizeof(fileChooseCtx->heartStatus[0]));
    MemCopy(&fileChooseCtx->nowLife[fileChooseCtx->copyDestFileIdx], (sramCtx->readBuff + offset) + HEALTH,
            sizeof(fileChooseCtx->nowLife[0]));

    osSyncPrintf("f_64dd[%d]=%d\n", gSaveContext.fileNum, fileChooseCtx->n64ddFlags[gSaveContext.fileNum]);
    osSyncPrintf("heart_status[%d]=%d\n", gSaveContext.fileNum, fileChooseCtx->heartStatus[gSaveContext.fileNum]);
    osSyncPrintf("ＣＯＰＹ終了\n"); // Copy end
}

void Sram_Write16Bytes(SramContext* sramCtx) {
    SsSram_ReadWrite(OS_K1_TO_PHYSICAL(0xA8000000), sramCtx->readBuff, 0x10, OS_WRITE);
}

void Sram_InitSram(GameState* gameState, SramContext* sramCtx) {
    u16 i;

    osSyncPrintf("sram_initialize( Game *game, Sram *sram )\n");
    SsSram_ReadWrite(OS_K1_TO_PHYSICAL(0xA8000000), sramCtx->readBuff, SRAM_SIZE, OS_READ);

    for (i = 0; i < ARRAY_COUNTU(sZeldaMagic) - 3; i++) {
        if (sZeldaMagic[i + 3] != sramCtx->readBuff[i + 3]) {
            // SRAM destruction! ! ! ! ! !
            osSyncPrintf("ＳＲＡＭ破壊！！！！！！\n");
            gSaveContext.language = sramCtx->readBuff[2];
            MemCopy(sramCtx->readBuff, sZeldaMagic, sizeof(sZeldaMagic));
            sramCtx->readBuff[2] = gSaveContext.language;
            Sram_Write16Bytes(sramCtx);
        }
    }

    gSaveContext.audioSetting = sramCtx->readBuff[0] & 3;
    gSaveContext.zTargetSetting = sramCtx->readBuff[1] & 1;
    gSaveContext.language = sramCtx->readBuff[2];

    if (gSaveContext.language > 2) {
        gSaveContext.language = 0;
        sramCtx->readBuff[2] = gSaveContext.language;
        Sram_Write16Bytes(sramCtx);
    }

    if (CHECK_BTN_ANY(gameState->input[2].cur.button, BTN_DRIGHT)) {
        bzero(sramCtx->readBuff, SRAM_SIZE);
        for (i = 0; i < CHECKSUM_SIZE; i++) {
            sramCtx->readBuff[i] = i;
        }
        SsSram_ReadWrite(OS_K1_TO_PHYSICAL(0xA8000000), sramCtx->readBuff, SRAM_SIZE, OS_WRITE);
        // SRAM destruction! ! ! ! ! !
        osSyncPrintf("ＳＲＡＭ破壊！！！！！！\n");
    }

    // GOOD! GOOD! Size =% d +% d =% d
    osSyncPrintf("ＧＯＯＤ！ＧＯＯＤ！ サイズ＝%d + %d ＝ %d\n", sizeof(SaveInfo), 4, sizeof(SaveInfo) + 4);
    osSyncPrintf(VT_FGCOL(BLUE));
    osSyncPrintf("Na_SetSoundOutputMode = %d\n", gSaveContext.audioSetting);
    osSyncPrintf("Na_SetSoundOutputMode = %d\n", gSaveContext.audioSetting);
    osSyncPrintf("Na_SetSoundOutputMode = %d\n", gSaveContext.audioSetting);
    osSyncPrintf(VT_RST);
    func_800F6700(gSaveContext.audioSetting);
}

void Sram_Alloc(GameState* gameState, SramContext* sramCtx) {
    sramCtx->readBuff = GameState_Alloc(gameState, SRAM_SIZE, "../z_sram.c", 1294);

    if (!(sramCtx->readBuff != NULL)) {
        __assert("sram->read_buff != NULL", "../z_sram.c", 1295);
    }
}

void Sram_Init(GlobalContext* globalCtx, SramContext* sramCtx) {
}
