glabel func_8084B498
/* 19288 8084B498 3C0E8012 */  lui     $t6, %hi(gItemSlots+7)
/* 1928C 8084B49C 91CE746B */  lbu     $t6, %lo(gItemSlots+7)($t6)
/* 19290 8084B4A0 3C0F8016 */  lui     $t7, %hi(gSaveContext+0x74)
/* 19294 8084B4A4 24010007 */  addiu   $at, $zero, 0x0007         ## $at = 00000007
/* 19298 8084B4A8 01EE7821 */  addu    $t7, $t7, $t6              
/* 1929C 8084B4AC 91EFE6D4 */  lbu     $t7, %lo(gSaveContext+0x74)($t7)
/* 192A0 8084B4B0 2419001D */  addiu   $t9, $zero, 0x001D         ## $t9 = 0000001D
/* 192A4 8084B4B4 2418001C */  addiu   $t8, $zero, 0x001C         ## $t8 = 0000001C
/* 192A8 8084B4B8 55E10004 */  bnel    $t7, $at, .L8084B4CC       
/* 192AC 8084B4BC A0990154 */  sb      $t9, 0x0154($a0)           ## 00000154
/* 192B0 8084B4C0 03E00008 */  jr      $ra                        
/* 192B4 8084B4C4 A0980154 */  sb      $t8, 0x0154($a0)           ## 00000154
.L8084B4C8:
/* 192B8 8084B4C8 A0990154 */  sb      $t9, 0x0154($a0)           ## 00000154
.L8084B4CC:
/* 192BC 8084B4CC 03E00008 */  jr      $ra                        
/* 192C0 8084B4D0 00000000 */  nop
