#ifndef Z64CAMERA_H
#define Z64CAMERA_H

#include "ultra64.h"
#include "z64cutscene.h"

// these two angle conversion macros are slightly inaccurate
#define CAM_DEG_TO_BINANG(degrees) (s16)((degrees) * 182.04167f + .5f)
#define CAM_BINANG_TO_DEG(binang) ((f32)(binang) * (360.0001525f / 65535.0f))

#define CAM_STAT_CUT        0
#define CAM_STAT_WAIT       1
#define CAM_STAT_UNK3       3
#define CAM_STAT_ACTIVE     7
#define CAM_STAT_UNK100     0x100

#define NUM_CAMS 4

// Camera IDs are indices into `PlayState.cameraPtrs`
#define CAM_ID_MAIN 0 // The index of the main camera
#define CAM_ID_SUB_FIRST 1 // The index sub cameras start at
#define CAM_ID_NONE -1 // Used to indicate no camera. Can be used to default to the active camera in some scenarios

#define SUB_CAM_ID_DONE 0 // Used in some actors for variables holding sub camera IDs to indicate "subcam is finished"

#define ONEPOINT_CS_INFO(camera) (&camera->paramData.uniq9.csInfo)
#define PARENT_CAM(cam) ((cam)->play->cameraPtrs[(cam)->parentCamId])
#define CHILD_CAM(cam) ((cam)->play->cameraPtrs[(cam)->childCamId])

// All scenes using `SCENE_CAM_TYPE_FIXED_SHOP_VIEWPOINT` or `SCENE_CAM_TYPE_FIXED_TOGGLE_VIEWPOINT` are expected 
// to have their first two bgCamInfo entries be the following:
#define BGCAM_INDEX_TOGGLE_LOCKED 0
#define BGCAM_INDEX_TOGGLE_PIVOT 1

// Viewpoint is only used by `SCENE_CAM_TYPE_FIXED_SHOP_VIEWPOINT` and `SCENE_CAM_TYPE_FIXED_TOGGLE_VIEWPOINT`
// Value must be 1 greater than the corresponding bgCamIndex.
#define VIEWPOINT_NONE 0
// Use a camera prerend setting that locks the camera in place
#define VIEWPOINT_LOCKED (BGCAM_INDEX_TOGGLE_LOCKED + 1)
// Use a camera pivot setting that allows camera rotation (CAM_SET_PIVOT_SHOP_BROWSING for shop specifically)
#define VIEWPOINT_PIVOT (BGCAM_INDEX_TOGGLE_PIVOT + 1)

typedef enum {
    /* 0x00 */ CAM_SET_NONE,
    /* 0x01 */ CAM_SET_NORMAL0,
    /* 0x02 */ CAM_SET_NORMAL1,
    /* 0x03 */ CAM_SET_DUNGEON0,
    /* 0x04 */ CAM_SET_DUNGEON1,
    /* 0x05 */ CAM_SET_NORMAL3,
    /* 0x06 */ CAM_SET_HORSE, // "HORSE0"
    /* 0x07 */ CAM_SET_BOSS_GOHMA, // "BOSS_GOMA" (unused)
    /* 0x08 */ CAM_SET_BOSS_DODONGO, // "BOSS_DODO" (unused)
    /* 0x09 */ CAM_SET_BOSS_BARINADE, // "BOSS_BARI" (unused)
    /* 0x0A */ CAM_SET_BOSS_PHANTOM_GANON, // "BOSS_FGANON"
    /* 0x0B */ CAM_SET_BOSS_VOLVAGIA, // "BOSS_BAL"
    /* 0x0C */ CAM_SET_BOSS_BONGO, // "BOSS_SHADES"
    /* 0x0D */ CAM_SET_BOSS_MORPHA, // "BOSS_MOFA" (unused)
    /* 0x0E */ CAM_SET_BOSS_TWINROVA_PLATFORM, // Upper main platform and 4 smaller platforms in the room of the Twinrova boss battle "TWIN0"
    /* 0x0F */ CAM_SET_BOSS_TWINROVA_FLOOR, // The floor in the room of the Twinrova boss battle "TWIN1"
    /* 0x10 */ CAM_SET_BOSS_GANONDORF, // "BOSS_GANON1"
    /* 0x11 */ CAM_SET_BOSS_GANON, // "BOSS_GANON2" (unused)
    /* 0x12 */ CAM_SET_TOWER_CLIMB, // Various climbing structures (collapse sequence stairs, spiral around sarias house, zora domain climb, etc...) "TOWER0"
    /* 0x13 */ CAM_SET_TOWER_UNUSED, // Unused but data is in Phantom Ganon's Lair (no surface uses it) "TOWER1"
    /* 0x14 */ CAM_SET_MARKET_BALCONY, // Activated in day child market by talking to NPC on balcony above bombchu bowling "FIXED0"
    /* 0x15 */ CAM_SET_CHU_BOWLING, // Fixes the camera to the bombchu bowling targets while playing the minigame "FIXED1"
    /* 0x16 */ CAM_SET_PIVOT_CRAWLSPACE, // Unknown. In scene data: closely associated with crawlspaces CIRCLE0"
    /* 0x17 */ CAM_SET_PIVOT_SHOP_BROWSING, // Shopping and browsing for items "CIRCLE2"
    /* 0x18 */ CAM_SET_PIVOT_IN_FRONT, // The camera used on Link's balcony in Kokiri forest. Data present in scene data for Deku Tree, GTG, Inside Ganon's Castle (TODO: may or may not be used) "CIRCLE3"
    /* 0x19 */ CAM_SET_PREREND_FIXED, // Camera is fixed in position and rotation "PREREND0"
    /* 0x1A */ CAM_SET_PREREND_PIVOT, // Camera is fixed in position with fixed pitch, but is free to rotate in the yaw direction 360 degrees "PREREND1"
    /* 0x1B */ CAM_SET_PREREND_SIDE_SCROLL, // Camera side-scrolls position to follow the player. Only used in castle courtyard with the guards "PREREND3"
    /* 0x1C */ CAM_SET_DOOR0, // Custom room door transitions, used in fire and royal family tomb
    /* 0x1D */ CAM_SET_DOORC, // Generic room door transitions, camera moves and follows player as the door is open and closed
    /* 0x1E */ CAM_SET_CRAWLSPACE, // Used in all crawlspaces "RAIL3"
    /* 0x1F */ CAM_SET_START0, // Data is given in Temple of Time, but no surface uses it
    /* 0x20 */ CAM_SET_START1, // Scene/room door transitions that snap the camera to a fixed location (example: ganon's towers doors climbing up)
    /* 0x21 */ CAM_SET_FREE0, // Full manual control is given over the camera
    /* 0x22 */ CAM_SET_FREE2, // Various OnePoint Cutscenes, 10 total (example: falling chest)
    /* 0x23 */ CAM_SET_PIVOT_CORNER, // Inside the carpenter jail cells from theives hideout "CIRCLE4"
    /* 0x24 */ CAM_SET_PIVOT_WATER_SURFACE, // Player diving from the surface of the water to underwater "CIRCLE5"
    /* 0x25 */ CAM_SET_CS_0, // Various cutscenes "DEMO0"
    /* 0x26 */ CAM_SET_CS_TWISTED_HALLWAY, // Never set to, but checked in twisting hallway (Forest Temple) "DEMO1"
    /* 0x27 */ CAM_SET_FOREST_BIRDS_EYE, // Used in the falling ceiling room in forest temple "MORI1"
    /* 0x28 */ CAM_SET_SLOW_CHEST_CS, // Long cutscene when opening a big chest with a major item "ITEM0"
    /* 0x29 */ CAM_SET_ITEM_UNUSED, // Unused "ITEM1"
    /* 0x2A */ CAM_SET_CS_3, // Various cutscenes "DEMO3"
    /* 0x2B */ CAM_SET_CS_ATTENTION, // Attention cutscenes and the actor siofuki (water spout/jet) "DEMO4"
    /* 0x2C */ CAM_SET_BEAN_GENERIC, // All beans except lost woods "UFOBEAN"
    /* 0x2D */ CAM_SET_BEAN_LOST_WOODS, // Lost woods bean "LIFTBEAN"
    /* 0x2E */ CAM_SET_SCENE_UNUSED, // Unused "SCENE0"
    /* 0x2F */ CAM_SET_SCENE_TRANSITION, // Scene Transitions "SCENE1"
    /* 0x30 */ CAM_SET_FIRE_PLATFORM, // All the fire platforms that rise. Also used in non-mq spirit shortcut "HIDAN1"
    /* 0x31 */ CAM_SET_FIRE_STAIRCASE, // Used on fire staircase actor cutscene in shortcut room connecting vanilla hammer chest to the final goron small key "HIDAN2"
    /* 0x32 */ CAM_SET_FOREST_UNUSED, // Unused "MORI2"
    /* 0x33 */ CAM_SET_FOREST_DEFEAT_POE, // Used when defeating a poe sister "MORI3"
    /* 0x34 */ CAM_SET_BIG_OCTO, // Used by big octo miniboss in Jabu Jabu "TAKO"
    /* 0x35 */ CAM_SET_MEADOW_BIRDS_EYE, // Used only as child in Sacred Forest Meadow Maze "SPOT05A"
    /* 0x36 */ CAM_SET_MEADOW_UNUSED, // Unused from Sacred Forest Meadow "SPOT05B"
    /* 0x37 */ CAM_SET_FIRE_BIRDS_EYE, // Used in lower-floor maze in non-mq fire temple "HIDAN3"
    /* 0x38 */ CAM_SET_TURN_AROUND, // Put the camera in front of player and turn around to look at player from the front "ITEM2"
    /* 0x39 */ CAM_SET_PIVOT_VERTICAL, // Lowering platforms (forest temple bow room, Jabu final shortcut) "CAM_SET_PIVOT_VERTICAL"
    /* 0x3A */ CAM_SET_NORMAL2,
    /* 0x3B */ CAM_SET_FISHING, // Fishing pond by the lake
    /* 0x3C */ CAM_SET_CS_C, // Various cutscenes "DEMOC"
    /* 0x3D */ CAM_SET_JABU_TENTACLE, // Jabu-Jabu Parasitic Tenticle Rooms "UO_FIBER"
    /* 0x3E */ CAM_SET_DUNGEON2,
    /* 0x3F */ CAM_SET_DIRECTED_YAW, // Does not auto-update yaw, tends to keep the camera pointed at a certain yaw (used by biggoron and final spirit lowering platform) "TEPPEN"
    /* 0x40 */ CAM_SET_PIVOT_FROM_SIDE, // Fixed side view, allows rotation of camera (eg. Potion Shop, Meadow at fairy grotto) "CIRCLE7"
    /* 0x41 */ CAM_SET_NORMAL4,
    /* 0x42 */ CAM_SET_MAX
} CameraSettingType;

