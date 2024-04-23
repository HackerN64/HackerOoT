#include "global.h"
#include "debug.h"


u8 test(Menu* this) {
    CollisionCheck_DrawCollision(this->pPlay, &this->pPlay->colChkCtx);
    return true;
}

static MenuElement sMenuElements[] = {
#if ENABLE_F3DEX3
    { "Profiler", false, (void*)&gProfiler, (MenuFunc)Profiler_Update, (MenuFunc)Profiler_Draw },
#endif
    { "Collision View", true, (void*)&gDebug.menu, NULL, (MenuFunc)test },
    { "Dummy 2", false, NULL, NULL, NULL },
    { "Dummy 3", false, NULL, NULL, NULL },
    { "Dummy 4", false, NULL, NULL, NULL },
};

void Menu_Init(Menu* this) {
    this->bShow = false;
    this->bExecute = false;
    this->bReturn = false;
    this->nTimer = 0;
    this->eSelection = MENU_MIN + 1;
    this->pPlay = gDebug.play;
    this->pInput = gDebug.input;
}

void Menu_Update(Menu* this) {
    if (this->pInput != NULL) {
        u16 curBtn = this->pInput->cur.button;
        u16 pressBtn = this->pInput->press.button;
        u8 isHoldingR = CHECK_BTN_ALL(curBtn, BTN_R);
        u8 i;

        test(this);
        // if (gSaveContext.gameMode != GAMEMODE_NORMAL || IS_PAUSED(&this->pPlay->pauseCtx)) {
        //     return;
        // }

        if (isHoldingR && CHECK_BTN_ALL(pressBtn, BTN_L)) {
            this->bShow ^= 1;
        }

        if (this->bShow && isHoldingR && CHECK_BTN_ALL(pressBtn, BTN_DLEFT)) {
            // this->bReturn ^= 1;
            this->bExecute = 0;
        }

        if ((this->bShow && !isHoldingR) || this->bReturn) {
            if (!this->bExecute) {
                if (CHECK_BTN_ALL(pressBtn, BTN_DUP)) {
                    this->eSelection--;
                    if (this->eSelection == MENU_MIN) {
                        this->eSelection = MENU_MAX - 1;
                    }
                }

                if (CHECK_BTN_ALL(pressBtn, BTN_DDOWN)) {
                    this->eSelection++;
                    if (this->eSelection == MENU_MAX) {
                        this->eSelection = MENU_MIN + 1;
                    }
                }

                if (CHECK_BTN_ALL(curBtn, BTN_L)) {
                    this->bExecute = 1;
                    this->nTimer = 1;
                }

                if (this->nTimer > 0) {
                    this->nTimer--;
                }
            } else {
                for (i = 0; i < ARRAY_COUNT(sMenuElements); i++) {
                    MenuElement elem = sMenuElements[this->eSelection];

                    this->bReturn = elem.bToggle;
                    if ((elem.updateFunc != NULL) && (elem.pStruct != NULL) && !elem.updateFunc(elem.pStruct)) {
                        PRINTF("[HackerOoT:Menu]: an error occurred while trying to run the update function\n");
                    }
                }
            }
        }
    } else {
        PRINTF("INPUT IS NULL!!!!!\n");
    }
}

void Menu_Draw(Menu* this) {
    Color_RGBA8 bg = { 0, 0, 0, 128 };
    Vec2s left = { 20, 20 };
    Vec2s right = { 300, 220 };
    PrintUtils* print = &gDebug.printer;
    u8 i;

    Debug_DrawColorRectangle(left, right, bg);

    Print_Screen(print, 11, 3, COLOR_WHITE, "--- Debug Menu ---");
    Print_Screen(print, 5, 26, COLOR_WHITE, " Return: R+D-Left - Execute: L");

    for (i = 0; i < ARRAY_COUNT(sMenuElements); i++) {
        MenuElement elem = sMenuElements[this->eSelection];
        u8 index;

        if ((i + 5) > 24) {
            index = 24;
        } else {
            index = i;
        }

        if (!this->bExecute || elem.bToggle) {
            u32 color;

            if (this->pInput != NULL && !CHECK_BTN_ALL(this->pInput->cur.button, BTN_R) && CHECK_BTN_ALL(this->pInput->cur.button, BTN_L)) {
                color = i == this->eSelection ? COLOR_BLUE3 : COLOR_WHITE;
            } else {
                color = i == this->eSelection ? COLOR_BLUE2 : COLOR_WHITE;
            }

            Print_Screen(print, 4, i + 5, color, sMenuElements[index].name);
        }

        if (this->bExecute && (elem.drawFunc != NULL) && (elem.pStruct != NULL) && !elem.drawFunc(elem.pStruct)) {
            PRINTF("[HackerOoT:Menu]: an error occurred while trying to run the draw function\n");   
        }
    }
}
