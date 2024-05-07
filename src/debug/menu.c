#include "global.h"
#include "debug.h"

u8 ColliderView_Draw(void* unused);

#define MENU_CANT_UPDATE \
    ((gSaveContext.gameMode != GAMEMODE_NORMAL) || (this->pPlay != NULL && IS_PAUSED(&this->pPlay->pauseCtx)))

static Gfx sPolyGfxInit_HitBox[] = {
    gsSPLoadGeometryMode(G_ZBUFFER | G_SHADE | G_LIGHTING),
    gsSPTexture(0, 0, 0, G_TX_RENDERTILE, G_OFF),
    gsDPPipeSync(),
    gsDPSetCycleType(G_CYC_1CYCLE),
    gsDPSetRenderMode(
        Z_CMP | IM_RD | CVG_DST_FULL | FORCE_BL | ZMODE_XLU | GBL_c1(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA),
        Z_CMP | IM_RD | CVG_DST_FULL | FORCE_BL | ZMODE_XLU | GBL_c2(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA)),
    gsDPSetCombineLERP(PRIMITIVE, 0, SHADE, 0, 0, 0, 0, ENVIRONMENT, PRIMITIVE, 0, SHADE, 0, 0, 0, 0, ENVIRONMENT),
    gsDPSetEnvColor(255, 255, 255, 128),
    gsSPEndDisplayList(),
};

static MenuElement sMenuElements[MENU_MAX] = {
    { "Collision View", true, NULL, NULL, (MenuFunc)CollisionView_Draw },
    { "Collider View", true, NULL, NULL, (MenuFunc)ColliderView_Draw },
};

void Menu_Init(Menu* this) {
    this->bShow = false;
    this->bExecute = false;
    this->bBackgroundExecution = false;
    this->nTimer = 0;
    this->bColViewEnabled = false;
    this->bHitboxViewEnabled = false;
    this->eSelection = MENU_MIN + 1;
    this->pPlay = gDebug.play;
    this->pInput = gDebug.input;
}

void Menu_Update(Menu* this) {
    if (this->pInput != NULL && !MENU_CANT_UPDATE) {
        u16 curBtn = this->pInput->cur.button;
        u16 pressBtn = this->pInput->press.button;
        u8 isHoldingR = CHECK_BTN_ALL(curBtn, BTN_R);
        u8 i;

        if (isHoldingR && CHECK_BTN_ALL(pressBtn, BTN_L)) {
            this->bShow ^= 1;
        }

        if (this->bShow && isHoldingR && CHECK_BTN_ALL(pressBtn, BTN_DLEFT)) {
            this->bExecute = 0;
        }

        if ((this->bShow && !isHoldingR) || this->bBackgroundExecution) {
            if (!this->bExecute || this->bBackgroundExecution) {
                if (this->bShow && !isHoldingR) {
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

                    if (CHECK_BTN_ALL(pressBtn, BTN_L)) {
                        if (this->eSelection == MENU_COLVIEW) {
                            this->bColViewEnabled ^= 1;
                        } else if (this->eSelection == MENU_HITVIEW) {
                            this->bHitboxViewEnabled ^= 1;
                        } else {
                            this->bExecute = 1;
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

    if (MENU_CANT_UPDATE) {
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

            if (this->pInput != NULL && !CHECK_BTN_ALL(this->pInput->cur.button, BTN_R) &&
                CHECK_BTN_ALL(this->pInput->cur.button, BTN_L)) {
                color = i == this->eSelection ? COLOR_BLUE3 : COLOR_WHITE;
            } else {
                color = i == this->eSelection ? COLOR_BLUE2 : COLOR_WHITE;
            }

            Print_Screen(print, 4, i + 5, color, sMenuElements[index].name);
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