typedef enum {
    /* 0x00 */ CAM_MODE_NORMAL,
    /* 0x01 */ CAM_MODE_TARGET, // "PARALLEL"
    /* 0x02 */ CAM_MODE_FOLLOWTARGET, // "KEEPON"
    /* 0x03 */ CAM_MODE_TALK,
    /* 0x04 */ CAM_MODE_BATTLE,
    /* 0x05 */ CAM_MODE_CLIMB,
    /* 0x06 */ CAM_MODE_FIRSTPERSON,  // "SUBJECT"
    /* 0x07 */ CAM_MODE_BOWARROW,
    /* 0x08 */ CAM_MODE_BOWARROWZ,
    /* 0x09 */ CAM_MODE_HOOKSHOT, // "FOOKSHOT"
    /* 0x0A */ CAM_MODE_BOOMERANG,
    /* 0x0B */ CAM_MODE_SLINGSHOT, // "PACHINCO"
    /* 0x0C */ CAM_MODE_CLIMBZ,
    /* 0x0D */ CAM_MODE_JUMP,
    /* 0x0E */ CAM_MODE_HANG,
    /* 0x0F */ CAM_MODE_HANGZ,
    /* 0x10 */ CAM_MODE_FREEFALL,
    /* 0x11 */ CAM_MODE_CHARGE,
    /* 0x12 */ CAM_MODE_STILL,
    /* 0x13 */ CAM_MODE_PUSHPULL,
    /* 0x14 */ CAM_MODE_FOLLOWBOOMERANG, // "BOOKEEPON"
    /* 0x15 */ CAM_MODE_MAX
} CameraModeType;

typedef enum {
    /* 0x00 */ CAM_FUNC_NONE,
    /* 0x01 */ CAM_FUNC_NORM0,
    /* 0x02 */ CAM_FUNC_NORM1,
    /* 0x03 */ CAM_FUNC_NORM2,
    /* 0x04 */ CAM_FUNC_NORM3,
    /* 0x05 */ CAM_FUNC_NORM4,
    /* 0x06 */ CAM_FUNC_PARA0,
    /* 0x07 */ CAM_FUNC_PARA1,
    /* 0x08 */ CAM_FUNC_PARA2,
    /* 0x09 */ CAM_FUNC_PARA3,
    /* 0x0A */ CAM_FUNC_PARA4,
    /* 0x0B */ CAM_FUNC_KEEP0,
    /* 0x0C */ CAM_FUNC_KEEP1,
    /* 0x0D */ CAM_FUNC_KEEP2,
    /* 0x0E */ CAM_FUNC_KEEP3,
    /* 0x0F */ CAM_FUNC_KEEP4,
    /* 0x10 */ CAM_FUNC_SUBJ0,
    /* 0x11 */ CAM_FUNC_SUBJ1,
    /* 0x12 */ CAM_FUNC_SUBJ2,
    /* 0x13 */ CAM_FUNC_SUBJ3,
    /* 0x14 */ CAM_FUNC_SUBJ4,
    /* 0x15 */ CAM_FUNC_JUMP0,
    /* 0x16 */ CAM_FUNC_JUMP1,
    /* 0x17 */ CAM_FUNC_JUMP2,
    /* 0x18 */ CAM_FUNC_JUMP3,
    /* 0x19 */ CAM_FUNC_JUMP4,
    /* 0x1A */ CAM_FUNC_BATT0,
    /* 0x1B */ CAM_FUNC_BATT1,
    /* 0x1C */ CAM_FUNC_BATT2,
    /* 0x1D */ CAM_FUNC_BATT3,
    /* 0x1E */ CAM_FUNC_BATT4,
    /* 0x1F */ CAM_FUNC_FIXD0,
    /* 0x20 */ CAM_FUNC_FIXD1,
    /* 0x21 */ CAM_FUNC_FIXD2,
    /* 0x22 */ CAM_FUNC_FIXD3,
    /* 0x23 */ CAM_FUNC_FIXD4,
    /* 0x24 */ CAM_FUNC_DATA0,
    /* 0x25 */ CAM_FUNC_DATA1,
    /* 0x26 */ CAM_FUNC_DATA2,
    /* 0x27 */ CAM_FUNC_DATA3,
    /* 0x28 */ CAM_FUNC_DATA4,
    /* 0x29 */ CAM_FUNC_UNIQ0,
    /* 0x2A */ CAM_FUNC_UNIQ1,
    /* 0x2B */ CAM_FUNC_UNIQ2,
    /* 0x2C */ CAM_FUNC_UNIQ3,
    /* 0x2D */ CAM_FUNC_UNIQ4,
    /* 0x2E */ CAM_FUNC_UNIQ5,
    /* 0x2F */ CAM_FUNC_UNIQ6,
    /* 0x30 */ CAM_FUNC_UNIQ7,
    /* 0x31 */ CAM_FUNC_UNIQ8,
    /* 0x32 */ CAM_FUNC_UNIQ9,
    /* 0x33 */ CAM_FUNC_DEMO0,
    /* 0x34 */ CAM_FUNC_DEMO1,
    /* 0x35 */ CAM_FUNC_DEMO2,
    /* 0x36 */ CAM_FUNC_DEMO3,
    /* 0x37 */ CAM_FUNC_DEMO4,
    /* 0x38 */ CAM_FUNC_DEMO5,
    /* 0x39 */ CAM_FUNC_DEMO6,
    /* 0x3A */ CAM_FUNC_DEMO7,
    /* 0x3B */ CAM_FUNC_DEMO8,
    /* 0x3C */ CAM_FUNC_DEMO9,
    /* 0x3D */ CAM_FUNC_SPEC0,
    /* 0x3E */ CAM_FUNC_SPEC1,
    /* 0x3F */ CAM_FUNC_SPEC2,
    /* 0x40 */ CAM_FUNC_SPEC3,
    /* 0x41 */ CAM_FUNC_SPEC4,
    /* 0x42 */ CAM_FUNC_SPEC5,
    /* 0x43 */ CAM_FUNC_SPEC6,
    /* 0x44 */ CAM_FUNC_SPEC7,
    /* 0x45 */ CAM_FUNC_SPEC8,
    /* 0x46 */ CAM_FUNC_SPEC9,
    /* 0x47 */ CAM_FUNC_MAX
} CameraFuncType;

typedef enum {
    /* 0x00 */ CAM_DATA_Y_OFFSET,
    /* 0x01 */ CAM_DATA_EYE_DIST,
    /* 0x02 */ CAM_DATA_EYE_DIST_NEXT,
    /* 0x03 */ CAM_DATA_PITCH_TARGET,
    /* 0x04 */ CAM_DATA_YAW_UPDATE_RATE_TARGET,
    /* 0x05 */ CAM_DATA_XZ_UPDATE_RATE_TARGET,
    /* 0x06 */ CAM_DATA_MAX_YAW_UPDATE,
    /* 0x07 */ CAM_DATA_FOV,
    /* 0x08 */ CAM_DATA_AT_LERP_STEP_SCALE,
    /* 0x09 */ CAM_DATA_FLAGS,
    /* 0x0A */ CAM_DATA_YAW_TARGET,
    /* 0x0B */ CAM_DATA_GROUND_Y_OFFSET,
    /* 0x0C */ CAM_DATA_GROUND_AT_LERP_STEP_SCALE,
    /* 0x0D */ CAM_DATA_SWING_YAW_INIT,
    /* 0x0E */ CAM_DATA_SWING_YAW_FINAL,
    /* 0x0F */ CAM_DATA_SWING_PITCH_INIT,
    /* 0x10 */ CAM_DATA_SWING_PITCH_FINAL,
    /* 0x11 */ CAM_DATA_SWING_PITCH_ADJ,
    /* 0x12 */ CAM_DATA_MIN_MAX_DIST_FACTOR,
    /* 0x13 */ CAM_DATA_AT_OFFSET_X,
    /* 0x14 */ CAM_DATA_AT_OFFSET_Y,
    /* 0x15 */ CAM_DATA_AT_OFFSET_Z,
    /* 0x16 */ CAM_DATA_UNK_22,
    /* 0x17 */ CAM_DATA_UNK_23,
    /* 0x18 */ CAM_DATA_FOV_SCALE,
    /* 0x19 */ CAM_DATA_YAW_SCALE,
    /* 0x1A */ CAM_DATA_UNK_26,
    /* 0x1B */ CAM_DATA_MAX
} CameraDataType;

#define CAM_FUNCDATA_FLAGS(flags) \
    { flags, CAM_DATA_FLAGS }

