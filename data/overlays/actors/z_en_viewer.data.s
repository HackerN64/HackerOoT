.include "macro.inc"

 # assembler directives
 .set noat      # allow manual use of $at
 .set noreorder # don't insert nops after branches
 .set gp=64     # allow use of 64-bit general purpose registers

.section .data

.balign 16

glabel D_80B2CEC0
 .word 0x00000000
glabel En_Viewer_InitVars
 .word 0x002A0700, 0x00000010, 0x00010000, 0x000005F8
.word EnViewer_Init
.word EnViewer_Destroy
.word EnViewer_Update
.word EnViewer_Draw
glabel D_80B2CEE4
 .word 0x30F8012C
glabel D_80B2CEE8
 .word 0x00460046, 0x01000214, 0x01000000, 0x06006B2C, 0x06007148, 0x00870047, 0x0100000A, 0x03000000, 0x0600F788, 0x060029CC, 0x01910047, 0x0100000A, 0x02000000, 0x0600E038, 0x06000450, 0x009B009B, 0x01FA000A, 0x00000000, 0x060119E8, 0x06002928, 0x002D002D, 0x01000214, 0x01000000, 0x06008668, 0x06003858, 0x009B009B, 0x01FA000A, 0x00000000, 0x060119E8, 0x060005B4, 0x002D002D, 0x01000214, 0x01000000, 0x06008668, 0x06002650, 0x009B009B, 0x01FA000A, 0x00000000, 0x060119E8, 0x06004260, 0x009B009B, 0x01FA000A, 0x00000000, 0x060119E8, 0x060050A8, 0x00E100E1, 0x01FA000A, 0x00000000, 0x060114E8, 0x06011348
glabel D_80B2CFB0
 .word func_80B2A300
.word func_80B2A4D8
.word func_80B2A300
.word func_80B2A448
glabel D_80B2CFC0
 .word 0x00000000, ActorShadow_DrawFunc_Circle, ActorShadow_DrawFunc_Squiggly
glabel D_80B2CFCC
 .word 0x00000000
glabel D_80B2CFD0
 .word 0x00000000, 0x00000000, 0x00000000
glabel D_80B2CFDC
 .word func_80B2B4A8
.word func_80B2B8FC
.word func_80B2BA38
.word func_80B2C130
glabel D_80B2CFEC
 .word 0x00000000

