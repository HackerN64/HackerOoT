#include "z_bg_jya_cobra.h"
#include "overlays/actors/ovl_Bg_Jya_Bigmirror/z_bg_jya_bigmirror.h"
#include "overlays/actors/ovl_Mir_Ray/z_mir_ray.h"
#include "vt.h"

#define FLAGS 0x00000010

#define THIS ((BgJyaCobra*)thisx)

void BgJyaCobra_Init(Actor* thisx, GlobalContext* globalCtx);
void BgJyaCobra_Destroy(Actor* thisx, GlobalContext* globalCtx);
void BgJyaCobra_Update(Actor* thisx, GlobalContext* globalCtx);
void BgJyaCobra_Draw(Actor* thisx, GlobalContext* globalCtx);

void func_80896918(BgJyaCobra* this, GlobalContext* globalCtx);
void func_80896950(BgJyaCobra* this, GlobalContext* globalCtx);
void func_808969F8(BgJyaCobra* this, GlobalContext* globalCtx);
void func_80896ABC(BgJyaCobra* this, GlobalContext* globalCtx);

extern Gfx D_06010790[];
extern Gfx D_06010C20[];
extern UNK_TYPE D_0601167C;
extern Gfx D_060117D0[];

Vtx D_80897270[] = {
    VTX(-800, 0, -800, 0, 2048, 0xFF, 0xFF, 0xFF, 0xFF),
    VTX(800, 0, -800, 2048, 2048, 0xFF, 0xFF, 0xFF, 0xFF),
    VTX(800, 0, 800, 2048, 0, 0xFF, 0xFF, 0xFF, 0xFF),
    VTX(-800, 0, 800, 0, 0, 0xFF, 0xFF, 0xFF, 0xFF),
};

Gfx D_808972B0[] = {
    gsDPPipeSync(),
    gsDPSetCombineLERP(PRIMITIVE, 0, TEXEL0, 0, TEXEL0, 0, PRIMITIVE, 0, 0, 0, 0, COMBINED, 0, 0, 0, COMBINED),
    gsDPSetRenderMode(AA_EN | Z_CMP | IM_RD | CLR_ON_CVG | CVG_DST_WRAP | ZMODE_DEC | FORCE_BL |
                          GBL_c1(G_BL_CLR_IN, G_BL_0, G_BL_CLR_IN, G_BL_1),
                      G_RM_AA_ZB_XLU_DECAL2),
    gsSPClearGeometryMode(G_CULL_BACK | G_FOG | G_LIGHTING | G_TEXTURE_GEN | G_TEXTURE_GEN_LINEAR),
    gsSPVertex(D_80897270, 4, 0),
    gsSP2Triangles(0, 1, 2, 0, 0, 2, 3, 0),
    gsSPEndDisplayList(),
};

const ActorInit Bg_Jya_Cobra_InitVars = {
    ACTOR_BG_JYA_COBRA,
    ACTORCAT_PROP,
    FLAGS,
    OBJECT_JYA_OBJ,
    sizeof(BgJyaCobra),
    (ActorFunc)BgJyaCobra_Init,
    (ActorFunc)BgJyaCobra_Destroy,
    (ActorFunc)BgJyaCobra_Update,
    (ActorFunc)BgJyaCobra_Draw,
};

s16 D_80897308[] = { 0, 0, 0, 0 };

u8 D_80897310[] = { 1, 0, 1, 0 };

s16 D_80897314[] = { -0x4000, 0000, 0x4000, 0000 };

