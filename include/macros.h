#ifndef MACROS_H
#define MACROS_H

#include "versions.h"

#define SCREEN_WIDTH  320
#define SCREEN_HEIGHT 240

#ifndef AVOID_UB
#define BAD_RETURN(type) type
#else
#define BAD_RETURN(type) void
#endif

#define ARRAY_COUNT(arr) (s32)(sizeof(arr) / sizeof(arr[0]))
#define ARRAY_COUNTU(arr) (u32)(sizeof(arr) / sizeof(arr[0]))
#define ARRAY_COUNT_2D(arr) (s32)(sizeof(arr) / sizeof(arr[0][0]))

#define PHYSICAL_TO_VIRTUAL(addr) (void*)((uintptr_t)(addr) + 0x80000000)
#define VIRTUAL_TO_PHYSICAL(addr) (uintptr_t)((u8*)(addr) - 0x80000000)

#define ABS(x) ((x) >= 0 ? (x) : -(x))
#define ABS_ALT(x) ((x) < 0 ? -(x) : (x))
#define DECR(x) ((x) == 0 ? 0 : --(x))
#define CLAMP(x, min, max) ((x) < (min) ? (min) : (x) > (max) ? (max) : (x))
#define CLAMP_MAX(x, max) ((x) > (max) ? (max) : (x))
#define CLAMP_MIN(x, min) ((x) < (min) ? (min) : (x))

#define SWAP(type, a, b)    \
    {                       \
        type _temp = (a);   \
        (a) = (b);          \
        (b) = _temp;        \
    }                       \
    (void)0

#define RGBA8(r, g, b, a) ((((r) & 0xFF) << 24) | (((g) & 0xFF) << 16) | (((b) & 0xFF) << 8) | (((a) & 0xFF) << 0))

#define CHECK_FLAG_ALL(flags, mask) (((flags) & (mask)) == (mask))

#if PLATFORM_N64 || DEBUG_FEATURES
#define HUNGUP_AND_CRASH(...) Fault_AddHungupAndCrash(__FILE__, __LINE__)
#else
#define HUNGUP_AND_CRASH(...) LogUtils_HungupThread(__FILE__, __LINE__)
#endif

#define MATRIX_FINALIZE_AND_LOAD(pkt, gfxCtx, file, line) \
    gSPMatrix(pkt, MATRIX_FINALIZE(gfxCtx, file, line), G_MTX_NOPUSH | G_MTX_LOAD | G_MTX_MODELVIEW)

#if OOT_NTSC
#define LANGUAGE_ARRAY(jpn, eng, ger, fra) { jpn, eng }
#else
#define LANGUAGE_ARRAY(jpn, eng, ger, fra) { eng, ger, fra }
#endif

/**
 * `x` vertex x
 * `y` vertex y
 * `z` vertex z
 * `s` texture s coordinate
 * `t` texture t coordinate
 * `crnx` red component of color vertex, or x component of normal vertex
 * `cgny` green component of color vertex, or y component of normal vertex
 * `cbnz` blue component of color vertex, or z component of normal vertex
 * `a` alpha
 */
#define VTX(x,y,z,s,t,crnx,cgny,cbnz,a) { { { x, y, z }, 0, { s, t }, { crnx, cgny, cbnz, a } } }

#define VTX_T(x,y,z,s,t,cr,cg,cb,a) { { x, y, z }, 0, { s, t }, { cr, cg, cb, a } }

#define gDPSetTileCustom(pkt, fmt, siz, uls, ult, lrs, lrt, pal,        \
                         cms, cmt, masks, maskt, shifts, shiftt)        \
_DW({                                                                   \
    gDPPipeSync(pkt);                                                   \
    gDPTileSync(pkt);                                                   \
    gDPSetTile(pkt, fmt, siz,                                           \
        (((((lrs) - (uls) + 1) * siz##_TILE_BYTES) + 7) >> 3), 0,       \
        G_TX_LOADTILE, 0, cmt, maskt, shiftt, cms, masks,               \
        shifts);                                                        \
    gDPTileSync(pkt);                                                   \
    gDPSetTile(pkt, fmt, siz,                                           \
        (((((lrs) - (uls) + 1) * siz##_LINE_BYTES) + 7) >> 3), 0,       \
        G_TX_RENDERTILE, pal, cmt, maskt, shiftt, cms, masks, shifts);  \
    gDPSetTileSize(pkt, G_TX_RENDERTILE,                                \
        (uls) << G_TEXTURE_IMAGE_FRAC,                                  \
        (ult) << G_TEXTURE_IMAGE_FRAC,                                  \
        (lrs) << G_TEXTURE_IMAGE_FRAC,                                  \
        (lrt) << G_TEXTURE_IMAGE_FRAC);                                 \
})

#endif

// HackerOoT

#if DEBUG_FEATURES
// if using button combo check for the input, else simply return true
#define DEBUG_BTN_COMBO(useCombo, btnToHold, btnToPress, input) ((useCombo ? CHECK_BTN_ALL(input->cur.button, btnToHold) : true) && CHECK_BTN_ALL(input->press.button, btnToPress))
#else
#define DEBUG_BTN_COMBO(useCombo, btnToHold, btnToPress, input) true
#endif

#define IS_DEBUG_CAM_ENABLED (IS_CAMERA_DEBUG_ENABLED ? gDebugCamEnabled : false)

#define IS_IN_RANGE(val, min, max) ((val >= min) && (val <= max))
#define TIMER_DECR(val, target, changeBy) (((val - changeBy) < target) ? target : (val > target) ? (val - changeBy) : val)
#define TIMER_INCR(val, target, changeBy) (((val + changeBy) > target) ? target : (val < target) ? (val + changeBy) : val)

// System for inserting SPDontSkipTexLoadsAcross for actors/effects which
// manipulate segments to select texture indices. Note that this only needs to
// be done for things which have a single material and which can appear multiple
// times consecutively in the scene, such as Rupees and effects.
#if ENABLE_F3DEX3

// It might seem that we'd need to ensure this is reset every frame. But we
// actually only care about when this changes within a frame, as the texture
// loads would only ever be skipped between two or more rupees drawn
// consecutively. This is s32 so it can hold an actual texture pointer in case
// an "index" is not available.
#define IF_F3DEX3_DONT_SKIP_TEX_INIT() \
    static s32 _lastTexIndex = -1; \
    (void)0

// If we have consecutive items rendering with different textures, F3DEX3's
// optimizer will incorrectly believe the texture loads can be skipped, so this
// command tells it not to skip them. However, if the texture really is the same
// as last time, then we can let the optimizer skip the load.
#define IF_F3DEX3_DONT_SKIP_TEX_HERE(pkt, texIndex) \
    if ((s32)(texIndex) != _lastTexIndex) { \
        gSPDontSkipTexLoadsAcross(pkt); \
        _lastTexIndex = (s32)(texIndex); \
    } \
    (void)0

// In some cases we are sure things are rendered consecutively with different
// textures, e.g. in Fire Temple fire objects.
#define IF_F3DEX3_ALWAYS_DONT_SKIP_TEX(pkt) \
    gSPDontSkipTexLoadsAcross(pkt)

#else
#define IF_F3DEX3_DONT_SKIP_TEX_INIT() (void)0
#define IF_F3DEX3_DONT_SKIP_TEX_HERE(pkt, texIndex) (void)0
#define IF_F3DEX3_ALWAYS_DONT_SKIP_TEX(pkt) (void)0
#endif

#define STRINGIFY(s) #s
#define EXPAND_AND_STRINGIFY(s) STRINGIFY(s)
