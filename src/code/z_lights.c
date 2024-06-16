#include "global.h"
#include "assets/objects/gameplay_keep/gameplay_keep.h"

// #define LIGHTS_DEBUG

#if !(ENABLE_F3DEX3 || defined(F3DEX_GBI_PL))
#error A microcode that supports point lighting is required
#endif

// Toggleable static for debugging, recommended for release is to use static
#ifndef STATIC
#if IS_DEBUG
#define STATIC
#else
#define STATIC static
#endif
#endif

// Maximum number of lights that can be registered with the system, the 7 (+1 ambient) closest lights to an object's
// position are then selected from these registered lights to be used in drawing that object.
// Note this is fixed to 32 unless the occupiedBitSet also changes size.
#define LIGHTS_BUFFER_SIZE 32

STATIC struct {
    u32 occupiedBitSet;
    LightNode lights[LIGHTS_BUFFER_SIZE];
    Lights* lastLights;
} sLightsBuffer;

#define FOR_EACH_LIGHTNODE(cur, head) for (LightNode * (cur) = (head); (cur) != NULL; (cur) = (cur)->next)

//
//  Light Info
//

#if ENABLE_F3DEX3
STATIC u8 F32_To_E3M5(f32 f) {
    // Float to int bits
    u32 bits = *(u32*)&f;

    // Saturate negative inputs to 0
    if (bits & 0x80000000) {
        return 0;
    }

    // Obtain 32-bit exponent and mantissa
    signed exp = ((bits >> 23) & 0b11111111) - 127;
    unsigned mantissa = bits & 0b11111111111111111111111;

    // Check exponent bounds
    if (exp < -3) {
        return 0; // Too small, flush to 0 (0.0)
    }
    if (exp > 4) {
        return 255; // Too large, saturate to 255 (31.5)
    }

    // Bias the exponent
    // The exponent bias for a floating-point format with
    // N exponent bits is (1 << (N - 1)) - 1
    exp += 3;

    // Obtain the 5 most significant bits of the 23-bit mantissa,
    // round to nearest
    mantissa = (mantissa + 63) >> (23 - 5);

    // Construct final e3m5 bits
    return ((exp & 0b111) << 5) | (mantissa & 0b11111);
}
#endif

static inline s32 lnearbyintf_inline(f32 x) {
    register s32 out;
    register f32 temp;
    asm("round.w.s %1, %2\n"
        "mfc1      %0, %1\n"
        : "=r"(out), "=f"(temp)
        : "f"(x));
    return out;
}

void Lights_PointSetInfo(LightInfo* info, s16 x, s16 y, s16 z, u8 r, u8 g, u8 b, s16 radius, s32 type) {
    info->type = type;
    info->params.point.x = x;
    info->params.point.y = y;
    info->params.point.z = z;
    Lights_PointSetColorAndRadius(info, r, g, b, radius);
}

void Lights_PointNoGlowSetInfo(LightInfo* info, s16 x, s16 y, s16 z, u8 r, u8 g, u8 b, s16 radius) {
    Lights_PointSetInfo(info, x, y, z, r, g, b, radius, LIGHT_POINT_NOGLOW);
}

void Lights_PointGlowSetInfo(LightInfo* info, s16 x, s16 y, s16 z, u8 r, u8 g, u8 b, s16 radius) {
    Lights_PointSetInfo(info, x, y, z, r, g, b, radius, LIGHT_POINT_GLOW);
}

/**
 * POINT_LIGHT_R0 (called r0 in some calculations below) is used to normalize a light radius r when converting it to
 * attenuation coefficients to send to the microcode.
 *
 * The RSP accepts 3 attenuation coefficients controlling a point light:
 *  - The quadratic attenuation kq
 *  - The quadratic attenuation kl
 *  - The quadratic attenuation kc
 *
 * The attenuation computes the light intensity at a vertex as a function of distance from the source:
 *  I(d) = I / ((kq / 524288) * d * d + (kl / 32768) * d + (kc / 16) + (1 / 2))
 * where
 *  - I is the source intensity, based on the light color
 *  - d is the distance from the light position to the vertex
 *
 * In this implementation we let kc = 8 always, this is the smallest allowed value as overflows will occur for kc < 8
 * where the ucode would compute a reciprocal > 1.0.
 *
 * We let kl = (r0/r) and kq = SQ(r0/r) where r is the light radius parameter that various functions accept.
 *
 * If we let POINT_LIGHT_R0=3000, the attenuation I(d) will have the characteristics
 *      I(r/4) ~ 0.5I
 *      I(r/2) ~ 0.2I
 *      I(r)   ~ 0.06I
 * At 1x the light radius the light intensity will be at ~6% of the source intensity
 *
 * Interactive graphs for point light curves as a function of distance, with configuration radius and r0
 * https://www.desmos.com/calculator/s3vwzxd4v0 (MM radius -> attenuation)
 * https://www.desmos.com/calculator/2lnzim1kuv (our radius -> attenuation)
 */
#define POINT_LIGHT_R0 (3000.0f)

