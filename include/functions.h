#ifndef FUNCTIONS_H
#define FUNCTIONS_H

#include "z64.h"
#include "macros.h"
#include "config.h"

#include "config.h"

f32 fabsf(f32 f);
#ifndef __sgi
#define fabsf(f) __builtin_fabsf((f32)(f))
#else
#pragma intrinsic(fabsf)
#endif
f32 sqrtf(f32 f);
#pragma intrinsic(sqrtf)
f64 sqrt(f64 f);
#pragma intrinsic(sqrt)

void cleararena(void);
void bootproc(void);
void Main_ThreadEntry(void* arg);
void Idle_ThreadEntry(void* arg);
void ViConfig_UpdateVi(u32 black);
void ViConfig_UpdateBlack(void);
void* Yaz0_FirstDMA(void);
void* Yaz0_NextDMA(u8* curSrcPos);
void Yaz0_DecompressImpl(Yaz0Header* hdr, u8* dst);
void Yaz0_Decompress(uintptr_t romStart, u8* dst, size_t size);
void Locale_Init(void);
void Locale_ResetRegion(void);
u32 func_80001F48(void);
u32 func_80001F8C(void);
u32 Locale_IsRegionNative(void);
NORETURN void __assert(const char* exp, const char* file, s32 line);
void isPrintfInit(void);
void osSyncPrintfUnused(const char* fmt, ...);
void osSyncPrintf(const char* fmt, ...);
void rmonPrintf(const char* fmt, ...);
void* is_proutSyncPrintf(void* arg, const char* str, u32 count);
NORETURN void func_80002384(const char* exp, const char* file, u32 line);
OSPiHandle* osDriveRomInit(void);
void Mio0_Decompress(Yaz0Header* hdr, u8* dst);
void StackCheck_Init(StackEntry* entry, void* stackBottom, void* stackTop, u32 initValue, s32 minSpace,
                     const char* name);
void StackCheck_Cleanup(StackEntry* entry);
u32 StackCheck_GetState(StackEntry* entry);
u32 StackCheck_CheckAll(void);
u32 StackCheck_Check(StackEntry* entry);
f32 LogUtils_CheckFloatRange(const char* exp, s32 line, const char* valueName, f32 value, const char* minName, f32 min,
                             const char* maxName, f32 max);
s32 LogUtils_CheckIntRange(const char* exp, s32 line, const char* valueName, s32 value, const char* minName, s32 min,
                           const char* maxName, s32 max);
void LogUtils_LogHexDump(void* ptr, s32 size0);
void LogUtils_LogPointer(s32 value, u32 max, void* ptr, const char* name, const char* file, s32 line);
void LogUtils_CheckBoundary(const char* name, s32 value, s32 unk, const char* file, s32 line);
void LogUtils_CheckNullPointer(const char* exp, void* ptr, const char* file, s32 line);
void LogUtils_CheckValidPointer(const char* exp, void* ptr, const char* file, s32 line);
void LogUtils_LogThreadId(const char* name, s32 line);
void LogUtils_HungupThread(const char* name, s32 line);
void LogUtils_ResetHungup(void);
s32 vsprintf(char* dst, const char* fmt, va_list args);
s32 sprintf(char* dst, const char* fmt, ...);
void __osPiCreateAccessQueue(void);
void __osPiGetAccess(void);
void __osPiRelAccess(void);
s32 osSendMesg(OSMesgQueue* mq, OSMesg msg, s32 flag);
void osStopThread(OSThread* thread);
void osViExtendVStart(u32 value);
s32 osRecvMesg(OSMesgQueue* mq, OSMesg* msg, s32 flag);
void __osInitialize_common(void);
void __osInitialize_autodetect(void);
void __osEnqueueAndYield(OSThread**);
void __osEnqueueThread(OSThread**, OSThread*);
OSThread* __osPopThread(OSThread**);
void __osDispatchThread(void);
void __osCleanupThread(void);
void __osDequeueThread(OSThread** queue, OSThread* thread);
void osDestroyThread(OSThread* thread);
void bzero(void* __s, s32 __n);
void osCreateThread(OSThread* thread, OSId id, void (*entry)(void*), void* arg, void* sp, OSPri pri);
void __osSetSR(u32);
u32 __osGetSR(void);
void osWritebackDCache(void* vaddr, s32 nbytes);
void* osViGetNextFramebuffer(void);
void osCreatePiManager(OSPri pri, OSMesgQueue* cmdQueue, OSMesg* cmdBuf, s32 cmdMsgCnt);
void __osDevMgrMain(void* arg);
s32 __osPiRawStartDma(s32 dir, u32 cartAddr, void* dramAddr, size_t size);
u32 osVirtualToPhysical(void* vaddr);
void osViBlack(u8 active);
s32 __osSiRawReadIo(void* devAddr, u32* dst);
OSId osGetThreadId(OSThread* thread);
void osViSetMode(OSViMode* mode);
u32 __osProbeTLB(void*);
u32 osGetMemSize(void);
void osSetEventMesg(OSEvent e, OSMesgQueue* mq, OSMesg msg);
s32 _Printf(PrintCallback, void* arg, const char* fmt, va_list ap);
void osUnmapTLBAll(void);
s32 osEPiStartDma(OSPiHandle* handle, OSIoMesg* mb, s32 direction);
const char* strchr(const char* str, s32 ch);
u32 strlen(const char* str);
void* memcpy(void* dst, const void* src, size_t size);
void osInvalICache(void* vaddr, s32 nbytes);
void osCreateMesgQueue(OSMesgQueue* mq, OSMesg* msg, s32 count);
void osInvalDCache(void* vaddr, s32 nbytes);
s32 __osSiDeviceBusy(void);
s32 osJamMesg(OSMesgQueue* mq, OSMesg msg, s32 flag);
void osSetThreadPri(OSThread* thread, OSPri pri);
OSPri osGetThreadPri(OSThread* thread);
s32 __osEPiRawReadIo(OSPiHandle* handle, u32 devAddr, u32* data);
void osViSwapBuffer(void* frameBufPtr);
s32 __osEPiRawStartDma(OSPiHandle* handle, s32 direction, u32 cartAddr, void* dramAddr, size_t size);
u32 bcmp(void* __sl, void* __s2, u32 __n);
OSTime osGetTime(void);
void __osTimerServicesInit(void);
void __osTimerInterrupt(void);
void __osSetTimerIntr(OSTime time);
OSTime __osInsertTimer(OSTimer* timer);
u32 osGetCount(void);
void __osSetCompare(u32);
void* bcopy(void* __src, void* __dest, u32 __n);
s32 __osDisableInt(void);
void __osRestoreInt(s32);
void __osViInit(void);
void __osViSwapContext(void);
OSMesgQueue* osPiGetCmdQueue(void);
s32 osEPiReadIo(OSPiHandle* handle, u32 devAddr, u32* data);
void osViSetSpecialFeatures(u32 func);
OSPiHandle* osCartRomInit(void);
void __osSetFpcCsr(u32);
u32 __osGetFpcCsr(void);
s32 osEPiWriteIo(OSPiHandle* handle, u32 devAddr, u32 data);
void osMapTLBRdb(void);
void osYieldThread(void);
u32 __osGetCause(void);
s32 __osEPiRawWriteIo(OSPiHandle* handle, u32 devAddr, u32 data);
void _Litob(_Pft* args, u8 type);
ldiv_t ldiv(s32 num, s32 denom);
lldiv_t lldiv(s64 num, s64 denom);
void _Ldtob(_Pft* args, u8 type);
s32 __osSiRawWriteIo(void* devAddr, u32 val);
void osCreateViManager(OSPri pri);
OSViContext* __osViGetCurrentContext(void);
void osStartThread(OSThread* thread);
void osViSetYScale(f32 scale);
void osViSetXScale(f32 value);
void __osSetWatchLo(u32);

EnItem00* Item_DropCollectible(PlayState* play, Vec3f* spawnPos, s16 params);
EnItem00* Item_DropCollectible2(PlayState* play, Vec3f* spawnPos, s16 params);
void Item_DropCollectibleRandom(PlayState* play, Actor* fromActor, Vec3f* spawnPos, s16 params);
void EffectBlure_AddVertex(EffectBlure* this, Vec3f* p1, Vec3f* p2);
void EffectBlure_AddSpace(EffectBlure* this);
void EffectBlure_Init1(void* thisx, void* initParamsx);
void EffectBlure_Init2(void* thisx, void* initParamsx);
void EffectBlure_Destroy(void* thisx);
s32 EffectBlure_Update(void* thisx);
void EffectBlure_Draw(void* thisx, GraphicsContext* gfxCtx);
void EffectShieldParticle_Init(void* thisx, void* initParamsx);
void EffectShieldParticle_Destroy(void* thisx);
s32 EffectShieldParticle_Update(void* thisx);
void EffectShieldParticle_Draw(void* thisx, GraphicsContext* gfxCtx);
void EffectSpark_Init(void* thisx, void* initParamsx);
void EffectSpark_Destroy(void* thisx);
s32 EffectSpark_Update(void* thisx);
void EffectSpark_Draw(void* thisx, GraphicsContext* gfxCtx);
void func_80026230(PlayState* play, Color_RGBA8* color, s16 arg2, s16 arg3);
void func_80026400(PlayState* play, Color_RGBA8* color, s16 arg2, s16 arg3);
void func_80026608(PlayState* play);
void func_80026690(PlayState* play, Color_RGBA8* color, s16 arg2, s16 arg3);
void func_80026860(PlayState* play, Color_RGBA8* color, s16 arg2, s16 arg3);
void func_80026A6C(PlayState* play);
PlayState* Effect_GetPlayState(void);
void* Effect_GetByIndex(s32 index);
void Effect_InitContext(PlayState* play);
void Effect_Add(PlayState* play, s32* pIndex, s32 type, u8 arg3, u8 arg4, void* initParams);
void Effect_DrawAll(GraphicsContext* gfxCtx);
void Effect_UpdateAll(PlayState* play);
void Effect_Delete(PlayState* play, s32 index);
void Effect_DeleteAll(PlayState* play);
void EffectSs_InitInfo(PlayState* play, s32 tableSize);
void EffectSs_ClearAll(PlayState* play);
void EffectSs_Delete(EffectSs* effectSs);
void EffectSs_Reset(EffectSs* effectSs);
void EffectSs_Insert(PlayState* play, EffectSs* effectSs);
void EffectSs_Spawn(PlayState* play, s32 type, s32 priority, void* initParams);
void EffectSs_UpdateAll(PlayState* play);
void EffectSs_DrawAll(PlayState* play);
s16 EffectSs_LerpInv(s16 a, s16 b, s32 weightInv);
s16 EffectSs_LerpS16(s16 a, s16 b, f32 weight);
u8 EffectSs_LerpU8(u8 a, u8 b, f32 weight);
void EffectSs_DrawGEffect(PlayState* play, EffectSs* this, void* texture);
void EffectSsDust_Spawn(PlayState* play, u16 drawFlags, Vec3f* pos, Vec3f* velocity, Vec3f* accel,
                        Color_RGBA8* primColor, Color_RGBA8* envColor, s16 scale, s16 scaleStep, s16 life,
                        u8 updateMode);
void func_8002829C(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel, Color_RGBA8* primColor,
                   Color_RGBA8* envColor, s16 scale, s16 scaleStep);
void func_80028304(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel, Color_RGBA8* primColor,
                   Color_RGBA8* envColor, s16 scale, s16 scaleStep);
void func_8002836C(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel, Color_RGBA8* primColor,
                   Color_RGBA8* envColor, s16 scale, s16 scaleStep, s16 life);
void func_800283D4(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel, Color_RGBA8* primColor,
                   Color_RGBA8* envColor, s16 scale, s16 scaleStep, s16 life);
void func_8002843C(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel, Color_RGBA8* primColor,
                   Color_RGBA8* envColor, s16 scale, s16 scaleStep, s16 life);
void func_800284A4(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel, Color_RGBA8* primColor,
                   Color_RGBA8* envColor, s16 scale, s16 scaleStep);
void func_80028510(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel, Color_RGBA8* primColor,
                   Color_RGBA8* envColor, s16 scale, s16 scaleStep);
void func_8002857C(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel);
void func_800285EC(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel);
void func_8002865C(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel, s16 scale, s16 scaleStep);
void func_800286CC(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel, s16 scale, s16 scaleStep);
void func_8002873C(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel, s16 scale, s16 scaleStep,
                   s16 life);
void func_800287AC(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel, s16 scale, s16 scaleStep,
                   s16 life);
void func_8002881C(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel, Color_RGBA8* primColor,
                   Color_RGBA8* envColor);
void func_80028858(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel, Color_RGBA8* primColor,
                   Color_RGBA8* envColor);
void func_80028990(PlayState* play, f32 randScale, Vec3f* srcPos);
void func_80028A54(PlayState* play, f32 randScale, Vec3f* srcPos);
void EffectSsKiraKira_SpawnSmallYellow(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel);
void EffectSsKiraKira_SpawnSmall(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel,
                                 Color_RGBA8* primColor, Color_RGBA8* envColor);
void EffectSsKiraKira_SpawnDispersed(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel,
                                     Color_RGBA8* primColor, Color_RGBA8* envColor, s16 scale, s32 life);
void EffectSsKiraKira_SpawnFocused(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel,
                                   Color_RGBA8* primColor, Color_RGBA8* envColor, s16 scale, s32 life);
void EffectSsBomb_Spawn(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel);
void EffectSsBomb2_SpawnFade(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel);
void EffectSsBomb2_SpawnLayered(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel, s16 scale,
                                s16 scaleStep);
void EffectSsBlast_Spawn(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel, Color_RGBA8* innerColor,
                         Color_RGBA8* outerColor, s16 scale, s16 scaleStep, s16 scaleStepDecay, s16 life);
void EffectSsBlast_SpawnWhiteShockwaveSetScale(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel, s16 scale,
                                         s16 scaleStep, s16 life);
void EffectSsBlast_SpawnShockwaveSetColor(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel,
                                          Color_RGBA8* innerColor, Color_RGBA8* outerColor, s16 life);
void EffectSsBlast_SpawnWhiteShockwave(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel);
void EffectSsGSpk_SpawnAccel(PlayState* play, Actor* actor, Vec3f* pos, Vec3f* velocity, Vec3f* accel,
                             Color_RGBA8* primColor, Color_RGBA8* envColor, s16 scale, s16 scaleStep);
void EffectSsGSpk_SpawnNoAccel(PlayState* play, Actor* actor, Vec3f* pos, Vec3f* velocity, Vec3f* accel,
                               Color_RGBA8* primColor, Color_RGBA8* envColor, s16 scale, s16 scaleStep);
void EffectSsGSpk_SpawnFuse(PlayState* play, Actor* actor, Vec3f* pos, Vec3f* velocity, Vec3f* accel);
void EffectSsGSpk_SpawnRandColor(PlayState* play, Actor* actor, Vec3f* pos, Vec3f* velocity, Vec3f* accel,
                                 s16 scale, s16 scaleStep);
void EffectSsGSpk_SpawnSmall(PlayState* play, Actor* actor, Vec3f* pos, Vec3f* velocity, Vec3f* accel,
                             Color_RGBA8* primColor, Color_RGBA8* envColor);
void EffectSsDFire_Spawn(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel, s16 scale, s16 scaleStep,
                         s16 alpha, s16 fadeDelay, s32 life);
void EffectSsDFire_SpawnFixedScale(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel, s16 alpha,
                                   s16 fadeDelay);
void EffectSsBubble_Spawn(PlayState* play, Vec3f* pos, f32 yPosOffset, f32 yPosRandScale, f32 xzPosRandScale,
                          f32 scale);
void EffectSsGRipple_Spawn(PlayState* play, Vec3f* pos, s16 radius, s16 radiusMax, s16 life);
void EffectSsGSplash_Spawn(PlayState* play, Vec3f* pos, Color_RGBA8* primColor, Color_RGBA8* envColor,
                           s16 type, s16 scale);
void EffectSsGMagma_Spawn(PlayState* play, Vec3f* pos);
void EffectSsGFire_Spawn(PlayState* play, Vec3f* pos);
void EffectSsLightning_Spawn(PlayState* play, Vec3f* pos, Color_RGBA8* primColor, Color_RGBA8* envColor,
                             s16 scale, s16 yaw, s16 life, s16 numBolts);
void EffectSsDtBubble_SpawnColorProfile(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel, s16 scale,
                                        s16 life, s16 colorProfile, s16 randXZ);
void EffectSsDtBubble_SpawnCustomColor(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel,
                                       Color_RGBA8* primColor, Color_RGBA8* envColor, s16 scale, s16 life, s16 randXZ);
void EffectSsHahen_Spawn(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel, s16 unused, s16 scale,
                         s16 objId, s16 life, Gfx* dList);
void EffectSsHahen_SpawnBurst(PlayState* play, Vec3f* pos, f32 burstScale, s16 unused, s16 scale,
                              s16 randScaleRange, s16 count, s16 objId, s16 life, Gfx* dList);
void EffectSsStick_Spawn(PlayState* play, Vec3f* pos, s16 yaw);
void EffectSsSibuki_Spawn(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel, s16 moveDelay,
                          s16 direction, s16 scale);
void EffectSsSibuki_SpawnBurst(PlayState* play, Vec3f* pos);
void EffectSsSibuki2_Spawn(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel, s16 scale);
void EffectSsGMagma2_Spawn(PlayState* play, Vec3f* pos, Color_RGBA8* primColor, Color_RGBA8* envColor,
                           s16 updateRate, s16 drawMode, s16 scale);
void EffectSsStone1_Spawn(PlayState* play, Vec3f* pos, s32 arg2);
void EffectSsHitMark_Spawn(PlayState* play, s32 type, s16 scale, Vec3f* pos);
void EffectSsHitMark_SpawnFixedScale(PlayState* play, s32 type, Vec3f* pos);
void EffectSsHitMark_SpawnCustomScale(PlayState* play, s32 type, s16 scale, Vec3f* pos);
void EffectSsFhgFlash_SpawnLightBall(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel, s16 scale,
                                     u8 param);
void EffectSsFhgFlash_SpawnShock(PlayState* play, Actor* actor, Vec3f* pos, s16 scale, u8 param);
void EffectSsKFire_Spawn(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel, s16 scaleMax, u8 type);
void EffectSsSolderSrchBall_Spawn(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel, s16 unused,
                                  s16* linkDetected);
void EffectSsKakera_Spawn(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* arg3, s16 gravity, s16 arg5,
                          s16 arg6, s16 arg7, s16 arg8, s16 scale, s16 arg10, s16 arg11, s32 life, s16 colorIdx,
                          s16 objId, Gfx* dList);
void EffectSsIcePiece_Spawn(PlayState* play, Vec3f* pos, f32 scale, Vec3f* velocity, Vec3f* accel, s32 life);
void EffectSsIcePiece_SpawnBurst(PlayState* play, Vec3f* refPos, f32 scale);
void EffectSsEnIce_SpawnFlyingVec3f(PlayState* play, Actor* actor, Vec3f* pos, s16 primR, s16 primG, s16 primB,
                                    s16 primA, s16 envR, s16 envG, s16 envB, f32 scale);
void EffectSsEnIce_SpawnFlyingVec3s(PlayState* play, Actor* actor, Vec3s* pos, s16 primR, s16 primG, s16 primB,
                                    s16 primA, s16 envR, s16 envG, s16 envB, f32 scale);
