/*
 * File: z_select.c
 * Overlay: ovl_select
 * Description: Debug Scene Select Menu
 */
#include "ultra64.h"
#include "global.h"
#include "terminal.h"
#include "alloca.h"
#include "z_select.h"
#include "n64dd.h"

#if PLATFORM_N64
void func_80800AD0_unknown(MapSelectState* this, s32 arg1) {
    if (D_80121212 != 0) {
        n64dd_SetDiskVersion(1);
    }
}

void func_80800B08_unknown(MapSelectState* this, s32 arg1) {
    if (D_80121212 != 0) {
        n64dd_SetDiskVersion(0);
    }
}
#endif

void MapSelect_Init(GameState* thisx) {
    MapSelectState* this = (MapSelectState*)thisx;
    u8 i;

    gSaveContext.gameMode = GAMEMODE_MAP_SELECT;
    this->state.main = MapSelect_Main;
    this->state.destroy = MapSelect_Destroy;
    this->scenes = sScenes;
    this->topDisplayedScene = SCENE_HYRULE_FIELD;
    this->currentScene = SCENE_HYRULE_FIELD;
    this->pageDownStops[0] = 0;  // Hyrule Field
    this->pageDownStops[1] = 19; // Temple Of Time
    this->pageDownStops[2] = 37; // Treasure Chest Game
    this->pageDownStops[3] = 51; // Gravekeeper's Hut
    this->pageDownStops[4] = 59; // Zora Shop
    this->pageDownStops[5] = 73; // Bottom of the Well
    this->pageDownStops[6] = 91; // Escaping Ganon's Tower 3
    this->pageDownIndex = 0;
    this->sceneTotal = ARRAY_COUNT(sScenes);

#if ENABLE_NEW_LETTERBOX
    ShrinkWindow_Init();
#endif
    View_Init(&this->view, this->state.gfxCtx);
    this->view.flags = (VIEW_PROJECTION_ORTHO | VIEW_VIEWPORT);
    this->verticalInputAccumulator = 0;
    this->verticalInput = 0;
    this->timerUp = 0;
    this->timerDown = 0;
    this->lockUp = false;
    this->lockDown = false;

    this->showControls = false;
    this->toggleBGM = false;
    this->isBGMPlaying = false;
    this->sceneLayer = 0;
    this->selectedSceneColor = 5; // Red by default

    if ((dREG(80) >= 0) && (dREG(80) < this->sceneTotal)) {
        this->currentScene = dREG(80);
        this->topDisplayedScene = dREG(81);
        this->pageDownIndex = dREG(82);
    }
    R_UPDATE_RATE = 1;

    gSaveContext.save.linkAge = BOOT_AGE;
    gSaveContext.save.cutsceneIndex = 0xFFEF;

    // turning the sfx volume back on
    SEQCMD_SET_SEQPLAYER_VOLUME(SEQ_PLAYER_BGM_MAIN, 0, 10);

#if BOOT_TO_MAP_SELECT
    gSaveContext.save.linkAge = BOOT_AGE;
    this->sceneLayer = (BOOT_CUTSCENE > 1) ? (BOOT_CUTSCENE & 0x000F) + 2 : BOOT_CUTSCENE;
    for (i = 1; i < this->sceneTotal; i++) {
        if (this->scenes[i].entranceIndex == BOOT_ENTRANCE) {
            this->currentScene = i;
            this->topDisplayedScene = i - 1;
            break;
        }
    }
#endif

#ifdef MAP_SELECT_BGM
    this->toggleBGM = true;
#else
#define MAP_SELECT_BGM NA_BGM_NO_MUSIC
#endif
}

void MapSelect_Main(GameState* thisx) {
    MapSelectState* this = (MapSelectState*)thisx;

    MapSelect_UpdateMenu(this);
    MapSelect_Draw(this);
}

void MapSelect_Draw(MapSelectState* this) {
    GraphicsContext* gfxCtx = this->state.gfxCtx;

    OPEN_DISPS(gfxCtx, __FILE__, __LINE__);

    gSPSegment(POLY_OPA_DISP++, 0x00, NULL);
    Gfx_SetupFrame(gfxCtx, true, 0, 0, 0);
    SET_FULLSCREEN_VIEWPORT(&this->view);
    View_Apply(&this->view, VIEW_ALL);
    Gfx_SetupDL_28Opa(gfxCtx);

    if (!this->state.running) {
        MapSelect_DrawLoadingScreen(this);
    } else {
        MapSelect_DrawMenu(this);
    }

    CLOSE_DISPS(gfxCtx, __FILE__, __LINE__);
}

