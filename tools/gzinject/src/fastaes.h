#ifdef FASTAES
#ifndef _FASTAES_H
#define _FASTAES_H

#include <stdint.h>
#include <wmmintrin.h>

/**
 * fast aes for  x86/x86-64 processors.
 */

typedef uint8_t state_t[4][4];

typedef struct {
    state_t state;
    uint8_t iv[16];
    // gzinject only cares about aes128
    __m128i key_schedule[11];
    __m128i dkey_schedule[11];
} aes_ctxt_t;

void aes_ctx_init(aes_ctxt_t *ctx, const uint8_t *key, const uint8_t *iv);
void aes_encrypt_buffer(aes_ctxt_t *ctx, uint8_t *buffer, size_t len);
void aes_decrypt_buffer(aes_ctxt_t *ctx, uint8_t *buffer, size_t len);

#endif
#endif
