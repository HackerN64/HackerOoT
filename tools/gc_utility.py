#!/usr/bin/env python3

import argparse
from dataclasses import dataclass

DMATABLE_PATH = ""
VERSION = ""
INDENT = " " * 4

@dataclass
class SceneFiles:
    name: str
    index: int

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="gamecube utility")
    parser.add_argument("-m", "--mode", help="Write Mode ('code' or 'txt')", default="code")
    parser.add_argument("-v", "--version", help="OoT Version", default="hackeroot-mq")
    args = parser.parse_args()

    mode = args.mode
    VERSION = args.version
    DMATABLE_PATH = f"build/{VERSION}/dmadata_table_spec.h"
    sceneFiles: list[SceneFiles] = []

    with open(DMATABLE_PATH, "r") as file:
        dmaTable = file.readlines()

    for i, dmaEntry in enumerate(dmaTable):
        entryName = dmaEntry.removeprefix("DEFINE_DMA_ENTRY(").removesuffix(")").split(", ")[0]
        if entryName.endswith("_scene"):
            sceneFiles.append(SceneFiles(entryName, i))

    if mode == "code":
        output = (
            ("static s32 ganSceneFileIndices[] = {\n" + INDENT)
            + f"\n{INDENT}".join(f"{scene.index}, // {scene.name}" for scene in sceneFiles)
            + "\n};\n"
        )
    elif mode == "txt":
        output = "".join(f"{scene.index}\n" for scene in sceneFiles)
    else:
        raise ValueError(f"ERROR: unknown write mode (``{mode}``)")

    fileType = ".h" if mode == "code" else ".txt"
    with open("build/" + VERSION + "/scene_files" + fileType, "w") as file:
        file.write(output)
