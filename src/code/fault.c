/**
 * @file fault.c
 *
 * This file implements the screen that may be viewed when the game crashes.
 * This is the second version of the crash screen, originally used in Majora's Mask.
 *
 * When the game crashes, a red bar will be drawn to the top-left of the screen, indicating that the
 * crash screen is available for use. Once this bar appears, it is possible to open the crash screen
 * with the following button combination:
 *
 * (L & R & Z) + DPad-Up + C-Down + C-Up + DPad-Down + DPad-Left + C-Left + C-Right + DPad-Right + (B & A & START)
 *
 * When entering this button combination, buttons that are &'d together must all be pressed together.
 * The L & R presses and B & A presses may be interchanged in the order they are pressed.
 *
 * "Clients" may be registered with the crash screen to extend its functionality. There are
 * two kinds of client, "Client" and "AddressConverterClient". Clients contribute one or
 * more pages to the crash debugger, while Address Converter Clients allow the crash screen to look up
 * the virtual addresses of dynamically allocated overlays.
 *
 * The crash screen has multiple pages:
 *  - Thread Context
 *      This page shows information about the thread on which the program crashed. It displays
 *      the cause of the crash, state of general-purpose registers, state of floating-point registers
 *      and the floating-point status register. If a floating-point exception caused the crash, it will
 *      be displayed next to the floating-point status register.
 *  - Stack Trace
 *      This page displays a full backtrace from the crashing function back to the start of the thread. It
 *      displays the Program Counter for each function and, if applicable, the Virtual Program Counter
 *      for relocated functions in overlays.
 *  - Client Pages
 *      After the stack trace page, currently registered clients are processed and their pages are displayed.
 *  - Memory Dump
 *      This page implements a scrollable memory dump.
 *  - End Screen
 *      This page informs you that there are no more pages to display.
 *
 * To navigate the pages, START and A may be used to advance to the next page, and L toggles whether to
 * automatically scroll to the next page after some time has passed.
 * DPad-Up may be pressed to enable sending fault pages over osSyncPrintf as well as displaying them on-screen.
 * DPad-Down disables sending fault pages over osSyncPrintf.
 */
#include "global.h"
#include "terminal.h"
#include "alloca.h"

#include "config.h"

void FaultDrawer_Init(void);
void FaultDrawer_SetOsSyncPrintfEnabled(u32 enabled);
void FaultDrawer_DrawRecImpl(s32 xStart, s32 yStart, s32 xEnd, s32 yEnd, u16 color);
void FaultDrawer_FillScreen(void);
void FaultDrawer_SetInputCallback(void (*callback)(void));
void FaultDrawer_SetDrawerFB(void* fb, u16 w, u16 h);

const char* sExceptionNames[] = {
    "Interrupt",
    "TLB modification",
    "TLB exception on load",
    "TLB exception on store",
    "Address error on load",
    "Address error on store",
    "Bus error on inst.",
    "Bus error on data",
    "System call exception",
    "Breakpoint exception",
    "Reserved instruction",
    "Coprocessor unusable",
    "Arithmetic overflow",
    "Trap exception",
    "Virtual coherency on inst.",
    "Floating point exception",
    "Watchpoint exception",
    "Virtual coherency on data",
};

const char* sFpExceptionNames[] = {
    "Unimplemented operation", "Invalid operation", "Division by zero", "Overflow", "Underflow", "Inexact operation",
};

#ifndef NON_MATCHING
// TODO: match .bss (has reordering issues)
extern FaultMgr* sFaultInstance;
extern u8 sFaultAwaitingInput;
extern STACK(sFaultStack, 0x600);
extern StackEntry sFaultThreadInfo;
extern FaultMgr gFaultMgr;
#else
// Non-matching version for struct shiftability
FaultMgr* sFaultInstance;
u8 sFaultAwaitingInput;
STACK(sFaultStack, 0x600);
StackEntry sFaultThreadInfo;
FaultMgr gFaultMgr;
#endif

typedef struct {
    /* 0x00 */ s32 (*callback)(void*, void*);
    /* 0x04 */ void* arg0;
    /* 0x08 */ void* arg1;
    /* 0x0C */ s32 ret;
    /* 0x10 */ OSMesgQueue* queue;
    /* 0x14 */ OSMesg msg;
} FaultClientTask; // size = 0x18

void Fault_SleepImpl(u32 msec) {
    u64 cycles = (msec * OS_CPU_COUNTER) / 1000ull;

    Sleep_Cycles(cycles);
}

void Fault_ClientProcessThread(void* arg) {
    FaultClientTask* task = (FaultClientTask*)arg;

    // Run the callback
    if (task->callback != NULL) {
        task->ret = task->callback(task->arg0, task->arg1);
    }

    // Send completion notification
    if (task->queue != NULL) {
        osSendMesg(task->queue, task->msg, OS_MESG_BLOCK);
    }
}

void Fault_ClientRunTask(FaultClientTask* task) {
    OSMesgQueue queue;
    OSMesg msg;
    OSMesg recMsg;
    OSThread* thread = NULL;
    OSTimer timer;
    u32 timerMsgVal = 666;

    osCreateMesgQueue(&queue, &msg, 1);
    task->queue = &queue;
    task->msg = NULL;

    if (sFaultInstance->clientThreadSp != NULL) {
        // Run the fault client callback on a separate thread
        thread = alloca(sizeof(OSThread));

        osCreateThread(thread, THREAD_ID_FAULT, Fault_ClientProcessThread, task, sFaultInstance->clientThreadSp,
                       THREAD_PRI_FAULT_CLIENT);
        osStartThread(thread);
    } else {
        // Run the fault client callback on this thread
        Fault_ClientProcessThread(task);
    }

    // Await done
    while (true) {
        osSetTimer(&timer, OS_SEC_TO_CYCLES(1), 0, &queue, (OSMesg)timerMsgVal);
        osRecvMesg(&queue, &recMsg, OS_MESG_BLOCK);

        if (recMsg != (OSMesg)666) {
            break;
        }

        if (!sFaultAwaitingInput) {
            task->ret = -1;
            break;
        }
    }

    osStopTimer(&timer);

    // Destroy thread if a thread was used
    if (thread != NULL) {
        osStopThread(thread);
        osDestroyThread(thread);
    }
}

