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

# - function name
# - function address
# - function size

@dataclass
class SymInfo:
    name: str
    vram: int
    vrom: int
    size: int
    o_path: Path

def get_sym_info(map_path: Path, symbol: str):
    with Capturing() as stdout:
        ret = mapfile_parser.frontends.sym_info.doSymInfo(map_path, symbol)
    assert ret == 0, f"failed with {symbol}"

    split = stdout[0].removesuffix(")").split("(")
    split2 = split[1].split(", ")

    return SymInfo(
        split[0].split(" ")[1].removeprefix("'").removesuffix("'"),
        int(split2[0].split(" ")[1], 16),
        int(split2[1].split(" ")[1], 16),
        int(split2[2].split(" ")[1], 16),
        Path(split2[3]).resolve(),
    )

funcs_to_process = [
    # "send_mesg",
    # "__osEnqueueAndYield",
    # "__osEnqueueThread",
    # "__osPopThread",
    # "__osDispatchThread",
    "osGetMemSize",
    "osInvalDCache",
    "osInvalICache",
    "osWritebackDCache",
    "osWritebackDCacheAll",
    "__osDisableInt",
    "__osRestoreInt",
    "__osSpSetStatus",
    "cosf",
    "sinf",
    "bzero",
    "bcopy",
    "memcpy",
    "osVirtualToPhysical",
    # "osPhysicalToVirtual",
    "guMtxF2L",
    # "guMtxCatF",
    "guMtxIdentF",
    "guMtxIdent",
    "guOrthoF",
    "guOrtho",
    "guPerspectiveF",
    "guPerspective",
    # "guScaleF",
    "guScale",
    "guRotateF",
    "guRotate",
    # "guTranslateF",
    "guTranslate",
    "guLookAtF",
    "guLookAt",
    "guLookAtHiliteF",
    "guLookAtHilite",
    # "guLookAtReflectF",
    # "guLookAtReflect",
    "osAiSetFrequency",
    "osAiSetNextBuffer",
    # "__osEepStatus",
    # "osEepromRead",
    # "osEepromWrite",
    # "osEepromLongRead",
    # "osEepromLongWrite",
    "osGetCount",
    "osViSwapBuffer",
]

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="gamecube utility")
    parser.add_argument("-v", "--version", help="OoT Version", default="ntsc-1.2")
    parser.add_argument("-c", "--codec", help="Compression Codec", default="yaz")
    args = parser.parse_args()

    VERSION = args.version
    map_file = f"hackeroot-{VERSION}.map"
    ROM_PATH = Path(f"build/{VERSION}/hackeroot-{VERSION}.z64").resolve()
    BUILTMAP = Path("build") / VERSION / map_file

    # header
    output = b"".join(
        [
            "LIBC".encode("utf-8"),
            struct.pack(">H", len(funcs_to_process)),
        ]
    )
    while len(output) % 32:
        output += b"".join([struct.pack(">x")])

    for func in funcs_to_process:
        sym_info = get_sym_info(BUILTMAP, func)

        with ROM_PATH.open("rb") as file:
            file.seek(sym_info.vrom)
            rom_data = file.read(sym_info.size)

        name = sym_info.name

        match name:
            case "cosf":
                name = "__cosf"
            case "sinf":
                name = "__sinf"
            case "osViSwapBuffer":
                name = "osViSwapBuffer_Entry"

        entry = b"".join(
            [
                struct.pack(">I", sym_info.vram),
                struct.pack(">I", sym_info.size),
                name.encode("utf-8"),
            ]
        )
        while len(entry) % 0x20:
            entry += b"".join([struct.pack(">x")])

        output += entry

    out = Path("build/" + VERSION + "/lib_config.bin").resolve()
    out.write_bytes(output)
