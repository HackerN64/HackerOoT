#ifndef MACROS_H
#define MACROS_H

#ifndef AVOID_UB
#define BAD_RETURN(type) type
#else
#define BAD_RETURN(type) void
#endif

#define ARRAY_COUNT(arr) (s32)(sizeof(arr) / sizeof(arr[0]))
#define ARRAY_COUNTU(arr) (u32)(sizeof(arr) / sizeof(arr[0]))

#define PHYSICAL_TO_VIRTUAL(addr) (void*)((uintptr_t)(addr) + 0x80000000)
#define VIRTUAL_TO_PHYSICAL(addr) (uintptr_t)((u8*)(addr) - 0x80000000)
#define SEGMENTED_TO_VIRTUAL(addr) PHYSICAL_TO_VIRTUAL(gSegments[SEGMENT_NUMBER(addr)] + SEGMENT_OFFSET(addr))

#define SQ(x) ((x)*(x))
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

#define GET_PLAYER(play) ((Player*)(play)->actorCtx.actorLists[ACTORCAT_PLAYER].head)

#define GET_ACTIVE_CAM(play) ((play)->cameraPtrs[(play)->activeCamId])

#define LINK_IS_ADULT (gSaveContext.save.linkAge == LINK_AGE_ADULT)
#define LINK_IS_CHILD (gSaveContext.save.linkAge == LINK_AGE_CHILD)

#define YEARS_CHILD 5
#define YEARS_ADULT 17
#define LINK_AGE_IN_YEARS (!LINK_IS_ADULT ? YEARS_CHILD : YEARS_ADULT)

#define CLOCK_TIME(hr, min) ((s32)(((hr) * 60 + (min)) * (f32)0x10000 / (24 * 60) + 0.5f))

#define IS_DAY (gSaveContext.save.nightFlag == 0)
#define IS_NIGHT (gSaveContext.save.nightFlag == 1)

#define SLOT(item) gItemSlots[item]
#define INV_CONTENT(item) gSaveContext.save.info.inventory.items[SLOT(item)]
#define AMMO(item) gSaveContext.save.info.inventory.ammo[SLOT(item)]
#define BEANS_BOUGHT AMMO(ITEM_MAGIC_BEAN + 1)

#define ALL_EQUIP_VALUE(equip) ((s32)(gSaveContext.save.info.inventory.equipment & gEquipMasks[equip]) >> gEquipShifts[equip])
#define CUR_EQUIP_VALUE(equip) ((s32)(gSaveContext.save.info.equips.equipment & gEquipMasks[equip]) >> gEquipShifts[equip])
#define OWNED_EQUIP_FLAG(equip, value) (gBitFlags[value] << gEquipShifts[equip])
#define OWNED_EQUIP_FLAG_ALT(equip, value) ((1 << (value)) << gEquipShifts[equip])
#define CHECK_OWNED_EQUIP(equip, value) (OWNED_EQUIP_FLAG(equip, value) & gSaveContext.save.info.inventory.equipment)
#define CHECK_OWNED_EQUIP_ALT(equip, value) (gBitFlags[(value) + (equip) * 4] & gSaveContext.save.info.inventory.equipment)

#define SWORD_EQUIP_TO_PLAYER(swordEquip) (swordEquip)
#define SHIELD_EQUIP_TO_PLAYER(shieldEquip) (shieldEquip)
#define TUNIC_EQUIP_TO_PLAYER(tunicEquip) ((tunicEquip) - 1)
#define BOOTS_EQUIP_TO_PLAYER(bootsEquip) ((bootsEquip) - 1)

#define CUR_UPG_VALUE(upg) ((s32)(gSaveContext.save.info.inventory.upgrades & gUpgradeMasks[upg]) >> gUpgradeShifts[upg])
#define CAPACITY(upg, value) gUpgradeCapacities[upg][value]
#define CUR_CAPACITY(upg) CAPACITY(upg, CUR_UPG_VALUE(upg))

