#ifndef Z64MATH_H
#define Z64MATH_H

#include "ultra64.h"

#define VEC_SET(V,X,Y,Z) (V).x=(X);(V).y=(Y);(V).z=(Z)

typedef struct {
    f32 x, y;
} Vec2f; // size = 0x08

typedef struct {
    f32 x, y, z;
} Vec3f; // size = 0x0C

typedef struct {
    u16 x, y, z;
} Vec3us; // size = 0x06

typedef struct {
    s16 x, y, z;
} Vec3s; // size = 0x06

typedef struct {
    s32 x, y, z;
} Vec3i; // size = 0x0C

typedef struct {
    Vec3s center;
    s16 radius;
} Sphere16; // size = 0x08

typedef struct {
    Vec3f center;
    f32 radius;
} Spheref; // size = 0x10

typedef struct {
    Vec3f normal;
    f32 originDist;
} Plane; // size = 0x10

typedef struct {
    Vec3f vtx[3];
    Plane plane;
} TriNorm; // size = 0x34

typedef struct {
    /* 0x0000 */ s16 radius;
    /* 0x0002 */ s16 height;
    /* 0x0004 */ s16 yShift;
    /* 0x0006 */ Vec3s pos;
} Cylinder16; // size = 0x0C

typedef struct {
    /* 0x00 */ f32 radius;
    /* 0x04 */ f32 height;
    /* 0x08 */ f32 yShift;
    /* 0x0C */ Vec3f pos;
} Cylinderf; // size = 0x18

typedef struct {
    /* 0x0000 */ Vec3f point;
    /* 0x000C */ Vec3f dir;
} InfiniteLine; // size = 0x18

typedef struct {
    /* 0x0000 */ Vec3f a;
    /* 0x000C */ Vec3f b;
} Linef; // size = 0x18

typedef struct {
    /* 0x0 */ f32 r; // radius
    /* 0x4 */ s16 pitch; // depends on coordinate system. See below.
    /* 0x6 */ s16 yaw; // azimuthal angle
} VecSphGeo; // size = 0x8

// Defines a point in the spherical coordinate system.
// Pitch is 0 along the positive y-axis (up)
typedef VecSphGeo VecSph;

// Defines a point in the geographic coordinate system.
// Pitch is 0 along the xz-plane (horizon)
typedef VecSphGeo VecGeo;

#define LERP(x, y, scale) (((y) - (x)) * (scale) + (x))
#define LERP32(x, y, scale) ((s32)(((y) - (x)) * (scale)) + (x))
#define LERP16(x, y, scale) ((s16)(((y) - (x)) * (scale)) + (x))
#define F32_LERP(v0,v1,t) ((v0) * (1.0f - (t)) + (v1) * (t))
#define F32_LERPIMP(v0, v1, t) (v0 + ((v1 - v0) * t))
#define F32_LERPIMPINV(v0, v1, t) ((v0) + (((v1) - (v0)) / (t)))
#define BINANG_LERPIMP(v0, v1, t) ((v0) + (s16)((s16)((v1) - (v0)) * (t)))
#define BINANG_LERPIMPINV(v0, v1, t) ((v0) + (s16)((v1) - (v0)) / (t))

#define VEC3F_LERPIMPDST(dst, v0, v1, t){ \
    (dst)->x = (v0)->x + (((v1)->x - (v0)->x) * t); \
    (dst)->y = (v0)->y + (((v1)->y - (v0)->y) * t); \
    (dst)->z = (v0)->z + (((v1)->z - (v0)->z) * t); \
}

#define IS_ZERO(f) (fabsf(f) < 0.008f)

// Casting a float to an integer, when the float value is larger than what the integer type can hold,
// leads to undefined behavior. For example (f32)0x8000 doesn't fit in a s16, so it cannot be cast to s16.
// This isn't an issue with IDO, but is one with for example GCC.
// A partial workaround is to cast to s32 then s16, hoping all binang values used will fit a s32.
#define TRUNCF_BINANG(f) (s16)(s32)(f)

// Angle conversion macros
#define DEG_TO_BINANG(degrees) (s16)TRUNCF_BINANG((degrees) * (0x8000 / 180.0f))
#define RAD_TO_BINANG(radians) (s16)TRUNCF_BINANG((radians) * (0x8000 / M_PI))
#define RAD_TO_DEG(radians) ((radians) * (180.0f / M_PI))
#define DEG_TO_RAD(degrees) ((degrees) * (M_PI / 180.0f))
#define BINANG_TO_DEG(binang) ((f32)(binang) * (180.0f / 0x8000))
#define BINANG_TO_RAD(binang) ((f32)(binang) * (M_PI / 0x8000))
#define BINANG_TO_RAD_ALT(binang) (((f32)(binang) / (f32)0x8000) * M_PI)
#define BINANG_TO_RAD_ALT2(binang) (((f32)(binang) * M_PI) / 0x8000)

// Vector macros
#define SQXZ(vec) ((vec).x * (vec).x + (vec).z * (vec).z)
#define DOTXZ(vec1, vec2) ((vec1).x * (vec2).x + (vec1).z * (vec2).z)
#define SQXYZ(vec) ((vec).x * (vec).x + (vec).y * (vec).y + (vec).z * (vec).z)
#define DOTXYZ(vec1, vec2) ((vec1).x * (vec2).x + (vec1).y * (vec2).y + (vec1).z * (vec2).z)

#endif
