#ifndef Z_SELECT_H
#define Z_SELECT_H

#include "config.h"

void MapSelect_Init(GameState* thisx);
void MapSelect_Main(GameState* thisx);
void MapSelect_Draw(MapSelectState* this);
void MapSelect_Destroy(GameState* thisx);
void MapSelect_UpdateMenu(MapSelectState* this);
void MapSelect_DrawMenu(MapSelectState* this);
void MapSelect_DrawLoadingScreen(MapSelectState* this);
void MapSelect_LoadTitle(MapSelectState* this);
void MapSelect_LoadGame(MapSelectState* this, s32 entranceIndex);
void MapSelect_PrintMenu(MapSelectState* this, GfxPrint* printer);
void MapSelect_PrintLoadingMessage(MapSelectState* this, GfxPrint* printer, u8 yPos);
void MapSelect_PrintAgeSetting(MapSelectState* this, GfxPrint* printer, s32 age);
void MapSelect_PrintSceneLayerSetting(MapSelectState* this, GfxPrint* printer);
void MapSelect_PrintControls(MapSelectState* this, GfxPrint* printer);

static const char* sAgeLabels[] = {
    "Adult",
    "Child",
};

static const char* sLoadingMessages[] = {
    "Please wait a minute",
    "Hold on a sec",
    "Wait a moment",
    "Loading",
    "Now working",
    "Now creating",
    "It's not broken",
    "Coffee Break",
    "Please set B side",
    "Be patient, now",
    "Please wait just a minute",
    "Don't worry, don't worry. Take a break, take a break",
};

// The first element of the next 3 arrays needs to stay at the index 0

static const char* sControlLabels[] = {
    "[C-Down]: Show/Hide Controls",
    "[D-Pad]: Select Scene",
    "[B]: Change Link's Age",
    "[Z],[R]: Change the Scene Layer",
    "[A],[Start]: Load the scene",
    "[C-Left/Right]: Selection Color", // only for selected scene color in the list
    "[L],Controls Page: Play/Stop BGM",
};

static const Color_RGBA8 sColors[] = {
    { 255, 127, 0, 255 },   // Orange
    { 200, 200, 55, 255 },  // Yellow
    { 55, 255, 55, 255 },   // Green
    { 155, 55, 150, 255 },  // Purple
    { 0, 127, 255, 255 },   // Blue
    { 255, 20, 20, 255 },   // Red
    { 255, 255, 255, 255 }, // White
};

