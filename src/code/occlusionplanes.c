#include "ultra64.h"
#include "debug/profiler_inline.h"
#include "occlusionplanes.h"
#include "gfx.h"
#include "sys_math3d.h"
#include "z64play.h"
#include "z64skin_matrix.h"

#if ENABLE_F3DEX3

static Gfx* planeCommands[OCCLUSION_PLANE_STORED_CMD_COUNT];

static s32 OcclusionPlane_Choose(PlayState* play, Vec3f* selCandidate) {
    Vec3f* camPos = &play->view.eye;
    Vec3f camDir = (Vec3f){ play->view.at.x - camPos->x, play->view.at.y - camPos->y, play->view.at.z - camPos->z };
    float len2 = camDir.x * camDir.x + camDir.y * camDir.y + camDir.z * camDir.z;
    if (len2 == 0.0f) {
        return 1;
    }
    len2 = 1.0f / sqrtf(len2);
    camDir.x *= len2;
    camDir.y *= len2;
    camDir.z *= len2;
    float bestScore = -1.0f;

#if DEBUG_OCCLUSION_PLANES
    OPEN_DISPS(play->state.gfxCtx, "occlusionplanes.c", __LINE__);
    GfxPrint printer;
    GfxPrint_Init(&printer);
    Gfx* opaStart = POLY_OPA_DISP;
    Gfx* gfx = Gfx_Open(POLY_OPA_DISP);
    gSPDisplayList(OVERLAY_DISP++, gfx);
    GfxPrint_Open(&printer, gfx);
    GfxPrint_SetBasePosPx(&printer, 8, 64);
    GfxPrint_SetColor(&printer, 255, 255, 255, 255);
#endif

    s32 c = -1;
    Room* room = &play->roomCtx.curRoom;
    while (true) {
        ++c;
        if (c >= room->occPlaneCount) {
            if (room == &play->roomCtx.curRoom) {
                room = &play->roomCtx.prevRoom;
                c = -1;
                continue;
            }
            break;
        }

        OcclusionPlaneCandidate* cand = &room->occPlaneList[c];
        Vec3f v[4];
        for (s32 p = 0; p < 4; ++p) {
            v[p].x = cand->v[p].x;
            v[p].y = cand->v[p].y;
            v[p].z = cand->v[p].z;
        }
        Vec3f v02 = (Vec3f){ v[2].x - v[0].x, v[2].y - v[0].y, v[2].z - v[0].z };
        Vec3f v13 = (Vec3f){ v[3].x - v[1].x, v[3].y - v[1].y, v[3].z - v[1].z };
        Vec3f center =
            (Vec3f){ (v[0].x + v[1].x + v[2].x + v[3].x) * 0.25f, (v[0].y + v[1].y + v[2].y + v[3].y) * 0.25f,
                     (v[0].z + v[1].z + v[2].z + v[3].z) * 0.25f };
        Vec3f normal;
        Math3D_Vec3f_Cross(&v13, &v02, &normal);
        float len = sqrtf(normal.x * normal.x + normal.y * normal.y + normal.z * normal.z);
        float area = 0.5f * len;
        if (len != 0.0f) {
            len = 1.0f / len;
        }
        normal.x *= len;
        normal.y *= len;
        normal.z *= len;

        // center to the camera
        Vec3f c2c = (Vec3f){ camPos->x - center.x, camPos->y - center.y, camPos->z - center.z };
        float distToPlane = normal.x * c2c.x + normal.y * c2c.y + normal.z * c2c.z;
        if (distToPlane <= 0.0f) {
            // Camera on wrong side of it
#if DEBUG_OCCLUSION_PLANES
            GfxPrint_Printf(&printer, "c%d wrong side\n", c);
#endif
            continue;
        }
        float c2cRcpLen = 1.0f / (c2c.x * c2c.x + c2c.y * c2c.y + c2c.z * c2c.z);
        c2c.x *= c2cRcpLen;
        c2c.y *= c2cRcpLen;
        c2c.z *= c2cRcpLen;
        // How much the camera position is around towards the front of the plane
        // Need this because dirAlignWCam would be the same if we are looking
        // parallel to the plane regardless of how far in front or behind it
        float planeAngleToCam = normal.x * c2c.x + normal.y * c2c.y + normal.z * c2c.z;

        // How much the plane normal matches the camera look dir
        float dirAlignWCam = normal.x * camDir.x + normal.y * camDir.y + normal.z * camDir.z;
        bool lookingAway = dirAlignWCam >= -0.0001f;
        float distToPlaneAlongView = lookingAway ? 10000.0f : (distToPlane / -dirAlignWCam);
        Vec3f projView; // Camera projected on plane along camera view dir
        projView.x = camPos->x + camDir.x * distToPlaneAlongView;
        projView.y = camPos->y + camDir.y * distToPlaneAlongView;
        projView.z = camPos->z + camDir.z * distToPlaneAlongView;

        // Maximum distance from projView to any edge of the quad, or 0 if inside
        float maxDistProjView = lookingAway ? 10000.0f : 0.0f;
        if (!lookingAway) {
            for (s32 i = 0; i < 4; ++i) {
                s32 j = (i == 3) ? 0 : (i + 1);
                Vec3f edge = (Vec3f){ v[i].x - v[j].x, v[i].y - v[j].y, v[i].z - v[j].z };
                Vec3f tangent;
                Math3D_Vec3f_Cross(&edge, &normal, &tangent);
                float len2 = tangent.x * tangent.x + tangent.y * tangent.y + tangent.z * tangent.z;
                if (len2 > 0.0f) {
                    len2 = 1.0f / sqrtf(len2);
                }
                tangent.x *= len2;
                tangent.y *= len2;
                tangent.z *= len2;

                Vec3f dpv = (Vec3f){ projView.x - v[j].x, projView.y - v[j].y, projView.z - v[j].z };
                float dist = dpv.x * tangent.x + dpv.y * tangent.y + dpv.z * tangent.z;
                if (dist > maxDistProjView) {
                    maxDistProjView = dist;
                }
            }
        }

        float baseScore = 1.0f / (distToPlaneAlongView + maxDistProjView);
        if (maxDistProjView > 0.0f) { // projView is outside
            float approachOutside = distToPlaneAlongView * baseScore;
            approachOutside = (approachOutside - 0.5f) * 2.0f;
            if (approachOutside < 0.0f) {
                approachOutside = 0.0f;
            }
            baseScore *= approachOutside;
        }
        float score = baseScore * (0.5f - 0.5f * dirAlignWCam) * planeAngleToCam;
        score *= sqrtf(area);
        score *= cand->weight;
#if DEBUG_OCCLUSION_PLANES
        GfxPrint_Printf(&printer, "c%d score%5.2f\n", c, score * 1000.0f);
#endif
        if (score > bestScore) {
            bestScore = score;
            bcopy(v, selCandidate, 4 * sizeof(Vec3f));
        }
    }

#if DEBUG_OCCLUSION_PLANES
    gfx = GfxPrint_Close(&printer);
    gSPEndDisplayList(gfx++);
    Gfx_Close(opaStart, gfx);
    POLY_OPA_DISP = gfx;
    CLOSE_DISPS(play->state.gfxCtx, "occlusionplanes.c", __LINE__);
#endif

    if (bestScore < 0.0f) {
        return 1;
    }
    return 0;
}

