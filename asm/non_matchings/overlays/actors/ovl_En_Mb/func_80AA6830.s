glabel func_80AA6830
/* 007E0 80AA6830 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 007E4 80AA6834 AFBF0014 */  sw      $ra, 0x0014($sp)
/* 007E8 80AA6838 00803825 */  or      $a3, $a0, $zero            ## $a3 = 00000000
/* 007EC 80AA683C 3C050600 */  lui     $a1, 0x0600                ## $a1 = 06000000
/* 007F0 80AA6840 24A541A8 */  addiu   $a1, $a1, 0x41A8           ## $a1 = 060041A8
/* 007F4 80AA6844 AFA70018 */  sw      $a3, 0x0018($sp)
/* 007F8 80AA6848 2484018C */  addiu   $a0, $a0, 0x018C           ## $a0 = 0000018C
/* 007FC 80AA684C 0C0294D3 */  jal     SkelAnime_ChangeAnimationTransitionRate
/* 00800 80AA6850 3C06C080 */  lui     $a2, 0xC080                ## $a2 = C0800000
/* 00804 80AA6854 8FA70018 */  lw      $a3, 0x0018($sp)
/* 00808 80AA6858 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 0080C 80AA685C 2404001E */  addiu   $a0, $zero, 0x001E         ## $a0 = 0000001E
/* 00810 80AA6860 24050032 */  addiu   $a1, $zero, 0x0032         ## $a1 = 00000032
/* 00814 80AA6864 0C01DF64 */  jal     Math_Rand_S16Offset

/* 00818 80AA6868 E4E40068 */  swc1    $f4, 0x0068($a3)           ## 00000068
/* 0081C 80AA686C 8FA40018 */  lw      $a0, 0x0018($sp)
/* 00820 80AA6870 240E0006 */  addiu   $t6, $zero, 0x0006         ## $t6 = 00000006
/* 00824 80AA6874 3C0580AA */  lui     $a1, %hi(func_80AA7134)    ## $a1 = 80AA0000
/* 00828 80AA6878 24A57134 */  addiu   $a1, $a1, %lo(func_80AA7134) ## $a1 = 80AA7134
/* 0082C 80AA687C A482032A */  sh      $v0, 0x032A($a0)           ## 0000032A
/* 00830 80AA6880 0C2A9814 */  jal     func_80AA6050
/* 00834 80AA6884 AC8E0320 */  sw      $t6, 0x0320($a0)           ## 00000320
/* 00838 80AA6888 8FBF0014 */  lw      $ra, 0x0014($sp)
/* 0083C 80AA688C 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 00840 80AA6890 03E00008 */  jr      $ra
/* 00844 80AA6894 00000000 */  nop