u8 D_8089731C[11][11] = {
    { 0x00, 0x00, 0x20, 0x80, 0x80, 0x80, 0x80, 0x80, 0x20, 0x00, 0x00 },
    { 0x00, 0x20, 0x80, 0xA0, 0xA3, 0xA3, 0xA3, 0xA0, 0x80, 0x20, 0x00 },
    { 0x20, 0x80, 0xA0, 0xA5, 0xA6, 0xA6, 0xA6, 0xA5, 0xA0, 0x80, 0x20 },
    { 0x80, 0xA0, 0xA5, 0xA6, 0xA6, 0xA6, 0xA6, 0xA6, 0xA5, 0xA0, 0x80 },
    { 0x80, 0xA3, 0xA6, 0xA6, 0xA6, 0xA6, 0xA6, 0xA6, 0xA6, 0xA3, 0x80 },
    { 0x80, 0xA3, 0xA6, 0xA6, 0xA6, 0xA6, 0xA6, 0xA6, 0xA6, 0xA3, 0x80 },
    { 0x80, 0xA3, 0xA6, 0xA6, 0xA6, 0xA6, 0xA6, 0xA6, 0xA6, 0xA3, 0x80 },
    { 0x80, 0xA0, 0xA5, 0xA6, 0xA6, 0xA6, 0xA6, 0xA6, 0xA5, 0xA0, 0x80 },
    { 0x20, 0x80, 0xA0, 0xA5, 0xA6, 0xA6, 0xA6, 0xA5, 0xA0, 0x80, 0x20 },
    { 0x00, 0x20, 0x80, 0xA0, 0xA3, 0xA3, 0xA3, 0xA0, 0x80, 0x20, 0x00 },
    { 0x00, 0x00, 0x20, 0x80, 0x80, 0x80, 0x80, 0x80, 0x20, 0x00, 0x00 },
};

u8 D_80897398[3][3] = {
    { 0x20, 0x80, 0x20 },
    { 0x80, 0xA0, 0x80 },
    { 0x20, 0x80, 0x20 },
};

Vec3f D_808973A4[] = {
    { -6.0f, 100.0f, 7.6f },
    { -12.6f, 69.200005f, -10.0f },
    { -9.0f, 43.0f, -1.0f },
    { -3.0f, 15.0f, 8.6f },
    { -8.6f, 15.0f, 13.5f },
    { -6.6f, 26.0f, 11.6f },
    { -12.5f, 43.0f, 8.0f },
    { -17.2f, 70.0f, 0.6f },
    { -8.0f, 100.0f, 7.6f },
    { 6.0f, 100.0f, 7.6f },
    { 12.6f, 69.200005f, -10.0f },
    { 9.0f, 43.0f, -1.0f },
    { 3.0f, 15.0f, 8.6f },
    { 8.6f, 15.0f, 13.5f },
    { 6.6f, 26.0f, 11.6f },
    { 12.5f, 43.0f, 8.0f },
    { 17.2f, 70.0f, 0.6f },
    { 8.0f, 100.0f, 7.6f },
    { 0.0f, 70.0f, -11.3f },
    { 0.0f, 44.6000023f, -2.0f },
    { 0.0f, 15.0f, 10.6f },
    { 0.0f, 15.0f, 0.3f },
    { 0.0f, 26.0f, 11.6f },
    { 0.0f, 88.4f, -1.4f },
    { 0.0f, 95.700005f, 14.900001f },
    { 0.0f, 101.4f, 5.0f },
};

Vec3f D_808974DC[] = {
    { 12.0f, 21.3000011f, -2.5f },  { 30.0f, 21.3000011f, -2.5f }, { -15.0f, 21.3000011f, -2.5f },
    { -30.0f, 21.3000011f, -2.5f }, { 12.0f, 21.3000011f, -2.5f },
};

s32 D_80897518[] = { 0x80, 0xA0, 0xA0, 0x80 };

InitChainEntry D_80897528[] = {
    ICHAIN_VEC3F_DIV1000(scale, 100, ICHAIN_CONTINUE),
    ICHAIN_F32(uncullZoneForward, 1000, ICHAIN_CONTINUE),
    ICHAIN_F32(uncullZoneScale, 800, ICHAIN_CONTINUE),
    ICHAIN_F32(uncullZoneDownward, 1000, ICHAIN_STOP),
};

Vec3s D_80897538 = { 0, -0x4000, 0 };

Vec3s D_80897540 = { 0, 0x4000, 0 };

Vec3f D_80897548[] = {
    { 0.1f, 0.1f, 0.1f },
    { 0.072f, 0.072f, 0.072f },
    { 0.1f, 0.1f, 0.132f },
};

