glabel func_80B26878
/* 001C8 80B26878 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 001CC 80B2687C AFBF0014 */  sw      $ra, 0x0014($sp)
/* 001D0 80B26880 00803025 */  or      $a2, $a0, $zero            ## $a2 = 00000000
/* 001D4 80B26884 3C050600 */  lui     $a1, %hi(D_060014AC)                ## $a1 = 06000000
/* 001D8 80B26888 24A514AC */  addiu   $a1, $a1, %lo(D_060014AC)           ## $a1 = 060014AC
/* 001DC 80B2688C AFA60018 */  sw      $a2, 0x0018($sp)
/* 001E0 80B26890 0C0294BE */  jal     SkelAnime_ChangeAnimDefaultRepeat
/* 001E4 80B26894 2484014C */  addiu   $a0, $a0, 0x014C           ## $a0 = 0000014C
/* 001E8 80B26898 8FA60018 */  lw      $a2, 0x0018($sp)
/* 001EC 80B2689C 3C1880B2 */  lui     $t8, %hi(func_80B27098)    ## $t8 = 80B20000
/* 001F0 80B268A0 27187098 */  addiu   $t8, $t8, %lo(func_80B27098) ## $t8 = 80B27098
/* 001F4 80B268A4 90CE040D */  lbu     $t6, 0x040D($a2)           ## 0000040D
/* 001F8 80B268A8 ACC00134 */  sw      $zero, 0x0134($a2)         ## 00000134
/* 001FC 80B268AC ACD80190 */  sw      $t8, 0x0190($a2)           ## 00000190
/* 00200 80B268B0 31CFFFFE */  andi    $t7, $t6, 0xFFFE           ## $t7 = 00000000
/* 00204 80B268B4 A0CF040D */  sb      $t7, 0x040D($a2)           ## 0000040D
/* 00208 80B268B8 8FBF0014 */  lw      $ra, 0x0014($sp)
/* 0020C 80B268BC 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 00210 80B268C0 03E00008 */  jr      $ra
/* 00214 80B268C4 00000000 */  nop
