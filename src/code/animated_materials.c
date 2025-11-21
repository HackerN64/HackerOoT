#include "animated_materials.h"
#include "helpers.h"
#include "config.h"
#include "gfx.h"
#include "segmented_address.h"
#include "event_manager.h"
#include "printf.h"
#include "array_count.h"
#include "attributes.h"
#include "play_state.h"
#include "save.h"
#include "z_lib.h"
#include "sys_matrix.h"

extern Gfx* gPrevTaskWorkBuffer;

#if ENABLE_ANIMATED_MATERIALS

extern void func_8009BEEC(PlayState* play);

static s32 sMatAnimStep = 0;
static s32 sScrollStep = 0;
static s32 sPrevMatAnimStep = 0;
static u32 sMatAnimFlags = 0;
static f32 sMatAnimAlphaRatio = 0.0f;
static u8 sArrayCount = 0;
static u8 sTypesCount[ANIM_MAT_TYPE_MAX];

// we need a way to revert back to the original state
// but since we're editing the scene data directly we need to allocate and populate a backup list
typedef struct CollisionPolyBackup {
    SurfaceType surfaceType;
    u16 flags_vIA;
    u16 flags_vIB;
} CollisionPolyBackup;
static CollisionPolyBackup* sBackupList = NULL;
static s16 sTriCount = 0;

// doing it this way to save space, holds runtime informations for each running type
typedef struct AnimatedMatContext {
    u8 prevAllowDraw;
    u8 actionType;

    union {
        struct {
            s32 step;
        };
        struct {
            s32 curFrame;
            u8 timer;
        };
        struct {
            u8 firstTime;
            s16 primAlpha;
            s16 envAlpha;
        };
        s32 _words[2];
    };
} AnimatedMatContext;

static AnimatedMatContext* sCtxList = NULL;

void AnimatedMat_Init(GameState* gameState, u8 arrayCount, u8* typesArray) {
    sCtxList = NULL;
    sArrayCount = arrayCount;
    memcpy(sTypesCount, typesArray, sizeof(sTypesCount));
    sCtxList = GAME_STATE_ALLOC(gameState, sizeof(AnimatedMatContext) * sArrayCount);
    ASSERT(sCtxList != NULL, "sCtxList is NULL :(", __FILE__, __LINE__);
    memset(sCtxList, 0, sizeof(AnimatedMatContext) * sArrayCount);
}

void AnimatedMat_SetSegment(GameState* gameState, u8 segment, void* data) {
    OPEN_DISPS(gameState->gfxCtx);

    if (sMatAnimFlags & 1) {
        gSPSegment(POLY_OPA_DISP++, segment, data);
    }

    if (sMatAnimFlags & 2) {
        gSPSegment(POLY_XLU_DISP++, segment, data);
    }

    CLOSE_DISPS(gameState->gfxCtx);
}

void AnimatedMat_SetDisplayList(GameState* gameState, Gfx** ppDisplayList, u8 segment, void* data) {
    OPEN_DISPS(gameState->gfxCtx);

    gSPDisplayList((*ppDisplayList)++, data);

    CLOSE_DISPS(gameState->gfxCtx);
}

void AnimatedMat_SetDefaultDL(GameState* gameState, Gfx** ppDisplayList, u8 envAlpha) {
    OPEN_DISPS(gameState->gfxCtx);

    gSPDisplayList((*ppDisplayList)++, gEmptyDL);
    gDPPipeSync((*ppDisplayList)++);
    gDPSetPrimColor((*ppDisplayList)++, 0, 0, 255, 255, 255, 255);
    gDPSetEnvColor((*ppDisplayList)++, 128, 128, 128, envAlpha);

    CLOSE_DISPS(gameState->gfxCtx);
}

void AnimatedMat_UpdateStep(AnimatedMatContext* curCtx) {
    if (curCtx->step == sPrevMatAnimStep) {
        curCtx->step = sMatAnimStep;
    } else if (curCtx->step != sMatAnimStep) {
        curCtx->step++;
    }
}

// returning false means the caller will return early
u8 AnimatedMat_ProcessFreeze(AnimatedMatContext* curCtx, u8 allowDraw) {
    if (curCtx->actionType == EVENT_ACTION_TYPE_INVERTED || curCtx->actionType == EVENT_ACTION_TYPE_INVERTED_KEEP) {
        if (curCtx->actionType == EVENT_ACTION_TYPE_INVERTED && allowDraw) {
            return false;
        }

        if (!allowDraw) {
            AnimatedMat_UpdateStep(curCtx);
        }
    } else {
        if (!allowDraw) {
            return false;
        }

        AnimatedMat_UpdateStep(curCtx);
    }

    return true;
}

/**
 * Returns a pointer to a single layer texture scroll displaylist.
 */
Gfx* AnimatedMat_TexScroll(GameState* gameState, AnimatedMatTexScrollParams* params, s32 step) {
    return Gfx_TexScroll(gameState->gfxCtx, params->xStep * step, -(params->yStep * step), params->width,
                         params->height);
}

/**
 * Animated Material Type 0:
 * Scrolls a single layer texture using the provided `AnimatedMatTexScrollParams`.
 */
