/* <z64.me> adapted from the official lz4 decoder at lz4/lib/lz4.c */

#ifdef COMPRESSION_LZ4

#define RINGBUFFER_SIZE (16 * 1024)

#define HEADER_SIZE 4

#define LZ4_MAX_INPUT_SIZE 0x7E000000 /* 2 113 929 216 bytes */
#define LZ4_COMPRESSBOUND(isize) ((unsigned)(isize) > (unsigned)LZ4_MAX_INPUT_SIZE ? 0 : (isize) + ((isize) / 255) + 16)
#define KIB(X) ((X) * 1024)
#define MAX_BUFFER_SIZE KIB(LZ4_BLOCK_SIZE_KIB)

#define LZ4_DECOMPRESS_INPLACE_MARGIN(compressedSize) (((compressedSize) >> 8) + 32)
#define LZ4_DECOMPRESS_INPLACE_BUFFER_SIZE(decompressedSize)                                                           \
    ((decompressedSize) +                                                                                              \
     LZ4_DECOMPRESS_INPLACE_MARGIN(                                                                                    \
         decompressedSize)) /**< note: presumes that compressedSize < decompressedSize. note2: margin is overestimated \
                               a bit, since it could use compressedSize instead */

#define PTR_t uintptr_t

#include "global.h"

static void DmaRomToRam(PTR_t* src, void* dst, unsigned sz);

#ifndef LZ4_BLOCK_SIZE_KIB
#error please define LZ4_BLOCK_SIZE_KIB e.g. -DLZ4_BLOCK_SIZE_KIB=64
#endif

#define MINMATCH 4
#define ML_BITS 4
#define LASTLITERALS 5
#define MFLIMIT 12

/**
 * LZ4 relies on memcpy with a constant size being inlined. In freestanding
 * environments, the compiler can't assume the implementation of memcpy() is
 * standard compliant, so it can't apply its specialized memcpy() inlining
 * logic. When possible, use __builtin_memcpy() to tell the compiler to analyze
 * memcpy() as if it were standard compliant, so it can inline it in freestanding
 * environments. This is needed when decompressing the Linux Kernel, for example.
 */
#if !defined(LZ4_memcpy)
#if defined(__GNUC__) && (__GNUC__ >= 4)
#define LZ4_memcpy(dst, src, size) __builtin_memcpy(dst, src, size)
#else
#define LZ4_memcpy(dst, src, size) memcpy(dst, src, size)
#endif
#endif

#if !defined(LZ4_memmove)
#if defined(__GNUC__) && (__GNUC__ >= 4)
#define LZ4_memmove __builtin_memmove
#else
#define LZ4_memmove memmove
#endif
#endif

/* core decoder variant for LZ4_decompress_fast*()
 * for legacy support only : these entry points are deprecated.
 * - Presumes input is correctly formed (no defense vs malformed inputs)
 * - Does not know input size (presume input buffer is "large enough")
 * - Decompress a full block (only)
 * @return : nb of bytes read from input.
 * Note : this variant is not optimized for speed, just for maintenance.
 *		the goal is to remove support of decompress_fast*() variants by v2.0
 **/
#define prefixSize 0
#define dictStart 0
#define dictSize 0

static u8 ringbuf[RINGBUFFER_SIZE];

static struct decoder {
    PTR_t src;
    u32 ringbufPos;
    u32 remainingAligned;
    int remaining;
} dec;

static inline void Init(PTR_t src, u32 compSz, u32 compSzAligned) {
    dec.remainingAligned = compSzAligned;
    dec.remaining = compSz;
    dec.src = src;
    dec.ringbufPos = 0;
}

static inline void Refill(void) {
    u32 read = dec.remainingAligned;

    if (RINGBUFFER_SIZE < read)
        read = RINGBUFFER_SIZE;

    dec.remainingAligned -= read;

    DmaRomToRam(&dec.src, ringbuf, read);
    dec.ringbufPos = 0;
}

static inline u8 ReadByte(void) {
    if (dec.ringbufPos >= RINGBUFFER_SIZE)
        Refill();
    if (dec.remaining > 0)
        dec.remaining--;
    return ringbuf[dec.ringbufPos++];
}

static inline u16 ReadShort(void) {
    u16 v = ReadByte();

    return v | (ReadByte() << 8);
}

