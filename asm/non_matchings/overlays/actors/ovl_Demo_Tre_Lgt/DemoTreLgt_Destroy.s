glabel DemoTreLgt_Destroy
/* 0006C 8099372C 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 00070 80993730 00803025 */  or      $a2, $a0, $zero            ## $a2 = 00000000
/* 00074 80993734 AFBF0014 */  sw      $ra, 0x0014($sp)
/* 00078 80993738 00A02025 */  or      $a0, $a1, $zero            ## $a0 = 00000000
/* 0007C 8099373C 0C01B217 */  jal     SkelCurve_Destroy
/* 00080 80993740 24C5014C */  addiu   $a1, $a2, 0x014C           ## $a1 = 0000014C
/* 00084 80993744 8FBF0014 */  lw      $ra, 0x0014($sp)
/* 00088 80993748 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 0008C 8099374C 03E00008 */  jr      $ra
/* 00090 80993750 00000000 */  nop