s32 Fault_ProcessClient(void* callback, void* arg0, void* arg1) {
    FaultClientTask task;

    task.callback = callback;
    task.arg0 = arg0;
    task.arg1 = arg1;
    task.ret = 0;
    Fault_ClientRunTask(&task);
    return task.ret;
}

/**
 * Registers a fault client.
 *
 * Clients contribute at least one page to the crash screen, drawn by `callback`.
 * Arguments are passed on to the callback through `arg0` and `arg1`.
 *
 * The callback is intended to be
 * `void (*callback)(void* arg0, void* arg1)`
 */
void Fault_AddClient(FaultClient* client, void* callback, void* arg0, void* arg1) {
    OSIntMask mask;
    s32 alreadyExists = false;

    mask = osSetIntMask(OS_IM_NONE);

    // Ensure the client is not already registered
    {
        FaultClient* iterClient = sFaultInstance->clients;

        while (iterClient != NULL) {
            if (iterClient == client) {
                alreadyExists = true;
                goto end;
            }
            iterClient = iterClient->next;
        }
    }

    client->callback = callback;
    client->arg0 = arg0;
    client->arg1 = arg1;
    client->next = sFaultInstance->clients;
    sFaultInstance->clients = client;

end:
    osSetIntMask(mask);
    if (alreadyExists) {
        osSyncPrintf(VT_COL(RED, WHITE) "fault_AddClient: %08x は既にリスト中にある\n" VT_RST, client);
    }
}

/**
 * Removes a fault client so that the page is no longer displayed if a crash occurs.
 */
void Fault_RemoveClient(FaultClient* client) {
    FaultClient* iterClient = sFaultInstance->clients;
    FaultClient* lastClient = NULL;
    OSIntMask mask;
    s32 listIsEmpty = false;

    mask = osSetIntMask(OS_IM_NONE);

    while (iterClient != NULL) {
        if (iterClient == client) {
            if (lastClient != NULL) {
                lastClient->next = client->next;
            } else {
                sFaultInstance->clients = client;
                if (sFaultInstance->clients) {
                    sFaultInstance->clients = client->next;
                } else {
                    listIsEmpty = true;
                }
            }
            break;
        }
        lastClient = iterClient;
        iterClient = iterClient->next;
    }

    osSetIntMask(mask);

    if (listIsEmpty) {
        osSyncPrintf(VT_COL(RED, WHITE) "fault_RemoveClient: %08x リスト不整合です\n" VT_RST, client);
    }
}

/**
 * Registers an address converter client. This enables the crash screen to look up virtual
 * addresses of overlays relocated during runtime. Address conversion is carried out by
 * `callback`, which either returns a virtual address or NULL if the address could not
 * be converted.
 *
 * The callback is intended to be
 * `uintptr_t (*callback)(uintptr_t addr, void* arg)`
 * The callback may return 0 if it could not convert the address
 * The callback may return -1 to be unregistered
 */
void Fault_AddAddrConvClient(FaultAddrConvClient* client, void* callback, void* arg) {
    OSIntMask mask;
    s32 alreadyExists = false;

    mask = osSetIntMask(OS_IM_NONE);

    // Ensure the client is not already registered
    {
        FaultAddrConvClient* iterClient = sFaultInstance->addrConvClients;

        while (iterClient != NULL) {
            if (iterClient == client) {
                alreadyExists = true;
                goto end;
            }
            iterClient = iterClient->next;
        }
    }

    client->callback = callback;
    client->arg = arg;
    client->next = sFaultInstance->addrConvClients;
    sFaultInstance->addrConvClients = client;

end:
    osSetIntMask(mask);
    if (alreadyExists) {
        osSyncPrintf(VT_COL(RED, WHITE) "fault_AddressConverterAddClient: %08x は既にリスト中にある\n" VT_RST, client);
    }
}

void Fault_RemoveAddrConvClient(FaultAddrConvClient* client) {
    FaultAddrConvClient* iterClient = sFaultInstance->addrConvClients;
    FaultAddrConvClient* lastClient = NULL;
    OSIntMask mask;
    s32 listIsEmpty = false;

    mask = osSetIntMask(OS_IM_NONE);

    while (iterClient != NULL) {
        if (iterClient == client) {
            if (lastClient != NULL) {
                lastClient->next = client->next;
            } else {
                sFaultInstance->addrConvClients = client;

                if (sFaultInstance->addrConvClients != NULL) {
                    sFaultInstance->addrConvClients = client->next;
                } else {
                    listIsEmpty = true;
                }
            }
            break;
        }
        lastClient = iterClient;
        iterClient = iterClient->next;
    }

    osSetIntMask(mask);

    if (listIsEmpty) {
        osSyncPrintf(VT_COL(RED, WHITE) "fault_AddressConverterRemoveClient: %08x は既にリスト中にある\n" VT_RST,
                     client);
    }
}

/**
 * Converts `addr` to a virtual address via the registered
 * address converter clients
 */
uintptr_t Fault_ConvertAddress(uintptr_t addr) {
    s32 ret;
    FaultAddrConvClient* client = sFaultInstance->addrConvClients;

    while (client != NULL) {
        if (client->callback != NULL) {
            ret = Fault_ProcessClient(client->callback, (void*)addr, client->arg);
            if (ret == -1) {
                Fault_RemoveAddrConvClient(client);
            } else if (ret != 0) {
                return (uintptr_t)ret;
            }
        }
        client = client->next;
    }

    return 0;
}

void Fault_Sleep(u32 msec) {
    Fault_SleepImpl(msec);
}

