#ifndef Z_KALEIDO_SCOPE_H
#define Z_KALEIDO_SCOPE_H

#include "ultra64.h"
#include "global.h"
#include "config.h"

extern u8 gAmmoItems[];
extern s16 D_8082AAEC[];
extern s16 D_8082AB2C[];
extern u8 gSlotAgeReqs[];
extern u8 gEquipAgeReqs[EQUIP_TYPE_MAX][4];
extern u8 gItemAgeReqs[];
extern u8 gAreaGsFlags[];

#define AGE_REQ_ADULT LINK_AGE_ADULT
#define AGE_REQ_CHILD LINK_AGE_CHILD
#define AGE_REQ_NONE 9

#define CHECK_AGE_REQ_SLOT(slot) \
    ((gSlotAgeReqs[slot] == AGE_REQ_NONE) || gSlotAgeReqs[slot] == ((void)0, gSaveContext.save.linkAge))

#define CHECK_AGE_REQ_EQUIP(y, x) \
    ((gEquipAgeReqs[y][x] == AGE_REQ_NONE) || (gEquipAgeReqs[y][x] == ((void)0, gSaveContext.save.linkAge)))

#define CHECK_AGE_REQ_ITEM(item) \
    ((gItemAgeReqs[item] == AGE_REQ_NONE) || (gItemAgeReqs[item] == ((void)0, gSaveContext.save.linkAge)))

void KaleidoScope_DrawQuestStatus(PlayState* play, GraphicsContext* gfxCtx);
s32 KaleidoScope_UpdateQuestStatusPoint(PauseContext* pauseCtx, s32 point);
#ifdef ENABLE_INV_EDITOR
void KaleidoScope_DrawDebugEditor(PlayState* play);
#endif
void KaleidoScope_DrawPlayerWork(PlayState* play);
void KaleidoScope_DrawEquipment(PlayState* play);
void KaleidoScope_SetCursorVtx(PauseContext* pauseCtx, u16 index, Vtx* vtx);
void KaleidoScope_DrawItemSelect(PlayState* play);
void KaleidoScope_UpdateItemEquip(PlayState* play);
void KaleidoScope_DrawDungeonMap(PlayState* play, GraphicsContext* gfxCtx);
void KaleidoScope_DrawWorldMap(PlayState* play, GraphicsContext* gfxCtx);
void KaleidoScope_UpdatePrompt(PlayState* play);
Gfx* KaleidoScope_QuadTextureIA4(Gfx* gfx, void* texture, s16 width, s16 height, u16 point);
Gfx* KaleidoScope_QuadTextureIA8(Gfx* gfx, void* texture, s16 width, s16 height, u16 point);
void KaleidoScope_MoveCursorToSpecialPos(PlayState* play, u16 specialPos);
void KaleidoScope_DrawQuadTextureRGBA32(GraphicsContext* gfxCtx, void* texture, u16 width, u16 height, u16 point);
void KaleidoScope_ProcessPlayerPreRender();
void KaleidoScope_SetupPlayerPreRender(PlayState* play);
void KaleidoScope_DrawCursor(PlayState* play, u16 pageIndex);
void KaleidoScope_UpdateDungeonMap(PlayState* play);

void PauseMapMark_Draw(PlayState* play);

#endif
