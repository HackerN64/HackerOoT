#ifndef OCCLUSIONPLANES_H
#define OCCLUSIONPLANES_H

#include "ultra64/gbi.h"
#include "ultra64/ultratypes.h"
#include "config.h"

struct PlayState;

typedef enum F3DEX3OccMode {
    F3DEX3_OCC_MODE_AUTO,
    F3DEX3_OCC_MODE_ALWAYS,
    F3DEX3_OCC_MODE_NEVER,
    F3DEX3_OCC_MODE_COUNT
} F3DEX3OccMode;

typedef enum OcclusionPlanePhase {
    OCCLUSION_PLANE_PHASE_START,
    OCCLUSION_PLANE_PHASE_POST_SKY,
    OCCLUSION_PLANE_PHASE_POST_3D,
    OCCLUSION_PLANE_PHASE_COUNT
} OcclusionPlanePhase;

typedef enum OcclusionPlaneStoredCmdType {
    OCCLUSION_PLANE_STORED_CMD_SKY_OPA,
    OCCLUSION_PLANE_STORED_CMD_3D_OPA,
    OCCLUSION_PLANE_STORED_CMD_3D_XLU,
    OCCLUSION_PLANE_STORED_CMD_COUNT
} OcclusionPlaneStoredCmdType;

void OcclusionPlane_Draw_Phase(struct PlayState* play, OcclusionPlanePhase phase);
void OcclusionPlane_Draw_PostCamUpdate(struct PlayState* play);

#endif // OCCLUSIONPLANES_H