void PadMgr_RequestPadData(PadMgr* padmgr, Input* inputs, s32 gameRequest);

void Fault_PadCallback(Input* inputs) {
    PadMgr_RequestPadData(&gPadMgr, inputs, false);
}

void Fault_UpdatePadImpl(void) {
    sFaultInstance->padCallback(sFaultInstance->inputs);
}

/**
 * Awaits user input
 *
 * L toggles auto-scroll
 * DPad-Up enables osSyncPrintf output
 * DPad-Down disables osSyncPrintf output
 * A and DPad-Right continues and returns true
 * DPad-Left continues and returns false
 */
u32 Fault_WaitForInputImpl(void) {
    Input* input = &sFaultInstance->inputs[0];
    s32 count = 600;
    u32 pressedBtn;

    while (true) {
        Fault_Sleep(1000 / 60);
        Fault_UpdatePadImpl();

        pressedBtn = input->press.button;

#ifndef DISABLE_CRASH_DBG_AUTOSCROLL
        if (pressedBtn == BTN_L) {
            sFaultInstance->autoScroll = !sFaultInstance->autoScroll;
        }
#endif

#ifndef DISABLE_CRASH_DBG_AUTOSCROLL
        if (sFaultInstance->autoScroll) {
            if (count-- < 1) {
                return false;
            }
        } else {
#endif
            if (pressedBtn == BTN_A || pressedBtn == BTN_DRIGHT) {
                return false;
            }

            if (pressedBtn == BTN_DLEFT) {
                return true;
            }

            if (pressedBtn == BTN_DUP) {
                FaultDrawer_SetOsSyncPrintfEnabled(true);
            }

            if (pressedBtn == BTN_DDOWN) {
                FaultDrawer_SetOsSyncPrintfEnabled(false);
            }
#ifndef DISABLE_CRASH_DBG_AUTOSCROLL
        }
#endif
    }
}

void Fault_WaitForInput(void) {
    sFaultAwaitingInput = true;
    Fault_WaitForInputImpl();
    sFaultAwaitingInput = false;
}

void Fault_DrawRec(s32 x, s32 y, s32 w, s32 h, u16 color) {
    FaultDrawer_DrawRecImpl(x, y, x + w - 1, y + h - 1, color);
}

void Fault_FillScreenBlack(void) {
    FaultDrawer_SetForeColor(GPACK_RGBA5551(255, 255, 255, 1));
    FaultDrawer_SetBackColor(GPACK_RGBA5551(0, 0, 0, 1));
    FaultDrawer_FillScreen();
    FaultDrawer_SetBackColor(GPACK_RGBA5551(0, 0, 0, 0));
}

void Fault_FillScreenRed(void) {
    FaultDrawer_SetForeColor(GPACK_RGBA5551(255, 255, 255, 1));
    FaultDrawer_SetBackColor(GPACK_RGBA5551(240, 0, 0, 1));
    FaultDrawer_FillScreen();
    FaultDrawer_SetBackColor(GPACK_RGBA5551(0, 0, 0, 0));
}

void Fault_DrawCornerRec(u16 color) {
    Fault_DrawRec(22, 16, 8, 1, color);
}

void Fault_PrintFReg(s32 idx, f32* value) {
    u32 raw = *(u32*)value;
    s32 exp = ((raw & 0x7F800000) >> 0x17) - 0x7F;

    if ((exp >= -0x7E && exp < 0x80) || raw == 0) {
        FaultDrawer_Printf("F%02d:%14.7e ", idx, *value);
    } else {
        // Print subnormal floats as their ieee-754 hex representation
        FaultDrawer_Printf("F%02d:  %08x(16) ", idx, raw);
    }
}

void Fault_LogFReg(s32 idx, f32* value) {
    u32 raw = *(u32*)value;
    s32 exp = ((raw & 0x7F800000) >> 0x17) - 0x7F;

    if ((exp >= -0x7E && exp < 0x80) || raw == 0) {
        osSyncPrintf("F%02d:%14.7e ", idx, *value);
    } else {
        osSyncPrintf("F%02d:  %08x(16) ", idx, *(u32*)value);
    }
}

void Fault_PrintFPCSR(u32 value) {
    s32 i;
    u32 flag = FPCSR_CE;

    FaultDrawer_Printf("FPCSR:%08xH ", value);

    // Go through each of the six causes and print the name of
    // the first cause that is set
    for (i = 0; i < ARRAY_COUNT(sFpExceptionNames); i++) {
        if (value & flag) {
            FaultDrawer_Printf("(%s)", sFpExceptionNames[i]);
            break;
        }
        flag >>= 1;
    }
    FaultDrawer_Printf("\n");
}

void Fault_LogFPCSR(u32 value) {
    s32 i;
    u32 flag = FPCSR_CE;

    osSyncPrintf("FPCSR:%08xH  ", value);
    for (i = 0; i < ARRAY_COUNT(sFpExceptionNames); i++) {
        if (value & flag) {
            osSyncPrintf("(%s)\n", sFpExceptionNames[i]);
            break;
        }
        flag >>= 1;
    }
}