typedef struct {
    Vec3f clip;
    float w;
    Vec2f scrn;
    u8 isScreenEdge;
} ClipVertex;

typedef struct {
    s16 cScale;
    s16 cOffset;
    u8 edgeID;
} EdgeCandidate;

static s16 FloatToS16Clamp(float f) {
    f = CLAMP(f, -32768.0f, 32767.0f);
    return (s16)f;
}

static s16 FloatMinus1To1ToS16(float f) {
    return FloatToS16Clamp(f * 32768.0f);
}

static void ClipToScreenSpace(PlayState* play, const Vec3f* clipXYZ, float clipW, Vec2f* screen) {
    if (clipW < 0.001f) {
        // Behind camera plane
        screen->x = 0x8000;
        screen->y = 0x8000;
        return;
    }
    float invW = 1.0f / clipW;
    float preViewportX = clipXYZ->x * invW;
    float preViewportY = clipXYZ->y * invW;
    Vp* vp = &play->view.vp;
    screen->x = (float)vp->vp.vscale[0] * preViewportX + (float)vp->vp.vtrans[0];
    screen->y = -(float)vp->vp.vscale[1] * preViewportY + (float)vp->vp.vtrans[1];
}

static bool ClipPolygon(PlayState* play, ClipVertex* verts, s8* indices, s8** idxFinalStart, s8** idxFinalEnd) {
    // This is roughly a reimplementation of the F3D family clipping code
    // (Overlay 3), except with hardcoded clip ratio of 1 (screen clipping)
    s8 igen = 4; // gen vertex pointer
    s32 idxSelect = 0;
    ClipVertex* v3 = &verts[indices[3]];
    s8* idxWrite;
    for (s32 condition = 4; condition >= 0; --condition) {
        s8* idxRead = &indices[idxSelect];
        idxSelect ^= 10;
        idxWrite = &indices[idxSelect];
        while (true) {
            s8 i2 = *idxRead;
            if (i2 < 0) {
                break;
            }
            ClipVertex* v2 = &verts[i2];
            ++idxRead;
            bool v2Offscreen = false, v3Offscreen = false;
            switch (condition) {
                case 4: // -W
                    v2Offscreen = v2->w <= 0.0f;
                    v3Offscreen = v3->w <= 0.0f;
                    break;
                case 3: // +X
                    v2Offscreen = v2->clip.x >= v2->w;
                    v3Offscreen = v3->clip.x >= v3->w;
                    break;
                case 2: // -X
                    v2Offscreen = v2->clip.x <= -v2->w;
                    v3Offscreen = v3->clip.x <= -v3->w;
                    break;
                case 1: // +Y
                    v2Offscreen = v2->clip.y >= v2->w;
                    v3Offscreen = v3->clip.y >= v3->w;
                    break;
                case 0: // -Y
                    v2Offscreen = v2->clip.y <= -v2->w;
                    v3Offscreen = v3->clip.y <= -v3->w;
                    break;
            }
            if (v2Offscreen != v3Offscreen) {
                // Clip this edge
                ClipVertex* v19 = v2;
                if (v2Offscreen) {
                    v19 = v3;
                    v3 = v2;
                }
                // v19 is on screen, v3 is off screen
                float clOnScreen, clOffScreen;
                if (condition == 4) {
                    clOnScreen = 0.0f;
                    clOffScreen = 0.0f;
                } else if (condition <= 1) {
                    clOnScreen = v19->clip.y;
                    clOffScreen = v3->clip.y;
                } else {
                    clOnScreen = v19->clip.x;
                    clOffScreen = v3->clip.x;
                }
                float mult = (condition & 1) ? -1.0f : 1.0f;
                clOnScreen += mult * v19->w;
                clOffScreen += mult * v3->w;
                float clBase = clOnScreen;
                float clDiff = clOnScreen - clOffScreen;
                float clFade1;
                if (fabsf(clDiff) < 1e-6f) {
                    clFade1 = 1.0f;
                } else {
                    clFade1 = clBase / clDiff;
                    clFade1 = CLAMP(clFade1, 0.0f, 1.0f);
                }
                float clFade2 = 1.0f - clFade1;
                if (igen >= 14) {
                    // Too many generated vertices
                    return false;
                }
                if (idxWrite - &indices[idxSelect] >= 9) {
                    // Polygon has too many vertices
                    return false;
                }
                verts[igen].clip.x = clFade2 * v19->clip.x + clFade1 * v3->clip.x;
                verts[igen].clip.y = clFade2 * v19->clip.y + clFade1 * v3->clip.y;
                verts[igen].w = clFade2 * v19->w + clFade1 * v3->w;
                verts[igen].isScreenEdge = v2Offscreen || v3->isScreenEdge;
                ClipToScreenSpace(play, &verts[igen].clip, verts[igen].w, &verts[igen].scrn);
                *idxWrite = igen;
                ++idxWrite;
                ++igen;
            }
            if (!v2Offscreen) {
                if (idxWrite - &indices[idxSelect] >= 9) {
                    // Polygon has too many vertices
                    return false;
                }
                *idxWrite = i2;
                ++idxWrite;
            }
            v3 = v2;
        }
        *idxWrite = -1;
        if (idxWrite - &indices[idxSelect] < 3) {
            // Less than 3 verts in written polygon
            return false;
        }
        v3 = &verts[*(idxWrite - 1)];
    }
    *idxFinalStart = &indices[idxSelect];
    *idxFinalEnd = idxWrite;
    return true;
}

