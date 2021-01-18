#ifndef _Z64ACTOR_H_
#define _Z64ACTOR_H_

#include "z64dma.h"
#include "z64animation.h"
#include "z64math.h"
#include "z64collision_check.h"

#define ACTOR_NUMBER_MAX 200
#define INVISIBLE_ACTOR_MAX 20
#define AM_FIELD_SIZE 0x27A0
#define MASS_IMMOVABLE 0xFF // Cannot be pushed by OC collisions
#define MASS_HEAVY 0xFE // Can only be pushed by OC collisions with IMMOVABLE and HEAVY objects.

struct Actor;
struct GlobalContext;
struct Lights;

typedef void (*ActorFunc)(struct Actor*, struct GlobalContext*);
typedef void (*ActorShadowFunc)(struct Actor*, struct Lights*, struct GlobalContext*);
typedef u16 (*callback1_800343CC)(struct GlobalContext*, struct Actor*);
typedef s16 (*callback2_800343CC)(struct GlobalContext*, struct Actor*);

typedef struct {
    Vec3f pos;
    Vec3s rot;
} PosRot; // size = 0x14

typedef struct {
    /* 0x00 */ s16 id;
    /* 0x02 */ u8 category; // Classifies actor and determines when it will update or draw
    /* 0x04 */ u32 flags;
    /* 0x08 */ s16 objectId;
    /* 0x0C */ u32 instanceSize;
    /* 0x10 */ ActorFunc init; // Constructor
    /* 0x14 */ ActorFunc destroy; // Destructor
    /* 0x18 */ ActorFunc update; // Update Function
    /* 0x1C */ ActorFunc draw; // Draw function
} ActorInit; // size = 0x20

typedef enum {
    /* 0 */ ALLOCTYPE_NORMAL,
    /* 1 */ ALLOCTYPE_ABSOLUTE,
    /* 2 */ ALLOCTYPE_PERMANENT
} AllocType;

typedef struct {
    /* 0x00 */ u32 vromStart;
    /* 0x04 */ u32 vromEnd;
    /* 0x08 */ void* vramStart;
    /* 0x0C */ void* vramEnd;
    /* 0x10 */ void* loadedRamAddr; // original name: "allocp"
    /* 0x14 */ ActorInit* initInfo;
    /* 0x18 */ char* name;
    /* 0x1C */ u16 allocType;
    /* 0x1E */ s8 nbLoaded; // original name: "clients"
} ActorOverlay; // size = 0x20

typedef struct {
    u8 table[32];
} DamageTable;

typedef struct {
    /* 0x00 */ u8 health;
    /* 0x02 */ s16 cylRadius;
    /* 0x04 */ s16 cylHeight;
    /* 0x06 */ u8 mass;
} CollisionCheckInfoInit;

typedef struct {
    /* 0x00 */ u8 health;
    /* 0x02 */ s16 cylRadius;
    /* 0x04 */ s16 cylHeight;
    /* 0x06 */ s16 cylYShift;
    /* 0x08 */ u8 mass;
} CollisionCheckInfoInit2;

typedef struct {
    /* 0x00 */ DamageTable* damageTable;
    /* 0x04 */ Vec3f displacement; // Amount to correct velocity (0x5C) by when colliding into a body
    /* 0x10 */ s16 cylRadius; // Used for various purposes
    /* 0x12 */ s16 cylHeight; // Used for various purposes
    /* 0x14 */ s16 cylYShift; // Unused. Purpose inferred from Cylinder16 and CollisionCheck_CylSideVsLineSeg
    /* 0x16 */ u8 mass; // Used to compute displacement for OC collisions
    /* 0x17 */ u8 health; // Note: some actors may use their own health variable instead of this one
    /* 0x18 */ u8 damage; // Amount to decrement health by
    /* 0x19 */ u8 damageEffect; // Stores what effect should occur when hit by a weapon
    /* 0x1A */ u8 atHitEffect; // Stores what effect should occur when AT connects with an AC
    /* 0x1B */ u8 acHitEffect; // Stores what effect should occur when AC is touched by an AT
} CollisionCheckInfo; // size = 0x1C

typedef struct {
    /* 0x00 */ Vec3s rot; // Current actor shape rotation
    /* 0x06 */ s16 face; // Used to index eyebrow/eye/mouth textures. Only used by player
    /* 0x08 */ f32 yOffset; // Model y axis offset. Represents model space units
    /* 0x0C */ ActorShadowFunc shadowDraw; // Shadow draw function
    /* 0x10 */ f32 shadowScale; // Changes the size of the shadow
    /* 0x14 */ u8 shadowAlpha; // Default is 255
    /* 0x15 */ u8 feetFloorFlags; // Set if the actor's foot is clipped under the floor. & 1 is right foot, & 2 is left
    /* 0x18 */ Vec3f feetPos[2]; // Update by using `Actor_SetFeetPos` in PostLimbDraw
} ActorShape; // size = 0x18

