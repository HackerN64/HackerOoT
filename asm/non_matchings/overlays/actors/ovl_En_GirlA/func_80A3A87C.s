glabel func_80A3A87C
/* 0012C 80A3A87C 3C198016 */  lui     $t9, %hi(gSaveContext+0xef0)
/* 00130 80A3A880 9739F550 */  lhu     $t9, %lo(gSaveContext+0xef0)($t9)
/* 00134 80A3A884 24090026 */  addiu   $t1, $zero, 0x0026         ## $t1 = 00000026
/* 00138 80A3A888 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
/* 0013C 80A3A88C 33280010 */  andi    $t0, $t9, 0x0010           ## $t0 = 00000000
/* 00140 80A3A890 5100000D */  beql    $t0, $zero, .L80A3A8C8     
/* 00144 80A3A894 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
/* 00148 80A3A898 03E00008 */  jr      $ra                        
/* 0014C 80A3A89C A489001C */  sh      $t1, 0x001C($a0)           ## 0000001C
