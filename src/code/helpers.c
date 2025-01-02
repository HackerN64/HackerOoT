#include "helpers.h"

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

void Helpers_SetView(View* view, f32 eyeX, f32 eyeY, f32 eyeZ) {
    Vec3f eye;
    Vec3f lookAt;
    Vec3f up;

    eye.x = eyeX;
    eye.y = eyeY;
    eye.z = eyeZ;

    lookAt.x = lookAt.y = lookAt.z = 0.0f;

    up.x = up.z = 0.0f;
    up.y = 1.0f;

    View_LookAt(view, &eye, &lookAt, &up);
    View_Apply(view, VIEW_ALL | VIEW_FORCE_VIEWING | VIEW_FORCE_VIEWPORT | VIEW_FORCE_PROJECTION_PERSPECTIVE);
}

void Helpers_InitSkybox(GameState* gameState, EnvironmentContext* envCtx, SkyboxContext* skyboxCtx, s16 skyboxId) {
    Skybox_Init(gameState, skyboxCtx, skyboxId);

    envCtx->changeSkyboxState = CHANGE_SKYBOX_INACTIVE;
    envCtx->changeSkyboxTimer = 0;
    envCtx->changeLightEnabled = false;
    envCtx->changeLightTimer = 0;
    envCtx->skyboxDmaState = SKYBOX_DMA_INACTIVE;
    envCtx->skybox1Index = 99;
    envCtx->skybox2Index = 99;
    envCtx->lightConfig = 0;
    envCtx->changeLightNextConfig = 0;
    envCtx->lightSetting = 0;
    envCtx->skyboxConfig = 2;
    envCtx->skyboxDisabled = 0;
    envCtx->skyboxBlend = 0;
    envCtx->glareAlpha = 0.0f;
    envCtx->lensFlareAlphaScale = 0.0f;

    Environment_UpdateSkybox(skyboxId, envCtx, skyboxCtx);
}

static f32 sSkyboxAngle = 0.0f;

void Helpers_DrawSkybox(GameState* gameState, View* view, EnvironmentContext* envCtx, SkyboxContext* skyboxCtx,
                        s16 skyboxId, f32 eyeY, f32 angleIncrement) {
    f32 eyeX = 1000.0f * Math_CosS(sSkyboxAngle) - 1000.0f * Math_SinS(sSkyboxAngle);
    f32 eyeZ = 1000.0f * Math_SinS(sSkyboxAngle) + 1000.0f * Math_CosS(sSkyboxAngle);

    sSkyboxAngle += angleIncrement;

    Helpers_SetView(view, eyeX, eyeY, eyeZ);
    Skybox_Draw(skyboxCtx, gameState->gfxCtx, NULL, skyboxId, envCtx->skyboxBlend, view->eye.x, view->eye.y,
                view->eye.z);
    Environment_UpdateSkybox(skyboxId, envCtx, skyboxCtx);
}
