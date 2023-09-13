#include "ultra64.h"
#include "functions.h"

#include "config.h"
#ifndef DISABLE_SIN_COS_LOOKUP_TABLE
#include "sintable.inc.c"
#endif
/**
 * @param angle binang
 * @return sin(angle)*0x7FFF
 */
s16 sins(u16 angle) {
#ifdef DISABLE_SIN_COS_LOOKUP_TABLE
    return Math_SinS(TRUNCF_BINANG((s16)angle))*0x7FFF;
#else
    s16 value;

    angle >>= 4;

    if (angle & 0x400) {
        value = sintable[0x3FF - (angle & 0x3FF)];
    } else {
        value = sintable[angle & 0x3FF];
    }

    if (angle & 0x800) {
        return -value;
    } else {
        return value;
    }
#endif
}
