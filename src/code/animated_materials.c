#include "animated_materials.h"
#include "helpers.h"
#include "config.h"
#include "gfx.h"
#include "segmented_address.h"
#include "event_manager.h"
#include "printf.h"

#if ENABLE_ANIMATED_MATERIALS

static s32 sMatAnimStep;
static u32 sMatAnimFlags;
static f32 sMatAnimAlphaRatio;
static s32 sSavedMatAnimStep;

/**
 * Returns a pointer to a single layer texture scroll displaylist.
 */
Gfx* AnimatedMat_TexScroll(GameState* gameState, AnimatedMatTexScrollParams* params) {
    return Gfx_TexScroll(gameState->gfxCtx, params->xStep * sMatAnimStep, -(params->yStep * sMatAnimStep),
                         params->width, params->height);
}

/**
 * Animated Material Type 0:
 * Scrolls a single layer texture using the provided `AnimatedMatTexScrollParams`.
 */
void AnimatedMat_DrawTexScroll(GameState* gameState, s32 segment, void* params) {
    AnimatedMatTexScrollParams* texScrollParams = (AnimatedMatTexScrollParams*)params;
    Gfx* texScrollDList = AnimatedMat_TexScroll(gameState, texScrollParams);

    OPEN_DISPS(gameState->gfxCtx);

    if (sMatAnimFlags & 1) {
        gSPSegment(POLY_OPA_DISP++, segment, texScrollDList);
    }

    if (sMatAnimFlags & 2) {
        gSPSegment(POLY_XLU_DISP++, segment, texScrollDList);
    }

    CLOSE_DISPS(gameState->gfxCtx);
}

/**
 * Returns a pointer to a two layer texture scroll displaylist.
 */
Gfx* AnimatedMat_TwoLayerTexScroll(GameState* gameState, AnimatedMatTexScrollParams* params) {
    return Gfx_TwoTexScroll(gameState->gfxCtx, 0, params[0].xStep * sMatAnimStep, -(params[0].yStep * sMatAnimStep),
                            params[0].width, params[0].height, 1, params[1].xStep * sMatAnimStep,
                            -(params[1].yStep * sMatAnimStep), params[1].width, params[1].height);
}

/**
 * Animated Material Type 1:
 * Scrolls a two layer texture using the provided `AnimatedMatTexScrollParams`.
 */
void AnimatedMat_DrawTwoTexScroll(GameState* gameState, s32 segment, void* params) {
    AnimatedMatTexScrollParams* texScrollParams = (AnimatedMatTexScrollParams*)params;
    Gfx* texScrollDList = AnimatedMat_TwoLayerTexScroll(gameState, texScrollParams);

    OPEN_DISPS(gameState->gfxCtx);

    if (sMatAnimFlags & 1) {
        gSPSegment(POLY_OPA_DISP++, segment, texScrollDList);
    }

    if (sMatAnimFlags & 2) {
        gSPSegment(POLY_XLU_DISP++, segment, texScrollDList);
    }

    CLOSE_DISPS(gameState->gfxCtx);
}

/**
 * Generates a displaylist that sets the prim and env color, and stores it in the provided segment ID.
 */
