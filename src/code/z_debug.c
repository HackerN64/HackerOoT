#include "global.h"
#include "config.h"

#ifdef ENABLE_CAMERA_DEBUGGER
typedef struct {
    u8 x;
    u8 y;
    u8 colorIndex;
    char text[21];
} DbCameraTextBufferEntry; // size = 0x18
#endif

#ifdef ENABLE_REG_EDITOR
typedef struct {
    u16 hold;
    u16 press;
} InputCombo; // size = 0x4
#endif

RegEditor* gRegEditor; // ``gRegEditor->data`` is used by non-debug features in normal gameplay

#ifdef ENABLE_CAMERA_DEBUGGER
DbCameraTextBufferEntry sDbCameraTextBuffer[22];

s16 sDbCameraTextEntryCount = 0;

Color_RGBA8 sDbCameraTextColors[] = {
    { 255, 255, 32, 192 },  // DBCAMERA_TEXT_YELLOW
    { 255, 150, 128, 192 }, // DBCAMERA_TEXT_PEACH
    { 128, 96, 0, 64 },     // DBCAMERA_TEXT_BROWN
    { 192, 128, 16, 128 },  // DBCAMERA_TEXT_ORANGE
    { 255, 192, 32, 128 },  // DBCAMERA_TEXT_GOLD
    { 230, 230, 220, 64 },  // DBCAMERA_TEXT_WHITE
    { 128, 150, 255, 128 }, // DBCAMERA_TEXT_BLUE
    { 128, 255, 32, 128 },  // DBCAMERA_TEXT_GREEN
};
#endif

#ifdef ENABLE_REG_EDITOR
InputCombo sRegGroupInputCombos[REG_GROUPS] = {
    { REGS_EDITOR_REG_COMBO  }, //  REG
    { REGS_EDITOR_SREG_COMBO }, // SREG
    { REGS_EDITOR_OREG_COMBO }, // OREG
    { REGS_EDITOR_PREG_COMBO }, // PREG
    { REGS_EDITOR_QREG_COMBO }, // QREG
    { REGS_EDITOR_MREG_COMBO }, // MREG
    { REGS_EDITOR_YREG_COMBO }, // YREG
    { REGS_EDITOR_DREG_COMBO }, // DREG
    { REGS_EDITOR_UREG_COMBO }, // UREG
    { REGS_EDITOR_IREG_COMBO }, // IREG
    { REGS_EDITOR_ZREG_COMBO }, // ZREG
    { REGS_EDITOR_CREG_COMBO }, // CREG
    { REGS_EDITOR_NREG_COMBO }, // NREG
    { REGS_EDITOR_KREG_COMBO }, // KREG
    { REGS_EDITOR_XREG_COMBO }, // XREG
    { REGS_EDITOR_cREG_COMBO }, // cREG
    { REGS_EDITOR_sREG_COMBO }, // sREG
    { REGS_EDITOR_iREG_COMBO }, // iREG
    { REGS_EDITOR_WREG_COMBO }, // WREG
    { REGS_EDITOR_AREG_COMBO }, // AREG
    { REGS_EDITOR_VREG_COMBO }, // VREG
    { REGS_EDITOR_HREG_COMBO }, // HREG
    { REGS_EDITOR_GREG_COMBO }, // GREG
    { REGS_EDITOR_mREG_COMBO }, // mREG
    { REGS_EDITOR_nREG_COMBO }, // nREG
    { REGS_EDITOR_BREG_COMBO }, // BREG
    { REGS_EDITOR_dREG_COMBO }, // dREG
    { REGS_EDITOR_kREG_COMBO }, // kREG
    { REGS_EDITOR_bREG_COMBO }, // bREG
};

char sRegGroupChars[REG_GROUPS] = {
    ' ', //  REG
    'S', // SREG
    'O', // OREG
    'P', // PREG
    'Q', // QREG
    'M', // MREG
    'Y', // YREG
    'D', // DREG
    'U', // UREG
    'I', // IREG
    'Z', // ZREG
    'C', // CREG
    'N', // NREG
    'K', // KREG
    'X', // XREG
    'c', // cREG
    's', // sREG
    'i', // iREG
    'W', // WREG
    'A', // AREG
    'V', // VREG
    'H', // HREG
    'G', // GREG
    'm', // mREG
    'n', // nREG
    'B', // BREG
    'd', // dREG
    'k', // kREG
    'b', // bREG
};
#endif