// The occlusion plane settings for "disable the occlusion plane". This is just
// stored once, and the SPOcclusionPlane DL command is set to point here if the
// occlusion plane is disabled or invalid.
static OcclusionPlane sNoOcclusionPlane = { 0x0000, 0x0000, 0x0000, 0x0000, 0x8000, 0x8000,
                                            0x8000, 0x8000, 0x0000, 0x0000, 0x0000, 0x8000 };

static OcclusionPlane* ComputeOcclusionPlane(PlayState* play, Vec3f* worldBounds) {
    ClipVertex verts[14]; // 4 initial verts, 5 tips cut off polygon with 2 gen verts each
    s8 indices[20];       // Polygon starts with 4 verts, 5 tips cut off = 9, plus 1 entry -1, times read and write
    for (s32 i = 0; i < 4; ++i) {
        SkinMatrix_Vec3fMtxFMultXYZW(&play->viewProjectionMtxF, &worldBounds[i], &verts[i].clip, &verts[i].w);
        ClipToScreenSpace(play, &verts[i].clip, verts[i].w, &verts[i].scrn);
        verts[i].isScreenEdge = 0;
        indices[i] = i;
    }
    indices[4] = -1;

    // Clip space plane
    float kxf, kyf, kzf, kcf;
    Math3D_DefPlane(&verts[0].clip, &verts[2].clip, &verts[1].clip, &kxf, &kyf, &kzf, &kcf);
    s16 kx = FloatMinus1To1ToS16(kxf);
    s16 ky = FloatMinus1To1ToS16(kyf);
    s16 kz = FloatMinus1To1ToS16(kzf);
    s16 kc = (s16)(kcf * 0.5f);
    if ((kx | ky | kz) == 0) {
        // Degenerate plane, disable the clipping
        return &sNoOcclusionPlane;
    }

    // Clip the polygon to the screen edges. Screen edges don't require an
    // occlusion plane equation.
    s8 *idxFinalStart, *idxFinalEnd, *idx;
    if (!ClipPolygon(play, verts, indices, &idxFinalStart, &idxFinalEnd)) {
        // Resulting polygon is degenerate; occlusion plane is fully offscreen. No occlusion.
        return &sNoOcclusionPlane;
    }

#if DEBUG_OCCLUSION_PLANES
    // Visualize the clipped polygon by drawing its vertices.
    OPEN_DISPS(play->state.gfxCtx, "occlusionplanes.c", __LINE__);
    gDPPipeSync(OVERLAY_DISP++);
    gDPSetCycleType(OVERLAY_DISP++, G_CYC_FILL);
    gDPSetRenderMode(OVERLAY_DISP++, G_RM_NOOP, G_RM_NOOP2);
    u8 r = 0xFF, g = 0, b = 0;
    gDPSetFillColor(OVERLAY_DISP++, (GPACK_RGBA5551(r, g, b, 1) << 16) | GPACK_RGBA5551(r, g, b, 1));

    idx = idxFinalStart;
    while (idx != idxFinalEnd) {
        s16 x = verts[*idx].scrn.x;
        s16 y = verts[*idx].scrn.y;
        ++idx;
        x >>= 2;
        y >>= 2;
        if (x < 3) {
            x = 3;
        }
        if (x > 315) {
            x = 315;
        }
        if (y < 1) {
            y = 1;
        }
        if (y > 236) {
            y = 236;
        }
        gDPScisFillRectangle(OVERLAY_DISP++, x - 2, y - 2, x + 2, y + 2);
    }

    gDPPipeSync(OVERLAY_DISP++);
    gDPSetCycleType(OVERLAY_DISP++, G_CYC_2CYCLE);
    CLOSE_DISPS(play->state.gfxCtx, "occlusionplanes.c", __LINE__);
#endif

    // Candidates for each of the 4 equations. Up to 3 edges can be candidates for each.
    EdgeCandidate cands[4][3];
    u8 numCands[4];
    numCands[0] = numCands[1] = numCands[2] = numCands[3] = 0;
    u8 totalEdges = 0;
    u8 candsForEdge[4];

    // Traverse the clipped polygon. For each edge which is not a screen edge,
    // see if it can be represented as each of the four equations. For any it can
    // be, compute its representation as that equation and store as a candidate.
    ClipVertex* vtxA;
    ClipVertex* vtxB = &verts[*(idxFinalEnd - 1)];
    idx = idxFinalStart;
    while (idx < idxFinalEnd) {
        vtxA = vtxB;
        vtxB = &verts[*idx];
        ++idx;
        if (vtxA->isScreenEdge) {
            continue;
        }
        // Should only be 4 edges not along a screen edge
        if (totalEdges >= 4) {
            return &sNoOcclusionPlane;
        }

        u8 numCandsFit = 0;
        float dx = vtxB->scrn.x - vtxA->scrn.x;
        float dy = vtxB->scrn.y - vtxA->scrn.y;
        for (s32 q = 0; q < 4; ++q) {
            float du, dv, uA, vA; // Equation V <> U * cScale + cOffset
            if ((q & 1)) {
                dv = dx;
                du = dy;
                vA = vtxA->scrn.x;
                uA = vtxA->scrn.y;
            } else {
                du = dx;
                dv = dy;
                uA = vtxA->scrn.x;
                vA = vtxA->scrn.y;
            }
            // Check side of edge using cross product. For example, if the
            // equation is Y > something, which side of that line is inside /
            // outside the clipped polygon depends on dx.
            // Eqn 0: Y > something -> dx > 0 -> du > 0
            // Eqn 1: X > something -> dy < 0 -> du < 0
            // Eqn 2: Y < something -> dx < 0 -> du < 0
            // Eqn 3: X < something -> dy > 0 -> du > 0
            if ((q == 0 || q == 3) != (du > 0.0f)) {
                continue;
            }
            // cScale (after 1/8th scale) is limited to +/- 1. This also takes
            // care of the divided by 0 case, as the left side will always be
            // greater than or equal to 0.
            if (fabsf(dv) >= 8.0f * fabsf(du)) {
                continue;
            }
            float cScale = dv / du;
            float cOffset = vA - uA * cScale;
            cScale *= 0.125f;
            cOffset *= 0.5f;
            if (q >= 2) {
                cScale = -cScale;
            } else {
                cOffset = -cOffset;
            }
            if (fabsf(cOffset) > 32767.0f) {
                continue;
            }

            if (numCands[q] >= 3) {
                // Each equation should have no more than 3 candidate edges
                return &sNoOcclusionPlane;
            }
            EdgeCandidate* cand = &cands[q][numCands[q]];
            cand->cScale = FloatMinus1To1ToS16(cScale);
            cand->cOffset = (s16)cOffset;
            cand->edgeID = totalEdges;
            ++numCandsFit;
            ++(numCands[q]);
        }
        if (numCandsFit == 0) {
            return &sNoOcclusionPlane;
        } else if (numCandsFit > 3) {
            // Each edge should have no more than 3 candidate equations
            return &sNoOcclusionPlane;
        }
        candsForEdge[totalEdges] = numCandsFit;

        ++totalEdges;
    }

    // Assign candidates to equations.
    while (true) {
        // Check fail condition: if now there is some edge which has no candidates
        for (s32 e = 0; e < totalEdges; ++e) {
            if (candsForEdge[e] == 0) {
                return &sNoOcclusionPlane;
            }
        }
        // Check done condition: all equations have 0 or 1 candidates
        bool done = true;
        for (s32 q = 0; q < 4; ++q) {
            if (numCands[q] >= 2) {
                done = false;
                break;
            }
        }
        if (done) {
            break;
        }
        // Check for an equation which has more than one candidate edge, but
        // one of those edges only has one candidate, so that edge has to be
        // assigned to that equation.
        bool madeChange = false;
        for (s32 q = 0; q < 4 && !madeChange; ++q) {
            if (numCands[q] <= 1) {
                continue;
            }
            for (s32 c = 0; c < numCands[q]; ++c) {
                if (candsForEdge[cands[q][c].edgeID] == 1) {
                    madeChange = true;
                    // Decrement num candidates for other edges in this equation
                    for (s32 i = 0; i < numCands[q]; ++i) {
                        if (i == c) {
                            continue;
                        }
                        --(candsForEdge[cands[q][i].edgeID]);
                    }
                    // Move found edge to position 0 and truncate list
                    cands[q][0] = cands[q][c];
                    numCands[q] = 1;
                    break;
                }
            }
        }
        if (madeChange) {
            continue; // Restart loop
        }
        // Take the first equation which has more than one candidate edge, and
        // assign the edge with smallest abs(cScale)
        for (s32 q = 0; q < 4; ++q) {
            if (numCands[q] <= 1) {
                continue;
            }
            s32 bestC = 0;
            s32 bestScale = ABS((s32)cands[q][0].cScale);
            for (s32 c = 1; c < numCands[q]; ++c) {
                s32 scale = ABS((s32)cands[q][c].cScale);
                if (scale < bestScale) {
                    bestScale = scale;
                    bestC = c;
                }
            }
            // Assigning equation q to edge e (edge currently as candidate bestC)
            s32 e = cands[q][bestC].edgeID;
            // Decrement num candidates for other edges in this equation
            for (s32 i = 0; i < numCands[q]; ++i) {
                if (i == bestC) {
                    continue;
                }
                --(candsForEdge[cands[q][i].edgeID]);
            }
            // Move found edge to position 0 and truncate list
            cands[q][0] = cands[q][bestC];
            numCands[q] = 1;
            // Remove this edge from other candidate lists
            for (s32 j = 0; j < 4; ++j) {
                if (q == j) {
                    continue;
                }
                s32 i;
                for (i = 0; i < numCands[j]; ++i) {
                    if (cands[j][i].edgeID == e) {
                        break;
                    }
                }
                if (i == numCands[j]) {
                    continue;
                }
                for (; i < numCands[j] - 1; ++i) {
                    cands[j][i] = cands[j][i + 1];
                }
                --(numCands[j]);
                --(candsForEdge[e]);
            }
            if (candsForEdge[e] != 1) {
                return &sNoOcclusionPlane;
            }
            madeChange = true;
            break;
        }
        if (!madeChange) {
            return &sNoOcclusionPlane;
        }
    }

    // Move equations to occlusion plane
    OcclusionPlane* occ = Graph_Alloc(play->state.gfxCtx, sizeof(OcclusionPlane));
    for (s32 q = 0; q < 4; ++q) {
        occ->c[q] = (numCands[q] == 0) ? 0x0000 : cands[q][0].cScale;
        occ->c[q + 4] = (numCands[q] == 0) ? 0x7FFF : cands[q][0].cOffset;
    }
    occ->o.kx = kx;
    occ->o.ky = ky;
    occ->o.kz = kz;
    occ->o.kc = kc;
    return occ;
}

