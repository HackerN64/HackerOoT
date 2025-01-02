#ifndef Z64BGCHECK_H
#define Z64BGCHECK_H

#include "ultra64/ultratypes.h"
#include "z64math.h"

struct PlayState;
struct Actor;
struct DynaPolyActor;

#define DYNAPOLY_INVALIDATE_LOOKUP (1 << 0)

#define BGACTOR_NEG_ONE -1
#define BG_ACTOR_MAX 50
#define BGCHECK_SCENE BG_ACTOR_MAX
#define BGCHECK_Y_MIN -32000.0f
#define BGCHECK_XYZ_ABSMAX 32760.0f
#define BGCHECK_SUBDIV_OVERLAP 50
#define BGCHECK_SUBDIV_MIN 150.0f

#define FUNC_80041EA4_RESPAWN 5
#define FUNC_80041EA4_MOUNT_WALL 6
#define FUNC_80041EA4_STOP 8
#define FUNC_80041EA4_VOID_OUT 12

typedef struct {
    /* 0x00 */ Vec3f scale;
    /* 0x0C */ Vec3s rot;
    /* 0x14 */ Vec3f pos;
} ScaleRotPos; // size = 0x20

// Macros for `CollisionPoly`

#define COLPOLY_NORMAL_FRAC (1.0f / SHT_MAX)
#define COLPOLY_SNORMAL(x) ((s16)((x) * SHT_MAX))
#define COLPOLY_GET_NORMAL(n) ((n)*COLPOLY_NORMAL_FRAC)
#define COLPOLY_VTX_CHECK_FLAGS_ANY(vI, flags) ((vI) & (((flags) & 7) << 13))
#define COLPOLY_VTX_FLAGS_MASKED(vI) ((vI) & 0xE000)
#define COLPOLY_VTX_INDEX(vI) ((vI) & 0x1FFF)
#define COLPOLY_VTX(vtxId, flags) ((((flags) & 7) << 13) | ((vtxId) & 0x1FFF))

// flags for flags_vIA
// poly exclusion flags (xpFlags)
#define COLPOLY_IGNORE_NONE 0
#define COLPOLY_IGNORE_CAMERA (1 << 0)
#define COLPOLY_IGNORE_ENTITY (1 << 1)
#define COLPOLY_IGNORE_PROJECTILES (1 << 2)

// flags for flags_vIB
#define COLPOLY_IS_FLOOR_CONVEYOR (1 << 0)

typedef struct {
    /* 0x00 */ u16 type;
    union {
        u16 vtxData[3];
        struct {
            /* 0x02 */ u16 flags_vIA; // 0xE000 is poly exclusion flags (xpFlags), 0x1FFF is vtxId
            /* 0x04 */ u16 flags_vIB; // 0xE000 is flags, 0x1FFF is vtxId
                                      // 0x2000 = poly IsFloorConveyor surface
            /* 0x06 */ u16 vIC;
        };
    };
    /* 0x08 */ Vec3s normal; // Unit normal vector
                             // Value ranges from -0x7FFF to 0x7FFF, representing -1.0 to 1.0; 0x8000 is invalid

    /* 0x0E */ s16 dist; // Plane distance from origin along the normal
} CollisionPoly; // size = 0x10

typedef struct {
    /* 0x0 */ u16 setting; // camera setting described by CameraSettingType enum
    /* 0x2 */ s16 count; // only used when `bgCamFuncData` is a list of points used for crawlspaces
    /* 0x4 */ Vec3s* bgCamFuncData; // s16 data grouped in threes (ex. Vec3s), is usually of type `BgCamFuncData`, but can be a list of points of type `Vec3s` for crawlspaces
} BgCamInfo; // size = 0x8

// The structure used for all instances of s16 data from `BgCamInfo` with the exception of crawlspaces.
// See `Camera_Subj4` for Vec3s data usage in crawlspaces
typedef struct {
    /* 0x00 */ Vec3s pos;
    /* 0x06 */ Vec3s rot;
    /* 0x0C */ s16 fov;
    /* 0x0E */ union {
        s16 roomImageOverrideBgCamIndex;
        s16 timer;
        s16 flags;
    };
    /* 0x10 */ s16 unk_10; // unused
} BgCamFuncData; // size = 0x12

// Macros for `WaterBox.properties`

#define WATERBOX_LIGHT_INDEX_NONE 0x1F // warns and defaults to 0

#define WATERBOX_ROOM(properties) (((properties) >> 13) & 0x3F)
#define WATERBOX_ROOM_ALL 0x3F // value for "room index" indicating "all rooms"

