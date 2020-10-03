#include "global.h"

void osViSetXScale(f32 value) {
    register u32 nomValue;
    register u32 saveMask;

    saveMask = __osDisableInt();

    __osViNext->x.factor = value;

    __osViNext->state |= 0x2;

    nomValue = __osViNext->modep->comRegs.xScale & 0xfff;
    __osViNext->x.scale = (u32)(__osViNext->x.factor * nomValue) & 0xFFF;

    __osRestoreInt(saveMask);
}
