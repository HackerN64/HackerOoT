glabel func_809EF73C
/* 003EC 809EF73C 3C0E8012 */  lui     $t6, %hi(gItemSlots+6)
/* 003F0 809EF740 91CE746A */  lbu     $t6, %lo(gItemSlots+6)($t6)
/* 003F4 809EF744 3C038016 */  lui     $v1, %hi(gSaveContext)
/* 003F8 809EF748 2463E660 */  addiu   $v1, %lo(gSaveContext)
/* 003FC 809EF74C 006E1021 */  addu    $v0, $v1, $t6              
/* 00400 809EF750 904F0074 */  lbu     $t7, 0x0074($v0)           ## 00000074
/* 00404 809EF754 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 00408 809EF758 240100FF */  addiu   $at, $zero, 0x00FF         ## $at = 000000FF
/* 0040C 809EF75C 15E10003 */  bne     $t7, $at, .L809EF76C       
/* 00410 809EF760 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 00414 809EF764 10000022 */  beq     $zero, $zero, .L809EF7F0   
/* 00418 809EF768 24020003 */  addiu   $v0, $zero, 0x0003         ## $v0 = 00000003
.L809EF76C:
/* 0041C 809EF76C 3C088012 */  lui     $t0, %hi(gUpgradeMasks+0x14)
/* 00420 809EF770 8D0871C4 */  lw      $t0, %lo(gUpgradeMasks+0x14)($t0)
/* 00424 809EF774 8C7900A0 */  lw      $t9, 0x00A0($v1)           ## 8015E700
/* 00428 809EF778 3C0A8012 */  lui     $t2, %hi(gUpgradeShifts+5)
/* 0042C 809EF77C 914A71F9 */  lbu     $t2, %lo(gUpgradeShifts+5)($t2)
/* 00430 809EF780 03284824 */  and     $t1, $t9, $t0              
/* 00434 809EF784 3C0D8012 */  lui     $t5, %hi(gUpgradeCapacities+0x28)
/* 00438 809EF788 01495807 */  srav    $t3, $t1, $t2              
/* 0043C 809EF78C 000B6040 */  sll     $t4, $t3,  1               
/* 00440 809EF790 01AC6821 */  addu    $t5, $t5, $t4              
/* 00444 809EF794 95AD7224 */  lhu     $t5, %lo(gUpgradeCapacities+0x28)($t5)
/* 00448 809EF798 8058008C */  lb      $t8, 0x008C($v0)           ## 0000008F
/* 0044C 809EF79C 030D082A */  slt     $at, $t8, $t5              
/* 00450 809EF7A0 54200004 */  bnel    $at, $zero, .L809EF7B4     
/* 00454 809EF7A4 8C8F02C0 */  lw      $t7, 0x02C0($a0)           ## 000002C0
/* 00458 809EF7A8 10000011 */  beq     $zero, $zero, .L809EF7F0   
/* 0045C 809EF7AC 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
/* 00460 809EF7B0 8C8F02C0 */  lw      $t7, 0x02C0($a0)           ## 000002C0
.L809EF7B4:
/* 00464 809EF7B4 846E0034 */  lh      $t6, 0x0034($v1)           ## 8015E694
/* 00468 809EF7B8 85F90000 */  lh      $t9, 0x0000($t7)           ## 00000000
/* 0046C 809EF7BC 01D9082A */  slt     $at, $t6, $t9              
/* 00470 809EF7C0 10200003 */  beq     $at, $zero, .L809EF7D0     
/* 00474 809EF7C4 00000000 */  nop
/* 00478 809EF7C8 10000009 */  beq     $zero, $zero, .L809EF7F0   
/* 0047C 809EF7CC 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L809EF7D0:
/* 00480 809EF7D0 0C0218E2 */  jal     Item_CheckObtainability              
/* 00484 809EF7D4 24040058 */  addiu   $a0, $zero, 0x0058         ## $a0 = 00000058
/* 00488 809EF7D8 240100FF */  addiu   $at, $zero, 0x00FF         ## $at = 000000FF
/* 0048C 809EF7DC 54410004 */  bnel    $v0, $at, .L809EF7F0       
/* 00490 809EF7E0 24020004 */  addiu   $v0, $zero, 0x0004         ## $v0 = 00000004
/* 00494 809EF7E4 10000002 */  beq     $zero, $zero, .L809EF7F0   
/* 00498 809EF7E8 24020002 */  addiu   $v0, $zero, 0x0002         ## $v0 = 00000002
/* 0049C 809EF7EC 24020004 */  addiu   $v0, $zero, 0x0004         ## $v0 = 00000004
.L809EF7F0:
/* 004A0 809EF7F0 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 004A4 809EF7F4 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 004A8 809EF7F8 03E00008 */  jr      $ra                        
/* 004AC 809EF7FC 00000000 */  nop
