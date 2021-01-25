.include "macro.inc"

 # assembler directives
 .set noat      # allow manual use of $at
 .set noreorder # don't insert nops after branches
 .set gp=64     # allow use of 64-bit general purpose registers

.section .data

.balign 16

glabel En_Go_InitVars
 .word 0x01520400, 0x00000039, 0x00C90000, 0x000006C8
.word EnGo_Init
.word EnGo_Destroy
.word EnGo_Update
.word EnGo_Draw
glabel D_80A41B00
 .word 0x0A000039, 0x20010000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000100, 0x0014002E, 0x00000000, 0x00000000
glabel D_80A41B2C
 .word 0x00000000, 0x00000000, 0xFF000000
glabel D_80A41B38
 .word 0x06004930, 0x00000000, 0x01000000, 0x00000000, 0x06004930, 0x00000000, 0x01000000, 0xC1200000, 0x060029A8, 0x3F800000, 0x01000000, 0xC1200000, 0x06010590, 0x3F800000, 0x01000000, 0xC1200000
glabel D_80A41B78
 .word 0x00000000, 0x00000000, 0x00000000
glabel D_80A41B84
 .word 0x00000000, 0x00000000, 0x00000000
glabel D_80A41B90
 .word 0x00000000, 0x3E99999A, 0x00000000
glabel D_80A41B9C
 .word 0x00000000, 0x00000000, 0x00000000
glabel D_80A41BA8
 .word 0x00000000, 0x00000000, 0x00000000
glabel D_80A41BB4
 .word 0x00000000, 0x00000000, 0x00000000
glabel D_80A41BC0
 .word 0x00000000, 0x00000000, 0x00000000
glabel D_80A41BCC
 .word 0x44160000, 0x00000000, 0x00000000
glabel D_80A41BD8
 .word gDust8Tex, gDust7Tex, gDust6Tex, gDust5Tex, gDust4Tex, gDust3Tex, gDust2Tex, gDust1Tex, 0x00000000, 0x00000000

