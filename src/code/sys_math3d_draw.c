#include "sys_math3d.h"
#include "play_state.h"
#include "gfx.h"
#include "sys_matrix.h"
#include "libc64/math64.h"
#include "z_lib.h"

#if DEBUG_FEATURES
void Math3D_VtxF2L(Vtx* r, Vec3f* v) {
    r->n.ob[0] = Math_FFloorF(0.5f + v->x * 128.0f);
    r->n.ob[1] = Math_FFloorF(0.5f + v->y * 128.0f);
    r->n.ob[2] = Math_FFloorF(0.5f + v->z * 128.0f);
    r->n.flag = 0;
    r->n.tc[0] = 0;
    r->n.tc[1] = 0;
    r->n.n[0] = v->x * 127.0f;
    r->n.n[1] = v->y * 127.0f;
    r->n.n[2] = v->z * 127.0f;
    r->n.a = 0xFF;
}

void Math3D_IcoSphSubdivideEdge(Vec3f* r, Vec3f* a, Vec3f* b) {
    Math_Vec3f_Sum(a, b, r);
    Math_Vec3f_Scale(r, 1.0f / Math3D_Vec3fMagnitude(r));
}

static Gfx sPolyGfxInit[] = {
    gsSPLoadGeometryMode(G_ZBUFFER | G_SHADE | G_LIGHTING),
    gsSPTexture(0, 0, 0, G_TX_RENDERTILE, G_OFF),
    gsDPPipeSync(),
    gsDPSetCycleType(G_CYC_1CYCLE),
    gsDPSetRenderMode(
        Z_CMP | IM_RD | CVG_DST_FULL | FORCE_BL | ZMODE_XLU | GBL_c1(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA),
        Z_CMP | IM_RD | CVG_DST_FULL | FORCE_BL | ZMODE_XLU | GBL_c2(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_1MA)),
    gsDPSetCombineLERP(PRIMITIVE, 0, SHADE, 0, 0, 0, 0, ENVIRONMENT, PRIMITIVE, 0, SHADE, 0, 0, 0, 0, ENVIRONMENT),
    gsDPSetEnvColor(255, 255, 255, 128),
    gsSPEndDisplayList(),
};

