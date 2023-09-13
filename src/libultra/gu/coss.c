#include "global.h"
#include "functions.h"

#include "config.h"
/**
 * @param angle binang
 * @return cos(angle)*0x7FFF
 */
s16 coss(u16 angle) {
#ifdef DISABLE_SIN_COS_LOOKUP_TABLE
    return Math_CosS(TRUNCF_BINANG((s16)angle))*0x7FFF;
#else
    return sins(angle + 0x4000);
#endif
}
