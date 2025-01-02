.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .bss

# Note: This file is only included in the MATCHING build, the data is imported for non-matching

.balign 16

glabel sFaultDrawer
    .space 0x3C
    .space 0x04 # padding

glabel D_8016B6C0
    .space 0x20
