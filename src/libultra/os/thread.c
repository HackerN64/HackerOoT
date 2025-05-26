#include "ultra64.h"
#include "attributes.h"

SECTION_DATA NO_REORDER __OSThreadTail __osThreadTail = { NULL, OS_PRIORITY_THREADTAIL };
SECTION_DATA NO_REORDER OSThread* __osRunQueue = (OSThread*)&__osThreadTail;
SECTION_DATA NO_REORDER OSThread* __osActiveQueue = (OSThread*)&__osThreadTail;
SECTION_DATA NO_REORDER OSThread* __osRunningThread = NULL;
SECTION_DATA NO_REORDER OSThread* __osFaultedThread = NULL;

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
