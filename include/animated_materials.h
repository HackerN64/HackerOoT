#ifndef ANIMATED_MATERIALS_H
#define ANIMATED_MATERIALS_H

#include "ultra64.h"
#include "config.h"

#if ENABLE_ANIMATED_MATERIALS

typedef enum AnimatedMatType {
    /* 0 */ ANIM_MAT_TYPE_TEX_SCROLL,
    /* 1 */ ANIM_MAT_TYPE_TWO_TEX_SCROLL,
    /* 2 */ ANIM_MAT_TYPE_COLOR,
    /* 3 */ ANIM_MAT_TYPE_COLOR_LERP,
    /* 4 */ ANIM_MAT_TYPE_COLOR_NON_LINEAR_INTERP,
    /* 5 */ ANIM_MAT_TYPE_TEX_CYCLE,
    /* 6 */ ANIM_MAT_TYPE_MAX
} AnimatedMatType;

typedef struct {
    /* 0x0 */ u8 r;
    /* 0x1 */ u8 g;
    /* 0x2 */ u8 b;
    /* 0x3 */ u8 a;
    /* 0x4 */ u8 lodFrac;
} F3DPrimColor; // size = 0x5

typedef struct {
    /* 0x0 */ u8 r;
    /* 0x1 */ u8 g;
    /* 0x2 */ u8 b;
    /* 0x3 */ u8 a;
} F3DEnvColor; // size = 0x4

typedef struct {
    /* 0x0 */ u16 keyFrameLength;
    /* 0x2 */ u16 keyFrameCount;
    /* 0x4 */ F3DPrimColor* primColors;
    /* 0x8 */ F3DEnvColor* envColors;
    /* 0xC */ u16* keyFrames;
} AnimatedMatColorParams; // size = 0x10

typedef struct {
    /* 0x0 */ s8 xStep;
    /* 0x1 */ s8 yStep;
    /* 0x2 */ u8 width;
    /* 0x3 */ u8 height;
} AnimatedMatTexScrollParams; // size = 0x4

typedef struct {
    /* 0x0 */ u16 keyFrameLength;
    /* 0x4 */ TexturePtr* textureList;
    /* 0x8 */ u8* textureIndexList;
} AnimatedMatTexCycleParams; // size = 0xC

typedef struct {
    /* 0x0 */ s8 segment;
    /* 0x2 */ AnimatedMatType type;
    /* 0x4 */ void* params;
} AnimatedMaterial; // size = 0x8

struct PlayState;

Gfx* AnimatedMat_TexScroll(struct PlayState* play, AnimatedMatTexScrollParams* params);
void AnimatedMat_DrawTexScroll(struct PlayState* play, s32 segment, void* params);
Gfx* AnimatedMat_TwoLayerTexScroll(struct PlayState* play, AnimatedMatTexScrollParams* params);
void AnimatedMat_DrawTwoTexScroll(struct PlayState* play, s32 segment, void* params);
void AnimatedMat_SetColor(struct PlayState* play, s32 segment, F3DPrimColor* primColorResult, F3DEnvColor* envColor);
void AnimatedMat_DrawColor(struct PlayState* play, s32 segment, void* params);
s32 AnimatedMat_Lerp(s32 min, s32 max, f32 norm);
void AnimatedMat_DrawColorLerp(struct PlayState* play, s32 segment, void* params);
void AnimatedMat_DrawColorNonLinearInterp(struct PlayState* play, s32 segment, void* params);
void AnimatedMat_DrawTexCycle(struct PlayState* play, s32 segment, void* params);
void AnimatedMat_DrawMain(struct PlayState* play, AnimatedMaterial* matAnim, f32 alphaRatio, u32 step, u32 flags);
void AnimatedMat_Draw(struct PlayState* play, AnimatedMaterial* matAnim);
void AnimatedMat_DrawOpa(struct PlayState* play, AnimatedMaterial* matAnim);
void AnimatedMat_DrawXlu(struct PlayState* play, AnimatedMaterial* matAnim);
void AnimatedMat_DrawAlpha(struct PlayState* play, AnimatedMaterial* matAnim, f32 alphaRatio);
void AnimatedMat_DrawAlphaOpa(struct PlayState* play, AnimatedMaterial* matAnim, f32 alphaRatio);
void AnimatedMat_DrawAlphaXlu(struct PlayState* play, AnimatedMaterial* matAnim, f32 alphaRatio);
void AnimatedMat_DrawStep(struct PlayState* play, AnimatedMaterial* matAnim, u32 step);
void AnimatedMat_DrawStepOpa(struct PlayState* play, AnimatedMaterial* matAnim, u32 step);
void AnimatedMat_DrawStepXlu(struct PlayState* play, AnimatedMaterial* matAnim, u32 step);
void AnimatedMat_DrawAlphaStep(struct PlayState* play, AnimatedMaterial* matAnim, f32 alphaRatio, u32 step);
void AnimatedMat_DrawAlphaStepOpa(struct PlayState* play, AnimatedMaterial* matAnim, f32 alphaRatio, u32 step);
void AnimatedMat_DrawAlphaStepXlu(struct PlayState* play, AnimatedMaterial* matAnim, f32 alphaRatio, u32 step);

#endif

#endif