void AnimatedMat_DrawTexScroll(GameState* gameState, AnimatedMatContext* curCtx, Gfx** ppDisplayList, s32 segment,
                               void* params, u8 allowDraw) {
    AnimatedMatTexScrollParams* texScrollParams = (AnimatedMatTexScrollParams*)params;

    if (!AnimatedMat_ProcessFreeze(curCtx, allowDraw)) {
        return;
    }

    AnimatedMat_SetDisplayList(gameState, ppDisplayList, segment,
                               AnimatedMat_TexScroll(gameState, texScrollParams, curCtx->step));
}

/**
 * Returns a pointer to a two layer texture scroll displaylist.
 */
Gfx* AnimatedMat_TwoLayerTexScroll(GameState* gameState, AnimatedMatTexScrollParams* params, s32 step, u8 oscillating) {
    if (oscillating) {
        return Gfx_TwoTexScroll(gameState->gfxCtx, 0, 1023 - ((params[0].xStep * step) % 1024),
                                -(params[0].yStep * step), params[0].width, params[0].height, 1, params[1].xStep * step,
                                (u32)(32 * (1.0f * Math_SinS((-(params[1].yStep * step) * 500)))), params[1].width,
                                params[1].height);
    }

    return Gfx_TwoTexScroll(gameState->gfxCtx, 0, params[0].xStep * step, -(params[0].yStep * step), params[0].width,
                            params[0].height, 1, params[1].xStep * step, -(params[1].yStep * step), params[1].width,
                            params[1].height);
}

/**
 * Animated Material Type 1:
 * Scrolls a two layer texture using the provided `AnimatedMatTexScrollParams`.
 */
void AnimatedMat_DrawTwoTexScroll(GameState* gameState, AnimatedMatContext* curCtx, Gfx** ppDisplayList, s32 segment,
                                  void* params, u8 allowDraw, u8 oscillating) {
    AnimatedMatTexScrollParams* texScrollParams = (AnimatedMatTexScrollParams*)params;

    if (!AnimatedMat_ProcessFreeze(curCtx, allowDraw)) {
        return;
    }

    AnimatedMat_SetDisplayList(gameState, ppDisplayList, segment,
                               AnimatedMat_TwoLayerTexScroll(gameState, texScrollParams, curCtx->step, oscillating));
}

/**
 * Generates a displaylist that sets the prim and env color, and stores it in the provided segment ID.
 */
void AnimatedMat_SetColor(GameState* gameState, Gfx** ppDisplayList, s32 segment, F3DPrimColor* primColorResult,
                          F3DEnvColor* envColor) {
    Gfx* gfx = GRAPH_ALLOC(gameState->gfxCtx, 3 * sizeof(Gfx));

    AnimatedMat_SetDisplayList(gameState, ppDisplayList, segment, gfx);

    OPEN_DISPS(gameState->gfxCtx);

    gDPSetPrimColor(gfx++, 0, primColorResult->lodFrac, primColorResult->r, primColorResult->g, primColorResult->b,
                    (u8)(primColorResult->a * sMatAnimAlphaRatio));

    if (envColor != NULL) {
        gDPSetEnvColor(gfx++, envColor->r, envColor->g, envColor->b, envColor->a);
    }

    gSPEndDisplayList(gfx++);

    CLOSE_DISPS(gameState->gfxCtx);
}

/**
 * Animated Material Type 2:
 * Color key frame animation without linear interpolation.
 */
void AnimatedMat_DrawColor(GameState* gameState, AnimatedMatContext* curCtx, Gfx** ppDisplayList, s32 segment,
                           void* params, u8 allowDraw) {
    AnimatedMatColorParams* colorAnimParams = (AnimatedMatColorParams*)params;
    F3DPrimColor* primColor = SEGMENTED_TO_VIRTUAL(colorAnimParams->primColors);
    F3DEnvColor* envColor;
    s32 curFrame;

    if (!AnimatedMat_ProcessFreeze(curCtx, allowDraw)) {
        return;
    }

    curFrame = curCtx->step % colorAnimParams->keyFrameLength;

    primColor += curFrame;
    envColor = (colorAnimParams->envColors != NULL)
                   ? (F3DEnvColor*)SEGMENTED_TO_VIRTUAL(colorAnimParams->envColors) + curFrame
                   : NULL;

    AnimatedMat_SetColor(gameState, ppDisplayList, segment, primColor, envColor);
}

/**
 * Linear Interpolation
 */
s32 AnimatedMat_Lerp(s32 min, s32 max, f32 norm) {
    return (s32)((max - min) * norm) + min;
}

/**
 * Animated Material Type 3:
 * Color key frame animation with linear interpolation.
 */
