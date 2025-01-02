#!/usr/bin/env python3

import argparse
import mapfile_parser
import sys
from io import StringIO
from pathlib import Path
from dataclasses import dataclass

# from https://stackoverflow.com/a/16571630
class Capturing(list):
    def __enter__(self):
        self._stdout = sys.stdout
        sys.stdout = self._stringio = StringIO()
        return self
    def __exit__(self, *args):
        self.extend(self._stringio.getvalue().splitlines())
        del self._stringio    # free up some memory
        sys.stdout = self._stdout

@dataclass
class DmaInfo:
    name: str
    index: int

@dataclass
class DmaEntry:
    vromStart: str
    vromEnd: str
    romStart: str
    romEnd: str

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="gamecube utility")
    parser.add_argument("-v", "--version", help="OoT Version", default="ntsc-1.2")
    parser.add_argument("-c", "--codec", help="Compression Codec", default="yaz")
    args = parser.parse_args()

    VERSION = args.version
    DMATABLE_PATH = f"build/{VERSION}/dmadata_table_spec.h"
    ROM_PATH = f"build/{VERSION}/oot-{VERSION}-compressed-{args.codec}.z64"
    sceneFiles: list[DmaInfo] = []
    otherFiles: list[DmaInfo] = []
    allFiles: list[DmaInfo] = []

    with open(DMATABLE_PATH, "r") as file:
        dmaTable = file.readlines()

    for i, dmaEntry in enumerate(dmaTable):
        entryName = dmaEntry.removeprefix("DEFINE_DMA_ENTRY(").removesuffix(")").split(", ")[0]
        allFiles.append(DmaInfo(entryName, i))
        if entryName.endswith("_scene"):
            sceneFiles.append(DmaInfo(entryName, i))
        if entryName in { "code", "ovl_title", "vr_fine1_static", "elf_message_field", "elf_message_ydan"}:
            otherFiles.append(DmaInfo(entryName, i))

    i = sceneFiles[-1].index
    entryName = dmaTable[i + 1].removeprefix("DEFINE_DMA_ENTRY(").removesuffix(")").split(", ")[0]
    sceneFiles.append(DmaInfo(entryName, i + 1))
    
    mapFile = f"oot-{VERSION}.map"
    BUILTMAP = Path("build") / VERSION / mapFile
    mapPath = BUILTMAP
    with Capturing() as stdout:
        ret = mapfile_parser.frontends.sym_info.doSymInfo(mapPath, "gDmaDataTable")
    assert ret == 0
    split = stdout[0].removesuffix(")").split("(")[1].split(", ")
    dmaVrom = split[1]
    dmaSize = split[2]

    with open(ROM_PATH, "rb") as file:
        file.seek(int(dmaVrom.removeprefix('VROM: '), 16))
        rom_data = bytearray(file.read(int(dmaSize.removeprefix('SIZE: '), 16)))

    temp: list[bytearray] = []
    for i in range(0, len(rom_data), 16):
        temp.append(rom_data[i:i + 16])

    dmaTable: list[DmaEntry] = []
    for data in temp:
        dmaTable.append(
            DmaEntry(
                f"0x{int.from_bytes(data[:4], byteorder='big', signed=False):08X}",
                f"0x{int.from_bytes(data[4:8], byteorder='big', signed=False):08X}",
                f"0x{int.from_bytes(data[8:12], byteorder='big', signed=False):08X}",
                f"0x{int.from_bytes(data[12:16], byteorder='big', signed=False):08X}",
            )
        )

    output = f"{(len(otherFiles) + 1) * 16:016}" # scene offset
    for info in otherFiles:
        entry = dmaTable[info.index]
        output += f"{int(entry.romStart, 16):016}"
    for info in sceneFiles:
        entry = dmaTable[info.index]
        output += f"{int(entry.romStart, 16):016}"

    with open("build/" + VERSION + "/dma_config.txt", "w") as file:
        file.write(output)
