.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .rodata

.balign 16

glabel aspMainDataStart
    .incbin "baseroms/gc-eu-mq-dbg/baserom-decompressed.z64", 0xBCCE10, 0x2E0
glabel aspMainDataEnd

glabel gspF3DZEX2_NoN_PosLight_fifoTextStart
    .incbin "F3DEX3/F3DEX3_BrW.code"
glabel gspF3DZEX2_NoN_PosLight_fifoTextEnd
.balign 16

glabel gspF3DZEX2_NoN_PosLight_fifoDataStart
    .incbin "F3DEX3/F3DEX3_BrW.data"
glabel gspF3DZEX2_NoN_PosLight_fifoDataEnd
.balign 16

glabel gF3DEX3_BrW_TextStart
    .incbin "F3DEX3/F3DEX3_BrW.code"
glabel gF3DEX3_BrW_TextEnd
.balign 16

glabel gF3DEX3_BrW_PA_TextStart
    .incbin "F3DEX3/Profiling/F3DEX3_BrW_PA.code"
glabel gF3DEX3_BrW_PA_TextEnd
.balign 16

glabel gF3DEX3_BrW_PB_TextStart
    .incbin "F3DEX3/Profiling/F3DEX3_BrW_PB.code"
glabel gF3DEX3_BrW_PB_TextEnd
.balign 16

glabel gF3DEX3_BrW_PC_TextStart
    .incbin "F3DEX3/Profiling/F3DEX3_BrW_PC.code"
glabel gF3DEX3_BrW_PC_TextEnd
.balign 16

glabel gF3DEX3_BrW_DataStart
    .incbin "F3DEX3/F3DEX3_BrW.data"
glabel gF3DEX3_BrW_DataEnd
.balign 16

glabel gF3DEX3_BrW_PA_DataStart
    .incbin "F3DEX3/Profiling/F3DEX3_BrW_PA.data"
glabel gF3DEX3_BrW_PA_DataEnd
.balign 16

glabel gF3DEX3_BrW_PB_DataStart
    .incbin "F3DEX3/Profiling/F3DEX3_BrW_PB.data"
glabel gF3DEX3_BrW_PB_DataEnd
.balign 16

glabel gF3DEX3_BrW_PC_DataStart
    .incbin "F3DEX3/Profiling/F3DEX3_BrW_PC.data"
glabel gF3DEX3_BrW_PC_DataEnd
.balign 16

glabel gspS2DEX2d_fifoDataStart
    .incbin "baseroms/gc-eu-mq-dbg/baserom-decompressed.z64", 0xBCEB40, 0x390
glabel gspS2DEX2d_fifoDataEnd

glabel njpgdspMainDataStart
    .incbin "baseroms/gc-eu-mq-dbg/baserom-decompressed.z64", 0xBCEED0, 0x60
glabel njpgdspMainDataEnd
