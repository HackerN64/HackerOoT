glabel func_80978EBC
/* 0058C 80978EBC 3C0E8016 */  lui     $t6, %hi(gSaveContext+0x1360)
/* 00590 80978EC0 8DCEF9C0 */  lw      $t6, %lo(gSaveContext+0x1360)($t6)
/* 00594 80978EC4 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
/* 00598 80978EC8 29C10004 */  slti    $at, $t6, 0x0004           
/* 0059C 80978ECC 10200003 */  beq     $at, $zero, .L80978EDC     
/* 005A0 80978ED0 00000000 */  nop
/* 005A4 80978ED4 03E00008 */  jr      $ra                        
/* 005A8 80978ED8 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L80978EDC:
/* 005AC 80978EDC 03E00008 */  jr      $ra                        
/* 005B0 80978EE0 00000000 */  nop
