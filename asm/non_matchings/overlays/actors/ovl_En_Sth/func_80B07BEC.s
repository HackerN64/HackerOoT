glabel func_80B07BEC
/* 006AC 80B07BEC 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 006B0 80B07BF0 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 006B4 80B07BF4 8482001C */  lh      $v0, 0x001C($a0)           ## 0000001C
/* 006B8 80B07BF8 3C0880B1 */  lui     $t0, %hi(D_80B0B490)       ## $t0 = 80B10000
/* 006BC 80B07BFC 24060001 */  addiu   $a2, $zero, 0x0001         ## $a2 = 00000001
/* 006C0 80B07C00 00027040 */  sll     $t6, $v0,  1               
/* 006C4 80B07C04 010E4021 */  addu    $t0, $t0, $t6              
/* 006C8 80B07C08 10C20003 */  beq     $a2, $v0, .L80B07C18       
/* 006CC 80B07C0C 9508B490 */  lhu     $t0, %lo(D_80B0B490)($t0)  
/* 006D0 80B07C10 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
/* 006D4 80B07C14 14410011 */  bne     $v0, $at, .L80B07C5C       
.L80B07C18:
/* 006D8 80B07C18 3C0F8016 */  lui     $t7, %hi(gSaveContext+0xa0)
/* 006DC 80B07C1C 3C188012 */  lui     $t8, %hi(gUpgradeMasks+0x10)
/* 006E0 80B07C20 8F1871C0 */  lw      $t8, %lo(gUpgradeMasks+0x10)($t8)
/* 006E4 80B07C24 8DEFE700 */  lw      $t7, %lo(gSaveContext+0xa0)($t7)
/* 006E8 80B07C28 3C098012 */  lui     $t1, %hi(gUpgradeShifts+4)
/* 006EC 80B07C2C 912971F8 */  lbu     $t1, %lo(gUpgradeShifts+4)($t1)
/* 006F0 80B07C30 01F8C824 */  and     $t9, $t7, $t8              
/* 006F4 80B07C34 01391807 */  srav    $v1, $t9, $t1              
/* 006F8 80B07C38 10600005 */  beq     $v1, $zero, .L80B07C50     
/* 006FC 80B07C3C 00000000 */  nop
/* 00700 80B07C40 50660006 */  beql    $v1, $a2, .L80B07C5C       
/* 00704 80B07C44 24080046 */  addiu   $t0, $zero, 0x0046         ## $t0 = 00000046
/* 00708 80B07C48 10000005 */  beq     $zero, $zero, .L80B07C60   
/* 0070C 80B07C4C 3C014248 */  lui     $at, 0x4248                ## $at = 42480000
.L80B07C50:
/* 00710 80B07C50 10000002 */  beq     $zero, $zero, .L80B07C5C   
/* 00714 80B07C54 24080045 */  addiu   $t0, $zero, 0x0045         ## $t0 = 00000045
/* 00718 80B07C58 24080046 */  addiu   $t0, $zero, 0x0046         ## $t0 = 00000046
.L80B07C5C:
/* 0071C 80B07C5C 3C014248 */  lui     $at, 0x4248                ## $at = 42480000
.L80B07C60:
/* 00720 80B07C60 44812000 */  mtc1    $at, $f4                   ## $f4 = 50.00
/* 00724 80B07C64 3C07461C */  lui     $a3, 0x461C                ## $a3 = 461C0000
/* 00728 80B07C68 34E74000 */  ori     $a3, $a3, 0x4000           ## $a3 = 461C4000
/* 0072C 80B07C6C 01003025 */  or      $a2, $t0, $zero            ## $a2 = 00000046
/* 00730 80B07C70 0C00BD0D */  jal     func_8002F434              
/* 00734 80B07C74 E7A40010 */  swc1    $f4, 0x0010($sp)           
/* 00738 80B07C78 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 0073C 80B07C7C 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
/* 00740 80B07C80 03E00008 */  jr      $ra                        
/* 00744 80B07C84 00000000 */  nop
