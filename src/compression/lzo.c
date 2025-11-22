#include "compression.h"

#if COMPRESS_LZO

/* <z64.me> adapted from lzo1x_d.ch */

/* negative indexing distance */
#define NINDEX 2

/* lzo max negative offset */
#define M2_MAX_OFFSET 0x0800

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

/* refill intermediate buffer if necessary */
static unsigned char* refill(unsigned char* ip) {
    unsigned offset;
    unsigned size;
    int align;

    /* intermediate buffer is not yet due for a refill */
    if (ip < dec.buf_end - 32) {
        return ip;
    }

    ip -= NINDEX;

    /* the weird alignment stuff ensures dma *
     * transfers are always 8 byte aligned   */
    offset = dec.buf_end - ip;
    align = 8 - (offset & 7);
    offset += align;
    size = sizeof(dec.buf) - offset;

    /* the last bytes wrap around */
    ocopy(dec.buf_end - offset, dec.buf, offset);
    ip = dec.buf + align + NINDEX;

    /* transfer data from rom */
    DmaMgr_DmaRomToRam(dec.pstart, dec.buf + offset, size);
    dec.pstart += size;

    return ip;
}

void LZO_Decompress(unsigned int pstart /* physical rom offset of file      */
                    ,
                    unsigned char* op /* destination of decompressed data */
                    ,
                    unsigned int sz /* size of compressed file          */
) {
    unsigned char* m_pos;
    unsigned char* ip;
    int t;

    dec.pstart = pstart;
    dec.buf_end = dec.buf + sizeof(dec.buf);
    ip = dec.buf_end;

    /* initial buffer fill */
    ip = refill(ip);

    /* skip header */
    ip += 8;

    if (*ip > 17) {
        t = *ip++ - 17;
        if (t < 4) {
            goto match_next;
        }
        op = ocopy(ip, op, t);
        ip += t;
        goto first_literal_run;
    }

    for (;;) {
        t = *ip++;
        if (t >= 16) {
            goto match;
        }
        /* a literal run */
        if (t == 0) {
            while (*ip == 0) {
                t += 255;
                ip++;
            }
            t += 15 + *ip++;
        }
        /* copy literals */
        {
            t += 3;
            /* this loop can advance any number of bytes (4k+) */
            do {
                /* ensure buffer contains data */
                ip = refill(ip);

                *op++ = *ip++;
            } while (--t);
        }

    first_literal_run:
        t = *ip++;
        if (t >= 16) {
            goto match;
        }
        m_pos = op - (1 + M2_MAX_OFFSET);
        m_pos -= t >> 2;
        m_pos -= ip[0] << 2;
        ip++;

        op = ocopy(m_pos, op, 3);
        goto match_done;

        /* handle matches */
        for (;;) {
        match:
            m_pos = op - 1;

            if (t >= 64) /* M2 match */
            {
                m_pos -= (t >> 2) & 7;
                m_pos -= ip[0] << 3;
                ip++;
                t = (t >> 5) - 1;
            } else if (t >= 32) /* M3 match */
            {
                t &= 31;

                /* this never advances more than 8 bytes */
                if (t == 0) {
                    while (*ip == 0) {
                        t += 255;
                        ip++;
                    }
                    t += 31 + *ip++;
                }
                m_pos -= (ip[0] >> 2) + (ip[1] << 6);
                ip += 2;
            } else if (t >= 16) /* a M4 match */
            {
                m_pos++;
                m_pos -= (t & 8) << 11;
                t &= 7;

                /* this never advances more than 8 bytes */
                if (t == 0) {
                    while (*ip == 0) {
                        t += 255;
                        ip++;
                    }
                    t += 7 + *ip++;
                }
                m_pos -= (ip[0] >> 2) + (ip[1] << 6);
                /* end of compressed file */
                if (m_pos == op) {
                    goto L_done;
                }
                m_pos -= 0x4000;
                ip += 2;
            } else /* a M1 match */
            {
                m_pos -= t >> 2;
                m_pos -= ip[0] << 2;
                ip += 1;
                op = ocopy(m_pos, op, 2);
                goto match_done;
            }

            /* copy match */
            t += 2;
            op = ocopy(m_pos, op, t);

        match_done:
            /* ensure buffer contains data */
            ip = refill(ip);
            t = ip[-NINDEX] & 3;
            if (t == 0) {
                break;
            }

            /* copy literals */
            /* this never advances more than 4 bytes */
        match_next:
            op = ocopy(ip, op, t);
            ip += t;
            t = *ip++;
        }
    }
L_done:
    do {
    } while (0);
#if MAJORA
    dec.dst_end = op;
    dec.buf_end = 0;
#endif
}

#endif