static inline void ReadInto(u8* dst, u32 len) {
    // possibly optimized
    while (len) {
        u32 rem = RINGBUFFER_SIZE - dec.ringbufPos;

        if (len < rem)
            rem = len;

        // NOTE: on N64, it may be faster to use the builtin bcopy
        bcopy(ringbuf + dec.ringbufPos, dst, rem);

        len -= rem;
        dst += rem;
        dec.ringbufPos += rem;
        dec.remaining -= rem;

        if (dec.ringbufPos >= RINGBUFFER_SIZE)
            Refill();
    }

    // old, per-byte method (possibly slower)
    // while (len--)
    //	*(dst++) = ReadByte();
}

static inline size_t ReadLongLength(void) {
    size_t b, l = 0;
    do {
        b = ReadByte();
        l += b;
    } while (b == 255);
    return l;
}

size_t LZ4_decompress_unsafe_generic(u8* const ostart) {
    u8* op = (u8*)ostart;
    const u8* const prefixStart = ostart - prefixSize;

    while (1) {
        /* start new sequence */
        unsigned token = ReadByte();

        /* literals */
        {
            size_t ll = token >> ML_BITS;
            if (ll == 15) {
                /* long literal length */
                ll += ReadLongLength();
            }
            ReadInto(op, ll); /* support in-place decompression */
            op += ll;
            if (dec.remaining <= 0)
                break;
        }

        /* match */
        {
            size_t ml = token & 15;
            size_t const offset = ReadShort();

            if (ml == 15) {
                /* long literal length */
                ml += ReadLongLength();
            }
            ml += MINMATCH;

            {
                const u8* match = op - offset;

                /* out of range */
                if (offset > (size_t)(op - prefixStart) + dictSize) {
                    // DEBUGLOG(6, "offset out of range");
                    return -1;
                }

                /* check special case : extDict */
                if (offset > (size_t)(op - prefixStart)) {
                    /* extDict scenario */
                    const u8* const dictEnd = dictStart + dictSize;
                    const u8* extMatch = dictEnd - (offset - (size_t)(op - prefixStart));
                    size_t const extml = (size_t)(dictEnd - extMatch);
                    if (extml > ml) {
                        /* match entirely within extDict */
                        LZ4_memmove(op, extMatch, ml);
                        op += ml;
                        ml = 0;
                    } else {
                        /* match split between extDict & prefix */
                        LZ4_memmove(op, extMatch, extml);
                        op += extml;
                        ml -= extml;
                    }
                    match = prefixStart;
                }

                /* match copy - slow variant, supporting overlap copy */
                {
                    size_t u;
                    for (u = 0; u < ml; u++) {
                        op[u] = match[u];
                    }
                }
            }

            op += ml;
        } /* match */
    }     /* main loop */
    return (size_t)(op - ostart);
}


static void DmaRomToRam(PTR_t* src, void* dst, unsigned sz) {
    DmaMgr_DmaRomToRam(*src, dst, sz);
    *src += sz;
}

size_t LZ4_Decompress(PTR_t src, void* dst_, size_t compSz, size_t originalSize) {
    PTR_t srcTmp = src;
    u8* dstStart = dst_;
    u8* dst = dstStart;
    u8* dstEnd;
    u8* tail;
    size_t decSz;
    size_t compSzAligned = compSz;
    size_t result;

    // read the header
    DmaRomToRam(&srcTmp, dst, 16);

    // 'lz4h' is present, so skip it
    if (HEADER_SIZE)
        dst += 4;

    // 24-bit decSz
    decSz = (dst[1] << 16) | (dst[2] << 8) | (dst[3]);

    // derive *actual* compSz and decSz
    compSz -= decSz & 0xf;
    decSz &= 0xfffff0;

    dst = dstStart;

    Init(src, compSz - (HEADER_SIZE + 4), compSzAligned);
    Refill();
    dec.ringbufPos = HEADER_SIZE + 4;
    result = LZ4_decompress_unsafe_generic(dst);
    if (result != decSz)
        osSyncPrintf("result: 0x%08X, decSz: 0x%08X\n", result, decSz);
    // ASSERT(result == decSz, "decompression error", __FILE__, __LINE__);
    (void)tail;
    (void)dstEnd;

    return decSz;
}

#endif
