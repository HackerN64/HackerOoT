glabel func_80B54DE0
/* 01A30 80B54DE0 8C820318 */  lw      $v0, 0x0318($a0)           ## 00000318
/* 01A34 80B54DE4 3C180001 */  lui     $t8, 0x0001                ## $t8 = 00010000
/* 01A38 80B54DE8 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 01A3C 80B54DEC 00027100 */  sll     $t6, $v0,  4               
/* 01A40 80B54DF0 01C27021 */  addu    $t6, $t6, $v0              
/* 01A44 80B54DF4 000E7080 */  sll     $t6, $t6,  2               
/* 01A48 80B54DF8 00AE7821 */  addu    $t7, $a1, $t6              
/* 01A4C 80B54DFC 030FC021 */  addu    $t8, $t8, $t7              
/* 01A50 80B54E00 8F1817B4 */  lw      $t8, 0x17B4($t8)           ## 000117B4
/* 01A54 80B54E04 0301C821 */  addu    $t9, $t8, $at              
/* 01A58 80B54E08 3C018016 */  lui     $at, %hi(gSegments+0x18)
/* 01A5C 80B54E0C 03E00008 */  jr      $ra                        
/* 01A60 80B54E10 AC396FC0 */  sw      $t9, %lo(gSegments+0x18)($at)
