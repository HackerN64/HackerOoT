glabel func_8097ED94
/* 01724 8097ED94 3C0E8016 */  lui     $t6, %hi(gGameInfo)
/* 01728 8097ED98 8DCEFA90 */  lw      $t6, %lo(gGameInfo)($t6)
/* 0172C 8097ED9C 3C188016 */  lui     $t8, %hi(gSaveContext+0x1360)
/* 01730 8097EDA0 85CF1458 */  lh      $t7, 0x1458($t6)           ## 80161458
/* 01734 8097EDA4 11E00003 */  beq     $t7, $zero, .L8097EDB4     
/* 01738 8097EDA8 00000000 */  nop
/* 0173C 8097EDAC 03E00008 */  jr      $ra                        
/* 01740 8097EDB0 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
.L8097EDB4:
/* 01744 8097EDB4 8F18F9C0 */  lw      $t8, %lo(gSaveContext+0x1360)($t8)
/* 01748 8097EDB8 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
/* 0174C 8097EDBC 2B010004 */  slti    $at, $t8, 0x0004           
/* 01750 8097EDC0 10200003 */  beq     $at, $zero, .L8097EDD0     
/* 01754 8097EDC4 00000000 */  nop
/* 01758 8097EDC8 03E00008 */  jr      $ra                        
/* 0175C 8097EDCC 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L8097EDD0:
/* 01760 8097EDD0 03E00008 */  jr      $ra                        
/* 01764 8097EDD4 00000000 */  nop
