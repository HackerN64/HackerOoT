glabel func_80AB2688
/* 018F8 80AB2688 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 018FC 80AB268C AFBF0014 */  sw      $ra, 0x0014($sp)
/* 01900 80AB2690 AFA40018 */  sw      $a0, 0x0018($sp)
/* 01904 80AB2694 AFA5001C */  sw      $a1, 0x001C($sp)
/* 01908 80AB2698 908E0181 */  lbu     $t6, 0x0181($a0)           ## 00000181
/* 0190C 80AB269C 00802825 */  or      $a1, $a0, $zero            ## $a1 = 00000000
/* 01910 80AB26A0 24A6014C */  addiu   $a2, $a1, 0x014C           ## $a2 = 0000014C
/* 01914 80AB26A4 35CF0001 */  ori     $t7, $t6, 0x0001           ## $t7 = 00000001
/* 01918 80AB26A8 A08F0181 */  sb      $t7, 0x0181($a0)           ## 00000181
/* 0191C 80AB26AC 8FA4001C */  lw      $a0, 0x001C($sp)
/* 01920 80AB26B0 0C028D88 */  jal     SkelAnime_LoadAnimationType5
/* 01924 80AB26B4 3C073F80 */  lui     $a3, 0x3F80                ## $a3 = 3F800000
/* 01928 80AB26B8 8FBF0014 */  lw      $ra, 0x0014($sp)
/* 0192C 80AB26BC 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 01930 80AB26C0 03E00008 */  jr      $ra
/* 01934 80AB26C4 00000000 */  nop
