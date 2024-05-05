#ifndef OCCLUSIONPLANES_H
#define OCCLUSIONPLANES_H

#include "ultra64/gbi.h"
#include "ultra64/ultratypes.h"

typedef struct {
    OcclusionPlaneCandidate* list;
    u8 count;
    Gfx* preSkyPlaneCommand;
    Gfx* mainPlaneCommand;
    Vec3f selCandidate[4];
} OcclusionPlaneContext;

#endif // OCCLUSIONPLANES_H
