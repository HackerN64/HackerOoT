#ifndef HACKEROOT_MENU_H
#define HACKEROOT_MENU_H

#include "ultra64.h"
#include "config.h"

typedef u8 (*MenuFunc)(void*);

typedef enum MenuSelection {
    MENU_MIN = -1,
    MENU_COLVIEW,
    MENU_HITVIEW,
#if ENABLE_F3DEX3
    MENU_F3DEX3_PROF,
    MENU_F3DEX3_OCC,
#endif
    MENU_MAX
} MenuSelection;

typedef struct MenuElement {
    char* name;
    u8 bToggle;
    void* pStruct;
    MenuFunc updateFunc;
    MenuFunc drawFunc;
} MenuElement;

typedef struct Menu {
    u8 bShow;
    u8 bExecute;
    u8 bBackgroundExecution;
    u8 nTimer;
    u8 bColViewEnabled;
    u8 bHitboxViewEnabled;
    MenuSelection eSelection;
    Input* pInput;
} Menu;

void Menu_Init(Menu* this);
void Menu_Update(Menu* this);
void Menu_Draw(Menu* this);

u8 Menu_DrawCollisionView(Menu* this);

#endif