void Fault_PrintThreadContext(OSThread* thread) {
    __OSThreadContext* ctx;
    s16 causeStrIdx = _SHIFTR((u32)thread->context.cause, 2, 5);

    if (causeStrIdx == 23) { // Watchpoint
        causeStrIdx = 16;
    }
    if (causeStrIdx == 31) { // Virtual coherency on data
        causeStrIdx = 17;
    }

    FaultDrawer_FillScreen();
    FaultDrawer_SetCharPad(-2, 4);
    FaultDrawer_SetCursor(22, 20);

    ctx = &thread->context;
    FaultDrawer_Printf("THREAD:%d (%d:%s)\n", thread->id, causeStrIdx, sExceptionNames[causeStrIdx]);
    FaultDrawer_SetCharPad(-1, 0);

    FaultDrawer_Printf("PC:%08xH SR:%08xH VA:%08xH\n", (u32)ctx->pc, (u32)ctx->sr, (u32)ctx->badvaddr);
    FaultDrawer_Printf("AT:%08xH V0:%08xH V1:%08xH\n", (u32)ctx->at, (u32)ctx->v0, (u32)ctx->v1);
    FaultDrawer_Printf("A0:%08xH A1:%08xH A2:%08xH\n", (u32)ctx->a0, (u32)ctx->a1, (u32)ctx->a2);
    FaultDrawer_Printf("A3:%08xH T0:%08xH T1:%08xH\n", (u32)ctx->a3, (u32)ctx->t0, (u32)ctx->t1);
    FaultDrawer_Printf("T2:%08xH T3:%08xH T4:%08xH\n", (u32)ctx->t2, (u32)ctx->t3, (u32)ctx->t4);
    FaultDrawer_Printf("T5:%08xH T6:%08xH T7:%08xH\n", (u32)ctx->t5, (u32)ctx->t6, (u32)ctx->t7);
    FaultDrawer_Printf("S0:%08xH S1:%08xH S2:%08xH\n", (u32)ctx->s0, (u32)ctx->s1, (u32)ctx->s2);
    FaultDrawer_Printf("S3:%08xH S4:%08xH S5:%08xH\n", (u32)ctx->s3, (u32)ctx->s4, (u32)ctx->s5);
    FaultDrawer_Printf("S6:%08xH S7:%08xH T8:%08xH\n", (u32)ctx->s6, (u32)ctx->s7, (u32)ctx->t8);
    FaultDrawer_Printf("T9:%08xH GP:%08xH SP:%08xH\n", (u32)ctx->t9, (u32)ctx->gp, (u32)ctx->sp);
    FaultDrawer_Printf("S8:%08xH RA:%08xH LO:%08xH\n\n", (u32)ctx->s8, (u32)ctx->ra, (u32)ctx->lo);

    Fault_PrintFPCSR(ctx->fpcsr);
    FaultDrawer_Printf("\n");

    Fault_PrintFReg(0, &ctx->fp0.f.f_even);
    Fault_PrintFReg(2, &ctx->fp2.f.f_even);
    FaultDrawer_Printf("\n");
    Fault_PrintFReg(4, &ctx->fp4.f.f_even);
    Fault_PrintFReg(6, &ctx->fp6.f.f_even);
    FaultDrawer_Printf("\n");
    Fault_PrintFReg(8, &ctx->fp8.f.f_even);
    Fault_PrintFReg(10, &ctx->fp10.f.f_even);
    FaultDrawer_Printf("\n");
    Fault_PrintFReg(12, &ctx->fp12.f.f_even);
    Fault_PrintFReg(14, &ctx->fp14.f.f_even);
    FaultDrawer_Printf("\n");
    Fault_PrintFReg(16, &ctx->fp16.f.f_even);
    Fault_PrintFReg(18, &ctx->fp18.f.f_even);
    FaultDrawer_Printf("\n");
    Fault_PrintFReg(20, &ctx->fp20.f.f_even);
    Fault_PrintFReg(22, &ctx->fp22.f.f_even);
    FaultDrawer_Printf("\n");
    Fault_PrintFReg(24, &ctx->fp24.f.f_even);
    Fault_PrintFReg(26, &ctx->fp26.f.f_even);
    FaultDrawer_Printf("\n");
    Fault_PrintFReg(28, &ctx->fp28.f.f_even);
    Fault_PrintFReg(30, &ctx->fp30.f.f_even);
    FaultDrawer_Printf("\n");

    FaultDrawer_SetCharPad(0, 0);
}

void Fault_LogThreadContext(OSThread* thread) {
    __OSThreadContext* ctx;
    s16 causeStrIdx = _SHIFTR((u32)thread->context.cause, 2, 5);

    if (causeStrIdx == 23) { // Watchpoint
        causeStrIdx = 16;
    }
    if (causeStrIdx == 31) { // Virtual coherency on data
        causeStrIdx = 17;
    }

    ctx = &thread->context;
    osSyncPrintf("\n");
    osSyncPrintf("THREAD ID:%d (%d:%s)\n", thread->id, causeStrIdx, sExceptionNames[causeStrIdx]);

    osSyncPrintf("PC:%08xH   SR:%08xH   VA:%08xH\n", (u32)ctx->pc, (u32)ctx->sr, (u32)ctx->badvaddr);
    osSyncPrintf("AT:%08xH   V0:%08xH   V1:%08xH\n", (u32)ctx->at, (u32)ctx->v0, (u32)ctx->v1);
    osSyncPrintf("A0:%08xH   A1:%08xH   A2:%08xH\n", (u32)ctx->a0, (u32)ctx->a1, (u32)ctx->a2);
    osSyncPrintf("A3:%08xH   T0:%08xH   T1:%08xH\n", (u32)ctx->a3, (u32)ctx->t0, (u32)ctx->t1);
    osSyncPrintf("T2:%08xH   T3:%08xH   T4:%08xH\n", (u32)ctx->t2, (u32)ctx->t3, (u32)ctx->t4);
    osSyncPrintf("T5:%08xH   T6:%08xH   T7:%08xH\n", (u32)ctx->t5, (u32)ctx->t6, (u32)ctx->t7);
    osSyncPrintf("S0:%08xH   S1:%08xH   S2:%08xH\n", (u32)ctx->s0, (u32)ctx->s1, (u32)ctx->s2);
    osSyncPrintf("S3:%08xH   S4:%08xH   S5:%08xH\n", (u32)ctx->s3, (u32)ctx->s4, (u32)ctx->s5);
    osSyncPrintf("S6:%08xH   S7:%08xH   T8:%08xH\n", (u32)ctx->s6, (u32)ctx->s7, (u32)ctx->t8);
    osSyncPrintf("T9:%08xH   GP:%08xH   SP:%08xH\n", (u32)ctx->t9, (u32)ctx->gp, (u32)ctx->sp);
    osSyncPrintf("S8:%08xH   RA:%08xH   LO:%08xH\n", (u32)ctx->s8, (u32)ctx->ra, (u32)ctx->lo);
    osSyncPrintf("\n");

    Fault_LogFPCSR(ctx->fpcsr);
    osSyncPrintf("\n");

    Fault_LogFReg(0, &ctx->fp0.f.f_even);
    Fault_LogFReg(2, &ctx->fp2.f.f_even);
    osSyncPrintf("\n");
    Fault_LogFReg(4, &ctx->fp4.f.f_even);
    Fault_LogFReg(6, &ctx->fp6.f.f_even);
    osSyncPrintf("\n");
    Fault_LogFReg(8, &ctx->fp8.f.f_even);
    Fault_LogFReg(10, &ctx->fp10.f.f_even);
    osSyncPrintf("\n");
    Fault_LogFReg(12, &ctx->fp12.f.f_even);
    Fault_LogFReg(14, &ctx->fp14.f.f_even);
    osSyncPrintf("\n");
    Fault_LogFReg(16, &ctx->fp16.f.f_even);
    Fault_LogFReg(18, &ctx->fp18.f.f_even);
    osSyncPrintf("\n");
    Fault_LogFReg(20, &ctx->fp20.f.f_even);
    Fault_LogFReg(22, &ctx->fp22.f.f_even);
    osSyncPrintf("\n");
    Fault_LogFReg(24, &ctx->fp24.f.f_even);
    Fault_LogFReg(26, &ctx->fp26.f.f_even);
    osSyncPrintf("\n");
    Fault_LogFReg(28, &ctx->fp28.f.f_even);
    Fault_LogFReg(30, &ctx->fp30.f.f_even);
    osSyncPrintf("\n");
}

