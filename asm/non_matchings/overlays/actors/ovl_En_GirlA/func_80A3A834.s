glabel func_80A3A834
/* 000E4 80A3A834 3C0B8016 */  lui     $t3, %hi(gSaveContext+0xef0)
/* 000E8 80A3A838 956BF550 */  lhu     $t3, %lo(gSaveContext+0xef0)($t3)
/* 000EC 80A3A83C 240D0026 */  addiu   $t5, $zero, 0x0026         ## $t5 = 00000026
/* 000F0 80A3A840 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
/* 000F4 80A3A844 316C0400 */  andi    $t4, $t3, 0x0400           ## $t4 = 00000000
/* 000F8 80A3A848 5180001F */  beql    $t4, $zero, .L80A3A8C8     
/* 000FC 80A3A84C 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
/* 00100 80A3A850 03E00008 */  jr      $ra                        
/* 00104 80A3A854 A48D001C */  sh      $t5, 0x001C($a0)           ## 0000001C
