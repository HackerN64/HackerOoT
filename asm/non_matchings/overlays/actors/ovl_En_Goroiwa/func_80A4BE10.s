glabel func_80A4BE10
/* 00170 80A4BE10 84AE00A4 */  lh      $t6, 0x00A4($a1)           ## 000000A4
/* 00174 80A4BE14 24010055 */  addiu   $at, $zero, 0x0055         ## $at = 00000055
/* 00178 80A4BE18 240F0001 */  addiu   $t7, $zero, 0x0001         ## $t7 = 00000001
/* 0017C 80A4BE1C 15C10007 */  bne     $t6, $at, .L80A4BE3C       
/* 00180 80A4BE20 3C098016 */  lui     $t1, %hi(gGameInfo)
/* 00184 80A4BE24 A08F01D2 */  sb      $t7, 0x01D2($a0)           ## 000001D2
/* 00188 80A4BE28 3C198016 */  lui     $t9, %hi(gGameInfo)
/* 0018C 80A4BE2C 8F39FA90 */  lw      $t9, %lo(gGameInfo)($t9)
/* 00190 80A4BE30 24180398 */  addiu   $t8, $zero, 0x0398         ## $t8 = 00000398
/* 00194 80A4BE34 03E00008 */  jr      $ra                        
/* 00198 80A4BE38 A738116C */  sh      $t8, 0x116C($t9)           ## 8016116C
.L80A4BE3C:
/* 0019C 80A4BE3C A08001D2 */  sb      $zero, 0x01D2($a0)         ## 000001D2
/* 001A0 80A4BE40 8D29FA90 */  lw      $t1, %lo(gGameInfo)($t1)
/* 001A4 80A4BE44 240803E8 */  addiu   $t0, $zero, 0x03E8         ## $t0 = 000003E8
/* 001A8 80A4BE48 A528116C */  sh      $t0, 0x116C($t1)           ## 8016116C
/* 001AC 80A4BE4C 03E00008 */  jr      $ra                        
/* 001B0 80A4BE50 00000000 */  nop