void Math3D_DrawSphereImpl(GraphicsContext* gfxCtx, Gfx** gfxP, f32 x, f32 y, f32 z, f32 radius) {
    static Gfx* pSphGfx = NULL;
    static Vtx sphVtx[42];
    static Gfx sphGfx[45];

    Gfx* sphGfxP;
    s32 i;

    if (!pSphGfx) {
        Vec3f vtx[42];
        s32 r0n = 1, r0m = r0n / 5, r0i = 0 + 0;
        s32 r1n = 5, r1m = r1n / 5, r1i = r0i + r0n;
        s32 r2n = 10, r2m = r2n / 5, r2i = r1i + r1n;
        s32 r3n = 10, r3m = r3n / 5, r3i = r2i + r2n;
        s32 r4n = 10, r4m = r4n / 5, r4i = r3i + r3n;
        s32 r5n = 5, r5m = r5n / 5, r5i = r4i + r4n;
        s32 r6n = 1, r6m = r6n / 5, r6i = r5i + r5n;

        vtx[r0i + (0 * r0m + 0) % r0n].x = 0.0f;
        vtx[r0i + (0 * r0m + 0) % r0n].y = 1.0f;
        vtx[r0i + (0 * r0m + 0) % r0n].z = 0.0f;

        vtx[r6i + (0 * r6m + 0) % r6n].x = 0.0f;
        vtx[r6i + (0 * r6m + 0) % r6n].y = -1.0f;
        vtx[r6i + (0 * r6m + 0) % r6n].z = 0.0f;

        for (i = 0; i < 5; ++i) {
            static const f32 aXZ = 2.0f * M_PI / 10.0f;
            static const f32 aY = 0.463647609f; // Math_FAtanF(1.0f / 2.0f);

            vtx[r2i + (i * r2m + 0) % r2n].x = cosf(aXZ * (i * r2m + 0)) * cosf(aY * 1.0f);
            vtx[r2i + (i * r2m + 0) % r2n].y = sinf(aY * 1.0f);
            vtx[r2i + (i * r2m + 0) % r2n].z = -sinf(aXZ * (i * r2m + 0)) * cosf(aY * 1.0f);

            vtx[r4i + (i * r4m + 0) % r4n].x = cosf(aXZ * (i * r4m + 1)) * cosf(aY * -1.0f);
            vtx[r4i + (i * r4m + 0) % r4n].y = sinf(aY * -1.0f);
            vtx[r4i + (i * r4m + 0) % r4n].z = -sinf(aXZ * (i * r4m + 1)) * cosf(aY * -1.0f);
        }

        for (i = 0; i < 5; ++i) {
            Math3D_IcoSphSubdivideEdge(&vtx[r1i + (i * r1m + 0) % r1n], &vtx[r0i + (i * r0m + 0) % r0n],
                                       &vtx[r2i + (i * r2m + 0) % r2n]);
            Math3D_IcoSphSubdivideEdge(&vtx[r2i + (i * r2m + 1) % r2n], &vtx[r2i + (i * r2m + 0) % r2n],
                                       &vtx[r2i + (i * r2m + 2) % r2n]);
            Math3D_IcoSphSubdivideEdge(&vtx[r3i + (i * r3m + 0) % r3n], &vtx[r2i + (i * r2m + 0) % r2n],
                                       &vtx[r4i + (i * r4m + 0) % r4n]);
            Math3D_IcoSphSubdivideEdge(&vtx[r3i + (i * r3m + 1) % r3n], &vtx[r4i + (i * r4m + 0) % r4n],
                                       &vtx[r2i + (i * r2m + 2) % r2n]);
            Math3D_IcoSphSubdivideEdge(&vtx[r4i + (i * r4m + 1) % r4n], &vtx[r4i + (i * r4m + 0) % r4n],
                                       &vtx[r4i + (i * r4m + 2) % r4n]);
            Math3D_IcoSphSubdivideEdge(&vtx[r5i + (i * r5m + 0) % r5n], &vtx[r4i + (i * r4m + 0) % r4n],
                                       &vtx[r6i + (i * r6m + 0) % r6n]);
        }

        for (i = 0; i < 42; ++i) {
            Math3D_VtxF2L(&sphVtx[i], &vtx[i]);
        }

        sphGfxP = pSphGfx = sphGfx;

        gSPSetGeometryMode(sphGfxP++, G_CULL_BACK | G_SHADING_SMOOTH);
        gSPVertex(sphGfxP++, &sphVtx[r0i], r0n + r1n + r2n + r3n, r0i - r0i);

        r3i -= r0i;
        r2i -= r0i;
        r1i -= r0i;
        r0i -= r0i;

        for (i = 0; i < 5; ++i) {
            s32 v[24];

            v[0] = r0i + (i * r0m + 0) % r0n;
            v[1] = r1i + (i * r1m + 0) % r1n;
            v[2] = r1i + (i * r1m + 1) % r1n;
            v[3] = r1i + (i * r1m + 0) % r1n;
            v[4] = r2i + (i * r2m + 0) % r2n;
            v[5] = r2i + (i * r2m + 1) % r2n;
            v[6] = r1i + (i * r1m + 0) % r1n;
            v[7] = r2i + (i * r2m + 1) % r2n;
            v[8] = r1i + (i * r1m + 1) % r1n;
            v[9] = r1i + (i * r1m + 1) % r1n;
            v[10] = r2i + (i * r2m + 1) % r2n;
            v[11] = r2i + (i * r2m + 2) % r2n;
            v[12] = r2i + (i * r2m + 0) % r2n;
            v[13] = r3i + (i * r3m + 0) % r3n;
            v[14] = r2i + (i * r2m + 1) % r2n;
            v[15] = r2i + (i * r2m + 1) % r2n;
            v[16] = r3i + (i * r3m + 0) % r3n;
            v[17] = r3i + (i * r3m + 1) % r3n;
            v[18] = r2i + (i * r2m + 1) % r2n;
            v[19] = r3i + (i * r3m + 1) % r3n;
            v[20] = r2i + (i * r2m + 2) % r2n;
            v[21] = r2i + (i * r2m + 2) % r2n;
            v[22] = r3i + (i * r3m + 1) % r3n;
            v[23] = r3i + (i * r3m + 2) % r3n;

            gSP2Triangles(sphGfxP++, v[0], v[1], v[2], 0, v[3], v[4], v[5], 0);
            gSP2Triangles(sphGfxP++, v[6], v[7], v[8], 0, v[9], v[10], v[11], 0);
            gSP2Triangles(sphGfxP++, v[12], v[13], v[14], 0, v[15], v[16], v[17], 0);
            gSP2Triangles(sphGfxP++, v[18], v[19], v[20], 0, v[21], v[22], v[23], 0);
        }

        gSPVertex(sphGfxP++, &sphVtx[r4i], r4n + r5n + r6n, r4i - r4i);

        r6i -= r4i;
        r5i -= r4i;
        r4i -= r4i;

        for (i = 0; i < 5; ++i) {
            s32 v[24];

            v[0] = r3i + (i * r3m + 1) % r3n;
            v[1] = r4i + (i * r4m + 0) % r4n;
            v[2] = r4i + (i * r4m + 1) % r4n;
            v[3] = r3i + (i * r3m + 1) % r3n;
            v[4] = r4i + (i * r4m + 1) % r4n;
            v[5] = r3i + (i * r3m + 2) % r3n;
            v[6] = r3i + (i * r3m + 2) % r3n;
            v[7] = r4i + (i * r4m + 1) % r4n;
            v[8] = r4i + (i * r4m + 2) % r4n;
            v[9] = r3i + (i * r3m + 2) % r3n;
            v[10] = r4i + (i * r4m + 2) % r4n;
            v[11] = r3i + (i * r3m + 3) % r3n;
            v[12] = r4i + (i * r4m + 0) % r4n;
            v[13] = r5i + (i * r5m + 0) % r5n;
            v[14] = r4i + (i * r4m + 1) % r4n;
            v[15] = r4i + (i * r4m + 1) % r4n;
            v[16] = r5i + (i * r5m + 0) % r5n;
            v[17] = r5i + (i * r5m + 1) % r5n;
            v[18] = r4i + (i * r4m + 1) % r4n;
            v[19] = r5i + (i * r5m + 1) % r5n;
            v[20] = r4i + (i * r4m + 2) % r4n;
            v[21] = r5i + (i * r5m + 0) % r5n;
            v[22] = r6i + (i * r6m + 0) % r6n;
            v[23] = r5i + (i * r5m + 1) % r5n;

            gSP2Triangles(sphGfxP++, v[0], v[1], v[2], 0, v[3], v[4], v[5], 0);
            gSP2Triangles(sphGfxP++, v[6], v[7], v[8], 0, v[9], v[10], v[11], 0);
            gSP2Triangles(sphGfxP++, v[12], v[13], v[14], 0, v[15], v[16], v[17], 0);
            gSP2Triangles(sphGfxP++, v[18], v[19], v[20], 0, v[21], v[22], v[23], 0);
        }
        gSPClearGeometryMode(sphGfxP++, G_CULL_BACK | G_SHADING_SMOOTH);
        gSPEndDisplayList(sphGfxP++);
    }

    Matrix_Push();

    Matrix_Translate(x, y, z, MTXMODE_NEW);
    Matrix_Scale(radius / 128.0f, radius / 128.0f, radius / 128.0f, MTXMODE_APPLY);

    gSPMatrix((*gfxP)++, Matrix_Finalize(gfxCtx, __FILE__, __LINE__), G_MTX_MODELVIEW | G_MTX_LOAD | G_MTX_PUSH);
    gSPDisplayList((*gfxP)++, pSphGfx);
    gSPPopMatrix((*gfxP)++, G_MTX_MODELVIEW);

    Matrix_Pop();
}

