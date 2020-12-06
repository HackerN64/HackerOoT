/*
 * File: z_eff_ss_sibuki.c
 * Overlay: ovl_Effect_Ss_Sibuki
 * Description: Bubbles (only used by gohma and gohmalings in the original game)
 */

#include "z_eff_ss_sibuki.h"

#define rPrimColorR regs[0]
#define rPrimColorG regs[1]
#define rPrimColorB regs[2]
#define rPrimColorA regs[3]
#define rEnvColorR regs[4]
#define rEnvColorG regs[5]
#define rEnvColorB regs[6]
#define rEnvColorA regs[7]
#define rMoveDelay regs[8]
#define rDirection regs[9]
#define rScale regs[10]

u32 EffectSsSibuki_Init(GlobalContext* globalCtx, u32 index, EffectSs* this, void* initParamsx);
void EffectSsSibuki_Draw(GlobalContext* globalCtx, u32 index, EffectSs* this);
void EffectSsSibuki_Update(GlobalContext* globalCtx, u32 index, EffectSs* this);

EffectSsInit Effect_Ss_Sibuki_InitVars = {
    EFFECT_SS_SIBUKI,
    EffectSsSibuki_Init,
};

extern void* D_04055EB0;
extern void* D_04055DB0;
extern Gfx D_0401A160[];

u32 EffectSsSibuki_Init(GlobalContext* globalCtx, u32 index, EffectSs* this, void* initParamsx) {
    EffectSsSibukiInitParams* initParams = (EffectSsSibukiInitParams*)initParamsx;

    this->pos = initParams->pos;
    this->velocity = initParams->velocity;
    this->accel = initParams->accel;

    if (KREG(2) != 0) {
        this->gfx = SEGMENTED_TO_VIRTUAL(&D_04055EB0);
    } else {
        this->gfx = SEGMENTED_TO_VIRTUAL(&D_04055DB0);
    }

    this->life = ((s16)((Math_Rand_ZeroOne() * (500.0f + KREG(64))) * 0.01f)) + KREG(65) + 10;
    this->rMoveDelay = initParams->moveDelay + 1;
    this->draw = EffectSsSibuki_Draw;
    this->update = EffectSsSibuki_Update;
    this->rDirection = initParams->direction;
    this->rScale = initParams->scale;
    this->rPrimColorR = 100;
    this->rPrimColorG = 100;
    this->rPrimColorB = 100;
    this->rPrimColorA = 100;
    this->rEnvColorR = 255;
    this->rEnvColorG = 255;
    this->rEnvColorB = 255;
    this->rEnvColorA = 255;

    return 1;
}

void EffectSsSibuki_Draw(GlobalContext* globalCtx, u32 index, EffectSs* this) {
    GraphicsContext* gfxCtx = globalCtx->state.gfxCtx;
    f32 scale = this->rScale / 100.0f;

    OPEN_DISPS(gfxCtx, "../z_eff_ss_sibuki.c", 163);

    Matrix_Translate(this->pos.x, this->pos.y, this->pos.z, MTXMODE_NEW);
    Matrix_Scale(scale, scale, scale, MTXMODE_APPLY);
    gSPMatrix(POLY_OPA_DISP++, Matrix_NewMtx(gfxCtx, "../z_eff_ss_sibuki.c", 176),
              G_MTX_NOPUSH | G_MTX_LOAD | G_MTX_MODELVIEW);
    func_80093D18(gfxCtx);
    gDPSetPrimColor(POLY_OPA_DISP++, 0, 0, this->rPrimColorR, this->rPrimColorG, this->rPrimColorB, this->rPrimColorA);
    gDPSetEnvColor(POLY_OPA_DISP++, this->rEnvColorR, this->rEnvColorG, this->rEnvColorB, this->rEnvColorA);
    gSPSegment(POLY_OPA_DISP++, 0x08, this->gfx);
    gSPDisplayList(POLY_OPA_DISP++, SEGMENTED_TO_VIRTUAL(D_0401A160));

    CLOSE_DISPS(gfxCtx, "../z_eff_ss_sibuki.c", 198);
}

void EffectSsSibuki_Update(GlobalContext* globalCtx, u32 index, EffectSs* this) {
    s32 pad[3];
    f32 xzVelScale;
    s16 yaw;
    Player* player = PLAYER;

    if (this->pos.y <= player->actor.groundY) {
        this->life = 0;
    }

    if (this->rMoveDelay != 0) {
        this->rMoveDelay--;

        if (this->rMoveDelay == 0) {
            yaw = Camera_GetInputDirYaw(Gameplay_GetCamera(globalCtx, 0));
            xzVelScale = ((200.0f + KREG(20)) * 0.01f) + ((0.1f * Math_Rand_ZeroOne()) * (KREG(23) + 20.0f));

            if (this->rDirection != 0) {
                xzVelScale *= -1.0f;
            }

            this->velocity.x = Math_Coss(yaw) * xzVelScale;
            this->velocity.z = -Math_Sins(yaw) * xzVelScale;

            this->velocity.y = ((700.0f + KREG(21)) * 0.01f) + ((0.1f * Math_Rand_ZeroOne()) * (KREG(24) + 20.0f));
            this->accel.y = ((-100.0f + KREG(22)) * 0.01f) + ((0.1f * Math_Rand_ZeroOne()) * KREG(25));

            if (KREG(3) != 0) {
                this->velocity.x *= (KREG(3) * 0.01f);
                this->velocity.y *= (KREG(3) * 0.01f);
                this->velocity.z *= (KREG(3) * 0.01f);
                this->accel.y *= (KREG(4) * 0.01f);
            }
        }
    } else {
        if (this->rScale != 0) {
            this->rScale = (this->rScale - KREG(26)) - 3;
        }
    }
}
