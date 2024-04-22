#include "ultra64.h"
#include "z64.h"
#include "macros.h"
#include "example_scene.h"
#include "segment_symbols.h"
#include "command_macros_base.h"
#include "z64cutscene_commands.h"
#include "variables.h"

RoomShapeNormal example_room_0_shapeHeader = {
    ROOM_SHAPE_TYPE_NORMAL,
    ARRAY_COUNT(example_room_0_shapeDListEntry),
    example_room_0_shapeDListEntry,
    example_room_0_shapeDListEntry + ARRAY_COUNT(example_room_0_shapeDListEntry)
};

RoomShapeDListsEntry example_room_0_shapeDListEntry[1] = {
    { example_room_0_entry_0_opaque, example_room_0_entry_0_transparent },
};

