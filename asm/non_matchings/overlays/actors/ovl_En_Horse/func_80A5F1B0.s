glabel func_80A5F1B0
/* 03EC0 80A5F1B0 27BDFFD0 */  addiu   $sp, $sp, 0xFFD0           ## $sp = FFFFFFD0
/* 03EC4 80A5F1B4 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 03EC8 80A5F1B8 AFB00028 */  sw      $s0, 0x0028($sp)
/* 03ECC 80A5F1BC AFBF002C */  sw      $ra, 0x002C($sp)
/* 03ED0 80A5F1C0 AFA60038 */  sw      $a2, 0x0038($sp)
/* 03ED4 80A5F1C4 AFA7003C */  sw      $a3, 0x003C($sp)
/* 03ED8 80A5F1C8 240E0002 */  addiu   $t6, $zero, 0x0002         ## $t6 = 00000002
/* 03EDC 80A5F1CC 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 03EE0 80A5F1D0 AC8E014C */  sw      $t6, 0x014C($a0)           ## 0000014C
/* 03EE4 80A5F1D4 10A00007 */  beq     $a1, $zero, .L80A5F1F4
/* 03EE8 80A5F1D8 E4840068 */  swc1    $f4, 0x0068($a0)           ## 00000068
/* 03EEC 80A5F1DC 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 03EF0 80A5F1E0 10A10004 */  beq     $a1, $at, .L80A5F1F4
/* 03EF4 80A5F1E4 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
/* 03EF8 80A5F1E8 50A10003 */  beql    $a1, $at, .L80A5F1F8
/* 03EFC 80A5F1EC 8E0F0210 */  lw      $t7, 0x0210($s0)           ## 00000210
/* 03F00 80A5F1F0 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
.L80A5F1F4:
/* 03F04 80A5F1F4 8E0F0210 */  lw      $t7, 0x0210($s0)           ## 00000210
.L80A5F1F8:
/* 03F08 80A5F1F8 50AF005D */  beql    $a1, $t7, .L80A5F370
/* 03F0C 80A5F1FC 8FBF002C */  lw      $ra, 0x002C($sp)
/* 03F10 80A5F200 14A00007 */  bne     $a1, $zero, .L80A5F220
/* 03F14 80A5F204 AE050210 */  sw      $a1, 0x0210($s0)           ## 00000210
/* 03F18 80A5F208 8E1801F0 */  lw      $t8, 0x01F0($s0)           ## 000001F0
/* 03F1C 80A5F20C 2401EFFF */  addiu   $at, $zero, 0xEFFF         ## $at = FFFFEFFF
/* 03F20 80A5F210 00A01025 */  or      $v0, $a1, $zero            ## $v0 = 00000000
/* 03F24 80A5F214 0301C824 */  and     $t9, $t8, $at
/* 03F28 80A5F218 10000037 */  beq     $zero, $zero, .L80A5F2F8
/* 03F2C 80A5F21C AE1901F0 */  sw      $t9, 0x01F0($s0)           ## 000001F0
.L80A5F220:
/* 03F30 80A5F220 8E020210 */  lw      $v0, 0x0210($s0)           ## 00000210
/* 03F34 80A5F224 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 03F38 80A5F228 54410018 */  bnel    $v0, $at, .L80A5F28C
/* 03F3C 80A5F22C 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
/* 03F40 80A5F230 8E090228 */  lw      $t1, 0x0228($s0)           ## 00000228
/* 03F44 80A5F234 2605021C */  addiu   $a1, $s0, 0x021C           ## $a1 = 0000021C
/* 03F48 80A5F238 3C078013 */  lui     $a3, %hi(D_801333E0)
/* 03F4C 80A5F23C ACA90000 */  sw      $t1, 0x0000($a1)           ## 0000021C
/* 03F50 80A5F240 8E08022C */  lw      $t0, 0x022C($s0)           ## 0000022C
/* 03F54 80A5F244 3C0C8013 */  lui     $t4, %hi(D_801333E8)
/* 03F58 80A5F248 24E733E0 */  addiu   $a3, %lo(D_801333E0)
/* 03F5C 80A5F24C ACA80004 */  sw      $t0, 0x0004($a1)           ## 00000220
/* 03F60 80A5F250 8E090230 */  lw      $t1, 0x0230($s0)           ## 00000230
/* 03F64 80A5F254 258C33E8 */  addiu   $t4, %lo(D_801333E8)
/* 03F68 80A5F258 24042816 */  addiu   $a0, $zero, 0x2816         ## $a0 = 00002816
/* 03F6C 80A5F25C ACA90008 */  sw      $t1, 0x0008($a1)           ## 00000224
/* 03F70 80A5F260 8E0A01F0 */  lw      $t2, 0x01F0($s0)           ## 000001F0
/* 03F74 80A5F264 24060004 */  addiu   $a2, $zero, 0x0004         ## $a2 = 00000004
/* 03F78 80A5F268 000A5900 */  sll     $t3, $t2,  4
/* 03F7C 80A5F26C 05610004 */  bgez    $t3, .L80A5F280
/* 03F80 80A5F270 00000000 */  nop
/* 03F84 80A5F274 AFA70010 */  sw      $a3, 0x0010($sp)
/* 03F88 80A5F278 0C03DCE3 */  jal     Audio_PlaySoundGeneral