typedef struct Actor {
    /* 0x000 */ s16 id; // Actor ID
    /* 0x002 */ u8 category; // Actor category. Refer to the corresponding enum for values
    /* 0x003 */ s8 room; // Room number the actor is in. -1 denotes that the actor won't despawn on a room change
    /* 0x004 */ u32 flags; // Flags used for various purposes
    /* 0x008 */ PosRot home; // Initial position/rotation when spawned. Can be used for other purposes
    /* 0x01C */ s16 params; // Configurable variable set by the actor's spawn data; original name: "args_data"
    /* 0x01E */ s8 objBankIndex; // Object bank index of the actor's object dependency; original name: "bank"
    /* 0x01F */ s8 targetMode; // Controls how far the actor can be targeted from and how far it can stay locked on
    /* 0x020 */ u16 sfx; // SFX ID to play. Sound plays when value is set, then is cleared the following update cycle
    /* 0x024 */ PosRot world; // Position/rotation in the world
    /* 0x038 */ PosRot focus; // Target reticle focuses on this position. For player this represents head pos and rot
    /* 0x04C */ f32 targetArrowOffset; // Height offset of the target arrow relative to `focus` position
    /* 0x050 */ Vec3f scale; // Scale of the actor in each axis
    /* 0x05C */ Vec3f velocity; // Velocity of the actor in each axis
    /* 0x068 */ f32 speedXZ; // How fast the actor is traveling along the XZ plane
    /* 0x06C */ f32 gravity; // Acceleration due to gravity. Value is added to Y velocity every frame
    /* 0x070 */ f32 minVelocityY; // Sets the lower bounds cap on velocity along the Y axis
    /* 0x074 */ CollisionPoly* wallPoly; // Wall polygon the actor is touching
    /* 0x078 */ CollisionPoly* floorPoly; // Floor polygon directly below the actor
    /* 0x07C */ u8 wallBgId; // Bg ID of the wall polygon the actor is touching
    /* 0x07D */ u8 floorBgId; // Bg ID of the floor polygon directly below the actor
    /* 0x07E */ s16 wallYaw; // Y rotation of the wall polygon the actor is touching
    /* 0x080 */ f32 floorHeight; // Y position of the floor polygon directly below the actor
    /* 0x084 */ f32 yDistToWater; // Distance to the surface of active waterbox. Negative value means above water
    /* 0x088 */ u16 bgCheckFlags; // See comments below actor struct for wip docs. TODO: macros for these flags
    /* 0x08A */ s16 yawTowardsPlayer; // Y rotation difference between the actor and the player
    /* 0x08C */ f32 xyzDistToPlayerSq; // Squared distance between the actor and the player in the x,y,z axis
    /* 0x090 */ f32 xzDistToPlayer; // Distance between the actor and the player in the XZ plane
    /* 0x094 */ f32 yDistToPlayer; // Dist is negative if the actor is above the player
    /* 0x098 */ CollisionCheckInfo colChkInfo; // Variables related to the Collision Check system
    /* 0x0B4 */ ActorShape shape; // Variables related to the physical shape of the actor
    /* 0x0E4 */ Vec3f projectedPos; // Position of the actor in projected space
    /* 0x0F0 */ f32 projectedW; // w component of the projected actor position
    /* 0x0F4 */ f32 uncullZoneForward; // Amount to increase the uncull zone forward by (in projected space)
    /* 0x0F8 */ f32 uncullZoneScale; // Amount to increase the uncull zone scale by (in projected space)
    /* 0x0FC */ f32 uncullZoneDownward; // Amount to increase uncull zone downward by (in projected space)
    /* 0x100 */ Vec3f prevPos; // World position from the previous update cycle
    /* 0x10C */ u8 isTargeted; // Set to true if the actor is currently being targeted by the player
    /* 0x10D */ u8 targetPriority; // Lower values have higher priority. Resets to 0 when player stops targeting
    /* 0x10E */ u16 textId; // Text ID to pass to link/display when interacting with the actor
    /* 0x110 */ u16 freezeTimer; // Actor does not update when set. Timer decrements automatically
    /* 0x112 */ u16 colorFilterParams; // Set color filter to red, blue, or white. Toggle opa or xlu
    /* 0x114 */ u8 colorFilterTimer; // A non-zero value enables the color filter. Decrements automatically
    /* 0x115 */ u8 isDrawn; // Set to true if the actor is currently being drawn. Always stays false for lens actors
    /* 0x116 */ u8 dropFlag; // Configures what item is dropped by the actor from `Item_DropCollectibleRandom`
    /* 0x117 */ u8 naviEnemyId; // Sets what 0600 dialog to display when talking to navi. Default 0xFF
    /* 0x118 */ struct Actor* parent; // Usage is actor specific. Set if actor is spawned via `Actor_SpawnAsChild`
    /* 0x11C */ struct Actor* child; // Usage is actor specific. Set if actor is spawned via `Actor_SpawnAsChild`
    /* 0x120 */ struct Actor* prev; // Previous actor of this category
    /* 0x124 */ struct Actor* next; // Next actor of this category
    /* 0x128 */ ActorFunc init; // Initialization Routine. Called by `Actor_Init` or `Actor_UpdateAll`
    /* 0x12C */ ActorFunc destroy; // Destruction Routine. Called by `Actor_Destroy`
    /* 0x130 */ ActorFunc update; // Update Routine. Called by `Actor_UpdateAll`
    /* 0x134 */ ActorFunc draw; // Draw Routine. Called by `Actor_Draw`
    /* 0x138 */ ActorOverlay* overlayEntry; // Pointer to the overlay table entry for this actor
    /* 0x13C */ char dbgPad[0x10]; // Padding that only exists in the debug rom
} Actor; // size = 0x14C

typedef enum {
    /* 0 */ FOOT_LEFT,
    /* 1 */ FOOT_RIGHT
} ActorFootIndex;

/*
BgCheckFlags WIP documentation:
& 0x001 : Standing on the ground
& 0x002 : Has touched the ground (only active for 1 frame)
& 0x004 : Has left the ground (only active for 1 frame)
& 0x008 : Touching a wall
& 0x010 : Touching a ceiling
& 0x020 : On or below water surface
& 0x040 : Has touched water (actor is responsible for unsetting this the frame it touches the water)
& 0x080 : Similar to & 0x1 but with no velocity check and is cleared every frame
& 0x100 : Crushed between a floor and ceiling (triggers a void for player)
& 0x200 : Unknown (only set/used by player so far)
*/

/*
colorFilterParams WIP documentation
& 0x8000 : white
& 0x4000 : red
if neither of the above are set : blue

(& 0x1F00 >> 5) | 7 : color intensity
0x2000 : translucent, else opaque
*/

typedef struct DynaPolyActor {
    /* 0x000 */ struct Actor actor;
    /* 0x14C */ s32 bgId;
    /* 0x150 */ f32 unk_150;
    /* 0x154 */ f32 unk_154;
    /* 0x158 */ s16 unk_158; // y rotation?
    /* 0x15A */ u16 unk_15A;
    /* 0x15C */ u32 unk_15C;
    /* 0x160 */ u8 unk_160;
    /* 0x162 */ s16 unk_162;
} DynaPolyActor; // size = 0x164

typedef struct {
    /* 0x00 */ MtxF* unk_00;
    /* 0x04 */ s16* unk_04;
    /* 0x08 */ s16 unk_08;
    /* 0x0A */ char unk_0A[0x02];
    /* 0x0C */ Gfx** unk_0C;
    /* 0x10 */ s32 unk_10;
    /* 0x14 */ s32 unk_14;
} struct_80032E24;

