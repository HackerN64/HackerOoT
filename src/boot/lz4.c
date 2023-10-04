#include "ultra64.h"
#include "functions.h"

void wait_dma() {
    s32 status = IO_READ(PI_STATUS_REG);
    while (status & (PI_STATUS_DMA_BUSY | PI_STATUS_IO_BUSY)) {
        status = IO_READ(PI_STATUS_REG);
    }
}

#define LZ4_DECOMPRESS_INPLACE_MARGIN(compressedSize) (((compressedSize) >> 8) + 32)
#define LZ4_BUFFER_SIZE 128
#define LZ4_LITERALS_RUN_LEN 15
#define LZ4_MATCH_RUN_LEN 15
#define LZ4_MIN_MATCH_SIZE 4
#define LZ4_EOF 0
#define HEADER_SIZE 8

#define likely(x) __builtin_expect(!!(x), 1)
#define unlikely(x) __builtin_expect(!!(x), 0)
#define assert(cond, msg) ASSERT(cond, msg, __FILE__, __LINE__)
#define DMARomToRam(src, dst, size)                                                              \
    {                                                                                            \
        assert(DmaMgr_DmaRomToRam((uintptr_t)src, (void*)dst, (size_t)size) != -1, "dma error"); \
        wait_dma();                                                                              \
    }

u32 readWord(uintptr_t src) {
    u8 data[4];
    DMARomToRam(src, data, sizeof(data));
    osSyncPrintf("readWord: data: 0x%08X\n", data);
    return (data[0] << 24) | (data[1] << 16) | (data[2] << 8) | data[3];
}

u8 readByte(uintptr_t src) {
    return readWord(src) >> 24;
}

#define LZ4ULTRA_DECOMPRESSOR_BUILD_LEN(__len)     \
    {                                              \
        u8 byte;                         \
        do {                                       \
            if (unlikely(pInBlock >= pInBlockEnd)) \
                return -1;                         \
            byte = readByte(pInBlock);      \
            osSyncPrintf("c.1: pInBlock: 0x%08X\n", pInBlock);\
            pInBlock++;\
            osSyncPrintf("c.2: pInBlock: 0x%08X, byte: 0x%04X, cond: %d\n", pInBlock, byte, unlikely(byte == 255));\
            __len += byte;                         \
        } while (unlikely(byte == 255));           \
    }

typedef signed long ssize_t;

#define USE_DMA

/**
 * Decompress one data block
 *
 * @param pInBlock pointer to compressed data -> in oot: pointer to ROM address to compress data
 * @param nBlockSize size of compressed data, in bytes
 * @param pOutData pointer to output decompression buffer (previously decompressed bytes + room for decompressing this
 * block)
 * @param nOutDataOffset starting index of where to store decompressed bytes in output buffer (and size of previously
 * decompressed bytes)
 * @param nBlockMaxSize total size of output decompression buffer, in bytes
 *
 * @return size of decompressed data in bytes, or -1 for error
 */
