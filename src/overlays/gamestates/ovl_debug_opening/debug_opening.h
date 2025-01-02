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

struct DebugOpeningState;

typedef void (*OptionFunc)(DebugOpeningState*);

typedef struct {
    OptionFunc func;
    char* name;
} OptionInfo;

void DebugOpening_Init(GameState* thisx);
void DebugOpening_Main(GameState* thisx);
void DebugOpening_Destroy(GameState* thisx);

void DebugOpening_SetView(DebugOpeningState* this, f32 eyeX, f32 eyeY, f32 eyeZ);
void DebugOpening_InitSkybox(DebugOpeningState* this);
void DebugOpening_DrawSkybox(DebugOpeningState* this);
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
void DebugOpening_DrawBase(DebugOpeningState* this);

#endif