typedef struct {
    /* 0x00 */ Vec3f collisionClosePoint;
    /* 0x0C */ CollisionPoly* atEyePoly;
    /* 0x10 */ f32 swingUpdateRate;
    /* 0x14 */ s16 unk_14;
    /* 0x16 */ s16 unk_16;
    /* 0x18 */ s16 unk_18;
    /* 0x1A */ s16 swingUpdateRateTimer;
} SwingAnimation; // size = 0x1C

typedef struct {
    /* 0x00 */ f32 yOffset;
    /* 0x04 */ f32 distMin;
    /* 0x08 */ f32 distMax;
    /* 0x0C */ f32 unk_0C;
    /* 0x10 */ f32 unk_10;
    /* 0x14 */ f32 unk_14;
    /* 0x18 */ f32 fovTarget;
    /* 0x1C */ f32 atLERPScaleMax;
    /* 0x20 */ s16 pitchTarget;
    /* 0x22 */ s16 interfaceFlags;
} Normal1ReadOnlyData; // size = 0x24

typedef struct {
    /* 0x00 */ SwingAnimation swing;
    /* 0x1C */ f32 yOffset;
    /* 0x20 */ f32 unk_20;
    /* 0x24 */ s16 slopePitchAdj;
    /* 0x26 */ s16 swingYawTarget;
    /* 0x28 */ s16 unk_28;
    /* 0x2A */ s16 startSwingTimer;
} Normal1ReadWriteData; // size = 0x2C

typedef struct {
    /* 0x00 */ Normal1ReadOnlyData roData;
    /* 0x24 */ Normal1ReadWriteData rwData;
} Normal1; // size = 0x50

#define CAM_FUNCDATA_NORM1(yOffset, eyeDist, eyeDistNext, pitchTarget, yawUpdateRateTarget, xzUpdateRateTarget, maxYawUpdate, fov, atLerpStepScale, flags) \
    { yOffset, CAM_DATA_Y_OFFSET }, \
    { eyeDist, CAM_DATA_EYE_DIST }, \
    { eyeDistNext, CAM_DATA_EYE_DIST_NEXT }, \
    { pitchTarget, CAM_DATA_PITCH_TARGET }, \
    { yawUpdateRateTarget, CAM_DATA_YAW_UPDATE_RATE_TARGET }, \
    { xzUpdateRateTarget, CAM_DATA_XZ_UPDATE_RATE_TARGET }, \
    { maxYawUpdate, CAM_DATA_MAX_YAW_UPDATE }, \
    { fov, CAM_DATA_FOV }, \
    { atLerpStepScale, CAM_DATA_AT_LERP_STEP_SCALE }, \
    { flags, CAM_DATA_FLAGS }

#define CAM_FUNCDATA_NORM1_ALT(yOffset, eyeDist, eyeDistNext, pitchTarget, yawUpdateRateTarget, xzUpdateRateTarget, maxYawUpdate, fov, atLerpStepScale, flags) \
    { yOffset, CAM_DATA_Y_OFFSET }, \
    { eyeDist, CAM_DATA_EYE_DIST }, \
    { eyeDistNext, CAM_DATA_EYE_DIST_NEXT }, \
    { pitchTarget, CAM_DATA_PITCH_TARGET }, \
    { yawUpdateRateTarget, CAM_DATA_YAW_UPDATE_RATE_TARGET }, \
    { xzUpdateRateTarget, CAM_DATA_UNK_26 }, \
    { maxYawUpdate, CAM_DATA_MAX_YAW_UPDATE }, \
    { fov, CAM_DATA_FOV }, \
    { atLerpStepScale, CAM_DATA_AT_LERP_STEP_SCALE }, \
    { flags, CAM_DATA_FLAGS }

typedef struct {
    /* 0x00 */ f32 unk_00;
    /* 0x04 */ f32 unk_04;
    /* 0x08 */ f32 unk_08;
    /* 0x0C */ f32 unk_0C;
    /* 0x10 */ f32 unk_10;
    /* 0x14 */ f32 unk_14;
    /* 0x18 */ f32 unk_18;
    /* 0x1C */ s16 unk_1C;
    /* 0x1E */ s16 interfaceFlags;
} Normal2ReadOnlyData; // size = 0x20

typedef struct {
    /* 0x00 */ Vec3f unk_00;
    /* 0x0C */ Vec3f unk_0C;
    /* 0x18 */ f32 unk_18;
    /* 0x1C */ f32 unk_1C;
    /* 0x20 */ s16 unk_20;
    /* 0x22 */ s16 unk_22;
    /* 0x24 */ f32 unk_24;
    /* 0x28 */ s16 unk_28;
} Normal2ReadWriteData; // size = 0x2C

typedef struct {
    /* 0x00 */ Normal2ReadOnlyData roData;
    /* 0x20 */ Normal2ReadWriteData rwData;
} Normal2; // size = 0x4C

#define CAM_FUNCDATA_NORM2(yOffset, eyeDist, eyeDistNext, unk_23, yawUpdateRateTarget, maxYawUpdate, fov, atLerpStepScale, flags) \
    { yOffset, CAM_DATA_Y_OFFSET }, \
    { eyeDist, CAM_DATA_EYE_DIST }, \
    { eyeDistNext, CAM_DATA_EYE_DIST_NEXT }, \
    { unk_23, CAM_DATA_UNK_23 }, \
    { yawUpdateRateTarget, CAM_DATA_YAW_UPDATE_RATE_TARGET }, \
    { maxYawUpdate, CAM_DATA_MAX_YAW_UPDATE }, \
    { fov, CAM_DATA_FOV }, \
    { atLerpStepScale, CAM_DATA_AT_LERP_STEP_SCALE }, \
    { flags, CAM_DATA_FLAGS }

typedef struct {
    /* 0x00 */ f32 yOffset;
    /* 0x04 */ f32 distMin;
    /* 0x08 */ f32 distMax;
    /* 0x0C */ f32 yawUpdateSpeed;
    /* 0x10 */ f32 unk_10;
    /* 0x14 */ f32 fovTarget;
    /* 0x18 */ f32 maxAtLERPScale;
    /* 0x1C */ s16 pitchTarget;
    /* 0x1E */ s16 interfaceFlags;
} Normal3ReadOnlyData; // size = 0x20

typedef struct {
    /* 0x00 */ SwingAnimation swing;
    /* 0x1C */ f32 unk_1C;
    /* 0x20 */ f32 unk_20;
    /* 0x24 */ s16 curPitch;
    /* 0x26 */ s16 yawUpdAmt;
    /* 0x28 */ s16 yawTimer;
    /* 0x2A */ s16 distTimer;
} Normal3ReadWriteData; // size = 0x2C

typedef struct {
    /* 0x00 */ Normal3ReadOnlyData roData;
    /* 0x20 */ Normal3ReadWriteData rwData;
} Normal3; // size = 0x4C

#define CAM_FUNCDATA_NORM3(yOffset, eyeDist, eyeDistNext, pitchTarget, yawUpdateRateTarget, xzUpdateRateTarget, fov, atLerpStepScale, flags) \
    { yOffset, CAM_DATA_Y_OFFSET }, \
    { eyeDist, CAM_DATA_EYE_DIST }, \
    { eyeDistNext, CAM_DATA_EYE_DIST_NEXT }, \
    { pitchTarget, CAM_DATA_PITCH_TARGET }, \
    { yawUpdateRateTarget, CAM_DATA_YAW_UPDATE_RATE_TARGET }, \
    { xzUpdateRateTarget, CAM_DATA_XZ_UPDATE_RATE_TARGET }, \
    { fov, CAM_DATA_FOV }, \
    { atLerpStepScale, CAM_DATA_AT_LERP_STEP_SCALE }, \
    { flags, CAM_DATA_FLAGS }

typedef struct {
    /* 0x00 */ f32 yOffset;
    /* 0x04 */ f32 distTarget;
    /* 0x08 */ f32 unk_08;
    /* 0x0C */ f32 unk_0C;
    /* 0x10 */ f32 fovTarget;
    /* 0x14 */ f32 unk_14;
    /* 0x18 */ f32 unk_18;
    /* 0x1C */ f32 unk_1C;
    /* 0x20 */ s16 pitchTarget;
    /* 0x22 */ s16 yawTarget;
    /* 0x24 */ s16 interfaceFlags;
} Parallel1ReadOnlyData; // size = 0x28

typedef struct {
    /* 0x00 */ Vec3f unk_00;
    /* 0x0C */ f32 yTarget;
    /* 0x10 */ s16 unk_10;
    /* 0x12 */ s16 yawTarget;
    /* 0x14 */ s16 pitchTarget;
    /* 0x16 */ s16 unk_16;
    /* 0x18 */ s16 animTimer;
} Parallel1ReadWriteData; // size = 0x1C

typedef struct {
    /* 0x00 */ Parallel1ReadOnlyData roData;
    /* 0x28 */ Parallel1ReadWriteData rwData;
} Parallel1; // size = 0x44

#define CAM_FUNCDATA_PARA1(yOffset, eyeDist, pitchTarget, yawTarget, yawUpdateRateTarget, xzUpdateRateTarget, fov, atLerpStepScale, flags, groundYOffset, groundAtLerpStepScale) \
    { yOffset, CAM_DATA_Y_OFFSET }, \
    { eyeDist, CAM_DATA_EYE_DIST }, \
    { pitchTarget, CAM_DATA_PITCH_TARGET }, \
    { yawTarget, CAM_DATA_YAW_TARGET }, \
    { yawUpdateRateTarget, CAM_DATA_YAW_UPDATE_RATE_TARGET }, \
    { xzUpdateRateTarget, CAM_DATA_XZ_UPDATE_RATE_TARGET }, \
    { fov, CAM_DATA_FOV }, \
    { atLerpStepScale, CAM_DATA_AT_LERP_STEP_SCALE }, \
    { flags, CAM_DATA_FLAGS }, \
    { groundYOffset, CAM_DATA_GROUND_Y_OFFSET }, \
    { groundAtLerpStepScale, CAM_DATA_GROUND_AT_LERP_STEP_SCALE }

