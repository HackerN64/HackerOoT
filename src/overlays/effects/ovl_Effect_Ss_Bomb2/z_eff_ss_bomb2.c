/*
 * File: z_eff_ss_bomb2.c
 * Overlay: ovl_Effect_Ss_Bomb2
 * Description: Bomb Blast
 */

#include "z_eff_ss_bomb2.h"

typedef enum {
    /* 0x00 */ SS_BOMB2_SCALE,
    /* 0x01 */ SS_BOMB2_TEX_IDX,
    /* 0x02 */ SS_BOMB2_PRIM_R,
    /* 0x03 */ SS_BOMB2_PRIM_G,
    /* 0x04 */ SS_BOMB2_PRIM_B,
    /* 0x05 */ SS_BOMB2_PRIM_A,
    /* 0x06 */ SS_BOMB2_ENV_R,
    /* 0x07 */ SS_BOMB2_ENV_G,
    /* 0x08 */ SS_BOMB2_ENV_B,
    /* 0x09 */ SS_BOMB2_SCALE_STEP,
    /* 0x0A */ SS_BOMB2_A
} EffectSsBomb2Regs;

u32 EffectSsBomb2_Init(GlobalContext* globalCtx, u32 index, EffectSs* this, void* initParamsx);
void EffectSsBomb2_DrawFade(GlobalContext* globalCtx, u32 index, EffectSs* this);
void EffectSsBomb2_DrawLayered(GlobalContext* globalCtx, u32 index, EffectSs* this);
void EffectSsBomb2_Update(GlobalContext* globalCtx, u32 index, EffectSs* this);

EffectSsInit Effect_Ss_Bomb2_InitVars = {
    EFFECT_SS_BOMB2,
    EffectSsBomb2_Init,
};

static void* sDrawFuncs[] = {
    EffectSsBomb2_DrawFade,
    EffectSsBomb2_DrawLayered,
};

static UNK_PTR D_8099FEE0[] = {
    0x04007F80, 0x04008780, 0x04008F80, 0x04009780, 0x04009F80, 0x0400A780, 0x0400AF80, 0x0400B780,
};

static UNK_PTR D_8099FF00[] = {
    0x04007F80, 0x04008780, 0x04008F80, 0x04009780, 0x04009F80, 0x0400A780, 0x0400AF80, 0x0400B780,
};

extern Gfx D_0400BF80[];
extern Gfx D_0400BFE8[];
extern Gfx D_0400C040[];

u32 EffectSsBomb2_Init(GlobalContext* globalCtx, u32 index, EffectSs* this, void* initParamsx) {
    EffectSsBomb2InitParams* initParams = (EffectSsBomb2InitParams*)initParamsx;

    Math_Vec3f_Copy(&this->pos, &initParams->pos);
    Math_Vec3f_Copy(&this->velocity, &initParams->velocity);
    Math_Vec3f_Copy(&this->accel, &initParams->accel);
    this->displayList = SEGMENTED_TO_VIRTUAL(&D_0400BF80);
    this->life = 24;
    this->update = EffectSsBomb2_Update;
    this->draw = sDrawFuncs[initParams->drawMode];
    this->regs[SS_BOMB2_SCALE] = initParams->scale;
    this->regs[SS_BOMB2_SCALE_STEP] = initParams->scaleStep;
    this->regs[SS_BOMB2_PRIM_R] = 255;
    this->regs[SS_BOMB2_PRIM_G] = 255;
    this->regs[SS_BOMB2_PRIM_B] = 255;
    this->regs[SS_BOMB2_PRIM_A] = 255;
    this->regs[SS_BOMB2_ENV_R] = 0;
    this->regs[SS_BOMB2_ENV_G] = 0;
    this->regs[SS_BOMB2_ENV_B] = 200;

    return 1;
}

