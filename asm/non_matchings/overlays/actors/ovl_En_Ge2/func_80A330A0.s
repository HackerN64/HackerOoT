glabel func_80A330A0
/* 004D0 80A330A0 3C0E8016 */  lui     $t6, %hi(gSaveContext+0xee6)
/* 004D4 80A330A4 95CFF546 */  lhu     $t7, %lo(gSaveContext+0xee6)($t6)
/* 004D8 80A330A8 2401000F */  addiu   $at, $zero, 0x000F         ## $at = 0000000F
/* 004DC 80A330AC 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
/* 004E0 80A330B0 31F8000F */  andi    $t8, $t7, 0x000F           ## $t8 = 00000000
/* 004E4 80A330B4 17010003 */  bne     $t8, $at, .L80A330C4       
/* 004E8 80A330B8 00000000 */  nop
/* 004EC 80A330BC 03E00008 */  jr      $ra                        
/* 004F0 80A330C0 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
.L80A330C4:
/* 004F4 80A330C4 03E00008 */  jr      $ra                        
/* 004F8 80A330C8 00000000 */  nop
