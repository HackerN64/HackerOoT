.include "macro.inc"

 # assembler directives
 .set noat      # allow manual use of $at
 .set noreorder # don't insert nops after branches
 .set gp=64     # allow use of 64-bit general purpose registers

.section .rodata

.balign 16

glabel D_80B5ABA0
    .incbin "baserom/ovl_En_Zl3", 0x77F0, 0x00000C10