typedef struct {
    /* 0x00 */ f32 atYOffset;
    /* 0x04 */ f32 distMin;
    /* 0x08 */ f32 distMax;
    /* 0x0C */ f32 yawUpateRateTarget;
    /* 0x10 */ f32 maxYawUpdate;
    /* 0x14 */ f32 unk_14; // never used.
    /* 0x18 */ f32 atLERPScaleMax;
    /* 0x1C */ s16 interfaceFlags;
} Jump1ReadOnlyData; // size = 0x20

typedef struct {
    /* 0x00 */ SwingAnimation swing;
    /* 0x1C */ f32 unk_1C;
    /* 0x20 */ VecSph unk_20;
} Jump1ReadWriteData; // size = 0x28

typedef struct {
    /* 0x00 */ Jump1ReadOnlyData roData;
    /* 0x20 */ Jump1ReadWriteData rwData;
} Jump1; // size = 0x48

#define CAM_FUNCDATA_JUMP1(yOffset, eyeDist, eyeDistNext, yawUpdateRateTarget, maxYawUpdate, fov, atLerpStepScale, flags) \
    { yOffset, CAM_DATA_Y_OFFSET }, \
    { eyeDist, CAM_DATA_EYE_DIST }, \
    { eyeDistNext, CAM_DATA_EYE_DIST_NEXT }, \
    { yawUpdateRateTarget, CAM_DATA_YAW_UPDATE_RATE_TARGET }, \
    { maxYawUpdate, CAM_DATA_MAX_YAW_UPDATE }, \
    { fov, CAM_DATA_FOV }, \
    { atLerpStepScale, CAM_DATA_AT_LERP_STEP_SCALE }, \
    { flags, CAM_DATA_FLAGS }

typedef struct {
    /* 0x00 */ f32 atYOffset;
    /* 0x04 */ f32 minDist;
    /* 0x08 */ f32 maxDist;
    /* 0x0C */ f32 minMaxDistFactor;
    /* 0x10 */ f32 yawUpdRateTarget;
    /* 0x14 */ f32 xzUpdRateTarget;
    /* 0x18 */ f32 fovTarget;
    /* 0x1C */ f32 atLERPStepScale;
    /* 0x20 */ s16 interfaceFlags;
} Jump2ReadOnlyData; // size = 0x24

typedef struct {
    /* 0x0 */ f32 floorY;
    /* 0x4 */ s16 yawTarget;
    /* 0x6 */ s16 initYawDiff; // unused, set but not read.
    /* 0x8 */ s16 yawAdj;
    /* 0xA */ s16 onFloor; // unused, set but not read
    /* 0xC */ s16 animTimer;
} Jump2ReadWriteData; // size = 0x10

typedef struct {
    /* 0x00 */ Jump2ReadOnlyData roData;
    /* 0x24 */ Jump2ReadWriteData rwData;
} Jump2; // size = 0x34

#define CAM_FUNCDATA_JUMP2(yOffset, eyeDist, eyeDistNext, minMaxDistFactor, yawUpdateRateTarget, xzUpdateRateTarget, fov, atLerpStepScale, flags) \
    { yOffset, CAM_DATA_Y_OFFSET }, \
    { eyeDist, CAM_DATA_EYE_DIST }, \
    { eyeDistNext, CAM_DATA_EYE_DIST_NEXT }, \
    { minMaxDistFactor, CAM_DATA_MIN_MAX_DIST_FACTOR }, \
    { yawUpdateRateTarget, CAM_DATA_YAW_UPDATE_RATE_TARGET }, \
    { xzUpdateRateTarget, CAM_DATA_XZ_UPDATE_RATE_TARGET }, \
    { fov, CAM_DATA_FOV }, \
    { atLerpStepScale, CAM_DATA_AT_LERP_STEP_SCALE }, \
    { flags, CAM_DATA_FLAGS }

typedef struct {
    /* 0x00 */ f32 yOffset;
    /* 0x04 */ f32 distMin;
    /* 0x08 */ f32 distMax;
    /* 0x0C */ f32 swingUpdateRate;
    /* 0x10 */ f32 unk_10;
    /* 0x14 */ f32 unk_14;
    /* 0x18 */ f32 fovTarget;
    /* 0x1C */ f32 unk_1C;
    /* 0x20 */ s16 pitchTarget;
    /* 0x22 */ s16 interfaceFlags;
} Jump3ReadOnlyData; // size = 0x24

typedef struct {
    /* 0x00 */ SwingAnimation swing;
    /* 0x1C */ f32 unk_1C;
    /* 0x20 */ s16 animTimer;
    /* 0x22 */ s16 mode;
} Jump3ReadWriteData; // size = 0x24

typedef struct {
    /* 0x00 */ Jump3ReadOnlyData roData;
    /* 0x24 */ Jump3ReadWriteData rwData;
} Jump3; // size = 0x48

#define CAM_FUNCDATA_JUMP3(yOffset, eyeDist, eyeDistNext, pitchTarget, yawUpdateRateTarget, xzUpdateRateTarget, maxYawUpdate, fov, atLerpStepScale, flags) \
    { yOffset, CAM_DATA_Y_OFFSET }, \
    { eyeDist, CAM_DATA_EYE_DIST }, \
    { eyeDistNext, CAM_DATA_EYE_DIST_NEXT }, \
    { pitchTarget, CAM_DATA_PITCH_TARGET }, \
    { yawUpdateRateTarget, CAM_DATA_YAW_UPDATE_RATE_TARGET }, \
    { xzUpdateRateTarget, CAM_DATA_XZ_UPDATE_RATE_TARGET }, \
    { maxYawUpdate, CAM_DATA_MAX_YAW_UPDATE }, \
    { fov, CAM_DATA_FOV }, \
    { atLerpStepScale, CAM_DATA_AT_LERP_STEP_SCALE }, \
    { flags, CAM_DATA_FLAGS }

typedef struct {
    /* 0x00 */ f32 yOffset;
    /* 0x04 */ f32 distance;
    /* 0x08 */ f32 swingYawInitial;
    /* 0x0C */ f32 swingYawFinal;
    /* 0x10 */ f32 swingPitchInitial;
    /* 0x14 */ f32 swingPitchFinal;
    /* 0x18 */ f32 swingPitchAdj;
    /* 0x1C */ f32 fov;
    /* 0x20 */ f32 atLERPScaleOnGround;
    /* 0x24 */ f32 yOffsetOffGround;
    /* 0x28 */ f32 atLERPScaleOffGround;
    /* 0x2C */ s16 flags;
} Battle1ReadOnlyData; // size = 0x30

typedef struct {
    /* 0x00 */ f32 initialEyeToAtDist;
    /* 0x04 */ f32 roll;
    /* 0x08 */ f32 yPosOffset;
    /* 0x0C */ Actor* target;
    /* 0x10 */ f32 unk_10;
    /* 0x14 */ s16 unk_14; // unused
    /* 0x16 */ s16 initialEyeToAtYaw;
    /* 0x18 */ s16 initialEyeToAtPitch;
    /* 0x1A */ s16 animTimer;
    /* 0x1C */ s16 chargeTimer;
} Battle1ReadWriteData; // size = 0x20

typedef struct {
    /* 0x00 */ Battle1ReadOnlyData roData;
    /* 0x30 */ Battle1ReadWriteData rwData;
} Battle1; // size = 0x50

#define CAM_FUNCDATA_BATT1(yOffset, eyeDist, swingYawInit, swingYawFinal, swingPitchInit, swingPitchFinal, swingPitchAdj, fov, atLerpStepScale, flags, groundYOffset, groundAtLerpStepScale) \
    { yOffset, CAM_DATA_Y_OFFSET }, \
    { eyeDist, CAM_DATA_EYE_DIST }, \
    { swingYawInit, CAM_DATA_SWING_YAW_INIT }, \
    { swingYawFinal, CAM_DATA_SWING_YAW_FINAL }, \
    { swingPitchInit, CAM_DATA_SWING_PITCH_INIT }, \
    { swingPitchFinal, CAM_DATA_SWING_PITCH_FINAL }, \
    { swingPitchAdj, CAM_DATA_SWING_PITCH_ADJ }, \
    { fov, CAM_DATA_FOV }, \
    { atLerpStepScale, CAM_DATA_AT_LERP_STEP_SCALE }, \
    { flags, CAM_DATA_FLAGS }, \
    { groundYOffset, CAM_DATA_GROUND_Y_OFFSET }, \
    { groundAtLerpStepScale, CAM_DATA_GROUND_AT_LERP_STEP_SCALE }

typedef struct {
    /* 0x00 */ f32 yOffset;
    /* 0x04 */ f32 rTarget;
    /* 0x08 */ s16 pitchTarget;
    /* 0x0C */ f32 lerpUpdateRate;
    /* 0x10 */ f32 fovTarget;
    /* 0x14 */ f32 atLERPTarget;
    /* 0x18 */ s16 interfaceFlags;
    /* 0x1A */ s16 unk_1A;
} Battle4ReadOnlyData; // size = 0x1C

typedef struct {
    /* 0x0 */ s16 animTimer;
} Battle4ReadWriteData; // size = 0x4

typedef struct {
    /* 0x00 */ Battle4ReadOnlyData roData;
    /* 0x1C */ Battle4ReadWriteData rwData;
} Battle4; // size = 0x20

#define CAM_FUNCDATA_BATT4(yOffset, eyeDist, pitchTarget, yawUpdateRateTarget, fov, atLerpStepScale, flags) \
    { yOffset, CAM_DATA_Y_OFFSET }, \
    { eyeDist, CAM_DATA_EYE_DIST }, \
    { pitchTarget, CAM_DATA_PITCH_TARGET }, \
    { yawUpdateRateTarget, CAM_DATA_YAW_UPDATE_RATE_TARGET }, \
    { fov, CAM_DATA_FOV }, \
    { atLerpStepScale, CAM_DATA_AT_LERP_STEP_SCALE }, \
    { flags, CAM_DATA_FLAGS }

