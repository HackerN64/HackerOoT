#include "global.h"

NO_REORDER __OSThreadTail __osThreadTail = { NULL, OS_PRIORITY_THREADTAIL };
NO_REORDER OSThread* __osRunQueue = (OSThread*)&__osThreadTail;
NO_REORDER OSThread* __osActiveQueue = (OSThread*)&__osThreadTail;
NO_REORDER OSThread* __osRunningThread = NULL;
NO_REORDER OSThread* __osFaultedThread = NULL;

void __osDequeueThread(OSThread** queue, OSThread* thread) {
    register OSThread** a2 = queue;
    register OSThread* a3 = *a2;

    while (a3 != NULL) {
        if (a3 == thread) {
            *a2 = thread->next;
            return;
        }
        a2 = &a3->next;
        a3 = *a2;
    }
}
