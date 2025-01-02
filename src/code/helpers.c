#include "helpers.h"
#include "z64.h"
#include "functions.h"
#include "config.h"

void Helpers_LoadDefinedScene(GameState* gameState) {
    if (gSaveContext.fileNum == 0xff) {
        Sram_InitDebugSave();
    } else {
        Sram_InitNewSave();
    }
    // Set age, time and entrance
    gSaveContext.save.linkAge = BOOT_AGE;
    gSaveContext.save.dayTime = BOOT_TIME;
    gSaveContext.save.entranceIndex = BOOT_ENTRANCE;

    gSaveContext.respawnFlag = 0;
    gSaveContext.respawn[RESPAWN_MODE_DOWN].entranceIndex = ENTR_LOAD_OPENING;

    // Have the magic meter load correctly
    gSaveContext.magicFillTarget = gSaveContext.save.info.playerData.magic;
    gSaveContext.magicCapacity = 0;
    gSaveContext.save.info.playerData.magic = 0;
    gSaveContext.save.info.playerData.magicLevel = 0;

    gSaveContext.seqId = (u8)NA_BGM_DISABLED;

    // Load Play state
    gSaveContext.gameMode = GAMEMODE_NORMAL;
    gameState->running = false;
    SET_NEXT_GAMESTATE(gameState, Play_Init, PlayState);
}

void Helpers_LoadTitleScreen(GameState* gameState) {
    gSaveContext.seqId = (u8)NA_BGM_DISABLED;
    gSaveContext.natureAmbienceId = 0xFF;
    gSaveContext.gameMode = GAMEMODE_TITLE_SCREEN;
    gameState->running = false;
    SET_NEXT_GAMESTATE(gameState, TitleSetup_Init, TitleSetupState);
}

void Helpers_LoadFileSelect(GameState* gameState) {
    gSaveContext.gameMode = GAMEMODE_FILE_SELECT;
    gameState->running = false;
    SET_NEXT_GAMESTATE(gameState, FileSelect_Init, FileSelectState);
}

void Helpers_LoadMapSelect(GameState* gameState) {
#if IS_MAP_SELECT_ENABLED
    gSaveContext.gameMode = GAMEMODE_MAP_SELECT;
    gameState->running = false;
    SET_NEXT_GAMESTATE(gameState, MapSelect_Init, MapSelectState);
#endif
}
