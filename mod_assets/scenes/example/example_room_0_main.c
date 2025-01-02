#include "example_scene.h"


/**
 * Header Child Day (Default)
*/
#define LENGTH_EXAMPLE_ROOM_0_HEADER00_OBJECTLIST 1
#define LENGTH_EXAMPLE_ROOM_0_HEADER00_ACTORLIST 3
SceneCmd example_room_0_header00[] = {
    SCENE_CMD_ALTERNATE_HEADER_LIST(example_room_0_alternateHeaders),
    SCENE_CMD_ROOM_SHAPE(&example_room_0_shapeHeader),
    SCENE_CMD_ECHO_SETTINGS(0x00),
    SCENE_CMD_ROOM_BEHAVIOR(0x00, 0x00, false, false),
    SCENE_CMD_SKYBOX_DISABLES(false, false),
    SCENE_CMD_TIME_SETTINGS(255, 255, 0),
    SCENE_CMD_OBJECT_LIST(LENGTH_EXAMPLE_ROOM_0_HEADER00_OBJECTLIST, example_room_0_header00_objectList),
    SCENE_CMD_ACTOR_LIST(LENGTH_EXAMPLE_ROOM_0_HEADER00_ACTORLIST, example_room_0_header00_actorList),
    SCENE_CMD_END(),
};

SceneCmd* example_room_0_alternateHeaders[] = {
    example_room_0_header01,
    example_room_0_header02,
    example_room_0_header03,
};

s16 example_room_0_header00_objectList[LENGTH_EXAMPLE_ROOM_0_HEADER00_OBJECTLIST] = {
    OBJECT_SYOKUDAI,
};

