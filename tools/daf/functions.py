from os import walk
from re import sub
from argparse import ArgumentParser as Parser

try:
    from data import dataToFix, entrDictSpecial
except:
    print("[DAF:Error]: ``data.py`` not found! Make sure everything is in the same folder.")
    quit()

# -------------------------------------------------------

### [GENERAL FUNCTIONS] ###


def getArguments():
    """Initialisation of the argument parser"""

    parser = Parser(description="Fix various things related to assets for the OoT Decomp")

    parser.add_argument(
        "-m",
        "--mode",
        dest="mode",
        type=str,
        default="",
        help="available modes: `fix_types`, `name_entrances`, `fix_segments`",
    )

    parser.add_argument(
        "-a",
        "--all",
        dest="run_all",
        default=False,
        action="store_true",
        help="run every mode",
    )

    parser.add_argument(
        "-v",
        "--verbose",
        dest="verbose",
        default=False,
        action="store_true",
        help="show extra informations",
    )

    parser.add_argument(
        "-p",
        "--path",
        dest="decompPath",
        default="",
        required=True,
        help="set decomp root",
    )

    return parser.parse_args(), parser


def getPaths(path: str, fileType: str):
    """Returns a list of data paths with the specified extension"""
    paths = []
    for path, dirs, files in walk(path):
        for file in files:
            if file.endswith(fileType):
                paths.append(f"{path}/{file}")
    paths.sort()
    return paths


def getArrayInfos(data: list, arrayName: str):
    """Returns arrays containing line numbers for the start and the end of relevant C data"""
    arrayStartIndices = []
    arrayEndIndices = []
    hasListStarted = False

    for lineNb, line in enumerate(data):
        if arrayName in line and line.endswith("] = {\n"):
            arrayStartIndices.append(lineNb + 1)
            hasListStarted = True

        if hasListStarted and line.startswith("};\n"):
            arrayEndIndices.append(lineNb)
            hasListStarted = False
    try:
        if len(arrayStartIndices) != len(arrayEndIndices):
            raise IndexError
    except IndexError:
        print("[DAF:Error]: Start Length != End Length")

    return arrayStartIndices, arrayEndIndices


# -------------------------------------------------------

### [FIX TYPES MODE] ###


def replaceOldData(path: str, extension: str):
    """Replaces older names by newer ones"""
    paths = getPaths(path, extension)
    for path in paths:
        with open(path, "r") as curFile:
            fileData = curFile.read()
        for data in dataToFix:
            for key in data.keys():
                fileData = sub(rf"{key}\b", data[key], fileData)
                fileData = sub(rf"{key}_\B", f"{data[key]}_", fileData)
        with open(path, "w") as curFile:
            curFile.write(fileData)


# -------------------------------------------------------

### [NAME ENTRANCES] ###


def getEntranceDict(path: str):
    """Returns a list containing every entrances"""
    entranceList = []

    # read the entrance table
    try:
        with open(f"{path}/include/tables/entrance_table.h", "r") as fileData:
            # keep the relevant data
            for line in fileData.readlines():
                if line.startswith("/* 0x"):
                    startIndex = line.find("ENTR_")
                    entranceList.append(line[startIndex : line.find(",", startIndex)])
    except FileNotFoundError:
        raise print("[DAF:Error]: Can't find entrance_table.h!")

    # return a dictionnary from the entrance list
    return {f"0x{i:04X}": entrance for i, entrance in enumerate(entranceList)} | entrDictSpecial


def getNewFileData(data: list, dataDict: dict, arrayName: str):
    """Returns the current data with the updated values"""
    startList, endList = getArrayInfos(data, arrayName)
    if len(startList) == len(endList):
        for curStart, curEnd in zip(startList, endList):
            for i in range(curEnd - curStart):
                curLine = curStart + i
                try:
                    data[curLine] = (" " * 4) + f"{dataDict[data[curLine][:-2].lstrip()]},\n"
                except KeyError:
                    # why???
                    pass
    return data


def replaceEntranceHex(decompRoot: str):
    """Updates the entrances from OoT scenes"""
    entrDict = getEntranceDict(decompRoot)
    scenePaths = getPaths(f"{decompRoot}/assets/scenes/", ".c")

    for path in scenePaths:
        data = []
        sceneName = None
        with open(path, "r") as file:
            if file.name.find("room") == -1:
                data = file.readlines()
                sceneName = file.name.split("/")[6][:-2]
        if sceneName is not None:
            newData = getNewFileData(data, entrDict, f"{sceneName}ExitList")
            with open(path, "w") as file:
                for line in newData:
                    file.write(line)


# -------------------------------------------------------

### [FIX SEGMENTS] ###


def fixSegments(decompRoot):
    """Adds u32 casts to room's segment symbols"""
    paths = getPaths(f"{decompRoot}/assets/scenes", ".c")
    for path in paths:
        with open(path, "r") as curFile:
            fileData = curFile.read()

        fileData = sub(
            r"\w*SegmentRom\w*|\(u32\)\w*SegmentRom\w*",
            lambda match: f"(u32){match.group(0)}" if not match.group(0).startswith("(u32)") else match.group(0),
            fileData,
        )
        with open(path, "w") as curFile:
            curFile.write(fileData)
