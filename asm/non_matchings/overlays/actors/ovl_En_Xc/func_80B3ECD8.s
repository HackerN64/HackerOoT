.late_rodata
glabel D_80B4223C
    .float 0.01

glabel D_80B42240
    .float 1.2

.text
glabel func_80B3ECD8
/* 02AF8 80B3ECD8 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 02AFC 80B3ECDC 44813000 */  mtc1    $at, $f6                   ## $f6 = 1.00
/* 02B00 80B3ECE0 C4840268 */  lwc1    $f4, 0x0268($a0)           ## 00000268
/* 02B04 80B3ECE4 3C014140 */  lui     $at, 0x4140                ## $at = 41400000
/* 02B08 80B3ECE8 44818000 */  mtc1    $at, $f16                  ## $f16 = 12.00
/* 02B0C 80B3ECEC 46062200 */  add.s   $f8, $f4, $f6              
/* 02B10 80B3ECF0 3C0E8016 */  lui     $t6, %hi(gGameInfo)
/* 02B14 80B3ECF4 E4880268 */  swc1    $f8, 0x0268($a0)           ## 00000268
/* 02B18 80B3ECF8 C48A0268 */  lwc1    $f10, 0x0268($a0)          ## 00000268
/* 02B1C 80B3ECFC 460A803E */  c.le.s  $f16, $f10                 
/* 02B20 80B3ED00 00000000 */  nop
/* 02B24 80B3ED04 4500000E */  bc1f    .L80B3ED40                 
/* 02B28 80B3ED08 00000000 */  nop
/* 02B2C 80B3ED0C 8DCEFA90 */  lw      $t6, %lo(gGameInfo)($t6)
/* 02B30 80B3ED10 3C0180B4 */  lui     $at, %hi(D_80B4223C)       ## $at = 80B40000
/* 02B34 80B3ED14 C426223C */  lwc1    $f6, %lo(D_80B4223C)($at)  
/* 02B38 80B3ED18 85CF1458 */  lh      $t7, 0x1458($t6)           ## 80161458
/* 02B3C 80B3ED1C 3C0180B4 */  lui     $at, %hi(D_80B42240)       ## $at = 80B40000
/* 02B40 80B3ED20 C42A2240 */  lwc1    $f10, %lo(D_80B42240)($at) 
/* 02B44 80B3ED24 448F9000 */  mtc1    $t7, $f18                  ## $f18 = 0.00
/* 02B48 80B3ED28 24180018 */  addiu   $t8, $zero, 0x0018         ## $t8 = 00000018
/* 02B4C 80B3ED2C AC980260 */  sw      $t8, 0x0260($a0)           ## 00000260
/* 02B50 80B3ED30 46809120 */  cvt.s.w $f4, $f18                  
/* 02B54 80B3ED34 46062202 */  mul.s   $f8, $f4, $f6              
/* 02B58 80B3ED38 460A4400 */  add.s   $f16, $f8, $f10            
/* 02B5C 80B3ED3C E4900068 */  swc1    $f16, 0x0068($a0)          ## 00000068
.L80B3ED40:
/* 02B60 80B3ED40 03E00008 */  jr      $ra                        
/* 02B64 80B3ED44 00000000 */  nop
