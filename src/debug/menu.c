#include "global.h"
#include "debug.h"

u8 ColliderView_Draw(void* unused);

#define MENU_CAN_UPDATE \
    ((gSaveContext.gameMode == GAMEMODE_NORMAL) && (gDebug.play != NULL && !IS_PAUSED(&gDebug.play->pauseCtx)))

static MenuElement sMenuElements[MENU_MAX] = {
    { "Collision View", true, NULL, NULL, (MenuFunc)CollisionView_Draw },
    { "Collider View", true, NULL, NULL, (MenuFunc)ColliderView_Draw },
#if ENABLE_PROFILER
    { "Profiler: ", false, NULL, NULL, NULL },
#endif
#if ENABLE_F3DEX3
    { "F3DEX3 profiling: ", false, NULL, NULL, NULL },
    { "F3DEX3 occ plane: ", false, NULL, NULL, NULL },
#endif
};

void Menu_Init(Menu* this) {
    this->bShow = false;
    this->bExecute = false;
    this->bBackgroundExecution = false;
    this->nTimer = 0;
    this->bColViewEnabled = false;
    this->bHitboxViewEnabled = false;
    this->eSelection = MENU_MIN + 1;
    this->pInput = gDebug.input;
}

void Menu_Update(Menu* this) {
    if (this->pInput == NULL || !MENU_CAN_UPDATE) {
        return;
    }
    u16 curBtn = this->pInput->cur.button;
    u16 pressBtn = this->pInput->press.button;
    u8 isHoldingR = CHECK_BTN_ALL(curBtn, BTN_R);
    u8 pressDLeft = CHECK_BTN_ALL(pressBtn, BTN_DLEFT);
    u8 pressDRight = CHECK_BTN_ALL(pressBtn, BTN_DRIGHT);
    u8 i;

    if (isHoldingR && CHECK_BTN_ALL(pressBtn, BTN_L)) {
        this->bShow ^= 1;
    }
    if (this->bShow && isHoldingR && CHECK_BTN_ALL(pressBtn, BTN_DLEFT)) {
        this->bExecute = 0;
    }
    u8 editActive = this->bShow && !isHoldingR;
    if (!editActive && !this->bBackgroundExecution) {
        return;
    }

    if (!this->bExecute || this->bBackgroundExecution) {
        if (editActive) {
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

#if ENABLE_F3DEX3
            if (this->eSelection == MENU_F3DEX3_PROF) {
                if (pressDLeft && gF3DEX3ProfVersion > 0) {
                    gF3DEX3ProfVersion--;
                }
                if (pressDRight && gF3DEX3ProfVersion < 3) {
                    gF3DEX3ProfVersion++;
                }
            } else if (this->eSelection == MENU_F3DEX3_OCC) {
                if (pressDLeft && gF3DEX3OccMode > 0) {
                    gF3DEX3OccMode--;
                }
                if (pressDRight && gF3DEX3OccMode < F3DEX3_OCC_MODE_COUNT - 1) {
                    gF3DEX3OccMode++;
                }
            }
#endif

#if ENABLE_PROFILER
            if (this->eSelection == MENU_PROFILER) {
                if (pressDLeft && gProfilerMode > 0) {
                    gProfilerMode--;
                }
                if (pressDRight && gProfilerMode < PROFILER_MODE_COUNT - 1) {
                    gProfilerMode++;
                }
            }
#endif

            if (CHECK_BTN_ALL(pressBtn, BTN_L)) {
                if (this->eSelection == MENU_COLVIEW) {
                    this->bColViewEnabled ^= 1;
                } else if (this->eSelection == MENU_HITVIEW) {
                    this->bHitboxViewEnabled ^= 1;
                } else {
                    // Nothing actually uses "execute" now.
                    // this->bExecute = 1;
                }

                this->nTimer = 1;
                this->bBackgroundExecution = this->bColViewEnabled || this->bHitboxViewEnabled;
            }
        }

        if (this->nTimer > 0) {
            this->nTimer--;
        }
    }

    if (this->bExecute || this->bBackgroundExecution) {
        for (i = 0; i < ARRAY_COUNT(sMenuElements); i++) {
            MenuElement elem = sMenuElements[this->eSelection];

            this->bBackgroundExecution = elem.bToggle;
            if ((elem.updateFunc != NULL) && (elem.pStruct != NULL) && !elem.updateFunc(elem.pStruct)) {
                PRINTF("[HackerOoT:Menu]: an error occurred while trying to run the update function\n");
            }
        }
    }
}

