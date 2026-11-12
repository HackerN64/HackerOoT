#ifndef LIGHT_H
#define LIGHT_H

#include "ultra64.h"
#include "ultra64/gbi.h"
#include "z_math.h"

struct GraphicsContext;
struct PlayState;

typedef struct LightPoint {
    /* 0x0 */ s16 x;
    /* 0x2 */ s16 y;
    /* 0x4 */ s16 z;
    /* 0x6 */ u8 color[3];
    /* 0x9 */ u8 drawGlow;
    /* 0xA */ s16 glowRadius;
    /* 0x0C */ u8 specularSize;
    /* 0xD */ u8 kc;
    /* 0xE */ u8 kl;
    /* 0xF */ u8 kq;
} LightPoint; // size = 0x10

typedef struct LightDirectional {
    /* 0x0 */ s8 x;
    /* 0x1 */ s8 y;
    /* 0x2 */ s8 z;
    /* 0x3 */ u8 color[3];
    /* 0x6 */ u8 specularSize;
} LightDirectional; // size = 0x7

typedef union LightParams {
    LightPoint point;
    LightDirectional dir;
} LightParams; // size = 0xC

typedef struct LightInfo {
    /* 0x0 */ u8 type;
    /* 0x2 */ LightParams params;
} LightInfo; // size = 0xE

typedef struct Lights {
    Lightsn l;
    union {
        struct {
            u8 flag;
            u8 numLights;
        };
        u16 numLightsEX3;
    };
} Lights;

typedef struct LightNode {
    /* 0x0 */ LightInfo* info;
    /* 0x4 */ struct LightNode* prev;
    /* 0x8 */ struct LightNode* next;
#if DEBUG_FEATURES
    const char* file;
    int line;
#endif
} LightNode; // size = 0xC

#define ENV_FOGNEAR_MAX 996
#define ENV_ZFAR_MAX 12800

typedef struct LightContext {
    /* 0x0 */ LightNode* listHead;
    /* 0x4 */ u8 ambientColor[3];
    /* 0x7 */ u8 fogColor[3];
    /* 0xA */ s16 fogNear; // how close until fog starts taking effect. range 0 - ENV_FOGNEAR_MAX
    /* 0xC */ s16 zFar; // draw distance. range 0 - ENV_ZFAR_MAX
} LightContext; // size = 0x10

typedef enum LightType {
    /* 0x00 */ LIGHT_POINT_NOGLOW,
    /* 0x01 */ LIGHT_DIRECTIONAL,
    /* 0x02 */ LIGHT_POINT_GLOW
} LightType;

typedef void (*LightsBindFunc)(Lights* lights, LightParams* params, f32* distances, Vec3f* objPos);

// Helper for defining functions that have extra file/line args in debug vs non-debug
#if DEBUG_FEATURES
#define LIGHTS_DEBUG_ARGS(file, line) , file, line
#else
#define LIGHTS_DEBUG_ARGS(file, line)
#endif

//  Light Info
void Lights_PointSetInfo(LightInfo* info, s16 x, s16 y, s16 z, u8 r, u8 g, u8 b, s16 radius, s32 type);
void Lights_PointNoGlowSetInfo(LightInfo* info, s16 x, s16 y, s16 z, u8 r, u8 g, u8 b, s16 radius);
void Lights_PointGlowSetInfo(LightInfo* info, s16 x, s16 y, s16 z, u8 r, u8 g, u8 b, s16 radius);
void Lights_PointSetColorAndRadius(LightInfo* info, u8 r, u8 g, u8 b, s16 radius);
void Lights_PointSetPosition(LightInfo* info, s16 x, s16 y, s16 z);
void Lights_PointSetAttenuation(LightInfo* info, u8 kc, u8 kl, u8 kq);
void Lights_PointSetSpecularSize(LightInfo* info, u8 size);
void Lights_DirectionalSetInfo(LightInfo* info, s8 x, s8 y, s8 z, u8 r, u8 g, u8 b);
void Lights_DirectionalSetSpecularSize(LightInfo* info, u8 size);

//  Light Context
void LightContext_Init(struct PlayState* play, LightContext* lightCtx);
void LightContext_DestroyList(struct PlayState* play, LightContext* lightCtx);

//  Light List
LightNode* LightContext_InsertLight(struct PlayState* play, LightContext* lightCtx, LightInfo* info LIGHTS_DEBUG_ARGS(const char* file, int line));
#if DEBUG_FEATURES
#define LightContext_InsertLight(play, lightCtx, info) LightContext_InsertLight(play, lightCtx, info, __FILE__, __LINE__)
#endif
void LightContext_RemoveLight(struct PlayState* play, LightContext* lightCtx, LightNode* light);
LightNode* LightContext_InsertLightList(struct PlayState* play, LightContext* lightCtx, LightInfo* lightList, u32* numLights LIGHTS_DEBUG_ARGS(const char* file, int line));
#if DEBUG_FEATURES
#define LightContext_InsertLightList(play, lightCtx, lightList, numLights) LightContext_InsertLightList(play, lightCtx, lightList, numLights, __FILE__, __LINE__)
#endif
void LightContext_RemoveLightList(struct PlayState* play, LightContext* lightCtx, LightNode* firstLight, u32 numLights);

//  Light Drawing
void Lights_ResetDrawState(void);
Lights* Lights_BindAndDraw(struct PlayState* play, Vec3f* objPos, s32 realPointLights);
void Lights_Pop(struct PlayState* play);

// Lights Utilities
void Lights_GetDirection(Light* light, Vec3f* objPos, s8* lightDir);

//  Glow Effects
void Lights_GlowCheck(struct PlayState* play);
void Lights_DrawGlow(struct PlayState* play);

#endif