// "Translation" (Actual name)
static SceneSelectEntry sScenes[] = {
    // "1: SPOT00" (Hyrule Field)
    { " 1:SPOT00", MapSelect_LoadGame, ENTR_HYRULE_FIELD_0 },
    // "2: SPOT01" (Kakariko Village)
    { " 2:SPOT01", MapSelect_LoadGame, ENTR_KAKARIKO_VILLAGE_0 },
    // "3: SPOT02" (Graveyard)
    { " 3:SPOT02", MapSelect_LoadGame, ENTR_GRAVEYARD_0 },
    // "4: SPOT03" (Zora's River)
    { " 4:SPOT03", MapSelect_LoadGame, ENTR_ZORAS_RIVER_0 },
    // "5: SPOT04" (Kokiri Forest)
    { " 5:SPOT04", MapSelect_LoadGame, ENTR_KOKIRI_FOREST_0 },
    // "6: SPOT05" (Sacred Forest Meadow)
    { " 6:SPOT05", MapSelect_LoadGame, ENTR_SACRED_FOREST_MEADOW_0 },
    // "7: SPOT06" (Lake Hylia)
    { " 7:SPOT06", MapSelect_LoadGame, ENTR_LAKE_HYLIA_0 },
    // "8: SPOT07" (Zora's Domain)
    { " 8:SPOT07", MapSelect_LoadGame, ENTR_ZORAS_DOMAIN_0 },
    // "9: SPOT08" (Zora's Fountain)
    { " 9:SPOT08", MapSelect_LoadGame, ENTR_ZORAS_FOUNTAIN_0 },
    // "10: SPOT09" (Gerudo Valley)
    { "10:SPOT09", MapSelect_LoadGame, ENTR_GERUDO_VALLEY_0 },
    // "11: SPOT10" (Lost Woods)
    { "11:SPOT10", MapSelect_LoadGame, ENTR_LOST_WOODS_0 },
    // "12: SPOT11" (Desert Colossus)
    { "12:SPOT11", MapSelect_LoadGame, ENTR_DESERT_COLOSSUS_0 },
    // "13: SPOT12" (Gerudo's Fortress)
    { "13:SPOT12", MapSelect_LoadGame, ENTR_GERUDOS_FORTRESS_0 },
    // "14: SPOT13" (Haunted Wasteland)
    { "14:SPOT13", MapSelect_LoadGame, ENTR_HAUNTED_WASTELAND_0 },
    // "15: SPOT15" (Hyrule Castle)
    { "15:SPOT15", MapSelect_LoadGame, ENTR_HYRULE_CASTLE_0 },
    // "16: SPOT16" (Death Mountain Trail)
    { "16:SPOT16", MapSelect_LoadGame, ENTR_DEATH_MOUNTAIN_TRAIL_0 },
    // "17: SPOT17" (Death Mountain Crater)
    { "17:SPOT17", MapSelect_LoadGame, ENTR_DEATH_MOUNTAIN_CRATER_0 },
    // "18: SPOT18" (Goron City)
    { "18:SPOT18", MapSelect_LoadGame, ENTR_GORON_CITY_0 },
    // "19: SPOT20" (Lon Lon Ranch)
    { "19:SPOT20", MapSelect_LoadGame, ENTR_LON_LON_RANCH_0 },
    // "20: Chamber of Time" (Temple Of Time)
    { "20:" GFXP_HIRAGANA "ﾄｷﾉﾏ", MapSelect_LoadGame, ENTR_TEMPLE_OF_TIME_0 },
    // "21: Chamber of the Sages" (Chamber of the Sages)
    { "21:" GFXP_HIRAGANA "ｹﾝｼﾞｬﾉﾏ", MapSelect_LoadGame, ENTR_CHAMBER_OF_THE_SAGES_0 },
    // "22: Target Range" (Shooting Gallery)
    { "22:" GFXP_HIRAGANA "ｼｬﾃｷｼﾞｮｳ", MapSelect_LoadGame, ENTR_SHOOTING_GALLERY_0 },
    // "23: Hyrule Garden Game" (Hyrule Garden Minigame)
    { "23:" GFXP_KATAKANA "ﾊｲﾗﾙ" GFXP_HIRAGANA "ﾆﾜ" GFXP_KATAKANA "ｹﾞｰﾑ", MapSelect_LoadGame,
      ENTR_CASTLE_COURTYARD_GUARDS_DAY_0 },
    // "24: Grave Dive Hole" (Grave (Redead))
    { "24:" GFXP_HIRAGANA "ﾊｶｼﾀﾄﾋﾞｺﾐｱﾅ", MapSelect_LoadGame, ENTR_REDEAD_GRAVE_0 },
    // "25: Grave Dive Hole 2" (Grave (Fairy's Fountain))
    { "25:" GFXP_HIRAGANA "ﾊｶｼﾀﾄﾋﾞｺﾐｱﾅ 2", MapSelect_LoadGame, ENTR_GRAVE_WITH_FAIRYS_FOUNTAIN_0 },
    // "26: Royal Family's Grave" (Royal Family's Tomb)
    { "26:" GFXP_HIRAGANA "ｵｳｹ ﾉ ﾊｶｱﾅ", MapSelect_LoadGame, ENTR_ROYAL_FAMILYS_TOMB_0 },
    // "27: Great Fairy's Fountain" (Great Fairy's Fountain (Upgrades))
    { "27:" GFXP_HIRAGANA "ﾀﾞｲﾖｳｾｲﾉｲｽﾞﾐ", MapSelect_LoadGame, ENTR_GREAT_FAIRYS_FOUNTAIN_MAGIC_0 },
    // "28: Fairy Dive Hole" (Fairy's Fountain (Healing Fairies))
    { "28:" GFXP_HIRAGANA "ﾄﾋﾞｺﾐ ﾖｳｾｲ ｱﾅ", MapSelect_LoadGame, ENTR_FAIRYS_FOUNTAIN_0 },
    // "29: Magic Stone Fairy's Fountain" (Great Fairy's Fountain (Spells))
    { "29:" GFXP_HIRAGANA "ﾏﾎｳｾｷ ﾖｳｾｲﾉｲｽﾞﾐ", MapSelect_LoadGame, ENTR_GREAT_FAIRYS_FOUNTAIN_SPELLS_0 },
    // "30: Final Battle With Ganon" (Battle With Ganon)
    { "30:" GFXP_KATAKANA "ｶﾞﾉﾝ" GFXP_HIRAGANA "ｻｲｼｭｳｾﾝ", MapSelect_LoadGame, ENTR_GANONS_TOWER_COLLAPSE_EXTERIOR_0 },
    // "31: Hyrule Inner Garden" (Castle Courtyard)
    { "31:" GFXP_KATAKANA "ﾊｲﾗﾙ" GFXP_HIRAGANA "ﾅｶﾆﾜ", MapSelect_LoadGame, ENTR_CASTLE_COURTYARD_ZELDA_0 },
    // "32: Fishing" (Fishing Pond)
    { "32:" GFXP_HIRAGANA "ﾂﾘﾎﾞﾘ", MapSelect_LoadGame, ENTR_FISHING_POND_0 },
    // "33: Bombchu Bowling" (Bombchu Bowling Alley)
    { "33:" GFXP_KATAKANA "ﾎﾞﾑﾁｭｳﾎﾞｰﾘﾝｸﾞ", MapSelect_LoadGame, ENTR_BOMBCHU_BOWLING_ALLEY_0 },
    // "34: Lon Lon Ranch - Storehouse 1" (Talon's House)
    { "34:" GFXP_KATAKANA "ﾛﾝﾛﾝ" GFXP_HIRAGANA "ﾎﾞｸｼﾞｮｳ ｿｳｺ 1", MapSelect_LoadGame, ENTR_LON_LON_BUILDINGS_0 },
    // "35: Lon Lon Ranch - Storehouse 2" (Ranch Silo)
    { "35:" GFXP_KATAKANA "ﾛﾝﾛﾝ" GFXP_HIRAGANA "ﾎﾞｸｼﾞｮｳ ｿｳｺ 2", MapSelect_LoadGame, ENTR_LON_LON_BUILDINGS_1 },
    // "36: Lookout Hut" (Guard House)
    { "36:" GFXP_HIRAGANA "ﾐﾊﾘ ｺﾞﾔ", MapSelect_LoadGame, ENTR_MARKET_GUARD_HOUSE_0 },
    // "37: Magic Potion Shop" (Granny's Potion Shop)
    { "37:" GFXP_HIRAGANA "ﾏﾎｳ ﾉ ｸｽﾘﾔ", MapSelect_LoadGame, ENTR_POTION_SHOP_GRANNY_0 },
    // "38: Treasure Chest Shop" (Treasure Chest Game)
    { "38:" GFXP_HIRAGANA "ﾀｶﾗﾊﾞｺﾔ", MapSelect_LoadGame, ENTR_TREASURE_BOX_SHOP_0 },
    // "39: Gold Skulltula House" (House of Skulltula)
    { "39:" GFXP_HIRAGANA "ｷﾝ " GFXP_KATAKANA "ｽﾀﾙﾁｭﾗ ﾊｳｽ", MapSelect_LoadGame, ENTR_HOUSE_OF_SKULLTULA_0 },
    // "40: Castle Town - Entrance" (Market Entrance)
    { "40:" GFXP_HIRAGANA "ｼﾞｮｳｶﾏﾁ ｲﾘｸﾞﾁ", MapSelect_LoadGame, ENTR_MARKET_ENTRANCE_DAY_0 },
    // "41: Castle Town" (Market)
    { "41:" GFXP_HIRAGANA "ｼﾞｮｳｶﾏﾁ", MapSelect_LoadGame, ENTR_MARKET_DAY_0 },
    // "42: Back Alley" (Back Alley)
    { "42:" GFXP_HIRAGANA "ｳﾗﾛｼﾞ", MapSelect_LoadGame, ENTR_BACK_ALLEY_DAY_0 },
    // "43: In Front of the Temple of Time" (Temple of Time Exterior)
    { "43:" GFXP_HIRAGANA "ﾄｷﾉｼﾝﾃﾞﾝ ﾏｴ", MapSelect_LoadGame, ENTR_TEMPLE_OF_TIME_EXTERIOR_DAY_0 },
    // "44: Link's House" (Link's House)
    { "44:" GFXP_HIRAGANA "ﾘﾝｸﾉｲｴ", MapSelect_LoadGame, ENTR_LINKS_HOUSE_0 },
    // "45: Kakariko Village Row House" (Carpenter Boss's House)
    { "45:" GFXP_KATAKANA "ｶｶﾘｺ" GFXP_HIRAGANA "ﾑﾗﾉﾅｶﾞﾔ", MapSelect_LoadGame, ENTR_KAKARIKO_CENTER_GUEST_HOUSE_0 },
    // "46: Back Alley House" (Back Alley House (Man in Green))
    { "46:" GFXP_HIRAGANA "ｳﾗﾛｼﾞﾉ ｲｴ", MapSelect_LoadGame, ENTR_BACK_ALLEY_HOUSE_0 },
    // "47: Kokiri Village - Know-It-All Brothers' House" (Know-It-All Brothers' House)
    { "47:" GFXP_HIRAGANA "ｺｷﾘﾉﾑﾗ ﾓﾉｼﾘｷｮｳﾀﾞｲﾉｲｴ", MapSelect_LoadGame, ENTR_KNOW_IT_ALL_BROS_HOUSE_0 },
    // "48: Kokiri Village - Twins' House" (Twins' House)
    { "48:" GFXP_HIRAGANA "ｺｷﾘﾉﾑﾗ ﾌﾀｺﾞﾉｲｴ", MapSelect_LoadGame, ENTR_TWINS_HOUSE_0 },
    // "49: Kokiri Village - Mido's House" (Mido's House)
    { "49:" GFXP_HIRAGANA "ｺｷﾘﾉﾑﾗ " GFXP_KATAKANA "ﾐﾄﾞ" GFXP_HIRAGANA "ﾉｲｴ", MapSelect_LoadGame, ENTR_MIDOS_HOUSE_0 },
    // "50: Kokiri Village - Saria's House" (Saria's House)
    { "50:" GFXP_HIRAGANA "ｺｷﾘﾉﾑﾗ " GFXP_KATAKANA "ｻﾘｱ" GFXP_HIRAGANA "ﾉｲｴ", MapSelect_LoadGame, ENTR_SARIAS_HOUSE_0 },
    // "51: Stable" (Stable)
    { "51:" GFXP_HIRAGANA "ｳﾏｺﾞﾔ", MapSelect_LoadGame, ENTR_STABLE_0 },
    // "52: Grave Keeper's House" (Gravekeeper's Hut)
    { "52:" GFXP_HIRAGANA "ﾊｶﾓﾘﾉｲｴ", MapSelect_LoadGame, ENTR_GRAVEKEEPERS_HUT_0 },
    // "53: Back Alley - Dog Lady's House" (Back Alley House)
    { "53:" GFXP_HIRAGANA "ｳﾗﾛｼﾞ ｲﾇｵﾊﾞｻﾝﾉｲｴ", MapSelect_LoadGame, ENTR_DOG_LADY_HOUSE_0 },
    // "54: Kakariko Village - Impa's House" (Impa's House)
    { "54:" GFXP_HIRAGANA "ｶｶﾘｺﾑﾗ " GFXP_KATAKANA "ｲﾝﾊﾟ" GFXP_HIRAGANA "ﾉｲｴ", MapSelect_LoadGame, ENTR_IMPAS_HOUSE_0 },
    // "55: Hylia Laboratory" (Lakeside Laboratory)
    { "55:" GFXP_KATAKANA "ﾊｲﾘｱ" GFXP_HIRAGANA " ｹﾝｷｭｳｼﾞｮ", MapSelect_LoadGame, ENTR_LAKESIDE_LABORATORY_0 },
    // "56: Tent" (Carpenters' Tent)
    { "56:" GFXP_KATAKANA "ﾃﾝﾄ", MapSelect_LoadGame, ENTR_CARPENTERS_TENT_0 },
    // "57: Shield Shop" (Bazaar)
    { "57:" GFXP_HIRAGANA "ﾀﾃﾉﾐｾ", MapSelect_LoadGame, ENTR_BAZAAR_0 },
    // "58: Kokiri Shop" (Kokiri Shop)
    { "58:" GFXP_HIRAGANA "ｺｷﾘｿﾞｸﾉﾐｾ", MapSelect_LoadGame, ENTR_KOKIRI_SHOP_0 },
    // "59: Goron Shop" (Goron Shop)
    { "59:" GFXP_KATAKANA "ｺﾞﾛﾝ" GFXP_HIRAGANA "ﾉﾐｾ", MapSelect_LoadGame, ENTR_GORON_SHOP_0 },
    // "60: Zora Shop" (Zora Shop)
    { "60:" GFXP_KATAKANA "ｿﾞｰﾗ" GFXP_HIRAGANA "ﾉﾐｾ", MapSelect_LoadGame, ENTR_ZORA_SHOP_0 },
    // "61: Kakariko Village - Potion Shop" (Kakariko Potion Shop)
    { "61:" GFXP_KATAKANA "ｶｶﾘｺ" GFXP_HIRAGANA "ﾑﾗ  ｸｽﾘﾔ", MapSelect_LoadGame, ENTR_POTION_SHOP_KAKARIKO_0 },
    // "62: Castle Town - Potion Shop" (Market Potion Shop)
    { "62:" GFXP_HIRAGANA "ｼﾞｮｳｶﾏﾁ ｸｽﾘﾔ", MapSelect_LoadGame, ENTR_POTION_SHOP_MARKET_0 },
    // "63: Back Alley - Night Shop" (Bombchu Shop)
    { "63:" GFXP_HIRAGANA "ｳﾗﾛｼﾞ ﾖﾙﾉﾐｾ", MapSelect_LoadGame, ENTR_BOMBCHU_SHOP_0 },
    // "64: Mask Shop" (Happy Mask Shop)
    { "64:" GFXP_HIRAGANA "ｵﾒﾝﾔ", MapSelect_LoadGame, ENTR_HAPPY_MASK_SHOP_0 },
    // "65: Gerudo Training Area" (Gerudo Training Ground)
    { "65:" GFXP_KATAKANA "ｹﾞﾙﾄﾞ" GFXP_HIRAGANA "ﾉｼｭｳﾚﾝｼﾞｮｳ", MapSelect_LoadGame, ENTR_GERUDO_TRAINING_GROUND_0 },
    // "66: Fairy Tree Dungeon" (Inside the Deku Tree)
    { "66:" GFXP_HIRAGANA "ﾖｳｾｲﾉｷﾉ " GFXP_KATAKANA "ﾀﾞﾝｼﾞｮﾝ", MapSelect_LoadGame, ENTR_DEKU_TREE_0 },
    // "67: Fairy Tree Dungeon - Boss" (Gohma's Lair)
    { "67:" GFXP_HIRAGANA "ﾖｳｾｲﾉｷﾉ " GFXP_KATAKANA "ﾀﾞﾝｼﾞｮﾝ ﾎﾞｽ", MapSelect_LoadGame, ENTR_DEKU_TREE_BOSS_0 },
    // "68: Dondogo Dungeon" (Dodongo's Cavern)
    { "68:" GFXP_KATAKANA "ﾄﾞﾄﾞﾝｺﾞ ﾀﾞﾝｼﾞｮﾝ", MapSelect_LoadGame, ENTR_DODONGOS_CAVERN_0 },
    // "69: Dondogo Dungeon - Boss" (King Dodongo's Lair)
    { "69:" GFXP_KATAKANA "ﾄﾞﾄﾞﾝｺﾞ ﾀﾞﾝｼﾞｮﾝ ﾎﾞｽ", MapSelect_LoadGame, ENTR_DODONGOS_CAVERN_BOSS_0 },
    // "70: Giant Fish Dungeon" (Inside Jabu-Jabu's Belly)
    { "70:" GFXP_HIRAGANA "ｷｮﾀﾞｲｷﾞｮ " GFXP_KATAKANA "ﾀﾞﾝｼﾞｮﾝ", MapSelect_LoadGame, ENTR_JABU_JABU_0 },
    // "71: Giant Fish Dungeon - Boss" (Barinade's Lair)
    { "71:" GFXP_HIRAGANA "ｷｮﾀﾞｲｷﾞｮ " GFXP_KATAKANA "ﾀﾞﾝｼﾞｮﾝ ﾎﾞｽ", MapSelect_LoadGame, ENTR_JABU_JABU_BOSS_0 },
    // "72: Forest Temple" (Forest Temple)
    { "72:" GFXP_HIRAGANA "ﾓﾘﾉｼﾝﾃﾞﾝ", MapSelect_LoadGame, ENTR_FOREST_TEMPLE_0 },
    // "73: Forest Temple - Boss" (Phantom Ganon's Lair)
    { "73:" GFXP_HIRAGANA "ﾓﾘﾉｼﾝﾃﾞﾝ " GFXP_KATAKANA "ﾎﾞｽ", MapSelect_LoadGame, ENTR_FOREST_TEMPLE_BOSS_0 },
    // "74: Dungeon Below the Well" (Bottom of the Well)
    { "74:" GFXP_HIRAGANA "ｲﾄﾞｼﾀ " GFXP_KATAKANA "ﾀﾞﾝｼﾞｮﾝ", MapSelect_LoadGame, ENTR_BOTTOM_OF_THE_WELL_0 },
    // "75: Dungeon Beneath the Graves" (Shadow Temple)
    { "75:" GFXP_HIRAGANA "ﾊｶｼﾀ " GFXP_KATAKANA "ﾀﾞﾝｼﾞｮﾝ", MapSelect_LoadGame, ENTR_SHADOW_TEMPLE_0 },
    // "76: Dungeon Beneath the Graves - Boss" (Bongo Bongo's Lair)
    { "76:" GFXP_HIRAGANA "ﾊｶｼﾀ " GFXP_KATAKANA "ﾀﾞﾝｼﾞｮﾝ ﾎﾞｽ", MapSelect_LoadGame, ENTR_SHADOW_TEMPLE_BOSS_0 },
    // "77: Fire Temple" (Fire Temple)
    { "77:" GFXP_HIRAGANA "ﾋﾉｼﾝﾃﾞﾝ", MapSelect_LoadGame, ENTR_FIRE_TEMPLE_0 },
    // "78: Fire Temple - Boss" (Volvagia's Lair)
    { "78:" GFXP_HIRAGANA "ﾋﾉｼﾝﾃﾞﾝ " GFXP_KATAKANA "ﾎﾞｽ", MapSelect_LoadGame, ENTR_FIRE_TEMPLE_BOSS_0 },
    // "79: Water Temple" (Water Temple)
    { "79:" GFXP_HIRAGANA "ﾐｽﾞﾉｼﾝﾃﾞﾝ", MapSelect_LoadGame, ENTR_WATER_TEMPLE_0 },
    // "80: Water Temple - Boss" (Morpha's Lair)
    { "80:" GFXP_HIRAGANA "ﾐｽﾞﾉｼﾝﾃﾞﾝ " GFXP_KATAKANA "ﾎﾞｽ", MapSelect_LoadGame, ENTR_WATER_TEMPLE_BOSS_0 },
    // "81: Evil Goddess Statue Dungeon" (Spirit Temple)
    { "81:" GFXP_HIRAGANA "ｼﾞｬｼﾝｿﾞｳ " GFXP_KATAKANA "ﾀﾞﾝｼﾞｮﾝ", MapSelect_LoadGame, ENTR_SPIRIT_TEMPLE_0 },
    // "82: Evil Goddess Statue Dungeon - Iron Knuckle" (Iron Knuckle's Lair)
    { "82:" GFXP_HIRAGANA "ｼﾞｬｼﾝｿﾞｳ " GFXP_KATAKANA "ﾀﾞﾝｼﾞｮﾝ ｱｲｱﾝﾅｯｸ", MapSelect_LoadGame, ENTR_SPIRIT_TEMPLE_BOSS_0 },
    // "83: Evil Goddess Statue Dungeon - Boss" (Twinrova's Lair)
    { "83:" GFXP_HIRAGANA "ｼﾞｬｼﾝｿﾞｳ " GFXP_KATAKANA "ﾀﾞﾝｼﾞｮﾝ ﾎﾞｽ", MapSelect_LoadGame, ENTR_SPIRIT_TEMPLE_BOSS_2 },
    // "84: Ganon's Tower" (Ganon's Tower)
    { "84:" GFXP_KATAKANA "ｶﾞﾉﾝ" GFXP_HIRAGANA "ﾉﾄｳ", MapSelect_LoadGame, ENTR_GANONS_TOWER_0 },
    // "85: Ganon's Tower - Boss" (Ganondorf's Lair)
    { "85:" GFXP_KATAKANA "ｶﾞﾉﾝ" GFXP_HIRAGANA "ﾉﾄｳ" GFXP_KATAKANA "ﾎﾞｽ", MapSelect_LoadGame, ENTR_GANONDORF_BOSS_0 },
    // "86: Ice Cavern" (Ice Cavern)
    { "86:" GFXP_HIRAGANA "ｺｵﾘﾉﾄﾞｳｸﾂ", MapSelect_LoadGame, ENTR_ICE_CAVERN_0 },
    // "87: Relay Beneath the Graves" (Dampé's Grave)
    { "87:" GFXP_HIRAGANA "ﾊｶｼﾀ" GFXP_KATAKANA "ﾘﾚｰ", MapSelect_LoadGame, ENTR_WINDMILL_AND_DAMPES_GRAVE_0 },
    // "88: Ganon's Basement Dungeon" (Inside Ganon's Castle)
    { "88:" GFXP_KATAKANA "ｶﾞﾉﾝ" GFXP_HIRAGANA "ﾁｶ " GFXP_KATAKANA "ﾀﾞﾝｼﾞｮﾝ", MapSelect_LoadGame,
      ENTR_INSIDE_GANONS_CASTLE_0 },
    // "89: Final Battle With Ganon - Cutscene & Battle" (Ganondorf's Death Scene & Tower Escape Exterior)
    { "89:" GFXP_KATAKANA "ｶﾞﾉﾝ" GFXP_HIRAGANA "ｻｲｼｭｳｾﾝ " GFXP_KATAKANA "ﾃﾞﾓ & ﾊﾞﾄﾙ", MapSelect_LoadGame,
      ENTR_GANON_BOSS_0 },
    // "90: Ganon's Tower Aftermath 1" (Escaping Ganon's Tower 1)
    { "90:" GFXP_KATAKANA "ｶﾞﾉﾝ" GFXP_HIRAGANA "ﾉﾄｳ ｿﾉｺﾞ 1", MapSelect_LoadGame,
      ENTR_GANONS_TOWER_COLLAPSE_INTERIOR_0 },
    // "91: Ganon's Tower Aftermath 2" (Escaping Ganon's Tower 2)
    { "91:" GFXP_KATAKANA "ｶﾞﾉﾝ" GFXP_HIRAGANA "ﾉﾄｳ ｿﾉｺﾞ 2", MapSelect_LoadGame,
      ENTR_GANONS_TOWER_COLLAPSE_INTERIOR_2 },
    // "92: Ganon's Tower Aftermath 3" (Escaping Ganon's Tower 3)
    { "92:" GFXP_KATAKANA "ｶﾞﾉﾝ" GFXP_HIRAGANA "ﾉﾄｳ ｿﾉｺﾞ 3", MapSelect_LoadGame,
      ENTR_GANONS_TOWER_COLLAPSE_INTERIOR_4 },
    // "93: Ganon's Tower Aftermath 4" (Escaping Ganon's Tower 4)
    { "93:" GFXP_KATAKANA "ｶﾞﾉﾝ" GFXP_HIRAGANA "ﾉﾄｳ ｿﾉｺﾞ 4", MapSelect_LoadGame,
      ENTR_GANONS_TOWER_COLLAPSE_INTERIOR_6 },
    // "94: Ganon's Basement Aftermath" (Escaping Ganon's Castle)
    { "94:" GFXP_KATAKANA "ｶﾞﾉﾝ" GFXP_HIRAGANA "ﾁｶ ｿﾉｺﾞ", MapSelect_LoadGame, ENTR_INSIDE_GANONS_CASTLE_COLLAPSE_0 },
    // "95: Gerudo Passage 1-2" (Thieves' Hideout 1)
    { "95:" GFXP_KATAKANA "ｹﾞﾙﾄﾞ" GFXP_HIRAGANA "ﾂｳﾛ 1-2", MapSelect_LoadGame, ENTR_THIEVES_HIDEOUT_0 },
    // "96: Gerudo Passage 3-4 9-10" (Thieves' Hideout 2)
    { "96:" GFXP_KATAKANA "ｹﾞﾙﾄﾞ" GFXP_HIRAGANA "ﾂｳﾛ 3-4 9-10", MapSelect_LoadGame, ENTR_THIEVES_HIDEOUT_2 },
    // "97: Gerudo Passage 5-6" (Thieves' Hideout 3)
    { "97:" GFXP_KATAKANA "ｹﾞﾙﾄﾞ" GFXP_HIRAGANA "ﾂｳﾛ 5-6", MapSelect_LoadGame, ENTR_THIEVES_HIDEOUT_4 },
    // "98: Gerudo Passage 7-8" (Thieves' Hideout 4)
    { "98:" GFXP_KATAKANA "ｹﾞﾙﾄﾞ" GFXP_HIRAGANA "ﾂｳﾛ 7-8", MapSelect_LoadGame, ENTR_THIEVES_HIDEOUT_6 },
    // "99: Gerudo Passage 11-12" (Thieves' Hideout 5)
    { "99:" GFXP_KATAKANA "ｹﾞﾙﾄﾞ" GFXP_HIRAGANA "ﾂｳﾛ 11-12", MapSelect_LoadGame, ENTR_THIEVES_HIDEOUT_10 },
    // "100: Gerudo Passage 13" (Thieves' Hideout 6)
    { "100:" GFXP_KATAKANA "ｹﾞﾙﾄﾞ" GFXP_HIRAGANA "ﾂｳﾛ 13", MapSelect_LoadGame, ENTR_THIEVES_HIDEOUT_12 },
    // "101: Hidden Dive Hole 0" (Grotto 0 - Gossip Stone & Chest)
    { "101:" GFXP_HIRAGANA "ｶｸｼﾄﾋﾞｺﾐｱﾅ 0", MapSelect_LoadGame, ENTR_GROTTOS_0 },
    // "102: Hidden Dive Hole 1" (Grotto 1 - Skulltula & Gold Skulltula)
    { "102:" GFXP_HIRAGANA "ｶｸｼﾄﾋﾞｺﾐｱﾅ 1", MapSelect_LoadGame, ENTR_GROTTOS_1 },
    // "103: Hidden Dive Hole 2" (Grotto 2 - Business Scrub & Heart Piece)
    { "103:" GFXP_HIRAGANA "ｶｸｼﾄﾋﾞｺﾐｱﾅ 2", MapSelect_LoadGame, ENTR_GROTTOS_2 },
    // "104: Hidden Dive Hole 3" (Grotto 3 - Redeads)
    { "104:" GFXP_HIRAGANA "ｶｸｼﾄﾋﾞｺﾐｱﾅ 3", MapSelect_LoadGame, ENTR_GROTTOS_3 },
    // "105: Hidden Dive Hole 4" (Grotto 4 - 3 Business Scrubs)
    { "105:" GFXP_HIRAGANA "ｶｸｼﾄﾋﾞｺﾐｱﾅ 4", MapSelect_LoadGame, ENTR_GROTTOS_4 },
    // "106: Hidden Dive Hole 5" (Grotto 5 - Gossip Stone, Skulltula, Cow)
    { "106:" GFXP_HIRAGANA "ｶｸｼﾄﾋﾞｺﾐｱﾅ 5", MapSelect_LoadGame, ENTR_GROTTOS_5 },
    // "107: Hidden Dive Hole 6" (Grotto 6 - Octorok)
    { "107:" GFXP_HIRAGANA "ｶｸｼﾄﾋﾞｺﾐｱﾅ 6", MapSelect_LoadGame, ENTR_GROTTOS_6 },
    // "108: Hidden Dive Hole 7" (Grotto 7 - Business Scrub & Deku Nut Upgrade)
    { "108:" GFXP_HIRAGANA "ｶｸｼﾄﾋﾞｺﾐｱﾅ 7", MapSelect_LoadGame, ENTR_GROTTOS_7 },
    // "109: Hidden Dive Hole 8" (Grotto 8 - 2 Wolfos)
    { "109:" GFXP_HIRAGANA "ｶｸｼﾄﾋﾞｺﾐｱﾅ 8", MapSelect_LoadGame, ENTR_GROTTOS_8 },
    // "110: Hidden Dive Hole 9" (Grotto 9 - Bombable Walls)
    { "110:" GFXP_HIRAGANA "ｶｸｼﾄﾋﾞｺﾐｱﾅ 9", MapSelect_LoadGame, ENTR_GROTTOS_9 },
    // "111: Hidden Dive Hole 10" (Grotto 10 - 2 Business Scrubs)
    { "111:" GFXP_HIRAGANA "ｶｸｼﾄﾋﾞｺﾐｱﾅ 10", MapSelect_LoadGame, ENTR_GROTTOS_10 },
    // "112: Hidden Dive Hole 11" (Grotto 11 - Tektite & Heart Piece)
    { "112:" GFXP_HIRAGANA "ｶｸｼﾄﾋﾞｺﾐｱﾅ 11", MapSelect_LoadGame, ENTR_GROTTOS_11 },
    // "113: Hidden Dive Hole 12" (Grotto 12 - Deku Stage)
    { "113:" GFXP_HIRAGANA "ｶｸｼﾄﾋﾞｺﾐｱﾅ 12", MapSelect_LoadGame, ENTR_GROTTOS_12 },
    // "114: Hidden Dive Hole 13" (Grotto 13 - Rupees & Cow)
    { "114:" GFXP_HIRAGANA "ｶｸｼﾄﾋﾞｺﾐｱﾅ 13", MapSelect_LoadGame, ENTR_GROTTOS_13 },
    // "115: Hyrule Cutscenes" (Cutscene Map)
    { "115:" GFXP_KATAKANA "ﾊｲﾗﾙ ﾃﾞﾓ", MapSelect_LoadGame, ENTR_CUTSCENE_MAP_0 },
    // "116: Special Room (Treasure Chest Warp)" (Ganondorf Test Room)
    { "116:" GFXP_HIRAGANA "ﾍﾞｯｼﾂ (ﾀｶﾗﾊﾞｺ" GFXP_KATAKANA "ﾜｰﾌﾟ)", MapSelect_LoadGame, ENTR_BESITU_0 },
    // "117: Sasaki Test" (Sasa Test)
    { "117:" GFXP_HIRAGANA "ｻｻ" GFXP_KATAKANA "ﾃｽﾄ", MapSelect_LoadGame, ENTR_SASATEST_0 },
    // "118: Test Map" (Jungle Gym)
    { "118:" GFXP_KATAKANA "ﾃｽﾄﾏｯﾌﾟ", MapSelect_LoadGame, ENTR_TEST01_0 },
    // "119: Test Room" (Treasure Chest Room)
    { "119:" GFXP_KATAKANA "ﾃｽﾄﾙｰﾑ", MapSelect_LoadGame, ENTR_TESTROOM_0 },
    // "120: Stalfos Miniboss Room" (Stalfos Miniboss Room)
    { "120:" GFXP_HIRAGANA "ﾁｭｳ" GFXP_KATAKANA "ｽﾀﾛﾌｫｽ" GFXP_HIRAGANA "ﾍﾞﾔ", MapSelect_LoadGame, ENTR_SYOTES_0 },
    // "121: Boss Stalfos Room" (Stalfos Boss Room)
    { "121:" GFXP_KATAKANA "ﾎﾞｽｽﾀﾛﾌｫｽ" GFXP_HIRAGANA "ﾍﾞﾔ", MapSelect_LoadGame, ENTR_SYOTES2_0 },
    // "122: Stal" (Sutaru)
    { "122:Sutaru", MapSelect_LoadGame, ENTR_SUTARU_0 },
    // "123: Test Area" (Shooting Gallery)
    { "123:jikkenjyou", MapSelect_LoadGame, ENTR_TEST_SYATEKIJYOU_0 },
    // "124: Depth Test" (Depth Test)
    { "124:depth" GFXP_KATAKANA "ﾃｽﾄ", MapSelect_LoadGame, ENTR_DEPTH_TEST_0 },
    // "125: Hyrule Garden Game 2" (Early Hyrule Garden Game)
    { "125:" GFXP_KATAKANA "ﾊｲﾗﾙ" GFXP_HIRAGANA "ﾆﾜ" GFXP_KATAKANA "ｹﾞｰﾑ2", MapSelect_LoadGame, ENTR_HAIRAL_NIWA2_0 },
    // "title" (Title Screen)
    { "title", (void*)MapSelect_LoadTitle, 0 },
};

