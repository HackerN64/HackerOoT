/**
 * File: z_debug_opening.c
 * Overlay: ovl_debug_opening
 * Description: Custom Debug Boot Menu
 * Author: @Trueffeloot
 */

#include "global.h"
#include "config.h"

#if IS_DEBUG_BOOT_ENABLED

#include "alloca.h"
#include "debug_opening.h"
#include "macros.h"
#include "helpers.h"

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
        .name = "Go to Defined Scene",
    },
#if IS_MAP_SELECT_ENABLED
    {
        .func = DebugOpening_LoadMapSelect,
        .name = "Go to Map Select",
    },
#endif
    {
        .func = DebugOpening_LoadTitleScreen,
        .name = "Go to Title Screen",
    },
    {
        .func = DebugOpening_LoadFileSelect,
        .name = "Go to File Select",
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

void DebugOpening_DrawBuildInfo(DebugOpeningState* this, GfxPrint* printer) {
    GfxPrint_SetColor(printer, 201, 144, 0, 255);
    GfxPrint_SetPos(printer, 17, 5);
    GfxPrint_Printf(printer, "BUILD");

    GfxPrint_SetColor(printer, 255, 255, 255, 255);
    GfxPrint_SetPos(printer, 1, 10);
    GfxPrint_Printf(printer, "Build Author: %s", gBuildAuthor);

    GfxPrint_SetPos(printer, 1, 11);
    GfxPrint_Printf(printer, "Build Date: %s", gBuildDate);

    GfxPrint_SetPos(printer, 1, 13);
    GfxPrint_Printf(printer, "Defined Scene: ");
    GfxPrint_SetColor(printer, 150, 0, 173, 255);
    GfxPrint_Printf(printer, EXPAND_AND_STRINGIFY(BOOT_ENTRANCE));
}

void DebugOpening_DrawCommands(DebugOpeningState* this, GfxPrint* printer) {
    GfxPrint_SetColor(printer, 201, 144, 0, 255);
    GfxPrint_SetPos(printer, 15, 5);
    GfxPrint_Printf(printer, "COMMANDS");

    GfxPrint_SetColor(printer, 0, 215, 255, 255);
    GfxPrint_SetPos(printer, 7, 9);
    GfxPrint_Printf(printer, "No Clip:       L + D-Right");

    GfxPrint_SetColor(printer, 0, 255, 19, 255);
    GfxPrint_SetPos(printer, 7, 13);
    GfxPrint_Printf(printer, "Map Select:    L + R + Z");

    GfxPrint_SetColor(printer, 247, 255, 0, 255);
    GfxPrint_SetPos(printer, 7, 17);
    GfxPrint_Printf(printer, "Debug Menu:    L + R");
}

static s32 sCommitStringPos = 320;

void DebugOpening_DrawCommitInfo(DebugOpeningState* this, GfxPrint* printer) {
    sCommitStringPos--;

    GfxPrint_SetColor(printer, 255, 255, 255, 255);

    GfxPrint_SetPos(printer, 0, 24);
    GfxPrint_Printf(printer, this->seperatorString);

    GfxPrint_SetPosPx(printer, sCommitStringPos, 26 * GFX_CHAR_Y_SPACING);
    GfxPrint_Printf(printer, gCommitAuthor);

    GfxPrint_SetPosPx(printer, sCommitStringPos, 27 * GFX_CHAR_Y_SPACING);
    GfxPrint_Printf(printer, gBuildGitVersion);

    GfxPrint_SetColor(printer, 220, 226, 25, 255);
    GfxPrint_SetPosPx(printer, sCommitStringPos, 28 * GFX_CHAR_Y_SPACING);
    GfxPrint_Printf(printer, gCommitGitString);

    // as soon as commit info leaves the screen, go back to the right side of the screen
    if (sCommitStringPos == 0 - (s32)(strlen(gCommitGitString) * GFX_CHAR_X_SPACING)) {
        sCommitStringPos = 320;
    }
}

void DebugOpening_Destroy(GameState* thisx) {
}

void DebugOpening_DrawOptions(DebugOpeningState* this, GfxPrint* printer) {
    s32 i;

    GfxPrint_SetColor(printer, 201, 144, 0, 255);
    GfxPrint_SetPos(printer, 17, 5);
    GfxPrint_Printf(printer, "PLAY");

    // Print the current save file option right behind the "Save File :" string
    GfxPrint_SetColor(printer, 2, 205, 250, 255);
    GfxPrint_SetPos(printer, 20, 10);
    GfxPrint_Printf(printer, gSaveContext.fileNum == 0xff ? "Debug Save" : "New Save");

    for (i = 0; i < 5; i++) {
        GfxPrint_SetColor(printer, 255, 255, 255, 255);
        GfxPrint_SetPos(printer, 9, 10 + i);
        if (i == this->currentOption) {
            // highlight the currently selected option
            GfxPrint_SetColor(printer, 237, 226, 7, 255);
        }
        GfxPrint_Printf(printer, sOptionInfo[i].name);
    }
}

void DebugOpening_DrawBase(DebugOpeningState* this) {
    GraphicsContext* gfxCtx = this->state.gfxCtx;
    GfxPrint* printer;

    OPEN_DISPS(gfxCtx, "../z_debug_opening.c", __LINE__);

    gSPSegment(POLY_OPA_DISP++, 0x00, NULL);
    Gfx_SetupFrame(gfxCtx, true, 0, 0, 0);
    SET_FULLSCREEN_VIEWPORT(&this->view);
    View_Apply(&this->view, VIEW_ALL);
    Gfx_SetupDL_28Opa(gfxCtx);

    printer = alloca(sizeof(GfxPrint));
    GfxPrint_Init(printer);
    GfxPrint_Open(printer, POLY_OPA_DISP);

    GfxPrint_SetColor(printer, 220, 0, 17, 255);
    GfxPrint_SetPos(printer, 10, 1);
    GfxPrint_Printf(printer, "HackerOoT Boot Menu");

    GfxPrint_SetColor(printer, 255, 255, 255, 255);
    GfxPrint_SetPos(printer, 10, 2);
    GfxPrint_Printf(printer, "Welcome ");

    GfxPrint_SetColor(printer, 0, 160, 220, 255);
    GfxPrint_Printf(printer, "%s!", gBuildAuthor);

    GfxPrint_SetColor(printer, 255, 255, 255, 255);
    GfxPrint_SetPos(printer, 0, 3);
    GfxPrint_Printf(printer, this->seperatorString);

    GfxPrint_SetPos(printer, 1, 23);
    GfxPrint_Printf(printer, this->controlGuideString, this->page);

    switch (this->page) {
        case OPTIONS_PAGE:
            DebugOpening_DrawOptions(this, printer);
            break;
        case COMMANDS_PAGE:
            DebugOpening_DrawCommands(this, printer);
            break;
        case BUILDINFO_PAGE:
            DebugOpening_DrawBuildInfo(this, printer);
            break;
        default:
            break;
    }

    DebugOpening_DrawCommitInfo(this, printer);

    POLY_OPA_DISP = GfxPrint_Close(printer);
    GfxPrint_Destroy(printer);

    CLOSE_DISPS(gfxCtx, "../z_debug_opening.c", __LINE__);
}

void DebugOpening_Main(GameState* thisx) {
    DebugOpeningState* this = (DebugOpeningState*)thisx;

    if (this->page == OPTIONS_PAGE) {
        DebugOpening_ControlOptions(this);
    }
    DebugOpening_DrawBase(this);
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

void DebugOpening_Init(GameState* thisx) {
    DebugOpeningState* this = (DebugOpeningState*)thisx;

    this->currentOption = 0;
    this->page = OPTIONS_PAGE;
    View_Init(&this->view, this->state.gfxCtx);
    SEQCMD_PLAY_SEQUENCE(SEQ_PLAYER_BGM_MAIN, 0, 0, NA_BGM_TITLE);
    if (USE_WIDESCREEN) { // Debug boot in widescreen is not completely positioned yet
        this->controlGuideString = "[Z] <--                      %d / 3                       --> [R]";
        this->seperatorString = "________________________________________________________";
    } else {
        this->controlGuideString = "[Z] <--         %d / 3          --> [R]";
        this->seperatorString = "_______________________________________";
    }
    this->state.main = DebugOpening_Main;
    this->state.destroy = DebugOpening_Destroy;
}

#endif