void EffectSsEnIce_Spawn(PlayState* play, Vec3f* pos, f32 scale, Vec3f* velocity, Vec3f* accel,
                         Color_RGBA8* primColor, Color_RGBA8* envColor, s32 life);
void EffectSsFireTail_Spawn(PlayState* play, Actor* actor, Vec3f* pos, f32 scale, Vec3f* arg4, s16 arg5,
                            Color_RGBA8* primColor, Color_RGBA8* envColor, s16 type, s16 bodyPart, s32 life);
void EffectSsFireTail_SpawnFlame(PlayState* play, Actor* actor, Vec3f* pos, f32 arg3, s16 bodyPart,
                                 f32 colorIntensity);
void EffectSsFireTail_SpawnFlameOnPlayer(PlayState* play, f32 scale, s16 bodyPart, f32 colorIntensity);
void EffectSsEnFire_SpawnVec3f(PlayState* play, Actor* actor, Vec3f* pos, s16 scale, s16 arg4, s16 flags, s16 bodyPart);
void EffectSsEnFire_SpawnVec3s(PlayState* play, Actor* actor, Vec3s* pos, s16 scale, s16 arg4, s16 flags, s16 bodyPart);
void EffectSsExtra_Spawn(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel, s16 scale, s16 scoreIdx);
void EffectSsFCircle_Spawn(PlayState* play, Actor* actor, Vec3f* pos, s16 radius, s16 height);
void EffectSsDeadDb_Spawn(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel, s16 scale, s16 scaleStep,
                          s16 primR, s16 primG, s16 primB, s16 primA, s16 envR, s16 envG, s16 envB, s16 unused,
                          s32 arg14, s16 playSfx);
void EffectSsDeadDd_Spawn(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel, s16 scale, s16 scaleStep,
                          s16 primR, s16 primG, s16 primB, s16 alpha, s16 envR, s16 envG, s16 envB, s16 alphaStep,
                          s32 life);
void EffectSsDeadDd_SpawnRandYellow(PlayState* play, Vec3f* pos, s16 scale, s16 scaleStep, f32 randPosScale,
                                    s32 randIter, s32 life);
void EffectSsDeadDs_Spawn(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel, s16 scale, s16 scaleStep,
                          s16 alpha, s32 life);
void EffectSsDeadDs_SpawnStationary(PlayState* play, Vec3f* pos, s16 scale, s16 scaleStep, s16 alpha,
                                    s32 life);
void EffectSsDeadSound_Spawn(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel, u16 sfxId,
                             s16 lowerPriority, s16 repeatMode, s32 life);
void EffectSsDeadSound_SpawnStationary(PlayState* play, Vec3f* pos, u16 sfxId, s16 lowerPriority,
                                       s16 repeatMode, s32 life);
void EffectSsIceSmoke_Spawn(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel, s16 scale);

#ifdef ENABLE_EVENT_EDITOR
void FlagSet_Update(PlayState* play);
#endif

void Overlay_LoadGameState(GameStateOverlay* overlayEntry);
void Overlay_FreeGameState(GameStateOverlay* overlayEntry);
void ActorShape_Init(ActorShape* shape, f32 yOffset, ActorShadowFunc shadowDraw, f32 shadowScale);
void ActorShadow_DrawCircle(Actor* actor, Lights* lights, PlayState* play);
void ActorShadow_DrawWhiteCircle(Actor* actor, Lights* lights, PlayState* play);
void ActorShadow_DrawHorse(Actor* actor, Lights* lights, PlayState* play);
void ActorShadow_DrawFeet(Actor* actor, Lights* lights, PlayState* play);
void Actor_SetFeetPos(Actor* actor, s32 limbIndex, s32 leftFootIndex, Vec3f* leftFootPos, s32 rightFootIndex,
                      Vec3f* rightFootPos);
void Actor_ProjectPos(PlayState* play, Vec3f* src, Vec3f* xyzDest, f32* cappedInvWDest);
void func_8002C124(TargetContext* targetCtx, PlayState* play);
s32 Flags_GetSwitch(PlayState* play, s32 flag);
void Flags_SetSwitch(PlayState* play, s32 flag);
void Flags_UnsetSwitch(PlayState* play, s32 flag);
s32 Flags_GetUnknown(PlayState* play, s32 flag);
void Flags_SetUnknown(PlayState* play, s32 flag);
void Flags_UnsetUnknown(PlayState* play, s32 flag);
s32 Flags_GetTreasure(PlayState* play, s32 flag);
void Flags_SetTreasure(PlayState* play, s32 flag);
s32 Flags_GetClear(PlayState* play, s32 flag);
void Flags_SetClear(PlayState* play, s32 flag);
void Flags_UnsetClear(PlayState* play, s32 flag);
s32 Flags_GetTempClear(PlayState* play, s32 flag);
void Flags_SetTempClear(PlayState* play, s32 flag);
void Flags_UnsetTempClear(PlayState* play, s32 flag);
s32 Flags_GetCollectible(PlayState* play, s32 flag);
void Flags_SetCollectible(PlayState* play, s32 flag);
void TitleCard_InitBossName(PlayState* play, TitleCardContext* titleCtx, void* texture, s16 x, s16 y, u8 width,
                            u8 height);
void TitleCard_InitPlaceName(PlayState* play, TitleCardContext* titleCtx, void* texture, s32 x, s32 y,
                             s32 width, s32 height, s32 delay);
s32 TitleCard_Clear(PlayState* play, TitleCardContext* titleCtx);
void Actor_Kill(Actor* actor);
void Actor_SetFocus(Actor* actor, f32 yOffset);
void Actor_SetScale(Actor* actor, f32 scale);
void Actor_SetObjectDependency(PlayState* play, Actor* actor);
void Actor_UpdatePos(Actor* actor);
void Actor_UpdateVelocityXZGravity(Actor* actor);
void Actor_MoveXZGravity(Actor* actor);
void Actor_UpdateVelocityXYZ(Actor* actor);
void Actor_MoveXYZ(Actor* actor);
void Actor_SetProjectileSpeed(Actor* actor, f32 speedXYZ);
s16 Actor_WorldYawTowardActor(Actor* actorA, Actor* actorB);
s16 Actor_WorldYawTowardPoint(Actor* actor, Vec3f* refPoint);
f32 Actor_WorldDistXYZToActor(Actor* actorA, Actor* actorB);
f32 Actor_WorldDistXYZToPoint(Actor* actor, Vec3f* refPoint);
s16 Actor_WorldPitchTowardActor(Actor* actorA, Actor* actorB);
s16 Actor_WorldPitchTowardPoint(Actor* actor, Vec3f* refPoint);
f32 Actor_WorldDistXZToActor(Actor* actorA, Actor* actorB);
f32 Actor_WorldDistXZToPoint(Actor* actor, Vec3f* refPoint);
void func_8002DBD0(Actor* actor, Vec3f* dest, Vec3f* pos);
f32 Actor_HeightDiff(Actor* actorA, Actor* actorB);
f32 Player_GetHeight(Player* player);
f32 func_8002DCE4(Player* player);
s32 func_8002DD6C(Player* player);
s32 func_8002DD78(Player* player);
s32 func_8002DDE4(PlayState* play);
s32 func_8002DDF4(PlayState* play);
void func_8002DE04(PlayState* play, Actor* actorA, Actor* actorB);
void func_8002DE74(PlayState* play, Player* player);
void Actor_MountHorse(PlayState* play, Player* player, Actor* horse);
s32 func_8002DEEC(Player* player);
void func_8002DF18(PlayState* play, Player* player);
s32 func_8002DF38(PlayState* play, Actor* actor, u8 csAction);
s32 func_8002DF54(PlayState* play, Actor* actor, u8 csAction);
void func_8002DF90(DynaPolyActor* dynaActor);
void func_8002DFA4(DynaPolyActor* dynaActor, f32 arg1, s16 arg2);
s32 Player_IsFacingActor(Actor* actor, s16 maxAngle, PlayState* play);
s32 Actor_ActorBIsFacingActorA(Actor* actorA, Actor* actorB, s16 maxAngle);
s32 Actor_IsFacingPlayer(Actor* actor, s16 maxAngle);
s32 Actor_ActorAIsFacingActorB(Actor* actorA, Actor* actorB, s16 maxAngle);
s32 Actor_IsFacingAndNearPlayer(Actor* actor, f32 range, s16 maxAngle);
s32 Actor_ActorAIsFacingAndNearActorB(Actor* actorA, Actor* actorB, f32 range, s16 maxAngle);
void Actor_UpdateBgCheckInfo(PlayState* play, Actor* actor, f32 wallCheckHeight, f32 wallCheckRadius,
                             f32 ceilingCheckHeight, s32 flags);
Hilite* func_8002EABC(Vec3f* object, Vec3f* eye, Vec3f* lightDir, GraphicsContext* gfxCtx);
Hilite* func_8002EB44(Vec3f* object, Vec3f* eye, Vec3f* lightDir, GraphicsContext* gfxCtx);
void func_8002EBCC(Actor* actor, PlayState* play, s32 flag);
void func_8002ED80(Actor* actor, PlayState* play, s32 flag);
PosRot* Actor_GetFocus(PosRot* dest, Actor* actor);
PosRot* Actor_GetWorld(PosRot* dest, Actor* actor);
PosRot* Actor_GetWorldPosShapeRot(PosRot* arg0, Actor* actor);
s32 func_8002F0C8(Actor* actor, Player* player, s32 flag);
u32 Actor_ProcessTalkRequest(Actor* actor, PlayState* play);
s32 func_8002F1C4(Actor* actor, PlayState* play, f32 arg2, f32 arg3, u32 exchangeItemId);
s32 func_8002F298(Actor* actor, PlayState* play, f32 arg2, u32 exchangeItemId);
s32 func_8002F2CC(Actor* actor, PlayState* play, f32 arg2);
s32 func_8002F2F4(Actor* actor, PlayState* play);
u32 Actor_TextboxIsClosing(Actor* actor, PlayState* play);
s8 func_8002F368(PlayState* play);
void Actor_GetScreenPos(PlayState* play, Actor* actor, s16* x, s16* y);
u32 Actor_HasParent(Actor* actor, PlayState* play);
s32 Actor_OfferGetItem(Actor* actor, PlayState* play, s32 getItemId, f32 xzRange, f32 yRange);
s32 Actor_OfferGetItemNearby(Actor* actor, PlayState* play, s32 getItemId);
s32 Actor_OfferCarry(Actor* actor, PlayState* play);
u32 Actor_HasNoParent(Actor* actor, PlayState* play);
void func_8002F5C4(Actor* actorA, Actor* actorB, PlayState* play);
void Actor_SetClosestSecretDistance(Actor* actor, PlayState* play);
s32 Actor_IsMounted(PlayState* play, Actor* horse);
u32 Actor_SetRideActor(PlayState* play, Actor* horse, s32 mountSide);
s32 Actor_NotMounted(PlayState* play, Actor* horse);
void func_8002F698(PlayState* play, Actor* actor, f32 arg2, s16 arg3, f32 arg4, u32 arg5, u32 arg6);
void func_8002F6D4(PlayState* play, Actor* actor, f32 arg2, s16 arg3, f32 arg4, u32 arg5);
void func_8002F71C(PlayState* play, Actor* actor, f32 arg2, s16 arg3, f32 arg4);
void func_8002F758(PlayState* play, Actor* actor, f32 arg2, s16 arg3, f32 arg4, u32 arg5);
void func_8002F7A0(PlayState* play, Actor* actor, f32 arg2, s16 arg3, f32 arg4);
void Player_PlaySfx(Player* player, u16 sfxId);
void Actor_PlaySfx(Actor* actor, u16 sfxId);
void func_8002F850(PlayState* play, Actor* actor);
void func_8002F8F0(Actor* actor, u16 sfxId);
void func_8002F91C(Actor* actor, u16 sfxId);
void func_8002F948(Actor* actor, u16 sfxId);
void func_8002F974(Actor* actor, u16 sfxId);
void func_8002F994(Actor* actor, s32 timer);
s32 func_8002F9EC(PlayState* play, Actor* actor, CollisionPoly* poly, s32 bgId, Vec3f* pos);
void Actor_DisableLens(PlayState* play);
void Actor_InitContext(PlayState* play, ActorContext* actorCtx, ActorEntry* playerEntry);
void Actor_UpdateAll(PlayState* play, ActorContext* actorCtx);
s32 func_800314D4(PlayState* play, Actor* actor, Vec3f* arg2, f32 arg3);
void func_800315AC(PlayState* play, ActorContext* actorCtx);
void Actor_KillAllWithMissingObject(PlayState* play, ActorContext* actorCtx);
void func_80031B14(PlayState* play, ActorContext* actorCtx);
void func_80031C3C(ActorContext* actorCtx, PlayState* play);
Actor* Actor_Spawn(ActorContext* actorCtx, PlayState* play, s16 actorId, f32 posX, f32 posY, f32 posZ,
                   s16 rotX, s16 rotY, s16 rotZ, s16 params);
Actor* Actor_SpawnAsChild(ActorContext* actorCtx, Actor* parent, PlayState* play, s16 actorId, f32 posX,
                          f32 posY, f32 posZ, s16 rotX, s16 rotY, s16 rotZ, s16 params);
void Actor_SpawnTransitionActors(PlayState* play, ActorContext* actorCtx);
Actor* Actor_SpawnEntry(ActorContext* actorCtx, ActorEntry* actorEntry, PlayState* play);
Actor* Actor_Delete(ActorContext* actorCtx, Actor* actor, PlayState* play);
Actor* func_80032AF0(PlayState* play, ActorContext* actorCtx, Actor** actorPtr, Player* player);
Actor* Actor_Find(ActorContext* actorCtx, s32 actorId, s32 actorCategory);
void Enemy_StartFinishingBlow(PlayState* play, Actor* actor);
s16 func_80032CB4(s16* arg0, s16 arg1, s16 arg2, s16 arg3);
void BodyBreak_Alloc(BodyBreak* bodyBreak, s32 count, PlayState* play);
void BodyBreak_SetInfo(BodyBreak* bodyBreak, s32 limbIndex, s32 minLimbIndex, s32 maxLimbIndex, u32 count, Gfx** dList,
                       s16 objectSlot);
s32 BodyBreak_SpawnParts(Actor* actor, BodyBreak* bodyBreak, PlayState* play, s16 type);
void Actor_SpawnFloorDustRing(PlayState* play, Actor* actor, Vec3f* posXZ, f32 radius, s32 amountMinusOne,
                              f32 randAccelWeight, s16 scale, s16 scaleStep, u8 useLighting);
void func_80033480(PlayState* play, Vec3f* posBase, f32 randRangeDiameter, s32 amountMinusOne, s16 scaleBase,
                   s16 scaleStep, u8 arg6);
Actor* Actor_GetCollidedExplosive(PlayState* play, Collider* collider);
Actor* func_80033684(PlayState* play, Actor* explosiveActor);
Actor* Actor_GetProjectileActor(PlayState* play, Actor* refActor, f32 radius);
void Actor_ChangeCategory(PlayState* play, ActorContext* actorCtx, Actor* actor, u8 actorCategory);
void Actor_SetTextWithPrefix(PlayState* play, Actor* actor, s16 baseTextId);
s16 Actor_TestFloorInDirection(Actor* actor, PlayState* play, f32 distance, s16 angle);
s32 Actor_IsTargeted(PlayState* play, Actor* actor);
s32 Actor_OtherIsTargeted(PlayState* play, Actor* actor);
f32 func_80033AEC(Vec3f* arg0, Vec3f* arg1, f32 arg2, f32 arg3, f32 arg4, f32 arg5);
void func_80033C30(Vec3f* arg0, Vec3f* arg1, u8 alpha, PlayState* play);
void Actor_RequestQuake(PlayState* play, s16 y, s16 duration);
void Actor_RequestQuakeWithSpeed(PlayState* play, s16 y, s16 duration, s16 speed);
void Actor_RequestQuakeAndRumble(Actor* actor, PlayState* play, s16 quakeY, s16 quakeDuration);
f32 Rand_ZeroFloat(f32 f);
f32 Rand_CenteredFloat(f32 f);
void Actor_DrawDoorLock(PlayState* play, s32 frame, s32 type);
void func_8003424C(PlayState* play, Vec3f* arg1);
void Actor_SetColorFilter(Actor* actor, s16 colorFlag, s16 colorIntensityMax, s16 bufFlag, s16 duration);
Hilite* func_800342EC(Vec3f* object, PlayState* play);
Hilite* func_8003435C(Vec3f* object, PlayState* play);
s32 Npc_UpdateTalking(PlayState* play, Actor* actor, s16* talkState, f32 interactRange,
                      NpcGetTextIdFunc getTextId, NpcUpdateTalkStateFunc updateTalkState);
s16 Npc_GetTrackingPresetMaxPlayerYaw(s16 presetIndex);
void Npc_TrackPoint(Actor* actor, NpcInteractInfo* interactInfo, s16 presetIndex,
                    s16 trackingMode);
void func_80034BA0(PlayState* play, SkelAnime* skelAnime, OverrideLimbDraw overrideLimbDraw,
                   PostLimbDraw postLimbDraw, Actor* actor, s16 alpha);
void func_80034CC4(PlayState* play, SkelAnime* skelAnime, OverrideLimbDraw overrideLimbDraw,
                   PostLimbDraw postLimbDraw, Actor* actor, s16 alpha);
s16 func_80034DD4(Actor* actor, PlayState* play, s16 arg2, f32 arg3);
void func_80034F54(PlayState* play, s16* arg1, s16* arg2, s32 arg3);
void Actor_Noop(Actor* actor, PlayState* play);
void Gfx_DrawDListOpa(PlayState* play, Gfx* dlist);
void Gfx_DrawDListXlu(PlayState* play, Gfx* dlist);
Actor* Actor_FindNearby(PlayState* play, Actor* refActor, s16 actorId, u8 actorCategory, f32 range);
s32 func_800354B4(PlayState* play, Actor* actor, f32 range, s16 arg3, s16 arg4, s16 arg5);
void func_8003555C(PlayState* play, Vec3f* pos, Vec3f* velocity, Vec3f* accel);
void func_800355B8(PlayState* play, Vec3f* pos);
u8 func_800355E4(PlayState* play, Collider* collider);
u8 Actor_ApplyDamage(Actor* actor);
void Actor_SetDropFlag(Actor* actor, ColliderInfo* colInfo, s32 freezeFlag);
void Actor_SetDropFlagJntSph(Actor* actor, ColliderJntSph* jntSph, s32 freezeFlag);
void func_80035844(Vec3f* arg0, Vec3f* arg1, Vec3s* arg2, s32 arg3);
Actor* func_800358DC(Actor* actor, Vec3f* spawnPos, Vec3s* spawnRot, f32* arg3, s32 timer, s16* unused,
                     PlayState* play, s16 params, Gfx* dList);
