glabel func_80A1C830
/* 01E90 80A1C830 240E000C */  addiu   $t6, $zero, 0x000C         ## $t6 = 0000000C
/* 01E94 80A1C834 3C0180A2 */  lui     $at, %hi(D_80A1CFF0)       ## $at = 80A20000
/* 01E98 80A1C838 AFA50004 */  sw      $a1, 0x0004($sp)           
/* 01E9C 80A1C83C A02ECFF0 */  sb      $t6, %lo(D_80A1CFF0)($at)  
/* 01EA0 80A1C840 90820382 */  lbu     $v0, 0x0382($a0)           ## 00000382
/* 01EA4 80A1C844 3C0F80A2 */  lui     $t7, %hi(func_80A1C944)    ## $t7 = 80A20000
/* 01EA8 80A1C848 25EFC944 */  addiu   $t7, $t7, %lo(func_80A1C944) ## $t7 = 80A1C944
/* 01EAC 80A1C84C AC8F0354 */  sw      $t7, 0x0354($a0)           ## 00000354
/* 01EB0 80A1C850 AC800388 */  sw      $zero, 0x0388($a0)         ## 00000388
/* 01EB4 80A1C854 04400014 */  bltz    $v0, .L80A1C8A8            
/* 01EB8 80A1C858 00401825 */  or      $v1, $v0, $zero            ## $v1 = 00000000
/* 01EBC 80A1C85C 28610005 */  slti    $at, $v1, 0x0005           
/* 01EC0 80A1C860 10200011 */  beq     $at, $zero, .L80A1C8A8     
/* 01EC4 80A1C864 3C068016 */  lui     $a2, %hi(gSaveContext)
/* 01EC8 80A1C868 0002C040 */  sll     $t8, $v0,  1               
/* 01ECC 80A1C86C 3C0380A2 */  lui     $v1, %hi(D_80A1D008)       ## $v1 = 80A20000
/* 01ED0 80A1C870 24C6E660 */  addiu   $a2, %lo(gSaveContext)
/* 01ED4 80A1C874 00781821 */  addu    $v1, $v1, $t8              
/* 01ED8 80A1C878 9463D008 */  lhu     $v1, %lo(D_80A1D008)($v1)  
/* 01EDC 80A1C87C 94C50EEE */  lhu     $a1, 0x0EEE($a2)           ## 8015F54E
/* 01EE0 80A1C880 24090055 */  addiu   $t1, $zero, 0x0055         ## $t1 = 00000055
/* 01EE4 80A1C884 0065C824 */  and     $t9, $v1, $a1              
/* 01EE8 80A1C888 17200004 */  bne     $t9, $zero, .L80A1C89C     
/* 01EEC 80A1C88C 00A34025 */  or      $t0, $a1, $v1              ## $t0 = 80A20000
/* 01EF0 80A1C890 A4C80EEE */  sh      $t0, 0x0EEE($a2)           ## 8015F54E
/* 01EF4 80A1C894 03E00008 */  jr      $ra                        
/* 01EF8 80A1C898 AC890388 */  sw      $t1, 0x0388($a0)           ## 00000388
.L80A1C89C:
/* 01EFC 80A1C89C 240A004D */  addiu   $t2, $zero, 0x004D         ## $t2 = 0000004D
/* 01F00 80A1C8A0 03E00008 */  jr      $ra                        
/* 01F04 80A1C8A4 AC8A0388 */  sw      $t2, 0x0388($a0)           ## 00000388
.L80A1C8A8:
/* 01F08 80A1C8A8 24010005 */  addiu   $at, $zero, 0x0005         ## $at = 00000005
/* 01F0C 80A1C8AC 14610011 */  bne     $v1, $at, .L80A1C8F4       
/* 01F10 80A1C8B0 3C068016 */  lui     $a2, %hi(gSaveContext)
/* 01F14 80A1C8B4 00025840 */  sll     $t3, $v0,  1               
/* 01F18 80A1C8B8 3C0380A2 */  lui     $v1, %hi(D_80A1D008)       ## $v1 = 80A20000
/* 01F1C 80A1C8BC 24C6E660 */  addiu   $a2, %lo(gSaveContext)
/* 01F20 80A1C8C0 006B1821 */  addu    $v1, $v1, $t3              
/* 01F24 80A1C8C4 9463D008 */  lhu     $v1, %lo(D_80A1D008)($v1)  
/* 01F28 80A1C8C8 94C50EEE */  lhu     $a1, 0x0EEE($a2)           ## 8015F54E
/* 01F2C 80A1C8CC 240E003E */  addiu   $t6, $zero, 0x003E         ## $t6 = 0000003E
/* 01F30 80A1C8D0 00656024 */  and     $t4, $v1, $a1              
/* 01F34 80A1C8D4 15800004 */  bne     $t4, $zero, .L80A1C8E8     
/* 01F38 80A1C8D8 00A36825 */  or      $t5, $a1, $v1              ## $t5 = 80A20000
/* 01F3C 80A1C8DC A4CD0EEE */  sh      $t5, 0x0EEE($a2)           ## 8015F54E
/* 01F40 80A1C8E0 03E00008 */  jr      $ra                        
/* 01F44 80A1C8E4 AC8E0388 */  sw      $t6, 0x0388($a0)           ## 00000388
.L80A1C8E8:
/* 01F48 80A1C8E8 240F004D */  addiu   $t7, $zero, 0x004D         ## $t7 = 0000004D
/* 01F4C 80A1C8EC 03E00008 */  jr      $ra                        
/* 01F50 80A1C8F0 AC8F0388 */  sw      $t7, 0x0388($a0)           ## 00000388
.L80A1C8F4:
/* 01F54 80A1C8F4 24010006 */  addiu   $at, $zero, 0x0006         ## $at = 00000006
/* 01F58 80A1C8F8 14610010 */  bne     $v1, $at, .L80A1C93C       
/* 01F5C 80A1C8FC 3C068016 */  lui     $a2, %hi(gSaveContext)
/* 01F60 80A1C900 0002C040 */  sll     $t8, $v0,  1               
/* 01F64 80A1C904 3C0380A2 */  lui     $v1, %hi(D_80A1D008)       ## $v1 = 80A20000
/* 01F68 80A1C908 24C6E660 */  addiu   $a2, %lo(gSaveContext)
/* 01F6C 80A1C90C 00781821 */  addu    $v1, $v1, $t8              
/* 01F70 80A1C910 9463D008 */  lhu     $v1, %lo(D_80A1D008)($v1)  
/* 01F74 80A1C914 94C50EEE */  lhu     $a1, 0x0EEE($a2)           ## 8015F54E
/* 01F78 80A1C918 2409003E */  addiu   $t1, $zero, 0x003E         ## $t1 = 0000003E
/* 01F7C 80A1C91C 0065C824 */  and     $t9, $v1, $a1              
/* 01F80 80A1C920 17200004 */  bne     $t9, $zero, .L80A1C934     
/* 01F84 80A1C924 00A34025 */  or      $t0, $a1, $v1              ## $t0 = 80A20000
/* 01F88 80A1C928 A4C80EEE */  sh      $t0, 0x0EEE($a2)           ## 8015F54E
/* 01F8C 80A1C92C 03E00008 */  jr      $ra                        
/* 01F90 80A1C930 AC890388 */  sw      $t1, 0x0388($a0)           ## 00000388
.L80A1C934:
/* 01F94 80A1C934 240A0055 */  addiu   $t2, $zero, 0x0055         ## $t2 = 00000055
/* 01F98 80A1C938 AC8A0388 */  sw      $t2, 0x0388($a0)           ## 00000388
.L80A1C93C:
/* 01F9C 80A1C93C 03E00008 */  jr      $ra                        
/* 01FA0 80A1C940 00000000 */  nop