typedef struct {
    /* 0x00 */ f32 unk_00;
    /* 0x04 */ f32 unk_04;
    /* 0x08 */ f32 unk_08;
    /* 0x0C */ f32 unk_0C;
    /* 0x10 */ f32 unk_10;
    /* 0x14 */ f32 unk_14;
    /* 0x18 */ f32 unk_18;
    /* 0x1C */ f32 unk_1C;
    /* 0x20 */ f32 unk_20;
    /* 0x24 */ f32 unk_24;
    /* 0x28 */ f32 unk_28;
    /* 0x2C */ f32 unk_2C;
    /* 0x30 */ s16 interfaceFlags;
} KeepOn1ReadOnlyData; // size = 0x34

typedef struct {
    /* 0x00 */ f32 unk_00;
    /* 0x04 */ f32 unk_04;
    /* 0x08 */ f32 unk_08;
    /* 0x0C */ Actor* unk_0C;
    /* 0x10 */ s16 unk_10;
    /* 0x12 */ s16 unk_12;
    /* 0x14 */ s16 unk_14;
    /* 0x16 */ s16 unk_16;
} KeepOn1ReadWriteData; // size = 0x18

typedef struct {
    /* 0x00 */ KeepOn1ReadOnlyData roData;
    /* 0x34 */ KeepOn1ReadWriteData rwData;
} KeepOn1; // size = 0x4C

#define CAM_FUNCDATA_KEEP1(yOffset, eyeDist, eyeDistNext, swingYawInit, swingYawFinal, swingPitchInit, swingPitchFinal, swingPitchAdj, fov, atLerpStepScale, flags, groundYOffset, groundAtLerpStepScale) \
    { yOffset, CAM_DATA_Y_OFFSET }, \
    { eyeDist, CAM_DATA_EYE_DIST }, \
    { eyeDistNext, CAM_DATA_EYE_DIST_NEXT }, \
    { swingYawInit, CAM_DATA_SWING_YAW_INIT }, \
    { swingYawFinal, CAM_DATA_SWING_YAW_FINAL }, \
    { swingPitchInit, CAM_DATA_SWING_PITCH_INIT }, \
    { swingPitchFinal, CAM_DATA_SWING_PITCH_FINAL }, \
    { swingPitchAdj, CAM_DATA_SWING_PITCH_ADJ }, \
    { fov, CAM_DATA_FOV }, \
    { atLerpStepScale, CAM_DATA_AT_LERP_STEP_SCALE }, \
    { flags, CAM_DATA_FLAGS }, \
    { groundYOffset, CAM_DATA_GROUND_Y_OFFSET }, \
    { groundAtLerpStepScale, CAM_DATA_GROUND_AT_LERP_STEP_SCALE }

typedef struct {
    /* 0x00 */ f32 yOffset;
    /* 0x04 */ f32 minDist;
    /* 0x08 */ f32 maxDist;
    /* 0x0C */ f32 swingYawInital;
    /* 0x10 */ f32 swingYawFinal;
    /* 0x14 */ f32 swingPitchInitial;
    /* 0x18 */ f32 swingPitchFinal;
    /* 0x1C */ f32 swingPitchAdj;
    /* 0x20 */ f32 fovTarget;
    /* 0x24 */ f32 atLERPScaleMax;
    /* 0x28 */ s16 initTimer;
    /* 0x2A */ s16 flags;
} KeepOn3ReadOnlyData; // size = 0x2C

typedef struct {
    /* 0x00 */ Vec3f eyeToAtTarget; // esentially a VecSph, but all floats.
    /* 0x0C */ Actor* target;
    /* 0x10 */ Vec3f atTarget;
    /* 0x1C */ s16 animTimer;
} KeepOn3ReadWriteData; // size = 0x20

typedef struct {
    /* 0x00 */ KeepOn3ReadOnlyData roData;
    /* 0x2C */ KeepOn3ReadWriteData rwData;
} KeepOn3; // size = 0x4C

#define CAM_FUNCDATA_KEEP3(yOffset, eyeDist, eyeDistNext, swingYawInit, swingYawFinal, swingPitchInit, swingPitchFinal, swingPitchAdj, fov, atLerpStepScale, yawUpdateRateTarget, flags) \
    { yOffset, CAM_DATA_Y_OFFSET }, \
    { eyeDist, CAM_DATA_EYE_DIST }, \
    { eyeDistNext, CAM_DATA_EYE_DIST_NEXT }, \
    { swingYawInit, CAM_DATA_SWING_YAW_INIT }, \
    { swingYawFinal, CAM_DATA_SWING_YAW_FINAL }, \
    { swingPitchInit, CAM_DATA_SWING_PITCH_INIT }, \
    { swingPitchFinal, CAM_DATA_SWING_PITCH_FINAL }, \
    { swingPitchAdj, CAM_DATA_SWING_PITCH_ADJ }, \
    { fov, CAM_DATA_FOV }, \
    { atLerpStepScale, CAM_DATA_AT_LERP_STEP_SCALE }, \
    { yawUpdateRateTarget, CAM_DATA_YAW_UPDATE_RATE_TARGET }, \
    { flags, CAM_DATA_FLAGS }

typedef struct {
    /* 0x00 */ f32 unk_00;
    /* 0x04 */ f32 unk_04;
    /* 0x08 */ f32 unk_08;
    /* 0x0C */ f32 unk_0C;
    /* 0x10 */ f32 unk_10;
    /* 0x14 */ f32 unk_14;
    /* 0x18 */ f32 unk_18;
    /* 0x1C */ s16 unk_1C;
    /* 0x1E */ s16 unk_1E;
} KeepOn4ReadOnlyData; // size = 0x20

typedef struct {
    /* 0x00 */ f32 unk_00;
    /* 0x04 */ f32 unk_04;
    /* 0x08 */ f32 unk_08;
    /* 0x0C */ s16 unk_0C;
    /* 0x0E */ s16 unk_0E;
    /* 0x10 */ s16 unk_10;
    /* 0x12 */ s16 unk_12;
    /* 0x14 */ s16 unk_14;
} KeepOn4ReadWriteData; // size = 0x18

typedef struct {
    /* 0x00 */ KeepOn4ReadOnlyData roData;
    /* 0x20 */ KeepOn4ReadWriteData rwData;
} KeepOn4; // size = 0x38

#define CAM_FUNCDATA_KEEP4(yOffset, eyeDist, pitchTarget, yawTarget, atOffsetZ, fov, flags, yawUpdateRateTarget, unk_22) \
    { yOffset, CAM_DATA_Y_OFFSET }, \
    { eyeDist, CAM_DATA_EYE_DIST }, \
    { pitchTarget, CAM_DATA_PITCH_TARGET }, \
    { yawTarget, CAM_DATA_YAW_TARGET }, \
    { atOffsetZ, CAM_DATA_AT_OFFSET_Z }, \
    { fov, CAM_DATA_FOV }, \
    { flags, CAM_DATA_FLAGS }, \
    { yawUpdateRateTarget, CAM_DATA_YAW_UPDATE_RATE_TARGET }, \
    { unk_22, CAM_DATA_UNK_22 }

typedef struct {
    /* 0x00 */ f32 fovScale;
    /* 0x04 */ f32 yawScale;
    /* 0x08 */ s16 timerInit;
    /* 0x0A */ s16 interfaceFlags;
} KeepOn0ReadOnlyData; // size = 0x0C

typedef struct {
    /* 0x0 */ f32 fovTarget;
    /* 0x4 */ s16 animTimer;
} KeepOn0ReadWriteData; // size = 0x8

typedef struct {
    /* 0x00 */ KeepOn0ReadOnlyData roData;
    /* 0x0C */ KeepOn0ReadWriteData rwData;
} KeepOn0; // size = 0x14

#define CAM_FUNCDATA_KEEP0(fovScale, yawScale, yawUpdateRateTarget, flags) \
    { fovScale, CAM_DATA_FOV_SCALE }, \
    { yawScale, CAM_DATA_YAW_SCALE }, \
    { yawUpdateRateTarget, CAM_DATA_YAW_UPDATE_RATE_TARGET }, \
    { flags, CAM_DATA_FLAGS }

typedef struct {
    /* 0x00 */ f32 unk_00; // seems to be unused?
    /* 0x04 */ f32 lerpStep;
    /* 0x08 */ f32 fov;
    /* 0x0C */ s16 interfaceFlags;
} Fixed1ReadOnlyData; // size = 0x10

typedef struct {
    /* 0x00 */ PosRot eyePosRotTarget;
    /* 0x14 */ s16 fov;
} Fixed1ReadWriteData; // size = 0x18

typedef struct {
    /* 0x00 */ Fixed1ReadOnlyData roData;
    /* 0x10 */ Fixed1ReadWriteData rwData;
} Fixed1; // size = 0x28

#define CAM_FUNCDATA_FIXD1(yOffset, yawUpdateRateTarget, fov, flags) \
    { yOffset, CAM_DATA_Y_OFFSET }, \
    { yawUpdateRateTarget, CAM_DATA_YAW_UPDATE_RATE_TARGET }, \
    { fov, CAM_DATA_FOV }, \
    { flags, CAM_DATA_FLAGS }

typedef struct {
    /* 0x00 */ f32 yOffset;
    /* 0x04 */ f32 eyeStepScale;
    /* 0x08 */ f32 posStepScale;
    /* 0x0C */ f32 fov;
    /* 0x10 */ s16 interfaceFlags;
} Fixed2ReadOnlyData; // size = 0x14

