.late_rodata
glabel D_808A607C
 .word 0x43C98000

.text
glabel func_808A5B80
/* 00610 808A5B80 3C0E808A */  lui     $t6, %hi(func_808A5BA4)    ## $t6 = 808A0000
/* 00614 808A5B84 25CE5BA4 */  addiu   $t6, $t6, %lo(func_808A5BA4) ## $t6 = 808A5BA4
/* 00618 808A5B88 AC8E0164 */  sw      $t6, 0x0164($a0)           ## 00000164
/* 0061C 808A5B8C 3C01808A */  lui     $at, %hi(D_808A607C)       ## $at = 808A0000
/* 00620 808A5B90 C424607C */  lwc1    $f4, %lo(D_808A607C)($at)  
/* 00624 808A5B94 240F0014 */  addiu   $t7, $zero, 0x0014         ## $t7 = 00000014
/* 00628 808A5B98 AC8F0168 */  sw      $t7, 0x0168($a0)           ## 00000168
/* 0062C 808A5B9C 03E00008 */  jr      $ra                        
/* 00630 808A5BA0 E4840028 */  swc1    $f4, 0x0028($a0)           ## 00000028
