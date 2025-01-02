#include "example_scene.h"


RoomShapeNormal example_room_0_shapeHeader = {
    ROOM_SHAPE_TYPE_NORMAL,
    ARRAY_COUNT(example_room_0_shapeDListsEntry),
    example_room_0_shapeDListsEntry,
    example_room_0_shapeDListsEntry + ARRAY_COUNT(example_room_0_shapeDListsEntry)
};

RoomShapeDListsEntry example_room_0_shapeDListsEntry[1] = {
    { example_room_0_shapeHeader_entry_0_opaque, example_room_0_shapeHeader_entry_0_transparent }
};

