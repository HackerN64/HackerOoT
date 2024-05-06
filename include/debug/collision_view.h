#ifndef HACKEROOT_COLLISION_VIEW_H
#define HACKEROOT_COLLISION_VIEW_H

#include "ultra64.h"

#define qs105(n) ((s16)((n) * 0x0020))

#define gdSPDefVtxN(x, y, z, s, t, nx, ny, nz, ca) \
    ((Vtx){ .n = { .ob = { x, y, z }, .tc = { qs105(s), qs105(t) }, .n = { nx, ny, nz }, .a = ca } })

#define gDisplayListData(pgdl, d)                               \
    ({                                                          \
        Gfx** Gp_ = (void*)(pgdl);                              \
        struct {                                                \
            __typeof__(d) v;                                    \
        } *Gd_, *Gs_;                                           \
        *Gp_ -= (sizeof(*Gd_) + sizeof(Gfx) - 1) / sizeof(Gfx); \
        Gd_ = (void*)*Gp_;                                      \
        Gs_ = (void*)&(d);                                      \
        *Gd_ = *Gs_;                                            \
        &Gd_->v;                                                \
    })

#define MENU_BUFFER_SIZE 0x4000

#define ALIGN(val, align) ((((val) % (align)) != 0) ? (val) + (align) - ((val) % (align)) : (val))

typedef enum ColViewSurfaceWallParams {
    SURFACE_WALL_NO_LEDGE_GRAB = 0x1,
    SURFACE_WALL_LADDER = 0x2,
    SURFACE_WALL_LADDER_TOP = 0x3,
    SURFACE_WALL_VINE = 0x4,
    SURFACE_WALL_CRAWL_A = 0x5,
    SURFACE_WALL_CRAWL_B = 0x6,
    SURFACE_WALL_PUSH = 0x7,
} ColViewSurfaceWallParams;

typedef enum ColViewSurfaceFloorParams {
    SURFACE_FLOOR_VOID_SMALL = 0x5,
    SURFACE_FLOOR_HANG_LEDGE = 0x6,
    SURFACE_FLOOR_STOP_AIR_MOMENTUM = 0x8,
    SURFACE_FLOOR_NO_LEDGE_JUMP = 0x9,
    SURFACE_FLOOR_DIVE = 0xB,
    SURFACE_FLOOR_VOID = 0xC,
} ColViewSurfaceFloorParams;

typedef struct ColViewPolygonTypes {
    // HIGH
    struct {
        u32 blockEpona : 1;
        u32 lowerSurface : 1;
        u32 floorParams : 4;
        u32 wallParams : 5;
        u32 unk_001C0000 : 3;
        u32 behaviour : 5;
        u32 exit : 5;
        u32 camDataIndex : 8;
    };
    // LOW
    struct {
        u32 pad : 4;
        u32 wallDamage : 1;
        u32 conveyorDir : 6;
        u32 conveyorSpeed : 3;
        u32 hookshot : 1;
        u32 echo : 6;
        u32 lightParams : 5;
        u32 slope : 2;
        u32 sfx : 4;
    };
} ColViewPolygonTypes;

u8 CollisionView_Draw(void* unused);

#endif