void AnimatedMat_DrawColorLerp(GameState* gameState, AnimatedMatContext* curCtx, Gfx** ppDisplayList, s32 segment,
                               void* params, u8 allowDraw) {
    AnimatedMatColorParams* colorAnimParams = (AnimatedMatColorParams*)params;
    F3DPrimColor* primColorMax = SEGMENTED_TO_VIRTUAL(colorAnimParams->primColors);
    F3DEnvColor* envColorMax;
    u16* keyFrames = SEGMENTED_TO_VIRTUAL(colorAnimParams->keyFrames);
    s32 curFrame;
    s32 endFrame;
    s32 relativeFrame; // relative to the start frame
    s32 startFrame;
    f32 norm;
    F3DPrimColor* primColorMin;
    F3DPrimColor primColorResult;
    F3DEnvColor* envColorMin;
    F3DEnvColor envColorResult;
    s32 i;

    if (!AnimatedMat_ProcessFreeze(curCtx, allowDraw)) {
        return;
    }

    curFrame = curCtx->step % colorAnimParams->keyFrameLength;

    keyFrames++;
    i = 1;

    while (colorAnimParams->keyFrameCount > i) {
        if (curFrame < *keyFrames) {
            break;
        }
        i++;
        keyFrames++;
    }

    startFrame = keyFrames[-1];
    endFrame = keyFrames[0] - startFrame;
    relativeFrame = curFrame - startFrame;
    norm = (f32)relativeFrame / (f32)endFrame;

    primColorMax += i;
    primColorMin = primColorMax - 1;
    primColorResult.r = AnimatedMat_Lerp(primColorMin->r, primColorMax->r, norm);
    primColorResult.g = AnimatedMat_Lerp(primColorMin->g, primColorMax->g, norm);
    primColorResult.b = AnimatedMat_Lerp(primColorMin->b, primColorMax->b, norm);
    primColorResult.a = AnimatedMat_Lerp(primColorMin->a, primColorMax->a, norm);
    primColorResult.lodFrac = AnimatedMat_Lerp(primColorMin->lodFrac, primColorMax->lodFrac, norm);

    if (colorAnimParams->envColors) {
        envColorMax = SEGMENTED_TO_VIRTUAL(colorAnimParams->envColors);
        envColorMax += i;
        envColorMin = envColorMax - 1;
        envColorResult.r = AnimatedMat_Lerp(envColorMin->r, envColorMax->r, norm);
        envColorResult.g = AnimatedMat_Lerp(envColorMin->g, envColorMax->g, norm);
        envColorResult.b = AnimatedMat_Lerp(envColorMin->b, envColorMax->b, norm);
        envColorResult.a = AnimatedMat_Lerp(envColorMin->a, envColorMax->a, norm);
    } else {
        envColorMax = NULL;
    }

    AnimatedMat_SetColor(gameState, ppDisplayList, segment, &primColorResult,
                         (envColorMax != NULL) ? &envColorResult : NULL);
}

/**
 * Animated Material Type 4:
 * Color key frame animation with non-linear interpolation.
 */
void AnimatedMat_DrawColorNonLinearInterp(GameState* gameState, AnimatedMatContext* curCtx, Gfx** ppDisplayList,
                                          s32 segment, void* params, u8 allowDraw) {
    AnimatedMatColorParams* colorAnimParams = (AnimatedMatColorParams*)params;
    F3DPrimColor* primColorCur = SEGMENTED_TO_VIRTUAL(colorAnimParams->primColors);
    F3DEnvColor* envColorCur = SEGMENTED_TO_VIRTUAL(colorAnimParams->envColors);
    u16* keyFrames = SEGMENTED_TO_VIRTUAL(colorAnimParams->keyFrames);
    f32 curFrame = 0.0f;
    F3DPrimColor primColorResult;
    F3DEnvColor envColorResult;
    f32 x[50];
    f32 fxPrimR[50];
    f32 fxPrimG[50];
    f32 fxPrimB[50];
    f32 fxPrimA[50];
    f32 fxPrimLodFrac[50];
    f32 fxEnvR[50];
    f32 fxEnvG[50];
    f32 fxEnvB[50];
    f32 fxEnvA[50];
    f32* xPtr = x;
    f32* fxPrimRPtr = fxPrimR;
    f32* fxPrimGPtr = fxPrimG;
    f32* fxPrimBPtr = fxPrimB;
    f32* fxPrimAPtr = fxPrimA;
    f32* fxPrimLodFracPtr = fxPrimLodFrac;
    f32* fxEnvRPtr = fxEnvR;
    f32* fxEnvGPtr = fxEnvG;
    f32* fxEnvBPtr = fxEnvB;
    f32* fxEnvAPtr = fxEnvA;
    s32 i;

    if (!AnimatedMat_ProcessFreeze(curCtx, allowDraw)) {
        return;
    }

    curFrame = curCtx->step % colorAnimParams->keyFrameLength;

    for (i = 0; i < colorAnimParams->keyFrameCount; i++) {
        *xPtr = *keyFrames;
        *fxPrimRPtr = primColorCur->r;
        *fxPrimGPtr = primColorCur->g;
        *fxPrimBPtr = primColorCur->b;
        *fxPrimAPtr = primColorCur->a;
        *fxPrimLodFracPtr = primColorCur->lodFrac;

        primColorCur++;
        fxPrimRPtr++;
        fxPrimGPtr++;
        fxPrimBPtr++;
        fxPrimAPtr++;
        fxPrimLodFracPtr++;

        if (envColorCur != NULL) {
            *fxEnvRPtr = envColorCur->r;
            *fxEnvGPtr = envColorCur->g;
            *fxEnvBPtr = envColorCur->b;
            *fxEnvAPtr = envColorCur->a;

            envColorCur++;
            fxEnvRPtr++;
            fxEnvGPtr++;
            fxEnvBPtr++;
            fxEnvAPtr++;
        }

        keyFrames++;
        xPtr++;
    }

    primColorResult.r = Helpers_LagrangeInterpColor(colorAnimParams->keyFrameCount, x, fxPrimR, curFrame);
    primColorResult.g = Helpers_LagrangeInterpColor(colorAnimParams->keyFrameCount, x, fxPrimG, curFrame);
    primColorResult.b = Helpers_LagrangeInterpColor(colorAnimParams->keyFrameCount, x, fxPrimB, curFrame);
    primColorResult.a = Helpers_LagrangeInterpColor(colorAnimParams->keyFrameCount, x, fxPrimA, curFrame);
    primColorResult.lodFrac = Helpers_LagrangeInterpColor(colorAnimParams->keyFrameCount, x, fxPrimLodFrac, curFrame);

    if (colorAnimParams->envColors != NULL) {
        envColorCur = SEGMENTED_TO_VIRTUAL(colorAnimParams->envColors);
        envColorResult.r = Helpers_LagrangeInterpColor(colorAnimParams->keyFrameCount, x, fxEnvR, curFrame);
        envColorResult.g = Helpers_LagrangeInterpColor(colorAnimParams->keyFrameCount, x, fxEnvG, curFrame);
        envColorResult.b = Helpers_LagrangeInterpColor(colorAnimParams->keyFrameCount, x, fxEnvB, curFrame);
        envColorResult.a = Helpers_LagrangeInterpColor(colorAnimParams->keyFrameCount, x, fxEnvA, curFrame);
    } else {
        envColorCur = NULL;
    }

    AnimatedMat_SetColor(gameState, ppDisplayList, segment, &primColorResult,
                         (envColorCur != NULL) ? &envColorResult : NULL);
}

