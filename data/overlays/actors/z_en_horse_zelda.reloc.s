.include "macro.inc"

 # assembler directives
 .set noat      # allow manual use of $at
 .set noreorder # don't insert nops after branches
 .set gp=64     # allow use of 64-bit general purpose registers

.section .rodata

.balign 16

glabel D_80A6E2D0
    .incbin "baserom/ovl_En_Horse_Zelda", 0xA00, 0x000000D0
