#ifndef F3DEX3_H
#define F3DEX3_H

#include "config.h"
#include "ultra64.h"

#if ENABLE_F3DEX3

extern u8 gF3DEX3TextBuffer[];
extern volatile s8 gLoadedF3DEX3Version;
extern volatile s8 gF3DEX3ProfVersion;
extern volatile s8 gF3DEX3NOCVersion;
extern s8 gF3DEX3OccMode;
extern u8 gUseMemsetForZBuffer;

#endif

#endif