void Lights_PointSetColorAndRadius(LightInfo* info, u8 r, u8 g, u8 b, s16 radius) {
    info->params.point.color[0] = r;
    info->params.point.color[1] = g;
    info->params.point.color[2] = b;
    info->params.point.glowRadius = radius;

    if (radius <= 0) {
        info->params.point.specularSize = 0;
        info->params.point.kc = 0;
        info->params.point.kl = 0;
        info->params.point.kq = 1;
        return;
    }

    // Convert the radius to attenuation coefficients (and specular size for F3DEX3)

#if ENABLE_F3DEX3
    // Increase specular size as the radius gets smaller. Radius doesn't really mean the same thing as specular size;
    // specular size is about how large the actual light emitting object is, and for a point light it's just a point.
    // Plus it should be dependent on how rough the specular object is.
    //     < 250 -> 4
    //     < 500 -> 3
    //    < 1000 -> 2
    // otherwise -> 1
    info->params.point.specularSize = 1 + (radius < 250) + (radius < 500) + (radius < 1000);
#endif

    // Set attenuation coefficients for the point light. We have to choose some essentially arbitrary mapping of the
    // vanilla engine's "radius" parameter to these coefficients, see the comment on POINT_LIGHT_R0 for details on how
    // we chose to do this.

    // `kc` must be non-zero for the microcode to take the point lighting codepath.
    // Smallest allowed value for kc is 8 (for F3DEX2 at least)
    info->params.point.kc = 8;

    f32 radiusInv = POINT_LIGHT_R0 / radius;
    // In F3DEX2 and F3DEX3, kl is an integer
    // Radius is strictly positive, therefore so is ri
    s32 radiusI = lnearbyintf_inline(radiusInv);
    info->params.point.kl = CLAMP_MAX(radiusI, 255);

#if ENABLE_F3DEX3
    // In F3DEX3, quadratic attenuation is a floating-point number with 3 exponent bits and 5 mantissa bits. Convert
    // the quadratic attenuation floating-point value to this format.
    info->params.point.kq = F32_To_E3M5(CLAMP(SQ(radiusInv) / 4.0f, 1.0f, 32.0f));
#else
    // In F3DEX2, quadratic attenuation is an integer
    radiusI = lnearbyintf_inline(SQ(radiusInv));
    info->params.point.kq = CLAMP(radiusI, 1, 255);
#endif
}

void Lights_PointSetPosition(LightInfo* info, s16 x, s16 y, s16 z) {
    info->params.point.x = x;
    info->params.point.y = y;
    info->params.point.z = z;
}

void Lights_PointSetAttenuation(LightInfo* info, u8 kc, u8 kl, u8 kq) {
    info->params.point.kc = kc;
    info->params.point.kl = kl;
    info->params.point.kq = kq;
}

void Lights_PointSetSpecularSize(LightInfo* info, u8 size) {
#if ENABLE_F3DEX3
    info->params.point.specularSize = size;
#endif
}

void Lights_DirectionalSetInfo(LightInfo* info, s8 x, s8 y, s8 z, u8 r, u8 g, u8 b) {
    info->type = LIGHT_DIRECTIONAL;
    info->params.dir.x = x;
    info->params.dir.y = y;
    info->params.dir.z = z;
    info->params.dir.color[0] = r;
    info->params.dir.color[1] = g;
    info->params.dir.color[2] = b;

    // The original engine didn't have a specular size, just make something up as a default.
    info->params.dir.specularSize = 3;
}

void Lights_DirectionalSetSpecularSize(LightInfo* info, u8 size) {
#if ENABLE_F3DEX3
    info->params.dir.specularSize = size;
#endif
}

//
//  Light Context
//

void LightContext_Init(PlayState* play, LightContext* lightCtx) {
    lightCtx->listHead = NULL;
    lightCtx->ambientColor[0] = lightCtx->ambientColor[1] = lightCtx->ambientColor[2] = 80;
    lightCtx->fogColor[0] = lightCtx->fogColor[1] = lightCtx->fogColor[2] = 0;
    lightCtx->fogNear = ENV_FOGNEAR_MAX;
    lightCtx->zFar = ENV_ZFAR_MAX;

    bzero(&sLightsBuffer, sizeof(sLightsBuffer));
}

void LightContext_DestroyList(PlayState* play, LightContext* lightCtx) {
    LightNode* lightNode = lightCtx->listHead;

    while (lightNode != NULL) {
        LightNode* next = lightNode->next;
        LightContext_RemoveLight(play, lightCtx, lightNode);
        lightNode = next;
    }
}

//
//  Light List
//

/**
 * Finds an available slot in the lights buffer. It's unclear why it was originally designed like this considering the
 * LightNode could've just been in for example an actor struct rather than in a dedicated buffer for all of them, but
 * it's too large a change currently to completely redo this.
 */
