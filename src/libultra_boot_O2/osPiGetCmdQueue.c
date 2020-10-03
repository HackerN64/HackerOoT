#include "global.h"
#include "ultra64/internal.h"

OSMesgQueue* osPiGetCmdQueue() {
    if (!__osPiDevMgr.initialized) {
        return NULL;
    }

    return __osPiDevMgr.cmdQueue;
}
