#ifndef MAP_SELECT_STATE_H
#define MAP_SELECT_STATE_H

#include "ultra64.h"
#include "z64game.h"
#include "z64view.h"

struct MapSelectState;

typedef struct MapSelectEntry {
    /* 0x00 */ char* name;
    /* 0x04 */ void (*loadFunc)(struct MapSelectState*, s32);
    /* 0x08 */ s32 entranceIndex;
} MapSelectEntry; // size = 0xC

typedef struct MapSelectState {
    /* 0x0000 */ GameState state;
    /* 0x00A8 */ View view;
    /* 0x01D0 */ s32 sceneTotal;
    /* 0x01D4 */ MapSelectEntry* scenes;
    /* 0x01D8 */ s32 currentScene;
    /* 0x01DC */ s32 pageDownIndex; // Index of pageDownStops
    /* 0x01E0 */ s32 pageDownStops[7];
    /* 0x01FC */ s32 topDisplayedScene; // The scene which is currently at the top of the screen
    /* 0x0200 */ s32 verticalInputAccumulator;
    /* 0x0204 */ s32 verticalInput;
    /* 0x0208 */ s32 timerUp;
    /* 0x020A */ s32 timerDown;
    /* 0x020C */ s32 lockUp;
    /* 0x0210 */ s32 lockDown;
    /* 0x0214 */ u8 showControls;
    /* 0x0218 */ u8 toggleBGM;
    /* 0x021A */ u8 isBGMPlaying;
    /* 0x021C */ u8 sceneLayer;
    /* 0x0220 */ u8 selectedSceneColor;
} MapSelectState; // size = 0x240

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

#endif
