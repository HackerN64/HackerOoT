glabel func_80B59AD0
/* 06720 80B59AD0 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 06724 80B59AD4 AFB00014 */  sw      $s0, 0x0014($sp)           
/* 06728 80B59AD8 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 0672C 80B59ADC AFB10018 */  sw      $s1, 0x0018($sp)           
/* 06730 80B59AE0 00A08825 */  or      $s1, $a1, $zero            ## $s1 = 00000000
/* 06734 80B59AE4 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 06738 80B59AE8 00A02025 */  or      $a0, $a1, $zero            ## $a0 = 00000000
/* 0673C 80B59AEC 0C00B2DD */  jal     Flags_SetSwitch
              
/* 06740 80B59AF0 24050036 */  addiu   $a1, $zero, 0x0036         ## $a1 = 00000036
/* 06744 80B59AF4 0C0222A8 */  jal     func_80088AA0              
/* 06748 80B59AF8 240400B4 */  addiu   $a0, $zero, 0x00B4         ## $a0 = 000000B4
/* 0674C 80B59AFC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 06750 80B59B00 0C2D53A9 */  jal     func_80B54EA4              
/* 06754 80B59B04 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 06758 80B59B08 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0675C 80B59B0C 0C2D4D85 */  jal     func_80B53614              
/* 06760 80B59B10 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 06764 80B59B14 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 06768 80B59B18 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 0676C 80B59B1C 944E0EEC */  lhu     $t6, 0x0EEC($v0)           ## 8015F54C
/* 06770 80B59B20 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 06774 80B59B24 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 06778 80B59B28 31CFFF7F */  andi    $t7, $t6, 0xFF7F           ## $t7 = 00000000
/* 0677C 80B59B2C 0C2D5BC4 */  jal     func_80B56F10              
/* 06780 80B59B30 A44F0EEC */  sh      $t7, 0x0EEC($v0)           ## 8015F54C
/* 06784 80B59B34 24180140 */  addiu   $t8, $zero, 0x0140         ## $t8 = 00000140
/* 06788 80B59B38 3C018016 */  lui     $at, %hi(gSaveContext+0x1424)
/* 0678C 80B59B3C A438FA84 */  sh      $t8, %lo(gSaveContext+0x1424)($at)
/* 06790 80B59B40 0C021DA0 */  jal     Magic_Fill              
/* 06794 80B59B44 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 06798 80B59B48 2419001B */  addiu   $t9, $zero, 0x001B         ## $t9 = 0000001B
/* 0679C 80B59B4C 24080001 */  addiu   $t0, $zero, 0x0001         ## $t0 = 00000001
/* 067A0 80B59B50 AE19024C */  sw      $t9, 0x024C($s0)           ## 0000024C
/* 067A4 80B59B54 AE080250 */  sw      $t0, 0x0250($s0)           ## 00000250
/* 067A8 80B59B58 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 067AC 80B59B5C 8FB10018 */  lw      $s1, 0x0018($sp)           
/* 067B0 80B59B60 8FB00014 */  lw      $s0, 0x0014($sp)           
/* 067B4 80B59B64 03E00008 */  jr      $ra                        
/* 067B8 80B59B68 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