void func_800359B8(Actor* actor, s16 arg1, Vec3s* arg2);
s32 Flags_GetEventChkInf(s32 flag);
void Flags_SetEventChkInf(s32 flag);
s32 Flags_GetInfTable(s32 flag);
void Flags_SetInfTable(s32 flag);
u16 func_80037C30(PlayState* play, s16 arg1);
s32 func_80037D98(PlayState* play, Actor* actor, s16 arg2, s32* arg3);
s32 Actor_TrackPlayer(PlayState* play, Actor* actor, Vec3s* headRot, Vec3s* torsoRot, Vec3f focusPos);
void ActorOverlayTable_LogPrint(void);
void ActorOverlayTable_Init(void);
void ActorOverlayTable_Cleanup(void);
void func_80038A28(CollisionPoly* poly, f32 tx, f32 ty, f32 tz, MtxF* dest);
f32 CollisionPoly_GetPointDistanceFromPlane(CollisionPoly* poly, Vec3f* point);
void CollisionPoly_GetVerticesByBgId(CollisionPoly* poly, s32 bgId, CollisionContext* colCtx, Vec3f* dest);
void BgCheck_Allocate(CollisionContext* colCtx, PlayState* play, CollisionHeader* colHeader);
f32 BgCheck_EntityRaycastDown1(CollisionContext* colCtx, CollisionPoly** outGroundPoly, Vec3f* pos);
f32 BgCheck_EntityRaycastDown2(PlayState* play, CollisionContext* colCtx, CollisionPoly** outGroundPoly, Vec3f* pos);
f32 BgCheck_EntityRaycastDown3(CollisionContext* colCtx, CollisionPoly** outGroundPoly, s32* bgId, Vec3f* pos);
f32 BgCheck_EntityRaycastDown4(CollisionContext* colCtx, CollisionPoly** outGroundPoly, s32* bgId, Actor* actor,
                               Vec3f* pos);
f32 BgCheck_EntityRaycastDown5(PlayState* play, CollisionContext* colCtx, CollisionPoly** outGroundPoly, s32* bgId,
                               Actor* actor, Vec3f* pos);
f32 BgCheck_EntityRaycastDown6(CollisionContext* colCtx, CollisionPoly** outGroundPoly, s32* bgId, Actor* actor,
                               Vec3f* pos, f32 chkDist);
f32 BgCheck_EntityRaycastDown7(CollisionContext* colCtx, CollisionPoly** outPoly, s32* bgId, Actor* actor, Vec3f* pos);
f32 BgCheck_AnyRaycastDown1(CollisionContext* colCtx, CollisionPoly* outGroundPoly, Vec3f* pos);
f32 BgCheck_AnyRaycastDown2(CollisionContext* colCtx, CollisionPoly* outGroundPoly, s32* bgId, Vec3f* pos);
f32 BgCheck_CameraRaycastDown2(CollisionContext* colCtx, CollisionPoly** outPoly, s32* bgId, Vec3f* pos);
f32 BgCheck_EntityRaycastDownWalls(CollisionContext* colCtx, CollisionPoly** outPoly, s32* bgId, Actor* actor, Vec3f* pos);
f32 BgCheck_EntityRaycastDown9(CollisionContext* colCtx, CollisionPoly** outPoly, s32* bgId, Vec3f* pos);
s32 BgCheck_EntitySphVsWall1(CollisionContext* colCtx, Vec3f* posResult, Vec3f* posNext, Vec3f* posPrev, f32 radius,
                             CollisionPoly** outPoly, f32 checkHeight);
s32 BgCheck_EntitySphVsWall2(CollisionContext* colCtx, Vec3f* posResult, Vec3f* posNext, Vec3f* posPrev, f32 radius,
                             CollisionPoly** outPoly, s32* outBgId, f32 checkHeight);
s32 BgCheck_EntitySphVsWall3(CollisionContext* colCtx, Vec3f* posResult, Vec3f* posNext, Vec3f* posPrev, f32 radius,
                             CollisionPoly** outPoly, s32* outBgId, Actor* actor, f32 checkHeight);
s32 BgCheck_EntitySphVsWall4(CollisionContext* colCtx, Vec3f* posResult, Vec3f* posNext, Vec3f* posPrev, f32 radius,
                             CollisionPoly** outPoly, s32* outBgId, Actor* actor, f32 checkHeight);
s32 BgCheck_AnyCheckCeiling(CollisionContext* colCtx, f32* outY, Vec3f* pos, f32 checkHeight);
s32 BgCheck_EntityCheckCeiling(CollisionContext* colCtx, f32* outY, Vec3f* pos, f32 checkHeight,
                               CollisionPoly** outPoly, s32* outBgId, Actor* actor);
s32 BgCheck_CameraLineTest1(CollisionContext* colCtx, Vec3f* posA, Vec3f* posB, Vec3f* posResult,
                            CollisionPoly** outPoly, s32 chkWall, s32 chkFloor, s32 chkCeil, s32 chkOneFace, s32* bgId);
s32 BgCheck_CameraLineTest2(CollisionContext* colCtx, Vec3f* posA, Vec3f* posB, Vec3f* posResult,
                            CollisionPoly** outPoly, s32 chkWall, s32 chkFloor, s32 chkCeil, s32 chkOneFace, s32* bgId);
s32 BgCheck_EntityLineTest1(CollisionContext* colCtx, Vec3f* posA, Vec3f* posB, Vec3f* posResult,
                            CollisionPoly** outPoly, s32 chkWall, s32 chkFloor, s32 chkCeil, s32 chkOneFace, s32* bgId);
s32 BgCheck_EntityLineTest2(CollisionContext* colCtx, Vec3f* posA, Vec3f* posB, Vec3f* posResult,
                            CollisionPoly** outPoly, s32 chkWall, s32 chkFloor, s32 chkCeil, s32 chkOneFace, s32* bgId,
                            Actor* actor);
s32 BgCheck_EntityLineTest3(CollisionContext* colCtx, Vec3f* posA, Vec3f* posB, Vec3f* posResult,
                            CollisionPoly** outPoly, s32 chkWall, s32 chkFloor, s32 chkCeil, s32 chkOneFace, s32* bgId,
                            Actor* actor, f32 chkDist);
s32 BgCheck_ProjectileLineTest(CollisionContext* colCtx, Vec3f* posA, Vec3f* posB, Vec3f* posResult,
                               CollisionPoly** outPoly, s32 chkWall, s32 chkFloor, s32 chkCeil, s32 chkOneFace,
                               s32* bgId);
s32 BgCheck_AnyLineTest1(CollisionContext* colCtx, Vec3f* posA, Vec3f* posB, Vec3f* posResult, CollisionPoly** outPoly,
                         s32 chkOneFace);
s32 BgCheck_AnyLineTest2(CollisionContext* colCtx, Vec3f* posA, Vec3f* posB, Vec3f* posResult, CollisionPoly** outPoly,
                         s32 chkWall, s32 chkFloor, s32 chkCeil, s32 chkOneFace);
s32 BgCheck_AnyLineTest3(CollisionContext* colCtx, Vec3f* posA, Vec3f* posB, Vec3f* posResult, CollisionPoly** outPoly,
                         s32 chkWall, s32 chkFloor, s32 chkCeil, s32 chkOneFace, s32* bgId);
s32 BgCheck_SphVsFirstPoly(CollisionContext* colCtx, Vec3f* center, f32 radius);
s32 DynaPoly_IsBgIdBgActor(s32 bgId);
void DynaPoly_DisableCollision(PlayState* play, DynaCollisionContext* dyna, s32 bgId);
void DynaPoly_EnableCollision(PlayState* play, DynaCollisionContext* dyna, s32 bgId);
void DynaPoly_DisableCeilingCollision(PlayState* play, DynaCollisionContext* dyna, s32 bgId);
s32 DynaPoly_SetBgActor(PlayState* play, DynaCollisionContext* dyna, Actor* actor, CollisionHeader* colHeader);
DynaPolyActor* DynaPoly_GetActor(CollisionContext* colCtx, s32 bgId);
void DynaPoly_DeleteBgActor(PlayState* play, DynaCollisionContext* dyna, s32 bgId);
void DynaPoly_InvalidateLookup(PlayState* play, DynaCollisionContext* dyna);
void DynaPoly_UnsetAllInteractFlags(PlayState* play, DynaCollisionContext* dyna, Actor* actor);
void DynaPoly_UpdateContext(PlayState* play, DynaCollisionContext* dyna);
void DynaPoly_UpdateBgActorTransforms(PlayState* play, DynaCollisionContext* dyna);
void CollisionHeader_GetVirtual(void* colHeader, CollisionHeader** dest);
void func_800418D0(CollisionContext* colCtx, PlayState* play);
u32 SurfaceType_GetBgCamIndex(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId);
u16 BgCheck_GetBgCamSettingImpl(CollisionContext* colCtx, u32 bgCamIndex, s32 bgId);
u16 BgCheck_GetBgCamSetting(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId);
u16 BgCheck_GetBgCamCount(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId);
Vec3s* BgCheck_GetBgCamFuncDataImpl(CollisionContext* colCtx, s32 bgCamIndex, s32 bgId);
Vec3s* BgCheck_GetBgCamFuncData(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId);
u32 SurfaceType_GetExitIndex(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId);
u32 SurfaceType_GetFloorType(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId);
u32 func_80041D70(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId);
s32 SurfaceType_GetWallFlags(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId);
s32 SurfaceType_CheckWallFlag0(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId);
s32 SurfaceType_CheckWallFlag1(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId);
s32 SurfaceType_CheckWallFlag2(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId);
u32 SurfaceType_GetFloorProperty(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId);
u32 SurfaceType_IsSoft(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId);
u32 SurfaceType_IsHorseBlocked(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId);
u32 SurfaceType_GetMaterial(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId);
u16 SurfaceType_GetSfxOffset(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId);
u32 SurfaceType_GetFloorEffect(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId);
u32 SurfaceType_GetLightSetting(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId);
u32 SurfaceType_GetEcho(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId);
u32 SurfaceType_CanHookshot(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId);
s32 SurfaceType_IsIgnoredByEntities(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId);
s32 SurfaceType_IsIgnoredByProjectiles(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId);
s32 SurfaceType_IsFloorConveyor(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId);
u32 SurfaceType_GetConveyorSpeed(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId);
u32 SurfaceType_GetConveyorDirection(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId);
u32 func_80042108(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId);
s32 WaterBox_GetSurface1(PlayState* play, CollisionContext* colCtx, f32 x, f32 z, f32* ySurface,
                         WaterBox** outWaterBox);
s32 WaterBox_GetSurface2(PlayState* play, CollisionContext* colCtx, Vec3f* pos, f32 surfaceChkDist,
                         WaterBox** outWaterBox);
s32 WaterBox_GetSurfaceImpl(PlayState* play, CollisionContext* colCtx, f32 x, f32 z, f32* ySurface,
                            WaterBox** outWaterBox);
u32 WaterBox_GetBgCamIndex(CollisionContext* colCtx, WaterBox* waterBox);
u16 WaterBox_GetBgCamSetting(CollisionContext* colCtx, WaterBox* waterBox);
u32 WaterBox_GetLightIndex(CollisionContext* colCtx, WaterBox* waterBox);
s32 func_80042708(CollisionPoly* polyA, CollisionPoly* polyB, Vec3f* point, Vec3f* closestPoint);
s32 func_800427B4(CollisionPoly* polyA, CollisionPoly* polyB, Vec3f* pointA, Vec3f* pointB, Vec3f* closestPoint);
void BgCheck_DrawDynaCollision(PlayState*, CollisionContext*);
void BgCheck_DrawStaticCollision(PlayState*, CollisionContext*);
void func_80043334(CollisionContext* colCtx, Actor* actor, s32 bgId);
s32 DynaPolyActor_TransformCarriedActor(CollisionContext* colCtx, s32 bgId, Actor* carriedActor);
void DynaPolyActor_Init(DynaPolyActor* dynaActor, s32 transformFlags);
void DynaPolyActor_UnsetAllInteractFlags(DynaPolyActor* dynaActor);
void DynaPolyActor_SetActorOnTop(DynaPolyActor* dynaActor);
void DynaPoly_SetPlayerOnTop(CollisionContext* colCtx, s32 floorBgId);
void DynaPoly_SetPlayerAbove(CollisionContext* colCtx, s32 floorBgId);
void func_80043538(DynaPolyActor* dynaActor);
s32 DynaPolyActor_IsActorOnTop(DynaPolyActor* dynaActor);
s32 DynaPolyActor_IsPlayerOnTop(DynaPolyActor* dynaActor);
s32 DynaPolyActor_IsPlayerAbove(DynaPolyActor* dynaActor);
s32 func_800435B4(DynaPolyActor* dynaActor);
s32 func_800435D8(PlayState* play, DynaPolyActor* dynaActor, s16 arg2, s16 arg3, s16 arg4);
void Camera_Init(Camera* camera, View* view, CollisionContext* colCtx, PlayState* play);
void Camera_InitDataUsingPlayer(Camera* camera, Player* player);
s16 Camera_ChangeStatus(Camera* camera, s16 status);
Vec3s Camera_Update(Camera* camera);
void Camera_Finish(Camera* camera);
s32 Camera_ChangeMode(Camera* camera, s16 mode);
s32 Camera_CheckValidMode(Camera* camera, s16 mode);
s32 Camera_ChangeSetting(Camera* camera, s16 setting);
s32 Camera_ChangeBgCamIndex(Camera* camera, s32 bgCamIndex);
s16 Camera_GetInputDirYaw(Camera* camera);
Vec3s* Camera_GetCamDir(Vec3s* dst, Camera* camera);
s16 Camera_GetCamDirPitch(Camera* camera);
s16 Camera_GetCamDirYaw(Camera* camera);
s32 Camera_RequestQuake(Camera* camera, s32 unused, s16 y, s32 duration);
s32 Camera_SetViewParam(Camera* camera, s32 viewFlag, void* param);
s32 Camera_OverwriteStateFlags(Camera* camera, s16 stateFlags);
s16 Camera_SetStateFlag(Camera* camera, s16 stateFlag);
s16 Camera_UnsetStateFlag(Camera* camera, s16 stateFlag);
s32 Camera_ResetAnim(Camera* camera);
s32 Camera_SetCSParams(Camera* camera, CutsceneCameraPoint* atPoints, CutsceneCameraPoint* eyePoints, Player* player,
                       s16 relativeToPlayer);
s32 Camera_ChangeDoorCam(Camera* camera, Actor* doorActor, s16 bgCamIndex, f32 arg3, s16 timer1, s16 timer2,
                         s16 timer3);
s32 Camera_Copy(Camera* dstCamera, Camera* srcCamera);
Vec3f* Camera_GetQuakeOffset(Vec3f* quakeOffset, Camera* camera);
void Camera_SetCameraData(Camera* camera, s16 setDataFlags, void* data0, void* data1, s16 data2, s16 data3,
                          UNK_TYPE arg6);
s32 func_8005B198(void);
s16 func_8005B1A4(Camera* camera);
DamageTable* DamageTable_Get(s32 index);
void DamageTable_Clear(DamageTable* table);
void Collider_DrawRedPoly(GraphicsContext* gfxCtx, Vec3f* vA, Vec3f* vB, Vec3f* vC);
void Collider_DrawPoly(GraphicsContext* gfxCtx, Vec3f* vA, Vec3f* vB, Vec3f* vC, u8 r, u8 g, u8 b);
s32 Collider_InitJntSph(PlayState* play, ColliderJntSph* collider);
s32 Collider_FreeJntSph(PlayState* play, ColliderJntSph* collider);
s32 Collider_DestroyJntSph(PlayState* play, ColliderJntSph* collider);
s32 Collider_SetJntSphToActor(PlayState* play, ColliderJntSph* dest, ColliderJntSphInitToActor* src);
s32 Collider_SetJntSphAllocType1(PlayState* play, ColliderJntSph* dest, Actor* actor,
                                 ColliderJntSphInitType1* src);
s32 Collider_SetJntSphAlloc(PlayState* play, ColliderJntSph* dest, Actor* actor, ColliderJntSphInit* src);
s32 Collider_SetJntSph(PlayState* play, ColliderJntSph* dest, Actor* actor, ColliderJntSphInit* src,
                       ColliderJntSphElement* elements);
s32 Collider_ResetJntSphAT(PlayState* play, Collider* collider);
s32 Collider_ResetJntSphAC(PlayState* play, Collider* collider);
s32 Collider_ResetJntSphOC(PlayState* play, Collider* collider);
s32 Collider_InitCylinder(PlayState* play, ColliderCylinder* collider);
s32 Collider_DestroyCylinder(PlayState* play, ColliderCylinder* collider);
s32 Collider_SetCylinderToActor(PlayState* play, ColliderCylinder* collider, ColliderCylinderInitToActor* src);
s32 Collider_SetCylinderType1(PlayState* play, ColliderCylinder* collider, Actor* actor,
                              ColliderCylinderInitType1* src);
s32 Collider_SetCylinder(PlayState* play, ColliderCylinder* collider, Actor* actor, ColliderCylinderInit* src);
s32 Collider_ResetCylinderAT(PlayState* play, Collider* collider);
s32 Collider_ResetCylinderAC(PlayState* play, Collider* collider);
s32 Collider_ResetCylinderOC(PlayState* play, Collider* collider);
s32 Collider_InitTris(PlayState* play, ColliderTris* tris);
s32 Collider_FreeTris(PlayState* play, ColliderTris* tris);
s32 Collider_DestroyTris(PlayState* play, ColliderTris* tris);
s32 Collider_SetTrisAllocType1(PlayState* play, ColliderTris* dest, Actor* actor, ColliderTrisInitType1* src);
s32 Collider_SetTrisAlloc(PlayState* play, ColliderTris* dest, Actor* actor, ColliderTrisInit* src);
s32 Collider_SetTris(PlayState* play, ColliderTris* dest, Actor* actor, ColliderTrisInit* src,
                     ColliderTrisElement* elements);
