#ifndef ANIMATED_MATERIALS_H
#define ANIMATED_MATERIALS_H

#include "ultra64.h"
#include "config.h"
#include "command_macros_base.h"

#if ENABLE_ANIMATED_MATERIALS

#define MATERIAL_SEGMENT_NUM(n) (n)
#define LAST_MATERIAL_SEGMENT_NUM(n) -MATERIAL_SEGMENT_NUM(n)

typedef enum AnimatedMatType {
    // vanilla types
    /* 0 */ ANIM_MAT_TYPE_TEX_SCROLL,
    /* 1 */ ANIM_MAT_TYPE_TWO_TEX_SCROLL,
    /* 2 */ ANIM_MAT_TYPE_COLOR,
    /* 3 */ ANIM_MAT_TYPE_COLOR_LERP,
    /* 4 */ ANIM_MAT_TYPE_COLOR_NON_LINEAR_INTERP,
    /* 5 */ ANIM_MAT_TYPE_TEX_CYCLE,
    /* 6 */ ANIM_MAT_TYPE_NONE,

    // custom types
    /*  */ ANIM_MAT_TYPE_COLOR_CYCLE, // like ANIM_MAT_TYPE_COLOR except it takes a keyframe array to set draw durations
    /*  */ ANIM_MAT_TYPE_TEX_TIMED_CYCLE,
    /*  */ ANIM_MAT_TYPE_MAX
} AnimatedMatType;

typedef struct {
    /* 0x00 */ u8 r;
    /* 0x01 */ u8 g;
    /* 0x02 */ u8 b;
    /* 0x03 */ u8 a;
    /* 0x04 */ u8 lodFrac;
} F3DPrimColor; // size = 0x05

typedef struct {
    /* 0x00 */ u8 r;
    /* 0x01 */ u8 g;
    /* 0x02 */ u8 b;
    /* 0x03 */ u8 a;
} F3DEnvColor; // size = 0x04

typedef struct {
    /* 0x00 */ u16 keyFrameLength;
    /* 0x02 */ u16 keyFrameCount;
    /* 0x04 */ F3DPrimColor* primColors;
    /* 0x08 */ F3DEnvColor* envColors;
    /* 0x0C */ u16* keyFrames;
} AnimatedMatColorParams; // size = 0x10

typedef struct {
    /* 0x00 */ s8 xStep;
    /* 0x01 */ s8 yStep;
    /* 0x02 */ u8 width;
    /* 0x03 */ u8 height;
} AnimatedMatTexScrollParams; // size = 0x04

typedef struct {
    /* 0x00 */ u16 keyFrameLength;
    /* 0x04 */ TexturePtr* textureList;
    /* 0x08 */ u8* textureIndexList;
} AnimatedMatTexCycleParams; // size = 0x0C

typedef struct AnimatedMatTexTimedCycleKeyframe {
    TexturePtr texture; // texture to draw
    u16 displayTime;    // how long it lasts before going on the next one
} AnimatedMatTexTimedCycleKeyframe;

typedef struct AnimatedMatTexTimedCycleParams {
    u16 keyframeLength;                             // how many keyframes
    AnimatedMatTexTimedCycleKeyframe* keyframeList; // array of keyframes
} AnimatedMatTexTimedCycleParams;

struct GameState;
struct EventScriptEntry;

typedef struct AnimatedMaterial {
    /* 0x00 */ s8 segment;
    /* 0x02 */ AnimatedMatType type;
    /* 0x04 */ void* params;
    /* 0x08 */ struct EventScriptEntry* eventEntry; // optional
    /* 0x0C */ TexturePtr defaultTex; // optional, default texture to use (used if the event manager returns false)
} AnimatedMaterial;

Gfx* AnimatedMat_TexScroll(struct GameState* gameState, AnimatedMatTexScrollParams* params);
void AnimatedMat_DrawTexScroll(struct GameState* gameState, s32 segment, void* params);
Gfx* AnimatedMat_TwoLayerTexScroll(struct GameState* gameState, AnimatedMatTexScrollParams* params);
void AnimatedMat_DrawTwoTexScroll(struct GameState* gameState, s32 segment, void* params);
void AnimatedMat_SetColor(struct GameState* gameState, s32 segment, F3DPrimColor* primColorResult,
                          F3DEnvColor* envColor);
void AnimatedMat_DrawColor(struct GameState* gameState, s32 segment, void* params);
s32 AnimatedMat_Lerp(s32 min, s32 max, f32 norm);
void AnimatedMat_DrawColorLerp(struct GameState* gameState, s32 segment, void* params);
void AnimatedMat_DrawColorNonLinearInterp(struct GameState* gameState, s32 segment, void* params);
void AnimatedMat_DrawTexCycle(struct GameState* gameState, s32 segment, void* params);
void AnimatedMat_DrawTexTimedCycle(struct GameState* gameState, s32 segment, void* params);
void AnimatedMat_DrawColorCycle(struct GameState* gameState, s32 segment, void* params);
void AnimatedMat_DrawTexTimedCycle(struct GameState* gameState, s32 segment, void* params);

void AnimatedMat_DrawMain(struct GameState* gameState, AnimatedMaterial* matAnim, f32 alphaRatio, u32 step, u32 flags);
void AnimatedMat_Draw(struct GameState* gameState, u32 gameplayFrames, AnimatedMaterial* matAnim);
void AnimatedMat_DrawOpa(struct GameState* gameState, u32 gameplayFrames, AnimatedMaterial* matAnim);
void AnimatedMat_DrawXlu(struct GameState* gameState, u32 gameplayFrames, AnimatedMaterial* matAnim);
void AnimatedMat_DrawAlpha(struct GameState* gameState, u32 gameplayFrames, AnimatedMaterial* matAnim, f32 alphaRatio);
void AnimatedMat_DrawAlphaOpa(struct GameState* gameState, u32 gameplayFrames, AnimatedMaterial* matAnim,
                              f32 alphaRatio);
void AnimatedMat_DrawAlphaXlu(struct GameState* gameState, u32 gameplayFrames, AnimatedMaterial* matAnim,
                              f32 alphaRatio);
void AnimatedMat_DrawStep(struct GameState* gameState, AnimatedMaterial* matAnim, u32 step);
void AnimatedMat_DrawStepOpa(struct GameState* gameState, AnimatedMaterial* matAnim, u32 step);
void AnimatedMat_DrawStepXlu(struct GameState* gameState, AnimatedMaterial* matAnim, u32 step);
void AnimatedMat_DrawAlphaStep(struct GameState* gameState, AnimatedMaterial* matAnim, f32 alphaRatio, u32 step);
void AnimatedMat_DrawAlphaStepOpa(struct GameState* gameState, AnimatedMaterial* matAnim, f32 alphaRatio, u32 step);
void AnimatedMat_DrawAlphaStepXlu(struct GameState* gameState, AnimatedMaterial* matAnim, f32 alphaRatio, u32 step);

#endif

#endif
