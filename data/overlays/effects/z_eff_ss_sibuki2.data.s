.include "macro.inc"

 # assembler directives
 .set noat      # allow manual use of $at
 .set noreorder # don't insert nops after branches
 .set gp=64     # allow use of 64-bit general purposee registers

.section .data

.word 0x00000012
.word func_809ABD60
glabel D_809AC068
 .word 0x0401C2C0, 0x0401C2C0, 0x0401C6C0, 0x0401CAC0, 0x0401CEC0, 0x0401D2C0, 0x0401D6C0, 0x0401DAC0, 0x0401DEC0, 0x00000000

