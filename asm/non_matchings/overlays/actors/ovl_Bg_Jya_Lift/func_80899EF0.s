.late_rodata
glabel D_8089A08C
    .float 973.0

.text
glabel func_80899EF0
/* 00350 80899EF0 AC800164 */  sw      $zero, 0x0164($a0)         ## 00000164
/* 00354 80899EF4 3C01808A */  lui     $at, %hi(D_8089A08C)       ## $at = 808A0000
/* 00358 80899EF8 C424A08C */  lwc1    $f4, %lo(D_8089A08C)($at)  
/* 0035C 80899EFC 03E00008 */  jr      $ra                        
/* 00360 80899F00 E4840028 */  swc1    $f4, 0x0028($a0)           ## 00000028