/**
 * Animated Material Type 5:
 * Cycles between a list of textures (imagine like a GIF)
 */
void AnimatedMat_DrawTexCycle(GameState* gameState, AnimatedMatContext* curCtx, s32 segment, void* params,
                              u8 allowDraw) {
    AnimatedMatTexCycleParams* texAnimParams = params;
    TexturePtr* texList = SEGMENTED_TO_VIRTUAL(texAnimParams->textureList);
    u8* texId = SEGMENTED_TO_VIRTUAL(texAnimParams->textureIndexList);
    TexturePtr tex = SEGMENTED_TO_VIRTUAL(texList[texId[curCtx->curFrame]]);

    if (!allowDraw) {
        AnimatedMat_SetSegment(gameState, segment, tex);
        return;
    }

    curCtx->curFrame = sMatAnimStep % texAnimParams->keyFrameLength;
    AnimatedMat_SetSegment(gameState, segment, tex);
}

void AnimatedMat_DrawColorCycle(GameState* gameState, AnimatedMatContext* curCtx, Gfx** ppDisplayList, s32 segment,
                                void* params, u8 allowDraw) {
    AnimatedMatColorParams* colorAnimParams = (AnimatedMatColorParams*)params;
    F3DPrimColor* primColors = SEGMENTED_TO_VIRTUAL(colorAnimParams->primColors);
    F3DEnvColor* envColor = NULL;
    u16* keyFrames = SEGMENTED_TO_VIRTUAL(colorAnimParams->keyFrames);

    if (!allowDraw) {
        AnimatedMat_SetDefaultDL(gameState, ppDisplayList, 128);
        return;
    }

    // reset values if we reach the end
    if (curCtx->curFrame >= colorAnimParams->keyFrameLength) {
        curCtx->curFrame = 0;
        curCtx->timer = 0;
    }

    // draw the color
    if (colorAnimParams->envColors != NULL) {
        envColor = SEGMENTED_TO_VIRTUAL(colorAnimParams->envColors) + curCtx->curFrame;
    }

    AnimatedMat_SetColor(gameState, ppDisplayList, segment, &primColors[curCtx->curFrame], envColor);

    // finally, increase the timer until we reach the target then go to the next keyframe and reset the timer
    if (curCtx->timer < keyFrames[curCtx->curFrame]) {
        curCtx->timer++;
    } else {
        curCtx->curFrame++;
        curCtx->timer = 0;
    }
}

void AnimatedMat_DrawTexTimedCycle(GameState* gameState, AnimatedMatContext* curCtx, s32 segment, void* params,
                                   u8 allowDraw) {
    AnimatedMatTexTimedCycleParams* animParams = params;
    AnimatedMatTexTimedCycleKeyframe* keyframeList = SEGMENTED_TO_VIRTUAL(animParams->keyframeList);
    u16 targetTime;
    TexturePtr texture;

    if (curCtx->curFrame >= animParams->keyframeLength) {
        curCtx->curFrame = 0;
        curCtx->timer = 0;
    }

    AnimatedMat_SetSegment(gameState, segment, SEGMENTED_TO_VIRTUAL(keyframeList[curCtx->curFrame].texture));

    if (allowDraw) {
        if (curCtx->timer < keyframeList[curCtx->curFrame].displayTime) {
            curCtx->timer++;
        } else {
            curCtx->curFrame++;
            curCtx->timer = 0;
        }
    }
}