/* 03F8C 80A5F27C AFAC0014 */  sw      $t4, 0x0014($sp)
.L80A5F280:
/* 03F90 80A5F280 1000001D */  beq     $zero, $zero, .L80A5F2F8
/* 03F94 80A5F284 8E020210 */  lw      $v0, 0x0210($s0)           ## 00000210
/* 03F98 80A5F288 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
.L80A5F28C:
/* 03F9C 80A5F28C 5441001B */  bnel    $v0, $at, .L80A5F2FC
/* 03FA0 80A5F290 8E080158 */  lw      $t0, 0x0158($s0)           ## 00000158
/* 03FA4 80A5F294 8E0E0228 */  lw      $t6, 0x0228($s0)           ## 00000228
/* 03FA8 80A5F298 2605021C */  addiu   $a1, $s0, 0x021C           ## $a1 = 0000021C
/* 03FAC 80A5F29C 3C078013 */  lui     $a3, %hi(D_801333E0)
/* 03FB0 80A5F2A0 ACAE0000 */  sw      $t6, 0x0000($a1)           ## 0000021C
/* 03FB4 80A5F2A4 8E0D022C */  lw      $t5, 0x022C($s0)           ## 0000022C
/* 03FB8 80A5F2A8 3C188013 */  lui     $t8, %hi(D_801333E8)
/* 03FBC 80A5F2AC 24E733E0 */  addiu   $a3, %lo(D_801333E0)
/* 03FC0 80A5F2B0 ACAD0004 */  sw      $t5, 0x0004($a1)           ## 00000220
/* 03FC4 80A5F2B4 8E0E0230 */  lw      $t6, 0x0230($s0)           ## 00000230
/* 03FC8 80A5F2B8 271833E8 */  addiu   $t8, %lo(D_801333E8)
/* 03FCC 80A5F2BC 24042805 */  addiu   $a0, $zero, 0x2805         ## $a0 = 00002805
/* 03FD0 80A5F2C0 ACAE0008 */  sw      $t6, 0x0008($a1)           ## 00000224
/* 03FD4 80A5F2C4 8E0301F0 */  lw      $v1, 0x01F0($s0)           ## 000001F0
/* 03FD8 80A5F2C8 24060004 */  addiu   $a2, $zero, 0x0004         ## $a2 = 00000004
/* 03FDC 80A5F2CC 00037900 */  sll     $t7, $v1,  4
/* 03FE0 80A5F2D0 05E30006 */  bgezl   $t7, .L80A5F2EC
/* 03FE4 80A5F2D4 2401F7FF */  addiu   $at, $zero, 0xF7FF         ## $at = FFFFF7FF
/* 03FE8 80A5F2D8 AFA70010 */  sw      $a3, 0x0010($sp)
/* 03FEC 80A5F2DC 0C03DCE3 */  jal     Audio_PlaySoundGeneral