typedef struct {
    /* 0x0 */ Vec3f eye;
    /* 0xC */ s16 fov;
} Fixed2ReadWriteData; // size = 0x10

typedef struct {
    /* 0x00 */ Fixed2ReadOnlyData roData;
    /* 0x14 */ Fixed2ReadWriteData rwData;
} Fixed2; // size = 0x24

#define CAM_FUNCDATA_FIXD2(yOffset, yawUpdateRateTarget, xzUpdateRateTarget, fov, flags) \
    { yOffset, CAM_DATA_Y_OFFSET }, \
    { yawUpdateRateTarget, CAM_DATA_YAW_UPDATE_RATE_TARGET }, \
    { xzUpdateRateTarget, CAM_DATA_XZ_UPDATE_RATE_TARGET }, \
    { fov, CAM_DATA_FOV }, \
    { flags, CAM_DATA_FLAGS }

typedef struct {
    /* 0x0 */ s16 interfaceFlags;
} Fixed3ReadOnlyData; // size = 0x4

typedef struct {
    /* 0x0 */ Vec3s rot;
    /* 0x6 */ s16 fov;
    /* 0x8 */ s16 updDirTimer;
    /* 0xA */ s16 roomImageOverrideBgCamIndex;
} Fixed3ReadWriteData; // size = 0xC

typedef struct {
    /* 0x0 */ Fixed3ReadOnlyData roData;
    /* 0x4 */ Fixed3ReadWriteData rwData;
} Fixed3; // size = 0x10

typedef struct {
    /* 0x00 */ f32 yOffset;
    /* 0x04 */ f32 speedToEyePos;
    /* 0x08 */ f32 followSpeed;
    /* 0x0C */ f32 fov;
    /* 0x10 */ s16 interfaceFlags;
} Fixed4ReadOnlyData; // size = 0x14

typedef struct {
    /* 0x0 */ Vec3f eyeTarget;
    /* 0xC */ f32 followSpeed;
} Fixed4ReadWriteData; // size = 0x10

typedef struct {
    /* 0x00 */ Fixed4ReadOnlyData roData;
    /* 0x14 */ Fixed4ReadWriteData rwData;
} Fixed4; // size = 0x24

#define CAM_FUNCDATA_FIXD4(yOffset, yawUpdateRateTarget, xzUpdateRateTarget, fov, flags) \
    { yOffset, CAM_DATA_Y_OFFSET }, \
    { yawUpdateRateTarget, CAM_DATA_YAW_UPDATE_RATE_TARGET }, \
    { xzUpdateRateTarget, CAM_DATA_XZ_UPDATE_RATE_TARGET }, \
    { fov, CAM_DATA_FOV }, \
    { flags, CAM_DATA_FLAGS }

typedef struct {
    /* 0x00 */ f32 eyeNextYOffset;
    /* 0x04 */ f32 eyeDist;
    /* 0x08 */ f32 eyeNextDist;
    /* 0x0C */ f32 unk_0C; // unused
    /* 0x10 */ Vec3f atOffset;
    /* 0x1C */ f32 fovTarget;
    /* 0x20 */ s16 interfaceFlags;
} Subj3ReadOnlyData; // size = 0x24

typedef struct {
    /* 0x0 */ f32 r;
    /* 0x4 */ s16 yaw;
    /* 0x6 */ s16 pitch;
    /* 0x8 */ s16 animTimer;
} Subj3ReadWriteData; // size = 0xC

typedef struct {
    /* 0x00 */ Subj3ReadOnlyData roData;
    /* 0x24 */ Subj3ReadWriteData rwData;
} Subj3; // size = 0x30

#define CAM_FUNCDATA_SUBJ3(yOffset, eyeDist, eyeDistNext, yawUpdateRateTarget, atOffsetX, atOffsetY, atOffsetZ, fov, flags) \
    { yOffset, CAM_DATA_Y_OFFSET }, \
    { eyeDist, CAM_DATA_EYE_DIST }, \
    { eyeDistNext, CAM_DATA_EYE_DIST_NEXT }, \
    { yawUpdateRateTarget, CAM_DATA_YAW_UPDATE_RATE_TARGET }, \
    { atOffsetX, CAM_DATA_AT_OFFSET_X }, \
    { atOffsetY, CAM_DATA_AT_OFFSET_Y }, \
    { atOffsetZ, CAM_DATA_AT_OFFSET_Z }, \
    { fov, CAM_DATA_FOV }, \
    { flags, CAM_DATA_FLAGS }

typedef struct {
    /* 0x0 */ s16 interfaceFlags;
} Subj4ReadOnlyData; // size = 0x4

typedef struct {
    /* 0x00 */ InfiniteLine unk_00;
    /* 0x18 */ f32 unk_18;
    /* 0x1C */ f32 unk_1C;
    /* 0x20 */ f32 unk_20;
    /* 0x24 */ f32 unk_24;
    /* 0x28 */ f32 unk_28;
    /* 0x2C */ s16 unk_2C;
    /* 0x2E */ s16 unk_2E;
    /* 0x30 */ s16 unk_30;
    /* 0x32 */ s16 unk_32;
} Subj4ReadWriteData; // size = 0x34

typedef struct {
    /* 0x00 */ Subj4ReadOnlyData roData;
    /* 0x04 */ Subj4ReadWriteData rwData;
} Subj4; // size = 0x38

#define CAM_FUNCDATA_SUBJ4(yOffset, eyeDist, eyeDistNext, yawUpdateRateTarget, fov, flags) \
    { yOffset, CAM_DATA_Y_OFFSET }, \
    { eyeDist, CAM_DATA_EYE_DIST }, \
    { eyeDistNext, CAM_DATA_EYE_DIST_NEXT }, \
    { yawUpdateRateTarget, CAM_DATA_YAW_UPDATE_RATE_TARGET }, \
    { fov, CAM_DATA_FOV }, \
    { flags, CAM_DATA_FLAGS }

typedef struct {
    /* 0x0 */ f32 yOffset;
    /* 0x4 */ f32 fov;
    /* 0x8 */ s16 interfaceFlags;
} Data4ReadOnlyData; // size = 0xC

typedef struct {
    /* 0x00 */ PosRot eyePosRot;
    /* 0x14 */ char unk_14[0x8];
    /* 0x1C */ s16 fov;
    /* 0x1E */ s16 flags;
} Data4ReadWriteData; // size = 0x20

typedef struct {
    /* 0x00 */ Data4ReadOnlyData roData;
    /* 0x0C */ Data4ReadWriteData rwData;
} Data4; // size = 0x2C

#define CAM_FUNCDATA_DATA4(yOffset, fov, flags) \
    { yOffset, CAM_DATA_Y_OFFSET }, \
    { fov, CAM_DATA_FOV }, \
    { flags, CAM_DATA_FLAGS }

typedef struct {
    /* 0x00 */ f32 yOffset;
    /* 0x04 */ f32 distMin;
    /* 0x08 */ f32 distMax;
    /* 0x0C */ char unk_0C[4]; // unused
    /* 0x10 */ f32 fovTarget;
    /* 0x14 */ f32 atLERPScaleMax;
    /* 0x18 */ s16 pitchTarget;
    /* 0x1A */ s16 interfaceFlags;
} Unique1ReadOnlyData; // size = 0x1C

typedef struct {
    /* 0x0 */ f32 unk_00; // unused
    /* 0x4 */ s16 yawTarget;
    /* 0x6 */ s16 yawTargetAdj;
    /* 0x8 */ s16 timer;
} Unique1ReadWriteData; // size = 0xC

typedef struct {
    /* 0x00 */ Unique1ReadOnlyData roData;
    /* 0x1C */ Unique1ReadWriteData rwData;
} Unique1; // size = 0x28

#define CAM_FUNCDATA_UNIQ1(yOffset, eyeDist, eyeDistNext, pitchTarget, fov, atLerpStepScale, flags) \
    { yOffset, CAM_DATA_Y_OFFSET }, \
    { eyeDist, CAM_DATA_EYE_DIST }, \
    { eyeDistNext, CAM_DATA_EYE_DIST_NEXT }, \
    { pitchTarget, CAM_DATA_PITCH_TARGET }, \
    { fov, CAM_DATA_FOV }, \
    { atLerpStepScale, CAM_DATA_AT_LERP_STEP_SCALE }, \
    { flags, CAM_DATA_FLAGS }

typedef struct {
    /* 0x00 */ f32 yOffset;
    /* 0x04 */ f32 distTarget;
    /* 0x08 */ f32 fovTarget;
    /* 0x0C */ s16 interfaceFlags;
} Unique2ReadOnlyData; // size = 0x10

typedef struct {
    /* 0x0 */ f32 unk_00;
    /* 0x4 */ s16 unk_04;
} Unique2ReadWriteData; // size = 0x8

typedef struct {
    /* 0x00 */ Unique2ReadOnlyData roData;
    /* 0x10 */ Unique2ReadWriteData rwData;
} Unique2; // size = 0x18

#define CAM_FUNCDATA_UNIQ2(yOffset, eyeDist, fov, flags) \
    { yOffset, CAM_DATA_Y_OFFSET }, \
    { eyeDist, CAM_DATA_EYE_DIST }, \
    { fov, CAM_DATA_FOV }, \
    { flags, CAM_DATA_FLAGS }

typedef struct {
    /* 0x0 */ struct Actor* doorActor;
    /* 0x4 */ s16 bgCamIndex;
    /* 0x6 */ s16 timer1;
    /* 0x8 */ s16 timer2;
    /* 0xA */ s16 timer3;
} DoorParams; // size = 0xC

typedef struct {
    /* 0x0 */ f32 yOffset;
    /* 0x4 */ f32 fov;
    /* 0x8 */ s16 interfaceFlags;
} Unique3ReadOnlyData; // size = 0xC

