.rdata
glabel D_80B24414
    .asciz "../z_en_tr.c"
    .balign 4

glabel D_80B24424
    .asciz "../z_en_tr.c"
    .balign 4

.text
glabel EnTr_Draw
/* 011B4 80B23EA4 27BDFFA8 */  addiu   $sp, $sp, 0xFFA8           ## $sp = FFFFFFA8
/* 011B8 80B23EA8 AFBF002C */  sw      $ra, 0x002C($sp)
/* 011BC 80B23EAC AFB10028 */  sw      $s1, 0x0028($sp)
/* 011C0 80B23EB0 AFB00024 */  sw      $s0, 0x0024($sp)
/* 011C4 80B23EB4 90AE1D6C */  lbu     $t6, 0x1D6C($a1)           ## 00001D6C
/* 011C8 80B23EB8 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 011CC 80B23EBC 00A08825 */  or      $s1, $a1, $zero            ## $s1 = 00000000
/* 011D0 80B23EC0 11C0000B */  beq     $t6, $zero, .L80B23EF0
/* 011D4 80B23EC4 00000000 */  nop
/* 011D8 80B23EC8 848F02D8 */  lh      $t7, 0x02D8($a0)           ## 000002D8
/* 011DC 80B23ECC 3C098003 */  lui     $t1, %hi(ActorShadow_DrawFunc_Circle)
/* 011E0 80B23ED0 3C0680B2 */  lui     $a2, %hi(D_80B24414)       ## $a2 = 80B20000
/* 011E4 80B23ED4 000FC080 */  sll     $t8, $t7,  2
/* 011E8 80B23ED8 00B8C821 */  addu    $t9, $a1, $t8
/* 011EC 80B23EDC 8F281D8C */  lw      $t0, 0x1D8C($t9)           ## 00001D8C
/* 011F0 80B23EE0 2529B5EC */  addiu   $t1, %lo(ActorShadow_DrawFunc_Circle)
/* 011F4 80B23EE4 24C64414 */  addiu   $a2, $a2, %lo(D_80B24414)  ## $a2 = 80B24414
/* 011F8 80B23EE8 15000003 */  bne     $t0, $zero, .L80B23EF8
/* 011FC 80B23EEC 27A4003C */  addiu   $a0, $sp, 0x003C           ## $a0 = FFFFFFE4
.L80B23EF0:
/* 01200 80B23EF0 10000035 */  beq     $zero, $zero, .L80B23FC8
/* 01204 80B23EF4 AE0000C0 */  sw      $zero, 0x00C0($s0)         ## 000000C0
.L80B23EF8:
/* 01208 80B23EF8 AE0900C0 */  sw      $t1, 0x00C0($s0)           ## 000000C0
/* 0120C 80B23EFC 8E250000 */  lw      $a1, 0x0000($s1)           ## 00000000
/* 01210 80B23F00 24070348 */  addiu   $a3, $zero, 0x0348         ## $a3 = 00000348
/* 01214 80B23F04 0C031AB1 */  jal     Graph_OpenDisps
/* 01218 80B23F08 AFA5004C */  sw      $a1, 0x004C($sp)
/* 0121C 80B23F0C 0C0250F2 */  jal     func_800943C8
/* 01220 80B23F10 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 01224 80B23F14 8FA5004C */  lw      $a1, 0x004C($sp)
/* 01228 80B23F18 3C0BDB06 */  lui     $t3, 0xDB06                ## $t3 = DB060000
/* 0122C 80B23F1C 356B0020 */  ori     $t3, $t3, 0x0020           ## $t3 = DB060020
/* 01230 80B23F20 8CA302C0 */  lw      $v1, 0x02C0($a1)           ## 000002C0
/* 01234 80B23F24 3C0480B2 */  lui     $a0, %hi(D_80B243D0)       ## $a0 = 80B20000
/* 01238 80B23F28 3C088016 */  lui     $t0, %hi(gSegments)
/* 0123C 80B23F2C 246A0008 */  addiu   $t2, $v1, 0x0008           ## $t2 = 00000008
/* 01240 80B23F30 ACAA02C0 */  sw      $t2, 0x02C0($a1)           ## 000002C0
/* 01244 80B23F34 AC6B0000 */  sw      $t3, 0x0000($v1)           ## 00000000
/* 01248 80B23F38 860C02E0 */  lh      $t4, 0x02E0($s0)           ## 000002E0
/* 0124C 80B23F3C 3C0100FF */  lui     $at, 0x00FF                ## $at = 00FF0000
/* 01250 80B23F40 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = 00FFFFFF
/* 01254 80B23F44 000C6880 */  sll     $t5, $t4,  2
/* 01258 80B23F48 008D2021 */  addu    $a0, $a0, $t5
/* 0125C 80B23F4C 8C8443D0 */  lw      $a0, %lo(D_80B243D0)($a0)
/* 01260 80B23F50 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 01264 80B23F54 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 01268 80B23F58 00047900 */  sll     $t7, $a0,  4
/* 0126C 80B23F5C 000FC702 */  srl     $t8, $t7, 28
/* 01270 80B23F60 0018C880 */  sll     $t9, $t8,  2
/* 01274 80B23F64 01194021 */  addu    $t0, $t0, $t9
/* 01278 80B23F68 8D086FA8 */  lw      $t0, %lo(gSegments)($t0)
/* 0127C 80B23F6C 00817024 */  and     $t6, $a0, $at
/* 01280 80B23F70 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 01284 80B23F74 01C84821 */  addu    $t1, $t6, $t0
/* 01288 80B23F78 01215021 */  addu    $t2, $t1, $at
/* 0128C 80B23F7C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01290 80B23F80 0C00BAF3 */  jal     func_8002EBCC
/* 01294 80B23F84 AC6A0004 */  sw      $t2, 0x0004($v1)           ## 00000004
/* 01298 80B23F88 8E050150 */  lw      $a1, 0x0150($s0)           ## 00000150
/* 0129C 80B23F8C 8E06016C */  lw      $a2, 0x016C($s0)           ## 0000016C
/* 012A0 80B23F90 9207014E */  lbu     $a3, 0x014E($s0)           ## 0000014E
/* 012A4 80B23F94 3C0B80B2 */  lui     $t3, %hi(func_80B23D74)    ## $t3 = 80B20000
/* 012A8 80B23F98 256B3D74 */  addiu   $t3, $t3, %lo(func_80B23D74) ## $t3 = 80B23D74
/* 012AC 80B23F9C AFAB0010 */  sw      $t3, 0x0010($sp)
/* 012B0 80B23FA0 AFB00018 */  sw      $s0, 0x0018($sp)
/* 012B4 80B23FA4 AFA00014 */  sw      $zero, 0x0014($sp)
/* 012B8 80B23FA8 0C0286B2 */  jal     SkelAnime_DrawFlexOpa
/* 012BC 80B23FAC 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 012C0 80B23FB0 3C0680B2 */  lui     $a2, %hi(D_80B24424)       ## $a2 = 80B20000
/* 012C4 80B23FB4 24C64424 */  addiu   $a2, $a2, %lo(D_80B24424)  ## $a2 = 80B24424
/* 012C8 80B23FB8 27A4003C */  addiu   $a0, $sp, 0x003C           ## $a0 = FFFFFFE4
/* 012CC 80B23FBC 8E250000 */  lw      $a1, 0x0000($s1)           ## 00000000
/* 012D0 80B23FC0 0C031AD5 */  jal     Graph_CloseDisps
/* 012D4 80B23FC4 24070356 */  addiu   $a3, $zero, 0x0356         ## $a3 = 00000356
.L80B23FC8:
/* 012D8 80B23FC8 8FBF002C */  lw      $ra, 0x002C($sp)
/* 012DC 80B23FCC 8FB00024 */  lw      $s0, 0x0024($sp)
/* 012E0 80B23FD0 8FB10028 */  lw      $s1, 0x0028($sp)
/* 012E4 80B23FD4 03E00008 */  jr      $ra
/* 012E8 80B23FD8 27BD0058 */  addiu   $sp, $sp, 0x0058           ## $sp = 00000000
