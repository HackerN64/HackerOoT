.include "macro.inc"

 # assembler directives
 .set noat      # allow manual use of $at
 .set noreorder # don't insert nops after branches
 .set gp=64     # allow use of 64-bit general purpose registers

.section .data

.balign 16

glabel D_80A1CFF0
 .word 0x00000000
glabel D_80A1CFF4
 .word 0x00000000, 0x00000000, 0x00000000, 0x00000000
glabel D_80A1D004
 .word 0x00000000
glabel D_80A1D008
 .word 0x00020004, 0x00100008, 0x00200040, 0x00010000
glabel D_80A1D018
 .word 0x02030400, 0x01000000
glabel D_80A1D020
 .word 0x00000003, 0x00000004, 0x00000000, 0x00000001, 0x00000002
glabel En_Fr_InitVars
 .word 0x00ED0400, 0x02000019, 0x00E60000, 0x000003C4
.word EnFr_Init
.word EnFr_Destroy
.word EnFr_Update
.word 0x00000000
glabel D_80A1D054
 .word 0xC8AA00FF, 0x00AAC8FF, 0xD27864FF, 0x7882E6FF, 0xBEBEBEFF
glabel D_80A1D068
 .word 0x00000000
glabel D_80A1D06C
 .word 0x00000000
glabel D_80A1D070
 .word 0x00000000, 0x42A00000, 0xBF96CBE4, 0xC2A00000, 0x42A00000, 0xBFC90FDB, 0xC2A00000, 0x42A00000, 0xBF490FDB, 0xC2A00000, 0x42A00000, 0x402FEDE0, 0xC2A00000, 0x42A00000, 0x3FC90FDB, 0xC2A00000
glabel D_80A1D0B0
 .word 0x00280014, 0x000F000C, 0x000C0000
glabel D_80A1D0BC
 .byte 0x80, 0x1F, 0x00, 0x02, 0x30, 0x4C, 0x00
glabel D_80A1D0C3
 .byte 0x1E, 0x05, 0x01, 0x07, 0x03, 0x09, 0x00, 0x00, 0x00
glabel D_80A1D0CC
 .word 0x43340000, 0x43520000, 0x43700000, 0x43870000
glabel D_80A1D0DC
 .word 0x0502090B, 0x0E000000
glabel D_80A1D0E4
 .word 0xF9F6FDFF, 0x02000000
glabel D_80A1D0EC
 .word 0x01000203, 0x04010002
glabel D_80A1D0F4
 .word 0x00010203, 0x04000000
glabel D_80A1D0FC
 .word 0x060059A0, 0x06005BA0, 0x00000000, 0x00000000, 0x00000000

