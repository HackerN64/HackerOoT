glabel func_80A2F180
/* 00000 80A2F180 3C0E8016 */  lui     $t6, %hi(gSaveContext+0xf0e)
/* 00004 80A2F184 95CEF56E */  lhu     $t6, %lo(gSaveContext+0xf0e)($t6)
/* 00008 80A2F188 241870F5 */  addiu   $t8, $zero, 0x70F5         ## $t8 = 000070F5
/* 0000C 80A2F18C 241970F4 */  addiu   $t9, $zero, 0x70F4         ## $t9 = 000070F4
/* 00010 80A2F190 31CF0040 */  andi    $t7, $t6, 0x0040           ## $t7 = 00000000
/* 00014 80A2F194 51E00004 */  beql    $t7, $zero, .L80A2F1A8     
/* 00018 80A2F198 A499037E */  sh      $t9, 0x037E($a0)           ## 0000037E
/* 0001C 80A2F19C 03E00008 */  jr      $ra                        
/* 00020 80A2F1A0 A498037E */  sh      $t8, 0x037E($a0)           ## 0000037E
.L80A2F1A4:
/* 00024 80A2F1A4 A499037E */  sh      $t9, 0x037E($a0)           ## 0000037E
.L80A2F1A8:
/* 00028 80A2F1A8 03E00008 */  jr      $ra                        
/* 0002C 80A2F1AC 00000000 */  nop