void func_808958F0(Vec3f* dest, Vec3f* src, f32 arg2, f32 arg3) {
    dest->x = (src->z * arg2) + (src->x * arg3);
    dest->y = src->y;
    dest->z = (src->z * arg3) - (src->x * arg2);
}

void BgJyaCobra_InitDynapoly(BgJyaCobra* this, GlobalContext* globalCtx, void* arg2, DynaPolyMoveFlag flags) {
    s32 pad;
    CollisionHeader* colHeader = NULL;
    s32 pad2;

    DynaPolyActor_Init(&this->dyna, flags);
    CollisionHeader_GetVirtual(arg2, &colHeader);
    this->dyna.bgId = DynaPoly_SetBgActor(globalCtx, &globalCtx->colCtx.dyna, &this->dyna.actor, colHeader);
    if (this->dyna.bgId == BG_ACTOR_MAX) {
        // Warning : move BG Registration Failure
        osSyncPrintf("Warning : move BG 登録失敗(%s %d)(name %d)(arg_data 0x%04x)\n", "../z_bg_jya_cobra.c", 247,
                     this->dyna.actor.id, this->dyna.actor.params);
    }
}

void BgJyaCobra_SpawnRay(BgJyaCobra* this, GlobalContext* globalCtx) {
    Actor_SpawnAsChild(&globalCtx->actorCtx, &this->dyna.actor, globalCtx, ACTOR_MIR_RAY, this->dyna.actor.world.pos.x,
                       this->dyna.actor.world.pos.y + 57.0f, this->dyna.actor.world.pos.z, 0, 0, 0, 6);
    if (this->dyna.actor.child == NULL) {
        osSyncPrintf(VT_FGCOL(RED));
        //  	Ｅｒｒｏｒ : Mir Ray occurrence failure
        osSyncPrintf("Ｅｒｒｏｒ : Mir Ray 発生失敗 (%s %d)\n", "../z_bg_jya_cobra.c", 270);
        osSyncPrintf(VT_RST);
    }
}

#ifdef NON_MATCHING
// minor register and stack diffs
void func_80895A70(BgJyaCobra* this) {
    s32 pad;
    BgJyaBigmirror* temp_v1;
    MirRay* phi_v0;
    Vec3f sp28;
    MirRay* temp;

    temp_v1 = (BgJyaBigmirror*)this->dyna.actor.parent;

    switch (this->dyna.actor.params & 3) {
        case 0:
            temp = (MirRay*)this->dyna.actor.child;
            if (this->dyna.actor.child != NULL) {
                phi_v0 = temp;
                if (phi_v0->actor.update == NULL) {
                    this->dyna.actor.child = NULL;
                    return;
                }
            } else {
                return;
            }
            break;
        case 1:
            phi_v0 = temp_v1->lightBeams[1];
            if (phi_v0 == NULL) {
                return;
            }
            break;
        case 2:
            phi_v0 = temp_v1->lightBeams[2];
            if (phi_v0 == NULL) {
                return;
            }
            break;
    }

    if (this->unk_18C <= 0.0f) {
        phi_v0->unLit = 1;
        return;
    }

    phi_v0->unLit = 0;
    Math_Vec3f_Copy(&phi_v0->sourcePt, &this->unk_180);
    Matrix_RotateY(this->dyna.actor.shape.rot.y * (M_PI / 0x8000), MTXMODE_NEW);
    Matrix_RotateX(D_80897308[this->dyna.actor.params & 3] * (M_PI / 0x8000), MTXMODE_APPLY);
    sp28.x = 0.0f;
    sp28.y = 0.0;
    sp28.z = this->unk_190 * 2800.0f;
    Matrix_MultVec3f(&sp28, &phi_v0->poolPt);
    Math_Vec3f_Sum(&phi_v0->sourcePt, &phi_v0->poolPt, &phi_v0->poolPt);
}
#else
#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Bg_Jya_Cobra/func_80895A70.s")
#endif