void MapSelect_Destroy(GameState* thisx) {
    PRINTF("%c", BEL);
    // "view_cleanup will hang, so it won't be called"
    PRINTF("*** view_cleanupはハングアップするので、呼ばない ***\n");

#if ENABLE_NEW_LETTERBOX
    ShrinkWindow_Destroy();
#endif
}

void MapSelect_UpdateMenu(MapSelectState* this) {
    Input* input = &this->state.input[0];
    s32 pad;
    SceneSelectEntry* selectedScene;
    u16 sfx, sfxIndex;

    if (CHECK_BTN_ALL(input->press.button, BTN_CDOWN)) {
        this->showControls = !this->showControls;
        Audio_PlaySfxGeneral(NA_SE_SY_FSEL_DECIDE_L, &gSfxDefaultPos, 4, &gSfxDefaultFreqAndVolScale,
                             &gSfxDefaultFreqAndVolScale, &gSfxDefaultReverb);
    }

    // change the color of the selected scene, red by default
    if (CHECK_BTN_ALL(input->press.button, BTN_CRIGHT)) {
        if (this->selectedSceneColor == (ARRAY_COUNT(sColors) - 1)) {
            this->selectedSceneColor = 0;
        } else {
            this->selectedSceneColor++;
        }

        if (this->selectedSceneColor == 1) {
            this->selectedSceneColor++;
        }
    }

    if (CHECK_BTN_ALL(input->press.button, BTN_CLEFT)) {
        if (this->selectedSceneColor == 0) {
            this->selectedSceneColor = (ARRAY_COUNT(sColors) - 1);
        } else {
            this->selectedSceneColor--;
        }

        if (this->selectedSceneColor == 1) {
            this->selectedSceneColor--;
        }
    }

    // Play/Stop BGM
    if (this->toggleBGM && !this->isBGMPlaying) {
        this->isBGMPlaying = true;
        SEQCMD_PLAY_SEQUENCE(SEQ_PLAYER_BGM_MAIN, 0, 0, MAP_SELECT_BGM);
    } else if (!this->toggleBGM) {
        this->isBGMPlaying = false;
        SEQCMD_STOP_SEQUENCE(SEQ_PLAYER_BGM_MAIN, 0);
    }

    // when the controls screen is shown
    if (this->showControls) {
        if (CHECK_BTN_ALL(input->press.button, BTN_L)) {
            this->toggleBGM = !this->toggleBGM;
        }

        // prevent changing the value of the main screen
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
            gSaveContext.save.linkAge = !gSaveContext.save.linkAge;
            if (LINK_IS_CHILD) {
                sfxIndex = ((u16)(Rand_ZeroOne() * 100) % ARRAY_COUNT(childLinkSfx));
                sfxIndex = (sfxIndex < ARRAY_COUNT(childLinkSfx)) ? sfxIndex : 0;
                sfx = childLinkSfx[sfxIndex];
            } else {
                sfxIndex = ((u16)(Rand_ZeroOne() * 100) % ARRAY_COUNT(adultLinkSfx));
                sfxIndex = (sfxIndex < ARRAY_COUNT(adultLinkSfx)) ? sfxIndex : 0;
                sfx = adultLinkSfx[sfxIndex];
            }
            Audio_PlaySfxGeneral(sfx, &gSfxDefaultPos, 4, &gSfxDefaultFreqAndVolScale, &gSfxDefaultFreqAndVolScale,
                                 &gSfxDefaultReverb);
        }

        // change scene layer
        if (CHECK_BTN_ALL(input->press.button, BTN_R)) {
            if (this->sceneLayer == 12) {
                this->sceneLayer = 0;
            } else {
                this->sceneLayer++;
            }
        } else if (CHECK_BTN_ALL(input->press.button, BTN_Z)) {
            if (this->sceneLayer == 0) {
                this->sceneLayer = 12;
            } else {
                this->sceneLayer--;
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

void MapSelect_DrawMenu(MapSelectState* this) {
    GraphicsContext* gfxCtx = this->state.gfxCtx;
    GfxPrint* printer;

    OPEN_DISPS(gfxCtx, __FILE__, __LINE__);

    printer = alloca(sizeof(GfxPrint));
    GfxPrint_Init(printer);
    GfxPrint_Open(printer, POLY_OPA_DISP);

    GfxPrint_SetColor(printer, 255, 155, 150, 255);
    GfxPrint_SetPos(printer, 12, 2);
    GfxPrint_Printf(printer, "Zelda Map Select");

    if (!this->showControls) {
        MapSelect_PrintMenu(this, printer);
        MapSelect_PrintAgeSetting(this, printer, ((void)0, gSaveContext.save.linkAge));
        MapSelect_PrintSceneLayerSetting(this, printer);
    }
    MapSelect_PrintControls(this, printer);

    POLY_OPA_DISP = GfxPrint_Close(printer);
    GfxPrint_Destroy(printer);

    CLOSE_DISPS(gfxCtx, __FILE__, __LINE__);
}

void MapSelect_DrawLoadingScreen(MapSelectState* this) {
    GraphicsContext* gfxCtx = this->state.gfxCtx;
    GfxPrint* printer;

    OPEN_DISPS(gfxCtx, __FILE__, __LINE__);

    printer = alloca(sizeof(GfxPrint));
    GfxPrint_Init(printer);
    GfxPrint_Open(printer, POLY_OPA_DISP);
    MapSelect_PrintLoadingMessage(this, printer, 15);
    POLY_OPA_DISP = GfxPrint_Close(printer);
    GfxPrint_Destroy(printer);

    CLOSE_DISPS(gfxCtx, __FILE__, __LINE__);
}

void MapSelect_LoadTitle(MapSelectState* this) {
    this->state.running = false;
    SET_NEXT_GAMESTATE(&this->state, ConsoleLogo_Init, ConsoleLogoState);
}

void MapSelect_LoadDebugOpening(MapSelectState* this) {
#if IS_DEBUG_BOOT_ENABLED
    this->state.running = false;
    SET_NEXT_GAMESTATE(&this->state, DebugOpening_Init, DebugOpeningState);
#endif
}

void MapSelect_LoadGame(MapSelectState* this, s32 entranceIndex) {
    gSaveContext.gameMode = GAMEMODE_NORMAL;
    PRINTF(VT_FGCOL(BLUE));
    PRINTF("\n\n\nＦＩＬＥ＿ＮＯ＝%x\n\n\n", gSaveContext.fileNum);
    PRINTF(VT_RST);
    if (gSaveContext.fileNum == 0xFF) {
        Sram_InitDebugSave();
        // Set the fill target to be the saved magic amount
        gSaveContext.magicFillTarget = gSaveContext.save.info.playerData.magic;
        // Set `magicLevel` and `magic` to 0 so `magicCapacity` then `magic` grows from nothing
        // to respectively the full capacity and `magicFillTarget`
        gSaveContext.magicCapacity = 0;
        gSaveContext.save.info.playerData.magicLevel = gSaveContext.save.info.playerData.magic = 0;
    }
    gSaveContext.buttonStatus[0] = gSaveContext.buttonStatus[1] = gSaveContext.buttonStatus[2] =
        gSaveContext.buttonStatus[3] = gSaveContext.buttonStatus[4] = BTN_ENABLED;
    gSaveContext.forceRisingButtonAlphas = gSaveContext.nextHudVisibilityMode = gSaveContext.hudVisibilityMode =
        gSaveContext.hudVisibilityModeTimer = 0; // false, HUD_VISIBILITY_NO_CHANGE
    SEQCMD_STOP_SEQUENCE(SEQ_PLAYER_BGM_MAIN, 0);
    gSaveContext.respawn[RESPAWN_MODE_DOWN].entranceIndex = gSaveContext.save.entranceIndex = entranceIndex;
    gSaveContext.respawnFlag = 0;
    gSaveContext.seqId = (u8)NA_BGM_DISABLED;
    gSaveContext.natureAmbienceId = 0xFF;
    gSaveContext.showTitleCard = true;
    gWeatherMode = WEATHER_MODE_CLEAR;
    this->state.running = false;
    SET_NEXT_GAMESTATE(&this->state, Play_Init, PlayState);
}

void MapSelect_PrintMenu(MapSelectState* this, GfxPrint* printer) {
    s32 scene;
    s32 i;
    char* name;

    for (i = 0; i < 20; i++) {
        GfxPrint_SetPos(printer, 4, i + 4);

        scene = (this->topDisplayedScene + i + this->sceneTotal) % this->sceneTotal;
        if (scene == this->currentScene) {
            GfxPrint_SetColor(printer, sColors[this->selectedSceneColor].r, sColors[this->selectedSceneColor].g,
                              sColors[this->selectedSceneColor].b, sColors[this->selectedSceneColor].a);
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

void MapSelect_PrintLoadingMessage(MapSelectState* this, GfxPrint* printer, u8 yPos) {
    s32 randomMsg;

    GfxPrint_SetPos(printer, 3, yPos);
    GfxPrint_SetColor(printer, 255, 255, 255, 255);
    randomMsg = Rand_ZeroOne() * ARRAY_COUNT(sLoadingMessages);
    GfxPrint_Printf(printer, "%s", sLoadingMessages[randomMsg]);
}

void MapSelect_PrintAgeSetting(MapSelectState* this, GfxPrint* printer, s32 age) {
    GfxPrint_SetPos(printer, 4, 25);
    GfxPrint_SetColor(printer, 55, 255, 55, 255);
    GfxPrint_Printf(printer, "Link's Age: %s", sAgeLabels[age]);
}

void MapSelect_PrintSceneLayerSetting(MapSelectState* this, GfxPrint* printer) {
    char* label;

    GfxPrint_SetPos(printer, 4, 26);
    GfxPrint_SetColor(printer, 127, 255, 55, 255);

    gSaveContext.save.nightFlag = 0;

    switch (this->sceneLayer) {
        case 0:
            label = "Daytime";
            gSaveContext.save.dayTime = CLOCK_TIME(12, 0);
            gSaveContext.save.cutsceneIndex = 0xFFEF;
            break;
        case 1:
            label = "Nighttime";
            gSaveContext.save.dayTime = CLOCK_TIME(0, 0);
            gSaveContext.save.nightFlag = 1;
            gSaveContext.save.cutsceneIndex = 0xFFEF;
            break;
        case 2:
            label = "Cutscene 0";
            gSaveContext.save.dayTime = CLOCK_TIME(12, 0);
            gSaveContext.save.cutsceneIndex = 0xFFF0;
            break;
        case 3:
            label = "Cutscene 1";
            gSaveContext.save.cutsceneIndex = 0xFFF1;
            break;
        case 4:
            label = "Cutscene 2";
            gSaveContext.save.cutsceneIndex = 0xFFF2;
            break;
        case 5:
            label = "Cutscene 3";
            gSaveContext.save.cutsceneIndex = 0xFFF3;
            break;
        case 6:
            label = "Cutscene 4";
            gSaveContext.save.cutsceneIndex = 0xFFF4;
            break;
        case 7:
            label = "Cutscene 5";
            gSaveContext.save.cutsceneIndex = 0xFFF5;
            break;
        case 8:
            label = "Cutscene 6";
            gSaveContext.save.cutsceneIndex = 0xFFF6;
            break;
        case 9:
            label = "Cutscene 7";
            gSaveContext.save.cutsceneIndex = 0xFFF7;
            break;
        case 10:
            label = "Cutscene 8";
            gSaveContext.save.cutsceneIndex = 0xFFF8;
            break;
        case 11:
            label = "Cutscene 9";
            gSaveContext.save.cutsceneIndex = 0xFFF9;
            break;
        case 12:
            label = "Cutscene 10";
            gSaveContext.save.cutsceneIndex = 0xFFFA;
            break;
        default:
            label = "Unknown Layer";
            gSaveContext.save.cutsceneIndex = 0xFFEF;
            break;
    };

    gSaveContext.skyboxTime = gSaveContext.save.dayTime;
    GfxPrint_SetColor(printer, 155, 55, 150, 255);
    GfxPrint_Printf(printer, "Scene Layer: %s", label);
}

void MapSelect_PrintControls(MapSelectState* this, GfxPrint* printer) {
    u8 i, posY = 2;
    Color_RGBA8 colors;

    for (i = 0; i < ARRAY_COUNT(sControlLabels); i++) {
        // only print "show/hide controls" on the main screen
        if (!this->showControls && (i > 0)) {
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