/**
 * Iterates through the active thread queue for a user thread with either
 * the CPU break or Fault flag set.
 */
OSThread* Fault_FindFaultedThread(void) {
    OSThread* thread = __osGetActiveQueue();

    // OS_PRIORITY_THREADTAIL indicates the end of the thread queue
    while (thread->priority != OS_PRIORITY_THREADTAIL) {
        if (thread->priority > OS_PRIORITY_IDLE && thread->priority < OS_PRIORITY_APPMAX &&
            (thread->flags & (OS_FLAG_CPU_BREAK | OS_FLAG_FAULT))) {
            return thread;
        }
        thread = thread->tlnext;
    }
    return NULL;
}

void Fault_Wait5Seconds(void) {
    s32 pad;
    OSTime start = osGetTime();

    do {
        Fault_Sleep(1000 / 60);
    } while ((osGetTime() - start) < OS_SEC_TO_CYCLES(5) + 1);

#ifndef DISABLE_CRASH_DBG_AUTOSCROLL
    sFaultInstance->autoScroll = true;
#endif
}

void Fault_DrawMemDumpContents(const char* title, uintptr_t addr, u32 arg2) {
    uintptr_t alignedAddr = addr;
    u32* writeAddr;
    s32 y;
    s32 x;

    // Ensure address is within the bounds of RDRAM (Fault_DrawMemDump has already done this)
    if (alignedAddr < K0BASE) {
        alignedAddr = K0BASE;
    }
    // 8MB RAM, leave room to display 0x100 bytes on the final page
    //! @bug The loop below draws 22 * 4 * 4 = 0x160 bytes per page. Due to this, by scrolling further than
    //! 0x807FFEA0 some invalid bytes are read from outside of 8MB RDRAM space. This does not cause a crash,
    //! however the values it displays are meaningless. On N64 hardware these invalid addresses are read as 0.
    if (alignedAddr > K0BASE + 0x800000 - 0x100) {
        alignedAddr = K0BASE + 0x800000 - 0x100;
    }

    // Ensure address is word-aligned
    alignedAddr &= ~3;
    writeAddr = (u32*)alignedAddr;

    // Reset screen
    Fault_FillScreenBlack();
    FaultDrawer_SetCharPad(-2, 0);

    FaultDrawer_DrawText(36, 18, "%s %08x", title != NULL ? title : "PrintDump", alignedAddr);

    // Draw memory page contents
    if (alignedAddr >= K0BASE && alignedAddr < K2BASE) {
        for (y = 0; y < 22; y++) {
            FaultDrawer_DrawText(24, 28 + y * 9, "%06x", writeAddr);
            for (x = 0; x < 4; x++) {
                FaultDrawer_DrawText(82 + x * 52, 28 + y * 9, "%08x", *writeAddr++);
            }
        }
    }

    FaultDrawer_SetCharPad(0, 0);
}

/**
 * Draws the memory dump page.
 *
 * DPad-Up scrolls up.
 * DPad-Down scrolls down.
 * Holding Z while scrolling speeds up scrolling by a factor of 0x10.
 * Holding B while scrolling speeds up scrolling by a factor of 0x100.
 *
 * L toggles auto-scrolling pages.
 * START and A move on to the next page.
 *
 * @param pc Program counter, pressing C-Up jumps to this address
 * @param sp Stack pointer, pressing C-Down jumps to this address
 * @param cLeftJump Unused parameter, pressing C-Left jumps to this address
 * @param cRightJump Unused parameter, pressing C-Right jumps to this address
 */
