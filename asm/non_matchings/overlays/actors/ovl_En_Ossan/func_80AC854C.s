.rdata
glabel D_80AC949C
    .asciz "../z_en_oB1.c"
    .balign 4

glabel D_80AC94AC
    .asciz "../z_en_oB1.c"
    .balign 4

.text
glabel func_80AC854C
/* 058AC 80AC854C 27BDFFA8 */  addiu   $sp, $sp, 0xFFA8           ## $sp = FFFFFFA8
/* 058B0 80AC8550 AFB10028 */  sw      $s1, 0x0028($sp)
/* 058B4 80AC8554 00A08825 */  or      $s1, $a1, $zero            ## $s1 = 00000000
/* 058B8 80AC8558 AFBF002C */  sw      $ra, 0x002C($sp)
/* 058BC 80AC855C AFB00024 */  sw      $s0, 0x0024($sp)
/* 058C0 80AC8560 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 058C4 80AC8564 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 058C8 80AC8568 3C0680AD */  lui     $a2, %hi(D_80AC949C)       ## $a2 = 80AD0000
/* 058CC 80AC856C 24C6949C */  addiu   $a2, $a2, %lo(D_80AC949C)  ## $a2 = 80AC949C
/* 058D0 80AC8570 27A4003C */  addiu   $a0, $sp, 0x003C           ## $a0 = FFFFFFE4
/* 058D4 80AC8574 240711C0 */  addiu   $a3, $zero, 0x11C0         ## $a3 = 000011C0
/* 058D8 80AC8578 0C031AB1 */  jal     Graph_OpenDisps
/* 058DC 80AC857C AFA5004C */  sw      $a1, 0x004C($sp)
/* 058E0 80AC8580 0C024F46 */  jal     func_80093D18
/* 058E4 80AC8584 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 058E8 80AC8588 8FA5004C */  lw      $a1, 0x004C($sp)
/* 058EC 80AC858C 3C0FDB06 */  lui     $t7, 0xDB06                ## $t7 = DB060000
/* 058F0 80AC8590 35EF0020 */  ori     $t7, $t7, 0x0020           ## $t7 = DB060020
/* 058F4 80AC8594 8CA302C0 */  lw      $v1, 0x02C0($a1)           ## 000002C0
/* 058F8 80AC8598 3C0480AD */  lui     $a0, %hi(D_80AC8ED0)       ## $a0 = 80AD0000
/* 058FC 80AC859C 3C0C8016 */  lui     $t4, %hi(gSegments)
/* 05900 80AC85A0 246E0008 */  addiu   $t6, $v1, 0x0008           ## $t6 = 00000008
/* 05904 80AC85A4 ACAE02C0 */  sw      $t6, 0x02C0($a1)           ## 000002C0
/* 05908 80AC85A8 AC6F0000 */  sw      $t7, 0x0000($v1)           ## 00000000
/* 0590C 80AC85AC 861801F2 */  lh      $t8, 0x01F2($s0)           ## 000001F2
/* 05910 80AC85B0 3C0100FF */  lui     $at, 0x00FF                ## $at = 00FF0000
/* 05914 80AC85B4 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = 00FFFFFF
/* 05918 80AC85B8 0018C880 */  sll     $t9, $t8,  2
/* 0591C 80AC85BC 00992021 */  addu    $a0, $a0, $t9
/* 05920 80AC85C0 8C848ED0 */  lw      $a0, %lo(D_80AC8ED0)($a0)
/* 05924 80AC85C4 00044900 */  sll     $t1, $a0,  4
/* 05928 80AC85C8 00095702 */  srl     $t2, $t1, 28
/* 0592C 80AC85CC 000A5880 */  sll     $t3, $t2,  2
/* 05930 80AC85D0 018B6021 */  addu    $t4, $t4, $t3
/* 05934 80AC85D4 8D8C6FA8 */  lw      $t4, %lo(gSegments)($t4)
/* 05938 80AC85D8 00814024 */  and     $t0, $a0, $at
/* 0593C 80AC85DC 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 05940 80AC85E0 010C6821 */  addu    $t5, $t0, $t4
/* 05944 80AC85E4 01A17021 */  addu    $t6, $t5, $at
/* 05948 80AC85E8 AC6E0004 */  sw      $t6, 0x0004($v1)           ## 00000004
/* 0594C 80AC85EC 9207014E */  lbu     $a3, 0x014E($s0)           ## 0000014E
/* 05950 80AC85F0 8E06016C */  lw      $a2, 0x016C($s0)           ## 0000016C
/* 05954 80AC85F4 8E050150 */  lw      $a1, 0x0150($s0)           ## 00000150
/* 05958 80AC85F8 AFB00018 */  sw      $s0, 0x0018($sp)
/* 0595C 80AC85FC AFA00014 */  sw      $zero, 0x0014($sp)
/* 05960 80AC8600 AFA00010 */  sw      $zero, 0x0010($sp)
/* 05964 80AC8604 0C0286B2 */  jal     SkelAnime_DrawFlexOpa
/* 05968 80AC8608 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 0596C 80AC860C C6040238 */  lwc1    $f4, 0x0238($s0)           ## 00000238
/* 05970 80AC8610 8E060230 */  lw      $a2, 0x0230($s0)           ## 00000230
/* 05974 80AC8614 8E070234 */  lw      $a3, 0x0234($s0)           ## 00000234
/* 05978 80AC8618 E7A40010 */  swc1    $f4, 0x0010($sp)
/* 0597C 80AC861C 920F0251 */  lbu     $t7, 0x0251($s0)           ## 00000251
/* 05980 80AC8620 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 05984 80AC8624 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 05988 80AC8628 0C2B1D4A */  jal     func_80AC7528
/* 0598C 80AC862C AFAF0014 */  sw      $t7, 0x0014($sp)
/* 05990 80AC8630 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 05994 80AC8634 0C2B1E72 */  jal     func_80AC79C8
/* 05998 80AC8638 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 0599C 80AC863C 3C0680AD */  lui     $a2, %hi(D_80AC94AC)       ## $a2 = 80AD0000
/* 059A0 80AC8640 24C694AC */  addiu   $a2, $a2, %lo(D_80AC94AC)  ## $a2 = 80AC94AC
/* 059A4 80AC8644 27A4003C */  addiu   $a0, $sp, 0x003C           ## $a0 = FFFFFFE4
/* 059A8 80AC8648 8E250000 */  lw      $a1, 0x0000($s1)           ## 00000000
/* 059AC 80AC864C 0C031AD5 */  jal     Graph_CloseDisps
/* 059B0 80AC8650 240711D4 */  addiu   $a3, $zero, 0x11D4         ## $a3 = 000011D4
/* 059B4 80AC8654 8FBF002C */  lw      $ra, 0x002C($sp)
/* 059B8 80AC8658 8FB00024 */  lw      $s0, 0x0024($sp)
/* 059BC 80AC865C 8FB10028 */  lw      $s1, 0x0028($sp)
/* 059C0 80AC8660 03E00008 */  jr      $ra
/* 059C4 80AC8664 27BD0058 */  addiu   $sp, $sp, 0x0058           ## $sp = 00000000
