glabel func_80A3B204
/* 00AB4 80A3B204 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00AB8 80A3B208 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00ABC 80A3B20C 844E0030 */  lh      $t6, 0x0030($v0)           ## 8015E690
/* 00AC0 80A3B210 844F002E */  lh      $t7, 0x002E($v0)           ## 8015E68E
/* 00AC4 80A3B214 AFA40000 */  sw      $a0, 0x0000($sp)           
/* 00AC8 80A3B218 55CF0004 */  bnel    $t6, $t7, .L80A3B22C       
/* 00ACC 80A3B21C 84580034 */  lh      $t8, 0x0034($v0)           ## 8015E694
/* 00AD0 80A3B220 03E00008 */  jr      $ra                        
/* 00AD4 80A3B224 24020002 */  addiu   $v0, $zero, 0x0002         ## $v0 = 00000002
.L80A3B228:
/* 00AD8 80A3B228 84580034 */  lh      $t8, 0x0034($v0)           ## 00000036
.L80A3B22C:
/* 00ADC 80A3B22C 84B901C8 */  lh      $t9, 0x01C8($a1)           ## 000001C8
/* 00AE0 80A3B230 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
/* 00AE4 80A3B234 0319082A */  slt     $at, $t8, $t9              
/* 00AE8 80A3B238 10200003 */  beq     $at, $zero, .L80A3B248     
/* 00AEC 80A3B23C 00000000 */  nop
/* 00AF0 80A3B240 03E00008 */  jr      $ra                        
/* 00AF4 80A3B244 24020004 */  addiu   $v0, $zero, 0x0004         ## $v0 = 00000004
.L80A3B248:
/* 00AF8 80A3B248 03E00008 */  jr      $ra                        
/* 00AFC 80A3B24C 00000000 */  nop
