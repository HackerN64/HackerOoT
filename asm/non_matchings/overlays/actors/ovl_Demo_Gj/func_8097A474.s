glabel func_8097A474
/* 01B44 8097A474 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 01B48 8097A478 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 01B4C 8097A47C AFA5001C */  sw      $a1, 0x001C($sp)           
/* 01B50 8097A480 0C00B638 */  jal     Actor_MoveForward
              
/* 01B54 8097A484 AFA40018 */  sw      $a0, 0x0018($sp)           
/* 01B58 8097A488 3C028016 */  lui     $v0, %hi(gGameInfo)
/* 01B5C 8097A48C 2442FA90 */  addiu   $v0, %lo(gGameInfo)
/* 01B60 8097A490 8FA40018 */  lw      $a0, 0x0018($sp)           
/* 01B64 8097A494 8C4F0000 */  lw      $t7, 0x0000($v0)           ## 8015FA90
/* 01B68 8097A498 848E016C */  lh      $t6, 0x016C($a0)           ## 0000016C
/* 01B6C 8097A49C 85F814AC */  lh      $t8, 0x14AC($t7)           ## 000014AC
/* 01B70 8097A4A0 8488016E */  lh      $t0, 0x016E($a0)           ## 0000016E
/* 01B74 8097A4A4 01D8C821 */  addu    $t9, $t6, $t8              
/* 01B78 8097A4A8 A499016C */  sh      $t9, 0x016C($a0)           ## 0000016C
/* 01B7C 8097A4AC 8C490000 */  lw      $t1, 0x0000($v0)           ## 8015FA90
/* 01B80 8097A4B0 848E0170 */  lh      $t6, 0x0170($a0)           ## 00000170
/* 01B84 8097A4B4 852A14AE */  lh      $t2, 0x14AE($t1)           ## 000014AE
/* 01B88 8097A4B8 254D03E8 */  addiu   $t5, $t2, 0x03E8           ## $t5 = 000003E8
/* 01B8C 8097A4BC 010D7821 */  addu    $t7, $t0, $t5              
/* 01B90 8097A4C0 A48F016E */  sh      $t7, 0x016E($a0)           ## 0000016E
/* 01B94 8097A4C4 8C580000 */  lw      $t8, 0x0000($v0)           ## 8015FA90
/* 01B98 8097A4C8 871914B0 */  lh      $t9, 0x14B0($t8)           ## 000014B0
/* 01B9C 8097A4CC 272B0BB8 */  addiu   $t3, $t9, 0x0BB8           ## $t3 = 00000BB8
/* 01BA0 8097A4D0 01CB6021 */  addu    $t4, $t6, $t3              
/* 01BA4 8097A4D4 A48C0170 */  sh      $t4, 0x0170($a0)           ## 00000170
/* 01BA8 8097A4D8 0C25E48F */  jal     func_8097923C              
/* 01BAC 8097A4DC 8FA5001C */  lw      $a1, 0x001C($sp)           
/* 01BB0 8097A4E0 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 01BB4 8097A4E4 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 01BB8 8097A4E8 03E00008 */  jr      $ra                        
/* 01BBC 8097A4EC 00000000 */  nop