void AnimatedMat_SetColor(GameState* gameState, s32 segment, F3DPrimColor* primColorResult, F3DEnvColor* envColor) {
    Gfx* gfx = GRAPH_ALLOC(gameState->gfxCtx, 3 * sizeof(Gfx));

    OPEN_DISPS(gameState->gfxCtx);

    // clang-format off
    if (sMatAnimFlags & 1) { gSPSegment(POLY_OPA_DISP++, segment, gfx); }
    if (sMatAnimFlags & 2) { gSPSegment(POLY_XLU_DISP++, segment, gfx); }
    // clang-format on

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
void AnimatedMat_DrawColor(GameState* gameState, s32 segment, void* params) {
    AnimatedMatColorParams* colorAnimParams = (AnimatedMatColorParams*)params;
    F3DPrimColor* primColor = SEGMENTED_TO_VIRTUAL(colorAnimParams->primColors);
    F3DEnvColor* envColor;
    s32 curFrame = sMatAnimStep % colorAnimParams->keyFrameLength;

    primColor += curFrame;
    envColor = (colorAnimParams->envColors != NULL)
                   ? (F3DEnvColor*)SEGMENTED_TO_VIRTUAL(colorAnimParams->envColors) + curFrame
                   : NULL;

    AnimatedMat_SetColor(gameState, segment, primColor, envColor);
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
void AnimatedMat_DrawColorLerp(GameState* gameState, s32 segment, void* params) {
    AnimatedMatColorParams* colorAnimParams = (AnimatedMatColorParams*)params;
    F3DPrimColor* primColorMax = SEGMENTED_TO_VIRTUAL(colorAnimParams->primColors);
    F3DEnvColor* envColorMax;
    u16* keyFrames = SEGMENTED_TO_VIRTUAL(colorAnimParams->keyFrames);
    s32 curFrame = sMatAnimStep % colorAnimParams->keyFrameLength;
    s32 endFrame;
    s32 relativeFrame; // relative to the start frame
    s32 startFrame;
    f32 norm;
    F3DPrimColor* primColorMin;
    F3DPrimColor primColorResult;
    F3DEnvColor* envColorMin;
    F3DEnvColor envColorResult;
    s32 i;

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

    AnimatedMat_SetColor(gameState, segment, &primColorResult, (envColorMax != NULL) ? &envColorResult : NULL);
}

/**
 * Animated Material Type 4:
 * Color key frame animation with non-linear interpolation.
 */
void AnimatedMat_DrawColorNonLinearInterp(GameState* gameState, s32 segment, void* params) {
    AnimatedMatColorParams* colorAnimParams = (AnimatedMatColorParams*)params;
    F3DPrimColor* primColorCur = SEGMENTED_TO_VIRTUAL(colorAnimParams->primColors);
    F3DEnvColor* envColorCur = SEGMENTED_TO_VIRTUAL(colorAnimParams->envColors);
    u16* keyFrames = SEGMENTED_TO_VIRTUAL(colorAnimParams->keyFrames);
    f32 curFrame = sMatAnimStep % colorAnimParams->keyFrameLength;
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

    AnimatedMat_SetColor(gameState, segment, &primColorResult, (envColorCur != NULL) ? &envColorResult : NULL);
}

/**
 * Animated Material Type 5:
 * Cycles between a list of textures (imagine like a GIF)
 */
void AnimatedMat_DrawTexCycle(GameState* gameState, s32 segment, void* params) {
    AnimatedMatTexCycleParams* texAnimParams = params;
    TexturePtr* texList = SEGMENTED_TO_VIRTUAL(texAnimParams->textureList);
    u8* texId = SEGMENTED_TO_VIRTUAL(texAnimParams->textureIndexList);
    s32 curFrame = sMatAnimStep % texAnimParams->keyFrameLength;
    TexturePtr tex = SEGMENTED_TO_VIRTUAL(texList[texId[curFrame]]);

    OPEN_DISPS(gameState->gfxCtx);

    if (sMatAnimFlags & 1) {
        gSPSegment(POLY_OPA_DISP++, segment, tex);
    }

    if (sMatAnimFlags & 2) {
        gSPSegment(POLY_XLU_DISP++, segment, tex);
    }

    CLOSE_DISPS(gameState->gfxCtx);
}

void AnimatedMat_DrawColorCycle(GameState* gameState, s32 segment, void* params) {
    static u8 sCycleTimer = 0;
    static u16 sCurKeyframe = 0;
    AnimatedMatColorParams* colorAnimParams = (AnimatedMatColorParams*)params;
    F3DPrimColor* primColors = SEGMENTED_TO_VIRTUAL(colorAnimParams->primColors);
    F3DEnvColor* envColor = NULL;
    u16* keyFrames = SEGMENTED_TO_VIRTUAL(colorAnimParams->keyFrames);

    // reset values if we reach the end
    if (sCurKeyframe >= colorAnimParams->keyFrameLength) {
        sCurKeyframe = 0;
        sCycleTimer = 0;
    }

    // draw the color
    if (colorAnimParams->envColors != NULL) {
        envColor = SEGMENTED_TO_VIRTUAL(colorAnimParams->envColors) + sCurKeyframe;
    }

    AnimatedMat_SetColor(gameState, segment, &primColors[sCurKeyframe], envColor);

    // finally, increase the timer until we reach the target then go to the next keyframe and reset the timer
    if (sCycleTimer < keyFrames[sCurKeyframe]) {
        sCycleTimer++;
    } else {
        sCurKeyframe++;
        sCycleTimer = 0;
    }
}

void AnimatedMat_DrawTexTimedCycle(GameState* gameState, s32 segment, void* params) {
    static u8 sCycleTimer = 0;
    static u16 sCurKeyframe = 0;
    AnimatedMatTexTimedCycleParams* animParams = params;
    AnimatedMatTexTimedCycleKeyframe* keyframeList;
    u16 targetTime;
    TexturePtr texture;

    keyframeList = SEGMENTED_TO_VIRTUAL(animParams->keyframeList);

    if (sCurKeyframe >= animParams->keyframeLength) {
        sCurKeyframe = 0;
        sCycleTimer = 0;
    }

    OPEN_DISPS(gameState->gfxCtx);

    texture = SEGMENTED_TO_VIRTUAL(keyframeList[sCurKeyframe].texture);

    if (sMatAnimFlags & 1) {
        gSPSegment(POLY_OPA_DISP++, segment, texture);
    }

    if (sMatAnimFlags & 2) {
        gSPSegment(POLY_XLU_DISP++, segment, texture);
    }

    CLOSE_DISPS(gameState->gfxCtx);

    if (sCycleTimer < keyframeList[sCurKeyframe].displayTime) {
        sCycleTimer++;
    } else {
        sCurKeyframe++;
        sCycleTimer = 0;
    }
}

/**
 * This is the main function that handles the animated material system.
 * There are six different animated material types, which should be set in the provided `AnimatedMaterial`.
 */
void AnimatedMat_DrawMain(GameState* gameState, AnimatedMaterial* matAnim, f32 alphaRatio, u32 step, u32 flags) {
    s32 segmentAbs;
    s32 segment;
    u8 drawDefaultDL = false;
    u8 drawDefaultTex = false;

    sMatAnimAlphaRatio = alphaRatio;
    sMatAnimStep = step;
    sMatAnimFlags = flags;

    if ((matAnim != NULL) && (matAnim->segment != 0)) {
        do {
            void* params = SEGMENTED_TO_VIRTUAL(matAnim->params);
            segment = matAnim->segment;
            segmentAbs = ABS(segment);
            drawDefaultDL = false;
            drawDefaultTex = false;

            if (EventManager_ProcessScript(gameState, matAnim->eventEntry)) {
                switch (matAnim->type) {
                    case ANIM_MAT_TYPE_TEX_SCROLL:
                        AnimatedMat_DrawTexScroll(gameState, segmentAbs, params);
                        break;
                    case ANIM_MAT_TYPE_TWO_TEX_SCROLL:
                        AnimatedMat_DrawTwoTexScroll(gameState, segmentAbs, params);
                        break;
                    case ANIM_MAT_TYPE_COLOR:
                        AnimatedMat_DrawColor(gameState, segmentAbs, params);
                        break;
                    case ANIM_MAT_TYPE_COLOR_LERP:
                        AnimatedMat_DrawColorLerp(gameState, segmentAbs, params);
                        break;
                    case ANIM_MAT_TYPE_COLOR_NON_LINEAR_INTERP:
                        AnimatedMat_DrawColorNonLinearInterp(gameState, segmentAbs, params);
                        break;
                    case ANIM_MAT_TYPE_TEX_CYCLE:
                        AnimatedMat_DrawTexCycle(gameState, segmentAbs, params);
                        break;
                    case ANIM_MAT_TYPE_COLOR_CYCLE:
                        AnimatedMat_DrawColorCycle(gameState, segmentAbs, params);
                        break;
                    case ANIM_MAT_TYPE_TEX_TIMED_CYCLE:
                        AnimatedMat_DrawTexTimedCycle(gameState, segmentAbs, params);
                        break;
                    default:
                        drawDefaultDL = true;
                        break;
                }
            } else {
                switch (matAnim->type) {
                    case ANIM_MAT_TYPE_TEX_CYCLE:
                    case ANIM_MAT_TYPE_TEX_TIMED_CYCLE:
                        drawDefaultTex = true;
                        break;
                    default:
                        drawDefaultDL = true;
                        break;
                }
            }

            OPEN_DISPS(gameState->gfxCtx);
            if (drawDefaultDL) {
                if (sMatAnimFlags & 1) {
                    gSPSegment(POLY_OPA_DISP++, segmentAbs, gEmptyDL);
                    gDPPipeSync(POLY_OPA_DISP++);
                    gDPSetPrimColor(POLY_OPA_DISP++, 0, 0, 128, 128, 128, 128);
                    gDPSetEnvColor(POLY_OPA_DISP++, 128, 128, 128, 128);
                }

                if (sMatAnimFlags & 2) {
                    gSPSegment(POLY_XLU_DISP++, segmentAbs, gEmptyDL);
                    gDPPipeSync(POLY_XLU_DISP++);
                    gDPSetPrimColor(POLY_XLU_DISP++, 0, 0, 128, 128, 128, 128);
                    gDPSetEnvColor(POLY_XLU_DISP++, 128, 128, 128, 128);
                }

            }

            if (drawDefaultTex && matAnim->defaultTex != NULL) {
                if (sMatAnimFlags & 1) {
                    gSPSegment(POLY_OPA_DISP++, segmentAbs, SEGMENTED_TO_VIRTUAL(matAnim->defaultTex));
                }

                if (sMatAnimFlags & 2) {
                    gSPSegment(POLY_XLU_DISP++, segmentAbs, SEGMENTED_TO_VIRTUAL(matAnim->defaultTex));
                }
            }
            CLOSE_DISPS(gameState->gfxCtx);

            matAnim++;
        } while (segment >= 0);
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