STATIC LightNode* Lights_FindBufSlot(void) {
    static_assert(LIGHTS_BUFFER_SIZE == 32, "Bitset handling assumes the light buffer is 32 entries large.");

    u32 bitset = sLightsBuffer.occupiedBitSet;
    u32 nbitset = ~bitset;

    if (nbitset == 0) {
        // No free slots
        return NULL;
    }

    // Compare the lower 16-bits of the complement against 0.
    // If the lower 16-bits of the complement is exactly 0, it means the lower 16-bits of the bitset must be 0xFFFF.
    // 0xFFFF indicates the bitset is half-full, skip the lower half
    u32 i = ((u16)nbitset == 0) << 4;
    // If the lower 16 bits are full, start at position 16 (1 << 4 = 16, 0 << 4 = 0)
    bitset >>= i;
    // Find the first zero
    while (bitset & 1) {
        bitset >>= 1;
        i++;
    }

    // Get the light, should be free
    LightNode* light = &sLightsBuffer.lights[i];
    assert(light->info == NULL);

    // Mark it as occupied
    sLightsBuffer.occupiedBitSet |= 1 << i;
    return light;
}

#undef LightContext_InsertLight
/**
 * Insert a new light into the current light list.
 *
 * Note: Due to the limited number of slots in a Lights group, inserting too many lights in the list will result in
 * only the closest lights to the object or camera eye to be bound when drawing. Further, inserting too many lights
 * into the system as a whole will eventually cause lights to be silently dropped.
 */
LightNode* LightContext_InsertLight(PlayState* play, LightContext* lightCtx,
                                    LightInfo* info LIGHTS_DEBUG_ARGS(const char* file, int line)) {
    LightNode* light = Lights_FindBufSlot();
    if (light == NULL) {
        // No space left
        return NULL;
    }

    // Record file and line information for debug
#if IS_DEBUG
    light->file = file;
    light->line = line;
#endif

    // Bind light info
    light->info = info;

    // Link
    light->prev = NULL;
    light->next = lightCtx->listHead;
    if (lightCtx->listHead != NULL) {
        lightCtx->listHead->prev = light;
    }
    lightCtx->listHead = light;

    return light;
}

/**
 * Removes a light from the current light list.
 */
void LightContext_RemoveLight(PlayState* play, LightContext* lightCtx, LightNode* light) {
    if (light == NULL) {
        // The light ended up unallocated due to lack of space, silently return
        return;
    }

    // The light pointer must be in the lights buffer
    assert(light >= &sLightsBuffer.lights[0] && light < &sLightsBuffer.lights[LIGHTS_BUFFER_SIZE]);
    // Index in the light buffer
    u32 i = light - &sLightsBuffer.lights[0];

    // Check for double free: if info is NULL or the slot is supposed to be unoccupied there's something wrong
    assertf(light->info != NULL && (sLightsBuffer.occupiedBitSet & (1 << i)),
            "Double free in lights\n"
            "i=%u node=p%08X info=p%08X occupied=%08X\n"
            "[file=%s, line=%d]\n\n",
            i, light, light->info, sLightsBuffer.occupiedBitSet, light->file, light->line);

    // Unlink
    if (light->prev != NULL) {
        light->prev->next = light->next;
        light->prev = NULL;
    } else {
        lightCtx->listHead = light->next;
    }
    if (light->next != NULL) {
        light->next->prev = light->prev;
        light->next = NULL;
    }

    // Unbind light info
    light->info = NULL;
    // Mark not occupied
    sLightsBuffer.occupiedBitSet &= ~(1 << i);
}

#undef LightContext_InsertLightList
/**
 * Insert a list of lights into the current light list. The same length limitations apply as with inserting single
 * lights, see `LightContext_InsertLight` for details.
 *
 * @param lightList The list of light structures to insert.
 * @param numLights Pointer to the number of light structures to insert. The value held may be shrunk to the actual
 *                  number of lights inserted if some lights were dropped due to running out of space.
 *
 * @return Pointer to the first LightNode structure for this list. Can be passed to `LightContext_RemoveLightList`
 *         along with the output in `numLights` to deallocate the entire list.
 *
 * @see LightContext_InsertLight
 * @see LightContext_RemoveLightList
 */
LightNode* LightContext_InsertLightList(PlayState* play, LightContext* lightCtx, LightInfo* lightList,
                                        u32* numLights LIGHTS_DEBUG_ARGS(const char* file, int line)) {
    LightNode* first = NULL;
    u32 numLightsIn = *numLights;
    u32 i;

    for (i = 0; i < numLightsIn; i++) {
        // Try and insert the light
        LightNode* light = LightContext_InsertLight(play, lightCtx, &lightList[i] LIGHTS_DEBUG_ARGS(file, line));

        if (light == NULL) {
            // No room, return the true number of lights inserted for possible removal later
            *numLights = i;
            break;
        }

        // LightContext_InsertLight inserts lights by adding them at the start of the lightCtx->listHead linked list
        assert(light == lightCtx->listHead);
        // This means the first light corresponding to the added lights in order of forward traversal of
        // lightCtx->listHead, is the last inserted light.
        // Record pointer to first light for possible removal later.
        first = light;
    }
    return first;
}

/**
 * Removes `numLights` starting at `firstLight` from the current light list.
 */
void LightContext_RemoveLightList(PlayState* play, LightContext* lightCtx, LightNode* firstLight, u32 numLights) {
    LightNode* light = firstLight;
    u32 i;

    for (i = 0; i < numLights && light != NULL; i++) {
        LightNode* next = light->next;
        LightContext_RemoveLight(play, lightCtx, light);
        light = next;
    }
}

