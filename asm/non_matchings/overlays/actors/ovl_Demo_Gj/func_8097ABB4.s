glabel func_8097ABB4
/* 02284 8097ABB4 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 02288 8097ABB8 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 0228C 8097ABBC AFA5001C */  sw      $a1, 0x001C($sp)           
/* 02290 8097ABC0 0C00B638 */  jal     Actor_MoveForward
              
/* 02294 8097ABC4 AFA40018 */  sw      $a0, 0x0018($sp)           
/* 02298 8097ABC8 3C028016 */  lui     $v0, %hi(gGameInfo)
/* 0229C 8097ABCC 2442FA90 */  addiu   $v0, %lo(gGameInfo)
/* 022A0 8097ABD0 8FA40018 */  lw      $a0, 0x0018($sp)           
/* 022A4 8097ABD4 8C4F0000 */  lw      $t7, 0x0000($v0)           ## 8015FA90
/* 022A8 8097ABD8 848E016C */  lh      $t6, 0x016C($a0)           ## 0000016C
/* 022AC 8097ABDC 85F81472 */  lh      $t8, 0x1472($t7)           ## 00001472
/* 022B0 8097ABE0 8488016E */  lh      $t0, 0x016E($a0)           ## 0000016E
/* 022B4 8097ABE4 01D8C821 */  addu    $t9, $t6, $t8              
/* 022B8 8097ABE8 A499016C */  sh      $t9, 0x016C($a0)           ## 0000016C
/* 022BC 8097ABEC 8C490000 */  lw      $t1, 0x0000($v0)           ## 8015FA90
/* 022C0 8097ABF0 848E0170 */  lh      $t6, 0x0170($a0)           ## 00000170
/* 022C4 8097ABF4 852A1470 */  lh      $t2, 0x1470($t1)           ## 00001470
/* 022C8 8097ABF8 254D03E8 */  addiu   $t5, $t2, 0x03E8           ## $t5 = 000003E8
/* 022CC 8097ABFC 010D7821 */  addu    $t7, $t0, $t5              
/* 022D0 8097AC00 A48F016E */  sh      $t7, 0x016E($a0)           ## 0000016E
/* 022D4 8097AC04 8C580000 */  lw      $t8, 0x0000($v0)           ## 8015FA90
/* 022D8 8097AC08 8719146E */  lh      $t9, 0x146E($t8)           ## 0000146E
/* 022DC 8097AC0C 272B0BB8 */  addiu   $t3, $t9, 0x0BB8           ## $t3 = 00000BB8
/* 022E0 8097AC10 01CB6021 */  addu    $t4, $t6, $t3              
/* 022E4 8097AC14 A48C0170 */  sh      $t4, 0x0170($a0)           ## 00000170
/* 022E8 8097AC18 0C25E48F */  jal     func_8097923C              
/* 022EC 8097AC1C 8FA5001C */  lw      $a1, 0x001C($sp)           
/* 022F0 8097AC20 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 022F4 8097AC24 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 022F8 8097AC28 03E00008 */  jr      $ra                        
/* 022FC 8097AC2C 00000000 */  nop
