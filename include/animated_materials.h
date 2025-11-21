#ifndef ANIMATED_MATERIALS_H
#define ANIMATED_MATERIALS_H

#include "ultra64.h"
#include "config.h"
#include "command_macros_base.h"
#include "color.h"
#include "bgcheck.h"

#if ENABLE_ANIMATED_MATERIALS

/*
 * 0000 0000 0000 1111: type (see AnimatedMatCameraType)
 * 0000 0000 0001 0000: execute on event
 */
#define MATERIAL_CAM_TYPE(params) ((params) & 0x0F)
#define MATERIAL_CAM_ON_EVENT(params) (((params) >> 4) & 1)
#define MATERIAL_CAM_PARAMS(type, onEvent) ((((onEvent) & 1) << 4) | ((type) & 0x0F))

#define MATERIAL_SEGMENT_NUM(n) (n)
#define LAST_MATERIAL_SEGMENT_NUM(n) -MATERIAL_SEGMENT_NUM(n)

typedef enum AnimatedMatType {
    // vanilla types
    /*  0 */ ANIM_MAT_TYPE_TEX_SCROLL,
    /*  1 */ ANIM_MAT_TYPE_TWO_TEX_SCROLL,
    /*  2 */ ANIM_MAT_TYPE_COLOR,
    /*  3 */ ANIM_MAT_TYPE_COLOR_LERP,
    /*  4 */ ANIM_MAT_TYPE_COLOR_NON_LINEAR_INTERP,
    /*  5 */ ANIM_MAT_TYPE_TEX_CYCLE,
    /*  6 */ ANIM_MAT_TYPE_NONE,
    /*  7 */ ANIM_MAT_TYPE_COLOR_CYCLE, // like TYPE_COLOR except it takes a keyframe array to set draw durations
    /*  8 */ ANIM_MAT_TYPE_TEX_TIMED_CYCLE,
    /*  9 */ ANIM_MAT_TYPE_TEXTURE,
    /* 10 */ ANIM_MAT_TYPE_MULTITEXTURE,
    /* 11 */ ANIM_MAT_TYPE_EVENT,
    /* 12 */ ANIM_MAT_TYPE_SURFACE_SWAP,
    /* 13 */ ANIM_MAT_TYPE_OSCILLATING_TWO_TEX,
    /*  */ ANIM_MAT_TYPE_MAX
} AnimatedMatType;

typedef enum AnimatedMatCameraType {
    ANIM_MAT_CAMERA_TYPE_NONE,
    ANIM_MAT_CAMERA_TYPE_SHAKE,      // collapse-like screen
    ANIM_MAT_CAMERA_TYPE_DISTORTION, // jabu-like screen
    ANIM_MAT_CAMERA_TYPE_MAX,
} AnimatedMatCameraType;

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

typedef struct AnimatedMatTextureParams {
    TexturePtr textures[2];
} AnimatedMatTextureParams;

typedef struct AnimatedMatMultiTextureParams {
    s16 minPrimAlpha;    // minimum opacity of both textures
    s16 maxPrimAlpha;    // maximum opacity of both textures
    s16 minEnvAlpha;     // minimum opacity of texture2
    s16 maxEnvAlpha;     // maximum opacity of texture2
    s8 speed;            // transition/blending speed
    TexturePtr texture1; // optional, texture reference (can be NULL)
    TexturePtr texture2; // optional, texture reference (can be NULL)
    s8 segment1;         // optional, segment number of the texture reference for texture1
    s8 segment2;         // optional, segment number of the texture reference for texture2
} AnimatedMatMultiTextureParams;

// note: the new settings will apply to all tris from the list!
typedef struct AnimatedMatSurfaceSwapParams {
    AnimatedMatMultiTextureParams* textureParams; // required for a texture blend transition
    u16 type;                                     // surface type index to change
    SurfaceType surface;                          // the new surface settings
    u16 flags_vIA;                                // new poly flags to apply
    u16 flags_vIB;                                // new poly flags to apply
    u16 triIndices[];                             // index list of the triangles to edit, -1 means the list is over
} AnimatedMatSurfaceSwapParams;

struct GameState;
struct PlayState;
struct EventScriptEntry;

typedef struct AnimatedMaterial {
    /* 0x00 */ s8 segment;
    /* 0x02 */ AnimatedMatType type;
    /* 0x04 */ void* params;
    /* 0x08 */ struct EventScriptEntry* eventEntry; // optional
    /* 0x0C */ u16 camParams;
} AnimatedMaterial;

void AnimatedMat_InitSurfaceSwap(struct GameState* gameState, void* params);
void AnimatedMat_Init(struct GameState* gameState, u8 arrayCount, u8* typesArray);
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
