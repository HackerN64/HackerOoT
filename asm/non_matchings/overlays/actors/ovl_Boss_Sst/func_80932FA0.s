glabel func_80932FA0
/* 069D0 80932FA0 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 069D4 80932FA4 AFBF0014 */  sw      $ra, 0x0014($sp)
/* 069D8 80932FA8 00803825 */  or      $a3, $a0, $zero            ## $a3 = 00000000
/* 069DC 80932FAC 84EE001C */  lh      $t6, 0x001C($a3)           ## 0000001C
/* 069E0 80932FB0 3C058093 */  lui     $a1, %hi(D_80937854)       ## $a1 = 80930000
/* 069E4 80932FB4 AFA70018 */  sw      $a3, 0x0018($sp)
/* 069E8 80932FB8 000E7880 */  sll     $t7, $t6,  2
/* 069EC 80932FBC 00AF2821 */  addu    $a1, $a1, $t7
/* 069F0 80932FC0 8CA57854 */  lw      $a1, %lo(D_80937854)($a1)
/* 069F4 80932FC4 2484014C */  addiu   $a0, $a0, 0x014C           ## $a0 = 0000014C
/* 069F8 80932FC8 0C029490 */  jal     Animation_MorphToPlayOnce
/* 069FC 80932FCC 3C0640A0 */  lui     $a2, 0x40A0                ## $a2 = 40A00000
/* 06A00 80932FD0 8FA70018 */  lw      $a3, 0x0018($sp)
/* 06A04 80932FD4 3C188093 */  lui     $t8, %hi(func_80932FF0)    ## $t8 = 80930000
/* 06A08 80932FD8 27182FF0 */  addiu   $t8, $t8, %lo(func_80932FF0) ## $t8 = 80932FF0
/* 06A0C 80932FDC ACF80190 */  sw      $t8, 0x0190($a3)           ## 00000190
/* 06A10 80932FE0 8FBF0014 */  lw      $ra, 0x0014($sp)
/* 06A14 80932FE4 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 06A18 80932FE8 03E00008 */  jr      $ra
/* 06A1C 80932FEC 00000000 */  nop