void Menu_DrawElem(MenuElement elem) {
    if ((elem.drawFunc != NULL) && !elem.drawFunc(elem.pStruct)) {
        PRINTF("[HackerOoT:Menu]: an error occurred while trying to run the draw function\n");
    }
}

void Menu_Draw(Menu* this) {
    Color_RGBA8 bg = { 0, 0, 0, 128 };
    Vec2s left = { 20, 20 };
    Vec2s right = { 300, 220 };
    PrintUtils* print = &gDebug.printer;
    u8 i;

    if (!MENU_CAN_UPDATE) {
        return;
    }

    if (this->bShow) {
        Debug_DrawColorRectangle(left, right, bg);

        Print_Screen(print, 11, 3, COLOR_WHITE, "--- Debug Menu ---");
        Print_Screen(print, 5, 26, COLOR_WHITE, " Return: R+D-Left - Execute: L");
    }

    for (i = 0; i < ARRAY_COUNT(sMenuElements); i++) {
        MenuElement elem = sMenuElements[this->eSelection];
        u8 index;

        if ((i + 5) > 24) {
            index = 24;
        } else {
            index = i;
        }

        if (this->bShow && !this->bExecute) {
            u32 color;
            const char* text = sMenuElements[index].name;

            if (this->pInput != NULL && !CHECK_BTN_ALL(this->pInput->cur.button, BTN_R) &&
                CHECK_BTN_ALL(this->pInput->cur.button, BTN_L)) {
                color = i == this->eSelection ? COLOR_BLUE3 : COLOR_WHITE;
            } else {
                color = i == this->eSelection ? COLOR_BLUE2 : COLOR_WHITE;
            }

            char tempBuffer[100];
#if ENABLE_F3DEX3
            if (i == MENU_F3DEX3_PROF) {
                static const char* const profStrings[4] = {
                    "Default >",
                    "< A >",
                    "< B >",
                    "< C",
                };
                sprintf(tempBuffer, "%s%s", text, profStrings[gF3DEX3ProfVersion]);
                text = tempBuffer;
            } else if (i == MENU_F3DEX3_OCC) {
                static const char* const occStrings[F3DEX3_OCC_MODE_COUNT] = {
                    "Auto >",
                    "< Always >",
                    "< Never",
                };
                sprintf(tempBuffer, "%s%s", text, occStrings[gF3DEX3OccMode]);
                text = tempBuffer;
            }
#endif
#if ENABLE_PROFILER
            if (i == MENU_PROFILER) {
                static const char* const profStrings[PROFILER_MODE_COUNT] = {
                    "Disable >",     "< Real FPS >", "< Virtual FPS >", "< Gfx >",
                    "< Gfx Trace >", "< CPU >",      "< CPU Trace >",   "< All Trace",
                };
                sprintf(tempBuffer, "%s%s", text, profStrings[gProfilerMode]);
                text = tempBuffer;
            }
#endif

            Print_Screen(print, 4, i + 5, color, text);
        }

        if (this->bShow && this->bExecute) {
            Menu_DrawElem(elem);
        }
    }

    if (this->bColViewEnabled) {
        Menu_DrawElem(sMenuElements[MENU_COLVIEW]);
    }

    if (this->bHitboxViewEnabled) {
        Menu_DrawElem(sMenuElements[MENU_HITVIEW]);
    }
}
