glabel func_80A3A7A4
/* 00054 80A3A7A4 3C098016 */  lui     $t1, %hi(gSaveContext+0xef0)
/* 00058 80A3A7A8 9529F550 */  lhu     $t1, %lo(gSaveContext+0xef0)($t1)
/* 0005C 80A3A7AC 240B0026 */  addiu   $t3, $zero, 0x0026         ## $t3 = 00000026
/* 00060 80A3A7B0 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
/* 00064 80A3A7B4 312A0040 */  andi    $t2, $t1, 0x0040           ## $t2 = 00000000
/* 00068 80A3A7B8 51400043 */  beql    $t2, $zero, .L80A3A8C8     
/* 0006C 80A3A7BC 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
/* 00070 80A3A7C0 03E00008 */  jr      $ra                        
/* 00074 80A3A7C4 A48B001C */  sh      $t3, 0x001C($a0)           ## 0000001C