//
//  Light Binding
//

STATIC Light* Lights_FindSlot(Lights* lights, f32 objDist) {
    if (lights->numLights < G_MAX_LIGHTS) {
        // There's still a free slot, add it unconditionally.
        lights->distances[lights->numLights] = objDist;
        return &lights->l.l[lights->numLights++];
    }

    // Search for the slot with the farthest light from the object being lit
    f32 farthestDist = objDist;
    s32 farthestI = -1;
    for (s32 i = 0; i < G_MAX_LIGHTS; i++) {
        if (farthestDist < lights->distances[i]) {
            // Largest distance found in the list so far, note it down
            farthestDist = lights->distances[i];
            farthestI = i;
        }
    }
    if (farthestI == -1) {
        // The light we're trying to add is the farthest light, reject it.
        return NULL;
    }

    // Replace the farthest light with the new light
    lights->distances[farthestI] = farthestDist;
    return &lights->l.l[farthestI];
}

#if !ENABLE_F3DEX3
STATIC void Lights_BindPointWithReference(Lights* restrict lights, LightParams* restrict params, Vec3f* objPos) {
    if (params->point.kc == 0) {
        return;
    }
    // Ignore (0,0,0)-colored lights
    if ((params->point.color[0] | params->point.color[1] | params->point.color[2]) == 0) {
        return;
    }

    Vec3f posF;
    posF.x = params->point.x;
    posF.y = params->point.y;
    posF.z = params->point.z;

    Vec3f refDiff;
    refDiff.x = posF.x - objPos->x;
    refDiff.y = posF.y - objPos->y;
    refDiff.z = posF.z - objPos->z;

    f32 refDistSQ = SQ(refDiff.x) + SQ(refDiff.y) + SQ(refDiff.z);

    // Try to add this light to the group

    Light* light = Lights_FindSlot(lights, sqrtf(refDistSQ));
    if (light == NULL) {
        // Fail, quit early.
        return;
    }

    // Success, build the light structure

    f32 refDistBugSQ = refDistSQ + SQ(refDiff.z); // Square of z is doubled in F3DEX2, this is a ucode bug
    f32 refDistBug = sqrtf(refDistBugSQ);

    // Compute the factor by which to scale light intensity, following the point light microcode attenuation calculation
    // for consistency between ucode and "fake" point lights.
    f32 kc = params->point.kc;
    f32 kl = params->point.kl;
    f32 kq = params->point.kq;
    f32 scale = 1.0f / ((kq / 524288.0f) * refDistBugSQ + (kl / 32768.0f) * refDistBug + (kc / 16.0f) + 0.5f);
    light->l.col[0] = light->l.colc[0] = params->point.color[0] * scale;
    light->l.col[1] = light->l.colc[1] = params->point.color[1] * scale;
    light->l.col[2] = light->l.colc[2] = params->point.color[2] * scale;

    // Set light direction based on direction vector to the object, F3DEX2 normalizes the direction with the bugged
    // length.
    scale = (refDistBug < 1.0f) ? 120.0f : 120.0f / refDistBug;
    light->l.dir[0] = refDiff.x * scale;
    light->l.dir[1] = refDiff.y * scale;
    light->l.dir[2] = refDiff.z * scale;

    // Not a ucode point light
    light->l.pad1 = 0;
}
#else
#define Lights_BindPointWithReference Lights_BindPoint
#endif

STATIC void Lights_BindPoint(Lights* restrict lights, LightParams* restrict params, Vec3f* objPos) {
    if (params->point.kc == 0) {
        return;
    }
    // Ignore (0,0,0)-colored lights
    if ((params->point.color[0] | params->point.color[1] | params->point.color[2]) == 0) {
        return;
    }

    Vec3f posF;
    posF.x = params->point.x;
    posF.y = params->point.y;
    posF.z = params->point.z;

    // Try to add this light to the group

    Light* light = Lights_FindSlot(lights, Math_Vec3f_DistXYZ(objPos, &posF));
    if (light == NULL) {
        // Fail, quit early.
        return;
    }

    // Success, build the light structure

    light->p.col[0] = light->p.colc[0] = params->point.color[0];
    light->p.col[1] = light->p.colc[1] = params->point.color[1];
    light->p.col[2] = light->p.colc[2] = params->point.color[2];

    light->p.pos[0] = params->point.x;
    light->p.pos[1] = params->point.y;
    light->p.pos[2] = params->point.z;

#if ENABLE_F3DEX3
    // Set specular size
    light->p.size = params->point.specularSize;
#endif

    // Set attenuation coefficients
    light->p.kc = params->point.kc;
    light->p.kl = params->point.kl;
    light->p.kq = params->point.kq;

#ifdef LIGHTS_DEBUG
    PRINTF("LIGHTS BOUND Point col=[%u,%u,%u] pos=[%d,%d,%d] size=%u att=[%u,%u,%u]\n", light->p.col[0],
           light->p.col[1], light->p.col[2], light->p.pos[0], light->p.pos[1], light->p.pos[2], light->p.size,
           light->p.kc, light->p.kl, light->p.kq);
#endif
}

