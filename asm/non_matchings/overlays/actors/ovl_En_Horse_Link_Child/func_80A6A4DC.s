glabel func_80A6A4DC
/* 0110C 80A6A4DC 27BDFFC8 */  addiu   $sp, $sp, 0xFFC8           ## $sp = FFFFFFC8
/* 01110 80A6A4E0 AFBF002C */  sw      $ra, 0x002C($sp)
/* 01114 80A6A4E4 AFB00028 */  sw      $s0, 0x0028($sp)
/* 01118 80A6A4E8 240E0005 */  addiu   $t6, $zero, 0x0005         ## $t6 = 00000005
/* 0111C 80A6A4EC 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 01120 80A6A4F0 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 01124 80A6A4F4 AC8E014C */  sw      $t6, 0x014C($a0)           ## 0000014C
/* 01128 80A6A4F8 3C013F00 */  lui     $at, 0x3F00                ## $at = 3F000000
/* 0112C 80A6A4FC 44812000 */  mtc1    $at, $f4                   ## $f4 = 0.50
/* 01130 80A6A500 240F0001 */  addiu   $t7, $zero, 0x0001         ## $t7 = 00000001
/* 01134 80A6A504 3C188016 */  lui     $t8, %hi(gGameInfo)
/* 01138 80A6A508 4600203C */  c.lt.s  $f4, $f0
/* 0113C 80A6A50C 00000000 */  nop
/* 01140 80A6A510 45020004 */  bc1fl   .L80A6A524
/* 01144 80A6A514 AE0F0150 */  sw      $t7, 0x0150($s0)           ## 00000150
/* 01148 80A6A518 10000002 */  beq     $zero, $zero, .L80A6A524
/* 0114C 80A6A51C AE000150 */  sw      $zero, 0x0150($s0)         ## 00000150
/* 01150 80A6A520 AE0F0150 */  sw      $t7, 0x0150($s0)           ## 00000150
.L80A6A524:
/* 01154 80A6A524 8F18FA90 */  lw      $t8, %lo(gGameInfo)($t8)
/* 01158 80A6A528 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0115C 80A6A52C 0C29A569 */  jal     func_80A695A4
/* 01160 80A6A530 A70005BE */  sh      $zero, 0x05BE($t8)         ## 801605BE
/* 01164 80A6A534 E7A00030 */  swc1    $f0, 0x0030($sp)
/* 01168 80A6A538 8E190150 */  lw      $t9, 0x0150($s0)           ## 00000150
/* 0116C 80A6A53C 3C0480A7 */  lui     $a0, %hi(D_80A6AEE0)       ## $a0 = 80A70000
/* 01170 80A6A540 00194080 */  sll     $t0, $t9,  2
/* 01174 80A6A544 00882021 */  addu    $a0, $a0, $t0
/* 01178 80A6A548 0C028800 */  jal     SkelAnime_GetFrameCount

/* 0117C 80A6A54C 8C84AEE0 */  lw      $a0, %lo(D_80A6AEE0)($a0)
/* 01180 80A6A550 44823000 */  mtc1    $v0, $f6                   ## $f6 = 0.00
/* 01184 80A6A554 8E090150 */  lw      $t1, 0x0150($s0)           ## 00000150
/* 01188 80A6A558 44800000 */  mtc1    $zero, $f0                 ## $f0 = 0.00
/* 0118C 80A6A55C 46803220 */  cvt.s.w $f8, $f6
/* 01190 80A6A560 3C0580A7 */  lui     $a1, %hi(D_80A6AEE0)       ## $a1 = 80A70000
/* 01194 80A6A564 00095080 */  sll     $t2, $t1,  2
/* 01198 80A6A568 00AA2821 */  addu    $a1, $a1, $t2
/* 0119C 80A6A56C 240B0002 */  addiu   $t3, $zero, 0x0002         ## $t3 = 00000002
/* 011A0 80A6A570 44070000 */  mfc1    $a3, $f0
/* 011A4 80A6A574 AFAB0014 */  sw      $t3, 0x0014($sp)
/* 011A8 80A6A578 8CA5AEE0 */  lw      $a1, %lo(D_80A6AEE0)($a1)
/* 011AC 80A6A57C E7A80010 */  swc1    $f8, 0x0010($sp)
/* 011B0 80A6A580 260401A0 */  addiu   $a0, $s0, 0x01A0           ## $a0 = 000001A0
/* 011B4 80A6A584 8FA60030 */  lw      $a2, 0x0030($sp)
/* 011B8 80A6A588 0C029468 */  jal     SkelAnime_ChangeAnim

/* 011BC 80A6A58C E7A00018 */  swc1    $f0, 0x0018($sp)
/* 011C0 80A6A590 8FBF002C */  lw      $ra, 0x002C($sp)
/* 011C4 80A6A594 8FB00028 */  lw      $s0, 0x0028($sp)
/* 011C8 80A6A598 27BD0038 */  addiu   $sp, $sp, 0x0038           ## $sp = 00000000
/* 011CC 80A6A59C 03E00008 */  jr      $ra
/* 011D0 80A6A5A0 00000000 */  nop
