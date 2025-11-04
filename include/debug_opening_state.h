#ifndef DEBUG_OPENING_H
#define DEBUG_OPENING_H

#include "config.h"
#include "game.h"
#include "view.h"
#include "skybox.h"
#include "environment.h"
#include "color.h"

#if IS_DEBUG_BOOT_ENABLED

typedef enum CurrentPage {
    /* 1 */ OPTIONS_PAGE = 1,
    /* 2 */ COMMANDS_PAGE,
    /* 3 */ BUILDINFO_PAGE
} CurrentPage;

typedef enum CurrentOption {
    /* 0 */ OPTION_CHOOSE_SAVE_FILE,
    /* 1 */ OPTION_LOAD_DEFINED_SCENE,
    /* 2 */ OPTION_LOAD_MAP_SELECT,
    /* 3 */ OPTION_LOAD_TITLE_SCREEN,
    /* 4 */ OPTION_LOAD_FILE_SELECT,
} CurrentOption;

typedef struct DebugOpeningState {
    GameState state;
    View view;
    s32 currentOption;
    char* controlGuideString;
    u8 page;
    SkyboxContext skyboxCtx;
    EnvironmentContext envCtx;
} DebugOpeningState;

typedef void (*OptionFunc)(DebugOpeningState*);

typedef struct OptionInfo {
    OptionFunc func;
    char* name;
} OptionInfo;

void DebugOpening_DrawRectangle(DebugOpeningState* this, s32 leftX, s32 leftY, s32 rightX, s32 rightY, Color_RGBA8 rgba);
void DebugOpening_ChooseSaveFile(DebugOpeningState* this);
void DebugOpening_LoadDefinedScene(DebugOpeningState* this);
void DebugOpening_LoadTitleScreen(DebugOpeningState* this);
void DebugOpening_LoadFileSelect(DebugOpeningState* this);
void DebugOpening_LoadMapSelect(DebugOpeningState* this);
void DebugOpening_ControlOptions(DebugOpeningState* this);
void DebugOpening_DrawBuildInfo(DebugOpeningState* this);
void DebugOpening_DrawCommands(DebugOpeningState* this);
void DebugOpening_DrawCommitInfo(DebugOpeningState* this);
void DebugOpening_DrawOptions(DebugOpeningState* this);
void DebugOpening_Draw(DebugOpeningState* this);

void DebugOpening_Init(GameState* thisx);
void DebugOpening_Main(GameState* thisx);
void DebugOpening_Destroy(GameState* thisx);

#endif

#endif
