glabel func_80A439AC
/* 00C7C 80A439AC AFA40000 */  sw      $a0, 0x0000($sp)           
/* 00C80 80A439B0 3C048016 */  lui     $a0, %hi(gSaveContext)
/* 00C84 80A439B4 3C038012 */  lui     $v1, %hi(gBitFlags)
/* 00C88 80A439B8 24637120 */  addiu   $v1, %lo(gBitFlags)
/* 00C8C 80A439BC 2484E660 */  addiu   $a0, %lo(gSaveContext)
/* 00C90 80A439C0 8C8200A4 */  lw      $v0, 0x00A4($a0)           ## 8015E704
/* 00C94 80A439C4 8C6E0004 */  lw      $t6, 0x0004($v1)           ## 80127124
/* 00C98 80A439C8 AFA50004 */  sw      $a1, 0x0004($sp)           
/* 00C9C 80A439CC 01C27824 */  and     $t7, $t6, $v0              
/* 00CA0 80A439D0 51E00007 */  beql    $t7, $zero, .L80A439F0     
/* 00CA4 80A439D4 8C79004C */  lw      $t9, 0x004C($v1)           ## 8012716C
/* 00CA8 80A439D8 8C980004 */  lw      $t8, 0x0004($a0)           ## 8015E664
/* 00CAC 80A439DC 57000004 */  bnel    $t8, $zero, .L80A439F0     
/* 00CB0 80A439E0 8C79004C */  lw      $t9, 0x004C($v1)           ## 8012716C
/* 00CB4 80A439E4 03E00008 */  jr      $ra                        
/* 00CB8 80A439E8 24023043 */  addiu   $v0, $zero, 0x3043         ## $v0 = 00003043
.L80A439EC:
/* 00CBC 80A439EC 8C79004C */  lw      $t9, 0x004C($v1)           ## 8012716C
.L80A439F0:
/* 00CC0 80A439F0 03224024 */  and     $t0, $t9, $v0              
/* 00CC4 80A439F4 51000004 */  beql    $t0, $zero, .L80A43A08     
/* 00CC8 80A439F8 94890F16 */  lhu     $t1, 0x0F16($a0)           ## 8015F576
/* 00CCC 80A439FC 03E00008 */  jr      $ra                        
/* 00CD0 80A43A00 24023027 */  addiu   $v0, $zero, 0x3027         ## $v0 = 00003027
.L80A43A04:
/* 00CD4 80A43A04 94890F16 */  lhu     $t1, 0x0F16($a0)           ## 8015F576
.L80A43A08:
/* 00CD8 80A43A08 24033014 */  addiu   $v1, $zero, 0x3014         ## $v1 = 00003014
/* 00CDC 80A43A0C 312A0001 */  andi    $t2, $t1, 0x0001           ## $t2 = 00000000
/* 00CE0 80A43A10 11400003 */  beq     $t2, $zero, .L80A43A20     
/* 00CE4 80A43A14 00000000 */  nop
/* 00CE8 80A43A18 10000001 */  beq     $zero, $zero, .L80A43A20   
/* 00CEC 80A43A1C 24033015 */  addiu   $v1, $zero, 0x3015         ## $v1 = 00003015
.L80A43A20:
/* 00CF0 80A43A20 3062FFFF */  andi    $v0, $v1, 0xFFFF           ## $v0 = 00003015
/* 00CF4 80A43A24 03E00008 */  jr      $ra                        
/* 00CF8 80A43A28 00000000 */  nop
