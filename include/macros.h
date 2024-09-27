#ifndef MACROS_H
#define MACROS_H

#include "versions.h"

#ifndef AVOID_UB
#define BAD_RETURN(type) type
#else
#define BAD_RETURN(type) void
#endif

/**
 * The T macro holds translations in English for original debug strings written in Japanese.
 * The translated strings match the original debug strings, they are only direct translations.
 * For example, any original name is left as is rather than being replaced with the name in the codebase.
 */
#define T(jp, en) jp

#define ARRAY_COUNT(arr) (s32)(sizeof(arr) / sizeof(arr[0]))
#define ARRAY_COUNTU(arr) (u32)(sizeof(arr) / sizeof(arr[0]))

#define PHYSICAL_TO_VIRTUAL(addr) (void*)((uintptr_t)(addr) + 0x80000000)
#define VIRTUAL_TO_PHYSICAL(addr) (uintptr_t)((u8*)(addr) - 0x80000000)

#define ABS(x) ((x) >= 0 ? (x) : -(x))
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

// IDO doesn't support variadic macros, but it merely throws a warning for the
// number of arguments not matching the definition (warning 609) instead of
// throwing an error. We suppress this warning and rely on GCC to catch macro
// argument errors instead.
// Note some tools define __sgi but preprocess with a modern cpp implementation,
// ensure that these do not use the IDO workaround to avoid errors.
#define IDO_PRINTF_WORKAROUND (__sgi && !__GNUC__ && !M2CTX)

#if IS_DEBUG
#define PRINTF osSyncPrintf
#elif IDO_PRINTF_WORKAROUND
#define PRINTF(args) (void)0
#else
#define PRINTF(format, ...) (void)0
#endif

#if IS_DEBUG
#define LOG(exp, value, format, ...)                \
    do {                                            \
        LogUtils_LogThreadId(__FILE__, __LINE__);   \
        osSyncPrintf(exp " = " format "\n", value); \
    } while (0)
#else
#define LOG(exp, value, format, ...) (void)(value)
#endif

#define LOG_STRING(string, ...) LOG(#string, string, "%s", __VA_ARGS__)
#define LOG_ADDRESS(exp, value, ...) LOG(exp, value, "%08x", __VA_ARGS__)
#define LOG_TIME(exp, value, ...) LOG(exp, value, "%lld", __VA_ARGS__)
#define LOG_NUM(exp, value, ...) LOG(exp, value, "%d", __VA_ARGS__)
#define LOG_HEX(exp, value, ...) LOG(exp, value, "%x", __VA_ARGS__)
#define LOG_HEX32(exp, value, ...) LOG(exp, value, "%08x", __VA_ARGS__)
#define LOG_FLOAT(exp, value, ...) LOG(exp, value, "%f", __VA_ARGS__)

#define SET_NEXT_GAMESTATE(curState, newInit, newStruct) \
    do {                                                 \
        GameState* state = curState;                     \
                                                         \
        (state)->init = newInit;                         \
        (state)->size = sizeof(newStruct);               \
    } while (0)

#define SET_FULLSCREEN_VIEWPORT(view)      \
    {                                      \
        Viewport viewport;                 \
        viewport.bottomY = SCREEN_HEIGHT;  \
        viewport.rightX = SCREEN_WIDTH;    \
        viewport.topY = 0;                 \
        viewport.leftX = 0;                \
        View_SetViewport(view, &viewport); \
    }                                      \
    (void)0

#if IS_DEBUG

#define DMA_REQUEST_SYNC(ram, vrom, size, ...) DmaMgr_RequestSyncDebug(ram, vrom, size, __FILE__, __LINE__)
#define DMA_REQUEST_ASYNC(req, ram, vrom, size, unk5, queue, msg, ...) DmaMgr_RequestAsyncDebug(req, ram, vrom, size, unk5, queue, msg, __FILE__, __LINE__)
#define GAME_STATE_ALLOC(gameState, size, ...) GameState_Alloc(gameState, size, __FILE__, __LINE__)
#define DEBUG_ARENA_MALLOC(size, ...) DebugArena_MallocDebug(size, __FILE__, __LINE__)
#define DEBUG_ARENA_MALLOC_R(size, ...) DebugArena_MallocRDebug(size, __FILE__, __LINE__)
#define DEBUG_ARENA_FREE(size, ...) DebugArena_FreeDebug(size, __FILE__, __LINE__)
#define SYSTEM_ARENA_MALLOC(size, ...) SystemArena_MallocDebug(size, __FILE__, __LINE__)
#define SYSTEM_ARENA_MALLOC_R(size, ...) SystemArena_MallocRDebug(size, __FILE__, __LINE__)
#define SYSTEM_ARENA_FREE(size, ...) SystemArena_FreeDebug(size, __FILE__, __LINE__)
#define ZELDA_ARENA_MALLOC(size, ...) ZeldaArena_MallocDebug(size, __FILE__, __LINE__)
#define ZELDA_ARENA_MALLOC_R(size, ...) ZeldaArena_MallocRDebug(size, __FILE__, __LINE__)
#define ZELDA_ARENA_FREE(size, ...) ZeldaArena_FreeDebug(size, __FILE__, __LINE__)
#define LOG_UTILS_CHECK_NULL_POINTER(exp, ptr, ...) LogUtils_CheckNullPointer(exp, ptr, __FILE__, __LINE__)
#define LOG_UTILS_CHECK_VALID_POINTER(exp, ptr, ...) LogUtils_CheckValidPointer(exp, ptr, __FILE__, __LINE__)
#define GAME_ALLOC_MALLOC(alloc, size, ...) GameAlloc_MallocDebug(alloc, size, __FILE__, __LINE__)

#else

#define DMA_REQUEST_SYNC(ram, vrom, size, ...) DmaMgr_RequestSync(ram, vrom, size)
#define DMA_REQUEST_ASYNC(req, ram, vrom, size, unk5, queue, msg, ...) DmaMgr_RequestAsync(req, ram, vrom, size, unk5, queue, msg)
#define GAME_STATE_ALLOC(gameState, size, ...) THA_AllocTailAlign16(&(gameState)->tha, size)
#define DEBUG_ARENA_MALLOC(size, ...) DebugArena_Malloc(size)
#define DEBUG_ARENA_MALLOC_R(size, ...) DebugArena_MallocR(size)
#define DEBUG_ARENA_FREE(size, ...) DebugArena_Free(size)
#define SYSTEM_ARENA_MALLOC(size, ...) SystemArena_Malloc(size)
#define SYSTEM_ARENA_MALLOC_R(size, ...) SystemArena_MallocR(size)
#define SYSTEM_ARENA_FREE(size, ...) SystemArena_Free(size)
#define ZELDA_ARENA_MALLOC(size, ...) ZeldaArena_Malloc(size)
#define ZELDA_ARENA_MALLOC_R(size, ...) ZeldaArena_MallocR(size)
#define ZELDA_ARENA_FREE(size, ...) ZeldaArena_Free(size)
#define LOG_UTILS_CHECK_NULL_POINTER(exp, ptr, ...) (void)0
#define LOG_UTILS_CHECK_VALID_POINTER(exp, ptr, ...) (void)0
#define HUNGUP_AND_CRASH(...) LogUtils_HungupThread(__FILE__, __LINE__)
#define GAME_ALLOC_MALLOC(alloc, size, ...) GameAlloc_Malloc(alloc, size)

#endif /* IS_DEBUG */

#if PLATFORM_N64 || OOT_DEBUG
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

#if IS_DEBUG
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