ActorEntry example_room_0_header00_actorList[LENGTH_EXAMPLE_ROOM_0_HEADER00_ACTORLIST] = {
    // Flame
    {
        /* Actor ID   */ ACTOR_EN_LIGHT,
        /* Position   */ { -269, 0, -437 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ (((0x3F << 4) & 0x03F0))
    },

    // Dungeon Switches
    {
        /* Actor ID   */ ACTOR_OBJ_SWITCH,
        /* Position   */ { -308, 0, -437 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ (0x0003 | (((0x1 << 8) & 0x3F00) | (1 << 4)))
    },

    // Torch
    {
        /* Actor ID   */ ACTOR_OBJ_SYOKUDAI,
        /* Position   */ { -400, 0, -437 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ (0x2000 | ((0x1 & 0x003F)))
    },
};

/**
 * Header Child Night
*/
#define LENGTH_EXAMPLE_ROOM_0_HEADER01_OBJECTLIST 1
#define LENGTH_EXAMPLE_ROOM_0_HEADER01_ACTORLIST 3
SceneCmd example_room_0_header01[] = {
    SCENE_CMD_ROOM_SHAPE(&example_room_0_shapeHeader),
    SCENE_CMD_ECHO_SETTINGS(0x00),
    SCENE_CMD_ROOM_BEHAVIOR(0x00, 0x00, false, false),
    SCENE_CMD_SKYBOX_DISABLES(false, false),
    SCENE_CMD_TIME_SETTINGS(255, 255, 0),
    SCENE_CMD_OBJECT_LIST(LENGTH_EXAMPLE_ROOM_0_HEADER01_OBJECTLIST, example_room_0_header01_objectList),
    SCENE_CMD_ACTOR_LIST(LENGTH_EXAMPLE_ROOM_0_HEADER01_ACTORLIST, example_room_0_header01_actorList),
    SCENE_CMD_END(),
};

s16 example_room_0_header01_objectList[LENGTH_EXAMPLE_ROOM_0_HEADER01_OBJECTLIST] = {
    OBJECT_SYOKUDAI,
};

ActorEntry example_room_0_header01_actorList[LENGTH_EXAMPLE_ROOM_0_HEADER01_ACTORLIST] = {
    // Flame
    {
        /* Actor ID   */ ACTOR_EN_LIGHT,
        /* Position   */ { -236, 0, -437 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ (0x0002 | (((0x3F << 4) & 0x03F0)))
    },

    // Dungeon Switches
    {
        /* Actor ID   */ ACTOR_OBJ_SWITCH,
        /* Position   */ { -308, 0, -437 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ (0x0003 | (((0x1 << 8) & 0x3F00) | (1 << 4)))
    },

    // Torch
    {
        /* Actor ID   */ ACTOR_OBJ_SYOKUDAI,
        /* Position   */ { -400, 0, -437 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ (0x2000 | ((0x1 & 0x003F)))
    },
};

/**
 * Header Adult Day
*/
#define LENGTH_EXAMPLE_ROOM_0_HEADER02_OBJECTLIST 1
#define LENGTH_EXAMPLE_ROOM_0_HEADER02_ACTORLIST 3
SceneCmd example_room_0_header02[] = {
    SCENE_CMD_ROOM_SHAPE(&example_room_0_shapeHeader),
    SCENE_CMD_ECHO_SETTINGS(0x00),
    SCENE_CMD_ROOM_BEHAVIOR(0x00, 0x00, false, false),
    SCENE_CMD_SKYBOX_DISABLES(false, false),
    SCENE_CMD_TIME_SETTINGS(255, 255, 0),
    SCENE_CMD_OBJECT_LIST(LENGTH_EXAMPLE_ROOM_0_HEADER02_OBJECTLIST, example_room_0_header02_objectList),
    SCENE_CMD_ACTOR_LIST(LENGTH_EXAMPLE_ROOM_0_HEADER02_ACTORLIST, example_room_0_header02_actorList),
    SCENE_CMD_END(),
};

s16 example_room_0_header02_objectList[LENGTH_EXAMPLE_ROOM_0_HEADER02_OBJECTLIST] = {
    OBJECT_SYOKUDAI,
};

ActorEntry example_room_0_header02_actorList[LENGTH_EXAMPLE_ROOM_0_HEADER02_ACTORLIST] = {
    // Flame
    {
        /* Actor ID   */ ACTOR_EN_LIGHT,
        /* Position   */ { -204, 0, -437 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ (0x0003 | (((0x3F << 4) & 0x03F0)))
    },

    // Dungeon Switches
    {
        /* Actor ID   */ ACTOR_OBJ_SWITCH,
        /* Position   */ { -308, 0, -437 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ (0x0003 | (((0x1 << 8) & 0x3F00) | (1 << 4)))
    },

    // Torch
    {
        /* Actor ID   */ ACTOR_OBJ_SYOKUDAI,
        /* Position   */ { -400, 0, -437 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ (0x2000 | ((0x1 & 0x003F)))
    },
};

/**
 * Header Adult Night
*/
#define LENGTH_EXAMPLE_ROOM_0_HEADER03_OBJECTLIST 1
#define LENGTH_EXAMPLE_ROOM_0_HEADER03_ACTORLIST 3
SceneCmd example_room_0_header03[] = {
    SCENE_CMD_ROOM_SHAPE(&example_room_0_shapeHeader),
    SCENE_CMD_ECHO_SETTINGS(0x00),
    SCENE_CMD_ROOM_BEHAVIOR(0x00, 0x00, false, false),
    SCENE_CMD_SKYBOX_DISABLES(false, false),
    SCENE_CMD_TIME_SETTINGS(255, 255, 0),
    SCENE_CMD_OBJECT_LIST(LENGTH_EXAMPLE_ROOM_0_HEADER03_OBJECTLIST, example_room_0_header03_objectList),
    SCENE_CMD_ACTOR_LIST(LENGTH_EXAMPLE_ROOM_0_HEADER03_ACTORLIST, example_room_0_header03_actorList),
    SCENE_CMD_END(),
};

s16 example_room_0_header03_objectList[LENGTH_EXAMPLE_ROOM_0_HEADER03_OBJECTLIST] = {
    OBJECT_SYOKUDAI,
};

ActorEntry example_room_0_header03_actorList[LENGTH_EXAMPLE_ROOM_0_HEADER03_ACTORLIST] = {
    // Flame
    {
        /* Actor ID   */ ACTOR_EN_LIGHT,
        /* Position   */ { -172, 0, -437 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ (0x0008 | (((0x3F << 4) & 0x03F0)))
    },

    // Dungeon Switches
    {
        /* Actor ID   */ ACTOR_OBJ_SWITCH,
        /* Position   */ { -308, 0, -437 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ (0x0003 | (((0x1 << 8) & 0x3F00) | (1 << 4)))
    },

    // Torch
    {
        /* Actor ID   */ ACTOR_OBJ_SYOKUDAI,
        /* Position   */ { -400, 0, -437 },
        /* Rotation   */ { DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000), DEG_TO_BINANG(0.000) },
        /* Parameters */ (0x2000 | ((0x1 & 0x003F)))
    },
};