static bool ShouldBotherComputingOccPlanes(PlayState* play) {
    if (gF3DEX3OccMode == F3DEX3_OCC_MODE_NEVER) {
        return false;
    }
    return (play->roomCtx.curRoom.occPlaneCount > 0 || play->roomCtx.prevRoom.occPlaneCount > 0);
}

void OcclusionPlane_Draw_Phase(PlayState* play, OcclusionPlanePhase phase) {
    if (!ShouldBotherComputingOccPlanes(play)) {
        return;
    }

    GraphicsContext* gfxCtx = play->state.gfxCtx;
    OPEN_DISPS(gfxCtx, "occlusionplanes.c", __LINE__);

    switch (phase) {
        case OCCLUSION_PLANE_PHASE_START:
            planeCommands[OCCLUSION_PLANE_STORED_CMD_SKY_OPA] = POLY_OPA_DISP;
            gSPOcclusionPlane(POLY_OPA_DISP++, &sNoOcclusionPlane);

            // Later phases might not happen if debug registers are set up certain way
            planeCommands[OCCLUSION_PLANE_STORED_CMD_3D_OPA] = NULL;
            planeCommands[OCCLUSION_PLANE_STORED_CMD_3D_XLU] = NULL;
            break;
        case OCCLUSION_PLANE_PHASE_POST_SKY:
            planeCommands[OCCLUSION_PLANE_STORED_CMD_3D_OPA] = POLY_OPA_DISP;
            gSPOcclusionPlane(POLY_OPA_DISP++, &sNoOcclusionPlane);
            planeCommands[OCCLUSION_PLANE_STORED_CMD_3D_XLU] = POLY_XLU_DISP;
            gSPOcclusionPlane(POLY_XLU_DISP++, &sNoOcclusionPlane);
            break;
        case OCCLUSION_PLANE_PHASE_POST_3D:
            // Need to turn it off in OPA to draw the pause screen
            gSPOcclusionPlane(POLY_OPA_DISP++, &sNoOcclusionPlane);
            // Need to turn it off at the end of XLU (for OVL) for the HUD
            gSPOcclusionPlane(POLY_XLU_DISP++, &sNoOcclusionPlane);
            break;
    }

    CLOSE_DISPS(gfxCtx, "occlusionplanes.c", __LINE__);
}

