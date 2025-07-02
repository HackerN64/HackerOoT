/*
 * File: z_title.c
 * Overlay: ovl_title
 * Description: Displays the Nintendo Logo
 */

#include "helpers.h"
#include "libu64/gfxprint.h"
#if PLATFORM_N64
#include "cic6105.h"
#include "n64dd.h"
#endif

#include "alloca.h"
#include "build.h"
#include "console_logo_state.h"
#include "gfx.h"
#include "gfx_setupdl.h"
#include "padmgr.h"
#include "printf.h"
#include "regs.h"
#include "segment_symbols.h"
#include "sequence.h"
#include "sys_matrix.h"
#include "sys_debug_controller.h"
#include "sys_freeze.h"
#include "title_setup_state.h"
#include "versions.h"
#include "z64actor.h"
#include "z64environment.h"
#include "z64save.h"
#include "widescreen.h"
#include "debug_opening_state.h"
#include "letterbox.h"

#include "assets/textures/nintendo_rogo_static/nintendo_rogo_static.h"

void ConsoleLogo_Calc(ConsoleLogoState* this) {
#if !PLATFORM_GC
    if ((this->coverAlpha == 0) && (this->visibleDuration != 0)) {
        this->timer--;
        this->visibleDuration--;
        if (this->timer == 0) {
            this->timer = 400;
        }
    } else {
        if (this->coverAlpha == 0 && this->visibleDuration != 0) {
            this->timer--;
            this->visibleDuration--;
            if (this->timer == 0) {
                this->timer = 400;
            }
        } else {
            this->coverAlpha += this->addAlpha;
            if (this->coverAlpha <= 0) {
                this->coverAlpha = 0;
                this->addAlpha = MM_N64_BOOT_LOGO ? 12 : 3;
            } else if (this->coverAlpha >= 255) {
                this->coverAlpha = 255;
                this->exit = true;
            }
        }
        this->uls = this->ult & 0x7F;
        this->ult++;
    }
#endif
}

void ConsoleLogo_SetupView(ConsoleLogoState* this, f32 x, f32 y, f32 z) {
    View* view = &this->view;
    Vec3f eye;
    Vec3f lookAt;
    Vec3f up;

    eye.x = x;
    eye.y = y;
    eye.z = z;
    up.x = up.z = 0.0f;
    up.y = 1.0f;
    lookAt.x = lookAt.y = lookAt.z = 0.0f;

    View_SetPerspective(view, 30.0f, 10.0f, 12800.0f);
    View_LookAt(view, &eye, &lookAt, &up);
    View_Apply(view, VIEW_ALL);
}

void ConsoleLogo_Draw(ConsoleLogoState* this) {
    static s16 sTitleRotY = 0;
    static Lights1 sTitleLights = gdSPDefLights1(100, 100, 100, 255, 255, 255, 69, 69, 69);

    u16 y;
    u16 idx;
    s32 pad1;
    Vec3f v3;
    Vec3f v1;
    Vec3f v2;
    s32 pad2;
    s32 pad3;

    OPEN_DISPS(this->state.gfxCtx, "../z_title.c", 395);

    v3.x = 69;
    v3.y = 69;
    v3.z = 69;
    v2.x = -4949.148;
    v2.y = 4002.5417;
    v1.x = 0;
    v1.y = 0;
    v1.z = 0;
    v2.z = 1119.0837;

    func_8002EABC(&v1, &v2, &v3, this->state.gfxCtx);
    gSPSetLights1(POLY_OPA_DISP++, sTitleLights);
    ConsoleLogo_SetupView(this, 0, 150.0, 300.0);
    Gfx_SetupDL_25Opa(this->state.gfxCtx);
    Matrix_Translate(WIDE_INCR(-53.0, -8.0), -5.0, 0, MTXMODE_NEW);
    Matrix_Scale(1.0, 1.0, 1.0, MTXMODE_APPLY);
    Matrix_RotateZYX(0, sTitleRotY, 0, MTXMODE_APPLY);

    MATRIX_FINALIZE_AND_LOAD(POLY_OPA_DISP++, this->state.gfxCtx, "../z_title.c", 424);
    gSPDisplayList(POLY_OPA_DISP++, gNintendo64LogoDL);
    Gfx_SetupDL_39Opa(this->state.gfxCtx);
    gDPPipeSync(POLY_OPA_DISP++);
    gDPSetCycleType(POLY_OPA_DISP++, G_CYC_2CYCLE);
    gDPSetRenderMode(POLY_OPA_DISP++, G_RM_PASS, G_RM_CLD_SURF2);
    gDPSetCombineLERP(POLY_OPA_DISP++, TEXEL1, PRIMITIVE, ENV_ALPHA, TEXEL0, 0, 0, 0, TEXEL0, PRIMITIVE, ENVIRONMENT,
                      COMBINED, ENVIRONMENT, COMBINED, 0, PRIMITIVE, 0);
    gDPSetPrimColor(POLY_OPA_DISP++, 0, 0, 170, 255, 255, 255);
    gDPSetEnvColor(POLY_OPA_DISP++, 0, 0, 255, 128);

    gDPLoadMultiBlock(POLY_OPA_DISP++, nintendo_rogo_static_Tex_001800, 0x100, 1, G_IM_FMT_I, G_IM_SIZ_8b, 32, 32, 0,
                      G_TX_NOMIRROR | G_TX_WRAP, G_TX_NOMIRROR | G_TX_WRAP, 5, 5, 2, 11);

    for (idx = 0, y = 94; idx < 16; idx++, y += 2) {
        gDPLoadTextureBlock(POLY_OPA_DISP++, &((u8*)nintendo_rogo_static_Tex_000000)[0x180 * idx], G_IM_FMT_I,
                            G_IM_SIZ_8b, 192, 2, 0, G_TX_NOMIRROR | G_TX_WRAP, G_TX_NOMIRROR | G_TX_WRAP, G_TX_NOMASK,
                            G_TX_NOMASK, G_TX_NOLOD, G_TX_NOLOD);

        gDPSetTileSize(POLY_OPA_DISP++, 1, this->uls, (this->ult & 0x7F) - (idx << 2), 0, 0);
        gSPTextureRectangle(POLY_OPA_DISP++, WIDE_INCR(97, 8) << 2, y << 2, 289 << 2, (y + 2) << 2, G_TX_RENDERTILE, 0,
                            0, WIDE_DIV((1 << 10), WIDE_GET_RATIO), 1 << 10);
    }

    Environment_FillScreen(this->state.gfxCtx, 0, 0, 0, (s16)this->coverAlpha, FILL_SCREEN_XLU);

    sTitleRotY += 300;

    CLOSE_DISPS(this->state.gfxCtx, "../z_title.c", 483);
}