s32 Collider_ResetTrisAT(PlayState* play, Collider* collider);
s32 Collider_ResetTrisAC(PlayState* play, Collider* collider);
s32 Collider_ResetTrisOC(PlayState* play, Collider* collider);
s32 Collider_InitQuad(PlayState* play, ColliderQuad* collider);
s32 Collider_DestroyQuad(PlayState* play, ColliderQuad* collider);
s32 Collider_SetQuadType1(PlayState* play, ColliderQuad* collider, Actor* actor, ColliderQuadInitType1* src);
s32 Collider_SetQuad(PlayState* play, ColliderQuad* collider, Actor* actor, ColliderQuadInit* src);
s32 Collider_ResetQuadAT(PlayState* play, Collider* collider);
s32 Collider_ResetQuadAC(PlayState* play, Collider* collider);
s32 Collider_ResetQuadOC(PlayState* play, Collider* collider);
s32 Collider_InitLine(PlayState* play, OcLine* line);
s32 Collider_DestroyLine(PlayState* play, OcLine* line);
s32 Collider_SetLinePoints(PlayState* play, OcLine* ocLine, Vec3f* a, Vec3f* b);
s32 Collider_SetLine(PlayState* play, OcLine* dest, OcLine* src);
s32 Collider_ResetLineOC(PlayState* play, OcLine* line);
void CollisionCheck_InitContext(PlayState* play, CollisionCheckContext* colChkCtx);
void CollisionCheck_DestroyContext(PlayState* play, CollisionCheckContext* colChkCtx);
void CollisionCheck_ClearContext(PlayState* play, CollisionCheckContext* colChkCtx);
void CollisionCheck_EnableSAC(PlayState* play, CollisionCheckContext* colChkCtx);
void CollisionCheck_DisableSAC(PlayState* play, CollisionCheckContext* colChkCtx);
void Collider_Draw(PlayState* play, Collider* collider);
void CollisionCheck_DrawCollision(PlayState* play, CollisionCheckContext* colChkCtx);
s32 CollisionCheck_SetAT(PlayState* play, CollisionCheckContext* colChkCtx, Collider* collider);
s32 CollisionCheck_SetAT_SAC(PlayState* play, CollisionCheckContext* colChkCtx, Collider* collider, s32 index);
s32 CollisionCheck_SetAC(PlayState* play, CollisionCheckContext* colChkCtx, Collider* collider);
s32 CollisionCheck_SetAC_SAC(PlayState* play, CollisionCheckContext* colChkCtx, Collider* collider, s32 index);
s32 CollisionCheck_SetOC(PlayState* play, CollisionCheckContext* colChkCtx, Collider* collider);
s32 CollisionCheck_SetOC_SAC(PlayState* play, CollisionCheckContext* colChkCtx, Collider* collider, s32 index);
s32 CollisionCheck_SetOCLine(PlayState* play, CollisionCheckContext* colChkCtx, OcLine* collider);
void CollisionCheck_BlueBlood(PlayState* play, Collider* collider, Vec3f* v);
void CollisionCheck_AT(PlayState* play, CollisionCheckContext* colChkCtx);
void CollisionCheck_OC(PlayState* play, CollisionCheckContext* colChkCtx);
void CollisionCheck_InitInfo(CollisionCheckInfo* info);
void CollisionCheck_ResetDamage(CollisionCheckInfo* info);
void CollisionCheck_SetInfoNoDamageTable(CollisionCheckInfo* info, CollisionCheckInfoInit* init);
void CollisionCheck_SetInfo(CollisionCheckInfo* info, DamageTable* damageTable, CollisionCheckInfoInit* init);
void CollisionCheck_SetInfo2(CollisionCheckInfo* info, DamageTable* damageTable, CollisionCheckInfoInit2* init);
void CollisionCheck_SetInfoGetDamageTable(CollisionCheckInfo* info, s32 index, CollisionCheckInfoInit2* init);
void CollisionCheck_Damage(PlayState* play, CollisionCheckContext* colChkCtx);
s32 CollisionCheck_LineOCCheckAll(PlayState* play, CollisionCheckContext* colChkCtx, Vec3f* a, Vec3f* b);
s32 CollisionCheck_LineOCCheck(PlayState* play, CollisionCheckContext* colChkCtx, Vec3f* a, Vec3f* b,
                               Actor** exclusions, s32 numExclusions);
void Collider_UpdateCylinder(Actor* actor, ColliderCylinder* collider);
void Collider_SetCylinderPosition(ColliderCylinder* collider, Vec3s* pos);
void Collider_SetQuadVertices(ColliderQuad* collider, Vec3f* a, Vec3f* b, Vec3f* c, Vec3f* d);
void Collider_SetTrisVertices(ColliderTris* collider, s32 index, Vec3f* a, Vec3f* b, Vec3f* c);
void Collider_SetTrisDim(PlayState* play, ColliderTris* collider, s32 index, ColliderTrisElementDimInit* src);
void Collider_UpdateSpheres(s32 limb, ColliderJntSph* collider);
void CollisionCheck_SpawnRedBlood(PlayState* play, Vec3f* v);
void CollisionCheck_SpawnWaterDroplets(PlayState* play, Vec3f* v);
void CollisionCheck_SpawnShieldParticles(PlayState* play, Vec3f* v);
void CollisionCheck_SpawnShieldParticlesMetal(PlayState* play, Vec3f* v);
void CollisionCheck_SpawnShieldParticlesMetalSfx(PlayState* play, Vec3f* v, Vec3f* pos);
void CollisionCheck_SpawnShieldParticlesMetal2(PlayState* play, Vec3f* v);
void CollisionCheck_SpawnShieldParticlesWood(PlayState* play, Vec3f* v, Vec3f* actorPos);
s32 CollisionCheck_CylSideVsLineSeg(f32 radius, f32 height, f32 offset, Vec3f* actorPos, Vec3f* itemPos,
                                    Vec3f* itemProjPos, Vec3f* out1, Vec3f* out2);
u8 CollisionCheck_GetSwordDamage(s32 dmgFlags);
void SaveContext_Init(void);
s32 func_800635D0(s32);
void Regs_Init(void);
void DebugCamera_ScreenText(u8 x, u8 y, const char* text);

#ifdef ENABLE_CAMERA_DEBUGGER
void DebugCamera_ScreenTextColored(u8 x, u8 y, u8 colorIndex, const char* text);
#endif

void Regs_UpdateEditor(Input* input);

#if (defined ENABLE_CAMERA_DEBUGGER) || (defined ENABLE_REG_EDITOR)
void Debug_DrawText(GraphicsContext* gfxCtx);
#endif

void DebugDisplay_Init(void);
DebugDispObject* DebugDisplay_AddObject(f32 posX, f32 posY, f32 posZ, s16 rotX, s16 rotY, s16 rotZ, f32 scaleX,
                                        f32 scaleY, f32 scaleZ, u8 red, u8 green, u8 blue, u8 alpha, s16 type,
                                        GraphicsContext* gfxCtx);
void DebugDisplay_DrawObjects(PlayState* play);
void Cutscene_InitContext(PlayState* play, CutsceneContext* csCtx);
void Cutscene_StartManual(PlayState* play, CutsceneContext* csCtx);
void Cutscene_StopManual(PlayState* play, CutsceneContext* csCtx);
void Cutscene_UpdateManual(PlayState* play, CutsceneContext* csCtx);
void Cutscene_UpdateScripted(PlayState* play, CutsceneContext* csCtx);
void Cutscene_HandleEntranceTriggers(PlayState* play);
void Cutscene_HandleConditionalTriggers(PlayState* play);
void Cutscene_SetScript(PlayState* play, void* script);
void* MemCpy(void* dest, const void* src, s32 len);
void GetItem_Draw(PlayState* play, s16 drawId);
void SfxSource_InitAll(PlayState* play);
void SfxSource_UpdateAll(PlayState* play);
void SfxSource_PlaySfxAtFixedWorldPos(PlayState* play, Vec3f* worldPos, s32 duration, u16 sfxId);
u16 QuestHint_GetSariaTextId(PlayState* play);
u16 QuestHint_GetNaviTextId(PlayState* play);
u16 Text_GetFaceReaction(PlayState* play, u32 reactionSet);
void CutsceneFlags_UnsetAll(PlayState* play);
void CutsceneFlags_Set(PlayState* play, s16 flag);
void CutsceneFlags_Unset(PlayState* play, s16 flag);
s32 CutsceneFlags_Get(PlayState* play, s16 flag);
s32 func_8006CFC0(s32 sceneId);
void func_8006D074(PlayState* play);
void func_8006D0AC(PlayState* play);
void func_8006D0EC(PlayState* play, Player* player);
void func_8006D684(PlayState* play, Player* player);
void func_8006DC68(PlayState* play, Player* player);
void func_8006DD9C(Actor* actor, Vec3f* arg1, s16 arg2);
s32 Jpeg_Decode(void* data, void* zbuffer, void* work, u32 workSize);
void KaleidoSetup_Update(PlayState* play);
void KaleidoSetup_Init(PlayState* play);
void KaleidoSetup_Destroy(PlayState* play);
void func_8006EE50(Font* font, u16 arg1, u16 arg2);
void Font_LoadChar(Font* font, u8 character, u16 codePointIndex);
void Font_LoadMessageBoxIcon(Font* font, u16 icon);
void Font_LoadOrderedFont(Font* font);
s32 Environment_ZBufValToFixedPoint(s32 zBufferVal);
u16 Environment_GetPixelDepth(s32 x, s32 y);
void Environment_GraphCallback(GraphicsContext* gfxCtx, void* param);
void Environment_Init(PlayState* play2, EnvironmentContext* envCtx, s32 unused);
u8 Environment_SmoothStepToU8(u8* pvalue, u8 target, u8 scale, u8 step, u8 minStep);
u8 Environment_SmoothStepToS8(s8* pvalue, s8 target, u8 scale, u8 step, u8 minStep);
f32 Environment_LerpWeight(u16 max, u16 min, u16 val);
f32 Environment_LerpWeightAccelDecel(u16 endFrame, u16 startFrame, u16 curFrame, u16 accelDuration, u16 decelDuration);
void Environment_EnableUnderwaterLights(PlayState* play, s32 waterLightsIndex);
void Environment_DisableUnderwaterLights(PlayState* play);
void Environment_Update(PlayState* play, EnvironmentContext* envCtx, LightContext* lightCtx,
                        PauseContext* pauseCtx, MessageContext* msgCtx, GameOverContext* gameOverCtx,
                        GraphicsContext* gfxCtx);
void Environment_DrawSunAndMoon(PlayState* play);
void Environment_DrawSunLensFlare(PlayState* play, EnvironmentContext* envCtx, View* view,
                                  GraphicsContext* gfxCtx, Vec3f pos, s32 unused);
void Environment_DrawLensFlare(PlayState* play, EnvironmentContext* envCtx, View* view,
                               GraphicsContext* gfxCtx, Vec3f pos, s32 unused, s16 scale, f32 colorIntensity,
                               s16 glareStrength, u8 isSun);
void Environment_DrawRain(PlayState* play, View* view, GraphicsContext* gfxCtx);
void Environment_ChangeLightSetting(PlayState* play, u32 lightSetting);
void Environment_UpdateLightningStrike(PlayState* play);
void Environment_AddLightningBolts(PlayState* play, u8 num);
void Environment_DrawLightning(PlayState* play, s32 unused);
void Environment_PlaySceneSequence(PlayState* play);
void Environment_DrawCustomLensFlare(PlayState* play);
void Environment_InitGameOverLights(PlayState* play);
void Environment_FadeInGameOverLights(PlayState* play);
void Environment_FadeOutGameOverLights(PlayState* play);
void Environment_FillScreen(GraphicsContext* gfxCtx, u8 red, u8 green, u8 blue, u8 alpha, u8 drawFlags);
void Environment_DrawSandstorm(PlayState* play, u8 sandstormState);
void Environment_AdjustLights(PlayState* play, f32 arg1, f32 arg2, f32 arg3, f32 arg4);
s32 Environment_GetBgsDayCount(void);
void Environment_ClearBgsDayCount(void);
s32 Environment_GetTotalDays(void);
void Environment_ForcePlaySequence(u16 seqId);
s32 Environment_IsForcedSequenceDisabled(void);
void Environment_PlayStormNatureAmbience(PlayState* play);
void Environment_StopStormNatureAmbience(PlayState* play);
void Environment_WarpSongLeave(PlayState* play);
void Lib_MemSet(u8* dest, size_t len, u8 val);
f32 Math_CosS(s16 angle);
f32 Math_SinS(s16 angle);
s32 Math_ScaledStepToS(s16* pValue, s16 target, s16 step);
s32 Math_StepToS(s16* pValue, s16 target, s16 step);
s32 Math_StepToF(f32* pValue, f32 target, f32 step);
s32 Math_StepUntilAngleS(s16* pValue, s16 limit, s16 step);
s32 Math_StepUntilS(s16* pValue, s16 limit, s16 step);
s32 Math_StepToAngleS(s16* pValue, s16 target, s16 step);
s32 Math_StepUntilF(f32* pValue, f32 limit, f32 step);
s32 Math_AsymStepToF(f32* pValue, f32 target, f32 incrStep, f32 decrStep);
void Lib_GetControlStickData(f32* outMagnitude, s16* outAngle, Input* input);
s16 Rand_S16Offset(s16 base, s16 range);
void Math_Vec3f_Copy(Vec3f* dest, Vec3f* src);
void Math_Vec3s_ToVec3f(Vec3f* dest, Vec3s* src);
void Math_Vec3f_Sum(Vec3f* a, Vec3f* b, Vec3f* dest);
void Math_Vec3f_Diff(Vec3f* a, Vec3f* b, Vec3f* dest);
void Math_Vec3s_DiffToVec3f(Vec3f* dest, Vec3s* a, Vec3s* b);
void Math_Vec3f_Scale(Vec3f* vec, f32 scaleF);
f32 Math_Vec3f_DistXYZ(Vec3f* a, Vec3f* b);
f32 Math_Vec3f_DistXYZAndStoreDiff(Vec3f* a, Vec3f* b, Vec3f* dest);
f32 Math_Vec3f_DistXZ(Vec3f* a, Vec3f* b);
s16 Math_Vec3f_Yaw(Vec3f* a, Vec3f* b);
s16 Math_Vec3f_Pitch(Vec3f* a, Vec3f* b);
void Actor_ProcessInitChain(Actor* actor, InitChainEntry* ichain);
f32 Math_SmoothStepToF(f32* pValue, f32 target, f32 fraction, f32 step, f32 minStep);
void Math_ApproachF(f32* pValue, f32 target, f32 fraction, f32 step);
void Math_ApproachZeroF(f32* pValue, f32 fraction, f32 step);
f32 Math_SmoothStepToDegF(f32* pValue, f32 target, f32 fraction, f32 step, f32 minStep);
s16 Math_SmoothStepToS(s16* pValue, s16 target, s16 scale, s16 step, s16 minStep);
void Math_ApproachS(s16* pValue, s16 target, s16 scale, s16 step);
void Color_RGBA8_Copy(Color_RGBA8* dst, Color_RGBA8* src);
void Sfx_PlaySfxCentered(u16 sfxId);
void Sfx_PlaySfxCentered2(u16 sfxId);
void Sfx_PlaySfxAtPos(Vec3f* projectedPos, u16 sfxId);
void Health_InitMeter(PlayState* play);
void Health_UpdateMeter(PlayState* play);
void Health_DrawMeter(PlayState* play);
void Health_UpdateBeatingHeart(PlayState* play);
u32 Health_IsCritical(void);
void Lights_PointSetInfo(LightInfo* info, s16 x, s16 y, s16 z, u8 r, u8 g, u8 b, s16 radius, s32 type);
void Lights_PointNoGlowSetInfo(LightInfo* info, s16 x, s16 y, s16 z, u8 r, u8 g, u8 b, s16 radius);
void Lights_PointGlowSetInfo(LightInfo* info, s16 x, s16 y, s16 z, u8 r, u8 g, u8 b, s16 radius);
void Lights_PointSetColorAndRadius(LightInfo* info, u8 r, u8 g, u8 b, s16 radius);
void Lights_DirectionalSetInfo(LightInfo* info, s8 x, s8 y, s8 z, u8 r, u8 g, u8 b);
void Lights_Reset(Lights* lights, u8 ambentR, u8 ambentG, u8 ambentB);
void Lights_Draw(Lights* lights, GraphicsContext* gfxCtx);
void Lights_BindAll(Lights* lights, LightNode* listHead, Vec3f* vec);
void LightContext_Init(PlayState* play, LightContext* lightCtx);
void LightContext_SetAmbientColor(LightContext* lightCtx, u8 r, u8 g, u8 b);
void LightContext_SetFog(LightContext* lightCtx, u8 r, u8 g, u8 b, s16 fogNear, s16 zFar);
Lights* LightContext_NewLights(LightContext* lightCtx, GraphicsContext* gfxCtx);
void LightContext_InitList(PlayState* play, LightContext* lightCtx);
void LightContext_DestroyList(PlayState* play, LightContext* lightCtx);
LightNode* LightContext_InsertLight(PlayState* play, LightContext* lightCtx, LightInfo* info);
void LightContext_RemoveLight(PlayState* play, LightContext* lightCtx, LightNode* node);
Lights* Lights_NewAndDraw(GraphicsContext* gfxCtx, u8 ambientR, u8 ambientG, u8 ambientB, u8 numLights, u8 r, u8 g,
                          u8 b, s8 x, s8 y, s8 z);
Lights* Lights_New(GraphicsContext* gfxCtx, u8 ambientR, u8 ambientG, u8 ambientB);
void Lights_GlowCheck(PlayState* play);
void Lights_DrawGlow(PlayState* play);
void ZeldaArena_CheckPointer(void* ptr, u32 size, const char* name, const char* action);
void* ZeldaArena_Malloc(u32 size);
void* ZeldaArena_MallocDebug(u32 size, const char* file, s32 line);
void* ZeldaArena_MallocR(u32 size);
void* ZeldaArena_MallocRDebug(u32 size, const char* file, s32 line);
void* ZeldaArena_Realloc(void* ptr, u32 newSize);
void* ZeldaArena_ReallocDebug(void* ptr, u32 newSize, const char* file, s32 line);
void ZeldaArena_Free(void* ptr);
void ZeldaArena_FreeDebug(void* ptr, const char* file, s32 line);
void* ZeldaArena_Calloc(u32 num, u32 size);
void ZeldaArena_Display(void);
void ZeldaArena_GetSizes(u32* outMaxFree, u32* outFree, u32* outAlloc);
void ZeldaArena_Check(void);
void ZeldaArena_Init(void* start, u32 size);
void ZeldaArena_Cleanup(void);
u8 ZeldaArena_IsInitialized(void);
void MapMark_Init(PlayState* play);
void MapMark_ClearPointers(PlayState* play);
void MapMark_Draw(PlayState* play);
void PreNmiBuff_Init(PreNmiBuff* this);
void PreNmiBuff_SetReset(PreNmiBuff* this);
u32 PreNmiBuff_IsResetting(PreNmiBuff* this);
void Sched_FlushTaskQueue(void);
f32 OLib_Vec3fDist(Vec3f* a, Vec3f* b);
f32 OLib_Vec3fDistXZ(Vec3f* a, Vec3f* b);
f32 OLib_ClampMinDist(f32 val, f32 min);
f32 OLib_ClampMaxDist(f32 val, f32 max);
Vec3f* OLib_Vec3fDistNormalize(Vec3f* dest, Vec3f* a, Vec3f* b);
Vec3f* OLib_VecGeoToVec3f(Vec3f* dest, VecGeo* geo);
VecSph* OLib_Vec3fToVecSph(VecSph* dest, Vec3f* vec);
VecGeo* OLib_Vec3fToVecGeo(VecGeo* dest, Vec3f* vec);
VecGeo* OLib_Vec3fDiffToVecGeo(VecGeo* dest, Vec3f* a, Vec3f* b);
Vec3f* OLib_Vec3fDiffRad(Vec3f* dest, Vec3f* a, Vec3f* b);
s16 OnePointCutscene_Init(PlayState* play, s16 csId, s16 timer, Actor* actor, s16 parentCamId);
s16 OnePointCutscene_EndCutscene(PlayState* play, s16 subCamId);
s32 OnePointCutscene_Attention(PlayState* play, Actor* actor);
s32 OnePointCutscene_AttentionSetSfx(PlayState* play, Actor* actor, s32 sfxId);
void OnePointCutscene_EnableAttention(void);
void OnePointCutscene_DisableAttention(void);
s32 OnePointCutscene_CheckForCategory(PlayState* play, s32 actorCategory);
void OnePointCutscene_Noop(PlayState* play, s32 arg1);
void Map_SavePlayerInitialInfo(PlayState* play);
void Map_SetFloorPalettesData(PlayState* play, s16 floor);
void Map_InitData(PlayState* play, s16 room);
void Map_InitRoomData(PlayState* play, s16 room);
void Map_Destroy(PlayState* play);
void Map_Init(PlayState* play);
void Minimap_Draw(PlayState* play);
void Map_Update(PlayState* play);
void Interface_ChangeHudVisibilityMode(u16 hudVisibilityMode);
void Interface_SetSceneRestrictions(PlayState* play);
void Inventory_SwapAgeEquipment(void);
void Interface_InitHorsebackArchery(PlayState* play);
void func_800849EC(PlayState* play);
void Interface_LoadItemIcon1(PlayState* play, u16 button);
void Interface_LoadItemIcon2(PlayState* play, u16 button);
void func_80084BF4(PlayState* play, u16 flag);
u8 Item_Give(PlayState* play, u8 item);
u8 Item_CheckObtainability(u8 item);
void Inventory_DeleteItem(u16 item, u16 invSlot);
s32 Inventory_ReplaceItem(PlayState* play, u16 oldItem, u16 newItem);
s32 Inventory_HasEmptyBottle(void);
s32 Inventory_HasSpecificBottle(u8 bottleItem);
void Inventory_UpdateBottleItem(PlayState* play, u8 item, u8 button);
s32 Inventory_ConsumeFairy(PlayState* play);
void Interface_SetDoAction(PlayState* play, u16 action);
void Interface_SetNaviCall(PlayState* play, u16 naviCallState);
void Interface_LoadActionLabelB(PlayState* play, u16 action);
s32 Health_ChangeBy(PlayState* play, s16 amount);
void Rupees_ChangeBy(s16 rupeeChange);
void Inventory_ChangeAmmo(s16 item, s16 ammoChange);
void Magic_Fill(PlayState* play);
void Magic_Reset(PlayState* play);
s32 Magic_RequestChange(PlayState* play, s16 amount, s16 type);
void Interface_SetSubTimer(s16 seconds);
void Interface_SetSubTimerToFinalSecond(PlayState* play);
void Interface_SetTimer(s16 seconds);
void Interface_Draw(PlayState* play);
void Interface_Update(PlayState* play);
Path* Path_GetByIndex(PlayState* play, s16 index, s16 max);
f32 Path_OrientAndGetDistSq(Actor* actor, Path* path, s16 waypoint, s16* yaw);
void Path_CopyLastPoint(Path* path, Vec3f* dest);

