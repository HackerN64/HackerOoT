glabel func_80A444A8
/* 01778 80A444A8 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 0177C 80A444AC 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 01780 80A444B0 8C4E0004 */  lw      $t6, 0x0004($v0)           ## 8015E664
/* 01784 80A444B4 AFA40000 */  sw      $a0, 0x0000($sp)           
/* 01788 80A444B8 AFA50004 */  sw      $a1, 0x0004($sp)           
/* 0178C 80A444BC 11C0000C */  beq     $t6, $zero, .L80A444F0     
/* 01790 80A444C0 3C0F8012 */  lui     $t7, %hi(gBitFlags+0x4c)
/* 01794 80A444C4 8DEF716C */  lw      $t7, %lo(gBitFlags+0x4c)($t7)
/* 01798 80A444C8 8C5800A4 */  lw      $t8, 0x00A4($v0)           ## 8015E704
/* 0179C 80A444CC 24033064 */  addiu   $v1, $zero, 0x3064         ## $v1 = 00003064
/* 017A0 80A444D0 01F8C824 */  and     $t9, $t7, $t8              
/* 017A4 80A444D4 13200004 */  beq     $t9, $zero, .L80A444E8     
/* 017A8 80A444D8 00000000 */  nop
/* 017AC 80A444DC 24033065 */  addiu   $v1, $zero, 0x3065         ## $v1 = 00003065
/* 017B0 80A444E0 03E00008 */  jr      $ra                        
/* 017B4 80A444E4 3062FFFF */  andi    $v0, $v1, 0xFFFF           ## $v0 = 00003065
.L80A444E8:
/* 017B8 80A444E8 03E00008 */  jr      $ra                        
/* 017BC 80A444EC 3062FFFF */  andi    $v0, $v1, 0xFFFF           ## $v0 = 00003065
.L80A444F0:
/* 017C0 80A444F0 24023043 */  addiu   $v0, $zero, 0x3043         ## $v0 = 00003043
/* 017C4 80A444F4 03E00008 */  jr      $ra                        
/* 017C8 80A444F8 00000000 */  nop
