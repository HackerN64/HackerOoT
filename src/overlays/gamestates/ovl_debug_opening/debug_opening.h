#ifndef DEBUG_OPENING_H
#define DEBUG_OPENING_H

#include "global.h"

typedef enum {
    /* 1 */ OPTIONS_PAGE = 1,
    /* 2 */ COMMANDS_PAGE,
    /* 3 */ BUILDINFO_PAGE
} CurrentPage;

typedef enum {
    /* 0 */ OPTION_CHOOSE_SAVE_FILE,
    /* 1 */ OPTION_LOAD_DEFINED_SCENE,
    /* 2 */ OPTION_LOAD_MAP_SELECT,
    /* 3 */ OPTION_LOAD_TITLE_SCREEN,
    /* 4 */ OPTION_LOAD_FILE_SELECT,
} CurrentOption;

typedef void (*OptionFunc)(GameState*);

typedef struct {
    OptionFunc func;
    char* name;
} OptionInfo;

void DebugOpening_LoadDefinedScene(GameState* thisx);
void DebugOpening_LoadTitleScreen(GameState* thisx);
void DebugOpening_LoadFileSelect(GameState* thisx);
void DebugOpening_LoadMapSelect(GameState* thisx);
void DebugOpening_DrawBuildInfo(DebugOpeningState* this, GfxPrint* printer);
void DebugOpening_DrawCommitInfo(DebugOpeningState* this, GfxPrint* printer);
void DebugOpening_Destroy(GameState* thisx);
void DebugOpening_HandleOptions(GameState* thisx, GfxPrint* printer);
void DebugOpening_DrawBase(GameState* thisx);
void DebugOpening_Main(GameState* thisx);
void DebugOpening_Init(GameState* thisx);

#endif