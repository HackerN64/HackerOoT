glabel func_80AFE428
/* 00178 80AFE428 8482001C */  lh      $v0, 0x001C($a0)           ## 0000001C
/* 0017C 80AFE42C 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 00180 80AFE430 10400008 */  beq     $v0, $zero, .L80AFE454     
/* 00184 80AFE434 00000000 */  nop
/* 00188 80AFE438 10410019 */  beq     $v0, $at, .L80AFE4A0       
/* 0018C 80AFE43C 240C003F */  addiu   $t4, $zero, 0x003F         ## $t4 = 0000003F
/* 00190 80AFE440 24010002 */  addiu   $at, $zero, 0x0002         ## $at = 00000002
/* 00194 80AFE444 10410016 */  beq     $v0, $at, .L80AFE4A0       
/* 00198 80AFE448 240E0036 */  addiu   $t6, $zero, 0x0036         ## $t6 = 00000036
/* 0019C 80AFE44C 03E00008 */  jr      $ra                        
/* 001A0 80AFE450 A08E0117 */  sb      $t6, 0x0117($a0)           ## 00000117
.L80AFE454:
/* 001A4 80AFE454 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 001A8 80AFE458 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 001AC 80AFE45C 944F0EF6 */  lhu     $t7, 0x0EF6($v0)           ## 8015F556
/* 001B0 80AFE460 24190041 */  addiu   $t9, $zero, 0x0041         ## $t9 = 00000041
/* 001B4 80AFE464 31F80200 */  andi    $t8, $t7, 0x0200           ## $t8 = 00000000
/* 001B8 80AFE468 53000004 */  beql    $t8, $zero, .L80AFE47C     
/* 001BC 80AFE46C 94480EF2 */  lhu     $t0, 0x0EF2($v0)           ## 8015F552
/* 001C0 80AFE470 03E00008 */  jr      $ra                        
/* 001C4 80AFE474 A0990117 */  sb      $t9, 0x0117($a0)           ## 00000117
.L80AFE478:
/* 001C8 80AFE478 94480EF2 */  lhu     $t0, 0x0EF2($v0)           ## 8015F552
.L80AFE47C:
/* 001CC 80AFE47C 240A0040 */  addiu   $t2, $zero, 0x0040         ## $t2 = 00000040
/* 001D0 80AFE480 240B003F */  addiu   $t3, $zero, 0x003F         ## $t3 = 0000003F
/* 001D4 80AFE484 31090040 */  andi    $t1, $t0, 0x0040           ## $t1 = 00000000
/* 001D8 80AFE488 11200003 */  beq     $t1, $zero, .L80AFE498     
/* 001DC 80AFE48C 00000000 */  nop
/* 001E0 80AFE490 03E00008 */  jr      $ra                        
/* 001E4 80AFE494 A08A0117 */  sb      $t2, 0x0117($a0)           ## 00000117
.L80AFE498:
/* 001E8 80AFE498 03E00008 */  jr      $ra                        
/* 001EC 80AFE49C A08B0117 */  sb      $t3, 0x0117($a0)           ## 00000117
.L80AFE4A0:
/* 001F0 80AFE4A0 A08C0117 */  sb      $t4, 0x0117($a0)           ## 00000117
/* 001F4 80AFE4A4 03E00008 */  jr      $ra                        
/* 001F8 80AFE4A8 00000000 */  nop
