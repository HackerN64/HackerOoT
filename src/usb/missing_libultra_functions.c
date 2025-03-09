#include "global.h"
#include "ultra64/internal.h"

char* strpbrk(const char* string1, const char* string2) {
    char* b;

    while (*string1) {
        b = (char*)string2;
        while (*b) {
            if (*b++ == *string1) {
                return (char*)string1;
            }
        }
        string1++;
    }
    return NULL;
}

char* strtok(char* string1, const char* string2) {
    static char* ptr = NULL;
    char* a;

    if (string1 != NULL) {
        ptr = string1;
    }
    if (ptr == NULL) {
        return NULL;
    }
    a = ptr;
    ptr = strpbrk(ptr, string2);
    if (ptr != NULL) {
        *ptr++ = '\0';
    }
    return a;
}

char* strcpy(char* str1, const char* str2) {
    char* p;
    p = str1;
    while (*str2) {
        *p++ = *str2++;
    }
    *p = '\0';
    return str1;
}

int strncmp(const char* s1, const char* s2, size_t n) {
    while (n && *s1 && (*s1 == *s2)) {
        ++s1;
        ++s2;
        --n;
    }
    if (n == 0) {
        return 0;
    } else {
        return (*(unsigned char*)s1 - *(unsigned char*)s2);
    }
}

#define WAIT_ON_IOBUSY(stat)                                    \
    {                                                           \
        stat = IO_READ(PI_STATUS_REG);                          \
        while (stat & (PI_STATUS_IO_BUSY | PI_STATUS_DMA_BUSY)) \
            stat = IO_READ(PI_STATUS_REG);                      \
    }                                                           \
    (void)0

s32 __osPiRawReadIo(u32 devAddr, u32* data) {
    register u32 stat;

    WAIT_ON_IOBUSY(stat);
    *data = IO_READ((u32)osRomBase | devAddr);

    return 0;
}

s32 __osPiRawWriteIo(u32 devAddr, u32 data) {
    register u32 stat;

    WAIT_ON_IOBUSY(stat);
    IO_WRITE((u32)osRomBase | devAddr, data);

    return 0;
}

s32 osPiWriteIo(u32 devAddr, u32 data) {
    register s32 ret;

#ifdef _DEBUG
    if (devAddr & 0x3) {
        __osError(ERR_OSPIWRITEIO, 1, devAddr);
        return -1;
    }
#endif

    __osPiGetAccess();
    ret = __osPiRawWriteIo(devAddr, data);
    __osPiRelAccess();

    return ret;
}

s32 osPiReadIo(u32 devAddr, u32* data) {
    register s32 ret;

#ifdef _DEBUG
    if (devAddr & 0x3) {
        __osError(ERR_OSPIREADIO, 1, devAddr);
        return -1;
    }
#endif

    __osPiGetAccess();
    ret = __osPiRawReadIo(devAddr, data);
    __osPiRelAccess();

    return ret;
}

s32 osPiStartDma(OSIoMesg* mb, s32 priority, s32 direction, u32 devAddr, void* dramAddr, u32 size, OSMesgQueue* mq) {
    register s32 ret;
    if (!__osPiDevMgr.active) {
        return -1;
    }

    if (direction == OS_READ) {
        mb->hdr.type = OS_MESG_TYPE_DMAREAD;
    } else {
        mb->hdr.type = OS_MESG_TYPE_DMAWRITE;
    }

    mb->hdr.pri = priority;
    mb->hdr.retQueue = mq;
    mb->dramAddr = dramAddr;
    mb->devAddr = devAddr;
    mb->size = size;
    mb->piHandle = NULL;

    if (priority == OS_MESG_PRI_HIGH) {
        ret = osJamMesg(osPiGetCmdQueue(), (OSMesg)mb, OS_MESG_NOBLOCK);
    } else {
        ret = osSendMesg(osPiGetCmdQueue(), (OSMesg)mb, OS_MESG_NOBLOCK);
    }

    return ret;
}
