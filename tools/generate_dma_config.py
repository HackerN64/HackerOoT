#!/usr/bin/env python3

import argparse
import mapfile_parser
import sys
import struct

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
    parser.add_argument("-v", "--version", help="OoT Version", default="gc-jp")
    parser.add_argument("-c", "--codec", help="Compression Codec", default="yaz")
    args = parser.parse_args()

    VERSION = args.version
    DMATABLE_PATH = Path(f"build/{VERSION}/dmadata_table_spec.h").resolve()
    ROM_PATH = f"build/{VERSION}/oot-{VERSION}-compressed.z64"
    sceneFiles: list[DmaInfo] = []
    otherFiles: list[DmaInfo] = []
    allFiles: list[DmaInfo] = []

    dmaTable = DMATABLE_PATH.read_text().split("\n")
    for i, dmaEntry in enumerate(dmaTable):
        entryName = dmaEntry.removeprefix("DEFINE_DMA_ENTRY(").removesuffix(")").split(", ")[0]
        allFiles.append(DmaInfo(entryName, i))
        if entryName.endswith("_scene"):
            sceneFiles.append(DmaInfo(entryName, i))
        if entryName in { "code", "ovl_title", "vr_holy0_static", "elf_message_field", "ydan_scene"}:
            otherFiles.append(DmaInfo(entryName, i))

    i = sceneFiles[-1].index
    entryName = dmaTable[i + 1].removeprefix("DEFINE_DMA_ENTRY(").removesuffix(")").split(", ")[0]
    sceneFiles.append(DmaInfo(entryName, i + 1))
    
    mapFile = f"oot-{VERSION}.map" if VERSION != "hackeroot-mq" else "hackeroot-mq.map"
    BUILTMAP = Path("build") / VERSION / mapFile
    mapPath = BUILTMAP
    with Capturing() as stdout:
        ret = mapfile_parser.frontends.sym_info.doSymInfo(mapPath, "gDmaDataTable")
    assert ret == 0
    split = stdout[0].removesuffix(")").split("(")[1].split(", ")
    table_offset = int(split[1].removeprefix('VROM: '), 16)
    table_size = int(split[2].removeprefix('SIZE: '), 16)

    dbg_output = "--- Debug Informations ---\n"
    files = otherFiles + sceneFiles
    data = []
    for info in files:
        data.append(struct.pack(">H", info.index))
        dbg_output += f"- {info.index:04}; {repr(info.name)}\n"

    data_bytes = b"".join(data)
    while len(data_bytes) % 32:
        data_bytes += b"".join([struct.pack(">x")])

    # header
    output = b"".join(
        [
            "DMAC".encode("utf-8"),
            struct.pack(">I", table_offset),
            struct.pack(">H", table_size),
            struct.pack(">H", len(data_bytes)),
            struct.pack(">H", len(data)),
        ]
    )
    while len(output) % 32:
        output += b"".join([struct.pack(">x")])

    # data
    output += data_bytes
    while len(output) % 32:
        output += b"".join([struct.pack(">x")])

    out = Path("build/" + VERSION + "/dma_config.bin").resolve()
    out.write_bytes(output)
