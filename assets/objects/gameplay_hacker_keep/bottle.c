#include "ultra64.h"
#include "gfx.h"

u64 gBottleContentsTex[] = {
#include "assets/objects/gameplay_hacker_keep/bottle_contents.i8.inc.c"
};

u64 gBottleGlassNewTex[] = {
#include "assets/objects/gameplay_hacker_keep/bottle_glass.i8.inc.c"
};

Vtx gameplay_keepVtx_000080[] = {
    VTX(-465, 313, -5, 354, 973, 90, 90, 90, 90),      VTX(63, 561, 209, 296, 277, 255, 255, 255, 255),
    VTX(-466, 562, 205, 297, 976, 50, 50, 50, 50),     VTX(64, 312, -1, 353, 274, 255, 255, 255, 255),
    VTX(-462, 436, -307, 411, 970, 50, 50, 50, 50),    VTX(67, 435, -303, 411, 271, 182, 182, 182, 182),
    VTX(-461, 761, -283, 481, 971, 50, 50, 50, 50),    VTX(67, 760, -279, 481, 272, 54, 54, 54, 54),
    VTX(67, 435, -303, 411, 271, 182, 182, 182, 182),  VTX(-464, 839, 33, 225, 975, 50, 50, 50, 50),
    VTX(65, 838, 37, 225, 276, 118, 118, 118, 118),    VTX(63, 561, 209, 296, 277, 255, 255, 255, 255),
    VTX(64, 312, -1, 353, 274, 255, 255, 255, 255),

    VTX(443, 756, -271, -17, 180, 1, 77, 165, 50),     VTX(264, 756, -272, 155, 179, 33, 82, 176, 50),
    VTX(440, 833, 43, -12, 124, 0, 118, 18, 50),       VTX(262, 834, 42, 159, 123, 29, 99, 60, 50),
    VTX(438, 558, 214, -16, 321, 255, 20, 118, 50),    VTX(259, 559, 212, 155, 320, 36, 246, 114, 58),
    VTX(442, 433, -294, -23, 411, 1, 219, 143, 162),   VTX(263, 434, -296, 148, 410, 38, 194, 161, 242),
    VTX(260, 312, 4, 149, 498, 48, 150, 27, 248),      VTX(430, 311, 6, -14, 499, 255, 140, 29, 180),
    VTX(260, 312, 4, 34, 76, 48, 150, 27, 248),        VTX(161, 397, -358, 43, 287, 38, 198, 159, 240),
    VTX(263, 434, -296, 49, 240, 38, 194, 161, 242),   VTX(158, 243, 19, 25, 81, 24, 142, 28, 218),
    VTX(259, 559, 212, 46, -107, 36, 246, 114, 58),    VTX(157, 555, 282, 38, -150, 36, 250, 114, 54),
    VTX(158, 243, 19, 25, 81, 24, 142, 28, 218),       VTX(262, 834, 42, 76, -56, 29, 99, 60, 50),
    VTX(159, 901, 67, 85, -86, 42, 108, 31, 50),       VTX(264, 756, -272, 78, 158, 33, 82, 176, 50),
    VTX(162, 803, -329, 88, 184, 45, 59, 163, 100),    VTX(158, 243, 19, 281, 81, 24, 142, 28, 218),
    VTX(-550, 400, -366, 208, 293, 182, 190, 190, 50), VTX(161, 397, -358, 299, 287, 38, 198, 159, 240),
    VTX(-554, 246, 11, 225, 87, 193, 158, 24, 58),     VTX(157, 555, 282, 294, -150, 36, 250, 114, 54),
    VTX(-555, 558, 274, 212, -144, 163, 233, 72, 50),  VTX(-552, 904, 59, 175, -80, 211, 90, 64, 50),
    VTX(-549, 806, -337, 172, 190, 194, 66, 178, 50),
};