void Regs_Init(void) {
    s32 i;

    gRegEditor = SystemArena_MallocDebug(sizeof(RegEditor), "../z_debug.c", 260);

#ifdef ENABLE_REG_EDITOR
    gRegEditor->regPage = 0;
    gRegEditor->regGroup = 0;
    gRegEditor->regCur = 0;
    gRegEditor->dPadInputPrev = 0;
    gRegEditor->inputRepeatTimer = 0;
#endif

    for (i = 0; i < ARRAY_COUNT(gRegEditor->data); i++) {
        gRegEditor->data[i] = 0;
    }
}

#ifdef ENABLE_NO_CLIP
// Function is stubbed. Name is assumed by similarities in signature to `DbCamera_ScreenTextColored` and usage.
void DbCamera_ScreenText(u8 x, u8 y, const char* text) {
}
#endif

#ifdef ENABLE_CAMERA_DEBUGGER
void DbCamera_ScreenTextColored(u8 x, u8 y, u8 colorIndex, const char* text) {
    DbCameraTextBufferEntry* entry = &sDbCameraTextBuffer[sDbCameraTextEntryCount];
    char* textDest;
    s16 charCount;

    if (sDbCameraTextEntryCount < ARRAY_COUNT(sDbCameraTextBuffer)) {
        entry->x = x;
        entry->y = y;
        entry->colorIndex = colorIndex;

        // Copy text into the entry, truncating if needed
        charCount = 0;
        textDest = entry->text;

        while ((*textDest++ = *text++) != '\0') {
            if (charCount++ > (ARRAY_COUNT(entry->text) - 1)) {
                break;
            }
        }

        *textDest = '\0';

        sDbCameraTextEntryCount++;
    }
}

void DbCamera_DrawScreenText(GfxPrint* printer) {
    s32 i;
    Color_RGBA8* color;
    DbCameraTextBufferEntry* entry;

    for (i = 0; i < sDbCameraTextEntryCount; i++) {
        entry = &sDbCameraTextBuffer[i];
        color = &sDbCameraTextColors[entry->colorIndex];

        GfxPrint_SetColor(printer, color->r, color->g, color->b, color->a);
        GfxPrint_SetPos(printer, entry->x, entry->y);
        GfxPrint_Printf(printer, "%s", entry->text);
    }
}
#endif

#ifdef ENABLE_REG_EDITOR
/**
 * Updates the state of the Reg Editor according to user input.
 * Also contains a controller rumble test that can be interfaced with via related REGs.
 */
void Regs_UpdateEditor(Input* input) {
    s32 dPadInputCur;
    s32 pageDataStart = ((gRegEditor->regGroup * REG_PAGES) + gRegEditor->regPage - 1) * REGS_PER_PAGE;
    s32 increment;
    s32 i;

    u16 incrementBy10;
    u16 incrementBy100;
    u16 incrementBy1000;

    dPadInputCur = input->cur.button & (BTN_DUP | BTN_DLEFT | BTN_DRIGHT | BTN_DDOWN);

    if (CHECK_BTN_ALL(input->cur.button, BTN_L) || CHECK_BTN_ALL(input->cur.button, BTN_R) ||
        CHECK_BTN_ALL(input->cur.button, BTN_START)) {

        for (i = 0; i < REG_GROUPS; i++) {
            if (CHECK_BTN_ALL(input->cur.button, sRegGroupInputCombos[i].hold) &&
                CHECK_BTN_ALL(input->press.button, sRegGroupInputCombos[i].press)) {
                break;
            }
        }

        // If a combo corresponding to a reg group was found
        if (i < REG_GROUPS) {
            if (i == gRegEditor->regGroup) {
                // Same reg group as current, advance page index
                gRegEditor->regPage = (gRegEditor->regPage + 1) % (REG_PAGES + 1);
            } else {
                gRegEditor->regGroup = i; // Switch current reg group
                gRegEditor->regPage = 0;  // Disable reg editor
            }
        }
    } else {
        switch (gRegEditor->regPage) {
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
                if (dPadInputCur == gRegEditor->dPadInputPrev) {
                    gRegEditor->inputRepeatTimer--;
                    if (gRegEditor->inputRepeatTimer < 0) {
                        gRegEditor->inputRepeatTimer = 1;
                    } else {
                        dPadInputCur ^= gRegEditor->dPadInputPrev;
                    }
                } else {
                    gRegEditor->inputRepeatTimer = 16;
                    gRegEditor->dPadInputPrev = dPadInputCur;
                }

                incrementBy1000 = CHECK_BTN_ALL(input->cur.button, REGS_EDITOR_INCDEC_1000)
                incrementBy100 = CHECK_BTN_ALL(input->cur.button, REGS_EDITOR_INCDEC_100)
                incrementBy10 = CHECK_BTN_ALL(input->cur.button, REGS_EDITOR_INCDEC_10)

                increment =
                    CHECK_BTN_ANY(dPadInputCur, BTN_DRIGHT)  ? (incrementBy1000     ? 1000
                                                                : incrementBy100    ? 100
                                                                : incrementBy10     ? 10
                                                                : 1)
                    : CHECK_BTN_ANY(dPadInputCur, BTN_DLEFT) ? (incrementBy1000     ? -1000
                                                                : incrementBy100    ? -100
                                                                : incrementBy10     ? -10
                                                                : -1)
                                                             : 0;

                gRegEditor->data[gRegEditor->regCur + pageDataStart] += increment;

                if (CHECK_BTN_ANY(dPadInputCur, BTN_DUP)) {
                    gRegEditor->regCur--;
                    if (gRegEditor->regCur < 0) {
                        gRegEditor->regCur = REGS_PER_PAGE - 1;
                    }
                } else if (CHECK_BTN_ANY(dPadInputCur, BTN_DDOWN)) {
                    gRegEditor->regCur++;
                    if (gRegEditor->regCur >= REGS_PER_PAGE) {
                        gRegEditor->regCur = 0;
                    }
                }

                if (iREG(0)) {
                    iREG(0) = 0;
                    Rumble_Request(0.0f, iREG(1), iREG(2), iREG(3));
                }

                break;

            default:
                break;
        }
    }
}

