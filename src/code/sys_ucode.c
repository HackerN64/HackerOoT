#include "global.h"

u64* sDefaultGSPUCodeText = gspF3DZEX2_NoN_PosLight_fifoTextStart;
u64* sDefaultGSPUCodeData = gspF3DZEX2_NoN_PosLight_fifoDataStart;

u64* SysUcode_GetUCodeBoot(void) {
    return rspbootTextStart;
}

size_t SysUcode_GetUCodeBootSize(void) {
    return (size_t)((u8*)rspbootTextEnd - (u8*)rspbootTextStart);
}

#if ENABLE_HACKER_DEBUG && ENABLE_F3DEX3
static u64* const gF3DEX3TextStarts[16] = {
    (u64*)gF3DEX3_BrW_TextStart,
    (u64*)gF3DEX3_BrW_PA_TextStart,
    (u64*)gF3DEX3_BrW_PB_TextStart,
    (u64*)gF3DEX3_BrW_PC_TextStart,
    // (u64*)gF3DEX3_BrW_NOC_TextStart,
    // (u64*)gF3DEX3_BrW_NOC_PA_TextStart,
    // (u64*)gF3DEX3_BrW_NOC_PB_TextStart,
    // (u64*)gF3DEX3_BrW_NOC_PC_TextStart,
    // (u64*)gF3DEX3_BrW_LVP_TextStart,
    // (u64*)gF3DEX3_BrW_LVP_PA_TextStart,
    // (u64*)gF3DEX3_BrW_LVP_PB_TextStart,
    // (u64*)gF3DEX3_BrW_LVP_PC_TextStart,
    // (u64*)gF3DEX3_BrW_LVP_NOC_TextStart,
    // (u64*)gF3DEX3_BrW_LVP_NOC_PA_TextStart,
    // (u64*)gF3DEX3_BrW_LVP_NOC_PB_TextStart,
    // (u64*)gF3DEX3_BrW_LVP_NOC_PC_TextStart,
};

static u64* const gF3DEX3DataStarts[16] = {
    (u64*)gF3DEX3_BrW_DataStart,
    (u64*)gF3DEX3_BrW_PA_DataStart,
    (u64*)gF3DEX3_BrW_PB_DataStart,
    (u64*)gF3DEX3_BrW_PC_DataStart,
    // (u64*)gF3DEX3_BrW_NOC_DataStart,
    // (u64*)gF3DEX3_BrW_NOC_PA_DataStart,
    // (u64*)gF3DEX3_BrW_NOC_PB_DataStart,
    // (u64*)gF3DEX3_BrW_NOC_PC_DataStart,
    // (u64*)gF3DEX3_BrW_LVP_DataStart,
    // (u64*)gF3DEX3_BrW_LVP_PA_DataStart,
    // (u64*)gF3DEX3_BrW_LVP_PB_DataStart,
    // (u64*)gF3DEX3_BrW_LVP_PC_DataStart,
    // (u64*)gF3DEX3_BrW_LVP_NOC_DataStart,
    // (u64*)gF3DEX3_BrW_LVP_NOC_PA_DataStart,
    // (u64*)gF3DEX3_BrW_LVP_NOC_PB_DataStart,
    // (u64*)gF3DEX3_BrW_LVP_NOC_PC_DataStart,
};

static u64* const gF3DEX3DataEnds[16] = {
    (u64*)gF3DEX3_BrW_DataEnd,
    (u64*)gF3DEX3_BrW_PA_DataEnd,
    (u64*)gF3DEX3_BrW_PB_DataEnd,
    (u64*)gF3DEX3_BrW_PC_DataEnd,
    // (u64*)gF3DEX3_BrW_NOC_DataEnd,
    // (u64*)gF3DEX3_BrW_NOC_PA_DataEnd,
    // (u64*)gF3DEX3_BrW_NOC_PB_DataEnd,
    // (u64*)gF3DEX3_BrW_NOC_PC_DataEnd,
    // (u64*)gF3DEX3_BrW_LVP_DataEnd,
    // (u64*)gF3DEX3_BrW_LVP_PA_DataEnd,
    // (u64*)gF3DEX3_BrW_LVP_PB_DataEnd,
    // (u64*)gF3DEX3_BrW_LVP_PC_DataEnd,
    // (u64*)gF3DEX3_BrW_LVP_NOC_DataEnd,
    // (u64*)gF3DEX3_BrW_LVP_NOC_PA_DataEnd,
    // (u64*)gF3DEX3_BrW_LVP_NOC_PB_DataEnd,
    // (u64*)gF3DEX3_BrW_LVP_NOC_PC_DataEnd,
};

const char* const gF3DEX3VersionNames[] = {
    "base",
    "PA",
    "PB",
    "PC",
    // "NOC",
    // "NOC_PA",
    // "NOC_PB",
    // "NOC_PC",
    // "LVP",
    // "LVP_PA",
    // "LVP_PB",
    // "LVP_PC",
    // "LVP_NOC",
    // "LVP_NOC_PA",
    // "LVP_NOC_PB",
    // "LVP_NOC_PC",
};

// u8 runF3DEX3Version = 0;

u64* SysUcode_GetUCode(void) {
    return gF3DEX3TextStarts[gProfiler.mode & 3]; // & 0xF];
}

u64* SysUcode_GetUCodeData(void) {
    return gF3DEX3DataStarts[gProfiler.mode & 3]; // & 0xF];
}

size_t SysUcode_GetUCodeDataSize() {
    s32 v = gProfiler.mode & 3; // & 0xF;
    return (size_t)((u8*)(gF3DEX3DataEnds[v]) - (u8*)(gF3DEX3DataStarts[v]));
}
#else

u64* SysUcode_GetUCode(void) {
    return sDefaultGSPUCodeText;
}

u64* SysUcode_GetUCodeData(void) {
    return sDefaultGSPUCodeData;
}
#endif