void Fault_DrawMemDump(uintptr_t pc, uintptr_t sp, uintptr_t cLeftJump, uintptr_t cRightJump) {
    Input* input = &sFaultInstance->inputs[0];
    uintptr_t addr = pc;
    s32 scrollCountdown;
    u32 off;

    do {
        scrollCountdown = 0;
        // Ensure address is within the bounds of RDRAM
        if (addr < K0BASE) {
            addr = K0BASE;
        }
        // 8MB RAM, leave room to display 0x100 bytes on the final page
        if (addr > K0BASE + 0x800000 - 0x100) {
            addr = K0BASE + 0x800000 - 0x100;
        }

        // Align the address to 0x10 bytes and draw the page contents
        addr &= ~0xF;
        Fault_DrawMemDumpContents("Dump", addr, 0);
        scrollCountdown = 600;

#ifndef DISABLE_CRASH_DBG_AUTOSCROLL
        while (sFaultInstance->autoScroll) {
            // Count down until it's time to move on to the next page
            if (scrollCountdown == 0) {
                return;
            }

            scrollCountdown--;
            Fault_Sleep(1000 / 60);
            Fault_UpdatePadImpl();
            if (CHECK_BTN_ALL(input->press.button, BTN_L)) {
                // Disable auto-scrolling
                sFaultInstance->autoScroll = false;
            }
        }
#endif

        // Wait for input
        do {
            Fault_Sleep(1000 / 60);
            Fault_UpdatePadImpl();
        } while (input->press.button == 0);

        // Move to next page
        if (CHECK_BTN_ALL(input->press.button, BTN_START) || CHECK_BTN_ALL(input->cur.button, BTN_A)) {
            return;
        }

        // Memory dump controls

        off = 0x10;
        if (CHECK_BTN_ALL(input->cur.button, BTN_Z)) {
            off *= 0x10;
        }

        if (CHECK_BTN_ALL(input->cur.button, BTN_B)) {
            off *= 0x100;
        }

        if (CHECK_BTN_ALL(input->press.button, BTN_DUP)) {
            addr -= off;
        }
        if (CHECK_BTN_ALL(input->press.button, BTN_DDOWN)) {
            addr += off;
        }
        if (CHECK_BTN_ALL(input->press.button, BTN_CUP)) {
            addr = pc;
        }
        if (CHECK_BTN_ALL(input->press.button, BTN_CDOWN)) {
            addr = sp;
        }
        if (CHECK_BTN_ALL(input->press.button, BTN_CLEFT)) {
            addr = cLeftJump;
        }
        if (CHECK_BTN_ALL(input->press.button, BTN_CRIGHT)) {
            addr = cRightJump;
        }
    } while (!CHECK_BTN_ALL(input->press.button, BTN_L));

#ifndef DISABLE_CRASH_DBG_AUTOSCROLL
    // Resume auto-scroll and move to next page
    sFaultInstance->autoScroll = true;
#endif
}

/**
 * Searches a single function's stack frame for the function it was called from.
 * There are two cases that must be covered: Leaf and non-leaf functions.
 *
 * A leaf function is one that does not call any other function, in this case the
 * return address need not be saved to the stack. Since a leaf function does not
 * call other functions, only the function the stack trace begins in could possibly
 * be a leaf function, in which case the return address is in the thread context's
 * $ra already, as it never left.
 *
 * The procedure is therefore
 *  - Iterate instructions
 *  - Once jr $ra is found, set pc to $ra
 *  - Done after delay slot
 *
 * A non-leaf function calls other functions, it is necessary for the return address
 * to be saved to the stack. In these functions, it is important to keep track of the
 * stack frame size of each function.
 *
 * The procedure is therefore
 *  - Iterate instructions
 *  - If lw $ra <imm>($sp) is found, fetch the saved $ra from stack memory
 *  - If addiu $sp, $sp, <imm> is found, modify $sp by the immediate value
 *  - If jr $ra is found, set pc to $ra
 *  - Done after delay slot
 *
 * Note that searching for one jr $ra is sufficient, as only leaf functions can have
 * multiple jr $ra in the same function.
 *
 * There is also additional handling for eret and j. Neither of these instructions
 * appear in IDO compiled C, however do show up in the exception handler. It is not
 * possible to backtrace through an eret as an interrupt can occur at any time, so
 * there is no choice but to give up here. For j instructions, they can be followed
 * and the backtrace may continue as normal.
 */
void Fault_WalkStack(uintptr_t* spPtr, uintptr_t* pcPtr, uintptr_t* raPtr) {
    uintptr_t sp = *spPtr;
    uintptr_t pc = *pcPtr;
    uintptr_t ra = *raPtr;
    s32 count = 0x10000; // maximum number of instructions to search through
    u32 lastInsn;
    u32 insn;
    u16 insnHi;
    s16 insnLo;
    u32 imm;

    // ensure $sp and $ra are aligned and valid pointers, if they aren't a stack
    // trace cannot be generated
    if (sp % 4 != 0 || !IS_KSEG0(sp) || ra % 4 != 0 || !IS_KSEG0(ra)) {
        *raPtr = *pcPtr = *spPtr = 0;
        return;
    }

    // ensure pc is aligned and a valid pointer, if not a stack trace cannot
    // be generated
    if (pc % 4 != 0 || !IS_KSEG0(pc)) {
        *pcPtr = ra;
        return;
    }

    lastInsn = 0;
    while (true) {
        insn = *(u32*)K0_TO_K1(pc);
        insnHi = insn >> 16;
        insnLo = insn & 0xFFFF;
        imm = insnLo;

        if (insnHi == 0x8FBF) {
            // lw $ra, <imm>($sp)
            // read return address saved on the stack
            ra = *(uintptr_t*)K0_TO_K1(sp + imm);
        } else if (insnHi == 0x27BD) {
            // addiu $sp, $sp, <imm>
            // stack pointer increment or decrement
            sp += imm;
        } else if (insn == 0x42000018) {
            // eret
            // cannot backtrace through an eret, give up
            ra = pc = sp = 0;
            goto done;
        }
        if (lastInsn == 0x03E00008) {
            // jr $ra
            // return to previous function
            pc = ra;
            goto done;
        } else if (lastInsn >> 26 == 2) {
            // j <target>
            // extract jump target
            pc = pc >> 28 << 28 | lastInsn << 6 >> 4;
            goto done;
        }

        lastInsn = insn;
        pc += sizeof(u32);
        if (count == 0) {
            break;
        }
        count--;
    }
    // Hit the maximum number of instructions to search, give up
    ra = pc = sp = 0;

done:
    *spPtr = sp;
    *pcPtr = pc;
    *raPtr = ra;
}