#ifdef ENABLE_FRAMERATE_OPTIONS
void FrameAdvance_Init(FrameAdvanceContext* frameAdvCtx);
s32 FrameAdvance_Update(FrameAdvanceContext* frameAdvCtx, Input* input);
#endif

void Player_SetBootData(PlayState* play, Player* this);
s32 Player_InBlockingCsMode(PlayState* play, Player* this);
s32 Player_InCsMode(PlayState* play);
s32 func_8008E9C4(Player* this);
s32 Player_IsChildWithHylianShield(Player* this);
s32 Player_ActionToModelGroup(Player* this, s32 itemAction);
void Player_SetModelsForHoldingShield(Player* this);
void Player_SetModels(Player* this, s32 modelGroup);
void Player_SetModelGroup(Player* this, s32 modelGroup);
void func_8008EC70(Player* this);
void Player_SetEquipmentData(PlayState* play, Player* this);
void Player_UpdateBottleHeld(PlayState* play, Player* this, s32 item, s32 itemAction);
void func_8008EDF0(Player* this);
void func_8008EE08(Player* this);
void func_8008EEAC(PlayState* play, Actor* actor);
s32 func_8008EF44(PlayState* play, s32 ammo);
s32 Player_IsBurningStickInRange(PlayState* play, Vec3f* pos, f32 xzRange, f32 yRange);
s32 Player_GetStrength(void);
u8 Player_GetMask(PlayState* play);
Player* Player_UnsetMask(PlayState* play);
s32 Player_HasMirrorShieldEquipped(PlayState* play);
s32 Player_HasMirrorShieldSetToDraw(PlayState* play);
s32 Player_ActionToMagicSpell(Player* this, s32 itemAction);
s32 Player_HoldsHookshot(Player* this);
s32 func_8008F128(Player* this);
s32 Player_ActionToMeleeWeapon(s32 itemAction);
s32 Player_GetMeleeWeaponHeld(Player* this);
s32 Player_HoldsTwoHandedWeapon(Player* this);
s32 Player_HoldsBrokenKnife(Player* this);
s32 Player_ActionToBottle(Player* this, s32 itemAction);
s32 Player_GetBottleHeld(Player* this);
s32 Player_ActionToExplosive(Player* this, s32 itemAction);
s32 Player_GetExplosiveHeld(Player* this);
s32 func_8008F2BC(Player* this, s32 itemAction);
s32 Player_GetEnvironmentalHazard(PlayState* play);
void Player_DrawImpl(PlayState* play, void** skeleton, Vec3s* jointTable, s32 dListCount, s32 lod, s32 tunic,
                     s32 boots, s32 face, OverrideLimbDrawOpa overrideLimbDraw, PostLimbDrawOpa postLimbDraw,
                     void* data);
s32 Player_OverrideLimbDrawGameplayCommon(PlayState* play, s32 limbIndex, Gfx** dList, Vec3f* pos, Vec3s* rot,
                                          void* thisx);
s32 Player_OverrideLimbDrawGameplayDefault(PlayState* play, s32 limbIndex, Gfx** dList, Vec3f* pos, Vec3s* rot,
                                           void* thisx);
s32 Player_OverrideLimbDrawGameplayFirstPerson(PlayState* play, s32 limbIndex, Gfx** dList, Vec3f* pos, Vec3s* rot,
                                               void* thisx);
s32 Player_OverrideLimbDrawGameplayCrawling(PlayState* play, s32 limbIndex, Gfx** dList, Vec3f* pos, Vec3s* rot,
                                            void* thisx);
u8 func_80090480(PlayState* play, ColliderQuad* collider, WeaponInfo* weaponInfo, Vec3f* newTip, Vec3f* newBase);
void Player_DrawGetItem(PlayState* play, Player* this);
void Player_PostLimbDrawGameplay(PlayState* play, s32 limbIndex, Gfx** dList, Vec3s* rot, void* thisx);
u32 Player_InitPauseDrawData(PlayState* play, u8* segment, SkelAnime* skelAnime);
void Player_DrawPause(PlayState* play, u8* segment, SkelAnime* skelAnime, Vec3f* pos, Vec3s* rot, f32 scale,
                      s32 sword, s32 tunic, s32 shield, s32 boots);
void PreNMI_Init(GameState* thisx);
Gfx* Gfx_SetFog(Gfx* gfx, s32 r, s32 g, s32 b, s32 a, s32 near, s32 far);
Gfx* Gfx_SetFogWithSync(Gfx* gfx, s32 r, s32 g, s32 b, s32 a, s32 near, s32 far);
Gfx* Gfx_SetFog2(Gfx* gfx, s32 r, s32 g, s32 b, s32 a, s32 near, s32 far);
Gfx* Gfx_SetupDL(Gfx* gfx, u32 i);
Gfx* Gfx_SetupDL_57(Gfx* gfx);
Gfx* Gfx_SetupDL_52NoCD(Gfx* gfx);
void Gfx_SetupDL_57Opa(GraphicsContext* gfxCtx);
void Gfx_SetupDL_51Opa(GraphicsContext* gfxCtx);
void Gfx_SetupDL_54Opa(GraphicsContext* gfxCtx);
void Gfx_SetupDL_26Opa(GraphicsContext* gfxCtx);
void Gfx_SetupDL_25Xlu2(GraphicsContext* gfxCtx);
void func_80093C80(PlayState* play);
void Gfx_SetupDL_25Opa(GraphicsContext* gfxCtx);
void Gfx_SetupDL_25Xlu(GraphicsContext* gfxCtx);
Gfx* Gfx_SetupDL_64(Gfx* gfx);
Gfx* Gfx_SetupDL_34(Gfx* gfx);
void Gfx_SetupDL_44Xlu(GraphicsContext* gfxCtx);
void Gfx_SetupDL_36Opa(GraphicsContext* gfxCtx);
void Gfx_SetupDL_28Opa(GraphicsContext* gfxCtx);
Gfx* Gfx_SetupDL_28(Gfx* gfx);
void Gfx_SetupDL_38Xlu(GraphicsContext* gfxCtx);
void Gfx_SetupDL_4Xlu(GraphicsContext* gfxCtx);
void Gfx_SetupDL_37Opa(GraphicsContext* gfxCtx);
Gfx* Gfx_SetupDL_39(Gfx* gfx);
void Gfx_SetupDL_39Opa(GraphicsContext* gfxCtx);
void Gfx_SetupDL_39Overlay(GraphicsContext* gfxCtx);
void Gfx_SetupDL_39Ptr(Gfx** gfxP);
void Gfx_SetupDL_40Opa(GraphicsContext* gfxCtx);
void Gfx_SetupDL_41Opa(GraphicsContext* gfxCtx);
void Gfx_SetupDL_47Xlu(GraphicsContext* gfxCtx);
Gfx* Gfx_SetupDL_20NoCD(Gfx* gfx);
Gfx* Gfx_SetupDL_66(Gfx* gfx);
Gfx* func_800947AC(Gfx* gfx);
void Gfx_SetupDL_42Opa(GraphicsContext* gfxCtx);
void Gfx_SetupDL_42Overlay(GraphicsContext* gfxCtx);
void Gfx_SetupDL_27Xlu(GraphicsContext* gfxCtx);
void Gfx_SetupDL_60NoCDXlu(GraphicsContext* gfxCtx);
void Gfx_SetupDL_61Xlu(GraphicsContext* gfxCtx);
void Gfx_SetupDL_56Ptr(Gfx** gfxP);
Gfx* Gfx_BranchTexScroll(Gfx** gfxP, u32 x, u32 y, s32 width, s32 height);
Gfx* func_80094E78(GraphicsContext* gfxCtx, u32 x, u32 y);
Gfx* Gfx_TexScroll(GraphicsContext* gfxCtx, u32 x, u32 y, s32 width, s32 height);
Gfx* Gfx_TwoTexScroll(GraphicsContext* gfxCtx, s32 tile1, u32 x1, u32 y1, s32 width1, s32 height1, s32 tile2, u32 x2,
                      u32 y2, s32 width2, s32 height2);
Gfx* Gfx_TwoTexScrollEnvColor(GraphicsContext* gfxCtx, s32 tile1, u32 x1, u32 y1, s32 width1, s32 height1, s32 tile2,
                              u32 x2, u32 y2, s32 width2, s32 height2, s32 r, s32 g, s32 b, s32 a);
Gfx* Gfx_EnvColor(GraphicsContext* gfxCtx, s32 r, s32 g, s32 b, s32 a);
void Gfx_SetupFrame(GraphicsContext* gfxCtx, u8 r, u8 g, u8 b);
void func_80095974(GraphicsContext* gfxCtx);
void func_80095AA0(PlayState* play, Room* room, Input* input, s32 arg3);
void Room_DrawBackground2D(Gfx** gfxP, void* tex, void* tlut, u16 width, u16 height, u8 fmt, u8 siz, u16 tlutMode,
                           u16 tlutCount, f32 offsetX, f32 offsetY);
void func_80096FD4(PlayState* play, Room* room);
u32 func_80096FE8(PlayState* play, RoomContext* roomCtx);
s32 func_8009728C(PlayState* play, RoomContext* roomCtx, s32 roomNum);
s32 func_800973FC(PlayState* play, RoomContext* roomCtx);
void Room_Draw(PlayState* play, Room* room, u32 flags);
void func_80097534(PlayState* play, RoomContext* roomCtx);
void Sample_Destroy(GameState* thisx);
void Sample_Init(GameState* thisx);
void Inventory_ChangeEquipment(s16 equipment, u16 value);
u8 Inventory_DeleteEquipment(PlayState* play, s16 equipment);
void Inventory_ChangeUpgrade(s16 upgrade, s16 value);
void Object_InitContext(PlayState* play, ObjectContext* objectCtx);
void Object_UpdateEntries(ObjectContext* objectCtx);
s32 Object_GetSlot(ObjectContext* objectCtx, s16 objectId);
s32 Object_IsLoaded(ObjectContext* objectCtx, s32 slot);
void func_800981B8(ObjectContext* objectCtx);
s32 Scene_ExecuteCommands(PlayState* play, SceneCmd* sceneCmd);
void TransitionActor_InitContext(GameState* state, TransitionActorContext* transiActorCtx);
void Scene_SetTransitionForNextEntrance(PlayState* play);
void Scene_Draw(PlayState* play);

void Skin_UpdateVertices(MtxF* mtx, SkinVertex* skinVertices, SkinLimbModif* modifEntry, Vtx* vtxBuf, Vec3f* pos);
void Skin_DrawAnimatedLimb(GraphicsContext* gfxCtx, Skin* skin, s32 limbIndex, s32 arg3, s32 drawFlags);
void Skin_DrawLimb(GraphicsContext* gfxCtx, Skin* skin, s32 limbIndex, Gfx* dlistOverride, s32 drawFlags);
void func_800A6330(Actor* actor, PlayState* play, Skin* skin, SkinPostDraw postDraw, s32 setTranslation);
void func_800A6360(Actor* actor, PlayState* play, Skin* skin, SkinPostDraw postDraw,
                   SkinOverrideLimbDraw overrideLimbDraw, s32 setTranslation);
void func_800A6394(Actor* actor, PlayState* play, Skin* skin, SkinPostDraw postDraw,
                   SkinOverrideLimbDraw overrideLimbDraw, s32 setTranslation, s32 arg6);
void func_800A63CC(Actor* actor, PlayState* play, Skin* skin, SkinPostDraw postDraw,
                   SkinOverrideLimbDraw overrideLimbDraw, s32 setTranslation, s32 arg6, s32 drawFlags);
void Skin_GetLimbPos(Skin* skin, s32 limbIndex, Vec3f* offset, Vec3f* dst);
void Skin_Init(PlayState* play, Skin* skin, SkeletonHeader* skeletonHeader, AnimationHeader* animationHeader);
void Skin_Free(PlayState* play, Skin* skin);
s32 Skin_ApplyAnimTransformations(Skin* skin, MtxF* limbMatrices, Actor* actor, s32 setTranslation);

void SkinMatrix_Vec3fMtxFMultXYZW(MtxF* mf, Vec3f* src, Vec3f* xyzDest, f32* wDest);
void SkinMatrix_Vec3fMtxFMultXYZ(MtxF* mf, Vec3f* src, Vec3f* dest);
void SkinMatrix_MtxFMtxFMult(MtxF* mfA, MtxF* mfB, MtxF* dest);
void SkinMatrix_GetClear(MtxF** mfp);
void SkinMatrix_MtxFCopy(MtxF* src, MtxF* dest);
s32 SkinMatrix_Invert(MtxF* src, MtxF* dest);
void SkinMatrix_SetScale(MtxF* mf, f32 x, f32 y, f32 z);
void SkinMatrix_SetRotateZYX(MtxF* mf, s16 x, s16 y, s16 z);
void SkinMatrix_SetTranslate(MtxF* mf, f32 x, f32 y, f32 z);
void SkinMatrix_SetTranslateRotateYXZScale(MtxF* dest, f32 scaleX, f32 scaleY, f32 scaleZ, s16 rotX, s16 rotY, s16 rotZ,
                                           f32 translateX, f32 translateY, f32 translateZ);
void SkinMatrix_SetTranslateRotateZYX(MtxF* dest, s16 rotX, s16 rotY, s16 rotZ, f32 translateX, f32 translateY,
                                      f32 translateZ);
Mtx* SkinMatrix_MtxFToNewMtx(GraphicsContext* gfxCtx, MtxF* src);
void SkinMatrix_SetRotateAxis(MtxF* mf, s16 angle, f32 axisX, f32 axisY, f32 axisZ);
void Sram_InitNewSave(void);
void Sram_InitDebugSave(void);
void Sram_OpenSave(SramContext* sramCtx);
void Sram_WriteSave(SramContext* sramCtx);
void Sram_VerifyAndLoadAllSaves(FileSelectState* fileSelect, SramContext* sramCtx);
void Sram_InitSave(FileSelectState* fileSelect, SramContext* sramCtx);
void Sram_EraseSave(FileSelectState* fileSelect, SramContext* sramCtx);
void Sram_CopySave(FileSelectState* fileSelect, SramContext* sramCtx);
void Sram_WriteSramHeader(SramContext* sramCtx);
void Sram_InitSram(GameState* gameState, SramContext* sramCtx);
void Sram_Alloc(GameState* gameState, SramContext* sramCtx);
void Sram_Init(PlayState* play, SramContext* sramCtx);
void SsSram_Init(u32 addr, u8 handleType, u8 handleDomain, u8 handleLatency, u8 handlePageSize, u8 handleRelDuration,
                 u8 handlePulse, u32 handleSpeed);
void SsSram_Dma(void* dramAddr, size_t size, s32 direction);
void SsSram_ReadWrite(u32 addr, void* dramAddr, size_t size, s32 direction);
View* View_New(GraphicsContext* gfxCtx);
void View_Free(View* view);
void View_Init(View*, GraphicsContext*);
void View_LookAt(View* view, Vec3f* eye, Vec3f* at, Vec3f* up);
void View_LookAtUnsafe(View* view, Vec3f* eye, Vec3f* at, Vec3f* up);
void View_SetScale(View* view, f32 scale);
void View_GetScale(View* view, f32* scale);
void View_SetPerspective(View* view, f32 fovy, f32 zNear, f32 zFar);
void View_GetPerspective(View* view, f32* fovy, f32* zNear, f32* zFar);
void View_SetOrtho(View* view, f32 fovy, f32 zNear, f32 zFar);
void View_GetOrtho(View* view, f32* fovy, f32* zNear, f32* zFar);
void View_SetViewport(View* view, Viewport* viewport);
void View_GetViewport(View* view, Viewport* viewport);
void View_SetDistortionOrientation(View* view, f32 rotX, f32 rotY, f32 rotZ);
void View_SetDistortionScale(View* view, f32 scaleX, f32 scaleY, f32 scaleZ);
s32 View_SetDistortionSpeed(View* view, f32 speed);
void View_InitDistortion(View* view);
void View_ClearDistortion(View* view);
void View_SetDistortion(View* view, Vec3f orientation, Vec3f scale, f32 speed);
s32 View_StepDistortion(View* view, Mtx* projectionMtx);
void View_Apply(View* view, s32 mask);
s32 View_ApplyOrthoToOverlay(View* view);
s32 View_ApplyPerspectiveToOverlay(View* view);
s32 View_UpdateViewingMatrix(View* view);
s32 View_ApplyTo(View* view, s32 mask, Gfx** gfxP);
s32 View_ErrorCheckEyePosition(f32 eyeX, f32 eyeY, f32 eyeZ);
void ViMode_LogPrint(OSViMode* osViMode);
void ViMode_Configure(ViMode* viMode, s32 type, s32 tvType, s32 loRes, s32 antialiasOff, s32 modeN, s32 fb16Bit,
                      s32 width, s32 height, s32 leftAdjust, s32 rightAdjust, s32 upperAdjust, s32 lowerAdjust);
