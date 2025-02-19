#include "fault.h"
#include "ultra64.h"
#include "segment_symbols.h"

#if !ENABLE_F3DEX3
u64* sDefaultGSPUCodeText = gspF3DZEX2_NoN_PosLight_fifoTextStart;
u64* sDefaultGSPUCodeData = gspF3DZEX2_NoN_PosLight_fifoDataStart;
#endif

u64* SysUcode_GetUCodeBoot(void) {
    return rspbootTextStart;
}

size_t SysUcode_GetUCodeBootSize(void) {
    return (size_t)((u8*)rspbootTextEnd - (u8*)rspbootTextStart);
}

#if ENABLE_F3DEX3

DECLARE_ROM_SEGMENT(F3DEX3_BrW_Text)
DECLARE_ROM_SEGMENT(F3DEX3_BrW_Data)
DECLARE_ROM_SEGMENT(F3DEX3_BrW_PA_Text)
DECLARE_ROM_SEGMENT(F3DEX3_BrW_PA_Data)
DECLARE_ROM_SEGMENT(F3DEX3_BrW_PB_Text)
DECLARE_ROM_SEGMENT(F3DEX3_BrW_PB_Data)
DECLARE_ROM_SEGMENT(F3DEX3_BrW_PC_Text)
DECLARE_ROM_SEGMENT(F3DEX3_BrW_PC_Data)
DECLARE_ROM_SEGMENT(F3DEX3_BrW_NOC_Text)
DECLARE_ROM_SEGMENT(F3DEX3_BrW_NOC_Data)
DECLARE_ROM_SEGMENT(F3DEX3_BrW_NOC_PA_Text)
DECLARE_ROM_SEGMENT(F3DEX3_BrW_NOC_PA_Data)
DECLARE_ROM_SEGMENT(F3DEX3_BrW_NOC_PB_Text)
DECLARE_ROM_SEGMENT(F3DEX3_BrW_NOC_PB_Data)
DECLARE_ROM_SEGMENT(F3DEX3_BrW_NOC_PC_Text)
DECLARE_ROM_SEGMENT(F3DEX3_BrW_NOC_PC_Data)

static const u8* const sF3DEX3TextRomStartAddrs[8] = {
    _F3DEX3_BrW_TextSegmentRomStart,        _F3DEX3_BrW_PA_TextSegmentRomStart,
    _F3DEX3_BrW_PB_TextSegmentRomStart,     _F3DEX3_BrW_PC_TextSegmentRomStart,
    _F3DEX3_BrW_NOC_TextSegmentRomStart,    _F3DEX3_BrW_NOC_PA_TextSegmentRomStart,
    _F3DEX3_BrW_NOC_PB_TextSegmentRomStart, _F3DEX3_BrW_NOC_PC_TextSegmentRomStart,
};
static const u8* const sF3DEX3TextRomEndAddrs[8] = {
    _F3DEX3_BrW_TextSegmentRomEnd,        _F3DEX3_BrW_PA_TextSegmentRomEnd,     _F3DEX3_BrW_PB_TextSegmentRomEnd,
    _F3DEX3_BrW_PC_TextSegmentRomEnd,     _F3DEX3_BrW_NOC_TextSegmentRomEnd,    _F3DEX3_BrW_NOC_PA_TextSegmentRomEnd,
    _F3DEX3_BrW_NOC_PB_TextSegmentRomEnd, _F3DEX3_BrW_NOC_PC_TextSegmentRomEnd,
};
static const u8* const sF3DEX3DataRomStartAddrs[8] = {
    _F3DEX3_BrW_DataSegmentRomStart,        _F3DEX3_BrW_PA_DataSegmentRomStart,
    _F3DEX3_BrW_PB_DataSegmentRomStart,     _F3DEX3_BrW_PC_DataSegmentRomStart,
    _F3DEX3_BrW_NOC_DataSegmentRomStart,    _F3DEX3_BrW_NOC_PA_DataSegmentRomStart,
    _F3DEX3_BrW_NOC_PB_DataSegmentRomStart, _F3DEX3_BrW_NOC_PC_DataSegmentRomStart,
};
static const u8* const sF3DEX3DataRomEndAddrs[8] = {
    _F3DEX3_BrW_DataSegmentRomEnd,        _F3DEX3_BrW_PA_DataSegmentRomEnd,     _F3DEX3_BrW_PB_DataSegmentRomEnd,
    _F3DEX3_BrW_PC_DataSegmentRomEnd,     _F3DEX3_BrW_NOC_DataSegmentRomEnd,    _F3DEX3_BrW_NOC_PA_DataSegmentRomEnd,
    _F3DEX3_BrW_NOC_PB_DataSegmentRomEnd, _F3DEX3_BrW_NOC_PC_DataSegmentRomEnd,
};

/* These can't be automatically determined from the files, because that is only
known at link time, whereas these sizes have to be known at compile time. */
#define F3DEX3_TEXT_MAX_SIZE 6400 /* currently 6152 bytes */
#define F3DEX3_DATA_MAX_SIZE 768  /* currently  728 bytes */

__attribute__((aligned(16))) u8 gF3DEX3TextBuffer[F3DEX3_TEXT_MAX_SIZE];
__attribute__((aligned(16))) u8 gF3DEX3DataBuffer[F3DEX3_DATA_MAX_SIZE];

volatile s8 gLoadedF3DEX3Version = -1;
volatile s8 gF3DEX3ProfVersion = 0;
volatile s8 gF3DEX3NOCVersion = 1;
s8 gF3DEX3OccMode = F3DEX3_OCC_MODE_AUTO;

void SysUcode_LoadNewUcodeIfChanged() {
    if (gF3DEX3OccMode == F3DEX3_OCC_MODE_ALWAYS) {
        gF3DEX3NOCVersion = 0;
    } else if (gF3DEX3OccMode == F3DEX3_OCC_MODE_NEVER) {
        gF3DEX3NOCVersion = 1;
    } // else if AUTO, controlled by occlusion planes system
    s8 ver = gF3DEX3ProfVersion | (gF3DEX3NOCVersion << 2);
    if (gLoadedF3DEX3Version == ver) {
        return;
    }
    ver &= 7; // make sure valid

    const u8* textVrom = sF3DEX3TextRomStartAddrs[ver];
    u32 textSize = sF3DEX3TextRomEndAddrs[ver] - textVrom;
    const u8* dataVrom = sF3DEX3DataRomStartAddrs[ver];
    u32 dataSize = sF3DEX3DataRomEndAddrs[ver] - dataVrom;
    if (textSize > F3DEX3_TEXT_MAX_SIZE) {
        Fault_AddHungupAndCrash("ucode_text_too_big", __LINE__);
        return;
    }
    if (dataSize > F3DEX3_DATA_MAX_SIZE) {
        Fault_AddHungupAndCrash("ucode_data_too_big", __LINE__);
        return;
    }
    DMA_REQUEST_SYNC(gF3DEX3TextBuffer, (u32)textVrom, textSize, "sys_ucode.c", __LINE__);
    DMA_REQUEST_SYNC(gF3DEX3DataBuffer, (u32)dataVrom, dataSize, "sys_ucode.c", __LINE__);

    gLoadedF3DEX3Version = ver;
}

#endif

u64* SysUcode_GetUCode(void) {
#if ENABLE_F3DEX3
    return (u64*)gF3DEX3TextBuffer;
#else
    return sDefaultGSPUCodeText;
#endif
}

u64* SysUcode_GetUCodeData(void) {
#if ENABLE_F3DEX3
    return (u64*)gF3DEX3DataBuffer;
#else
    return sDefaultGSPUCodeData;
#endif
}
