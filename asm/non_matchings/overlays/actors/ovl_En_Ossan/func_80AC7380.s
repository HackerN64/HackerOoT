glabel func_80AC7380
/* 046E0 80AC7380 808E01EA */  lb      $t6, 0x01EA($a0)           ## 000001EA
/* 046E4 80AC7384 3C190001 */  lui     $t9, 0x0001                ## $t9 = 00010000
/* 046E8 80AC7388 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 046EC 80AC738C 000E7900 */  sll     $t7, $t6,  4               
/* 046F0 80AC7390 01EE7821 */  addu    $t7, $t7, $t6              
/* 046F4 80AC7394 000F7880 */  sll     $t7, $t7,  2               
/* 046F8 80AC7398 00AFC021 */  addu    $t8, $a1, $t7              
/* 046FC 80AC739C 0338C821 */  addu    $t9, $t9, $t8              
/* 04700 80AC73A0 8F3917B4 */  lw      $t9, 0x17B4($t9)           ## 000117B4
/* 04704 80AC73A4 03214021 */  addu    $t0, $t9, $at              
/* 04708 80AC73A8 3C018016 */  lui     $at, %hi(gSegments+0x18)
/* 0470C 80AC73AC 03E00008 */  jr      $ra                        
/* 04710 80AC73B0 AC286FC0 */  sw      $t0, %lo(gSegments+0x18)($at)
