#include "global.h"
#include "debug.h"
#include "fault.h"

#if ENABLE_HACKER_DEBUG

static Gfx sPolyBuffer[MENU_BUFFER_SIZE];

static Gfx sPolyGfxInit_Collision[] = {
    gsSPLoadGeometryMode(G_ZBUFFER | G_SHADE | G_LIGHTING),
    gsSPTexture(0, 0, 0, G_TX_RENDERTILE, G_OFF),
    gsDPPipeSync(),
    gsDPSetCycleType(G_CYC_1CYCLE),
    gsDPSetRenderMode(
        Z_CMP | IM_RD | CVG_DST_FULL | FORCE_BL | ZMODE_DEC | GBL_c1(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA),
        Z_CMP | IM_RD | CVG_DST_FULL | FORCE_BL | ZMODE_DEC | GBL_c2(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA)),
    gsDPSetCombineLERP(PRIMITIVE, 0, SHADE, 0, 0, 0, 0, ENVIRONMENT, PRIMITIVE, 0, SHADE, 0, 0, 0, 0, ENVIRONMENT),
    gsDPSetEnvColor(255, 255, 255, 128),
    gsSPEndDisplayList(),
};

f32 MaxF(f32 a, f32 b) {
    return a >= b ? a : b;
}

f32 MinF(f32 a, f32 b) {
    return a < b ? a : b;
}

void CollisionView_IsOutOfMemory(Gfx** cur, Gfx** head, const char* msg) {
    if (*cur > *head) {
        Fault_AddHungupAndCrashImpl(msg, "[HackerOoT:FATAL]: Gfx Buffer ran out of space!\n");
    }
}

void CollisionView_DrawStatic(PlayState* play, Gfx** gfxP, Gfx** gfxD, CollisionHeader* colHeader) {
    s32 prevTyid = -1;
    s16 alpha = -1;
    Camera* cam = GET_ACTIVE_CAM(play);
    s32 i;
    s32 j;

    if (colHeader == NULL) {
        return;
    }

    for (i = 0; i < colHeader->numPolygons; i++) {
        CollisionPoly* colPoly = &colHeader->polyList[i];
        ColViewPolygonTypes* type = (ColViewPolygonTypes*)&colHeader->surfaceTypeList[colPoly->type];
        s32 tyid = -1;
        Vec3s vPos[3];
        f32 dist = MAXFLOAT;

        for (j = 0; j < 3; j++) {
            vPos[j].x = colHeader->vtxList[colPoly->vtxData[j] & 0x1FFF].x;
            vPos[j].y = colHeader->vtxList[colPoly->vtxData[j] & 0x1FFF].y;
            vPos[j].z = colHeader->vtxList[colPoly->vtxData[j] & 0x1FFF].z;

            dist =
                MinF(sqrtf(SQ(vPos[j].x - cam->eye.x) + SQ(vPos[j].y - cam->eye.y) + SQ(vPos[j].z - cam->eye.z)), dist);
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
            vtx[j] = gdSPDefVtxN(vPos[j].x, vPos[j].y, vPos[j].z, 0, 0, colPoly->normal.x / 0x100,
                                 colPoly->normal.y / 0x100, colPoly->normal.z / 0x100, 0xFF);
        }

        gSPVertex((*gfxP)++, gDisplayListData(gfxD, vtx), 3, 0);
        gSP1Triangle((*gfxP)++, 0, 1, 2, 0);
        CollisionView_IsOutOfMemory(gfxP, gfxD, "Scene Collision");
    }
}

u8 CollisionView_Draw(void* unused) {
    Gfx* dlist = sPolyBuffer;
    Gfx* pGfx = dlist;
    Gfx* dGfx = dlist + MENU_BUFFER_SIZE;

    if (!gDebug.menu.bColViewEnabled) {
        return true;
    }

    OPEN_DISPS(gDebug.printer.gfxCtx, __FILE__, __LINE__);

    gSPDisplayList(pGfx++, sPolyGfxInit_Collision);
    gSPSetGeometryMode(pGfx++, G_CULL_BACK);
    gSPMatrix(pGfx++, &gIdentityMtx, G_MTX_NOPUSH | G_MTX_LOAD | G_MTX_MODELVIEW);

    CollisionView_DrawStatic(gDebug.play, &pGfx, &dGfx, gDebug.play->colCtx.colHeader);
    Print_Screen(&gDebug.printer, 1, 1, COLOR_WHITE, "%3.2f%c", 100 - ((f32)(dGfx - pGfx) / MENU_BUFFER_SIZE) * 100,
                 '%');

    gSPEndDisplayList(pGfx++);
    gSPDisplayList(POLY_OPA_DISP++, dlist);

    CLOSE_DISPS(gDebug.printer.gfxCtx, __FILE__, __LINE__);

    return true;
}

#endif