STATIC void Lights_BindDirectional(Lights* restrict lights, LightParams* restrict params, UNUSED Vec3f* objPos) {
    // objPos is ignored for directional lights

    // Ignore (0,0,0)-colored lights
    if ((params->dir.color[0] | params->dir.color[1] | params->dir.color[2]) == 0) {
        return;
    }

    // Treat directional lights as being as close as possible to the camera eye so they are always considered
    // (except in the case where there are too many directional lights, in which case it's going to depend on
    // insertion order)
    Light* light = Lights_FindSlot(lights, 0.0f);
    if (light == NULL) {
        return;
    }

    light->l.col[0] = light->l.colc[0] = params->dir.color[0];
    light->l.col[1] = light->l.colc[1] = params->dir.color[1];
    light->l.col[2] = light->l.colc[2] = params->dir.color[2];

    light->l.dir[0] = params->dir.x;
    light->l.dir[1] = params->dir.y;
    light->l.dir[2] = params->dir.z;

#if ENABLE_F3DEX3
    // Set specular size
    light->l.size = params->dir.specularSize;
#endif

    // Flag this light as not a point light
#if ENABLE_F3DEX3
    light->l.type = 0;
#else
    light->l.pad1 = 0;
#endif

#ifdef LIGHTS_DEBUG
    PRINTF("LIGHTS BOUND Directional col=[%u,%u,%u] dir=[%d,%d,%d] size=%u\n", light->l.col[0], light->l.col[1],
           light->l.col[2], light->l.dir[0], light->l.dir[1], light->l.dir[2], light->l.size);
#endif
}

STATIC void Lights_BindDummy(UNUSED Lights* lights, UNUSED LightParams* params, UNUSED Vec3f* objPos) {
    // Empty
}

//
//  Light Drawing
//

void Lights_ResetDrawState(void) {
    sLightsBuffer.lastLights = NULL;
#ifdef LIGHTS_DEBUG
    PRINTF("Lights reset\n");
#endif
}

/**
 * For every light registered with the Light Context, build a Lights group for the highest priority lights, up to
 * G_MAX_LIGHTS. Directional lights are given highest priority, point lights (real and "fake") are given priority based
 * on their proximity to `objPos`, or the camera eye position if `objPos` is NULL, as these lights will have the
 * greatest visible effect on the geometry they are intended to light.
 * This system will fail to alleviate visual artifacts caused by the ucode light limit if too many lights are crammed
 * into a small area.
 *
 * Once the Lights group has been constructed, lighting gbi commands will be appended to the POLY_OPA_DISP and
 * POLY_XLU_DISP buffers so that subsequently drawn geometry will be affected by these lights. Once all the target
 * geometry has been drawn, it is recommended to use Lights_Pop() to delete any lights structures that ended up going
 * unused, e.g. if geometry was only drawn to POLY_OPA_DISP.
 *
 * @param play
 *      Play Game State.
 * @param objPos
 *      The position of the object these lights are for. Used for computing the direction for "fake" point lights and
 *      for selecting which lights to prioritize when there are more than G_MAX_LIGHTS registered. May be NULL, in which
 *      case the current active camera's eye position is used instead to judge which lights should be prioritized.
 * @param realPointLights
 *      Boolean indicating whether the geometry that will be drawn with these lights supports the use of real point
 *      lighting. This is only relevant for F3DEX2, in F3DEX3 all geometry supports real point lights.
 *      In F3DEX2, geometry allows real point lights if whenever G_LIGHTING is on, G_LIGHTING_POSITIONAL is also on.
 *      If G_LIGHTING were on and G_LIGHTING_POSITIONAL were off and we used real point light structures, the microcode
 *      would interpret the PosLight_t structure as a Light_t structure leading to problems e.g. flickering geometry.
 *      Ensure that whenever this is true the geometry that is subsequently drawn is compatible.
 *
 * @return The resulting Lights group containing all lights that have been selected by highest priority.
 *         NOTE this data is only valid until the end of the current frame, do not store pointers to this data in any
 *         persistent location!
 */
