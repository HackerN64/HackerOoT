glabel func_80A43A88
/* 00D58 80A43A88 AFA40000 */  sw      $a0, 0x0000($sp)           
/* 00D5C 80A43A8C 3C048016 */  lui     $a0, %hi(gSaveContext)
/* 00D60 80A43A90 3C038012 */  lui     $v1, %hi(gBitFlags)
/* 00D64 80A43A94 24637120 */  addiu   $v1, %lo(gBitFlags)
/* 00D68 80A43A98 2484E660 */  addiu   $a0, %lo(gSaveContext)
/* 00D6C 80A43A9C 8C8200A4 */  lw      $v0, 0x00A4($a0)           ## 8015E704
/* 00D70 80A43AA0 8C6E0004 */  lw      $t6, 0x0004($v1)           ## 80127124
/* 00D74 80A43AA4 AFA50004 */  sw      $a1, 0x0004($sp)           
/* 00D78 80A43AA8 01C27824 */  and     $t7, $t6, $v0              
/* 00D7C 80A43AAC 51E00007 */  beql    $t7, $zero, .L80A43ACC     
/* 00D80 80A43AB0 8C79004C */  lw      $t9, 0x004C($v1)           ## 8012716C
/* 00D84 80A43AB4 8C980004 */  lw      $t8, 0x0004($a0)           ## 8015E664
/* 00D88 80A43AB8 57000004 */  bnel    $t8, $zero, .L80A43ACC     
/* 00D8C 80A43ABC 8C79004C */  lw      $t9, 0x004C($v1)           ## 8012716C
/* 00D90 80A43AC0 03E00008 */  jr      $ra                        
/* 00D94 80A43AC4 24023043 */  addiu   $v0, $zero, 0x3043         ## $v0 = 00003043
.L80A43AC8:
/* 00D98 80A43AC8 8C79004C */  lw      $t9, 0x004C($v1)           ## 8012716C
.L80A43ACC:
/* 00D9C 80A43ACC 03224024 */  and     $t0, $t9, $v0              
/* 00DA0 80A43AD0 51000004 */  beql    $t0, $zero, .L80A43AE4     
/* 00DA4 80A43AD4 94890F16 */  lhu     $t1, 0x0F16($a0)           ## 8015F576
/* 00DA8 80A43AD8 03E00008 */  jr      $ra                        
/* 00DAC 80A43ADC 24023067 */  addiu   $v0, $zero, 0x3067         ## $v0 = 00003067
.L80A43AE0:
/* 00DB0 80A43AE0 94890F16 */  lhu     $t1, 0x0F16($a0)           ## 8015F576
.L80A43AE4:
/* 00DB4 80A43AE4 24033016 */  addiu   $v1, $zero, 0x3016         ## $v1 = 00003016
/* 00DB8 80A43AE8 312A0010 */  andi    $t2, $t1, 0x0010           ## $t2 = 00000000
/* 00DBC 80A43AEC 11400003 */  beq     $t2, $zero, .L80A43AFC     
/* 00DC0 80A43AF0 00000000 */  nop
/* 00DC4 80A43AF4 10000001 */  beq     $zero, $zero, .L80A43AFC   
/* 00DC8 80A43AF8 24033017 */  addiu   $v1, $zero, 0x3017         ## $v1 = 00003017
.L80A43AFC:
/* 00DCC 80A43AFC 3062FFFF */  andi    $v0, $v1, 0xFFFF           ## $v0 = 00003017
/* 00DD0 80A43B00 03E00008 */  jr      $ra                        
/* 00DD4 80A43B04 00000000 */  nop