#define CHECK_QUEST_ITEM(item) (gBitFlags[item] & gSaveContext.save.info.inventory.questItems)
#define CHECK_DUNGEON_ITEM(item, dungeonIndex) (gSaveContext.save.info.inventory.dungeonItems[dungeonIndex] & gBitFlags[item])

#define GET_GS_FLAGS(index) \
    ((gSaveContext.save.info.gsFlags[(index) >> 2] & gGsFlagsMasks[(index) & 3]) >> gGsFlagsShifts[(index) & 3])
#define SET_GS_FLAGS(index, value) \
    (gSaveContext.save.info.gsFlags[(index) >> 2] |= (value) << gGsFlagsShifts[(index) & 3])

#define HIGH_SCORE(score) (gSaveContext.save.info.highScores[score])

#define GET_EVENTCHKINF(flag) (gSaveContext.save.info.eventChkInf[(flag) >> 4] & (1 << ((flag) & 0xF)))
#define SET_EVENTCHKINF(flag) (gSaveContext.save.info.eventChkInf[(flag) >> 4] |= (1 << ((flag) & 0xF)))
#define CLEAR_EVENTCHKINF(flag) (gSaveContext.save.info.eventChkInf[(flag) >> 4] &= ~(1 << ((flag) & 0xF)))

#define GET_ITEMGETINF(flag) (gSaveContext.save.info.itemGetInf[(flag) >> 4] & (1 << ((flag) & 0xF)))
#define SET_ITEMGETINF(flag) (gSaveContext.save.info.itemGetInf[(flag) >> 4] |= (1 << ((flag) & 0xF)))

#define GET_INFTABLE(flag) (gSaveContext.save.info.infTable[(flag) >> 4] & (1 << ((flag) & 0xF)))
#define SET_INFTABLE(flag) (gSaveContext.save.info.infTable[(flag) >> 4] |= (1 << ((flag) & 0xF)))
#define CLEAR_INFTABLE(flag) (gSaveContext.save.info.infTable[(flag) >> 4] &= ~(1 << ((flag) & 0xF)))

#define GET_EVENTINF(flag) (gSaveContext.eventInf[(flag) >> 4] & (1 << ((flag) & 0xF)))
#define SET_EVENTINF(flag) (gSaveContext.eventInf[(flag) >> 4] |= (1 << ((flag) & 0xF)))
#define CLEAR_EVENTINF(flag) (gSaveContext.eventInf[(flag) >> 4] &= ~(1 << ((flag) & 0xF)))

#define B_BTN_ITEM ((gSaveContext.buttonStatus[0] == ITEM_NONE)                     \
                        ? ITEM_NONE                                                 \
                        : (gSaveContext.save.info.equips.buttonItems[0] == ITEM_GIANTS_KNIFE) \
                            ? ITEM_SWORD_BIGGORON                                   \
                            : gSaveContext.save.info.equips.buttonItems[0])

#define C_BTN_ITEM(button) ((gSaveContext.buttonStatus[(button) + 1] != BTN_DISABLED) \
                                ? gSaveContext.save.info.equips.buttonItems[(button) + 1]       \
                                : ITEM_NONE)

#define CHECK_BTN_ALL(state, combo) (~((state) | ~(combo)) == 0)
#define CHECK_BTN_ANY(state, combo) (((state) & (combo)) != 0)

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

struct GraphicsContext;

extern struct GraphicsContext* __gfxCtx;

#define WORK_DISP       __gfxCtx->work.p
#define POLY_OPA_DISP   __gfxCtx->polyOpa.p
#define POLY_XLU_DISP   __gfxCtx->polyXlu.p
#define OVERLAY_DISP    __gfxCtx->overlay.p
#define DEBUG_DISP      __gfxCtx->debug.p

#if IS_DEBUG

