glabel func_8096DDBC
/* 0090C 8096DDBC 8C8201A4 */  lw      $v0, 0x01A4($a0)           ## 000001A4
/* 00910 8096DDC0 3C180001 */  lui     $t8, 0x0001                ## $t8 = 00010000
/* 00914 8096DDC4 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 00918 8096DDC8 00027100 */  sll     $t6, $v0,  4               
/* 0091C 8096DDCC 01C27021 */  addu    $t6, $t6, $v0              
/* 00920 8096DDD0 000E7080 */  sll     $t6, $t6,  2               
/* 00924 8096DDD4 00AE7821 */  addu    $t7, $a1, $t6              
/* 00928 8096DDD8 030FC021 */  addu    $t8, $t8, $t7              
/* 0092C 8096DDDC 8F1817B4 */  lw      $t8, 0x17B4($t8)           ## 000117B4
/* 00930 8096DDE0 0301C821 */  addu    $t9, $t8, $at              
/* 00934 8096DDE4 3C018016 */  lui     $at, %hi(gSegments+0x18)
/* 00938 8096DDE8 03E00008 */  jr      $ra                        
/* 0093C 8096DDEC AC396FC0 */  sw      $t9, %lo(gSegments+0x18)($at)
