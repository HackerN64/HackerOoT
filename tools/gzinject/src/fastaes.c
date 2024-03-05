#ifdef FASTAES
#include <string.h>
#include "fastaes.h"

static __m128i do_key_exp(__m128i a, __m128i b) {
    __m128i tmp;

    b = _mm_shuffle_epi32(b, 0xFF);
    tmp = _mm_slli_si128(a, 4);
    a = _mm_xor_si128(a, tmp);
    tmp = _mm_slli_si128(a, 4);
    a = _mm_xor_si128(a, tmp);
    tmp = _mm_slli_si128(a, 4);
    a = _mm_xor_si128(a, tmp);
    a = _mm_xor_si128(a, b);

    return a;
}

static void key_expansion(const uint8_t *key, __m128i *key_sched, __m128i *dkey_sched) {
    key_sched[0] = _mm_loadu_si128((const __m128i_u*)key);
    key_sched[1] = do_key_exp(key_sched[0], _mm_aeskeygenassist_si128(key_sched[0], 0x01));
    key_sched[2] = do_key_exp(key_sched[1], _mm_aeskeygenassist_si128(key_sched[1], 0x02));
    key_sched[3] = do_key_exp(key_sched[2], _mm_aeskeygenassist_si128(key_sched[2], 0x04));
    key_sched[4] = do_key_exp(key_sched[3], _mm_aeskeygenassist_si128(key_sched[3], 0x08));
    key_sched[5] = do_key_exp(key_sched[4], _mm_aeskeygenassist_si128(key_sched[4], 0x10));
    key_sched[6] = do_key_exp(key_sched[5], _mm_aeskeygenassist_si128(key_sched[5], 0x20));
    key_sched[7] = do_key_exp(key_sched[6], _mm_aeskeygenassist_si128(key_sched[6], 0x40));
    key_sched[8] = do_key_exp(key_sched[7], _mm_aeskeygenassist_si128(key_sched[7], 0x80));
    key_sched[9] = do_key_exp(key_sched[8], _mm_aeskeygenassist_si128(key_sched[8], 0x1B));
    key_sched[10] = do_key_exp(key_sched[9], _mm_aeskeygenassist_si128(key_sched[9], 0x36));

    dkey_sched[0] = key_sched[0];
    dkey_sched[1] = _mm_aesimc_si128(key_sched[1]);
    dkey_sched[2] = _mm_aesimc_si128(key_sched[2]);
    dkey_sched[3] = _mm_aesimc_si128(key_sched[3]);
    dkey_sched[4] = _mm_aesimc_si128(key_sched[4]);
    dkey_sched[5] = _mm_aesimc_si128(key_sched[5]);
    dkey_sched[6] = _mm_aesimc_si128(key_sched[6]);
    dkey_sched[7] = _mm_aesimc_si128(key_sched[7]);
    dkey_sched[8] = _mm_aesimc_si128(key_sched[8]);
    dkey_sched[9] = _mm_aesimc_si128(key_sched[9]);
    dkey_sched[10] = key_sched[10];

}

void aes_ctx_init(aes_ctxt_t *ctx, const uint8_t *key, const uint8_t *iv) {
    memcpy(ctx->iv, iv, sizeof(ctx->iv));
    key_expansion(key, ctx->key_schedule, ctx->dkey_schedule);
}

static __m128i cipher(__m128i state, __m128i *key_sched) {
    state = _mm_xor_si128(state, key_sched[0]);

    for(int i = 1; i < 10; i++) {
        state = _mm_aesenc_si128(state, key_sched[i]);
    }

    return _mm_aesenclast_si128(state, key_sched[10]);
}

static __m128i inv_cipher(__m128i state, __m128i *key_sched) {
    state = _mm_xor_si128(state, key_sched[10]);
    state = _mm_aesdec_si128(state, key_sched[9]);
    state = _mm_aesdec_si128(state, key_sched[8]);
    state = _mm_aesdec_si128(state, key_sched[7]);
    state = _mm_aesdec_si128(state, key_sched[6]);
    state = _mm_aesdec_si128(state, key_sched[5]);
    state = _mm_aesdec_si128(state, key_sched[4]);
    state = _mm_aesdec_si128(state, key_sched[3]);
    state = _mm_aesdec_si128(state, key_sched[2]);
    state = _mm_aesdec_si128(state, key_sched[1]);

    state = _mm_aesdeclast_si128(state, key_sched[0]);

    return state;
}

void aes_encrypt_buffer(aes_ctxt_t *ctx, uint8_t *buffer, size_t len) {
    __m128i iv = _mm_loadu_si128((const __m128i*)ctx->iv);
    __m128i state;

    for(int i = 0; i < len; i += 16) {
        state = _mm_loadu_si128((const __m128i*)buffer);
        state = _mm_xor_si128(state, iv);
        state = cipher(state, ctx->key_schedule);
        _mm_storeu_si128((__m128i_u*)buffer, state);
        iv = state;

        buffer += 16;
    }

    _mm_storeu_si128((__m128i_u*)&ctx->state, state);
    _mm_storeu_si128((__m128i_u*)ctx->iv, iv);
}

void aes_decrypt_buffer(aes_ctxt_t *ctx, uint8_t *buffer, size_t len) {
    __m128i state;
    __m128i iv = _mm_loadu_si128((const __m128i_u*)ctx->iv);
    __m128i next_iv;

    for(int i = 0; i < len; i += 16) {
        state = _mm_loadu_si128((const __m128i_u*)buffer);
        next_iv = state;
        state = inv_cipher(state, ctx->dkey_schedule);
        state = _mm_xor_si128(state, iv);
        iv = next_iv;
        _mm_storeu_si128((__m128i_u*)buffer, state);
        buffer += 16;
    }

    _mm_storeu_si128((__m128i_u*)&ctx->state, state);
    _mm_storeu_si128((__m128i_u*)ctx->iv, iv);
}
#endif
