/*
 * File: z_opening.c
 * Overlay: ovl_opening
 * Description: Initializes the game into the title screen
 */

#include "global.h"

void TitleSetup_SetupTitleScreen(TitleSetupState* this) {
    gSaveContext.gameMode = GAMEMODE_NORMAL;

    if (BOOT_TO_SCENE || BOOT_TO_SCENE_NEW_GAME_ONLY) {
        u8 i;

        if (BOOT_TO_SCENE_NEW_GAME_ONLY) {
            Sram_InitNewSave();
        } else {
            Sram_InitDebugSave();
        }

        gSaveContext.save.linkAge = BOOT_AGE;
        gSaveContext.save.entranceIndex = BOOT_ENTRANCE;
        gSaveContext.save.cutsceneIndex = BOOT_CUTSCENE;
        gSaveContext.nextDayTime = BOOT_TIME;
        gSaveContext.respawnFlag = 0;
        gSaveContext.respawn[RESPAWN_MODE_DOWN].entranceIndex = ENTR_LOAD_OPENING;
        gWeatherMode = WEATHER_MODE_CLEAR;
        gSaveContext.magicFillTarget = gSaveContext.save.info.playerData.magic;
        gSaveContext.magicCapacity = 0;
        gSaveContext.save.info.playerData.magicLevel = gSaveContext.save.info.playerData.magic = 0;
        gSaveContext.forceRisingButtonAlphas = false;

        gSaveContext.nextHudVisibilityMode = gSaveContext.hudVisibilityMode =
        gSaveContext.hudVisibilityModeTimer = HUD_VISIBILITY_NO_CHANGE;

        for (i = 0; i < ARRAY_COUNT(gSaveContext.buttonStatus); i++) {
            gSaveContext.buttonStatus[i] = BTN_ENABLED;
        }
    } else if (BOOT_TO_FILE_SELECT) {
        gSaveContext.gameMode = GAMEMODE_FILE_SELECT;
        this->state.running = false;
        SET_NEXT_GAMESTATE(&this->state, FileSelect_Init, FileSelectState);
#if ENABLE_MAP_SELECT
    } else if (BOOT_TO_MAP_SELECT) {
        this->state.running = false;
        SET_NEXT_GAMESTATE(&this->state, MapSelect_Init, MapSelectState);
#endif
    } else {
        gSaveContext.gameMode = GAMEMODE_TITLE_SCREEN;
        gSaveContext.save.linkAge = LINK_AGE_ADULT;
        Sram_InitDebugSave();
        gSaveContext.save.cutsceneIndex = 0xFFF3;
        gSaveContext.sceneLayer = 7;
    }

    if (!BOOT_TO_FILE_SELECT || (!ENABLE_MAP_SELECT && !BOOT_TO_MAP_SELECT)) {
        SEQCMD_STOP_SEQUENCE(SEQ_PLAYER_BGM_MAIN, 0);
        this->state.running = false;
        SET_NEXT_GAMESTATE(&this->state, Play_Init, PlayState);
    }
}

void func_80803C5C(TitleSetupState* this) {
}

void TitleSetup_Main(GameState* thisx) {
    TitleSetupState* this = (TitleSetupState*)thisx;

    Gfx_SetupFrame(this->state.gfxCtx, 0, 0, 0);
    TitleSetup_SetupTitleScreen(this);
    func_80803C5C(this);
}

void TitleSetup_Destroy(GameState* thisx) {
}

void TitleSetup_Init(GameState* thisx) {
    TitleSetupState* this = (TitleSetupState*)thisx;

    R_UPDATE_RATE = 1;
    Matrix_Init(&this->state);
    View_Init(&this->view, this->state.gfxCtx);
    this->state.main = TitleSetup_Main;
    this->state.destroy = TitleSetup_Destroy;
}
