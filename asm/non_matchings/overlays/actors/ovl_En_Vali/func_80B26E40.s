glabel func_80B26E40
/* 00790 80B26E40 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 00794 80B26E44 AFBF0014 */  sw      $ra, 0x0014($sp)
/* 00798 80B26E48 00803825 */  or      $a3, $a0, $zero            ## $a3 = 00000000
/* 0079C 80B26E4C 3C050600 */  lui     $a1, %hi(D_060014AC)                ## $a1 = 06000000
/* 007A0 80B26E50 24A514AC */  addiu   $a1, $a1, %lo(D_060014AC)           ## $a1 = 060014AC
/* 007A4 80B26E54 AFA70018 */  sw      $a3, 0x0018($sp)
/* 007A8 80B26E58 2484014C */  addiu   $a0, $a0, 0x014C           ## $a0 = 0000014C
/* 007AC 80B26E5C 0C029490 */  jal     SkelAnime_ChangeAnimTransitionStop
/* 007B0 80B26E60 3C064120 */  lui     $a2, 0x4120                ## $a2 = 41200000
/* 007B4 80B26E64 8FA70018 */  lw      $a3, 0x0018($sp)
/* 007B8 80B26E68 2401FFFE */  addiu   $at, $zero, 0xFFFE         ## $at = FFFFFFFE
/* 007BC 80B26E6C 3C0880B2 */  lui     $t0, %hi(func_80B278A0)    ## $t0 = 80B20000
/* 007C0 80B26E70 8CEE0004 */  lw      $t6, 0x0004($a3)           ## 00000004
/* 007C4 80B26E74 250878A0 */  addiu   $t0, $t0, %lo(func_80B278A0) ## $t0 = 80B278A0
/* 007C8 80B26E78 ACE80190 */  sw      $t0, 0x0190($a3)           ## 00000190
/* 007CC 80B26E7C 35CF0010 */  ori     $t7, $t6, 0x0010           ## $t7 = 00000010
/* 007D0 80B26E80 01E1C824 */  and     $t9, $t7, $at
/* 007D4 80B26E84 ACEF0004 */  sw      $t7, 0x0004($a3)           ## 00000004
/* 007D8 80B26E88 ACF90004 */  sw      $t9, 0x0004($a3)           ## 00000004
/* 007DC 80B26E8C 8FBF0014 */  lw      $ra, 0x0014($sp)
/* 007E0 80B26E90 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 007E4 80B26E94 03E00008 */  jr      $ra
/* 007E8 80B26E98 00000000 */  nop
