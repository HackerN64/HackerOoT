glabel func_809EF5A4
/* 00254 809EF5A4 3C038016 */  lui     $v1, %hi(gSaveContext)
/* 00258 809EF5A8 2463E660 */  addiu   $v1, %lo(gSaveContext)
/* 0025C 809EF5AC 3C0F8012 */  lui     $t7, %hi(gUpgradeMasks+0x1c)
/* 00260 809EF5B0 8DEF71CC */  lw      $t7, %lo(gUpgradeMasks+0x1c)($t7)
/* 00264 809EF5B4 8C6E00A0 */  lw      $t6, 0x00A0($v1)           ## 8015E700
/* 00268 809EF5B8 3C198012 */  lui     $t9, %hi(gUpgradeShifts+7)
/* 0026C 809EF5BC 933971FB */  lbu     $t9, %lo(gUpgradeShifts+7)($t9)
/* 00270 809EF5C0 01CFC024 */  and     $t8, $t6, $t7              
/* 00274 809EF5C4 3C028012 */  lui     $v0, %hi(gUpgradeCapacities+0x38)
/* 00278 809EF5C8 03384007 */  srav    $t0, $t8, $t9              
/* 0027C 809EF5CC 00084840 */  sll     $t1, $t0,  1               
/* 00280 809EF5D0 00491021 */  addu    $v0, $v0, $t1              
/* 00284 809EF5D4 94427234 */  lhu     $v0, %lo(gUpgradeCapacities+0x38)($v0)
/* 00288 809EF5D8 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 0028C 809EF5DC AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 00290 809EF5E0 10400009 */  beq     $v0, $zero, .L809EF608     
/* 00294 809EF5E4 3C0A8012 */  lui     $t2, %hi(gItemSlots+1)
/* 00298 809EF5E8 914A7465 */  lbu     $t2, %lo(gItemSlots+1)($t2)
/* 0029C 809EF5EC 006A5821 */  addu    $t3, $v1, $t2              
/* 002A0 809EF5F0 816C008C */  lb      $t4, 0x008C($t3)           ## 0000008C
/* 002A4 809EF5F4 0182082A */  slt     $at, $t4, $v0              
/* 002A8 809EF5F8 54200004 */  bnel    $at, $zero, .L809EF60C     
/* 002AC 809EF5FC 8C8E02C0 */  lw      $t6, 0x02C0($a0)           ## 000002C0
/* 002B0 809EF600 10000011 */  beq     $zero, $zero, .L809EF648   
/* 002B4 809EF604 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
.L809EF608:
/* 002B8 809EF608 8C8E02C0 */  lw      $t6, 0x02C0($a0)           ## 000002C0
.L809EF60C:
/* 002BC 809EF60C 846D0034 */  lh      $t5, 0x0034($v1)           ## 8015E694
/* 002C0 809EF610 85CF0000 */  lh      $t7, 0x0000($t6)           ## 00000000
/* 002C4 809EF614 01AF082A */  slt     $at, $t5, $t7              
/* 002C8 809EF618 10200003 */  beq     $at, $zero, .L809EF628     
/* 002CC 809EF61C 00000000 */  nop
/* 002D0 809EF620 10000009 */  beq     $zero, $zero, .L809EF648   
/* 002D4 809EF624 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L809EF628:
/* 002D8 809EF628 0C0218E2 */  jal     Item_CheckObtainability              
/* 002DC 809EF62C 24040001 */  addiu   $a0, $zero, 0x0001         ## $a0 = 00000001
/* 002E0 809EF630 240100FF */  addiu   $at, $zero, 0x00FF         ## $at = 000000FF
/* 002E4 809EF634 54410004 */  bnel    $v0, $at, .L809EF648       
/* 002E8 809EF638 24020004 */  addiu   $v0, $zero, 0x0004         ## $v0 = 00000004
/* 002EC 809EF63C 10000002 */  beq     $zero, $zero, .L809EF648   
/* 002F0 809EF640 24020002 */  addiu   $v0, $zero, 0x0002         ## $v0 = 00000002
/* 002F4 809EF644 24020004 */  addiu   $v0, $zero, 0x0004         ## $v0 = 00000004
.L809EF648:
/* 002F8 809EF648 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 002FC 809EF64C 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 00300 809EF650 03E00008 */  jr      $ra                        
/* 00304 809EF654 00000000 */  nop