typedef enum {
    /* 0x00 */ ITEM00_RUPEE_GREEN,
    /* 0x01 */ ITEM00_RUPEE_BLUE,
    /* 0x02 */ ITEM00_RUPEE_RED,
    /* 0x03 */ ITEM00_HEART,
    /* 0x04 */ ITEM00_BOMBS_A,
    /* 0x05 */ ITEM00_ARROWS_SINGLE,
    /* 0x06 */ ITEM00_HEART_PIECE,
    /* 0x07 */ ITEM00_HEART_CONTAINER,
    /* 0x08 */ ITEM00_ARROWS_SMALL,
    /* 0x09 */ ITEM00_ARROWS_MEDIUM,
    /* 0x0A */ ITEM00_ARROWS_LARGE,
    /* 0x0B */ ITEM00_BOMBS_B,
    /* 0x0C */ ITEM00_NUTS,
    /* 0x0D */ ITEM00_STICK,
    /* 0x0E */ ITEM00_MAGIC_LARGE,
    /* 0x0F */ ITEM00_MAGIC_SMALL,
    /* 0x10 */ ITEM00_SEEDS,
    /* 0x11 */ ITEM00_SMALL_KEY,
    /* 0x12 */ ITEM00_FLEXIBLE,
    /* 0x13 */ ITEM00_RUPEE_ORANGE,
    /* 0x14 */ ITEM00_RUPEE_PURPLE,
    /* 0x15 */ ITEM00_SHIELD_DEKU,
    /* 0x16 */ ITEM00_SHIELD_HYLIAN,
    /* 0x17 */ ITEM00_TUNIC_ZORA,
    /* 0x18 */ ITEM00_TUNIC_GORON,
    /* 0x19 */ ITEM00_BOMBS_SPECIAL
} Item00Type;

struct EnItem00;

typedef void (*EnItem00ActionFunc)(struct EnItem00*, struct GlobalContext*);

typedef struct EnItem00 {
    /* 0x000 */ Actor actor;
    /* 0x14C */ EnItem00ActionFunc actionFunc;
    /* 0x150 */ s16 collectibleFlag;
    /* 0x152 */ s16 unk_152;
    /* 0x154 */ s16 unk_154;
    /* 0x156 */ s16 unk_156;
    /* 0x158 */ s16 unk_158;
    /* 0x15A */ s16 unk_15A;
    /* 0x15C */ f32 unk_15C;
    /* 0x160 */ ColliderCylinder collider;
} EnItem00; // size = 0x1AC

typedef enum {
    /* 0x00 */ A_OBJ_BLOCK_SMALL,
    /* 0x01 */ A_OBJ_BLOCK_LARGE,
    /* 0x02 */ A_OBJ_BLOCK_HUGE,
    /* 0x03 */ A_OBJ_BLOCK_SMALL_ROT,
    /* 0x04 */ A_OBJ_BLOCK_LARGE_ROT,
    /* 0x05 */ A_OBJ_CUBE_SMALL,
    /* 0x06 */ A_OBJ_UNKNOWN_6,
    /* 0x07 */ A_OBJ_GRASS_CLUMP,
    /* 0x08 */ A_OBJ_TREE_STUMP,
    /* 0x09 */ A_OBJ_SIGNPOST_OBLONG,
    /* 0x0A */ A_OBJ_SIGNPOST_ARROW,
    /* 0x0B */ A_OBJ_KNOB
} AObjType;

struct EnAObj;

typedef void (*EnAObjActionFunc)(struct EnAObj*, struct GlobalContext*);

typedef struct EnAObj {
    /* 0x000 */ DynaPolyActor dyna;
    /* 0x164 */ EnAObjActionFunc actionFunc;
    /* 0x168 */ s32 unk_168;
    /* 0x16C */ s16 textId;
    /* 0x16E */ s16 unk_16E;
    /* 0x170 */ s16 unk_170;
    /* 0x172 */ s16 unk_172;
    /* 0x174 */ s16 unk_174;
    /* 0x178 */ f32 unk_178;
    /* 0x17C */ ColliderCylinder collider;
} EnAObj; // size = 0x1C8

typedef enum {
    /* 0x00 */ ACTORCAT_SWITCH,
    /* 0x01 */ ACTORCAT_BG,
    /* 0x02 */ ACTORCAT_PLAYER,
    /* 0x03 */ ACTORCAT_EXPLOSIVE,
    /* 0x04 */ ACTORCAT_NPC,
    /* 0x05 */ ACTORCAT_ENEMY,
    /* 0x06 */ ACTORCAT_PROP,
    /* 0x07 */ ACTORCAT_ITEMACTION,
    /* 0x08 */ ACTORCAT_MISC,
    /* 0x09 */ ACTORCAT_BOSS,
    /* 0x0A */ ACTORCAT_DOOR,
    /* 0x0B */ ACTORCAT_CHEST
} ActorCategory;

