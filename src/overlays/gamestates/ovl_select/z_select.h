#ifndef Z_SELECT_H
#define Z_SELECT_H

#include "global.h"
#include "vt.h"
#include "alloca.h"
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

static SceneSelectEntry sScenes[] = {
    { "Title Screen", (void*)MapSelect_LoadTitle, 0 },
    { "Hyrule Field", MapSelect_LoadGame, ENTR_SPOT00_0 },
    { "Kakariko Village", MapSelect_LoadGame, ENTR_SPOT01_0 },
    { "Graveyard", MapSelect_LoadGame, ENTR_SPOT02_0 },
    { "Zora's River", MapSelect_LoadGame, ENTR_SPOT03_0 },
    { "Kokiri Forest", MapSelect_LoadGame, ENTR_SPOT04_0 },
    { "Sacred Forest Meadow", MapSelect_LoadGame, ENTR_SPOT05_0 },
    { "Lake Hylia", MapSelect_LoadGame, ENTR_SPOT06_0 },
    { "Zora's Domain", MapSelect_LoadGame, ENTR_SPOT07_0 },
    { "Zora's Fountain", MapSelect_LoadGame, ENTR_SPOT08_0 },
    { "Gerudo Valley", MapSelect_LoadGame, ENTR_SPOT09_0 },
    { "Lost Woods", MapSelect_LoadGame, ENTR_SPOT10_0 },
    { "Desert Colossus", MapSelect_LoadGame, ENTR_SPOT11_0 },
    { "Gerudo's Fortress", MapSelect_LoadGame, ENTR_SPOT12_0 },
    { "Haunted Wasteland", MapSelect_LoadGame, ENTR_SPOT13_0 },
    { "Hyrule Castle", MapSelect_LoadGame, ENTR_SPOT15_0 },
    { "Death Mountain Trail", MapSelect_LoadGame, ENTR_SPOT16_0 },
    { "Death Mountain Crater", MapSelect_LoadGame, ENTR_SPOT17_0 },
    { "Goron City", MapSelect_LoadGame, ENTR_SPOT18_0 },
    { "Lon Lon Ranch", MapSelect_LoadGame, ENTR_SPOT20_0 },
    { "Temple Of Time", MapSelect_LoadGame, ENTR_TOKINOMA_0 },
    { "Chamber of Sages", MapSelect_LoadGame, ENTR_KENJYANOMA_0 },
    { "Shooting Gallery", MapSelect_LoadGame, ENTR_SYATEKIJYOU_0 },
    { "Castle Courtyard Game", MapSelect_LoadGame, ENTR_HAIRAL_NIWA_0 },
    { "Heart Piece Grave", MapSelect_LoadGame, ENTR_HAKAANA_0 },
    { "Hylian Shield Grave", MapSelect_LoadGame, ENTR_HAKAANA2_0 },
    { "Royal Family's Tomb", MapSelect_LoadGame, ENTR_HAKAANA_OUKE_0 },
    { "Great Fairy's Fountain (Din)", MapSelect_LoadGame, ENTR_DAIYOUSEI_IZUMI_0 },
    { "Great Fairy's Fountain (Farore)", MapSelect_LoadGame, ENTR_YOUSEI_IZUMI_TATE_0 },
    { "Great Fairy's Fountain (Nayru)", MapSelect_LoadGame, ENTR_YOUSEI_IZUMI_YOKO_0 },
    { "Ganon's Tower - Collapsing", MapSelect_LoadGame, ENTR_GANON_FINAL_0 },
    { "Castle Courtyard", MapSelect_LoadGame, ENTR_NAKANIWA_0 },
    { "Fishing Pond", MapSelect_LoadGame, ENTR_TURIBORI_0 },
    { "Bombchu Bowling Alley", MapSelect_LoadGame, ENTR_BOWLING_0 },
    { "Lon Lon Ranch House", MapSelect_LoadGame, ENTR_SOUKO_0 },
    { "Lon Lon Ranch Silo", MapSelect_LoadGame, ENTR_SOUKO_1 },
    { "Lots O' Pots", MapSelect_LoadGame, ENTR_MIHARIGOYA_0 },
    { "Potion Shop", MapSelect_LoadGame, ENTR_MAHOUYA_0 },
    { "Treasure Chest Game", MapSelect_LoadGame, ENTR_TAKARAYA_0 },
    { "House Of Skulltula", MapSelect_LoadGame, ENTR_KINSUTA_0 },
    { "Market Entrance", MapSelect_LoadGame, ENTR_ENTRA_0 },
    { "Market", MapSelect_LoadGame, ENTR_MARKET_DAY_0 },
    { "Back Alley", MapSelect_LoadGame, ENTR_MARKET_ALLEY_0 },
    { "Temple of Time Exterior", MapSelect_LoadGame, ENTR_SHRINE_0 },
    { "Link's House", MapSelect_LoadGame, ENTR_LINK_HOME_0 },
    { "Kakariko House 1", MapSelect_LoadGame, ENTR_KAKARIKO_0 },
    { "Back Alley House 1", MapSelect_LoadGame, ENTR_KAKARIKO3_0 },
    { "House of Know-it-All Brothers", MapSelect_LoadGame, ENTR_KOKIRI_HOME_0 },
    { "House of Twins", MapSelect_LoadGame, ENTR_KOKIRI_HOME3_0 },
    { "Mido's House", MapSelect_LoadGame, ENTR_KOKIRI_HOME4_0 },
    { "Saria's House", MapSelect_LoadGame, ENTR_KOKIRI_HOME5_0 },
    { "Stable", MapSelect_LoadGame, ENTR_MALON_STABLE_0 },
    { "Grave Keeper's Hut", MapSelect_LoadGame, ENTR_HUT_0 },
    { "Dog Lady's House", MapSelect_LoadGame, ENTR_IMPA_0 },
    { "Impa's House", MapSelect_LoadGame, ENTR_LABO_0 },
    { "Lakeside Laboratory", MapSelect_LoadGame, ENTR_HYLIA_LABO_0 },
    { "Running Man's Tent", MapSelect_LoadGame, ENTR_TENT_0 },
    { "Bazaar", MapSelect_LoadGame, ENTR_SHOP1_0 },
    { "Kokiri Shop", MapSelect_LoadGame, ENTR_KOKIRI_SHOP_0 },
    { "Goron Shop", MapSelect_LoadGame, ENTR_GOLON_0 },
    { "Zora Shop", MapSelect_LoadGame, ENTR_ZOORA_0 },
    { "Kakariko Potion Shop", MapSelect_LoadGame, ENTR_DRAG_0 },
    { "Potion Shop", MapSelect_LoadGame, ENTR_ALLEY_SHOP_0 },
    { "Bombchu Shop ", MapSelect_LoadGame, ENTR_NIGHT_SHOP_0 },
    { "Happy Mask Shop", MapSelect_LoadGame, ENTR_FACE_SHOP_0 },
    { "Gerudo Training Ground", MapSelect_LoadGame, ENTR_MEN_0 },
    { "Inside the Deku Tree", MapSelect_LoadGame, ENTR_YDAN_0 },
    { "Gohma's Lair", MapSelect_LoadGame, ENTR_YDAN_BOSS_0 },
    { "Dodongo's Cavern", MapSelect_LoadGame, ENTR_DDAN_0 },
    { "King Dodongo's Lair", MapSelect_LoadGame, ENTR_DDAN_BOSS_0 },
    { "Inside Jabu-Jabu's Belly", MapSelect_LoadGame, ENTR_BDAN_0 },
    { "Barinade's Lair", MapSelect_LoadGame, ENTR_BDAN_BOSS_0 },
    { "Forest Temple", MapSelect_LoadGame, ENTR_BMORI1_0 },
    { "Phantom Ganon's Lair", MapSelect_LoadGame, ENTR_MORIBOSSROOM_0 },
    { "Bottom of the Well", MapSelect_LoadGame, ENTR_HAKADANCH_0 },
    { "Shadow Temple", MapSelect_LoadGame, ENTR_HAKADAN_0 },
    { "Bongo Bongo's Lair", MapSelect_LoadGame, ENTR_HAKADAN_BS_0 },
    { "Fire Temple", MapSelect_LoadGame, ENTR_HIDAN_0 },
    { "Volvagia's Lair", MapSelect_LoadGame, ENTR_FIRE_BS_0 },
    { "Water Temple", MapSelect_LoadGame, ENTR_MIZUSIN_0 },
    { "Morpha's Lair", MapSelect_LoadGame, ENTR_MIZUSIN_BS_0 },
    { "Spirit Temple", MapSelect_LoadGame, ENTR_JYASINZOU_0 },
    { "Iron Knuckle's Lair", MapSelect_LoadGame, ENTR_JYASINBOSS_0 },
    { "Twinrova's Lair", MapSelect_LoadGame, ENTR_JYASINBOSS_2 },
    { "Ganon's Tower", MapSelect_LoadGame, ENTR_GANON_0 },
    { "Ganondorf's Lair", MapSelect_LoadGame, ENTR_GANON_BOSS_0 },
    { "Ice Cavern", MapSelect_LoadGame, ENTR_ICE_DOUKUTO_0 },
    { "Dampe's Grave (Windmill)", MapSelect_LoadGame, ENTR_HAKASITARELAY_0 },
    { "Inside Ganon's Castle", MapSelect_LoadGame, ENTR_GANONTIKA_0 },
    { "Ganon's Lair", MapSelect_LoadGame, ENTR_GANON_DEMO_0 },
    { "Escaping Ganon's Castle 1", MapSelect_LoadGame, ENTR_GANON_SONOGO_0 },
    { "Escaping Ganon's Castle 2", MapSelect_LoadGame, ENTR_GANON_SONOGO_2 },
    { "Escaping Ganon's Castle 3", MapSelect_LoadGame, ENTR_GANON_SONOGO_4 },
    { "Escaping Ganon's Castle 4", MapSelect_LoadGame, ENTR_GANON_SONOGO_6 },
    { "Escaping Ganon's Castle 5", MapSelect_LoadGame, ENTR_GANONTIKA_SONOGO_0 },
    { "Thieves' Hideout 1-2", MapSelect_LoadGame, ENTR_GERUDOWAY_0 },
    { "Thieves' Hideout 3-4 9-10", MapSelect_LoadGame, ENTR_GERUDOWAY_2 },
    { "Thieves' Hideout 5-6", MapSelect_LoadGame, ENTR_GERUDOWAY_4 },
    { "Thieves' Hideout 7-8", MapSelect_LoadGame, ENTR_GERUDOWAY_6 },
    { "Thieves' Hideout 11-12", MapSelect_LoadGame, ENTR_GERUDOWAY_10 },
    { "Thieves' Hideout 13", MapSelect_LoadGame, ENTR_GERUDOWAY_12 },
    { "Generic Grotto", MapSelect_LoadGame, ENTR_KAKUSIANA_0 },
    { "Grotto 1", MapSelect_LoadGame, ENTR_KAKUSIANA_1 },
    { "Heart Piece Scrub Grotto", MapSelect_LoadGame, ENTR_KAKUSIANA_2 },
    { "Kakariko Redead Grotto", MapSelect_LoadGame, ENTR_KAKUSIANA_3 },
    { "Grotto 4", MapSelect_LoadGame, ENTR_KAKUSIANA_4 },
    { "Hyrule Field Cow Grotto", MapSelect_LoadGame, ENTR_KAKUSIANA_5 },
    { "Octorock Grotto", MapSelect_LoadGame, ENTR_KAKUSIANA_6 },
    { "Grotto 7", MapSelect_LoadGame, ENTR_KAKUSIANA_7 },
    { "Wolfos Grotto", MapSelect_LoadGame, ENTR_KAKUSIANA_8 },
    { "Grotto 9", MapSelect_LoadGame, ENTR_KAKUSIANA_9 },
    { "Grotto 10", MapSelect_LoadGame, ENTR_KAKUSIANA_10 },
    { "Tektite Grotto", MapSelect_LoadGame, ENTR_KAKUSIANA_11 },
    { "Deku Theater Grotto", MapSelect_LoadGame, ENTR_KAKUSIANA_12 },
    { "Death Mountain Trail Cow Grotto", MapSelect_LoadGame, ENTR_KAKUSIANA_13 },
    { "Cutscene Map", MapSelect_LoadGame, ENTR_HIRAL_DEMO_0 },
    { "Test Room", MapSelect_LoadGame, ENTR_BESITU_0 },
    { "SRD Map", MapSelect_LoadGame, ENTR_SASATEST_0 },
    { "Test Map", MapSelect_LoadGame, ENTR_TEST01_0 },
    { "Treasure Chest Warp", MapSelect_LoadGame, ENTR_TESTROOM_0 },
    { "Stalfos Miniboss Room", MapSelect_LoadGame, ENTR_SYOTES_0 },
    { "Stalfos Boss Room", MapSelect_LoadGame, ENTR_SYOTES2_0 },
    { "Dark Link Room", MapSelect_LoadGame, ENTR_SUTARU_0 },
    { "Shooting Gallery Duplicate", MapSelect_LoadGame, ENTR_TEST_SYATEKIJYOU_0 },
    { "Depth Test", MapSelect_LoadGame, ENTR_DEPTH_TEST_0 },
    { "Hyrule Garden Game (Broken)", MapSelect_LoadGame, ENTR_HAIRAL_NIWA2_0 },
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