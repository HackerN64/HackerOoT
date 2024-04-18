#include "ultra64.h"
#include "z64.h"
#include "macros.h"
#include "example_scene.h"
#include "segment_symbols.h"
#include "command_macros_base.h"
#include "z64cutscene_commands.h"
#include "variables.h"

/**
 * Header Child Day (Default)
*/
SceneCmd example_scene_header00[] = {
    SCENE_CMD_ALTERNATE_HEADER_LIST(example_scene_alternateHeaders),
    SCENE_CMD_SOUND_SETTINGS(0x00, 0x00, NA_BGM_FIELD_LOGIC),
    SCENE_CMD_ROOM_LIST(1, example_scene_roomList),
    SCENE_CMD_MISC_SETTINGS(0x00, 0x00),
    SCENE_CMD_COL_HEADER(&example_collisionHeader),
    SCENE_CMD_SPECIAL_FILES(0x00, OBJECT_GAMEPLAY_DANGEON_KEEP),
    SCENE_CMD_SKYBOX_SETTINGS(0x01, 0x00, LIGHT_MODE_TIME),
    SCENE_CMD_ENTRANCE_LIST(example_scene_header00_entranceList),
    SCENE_CMD_SPAWN_LIST(7, example_scene_header00_playerEntryList),
    SCENE_CMD_ENV_LIGHT_SETTINGS(4, example_scene_header00_lightSettings),
    SCENE_CMD_TRANSITION_ACTOR_LIST(1, example_scene_header00_transitionActors),
    SCENE_CMD_CUTSCENE_DATA(gZcameditTestCS),
    SCENE_CMD_END(),
};

SceneCmd* example_scene_alternateHeaders[] = {
    example_scene_header01,
    example_scene_header02,
    example_scene_header03,
};

RomFile example_scene_roomList[] = {
    { (u32)_example_room_0SegmentRomStart, (u32)_example_room_0SegmentRomEnd },
};

