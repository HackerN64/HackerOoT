#include "global.h"
#include "config.h"

#if ENABLE_SPLIT_ZBUFFER
uintptr_t sSysCfbFbPtr[3];
#else
uintptr_t sSysCfbFbPtr[2];
#endif
uintptr_t sSysCfbEnd;

void SysCfb_Init(s32 n64dd) {
    u32 screenSize;
    uintptr_t tmpFbEnd;

    if (osMemSize >= 0x800000) {
        // "8MB or more memory is installed"
        PRINTF("８Ｍバイト以上のメモリが搭載されています\n");
        tmpFbEnd = IS_DEBUG_HEAP_ENABLED ? 0x8044BE80 : ((FRAMEBUFFER_SPLIT != 0) ? (0x80800000 - (FRAMEBUFFER_SPLIT)) : SYS_CFB_END);
        if (n64dd == 1) {
            PRINTF("RAM 8M mode (N64DD対応)\n"); // "RAM 8M mode (N64DD compatible)"
#if IS_DEBUG
            sSysCfbEnd = 0x805FB000;
#else
            sSysCfbEnd = 0x80600000;
#endif
        } else {
            // "The margin for this version is %dK bytes"
            PRINTF("このバージョンのマージンは %dK バイトです\n", (0x4BC00 / 1024));
            sSysCfbEnd = tmpFbEnd;
        }
    } else if (osMemSize >= 0x400000) {
        PRINTF("RAM4M mode\n");
        sSysCfbEnd = 0x80400000;
    } else {
        LogUtils_HungupThread("../sys_cfb.c", 354);
    }

    screenSize = SCREEN_WIDTH * SCREEN_HEIGHT;
    sSysCfbEnd &= ~0x3F;

    if (1) {}

    // "The final address used by the system is %08x"
    PRINTF("システムが使用する最終アドレスは %08x です\n", sSysCfbEnd);
#if ENABLE_SPLIT_FRAMEBUFFERS // split framebuffers
    sSysCfbFbPtr[0] = 0x80700000;
    sSysCfbFbPtr[1] = 0x80600000;
#if ENABLE_SPLIT_ZBUFFER // and z-buffer
    sSysCfbFbPtr[2] = 0x80500000;
#endif
#elif ENABLE_SPLIT_ZBUFFER // only split z-buffer
    sSysCfbFbPtr[0] = sSysCfbEnd - (screenSize * 4);
    sSysCfbFbPtr[1] = sSysCfbEnd - (screenSize * 2);
    sSysCfbFbPtr[2] = 0x80700000;
#else // vanilla (split nothing)
    sSysCfbFbPtr[0] = sSysCfbEnd - (screenSize * 4);
    sSysCfbFbPtr[1] = sSysCfbEnd - (screenSize * 2);
#endif
    // "Frame buffer addresses are %08x and %08x"
    PRINTF("フレームバッファのアドレスは %08x と %08x です\n", sSysCfbFbPtr[0], sSysCfbFbPtr[1]);
}

void SysCfb_Reset(void) {
    sSysCfbFbPtr[0] = 0;
    sSysCfbFbPtr[1] = 0;
#if ENABLE_SPLIT_ZBUFFER
    sSysCfbFbPtr[2] = 0;
#endif
    sSysCfbEnd = 0;
}

void* SysCfb_GetFbPtr(s32 idx) {
#if ENABLE_SPLIT_ZBUFFER
    if (idx < 3) {
        return (void*)sSysCfbFbPtr[idx];
    }
#else
    if (idx < 2) {
        return (void*)sSysCfbFbPtr[idx];
    }
#endif
    return NULL;
}

void* SysCfb_GetFbEnd(void) {
    return (void*)sSysCfbEnd;
}
