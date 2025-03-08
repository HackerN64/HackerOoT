/* <z64.me> adapted from aPLib's depack.c */

/*
 * aPLib compression library  -  the smaller the better :)
 *
 * C depacker
 *
 * Copyright (c) 1998-2014 Joergen Ibsen
 * All Rights Reserved
 *
 * http://www.ibsensoftware.com/
 */
#include "compression.h"

#if COMPRESS_APLIB

static struct decoder dec;

/* block copy, with desired overlapping behavior */
static void* ocopy(void* _src, void* _dst, unsigned n) {
    unsigned char* src = _src;
    unsigned char* dst = _dst;

    do {
        *dst++ = *src++;
    } while (--n);

    return dst;
}

struct decoder {
    unsigned char buf[1024];  /* intermediate buffer for loading  */
    unsigned char* buf_end;   /* pointer that exists for the sole *
                               * purpose of getting size of `buf` */
    unsigned int pstart;      /* offset of next read from rom     */
    unsigned int remaining;   /* remaining size of file           */
    unsigned char* buf_limit; /* points to end of scannable area  *
                               * of buf; this prevents yaz parser *
                               * from overflowing                 */
#if MAJORA
    unsigned char* dst_end; /* end of decompressed block        */
#endif
};
static void* refill(unsigned char* ip) {
    unsigned offset;
    unsigned size;

    /* intermediate buffer is not yet due for a refill */
    if (ip < dec.buf_end - 8) {
        return ip;
    }

    /* the number 8 is used throughout to ensure *
     * dma transfers are always 8 byte aligned   */
    offset = dec.buf_end - ip;
    size = sizeof(dec.buf) - 8;

    /* the last eight bytes wrap around */
    ocopy(dec.buf_end - 8, dec.buf, 8);

    /* transfer data from rom */
    DmaMgr_DmaRomToRam(dec.pstart, dec.buf + 8, size);
    dec.pstart += size;

    return dec.buf + (8 - offset);
}

/* internal data structure */
struct APDSTATE {
    unsigned char* source;
    unsigned char* destination;
    unsigned int tag;
    unsigned int bitcount;
};

static unsigned int aP_getbit(struct APDSTATE* ud) {
    unsigned int bit;

    /* check if tag is empty */
    if (!ud->bitcount--) {
        /* load next tag */
        ud->tag = *ud->source++;
        ud->bitcount = 7;
    }

    /* shift bit out of tag */
    bit = (ud->tag >> 7) & 0x01;
    ud->tag <<= 1;

    return bit;
}

static unsigned int aP_getgamma(struct APDSTATE* ud) {
    unsigned int result = 1;

    /* input gamma2-encoded bits */
    do {
        result = (result << 1) + aP_getbit(ud);
    } while (aP_getbit(ud));

    return result;
}

static inline void* aP_depack(void* source, unsigned char* destination) {
    struct APDSTATE ud;
    unsigned int offs, len, R0, LWM;
    int done;
    int i;

    ud.source = source;
    ud.bitcount = 0;

    R0 = (unsigned int)-1;
    LWM = 0;
    done = 0;

    /* initial buffer fill */
    ud.source = refill(ud.source);

    /* skip header */
    ud.source += 8;

    /* first byte verbatim */
    *destination++ = *ud.source++;

    /* main decompression loop */
    while (!done) {
        ud.source = refill(ud.source);
        if (aP_getbit(&ud)) {
            if (aP_getbit(&ud)) {
                if (aP_getbit(&ud)) {
                    offs = 0;

                    for (i = 4; i; i--) {
                        offs = (offs << 1) + aP_getbit(&ud);
                    }

                    if (offs) {
                        *destination = *(destination - offs);
                        destination++;
                    } else {
                        *destination++ = 0x00;
                    }

                    LWM = 0;
                } else {
                    offs = *ud.source++;

                    len = 2 + (offs & 0x0001);

                    offs >>= 1;

                    if (offs) {
                        for (; len; len--) {
                            *destination = *(destination - offs);
                            destination++;
                        }
                    } else {
                        done = 1;
                    }

                    R0 = offs;
                    LWM = 1;
                }
            } else {
                offs = aP_getgamma(&ud);

                if ((LWM == 0) && (offs == 2)) {
                    offs = R0;

                    len = aP_getgamma(&ud);

                    for (; len; len--) {
                        *destination = *(destination - offs);
                        destination++;
                    }
                } else {
                    if (LWM == 0) {
                        offs -= 3;
                    } else {
                        offs -= 2;
                    }

                    offs <<= 8;
                    offs += *ud.source++;

                    len = aP_getgamma(&ud);

                    if (offs >= 32000) {
                        len++;
                    }
                    if (offs >= 1280) {
                        len++;
                    }
                    if (offs < 128) {
                        len += 2;
                    }

                    for (; len; len--) {
                        *destination = *(destination - offs);
                        destination++;
                    }

                    R0 = offs;
                }

                LWM = 1;
            }
        } else {
            *destination++ = *ud.source++;
            LWM = 0;
        }
    }

    return destination;
}

void Aplib_Decompress(unsigned rom, unsigned char* dst, unsigned compSz) {
    dec.pstart = rom;
    dec.buf_end = dec.buf + sizeof(dec.buf);
    dst = aP_depack(dec.buf_end, dst);
}

#endif