int decompress_lz4_full_mem(uintptr_t pInBlock, int nBlockSize, unsigned char* pOutData, int nBlockMaxSize) {
    uintptr_t pInBlockEnd = pInBlock + nBlockSize;
    //    const unsigned char *pInBlockEnd = &end;
    unsigned char* pCurOutData = pOutData;
    const unsigned char* pOutDataEnd = pCurOutData + nBlockMaxSize;
    const unsigned char* pOutDataFastEnd = pOutDataEnd - 18;

    while (likely(pInBlock < pInBlockEnd)) {
        // osSyncPrintf("decompress_lz4_full_mem: pInBlock: 0x%08X, pOutData: 0x%08X\n", pInBlock, pOutData);
        const unsigned int token = readByte(pInBlock);// (unsigned int)*pInBlock++;
        pInBlock++;
        unsigned int nLiterals = ((token & 0xf0) >> 4);
        osSyncPrintf("a: pInBlock: 0x%08X, token: 0x%04X, nLiterals: 0x%04X\n", pInBlock, token, nLiterals);

        if (nLiterals != LZ4_LITERALS_RUN_LEN && pCurOutData <= pOutDataFastEnd && (pInBlock + 16) <= pInBlockEnd) {
#ifdef USE_DMA
            DMARomToRam(pInBlock, pCurOutData, 16);
#else
            memcpy(pCurOutData, pInBlock, 16);
#endif
        } else {
            osSyncPrintf("b: token: 0x%04X, nLiterals: 0x%04X\n", token, nLiterals);
            if (likely(nLiterals == LZ4_LITERALS_RUN_LEN))                                       
                LZ4ULTRA_DECOMPRESSOR_BUILD_LEN(nLiterals);
            osSyncPrintf("c: token: 0x%04X, nLiterals: 0x%04X\n", token, nLiterals);

            if (unlikely((pInBlock + nLiterals) > pInBlockEnd))
                return -1;
            if (unlikely((pCurOutData + nLiterals) > pOutDataEnd))
                return -2;

#ifdef USE_DMA
            DMARomToRam(pInBlock, pCurOutData, nLiterals);
#else
            memcpy(pCurOutData, pInBlock, nLiterals);
#endif
        }

        pInBlock += nLiterals;
        pCurOutData += nLiterals;

        if (likely((pInBlock + 2) <= pInBlockEnd)) {
            unsigned int nMatchOffset;

            // osSyncPrintf("0: pInBlock: 0x%08X\n", pInBlock);
            nMatchOffset = readByte(pInBlock); // (unsigned int)*pInBlock++;
            pInBlock++;
            nMatchOffset |= readByte(pInBlock) << 8; // ((unsigned int)*pInBlock++) << 8;
            pInBlock++;
            // osSyncPrintf("0: nMatchOffset: 0x%08X\n", nMatchOffset);

            unsigned int nMatchLen = (token & 0x0f);

            nMatchLen += LZ4_MIN_MATCH_SIZE;
            if (nMatchLen != (LZ4_MATCH_RUN_LEN + LZ4_MIN_MATCH_SIZE) && nMatchOffset >= 8 &&
                pCurOutData <= pOutDataFastEnd) {
                // osSyncPrintf("1: pCurOutData: 0x%08X, nMatchOffset: 0x%08X\n", pCurOutData, nMatchOffset);
                const unsigned char* pSrc = pCurOutData - nMatchOffset;

                if (unlikely(pSrc < pOutData)) {
                    // osSyncPrintf("2: pSrc: 0x%08X, pOutData: 0x%08X\n", pSrc, pOutData);
                    return -3;
                }

#ifdef USE_DMA
                DMARomToRam(pSrc, pCurOutData, 8);
                DMARomToRam(pSrc + 8, pCurOutData + 8, 8);
                DMARomToRam(pSrc + 16, pCurOutData + 16, 2);
#else
                memcpy(pCurOutData, pSrc, 8);
                memcpy(pCurOutData + 8, pSrc + 8, 8);
                memcpy(pCurOutData + 16, pSrc + 16, 2);
#endif

                pCurOutData += nMatchLen;
            } else {
                if (likely(nMatchLen == (LZ4_MATCH_RUN_LEN + LZ4_MIN_MATCH_SIZE)))
                    LZ4ULTRA_DECOMPRESSOR_BUILD_LEN(nMatchLen);

                if (unlikely((pCurOutData + nMatchLen) > pOutDataEnd))
                    return -4;

                const unsigned char* pSrc = pCurOutData - nMatchOffset;
                if (unlikely(pSrc < pOutData))
                    return -5;

                if (nMatchOffset >= 16 && (pCurOutData + nMatchLen) <= pOutDataFastEnd) {
                    const unsigned char* pCopySrc = pSrc;
                    unsigned char* pCopyDst = pCurOutData;
                    const unsigned char* pCopyEndDst = pCurOutData + nMatchLen;

                    do {
#ifdef USE_DMA
                        DMARomToRam(pCopySrc, pCopyDst, 16);
#else
                        memcpy(pCopyDst, pCopySrc, 16);
#endif
                        pCopySrc += 16;
                        pCopyDst += 16;
                    } while (pCopyDst < pCopyEndDst);

                    pCurOutData += nMatchLen;
                } else {
                    while (nMatchLen--) {
                        *pCurOutData++ = *pSrc++;
                    }
                }
            }
        }
    }

    return (int)(pCurOutData - pOutData);
}

size_t getSizeFromHeader(uintptr_t src) {
    uintptr_t sizePtr[4];
    DMARomToRam(src, sizePtr, sizeof(sizePtr));
    return (sizePtr[0] << 24) | (sizePtr[1] << 16) | (sizePtr[2] << 8) | (sizePtr[3] << 0);
}

size_t LZ4_Decompress(uintptr_t* src, void* dst, size_t sz, size_t dstSz) {
    size_t compSz = sz;
    size_t decompSz = dstSz; // getSizeFromHeader(*src + 5);
    u8* dst_ = dst;
    u8* dstEnd = dst_ + decompSz;
    u8* tail = dstEnd;
    ssize_t result;

    *src += 8;
    compSz -= 8;
    tail += LZ4_DECOMPRESS_INPLACE_MARGIN(compSz);
    tail -= compSz;
    // osSyncPrintf("tail: 0x%08X, src: 0x%08X\n", *tail, *src);

    DMARomToRam(*src, tail, compSz);
    result = decompress_lz4_full_mem(*src, compSz - 4, dst_, decompSz);
    osSyncPrintf("\nsrc: 0x%08X, decSize: %X, result: %d, sz: 0x%08X\n", src, decompSz, result, sz);
    assert(result > 0, "an error occured during decompression");
    assert(result == (ssize_t)sz, "result == (ssize_t)sz");

    return decompSz;
}
