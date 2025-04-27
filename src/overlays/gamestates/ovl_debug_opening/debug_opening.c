/**
 * File: debug_opening.c
 * Overlay: ovl_debug_opening
 * Description: Custom Debug Boot Menu
 * Author: @Trueffeloot
 */

#include "config.h"

#if IS_DEBUG_BOOT_ENABLED

#include "debug_opening_state.h"
#include "helpers.h"
#include "seqcmd.h"
#include "regs.h"
#include "controller.h"
#include "gfxalloc.h"
#include "z64save.h"
#include "sfx.h"
#include "debug.h"
#include "gfx.h"
#include "letterbox.h"
#include "build.h"

#define STRINGIFY(s) #s
#define EXPAND_AND_STRINGIFY(s) STRINGIFY(s)

#define DEBUG_OPENING_SKYBOX_ID SKYBOX_NORMAL_SKY
static f32 sSkyboxAngle = 0.0f;

void DebugOpening_DrawRectangle(DebugOpeningState* this, s32 leftX, s32 leftY, s32 rightX, s32 rightY,
                                Color_RGBA8 rgba) {
    Vec2s leftPos = { leftX, leftY }, rightPos = { rightX, rightY };
    Debug_DrawColorRectangle(leftPos, rightPos, rgba);
}

void DebugOpening_ChooseSaveFile(DebugOpeningState* this) {
    if (gSaveContext.fileNum != 0) {
        gSaveContext.fileNum = 0;
    } else {
        gSaveContext.fileNum = 0xff;
    }
}

void DebugOpening_LoadDefinedScene(DebugOpeningState* this) {
    Helpers_LoadDefinedScene(&this->state);
}

void DebugOpening_LoadTitleScreen(DebugOpeningState* this) {
    Helpers_LoadTitleScreen(&this->state);
}

void DebugOpening_LoadFileSelect(DebugOpeningState* this) {
    Helpers_LoadFileSelect(&this->state);
}

void DebugOpening_LoadMapSelect(DebugOpeningState* this) {
    Helpers_LoadMapSelect(&this->state);
}

/**
 * sOptionInfo contains every usable option in the first page.
 * The .name of every option is printed in DebugOpening_DrawOptions
 * through a loop and the .func gets executed based on this->currentOption
 * in DebugOpening_ControlOptions
 */
static OptionInfo sOptionInfo[] = {
    { .func = DebugOpening_ChooseSaveFile, .name = "Save File: " },
    {
        .func = DebugOpening_LoadDefinedScene,
        .name = "Load Defined Scene",
    },
#if IS_MAP_SELECT_ENABLED
    {
        .func = DebugOpening_LoadMapSelect,
        .name = "Load Map Select",
    },
#endif
    {
        .func = DebugOpening_LoadTitleScreen,
        .name = "Load Title Screen",
    },
    {
        .func = DebugOpening_LoadFileSelect,
        .name = "Load File Select",
    },
};

void DebugOpening_ControlOptions(DebugOpeningState* this) {
    // if dpad-up is pressed, go up in the options page
    if (CHECK_BTN_ANY(this->state.input[0].press.button, BTN_DUP) && this->currentOption > OPTION_CHOOSE_SAVE_FILE) {
        this->currentOption--;
        Audio_PlaySfxGeneral(NA_SE_IT_SWORD_IMPACT, &gSfxDefaultPos, 4, &gSfxDefaultFreqAndVolScale,
                             &gSfxDefaultFreqAndVolScale, &gSfxDefaultReverb);
    }

    // if dpad-down is pressed, go down in the options page
    if (CHECK_BTN_ANY(this->state.input[0].press.button, BTN_DDOWN) && this->currentOption < OPTION_LOAD_FILE_SELECT) {
        this->currentOption++;
        Audio_PlaySfxGeneral(NA_SE_IT_SWORD_IMPACT, &gSfxDefaultPos, 4, &gSfxDefaultFreqAndVolScale,
                             &gSfxDefaultFreqAndVolScale, &gSfxDefaultReverb);
    }

    // Run the function of the currently selected option
    // as soon as A is pressed
    if (CHECK_BTN_ALL(this->state.input[0].press.button, BTN_A)) {
        sOptionInfo[this->currentOption].func(this);
    }
}

void DebugOpening_DrawBuildInfo(DebugOpeningState* this) {
    Print_Screen(&gDebug.printer, 17, 5, 0xC99000, "COMMANDS");
    Print_Screen(&gDebug.printer, 1, 10, COLOR_WHITE, "Build Author: %s", gBuildAuthor);
    Print_Screen(&gDebug.printer, 1, 11, COLOR_WHITE, "Build Date: %s", gBuildDate);
    Print_Screen(&gDebug.printer, 1, 13, COLOR_WHITE, "Defined Scene: ");
    Print_Screen(&gDebug.printer, 17, 13, 0x9600AD, EXPAND_AND_STRINGIFY(BOOT_ENTRANCE));
}