void AnimatedMat_DrawTexture(GameState* gameState, AnimatedMatContext* curCtx, s32 segment, void* params,
                             u8 allowDraw) {
    AnimatedMatTextureParams* animParams = params;
    AnimatedMat_SetSegment(gameState, segment, SEGMENTED_TO_VIRTUAL(animParams->textures[allowDraw == true]));
}

void AnimatedMat_SetMaxAlpha(s16* pAlpha, s16 max, s8 speed) {
    if (max == -1) {
        return;
    }

    if ((*pAlpha + speed) <= max) {
        if (*pAlpha <= max) {
            *pAlpha += speed;
        }
    } else {
        *pAlpha = max;
    }
}

void AnimatedMat_SetMinAlpha(s16* pAlpha, s16 min, s8 speed) {
    if (min == -1) {
        return;
    }

    if ((*pAlpha - speed) > min) {
        if (*pAlpha > min) {
            *pAlpha -= speed;
        }
    } else {
        *pAlpha = min;
    }
}

void AnimatedMat_DrawMultiTexture(GameState* gameState, AnimatedMatContext* curCtx, s32 segment, void* params,
                                  u8 allowDraw) {
    AnimatedMatMultiTextureParams* animParams = params;
    s16 primAlpha = animParams->maxPrimAlpha;
    s16 envAlpha = animParams->maxEnvAlpha;
    u8 doBlend = animParams->speed > 0;

    if (animParams->texture1 != NULL && animParams->segment1 > 0) {
        AnimatedMat_SetSegment(gameState, animParams->segment1, SEGMENTED_TO_VIRTUAL(animParams->texture1));
    }

    if (animParams->texture2 != NULL && animParams->segment2 > 0) {
        AnimatedMat_SetSegment(gameState, animParams->segment2, SEGMENTED_TO_VIRTUAL(animParams->texture2));
    }

    if (allowDraw) {
        if (curCtx->firstTime) {
            curCtx->firstTime = false;
        }

        if (doBlend) {
            AnimatedMat_SetMinAlpha(&curCtx->primAlpha, animParams->minPrimAlpha, animParams->speed);
            AnimatedMat_SetMaxAlpha(&curCtx->envAlpha, animParams->maxEnvAlpha, animParams->speed);
        } else {
            envAlpha = animParams->maxEnvAlpha;
        }
    } else if (doBlend) {
        if (curCtx->firstTime) {
            curCtx->primAlpha = 255;

            if (animParams->maxPrimAlpha != -1) {
                curCtx->primAlpha = animParams->maxPrimAlpha;
            }
        } else {
            AnimatedMat_SetMaxAlpha(&curCtx->primAlpha, animParams->maxPrimAlpha, animParams->speed);
            AnimatedMat_SetMinAlpha(&curCtx->envAlpha, animParams->minEnvAlpha, animParams->speed);
        }
    } else {
        envAlpha = animParams->minEnvAlpha;
    }

    if (doBlend) {
        primAlpha = 255 - curCtx->primAlpha;
        envAlpha = 255 - curCtx->envAlpha;
    }

    OPEN_DISPS(gameState->gfxCtx);

    if (segment >= 0x08 && segment <= 0x0D) {
        Gfx* displayListHead = GRAPH_ALLOC(gameState->gfxCtx, 8 * sizeof(Gfx));

        gSPSegment(POLY_OPA_DISP++, segment, displayListHead);
        gDPPipeSync(displayListHead++);
        gDPSetPrimColor(displayListHead++, 0, 0, 255, 255, 255, primAlpha);
        gDPSetEnvColor(displayListHead++, 128, 128, 128, envAlpha);
        gSPEndDisplayList(displayListHead++);
    }

    CLOSE_DISPS(gameState->gfxCtx);
}

void AnimatedMat_DrawEvent(GameState* gameState, AnimatedMatContext* curCtx, Gfx** ppDisplayList, s32 segment,
                           UNUSED void* params, u8 allowDraw) {
    Matrix_Push();

    OPEN_DISPS(gameState->gfxCtx);

    if (allowDraw) {
        Matrix_Scale(1.0f, 1.0f, 1.0f, MTXMODE_NEW);
    } else {
        Matrix_Scale(0.0f, 0.0f, 0.0f, MTXMODE_NEW);
    }

    Gfx* displayListHead = GRAPH_ALLOC(gameState->gfxCtx, 3 * sizeof(Gfx));
    gSPSegment((*ppDisplayList)++, segment, displayListHead);
    gDPPipeSync(displayListHead++);
    MATRIX_FINALIZE_AND_LOAD(displayListHead++, gameState->gfxCtx);
    gSPEndDisplayList(displayListHead++);

    CLOSE_DISPS(gameState->gfxCtx);

    Matrix_Pop();
}

