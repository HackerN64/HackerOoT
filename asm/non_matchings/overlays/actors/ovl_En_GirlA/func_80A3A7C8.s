glabel func_80A3A7C8
/* 00078 80A3A7C8 3C0C8016 */  lui     $t4, %hi(gSaveContext+0xef0)
/* 0007C 80A3A7CC 958CF550 */  lhu     $t4, %lo(gSaveContext+0xef0)($t4)
/* 00080 80A3A7D0 240E0026 */  addiu   $t6, $zero, 0x0026         ## $t6 = 00000026
/* 00084 80A3A7D4 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
/* 00088 80A3A7D8 318D0080 */  andi    $t5, $t4, 0x0080           ## $t5 = 00000000
/* 0008C 80A3A7DC 51A0003A */  beql    $t5, $zero, .L80A3A8C8     
/* 00090 80A3A7E0 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
/* 00094 80A3A7E4 03E00008 */  jr      $ra                        
/* 00098 80A3A7E8 A48E001C */  sh      $t6, 0x001C($a0)           ## 0000001C
