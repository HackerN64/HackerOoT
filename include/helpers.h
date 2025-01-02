#ifndef HELPERS_H
#define HELPERS_H

#include "z64.h"
#include "functions.h"
#include "config.h"

void Helpers_LoadDefinedScene(GameState* gameState);
void Helpers_LoadTitleScreen(GameState* gameState);
void Helpers_LoadFileSelect(GameState* gameState);
void Helpers_LoadMapSelect(GameState* gameState);
void Helpers_SetView(View* view, f32 eyeX, f32 eyeY, f32 eyeZ);
void Helpers_InitSkybox(GameState* gameState, EnvironmentContext* envCtx, SkyboxContext* skyboxCtx, s16 skyboxId);
void Helpers_DrawSkybox(GameState* gameState, View* view, EnvironmentContext* envCtx, SkyboxContext* skyboxCtx, s16 skyboxId, f32 eyeY, f32 angleIncrement);

#endif