void AnimatedMat_InitSurfaceSwap(GameState* gameState, void* params) {
    PlayState* play = (PlayState*)gameState;
    AnimatedMatSurfaceSwapParams* animParams = params;
    SurfaceType* curSurface;

    sBackupList = NULL;
    sTriCount = 0;

    if (animParams->triIndices[0] == (u16)-1) {
        sBackupList = GAME_STATE_ALLOC(gameState, sizeof(CollisionPolyBackup));
        ASSERT(sBackupList != NULL, "sBackupList is NULL...", __FILE__, __LINE__);

        curSurface = &play->colCtx.colHeader->surfaceTypeList[animParams->type];
        sBackupList[0].surfaceType.data[0] = curSurface->data[0];
        sBackupList[0].surfaceType.data[1] = curSurface->data[1];
    } else {
        u16* triList = animParams->triIndices;
        s32 i;

        // figure out how many entries the list contains
        while (*triList != (u16)-1) {
            sTriCount++;
            triList++;
        }

        // allocate the list
        sBackupList = GAME_STATE_ALLOC(gameState, sizeof(CollisionPolyBackup) * sTriCount);
        ASSERT(sBackupList != NULL, "sBackupList is NULL!!!", __FILE__, __LINE__);

        // create the backup
        for (i = 0; i < sTriCount; i++) {
            CollisionPoly* curPoly = &play->colCtx.colHeader->polyList[animParams->triIndices[i]];
            curSurface = &play->colCtx.colHeader->surfaceTypeList[curPoly->type];

            sBackupList[i].surfaceType.data[0] = curSurface->data[0];
            sBackupList[i].surfaceType.data[1] = curSurface->data[1];
            sBackupList[i].flags_vIA = curPoly->flags_vIA;
            sBackupList[i].flags_vIB = curPoly->flags_vIB;
        }
    }

    ASSERT(sBackupList != NULL, "sBackupList is NULL???", __FILE__, __LINE__);
}

void AnimatedMat_SetSurfaceType(GameState* gameState, AnimatedMatSurfaceSwapParams* animParams, s32 index, u16 type,
                                u8 allowDraw) {
    SurfaceType* curSurface = &((PlayState*)gameState)->colCtx.colHeader->surfaceTypeList[type];

    if (allowDraw) {
        curSurface->data[0] = animParams->surface.data[0];
        curSurface->data[1] = animParams->surface.data[1];
    } else {
        curSurface->data[0] = sBackupList[index].surfaceType.data[0];
        curSurface->data[1] = sBackupList[index].surfaceType.data[1];
    }
}

void AnimatedMat_SetCollisionPolyFlags(GameState* gameState, AnimatedMatSurfaceSwapParams* animParams, s32 index,
                                       u8 allowDraw) {
    CollisionPoly* curPoly = &((PlayState*)gameState)->colCtx.colHeader->polyList[animParams->triIndices[index]];

    if (allowDraw) {
        curPoly->flags_vIA = COLPOLY_VTX(COLPOLY_VTX_INDEX(sBackupList[index].flags_vIA), animParams->flags_vIA);
        curPoly->flags_vIB = COLPOLY_VTX(COLPOLY_VTX_INDEX(sBackupList[index].flags_vIB), animParams->flags_vIB);
    } else {
        curPoly->flags_vIA = sBackupList[index].flags_vIA;
        curPoly->flags_vIB = sBackupList[index].flags_vIB;
    }
}

void AnimatedMat_DrawSurfaceSwap(GameState* gameState, AnimatedMatContext* curCtx, s32 segment, void* params,
                                 u8 allowDraw) {
    AnimatedMatSurfaceSwapParams* animParams = params;

    if (gSaveContext.gameMode == GAMEMODE_NORMAL) {
        PlayState* play = (PlayState*)gameState;
        CollisionPoly* curPoly;
        u16* triList = animParams->triIndices;
        s32 i;

        if (curCtx->prevAllowDraw != allowDraw) {
            if (sTriCount == 0) {
                AnimatedMat_SetSurfaceType(gameState, animParams, 0, animParams->type, allowDraw);
            } else {
                for (i = 0; i < sTriCount; i++) {
                    curPoly = &play->colCtx.colHeader->polyList[animParams->triIndices[i]];

                    AnimatedMat_SetSurfaceType(gameState, animParams, i, curPoly->type, allowDraw);
                    AnimatedMat_SetCollisionPolyFlags(gameState, animParams, i, allowDraw);
                }
            }

            curCtx->prevAllowDraw = allowDraw;
        }
    }

    if (animParams->textureParams != NULL) {
        AnimatedMat_DrawMultiTexture(gameState, curCtx, segment, SEGMENTED_TO_VIRTUAL(animParams->textureParams),
                                     allowDraw);
    }
}

void AnimatedMat_ScreenDistortion(PlayState* play) {
    static s16 D_8012A39C = 538;
    static s16 D_8012A3A0 = 4272;
    f32 temp;

    D_8012A39C += 1820;
    D_8012A3A0 += 1820;

    temp = 0.020000001f;
    View_SetDistortionOrientation(&play->view,
                                  ((360.00018f / 65535.0f) * (M_PI / 180.0f)) * temp * Math_CosS(D_8012A39C),
                                  ((360.00018f / 65535.0f) * (M_PI / 180.0f)) * temp * Math_SinS(D_8012A39C),
                                  ((360.00018f / 65535.0f) * (M_PI / 180.0f)) * temp * Math_SinS(D_8012A3A0));
    View_SetDistortionScale(&play->view, 1.f + (0.79999995f * temp * Math_SinS(D_8012A3A0)),
                            1.f + (0.39999998f * temp * Math_CosS(D_8012A3A0)),
                            1.f + (1 * temp * Math_CosS(D_8012A39C)));
    View_SetDistortionSpeed(&play->view, 0.95f);
}

