#ifndef _LIBULTRA_INTERNAL_H_
#define _LIBULTRA_INTERNAL_H_
#include <ultra64.h>

// TODO: rename these
//      SM64                OOT
s32 __osDisableInt();
void __osRestoreInt(s32);
void __osEnqueueAndYield(OSThread**);
void __osDequeueThread(OSThread**, OSThread*);
void __osEnqueueThread(OSThread**, OSThread*);
OSThread* __osPopThread(OSThread**);
s32 __osSiRawStartDma(s32, void*);
void __osSiCreateAccessQueue();
void __osSiGetAccess();
void __osSiRelAccess();
u32 __osProbeTLB(void*);
void __osPiCreateAccessQueue();
void __osPiGetAccess();
void __osSetSR(u32);
u32 __osGetSR();
void __osSetFpcCsr(u32);
u32 __osGetFpcCsr();
s32 __osSiRawReadIo(void*, u32*);
s32 __osSiRawWriteIo(void*, u32);
s32 osPiRawReadIo(u32 a0, u32 *a1);
void __osSpSetStatus(u32);
u32 __osSpGetStatus();
s32 __osSpSetPc(void*);
s32 __osSpDeviceBusy();
s32 __osSiDeviceBusy();
s32 __osSpRawStartDma(u32 dir, void *sp_ptr, void *dram_ptr, size_t size);
void __osViInit();
//OSViContext * __osViGetCurrentContext();
void __osViSwapContext();
void __osSetTimerIntr(OSTime);
OSTime __osInsertTimer(OSTimer *);
void __osSetCompare(u32);
s32 __osAiDeviceBusy();
void __osDispatchThread();
u32 __osGetCause();
s32 __osAtomicDec(u32*);
#endif
