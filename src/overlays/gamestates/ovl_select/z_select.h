#ifndef Z_SELECT_H
#define Z_SELECT_H

#include "config.h"
#include "versions.h"

#if PLATFORM_N64
void func_80800AD0_unknown(MapSelectState* this, s32 arg1);
void func_80800B08_unknown(MapSelectState* this, s32 arg1);
#endif

void MapSelect_Init(GameState* thisx);
void MapSelect_Main(GameState* thisx);
void MapSelect_Draw(MapSelectState* this);
void MapSelect_Destroy(GameState* thisx);
void MapSelect_UpdateMenu(MapSelectState* this);
void MapSelect_DrawMenu(MapSelectState* this);
void MapSelect_DrawLoadingScreen(MapSelectState* this);
void MapSelect_LoadTitle(MapSelectState* this);
void MapSelect_LoadDebugOpening(MapSelectState* this);
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

static SceneSelectEntry sScenes[] = {
#if IS_DEBUG_BOOT_ENABLED
    { "Boot Menu", (void*)MapSelect_LoadDebugOpening, 0 },
#endif
    { "Title Screen", (void*)MapSelect_LoadTitle, 0 },
#if CAN_INCLUDE_EXAMPLE_SCENE
    { "Example", MapSelect_LoadGame, ENTR_EXAMPLE_0 },
#endif
    { "Hyrule Field", MapSelect_LoadGame, ENTR_HYRULE_FIELD_0 },
    { "Kakariko Village", MapSelect_LoadGame, ENTR_KAKARIKO_VILLAGE_0 },
    { "Graveyard", MapSelect_LoadGame, ENTR_GRAVEYARD_0 },
    { "Zora's River", MapSelect_LoadGame, ENTR_ZORAS_RIVER_0 },
    { "Kokiri Forest", MapSelect_LoadGame, ENTR_KOKIRI_FOREST_0 },
    { "Sacred Forest Meadow", MapSelect_LoadGame, ENTR_SACRED_FOREST_MEADOW_0 },
    { "Lake Hylia", MapSelect_LoadGame, ENTR_LAKE_HYLIA_0 },
    { "Zora's Domain", MapSelect_LoadGame, ENTR_ZORAS_DOMAIN_0 },
    { "Zora's Fountain", MapSelect_LoadGame, ENTR_ZORAS_FOUNTAIN_0 },
    { "Gerudo Valley", MapSelect_LoadGame, ENTR_GERUDO_VALLEY_0 },
    { "Lost Woods", MapSelect_LoadGame, ENTR_LOST_WOODS_0 },
    { "Desert Colossus", MapSelect_LoadGame, ENTR_DESERT_COLOSSUS_0 },
    { "Gerudo's Fortress", MapSelect_LoadGame, ENTR_GERUDOS_FORTRESS_0 },
    { "Haunted Wasteland", MapSelect_LoadGame, ENTR_HAUNTED_WASTELAND_0 },
    { "Hyrule Castle", MapSelect_LoadGame, ENTR_HYRULE_CASTLE_0 },
    { "Death Mountain Trail", MapSelect_LoadGame, ENTR_DEATH_MOUNTAIN_TRAIL_0 },
    { "Death Mountain Crater", MapSelect_LoadGame, ENTR_DEATH_MOUNTAIN_CRATER_0 },
    { "Goron City", MapSelect_LoadGame, ENTR_GORON_CITY_0 },
    { "Lon Lon Ranch", MapSelect_LoadGame, ENTR_LON_LON_RANCH_0 },
    { "Temple Of Time", MapSelect_LoadGame, ENTR_TEMPLE_OF_TIME_0 },
    { "Chamber of Sages", MapSelect_LoadGame, ENTR_CHAMBER_OF_THE_SAGES_0 },
    { "Shooting Gallery", MapSelect_LoadGame, ENTR_SHOOTING_GALLERY_0 },
    { "Castle Courtyard (Guards)", MapSelect_LoadGame, ENTR_CASTLE_COURTYARD_GUARDS_DAY_0 },
    { "Heart Piece Grave", MapSelect_LoadGame, ENTR_REDEAD_GRAVE_0 },
    { "Hylian Shield Grave", MapSelect_LoadGame, ENTR_GRAVE_WITH_FAIRYS_FOUNTAIN_0 },
    { "Royal Family's Tomb", MapSelect_LoadGame, ENTR_ROYAL_FAMILYS_TOMB_0 },
    { "Great Fairy's Fountain (Upgrades)", MapSelect_LoadGame, ENTR_GREAT_FAIRYS_FOUNTAIN_MAGIC_0 },
    { "Fairy's Fountain", MapSelect_LoadGame, ENTR_FAIRYS_FOUNTAIN_0 },
    { "Great Fairy's Fountain (Spells)", MapSelect_LoadGame, ENTR_GREAT_FAIRYS_FOUNTAIN_SPELLS_0 },
    { "Ganon's Tower - Collapsing", MapSelect_LoadGame, ENTR_GANONS_TOWER_COLLAPSE_EXTERIOR_0 },
    { "Castle Courtyard (Zelda)", MapSelect_LoadGame, ENTR_CASTLE_COURTYARD_ZELDA_0 },
    { "Fishing Pond", MapSelect_LoadGame, ENTR_FISHING_POND_0 },
    { "Bombchu Bowling Alley", MapSelect_LoadGame, ENTR_BOMBCHU_BOWLING_ALLEY_0 },
    { "Lon Lon Ranch House", MapSelect_LoadGame, ENTR_LON_LON_BUILDINGS_0 },
    { "Lon Lon Ranch Silo", MapSelect_LoadGame, ENTR_LON_LON_BUILDINGS_1 },
    { "Guard House (Pots / Poe Room)", MapSelect_LoadGame, ENTR_MARKET_GUARD_HOUSE_0 },
    { "Granny's Potion Shop", MapSelect_LoadGame, ENTR_POTION_SHOP_GRANNY_0 },
    { "Treasure Chest Game", MapSelect_LoadGame, ENTR_TREASURE_BOX_SHOP_0 },
    { "House Of Skulltula", MapSelect_LoadGame, ENTR_HOUSE_OF_SKULLTULA_0 },
    { "Market Entrance", MapSelect_LoadGame, ENTR_MARKET_ENTRANCE_DAY_0 },
    { "Market", MapSelect_LoadGame, ENTR_MARKET_DAY_0 },
    { "Back Alley", MapSelect_LoadGame, ENTR_BACK_ALLEY_DAY_0 },
    { "Temple of Time Exterior", MapSelect_LoadGame, ENTR_TEMPLE_OF_TIME_EXTERIOR_DAY_0 },
    { "Link's House", MapSelect_LoadGame, ENTR_LINKS_HOUSE_0 },
    { "Kakariko House 1", MapSelect_LoadGame, ENTR_KAKARIKO_CENTER_GUEST_HOUSE_0 },
    { "Back Alley House 1", MapSelect_LoadGame, ENTR_BACK_ALLEY_HOUSE_0 },
    { "House of Know-it-All Brothers", MapSelect_LoadGame, ENTR_KNOW_IT_ALL_BROS_HOUSE_0 },
    { "House of Twins", MapSelect_LoadGame, ENTR_TWINS_HOUSE_0 },
    { "Mido's House", MapSelect_LoadGame, ENTR_MIDOS_HOUSE_0 },
    { "Saria's House", MapSelect_LoadGame, ENTR_SARIAS_HOUSE_0 },
    { "Stable", MapSelect_LoadGame, ENTR_STABLE_0 },
    { "Grave Keeper's Hut", MapSelect_LoadGame, ENTR_GRAVEKEEPERS_HUT_0 },
    { "Dog Lady's House", MapSelect_LoadGame, ENTR_DOG_LADY_HOUSE_0 },
    { "Impa's House", MapSelect_LoadGame, ENTR_IMPAS_HOUSE_0 },
    { "Lakeside Laboratory", MapSelect_LoadGame, ENTR_LAKESIDE_LABORATORY_0 },
    { "Carpenters' Tent", MapSelect_LoadGame, ENTR_CARPENTERS_TENT_0 },
    { "Bazaar", MapSelect_LoadGame, ENTR_BAZAAR_0 },
    { "Kokiri Shop", MapSelect_LoadGame, ENTR_KOKIRI_SHOP_0 },
    { "Goron Shop", MapSelect_LoadGame, ENTR_GORON_SHOP_0 },
    { "Zora Shop", MapSelect_LoadGame, ENTR_ZORA_SHOP_0 },
    { "Kakariko Potion Shop", MapSelect_LoadGame, ENTR_POTION_SHOP_KAKARIKO_0 },
    { "Market Potion Shop", MapSelect_LoadGame, ENTR_POTION_SHOP_MARKET_0 },
    { "Bombchu Shop", MapSelect_LoadGame, ENTR_BOMBCHU_SHOP_0 },
    { "Happy Mask Shop", MapSelect_LoadGame, ENTR_HAPPY_MASK_SHOP_0 },
    { "Gerudo Training Ground", MapSelect_LoadGame, ENTR_GERUDO_TRAINING_GROUND_0 },
    { "Inside the Deku Tree", MapSelect_LoadGame, ENTR_DEKU_TREE_0 },
    { "Gohma's Lair", MapSelect_LoadGame, ENTR_DEKU_TREE_BOSS_0 },
    { "Dodongo's Cavern", MapSelect_LoadGame, ENTR_DODONGOS_CAVERN_0 },
    { "King Dodongo's Lair", MapSelect_LoadGame, ENTR_DODONGOS_CAVERN_BOSS_0 },
    { "Inside Jabu-Jabu's Belly", MapSelect_LoadGame, ENTR_JABU_JABU_0 },
    { "Barinade's Lair", MapSelect_LoadGame, ENTR_JABU_JABU_BOSS_0 },
    { "Forest Temple", MapSelect_LoadGame, ENTR_FOREST_TEMPLE_0 },
    { "Phantom Ganon's Lair", MapSelect_LoadGame, ENTR_FOREST_TEMPLE_BOSS_0 },
    { "Bottom of the Well", MapSelect_LoadGame, ENTR_BOTTOM_OF_THE_WELL_0 },
    { "Shadow Temple", MapSelect_LoadGame, ENTR_SHADOW_TEMPLE_0 },
    { "Bongo Bongo's Lair", MapSelect_LoadGame, ENTR_SHADOW_TEMPLE_BOSS_0 },
    { "Fire Temple", MapSelect_LoadGame, ENTR_FIRE_TEMPLE_0 },
    { "Volvagia's Lair", MapSelect_LoadGame, ENTR_FIRE_TEMPLE_BOSS_0 },
    { "Water Temple", MapSelect_LoadGame, ENTR_WATER_TEMPLE_0 },
    { "Morpha's Lair", MapSelect_LoadGame, ENTR_WATER_TEMPLE_BOSS_0 },
    { "Spirit Temple", MapSelect_LoadGame, ENTR_SPIRIT_TEMPLE_0 },
    { "Iron Knuckle's Lair", MapSelect_LoadGame, ENTR_SPIRIT_TEMPLE_BOSS_0 },
    { "Twinrova's Lair", MapSelect_LoadGame, ENTR_SPIRIT_TEMPLE_BOSS_2 },
    { "Ganon's Tower", MapSelect_LoadGame, ENTR_GANONS_TOWER_0 },
    { "Ganondorf's Lair", MapSelect_LoadGame, ENTR_GANONDORF_BOSS_0 },
    { "Ice Cavern", MapSelect_LoadGame, ENTR_ICE_CAVERN_0 },
    { "Dampe's Grave (Windmill)", MapSelect_LoadGame, ENTR_WINDMILL_AND_DAMPES_GRAVE_0 },
    { "Inside Ganon's Castle", MapSelect_LoadGame, ENTR_INSIDE_GANONS_CASTLE_0 },
    { "Ganon's Lair", MapSelect_LoadGame, ENTR_GANON_BOSS_0 },
    { "Escaping Ganon's Castle 1", MapSelect_LoadGame, ENTR_GANONS_TOWER_COLLAPSE_INTERIOR_0 },
    { "Escaping Ganon's Castle 2", MapSelect_LoadGame, ENTR_GANONS_TOWER_COLLAPSE_INTERIOR_2 },
    { "Escaping Ganon's Castle 3", MapSelect_LoadGame, ENTR_GANONS_TOWER_COLLAPSE_INTERIOR_4 },
    { "Escaping Ganon's Castle 4", MapSelect_LoadGame, ENTR_GANONS_TOWER_COLLAPSE_INTERIOR_6 },
    { "Escaping Ganon's Castle 5", MapSelect_LoadGame, ENTR_INSIDE_GANONS_CASTLE_COLLAPSE_0 },
    { "Thieves' Hideout 1-2", MapSelect_LoadGame, ENTR_THIEVES_HIDEOUT_0 },
    { "Thieves' Hideout 3-4 9-10", MapSelect_LoadGame, ENTR_THIEVES_HIDEOUT_2 },
    { "Thieves' Hideout 5-6", MapSelect_LoadGame, ENTR_THIEVES_HIDEOUT_4 },
    { "Thieves' Hideout 7-8", MapSelect_LoadGame, ENTR_THIEVES_HIDEOUT_6 },
    { "Thieves' Hideout 11-12", MapSelect_LoadGame, ENTR_THIEVES_HIDEOUT_10 },
    { "Thieves' Hideout 13", MapSelect_LoadGame, ENTR_THIEVES_HIDEOUT_12 },
    { "Generic Grotto", MapSelect_LoadGame, ENTR_GROTTOS_0 },
    { "Grotto 1", MapSelect_LoadGame, ENTR_GROTTOS_1 },
    { "Heart Piece Scrub Grotto", MapSelect_LoadGame, ENTR_GROTTOS_2 },
    { "Kakariko Redead Grotto", MapSelect_LoadGame, ENTR_GROTTOS_3 },
    { "Grotto 4", MapSelect_LoadGame, ENTR_GROTTOS_4 },
    { "Hyrule Field Cow Grotto", MapSelect_LoadGame, ENTR_GROTTOS_5 },
    { "Octorock Grotto", MapSelect_LoadGame, ENTR_GROTTOS_6 },
    { "Grotto 7", MapSelect_LoadGame, ENTR_GROTTOS_7 },
    { "Wolfos Grotto", MapSelect_LoadGame, ENTR_GROTTOS_8 },
    { "Grotto 9", MapSelect_LoadGame, ENTR_GROTTOS_9 },
    { "Grotto 10", MapSelect_LoadGame, ENTR_GROTTOS_10 },
    { "Tektite Grotto", MapSelect_LoadGame, ENTR_GROTTOS_11 },
    { "Forest Stage", MapSelect_LoadGame, ENTR_GROTTOS_12 },
    { "Death Mountain Trail Cow Grotto", MapSelect_LoadGame, ENTR_GROTTOS_13 },
    { "Cutscene Map", MapSelect_LoadGame, ENTR_CUTSCENE_MAP_0 },
#if CAN_INCLUDE_TEST_SCENES
    { "Test Room", MapSelect_LoadGame, ENTR_BESITU_0 },
    { "SRD Map", MapSelect_LoadGame, ENTR_SASATEST_0 },
    { "Test Map", MapSelect_LoadGame, ENTR_TEST01_0 },
    { "Treasure Chest Warp", MapSelect_LoadGame, ENTR_TESTROOM_0 },
    { "Stalfos Miniboss Room", MapSelect_LoadGame, ENTR_SYOTES_0 },
    { "Stalfos Boss Room", MapSelect_LoadGame, ENTR_SYOTES2_0 },
    { "Dark Link Room", MapSelect_LoadGame, ENTR_SUTARU_0 },
    { "Shooting Gallery Duplicate", MapSelect_LoadGame, ENTR_TEST_SHOOTING_GALLERY_0 },
    { "Depth Test", MapSelect_LoadGame, ENTR_DEPTH_TEST_0 },
    { "Hyrule Garden Game (Broken)", MapSelect_LoadGame, ENTR_HAIRAL_NIWA2_0 },
#endif
#if PLATFORM_N64
    { "64DD TEST  n64dd_SetDiskVersion(1)", (void*)func_80800AD0_unknown, 0 },
    { "64DD TEST2 n64dd_SetDiskVersion(0)", (void*)func_80800B08_unknown, 0 },
#endif
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