void DebugOpening_DrawCommands(DebugOpeningState* this) {
    Print_Screen(&gDebug.printer, 15, 5, 0xC99000, "COMMANDS");
    Print_Screen(&gDebug.printer, 7, 9, 0x00D7FF, "No Clip:       L + D-Right");
    Print_Screen(&gDebug.printer, 7, 13, 0x00FF13, "Map Select:    L + R + Z");
    Print_Screen(&gDebug.printer, 7, 17, 0xF8FF00, "Debug Menu:    L + R");
}

static s32 sCommitStringPos = SCREEN_WIDTH;

void DebugOpening_DrawCommitInfo(DebugOpeningState* this) {
    GfxPrint gfxP;
    Gfx *dl, *gfxRef;

    // determine which string is the longest
    size_t max = CLAMP_MIN(strlen(gCommitAuthor), strlen(gBuildGitVersion));
    max = CLAMP_MIN(strlen(gCommitGitString), max);

    sCommitStringPos--;

    // for some reasons using `Print_ScreenPx` doesn't work well here so we're doing the print manually

    OPEN_DISPS(this->state.gfxCtx, __FILE__, __LINE__);

    dl = Gfx_Open(gfxRef = POLY_OPA_DISP);
    gSPDisplayList(OVERLAY_DISP++, dl);
    GfxPrint_Init(&gfxP);
    GfxPrint_Open(&gfxP, dl);

    GfxPrint_SetColor(&gfxP, 255, 255, 255, 255);

    GfxPrint_SetPosPx(&gfxP, sCommitStringPos, 26 * GFX_CHAR_Y_SPACING);
    GfxPrint_Printf(&gfxP, gCommitAuthor);

    GfxPrint_SetPosPx(&gfxP, sCommitStringPos, 27 * GFX_CHAR_Y_SPACING);
    GfxPrint_Printf(&gfxP, gBuildGitVersion);

    GfxPrint_SetColor(&gfxP, 0xDC, 0xE2, 0x19, 255);
    GfxPrint_SetPosPx(&gfxP, sCommitStringPos, 28 * GFX_CHAR_Y_SPACING);
    GfxPrint_Printf(&gfxP, gCommitGitString);

    dl = GfxPrint_Close(&gfxP);
    GfxPrint_Destroy(&gfxP);

    gSPEndDisplayList(dl++);
    Gfx_Close(gfxRef, dl);
    POLY_OPA_DISP = dl;

    CLOSE_DISPS(this->state.gfxCtx, __FILE__, __LINE__);

    // as soon as commit info leaves the screen, go back to the right side of the screen
    if (sCommitStringPos == 0 - (s32)(max * GFX_CHAR_X_SPACING)) {
        sCommitStringPos = SCREEN_WIDTH;
    }
}

void DebugOpening_DrawOptions(DebugOpeningState* this) {
    s32 i;

    Print_Screen(&gDebug.printer, 17, 5, 0xC99000, "PLAY");

    // Print the current save file option right behind the "Save File :" string
    Print_Screen(&gDebug.printer, 20, 10, 0x02CDFA, gSaveContext.fileNum == 0xff ? "Debug Save" : "New Save");

    for (i = 0; i < ARRAY_COUNT(sOptionInfo); i++) {
        u32 rgba = COLOR_WHITE;

        if (i == this->currentOption) {
            // highlight the currently selected option
            rgba = 0xEDE207;
        }

        Print_Screen(&gDebug.printer, 9, 10 + i, rgba, sOptionInfo[i].name);
    }
}