#define WATERBOX_FLAG_19 (1 << 19)

#define WATERBOX_PROPERTIES(bgCamIndex, lightIndex, room, setFlag19) \
    ((((bgCamIndex) & 0xFF) <<  0) | \
     (((lightIndex) & 0x1F) <<  8) | \
     (((room)       & 0x3F) << 13) | \
     (((setFlag19)  &    1) << 19))

typedef struct {
    /* 0x00 */ s16 xMin;
    /* 0x02 */ s16 ySurface;
    /* 0x04 */ s16 zMin;
    /* 0x06 */ s16 xLength;
    /* 0x08 */ s16 zLength;
    /* 0x0C */ u32 properties;
} WaterBox; // size = 0x10

typedef enum {
    /*  0 */ FLOOR_TYPE_0,
    /*  1 */ FLOOR_TYPE_1,
    /*  2 */ FLOOR_TYPE_2,
    /*  3 */ FLOOR_TYPE_3,
    /*  4 */ FLOOR_TYPE_4,
    /*  5 */ FLOOR_TYPE_5,
    /*  6 */ FLOOR_TYPE_6,
    /*  7 */ FLOOR_TYPE_7,
    /*  8 */ FLOOR_TYPE_8,
    /*  9 */ FLOOR_TYPE_9,
    /* 10 */ FLOOR_TYPE_10,
    /* 11 */ FLOOR_TYPE_11,
    /* 12 */ FLOOR_TYPE_12
} FloorType;

typedef enum {
    /*  0 */ WALL_TYPE_0,
    /*  1 */ WALL_TYPE_1,
    /*  2 */ WALL_TYPE_2,
    /*  3 */ WALL_TYPE_3,
    /*  4 */ WALL_TYPE_4,
    /*  5 */ WALL_TYPE_5,
    /*  6 */ WALL_TYPE_6,
    /*  7 */ WALL_TYPE_7,
    /*  8 */ WALL_TYPE_8,
    /*  9 */ WALL_TYPE_9,
    /* 10 */ WALL_TYPE_10,
    /* 11 */ WALL_TYPE_11,
    /* 12 */ WALL_TYPE_12,
    /* 32 */ WALL_TYPE_MAX = 32
} WallType;

#define WALL_FLAG_0 (1 << 0)
#define WALL_FLAG_1 (1 << 1)
#define WALL_FLAG_2 (1 << 2)
#define WALL_FLAG_3 (1 << 3)
#define WALL_FLAG_CRAWLSPACE_1 (1 << 4)
#define WALL_FLAG_CRAWLSPACE_2 (1 << 5)
#define WALL_FLAG_6 (1 << 6)
#define WALL_FLAG_CRAWLSPACE (WALL_FLAG_CRAWLSPACE_1 | WALL_FLAG_CRAWLSPACE_2)

typedef enum {
    /*  0 */ FLOOR_PROPERTY_0,
    /*  5 */ FLOOR_PROPERTY_5 = 5,
    /*  6 */ FLOOR_PROPERTY_6,
    /*  7 */ FLOOR_PROPERTY_7,
    /*  8 */ FLOOR_PROPERTY_8,
    /*  9 */ FLOOR_PROPERTY_9,
    /* 11 */ FLOOR_PROPERTY_11 = 11,
    /* 12 */ FLOOR_PROPERTY_12
} FloorProperty;

typedef enum {
    /*  0 */ SURFACE_SFX_OFFSET_DIRT,
    /*  1 */ SURFACE_SFX_OFFSET_SAND,
    /*  2 */ SURFACE_SFX_OFFSET_STONE,
    /*  3 */ SURFACE_SFX_OFFSET_JABU,
    /*  4 */ SURFACE_SFX_OFFSET_WATER_SHALLOW,
    /*  5 */ SURFACE_SFX_OFFSET_WATER_DEEP,
    /*  6 */ SURFACE_SFX_OFFSET_TALL_GRASS,
    /*  7 */ SURFACE_SFX_OFFSET_LAVA, // MAGMA?
    /*  8 */ SURFACE_SFX_OFFSET_GRASS,
    /*  9 */ SURFACE_SFX_OFFSET_CARPET,
    /* 10 */ SURFACE_SFX_OFFSET_WOOD,
    /* 11 */ SURFACE_SFX_OFFSET_BRIDGE, // WOOD_PLANK?
    /* 12 */ SURFACE_SFX_OFFSET_VINE,
    /* 13 */ SURFACE_SFX_OFFSET_IRON_BOOTS,
    /* 14 */ SURFACE_SFX_OFFSET_UNUSED,
    /* 15 */ SURFACE_SFX_OFFSET_ICE
} SurfaceSfxOffset;

