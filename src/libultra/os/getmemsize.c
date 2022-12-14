#include "global.h"

#define STEP 0x100000

u32 osGetMemSize(void) {
    volatile u32* ptr;
    u32 size = 0x400000;
    u32 data0;
    u32 data1;

    while (size < 0x800000) {
        ptr = OS_PHYSICAL_TO_K1(size);

        data0 = *ptr;
        data1 = ptr[STEP / 4 - 1];

        *ptr ^= ~0;
        ptr[STEP / 4 - 1] ^= ~0;

        if ((*ptr != (data0 ^ ~0)) || (ptr[STEP / 4 - 1] != (data1 ^ ~0))) {
            return size;
        }

        *ptr = data0;
        ptr[STEP / 4 - 1] = data1;

        size += STEP;
    }

    return size;
}
