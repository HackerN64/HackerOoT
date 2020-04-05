.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purposee registers

.section .data

# temporary file name, rename to something more appropriate when decompiled

glabel gLetterTLUT
    .incbin "baserom.z64", 0xBA18E0, 0x80

glabel gFontFF
    .incbin "baserom.z64", 0xBA1960, 0x430