void func_80895BEC(BgJyaCobra* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;
    s32 pad;
    Vec3f sp2C;

    func_808958F0(&sp2C, &this->unk_174, Math_SinS(this->unk_170), Math_CosS(this->unk_170));
    player->actor.world.pos.x = this->dyna.actor.world.pos.x + sp2C.x;
    player->actor.world.pos.y = this->dyna.actor.world.pos.y + sp2C.y;
    player->actor.world.pos.z = this->dyna.actor.world.pos.z + sp2C.z;
}

#ifdef NON_MATCHING
// Small stack diffs
void func_80895C74(BgJyaCobra* this, GlobalContext* globalCtx) {
    s16 phi_v0;
    s32 params = this->dyna.actor.params;
    BgJyaBigmirror* parent = (BgJyaBigmirror*)this->dyna.actor.parent;
    f32 phi_f0;

    if ((params & 3) == 2 && parent != NULL &&
        (!(parent->puzzleFlags & BIGMIR_PUZZLE_BOMBIWA_DESTROYED) ||
         !(parent->puzzleFlags & BIGMIR_PUZZLE_COBRA1_SOLVED))) {
        Math_StepToF(&this->unk_18C, 0.0f, 0.05f);
    } else {
        this->unk_18C = 1.0f;
        if (D_80897310[(params & 3)] != 0) {
            phi_v0 = this->dyna.actor.shape.rot.y - D_80897314[(params & 3)];
            phi_v0 = ABS(phi_v0);
            if (phi_v0 < 0x2000 && phi_v0 != -0x8000) {
                this->unk_18C += ((phi_v0 - 0x2000) * 0.00018310547f);
                if (this->unk_18C < 0.0f) {
                    this->unk_18C = 0.0f;
                }
            }
        }
    }

    this->unk_180.x = this->dyna.actor.world.pos.x;
    this->unk_180.y = this->dyna.actor.world.pos.y + 57.0f;
    this->unk_180.z = this->dyna.actor.world.pos.z;

    if (!(params & 3)) {
        this->unk_190 = 0.1f;
    } else if ((params & 3) == 1) {
        phi_f0 = 0.1f;
        phi_v0 = this->dyna.actor.shape.rot.y - 0x8000;
        if (phi_v0 < 0x500 && phi_v0 > -0x500) {
            phi_f0 = 0.34f;
        } else {
            phi_v0 = this->dyna.actor.shape.rot.y - 0x4000;
            if (phi_v0 < 0x500 && phi_v0 > -0x500 && parent != NULL &&
                (parent->puzzleFlags & BIGMIR_PUZZLE_BOMBIWA_DESTROYED)) {
                phi_f0 = 0.34f;
            }
        }
        Math_StepToF(&this->unk_190, phi_f0, 0.04f);
    } else if ((params & 3) == 2) {
        phi_f0 = 0.1f;
        phi_v0 = this->dyna.actor.shape.rot.y - 0x8000;
        if (phi_v0 < 0x500 && phi_v0 > -0x500) {
            phi_f0 = 0.34f;
        } else {
            phi_v0 = this->dyna.actor.shape.rot.y + 0xFFFF4000;
            if (phi_v0 < 0x500 && phi_v0 > -0x500) {
                phi_f0 = 0.34f;
            }
        }
        Math_StepToF(&this->unk_190, phi_f0, 0.04f);
    }
}
#else
#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Bg_Jya_Cobra/func_80895C74.s")
#endif

#ifdef NON_MATCHING
// Repeatedly calculates temp_z * 0x40 for temp_s2[temp_z] rather than calculating it once when temp_z is assigned.
// Making temp_z volatile or accessing through a pointer variable in if (!(temp_z & ~0x3F)) fix the above issue but are
// obviously wrong.
/*
 * Updates the shadow with light coming from the side of the mirror
 */