typedef enum {
    /*  0 */ SURFACE_MATERIAL_DIRT,
    /*  1 */ SURFACE_MATERIAL_SAND,
    /*  2 */ SURFACE_MATERIAL_STONE,
    /*  3 */ SURFACE_MATERIAL_JABU,
    /*  4 */ SURFACE_MATERIAL_WATER_SHALLOW,
    /*  5 */ SURFACE_MATERIAL_WATER_DEEP,
    /*  6 */ SURFACE_MATERIAL_TALL_GRASS,
    /*  7 */ SURFACE_MATERIAL_LAVA, // MAGMA?
    /*  8 */ SURFACE_MATERIAL_GRASS,
    /*  9 */ SURFACE_MATERIAL_BRIDGE, // WOOD_PLANK?
    /* 10 */ SURFACE_MATERIAL_WOOD,
    /* 11 */ SURFACE_MATERIAL_DIRT_SOFT,
    /* 12 */ SURFACE_MATERIAL_ICE,
    /* 13 */ SURFACE_MATERIAL_CARPET,
    /* 14 */ SURFACE_MATERIAL_MAX
} SurfaceMaterial;

typedef enum {
    /*  0 */ FLOOR_EFFECT_0,
    /*  1 */ FLOOR_EFFECT_1,
    /*  2 */ FLOOR_EFFECT_2
} FloorEffect;

typedef enum {
    /*  0 */ CONVEYOR_SPEED_DISABLED,
    /*  1 */ CONVEYOR_SPEED_SLOW,
    /*  2 */ CONVEYOR_SPEED_MEDIUM,
    /*  3 */ CONVEYOR_SPEED_FAST,
    /*  4 */ CONVEYOR_SPEED_MAX
} ConveyorSpeed;

#define CONVEYOR_DIRECTION_TO_BINANG(conveyorDirection) ((conveyorDirection) * (0x10000 / 64))
#define CONVEYOR_DIRECTION_FROM_BINANG(conveyorDirectionBinang) ((conveyorDirectionBinang) * (64 / 0x10000))

#define SURFACETYPE0(bgCamIndex, exitIndex, floorType, unk18, wallType, floorProperty, isSoft, isHorseBlocked) \
    ((((bgCamIndex)     & 0xFF) <<  0) | \
     (((exitIndex)      & 0x1F) <<  8) | \
     (((floorType)      & 0x1F) << 13) | \
     (((unk18)          & 0x07) << 18) | \
     (((wallType)       & 0x1F) << 21) | \
     (((floorProperty)  & 0x0F) << 26) | \
     (((isSoft)         &    1) << 30) | \
     (((isHorseBlocked) &    1) << 31))

#define SURFACETYPE1(material, floorEffect, lightSetting, echo, canHookshot, conveyorSpeed, conveyorDirection, unk27) \
    ((((material)          & 0x0F) <<  0) | \
     (((floorEffect)       & 0x03) <<  4) | \
     (((lightSetting)      & 0x1F) <<  6) | \
     (((echo)              & 0x3F) << 11) | \
     (((canHookshot)       &    1) << 17) | \
     (((conveyorSpeed)     & 0x07) << 18) | \
     (((conveyorDirection) & 0x3F) << 21) | \
     (((unk27)             &    1) << 27))

typedef struct {
    u32 data[2];
} SurfaceType;

typedef struct {
    /* 0x00 */ Vec3s minBounds; // minimum coordinates of poly bounding box
    /* 0x06 */ Vec3s maxBounds; // maximum coordinates of poly bounding box
    /* 0x0C */ u16 numVertices;
    /* 0x10 */ Vec3s* vtxList;
    /* 0x14 */ u16 numPolygons;
    /* 0x18 */ CollisionPoly* polyList;
    /* 0x1C */ SurfaceType* surfaceTypeList;
    /* 0x20 */ BgCamInfo* bgCamList;
    /* 0x24 */ u16 numWaterBoxes;
    /* 0x28 */ WaterBox* waterBoxes;
} CollisionHeader; // original name: BGDataInfo

typedef struct {
    s16 polyId;
    u16 next; // next SSNode index
} SSNode;

typedef struct {
    u16 head; // first SSNode index
} SSList;