void DebugOpening_Draw(DebugOpeningState* this) {
    GraphicsContext* gfxCtx = this->state.gfxCtx;
    GfxPrint* printer;
    Vec3f eye;
    Vec3f at;
    Vec3f up;

    Color_RGBA8 rgba = { 0, 0, 0, 80 };

    eye.x = 0.0f;
    eye.y = 0.0f;
    eye.z = 3000.0f;
    at.x = 0.0f;
    at.y = 0.0f;
    at.z = 0.0f;
    up.x = 0.0f;
    up.z = 0.0f;
    up.y = 1.0f;

    OPEN_DISPS(gfxCtx, __FILE__, __LINE__);

    gSPSegment(POLY_OPA_DISP++, 0x00, NULL);
    gSPSegment(POLY_XLU_DISP++, 0x00, NULL);
    gSPSegment(OVERLAY_DISP++, 0x00, NULL);

    Gfx_SetupFrame(gfxCtx, true, 0, 0, 0);
    View_LookAt(&this->view, &eye, &at, &up);
    SET_FULLSCREEN_VIEWPORT(&this->view);
    View_Apply(&this->view, VIEW_ALL);

    Helpers_DrawSkybox(&this->state, &this->view, &this->envCtx, &this->skyboxCtx, DEBUG_OPENING_SKYBOX_ID, 0.0f,
                       -10.0f);

    // draw background
    DebugOpening_DrawRectangle(this, 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, rgba);

    // draw separators (from top to bottom)
    u8 i;
    s32 positions[][4] = {
        // { leftX, leftY, rightX, rightY },
        { 0, ((SCREEN_HEIGHT / 10) + 6), SCREEN_WIDTH, ((SCREEN_HEIGHT / 10) + 7) },
        { 0, (SCREEN_HEIGHT - 40), SCREEN_WIDTH, (SCREEN_HEIGHT - 41) },
    };
    rgba.r = rgba.g = rgba.b = rgba.a = 255;
    for (i = 0; i < ARRAY_COUNT(positions); i++) {
        DebugOpening_DrawRectangle(this, positions[i][0], positions[i][1], positions[i][2], positions[i][3], rgba);
    }

    Print_Screen(&gDebug.printer, 10, 1, 0xDC0011, "HackerOoT Boot Menu");
    Print_Screen(&gDebug.printer, 10, 2, COLOR_WHITE, "Welcome ");
    Print_Screen(&gDebug.printer, 18, 2, 0x00A0DC, "%s", gBuildAuthor);
    Print_Screen(&gDebug.printer, 18 + strlen(gBuildAuthor), 2, COLOR_WHITE, "!");
    Print_Screen(&gDebug.printer, 1, 23, COLOR_WHITE, this->controlGuideString, this->page);

    switch (this->page) {
        case OPTIONS_PAGE:
            DebugOpening_DrawOptions(this);
            break;
        case COMMANDS_PAGE:
            DebugOpening_DrawCommands(this);
            break;
        case BUILDINFO_PAGE:
            DebugOpening_DrawBuildInfo(this);
            break;
        default:
            break;
    }

    DebugOpening_DrawCommitInfo(this);

    CLOSE_DISPS(gfxCtx, __FILE__, __LINE__);
}

void DebugOpening_Init(GameState* thisx) {
    DebugOpeningState* this = (DebugOpeningState*)thisx;

    this->currentOption = 0;
    this->page = OPTIONS_PAGE;
    View_Init(&this->view, this->state.gfxCtx);
    SEQCMD_PLAY_SEQUENCE(SEQ_PLAYER_BGM_MAIN, 0, 0, NA_BGM_TITLE);

    if (USE_WIDESCREEN) { // Debug boot in widescreen is not completely positioned yet
        this->controlGuideString = "[Z] <--                      %d / 3                       --> [R]";
    } else {
        this->controlGuideString = "[Z] <--         %d / 3          --> [R]";
    }

    // initialize skybox
    gSaveContext.save.dayTime = gSaveContext.skyboxTime = CLOCK_TIME(15, 0);
    Helpers_InitSkybox(&this->state, &this->envCtx, &this->skyboxCtx, DEBUG_OPENING_SKYBOX_ID);

#if ENABLE_NEW_LETTERBOX
    ShrinkWindow_Init();
#endif

    this->state.main = DebugOpening_Main;
    this->state.destroy = DebugOpening_Destroy;

    // set the framerate to 30fps
    R_UPDATE_RATE = 2;
}

void DebugOpening_Main(GameState* thisx) {
    DebugOpeningState* this = (DebugOpeningState*)thisx;

    if (this->page == OPTIONS_PAGE) {
        DebugOpening_ControlOptions(this);
    }

    DebugOpening_Draw(this);

    if (CHECK_BTN_ANY(this->state.input[0].press.button, BTN_R) && this->page != BUILDINFO_PAGE) {
        this->page++;
        Audio_PlaySfxGeneral(NA_SE_SY_FSEL_CURSOR, &gSfxDefaultPos, 4, &gSfxDefaultFreqAndVolScale,
                             &gSfxDefaultFreqAndVolScale, &gSfxDefaultReverb);
    } else if (CHECK_BTN_ANY(this->state.input[0].press.button, BTN_Z) && this->page != OPTIONS_PAGE) {
        this->page--;
        Audio_PlaySfxGeneral(NA_SE_SY_FSEL_CURSOR, &gSfxDefaultPos, 4, &gSfxDefaultFreqAndVolScale,
                             &gSfxDefaultFreqAndVolScale, &gSfxDefaultReverb);
    }
}

void DebugOpening_Destroy(GameState* thisx) {
}

#endif