// unused in the original game. looks like EffectSsBomb but with color
void EffectSsBomb2_DrawFade(GlobalContext* globalCtx, u32 index, EffectSs* this) {
    GraphicsContext* gfxCtx = globalCtx->state.gfxCtx;
    MtxF sp11C;
    MtxF spDC;
    MtxF sp9C;
    MtxF sp5C;
    Mtx* mtx;
    s32 pad;
    f32 scale;

    OPEN_DISPS(gfxCtx, "../z_eff_ss_bomb2.c", 298);

    scale = this->regs[SS_BOMB2_SCALE] * 0.01f;
    SkinMatrix_SetTranslate(&sp11C, this->pos.x, this->pos.y, this->pos.z);
    SkinMatrix_SetScale(&spDC, scale, scale, 1.0f);
    SkinMatrix_MtxFMtxFMult(&sp11C, &globalCtx->mf_11DA0, &sp5C);

    SkinMatrix_MtxFMtxFMult(&sp5C, &spDC, &sp9C);
    mtx = SkinMatrix_MtxFToNewMtx(gfxCtx, &sp9C);

    if (mtx != NULL) {
        gSPMatrix(oGfxCtx->polyXlu.p++, mtx, G_MTX_NOPUSH | G_MTX_LOAD | G_MTX_MODELVIEW);
        func_80094BC4(gfxCtx);
        gDPSetPrimColor(oGfxCtx->polyXlu.p++, 0, 0, this->regs[SS_BOMB2_PRIM_R], this->regs[SS_BOMB2_PRIM_G],
                        this->regs[SS_BOMB2_PRIM_B], this->regs[SS_BOMB2_PRIM_A]);
        gDPSetEnvColor(oGfxCtx->polyXlu.p++, this->regs[SS_BOMB2_ENV_R], this->regs[SS_BOMB2_ENV_G],
                       this->regs[SS_BOMB2_ENV_B], 0);
        gSPSegment(oGfxCtx->polyXlu.p++, 0x08, SEGMENTED_TO_VIRTUAL(D_8099FEE0[this->regs[SS_BOMB2_TEX_IDX]]));
        gSPDisplayList(oGfxCtx->polyXlu.p++, this->displayList);
        if (1) {}
        if (1) {}
    }

    CLOSE_DISPS(gfxCtx, "../z_eff_ss_bomb2.c", 345);
}

void EffectSsBomb2_DrawLayered(GlobalContext* globalCtx, u32 index, EffectSs* this) {
    GraphicsContext* gfxCtx = globalCtx->state.gfxCtx;
    MtxF sp1B4;
    MtxF sp174;
    MtxF sp134;
    MtxF spF4;
    MtxF spB4;
    Mtx* mtx2;
    Mtx* mtx;
    s32 pad[3];
    f32 scale;
    f32 temp_f24;
    f32 mtxScale = 0.925f;
    s32 i;

    OPEN_DISPS(gfxCtx, "../z_eff_ss_bomb2.c", 386);

    temp_f24 = this->regs[SS_BOMB2_A];
    scale = this->regs[SS_BOMB2_SCALE] * 0.01f;
    SkinMatrix_SetTranslate(&sp1B4, this->pos.x, this->pos.y, this->pos.z);
    SkinMatrix_SetScale(&sp174, scale, scale, 1.0f);
    SkinMatrix_MtxFMtxFMult(&sp1B4, &globalCtx->mf_11DA0, &spF4);
    SkinMatrix_MtxFMtxFMult(&spF4, &sp174, &sp134);
    mtx = SkinMatrix_MtxFToNewMtx(gfxCtx, &sp134);

    if (mtx != NULL) {
        gSPMatrix(oGfxCtx->polyXlu.p++, mtx, G_MTX_NOPUSH | G_MTX_LOAD | G_MTX_MODELVIEW);
        mtx2 = SkinMatrix_MtxFToNewMtx(gfxCtx, &sp134);

        if (mtx2 != NULL) {
            func_80094BC4(gfxCtx);
            gDPSetPrimColor(oGfxCtx->polyXlu.p++, 0, 0, this->regs[SS_BOMB2_PRIM_R], this->regs[SS_BOMB2_PRIM_G],
                            this->regs[SS_BOMB2_PRIM_B], this->regs[SS_BOMB2_PRIM_A]);
            gDPSetEnvColor(oGfxCtx->polyXlu.p++, this->regs[SS_BOMB2_ENV_R], this->regs[SS_BOMB2_ENV_G],
                           this->regs[SS_BOMB2_ENV_B], 0);
            gSPSegment(oGfxCtx->polyXlu.p++, 0x08, SEGMENTED_TO_VIRTUAL(D_8099FF00[this->regs[SS_BOMB2_TEX_IDX]]));
            gSPDisplayList(oGfxCtx->polyXlu.p++, D_0400BFE8);
            gSPDisplayList(oGfxCtx->polyXlu.p++, D_0400C040);

            Matrix_MtxToMtxF(mtx2, &spB4);
            Matrix_Put(&spB4);
            for (i = 1; i >= 0; i--) {
                Matrix_Translate(0.0f, 0.0f, temp_f24, MTXMODE_APPLY);
                Matrix_RotateZ((this->life * 0.02f) + 180.0f, MTXMODE_APPLY);
                Matrix_Scale(mtxScale, mtxScale, mtxScale, MTXMODE_APPLY);
                gSPMatrix(oGfxCtx->polyXlu.p++, Matrix_NewMtx(globalCtx->state.gfxCtx, "../z_eff_ss_bomb2.c", 448),
                          G_MTX_NOPUSH | G_MTX_LOAD | G_MTX_MODELVIEW);
                gSPDisplayList(oGfxCtx->polyXlu.p++, D_0400C040);
                mtxScale -= 0.15f;
            }
        }

        if (1) {}
        if (1) {}
    }
    CLOSE_DISPS(gfxCtx, "../z_eff_ss_bomb2.c", 456);
}