void ConsoleLogo_Main(GameState* thisx) {
    ConsoleLogoState* this = (ConsoleLogoState*)thisx;

    OPEN_DISPS(this->state.gfxCtx, "../z_title.c", 494);

    gSPSegment(POLY_OPA_DISP++, 0, NULL);
    gSPSegment(POLY_OPA_DISP++, 1, this->staticSegment);
    Gfx_SetupFrame(this->state.gfxCtx, true, 0, 0, 0);
    Gfx_ClearZBuffer(this->state.gfxCtx);

#if SKIP_N64_BOOT_LOGO
    this->exit = true;
#else
    ConsoleLogo_Calc(this);
    ConsoleLogo_Draw(this);
#endif

    if (this->exit) {
#if ENABLE_HACKER_DEBUG
#if BOOT_TO_SCENE
        Helpers_LoadDefinedScene(thisx);
#elif IS_DEBUG_BOOT_ENABLED && BOOT_TO_DEBUG_OPENING
        this->state.running = false;
        SET_NEXT_GAMESTATE(&this->state, DebugOpening_Init, DebugOpeningState);
#else
        Helpers_LoadTitleScreen(thisx);
#endif
#else
        Helpers_LoadTitleScreen(thisx);
#endif
    }

    CLOSE_DISPS(this->state.gfxCtx, "../z_title.c", 541);
}

void ConsoleLogo_Destroy(GameState* thisx) {
    ConsoleLogoState* this = (ConsoleLogoState*)thisx;

#if PLATFORM_N64
    if (this->unk_1E0) {
        if (func_801C7818() != 0) {
            func_800D31A0();
        }
        func_801C7268();
    }
#endif

    Sram_InitSram(&this->state, &this->sramCtx);

#if PLATFORM_N64
    func_800014E8();
#endif

#if ENABLE_NEW_LETTERBOX
    ShrinkWindow_Destroy();
#endif
}

void ConsoleLogo_Init(GameState* thisx) {
    u32 size = (uintptr_t)_nintendo_rogo_staticSegmentRomEnd - (uintptr_t)_nintendo_rogo_staticSegmentRomStart;
    ConsoleLogoState* this = (ConsoleLogoState*)thisx;

#if PLATFORM_N64
    if ((D_80121210 != 0) && (D_80121211 != 0) && (D_80121212 == 0)) {
        if (func_801C7658() != 0) {
            func_800D31A0();
        }
        this->unk_1E0 = true;
    } else {
        this->unk_1E0 = false;
    }
#endif

    this->staticSegment = GAME_STATE_ALLOC(&this->state, size, "../z_title.c", 611);
    PRINTF("z_title.c\n");
    ASSERT(this->staticSegment != NULL, "this->staticSegment != NULL", "../z_title.c", 614);
    DMA_REQUEST_SYNC(this->staticSegment, (uintptr_t)_nintendo_rogo_staticSegmentRomStart, size, "../z_title.c", 615);
    R_UPDATE_RATE = 1;
    Matrix_Init(&this->state);
#if ENABLE_NEW_LETTERBOX
    ShrinkWindow_Init();
#endif
    View_Init(&this->view, this->state.gfxCtx);
    this->state.main = ConsoleLogo_Main;
    this->state.destroy = ConsoleLogo_Destroy;
    this->exit = false;

#if OOT_VERSION < GC_US || PLATFORM_IQUE
    if (!(gPadMgr.validCtrlrsMask & 1)) {
        gSaveContext.fileNum = 0xFEDC;
    } else {
        gSaveContext.fileNum = 0xFF;
    }
#else
    gSaveContext.fileNum = 0xFF;
#endif

    Sram_Alloc(&this->state, &this->sramCtx);
    this->ult = 0;
    this->timer = 20;
    this->coverAlpha = 255;
    this->addAlpha = MM_N64_BOOT_LOGO ? -12 : -3;
    this->visibleDuration = 0x3C;
}
