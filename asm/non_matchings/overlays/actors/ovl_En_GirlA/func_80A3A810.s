glabel func_80A3A810
/* 000C0 80A3A810 3C088016 */  lui     $t0, %hi(gSaveContext+0xef0)
/* 000C4 80A3A814 9508F550 */  lhu     $t0, %lo(gSaveContext+0xef0)($t0)
/* 000C8 80A3A818 240A0026 */  addiu   $t2, $zero, 0x0026         ## $t2 = 00000026
/* 000CC 80A3A81C 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
/* 000D0 80A3A820 31090200 */  andi    $t1, $t0, 0x0200           ## $t1 = 00000000
/* 000D4 80A3A824 51200028 */  beql    $t1, $zero, .L80A3A8C8     
/* 000D8 80A3A828 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
/* 000DC 80A3A82C 03E00008 */  jr      $ra                        
/* 000E0 80A3A830 A48A001C */  sh      $t2, 0x001C($a0)           ## 0000001C
