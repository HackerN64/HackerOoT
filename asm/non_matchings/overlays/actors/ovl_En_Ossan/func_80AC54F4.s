glabel func_80AC54F4
/* 02854 80AC54F4 3C038016 */  lui     $v1, %hi(gSaveContext)
/* 02858 80AC54F8 2463E660 */  addiu   $v1, %lo(gSaveContext)
/* 0285C 80AC54FC 8C6E0004 */  lw      $t6, 0x0004($v1)           ## 8015E664
/* 02860 80AC5500 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 02864 80AC5504 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 02868 80AC5508 11C00003 */  beq     $t6, $zero, .L80AC5518     
/* 0286C 80AC550C 24010005 */  addiu   $at, $zero, 0x0005         ## $at = 00000005
/* 02870 80AC5510 10000002 */  beq     $zero, $zero, .L80AC551C   
/* 02874 80AC5514 24020005 */  addiu   $v0, $zero, 0x0005         ## $v0 = 00000005
.L80AC5518:
/* 02878 80AC5518 24020011 */  addiu   $v0, $zero, 0x0011         ## $v0 = 00000011
.L80AC551C:
/* 0287C 80AC551C 14410017 */  bne     $v0, $at, .L80AC557C       
/* 02880 80AC5520 00000000 */  nop
/* 02884 80AC5524 946F0ED8 */  lhu     $t7, 0x0ED8($v1)           ## 8015F538
/* 02888 80AC5528 31F80020 */  andi    $t8, $t7, 0x0020           ## $t8 = 00000000
/* 0288C 80AC552C 1700000F */  bne     $t8, $zero, .L80AC556C     
/* 02890 80AC5530 00000000 */  nop
/* 02894 80AC5534 94790F16 */  lhu     $t9, 0x0F16($v1)           ## 8015F576
/* 02898 80AC5538 24090013 */  addiu   $t1, $zero, 0x0013         ## $t1 = 00000013
/* 0289C 80AC553C 33281000 */  andi    $t0, $t9, 0x1000           ## $t0 = 00000000
/* 028A0 80AC5540 51000006 */  beql    $t0, $zero, .L80AC555C     
/* 028A4 80AC5544 ACA00288 */  sw      $zero, 0x0288($a1)         ## 00000288
/* 028A8 80AC5548 0C2B13EB */  jal     func_80AC4FAC              
/* 028AC 80AC554C 2406302E */  addiu   $a2, $zero, 0x302E         ## $a2 = 0000302E
/* 028B0 80AC5550 1000000D */  beq     $zero, $zero, .L80AC5588   
/* 028B4 80AC5554 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 028B8 80AC5558 ACA00288 */  sw      $zero, 0x0288($a1)         ## 00000288
.L80AC555C:
/* 028BC 80AC555C ACA002C0 */  sw      $zero, 0x02C0($a1)         ## 000002C0
/* 028C0 80AC5560 A0A00251 */  sb      $zero, 0x0251($a1)         ## 00000251
/* 028C4 80AC5564 10000007 */  beq     $zero, $zero, .L80AC5584   
/* 028C8 80AC5568 A4A901FC */  sh      $t1, 0x01FC($a1)           ## 000001FC
.L80AC556C:
/* 028CC 80AC556C 0C2B14FD */  jal     func_80AC53F4              
/* 028D0 80AC5570 00000000 */  nop
/* 028D4 80AC5574 10000004 */  beq     $zero, $zero, .L80AC5588   
/* 028D8 80AC5578 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L80AC557C:
/* 028DC 80AC557C 0C2B14FD */  jal     func_80AC53F4              
/* 028E0 80AC5580 00000000 */  nop
.L80AC5584:
/* 028E4 80AC5584 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L80AC5588:
/* 028E8 80AC5588 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 028EC 80AC558C 03E00008 */  jr      $ra                        
/* 028F0 80AC5590 00000000 */  nop
