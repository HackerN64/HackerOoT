glabel func_809F39B8
/* 006F8 809F39B8 27BDFFB8 */  addiu   $sp, $sp, 0xFFB8           ## $sp = FFFFFFB8
/* 006FC 809F39BC AFBF0034 */  sw      $ra, 0x0034($sp)
/* 00700 809F39C0 AFB00030 */  sw      $s0, 0x0030($sp)
/* 00704 809F39C4 AFA5004C */  sw      $a1, 0x004C($sp)
/* 00708 809F39C8 848E025C */  lh      $t6, 0x025C($a0)           ## 0000025C
/* 0070C 809F39CC 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00710 809F39D0 3C040600 */  lui     $a0, %hi(D_060026C4)                ## $a0 = 06000000
/* 00714 809F39D4 55C0003B */  bnel    $t6, $zero, .L809F3AC4
/* 00718 809F39D8 8FBF0034 */  lw      $ra, 0x0034($sp)
/* 0071C 809F39DC 0C028800 */  jal     SkelAnime_GetFrameCount

/* 00720 809F39E0 248426C4 */  addiu   $a0, $a0, %lo(D_060026C4)           ## $a0 = 060026C4
/* 00724 809F39E4 44822000 */  mtc1    $v0, $f4                   ## $f4 = 0.00
/* 00728 809F39E8 3C01C120 */  lui     $at, 0xC120                ## $at = C1200000
/* 0072C 809F39EC 44819000 */  mtc1    $at, $f18                  ## $f18 = -10.00
/* 00730 809F39F0 468021A0 */  cvt.s.w $f6, $f4
/* 00734 809F39F4 3C050600 */  lui     $a1, %hi(D_060026C4)                ## $a1 = 06000000
/* 00738 809F39F8 24080002 */  addiu   $t0, $zero, 0x0002         ## $t0 = 00000002
/* 0073C 809F39FC 24A526C4 */  addiu   $a1, $a1, %lo(D_060026C4)           ## $a1 = 060026C4
/* 00740 809F3A00 2604014C */  addiu   $a0, $s0, 0x014C           ## $a0 = 0000014C
/* 00744 809F3A04 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 00748 809F3A08 4600320D */  trunc.w.s $f8, $f6
/* 0074C 809F3A0C 24070000 */  addiu   $a3, $zero, 0x0000         ## $a3 = 00000000
/* 00750 809F3A10 44184000 */  mfc1    $t8, $f8
/* 00754 809F3A14 00000000 */  nop
/* 00758 809F3A18 A618026E */  sh      $t8, 0x026E($s0)           ## 0000026E
/* 0075C 809F3A1C 8619026E */  lh      $t9, 0x026E($s0)           ## 0000026E
/* 00760 809F3A20 AFA80014 */  sw      $t0, 0x0014($sp)
/* 00764 809F3A24 E7B20018 */  swc1    $f18, 0x0018($sp)
/* 00768 809F3A28 44995000 */  mtc1    $t9, $f10                  ## $f10 = 0.00
/* 0076C 809F3A2C 00000000 */  nop
/* 00770 809F3A30 46805420 */  cvt.s.w $f16, $f10
/* 00774 809F3A34 0C029468 */  jal     SkelAnime_ChangeAnim

/* 00778 809F3A38 E7B00010 */  swc1    $f16, 0x0010($sp)
/* 0077C 809F3A3C 8E0A0024 */  lw      $t2, 0x0024($s0)           ## 00000024
/* 00780 809F3A40 27A5003C */  addiu   $a1, $sp, 0x003C           ## $a1 = FFFFFFF4
/* 00784 809F3A44 3C014248 */  lui     $at, 0x4248                ## $at = 42480000
/* 00788 809F3A48 ACAA0000 */  sw      $t2, 0x0000($a1)           ## FFFFFFF4
/* 0078C 809F3A4C 8E090028 */  lw      $t1, 0x0028($s0)           ## 00000028
/* 00790 809F3A50 44813000 */  mtc1    $at, $f6                   ## $f6 = 50.00
/* 00794 809F3A54 240B000A */  addiu   $t3, $zero, 0x000A         ## $t3 = 0000000A
/* 00798 809F3A58 ACA90004 */  sw      $t1, 0x0004($a1)           ## FFFFFFF8
/* 0079C 809F3A5C 8E0A002C */  lw      $t2, 0x002C($s0)           ## 0000002C
/* 007A0 809F3A60 240C0003 */  addiu   $t4, $zero, 0x0003         ## $t4 = 00000003
/* 007A4 809F3A64 240D000F */  addiu   $t5, $zero, 0x000F         ## $t5 = 0000000F
/* 007A8 809F3A68 ACAA0008 */  sw      $t2, 0x0008($a1)           ## FFFFFFFC
/* 007AC 809F3A6C C6040028 */  lwc1    $f4, 0x0028($s0)           ## 00000028
/* 007B0 809F3A70 240EFFFF */  addiu   $t6, $zero, 0xFFFF         ## $t6 = FFFFFFFF
/* 007B4 809F3A74 240F000A */  addiu   $t7, $zero, 0x000A         ## $t7 = 0000000A
/* 007B8 809F3A78 46062200 */  add.s   $f8, $f4, $f6
/* 007BC 809F3A7C AFAF0020 */  sw      $t7, 0x0020($sp)
/* 007C0 809F3A80 AFAE001C */  sw      $t6, 0x001C($sp)
/* 007C4 809F3A84 AFA00024 */  sw      $zero, 0x0024($sp)
/* 007C8 809F3A88 E7A80040 */  swc1    $f8, 0x0040($sp)
/* 007CC 809F3A8C AFAD0018 */  sw      $t5, 0x0018($sp)
/* 007D0 809F3A90 AFAC0014 */  sw      $t4, 0x0014($sp)
/* 007D4 809F3A94 AFAB0010 */  sw      $t3, 0x0010($sp)
/* 007D8 809F3A98 8FA4004C */  lw      $a0, 0x004C($sp)
/* 007DC 809F3A9C 3C064080 */  lui     $a2, 0x4080                ## $a2 = 40800000
/* 007E0 809F3AA0 0C00A5E9 */  jal     EffectSsHahen_SpawnBurst
/* 007E4 809F3AA4 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 007E8 809F3AA8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 007EC 809F3AAC 0C00BE0A */  jal     Audio_PlayActorSound2

/* 007F0 809F3AB0 2405387C */  addiu   $a1, $zero, 0x387C         ## $a1 = 0000387C
/* 007F4 809F3AB4 3C18809F */  lui     $t8, %hi(func_809F3AD4)    ## $t8 = 809F0000
/* 007F8 809F3AB8 27183AD4 */  addiu   $t8, $t8, %lo(func_809F3AD4) ## $t8 = 809F3AD4
/* 007FC 809F3ABC AE180214 */  sw      $t8, 0x0214($s0)           ## 00000214
/* 00800 809F3AC0 8FBF0034 */  lw      $ra, 0x0034($sp)
.L809F3AC4:
/* 00804 809F3AC4 8FB00030 */  lw      $s0, 0x0030($sp)
/* 00808 809F3AC8 27BD0048 */  addiu   $sp, $sp, 0x0048           ## $sp = 00000000
/* 0080C 809F3ACC 03E00008 */  jr      $ra
/* 00810 809F3AD0 00000000 */  nop
