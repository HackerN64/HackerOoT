glabel func_80A3AB58
/* 00408 80A3AB58 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 0040C 80A3AB5C 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00410 80A3AB60 3C0E8012 */  lui     $t6, %hi(gBitFlags+0x4c)
/* 00414 80A3AB64 8DCE716C */  lw      $t6, %lo(gBitFlags+0x4c)($t6)
/* 00418 80A3AB68 8C4F00A4 */  lw      $t7, 0x00A4($v0)           ## 8015E704
/* 0041C 80A3AB6C AFA40000 */  sw      $a0, 0x0000($sp)           
/* 00420 80A3AB70 3C198012 */  lui     $t9, %hi(gItemSlots+2)
/* 00424 80A3AB74 01CFC024 */  and     $t8, $t6, $t7              
/* 00428 80A3AB78 17000003 */  bne     $t8, $zero, .L80A3AB88     
/* 0042C 80A3AB7C 3C0B8012 */  lui     $t3, %hi(gUpgradeMasks+4)
/* 00430 80A3AB80 03E00008 */  jr      $ra                        
/* 00434 80A3AB84 24020002 */  addiu   $v0, $zero, 0x0002         ## $v0 = 00000002
.L80A3AB88:
/* 00438 80A3AB88 8C4A00A0 */  lw      $t2, 0x00A0($v0)           ## 000000A2
/* 0043C 80A3AB8C 8D6B71B4 */  lw      $t3, %lo(gUpgradeMasks+4)($t3)
/* 00440 80A3AB90 3C0D8012 */  lui     $t5, %hi(gUpgradeShifts+1)
/* 00444 80A3AB94 91AD71F5 */  lbu     $t5, %lo(gUpgradeShifts+1)($t5)
/* 00448 80A3AB98 93397466 */  lbu     $t9, %lo(gItemSlots+2)($t9)
/* 0044C 80A3AB9C 014B6024 */  and     $t4, $t2, $t3              
/* 00450 80A3ABA0 01AC7007 */  srav    $t6, $t4, $t5              
/* 00454 80A3ABA4 000E7840 */  sll     $t7, $t6,  1               
/* 00458 80A3ABA8 3C188012 */  lui     $t8, %hi(gUpgradeCapacities+8)
/* 0045C 80A3ABAC 030FC021 */  addu    $t8, $t8, $t7              
/* 00460 80A3ABB0 00594021 */  addu    $t0, $v0, $t9              
/* 00464 80A3ABB4 8109008C */  lb      $t1, 0x008C($t0)           ## 0000008C
/* 00468 80A3ABB8 97187204 */  lhu     $t8, %lo(gUpgradeCapacities+8)($t8)
/* 0046C 80A3ABBC 0138082A */  slt     $at, $t1, $t8              
/* 00470 80A3ABC0 54200004 */  bnel    $at, $zero, .L80A3ABD4     
/* 00474 80A3ABC4 84590034 */  lh      $t9, 0x0034($v0)           ## 00000036
/* 00478 80A3ABC8 03E00008 */  jr      $ra                        
/* 0047C 80A3ABCC 24020002 */  addiu   $v0, $zero, 0x0002         ## $v0 = 00000002
.L80A3ABD0:
/* 00480 80A3ABD0 84590034 */  lh      $t9, 0x0034($v0)           ## 00000036
.L80A3ABD4:
/* 00484 80A3ABD4 84A801C8 */  lh      $t0, 0x01C8($a1)           ## 000001C8
/* 00488 80A3ABD8 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
/* 0048C 80A3ABDC 0328082A */  slt     $at, $t9, $t0              
/* 00490 80A3ABE0 10200003 */  beq     $at, $zero, .L80A3ABF0     
/* 00494 80A3ABE4 00000000 */  nop
/* 00498 80A3ABE8 03E00008 */  jr      $ra                        
/* 0049C 80A3ABEC 24020004 */  addiu   $v0, $zero, 0x0004         ## $v0 = 00000004
.L80A3ABF0:
/* 004A0 80A3ABF0 03E00008 */  jr      $ra                        
/* 004A4 80A3ABF4 00000000 */  nop