/* 03FF0 80A5F2E0 AFB80014 */  sw      $t8, 0x0014($sp)
/* 03FF4 80A5F2E4 8E0301F0 */  lw      $v1, 0x01F0($s0)           ## 000001F0
/* 03FF8 80A5F2E8 2401F7FF */  addiu   $at, $zero, 0xF7FF         ## $at = FFFFF7FF
.L80A5F2EC:
/* 03FFC 80A5F2EC 0061C824 */  and     $t9, $v1, $at
/* 04000 80A5F2F0 AE1901F0 */  sw      $t9, 0x01F0($s0)           ## 000001F0
/* 04004 80A5F2F4 8E020210 */  lw      $v0, 0x0210($s0)           ## 00000210
.L80A5F2F8:
/* 04008 80A5F2F8 8E080158 */  lw      $t0, 0x0158($s0)           ## 00000158
.L80A5F2FC:
/* 0400C 80A5F2FC 3C0A80A6 */  lui     $t2, %hi(D_80A65E58)       ## $t2 = 80A60000
/* 04010 80A5F300 00025880 */  sll     $t3, $v0,  2
/* 04014 80A5F304 00084880 */  sll     $t1, $t0,  2
/* 04018 80A5F308 01495021 */  addu    $t2, $t2, $t1
/* 0401C 80A5F30C 8D4A5E58 */  lw      $t2, %lo(D_80A65E58)($t2)
/* 04020 80A5F310 014B6021 */  addu    $t4, $t2, $t3
/* 04024 80A5F314 0C028800 */  jal     Animation_GetLastFrame

/* 04028 80A5F318 8D840000 */  lw      $a0, 0x0000($t4)           ## 00000000
/* 0402C 80A5F31C 8E0D0158 */  lw      $t5, 0x0158($s0)           ## 00000158
/* 04030 80A5F320 44823000 */  mtc1    $v0, $f6                   ## $f6 = 0.00
/* 04034 80A5F324 3C0F80A6 */  lui     $t7, %hi(D_80A65E58)       ## $t7 = 80A60000
/* 04038 80A5F328 000D7080 */  sll     $t6, $t5,  2
/* 0403C 80A5F32C 8E180210 */  lw      $t8, 0x0210($s0)           ## 00000210
/* 04040 80A5F330 01EE7821 */  addu    $t7, $t7, $t6
/* 04044 80A5F334 8DEF5E58 */  lw      $t7, %lo(D_80A65E58)($t7)
/* 04048 80A5F338 46803220 */  cvt.s.w $f8, $f6
/* 0404C 80A5F33C 0018C880 */  sll     $t9, $t8,  2
/* 04050 80A5F340 01F94021 */  addu    $t0, $t7, $t9
/* 04054 80A5F344 C7AA0038 */  lwc1    $f10, 0x0038($sp)
/* 04058 80A5F348 8D050000 */  lw      $a1, 0x0000($t0)           ## 00000000
/* 0405C 80A5F34C 24090002 */  addiu   $t1, $zero, 0x0002         ## $t1 = 00000002
/* 04060 80A5F350 AFA90014 */  sw      $t1, 0x0014($sp)
/* 04064 80A5F354 E7A80010 */  swc1    $f8, 0x0010($sp)
/* 04068 80A5F358 260401AC */  addiu   $a0, $s0, 0x01AC           ## $a0 = 000001AC
/* 0406C 80A5F35C 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 04070 80A5F360 8FA7003C */  lw      $a3, 0x003C($sp)
/* 04074 80A5F364 0C029468 */  jal     Animation_Change

/* 04078 80A5F368 E7AA0018 */  swc1    $f10, 0x0018($sp)
/* 0407C 80A5F36C 8FBF002C */  lw      $ra, 0x002C($sp)
.L80A5F370:
/* 04080 80A5F370 8FB00028 */  lw      $s0, 0x0028($sp)
/* 04084 80A5F374 27BD0030 */  addiu   $sp, $sp, 0x0030           ## $sp = 00000000
/* 04088 80A5F378 03E00008 */  jr      $ra
/* 0408C 80A5F37C 00000000 */  nop