Lights* Lights_BindAndDraw(PlayState* play, Vec3f* objPos, s32 realPointLights) {
    // Real point light bind functions
    static const LightsBindFunc posBindFuncs[] = {
        Lights_BindPoint,
        Lights_BindDirectional,
        Lights_BindPoint,
    };
    // "Fake" point light bind functions
    static const LightsBindFunc dirBindFuncs[] = {
        Lights_BindPointWithReference,
        Lights_BindDirectional,
        Lights_BindPointWithReference,
    };
    // No point light bind function
    static const LightsBindFunc dirOnlyBindFuncs[] = {
        Lights_BindDummy,
        Lights_BindDirectional,
        Lights_BindDummy,
    };

    // Select bind functions
    const LightsBindFunc* bindFuncs;
    if (ENABLE_F3DEX3 || realPointLights) {
        // If the geometry that will be drawn with these lights allows real point lights, always use them.
        // In F3DEX3, geometry always allows real point lights, so this is used unconditionally in that case.
        // In F3DEX2, geometry allows real point lights if whenever G_LIGHTING is on, G_LIGHTING_POSITIONAL is also on.
        // If G_LIGHTING were on and G_LIGHTING_POSITIONAL were off and we used real point light structures, the ucode
        // would interpret the PosLight_t structure as a Light_t structure leading to problems e.g. flickering.
        bindFuncs = posBindFuncs;
    } else if (objPos == NULL) {
        // If there is no defined object position, e.g. for lighting room geometry or a group of objects, we can't use
        // the "fake" point lights either so we select the dummy bind functions that totally ignore point-type lights.
        // This mirrors vanilla oot behavior.
        bindFuncs = dirOnlyBindFuncs;
    } else {
        // We don't allow real point lights, likely because the material settings of whatever we're going to draw does
        // not properly support them, but we have a defined object position. In this case allow "fake" point lights.
        bindFuncs = dirBindFuncs;
    }

    // If there was no defined object position, select the camera eye position as the reference position for
    // prioritizing lights. The hope is this gives an approximately correct image overall.
    if (objPos == NULL) {
        Camera* activeCam = GET_ACTIVE_CAM(play);
        assert(activeCam != NULL);
        objPos = &activeCam->eye;
    }

    // Allocate lights group, deallocates by next frame
    Lights* lights = GRAPH_ALLOC(play->state.gfxCtx, sizeof(Lights));
    // Zero the Lightsn substruct so we can memcmp it safely
    bzero(&lights->l, sizeof(lights->l));

    // Initialize the number of lights in the group to 0
    lights->numLights = 0;
    // Note that we do not initialize the lights->distances array here, as by the time anything is read from that array
    // all of the array elements will have been set

    // Populate this lights group
    FOR_EACH_LIGHTNODE(lightNode, play->lightCtx.listHead) {
        LightInfo* info = lightNode->info;
        bindFuncs[info->type](lights, &info->params, objPos);
    }

    // Better not have gone over the ucode limitation
    assert(lights->numLights <= G_MAX_LIGHTS);

#if !ENABLE_F3DEX3
    if (lights->numLights == 0) {
        // An F3DEX2 ucode limitation: Lights0 still requires at least one other light alongside ambient.. add a dummy.
        // F3DEX3 does not require this special handling.
        // We already zero'd Lightsn above, but if that wasn't there we'd need to zero at least the first directional
        // light here.
        // lights->l.l[0] = (Light){ 0 };
        lights->numLights = 1;
    }
#endif

    // Configure ambient color
#if ENABLE_F3DEX3
    // F3DEX3: Copy ambient to light slot immediately following the last light
    lights->l.l[lights->numLights].l.col[0] = lights->l.l[lights->numLights].l.colc[0] = play->lightCtx.ambientColor[0];
    lights->l.l[lights->numLights].l.col[1] = lights->l.l[lights->numLights].l.colc[1] = play->lightCtx.ambientColor[1];
    lights->l.l[lights->numLights].l.col[2] = lights->l.l[lights->numLights].l.colc[2] = play->lightCtx.ambientColor[2];
#else
    // F3DEX2: Assign ambient color to ambient structure
    lights->l.a.l.col[0] = lights->l.a.l.colc[0] = play->lightCtx.ambientColor[0];
    lights->l.a.l.col[1] = lights->l.a.l.colc[1] = play->lightCtx.ambientColor[1];
    lights->l.a.l.col[2] = lights->l.a.l.colc[2] = play->lightCtx.ambientColor[2];
#endif

    // Apply the lights to the gfx command list
    OPEN_DISPS(play->state.gfxCtx);

    // Check that the previously submitted lights for this frame (if it exists) is not the same as the new lights.
    // If the number of lights differs from before we always have to resubmit.
    if (sLightsBuffer.lastLights != NULL && lights->numLights == sLightsBuffer.lastLights->numLights) {
        // If the number of lights is the same, compare the data contents.
        if (bcmp(&lights->l, &sLightsBuffer.lastLights->l, lights->numLights * sizeof(Light) + sizeof(Ambient)) == 0) {
            // Data contents matches, skip submitting new lights.
#ifdef LIGHTS_DEBUG
            PRINTF("Lights skipped (identical structure submitted)\n");
#endif
#if IS_DEBUG
            gDPNoOpString(POLY_OPA_DISP++, "Lights skipped (identical structure submitted)", 0);
            gDPNoOpString(POLY_XLU_DISP++, "Lights skipped (identical structure submitted)", 0);
#endif
            goto skip;
        }
#ifdef LIGHTS_DEBUG
        PRINTF("Lights have nonmatching data contents, need to resubmit\n");
#endif
        // Data contents did not match, we need to submit new lights.
    }
    sLightsBuffer.lastLights = lights;

#ifdef LIGHTS_DEBUG
    PRINTF("Submit %u Lights\n", lights->numLights);
#endif

#if ENABLE_F3DEX3
    // F3DEX3: Use the provided macro to set the number of lights and transfer all lights in one DMA
    gSPSetLights(POLY_OPA_DISP++, lights->numLights, lights->l);
    gSPSetLights(POLY_XLU_DISP++, lights->numLights, lights->l);
#else
    // F3DEX2: Supply each light separately

    // Set number of lights
    gSPNumLights(POLY_OPA_DISP++, lights->numLights);
    gSPNumLights(POLY_XLU_DISP++, lights->numLights);

    // Directional and Point lights
    Light* light;
    s32 i;
    for (light = &lights->l.l[0], i = 0; i < lights->numLights; i++, light++) {
        gSPLight(POLY_OPA_DISP++, light, 1 + i);
        gSPLight(POLY_XLU_DISP++, light, 1 + i);
    }

    // Ambient light
    gSPLight(POLY_OPA_DISP++, &lights->l.a, 1 + i);
    gSPLight(POLY_XLU_DISP++, &lights->l.a, 1 + i);
#endif

skip:
    CLOSE_DISPS(play->state.gfxCtx);

    return lights;
}