/**
 * This is the main function that handles the animated material system.
 * There are six different animated material types, which should be set in the provided `AnimatedMaterial`.
 */
void AnimatedMat_DrawMain(GameState* gameState, AnimatedMaterial* matAnim, f32 alphaRatio, u32 step, u32 flags) {
    s32 segmentAbs;
    s32 segment;
    Gfx* pDisplayList = NULL;
    Gfx* displayListHead = NULL;
    s32 prevSegment = 0;

    sMatAnimAlphaRatio = alphaRatio;
    sMatAnimStep = step;
    sMatAnimFlags = flags;

    if (matAnim != NULL && matAnim->segment != 0) {
        s32 i = 0;

        do {
            void* params = SEGMENTED_TO_VIRTUAL(matAnim->params);
            u8 allowDraw = true;
            AnimatedMatContext* curCtx = &sCtxList[i];

            OPEN_DISPS(gameState->gfxCtx);

            segment = matAnim->segment;
            segmentAbs = ABS(segment);

            if (prevSegment != segmentAbs) {
                displayListHead = pDisplayList = GRAPH_ALLOC(gameState->gfxCtx, sizeof(Gfx) * 0x20);
                prevSegment = segmentAbs;
            }

            AnimatedMat_SetSegment(gameState, segmentAbs, displayListHead);
            gDPPipeSync(pDisplayList++);

            curCtx->actionType = EVENT_ACTION_TYPE_NONE;
            if (matAnim->eventEntry != NULL) {
                allowDraw = EventManager_ProcessScript(gameState, SEGMENTED_TO_VIRTUAL(matAnim->eventEntry));
                curCtx->actionType = EventManager_GetFreezeType();
            }

            // process camera/screen effects
            if (gSaveContext.gameMode == GAMEMODE_NORMAL) {
                PlayState* play = (PlayState*)gameState;
                u16 camParams = play->sceneMaterialAnimCamParams;
                s16 camType = MATERIAL_CAM_TYPE(camParams);
                u8 onEvent = MATERIAL_CAM_ON_EVENT(camParams);

                if (!onEvent || allowDraw) {
                    if (camType != ANIM_MAT_CAMERA_TYPE_NONE) {

                        switch (camType) {
                            case ANIM_MAT_CAMERA_TYPE_SHAKE:
                                func_8009BEEC(play);
                                break;
                            case ANIM_MAT_CAMERA_TYPE_DISTORTION:
                                AnimatedMat_ScreenDistortion(play);
                                break;
                            default:
                                break;
                        }
                    }
                }
            }

            switch (matAnim->type) {
                case ANIM_MAT_TYPE_TEX_SCROLL:
                    AnimatedMat_DrawTexScroll(gameState, curCtx, &pDisplayList, segmentAbs, params, allowDraw);
                    break;
                case ANIM_MAT_TYPE_TWO_TEX_SCROLL:
                    AnimatedMat_DrawTwoTexScroll(gameState, curCtx, &pDisplayList, segmentAbs, params, allowDraw,
                                                 false);
                    break;
                case ANIM_MAT_TYPE_COLOR:
                    AnimatedMat_DrawColor(gameState, curCtx, &pDisplayList, segmentAbs, params, allowDraw);
                    break;
                case ANIM_MAT_TYPE_COLOR_LERP:
                    AnimatedMat_DrawColorLerp(gameState, curCtx, &pDisplayList, segmentAbs, params, allowDraw);
                    break;
                case ANIM_MAT_TYPE_COLOR_NON_LINEAR_INTERP:
                    AnimatedMat_DrawColorNonLinearInterp(gameState, curCtx, &pDisplayList, segmentAbs, params,
                                                         allowDraw);
                    break;
                case ANIM_MAT_TYPE_COLOR_CYCLE:
                    AnimatedMat_DrawColorCycle(gameState, curCtx, &pDisplayList, segmentAbs, params, allowDraw);
                    break;
                case ANIM_MAT_TYPE_EVENT:
                    AnimatedMat_DrawEvent(gameState, curCtx, &pDisplayList, segmentAbs, NULL, allowDraw);
                    break;
                case ANIM_MAT_TYPE_OSCILLATING_TWO_TEX:
                    AnimatedMat_DrawTwoTexScroll(gameState, curCtx, &pDisplayList, segmentAbs, params, allowDraw, true);
                    break;
                case ANIM_MAT_TYPE_TEX_CYCLE:
                    AnimatedMat_DrawTexCycle(gameState, curCtx, segmentAbs, params, allowDraw);
                    break;
                case ANIM_MAT_TYPE_TEX_TIMED_CYCLE:
                    AnimatedMat_DrawTexTimedCycle(gameState, curCtx, segmentAbs, params, allowDraw);
                    break;
                case ANIM_MAT_TYPE_TEXTURE:
                    AnimatedMat_DrawTexture(gameState, curCtx, segmentAbs, params, allowDraw);
                    break;
                case ANIM_MAT_TYPE_MULTITEXTURE:
                    AnimatedMat_DrawMultiTexture(gameState, curCtx, segmentAbs, params, allowDraw);
                    break;
                case ANIM_MAT_TYPE_SURFACE_SWAP:
                    AnimatedMat_DrawSurfaceSwap(gameState, curCtx, segmentAbs, params, allowDraw);
                    break;
                default:
                    AnimatedMat_SetDefaultDL(gameState, &pDisplayList, 128);
                    break;
            }

            matAnim++;
            if (pDisplayList != NULL && prevSegment != ABS(matAnim->segment)) {
                gSPEndDisplayList(pDisplayList++);
            }

            CLOSE_DISPS(gameState->gfxCtx);

            i++;
        } while (segment >= 0);
    }

    if (sPrevMatAnimStep != sMatAnimStep) {
        sPrevMatAnimStep = sMatAnimStep;
    }
}