/**
 * Draws the stack trace page contents for the specified thread
 */
void Fault_DrawStackTrace(OSThread* thread, s32 x, s32 y, s32 height) {
    s32 line;
    uintptr_t sp = thread->context.sp;
    uintptr_t ra = thread->context.ra;
    uintptr_t pc = thread->context.pc;
    uintptr_t addr;

    FaultDrawer_DrawText(x, y, "SP       PC       (VPC)");

    // Backtrace from the current function to the start of the thread
    for (line = 1; line < height && (ra != 0 || sp != 0) && pc != (uintptr_t)__osCleanupThread; line++) {
        FaultDrawer_DrawText(x, y + line * 8, "%08x %08x", sp, pc);
        // Convert relocated address to virtual address if applicable
        addr = Fault_ConvertAddress(pc);
        if (addr != 0) {
            FaultDrawer_Printf(" -> %08x", addr);
        }
        // Search one function for the previous function
        Fault_WalkStack(&sp, &pc, &ra);
    }
}

void Fault_LogStackTrace(OSThread* thread, s32 height) {
    s32 line;
    uintptr_t sp = thread->context.sp;
    uintptr_t ra = thread->context.ra;
    uintptr_t pc = thread->context.pc;
    uintptr_t addr;
    s32 pad;

    osSyncPrintf("STACK TRACE\nSP       PC       (VPC)\n");
    for (line = 1; line < height && (ra != 0 || sp != 0) && pc != (uintptr_t)__osCleanupThread; line++) {
        osSyncPrintf("%08x %08x", sp, pc);
        addr = Fault_ConvertAddress(pc);
        if (addr != 0) {
            osSyncPrintf(" -> %08x", addr);
        }
        osSyncPrintf("\n");
        Fault_WalkStack(&sp, &pc, &ra);
    }
}

void Fault_ResumeThread(OSThread* thread) {
    thread->context.cause = 0;
    thread->context.fpcsr = 0;
    thread->context.pc += sizeof(u32);
    *((u32*)thread->context.pc) = 0x0000000D; // write in a break instruction
    osWritebackDCache((void*)thread->context.pc, 4);
    osInvalICache((void*)thread->context.pc, 4);
    osStartThread(thread);
}

void Fault_DisplayFrameBuffer(void) {
    void* fb;

    osViSetYScale(1.0f);
    osViSetMode(&osViModeNtscLan1);
    osViSetSpecialFeatures(OS_VI_GAMMA_OFF | OS_VI_DITHER_FILTER_ON);
    osViBlack(false);

    if (sFaultInstance->fb != NULL) {
        fb = sFaultInstance->fb;
    } else {
        fb = osViGetNextFramebuffer();
        if ((uintptr_t)fb == K0BASE) {
            fb = (void*)(PHYS_TO_K0(osMemSize) - sizeof(u16[SCREEN_HEIGHT][SCREEN_WIDTH]));
        }
    }

    osViSwapBuffer(fb);
    FaultDrawer_SetDrawerFB(fb, SCREEN_WIDTH, SCREEN_HEIGHT);
}

/**
 * Runs all registered fault clients. Each fault client displays a page
 * on the crash screen.
 */
void Fault_ProcessClients(void) {
    FaultClient* client = sFaultInstance->clients;
    s32 idx = 0;

    while (client != NULL) {
        if (client->callback != NULL) {
            Fault_FillScreenBlack();
            FaultDrawer_SetCharPad(-2, 0);
            FaultDrawer_Printf(FAULT_COLOR(DARK_GRAY) "CallBack (%d) %08x %08x %08x\n" FAULT_COLOR(WHITE), idx++,
                               client, client->arg0, client->arg1);
            FaultDrawer_SetCharPad(0, 0);
            Fault_ProcessClient(client->callback, client->arg0, client->arg1);
            Fault_WaitForInput();
            Fault_DisplayFrameBuffer();
        }
        client = client->next;
    }
}

void Fault_UpdatePad(void) {
    Fault_UpdatePadImpl();
}

#define FAULT_MSG_CPU_BREAK ((OSMesg)1)
#define FAULT_MSG_FAULT ((OSMesg)2)
#define FAULT_MSG_UNK ((OSMesg)3)

