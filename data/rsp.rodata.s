.include "macro.inc"

/* assembler directives */
.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.set gp=64     /* allow use of 64-bit general purpose registers */

.section .rodata

.balign 16

glabel rspbootTextStart
    .incbin "incbin/rspbootText"
glabel rspbootTextEnd

glabel aspMainTextStart
    .incbin "incbin/aspMainText"
glabel aspMainTextEnd

glabel aspMainDataStart
    .incbin "incbin/aspMainData"
glabel aspMainDataEnd

glabel gspS2DEX2d_fifoTextStart
    .incbin "incbin/gspS2DEX2d_fifoText"
glabel gspS2DEX2d_fifoTextEnd

glabel gspS2DEX2d_fifoDataStart
    .incbin "incbin/gspS2DEX2d_fifoData"
glabel gspS2DEX2d_fifoDataEnd

glabel njpgdspMainTextStart
    .incbin "incbin/njpgdspMainText"
glabel njpgdspMainTextEnd

glabel njpgdspMainDataStart
    .incbin "incbin/njpgdspMainData"
glabel njpgdspMainDataEnd