void BgJyaCobra_UpdateShadowFromSide(BgJyaCobra* this) {
    Vec3f spD4;
    Vec3f spC8;
    Vec3f spBC;
    u8(*temp_s2)[0x40];
    s32 temp_x;
    s32 temp_z;
    s32 x;
    s32 z;
    s32 i;
    s32 j;
    s32 k;
    s32 l;

    temp_s2 = (u8(*)[0x40])ALIGN16((s32)(&this->shadowTexture));
    Lib_MemSet((u8*)temp_s2, 0x1000, 0);

    Matrix_RotateX((M_PI / 4), MTXMODE_NEW);
    Matrix_RotateY((!(this->dyna.actor.params & 3) ? (s16)(this->dyna.actor.shape.rot.y + 0x4000)
                                                   : (s16)(this->dyna.actor.shape.rot.y - 0x4000)) *
                       (M_PI / 0x8000),
                   MTXMODE_APPLY);
    Matrix_Scale(0.9f, 0.9f, 0.9f, MTXMODE_APPLY);

    for (i = 0; i < 25; i++) {
        Math_Vec3f_Diff(&D_808973A4[i + 1], &D_808973A4[i], &spD4);
        spD4.x *= 0.5f;
        spD4.y *= 0.5f;
        spD4.z *= 0.5f;
        for (j = 0; j < 2; j++) {
            spC8.x = D_808973A4[i].x + (spD4.x * j);
            spC8.y = D_808973A4[i].y + (spD4.y * j);
            spC8.z = D_808973A4[i].z + (spD4.z * j);
            Matrix_MultVec3f(&spC8, &spBC);
            x = (s32)(((spBC.x + 50.0f) * 0.64f) + 0.5f);
            z = (s32)(((88.0f - spBC.z) * 0.64f) + 0.5f);
            for (k = 0; k < 11; k++) {
                temp_z = z - 5 + k;
                if (!(temp_z & ~0x3F)) {
                    for (l = 0; l < 11; l++) {
                        temp_x = (x - 5 + l);
                        if (!(temp_x & ~0x3F)) {
                            temp_s2[temp_z][temp_x] |= D_8089731C[k][l];
                        }
                    }
                }
            }
        }
    }

    for (i = 0; i < 4; i++) {
        Math_Vec3f_Diff(&D_808974DC[i + 1], &D_808974DC[i], &spD4);
        spD4.x = spD4.x * 0.2f;
        spD4.y = spD4.y * 0.2f;
        spD4.z = spD4.z * 0.2f;
        for (j = 0; j < 5; j++) {
            spC8.x = D_808974DC[i].x + (spD4.x * j);
            spC8.y = D_808974DC[i].y + (spD4.y * j);
            spC8.z = D_808974DC[i].z + (spD4.z * j);
            Matrix_MultVec3f(&spC8, &spBC);
            x = (s32)(((spBC.x + 50.0f) * 0.64f) + 0.5f);
            z = (s32)(((88.0f - spBC.z) * 0.64f) + 0.5f);
            for (k = 0; k < 3; k++) {
                temp_z = z - 1 + k;
                if (!(temp_z & ~0x3F)) {
                    for (l = 0; l < 3; l++) {
                        temp_x = x - 1 + l;
                        if (!(temp_x & ~0x3F)) {
                            temp_s2[temp_z][temp_x] |= D_80897398[k][l];
                        }
                    }
                }
            }
        }
    }

    for (i = 0; i < 0x40; i++) {
        temp_s2[0][i] = 0;
        temp_s2[0x3F][i] = 0;
    }

    for (j = 1; j < 0x3F; j++) {
        temp_s2[j][0] = 0;
        temp_s2[j][0x3F] = 0;
    }
}
#else
#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Bg_Jya_Cobra/BgJyaCobra_UpdateShadowFromSide.s")
#endif

#ifdef NON_MATCHING
// minor register and stack diffs
/*
 * Updates the shadow with light coming from above the mirror
 */
