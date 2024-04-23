#include "global.h"
#include "debug.h"

#define MENU_BUFFER_SIZE 0x4000
#define ALIGN(val, align) ((((val) % (align)) != 0) ? (val) + (align) - ((val) % (align)) : (val))

static Gfx sPolyBuffer[MENU_BUFFER_SIZE];

static Gfx sPolyGfxInit_HitBox[] = {
	gsSPLoadGeometryMode(G_ZBUFFER | G_SHADE | G_LIGHTING),
	gsSPTexture(0, 0, 0, G_TX_RENDERTILE, G_OFF),
	gsDPPipeSync(),
	gsDPSetCycleType(G_CYC_1CYCLE),
	gsDPSetRenderMode(
		Z_CMP | IM_RD | CVG_DST_FULL | FORCE_BL | ZMODE_XLU | GBL_c1(G_BL_CLR_IN,G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA),
		Z_CMP | IM_RD | CVG_DST_FULL | FORCE_BL | ZMODE_XLU | GBL_c2(G_BL_CLR_IN,G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA)
	),
	gsDPSetCombineLERP(PRIMITIVE, 0, SHADE, 0, 0, 0, 0, ENVIRONMENT, PRIMITIVE, 0, SHADE, 0, 0, 0, 0, ENVIRONMENT),
	gsDPSetEnvColor(255, 255, 255, 128),
	gsSPEndDisplayList(),
};

static Gfx sPolyGfxInit_Collision[] = {
	gsSPLoadGeometryMode(G_ZBUFFER | G_SHADE | G_LIGHTING),
	gsSPTexture(0, 0, 0, G_TX_RENDERTILE, G_OFF),
	gsDPPipeSync(),
	gsDPSetCycleType(G_CYC_1CYCLE),
	gsDPSetRenderMode(
		Z_CMP | IM_RD | CVG_DST_FULL | FORCE_BL | ZMODE_DEC | GBL_c1(G_BL_CLR_IN,G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA),
		Z_CMP | IM_RD | CVG_DST_FULL | FORCE_BL | ZMODE_DEC | GBL_c2(G_BL_CLR_IN,G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA)
	),
	gsDPSetCombineLERP(PRIMITIVE, 0, SHADE, 0, 0, 0, 0, ENVIRONMENT, PRIMITIVE, 0, SHADE, 0, 0, 0, 0, ENVIRONMENT),
	gsDPSetEnvColor(255, 255, 255, 128),
	gsSPEndDisplayList(),
};

static MenuElement sMenuElements[] = {
#if ENABLE_F3DEX3
    { "Profiler", false, (void*)&gProfiler, (MenuFunc)Profiler_Update, (MenuFunc)Profiler_Draw },
#endif
    { "Collision View", true, (void*)&gDebug.menu, NULL, NULL },
    { "Dummy 2", false, NULL, NULL, NULL },
    { "Dummy 3", false, NULL, NULL, NULL },
    { "Dummy 4", false, NULL, NULL, NULL },
};

f32 MaxF(f32 a, f32 b) {
    return a >= b ? a : b;
}

f32 MinF(f32 a, f32 b) {
    return a < b ? a : b;
}

