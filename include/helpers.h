#ifndef HELPERS_H
#define HELPERS_H

#include "ultra64/ultratypes.h"
#include "config.h"
#include "z64game.h"
#include "z64environment.h"
#include "z64skybox.h"
#include "z64view.h"

void Helpers_LoadDefinedScene(GameState* gameState);
void Helpers_LoadTitleScreen(GameState* gameState);
void Helpers_LoadFileSelect(GameState* gameState);
void Helpers_LoadMapSelect(GameState* gameState);
void Helpers_SetView(View* view, f32 eyeX, f32 eyeY, f32 eyeZ);
void Helpers_InitSkybox(GameState* gameState, EnvironmentContext* envCtx, SkyboxContext* skyboxCtx, s16 skyboxId);
void Helpers_DrawSkybox(GameState* gameState, View* view, EnvironmentContext* envCtx, SkyboxContext* skyboxCtx, s16 skyboxId, f32 eyeY, f32 angleIncrement);
f32 Helpers_LagrangeInterp(s32 n, f32 x[], f32 fx[], f32 xp);
u8 Helpers_LagrangeInterpColor(s32 n, f32 x[], f32 fx[], f32 xp);

#endif