void BgJyaCobra_UpdateShadowFromTop(BgJyaCobra* this) {
    f32 sp58[0x40];
    f32 temp_f12;
    f32 temp_f2;
    u8* temp_s0;
    s32 i_copy;
    u8* phi_a3;
    s32 counter;
    s32 i;
    s32 j;

    for (i = 0; i < 0x40; i++) {
        sp58[i] = SQ(i - 31.5f);
    }

    temp_s0 = (u8*)ALIGN16((s32)(&this->shadowTexture));
    phi_a3 = temp_s0;
    Lib_MemSet(temp_s0, 0x1000, 0);

    for (i = 0; i != 0x40; i++) {
        temp_f12 = sp58[i];
        for (j = 0; j < 0x40; j++) {
            temp_f2 = (sp58[j] * 0.5f) + temp_f12;
            if (temp_f2 < 300.0f) {
                *phi_a3 |= CLAMP_MAX(640 - (s32)(temp_f2 * 2.0f), 166);
            }
            phi_a3++;
        }
    }

    for (counter = 0, i = 0x780; counter < 4; counter++, i += 0x40) {
        i_copy = i;
        for (j = 4; j < 0x3C; j++) {
            if (temp_s0[i + j] < D_80897518[counter]) {
                temp_s0[i + j] = D_80897518[counter];
            }
        }
        temp_s0[i_copy + 0x3C] = 0x20;
        temp_s0[i_copy + 0x3] = 0x20;
    }
}
#else
#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Bg_Jya_Cobra/BgJyaCobra_UpdateShadowFromTop.s")
#endif

void BgJyaCobra_Init(Actor* thisx, GlobalContext* globalCtx) {
    BgJyaCobra* this = THIS;

    BgJyaCobra_InitDynapoly(this, globalCtx, &D_0601167C, DPM_UNK);
    Actor_ProcessInitChain(&this->dyna.actor, D_80897528);
    if (!(this->dyna.actor.params & 3) && Flags_GetSwitch(globalCtx, ((s32)this->dyna.actor.params >> 8) & 0x3F)) {
        this->dyna.actor.world.rot.y = this->dyna.actor.home.rot.y = this->dyna.actor.shape.rot.y = 0;
    }

    if (!(this->dyna.actor.params & 3)) {
        BgJyaCobra_SpawnRay(this, globalCtx);
    }

    func_80896918(this, globalCtx);

    if ((this->dyna.actor.params & 3) == 1 || (this->dyna.actor.params & 3) == 2) {
        this->dyna.actor.room = -1;
    }

    if ((this->dyna.actor.params & 3) == 1) {
        BgJyaCobra_UpdateShadowFromTop(this);
    }

    // (jya cobra)
    osSyncPrintf("(jya コブラ)(arg_data 0x%04x)(act %x)(txt %x)(txt16 %x)\n", this->dyna.actor.params, this,
                 &this->shadowTexture, ALIGN16((s32)(&this->shadowTexture)));
}

void BgJyaCobra_Destroy(Actor* thisx, GlobalContext* globalCtx) {
    BgJyaCobra* this = THIS;

    DynaPoly_DeleteBgActor(globalCtx, &globalCtx->colCtx.dyna, this->dyna.bgId);
}

void func_80896918(BgJyaCobra* this, GlobalContext* globalCtx) {
    this->actionFunc = &func_80896950;
    this->unk_168 = 0;
    this->dyna.actor.shape.rot.y = this->dyna.actor.world.rot.y =
        (s16)((this->unk_16C << 0xD) + this->dyna.actor.home.rot.y);
}

void func_80896950(BgJyaCobra* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;

    if (this->dyna.unk_150 > 0.001f) {
        this->unk_168++;
        if (this->unk_168 >= 15) {
            func_808969F8(this, globalCtx);
        }
    } else {
        this->unk_168 = 0;
    }

    if (fabsf(this->dyna.unk_150) > 0.001f) {
        this->dyna.unk_150 = 0.0f;
        player->stateFlags2 &= ~0x10;
    }
}

