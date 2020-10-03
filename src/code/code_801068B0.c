#include "global.h"

// memcpy used in __osMalloc.c
void* func_801068B0(void* dst, void* src, size_t size) {
    u8* spC;
    u8* sp8;
    register s32 a3;

    spC = dst;
    sp8 = src;

    if (spC == sp8) {
        return dst;
    }
    if (spC < sp8) {
        for (a3 = size--; a3 != 0; a3 = size--) {
            *spC++ = *sp8++;
        }
    } else {
        spC += size - 1;
        sp8 += size - 1;
        for (a3 = size--; a3 != 0; a3 = size--) {
            *spC-- = *sp8--;
        }
    }
    return dst;
}