typedef enum {
    /* 0x0000 */ ACTOR_PLAYER,
    /* 0x0001 */ ACTOR_UNSET_1,
    /* 0x0002 */ ACTOR_EN_TEST,
    /* 0x0003 */ ACTOR_UNSET_3,
    /* 0x0004 */ ACTOR_EN_GIRLA,
    /* 0x0005 */ ACTOR_UNSET_5,
    /* 0x0006 */ ACTOR_UNSET_6,
    /* 0x0007 */ ACTOR_EN_PART,
    /* 0x0008 */ ACTOR_EN_LIGHT,
    /* 0x0009 */ ACTOR_EN_DOOR,
    /* 0x000A */ ACTOR_EN_BOX, // Treasure Chest
    /* 0x000B */ ACTOR_BG_DY_YOSEIZO,
    /* 0x000C */ ACTOR_BG_HIDAN_FIREWALL,
    /* 0x000D */ ACTOR_EN_POH,
    /* 0x000E */ ACTOR_EN_OKUTA,
    /* 0x000F */ ACTOR_BG_YDAN_SP,
    /* 0x0010 */ ACTOR_EN_BOM,
    /* 0x0011 */ ACTOR_EN_WALLMAS,
    /* 0x0012 */ ACTOR_EN_DODONGO,
    /* 0x0013 */ ACTOR_EN_FIREFLY,
    /* 0x0014 */ ACTOR_EN_HORSE,
    /* 0x0015 */ ACTOR_EN_ITEM00,
    /* 0x0016 */ ACTOR_EN_ARROW,
    /* 0x0017 */ ACTOR_UNSET_17,
    /* 0x0018 */ ACTOR_EN_ELF,
    /* 0x0019 */ ACTOR_EN_NIW,
    /* 0x001A */ ACTOR_UNSET_1A,
    /* 0x001B */ ACTOR_EN_TITE,
    /* 0x001C */ ACTOR_EN_REEBA,
    /* 0x001D */ ACTOR_EN_PEEHAT,
    /* 0x001E */ ACTOR_EN_BUTTE,
    /* 0x001F */ ACTOR_UNSET_1F,
    /* 0x0020 */ ACTOR_EN_INSECT,
    /* 0x0021 */ ACTOR_EN_FISH,
    /* 0x0022 */ ACTOR_UNSET_22,
    /* 0x0023 */ ACTOR_EN_HOLL,
    /* 0x0024 */ ACTOR_EN_SCENE_CHANGE,
    /* 0x0025 */ ACTOR_EN_ZF,
    /* 0x0026 */ ACTOR_EN_HATA,
    /* 0x0027 */ ACTOR_BOSS_DODONGO,
    /* 0x0028 */ ACTOR_BOSS_GOMA,
    /* 0x0029 */ ACTOR_EN_ZL1,
    /* 0x002A */ ACTOR_EN_VIEWER,
    /* 0x002B */ ACTOR_EN_GOMA,
    /* 0x002C */ ACTOR_BG_PUSHBOX,
    /* 0x002D */ ACTOR_EN_BUBBLE,
    /* 0x002E */ ACTOR_DOOR_SHUTTER,
    /* 0x002F */ ACTOR_EN_DODOJR,
    /* 0x0030 */ ACTOR_EN_BDFIRE,
    /* 0x0031 */ ACTOR_UNSET_31,
    /* 0x0032 */ ACTOR_EN_BOOM,
    /* 0x0033 */ ACTOR_EN_TORCH2,
    /* 0x0034 */ ACTOR_EN_BILI,
    /* 0x0035 */ ACTOR_EN_TP,
    /* 0x0036 */ ACTOR_UNSET_36,
    /* 0x0037 */ ACTOR_EN_ST,
    /* 0x0038 */ ACTOR_EN_BW,
    /* 0x0039 */ ACTOR_EN_A_OBJ,
    /* 0x003A */ ACTOR_EN_EIYER,
    /* 0x003B */ ACTOR_EN_RIVER_SOUND,
    /* 0x003C */ ACTOR_EN_HORSE_NORMAL,
    /* 0x003D */ ACTOR_EN_OSSAN,
    /* 0x003E */ ACTOR_BG_TREEMOUTH,
    /* 0x003F */ ACTOR_BG_DODOAGO,
    /* 0x0040 */ ACTOR_BG_HIDAN_DALM,
    /* 0x0041 */ ACTOR_BG_HIDAN_HROCK,
    /* 0x0042 */ ACTOR_EN_HORSE_GANON,
    /* 0x0043 */ ACTOR_BG_HIDAN_ROCK,
    /* 0x0044 */ ACTOR_BG_HIDAN_RSEKIZOU,
    /* 0x0045 */ ACTOR_BG_HIDAN_SEKIZOU,
    /* 0x0046 */ ACTOR_BG_HIDAN_SIMA,
    /* 0x0047 */ ACTOR_BG_HIDAN_SYOKU,
    /* 0x0048 */ ACTOR_EN_XC,
    /* 0x0049 */ ACTOR_BG_HIDAN_CURTAIN,
    /* 0x004A */ ACTOR_BG_SPOT00_HANEBASI,
    /* 0x004B */ ACTOR_EN_MB,
    /* 0x004C */ ACTOR_EN_BOMBF,
    /* 0x004D */ ACTOR_EN_ZL2,
    /* 0x004E */ ACTOR_BG_HIDAN_FSLIFT,
    /* 0x004F */ ACTOR_EN_OE2,
    /* 0x0050 */ ACTOR_BG_YDAN_HASI,
    /* 0x0051 */ ACTOR_BG_YDAN_MARUTA,
    /* 0x0052 */ ACTOR_BOSS_GANONDROF,
    /* 0x0053 */ ACTOR_UNSET_53,
    /* 0x0054 */ ACTOR_EN_AM,
    /* 0x0055 */ ACTOR_EN_DEKUBABA,
    /* 0x0056 */ ACTOR_EN_M_FIRE1,
    /* 0x0057 */ ACTOR_EN_M_THUNDER,
    /* 0x0058 */ ACTOR_BG_DDAN_JD,
    /* 0x0059 */ ACTOR_BG_BREAKWALL,
    /* 0x005A */ ACTOR_EN_JJ,
    /* 0x005B */ ACTOR_EN_HORSE_ZELDA,
    /* 0x005C */ ACTOR_BG_DDAN_KD,
    /* 0x005D */ ACTOR_DOOR_WARP1,
    /* 0x005E */ ACTOR_OBJ_SYOKUDAI,
    /* 0x005F */ ACTOR_ITEM_B_HEART,
    /* 0x0060 */ ACTOR_EN_DEKUNUTS,
    /* 0x0061 */ ACTOR_BG_MENKURI_KAITEN,
    /* 0x0062 */ ACTOR_BG_MENKURI_EYE,
    /* 0x0063 */ ACTOR_EN_VALI,
    /* 0x0064 */ ACTOR_BG_MIZU_MOVEBG,
    /* 0x0065 */ ACTOR_BG_MIZU_WATER,
    /* 0x0066 */ ACTOR_ARMS_HOOK,
    /* 0x0067 */ ACTOR_EN_FHG,
    /* 0x0068 */ ACTOR_BG_MORI_HINERI,
    /* 0x0069 */ ACTOR_EN_BB,
    /* 0x006A */ ACTOR_BG_TOKI_HIKARI,
    /* 0x006B */ ACTOR_EN_YUKABYUN,
    /* 0x006C */ ACTOR_BG_TOKI_SWD,
    /* 0x006D */ ACTOR_EN_FHG_FIRE,
    /* 0x006E */ ACTOR_BG_MJIN,
    /* 0x006F */ ACTOR_BG_HIDAN_KOUSI,
    /* 0x0070 */ ACTOR_DOOR_TOKI,
    /* 0x0071 */ ACTOR_BG_HIDAN_HAMSTEP,
    /* 0x0072 */ ACTOR_EN_BIRD,
    /* 0x0073 */ ACTOR_UNSET_73,
    /* 0x0074 */ ACTOR_UNSET_74,
    /* 0x0075 */ ACTOR_UNSET_75,
    /* 0x0076 */ ACTOR_UNSET_76,
    /* 0x0077 */ ACTOR_EN_WOOD02,
    /* 0x0078 */ ACTOR_UNSET_78,
    /* 0x0079 */ ACTOR_UNSET_79,
    /* 0x007A */ ACTOR_UNSET_7A,
    /* 0x007B */ ACTOR_UNSET_7B,
    /* 0x007C */ ACTOR_EN_LIGHTBOX,
    /* 0x007D */ ACTOR_EN_PU_BOX,
    /* 0x007E */ ACTOR_UNSET_7E,
    /* 0x007F */ ACTOR_UNSET_7F,
    /* 0x0080 */ ACTOR_EN_TRAP,
    /* 0x0081 */ ACTOR_EN_AROW_TRAP,
    /* 0x0082 */ ACTOR_EN_VASE,
    /* 0x0083 */ ACTOR_UNSET_83,
    /* 0x0084 */ ACTOR_EN_TA,
    /* 0x0085 */ ACTOR_EN_TK,
    /* 0x0086 */ ACTOR_BG_MORI_BIGST,
    /* 0x0087 */ ACTOR_BG_MORI_ELEVATOR,
    /* 0x0088 */ ACTOR_BG_MORI_KAITENKABE,
    /* 0x0089 */ ACTOR_BG_MORI_RAKKATENJO,
    /* 0x008A */ ACTOR_EN_VM,
    /* 0x008B */ ACTOR_DEMO_EFFECT,
    /* 0x008C */ ACTOR_DEMO_KANKYO,
    /* 0x008D */ ACTOR_BG_HIDAN_FWBIG,
    /* 0x008E */ ACTOR_EN_FLOORMAS,
    /* 0x008F */ ACTOR_EN_HEISHI1,
    /* 0x0090 */ ACTOR_EN_RD,
    /* 0x0091 */ ACTOR_EN_PO_SISTERS,
    /* 0x0092 */ ACTOR_BG_HEAVY_BLOCK,
    /* 0x0093 */ ACTOR_BG_PO_EVENT,
    /* 0x0094 */ ACTOR_OBJ_MURE,
    /* 0x0095 */ ACTOR_EN_SW,
    /* 0x0096 */ ACTOR_BOSS_FD,
    /* 0x0097 */ ACTOR_OBJECT_KANKYO,
    /* 0x0098 */ ACTOR_EN_DU,
    /* 0x0099 */ ACTOR_EN_FD,
    /* 0x009A */ ACTOR_EN_HORSE_LINK_CHILD,
    /* 0x009B */ ACTOR_DOOR_ANA,
    /* 0x009C */ ACTOR_BG_SPOT02_OBJECTS,
    /* 0x009D */ ACTOR_BG_HAKA,
    /* 0x009E */ ACTOR_MAGIC_WIND,
    /* 0x009F */ ACTOR_MAGIC_FIRE,
    /* 0x00A0 */ ACTOR_UNSET_A0,
    /* 0x00A1 */ ACTOR_EN_RU1,
    /* 0x00A2 */ ACTOR_BOSS_FD2,
    /* 0x00A3 */ ACTOR_EN_FD_FIRE,
    /* 0x00A4 */ ACTOR_EN_DH,
    /* 0x00A5 */ ACTOR_EN_DHA,
    /* 0x00A6 */ ACTOR_EN_RL,
    /* 0x00A7 */ ACTOR_EN_ENCOUNT1,
    /* 0x00A8 */ ACTOR_DEMO_DU,
    /* 0x00A9 */ ACTOR_DEMO_IM,
    /* 0x00AA */ ACTOR_DEMO_TRE_LGT,
    /* 0x00AB */ ACTOR_EN_FW,
    /* 0x00AC */ ACTOR_BG_VB_SIMA,
    /* 0x00AD */ ACTOR_EN_VB_BALL,
    /* 0x00AE */ ACTOR_BG_HAKA_MEGANE,
    /* 0x00AF */ ACTOR_BG_HAKA_MEGANEBG,
    /* 0x00B0 */ ACTOR_BG_HAKA_SHIP,
    /* 0x00B1 */ ACTOR_BG_HAKA_SGAMI,
    /* 0x00B2 */ ACTOR_UNSET_B2,
    /* 0x00B3 */ ACTOR_EN_HEISHI2,
    /* 0x00B4 */ ACTOR_EN_ENCOUNT2,
    /* 0x00B5 */ ACTOR_EN_FIRE_ROCK,
    /* 0x00B6 */ ACTOR_EN_BROB,
    /* 0x00B7 */ ACTOR_MIR_RAY,
    /* 0x00B8 */ ACTOR_BG_SPOT09_OBJ,
    /* 0x00B9 */ ACTOR_BG_SPOT18_OBJ,
    /* 0x00BA */ ACTOR_BOSS_VA,
    /* 0x00BB */ ACTOR_BG_HAKA_TUBO,
    /* 0x00BC */ ACTOR_BG_HAKA_TRAP,
    /* 0x00BD */ ACTOR_BG_HAKA_HUTA,
    /* 0x00BE */ ACTOR_BG_HAKA_ZOU,
    /* 0x00BF */ ACTOR_BG_SPOT17_FUNEN,
    /* 0x00C0 */ ACTOR_EN_SYATEKI_ITM,
    /* 0x00C1 */ ACTOR_EN_SYATEKI_MAN,
    /* 0x00C2 */ ACTOR_EN_TANA,
    /* 0x00C3 */ ACTOR_EN_NB,
    /* 0x00C4 */ ACTOR_BOSS_MO,
    /* 0x00C5 */ ACTOR_EN_SB,
    /* 0x00C6 */ ACTOR_EN_BIGOKUTA,
    /* 0x00C7 */ ACTOR_EN_KAREBABA,
    /* 0x00C8 */ ACTOR_BG_BDAN_OBJECTS,
    /* 0x00C9 */ ACTOR_DEMO_SA,
    /* 0x00CA */ ACTOR_DEMO_GO,
    /* 0x00CB */ ACTOR_EN_IN,
    /* 0x00CC */ ACTOR_EN_TR,
    /* 0x00CD */ ACTOR_BG_SPOT16_BOMBSTONE,
    /* 0x00CE */ ACTOR_UNSET_CE,
    /* 0x00CF */ ACTOR_BG_HIDAN_KOWARERUKABE,
    /* 0x00D0 */ ACTOR_BG_BOMBWALL,
    /* 0x00D1 */ ACTOR_BG_SPOT08_ICEBLOCK,
    /* 0x00D2 */ ACTOR_EN_RU2,
    /* 0x00D3 */ ACTOR_OBJ_DEKUJR,
    /* 0x00D4 */ ACTOR_BG_MIZU_UZU,
    /* 0x00D5 */ ACTOR_BG_SPOT06_OBJECTS,
    /* 0x00D6 */ ACTOR_BG_ICE_OBJECTS,
    /* 0x00D7 */ ACTOR_BG_HAKA_WATER,
    /* 0x00D8 */ ACTOR_UNSET_D8,
    /* 0x00D9 */ ACTOR_EN_MA2,
    /* 0x00DA */ ACTOR_EN_BOM_CHU,
    /* 0x00DB */ ACTOR_EN_HORSE_GAME_CHECK,
    /* 0x00DC */ ACTOR_BOSS_TW,
    /* 0x00DD */ ACTOR_EN_RR,
    /* 0x00DE */ ACTOR_EN_BA,
    /* 0x00DF */ ACTOR_EN_BX,
    /* 0x00E0 */ ACTOR_EN_ANUBICE,
    /* 0x00E1 */ ACTOR_EN_ANUBICE_FIRE,
    /* 0x00E2 */ ACTOR_BG_MORI_HASHIGO,
    /* 0x00E3 */ ACTOR_BG_MORI_HASHIRA4,
    /* 0x00E4 */ ACTOR_BG_MORI_IDOMIZU,
    /* 0x00E5 */ ACTOR_BG_SPOT16_DOUGHNUT,
    /* 0x00E6 */ ACTOR_BG_BDAN_SWITCH,
    /* 0x00E7 */ ACTOR_EN_MA1,
    /* 0x00E8 */ ACTOR_BOSS_GANON,
    /* 0x00E9 */ ACTOR_BOSS_SST,
    /* 0x00EA */ ACTOR_UNSET_EA,
    /* 0x00EB */ ACTOR_UNSET_EB,
    /* 0x00EC */ ACTOR_EN_NY,
    /* 0x00ED */ ACTOR_EN_FR,
    /* 0x00EE */ ACTOR_ITEM_SHIELD,
    /* 0x00EF */ ACTOR_BG_ICE_SHELTER,
    /* 0x00F0 */ ACTOR_EN_ICE_HONO,
    /* 0x00F1 */ ACTOR_ITEM_OCARINA,
    /* 0x00F2 */ ACTOR_UNSET_F2,
    /* 0x00F3 */ ACTOR_UNSET_F3,
    /* 0x00F4 */ ACTOR_MAGIC_DARK,
    /* 0x00F5 */ ACTOR_DEMO_6K,
    /* 0x00F6 */ ACTOR_EN_ANUBICE_TAG,
    /* 0x00F7 */ ACTOR_BG_HAKA_GATE,
    /* 0x00F8 */ ACTOR_BG_SPOT15_SAKU,
    /* 0x00F9 */ ACTOR_BG_JYA_GOROIWA,
    /* 0x00FA */ ACTOR_BG_JYA_ZURERUKABE,
    /* 0x00FB */ ACTOR_UNSET_FB,
    /* 0x00FC */ ACTOR_BG_JYA_COBRA,
    /* 0x00FD */ ACTOR_BG_JYA_KANAAMI,
    /* 0x00FE */ ACTOR_FISHING,
    /* 0x00FF */ ACTOR_OBJ_OSHIHIKI,
    /* 0x0100 */ ACTOR_BG_GATE_SHUTTER,
    /* 0x0101 */ ACTOR_EFF_DUST,
    /* 0x0102 */ ACTOR_BG_SPOT01_FUSYA,
    /* 0x0103 */ ACTOR_BG_SPOT01_IDOHASHIRA,
    /* 0x0104 */ ACTOR_BG_SPOT01_IDOMIZU,
    /* 0x0105 */ ACTOR_BG_PO_SYOKUDAI,
    /* 0x0106 */ ACTOR_BG_GANON_OTYUKA,
    /* 0x0107 */ ACTOR_BG_SPOT15_RRBOX,
    /* 0x0108 */ ACTOR_BG_UMAJUMP,
    /* 0x0109 */ ACTOR_UNSET_109,
    /* 0x010A */ ACTOR_ARROW_FIRE,
    /* 0x010B */ ACTOR_ARROW_ICE,
    /* 0x010C */ ACTOR_ARROW_LIGHT,
    /* 0x010D */ ACTOR_UNSET_10D,
    /* 0x010E */ ACTOR_UNSET_10E,
    /* 0x010F */ ACTOR_ITEM_ETCETERA,
    /* 0x0110 */ ACTOR_OBJ_KIBAKO,
    /* 0x0111 */ ACTOR_OBJ_TSUBO,
    /* 0x0112 */ ACTOR_EN_WONDER_ITEM,
    /* 0x0113 */ ACTOR_EN_IK,
    /* 0x0114 */ ACTOR_DEMO_IK,
    /* 0x0115 */ ACTOR_EN_SKJ,
    /* 0x0116 */ ACTOR_EN_SKJNEEDLE,
    /* 0x0117 */ ACTOR_EN_G_SWITCH,
    /* 0x0118 */ ACTOR_DEMO_EXT,
    /* 0x0119 */ ACTOR_DEMO_SHD,
    /* 0x011A */ ACTOR_EN_DNS,
    /* 0x011B */ ACTOR_ELF_MSG,
    /* 0x011C */ ACTOR_EN_HONOTRAP,
    /* 0x011D */ ACTOR_EN_TUBO_TRAP,
    /* 0x011E */ ACTOR_OBJ_ICE_POLY,
    /* 0x011F */ ACTOR_BG_SPOT03_TAKI,
    /* 0x0120 */ ACTOR_BG_SPOT07_TAKI,
    /* 0x0121 */ ACTOR_EN_FZ,
    /* 0x0122 */ ACTOR_EN_PO_RELAY,
    /* 0x0123 */ ACTOR_BG_RELAY_OBJECTS,
    /* 0x0124 */ ACTOR_EN_DIVING_GAME,
    /* 0x0125 */ ACTOR_EN_KUSA,
    /* 0x0126 */ ACTOR_OBJ_BEAN,
    /* 0x0127 */ ACTOR_OBJ_BOMBIWA,
    /* 0x0128 */ ACTOR_UNSET_128,
    /* 0x0129 */ ACTOR_UNSET_129,
    /* 0x012A */ ACTOR_OBJ_SWITCH,
    /* 0x012B */ ACTOR_OBJ_ELEVATOR,
    /* 0x012C */ ACTOR_OBJ_LIFT,
    /* 0x012D */ ACTOR_OBJ_HSBLOCK,
    /* 0x012E */ ACTOR_EN_OKARINA_TAG,
    /* 0x012F */ ACTOR_EN_YABUSAME_MARK,
    /* 0x0130 */ ACTOR_EN_GOROIWA,
    /* 0x0131 */ ACTOR_EN_EX_RUPPY,
    /* 0x0132 */ ACTOR_EN_TORYO,
    /* 0x0133 */ ACTOR_EN_DAIKU,
    /* 0x0134 */ ACTOR_UNSET_134,
    /* 0x0135 */ ACTOR_EN_NWC,
    /* 0x0136 */ ACTOR_EN_BLKOBJ,
    /* 0x0137 */ ACTOR_ITEM_INBOX,
    /* 0x0138 */ ACTOR_EN_GE1,
    /* 0x0139 */ ACTOR_OBJ_BLOCKSTOP,
    /* 0x013A */ ACTOR_EN_SDA,
    /* 0x013B */ ACTOR_EN_CLEAR_TAG,
    /* 0x013C */ ACTOR_EN_NIW_LADY,
    /* 0x013D */ ACTOR_EN_GM,
    /* 0x013E */ ACTOR_EN_MS,
    /* 0x013F */ ACTOR_EN_HS,
    /* 0x0140 */ ACTOR_BG_INGATE,
    /* 0x0141 */ ACTOR_EN_KANBAN,
    /* 0x0142 */ ACTOR_EN_HEISHI3,
    /* 0x0143 */ ACTOR_EN_SYATEKI_NIW,
    /* 0x0144 */ ACTOR_EN_ATTACK_NIW,
    /* 0x0145 */ ACTOR_BG_SPOT01_IDOSOKO,
    /* 0x0146 */ ACTOR_EN_SA,
    /* 0x0147 */ ACTOR_EN_WONDER_TALK,
    /* 0x0148 */ ACTOR_BG_GJYO_BRIDGE,
    /* 0x0149 */ ACTOR_EN_DS,
    /* 0x014A */ ACTOR_EN_MK,
    /* 0x014B */ ACTOR_EN_BOM_BOWL_MAN,
    /* 0x014C */ ACTOR_EN_BOM_BOWL_PIT,
    /* 0x014D */ ACTOR_EN_OWL,
    /* 0x014E */ ACTOR_EN_ISHI,
    /* 0x014F */ ACTOR_OBJ_HANA,
    /* 0x0150 */ ACTOR_OBJ_LIGHTSWITCH,
    /* 0x0151 */ ACTOR_OBJ_MURE2,
    /* 0x0152 */ ACTOR_EN_GO,
    /* 0x0153 */ ACTOR_EN_FU,
    /* 0x0154 */ ACTOR_UNSET_154,
    /* 0x0155 */ ACTOR_EN_CHANGER,
    /* 0x0156 */ ACTOR_BG_JYA_MEGAMI,
    /* 0x0157 */ ACTOR_BG_JYA_LIFT,
    /* 0x0158 */ ACTOR_BG_JYA_BIGMIRROR,
    /* 0x0159 */ ACTOR_BG_JYA_BOMBCHUIWA,
    /* 0x015A */ ACTOR_BG_JYA_AMISHUTTER,
    /* 0x015B */ ACTOR_BG_JYA_BOMBIWA,
    /* 0x015C */ ACTOR_BG_SPOT18_BASKET,
    /* 0x015D */ ACTOR_UNSET_15D,
    /* 0x015E */ ACTOR_EN_GANON_ORGAN,
    /* 0x015F */ ACTOR_EN_SIOFUKI,
    /* 0x0160 */ ACTOR_EN_STREAM,
    /* 0x0161 */ ACTOR_UNSET_161,
    /* 0x0162 */ ACTOR_EN_MM,
    /* 0x0163 */ ACTOR_EN_KO,
    /* 0x0164 */ ACTOR_EN_KZ,
    /* 0x0165 */ ACTOR_EN_WEATHER_TAG,
    /* 0x0166 */ ACTOR_BG_SST_FLOOR,
    /* 0x0167 */ ACTOR_EN_ANI,
    /* 0x0168 */ ACTOR_EN_EX_ITEM,
    /* 0x0169 */ ACTOR_BG_JYA_IRONOBJ,
    /* 0x016A */ ACTOR_EN_JS,
    /* 0x016B */ ACTOR_EN_JSJUTAN,
    /* 0x016C */ ACTOR_EN_CS,
    /* 0x016D */ ACTOR_EN_MD,
    /* 0x016E */ ACTOR_EN_HY,
    /* 0x016F */ ACTOR_EN_GANON_MANT,
    /* 0x0170 */ ACTOR_EN_OKARINA_EFFECT,
    /* 0x0171 */ ACTOR_EN_MAG,
    /* 0x0172 */ ACTOR_DOOR_GERUDO,
    /* 0x0173 */ ACTOR_ELF_MSG2,
    /* 0x0174 */ ACTOR_DEMO_GT,
    /* 0x0175 */ ACTOR_EN_PO_FIELD,
    /* 0x0176 */ ACTOR_EFC_ERUPC,
    /* 0x0177 */ ACTOR_BG_ZG,
    /* 0x0178 */ ACTOR_EN_HEISHI4,
    /* 0x0179 */ ACTOR_EN_ZL3,
    /* 0x017A */ ACTOR_BOSS_GANON2,
    /* 0x017B */ ACTOR_EN_KAKASI,
    /* 0x017C */ ACTOR_EN_TAKARA_MAN,
    /* 0x017D */ ACTOR_OBJ_MAKEOSHIHIKI,
    /* 0x017E */ ACTOR_OCEFF_SPOT,
    /* 0x017F */ ACTOR_END_TITLE,
    /* 0x0180 */ ACTOR_UNSET_180,
    /* 0x0181 */ ACTOR_EN_TORCH,
    /* 0x0182 */ ACTOR_DEMO_EC,
    /* 0x0183 */ ACTOR_SHOT_SUN,
    /* 0x0184 */ ACTOR_EN_DY_EXTRA,
    /* 0x0185 */ ACTOR_EN_WONDER_TALK2,
    /* 0x0186 */ ACTOR_EN_GE2,
    /* 0x0187 */ ACTOR_OBJ_ROOMTIMER,
    /* 0x0188 */ ACTOR_EN_SSH,
    /* 0x0189 */ ACTOR_EN_STH,
    /* 0x018A */ ACTOR_OCEFF_WIPE,
    /* 0x018B */ ACTOR_OCEFF_STORM,
    /* 0x018C */ ACTOR_EN_WEIYER,
    /* 0x018D */ ACTOR_BG_SPOT05_SOKO,
    /* 0x018E */ ACTOR_BG_JYA_1FLIFT,
    /* 0x018F */ ACTOR_BG_JYA_HAHENIRON,
    /* 0x0190 */ ACTOR_BG_SPOT12_GATE,
    /* 0x0191 */ ACTOR_BG_SPOT12_SAKU,
    /* 0x0192 */ ACTOR_EN_HINTNUTS,
    /* 0x0193 */ ACTOR_EN_NUTSBALL,
    /* 0x0194 */ ACTOR_BG_SPOT00_BREAK,
    /* 0x0195 */ ACTOR_EN_SHOPNUTS,
    /* 0x0196 */ ACTOR_EN_IT,
    /* 0x0197 */ ACTOR_EN_GELDB,
    /* 0x0198 */ ACTOR_OCEFF_WIPE2,
    /* 0x0199 */ ACTOR_OCEFF_WIPE3,
    /* 0x019A */ ACTOR_EN_NIW_GIRL,
    /* 0x019B */ ACTOR_EN_DOG,
    /* 0x019C */ ACTOR_EN_SI,
    /* 0x019D */ ACTOR_BG_SPOT01_OBJECTS2,
    /* 0x019E */ ACTOR_OBJ_COMB,
    /* 0x019F */ ACTOR_BG_SPOT11_BAKUDANKABE,
    /* 0x01A0 */ ACTOR_OBJ_KIBAKO2,
    /* 0x01A1 */ ACTOR_EN_DNT_DEMO,
    /* 0x01A2 */ ACTOR_EN_DNT_JIJI,
    /* 0x01A3 */ ACTOR_EN_DNT_NOMAL,
    /* 0x01A4 */ ACTOR_EN_GUEST,
    /* 0x01A5 */ ACTOR_BG_BOM_GUARD,
    /* 0x01A6 */ ACTOR_EN_HS2,
    /* 0x01A7 */ ACTOR_DEMO_KEKKAI,
    /* 0x01A8 */ ACTOR_BG_SPOT08_BAKUDANKABE,
    /* 0x01A9 */ ACTOR_BG_SPOT17_BAKUDANKABE,
    /* 0x01AA */ ACTOR_UNSET_1AA,
    /* 0x01AB */ ACTOR_OBJ_MURE3,
    /* 0x01AC */ ACTOR_EN_TG,
    /* 0x01AD */ ACTOR_EN_MU,
    /* 0x01AE */ ACTOR_EN_GO2,
    /* 0x01AF */ ACTOR_EN_WF,
    /* 0x01B0 */ ACTOR_EN_SKB,
    /* 0x01B1 */ ACTOR_DEMO_GJ,
    /* 0x01B2 */ ACTOR_DEMO_GEFF,
    /* 0x01B3 */ ACTOR_BG_GND_FIREMEIRO,
    /* 0x01B4 */ ACTOR_BG_GND_DARKMEIRO,
    /* 0x01B5 */ ACTOR_BG_GND_SOULMEIRO,
    /* 0x01B6 */ ACTOR_BG_GND_NISEKABE,
    /* 0x01B7 */ ACTOR_BG_GND_ICEBLOCK,
    /* 0x01B8 */ ACTOR_EN_GB,
    /* 0x01B9 */ ACTOR_EN_GS,
    /* 0x01BA */ ACTOR_BG_MIZU_BWALL,
    /* 0x01BB */ ACTOR_BG_MIZU_SHUTTER,
    /* 0x01BC */ ACTOR_EN_DAIKU_KAKARIKO,
    /* 0x01BD */ ACTOR_BG_BOWL_WALL,
    /* 0x01BE */ ACTOR_EN_WALL_TUBO,
    /* 0x01BF */ ACTOR_EN_PO_DESERT,
    /* 0x01C0 */ ACTOR_EN_CROW,
    /* 0x01C1 */ ACTOR_DOOR_KILLER,
    /* 0x01C2 */ ACTOR_BG_SPOT11_OASIS,
    /* 0x01C3 */ ACTOR_BG_SPOT18_FUTA,
    /* 0x01C4 */ ACTOR_BG_SPOT18_SHUTTER,
    /* 0x01C5 */ ACTOR_EN_MA3,
    /* 0x01C6 */ ACTOR_EN_COW,
    /* 0x01C7 */ ACTOR_BG_ICE_TURARA,
    /* 0x01C8 */ ACTOR_BG_ICE_SHUTTER,
    /* 0x01C9 */ ACTOR_EN_KAKASI2,
    /* 0x01CA */ ACTOR_EN_KAKASI3,
    /* 0x01CB */ ACTOR_OCEFF_WIPE4,
    /* 0x01CC */ ACTOR_EN_EG,
    /* 0x01CD */ ACTOR_BG_MENKURI_NISEKABE,
    /* 0x01CE */ ACTOR_EN_ZO,
    /* 0x01CF */ ACTOR_OBJ_MAKEKINSUTA,
    /* 0x01D0 */ ACTOR_EN_GE3,
    /* 0x01D1 */ ACTOR_OBJ_TIMEBLOCK,
    /* 0x01D2 */ ACTOR_OBJ_HAMISHI,
    /* 0x01D3 */ ACTOR_EN_ZL4,
    /* 0x01D4 */ ACTOR_EN_MM2,
    /* 0x01D5 */ ACTOR_BG_JYA_BLOCK,
    /* 0x01D6 */ ACTOR_OBJ_WARP2BLOCK,
    /* 0x01D7 */ ACTOR_ID_MAX // originally "ACTOR_DLF_MAX"
} ActorID;

#endif
