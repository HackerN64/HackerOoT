#!/usr/bin/env python3

# Author: Fig
# Work based off of HailToDodongo's original tool: 
# https://github.com/HailToDodongo/oot/blob/daea8bacb27425a7dd8923dea6e0467ba68d1047/gdb_script.py
# Written with the help of Thar0
# License: CC0 (https://creativecommons.org/publicdomain/zero/1.0/)

import gdb
import re

TYPE_U32 = gdb.lookup_type('u32')

# address to object-path map, used to unload entire .o files by an address
obj_address_map = {}

def get_section_address(ovl_name, section_name):
  section_start_name = "_" + ovl_name + "Segment" + section_name + "Start"
  # 'section_start_name' is a 'text variable' according to gdb, this can not be resolved via python directly
  return int(gdb.execute('printf "%x", &' + section_start_name, False, True), 16)

def AddOverlaySymbols(overlay_table, index):
    alloc_address = int(overlay_table[index]["loadedRamAddr"].cast(TYPE_U32))

    if alloc_address == 0:
        print("ERROR: Requested overlay is not currently loaded")
        return
    
    vram_address = int(overlay_table[index]["vramStart"].cast(TYPE_U32))
    
    # get first symbol-name starting from vramStart (usually the first function in the overlay)
    target_func_name = gdb.execute(f"info symbol {vram_address}", False, True).partition(' ')[0].rstrip()

    # get section in main ELF (returns: "EnKusa_SetupAction in section ..ovl_En_Kusa of zelda_ocarina_mq_dbg.elf")
    ovl_sec_name = gdb.execute("info sym " + target_func_name, False, True)
    # extract section name (@TODO: check if there is a direct API for this)
    ovl_sec_name = ovl_sec_name.partition('section ..')[2].partition(" ")[0].rstrip()

    ovl_address_text   = get_section_address(ovl_sec_name, "Text")
    ovl_address_data   = get_section_address(ovl_sec_name, "Data")
    ovl_address_rodata = get_section_address(ovl_sec_name, "RoData")
    ovl_address_bss    = get_section_address(ovl_sec_name, "Bss")

    ovl_offset_text   = alloc_address
    ovl_offset_data   = alloc_address + (ovl_address_data   - ovl_address_text)
    ovl_offset_rodata = alloc_address + (ovl_address_rodata - ovl_address_text)
    ovl_offset_bss    = alloc_address + (ovl_address_bss    - ovl_address_text)

    # get full object-file path that contains the first symbol
    target_filename = gdb.lookup_symbol(target_func_name)[0].symtab.filename
    obj_name = "build/ntsc-1.2/" + target_filename[:-1] + "o"

    pattern = r'[^/]*$'
    matches = re.findall(pattern, obj_name)
    ovl_name = matches[0]

    obj_address_map[hex(alloc_address)] = obj_name
    print("Reading " + ovl_name[:-2] + "...")

    gdb.execute("add-symbol-file -readnow " + obj_name +
      " -o 0xFF000000" +
      " -s .text "   + hex(ovl_offset_text)   +
      " -s .data "   + hex(ovl_offset_data)   +
      " -s .rodata " + hex(ovl_offset_rodata) +
      " -s .bss "    + hex(ovl_offset_bss),
      False, True)
    
    print("Complete.")

class LoadOvlCmd(gdb.Command):
    def __init__(self):
        super().__init__("ovl", gdb.COMMAND_DATA, gdb.COMPLETE_EXPRESSION)
        print("INFO: gdb_load_ovl: welcome!")

    def invoke(self, arg, from_tty):
        arg = arg.upper()

        if arg == "PAUSE" or arg == "KALEIDO" or arg == "KALEIDO_SCOPE":
            # Pause menu does not have an enum, special case it. Index is 0 in `gKaleidoMgrOverlayTable`
            table = gdb.lookup_global_symbol("gKaleidoMgrOverlayTable").value()
            AddOverlaySymbols(table, 0)
        elif arg == "ACTOR_PLAYER":
            # Player's index does not correspond to his actor ID, Special case it. Index is 1 in `gKaleidoMgrOverlayTable`
            table = gdb.lookup_global_symbol("gKaleidoMgrOverlayTable").value()
            AddOverlaySymbols(table, 1)
        else:
            pattern = r'^([^_]+)'
            matches = re.findall(pattern, arg)
            ovl_type = matches[0]

            if ovl_type == "GAMESTATE":
                table = gdb.lookup_global_symbol("gGameStateOverlayTable").value()
            elif ovl_type == "ACTOR":
                table = gdb.lookup_global_symbol("gActorOverlayTable").value()
            elif ovl_type == "EFFECT":
                table = gdb.lookup_global_symbol("gEffectSsOverlayTable").value()
            else:
                print("ERROR: Type of enum provided is not supported")
                return
            
            # try to get the index from the elf via gdb
            try:
                index = gdb.lookup_symbol(arg)[0].value().cast(TYPE_U32)
            except:
                print("ERROR: Provided enum value could not be found in the elf")
                return


            AddOverlaySymbols(table, index)

LoadOvlCmd()
