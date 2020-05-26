.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .bss

.balign 16

glabel sFaultStructPtr
    .space 4

glabel sFaultIsWaitingForInput
    .space 4

glabel sFaultStack
    .space 0x600

glabel sFaultThreadInfo
    .space 0x20

glabel gFaultStruct
    .space 0x850