typedef struct {
    /* 0x0 */ f32 initialFov;
    /* 0x4 */ f32 initialDist;
} Unique3ReadWriteData; // size = 0x8

typedef struct {
    /* 0x00 */ Unique3ReadOnlyData roData;
    /* 0x0C */ Unique3ReadWriteData rwData;
} Unique3; // size = 0x14

#define CAM_FUNCDATA_UNIQ3(yOffset, fov, flags) \
    { yOffset, CAM_DATA_Y_OFFSET }, \
    { fov, CAM_DATA_FOV }, \
    { flags, CAM_DATA_FLAGS }

typedef struct {
    /* 0x0 */ s16 interfaceFlags;
} Unique0ReadOnlyData; // size = 0x4

typedef struct {
    /* 0x00 */ Vec3f initalPos;
    /* 0x0C */ s16 animTimer;
    /* 0x10 */ InfiniteLine eyeAndDirection;
} Unique0ReadWriteData; // size = 0x28

typedef struct {
    /* 0x00 */ Unique0ReadOnlyData roData;
    /* 0x04 */ Unique0ReadWriteData rwData;
} Unique0; // size = 0x2C

typedef struct {
    /* 0x0 */ s16 interfaceFlags;
} Unique6ReadOnlyData; // size = 0x4

typedef struct {
    /* 0x0 */ Unique6ReadOnlyData roData;
} Unique6; // size = 0x4

typedef struct {
    /* 0x0 */ f32 fov;
    /* 0x4 */ s16 interfaceFlags;
    /* 0x6 */ s16 align;
} Unique7ReadOnlyData; // size = 0x8

typedef struct {
    /* 0x0 */ Vec3s unk_00;
} Unique7ReadWriteData; // size = 0x8

typedef struct {
    /* 0x00 */ Unique7ReadOnlyData roData;
    /* 0x08 */ Unique7ReadWriteData rwData;
} Unique7; // size = 0x10

#define CAM_FUNCDATA_UNIQ7(fov, flags) \
    { fov, CAM_DATA_FOV }, \
    { flags, CAM_DATA_FLAGS }

/** initFlags
 * & 0x00FF = atInitFlags
 * & 0xFF00 = eyeInitFlags
 * 0x1: Direct Copy of atTargetInit
 *      if initFlags & 0x6060: use head for focus point
 * 0x2: Add atTargetInit to view's lookAt
 *      if initFlags & 0x6060: use world for focus point
 * 0x3: Add atTargetInit to camera's at
 * 0x4: Don't update targets?
 * 0x8: flag to use atTagetInit as f32 pitch, yaw, r
 * 0x10: ? unused
 * 0x20: focus on player
*/
typedef struct {
    /* 0x00 */ u8 actionFlags;
    /* 0x01 */ u8 unk_01;
    /* 0x02 */ s16 initFlags;
    /* 0x04 */ s16 timerInit;
    /* 0x06 */ s16 rollTargetInit;
    /* 0x08 */ f32 fovTargetInit;
    /* 0x0C */ f32 lerpStepScale;
    /* 0x10 */ Vec3f atTargetInit;
    /* 0x1C */ Vec3f eyeTargetInit;
} OnePointCsFull; // size = 0x28

typedef struct {
    /* 0x0 */ s32 keyFrameCnt;
    /* 0x4 */ OnePointCsFull* keyFrames;
} OnePointCsInfo; // size = 0x8

typedef struct {
    /* 0x0 */ s16 interfaceFlags;
} Unique9ReadOnlyData; // size = 0x40

typedef struct {
    /* 0x00 */ OnePointCsFull* curKeyFrame;
    /* 0x04 */ Vec3f atTarget;
    /* 0x10 */ Vec3f eyeTarget;
    /* 0x1C */ Vec3f playerPos;
    /* 0x28 */ f32 fovTarget;
    /* 0x2C */ VecSph atEyeOffsetTarget;
    /* 0x34 */ s16 rollTarget;
    /* 0x36 */ s16 curKeyFrameIdx;
    /* 0x38 */ s16 unk_38;
    /* 0x3A */ s16 isNewKeyFrame;
    /* 0x3C */ s16 keyFrameTimer;
} Unique9ReadWriteData; // size = 0x40

typedef struct {
    /* 0x00 */ OnePointCsInfo csInfo;
    /* 0x08 */ Unique9ReadOnlyData roData;
    /* 0x0C */ Unique9ReadWriteData rwData;
} Unique9; // size = 0x4C

typedef struct {
    /* 0x0 */ s16 interfaceFlags;
} Demo1ReadOnlyData; // size = 0x4

typedef struct {
    /* 0x0 */ f32 curFrame;
    /* 0x4 */ s16 keyframe;
} Demo1ReadWriteData; // size = 0x14

typedef struct {
    /* 0x00 */ Demo1ReadOnlyData roData;
    /* 0x04 */ Demo1ReadWriteData rwData;
} Demo1; // size = 0x18

typedef struct {
    /* 0x0 */ f32 fov;
    /* 0x4 */ f32 unk_04; // unused
    /* 0x8 */ s16 interfaceFlags;
} Demo3ReadOnlyData; // size = 0xC

typedef struct {
    /* 0x00 */ Vec3f initialAt;
    /* 0x0C */ f32 unk_0C;
    /* 0x10 */ s16 animFrame;
    /* 0x12 */ s16 yawDir;
} Demo3ReadWriteData; // size = 0x14

typedef struct {
    /* 0x00 */ Demo3ReadOnlyData roData;
    /* 0x0C */ Demo3ReadWriteData rwData;
} Demo3; // size = 0x20

#define CAM_FUNCDATA_DEMO3(fov, atLerpStepScale, flags) \
    { fov, CAM_DATA_FOV }, \
    { atLerpStepScale, CAM_DATA_AT_LERP_STEP_SCALE }, \
    { flags, CAM_DATA_FLAGS }

typedef struct {
    /* 0x0 */ s16 interfaceFlags;
    /* 0x2 */ s16 unk_02;
} Demo6ReadOnlyData; // size = 0x4

typedef struct {
    /* 0x0 */ s16 animTimer;
    /* 0x4 */ Vec3f atTarget;
} Demo6ReadWriteData; // size = 0x10

typedef struct {
    /* 0x00 */ Demo6ReadOnlyData roData;
    /* 0x04 */ Demo6ReadWriteData rwData;
} Demo6; // size = 0x14

typedef struct {
    /* 0x0 */ CutsceneCameraPoint* atPoints;
    /* 0x4 */ CutsceneCameraPoint* eyePoints;
    /* 0x8 */ s16 actionParameters;
    /* 0xA */ s16 initTimer;
} OnePointCamData; // size = 0xC

typedef struct {
    /* 0x0 */ s16 interfaceFlags;
} Demo9ReadOnlyData; // size = 0x4

typedef struct {
    /* 0x0 */ f32 curFrame;
    /* 0x4 */ s16 keyframe;
    /* 0x6 */ s16 doLERPAt;
    /* 0x8 */ s16 finishAction;
    /* 0xA */ s16 animTimer;
} Demo9ReadWriteData; // size = 0xC

typedef struct {
    /* 0x00 */ OnePointCamData onePointCamData;
    /* 0x0C */ Demo9ReadOnlyData roData;
    /* 0x10 */ Demo9ReadWriteData rwData;
} Demo9; // size = 0x1C

typedef struct {
    /* 0x0 */ f32 lerpAtScale;
    /* 0x4 */ s16 interfaceFlags;
} Special0ReadOnlyData; // size = 0x8

typedef struct {
    /* 0x0 */ Special0ReadOnlyData roData;
} Special0; // size = 0x8

#define CAM_FUNCDATA_SPEC0(yawUpdateRateTarget, flags) \
    { yawUpdateRateTarget, CAM_DATA_YAW_UPDATE_RATE_TARGET }, \
    { flags, CAM_DATA_FLAGS }

typedef struct {
    /* 0x0 */ s16 initalTimer;
} Special4ReadWriteData; // size = 0x4

typedef struct {
    /* 0x0 */ Special4ReadWriteData rwData;
} Special4; // size = 0x4

typedef struct {
    /* 0x00 */ f32 yOffset;
    /* 0x04 */ f32 eyeDist;
    /* 0x08 */ f32 minDistForRot;
    /* 0x0C */ f32 fovTarget;
    /* 0x10 */ f32 atMaxLERPScale;
    /* 0x14 */ s16 timerInit;
    /* 0x16 */ s16 pitch;
    /* 0x18 */ s16 interfaceFlags;
    /* 0x1A */ s16 unk_1A;
} Special5ReadOnlyData; // size = 0x1C

typedef struct {
    /* 0x0 */ s16 animTimer;
} Special5ReadWriteData; // size = 0x4

typedef struct {
    /* 0x00 */ Special5ReadOnlyData roData;
    /* 0x1C */ Special5ReadWriteData rwData;
} Special5; // size = 0x20

#define CAM_FUNCDATA_SPEC5(yOffset, eyeDist, eyeDistNext, unk_22, pitchTarget, fov, atLerpStepScale, flags) \
    { yOffset, CAM_DATA_Y_OFFSET }, \
    { eyeDist, CAM_DATA_EYE_DIST }, \
    { eyeDistNext, CAM_DATA_EYE_DIST_NEXT }, \
    { unk_22, CAM_DATA_UNK_22 }, \
    { pitchTarget, CAM_DATA_PITCH_TARGET }, \
    { fov, CAM_DATA_FOV }, \
    { atLerpStepScale, CAM_DATA_AT_LERP_STEP_SCALE }, \
    { flags, CAM_DATA_FLAGS }

