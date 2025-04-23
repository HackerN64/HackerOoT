#include "ultra64.h"

NO_REORDER __OSThreadTail __osThreadTail = { NULL, OS_PRIORITY_THREADTAIL };
NO_REORDER OSThread* __osRunQueue = (OSThread*)&__osThreadTail;
NO_REORDER OSThread* __osActiveQueue = (OSThread*)&__osThreadTail;
NO_REORDER OSThread* __osRunningThread = NULL;
NO_REORDER OSThread* __osFaultedThread = NULL;

void __osDequeueThread(register OSThread** queue, register OSThread* thread) {
    register OSThread* pred = (OSThread*)queue;
    register OSThread* succ = pred->next;

    while (succ != NULL) {
        if (succ == thread) {
            pred->next = thread->next;
            return;
        }
        pred = succ;
        succ = pred->next;
    }
}