STATIC s32 Lights_PopOne(Gfx** gfxP) {
#define GBI_IS_NOOP(gW0) (((gW0) >> 24) == G_NOOP)
#if ENABLE_F3DEX3
    // F3DEX3 lights assignments look like (from most to least recently appended)
    // gsMoveMem(...)
    // gsSPNumLights(...)
#define GBI_IS_LIGHTS(gW0) \
    (((gW0)&0xFF00FFFF) == (((Gfx)gsDma2p(G_MOVEMEM, NULL, 0, G_MV_LIGHT, 0x10)).words.w0 & 0xFF00FFFF))
    // We only need to rewind at most one command besides SPNumLights, no loop
#define WHILE_GBI_IS_LIGHTS(gW0) if (GBI_IS_LIGHTS(gW0))
#else
    // F3DEX2 lights assignments look like (from most to least recently appended)
    // gsSPLight(...)
    // [...]
    // gsSPLight(...)
    // gsSPNumLights(...)
#define GBI_IS_LIGHTS(gW0) (((gW0)&0xFFFF00FF) == (((Gfx)gsSPLight(0, 0)).words.w0 & 0xFFFF00FF))
    // We need to rewind them one-by-one, use a loop
#define WHILE_GBI_IS_LIGHTS(gW0) while (GBI_IS_LIGHTS(gW0))
#endif
#define GBI_IS_NUMLIGHTS(gW0) ((gW0) == ((Gfx)gsSPNumLights(0)).words.w0)

    s32 didPop = false;
    Gfx* gfx = *gfxP;
    gfx--;
    u32 gW0 = gfx->words.w0;

#if IS_DEBUG
    if (GBI_IS_NOOP(gW0)) {
        // gsDPNoOpCloseDisp
        // ignore
        gfx--;
        gW0 = gfx->words.w0;
    }
#endif

    WHILE_GBI_IS_LIGHTS(gW0) {
        // gsSPLight or gsMoveMem
        // replace with no-op
        gDPNoOpString(gfx, "Replaced Light", 0);
        didPop = true;

        gfx--;
        gW0 = gfx->words.w0;
    }

    if (GBI_IS_NUMLIGHTS(gW0)) {
        // gsSPNumLights
        // replace with no-op
        gDPNoOpString(gfx, "Replaced NumLights", 0);
        didPop = true;
    }

#if !IS_DEBUG
    // Allow the no-ops to be replaced with new commands
    *gfxP = gfx;
#endif
    return didPop;
}

/**
 * "Rewinds" the gfx buffer to delete lights assignments that were not used.
 *
 * Any gfx commands (besides G_NOOP in debug) will cause the lights commands to be kept. One could imagine processing
 * the gfx buffer until it finds vertices being loaded with G_LIGHTING set in the geometry mode, however this simple
 * approach is sufficient to capture most cases in practice. In particular, it's enough to drop lights assignments
 * for actors that only draw to POLY_OPA_DISP or POLY_XLU_DISP and not both, avoiding a great deal of useless light
 * loading.
 */
void Lights_Pop(PlayState* play) {
    s32 didPop = 0;
    didPop += Lights_PopOne(&play->state.gfxCtx->polyOpa.p);
    didPop += Lights_PopOne(&play->state.gfxCtx->polyXlu.p);
    if (didPop) {
#ifdef LIGHTS_DEBUG
        PRINTF("Lights popped (%d/2 disps)\n", didPop);
#endif
        // Since light structures were popped from the gfx buffer, we must resubmit them next time.
        sLightsBuffer.lastLights = NULL;
    }
}

//
// Lights Utilities
//

/**
 * Compute the facing direction of a light.
 *
 * For directional lights, this is just the direction in the structure.
 * For point lights, this is computed as the direction between the light and the specified object position.
 */
void Lights_GetDirection(Light* light, Vec3f* objPos, s8* lightDir) {
    if (G_LIGHT_IS_POSLIGHT(light)) {
        // Point light, compute the direction to the object
        Vec3f diff = {
            light->p.pos[0] - objPos->x,
            light->p.pos[1] - objPos->y,
            light->p.pos[2] - objPos->z,
        };
        f32 norm = sqrt(SQ(diff.x) + SQ(diff.y) + SQ(diff.z));
        f32 scale = (norm < 1.0f) ? 120.0f : 120.0f / norm;
        lightDir[0] = diff.x * scale;
        lightDir[1] = diff.y * scale;
        lightDir[2] = diff.z * scale;
    } else {
        // Directional light, trust the direction
        lightDir[0] = light->l.dir[0];
        lightDir[1] = light->l.dir[1];
        lightDir[2] = light->l.dir[2];
    }
}

