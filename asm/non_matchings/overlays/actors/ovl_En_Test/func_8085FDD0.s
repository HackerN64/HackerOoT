glabel func_8085FDD0
/* 00780 8085FDD0 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 00784 8085FDD4 AFBF0014 */  sw      $ra, 0x0014($sp)
/* 00788 8085FDD8 00803025 */  or      $a2, $a0, $zero            ## $a2 = 00000000
/* 0078C 8085FDDC 3C050600 */  lui     $a1, %hi(D_0600316C)                ## $a1 = 06000000
/* 00790 8085FDE0 24A5316C */  addiu   $a1, $a1, %lo(D_0600316C)           ## $a1 = 0600316C
/* 00794 8085FDE4 AFA60018 */  sw      $a2, 0x0018($sp)
/* 00798 8085FDE8 0C0294BE */  jal     Animation_PlayLoop
/* 0079C 8085FDEC 24840188 */  addiu   $a0, $a0, 0x0188           ## $a0 = 00000188
/* 007A0 8085FDF0 8FA40018 */  lw      $a0, 0x0018($sp)
/* 007A4 8085FDF4 3C014060 */  lui     $at, 0x4060                ## $at = 40600000
/* 007A8 8085FDF8 44814000 */  mtc1    $at, $f8                   ## $f8 = 3.50
/* 007AC 8085FDFC C486000C */  lwc1    $f6, 0x000C($a0)           ## 0000000C
/* 007B0 8085FE00 8C8F0004 */  lw      $t7, 0x0004($a0)           ## 00000004
/* 007B4 8085FE04 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 007B8 8085FE08 46083281 */  sub.s   $f10, $f6, $f8
/* 007BC 8085FE0C 2401FFFE */  addiu   $at, $zero, 0xFFFE         ## $at = FFFFFFFE
/* 007C0 8085FE10 240E000F */  addiu   $t6, $zero, 0x000F         ## $t6 = 0000000F
/* 007C4 8085FE14 3C058086 */  lui     $a1, %hi(func_8085FE48)    ## $a1 = 80860000
/* 007C8 8085FE18 01E1C024 */  and     $t8, $t7, $at
/* 007CC 8085FE1C 24A5FE48 */  addiu   $a1, $a1, %lo(func_8085FE48) ## $a1 = 8085FE48
/* 007D0 8085FE20 A08007C8 */  sb      $zero, 0x07C8($a0)         ## 000007C8
/* 007D4 8085FE24 AC8E07E8 */  sw      $t6, 0x07E8($a0)           ## 000007E8
/* 007D8 8085FE28 E48A0028 */  swc1    $f10, 0x0028($a0)          ## 00000028
/* 007DC 8085FE2C AC980004 */  sw      $t8, 0x0004($a0)           ## 00000004
/* 007E0 8085FE30 0C217D94 */  jal     EnTest_SetupAction
/* 007E4 8085FE34 E4840054 */  swc1    $f4, 0x0054($a0)           ## 00000054
/* 007E8 8085FE38 8FBF0014 */  lw      $ra, 0x0014($sp)
/* 007EC 8085FE3C 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 007F0 8085FE40 03E00008 */  jr      $ra
/* 007F4 8085FE44 00000000 */  nop