static const s16 childLinkSfx[] = {
    NA_SE_VO_LI_SWORD_N_KID,
    NA_SE_VO_LI_ROLLING_CUT_KID,
    NA_SE_VO_LI_HANG_KID,
    NA_SE_VO_LI_CLIMB_END_KID,
    NA_SE_VO_LI_DAMAGE_S_KID,
    NA_SE_VO_LI_FREEZE_KID,
    NA_SE_VO_LI_FALL_S_KID,
    NA_SE_VO_LI_FALL_L_KID,
    NA_SE_VO_LI_BREATH_REST_KID,
    NA_SE_VO_LI_BREATH_DRINK_KID,
    NA_SE_VO_LI_DOWN_KID,
    NA_SE_VO_LI_TAKEN_AWAY_KID,
    NA_SE_VO_LI_HELD_KID,
    NA_SE_VO_LI_SNEEZE_KID,
    NA_SE_VO_LI_SWEAT_KID,
    NA_SE_VO_LI_DRINK_KID,
    NA_SE_VO_LI_RELAX_KID,
    NA_SE_VO_LI_SWORD_PUTAWAY_KID,
    NA_SE_VO_LI_GROAN_KID,
    NA_SE_VO_LI_AUTO_JUMP_KID,
    NA_SE_VO_LI_MAGIC_NALE_KID,
    NA_SE_VO_LI_SURPRISE_KID,
    NA_SE_VO_LI_MAGIC_FROL_KID,
    NA_SE_VO_LI_PUSH_KID,
    NA_SE_VO_LI_HOOKSHOT_HANG_KID,
    NA_SE_VO_LI_LAND_DAMAGE_S_KID,
    NA_SE_VO_LI_MAGIC_ATTACK_KID,
    NA_SE_VO_BL_DOWN_KID,
};