void Regs_DrawEditor(GfxPrint* printer) {
    s32 i;
    s32 pageStart = (gRegEditor->regPage - 1) * REGS_PER_PAGE;
    s32 pageDataStart = ((gRegEditor->regGroup * REG_PAGES) + gRegEditor->regPage - 1) * REGS_PER_PAGE;
    s32 pad;
    char regGroupName[3];

    regGroupName[0] = 'R';
    regGroupName[1] = sRegGroupChars[gRegEditor->regGroup];
    regGroupName[2] = '\0';

    GfxPrint_SetColor(printer, 0, 128, 128, 128);

    for (i = 0; i < REGS_PER_PAGE; i++) {
        if (i == gRegEditor->regCur) {
            GfxPrint_SetColor(printer, 0, 255, 255, 255);
        }

        GfxPrint_SetPos(printer, 3, i + 5);
        GfxPrint_Printf(printer, "%s%02d%6d", regGroupName, pageStart + i, gRegEditor->data[i + pageDataStart]);

        if (i == gRegEditor->regCur) {
            GfxPrint_SetColor(printer, 0, 128, 128, 128);
        }
    }
}
#endif

#if (defined ENABLE_CAMERA_DEBUGGER) || (defined ENABLE_REG_EDITOR)
/**
 * Draws the Reg Editor and Debug Camera text on screen
 */
void Debug_DrawText(GraphicsContext* gfxCtx) {
    Gfx* gfx;
    Gfx* opaStart;
    GfxPrint printer;
    s32 pad;

    OPEN_DISPS(gfxCtx, "../z_debug.c", 628);

    GfxPrint_Init(&printer);
    opaStart = POLY_OPA_DISP;
    gfx = Graph_GfxPlusOne(POLY_OPA_DISP);
    gSPDisplayList(OVERLAY_DISP++, gfx);
    GfxPrint_Open(&printer, gfx);

#ifdef ENABLE_CAMERA_DEBUGGER
    DbCamera_DrawScreenText(&printer);
#endif

#ifdef ENABLE_REG_EDITOR
    if (gRegEditor->regPage != 0) {
        Regs_DrawEditor(&printer);
    }
#endif

#ifdef ENABLE_CAMERA_DEBUGGER
    sDbCameraTextEntryCount = 0;
#endif

    gfx = GfxPrint_Close(&printer);
    gSPEndDisplayList(gfx++);
    Graph_BranchDlist(opaStart, gfx);
    POLY_OPA_DISP = gfx;

    if (1) {}

    CLOSE_DISPS(gfxCtx, "../z_debug.c", 664);

    GfxPrint_Destroy(&printer);
}
#endif
