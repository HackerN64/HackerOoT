glabel func_809EF658
/* 00308 809EF658 3C038016 */  lui     $v1, %hi(gSaveContext)
/* 0030C 809EF65C 2463E660 */  addiu   $v1, %lo(gSaveContext)
/* 00310 809EF660 3C0F8012 */  lui     $t7, %hi(gUpgradeMasks+0x18)
/* 00314 809EF664 8DEF71C8 */  lw      $t7, %lo(gUpgradeMasks+0x18)($t7)
/* 00318 809EF668 8C6E00A0 */  lw      $t6, 0x00A0($v1)           ## 8015E700
/* 0031C 809EF66C 3C198012 */  lui     $t9, %hi(gUpgradeShifts+6)
/* 00320 809EF670 933971FA */  lbu     $t9, %lo(gUpgradeShifts+6)($t9)
/* 00324 809EF674 01CFC024 */  and     $t8, $t6, $t7              
/* 00328 809EF678 3C028012 */  lui     $v0, %hi(gUpgradeCapacities+0x30)
/* 0032C 809EF67C 03384007 */  srav    $t0, $t8, $t9              
/* 00330 809EF680 00084840 */  sll     $t1, $t0,  1               
/* 00334 809EF684 00491021 */  addu    $v0, $v0, $t1              
/* 00338 809EF688 9442722C */  lhu     $v0, %lo(gUpgradeCapacities+0x30)($v0)
/* 0033C 809EF68C 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 00340 809EF690 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 00344 809EF694 10400009 */  beq     $v0, $zero, .L809EF6BC     
/* 00348 809EF698 3C0A8012 */  lui     $t2, %hi(gItemSlots)
/* 0034C 809EF69C 914A7464 */  lbu     $t2, %lo(gItemSlots)($t2)
/* 00350 809EF6A0 006A5821 */  addu    $t3, $v1, $t2              
/* 00354 809EF6A4 816C008C */  lb      $t4, 0x008C($t3)           ## 0000008C
/* 00358 809EF6A8 0182082A */  slt     $at, $t4, $v0              
/* 0035C 809EF6AC 54200004 */  bnel    $at, $zero, .L809EF6C0     
/* 00360 809EF6B0 8C8E02C0 */  lw      $t6, 0x02C0($a0)           ## 000002C0
/* 00364 809EF6B4 10000011 */  beq     $zero, $zero, .L809EF6FC   
/* 00368 809EF6B8 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
.L809EF6BC:
/* 0036C 809EF6BC 8C8E02C0 */  lw      $t6, 0x02C0($a0)           ## 000002C0
.L809EF6C0:
/* 00370 809EF6C0 846D0034 */  lh      $t5, 0x0034($v1)           ## 8015E694
/* 00374 809EF6C4 85CF0000 */  lh      $t7, 0x0000($t6)           ## 00000000
/* 00378 809EF6C8 01AF082A */  slt     $at, $t5, $t7              
/* 0037C 809EF6CC 10200003 */  beq     $at, $zero, .L809EF6DC     
/* 00380 809EF6D0 00000000 */  nop
/* 00384 809EF6D4 10000009 */  beq     $zero, $zero, .L809EF6FC   
/* 00388 809EF6D8 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L809EF6DC:
/* 0038C 809EF6DC 0C0218E2 */  jal     Item_CheckObtainability              
/* 00390 809EF6E0 00002025 */  or      $a0, $zero, $zero          ## $a0 = 00000000
/* 00394 809EF6E4 240100FF */  addiu   $at, $zero, 0x00FF         ## $at = 000000FF
/* 00398 809EF6E8 54410004 */  bnel    $v0, $at, .L809EF6FC       
/* 0039C 809EF6EC 24020004 */  addiu   $v0, $zero, 0x0004         ## $v0 = 00000004
/* 003A0 809EF6F0 10000002 */  beq     $zero, $zero, .L809EF6FC   
/* 003A4 809EF6F4 24020002 */  addiu   $v0, $zero, 0x0002         ## $v0 = 00000002
/* 003A8 809EF6F8 24020004 */  addiu   $v0, $zero, 0x0004         ## $v0 = 00000004
.L809EF6FC:
/* 003AC 809EF6FC 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 003B0 809EF700 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 003B4 809EF704 03E00008 */  jr      $ra                        
/* 003B8 809EF708 00000000 */  nop