void ViMode_Save(ViMode* viMode);
void ViMode_Load(ViMode* viMode);
void ViMode_Init(ViMode* viMode);
void ViMode_Destroy(ViMode* viMode);
void ViMode_ConfigureFeatures(ViMode* viMode, s32 viFeatures);
void ViMode_Update(ViMode* viMode, Input* input);
void PlayerCall_InitFuncPtrs(void);
void TransitionTile_Destroy(TransitionTile* this);
TransitionTile* TransitionTile_Init(TransitionTile* this, s32 cols, s32 rows);
void TransitionTile_Draw(TransitionTile* this, Gfx** gfxP);
void TransitionTile_Update(TransitionTile* this);
void TransitionTriforce_Start(void* thisx);
void* TransitionTriforce_Init(void* thisx);
void TransitionTriforce_Destroy(void* thisx);
void TransitionTriforce_Update(void* thisx, s32 updateRate);
void TransitionTriforce_SetColor(void* thisx, u32 color);
void TransitionTriforce_SetType(void* thisx, s32 type);
void TransitionTriforce_Draw(void* thisx, Gfx** gfxP);
s32 TransitionTriforce_IsDone(void* thisx);
void TransitionWipe_Start(void* thisx);
void* TransitionWipe_Init(void* thisx);
void TransitionWipe_Destroy(void* thisx);
void TransitionWipe_Update(void* thisx, s32 updateRate);
void TransitionWipe_Draw(void* thisx, Gfx** gfxP);
s32 TransitionWipe_IsDone(void* thisx);
void TransitionWipe_SetType(void* thisx, s32 type);
void TransitionWipe_SetColor(void* thisx, u32 color);
void TransitionCircle_Start(void* thisx);
void* TransitionCircle_Init(void* thisx);
void TransitionCircle_Destroy(void* thisx);
void TransitionCircle_Update(void* thisx, s32 updateRate);
void TransitionCircle_Draw(void* thisx, Gfx** gfxP);
s32 TransitionCircle_IsDone(void* thisx);
void TransitionCircle_SetType(void* thisx, s32 type);
void TransitionCircle_SetColor(void* thisx, u32 color);
void TransitionCircle_SetUnkColor(void* thisx, u32 color);
void TransitionFade_Start(void* thisx);
void* TransitionFade_Init(void* thisx);
void TransitionFade_Destroy(void* thisx);
void TransitionFade_Update(void* thisx, s32 updateRate);
void TransitionFade_Draw(void* thisx, Gfx** gfxP);
s32 TransitionFade_IsDone(void* thisx);
void TransitionFade_SetColor(void* thisx, u32 color);
void TransitionFade_SetType(void* thisx, s32 type);
void Letterbox_SetSizeTarget(s32 target);
u32 Letterbox_GetSizeTarget(void);
void Letterbox_SetSize(s32 size);
u32 Letterbox_GetSize(void);
void Letterbox_Init(void);
void Letterbox_Destroy(void);
void Letterbox_Update(s32 updateRate);

#ifdef ENABLE_CAMERA_DEBUGGER
void DebugCamera_Init(DebugCam* debugCam, Camera* cameraPtr);
void DebugCamera_Enable(DebugCam* debugCam, Camera* cam);
void DebugCamera_Update(DebugCam* debugCam, Camera* cam);
void DebugCamera_Reset(Camera* cam, DebugCam* debugCam);
#endif

void func_800BB0A0(f32 u, Vec3f* pos, f32* roll, f32* viewAngle, f32* point0, f32* point1, f32* point2, f32* point3);
s32 func_800BB2B4(Vec3f* pos, f32* roll, f32* fov, CutsceneCameraPoint* point, s16* keyFrame, f32* curFrame);
void KaleidoManager_LoadOvl(KaleidoMgrOverlay* ovl);
void KaleidoManager_ClearOvl(KaleidoMgrOverlay* ovl);
void KaleidoManager_Init(PlayState* play);
void KaleidoManager_Destroy(void);
void* KaleidoManager_GetRamAddr(void* vram);
void KaleidoScopeCall_LoadPlayer(void);
void KaleidoScopeCall_Init(PlayState* play);
void KaleidoScopeCall_Destroy(PlayState* play);
void KaleidoScopeCall_Update(PlayState* play);
void KaleidoScopeCall_Draw(PlayState* play);
void Play_SetViewpoint(PlayState* this, s16 viewpoint);
s32 Play_CheckViewpoint(PlayState* this, s16 viewpoint);
void Play_SetShopBrowsingViewpoint(PlayState* this);
Gfx* Play_SetFog(PlayState* this, Gfx* gfx);
void Play_Destroy(GameState* thisx);
void Play_Init(GameState* thisx);
void Play_Main(GameState* thisx);
s32 Play_InCsMode(PlayState* this);
f32 func_800BFCB8(PlayState* this, MtxF* mf, Vec3f* pos);
void* Play_LoadFile(PlayState* this, RomFile* file);
void Play_GetScreenPos(PlayState* this, Vec3f* src, Vec3f* dest);
s16 Play_CreateSubCamera(PlayState* this);
s16 Play_GetActiveCamId(PlayState* this);
s16 Play_ChangeCameraStatus(PlayState* this, s16 camId, s16 status);
void Play_ClearCamera(PlayState* this, s16 camId);
void Play_ClearAllSubCameras(PlayState* this);
Camera* Play_GetCamera(PlayState* this, s16 camId);
s32 Play_SetCameraAtEye(PlayState* this, s16 camId, Vec3f* at, Vec3f* eye);
s32 Play_SetCameraAtEyeUp(PlayState* this, s16 camId, Vec3f* at, Vec3f* eye, Vec3f* up);
s32 Play_SetCameraFov(PlayState* this, s16 camId, f32 fov);
s32 Play_SetCameraRoll(PlayState* this, s16 camId, s16 roll);
void Play_CopyCamera(PlayState* this, s16 destCamId, s16 srcCamId);
s32 Play_InitCameraDataUsingPlayer(PlayState* this, s16 camId, Player* player, s16 setting);
s32 Play_ChangeCameraSetting(PlayState* this, s16 camId, s16 setting);
void Play_ReturnToMainCam(PlayState* this, s16 camId, s16 duration);
void Play_SaveSceneFlags(PlayState* this);
void Play_SetupRespawnPoint(PlayState* this, s32 respawnMode, s32 playerParams);
void Play_TriggerVoidOut(PlayState* this);
void Play_TriggerRespawn(PlayState* this);
s32 Play_CamIsNotFixed(PlayState* this);

#ifdef ENABLE_FRAMERATE_OPTIONS
s32 FrameAdvance_IsEnabled(PlayState* this);
#endif

s32 func_800C0D34(PlayState* this, Actor* actor, s16* yaw);
s32 func_800C0DB4(PlayState* this, Vec3f* pos);
void PreRender_SetValuesSave(PreRender* this, u32 width, u32 height, void* fbuf, void* zbuf, void* cvg);
void PreRender_Init(PreRender* this);
void PreRender_SetValues(PreRender* this, u32 width, u32 height, void* fbuf, void* zbuf);
void PreRender_Destroy(PreRender* this);
#ifdef ENABLE_PAUSE_BG_AA
void func_800C170C(PreRender* this, Gfx** gfxP, void* buf, void* bufSave, u32 r, u32 g, u32 b, u32 a);
void func_800C1AE8(PreRender* this, Gfx** gfxP, void* fbuf, void* fbufSave);
void PreRender_SaveZBuffer(PreRender* this, Gfx** gfxP);
void PreRender_SaveFramebuffer(PreRender* this, Gfx** gfxP);
void PreRender_DrawCoverage(PreRender* this, Gfx** gfxP);
void PreRender_RestoreZBuffer(PreRender* this, Gfx** gfxP);
void func_800C213C(PreRender* this, Gfx** gfxP);
void PreRender_RestoreFramebuffer(PreRender* this, Gfx** gfxP);
void PreRender_CopyImageRegion(PreRender* this, Gfx** gfxP);
void PreRender_ApplyFilters(PreRender* this);
#endif
void AudioMgr_StopAllSfx(void);
void func_800C3C80(AudioMgr* audioMgr);
void AudioMgr_HandleRetrace(AudioMgr* audioMgr);
void AudioMgr_HandlePreNMI(AudioMgr* audioMgr);
void AudioMgr_ThreadEntry(void* arg0);
void AudioMgr_Unlock(AudioMgr* audioMgr);
void AudioMgr_Init(AudioMgr* audioMgr, void* stack, OSPri pri, OSId id, Scheduler* sched, IrqMgr* irqMgr);
void GameState_FaultPrint(void);
void GameState_SetFBFilter(Gfx** gfxP);
#ifdef SHOW_INPUT_DISPLAY
void GameState_DrawInputDisplay(u16 input, Gfx** gfxP);
#endif
void GameState_Draw(GameState* gameState, GraphicsContext* gfxCtx);
void GameState_SetFrameBuffer(GraphicsContext* gfxCtx);
void GameState_ReqPadData(GameState* gameState);
void GameState_Update(GameState* gameState);
void GameState_InitArena(GameState* gameState, size_t size);
void GameState_Realloc(GameState* gameState, size_t size);
void GameState_Init(GameState* gameState, GameStateFunc init, GraphicsContext* gfxCtx);
void GameState_Destroy(GameState* gameState);
GameStateFunc GameState_GetInit(GameState* gameState);
u32 GameState_IsRunning(GameState* gameState);
void* GameState_Alloc(GameState* gameState, size_t size, char* file, s32 line);
void func_800C55D0(GameAlloc* this);
void* GameAlloc_MallocDebug(GameAlloc* this, u32 size, const char* file, s32 line);
void* GameAlloc_Malloc(GameAlloc* this, u32 size);
void GameAlloc_Free(GameAlloc* this, void* data);
void GameAlloc_Cleanup(GameAlloc* this);
void GameAlloc_Init(GameAlloc* this);
void Graph_FaultClient(void);
void Graph_DisassembleUCode(Gfx* workBuf);
void Graph_UCodeFaultClient(Gfx* workBuf);
void Graph_InitTHGA(GraphicsContext* gfxCtx);
GameStateOverlay* Graph_GetNextGameState(GameState* gameState);
void Graph_Init(GraphicsContext* gfxCtx);
void Graph_Destroy(GraphicsContext* gfxCtx);
void Graph_TaskSet00(GraphicsContext* gfxCtx);
void Graph_Update(GraphicsContext* gfxCtx, GameState* gameState);
void Graph_ThreadEntry(void*);
void* Graph_Alloc(GraphicsContext* gfxCtx, size_t size);
void* Graph_Alloc2(GraphicsContext* gfxCtx, size_t size);

#ifndef DISABLE_DEBUG_FEATURES
void Graph_OpenDisps(Gfx** dispRefs, GraphicsContext* gfxCtx, const char* file, s32 line);
void Graph_CloseDisps(Gfx** dispRefs, GraphicsContext* gfxCtx, const char* file, s32 line);
#endif

Gfx* Graph_GfxPlusOne(Gfx* gfx);
Gfx* Graph_BranchDlist(Gfx* gfx, Gfx* dst);
void* Graph_DlistAlloc(Gfx** gfxP, u32 size);
ListAlloc* ListAlloc_Init(ListAlloc* this);
void* ListAlloc_Alloc(ListAlloc* this, u32 size);
void ListAlloc_Free(ListAlloc* this, void* data);
void ListAlloc_FreeAll(ListAlloc* this);
void Main_LogSystemHeap(void);
void Main(void* arg);
void SysCfb_Init(s32 n64dd);
void* SysCfb_GetFbPtr(s32 idx);
void* SysCfb_GetFbEnd(void);
f32 Math_FactorialF(f32 n);
f32 Math_Factorial(s32 n);
f32 Math_PowF(f32 base, s32 exp);
f32 Math_SinF(f32 angle);
f32 Math_CosF(f32 angle);
s32 Math3D_PlaneVsLineSegClosestPoint(f32 planeAA, f32 planeAB, f32 planeAC, f32 planeADist, f32 planeBA, f32 planeBB,
                                      f32 planeBC, f32 planeBDist, Vec3f* linePointA, Vec3f* linePointB,
                                      Vec3f* closestPoint);
void Math3D_LineClosestToPoint(InfiniteLine* line, Vec3f* pos, Vec3f* closestPoint);
s32 Math3D_PlaneVsPlaneVsLineClosestPoint(f32 planeAA, f32 planeAB, f32 planeAC, f32 planeADist, f32 planeBA,
                                          f32 planeBB, f32 planeBC, f32 planeBDist, Vec3f* point, Vec3f* closestPoint);
void Math3D_LineSplitRatio(Vec3f* v0, Vec3f* v1, f32 ratio, Vec3f* ret);
f32 Math3D_Cos(Vec3f* a, Vec3f* b);
s32 Math3D_CosOut(Vec3f* a, Vec3f* b, f32* dst);
void Math3D_Vec3fReflect(Vec3f* vec, Vec3f* normal, Vec3f* reflVec);
s32 Math3D_PointInSquare2D(f32 upperLeftX, f32 lowerRightX, f32 upperLeftY, f32 lowerRightY, f32 x, f32 y);
f32 Math3D_Dist1DSq(f32 a, f32 b);
f32 Math3D_Dist2DSq(f32 x0, f32 y0, f32 x1, f32 y1);
f32 Math3D_Vec3fMagnitudeSq(Vec3f* vec);
f32 Math3D_Vec3fMagnitude(Vec3f* vec);
f32 Math3D_Vec3fDistSq(Vec3f* a, Vec3f* b);
void Math3D_Vec3f_Cross(Vec3f* a, Vec3f* b, Vec3f* ret);
void Math3D_SurfaceNorm(Vec3f* va, Vec3f* vb, Vec3f* vc, Vec3f* normal);
f32 Math3D_Vec3f_DistXYZ(Vec3f* a, Vec3f* b);
s32 Math3D_PointRelativeToCubeFaces(Vec3f* point, Vec3f* min, Vec3f* max);
s32 Math3D_PointRelativeToCubeEdges(Vec3f* point, Vec3f* min, Vec3f* max);
s32 Math3D_PointRelativeToCubeVertices(Vec3f* point, Vec3f* min, Vec3f* max);
s32 Math3D_LineVsCube(Vec3f* min, Vec3f* max, Vec3f* a, Vec3f* b);
void Math3D_RotateXZPlane(Vec3f* pointOnPlane, s16 angle, f32* a, f32* c, f32* d);
void Math3D_DefPlane(Vec3f* va, Vec3f* vb, Vec3f* vc, f32* nx, f32* ny, f32* nz, f32* originDist);
f32 Math3D_UDistPlaneToPos(f32 nx, f32 ny, f32 nz, f32 originDist, Vec3f* p);
f32 Math3D_DistPlaneToPos(f32 nx, f32 ny, f32 nz, f32 originDist, Vec3f* p);
s32 Math3D_TriChkPointParaYSlopedY(Vec3f* v0, Vec3f* v1, Vec3f* v2, f32 z, f32 x);
s32 Math3D_TriChkPointParaYIntersectDist(Vec3f* v0, Vec3f* v1, Vec3f* v2, f32 nx, f32 ny, f32 nz, f32 originDist, f32 z,
                                         f32 x, f32* yIntersect, f32 chkDist);
s32 Math3D_TriChkPointParaYIntersectInsideTri(Vec3f* v0, Vec3f* v1, Vec3f* v2, f32 nx, f32 ny, f32 nz, f32 originDist,
                                              f32 z, f32 x, f32* yIntersect, f32 chkDist);
s32 Math3D_TriChkLineSegParaYIntersect(Vec3f* v0, Vec3f* v1, Vec3f* v2, f32 nx, f32 ny, f32 nz, f32 originDist, f32 z,
                                       f32 x, f32* yIntersect, f32 y0, f32 y1);
s32 Math3D_TriChkPointParaYDist(Vec3f* v0, Vec3f* v1, Vec3f* v2, Plane* plane, f32 z, f32 x, f32 chkDist);
s32 Math3D_TriChkPointParaXIntersect(Vec3f* v0, Vec3f* v1, Vec3f* v2, f32 nx, f32 ny, f32 nz, f32 originDist, f32 y,
                                     f32 z, f32* xIntersect);
s32 Math3D_TriChkLineSegParaXIntersect(Vec3f* v0, Vec3f* v1, Vec3f* v2, f32 nx, f32 ny, f32 nz, f32 originDist, f32 y,
                                       f32 z, f32* xIntersect, f32 x0, f32 x1);
s32 Math3D_TriChkPointParaXDist(Vec3f* v0, Vec3f* v1, Vec3f* v2, Plane* plane, f32 y, f32 z, f32 chkDist);
s32 Math3D_TriChkPointParaZIntersect(Vec3f* v0, Vec3f* v1, Vec3f* v2, f32 nx, f32 ny, f32 nz, f32 originDist, f32 x,
                                     f32 y, f32* zIntersect);
s32 Math3D_TriChkLineSegParaZIntersect(Vec3f* v0, Vec3f* v1, Vec3f* v2, f32 nx, f32 ny, f32 nz, f32 originDist, f32 x,
                                       f32 y, f32* zIntersect, f32 z0, f32 z1);
s32 Math3D_TriChkLineSegParaZDist(Vec3f* v0, Vec3f* v1, Vec3f* v2, Plane* plane, f32 x, f32 y, f32 chkDist);
s32 Math3D_LineSegVsPlane(f32 nx, f32 ny, f32 nz, f32 originDist, Vec3f* linePointA, Vec3f* linePointB,
                          Vec3f* intersect, s32 fromFront);