void OcclusionPlane_Draw_PostCamUpdate(PlayState* play) {
    bool enableOcc = ShouldBotherComputingOccPlanes(play);
    if (gF3DEX3OccMode == F3DEX3_OCC_MODE_AUTO) {
        gF3DEX3NOCVersion = !enableOcc;
    }
    if (!enableOcc) {
        return;
    }

    Vec3f selCandidate[4];
    s32 result = OcclusionPlane_Choose(play, selCandidate);
    if (result != 0) {
        return;
    }

    OcclusionPlane* mainPlane = ComputeOcclusionPlane(play, selCandidate);
    if (mainPlane != &sNoOcclusionPlane) {
        OcclusionPlane* skyPlane = mainPlane;
        // The skybox is not actually really far away, it's a smallish box
        // centered on the camera. Thus, for occluding sky triangles, we will
        // use the same computed occlusion plane coefficients for the edges, but
        // set up the clip space plane so that all tris match the equation,
        // effectively disabling the depth check.
        skyPlane = Graph_Alloc(play->state.gfxCtx, sizeof(OcclusionPlane));
        bcopy(mainPlane, skyPlane, 8 * sizeof(short)); // Copy edge coeffs
        skyPlane->o.kx = 0;
        skyPlane->o.ky = 0;
        skyPlane->o.kz = 0;
        skyPlane->o.kc = 0x7FFF;
        ((u32*)(planeCommands[OCCLUSION_PLANE_STORED_CMD_SKY_OPA]))[1] = (u32)skyPlane;
    }
    if (planeCommands[OCCLUSION_PLANE_STORED_CMD_3D_OPA] != NULL) {
        ((u32*)(planeCommands[OCCLUSION_PLANE_STORED_CMD_3D_OPA]))[1] = (u32)mainPlane;
        ((u32*)(planeCommands[OCCLUSION_PLANE_STORED_CMD_3D_XLU]))[1] = (u32)mainPlane;
    }
}

#endif
