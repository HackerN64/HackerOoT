.rdata
glabel D_80A35200
    .asciz "../z_en_ge3.c"
    .balign 4

glabel D_80A35210
    .asciz "../z_en_ge3.c"
    .balign 4

.text
glabel EnGe3_Draw
/* 00A40 80A35060 27BDFFA8 */  addiu   $sp, $sp, 0xFFA8           ## $sp = FFFFFFA8
/* 00A44 80A35064 AFB10028 */  sw      $s1, 0x0028($sp)
/* 00A48 80A35068 00A08825 */  or      $s1, $a1, $zero            ## $s1 = 00000000
/* 00A4C 80A3506C AFBF002C */  sw      $ra, 0x002C($sp)
/* 00A50 80A35070 AFB00024 */  sw      $s0, 0x0024($sp)
/* 00A54 80A35074 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 00A58 80A35078 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00A5C 80A3507C 3C0680A3 */  lui     $a2, %hi(D_80A35200)       ## $a2 = 80A30000
/* 00A60 80A35080 24C65200 */  addiu   $a2, $a2, %lo(D_80A35200)  ## $a2 = 80A35200
/* 00A64 80A35084 27A4003C */  addiu   $a0, $sp, 0x003C           ## $a0 = FFFFFFE4
/* 00A68 80A35088 24070266 */  addiu   $a3, $zero, 0x0266         ## $a3 = 00000266
/* 00A6C 80A3508C 0C031AB1 */  jal     Graph_OpenDisps
/* 00A70 80A35090 AFA5004C */  sw      $a1, 0x004C($sp)
/* 00A74 80A35094 0C0250F2 */  jal     func_800943C8
/* 00A78 80A35098 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 00A7C 80A3509C 8FA5004C */  lw      $a1, 0x004C($sp)
/* 00A80 80A350A0 3C0FDB06 */  lui     $t7, 0xDB06                ## $t7 = DB060000
/* 00A84 80A350A4 35EF0020 */  ori     $t7, $t7, 0x0020           ## $t7 = DB060020
/* 00A88 80A350A8 8CA302C0 */  lw      $v1, 0x02C0($a1)           ## 000002C0
/* 00A8C 80A350AC 3C0480A3 */  lui     $a0, %hi(D_80A351D4)       ## $a0 = 80A30000
/* 00A90 80A350B0 3C0C8016 */  lui     $t4, %hi(gSegments)
/* 00A94 80A350B4 246E0008 */  addiu   $t6, $v1, 0x0008           ## $t6 = 00000008
/* 00A98 80A350B8 ACAE02C0 */  sw      $t6, 0x02C0($a1)           ## 000002C0
/* 00A9C 80A350BC AC6F0000 */  sw      $t7, 0x0000($v1)           ## 00000000
/* 00AA0 80A350C0 861802FC */  lh      $t8, 0x02FC($s0)           ## 000002FC
/* 00AA4 80A350C4 3C0100FF */  lui     $at, 0x00FF                ## $at = 00FF0000
/* 00AA8 80A350C8 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = 00FFFFFF
/* 00AAC 80A350CC 0018C880 */  sll     $t9, $t8,  2
/* 00AB0 80A350D0 00992021 */  addu    $a0, $a0, $t9
/* 00AB4 80A350D4 8C8451D4 */  lw      $a0, %lo(D_80A351D4)($a0)
/* 00AB8 80A350D8 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 00ABC 80A350DC 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 00AC0 80A350E0 00044900 */  sll     $t1, $a0,  4
/* 00AC4 80A350E4 00095702 */  srl     $t2, $t1, 28
/* 00AC8 80A350E8 000A5880 */  sll     $t3, $t2,  2
/* 00ACC 80A350EC 018B6021 */  addu    $t4, $t4, $t3
/* 00AD0 80A350F0 8D8C6FA8 */  lw      $t4, %lo(gSegments)($t4)
/* 00AD4 80A350F4 00814024 */  and     $t0, $a0, $at
/* 00AD8 80A350F8 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 00ADC 80A350FC 010C6821 */  addu    $t5, $t0, $t4
/* 00AE0 80A35100 01A17021 */  addu    $t6, $t5, $at
/* 00AE4 80A35104 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00AE8 80A35108 0C00BAF3 */  jal     func_8002EBCC
/* 00AEC 80A3510C AC6E0004 */  sw      $t6, 0x0004($v1)           ## 00000004
/* 00AF0 80A35110 8E05019C */  lw      $a1, 0x019C($s0)           ## 0000019C
/* 00AF4 80A35114 8E0601B8 */  lw      $a2, 0x01B8($s0)           ## 000001B8
/* 00AF8 80A35118 9207019A */  lbu     $a3, 0x019A($s0)           ## 0000019A
/* 00AFC 80A3511C 3C0F80A3 */  lui     $t7, %hi(func_80A34E58)    ## $t7 = 80A30000
/* 00B00 80A35120 3C1880A3 */  lui     $t8, %hi(func_80A35004)    ## $t8 = 80A30000
/* 00B04 80A35124 27185004 */  addiu   $t8, $t8, %lo(func_80A35004) ## $t8 = 80A35004
/* 00B08 80A35128 25EF4E58 */  addiu   $t7, $t7, %lo(func_80A34E58) ## $t7 = 80A34E58
/* 00B0C 80A3512C AFAF0010 */  sw      $t7, 0x0010($sp)
/* 00B10 80A35130 AFB80014 */  sw      $t8, 0x0014($sp)
/* 00B14 80A35134 AFB00018 */  sw      $s0, 0x0018($sp)
/* 00B18 80A35138 0C0286B2 */  jal     SkelAnime_DrawFlexOpa
/* 00B1C 80A3513C 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00B20 80A35140 3C0680A3 */  lui     $a2, %hi(D_80A35210)       ## $a2 = 80A30000
/* 00B24 80A35144 24C65210 */  addiu   $a2, $a2, %lo(D_80A35210)  ## $a2 = 80A35210
/* 00B28 80A35148 27A4003C */  addiu   $a0, $sp, 0x003C           ## $a0 = FFFFFFE4
/* 00B2C 80A3514C 8E250000 */  lw      $a1, 0x0000($s1)           ## 00000000
/* 00B30 80A35150 0C031AD5 */  jal     Graph_CloseDisps
/* 00B34 80A35154 24070277 */  addiu   $a3, $zero, 0x0277         ## $a3 = 00000277
/* 00B38 80A35158 8FBF002C */  lw      $ra, 0x002C($sp)
/* 00B3C 80A3515C 8FB00024 */  lw      $s0, 0x0024($sp)
/* 00B40 80A35160 8FB10028 */  lw      $s1, 0x0028($sp)
/* 00B44 80A35164 03E00008 */  jr      $ra
/* 00B48 80A35168 27BD0058 */  addiu   $sp, $sp, 0x0058           ## $sp = 00000000
/* 00B4C 80A3516C 00000000 */  nop
