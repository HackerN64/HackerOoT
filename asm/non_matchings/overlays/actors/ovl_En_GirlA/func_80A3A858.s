glabel func_80A3A858
/* 00108 80A3A858 3C0E8016 */  lui     $t6, %hi(gSaveContext+0xef0)
/* 0010C 80A3A85C 95CEF550 */  lhu     $t6, %lo(gSaveContext+0xef0)($t6)
/* 00110 80A3A860 24180026 */  addiu   $t8, $zero, 0x0026         ## $t8 = 00000026
/* 00114 80A3A864 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
/* 00118 80A3A868 31CF0008 */  andi    $t7, $t6, 0x0008           ## $t7 = 00000000
/* 0011C 80A3A86C 51E00016 */  beql    $t7, $zero, .L80A3A8C8     
/* 00120 80A3A870 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
/* 00124 80A3A874 03E00008 */  jr      $ra                        
/* 00128 80A3A878 A498001C */  sh      $t8, 0x001C($a0)           ## 0000001C
