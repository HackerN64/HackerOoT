/*
 * File: z_select.c
 * Overlay: ovl_select
 * Description: Debug Scene Select Menu
 */

#include "ultra64.h"
#include "global.h"
#include "vt.h"
#include "alloca.h"

void MapSelect_LoadTitle(MapSelectState* this) {
    this->state.running = false;
    SET_NEXT_GAMESTATE(&this->state, ConsoleLogo_Init, ConsoleLogoState);
}

void MapSelect_LoadGame(MapSelectState* this, s32 entranceIndex) {
    osSyncPrintf(VT_FGCOL(BLUE));
    osSyncPrintf("\n\n\nＦＩＬＥ＿ＮＯ＝%x\n\n\n", gSaveContext.fileNum);
    osSyncPrintf(VT_RST);
    if (gSaveContext.fileNum == 0xFF) {
        Sram_InitDebugSave();
        // Set the fill target to be the saved magic amount
        gSaveContext.magicFillTarget = gSaveContext.magic;
        // Set `magicLevel` and `magic` to 0 so `magicCapacity` then `magic` grows from nothing
        // to respectively the full capacity and `magicFillTarget`
        gSaveContext.magicCapacity = 0;
        gSaveContext.magicLevel = gSaveContext.magic = 0;
    }
    gSaveContext.buttonStatus[0] = gSaveContext.buttonStatus[1] = gSaveContext.buttonStatus[2] =
        gSaveContext.buttonStatus[3] = gSaveContext.buttonStatus[4] = BTN_ENABLED;
    gSaveContext.unk_13E7 = gSaveContext.unk_13E8 = gSaveContext.unk_13EA = gSaveContext.unk_13EC = 0;
    Audio_QueueSeqCmd(SEQ_PLAYER_BGM_MAIN << 24 | NA_BGM_STOP);
    gSaveContext.entranceIndex = entranceIndex;
    gSaveContext.respawnFlag = 0;
    gSaveContext.respawn[RESPAWN_MODE_DOWN].entranceIndex = ENTR_LOAD_OPENING;
    gSaveContext.seqId = (u8)NA_BGM_DISABLED;
    gSaveContext.natureAmbienceId = 0xFF;
    gSaveContext.showTitleCard = true;
    gWeatherMode = WEATHER_MODE_CLEAR;
    this->state.running = false;
    SET_NEXT_GAMESTATE(&this->state, Play_Init, PlayState);
}

// The first element of those 3 arrays needs to stay at the index 0
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
    { "Dampé's Grave (Windmill)", MapSelect_LoadGame, ENTR_HAKASITARELAY_0 },
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

static const char* sAgeLabels[] = {
    "Adult",
    "Child",
};

