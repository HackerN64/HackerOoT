.include "macro.inc"

 # assembler directives
 .set noat      # allow manual use of $at
 .set noreorder # don't insert nops after branches
 .set gp=64     # allow use of 64-bit general purpose registers

.section .rodata

.balign 16

glabel D_809ACAC0
    .incbin "baserom/ovl_Effect_Ss_Stone1", 0x3C0, 0x00000060
