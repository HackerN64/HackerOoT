.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .rodata

.balign 16

glabel rspbootTextStart
    .incbin "baseroms/gc-eu-mq-dbg/baserom-decompressed.z64", 0x9F20, 0xD0
glabel rspbootTextEnd

glabel aspMainTextStart
    .incbin "baseroms/gc-eu-mq-dbg/baserom-decompressed.z64", 0xB89260, 0xFB0
glabel aspMainTextEnd

glabel aspMainDataStart
    .incbin "baseroms/gc-eu-mq-dbg/baserom-decompressed.z64", 0xBCCE10, 0x2E0
glabel aspMainDataEnd

glabel gspS2DEX2d_fifoTextStart
    .incbin "baseroms/gc-eu-mq-dbg/baserom-decompressed.z64", 0xB8A210, 0x18C0
glabel gspS2DEX2d_fifoTextEnd

glabel gspS2DEX2d_fifoDataStart
    .incbin "baseroms/gc-eu-mq-dbg/baserom-decompressed.z64", 0xBCEB40, 0x390
glabel gspS2DEX2d_fifoDataEnd

glabel njpgdspMainTextStart
    .incbin "baseroms/gc-eu-mq-dbg/baserom-decompressed.z64", 0xB8BAD0, 0xAF0
glabel njpgdspMainTextEnd

glabel njpgdspMainDataStart
    .incbin "baseroms/gc-eu-mq-dbg/baserom-decompressed.z64", 0xBCEED0, 0x60
glabel njpgdspMainDataEnd