// __gfxCtx shouldn't be used directly.
// Use the DISP macros defined above when writing to display buffers.
#define OPEN_DISPS(gfxCtx, ...)         \
    {                                   \
        GraphicsContext* __gfxCtx;      \
        Gfx* dispRefs[4];               \
        __gfxCtx = gfxCtx;              \
        (void)__gfxCtx;                 \
        Graph_OpenDisps(dispRefs, gfxCtx, __FILE__, __LINE__)

#define CLOSE_DISPS(gfxCtx, ...)                                \
        Graph_CloseDisps(dispRefs, gfxCtx, __FILE__, __LINE__); \
    }                                                           \
    (void)0

#define GRAPH_ALLOC(gfxCtx, size) Graph_Alloc(gfxCtx, size)
#define MATRIX_TO_MTX(gfxCtx, ...) Matrix_ToMtx(gfxCtx, __FILE__, __LINE__)
#define MATRIX_NEW(gfxCtx, ...) Matrix_NewMtx(gfxCtx, __FILE__, __LINE__)
#define MATRIX_CHECK_FLOATS(mtx, ...) Matrix_CheckFloats(mtx, __FILE__, __LINE__)
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
#define HUNGUP_AND_CRASH(...) Fault_AddHungupAndCrash(__FILE__, __LINE__)
#define GAME_ALLOC_MALLOC(alloc, size, ...) GameAlloc_MallocDebug(alloc, size, __FILE__, __LINE__)

#else

#define OPEN_DISPS(gfxCtx, ...)      \
    {                                       \
        GraphicsContext* __gfxCtx = gfxCtx; \
        s32 __dispPad

#define CLOSE_DISPS(gfxCtx, ...) \
    (void)0;                            \
    }                                   \
    (void)0

#define GRAPH_ALLOC(gfxCtx, size) ((void*)((gfxCtx)->polyOpa.d = (Gfx*)((u8*)(gfxCtx)->polyOpa.d - ALIGN16(size))))
#define MATRIX_TO_MTX(gfxCtx, ...) Matrix_ToMtx(gfxCtx)
#define MATRIX_NEW(gfxCtx, ...) Matrix_NewMtx(gfxCtx)
#define MATRIX_CHECK_FLOATS(mtx, ...) (mtx)
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
#define HUNGUP_AND_CRASH(...) LogUtils_HungupThread(...)
#define GAME_ALLOC_MALLOC(alloc, size, ...) GameAlloc_Malloc(alloc, size)

#endif /* IS_DEBUG */

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

#define gDPSetTileCustom(pkt, fmt, siz, width, height, pal, cms, cmt, masks, maskt, shifts, shiftt)                    \
    do {                                                                                                               \
        gDPPipeSync(pkt);                                                                                              \
        gDPTileSync(pkt);                                                                                              \
        gDPSetTile(pkt, fmt, siz, (((width)*siz##_TILE_BYTES) + 7) >> 3, 0, G_TX_LOADTILE, 0, cmt, maskt, shiftt, cms, \
                   masks, shifts);                                                                                     \
        gDPTileSync(pkt);                                                                                              \
        gDPSetTile(pkt, fmt, siz, (((width)*siz##_TILE_BYTES) + 7) >> 3, 0, G_TX_RENDERTILE, pal, cmt, maskt, shiftt,  \
                   cms, masks, shifts);                                                                                \
        gDPSetTileSize(pkt, G_TX_RENDERTILE, 0, 0, ((width)-1) << G_TEXTURE_IMAGE_FRAC,                                \
                       ((height)-1) << G_TEXTURE_IMAGE_FRAC);                                                          \
    } while (0)

#endif

// HackerOoT

// assertf, print a message before abort
#if IS_DEBUG
# define assertf(cond, fmt, ...)                    \
    do {                                            \
        if (!(cond)) {                              \
            PRINTF(fmt, __VA_ARGS__);               \
            __assert(#cond, __FILE__, __LINE__);    \
        }                                           \
    } while (0)
#else
# define assertf(cond, fmt, ...) ((void)0)
#endif

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

#ifdef __GNUC__
#define NO_REORDER __attribute__((section(".data"))) __attribute__((no_reorder))
#else
#define NO_REORDER
#endif

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
