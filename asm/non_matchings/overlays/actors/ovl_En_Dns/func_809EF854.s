glabel func_809EF854
/* 00504 809EF854 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00508 809EF858 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 0050C 809EF85C 3C0E8012 */  lui     $t6, %hi(gBitFlags+0x4c)
/* 00510 809EF860 8DCE716C */  lw      $t6, %lo(gBitFlags+0x4c)($t6)
/* 00514 809EF864 8C4F00A4 */  lw      $t7, 0x00A4($v0)           ## 8015E704
/* 00518 809EF868 3C198012 */  lui     $t9, %hi(gItemSlots+2)
/* 0051C 809EF86C 3C0B8012 */  lui     $t3, %hi(gUpgradeMasks+4)
/* 00520 809EF870 01CFC024 */  and     $t8, $t6, $t7              
/* 00524 809EF874 17000003 */  bne     $t8, $zero, .L809EF884     
/* 00528 809EF878 3C0D8012 */  lui     $t5, %hi(gUpgradeShifts+1)
/* 0052C 809EF87C 03E00008 */  jr      $ra                        
/* 00530 809EF880 24020003 */  addiu   $v0, $zero, 0x0003         ## $v0 = 00000003
.L809EF884:
/* 00534 809EF884 8C4A00A0 */  lw      $t2, 0x00A0($v0)           ## 000000A3
/* 00538 809EF888 8D6B71B4 */  lw      $t3, %lo(gUpgradeMasks+4)($t3)
/* 0053C 809EF88C 91AD71F5 */  lbu     $t5, %lo(gUpgradeShifts+1)($t5)
/* 00540 809EF890 93397466 */  lbu     $t9, %lo(gItemSlots+2)($t9)
/* 00544 809EF894 014B6024 */  and     $t4, $t2, $t3              
/* 00548 809EF898 01AC7007 */  srav    $t6, $t4, $t5              
/* 0054C 809EF89C 000E7840 */  sll     $t7, $t6,  1               
/* 00550 809EF8A0 3C188012 */  lui     $t8, %hi(gUpgradeCapacities+8)
/* 00554 809EF8A4 030FC021 */  addu    $t8, $t8, $t7              
/* 00558 809EF8A8 00594021 */  addu    $t0, $v0, $t9              
/* 0055C 809EF8AC 8109008C */  lb      $t1, 0x008C($t0)           ## 0000008C
/* 00560 809EF8B0 97187204 */  lhu     $t8, %lo(gUpgradeCapacities+8)($t8)
/* 00564 809EF8B4 0138082A */  slt     $at, $t1, $t8              
/* 00568 809EF8B8 54200004 */  bnel    $at, $zero, .L809EF8CC     
/* 0056C 809EF8BC 8C8802C0 */  lw      $t0, 0x02C0($a0)           ## 000002C0
/* 00570 809EF8C0 03E00008 */  jr      $ra                        
/* 00574 809EF8C4 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
.L809EF8C8:
/* 00578 809EF8C8 8C8802C0 */  lw      $t0, 0x02C0($a0)           ## 000002C0
.L809EF8CC:
/* 0057C 809EF8CC 84590034 */  lh      $t9, 0x0034($v0)           ## 00000035
/* 00580 809EF8D0 24020004 */  addiu   $v0, $zero, 0x0004         ## $v0 = 00000004
/* 00584 809EF8D4 850A0000 */  lh      $t2, 0x0000($t0)           ## 00000000
/* 00588 809EF8D8 032A082A */  slt     $at, $t9, $t2              
/* 0058C 809EF8DC 10200003 */  beq     $at, $zero, .L809EF8EC     
/* 00590 809EF8E0 00000000 */  nop
/* 00594 809EF8E4 03E00008 */  jr      $ra                        
/* 00598 809EF8E8 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L809EF8EC:
/* 0059C 809EF8EC 03E00008 */  jr      $ra                        
/* 005A0 809EF8F0 00000000 */  nop