static const u16 adultLinkSfx[] = {
    NA_SE_VO_LI_SWORD_N,
    NA_SE_VO_LI_SWORD_L,
    NA_SE_VO_LI_LASH,
    NA_SE_VO_LI_HANG,
    NA_SE_VO_LI_CLIMB_END,
    NA_SE_VO_LI_DAMAGE_S,
    NA_SE_VO_LI_FREEZE,
    NA_SE_VO_LI_FALL_S,
    NA_SE_VO_LI_FALL_L,
    NA_SE_VO_LI_BREATH_REST,
    NA_SE_VO_LI_BREATH_DRINK,
    NA_SE_VO_LI_DOWN,
    NA_SE_VO_LI_TAKEN_AWAY,
    NA_SE_VO_LI_HELD,
    NA_SE_VO_LI_SNEEZE,
    NA_SE_VO_LI_SWEAT,
    NA_SE_VO_LI_DRINK,
    NA_SE_VO_LI_RELAX,
    NA_SE_VO_LI_SWORD_PUTAWAY,
    NA_SE_VO_LI_GROAN,
    NA_SE_VO_LI_AUTO_JUMP,
    NA_SE_VO_LI_MAGIC_NALE,
    NA_SE_VO_LI_SURPRISE,
    NA_SE_VO_LI_MAGIC_FROL,
    NA_SE_VO_LI_PUSH,
    NA_SE_VO_LI_HOOKSHOT_HANG,
    NA_SE_VO_LI_LAND_DAMAGE_S,
    NA_SE_VO_LI_MAGIC_ATTACK,
    NA_SE_VO_BL_DOWN,
};

#endif