void Math3D_TriNorm(TriNorm* tri, Vec3f* va, Vec3f* vb, Vec3f* vc);
s32 Math3D_PointDistSqToLine2D(f32 x0, f32 y0, f32 x1, f32 y1, f32 x2, f32 y2, f32* lineLenSq);
s32 Math3D_LineVsSph(Sphere16* sphere, Linef* line);
s32 Math3D_TriVsSphIntersect(Sphere16* sphere, TriNorm* tri, Vec3f* intersectPoint);
s32 Math3D_CylVsLineSeg(Cylinder16* cyl, Vec3f* linePointA, Vec3f* linePointB, Vec3f* intersectA, Vec3f* intersectB);
s32 Math3D_CylVsTri(Cylinder16* cyl, TriNorm* tri);
s32 Math3D_CylTriVsIntersect(Cylinder16* cyl, TriNorm* tri, Vec3f* intersect);
s32 Math3D_SphVsSph(Sphere16* sphereA, Sphere16* sphereB);
s32 Math3D_SphVsSphOverlap(Sphere16* sphereA, Sphere16* sphereB, f32* overlapSize);
s32 Math3D_SphVsSphOverlapCenter(Sphere16* sphereA, Sphere16* sphereB, f32* overlapSize, f32* centerDist);
s32 Math3D_SphVsCylOverlapDist(Sphere16* sph, Cylinder16* cyl, f32* overlapSize);
s32 Math3D_SphVsCylOverlapCenterDist(Sphere16* sph, Cylinder16* cyl, f32* overlapSize, f32* centerDist);
s32 Math3D_CylOutsideCyl(Cylinder16* ca, Cylinder16* cb, f32* deadSpace);
s32 Math3D_CylOutsideCylDist(Cylinder16* ca, Cylinder16* cb, f32* deadSpace, f32* xzDist);
s32 Math3D_TriVsTriIntersect(TriNorm* ta, TriNorm* tb, Vec3f* intersect);
s32 Math3D_XZInSphere(Sphere16* sphere, f32 x, f32 z);
s32 Math3D_XYInSphere(Sphere16* sphere, f32 x, f32 y);
s32 Math3D_YZInSphere(Sphere16* sphere, f32 y, f32 z);
void Math3D_DrawSphere(PlayState* play, Sphere16* sph);
void Math3D_DrawCylinder(PlayState* play, Cylinder16* cyl);
s16 Math_Atan2S(f32 x, f32 y);
f32 Math_Atan2F(f32 x, f32 y);
void Matrix_Init(GameState* gameState);
void Matrix_Push(void);
void Matrix_Pop(void);
void Matrix_Get(MtxF* dest);
void Matrix_Put(MtxF* src);
void Matrix_Mult(MtxF* mf, u8 mode);
void Matrix_Translate(f32 x, f32 y, f32 z, u8 mode);
void Matrix_Scale(f32 x, f32 y, f32 z, u8 mode);
void Matrix_RotateX(f32 x, u8 mode);
void Matrix_RotateY(f32 y, u8 mode);
void Matrix_RotateZ(f32 z, u8 mode);
void Matrix_RotateZYX(s16 x, s16 y, s16 z, u8 mode);
void Matrix_TranslateRotateZYX(Vec3f* translation, Vec3s* rotation);
void Matrix_SetTranslateRotateYXZ(f32 translateX, f32 translateY, f32 translateZ, Vec3s* rot);
Mtx* Matrix_MtxFToMtx(MtxF* src, Mtx* dest);
Mtx* Matrix_ToMtx(Mtx* dest, char* file, s32 line);
Mtx* Matrix_NewMtx(GraphicsContext* gfxCtx, char* file, s32 line);
Mtx* Matrix_MtxFToNewMtx(MtxF* src, GraphicsContext* gfxCtx);
void Matrix_MultVec3f(Vec3f* src, Vec3f* dest);
void Matrix_MtxFCopy(MtxF* dest, MtxF* src);
void Matrix_MtxToMtxF(Mtx* src, MtxF* dest);
void Matrix_MultVec3fExt(Vec3f* src, Vec3f* dest, MtxF* mf);
void Matrix_Transpose(MtxF* mf);
void Matrix_ReplaceRotation(MtxF* mf);
void Matrix_MtxFToYXZRotS(MtxF* mf, Vec3s* rotDest, s32 flag);
void Matrix_MtxFToZYXRotS(MtxF* mf, Vec3s* rotDest, s32 flag);
void Matrix_RotateAxis(f32 angle, Vec3f* axis, u8 mode);
MtxF* Matrix_CheckFloats(MtxF* mf, char* file, s32 line);
void Matrix_SetTranslateScaleMtx2(Mtx* mtx, f32 scaleX, f32 scaleY, f32 scaleZ, f32 translateX, f32 translateY,
                                  f32 translateZ);
u64* SysUcode_GetUCodeBoot(void);
size_t SysUcode_GetUCodeBootSize(void);
u64* SysUcode_GetUCode(void);
u64* SysUcode_GetUCodeData(void);
NORETURN void func_800D31A0(void);
void func_800D31F0(void);
void func_800D3210(void);

#ifdef ENABLE_DEBUG_HEAP
void DebugArena_CheckPointer(void* ptr, u32 size, const char* name, const char* action);
void* DebugArena_Malloc(u32 size);
void* DebugArena_MallocDebug(u32 size, const char* file, s32 line);
void* DebugArena_MallocR(u32 size);
void* DebugArena_MallocRDebug(u32 size, const char* file, s32 line);
void* DebugArena_Realloc(void* ptr, u32 newSize);
void* DebugArena_ReallocDebug(void* ptr, u32 newSize, const char* file, s32 line);
void DebugArena_Free(void* ptr);
void DebugArena_FreeDebug(void* ptr, const char* file, s32 line);
void* DebugArena_Calloc(u32 num, u32 size);
void DebugArena_Display(void);
void DebugArena_GetSizes(u32* outMaxFree, u32* outFree, u32* outAlloc);
void DebugArena_Check(void);
void DebugArena_Init(void* start, u32 size);
void DebugArena_Cleanup(void);
u8 DebugArena_IsInitialized(void);
#endif

void UCodeDisas_Init(UCodeDisas*);
void UCodeDisas_Destroy(UCodeDisas*);
void UCodeDisas_Disassemble(UCodeDisas*, Gfx*);
void UCodeDisas_RegisterUCode(UCodeDisas*, s32, UCodeInfo*);
void UCodeDisas_SetCurUCode(UCodeDisas*, void*);
Acmd* AudioSynth_Update(Acmd* cmdStart, s32* cmdCnt, s16* aiStart, s32 aiBufLen);
void AudioHeap_DiscardFont(s32 fontId);
void AudioHeap_DiscardSequence(s32 seqId);
void AudioHeap_WritebackDCache(void* ramAddr, u32 size);
void* AudioHeap_AllocZeroedAttemptExternal(AudioAllocPool* pool, u32 size);
void* AudioHeap_AllocAttemptExternal(AudioAllocPool* pool, u32 size);
void* AudioHeap_AllocDmaMemory(AudioAllocPool* pool, u32 size);
void* AudioHeap_AllocDmaMemoryZeroed(AudioAllocPool* pool, u32 size);
void* AudioHeap_AllocZeroed(AudioAllocPool* pool, u32 size);
void* AudioHeap_Alloc(AudioAllocPool* pool, u32 size);
void AudioHeap_InitPool(AudioAllocPool* pool, void* ramAddr, u32 size);
void AudioHeap_PopPersistentCache(s32 tableType);
void AudioHeap_InitMainPools(s32 initPoolSize);
void* AudioHeap_AllocCached(s32 tableType, s32 size, s32 cache, s32 id);
void* AudioHeap_SearchCaches(s32 tableType, s32 cache, s32 id);
void* AudioHeap_SearchRegularCaches(s32 tableType, s32 cache, s32 id);
void AudioHeap_LoadFilter(s16* filter, s32 lowPassCutoff, s32 highPassCutoff);
s32 AudioHeap_ResetStep(void);
void AudioHeap_Init(void);
void* AudioHeap_SearchPermanentCache(s32 tableType, s32 id);
void* AudioHeap_AllocPermanent(s32 tableType, s32 id, u32 size);
void* AudioHeap_AllocSampleCache(u32 size, s32 fontId, void* sampleAddr, s8 medium, s32 cache);
void AudioHeap_ApplySampleBankCache(s32 sampleBankId);
void AudioLoad_DecreaseSampleDmaTtls(void);
void* AudioLoad_DmaSampleData(u32 devAddr, u32 size, s32 arg2, u8* dmaIndexRef, s32 medium);
void AudioLoad_InitSampleDmaBuffers(s32 numNotes);
s32 AudioLoad_IsFontLoadComplete(s32 fontId);
s32 AudioLoad_IsSeqLoadComplete(s32 seqId);
void AudioLoad_SetFontLoadStatus(s32 fontId, s32 loadStatus);
void AudioLoad_SetSeqLoadStatus(s32 seqId, s32 loadStatus);
void AudioLoad_SyncLoadSeqParts(s32 seqId, s32 arg1);
s32 AudioLoad_SyncLoadInstrument(s32 fontId, s32 instId, s32 drumId);
void AudioLoad_AsyncLoadSeq(s32 seqId, s32 arg1, s32 retData, OSMesgQueue* retQueue);
void AudioLoad_AsyncLoadSampleBank(s32 sampleBankId, s32 arg1, s32 retData, OSMesgQueue* retQueue);
void AudioLoad_AsyncLoadFont(s32 fontId, s32 arg1, s32 retData, OSMesgQueue* retQueue);
u8* AudioLoad_GetFontsForSequence(s32 seqId, u32* outNumFonts);
void AudioLoad_DiscardSeqFonts(s32 seqId);
s32 AudioLoad_SyncInitSeqPlayer(s32 playerIdx, s32 seqId, s32 arg2);
s32 AudioLoad_SyncInitSeqPlayerSkipTicks(s32 playerIdx, s32 seqId, s32 skipTicks);
void AudioLoad_ProcessLoads(s32 resetStatus);
void AudioLoad_SetDmaHandler(DmaHandler callback);
void AudioLoad_Init(void* heap, u32 heapSize);
void AudioLoad_InitSlowLoads(void);
s32 AudioLoad_SlowLoadSample(s32 fontId, s32 instId, s8* status);
s32 AudioLoad_SlowLoadSeq(s32 seqId, u8* ramAddr, s8* status);
void AudioLoad_InitAsyncLoads(void);
void AudioLoad_LoadPermanentSamples(void);
void AudioLoad_ScriptLoad(s32 tableType, s32 id, s8* status);
void AudioLoad_ProcessScriptLoads(void);
void AudioLoad_InitScriptLoads(void);
AudioTask* func_800E4FE0(void);
void Audio_QueueCmdF32(u32 opArgs, f32 data);
void Audio_QueueCmdS32(u32 opArgs, s32 data);
void Audio_QueueCmdS8(u32 opArgs, s8 data);
void Audio_QueueCmdU16(u32 opArgs, u16 data);
s32 Audio_ScheduleProcessCmds(void);
u32 func_800E5E20(u32* out);
u8* func_800E5E84(s32 arg0, u32* arg1);
s32 func_800E5EDC(void);
s32 func_800E5F88(s32 resetPreloadID);
void Audio_PreNMIInternal(void);
s32 func_800E6680(void);
u32 Audio_NextRandom(void);
void Audio_InitMesgQueues(void);
void Audio_InvalDCache(void* buf, s32 size);
void Audio_WritebackDCache(void* buf, s32 size);
s32 osAiSetNextBuffer(void*, u32);
void Audio_InitNoteSub(Note* note, NoteSubEu* sub, NoteSubAttributes* attrs);
void Audio_NoteSetResamplingRate(NoteSubEu* noteSubEu, f32 resamplingRateInput);
void Audio_NoteInit(Note* note);
void Audio_NoteDisable(Note* note);
void Audio_ProcessNotes(void);
TunedSample* Audio_GetInstrumentTunedSample(Instrument* instrument, s32 semitone);
Instrument* Audio_GetInstrumentInner(s32 fontId, s32 instId);
Drum* Audio_GetDrum(s32 fontId, s32 drumId);
SoundEffect* Audio_GetSoundEffect(s32 fontId, s32 sfxId);
s32 Audio_SetFontInstrument(s32 instrumentType, s32 fontId, s32 index, void* value);
void Audio_SeqLayerDecayRelease(SequenceLayer* layer, s32 target);
void Audio_SeqLayerNoteDecay(SequenceLayer* layer);
void Audio_SeqLayerNoteRelease(SequenceLayer* layer);
s32 Audio_BuildSyntheticWave(Note* note, SequenceLayer* layer, s32 waveId);
void Audio_InitSyntheticWave(Note* note, SequenceLayer* layer);
void Audio_InitNoteList(AudioListItem* list);
void Audio_InitNoteLists(NotePool* pool);
void Audio_InitNoteFreeList(void);
void Audio_NotePoolClear(NotePool* pool);
void Audio_NotePoolFill(NotePool* pool, s32 count);
void Audio_AudioListPushFront(AudioListItem* list, AudioListItem* item);
void Audio_AudioListRemove(AudioListItem* item);
Note* Audio_FindNodeWithPrioLessThan(AudioListItem* list, s32 limit);
void Audio_NoteInitForLayer(Note* note, SequenceLayer* layer);
void func_800E82C0(Note* note, SequenceLayer* layer);
void Audio_NoteReleaseAndTakeOwnership(Note* note, SequenceLayer* layer);
Note* Audio_AllocNoteFromDisabled(NotePool* pool, SequenceLayer* layer);
Note* Audio_AllocNoteFromDecaying(NotePool* pool, SequenceLayer* layer);
Note* Audio_AllocNoteFromActive(NotePool* pool, SequenceLayer* layer);
Note* Audio_AllocNote(SequenceLayer* layer);
void Audio_NoteInitAll(void);
void Audio_SequenceChannelProcessSound(SequenceChannel* channel, s32 recalculateVolume, s32 applyBend);
void Audio_SequencePlayerProcessSound(SequencePlayer* seqPlayer);
f32 Audio_GetPortamentoFreqScale(Portamento* portamento);
s16 Audio_GetVibratoPitchChange(VibratoState* vib);
f32 Audio_GetVibratoFreqScale(VibratoState* vib);
void Audio_NoteVibratoUpdate(Note* note);
void Audio_NoteVibratoInit(Note* note);
void Audio_NotePortamentoInit(Note* note);
void Audio_AdsrInit(AdsrState* adsr, EnvelopePoint* envelope, s16* volOut);
f32 Audio_AdsrUpdate(AdsrState* adsr);
void AudioSeq_SequenceChannelDisable(SequenceChannel* channel);
void AudioSeq_SequencePlayerDisableAsFinished(SequencePlayer* seqPlayer);
void AudioSeq_SequencePlayerDisable(SequencePlayer* seqPlayer);
void AudioSeq_AudioListPushBack(AudioListItem* list, AudioListItem* item);
void* AudioSeq_AudioListPopBack(AudioListItem* list);
void AudioSeq_ProcessSequences(s32 arg0);
void AudioSeq_SkipForwardSequence(SequencePlayer* seqPlayer);
void AudioSeq_ResetSequencePlayer(SequencePlayer* seqPlayer);
void AudioSeq_InitSequencePlayerChannels(s32 playerIdx);
void AudioSeq_InitSequencePlayers(void);
void AudioOcarina_Start(u16 ocarinaFlags);
void AudioOcarina_SetInstrument(u8 ocarinaInstrumentId);
void AudioOcarina_SetPlaybackSong(s8 songIndexPlusOne, s8 playbackState);
void AudioOcarina_SetRecordingState(u8 recordingState);
OcarinaStaff* AudioOcarina_GetRecordingStaff(void);
OcarinaStaff* AudioOcarina_GetPlayingStaff(void);
OcarinaStaff* AudioOcarina_GetPlaybackStaff(void);
void AudioOcarina_MemoryGameInit(u8 minigameRound);
s32 AudioOcarina_MemoryGameNextNote(void);
void AudioOcarina_PlayLongScarecrowSong(void);

#ifdef ENABLE_AUDIO_DEBUGGER
void AudioDebug_Draw(GfxPrint* printer);
void AudioDebug_ScrPrt(const char* str, u16 num);
#endif

