glabel func_80AA2EC8
/* 00428 80AA2EC8 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 0042C 80AA2ECC 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00430 80AA2ED0 8C4E0004 */  lw      $t6, 0x0004($v0)           ## 8015E664
/* 00434 80AA2ED4 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 00438 80AA2ED8 AFA40000 */  sw      $a0, 0x0000($sp)           
/* 0043C 80AA2EDC 15C10003 */  bne     $t6, $at, .L80AA2EEC       
/* 00440 80AA2EE0 AFA50004 */  sw      $a1, 0x0004($sp)           
/* 00444 80AA2EE4 03E00008 */  jr      $ra                        
/* 00448 80AA2EE8 24020002 */  addiu   $v0, $zero, 0x0002         ## $v0 = 00000002
.L80AA2EEC:
/* 0044C 80AA2EEC 944F0ED6 */  lhu     $t7, 0x0ED6($v0)           ## 00000ED8
/* 00450 80AA2EF0 31F80100 */  andi    $t8, $t7, 0x0100           ## $t8 = 00000000
/* 00454 80AA2EF4 57000004 */  bnel    $t8, $zero, .L80AA2F08     
/* 00458 80AA2EF8 945913FA */  lhu     $t9, 0x13FA($v0)           ## 000013FC
/* 0045C 80AA2EFC 03E00008 */  jr      $ra                        
/* 00460 80AA2F00 24020002 */  addiu   $v0, $zero, 0x0002         ## $v0 = 00000002
.L80AA2F04:
/* 00464 80AA2F04 945913FA */  lhu     $t9, 0x13FA($v0)           ## 000013FC
.L80AA2F08:
/* 00468 80AA2F08 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
/* 0046C 80AA2F0C 33280400 */  andi    $t0, $t9, 0x0400           ## $t0 = 00000000
/* 00470 80AA2F10 11000003 */  beq     $t0, $zero, .L80AA2F20     
/* 00474 80AA2F14 00000000 */  nop
/* 00478 80AA2F18 03E00008 */  jr      $ra                        
/* 0047C 80AA2F1C 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
.L80AA2F20:
/* 00480 80AA2F20 03E00008 */  jr      $ra                        
/* 00484 80AA2F24 00000000 */  nop
