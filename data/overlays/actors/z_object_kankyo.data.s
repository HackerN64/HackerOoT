.include "macro.inc"

 # assembler directives
 .set noat      # allow manual use of $at
 .set noreorder # don't insert nops after branches
 .set gp=64     # allow use of 64-bit general purpose registers

.section .data

.balign 16

glabel D_80BA58E0
 .word gEffLightning1Tex, gEffLightning2Tex, gEffLightning3Tex, gEffLightning4Tex, gEffLightning5Tex, gEffLightning6Tex, gEffLightning7Tex, gEffLightning8Tex
glabel D_80BA5900
 .word 0x060015E0, 0x060025E0, 0x060035E0, 0x060045E0, 0x060055E0, 0x060065E0, 0x060075E0, 0x060085E0
glabel Object_Kankyo_InitVars
 .word 0x00970700, 0x02000030, 0x00010000, 0x00001660
.word ObjectKankyo_Init
.word ObjectKankyo_Destroy
.word ObjectKankyo_Update
.word ObjectKankyo_Draw
glabel D_80BA5940
 .word 0x00000000
glabel D_80BA5944
 .word 0x00000000
glabel D_80BA5948
 .word 0x00000000, 0x00000000, 0x00000000
glabel D_80BA5954
 .word 0x00000000, 0x00000000, 0x00000000
glabel D_80BA5960
 .word 0x00000000, 0x00000000, 0x00000000
glabel D_80BA596C
 .word 0x00000000, 0x00000000, 0x00000000
glabel D_80BA5978
 .word 0x00000000, 0x00000000, 0x00000000
glabel D_80BA5984
 .word 0x00000000, 0x00000000, 0x00000000
glabel D_80BA5990
 .word 0x00000000, 0x00000000, 0x00000000
glabel D_80BA599C
 .word 0x43D70000, 0x44570000, 0x43D70000, 0xC3D50000, 0xC4578000, 0xC3DC0000
glabel D_80BA59B4
 .word 0x4409C000, 0x4409C000, 0x4409C000, 0x440A8000, 0x4409C000, 0x4408C000
glabel D_80BA59CC
 .word 0xC2C00000, 0xC4520000, 0xC4C62000, 0xC4C54000, 0xC4520000, 0xC29C0000
glabel D_80BA59E4
 .word 0x41EF3333, 0x42B40000, 0x43160000, 0x41F00000, 0x42B40000, 0xC1F0CCCD
glabel D_80BA59FC
 .word 0x42CECCCD, 0x42CF999A, 0x42CF3333, 0xC2CECCCD, 0xC2CF0000, 0x42CF0000
glabel D_80BA5A14
 .word 0xFFFFAAAA, 0xFFFFFFAA, 0xFFFFFFAA, 0xFFFFAAFF, 0xFFAA0000
glabel D_80BA5A28
 .word 0x00C80000, 0x32FF6400, 0xC8C80000, 0xC8FF00FF, 0x78000000, 0x00000000