void func_800F3054(void);
void Audio_SetSfxProperties(u8 bankId, u8 entryIdx, u8 channelIdx);
void Audio_PlayCutsceneEffectsSequence(u8 csEffectType);
void func_800F4010(Vec3f* pos, u16 sfxId, f32);
void Audio_PlaySfxRandom(Vec3f* pos, u16 baseSfxId, u8 randLim);
void func_800F4138(Vec3f* pos, u16 sfxId, f32);
void func_800F4190(Vec3f* pos, u16 sfxId);
void func_800F436C(Vec3f* pos, u16 sfxId, f32 arg2);
void func_800F4414(Vec3f* pos, u16 sfxId, f32);
void func_800F44EC(s8 arg0, s8 arg1);
void func_800F4524(Vec3f* pos, u16 sfxId, s8 arg2);
void func_800F4254(Vec3f* pos, u8 level);
void Audio_PlaySfxRiver(Vec3f* pos, f32 freqScale);
void Audio_PlaySfxWaterfall(Vec3f* pos, f32 freqScale);
void Audio_SetBgmVolumeOffDuringFanfare(void);
void Audio_SetBgmVolumeOnDuringFanfare(void);
void Audio_SetMainBgmVolume(u8 targetVol, u8 volFadeTimer);
void Audio_SetGanonsTowerBgmVolumeLevel(u8 ganonsTowerLevel);
void Audio_LowerMainBgmVolume(u8 volume);
void Audio_PlaySfxIncreasinglyTransposed(Vec3f* pos, s16 sfxId, u8* semitones);
void Audio_ResetIncreasingTranspose(void);
void Audio_PlaySfxTransposed(Vec3f* pos, u16 sfxId, s8 semitone);
void func_800F4C58(Vec3f* pos, u16 sfxId, u8);
void func_800F4E30(Vec3f* pos, f32);
void Audio_ClearSariaBgm(void);
void Audio_ClearSariaBgmAtPos(Vec3f* pos);
void Audio_PlaySariaBgm(Vec3f* pos, u16 seqId, u16 distMax);
void Audio_ClearSariaBgm2(void);
void Audio_PlayMorningSceneSequence(u16 seqId);
void Audio_PlaySceneSequence(u16 seqId);
void Audio_SetMainBgmTempoFreqAfterFanfare(f32 scaleTempoAndFreq, u8 duration);
void Audio_PlayWindmillBgm(void);
void Audio_SetFastTempoForTimedMinigame(void);
void Audio_PlaySequenceInCutscene(u16 seqId);
void Audio_StopSequenceInCutscene(u16 seqId);
s32 Audio_IsSequencePlaying(u16 seqId);
void func_800F5ACC(u16 seqId);
void func_800F5B58(void);
void func_800F5BF0(u8 natureAmbienceId);
void Audio_PlayFanfare(u16);
void func_800F5C2C(void);
void Audio_PlaySequenceWithSeqPlayerIO(u8 seqPlayerIndex, u16 seqId, u8 fadeInDuration, s8 ioPort, s8 ioData);
void Audio_SetSequenceMode(u8 seqMode);
void Audio_SetBgmEnemyVolume(f32 dist);
void Audio_UpdateMalonSinging(f32 dist, u16 seqId);
void func_800F64E0(u8 arg0);
void Audio_ToggleMalonSinging(u8 malonSingingDisabled);
void Audio_SetEnvReverb(s8 reverb);
void Audio_SetCodeReverb(s8 reverb);
void func_800F6700(s8 audioSetting);
void Audio_SetBaseFilter(u8);
void Audio_SetExtraFilter(u8);
void Audio_SetCutsceneFlag(s8 flag);
void Audio_PlaySfxIfNotInCutscene(u16 sfxId);
void func_800F6964(u16);
void Audio_StopBgmAndFanfare(u16 fadeOutDuration);
void Audio_PreNMI(void);
void Audio_SetNatureAmbienceChannelIO(u8 channelIdxRange, u8 ioPort, u8 ioData);
void Audio_PlayNatureAmbienceSequence(u8 natureAmbienceId);
void Audio_Init(void);
void Audio_InitSound(void);
void func_800F7170(void);
void func_800F71BC(s32 arg0);
void Audio_SetSfxBanksMute(u16 muteMask);
void Audio_QueueSeqCmdMute(u8 channelIdx);
void Audio_ClearBGMMute(u8 channelIdx);
void Audio_PlaySfxGeneral(u16 sfxId, Vec3f* pos, u8 token, f32* freqScale, f32* vol, s8* reverbAdd);
void Audio_ProcessSfxRequest(void);
void Audio_ChooseActiveSfx(u8 bankId);
void Audio_PlayActiveSfx(u8 bankId);
void Audio_StopSfxByBank(u8 bankId);
void func_800F8884(u8 bankId, Vec3f* pos);
void Audio_StopSfxByPosAndBank(u8 bankId, Vec3f* pos);
void Audio_StopSfxByPos(Vec3f* pos);
void Audio_StopSfxByPosAndId(Vec3f* pos, u16 sfxId);
void Audio_StopSfxByTokenAndId(u8 token, u16 sfxId);
void Audio_StopSfxById(u32 sfxId);
void Audio_ProcessSfxRequests(void);
void func_800F8F88(void);
u8 Audio_IsSfxPlaying(u32 sfxId);
void Audio_ResetSfx(void);
void Audio_StartSequence(u8 seqPlayerIndex, u8 seqId, u8 seqArgs, u16 fadeInDuration);
void Audio_StopSequence(u8 seqPlayerIndex, u16 fadeOutDuration);
void Audio_QueueSeqCmd(u32 cmd);
void Audio_ProcessSeqCmds(void);
u16 Audio_GetActiveSeqId(u8 seqPlayerIndex);
s32 Audio_IsSeqCmdNotQueued(u32 cmdVal, u32 cmdMask);
void Audio_SetVolumeScale(u8 seqPlayerIndex, u8 scaleIndex, u8 targetVol, u8 volFadeTimer);
void Audio_UpdateActiveSequences(void);
u8 func_800FAD34(void);
void Audio_ResetActiveSequences(void);
void Audio_ResetActiveSequencesAndVolume(void);
void GfxPrint_SetColor(GfxPrint* this, u32 r, u32 g, u32 b, u32 a);
void GfxPrint_SetPosPx(GfxPrint* this, s32 x, s32 y);
void GfxPrint_SetPos(GfxPrint* this, s32 x, s32 y);
void GfxPrint_SetBasePosPx(GfxPrint* this, s32 x, s32 y);
void GfxPrint_Init(GfxPrint* this);
void GfxPrint_Destroy(GfxPrint* this);
void GfxPrint_Open(GfxPrint* this, Gfx* dList);
Gfx* GfxPrint_Close(GfxPrint* this);
s32 GfxPrint_Printf(GfxPrint* this, const char* fmt, ...);
void RcpUtils_PrintRegisterStatus(void);
void RcpUtils_Reset(void);
void* Overlay_AllocateAndLoad(uintptr_t vromStart, uintptr_t vromEnd, void* vramStart, void* vramEnd);
void MtxConv_F2L(Mtx* m1, MtxF* m2);
void MtxConv_L2F(MtxF* m1, Mtx* m2);
void Overlay_Relocate(void* allocatedRamAddress, OverlayRelocationSection* ovlRelocs, void* vramStart);
s32 Overlay_Load(uintptr_t vromStart, uintptr_t vromEnd, void* vramStart, void* vramEnd, void* allocatedRamAddr);
// ? func_800FC800(?);
// ? func_800FC83C(?);
// ? func_800FCAB4(?);
void SystemHeap_Init(void* start, u32 size);
void PadUtils_Init(Input* input);
void func_800FCB70(void);
void PadUtils_ResetPressRel(Input* input);
u32 PadUtils_CheckCurExact(Input* input, u16 value);
u32 PadUtils_CheckCur(Input* input, u16 key);
u32 PadUtils_CheckPressed(Input* input, u16 key);
u32 PadUtils_CheckReleased(Input* input, u16 key);
u16 PadUtils_GetCurButton(Input* input);
u16 PadUtils_GetPressButton(Input* input);
s8 PadUtils_GetCurX(Input* input);
s8 PadUtils_GetCurY(Input* input);
void PadUtils_SetRelXY(Input* input, s32 x, s32 y);
s8 PadUtils_GetRelXImpl(Input* input);
s8 PadUtils_GetRelYImpl(Input* input);
s8 PadUtils_GetRelX(Input* input);
s8 PadUtils_GetRelY(Input* input);
void PadUtils_UpdateRelXY(Input* input);
s32 PadSetup_Init(OSMesgQueue* mq, u8* outMask, OSContStatus* status);
f32 Math_FTanF(f32 angle);
f32 Math_FFloorF(f32 x);
f32 Math_FCeilF(f32 x);
f32 Math_FRoundF(f32 x);
f32 Math_FNearbyIntF(f32 x);
f32 Math_FTruncF(f32 x);
f32 Math_FAtanF(f32 x);
f32 Math_FAtan2F(f32 y, f32 x);
f32 Math_FAsinF(f32 x);
f32 Math_FAcosF(f32 x);
f32 ceilf(f32 x);
f32 truncf(f32 x);
f32 roundf(f32 x);
f32 nearbyintf(f32 x);
void SystemArena_CheckPointer(void* ptr, u32 size, const char* name, const char* action);
void* SystemArena_Malloc(u32 size);
void* SystemArena_MallocDebug(u32 size, const char* file, s32 line);
void* SystemArena_MallocR(u32 size);
void* SystemArena_MallocRDebug(u32 size, const char* file, s32 line);
void* SystemArena_Realloc(void* ptr, u32 newSize);
void* SystemArena_ReallocDebug(void* ptr, u32 newSize, const char* file, s32 line);
void SystemArena_Free(void* ptr);
void SystemArena_FreeDebug(void* ptr, const char* file, s32 line);
void* SystemArena_Calloc(u32 num, u32 size);
void SystemArena_Display(void);
void SystemArena_GetSizes(u32* outMaxFree, u32* outFree, u32* outAlloc);
void SystemArena_Check(void);
void SystemArena_Init(void* start, u32 size);
void SystemArena_Cleanup(void);
u8 SystemArena_IsInitialized(void);
u32 Rand_Next(void);
void Rand_Seed(u32 seed);
f32 Rand_ZeroOne(void);
f32 Rand_Centered(void);
void Rand_Seed_Variable(u32* rndNum, u32 seed);
u32 Rand_Next_Variable(u32* rndNum);
f32 Rand_ZeroOne_Variable(u32* rndNum);
f32 Rand_Centered_Variable(u32* rndNum);
u32 ArenaImpl_GetFillAllocBlock(Arena* arena);
u32 ArenaImpl_GetFillFreeBlock(Arena* arena);
u32 ArenaImpl_GetCheckFreeBlock(Arena* arena);
void ArenaImpl_SetFillAllocBlock(Arena* arena);
void ArenaImpl_SetFillFreeBlock(Arena* arena);
void ArenaImpl_SetCheckFreeBlock(Arena* arena);
void ArenaImpl_UnsetFillAllocBlock(Arena* arena);
void ArenaImpl_UnsetFillFreeBlock(Arena* arena);
void ArenaImpl_UnsetCheckFreeBlock(Arena* arena);
void ArenaImpl_SetDebugInfo(ArenaNode* node, const char* file, s32 line, Arena* arena);
void ArenaImpl_LockInit(Arena* arena);
void ArenaImpl_Lock(Arena* arena);
void ArenaImpl_Unlock(Arena* arena);
ArenaNode* ArenaImpl_GetNextBlock(ArenaNode* node);
ArenaNode* ArenaImpl_GetPrevBlock(ArenaNode* node);
ArenaNode* ArenaImpl_GetLastBlock(Arena* arena);
void __osMallocInit(Arena* arena, void* start, u32 size);
void __osMallocAddBlock(Arena* arena, void* start, s32 size);
void ArenaImpl_RemoveAllBlocks(Arena* arena);
void __osMallocCleanup(Arena* arena);
u8 __osMallocIsInitialized(Arena* arena);
void __osMalloc_FreeBlockTest(Arena* arena, ArenaNode* node);
void* __osMalloc_NoLockDebug(Arena* arena, u32 size, const char* file, s32 line);
void* __osMallocDebug(Arena* arena, u32 size, const char* file, s32 line);
void* __osMallocRDebug(Arena* arena, u32 size, const char* file, s32 line);
void* __osMalloc_NoLock(Arena* arena, u32 size);
void* __osMalloc(Arena* arena, u32 size);
void* __osMallocR(Arena* arena, u32 size);
void __osFree_NoLock(Arena* arena, void* ptr);
void __osFree(Arena* arena, void* ptr);
void __osFree_NoLockDebug(Arena* arena, void* ptr, const char* file, s32 line);
void __osFreeDebug(Arena* arena, void* ptr, const char* file, s32 line);
void* __osRealloc(Arena* arena, void* ptr, u32 newSize);
void* __osReallocDebug(Arena* arena, void* ptr, u32 newSize, const char* file, s32 line);
void ArenaImpl_GetSizes(Arena* arena, u32* outMaxFree, u32* outFree, u32* outAlloc);
void __osDisplayArena(Arena* arena);
void ArenaImpl_FaultClient(Arena* arena);
u32 __osCheckArena(Arena* arena);
u8 func_800FF334(Arena* arena);
s32 PrintUtils_VPrintf(PrintCallback* pfn, const char* fmt, va_list args);
s32 PrintUtils_Printf(PrintCallback* pfn, const char* fmt, ...);
void Sleep_Cycles(OSTime cycles);
void Sleep_Nsec(u32 nsec);
void Sleep_Usec(u32 usec);
void Sleep_Msec(u32 ms);
void Sleep_Sec(u32 sec);
void JpegUtils_ProcessQuantizationTable(u8* dqt, JpegQuantizationTable* qt, u8 count);
s32 JpegUtils_ParseHuffmanCodesLengths(u8* ptr, u8* codesLengths);
s32 JpegUtils_GetHuffmanCodes(u8* codesLengths, u16* codes);
s32 JpegUtils_SetHuffmanTable(u8* data, JpegHuffmanTable* ht, u16* codes);
u32 JpegUtils_ProcessHuffmanTableImpl(u8* data, JpegHuffmanTable* ht, u8* codesLengths, u16* codes, u8 isAc);
u32 JpegUtils_ProcessHuffmanTable(u8* dht, JpegHuffmanTable* ht, u8* codesLengths, u16* codes, u8 count);
void JpegUtils_SetHuffmanTableOld(u8* data, JpegHuffmanTableOld* ht, u8* codesLengths, u16* codes, s16 count, u8 isAc);
u32 JpegUtils_ProcessHuffmanTableImplOld(u8* dht, JpegHuffmanTableOld* ht, u8* codesLengths, u16* codes);
s32 JpegDecoder_Decode(JpegDecoder* decoder, u16* mcuBuff, s32 count, u8 isFollowing, JpegDecoderState* state);
s32 JpegDecoder_ProcessMcu(JpegHuffmanTable* hTable0, JpegHuffmanTable* hTable1, u16* mcu, s16* unk);
s32 JpegDecoder_ParseNextSymbol(JpegHuffmanTable* hTable, s16* outCoeff, s8* outZeroCount);
u16 JpegDecoder_ReadBits(u8 len);
s32 osPfsFreeBlocks(OSPfs* pfs, s32* leftoverBytes);
void guScale(Mtx* m, f32 x, f32 y, f32 z);
f32 sinf(f32 angle);
s16 sins(u16 angle);
OSTask* _VirtualToPhysicalTask(OSTask* intp);
void osSpTaskLoad(OSTask* intp);
void osSpTaskStartGo(OSTask* tp);
void __osSiCreateAccessQueue(void);
void __osSiGetAccess(void);
void __osSiRelAccess(void);
s32 osContInit(OSMesgQueue* mq, u8* ctlBitfield, OSContStatus* status);
void __osContGetInitData(u8* ctlBitfield, OSContStatus* data);
void __osPackRequestData(u8 poll);
s32 osContStartReadData(OSMesgQueue* mq);
void osContGetReadData(OSContPad* contData);
void __osPackReadData(void);
void guPerspectiveF(f32 mf[4][4], u16* perspNorm, f32 fovy, f32 aspect, f32 near, f32 far, f32 scale);
void guPerspective(Mtx* m, u16* perspNorm, f32 fovy, f32 aspect, f32 near, f32 far, f32 scale);
s32 __osSpRawStartDma(s32 direction, void* devAddr, void* dramAddr, u32 size);
s32 __osSiRawStartDma(s32 dir, void* addr);
void osSpTaskYield(void);
s32 __osPfsGetNextPage(OSPfs* pfs, u8* bank, __OSInode* inode, __OSInodeUnit* page);
s32 osPfsReadWriteFile(OSPfs* pfs, s32 fileNo, u8 flag, s32 offset, s32 size, u8* data);
s32 __osPfsGetStatus(OSMesgQueue* queue, s32 channel);
void __osPfsRequestOneChannel(s32 channel, u8 cmd);
void __osPfsGetOneChannelData(s32 channel, OSContStatus* contData);
void guMtxIdentF(f32 mf[4][4]);
void guLookAtF(f32 mf[4][4], f32 xEye, f32 yEye, f32 zEye, f32 xAt, f32 yAt, f32 zAt, f32 xUp, f32 yUp, f32 zUp);
void guLookAt(Mtx*, f32 xEye, f32 yEye, f32 zEye, f32 xAt, f32 yAt, f32 zAt, f32 xUp, f32 yUp, f32 zUp);
s32 osPfsAllocateFile(OSPfs* pfs, u16 companyCode, u32 gameCode, u8* gameName, u8* extName, s32 fileSize, s32* fileNo);
s32 __osPfsDeclearPage(OSPfs* pfs, __OSInode* inode, s32 fileSizeInPages, s32* startPage, u8 bank, s32* decleared,
                       s32* finalPage);
s32 osStopTimer(OSTimer* timer);
u16 __osSumcalc(u8* ptr, s32 length);
s32 __osIdCheckSum(u16* ptr, u16* checkSum, u16* idSum);
s32 __osRepairPackId(OSPfs* pfs, __OSPackId* badid, __OSPackId* newid);
s32 __osCheckPackId(OSPfs* pfs, __OSPackId* check);
s32 __osGetId(OSPfs* pfs);
s32 __osCheckId(OSPfs* pfs);
s32 __osPfsRWInode(OSPfs* pfs, __OSInode* inode, u8 flag, u8 bank);
void guMtxL2F(MtxF* m1, Mtx* m2);
s32 osPfsFindFile(OSPfs* pfs, u16 companyCode, u32 gameCode, u8* gameName, u8* extName, s32* fileNo);
s32 osAfterPreNMI(void);
s32 osContStartQuery(OSMesgQueue* mq);
void osContGetQuery(OSContStatus* data);
void guLookAtHiliteF(f32 mf[4][4], LookAt* l, Hilite* h, f32 xEye, f32 yEye, f32 zEye, f32 xAt, f32 yAt, f32 zAt,
                     f32 xUp, f32 yUp, f32 zUp, f32 xl1, f32 yl1, f32 zl1, f32 xl2, f32 yl2, f32 zl2, s32 hiliteWidth,
                     s32 hiliteHeight);
void guLookAtHilite(Mtx* m, LookAt* l, Hilite* h, f32 xEye, f32 yEye, f32 zEye, f32 xAt, f32 yAt, f32 zAt, f32 xUp,
                    f32 yUp, f32 zUp, f32 xl1, f32 yl1, f32 zl1, f32 xl2, f32 yl2, f32 zl2, s32 hiliteWidth,
                    s32 hiliteHeight);
u32 __osSpDeviceBusy(void);
void guMtxIdent(Mtx*);
void guPositionF(f32 mf[4][4], f32 rot, f32 pitch, f32 yaw, f32 scale, f32 x, f32 y, f32 z);
void guPosition(Mtx*, f32, f32, f32, f32, f32, f32, f32);
OSYieldResult osSpTaskYielded(OSTask* task);
void guRotateF(f32 m[4][4], f32 a, f32 x, f32 y, f32 z);
void guRotate(Mtx*, f32 a, f32 x, f32 y, f32 z);
s32 osAiSetFrequency(u32 frequency);
OSThread* __osGetActiveQueue(void);
void guNormalize(f32* x, f32* y, f32* z);
u32 osDpGetStatus(void);
void osDpSetStatus(u32 status);
s32 osPfsDeleteFile(OSPfs* pfs, u16 companyCode, u32 gameCode, u8* gameName, u8* extName);
s32 __osPfsReleasePages(OSPfs* pfs, __OSInode* inode, u8 initialPage, u8 bank, __OSInodeUnit* finalPage);
void guOrthoF(f32[4][4], f32, f32, f32, f32, f32, f32, f32);
void guOrtho(Mtx*, f32, f32, f32, f32, f32, f32, f32);
f32 cosf(f32 angle);
s16 coss(u16 angle);
void osViSetEvent(OSMesgQueue* mq, OSMesg msg, u32 retraceCount);
s32 osPfsIsPlug(OSMesgQueue* mq, u8* pattern);
void __osPfsRequestData(u8 cmd);
void __osPfsGetInitData(u8* pattern, OSContStatus* contData);
void guS2DInitBg(uObjBg* bg);
s32 __osPfsSelectBank(OSPfs* pfs, u8 bank);
s32 osContSetCh(u8 ch);
s32 osPfsFileState(OSPfs* pfs, s32 fileNo, OSPfsState* state);
s32 osPfsInitPak(OSMesgQueue* queue, OSPfs* pfs, s32 channel);
s32 __osPfsCheckRamArea(OSPfs* pfs);
s32 osPfsChecker(OSPfs* pfs);
s32 func_80105788(OSPfs* pfs, __OSInodeCache* cache);
s32 func_80105A60(OSPfs* pfs, __OSInodeUnit fpage, __OSInodeCache* cache);
u32 osAiGetLength(void);
void guTranslate(Mtx* m, f32 x, f32 y, f32 z);
s32 __osContRamWrite(OSMesgQueue* mq, s32 channel, u16 address, u8* buffer, s32 force);
s32 __osContRamRead(OSMesgQueue* ctrlrqueue, s32 channel, u16 addr, u8* data);
u8 __osContAddressCrc(u16 addr);
u8 __osContDataCrc(u8* data);
s32 osSetTimer(OSTimer* timer, OSTime countdown, OSTime interval, OSMesgQueue* mq, OSMesg msg);
u32 __osSpGetStatus(void);
void __osSpSetStatus(u32 status);
void osWritebackDCacheAll(void);
OSThread* __osGetCurrFaultedThread(void);
void guMtxF2L(MtxF* m1, Mtx* m2);
// ? __d_to_ll(?);
// ? __f_to_ll(?);
// ? __d_to_ull(?);
// ? __f_to_ull(?);
// ? __ll_to_d(?);
// ? __ll_to_f(?);
// ? __ull_to_d(?);
// ? __ull_to_f(?);
void* osViGetCurrentFramebuffer(void);
s32 __osSpSetPc(void* pc);
f32 absf(f32);
void* __osMemset(void* dest, s32 val, size_t len);
void* __osMemmove(void* dest, const void* src, size_t len);
void Message_UpdateOcarinaMemoryGame(PlayState* play);
u8 Message_ShouldAdvance(PlayState* play);
void Message_CloseTextbox(PlayState*);
void Message_StartTextbox(PlayState* play, u16 textId, Actor* actor);
void Message_ContinueTextbox(PlayState* play, u16 textId);
void Message_StartOcarina(PlayState* play, u16 ocarinaActionId);
void Message_StartOcarinaSunsSongDisabled(PlayState* play, u16 ocarinaActionId);
u8 Message_GetState(MessageContext* msgCtx);
void Message_Draw(PlayState* play);
void Message_Update(PlayState* play);
void Message_SetTables(void);
void GameOver_Init(PlayState* play);
void GameOver_FadeInLights(PlayState* play);
void GameOver_Update(PlayState* play);
void Interface_Destroy(PlayState* play);
void Interface_Init(PlayState* play);
void Message_Init(PlayState* play);
void Regs_InitData(PlayState* play);

void Setup_Init(GameState* thisx);
void Setup_Destroy(GameState* thisx);
void ConsoleLogo_Init(GameState* thisx);
void ConsoleLogo_Destroy(GameState* thisx);

#ifdef ENABLE_MAP_SELECT
void MapSelect_Init(GameState* thisx);
void MapSelect_Destroy(GameState* thisx);
#endif

void TitleSetup_Init(GameState* thisx);
void TitleSetup_Destroy(GameState* thisx);
void FileSelect_Init(GameState* thisx);
void FileSelect_Destroy(GameState* thisx);

#endif