void Fault_ThreadEntry(void* arg) {
    OSMesg msg;
    OSThread* faultedThread;
    s32 pad;

    // Direct OS event messages to the fault event queue
    osSetEventMesg(OS_EVENT_CPU_BREAK, &sFaultInstance->queue, FAULT_MSG_CPU_BREAK);
    osSetEventMesg(OS_EVENT_FAULT, &sFaultInstance->queue, FAULT_MSG_FAULT);

    while (true) {
        do {
            // Wait for a thread to hit a fault
            osRecvMesg(&sFaultInstance->queue, &msg, OS_MESG_BLOCK);

            if (msg == FAULT_MSG_CPU_BREAK) {
                sFaultInstance->msgId = (u32)FAULT_MSG_CPU_BREAK;
                osSyncPrintf("フォルトマネージャ:OS_EVENT_CPU_BREAKを受信しました\n");
            } else if (msg == FAULT_MSG_FAULT) {
                sFaultInstance->msgId = (u32)FAULT_MSG_FAULT;
                osSyncPrintf("フォルトマネージャ:OS_EVENT_FAULTを受信しました\n");
            } else if (msg == FAULT_MSG_UNK) {
                Fault_UpdatePad();
                faultedThread = NULL;
                continue;
            } else {
                sFaultInstance->msgId = (u32)FAULT_MSG_UNK;
                osSyncPrintf("フォルトマネージャ:不明なメッセージを受信しました\n");
            }

            faultedThread = __osGetCurrFaultedThread();
            osSyncPrintf("__osGetCurrFaultedThread()=%08x\n", faultedThread);

            if (faultedThread == NULL) {
                faultedThread = Fault_FindFaultedThread();
                osSyncPrintf("FindFaultedThread()=%08x\n", faultedThread);
            }
        } while (faultedThread == NULL);

        // Disable floating-point related exceptions
        __osSetFpcCsr(__osGetFpcCsr() & ~(FPCSR_EV | FPCSR_EZ | FPCSR_EO | FPCSR_EU | FPCSR_EI));
        sFaultInstance->faultedThread = faultedThread;

        while (!sFaultInstance->faultHandlerEnabled) {
            Fault_Sleep(1000);
        }
        Fault_Sleep(1000 / 2);

        // Show fault framebuffer
        Fault_DisplayFrameBuffer();

#ifndef DISABLE_CRASH_DBG_AUTOSCROLL
        if (sFaultInstance->autoScroll) {
            Fault_Wait5Seconds();
        } else {
#endif
            // Draw error bar signifying the crash screen is available
            Fault_DrawCornerRec(GPACK_RGBA5551(255, 0, 0, 1));
#ifndef DISABLE_CRASH_DBG_AUTOSCROLL
        }
#endif

#ifndef DISABLE_CRASH_DBG_AUTOSCROLL
        // Set auto-scrolling and default colors
        sFaultInstance->autoScroll = true;
#endif
        FaultDrawer_SetForeColor(GPACK_RGBA5551(255, 255, 255, 1));
        FaultDrawer_SetBackColor(GPACK_RGBA5551(0, 0, 0, 0));

        // Draw pages
        do {
            // Thread context page
            Fault_PrintThreadContext(faultedThread);
            Fault_LogThreadContext(faultedThread);
            Fault_WaitForInput();
            // Stack trace page
            Fault_FillScreenBlack();
            FaultDrawer_DrawText(120, 16, "STACK TRACE");
            Fault_DrawStackTrace(faultedThread, 36, 24, 22);
            Fault_LogStackTrace(faultedThread, 50);
            Fault_WaitForInput();
            // Client pages
            Fault_ProcessClients();
            // Memory dump page
            Fault_DrawMemDump(faultedThread->context.pc - 0x100, (uintptr_t)faultedThread->context.sp, 0, 0);
            // End page
            Fault_FillScreenRed();
            FaultDrawer_DrawText(64, 80, "    CONGRATURATIONS!    ");
            FaultDrawer_DrawText(64, 90, "All Pages are displayed.");
            FaultDrawer_DrawText(64, 100, "       THANK YOU!       ");
            FaultDrawer_DrawText(64, 110, " You are great debugger!");
            Fault_WaitForInput();
        } while (!sFaultInstance->exit);

        while (!sFaultInstance->exit) {}

        Fault_ResumeThread(faultedThread);
    }
}

void Fault_SetFrameBuffer(void* fb, u16 w, u16 h) {
    sFaultInstance->fb = fb;
    FaultDrawer_SetDrawerFB(fb, w, h);
}

void Fault_Init(void) {
    sFaultInstance = &gFaultMgr;
    bzero(sFaultInstance, sizeof(FaultMgr));
    FaultDrawer_Init();
    FaultDrawer_SetInputCallback(Fault_WaitForInput);
    sFaultInstance->exit = false;
    sFaultInstance->msgId = 0;
    sFaultInstance->faultHandlerEnabled = false;
    sFaultInstance->faultedThread = NULL;
    sFaultInstance->padCallback = Fault_PadCallback;
    sFaultInstance->clients = NULL;
#ifndef DISABLE_CRASH_DBG_AUTOSCROLL
    sFaultInstance->autoScroll = false;
#endif
    gFaultMgr.faultHandlerEnabled = true;
    osCreateMesgQueue(&sFaultInstance->queue, &sFaultInstance->msg, 1);
    StackCheck_Init(&sFaultThreadInfo, sFaultStack, STACK_TOP(sFaultStack), 0, 0x100, "fault");
    osCreateThread(&sFaultInstance->thread, THREAD_ID_FAULT, Fault_ThreadEntry, NULL, STACK_TOP(sFaultStack),
                   THREAD_PRI_FAULT);
    osStartThread(&sFaultInstance->thread);
}

/**
 * Fault page for Hungup crashes. Displays the thread id and two messages
 * specified in arguments to `Fault_AddHungupAndCrashImpl`.
 */
void Fault_HungupFaultClient(const char* exp1, const char* exp2) {
    osSyncPrintf("HungUp on Thread %d\n", osGetThreadId(NULL));
    osSyncPrintf("%s\n", exp1 != NULL ? exp1 : "(NULL)");
    osSyncPrintf("%s\n", exp2 != NULL ? exp2 : "(NULL)");
    FaultDrawer_Printf("HungUp on Thread %d\n", osGetThreadId(NULL));
    FaultDrawer_Printf("%s\n", exp1 != NULL ? exp1 : "(NULL)");
    FaultDrawer_Printf("%s\n", exp2 != NULL ? exp2 : "(NULL)");
}

/**
 * Immediately crashes the current thread, for cases where an irrecoverable
 * error occurs. The parameters specify two messages detailing the error, one
 * or both may be NULL.
 */
NORETURN void Fault_AddHungupAndCrashImpl(const char* exp1, const char* exp2) {
    FaultClient client;
    s32 pad;

    Fault_AddClient(&client, Fault_HungupFaultClient, (void*)exp1, (void*)exp2);
    *(u32*)0x11111111 = 0; // trigger an exception via unaligned memory access

    // Since the above line triggers an exception and transfers execution to the fault handler
    // this function does not return and the rest of the function is unreachable.
#ifdef __GNUC__
    __builtin_unreachable();
#endif
}

/**
 * Like `Fault_AddHungupAndCrashImpl`, however provides a fixed message containing
 * filename and line number
 */
NORETURN void Fault_AddHungupAndCrash(const char* file, s32 line) {
    char msg[256];

    sprintf(msg, "HungUp %s:%d", file, line);
    Fault_AddHungupAndCrashImpl(msg, NULL);
}
