.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .rodata

.balign 16

glabel gspF3DZEX2_NoN_PosLight_fifoTextStart
    .incbin "baseroms/gc-eu-mq-dbg/baserom-decompressed.z64", 0xBCD0F0, 0x1630
glabel gspF3DZEX2_NoN_PosLight_fifoTextEnd

glabel gspF3DZEX2_NoN_PosLight_fifoDataStart
    .incbin "baseroms/gc-eu-mq-dbg/baserom-decompressed.z64", 0xBCE720, 0x420
glabel gspF3DZEX2_NoN_PosLight_fifoDataEnd
