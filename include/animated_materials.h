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

// event system (flag, player state, ...)

typedef enum MaterialEventCondition {
    MAT_EVENT_COND_EQUAL,      // a == b
    MAT_EVENT_COND_DIFF,       // a != b
    MAT_EVENT_COND_LESS,       // a < b
    MAT_EVENT_COND_SUPERIOR,   // a > b
    MAT_EVENT_COND_LESS_T,     // a <= b
    MAT_EVENT_COND_SUPERIOR_T, // a >= b
} MaterialEventCondition;

typedef enum MaterialEventFlagType {
    MAT_EVENT_FLAG_TYPE_SWITCH_FLAG,
    MAT_EVENT_FLAG_TYPE_EVENTCHKINF_FLAG,
    MAT_EVENT_FLAG_TYPE_INF_FLAG,
    MAT_EVENT_FLAG_TYPE_COLLECTIBLE_FLAG,
    MAT_EVENT_FLAG_TYPE_TREASURE_FLAG,
    MAT_EVENT_FLAG_TYPE_TEMPCLEAR_FLAG,
    MAT_EVENT_FLAG_TYPE_CLEAR_FLAG,
    MAT_EVENT_FLAG_TYPE_MAX,
} MaterialEventFlagType;

typedef union MaterialEventFlag {
    struct {
        u32 type; // see MaterialEventFlagType
        u32 flag;
    };
    s32 _words[2];
} MaterialEventFlag; // size = 0x20

typedef enum MaterialEventGameType {
    MAT_EVENT_GAME_TYPE_AGE,
    MAT_EVENT_GAME_TYPE_HEALTH,
    MAT_EVENT_GAME_TYPE_RUPEES,
    MAT_EVENT_GAME_TYPE_INVENTORY,
    MAT_EVENT_GAME_TYPE_MAX,
} MaterialEventGameType;

typedef union MaterialEventGame {
    struct {
        u8 type;     // see MaterialEventGameType
        u8 condType; // see MaterialEventCondition
        union {
            s8 age;
            s16 health;
            s16 rupees;
        };
    };
    s32 _words[2];
} MaterialEventGame; // size = 0x20

typedef enum MaterialEventType {
    MAT_EVENT_TYPE_NONE,
    MAT_EVENT_TYPE_FLAG,
    MAT_EVENT_TYPE_GAME,
    MAT_EVENT_TYPE_MAX,
} MaterialEventType;

typedef enum MaterialEventFreezeType {
    MAT_EVENT_FREEZE_TYPE_NONE,       // no special behavior
    MAT_EVENT_FREEZE_TYPE_EVENT,      // freeze the step value when the events are completed
    MAT_EVENT_FREEZE_TYPE_EVENT_LAST, // same as above but let the animation go to its last keyframe
} MaterialEventFreezeType;

typedef struct MaterialEvent {
    u8 type; // see MaterialEventType
    union {
        MaterialEventFlag flag;
        MaterialEventGame game;
    } event;
} MaterialEvent;

typedef struct AnimatedMatEvent {
    u8 freezeType;            // see MaterialEventFreezeType
    u16 length;               // length of eventList
    MaterialEvent* eventList; // list of events to process, must be the same size as keyframeList
} AnimatedMatEvent;

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

typedef struct AnimatedMaterial {
    /* 0x00 */ s8 segment;
    /* 0x02 */ AnimatedMatType type;
    /* 0x04 */ void* params;
    /* 0x08 */ AnimatedMatEvent* matEvent; // optional
} AnimatedMaterial;

struct GameState;

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

u8 AnimatedMat_ProcessEventConditionU(u8 condType, u32 a, u32 b);
u8 AnimatedMat_ProcessEventConditionS(u8 condType, s32 a, s32 b);
void AnimatedMat_ProcessFlagEvents(struct GameState* gameState, MaterialEventFlag* event, u8* pabFlags);
void AnimatedMat_ProcessGameEvents(struct GameState* gameState, MaterialEventGame* event, u8* pabGame);
u8 AnimatedMat_ProcessEvents(struct GameState* gameState, AnimatedMaterial* matAnim);

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

// useful macros to declare an event entry

#define EVENT_FLAG(type, flag)            \
    {                                     \
        MAT_EVENT_TYPE_FLAG,              \
        { CMD_W((type)), CMD_W((flag)) }, \
    }

#define EVENT_SWITCH_FLAG(flag) EVENT_FLAG(MAT_EVENT_FLAG_TYPE_SWITCH_FLAG, (flag))
#define EVENT_EVENTCHKINF_FLAG(flag) EVENT_FLAG(MAT_EVENT_FLAG_TYPE_EVENTCHKINF_FLAG, (flag))
#define EVENT_INF_FLAG(flag) EVENT_FLAG(MAT_EVENT_FLAG_TYPE_INF_FLAG, (flag))
#define EVENT_COLLECTIBLE_FLAG(flag) EVENT_FLAG(MAT_EVENT_FLAG_TYPE_COLLECTIBLE_FLAG, (flag))
#define EVENT_TREASURE_FLAG(flag) EVENT_FLAG(MAT_EVENT_FLAG_TYPE_TREASURE_FLAG, (flag))
#define EVENT_TEMPCLEAR_FLAG(flag) EVENT_FLAG(MAT_EVENT_FLAG_TYPE_TEMPCLEAR_FLAG, (flag))
#define EVENT_CLEAR_FLAG(flag) EVENT_FLAG(MAT_EVENT_FLAG_TYPE_CLEAR_FLAG, (flag))

#define EVENT_GAME_AGE(condType, age)                                          \
    {                                                                          \
        MAT_EVENT_TYPE_GAME,                                                   \
        { CMD_BBBB(MAT_EVENT_GAME_TYPE_AGE, (condType), (age), 0), CMD_W(0) }, \
    }

#define EVENT_GAME_HEALTH(condType, amount)                                      \
    {                                                                            \
        MAT_EVENT_TYPE_GAME,                                                     \
        { CMD_BBH(MAT_EVENT_GAME_TYPE_HEALTH, (condType), (amount)), CMD_W(0) }, \
    }

#define EVENT_GAME_RUPEES(condType, amount)                                      \
    {                                                                            \
        MAT_EVENT_TYPE_GAME,                                                     \
        { CMD_BBH(MAT_EVENT_GAME_TYPE_RUPEES, (condType), (amount)), CMD_W(0) }, \
    }

#endif

#endif