/**
 * Draws an animated material to both OPA and XLU buffers.
 */
void AnimatedMat_Draw(GameState* gameState, u32 gameplayFrames, AnimatedMaterial* matAnim) {
    AnimatedMat_DrawMain(gameState, matAnim, 1, gameplayFrames, 3);
}

/**
 * Draws an animated material to only the OPA buffer.
 */
void AnimatedMat_DrawOpa(GameState* gameState, u32 gameplayFrames, AnimatedMaterial* matAnim) {
    AnimatedMat_DrawMain(gameState, matAnim, 1, gameplayFrames, 1);
}

/**
 * Draws an animated material to only the XLU buffer.
 */
void AnimatedMat_DrawXlu(GameState* gameState, u32 gameplayFrames, AnimatedMaterial* matAnim) {
    AnimatedMat_DrawMain(gameState, matAnim, 1, gameplayFrames, 2);
}

/**
 * Draws an animated material with an alpha ratio (0.0 - 1.0) both OPA and XLU buffers.
 */
void AnimatedMat_DrawAlpha(GameState* gameState, u32 gameplayFrames, AnimatedMaterial* matAnim, f32 alphaRatio) {
    AnimatedMat_DrawMain(gameState, matAnim, alphaRatio, gameplayFrames, 3);
}

/**
 * Draws an animated material with an alpha ratio (0.0 - 1.0) to only the OPA buffer.
 */
void AnimatedMat_DrawAlphaOpa(GameState* gameState, u32 gameplayFrames, AnimatedMaterial* matAnim, f32 alphaRatio) {
    AnimatedMat_DrawMain(gameState, matAnim, alphaRatio, gameplayFrames, 1);
}

/**
 * Draws an animated material with an alpha ratio (0.0 - 1.0) to only the XLU buffer.
 */
void AnimatedMat_DrawAlphaXlu(GameState* gameState, u32 gameplayFrames, AnimatedMaterial* matAnim, f32 alphaRatio) {
    AnimatedMat_DrawMain(gameState, matAnim, alphaRatio, gameplayFrames, 2);
}

/**
 * Draws an animated material with a step to both the OPA and XLU buffers.
 */
void AnimatedMat_DrawStep(GameState* gameState, AnimatedMaterial* matAnim, u32 step) {
    AnimatedMat_DrawMain(gameState, matAnim, 1, step, 3);
}

/**
 * Draws an animated material with a step to only the OPA buffer.
 */
void AnimatedMat_DrawStepOpa(GameState* gameState, AnimatedMaterial* matAnim, u32 step) {
    AnimatedMat_DrawMain(gameState, matAnim, 1, step, 1);
}

/**
 * Draws an animated material with a step to only the XLU buffer.
 */
void AnimatedMat_DrawStepXlu(GameState* gameState, AnimatedMaterial* matAnim, u32 step) {
    AnimatedMat_DrawMain(gameState, matAnim, 1, step, 2);
}

/**
 * Draws an animated material with an alpha ratio (0.0 - 1.0) and a step to both the OPA and XLU buffers.
 */
void AnimatedMat_DrawAlphaStep(GameState* gameState, AnimatedMaterial* matAnim, f32 alphaRatio, u32 step) {
    AnimatedMat_DrawMain(gameState, matAnim, alphaRatio, step, 3);
}

/**
 * Draws an animated material with an alpha ratio (0.0 - 1.0) and a step to only the OPA buffer.
 */
void AnimatedMat_DrawAlphaStepOpa(GameState* gameState, AnimatedMaterial* matAnim, f32 alphaRatio, u32 step) {
    AnimatedMat_DrawMain(gameState, matAnim, alphaRatio, step, 1);
}

/**
 * Draws an animated material with an alpha ratio (0.0 - 1.0) and a step to only the XLU buffer.
 */
void AnimatedMat_DrawAlphaStepXlu(GameState* gameState, AnimatedMaterial* matAnim, f32 alphaRatio, u32 step) {
    AnimatedMat_DrawMain(gameState, matAnim, alphaRatio, step, 2);
}

#endif