void Math3D_DrawSphere(PlayState* play, Sphere16* sph) {
    OPEN_DISPS(play->state.gfxCtx, __FILE__, __LINE__);

    gSPDisplayList(POLY_XLU_DISP++, sPolyGfxInit);
    gDPSetPrimColor(POLY_XLU_DISP++, 0, 0, 255, 255, 255, 255);

    Math3D_DrawSphereImpl(play->state.gfxCtx, &POLY_XLU_DISP, sph->center.x, sph->center.y, sph->center.z, sph->radius);

    CLOSE_DISPS(play->state.gfxCtx, __FILE__, __LINE__);
}

void Math3D_DrawCylinderImpl(GraphicsContext* gfxCtx, Gfx** gfxP, f32 x, f32 y, f32 z, s16 radius, s16 height) {
    static Gfx* pCylGfx = NULL;

    if (!pCylGfx) {
        static Gfx cylGfx[5 + 12 * 2];
        static Vtx cylVtx[2 + 12 * 2];

        s32 i;
        Gfx* cylGfxP = pCylGfx = cylGfx;

        cylVtx[0].n.ob[0] = 0;
        cylVtx[0].n.ob[1] = 0;
        cylVtx[0].n.ob[2] = 0;
        cylVtx[0].n.flag = 0;
        cylVtx[0].n.tc[0] = 0;
        cylVtx[0].n.tc[1] = 0;
        cylVtx[0].n.n[0] = 0;
        cylVtx[0].n.n[1] = -127;
        cylVtx[0].n.n[2] = 0;
        cylVtx[0].n.a = 255;

        cylVtx[1].n.ob[0] = 0;
        cylVtx[1].n.ob[1] = 128;
        cylVtx[1].n.ob[2] = 0;
        cylVtx[1].n.flag = 0;
        cylVtx[1].n.tc[0] = 0;
        cylVtx[1].n.tc[1] = 0;
        cylVtx[1].n.n[0] = 0;
        cylVtx[1].n.n[1] = 127;
        cylVtx[1].n.n[2] = 0;
        cylVtx[1].n.a = 255;

        for (i = 0; i < 12; ++i) {
            s32 vtxX = Math_FFloorF(0.5f + cosf(2.f * M_PI * i / 12) * 128.f);
            s32 vtxZ = Math_FFloorF(0.5f - sinf(2.f * M_PI * i / 12) * 128.f);
            s32 normX = cosf(2.f * M_PI * i / 12) * 127.f;
            s32 normZ = -sinf(2.f * M_PI * i / 12) * 127.f;

            cylVtx[2 + i * 2 + 0].n.ob[0] = vtxX;
            cylVtx[2 + i * 2 + 0].n.ob[1] = 0;
            cylVtx[2 + i * 2 + 0].n.ob[2] = vtxZ;
            cylVtx[2 + i * 2 + 0].n.flag = 0;
            cylVtx[2 + i * 2 + 0].n.tc[0] = 0;
            cylVtx[2 + i * 2 + 0].n.tc[1] = 0;
            cylVtx[2 + i * 2 + 0].n.n[0] = normX;
            cylVtx[2 + i * 2 + 0].n.n[1] = 0;
            cylVtx[2 + i * 2 + 0].n.n[2] = normZ;
            cylVtx[2 + i * 2 + 0].n.a = 255;

            cylVtx[2 + i * 2 + 1].n.ob[0] = vtxX;
            cylVtx[2 + i * 2 + 1].n.ob[1] = 128;
            cylVtx[2 + i * 2 + 1].n.ob[2] = vtxZ;
            cylVtx[2 + i * 2 + 1].n.flag = 0;
            cylVtx[2 + i * 2 + 1].n.tc[0] = 0;
            cylVtx[2 + i * 2 + 1].n.tc[1] = 0;
            cylVtx[2 + i * 2 + 1].n.n[0] = normX;
            cylVtx[2 + i * 2 + 1].n.n[1] = 0;
            cylVtx[2 + i * 2 + 1].n.n[2] = normZ;
            cylVtx[2 + i * 2 + 1].n.a = 255;
        }

        gSPSetGeometryMode(cylGfxP++, G_CULL_BACK | G_SHADING_SMOOTH);
        gSPVertex(cylGfxP++, cylVtx, 2 + 12 * 2, 0);

        for (i = 0; i < 12; ++i) {
            s32 p = (i + 12 - 1) % 12;

            gSP2Triangles(cylGfxP++, 2 + p * 2 + 0, 2 + i * 2 + 0, 2 + i * 2 + 1, 0, 2 + p * 2 + 0, 2 + i * 2 + 1,
                          2 + p * 2 + 1, 0);
        }

        gSPClearGeometryMode(cylGfxP++, G_SHADING_SMOOTH);

        for (i = 0; i < 12; ++i) {
            s32 p = (i + 12 - 1) % 12;

            gSP2Triangles(cylGfxP++, 0, 2 + i * 2 + 0, 2 + p * 2 + 0, 0, 1, 2 + p * 2 + 1, 2 + i * 2 + 1, 0);
        }

        gSPClearGeometryMode(cylGfxP++, G_CULL_BACK);
        gSPEndDisplayList(cylGfxP++);
    }

    Matrix_Push();

    Matrix_Translate(x, y, z, MTXMODE_NEW);
    Matrix_Scale(radius / 128.0f, height / 128.0f, radius / 128.0f, MTXMODE_APPLY);

    gSPMatrix((*gfxP)++, Matrix_Finalize(gfxCtx, __FILE__, __LINE__), G_MTX_MODELVIEW | G_MTX_LOAD | G_MTX_PUSH);
    gSPDisplayList((*gfxP)++, pCylGfx);
    gSPPopMatrix((*gfxP)++, G_MTX_MODELVIEW);

    Matrix_Pop();
}

void Math3D_DrawCylinder(PlayState* play, Cylinder16* cyl) {
    OPEN_DISPS(play->state.gfxCtx, __FILE__, __LINE__);

    gSPDisplayList(POLY_XLU_DISP++, sPolyGfxInit);
    gDPSetPrimColor(POLY_XLU_DISP++, 0, 0, 255, 255, 255, 255);

    Math3D_DrawCylinderImpl(play->state.gfxCtx, &POLY_XLU_DISP, cyl->pos.x, cyl->pos.y + cyl->yShift, cyl->pos.z,
                            cyl->radius, cyl->height);

    CLOSE_DISPS(play->state.gfxCtx, __FILE__, __LINE__);
}
#endif