ActorEntry example_scene_header00_playerEntryList[] = {
    {
        /* Actor ID   */ ACTOR_PLAYER,
        /* Position   */ { 300, 0, -251 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ 0x0FFF
    },
    {
        /* Actor ID   */ ACTOR_PLAYER,
        /* Position   */ { 426, 0, 178 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(270.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ 0x0FFF
    },
    {
        /* Actor ID   */ ACTOR_PLAYER,
        /* Position   */ { -427, 0, 178 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(90.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ 0x0FFF
    },
    {
        /* Actor ID   */ ACTOR_PLAYER,
        /* Position   */ { -427, 0, 456 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(90.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ 0x0FFF
    },
    {
        /* Actor ID   */ ACTOR_PLAYER,
        /* Position   */ { 0, 0, 602 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(180.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ 0x0FFF
    },
    {
        /* Actor ID   */ ACTOR_PLAYER,
        /* Position   */ { 0, 0, -251 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ 0x0FFF
    },
    {
        /* Actor ID   */ ACTOR_PLAYER,
        /* Position   */ { -300, 0, -251 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ 0x0FFF
    },
};

TransitionActorEntry example_scene_header00_transitionActors[] = {
    // Wooden Door
    {
        /* Room & Cam Index (Front, Back) */ { 0, 0xFF, 0, 0xFF },
        /* Actor ID                       */ ACTOR_EN_DOOR,
        /* Position                       */ { 1, 0, -105 },
        /* Rotation Y                     */ DEG_TO_BINANG(0.000),
        /* Parameters                     */ 0x0
    },
};

Spawn example_scene_header00_entranceList[] = {
    // { Spawn Actor List Index, Room Index }
    { 0, 0 },
    { 1, 0 },
    { 2, 0 },
    { 3, 0 },
    { 4, 0 },
    { 5, 0 },
    { 6, 0 },
};

EnvLightSettings example_scene_header00_lightSettings[4] = {
    // Dawn Lighting
    {
        {    70,    45,    57 },   // Ambient Color
        {    73,    73,    73 },   // Diffuse0 Direction
        {   180,   154,   138 },   // Diffuse0 Color
        {   -73,   -73,   -73 },   // Diffuse1 Direction
        {    20,    20,    60 },   // Diffuse1 Color
        {   140,   120,   100 },   // Fog Color
        ((1 << 10) | 993),         // Blend Rate & Fog Near
        12800,                     // Fog Far
    },
    // Day Lighting
    {
        {   105,    90,    90 },   // Ambient Color
        {    73,    73,    73 },   // Diffuse0 Direction
        {   255,   255,   240 },   // Diffuse0 Color
        {   -73,   -73,   -73 },   // Diffuse1 Direction
        {    50,    50,    90 },   // Diffuse1 Color
        {   100,   100,   120 },   // Fog Color
        ((1 << 10) | 996),         // Blend Rate & Fog Near
        12800,                     // Fog Far
    },
    // Dusk Lighting
    {
        {   120,    90,     0 },   // Ambient Color
        {    73,    73,    73 },   // Diffuse0 Direction
        {   250,   135,    50 },   // Diffuse0 Color
        {   -73,   -73,   -73 },   // Diffuse1 Direction
        {    30,    30,    60 },   // Diffuse1 Color
        {   120,    70,    50 },   // Fog Color
        ((1 << 10) | 995),         // Blend Rate & Fog Near
        12800,                     // Fog Far
    },
    // Night Lighting
    {
        {    40,    70,   100 },   // Ambient Color
        {    73,    73,    73 },   // Diffuse0 Direction
        {    20,    20,    35 },   // Diffuse0 Color
        {   -73,   -73,   -73 },   // Diffuse1 Direction
        {    50,    50,   100 },   // Diffuse1 Color
        {     0,     0,    30 },   // Fog Color
        ((1 << 10) | 992),         // Blend Rate & Fog Near
        12800,                     // Fog Far
    },
};

/**
 * Header Child Night
*/
SceneCmd example_scene_header01[] = {
    SCENE_CMD_SOUND_SETTINGS(0x00, 0x00, NA_BGM_MARKET),
    SCENE_CMD_ROOM_LIST(1, example_scene_roomList),
    SCENE_CMD_MISC_SETTINGS(0x00, 0x00),
    SCENE_CMD_COL_HEADER(&example_collisionHeader),
    SCENE_CMD_SPECIAL_FILES(0x00, OBJECT_GAMEPLAY_DANGEON_KEEP),
    SCENE_CMD_SKYBOX_SETTINGS(0x01, 0x00, LIGHT_MODE_TIME),
    SCENE_CMD_ENTRANCE_LIST(example_scene_header01_entranceList),
    SCENE_CMD_SPAWN_LIST(7, example_scene_header01_playerEntryList),
    SCENE_CMD_ENV_LIGHT_SETTINGS(4, example_scene_header01_lightSettings),
    SCENE_CMD_TRANSITION_ACTOR_LIST(1, example_scene_header01_transitionActors),
    SCENE_CMD_END(),
};

ActorEntry example_scene_header01_playerEntryList[] = {
    {
        /* Actor ID   */ ACTOR_PLAYER,
        /* Position   */ { 300, 0, -251 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ 0x0FFF
    },
    {
        /* Actor ID   */ ACTOR_PLAYER,
        /* Position   */ { 426, 0, 178 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(270.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ 0x0FFF
    },
    {
        /* Actor ID   */ ACTOR_PLAYER,
        /* Position   */ { -427, 0, 178 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(90.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ 0x0FFF
    },
    {
        /* Actor ID   */ ACTOR_PLAYER,
        /* Position   */ { -427, 0, 456 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(90.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ 0x0FFF
    },
    {
        /* Actor ID   */ ACTOR_PLAYER,
        /* Position   */ { 0, 0, 602 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(180.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ 0x0FFF
    },
    {
        /* Actor ID   */ ACTOR_PLAYER,
        /* Position   */ { 0, 0, -251 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ 0x0FFF
    },
    {
        /* Actor ID   */ ACTOR_PLAYER,
        /* Position   */ { -300, 0, -251 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ 0x0FFF
    },
};

TransitionActorEntry example_scene_header01_transitionActors[] = {
    // Wooden Door
    {
        /* Room & Cam Index (Front, Back) */ { 0, 0xFF, 0, 0xFF },
        /* Actor ID                       */ ACTOR_EN_DOOR,
        /* Position                       */ { 1, 0, -105 },
        /* Rotation Y                     */ DEG_TO_BINANG(0.000),
        /* Parameters                     */ 0x0
    },
};

Spawn example_scene_header01_entranceList[] = {
    // { Spawn Actor List Index, Room Index }
    { 0, 0 },
    { 1, 0 },
    { 2, 0 },
    { 3, 0 },
    { 4, 0 },
    { 5, 0 },
    { 6, 0 },
};

EnvLightSettings example_scene_header01_lightSettings[4] = {
    // Dawn Lighting
    {
        {   143,   110,   130 },   // Ambient Color
        {    73,    73,    73 },   // Diffuse0 Direction
        {   219,   204,   194 },   // Diffuse0 Color
        {   -73,   -73,   -73 },   // Diffuse1 Direction
        {    79,    79,   133 },   // Diffuse1 Color
        {   196,   182,   175 },   // Fog Color
        ((1 << 10) | 993),         // Blend Rate & Fog Near
        12800,                     // Fog Far
    },
    // Day Lighting
    {
        {   143,   110,   130 },   // Ambient Color
        {    73,    73,    73 },   // Diffuse0 Direction
        {   219,   204,   194 },   // Diffuse0 Color
        {   -73,   -73,   -73 },   // Diffuse1 Direction
        {    79,    79,   133 },   // Diffuse1 Color
        {   196,   182,   175 },   // Fog Color
        ((1 << 10) | 993),         // Blend Rate & Fog Near
        12800,                     // Fog Far
    },
    // Dusk Lighting
    {
        {   143,   110,   130 },   // Ambient Color
        {    73,    73,    73 },   // Diffuse0 Direction
        {   219,   204,   194 },   // Diffuse0 Color
        {   -73,   -73,   -73 },   // Diffuse1 Direction
        {    79,    79,   133 },   // Diffuse1 Color
        {   196,   182,   175 },   // Fog Color
        ((1 << 10) | 993),         // Blend Rate & Fog Near
        12800,                     // Fog Far
    },
    // Night Lighting
    {
        {   143,   110,   130 },   // Ambient Color
        {    73,    73,    73 },   // Diffuse0 Direction
        {   219,   204,   194 },   // Diffuse0 Color
        {   -73,   -73,   -73 },   // Diffuse1 Direction
        {    79,    79,   133 },   // Diffuse1 Color
        {   196,   182,   175 },   // Fog Color
        ((1 << 10) | 993),         // Blend Rate & Fog Near
        12800,                     // Fog Far
    },
};

/**
 * Header Adult Day
*/
SceneCmd example_scene_header02[] = {
    SCENE_CMD_SOUND_SETTINGS(0x00, 0x00, NA_BGM_BOSS),
    SCENE_CMD_ROOM_LIST(1, example_scene_roomList),
    SCENE_CMD_MISC_SETTINGS(0x00, 0x00),
    SCENE_CMD_COL_HEADER(&example_collisionHeader),
    SCENE_CMD_SPECIAL_FILES(0x00, OBJECT_GAMEPLAY_DANGEON_KEEP),
    SCENE_CMD_SKYBOX_SETTINGS(0x01, 0x00, LIGHT_MODE_TIME),
    SCENE_CMD_ENTRANCE_LIST(example_scene_header02_entranceList),
    SCENE_CMD_SPAWN_LIST(7, example_scene_header02_playerEntryList),
    SCENE_CMD_ENV_LIGHT_SETTINGS(4, example_scene_header02_lightSettings),
    SCENE_CMD_TRANSITION_ACTOR_LIST(1, example_scene_header02_transitionActors),
    SCENE_CMD_END(),
};

ActorEntry example_scene_header02_playerEntryList[] = {
    {
        /* Actor ID   */ ACTOR_PLAYER,
        /* Position   */ { 300, 0, -251 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ 0x0FFF
    },
    {
        /* Actor ID   */ ACTOR_PLAYER,
        /* Position   */ { 426, 0, 178 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(270.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ 0x0FFF
    },
    {
        /* Actor ID   */ ACTOR_PLAYER,
        /* Position   */ { -427, 0, 178 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(90.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ 0x0FFF
    },
    {
        /* Actor ID   */ ACTOR_PLAYER,
        /* Position   */ { -427, 0, 456 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(90.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ 0x0FFF
    },
    {
        /* Actor ID   */ ACTOR_PLAYER,
        /* Position   */ { 0, 0, 602 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(180.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ 0x0FFF
    },
    {
        /* Actor ID   */ ACTOR_PLAYER,
        /* Position   */ { 0, 0, -251 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ 0x0FFF
    },
    {
        /* Actor ID   */ ACTOR_PLAYER,
        /* Position   */ { -300, 0, -251 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ 0x0FFF
    },
};

TransitionActorEntry example_scene_header02_transitionActors[] = {
    // Wooden Door
    {
        /* Room & Cam Index (Front, Back) */ { 0, 0xFF, 0, 0xFF },
        /* Actor ID                       */ ACTOR_EN_DOOR,
        /* Position                       */ { 1, 0, -105 },
        /* Rotation Y                     */ DEG_TO_BINANG(0.000),
        /* Parameters                     */ 0x0
    },
};

Spawn example_scene_header02_entranceList[] = {
    // { Spawn Actor List Index, Room Index }
    { 0, 0 },
    { 1, 0 },
    { 2, 0 },
    { 3, 0 },
    { 4, 0 },
    { 5, 0 },
    { 6, 0 },
};

EnvLightSettings example_scene_header02_lightSettings[4] = {
    // Dawn Lighting
    {
        {   143,   110,   130 },   // Ambient Color
        {    73,    73,    73 },   // Diffuse0 Direction
        {   219,   204,   194 },   // Diffuse0 Color
        {   -73,   -73,   -73 },   // Diffuse1 Direction
        {    79,    79,   133 },   // Diffuse1 Color
        {   196,   182,   175 },   // Fog Color
        ((1 << 10) | 993),         // Blend Rate & Fog Near
        12800,                     // Fog Far
    },
    // Day Lighting
    {
        {   143,   110,   130 },   // Ambient Color
        {    73,    73,    73 },   // Diffuse0 Direction
        {   219,   204,   194 },   // Diffuse0 Color
        {   -73,   -73,   -73 },   // Diffuse1 Direction
        {    79,    79,   133 },   // Diffuse1 Color
        {   196,   182,   175 },   // Fog Color
        ((1 << 10) | 993),         // Blend Rate & Fog Near
        12800,                     // Fog Far
    },
    // Dusk Lighting
    {
        {   143,   110,   130 },   // Ambient Color
        {    73,    73,    73 },   // Diffuse0 Direction
        {   219,   204,   194 },   // Diffuse0 Color
        {   -73,   -73,   -73 },   // Diffuse1 Direction
        {    79,    79,   133 },   // Diffuse1 Color
        {   196,   182,   175 },   // Fog Color
        ((1 << 10) | 993),         // Blend Rate & Fog Near
        12800,                     // Fog Far
    },
    // Night Lighting
    {
        {   143,   110,   130 },   // Ambient Color
        {    73,    73,    73 },   // Diffuse0 Direction
        {   219,   204,   194 },   // Diffuse0 Color
        {   -73,   -73,   -73 },   // Diffuse1 Direction
        {    79,    79,   133 },   // Diffuse1 Color
        {   196,   182,   175 },   // Fog Color
        ((1 << 10) | 993),         // Blend Rate & Fog Near
        12800,                     // Fog Far
    },
};

/**
 * Header Adult Night
*/
SceneCmd example_scene_header03[] = {
    SCENE_CMD_SOUND_SETTINGS(0x00, 0x1C, NA_BGM_JABU_JABU),
    SCENE_CMD_ROOM_LIST(1, example_scene_roomList),
    SCENE_CMD_MISC_SETTINGS(0x00, 0x00),
    SCENE_CMD_COL_HEADER(&example_collisionHeader),
    SCENE_CMD_SPECIAL_FILES(0x00, OBJECT_GAMEPLAY_DANGEON_KEEP),
    SCENE_CMD_SKYBOX_SETTINGS(0x01, 0x00, LIGHT_MODE_TIME),
    SCENE_CMD_ENTRANCE_LIST(example_scene_header03_entranceList),
    SCENE_CMD_SPAWN_LIST(7, example_scene_header03_playerEntryList),
    SCENE_CMD_ENV_LIGHT_SETTINGS(4, example_scene_header03_lightSettings),
    SCENE_CMD_TRANSITION_ACTOR_LIST(1, example_scene_header03_transitionActors),
    SCENE_CMD_END(),
};

ActorEntry example_scene_header03_playerEntryList[] = {
    {
        /* Actor ID   */ ACTOR_PLAYER,
        /* Position   */ { 300, 0, -251 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ 0x0FFF
    },
    {
        /* Actor ID   */ ACTOR_PLAYER,
        /* Position   */ { 426, 0, 178 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(270.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ 0x0FFF
    },
    {
        /* Actor ID   */ ACTOR_PLAYER,
        /* Position   */ { -427, 0, 178 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(90.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ 0x0FFF
    },
    {
        /* Actor ID   */ ACTOR_PLAYER,
        /* Position   */ { -427, 0, 456 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(90.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ 0x0FFF
    },
    {
        /* Actor ID   */ ACTOR_PLAYER,
        /* Position   */ { 0, 0, 602 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(180.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ 0x0FFF
    },
    {
        /* Actor ID   */ ACTOR_PLAYER,
        /* Position   */ { 0, 0, -251 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ 0x0FFF
    },
    {
        /* Actor ID   */ ACTOR_PLAYER,
        /* Position   */ { -300, 0, -251 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ 0x0FFF
    },
};

TransitionActorEntry example_scene_header03_transitionActors[] = {
    // Wooden Door
    {
        /* Room & Cam Index (Front, Back) */ { 0, 0xFF, 0, 0xFF },
        /* Actor ID                       */ ACTOR_EN_DOOR,
        /* Position                       */ { 1, 0, -105 },
        /* Rotation Y                     */ DEG_TO_BINANG(0.000),
        /* Parameters                     */ 0x0
    },
};

Spawn example_scene_header03_entranceList[] = {
    // { Spawn Actor List Index, Room Index }
    { 0, 0 },
    { 1, 0 },
    { 2, 0 },
    { 3, 0 },
    { 4, 0 },
    { 5, 0 },
    { 6, 0 },
};

EnvLightSettings example_scene_header03_lightSettings[4] = {
    // Dawn Lighting
    {
        {   143,   110,   130 },   // Ambient Color
        {    73,    73,    73 },   // Diffuse0 Direction
        {   219,   204,   194 },   // Diffuse0 Color
        {   -73,   -73,   -73 },   // Diffuse1 Direction
        {    79,    79,   133 },   // Diffuse1 Color
        {   196,   182,   175 },   // Fog Color
        ((1 << 10) | 993),         // Blend Rate & Fog Near
        12800,                     // Fog Far
    },
    // Day Lighting
    {
        {   143,   110,   130 },   // Ambient Color
        {    73,    73,    73 },   // Diffuse0 Direction
        {   219,   204,   194 },   // Diffuse0 Color
        {   -73,   -73,   -73 },   // Diffuse1 Direction
        {    79,    79,   133 },   // Diffuse1 Color
        {   196,   182,   175 },   // Fog Color
        ((1 << 10) | 993),         // Blend Rate & Fog Near
        12800,                     // Fog Far
    },
    // Dusk Lighting
    {
        {   143,   110,   130 },   // Ambient Color
        {    73,    73,    73 },   // Diffuse0 Direction
        {   219,   204,   194 },   // Diffuse0 Color
        {   -73,   -73,   -73 },   // Diffuse1 Direction
        {    79,    79,   133 },   // Diffuse1 Color
        {   196,   182,   175 },   // Fog Color
        ((1 << 10) | 993),         // Blend Rate & Fog Near
        12800,                     // Fog Far
    },
    // Night Lighting
    {
        {   143,   110,   130 },   // Ambient Color
        {    73,    73,    73 },   // Diffuse0 Direction
        {   219,   204,   194 },   // Diffuse0 Color
        {   -73,   -73,   -73 },   // Diffuse1 Direction
        {    79,    79,   133 },   // Diffuse1 Color
        {   196,   182,   175 },   // Fog Color
        ((1 << 10) | 993),         // Blend Rate & Fog Near
        12800,                     // Fog Far
    },
};