void func_808969F8(BgJyaCobra* this, GlobalContext* globalCtx) {
    Player* player;
    s32 phi_a3;
    s16 temp2;

    player = PLAYER;
    this->actionFunc = func_80896ABC;
    temp2 = this->dyna.actor.yawTowardsPlayer - this->dyna.actor.shape.rot.y;
    phi_a3 = (s16)(this->dyna.actor.shape.rot.y - this->dyna.unk_158);
    phi_a3 = ABS(phi_a3);

    if (temp2 > 0) {
        if (phi_a3 > 0x4000) {
            this->unk_16A = 1;
        } else {
            this->unk_16A = -1;
        }
    } else {
        if (phi_a3 > 0x4000) {
            this->unk_16A = -1;
        } else {
            this->unk_16A = 1;
        }
    }

    this->unk_174.x = player->actor.world.pos.x - this->dyna.actor.world.pos.x;
    this->unk_174.y = player->actor.world.pos.y - this->dyna.actor.world.pos.y;
    this->unk_174.z = player->actor.world.pos.z - this->dyna.actor.world.pos.z;
    this->unk_170 = this->unk_16E = 0;
    this->unk_172 = 1;
}

void func_80896ABC(BgJyaCobra* this, GlobalContext* globalCtx) {
    s16 temp_v0;
    Player* player;

    player = PLAYER;

    temp_v0 = (s16)((this->unk_16C << 0xD) + this->dyna.actor.home.rot.y) - this->dyna.actor.world.rot.y;
    if (ABS(temp_v0) < 7424) {
        Math_StepToS(&this->unk_16E, 106, 4);
    } else {
        Math_StepToS(&this->unk_16E, 21, 10);
    }

    if (Math_ScaledStepToS(&this->unk_170, (s16)(this->unk_16A << 0xd), this->unk_16E) != 0) {
        this->unk_16C = (this->unk_16C + this->unk_16A) & 7;
        player->stateFlags2 &= ~0x10;
        this->dyna.unk_150 = 0.0f;
        func_80896918(this, globalCtx);
    } else {
        temp_v0 = (this->unk_16C << 0xD) + this->dyna.actor.home.rot.y + this->unk_170;
        this->dyna.actor.world.rot.y = temp_v0;
        this->dyna.actor.shape.rot.y = temp_v0;
    }

    if (player->stateFlags2 & 0x10) {
        if (this->unk_172 != 0) {
            func_80895BEC(this, globalCtx);
        }
    } else if (fabsf(this->dyna.unk_150) < 0.001f) {
        this->unk_172 = 0;
    }

    this->dyna.unk_150 = 0.0f;
    func_8002F974(&this->dyna.actor, 0x200A);
}

void BgJyaCobra_Update(Actor* thisx, GlobalContext* globalCtx) {
    BgJyaCobra* this = THIS;
    s32 params;

    this->actionFunc(this, globalCtx);

    func_80895C74(this, globalCtx);
    func_80895A70(this);

    params = this->dyna.actor.params & 3;
    if (params == 0 || params == 2) {
        BgJyaCobra_UpdateShadowFromSide(this);
    }
}

void func_80896CB4(GlobalContext* globalCtx) {
    OPEN_DISPS(globalCtx->state.gfxCtx, "../z_bg_jya_cobra.c", 864);

    func_80093D84(globalCtx->state.gfxCtx);
    gSPMatrix(POLY_XLU_DISP++, Matrix_NewMtx(globalCtx->state.gfxCtx, "../z_bg_jya_cobra.c", 867),
              G_MTX_NOPUSH | G_MTX_LOAD | G_MTX_MODELVIEW);
    gSPDisplayList(POLY_XLU_DISP++, D_06010C20);

    CLOSE_DISPS(globalCtx->state.gfxCtx, "../z_bg_jya_cobra.c", 872);
}

void func_80896D78(BgJyaCobra* this, GlobalContext* globalCtx) {
    s32 pad;
    Vec3s sp44;

    OPEN_DISPS(globalCtx->state.gfxCtx, "../z_bg_jya_cobra.c", 924);
    func_80093D84(globalCtx->state.gfxCtx);

    sp44.x = D_80897308[this->dyna.actor.params & 3] + this->dyna.actor.shape.rot.x;
    sp44.y = this->dyna.actor.shape.rot.y;
    sp44.z = this->dyna.actor.shape.rot.z;
    func_800D1694(this->unk_180.x, this->unk_180.y, this->unk_180.z, &sp44);

    Matrix_Scale(0.1f, 0.1f, this->unk_190, MTXMODE_APPLY);
    gSPMatrix(POLY_XLU_DISP++, Matrix_NewMtx(globalCtx->state.gfxCtx, "../z_bg_jya_cobra.c", 939),
              G_MTX_NOPUSH | G_MTX_LOAD | G_MTX_MODELVIEW);
    gDPSetPrimColor(POLY_XLU_DISP++, 0, 0, 255, 255, 255, (s32)(this->unk_18C * 140.0f));
    gSPDisplayList(POLY_XLU_DISP++, D_060117D0);

    CLOSE_DISPS(globalCtx->state.gfxCtx, "../z_bg_jya_cobra.c", 947);
}

