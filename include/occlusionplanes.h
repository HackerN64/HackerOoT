#ifndef OCCLUSIONPLANES_H
#define OCCLUSIONPLANES_H

#include "ultra64/gbi.h"
#include "ultra64/ultratypes.h"

typedef enum F3DEX3OccMode {
    F3DEX3_OCC_MODE_AUTO,
    F3DEX3_OCC_MODE_ALWAYS,
    F3DEX3_OCC_MODE_NEVER,
    F3DEX3_OCC_MODE_COUNT
} F3DEX3OccMode;

typedef enum OcclusionPlanePhase {
    OCCLUSION_PLANE_PHASE_START,
    OCCLUSION_PLANE_PHASE_POST_SKY,
    OCCLUSION_PLANE_PHASE_COUNT
} OcclusionPlanePhase;

typedef struct {
    OcclusionPlaneCandidate* list;
    u8 count;
    Gfx* planeCommands[OCCLUSION_PLANE_PHASE_COUNT];
    Vec3f selCandidate[4];
} OcclusionPlaneContext;

#endif // OCCLUSIONPLANES_H
