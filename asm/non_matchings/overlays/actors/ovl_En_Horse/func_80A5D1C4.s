glabel func_80A5D1C4
/* 01ED4 80A5D1C4 27BDFFC8 */  addiu   $sp, $sp, 0xFFC8           ## $sp = FFFFFFC8
/* 01ED8 80A5D1C8 AFBF002C */  sw      $ra, 0x002C($sp)
/* 01EDC 80A5D1CC AFB00028 */  sw      $s0, 0x0028($sp)
/* 01EE0 80A5D1D0 C48401C4 */  lwc1    $f4, 0x01C4($a0)           ## 000001C4
/* 01EE4 80A5D1D4 240E0006 */  addiu   $t6, $zero, 0x0006         ## $t6 = 00000006
/* 01EE8 80A5D1D8 240F0001 */  addiu   $t7, $zero, 0x0001         ## $t7 = 00000001
/* 01EEC 80A5D1DC AC8E014C */  sw      $t6, 0x014C($a0)           ## 0000014C
/* 01EF0 80A5D1E0 AC8F0210 */  sw      $t7, 0x0210($a0)           ## 00000210
/* 01EF4 80A5D1E4 E7A40034 */  swc1    $f4, 0x0034($sp)
/* 01EF8 80A5D1E8 8C980158 */  lw      $t8, 0x0158($a0)           ## 00000158
/* 01EFC 80A5D1EC 3C0880A6 */  lui     $t0, %hi(D_80A65E58)       ## $t0 = 80A60000
/* 01F00 80A5D1F0 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 01F04 80A5D1F4 0018C880 */  sll     $t9, $t8,  2
/* 01F08 80A5D1F8 01194021 */  addu    $t0, $t0, $t9
/* 01F0C 80A5D1FC 8D085E58 */  lw      $t0, %lo(D_80A65E58)($t0)
/* 01F10 80A5D200 0C028800 */  jal     Animation_GetLastFrame

/* 01F14 80A5D204 8D040004 */  lw      $a0, 0x0004($t0)           ## 80A60004
/* 01F18 80A5D208 8E090158 */  lw      $t1, 0x0158($s0)           ## 00000158
/* 01F1C 80A5D20C 44823000 */  mtc1    $v0, $f6                   ## $f6 = 0.00
/* 01F20 80A5D210 3C0B80A6 */  lui     $t3, %hi(D_80A65E58)       ## $t3 = 80A60000
/* 01F24 80A5D214 00095080 */  sll     $t2, $t1,  2
/* 01F28 80A5D218 8E0C0210 */  lw      $t4, 0x0210($s0)           ## 00000210
/* 01F2C 80A5D21C 016A5821 */  addu    $t3, $t3, $t2
/* 01F30 80A5D220 8D6B5E58 */  lw      $t3, %lo(D_80A65E58)($t3)
/* 01F34 80A5D224 46803220 */  cvt.s.w $f8, $f6
/* 01F38 80A5D228 000C6880 */  sll     $t5, $t4,  2
/* 01F3C 80A5D22C 3C01C040 */  lui     $at, 0xC040                ## $at = C0400000
/* 01F40 80A5D230 016D7021 */  addu    $t6, $t3, $t5
/* 01F44 80A5D234 44815000 */  mtc1    $at, $f10                  ## $f10 = -3.00
/* 01F48 80A5D238 8DC50000 */  lw      $a1, 0x0000($t6)           ## 00000000
/* 01F4C 80A5D23C 240F0002 */  addiu   $t7, $zero, 0x0002         ## $t7 = 00000002
/* 01F50 80A5D240 AFAF0014 */  sw      $t7, 0x0014($sp)
/* 01F54 80A5D244 E7A80010 */  swc1    $f8, 0x0010($sp)
/* 01F58 80A5D248 260401AC */  addiu   $a0, $s0, 0x01AC           ## $a0 = 000001AC
/* 01F5C 80A5D24C 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 01F60 80A5D250 8FA70034 */  lw      $a3, 0x0034($sp)
/* 01F64 80A5D254 0C029468 */  jal     Animation_Change

/* 01F68 80A5D258 E7AA0018 */  swc1    $f10, 0x0018($sp)
/* 01F6C 80A5D25C 8E190228 */  lw      $t9, 0x0228($s0)           ## 00000228
/* 01F70 80A5D260 2605021C */  addiu   $a1, $s0, 0x021C           ## $a1 = 0000021C
/* 01F74 80A5D264 3C078013 */  lui     $a3, %hi(D_801333E0)
/* 01F78 80A5D268 ACB90000 */  sw      $t9, 0x0000($a1)           ## 0000021C
/* 01F7C 80A5D26C 8E18022C */  lw      $t8, 0x022C($s0)           ## 0000022C
/* 01F80 80A5D270 3C0A8013 */  lui     $t2, %hi(D_801333E8)
/* 01F84 80A5D274 24E733E0 */  addiu   $a3, %lo(D_801333E0)
/* 01F88 80A5D278 ACB80004 */  sw      $t8, 0x0004($a1)           ## 00000220
/* 01F8C 80A5D27C 8E190230 */  lw      $t9, 0x0230($s0)           ## 00000230
/* 01F90 80A5D280 254A33E8 */  addiu   $t2, %lo(D_801333E8)
/* 01F94 80A5D284 24042816 */  addiu   $a0, $zero, 0x2816         ## $a0 = 00002816
/* 01F98 80A5D288 ACB90008 */  sw      $t9, 0x0008($a1)           ## 00000224
/* 01F9C 80A5D28C 8E0801F0 */  lw      $t0, 0x01F0($s0)           ## 000001F0
/* 01FA0 80A5D290 24060004 */  addiu   $a2, $zero, 0x0004         ## $a2 = 00000004
/* 01FA4 80A5D294 00084900 */  sll     $t1, $t0,  4
/* 01FA8 80A5D298 05230005 */  bgezl   $t1, .L80A5D2B0
/* 01FAC 80A5D29C 8FBF002C */  lw      $ra, 0x002C($sp)
/* 01FB0 80A5D2A0 AFA70010 */  sw      $a3, 0x0010($sp)
/* 01FB4 80A5D2A4 0C03DCE3 */  jal     Audio_PlaySoundGeneral

/* 01FB8 80A5D2A8 AFAA0014 */  sw      $t2, 0x0014($sp)
/* 01FBC 80A5D2AC 8FBF002C */  lw      $ra, 0x002C($sp)
.L80A5D2B0:
/* 01FC0 80A5D2B0 8FB00028 */  lw      $s0, 0x0028($sp)
/* 01FC4 80A5D2B4 27BD0038 */  addiu   $sp, $sp, 0x0038           ## $sp = 00000000
/* 01FC8 80A5D2B8 03E00008 */  jr      $ra
/* 01FCC 80A5D2BC 00000000 */  nop