void BgJyaCobra_DrawShadow(BgJyaCobra* this, GlobalContext* globalCtx) {
    u32 pad;
    s16 params;
    Vec3f sp64;
    Vec3s* phi_a3;

    if (1) {}

    params = this->dyna.actor.params & 3;

    OPEN_DISPS(globalCtx->state.gfxCtx, "../z_bg_jya_cobra.c", 966);

    func_80094044(globalCtx->state.gfxCtx);

    if (params == 0) {
        sp64.x = this->dyna.actor.world.pos.x - 50.0f;
        sp64.y = this->dyna.actor.world.pos.y;
        sp64.z = this->dyna.actor.world.pos.z;
        phi_a3 = &D_80897538;
    } else {
        phi_a3 = &this->dyna.actor.shape.rot;
        if (params == 2) {
            sp64.x = this->dyna.actor.world.pos.x + 70.0f;
            sp64.y = this->dyna.actor.world.pos.y;
            sp64.z = this->dyna.actor.world.pos.z;
            phi_a3 = &D_80897540;
            // params == 1
        } else {
            Math_Vec3f_Copy(&sp64, &this->dyna.actor.world.pos);
        }
    }
    func_800D1694(sp64.x, sp64.y, sp64.z, phi_a3);

    Matrix_Scale(D_80897548[params].x, D_80897548[params].y, D_80897548[params].z, MTXMODE_APPLY);
    Matrix_Translate(0.0f, 0.0f, 40.0f, MTXMODE_APPLY);

    gDPSetPrimColor(POLY_XLU_DISP++, 0, 0, 0, 0, 0, 120);
    gSPMatrix(POLY_XLU_DISP++, Matrix_NewMtx(globalCtx->state.gfxCtx, "../z_bg_jya_cobra.c", 994),
              G_MTX_NOPUSH | G_MTX_LOAD | G_MTX_MODELVIEW);

    gDPLoadTextureBlock(POLY_XLU_DISP++, ALIGN16((s32)(&this->shadowTexture)), G_IM_FMT_I, G_IM_SIZ_8b, 0x40, 0x40, 0,
                        G_TX_NOMIRROR | G_TX_CLAMP, G_TX_NOMIRROR | G_TX_CLAMP, G_TX_NOMASK, G_TX_NOMASK, G_TX_NOLOD,
                        G_TX_NOLOD);

    gSPDisplayList(POLY_XLU_DISP++, D_808972B0);

    CLOSE_DISPS(globalCtx->state.gfxCtx, "../z_bg_jya_cobra.c", 1006);
}

void BgJyaCobra_Draw(Actor* thisx, GlobalContext* globalCtx) {
    BgJyaCobra* this = THIS;

    func_80896CB4(globalCtx);
    Gfx_DrawDListOpa(globalCtx, D_06010790);

    if (this->unk_18C > 0.0f) {
        func_80896D78(this, globalCtx);
    }

    if ((this->dyna.actor.params & 3) == 2) {
        BgJyaBigmirror* mirror = (BgJyaBigmirror*)this->dyna.actor.parent;

        if (mirror != NULL && (mirror->puzzleFlags & BIGMIR_PUZZLE_BOMBIWA_DESTROYED) &&
            (mirror->puzzleFlags & BIGMIR_PUZZLE_COBRA1_SOLVED)) {
            BgJyaCobra_DrawShadow(this, globalCtx);
        }
    } else {
        BgJyaCobra_DrawShadow(this, globalCtx);
    }
}
