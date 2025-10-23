#ifndef LIBC64_MATH64_H
#define LIBC64_MATH64_H

#include "ultra64.h"

static inline f32 Math_FTanF(f32 angle) {
    f32 sin = sinf(angle);
    f32 cos = cosf(angle);

    return sin / cos;
}

static inline f32 Math_FFloorF(f32 x) {
    return floorf(x);
}

static inline f32 Math_FCeilF(f32 x) {
    return ceilf(x);
}

static inline f32 Math_FRoundF(f32 x) {
    return roundf(x);
}

static inline f32 Math_FTruncF(f32 x) {
    return truncf(x);
}

static inline f32 Math_FNearbyIntF(f32 x) {
    return nearbyintf(x);
}

f32 Math_FAtanF(f32 x);
f32 Math_FAtan2F(f32 y, f32 x);
f32 Math_FAsinF(f32 x);
static inline f32 Math_FAcosF(f32 x) {
    return M_PI / 2 - Math_FAsinF(x);
}
#endif