void EffectSsBomb2_Update(GlobalContext* globalCtx, u32 index, EffectSs* this) {
    s32 divisor;

    this->regs[SS_BOMB2_TEX_IDX] = (23 - this->life) / 3;
    this->regs[SS_BOMB2_SCALE] += this->regs[SS_BOMB2_SCALE_STEP];

    if (this->regs[SS_BOMB2_SCALE_STEP] == 30) {
        this->regs[SS_BOMB2_A] += 4.0f;
    } else {
        this->regs[SS_BOMB2_A] += 2.0f;
    }

    if ((this->life < 23) && (this->life >= 14)) {
        divisor = this->life - 13;
        this->regs[SS_BOMB2_PRIM_R] = func_80027DD4(this->regs[SS_BOMB2_PRIM_R], 255, divisor);
        this->regs[SS_BOMB2_PRIM_G] = func_80027DD4(this->regs[SS_BOMB2_PRIM_G], 255, divisor);
        this->regs[SS_BOMB2_PRIM_B] = func_80027DD4(this->regs[SS_BOMB2_PRIM_B], 150, divisor);
        this->regs[SS_BOMB2_PRIM_A] = func_80027DD4(this->regs[SS_BOMB2_PRIM_A], 255, divisor);
        this->regs[SS_BOMB2_ENV_R] = func_80027DD4(this->regs[SS_BOMB2_ENV_R], 150, divisor);
        this->regs[SS_BOMB2_ENV_G] = func_80027DD4(this->regs[SS_BOMB2_ENV_G], 0, divisor);
        this->regs[SS_BOMB2_ENV_B] = func_80027DD4(this->regs[SS_BOMB2_ENV_B], 0, divisor);
    } else if ((this->life < 14) && (this->life >= 0)) {
        divisor = this->life + 1;
        this->regs[SS_BOMB2_PRIM_R] = func_80027DD4(this->regs[SS_BOMB2_PRIM_R], 50, divisor);
        this->regs[SS_BOMB2_PRIM_G] = func_80027DD4(this->regs[SS_BOMB2_PRIM_G], 50, divisor);
        this->regs[SS_BOMB2_PRIM_B] = func_80027DD4(this->regs[SS_BOMB2_PRIM_B], 50, divisor);
        this->regs[SS_BOMB2_PRIM_A] = func_80027DD4(this->regs[SS_BOMB2_PRIM_A], 150, divisor);
        this->regs[SS_BOMB2_ENV_R] = func_80027DD4(this->regs[SS_BOMB2_ENV_R], 10, divisor);
        this->regs[SS_BOMB2_ENV_G] = func_80027DD4(this->regs[SS_BOMB2_ENV_G], 10, divisor);
        this->regs[SS_BOMB2_ENV_B] = func_80027DD4(this->regs[SS_BOMB2_ENV_B], 10, divisor);
    }
}