Gfx gBottleContentsDL[] = {
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    gsDPPipeSync(),
    gsDPSetCombineLERP(TEXEL0, 0, SHADE, 0, 0, 0, 0, TEXEL0, ENVIRONMENT, 0, COMBINED, 0, 0, 0, 0, COMBINED),
    gsDPSetRenderMode(G_RM_FOG_SHADE_A, G_RM_AA_ZB_OPA_SURF2),
    gsDPPipeSync(),
    gsDPSetTextureLUT(G_TT_NONE),
    gsDPLoadTextureBlock(gBottleContentsTex, G_IM_FMT_I, G_IM_SIZ_8b, 16, 32, 0, G_TX_MIRROR | G_TX_CLAMP,
                         G_TX_MIRROR | G_TX_CLAMP, 4, 5, G_TX_NOLOD, G_TX_NOLOD),
    gsSPLoadGeometryMode(G_ZBUFFER | G_SHADE | G_CULL_BACK | G_FOG | G_SHADING_SMOOTH),
    gsSPVertex(gameplay_keepVtx_000080, 13, 0),
    gsSP2Triangles(0, 1, 2, 0, 0, 3, 1, 0),
    gsSP2Triangles(4, 5, 0, 0, 5, 3, 0, 0),
    gsSP2Triangles(4, 0, 2, 0, 6, 7, 4, 0),
    gsSP2Triangles(7, 8, 4, 0, 4, 2, 6, 0),
    gsSP2Triangles(9, 7, 6, 0, 9, 10, 7, 0),
    gsSP2Triangles(2, 10, 9, 0, 2, 11, 10, 0),
    gsSP2Triangles(2, 9, 6, 0, 11, 7, 10, 0),
    gsSP2Triangles(11, 8, 7, 0, 11, 12, 8, 0),
    gsSPEndDisplayList(),
};

Gfx gBottleGlassDL[] = {
    gsSPTexture(0x0BB8, 0x0BB8, 0, G_TX_RENDERTILE, G_ON),
    gsDPPipeSync(),
    gsDPSetCombineLERP(PRIMITIVE, ENVIRONMENT, SHADE, TEXEL0, TEXEL0, 0, PRIMITIVE, 0, PRIMITIVE, PRIMITIVE, SHADE,
                       COMBINED, 0, 0, 0, COMBINED),
    gsDPSetPrimColor(0, 0xFF, 170, 240, 255, 255),
    gsDPSetEnvColor(128, 128, 128, 255),
    gsDPSetRenderMode(G_RM_FOG_SHADE_A, G_RM_AA_ZB_XLU_SURF2),
    gsDPSetTextureLUT(G_TT_NONE),
    gsDPLoadTextureBlock(gBottleGlassNewTex, G_IM_FMT_I, G_IM_SIZ_8b, 8, 8, 0, G_TX_MIRROR | G_TX_WRAP,
                         G_TX_MIRROR | G_TX_WRAP, 3, 3, 2, 3),
    gsSPLoadGeometryMode(G_ZBUFFER | G_SHADE | G_FOG | G_LIGHTING | G_TEXTURE_GEN | G_TEXTURE_GEN_LINEAR |
                         G_SHADING_SMOOTH),
    gsSPVertex(&gameplay_keepVtx_000080[13], 10, 0),
    gsSP2Triangles(0, 1, 2, 0, 1, 3, 2, 0),
    gsSP2Triangles(2, 3, 4, 0, 3, 5, 4, 0),
    gsSP2Triangles(6, 1, 0, 0, 6, 7, 1, 0),
    gsSP2Triangles(8, 9, 5, 0, 9, 4, 5, 0),
    gsSP2Triangles(8, 7, 9, 0, 7, 6, 9, 0),
    gsSPTexture(0x0640, 0x08FC, 0, G_TX_RENDERTILE, G_ON),
    gsDPPipeSync(),
    gsSPVertex(&gameplay_keepVtx_000080[23], 19, 0),
    gsSP2Triangles(0, 1, 2, 0, 0, 3, 1, 0),
    gsSP2Triangles(4, 5, 0, 0, 5, 6, 0, 0),
    gsSP2Triangles(7, 8, 4, 0, 8, 5, 4, 0),
    gsSP2Triangles(9, 8, 7, 0, 9, 10, 8, 0),
    gsSP2Triangles(2, 10, 9, 0, 2, 1, 10, 0),
    gsSP2Triangles(11, 12, 13, 0, 11, 14, 12, 0),
    gsSP2Triangles(15, 16, 11, 0, 16, 14, 11, 0),
    gsSP2Triangles(8, 17, 15, 0, 17, 16, 15, 0),
    gsSP2Triangles(10, 18, 8, 0, 18, 17, 8, 0),
    gsSP2Triangles(13, 18, 10, 0, 13, 12, 18, 0),
    gsSP2Triangles(12, 16, 18, 0, 12, 14, 16, 0),
    gsSP1Triangle(16, 17, 18, 0),
    gsSPEndDisplayList(),
};
