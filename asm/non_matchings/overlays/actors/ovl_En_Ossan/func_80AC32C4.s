glabel func_80AC32C4
/* 00624 80AC32C4 3C028016 */  lui     $v0, %hi(gSaveContext+0xef6)
/* 00628 80AC32C8 9442F556 */  lhu     $v0, %lo(gSaveContext+0xef6)($v0)
/* 0062C 80AC32CC 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 00630 80AC32D0 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 00634 80AC32D4 304E0100 */  andi    $t6, $v0, 0x0100           ## $t6 = 00000000
/* 00638 80AC32D8 11C0000B */  beq     $t6, $zero, .L80AC3308     
/* 0063C 80AC32DC 304F0200 */  andi    $t7, $v0, 0x0200           ## $t7 = 00000000
/* 00640 80AC32E0 11E00009 */  beq     $t7, $zero, .L80AC3308     
/* 00644 80AC32E4 30580400 */  andi    $t8, $v0, 0x0400           ## $t8 = 00000000
/* 00648 80AC32E8 13000007 */  beq     $t8, $zero, .L80AC3308     
/* 0064C 80AC32EC 30590800 */  andi    $t9, $v0, 0x0800           ## $t9 = 00000000
/* 00650 80AC32F0 53200006 */  beql    $t9, $zero, .L80AC330C     
/* 00654 80AC32F4 3C020001 */  lui     $v0, 0x0001                ## $v0 = 00010000
/* 00658 80AC32F8 0C042DC8 */  jal     func_8010B720              
/* 0065C 80AC32FC 240570AE */  addiu   $a1, $zero, 0x70AE         ## $a1 = 000070AE
/* 00660 80AC3300 10000010 */  beq     $zero, $zero, .L80AC3344   
/* 00664 80AC3304 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L80AC3308:
/* 00668 80AC3308 3C020001 */  lui     $v0, 0x0001                ## $v0 = 00010000
.L80AC330C:
/* 0066C 80AC330C 00441021 */  addu    $v0, $v0, $a0              
/* 00670 80AC3310 904204BD */  lbu     $v0, 0x04BD($v0)           ## 000104BD
/* 00674 80AC3314 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 00678 80AC3318 10400007 */  beq     $v0, $zero, .L80AC3338     
/* 0067C 80AC331C 00000000 */  nop
/* 00680 80AC3320 54410008 */  bnel    $v0, $at, .L80AC3344       
/* 00684 80AC3324 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 00688 80AC3328 0C042DC8 */  jal     func_8010B720              
/* 0068C 80AC332C 240570A4 */  addiu   $a1, $zero, 0x70A4         ## $a1 = 000070A4
/* 00690 80AC3330 10000004 */  beq     $zero, $zero, .L80AC3344   
/* 00694 80AC3334 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L80AC3338:
/* 00698 80AC3338 0C042DC8 */  jal     func_8010B720              
/* 0069C 80AC333C 240570A3 */  addiu   $a1, $zero, 0x70A3         ## $a1 = 000070A3
/* 006A0 80AC3340 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L80AC3344:
/* 006A4 80AC3344 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 006A8 80AC3348 03E00008 */  jr      $ra                        
/* 006AC 80AC334C 00000000 */  nop