typedef struct {
    /* 0x00 */ u16 max;          // original name: short_slist_node_size
    /* 0x02 */ u16 count;        // original name: short_slist_node_last_index
    /* 0x04 */ SSNode* tbl;      // original name: short_slist_node_tbl
} SSNodeList;

typedef struct {
    SSNode* tbl;
    s32 count;
    s32 max;
} DynaSSNodeList;

typedef struct {
    SSList floor;
    SSList wall;
    SSList ceiling;
} StaticLookup;

typedef struct {
    u16 polyStartIndex;
    SSList ceiling;
    SSList wall;
    SSList floor;
} DynaLookup;

typedef struct {
    /* 0x00 */ struct Actor* actor;
    /* 0x04 */ CollisionHeader* colHeader;
    /* 0x08 */ DynaLookup dynaLookup;
    /* 0x10 */ u16 vtxStartIndex;
    /* 0x14 */ ScaleRotPos prevTransform;
    /* 0x34 */ ScaleRotPos curTransform;
    /* 0x54 */ Sphere16 boundingSphere;
    /* 0x5C */ f32 minY;
    /* 0x60 */ f32 maxY;
} BgActor; // size = 0x64

#define BGACTOR_IN_USE (1 << 0) // The bgActor entry is in use
#define BGACTOR_1 (1 << 1)
#define BGACTOR_COLLISION_DISABLED (1 << 2) // The collision of the bgActor is disabled
#define BGACTOR_CEILING_COLLISION_DISABLED (1 << 3) // The ceilings in the collision of the bgActor are ignored

typedef struct {
    /* 0x0000 */ u8 bitFlag;
    /* 0x0004 */ BgActor bgActors[BG_ACTOR_MAX];
    /* 0x138C */ u16 bgActorFlags[BG_ACTOR_MAX];
    /* 0x13F0 */ CollisionPoly* polyList;
    /* 0x13F4 */ Vec3s* vtxList;
    /* 0x13F8 */ DynaSSNodeList polyNodes;
    /* 0x1404 */ s32 polyNodesMax;
    /* 0x1408 */ s32 polyListMax;
    /* 0x140C */ s32 vtxListMax;
} DynaCollisionContext; // size = 0x1410

typedef struct CollisionContext {
    /* 0x00 */ CollisionHeader* colHeader; // scene's static collision
    /* 0x04 */ Vec3f minBounds;            // minimum coordinates of collision bounding box
    /* 0x10 */ Vec3f maxBounds;            // maximum coordinates of collision bounding box
    /* 0x1C */ Vec3i subdivAmount;         // x, y, z subdivisions of the scene's static collision
    /* 0x28 */ Vec3f subdivLength;         // x, y, z subdivision worldspace lengths
    /* 0x34 */ Vec3f subdivLengthInv;      // inverse of subdivision length
    /* 0x40 */ StaticLookup* lookupTbl;    // 3d array of length subdivAmount
    /* 0x44 */ SSNodeList polyNodes;
    /* 0x50 */ DynaCollisionContext dyna;
    /* 0x1460 */ u32 memSize; // Size of all allocated memory plus CollisionContext
} CollisionContext; // size = 0x1464

typedef struct {
    /* 0x00 */ struct PlayState* play;
    /* 0x04 */ struct CollisionContext* colCtx;
    /* 0x08 */ u16 xpFlags;
    /* 0x0C */ CollisionPoly** resultPoly;
    /* 0x10 */ f32 yIntersect;
    /* 0x14 */ Vec3f* pos;
    /* 0x18 */ s32* bgId;
    /* 0x1C */ struct Actor* actor;
    /* 0x20 */ u32 downChkFlags;
    /* 0x24 */ f32 chkDist;
    /* 0x28 */ DynaCollisionContext* dyna;
    /* 0x2C */ SSList* ssList;
} DynaRaycastDown;

typedef struct {
    /* 0x00 */ struct CollisionContext* colCtx;
    /* 0x04 */ u16 xpFlags;
    /* 0x08 */ DynaCollisionContext* dyna;
    /* 0x0C */ SSList* ssList;
    /* 0x10 */ Vec3f* posA;
    /* 0x14 */ Vec3f* posB;
    /* 0x18 */ Vec3f* posResult;
    /* 0x1C */ CollisionPoly** resultPoly;
    /* 0x20 */ s32 chkOneFace; // bccFlags & 0x8
    /* 0x24 */ f32* distSq;    // distance from posA to poly squared
    /* 0x28 */ f32 chkDist;    // distance from poly
} DynaLineTest;

#endif
