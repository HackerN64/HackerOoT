glabel func_809EF800
/* 004B0 809EF800 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 004B4 809EF804 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 004B8 809EF808 3C0E8012 */  lui     $t6, %hi(gBitFlags+0x10)
/* 004BC 809EF80C 8DCE7130 */  lw      $t6, %lo(gBitFlags+0x10)($t6)
/* 004C0 809EF810 944F009C */  lhu     $t7, 0x009C($v0)           ## 8015E6FC
/* 004C4 809EF814 01CFC024 */  and     $t8, $t6, $t7              
/* 004C8 809EF818 53000004 */  beql    $t8, $zero, .L809EF82C     
/* 004CC 809EF81C 8C8802C0 */  lw      $t0, 0x02C0($a0)           ## 000002C0
/* 004D0 809EF820 03E00008 */  jr      $ra                        
/* 004D4 809EF824 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
.L809EF828:
/* 004D8 809EF828 8C8802C0 */  lw      $t0, 0x02C0($a0)           ## 000002C0
.L809EF82C:
/* 004DC 809EF82C 84590034 */  lh      $t9, 0x0034($v0)           ## 00000035
/* 004E0 809EF830 24020004 */  addiu   $v0, $zero, 0x0004         ## $v0 = 00000004
/* 004E4 809EF834 85090000 */  lh      $t1, 0x0000($t0)           ## 00000000
/* 004E8 809EF838 0329082A */  slt     $at, $t9, $t1              
/* 004EC 809EF83C 10200003 */  beq     $at, $zero, .L809EF84C     
/* 004F0 809EF840 00000000 */  nop
/* 004F4 809EF844 03E00008 */  jr      $ra                        
/* 004F8 809EF848 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L809EF84C:
/* 004FC 809EF84C 03E00008 */  jr      $ra                        
/* 00500 809EF850 00000000 */  nop