void Menu_Init(Menu* this) {
    this->bShow = false;
    this->bExecute = false;
    this->bReturn = false;
    this->nTimer = 0;
    this->bColViewEnabled = false;
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

    Menu_DrawCollisionView(this);

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

void Menu_IsOutOfMemory(Gfx** cur, Gfx** head, const char* msg) {
    if (*cur > *head) {
        Fault_AddHungupAndCrashImpl(msg, "[HackerOoT:FATAL]: Gfx Buffer ran out of space!\n");
    }
}

void Menu_DrawStaticCollision(Menu* this, Gfx** gfxP, Gfx** gfxD, CollisionHeader* colHeader) {
    PlayState* play = this->pPlay;
    s32 prevTyid = -1;
    s16 alpha = -1;
    Camera* cam = GET_ACTIVE_CAM(play);
    s32 i, j;
    
    if (colHeader == NULL) {
        return;
    }
    
    for (i = 0; i < colHeader->numPolygons; i++) {
        CollisionPoly* colPoly = &colHeader->polyList[i];
        MenuPolygonTypes* type = (MenuPolygonTypes*)&colHeader->surfaceTypeList[colPoly->type];
        s32 tyid = -1;
        Vec3s vPos[3];
        f32 dist = MAXFLOAT;
        
        for (j = 0; j < 3; j++) {
            vPos[j].x = colHeader->vtxList[colPoly->vtxData[j] & 0x1FFF].x;
            vPos[j].y = colHeader->vtxList[colPoly->vtxData[j] & 0x1FFF].y;
            vPos[j].z = colHeader->vtxList[colPoly->vtxData[j] & 0x1FFF].z;
            
            dist = MinF(
                sqrtf(SQ(vPos[j].x - cam->eye.x) + SQ(vPos[j].y - cam->eye.y) + SQ(vPos[j].z - cam->eye.z)),
                dist
            );
        }
        
        if (dist > 950.0f) {
            continue;
        }
        
        if (type->hookshot == 1) {
            tyid = 0;
        } else if (type->wallParams > SURFACE_WALL_NO_LEDGE_GRAB) {
            tyid = 1;
        } else if (type->floorParams == SURFACE_FLOOR_VOID) {
            tyid = 2;
        } else if (type->exit != 0 || type->floorParams == SURFACE_FLOOR_VOID_SMALL) {
            tyid = 3;
        } else if (type->behaviour != 0 || type->wallDamage) {
            tyid = 4;
        } else if (type->slope == 1) {
            tyid = 5;
        } else {
            tyid = 6;
        }

        if (tyid != prevTyid) {
            switch (tyid) {
                case 0:
                    gDPSetPrimColor((*gfxP)++, 0, 0, 128, 128, 255, 255);
                    break;
                case 1:
                    gDPSetPrimColor((*gfxP)++, 0, 0, 192, 0, 192, 255);
                    break;
                case 2:
                    gDPSetPrimColor((*gfxP)++, 0, 0, 255, 0, 0, 255);
                    break;
                case 3:
                    gDPSetPrimColor((*gfxP)++, 0, 0, 0, 255, 0, 255);
                    break;
                case 4:
                    gDPSetPrimColor((*gfxP)++, 0, 0, 192, 255, 192, 255);
                    break;
                case 5:
                    gDPSetPrimColor((*gfxP)++, 0, 0, 255, 255, 128, 255);
                    break;
                case 6:
                    gDPSetPrimColor((*gfxP)++, 0, 0, 255, 255, 255, 255);
                    break;
            }
            prevTyid = tyid;
        }
        
        Vtx vtx[3];
        s16 nextAlpha;
        if (dist > 100.0f) {
            f32 mul = 1.0f - (dist - 100) * 0.00111111111f;
            nextAlpha = 185 * CLAMP_MAX(mul, 1.0f);
            nextAlpha = ALIGN(nextAlpha, 4);
            nextAlpha = CLAMP(nextAlpha, 0, 185);
        } else {
            nextAlpha = 185;
        }
        
        if (alpha != nextAlpha) {
            gDPSetEnvColor((*gfxP)++, 192, 0, 192, nextAlpha);
        }
        
        for (j = 0; j < 3; j++) {
            vtx[j] = gdSPDefVtxN(
                vPos[j].x,
                vPos[j].y,
                vPos[j].z,
                0,
                0,
                colPoly->normal.x / 0x100,
                colPoly->normal.y / 0x100,
                colPoly->normal.z / 0x100,
                0xFF
            );
        }

        gSPVertex((*gfxP)++, gDisplayListData(gfxD, vtx), 3, 0);
        gSP1Triangle((*gfxP)++, 0, 1, 2, 0);
        Menu_IsOutOfMemory(gfxP, gfxD, "Scene Collision");
    }
}

void Menu_DrawCollisionView(Menu* this) {
    Gfx* dlist = sPolyBuffer;
    Gfx* pGfx = dlist;
    Gfx* dGfx = dlist + MENU_BUFFER_SIZE;

    if (!this->bColViewEnabled) {
        return;
    }

    OPEN_DISPS(this->pPlay->state.gfxCtx, __FILE__, __LINE__);

    gSPDisplayList(pGfx++, sPolyGfxInit_Collision);
    gSPSetGeometryMode(pGfx++, G_CULL_BACK);
    gSPMatrix(pGfx++, &gMtxClear, G_MTX_NOPUSH | G_MTX_LOAD | G_MTX_MODELVIEW);

    Menu_DrawStaticCollision(this, &pGfx, &dGfx, this->pPlay->colCtx.colHeader);

    CLOSE_DISPS(this->pPlay->state.gfxCtx, __FILE__, __LINE__);
}