// Uses incorrect CAM_DATA values
#define CAM_FUNCDATA_SPEC5_ALT(yOffset, eyeDist, eyeDistNext, pitchTarget, fov, atLerpStepScale, unk_22, flags) \
    { yOffset, CAM_DATA_Y_OFFSET }, \
    { eyeDist, CAM_DATA_EYE_DIST }, \
    { eyeDistNext, CAM_DATA_EYE_DIST_NEXT }, \
    { pitchTarget, CAM_DATA_PITCH_TARGET }, \
    { fov, CAM_DATA_FOV }, \
    { atLerpStepScale, CAM_DATA_AT_LERP_STEP_SCALE }, \
    { unk_22, CAM_DATA_UNK_22 }, \
    { flags, CAM_DATA_FLAGS }

typedef struct {
    /* 0x0 */ s16 index;
} Special7ReadWriteData; // size = 0x4

typedef struct {
    /* 0x0 */ Special7ReadWriteData rwData;
} Special7; // size = 0x4

typedef struct {
    /* 0x0 */ s16 interfaceFlags;
} Special6ReadOnlyData; // size = 0x4

typedef struct {
    /* 0x0 */ f32 initalPlayerY;
    /* 0x4 */ s16 animTimer;
} Special6ReadWriteData; // size = 0x8

typedef struct {
    /* 0x0 */ Special6ReadOnlyData roData;
    /* 0x4 */ Special6ReadWriteData rwData;
} Special6; // size = 0xC

typedef struct {
    /* 0x0 */ f32 yOffset;
    /* 0x4 */ f32 unk_04;
    /* 0x8 */ s16 interfaceFlags;
    /* 0xA */ s16 unk_0A;
} Special9ReadOnlyData; // size = 0xC

typedef struct {
    /* 0x0 */ s16 targetYaw;
} Special9ReadWriteData; // size = 0x4

typedef struct {
    /* 0x00 */ Special9ReadOnlyData roData;
    /* 0x0C */ Special9ReadWriteData rwData;
} Special9; // size = 0x10

#define CAM_FUNCDATA_SPEC9(yOffset, fov, flags) \
    { yOffset, CAM_DATA_Y_OFFSET }, \
    { fov, CAM_DATA_FOV }, \
    { flags, CAM_DATA_FLAGS }

typedef union {
    Normal1 norm1;
    Normal2 norm2;
    Normal3 norm3;
    Parallel1 para1;
    Jump1 jump1;
    Jump2 jump2;
    Jump3 jump3;
    Battle1 batt1;
    Battle4 batt4;
    KeepOn0 keep0;
    KeepOn1 keep1;
    KeepOn3 keep3;
    KeepOn4 keep4;
    Fixed1 fixd1;
    Fixed2 fixd2;
    Fixed3 fixd3;
    Fixed4 fixd4;
    Subj3 subj3;
    Subj4 subj4;
    Data4 data4;
    Unique1 uniq1;
    Unique2 uniq2;
    Unique6 uniq6;
    Unique7 uniq7;
    Unique9 uniq9;
    Demo1 demo1;
    Demo3 demo3;
    Demo6 demo6;
    Demo9 demo9;
    Special0 spec0;
    Special4 spec4;
    Special5 spec5;
    Special6 spec6;
    Special7 spec7;
    struct {
        /* 0x0 */ DoorParams doorParams;
        /* 0xC */ union {
            Unique0 uniq0;
            Unique3 uniq3;
            Special9 spec9;
        };
    };
} CamParamData; // size = 0x50

typedef struct {
    /* 0x00 */ Vec3f pos;
    /* 0x0C */ Vec3f norm;
    /* 0x18 */ CollisionPoly* poly;
    /* 0x1C */ VecSph sphNorm;
    /* 0x24 */ s32 bgId;
} CamColChk; // size = 0x28

typedef struct {
    /* 0x000 */ CamParamData paramData;
    /* 0x050 */ Vec3f at;
    /* 0x05C */ Vec3f eye;
    /* 0x068 */ Vec3f up;
    /* 0x074 */ Vec3f eyeNext;
    /* 0x080 */ Vec3f skyboxOffset;
    /* 0x08C */ struct PlayState* play;
    /* 0x090 */ struct Player* player;
    /* 0x094 */ PosRot playerPosRot;
    /* 0x0A8 */ struct Actor* target;
    /* 0x0AC */ PosRot targetPosRot;
    /* 0x0C0 */ f32 rUpdateRateInv;
    /* 0x0C4 */ f32 pitchUpdateRateInv;
    /* 0x0C8 */ f32 yawUpdateRateInv;
    /* 0x0CC */ f32 xzOffsetUpdateRate;
    /* 0x0D0 */ f32 yOffsetUpdateRate;
    /* 0x0D4 */ f32 fovUpdateRate;
    /* 0x0D8 */ f32 xzSpeed;
    /* 0x0DC */ f32 dist;
    /* 0x0E0 */ f32 speedRatio;
    /* 0x0E4 */ Vec3f posOffset;
    /* 0x0F0 */ Vec3f playerPosDelta;
    /* 0x0FC */ f32 fov;
    /* 0x100 */ f32 atLERPStepScale;
    /* 0x104 */ f32 playerGroundY;
    /* 0x108 */ Vec3f floorNorm;
    /* 0x114 */ f32 waterYPos;
    /* 0x118 */ s32 bgCamIndexBeforeUnderwater;
    /* 0x11C */ s32 waterCamSetting;
    /* 0x120 */ s32 waterQuakeId;
    /* 0x124 */ void* data0;
    /* 0x128 */ void* data1;
    /* 0x12C */ s16 data2;
    /* 0x12E */ s16 data3;
    /* 0x130 */ s16 uid;
    /* 0x132 */ char unk_132[2];
    /* 0x134 */ Vec3s inputDir;
    /* 0x13A */ Vec3s camDir;
    /* 0x140 */ s16 status;
    /* 0x142 */ s16 setting;
    /* 0x144 */ s16 mode;
    /* 0x146 */ s16 bgId; // bgId the camera is currently interacting with
    /* 0x148 */ s16 bgCamIndex;
    /* 0x14A */ s16 unk_14A;
    /* 0x14C */ s16 unk_14C;
    /* 0x14E */ s16 childCamId;
    /* 0x150 */ s16 waterDistortionTimer;
    /* 0x152 */ s16 distortionFlags;
    /* 0x154 */ s16 prevSetting;
    /* 0x156 */ s16 nextBgCamIndex;
    /* 0x158 */ s16 nextBgId;
    /* 0x15A */ s16 roll;
    /* 0x15C */ s16 paramFlags;
    /* 0x15E */ s16 animState;
    /* 0x160 */ s16 timer;
    /* 0x162 */ s16 parentCamId;
    /* 0x164 */ s16 camId;
    /* 0x166 */ s16 prevBgCamIndex;
    /* 0x168 */ s16 csId;
    /* 0x16A */ s16 unk_16A;
} Camera; // size = 0x16C

/**
 * Debug Camera
*/

typedef struct {
    /* 0x0000 */ s16 mode;
    /* 0x0002 */ s16 nFrames;
    /* 0x0004 */ s16 nPoints;
    /* 0x0006 */ s16 unkIdx;
    /* 0x0008 */ s16 unk_08;
    /* 0x000A */ s16 unk_0A;
    /* 0x000C */ s32 unk_0C; // bool: indicates position vs lookAt?
    /* 0x0010 */ char unk_10[0x14];
    /* 0x0024 */ CutsceneCameraPoint position[129];
    /* 0x0834 */ CutsceneCameraPoint lookAt[129];
    /* 0x1044 */ s16 demoCtrlMenu;
    /* 0x1046 */ s16 demoCtrlActionIdx; // e (?), s (save), l (load), c (clear)
    /* 0x1048 */ s16 demoCtrlToggleSwitch;
    /* 0x104A */ Vec3s unk_104A;
} DbCameraSub; // size = 0x1050

typedef struct {
    /* 0x00 */ s32 unk_00;
    /* 0x04 */ Vec3f at;
    /* 0x10 */ Vec3f eye;
    /* 0x1C */ Vec3f unk_1C;
    /* 0x28 */ char unk_28[0xC];
    /* 0x34 */ s32 unk_34;
    /* 0x38 */ s32 unk_38;
    /* 0x3C */ s32 unk_3C; // bool
    /* 0x40 */ s32 unk_40;
    /* 0x44 */ s32 unk_44;
    /* 0x48 */ f32 fov;
    /* 0x4C */ s16 roll;
    /* 0x4E */ char unk_4E[0x2];
    /* 0x50 */ f32 rollDegrees;
    /* 0x54 */ Vec3f unk_54;
    /* 0x60 */ Vec3f unk_60;
    /* 0x6C */ Vec3f unk_6C;
    /* 0x78 */ s16 unk_78;
    /* 0x7A */ s16 unk_7A;
    /* 0x7C */ DbCameraSub sub;
} DbCamera; // size = 0x10CC

typedef struct {
    /* 0x00 */ char letter;
    /* 0x01 */ u8 unk_01;
    /* 0x02 */ s16 mode;
    /* 0x04 */ CutsceneCameraPoint* position;
    /* 0x08 */ CutsceneCameraPoint* lookAt;
    /* 0x0C */ s16 nFrames;
    /* 0x0E */ s16 nPoints;
} DbCameraCut; // size = 0x10

typedef struct {
    /* 0x00 */ f32 curFrame;
    /* 0x04 */ f32 unk_04; // frame count?
    /* 0x08 */ s16 keyframe;
    /* 0x0A */ s16 unk_0A;
    /* 0x0C */ s16 unk_0C;
    /* 0x10 */ Vec3f positionPos; // confusing name
    /* 0x1C */ Vec3f lookAtPos;
    /* 0x28 */ f32 roll;
    /* 0x2C */ f32 fov;
} DbCameraAnim; // size = 0x30

#endif
