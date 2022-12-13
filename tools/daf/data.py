### [GENERAL DATA] ###

# Add types here
fileTypes = [".h", ".c"]

# -------------------------------------------------------

### [FIX TYPES MODE] ###

# Format: ``"OLD": "NEW"``

camData = {
    "CamData": "BgCamInfo",
}

curveData = {
    "TransformData": "CurveInterpKnot",
    "TransformUpdateIndex": "CurveAnimationHeader",
    "SkelCurveLimbList": "CurveSkeletonHeader",
}

roomData = {
    "PolygonDlist": "RoomShapeDListsEntry",
    "PolygonType0": "RoomShapeNormal",
    "MeshHeader1Single": "RoomShapeImageSingle",
    "BgImage": "RoomShapeImageMultiBgEntry",
    "MeshHeader1Multi": "RoomShapeImageMulti",
    "PolygonDlist2": "RoomShapeCullableEntry",
    "PolygonType2": "RoomShapeCullable",
    "SCENE_CMD_MESH": "SCENE_CMD_ROOM_SHAPE",
}

skinData = {
    "Struct_800A57C0": "SkinVertex",
    "Struct_800A598C_2": "SkinTransformation",
    "Struct_800A5E28": "SkinAnimatedLimbData",
    "Struct_800A598C": "SkinLimbModif",
}

sceneData = {
    "EntranceEntry": "Spawn",
    "LightSettings": "EnvLightSettings",
}

# Add or remove dictionnaries to this list to replace types
dataToFix = [
    camData,
    curveData,
    roomData,
    skinData,
    sceneData,
]

# -------------------------------------------------------

### [NAME ENTRANCES] ###

# Dictionnary containing special entrance values
entrDictSpecial = {
    "0x7FF9": "ENTR_RETURN_GREAT_FAIRYS_FOUNTAIN_SPELLS",
    "0x7FFA": "ENTR_RETURN_SHOOTING_GALLERY",
    "0x7FFB": "ENTR_RETURN_2",  # Unused
    "0x7FFC": "ENTR_RETURN_BAZAAR",
    "0x7FFD": "ENTR_RETURN_4",  # Unused
    "0x7FFE": "ENTR_RETURN_GREAT_FAIRYS_FOUNTAIN_MAGIC", # Magic meters and double defense
    "0x7FFF": "ENTR_RETURN_GROTTO",  # Grottos and normal Fairy Fountain
}

# -------------------------------------------------------

### [SCENE & ROOM COMMANDS ARGUMENTS] ###

# Format: ``"OLD ARG VALUE'S POS": "NEW VALUES (list)"``
# Arg No. 1 will be pos 1

specialFilesCmd = {
    1: ["NAVI_QUEST_HINTS_NONE", "NAVI_QUEST_HINTS_OVERWORLD", "NAVI_QUEST_HINTS_DUNGEON"],
}

# Make sure to add the implementation in ``fixSceneRoomCommandsArgs``
commandsToFix = [
    "SCENE_CMD_SPECIAL_FILES",
]
