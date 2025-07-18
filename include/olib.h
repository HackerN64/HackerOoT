#ifndef OLIB_H
#define OLIB_H

#include "z_math.h"

// To be used with OLib_Vec3fAdd()
typedef enum {
    /* 0 */ OLIB_ADD_COPY, // Copy `b` to dest
    /* 1 */ OLIB_ADD_OFFSET, // Add `a` and `b` to dest, and also add the yaw of `a` to the dest
    /* 2 */ OLIB_ADD // Add `a` and `b` to dest
} OlibVec3fAdd;

typedef enum {
    /* 0 */ OLIB_DIFF_COPY, // Copy `b` to dest
    /* 1 */ OLIB_DIFF_OFFSET, // Sub `a` and `b` to dest, and also subs the yaw of `a` to the dest
    /* 2 */ OLIB_DIFF // Sub `a` and `b` to dest
} OlibVec3fDiff;

f32 OLib_Vec3fDist(Vec3f* a, Vec3f* b);
f32 OLib_Vec3fDistXZ(Vec3f* a, Vec3f* b);
f32 OLib_ClampMinDist(f32 val, f32 min);
f32 OLib_ClampMaxDist(f32 val, f32 max);
Vec3f OLib_Vec3fDistNormalize(Vec3f* a, Vec3f* b);
Vec3f OLib_VecGeoToVec3f(VecGeo* geo);
VecSph OLib_Vec3fToVecSph(Vec3f* vec);
VecGeo OLib_Vec3fToVecGeo(Vec3f* vec);
VecGeo OLib_Vec3fDiffToVecGeo(Vec3f* a, Vec3f* b);
Vec3f OLib_Vec3fDiffRad(Vec3f* a, Vec3f* b);

Vec3f OLib_AddVecGeoToVec3f(Vec3f* a, VecGeo* geo);
void OLib_Vec3fDiff(PosRot* a, Vec3f* b, Vec3f* dest, s16 mode);
void OLib_Vec3fAdd(PosRot* a, Vec3f* b, Vec3f* dest, s16 mode);

#endif
