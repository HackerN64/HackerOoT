/*
 * File: z_eff_ss_bomb.c
 * Overlay: ovl_Effect_Ss_Bomb
 * Description: Bomb Blast. Unused in the orignal game.
 */

#include "z_eff_ss_bomb.h"

typedef enum {
    /* 0x00 */ SS_BOMB_SCALE,
    /* 0x01 */ SS_BOMB_TEX_IDX,
} EffectSsBombRegs;

u32 EffectSsBomb_Init(GlobalContext* globalCtx, u32 index, EffectSs* this, void* initParamsx);
void EffectSsBomb_Draw(GlobalContext* globalCtx, u32 index, EffectSs* this);
void EffectSsBomb_Update(GlobalContext* globalCtx, u32 index, EffectSs* this);

EffectSsInit Effect_Ss_Bomb_InitVars = {
    EFFECT_SS_BOMB,
    EffectSsBomb_Init,
};

static UNK_PTR D_8099F588[] = {
    0x04007F80,
    0x04008780,
    0x04008F80,
    0x04009780,
};

extern Gfx D_0400BF80[];

u32 EffectSsBomb_Init(GlobalContext* globalCtx, u32 index, EffectSs* this, void* initParamsx) {
    EffectSsBombInitParams* initParams = (EffectSsBombInitParams*)initParamsx;

    Math_Vec3f_Copy(&this->pos, &initParams->pos);
    Math_Vec3f_Copy(&this->velocity, &initParams->velocity);
    Math_Vec3f_Copy(&this->accel, &initParams->accel);
    this->displayList = SEGMENTED_TO_VIRTUAL(D_0400BF80);
    this->life = 20;
    this->draw = EffectSsBomb_Draw;
    this->update = EffectSsBomb_Update;
    this->regs[SS_BOMB_SCALE] = 100;
    this->regs[SS_BOMB_TEX_IDX] = 0;

    return 1;
}

void EffectSsBomb_Draw(GlobalContext* globalCtx, u32 index, EffectSs* this) {
    GraphicsContext* gfxCtx = globalCtx->state.gfxCtx;
    MtxF sp12C;
    MtxF spEC;
    MtxF spAC;
    MtxF sp6C;
    Mtx* mtx;
    s32 pad;
    f32 scale;
    s16 color;

    if (1) {}

    OPEN_DISPS(gfxCtx, "../z_eff_ss_bomb.c", 168);

    scale = this->regs[SS_BOMB_SCALE] / 100.0f;

    SkinMatrix_SetTranslate(&sp12C, this->pos.x, this->pos.y, this->pos.z);
    SkinMatrix_SetScale(&spEC, scale, scale, 1.0f);
    SkinMatrix_MtxFMtxFMult(&sp12C, &globalCtx->mf_11DA0, &sp6C);
    SkinMatrix_MtxFMtxFMult(&sp6C, &spEC, &spAC);

    gSPMatrix(oGfxCtx->polyXlu.p++, &gMtxClear, G_MTX_NOPUSH | G_MTX_LOAD | G_MTX_MODELVIEW);

    mtx = SkinMatrix_MtxFToNewMtx(gfxCtx, &spAC);

    if (mtx != NULL) {
        gSPMatrix(oGfxCtx->polyXlu.p++, mtx, G_MTX_NOPUSH | G_MTX_LOAD | G_MTX_MODELVIEW);
        gSPSegment(oGfxCtx->polyXlu.p++, 0x08, SEGMENTED_TO_VIRTUAL(D_8099F588[this->regs[SS_BOMB_TEX_IDX]]));
        gDPPipeSync(oGfxCtx->polyXlu.p++);
        func_80094C50(gfxCtx);
        color = this->life * 12.75f;
        gDPSetPrimColor(oGfxCtx->polyXlu.p++, 0, 0, color, color, color, color);
        gDPPipeSync(oGfxCtx->polyXlu.p++);
        gSPDisplayList(oGfxCtx->polyXlu.p++, this->displayList);
        gDPPipeSync(oGfxCtx->polyXlu.p++);
    }

    CLOSE_DISPS(gfxCtx, "../z_eff_ss_bomb.c", 214);
}

void EffectSsBomb_Update(GlobalContext* globalCtx, u32 index, EffectSs* this) {
    if ((this->life < 21) && (this->life >= 17)) {
        this->regs[SS_BOMB_TEX_IDX] = (20 - this->life);
    } else {
        this->regs[SS_BOMB_SCALE] += 0;
        this->regs[SS_BOMB_TEX_IDX] = 3;
    }

    this->accel.x = ((Math_Rand_ZeroOne() * 0.4f) - 0.2f);
    this->accel.z = ((Math_Rand_ZeroOne() * 0.4f) - 0.2f);
}