static const char* sControlLabels[] = {
    "[C-Down]: Show/Hide Controls",
    "[D-Pad]: Select Scene",
    "[B]: Change Link's Age",
    "[Z],[R]: Change the Scene Layer",
    "[A],[Start]: Load the scene",
    "[C-Left/Right]: Selected Scene Color", // only for selected scene color in the list
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

static u8 showControls = false;
static u8 sceneLayer = 0;
static u8 selectedSceneColor = 5; // Red by default

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

void MapSelect_UpdateMenu(MapSelectState* this) {
    Input* input = &this->state.input[0];
    s32 pad;
    SceneSelectEntry* selectedScene;
    u16 sfx, sfxIndex;

    if (CHECK_BTN_ALL(input->press.button, BTN_CDOWN)) {
        showControls = !showControls;
        Audio_PlaySfxGeneral(NA_SE_SY_FSEL_DECIDE_L, &gSfxDefaultPos, 4, &gSfxDefaultFreqAndVolScale,
                                &gSfxDefaultFreqAndVolScale, &gSfxDefaultReverb);
    }

    // change the color of the selected scene, red by default
    if (CHECK_BTN_ALL(input->press.button, BTN_CRIGHT)) {
        if (selectedSceneColor == (ARRAY_COUNT(sColors) - 1)) {
            selectedSceneColor = 0;
        } else {
            selectedSceneColor++;
        }

        if (selectedSceneColor == 1) {
            selectedSceneColor++;
        }
    }

    if (CHECK_BTN_ALL(input->press.button, BTN_CLEFT)) {
        if (selectedSceneColor == 0) {
            selectedSceneColor = (ARRAY_COUNT(sColors) - 1);
        } else {
            selectedSceneColor--;
        }

        if (selectedSceneColor == 1) {
            selectedSceneColor--;
        }
    }

    // prevent changing the value of the main screen
    // when the controls screen is shown
    if (showControls) {
        return;
    }

    if (this->verticalInputAccumulator == 0) {
        // load the scene
        if (CHECK_BTN_ALL(input->press.button, BTN_A) || CHECK_BTN_ALL(input->press.button, BTN_START)) {
            selectedScene = &this->scenes[this->currentScene];
            if (selectedScene->loadFunc != NULL) {
                selectedScene->loadFunc(this, selectedScene->entranceIndex);
            }
        }

        // change age
        if (CHECK_BTN_ALL(input->press.button, BTN_B)) {
            gSaveContext.linkAge = !gSaveContext.linkAge;
            if (LINK_IS_CHILD) {
                sfxIndex = ((u16)(Rand_ZeroOne() * 100) % ARRAY_COUNT(childLinkSfx));
                sfxIndex = (sfxIndex < ARRAY_COUNT(childLinkSfx)) ? sfxIndex : 0;
                sfx = childLinkSfx[sfxIndex];
            } else {
                sfxIndex = ((u16)(Rand_ZeroOne() * 100) % ARRAY_COUNT(adultLinkSfx));
                sfxIndex = (sfxIndex < ARRAY_COUNT(adultLinkSfx)) ? sfxIndex : 0;
                sfx = adultLinkSfx[sfxIndex];
            }
            Audio_PlaySfxGeneral(sfx, &gSfxDefaultPos, 4, &gSfxDefaultFreqAndVolScale,
                                &gSfxDefaultFreqAndVolScale, &gSfxDefaultReverb);
        }

        // change scene layer
        if (CHECK_BTN_ALL(input->press.button, BTN_R)) {
            if (sceneLayer == 12) {
                sceneLayer = 0;
            } else {
                sceneLayer++;
            }
        } else if (CHECK_BTN_ALL(input->press.button, BTN_Z)) {
            if (sceneLayer == 0) {
                sceneLayer = 12;
            } else {
                sceneLayer--;
            }
        }

        if (CHECK_BTN_ALL(input->press.button, BTN_R) || CHECK_BTN_ALL(input->press.button, BTN_Z)) {
            Audio_PlaySfxGeneral(NA_SE_SY_FSEL_CURSOR, &gSfxDefaultPos, 4, &gSfxDefaultFreqAndVolScale,
                                &gSfxDefaultFreqAndVolScale, &gSfxDefaultReverb);
        }

        // scroll up
        if (CHECK_BTN_ALL(input->press.button, BTN_DUP)) {
            if (this->lockUp == true) {
                this->timerUp = 0;
            }
            if (this->timerUp == 0) {
                this->timerUp = 20;
                this->lockUp = true;
                Audio_PlaySfxGeneral(NA_SE_SY_CURSOR, &gSfxDefaultPos, 4, &gSfxDefaultFreqAndVolScale,
                                     &gSfxDefaultFreqAndVolScale, &gSfxDefaultReverb);
                this->verticalInput = R_UPDATE_RATE;
            }
        }

        if (CHECK_BTN_ALL(input->cur.button, BTN_DUP) && this->timerUp == 0) {
            Audio_PlaySfxGeneral(NA_SE_SY_CURSOR, &gSfxDefaultPos, 4, &gSfxDefaultFreqAndVolScale,
                                 &gSfxDefaultFreqAndVolScale, &gSfxDefaultReverb);
            this->verticalInput = R_UPDATE_RATE * 3;
        }

        // scroll down
        if (CHECK_BTN_ALL(input->press.button, BTN_DDOWN)) {
            if (this->lockDown == true) {
                this->timerDown = 0;
            }
            if (this->timerDown == 0) {
                this->timerDown = 20;
                this->lockDown = true;
                Audio_PlaySfxGeneral(NA_SE_SY_CURSOR, &gSfxDefaultPos, 4, &gSfxDefaultFreqAndVolScale,
                                     &gSfxDefaultFreqAndVolScale, &gSfxDefaultReverb);
                this->verticalInput = -R_UPDATE_RATE;
            }
        }

        if (CHECK_BTN_ALL(input->cur.button, BTN_DDOWN) && (this->timerDown == 0)) {
            Audio_PlaySfxGeneral(NA_SE_SY_CURSOR, &gSfxDefaultPos, 4, &gSfxDefaultFreqAndVolScale,
                                 &gSfxDefaultFreqAndVolScale, &gSfxDefaultReverb);
            this->verticalInput = -R_UPDATE_RATE * 3;
        }

        // other scrolling options
        if (CHECK_BTN_ALL(input->press.button, BTN_DLEFT) || CHECK_BTN_ALL(input->cur.button, BTN_DLEFT)) {
            Audio_PlaySfxGeneral(NA_SE_SY_CURSOR, &gSfxDefaultPos, 4, &gSfxDefaultFreqAndVolScale,
                                 &gSfxDefaultFreqAndVolScale, &gSfxDefaultReverb);
            this->verticalInput = R_UPDATE_RATE;
        }

        if (CHECK_BTN_ALL(input->press.button, BTN_DRIGHT) || CHECK_BTN_ALL(input->cur.button, BTN_DRIGHT)) {
            Audio_PlaySfxGeneral(NA_SE_SY_CURSOR, &gSfxDefaultPos, 4, &gSfxDefaultFreqAndVolScale,
                                 &gSfxDefaultFreqAndVolScale, &gSfxDefaultReverb);
            this->verticalInput = -R_UPDATE_RATE;
        }
    }

    if (CHECK_BTN_ALL(input->press.button, BTN_L)) {
        this->pageDownIndex++;
        this->pageDownIndex =
            (this->pageDownIndex + ARRAY_COUNT(this->pageDownStops)) % ARRAY_COUNT(this->pageDownStops);
        this->currentScene = this->topDisplayedScene = this->pageDownStops[this->pageDownIndex];
    }

    this->verticalInputAccumulator += this->verticalInput;

    if (this->verticalInputAccumulator < -7) {
        this->verticalInput = 0;
        this->verticalInputAccumulator = 0;

        this->currentScene++;
        this->currentScene = (this->currentScene + this->sceneTotal) % this->sceneTotal;

        if (this->currentScene == ((this->topDisplayedScene + this->sceneTotal + 19) % this->sceneTotal)) {
            this->topDisplayedScene++;
            this->topDisplayedScene = (this->topDisplayedScene + this->sceneTotal) % this->sceneTotal;
        }
    }

    if (this->verticalInputAccumulator > 7) {
        this->verticalInput = 0;
        this->verticalInputAccumulator = 0;

        if (this->currentScene == this->topDisplayedScene) {
            this->topDisplayedScene -= 2;
            this->topDisplayedScene = (this->topDisplayedScene + this->sceneTotal) % this->sceneTotal;
        }

        this->currentScene--;
        this->currentScene = (this->currentScene + this->sceneTotal) % this->sceneTotal;

        if (this->currentScene == ((this->topDisplayedScene + this->sceneTotal) % this->sceneTotal)) {
            this->topDisplayedScene--;
            this->topDisplayedScene = (this->topDisplayedScene + this->sceneTotal) % this->sceneTotal;
        }
    }

    this->currentScene = (this->currentScene + this->sceneTotal) % this->sceneTotal;
    this->topDisplayedScene = (this->topDisplayedScene + this->sceneTotal) % this->sceneTotal;

    dREG(80) = this->currentScene;
    dREG(81) = this->topDisplayedScene;
    dREG(82) = this->pageDownIndex;

    if (this->timerUp != 0) {
        this->timerUp--;
    }

    if (this->timerUp == 0) {
        this->lockUp = false;
    }

    if (this->timerDown != 0) {
        this->timerDown--;
    }

    if (this->timerDown == 0) {
        this->lockDown = false;
    }
}

void MapSelect_PrintMenu(MapSelectState* this, GfxPrint* printer) {
    s32 scene;
    s32 i;
    char* name;

    for (i = 0; i < 20; i++) {
        GfxPrint_SetPos(printer, 4, i + 4);

        scene = (this->topDisplayedScene + i + this->sceneTotal) % this->sceneTotal;
        if (scene == this->currentScene) {
            GfxPrint_SetColor(printer,
                sColors[selectedSceneColor].r, sColors[selectedSceneColor].g, sColors[selectedSceneColor].b,
                sColors[selectedSceneColor].a);
        } else {
            GfxPrint_SetColor(printer, 200, 200, 55, 255);
        }

        name = this->scenes[scene].name;
        if (name == NULL) {
            name = "Unknown Scene";
        }

        if (!scene) {
            // Title Screen
            GfxPrint_Printf(printer, "%s", name);
        } else {
            GfxPrint_Printf(printer, "%03d: %s", scene, name);
        }

        if (scene == this->currentScene) {
            GfxPrint_SetPos(printer, 3, i + 4);
            GfxPrint_Printf(printer, ">");
        }
    };
}

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

void MapSelect_PrintLoadingMessage(MapSelectState* this, GfxPrint* printer) {
    s32 randomMsg;

    GfxPrint_SetPos(printer, 10, 15);
    GfxPrint_SetColor(printer, 255, 255, 255, 255);
    randomMsg = Rand_ZeroOne() * ARRAY_COUNT(sLoadingMessages);
    GfxPrint_Printf(printer, "%s", sLoadingMessages[randomMsg]);
}

void MapSelect_PrintAgeSetting(MapSelectState* this, GfxPrint* printer, s32 age) {
    GfxPrint_SetPos(printer, 4, 25);
    GfxPrint_SetColor(printer, 55, 255, 55, 255);
    GfxPrint_Printf(printer, "Link Age: %s", sAgeLabels[age]);
}

void MapSelect_PrintSceneLayerSetting(MapSelectState* this, GfxPrint* printer) {
    char* label;

    GfxPrint_SetPos(printer, 4, 26);
    GfxPrint_SetColor(printer, 127, 255, 55, 255);

    gSaveContext.nightFlag = 0;

    switch (sceneLayer) {
        case 0:
            label = "Daytime";
            gSaveContext.dayTime = CLOCK_TIME(12, 0);
            gSaveContext.cutsceneIndex = 0x8000;
            break;
        case 1:
            label = "Nighttime";
            gSaveContext.dayTime = CLOCK_TIME(0, 0);
            gSaveContext.cutsceneIndex = 0;
            gSaveContext.nightFlag = 1;
            break;
        case 2:
            label = "Cutscene 0";
            gSaveContext.dayTime = CLOCK_TIME(12, 0);
            gSaveContext.cutsceneIndex = 0xFFF0;
            break;
        case 3:
            label = "Cutscene 1";
            gSaveContext.cutsceneIndex = 0xFFF1;
            break;
        case 4:
            label = "Cutscene 2";
            gSaveContext.cutsceneIndex = 0xFFF2;
            break;
        case 5:
            label = "Cutscene 3";
            gSaveContext.cutsceneIndex = 0xFFF3;
            break;
        case 6:
            label = "Cutscene 4";
            gSaveContext.cutsceneIndex = 0xFFF4;
            break;
        case 7:
            label = "Cutscene 5";
            gSaveContext.cutsceneIndex = 0xFFF5;
            break;
        case 8:
            label = "Cutscene 6";
            gSaveContext.cutsceneIndex = 0xFFF6;
            break;
        case 9:
            label = "Cutscene 7";
            gSaveContext.cutsceneIndex = 0xFFF7;
            break;
        case 10:
            label = "Cutscene 8";
            gSaveContext.cutsceneIndex = 0xFFF8;
            break;
        case 11:
            label = "Cutscene 9";
            gSaveContext.cutsceneIndex = 0xFFF9;
            break;
        case 12:
            label = "Cutscene 10";
            gSaveContext.cutsceneIndex = 0xFFFA;
            break;
        default:
            label = "Unknown Layer";
            gSaveContext.cutsceneIndex = 0;
            break;
    };

    gSaveContext.skyboxTime = gSaveContext.dayTime;
    GfxPrint_SetColor(printer, 155, 55, 150, 255);
    GfxPrint_Printf(printer, "Scene Layer: %s", label);
}

void MapSelect_PrintControls(MapSelectState* this, GfxPrint* printer) {
    u8 i, posY = 2;
    Color_RGBA8 colors;

    for (i = 0; i < ARRAY_COUNT(sControlLabels); i++) {
        // only print "show/hide controls" on the main screen
        if (!showControls && (i > 0)) {
            return;
        }

        // for anything but "Show/Hide Controls",
        // increment Y-Pos by 2, else set it to 27
        // to move it at the bottom of the screen
        if (i > 0) {
            posY += 2;
        } else {
            posY = 27;
        }

        colors = sColors[i];

        GfxPrint_SetPos(printer, 4, posY);
        GfxPrint_SetColor(printer, colors.r, colors.g, colors.b, colors.a);
        GfxPrint_Printf(printer, sControlLabels[i]);

        // reset the position after the "show/hide" print
        if (i == 0) {
            posY = 2;
        }
    }
}

void MapSelect_DrawMenu(MapSelectState* this) {
    GraphicsContext* gfxCtx = this->state.gfxCtx;
    GfxPrint* printer;

    OPEN_DISPS(gfxCtx, "../z_select.c", 930);

    gSPSegment(POLY_OPA_DISP++, 0x00, NULL);
    Gfx_SetupFrame(gfxCtx, 0, 0, 0);
    SET_FULLSCREEN_VIEWPORT(&this->view);
    View_Apply(&this->view, VIEW_ALL);
    Gfx_SetupDL_28Opa(gfxCtx);

    printer = alloca(sizeof(GfxPrint));
    GfxPrint_Init(printer);
    GfxPrint_Open(printer, POLY_OPA_DISP);

    GfxPrint_SetColor(printer, 255, 155, 150, 255);
    GfxPrint_SetPos(printer, 12, 2);
    GfxPrint_Printf(printer, "Zelda Map Select");

    if (!showControls) {
        MapSelect_PrintMenu(this, printer);
        MapSelect_PrintAgeSetting(this, printer, ((void)0, gSaveContext.linkAge));
        MapSelect_PrintSceneLayerSetting(this, printer);
    }
    MapSelect_PrintControls(this, printer);

    POLY_OPA_DISP = GfxPrint_Close(printer);
    GfxPrint_Destroy(printer);

    CLOSE_DISPS(gfxCtx, "../z_select.c", 966);
}

void MapSelect_DrawLoadingScreen(MapSelectState* this) {
    GraphicsContext* gfxCtx = this->state.gfxCtx;
    GfxPrint* printer;

    OPEN_DISPS(gfxCtx, "../z_select.c", 977);

    gSPSegment(POLY_OPA_DISP++, 0x00, NULL);
    Gfx_SetupFrame(gfxCtx, 0, 0, 0);
    SET_FULLSCREEN_VIEWPORT(&this->view);
    View_Apply(&this->view, VIEW_ALL);
    Gfx_SetupDL_28Opa(gfxCtx);

    printer = alloca(sizeof(GfxPrint));
    GfxPrint_Init(printer);
    GfxPrint_Open(printer, POLY_OPA_DISP);
    MapSelect_PrintLoadingMessage(this, printer);
    POLY_OPA_DISP = GfxPrint_Close(printer);
    GfxPrint_Destroy(printer);

    CLOSE_DISPS(gfxCtx, "../z_select.c", 1006);
}

void MapSelect_Draw(MapSelectState* this) {
    GraphicsContext* gfxCtx = this->state.gfxCtx;

    OPEN_DISPS(gfxCtx, "../z_select.c", 1013);

    gSPSegment(POLY_OPA_DISP++, 0x00, NULL);
    Gfx_SetupFrame(gfxCtx, 0, 0, 0);
    SET_FULLSCREEN_VIEWPORT(&this->view);
    View_Apply(&this->view, VIEW_ALL);

    if (!this->state.running) {
        MapSelect_DrawLoadingScreen(this);
    } else {
        MapSelect_DrawMenu(this);
    }

    CLOSE_DISPS(gfxCtx, "../z_select.c", 1037);
}

void MapSelect_Main(GameState* thisx) {
    MapSelectState* this = (MapSelectState*)thisx;

    MapSelect_UpdateMenu(this);
    MapSelect_Draw(this);
}

void MapSelect_Destroy(GameState* thisx) {
    osSyncPrintf("%c", BEL);
    // "view_cleanup will hang, so it won't be called"
    osSyncPrintf("*** view_cleanupはハングアップするので、呼ばない ***\n");
}

void MapSelect_Init(GameState* thisx) {
    MapSelectState* this = (MapSelectState*)thisx;
    u32 size;
    s32 pad;
    u8 channelIndex;

    this->state.main = MapSelect_Main;
    this->state.destroy = MapSelect_Destroy;
    this->scenes = sScenes;
    this->topDisplayedScene = 0;
    this->currentScene = 0;
    this->pageDownStops[0] = 0;  // Hyrule Field
    this->pageDownStops[1] = 19; // Temple Of Time
    this->pageDownStops[2] = 37; // Treasure Chest Game
    this->pageDownStops[3] = 51; // Gravekeeper's Hut
    this->pageDownStops[4] = 59; // Zora Shop
    this->pageDownStops[5] = 73; // Bottom of the Well
    this->pageDownStops[6] = 91; // Escaping Ganon's Tower 3
    this->pageDownIndex = 0;
    this->sceneTotal = ARRAY_COUNT(sScenes);
    View_Init(&this->view, this->state.gfxCtx);
    this->view.flags = (VIEW_PROJECTION_ORTHO | VIEW_VIEWPORT);
    this->verticalInputAccumulator = 0;
    this->verticalInput = 0;
    this->timerUp = 0;
    this->timerDown = 0;
    this->lockUp = false;
    this->lockDown = false;
    this->unk_234 = 0;

    size = (uintptr_t)_z_select_staticSegmentRomEnd - (uintptr_t)_z_select_staticSegmentRomStart;

    if ((dREG(80) >= 0) && (dREG(80) < this->sceneTotal)) {
        this->currentScene = dREG(80);
        this->topDisplayedScene = dREG(81);
        this->pageDownIndex = dREG(82);
    }
    R_UPDATE_RATE = 1;

    this->staticSegment = GameState_Alloc(&this->state, size, "../z_select.c", 1114);
    DmaMgr_SendRequest1(this->staticSegment, (uintptr_t)_z_select_staticSegmentRomStart, size, "../z_select.c", 1115);
    gSaveContext.cutsceneIndex = 0x8000;
    gSaveContext.linkAge = LINK_AGE_CHILD;

    // turning the sfx volume back on
    Audio_QueueSeqCmd((0xF << 0x1C) | 0xA);

    Audio_PlayFanfare(NA_BGM_KAKARIKO_ADULT);
}
