#ifndef LETTERBOX_H
#define LETTERBOX_H

#include "ultra64.h"

void Letterbox_SetSizeTarget(s32 target);
u32 Letterbox_GetSizeTarget(void);
void Letterbox_SetSize(s32 size);
u32 Letterbox_GetSize(void);
void Letterbox_Init(void);
void Letterbox_Destroy(void);
void Letterbox_Update(s32 updateRate);

#if ENABLE_NEW_LETTERBOX

struct GraphicsContext;

void ShrinkWindow_Letterbox_SetSizeTarget(s32 target);
s32 ShrinkWindow_Letterbox_GetSizeTarget(void);
void ShrinkWindow_Letterbox_SetSize(s32 size);
s32 ShrinkWindow_Letterbox_GetSize(void);

void ShrinkWindow_Pillarbox_SetSizeTarget(s32 target);
s32 ShrinkWindow_Pillarbox_GetSizeTarget(void);
void ShrinkWindow_Pillarbox_SetSize(s32 size);
s32 ShrinkWindow_Pillarbox_GetSize(void);

void ShrinkWindow_Init(void);
void ShrinkWindow_Destroy(void);
void ShrinkWindow_Update(s32 framerateDivisor);
void ShrinkWindow_Draw(struct GraphicsContext* gfxCtx);

#endif

#endif
