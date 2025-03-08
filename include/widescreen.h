#ifndef WIDESCREEN_H
#define WIDESCREEN_H

#include "ultra64/ultratypes.h"
#include "z64save.h"

// This file provides macros to handle switching between 4:3 and 16:9 and fixing issues.
// It is not meant to be something the users can edit.

// Base un-wide values
#define WIDE_GET_4_3 (4.0f / 3.0f)
#define WIDE_GET_16_9 (16.0f / 9.0f)
#define WIDE_GET_RATIO (WIDE_GET_4_3 / WIDE_GET_16_9)

// Maths
#define WIDE_DIV(originalVal, changeBy) (USE_WIDESCREEN ? (u16)(originalVal / changeBy) : originalVal)
#define WIDE_MULT(originalVal, changeBy) (USE_WIDESCREEN ? (u16)(originalVal * changeBy) : originalVal)
#define WIDE_INCR(originalVal, changeBy) (USE_WIDESCREEN ? originalVal + changeBy : originalVal)

// Buttons base shift values
#define WIDE_BTNA_SHIFT 26
#define WIDE_BTNB_SHIFT 37
#define WIDE_BTNC_SHIFT 60
#define WIDE_BTNSTART_SHIFT ((s32)(WIDE_GET_16_9 * 100.f))

// Individual C-Buttons shift values
#define WIDE_CRIGHT_SHIFT WIDE_BTNC_SHIFT
#define WIDE_CDOWN_SHIFT (WIDE_BTNC_SHIFT + 16)
#define WIDE_CLEFT_SHIFT (WIDE_BTNC_SHIFT + 32)
#define WIDE_CUP_SHIFT WIDE_CDOWN_SHIFT // c-up is synced with c-down
#define WIDE_C_SHIFT(button) (button == 0 ? WIDE_CLEFT_SHIFT : button == 1 ? WIDE_CDOWN_SHIFT : WIDE_CRIGHT_SHIFT)
#define WIDE_C_VAL(originalVal, button) WIDE_INCR(WIDE_DIV(originalVal, WIDE_GET_RATIO), (WIDE_C_SHIFT(button) * 4))

// Other shift values
#define WIDE_MINIMAP_SHIFT 110
#define WIDE_MINIMAP_ARROW_SHIFT 1.55f
#define WIDE_MINIMAP_ARROW_SHIFT_DGN (1585.0f / 900.0f)
#define WIDE_ITEMICON_RIGHT_X(button) (button != 0 ? -25 : -32)
#define WIDE_N64_MODE(originalVal, changeBy) (WIDESCREEN_N64_MODE ? WIDE_INCR(originalVal, changeBy) : originalVal)

#endif