//
//  Glow Effects
//

void Lights_GlowCheck(PlayState* play) {
    FOR_EACH_LIGHTNODE(lightNode, play->lightCtx.listHead) {
        if (lightNode->info->type != LIGHT_POINT_GLOW) {
            continue;
        }

        LightPoint* params = &lightNode->info->params.point;
        Vec3f pos;
        Vec3f multDest;
        f32 cappedInvWDest;
        f32 wX;
        f32 wY;

        params->drawGlow = false;
        pos.x = params->x;
        pos.y = params->y;
        pos.z = params->z;
        Actor_ProjectPos(play, &pos, &multDest, &cappedInvWDest);
        wX = multDest.x * cappedInvWDest;
        wY = multDest.y * cappedInvWDest;

        if (multDest.z > 1.0f && fabsf(wX) < 1.0f && fabsf(wY) < 1.0f) {
            // Compute screen z value assuming the viewport scale and translation both have value G_MAXZ / 2
            // The multiplication by 32 follows from how the RSP microcode computes the screen z value.
            s32 wZ = (s32)((multDest.z * cappedInvWDest) * ((G_MAXZ / 2) * 32)) + ((G_MAXZ / 2) * 32);

            // Obtain the z-buffer value for the screen pixel corresponding to the center of the glow.
            s32 scrX = (wX * (SCREEN_WIDTH / 2)) + (SCREEN_WIDTH / 2);
            s32 scrY = (wY * -(SCREEN_HEIGHT / 2)) + (SCREEN_HEIGHT / 2);
            s32 zBuf = gZBuffer[scrY][scrX];

            // Compare the computed screen z value to the integer part of the z-buffer value in fixed point. If
            // it is less than the value from the z-buffer the depth test passes and the glow can draw.
            if (wZ < (Environment_ZBufValToFixedPoint(zBuf << 2) >> 3)) {
                params->drawGlow = true;
            }
        }
    }
}

void Lights_DrawGlow(PlayState* play) {
    static Gfx sGlowSetupDL[] = {
        gsDPPipeSync(),
        gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
        gsDPSetCombineLERP(0, 0, 0, PRIMITIVE, TEXEL0, 0, PRIMITIVE, 0, 0, 0, 0, PRIMITIVE, TEXEL0, 0, PRIMITIVE, 0),
        gsDPSetOtherMode(G_AD_NOISE | G_CD_MAGICSQ | G_CK_NONE | G_TC_FILT | G_TF_BILERP | G_TT_NONE | G_TL_TILE |
                             G_TD_CLAMP | G_TP_PERSP | G_CYC_1CYCLE | G_PM_NPRIMITIVE,
                         G_AC_THRESHOLD | G_ZS_PIXEL | G_RM_CLD_SURF | G_RM_CLD_SURF2),
        gsSPLoadGeometryMode(G_SHADE | G_SHADING_SMOOTH),
        gsSPBranchListHint(gGlowCircleTextureLoadDL, 8),
    };

    // Check if there are any glow lights before appending any gfx commands
    s32 hasGlow = false;
    FOR_EACH_LIGHTNODE(lightNode, play->lightCtx.listHead) {
        if (lightNode->info->type == LIGHT_POINT_GLOW) {
            hasGlow = true;
            break;
        }
    }
    if (!hasGlow) {
        return;
    }

    OPEN_DISPS(play->state.gfxCtx);

    gSPDisplayListHint(POLY_XLU_DISP++, sGlowSetupDL, ARRAY_COUNT(sGlowSetupDL));

    FOR_EACH_LIGHTNODE(lightNode, play->lightCtx.listHead) {
        if (lightNode->info->type != LIGHT_POINT_GLOW) {
            continue;
        }

        LightPoint* params = &lightNode->info->params.point;
        if (!params->drawGlow) {
            continue;
        }

        // gGlowCircleDL is 1000x1000 in model space so scale by 0.001. Also scale by a further 0.0026 to get it
        // proportionally right.
        f32 scale = SQ(params->glowRadius) * 0.0026f * 0.001f;

        Matrix_Translate(params->x, params->y, params->z, MTXMODE_NEW);
        Matrix_Scale(scale, scale, scale, MTXMODE_APPLY);
        gSPMatrix(POLY_XLU_DISP++, MATRIX_NEW(play->state.gfxCtx), G_MTX_NOPUSH | G_MTX_LOAD | G_MTX_MODELVIEW);
        gDPSetPrimColor(POLY_XLU_DISP++, 0, 0, params->color[0], params->color[1], params->color[2], 50);
        gSPDisplayListHint(POLY_XLU_DISP++, gGlowCircleDL, 4);
    }

    CLOSE_DISPS(play->state.gfxCtx);
}
