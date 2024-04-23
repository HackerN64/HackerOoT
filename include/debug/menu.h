#ifndef HACKEROOT_MENU_H
#define HACKEROOT_MENU_H

typedef u8 (*MenuFunc)(void*);

typedef enum MenuSelection {
    MENU_MIN = -1,
    MENU_PROFILER,
    MENU_DUMMY1,
    MENU_DUMMY2,
    MENU_DUMMY3,
    MENU_DUMMY4,
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
    u8 bReturn;
    u8 nTimer;
    MenuSelection eSelection;
    struct PlayState* pPlay;
    Input* pInput;
} Menu;

void Menu_Init(Menu* this);
void Menu_Update(Menu* this);
void Menu_Draw(Menu* this);

#endif
