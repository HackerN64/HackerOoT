.rdata
glabel D_80B116E8
    .asciz "\x1b[32m☆☆☆☆☆ Equip_Pachinko ☆☆☆☆☆ %d\n\x1b[m"
    .balign 4

glabel D_80B1171C
    .asciz "\x1b[32m☆☆☆☆☆ Equip_Bow ☆☆☆☆☆ %d\n\x1b[m"
    .balign 4

.text
glabel func_80B10EB0
/* 00640 80B10EB0 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 00644 80B10EB4 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 00648 80B10EB8 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 0064C 80B10EBC AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 00650 80B10EC0 AFA5002C */  sw      $a1, 0x002C($sp)           
/* 00654 80B10EC4 0C02927F */  jal     SkelAnime_FrameUpdateMatrix
              
/* 00658 80B10EC8 2484014C */  addiu   $a0, $a0, 0x014C           ## $a0 = 0000014C
/* 0065C 80B10ECC 8FA4002C */  lw      $a0, 0x002C($sp)           
/* 00660 80B10ED0 0C042F6F */  jal     func_8010BDBC              
/* 00664 80B10ED4 248420D8 */  addiu   $a0, $a0, 0x20D8           ## $a0 = 000020D8
/* 00668 80B10ED8 860E0212 */  lh      $t6, 0x0212($s0)           ## 00000212
/* 0066C 80B10EDC 55C2009D */  bnel    $t6, $v0, .L80B11154       
/* 00670 80B10EE0 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 00674 80B10EE4 0C041AF2 */  jal     func_80106BC8              
/* 00678 80B10EE8 8FA4002C */  lw      $a0, 0x002C($sp)           
/* 0067C 80B10EEC 50400099 */  beql    $v0, $zero, .L80B11154     
/* 00680 80B10EF0 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 00684 80B10EF4 860F0214 */  lh      $t7, 0x0214($s0)           ## 00000214
/* 00688 80B10EF8 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
/* 0068C 80B10EFC 8FA4002C */  lw      $a0, 0x002C($sp)           
/* 00690 80B10F00 11E10005 */  beq     $t7, $at, .L80B10F18       
/* 00694 80B10F04 00000000 */  nop
/* 00698 80B10F08 0C0200FC */  jal     func_800803F0              
/* 0069C 80B10F0C 86050228 */  lh      $a1, 0x0228($s0)           ## 00000228
/* 006A0 80B10F10 2418FFFF */  addiu   $t8, $zero, 0xFFFF         ## $t8 = FFFFFFFF
/* 006A4 80B10F14 A6180228 */  sh      $t8, 0x0228($s0)           ## 00000228
.L80B10F18:
/* 006A8 80B10F18 0C041B33 */  jal     func_80106CCC              
/* 006AC 80B10F1C 8FA4002C */  lw      $a0, 0x002C($sp)           
/* 006B0 80B10F20 8E040118 */  lw      $a0, 0x0118($s0)           ## 00000118
/* 006B4 80B10F24 24080003 */  addiu   $t0, $zero, 0x0003         ## $t0 = 00000003
/* 006B8 80B10F28 8C990130 */  lw      $t9, 0x0130($a0)           ## 00000130
/* 006BC 80B10F2C 53200089 */  beql    $t9, $zero, .L80B11154     
/* 006C0 80B10F30 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 006C4 80B10F34 A4880154 */  sh      $t0, 0x0154($a0)           ## 00000154
/* 006C8 80B10F38 86030214 */  lh      $v1, 0x0214($s0)           ## 00000214
/* 006CC 80B10F3C 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 006D0 80B10F40 A6000210 */  sh      $zero, 0x0210($s0)         ## 00000210
/* 006D4 80B10F44 10610005 */  beq     $v1, $at, .L80B10F5C       
/* 006D8 80B10F48 24010002 */  addiu   $at, $zero, 0x0002         ## $at = 00000002
/* 006DC 80B10F4C 10610060 */  beq     $v1, $at, .L80B110D0       
/* 006E0 80B10F50 240A0014 */  addiu   $t2, $zero, 0x0014         ## $t2 = 00000014
/* 006E4 80B10F54 10000066 */  beq     $zero, $zero, .L80B110F0   
/* 006E8 80B10F58 24010004 */  addiu   $at, $zero, 0x0004         ## $at = 00000004
.L80B10F5C:
/* 006EC 80B10F5C 8E090118 */  lw      $t1, 0x0118($s0)           ## 00000118
/* 006F0 80B10F60 3C038016 */  lui     $v1, %hi(gSaveContext)
/* 006F4 80B10F64 2463E660 */  addiu   $v1, %lo(gSaveContext)
/* 006F8 80B10F68 AE000118 */  sw      $zero, 0x0118($s0)         ## 00000118
/* 006FC 80B10F6C AE090220 */  sw      $t1, 0x0220($s0)           ## 00000220
/* 00700 80B10F70 8C6A0004 */  lw      $t2, 0x0004($v1)           ## 8015E664
/* 00704 80B10F74 51400023 */  beql    $t2, $zero, .L80B11004     
/* 00708 80B10F78 946F0EF0 */  lhu     $t7, 0x0EF0($v1)           ## 8015F550
/* 0070C 80B10F7C 946B0EF0 */  lhu     $t3, 0x0EF0($v1)           ## 8015F550
/* 00710 80B10F80 3C0480B1 */  lui     $a0, %hi(D_80B116E8)       ## $a0 = 80B10000
/* 00714 80B10F84 248416E8 */  addiu   $a0, $a0, %lo(D_80B116E8)  ## $a0 = 80B116E8
/* 00718 80B10F88 316C2000 */  andi    $t4, $t3, 0x2000           ## $t4 = 00000000
/* 0071C 80B10F8C 1580001A */  bne     $t4, $zero, .L80B10FF8     
/* 00720 80B10F90 240E0055 */  addiu   $t6, $zero, 0x0055         ## $t6 = 00000055
/* 00724 80B10F94 3C0E8012 */  lui     $t6, %hi(gUpgradeMasks+0x14)
/* 00728 80B10F98 8DCE71C4 */  lw      $t6, %lo(gUpgradeMasks+0x14)($t6)
/* 0072C 80B10F9C 8C6D00A0 */  lw      $t5, 0x00A0($v1)           ## 8015E700
/* 00730 80B10FA0 3C188012 */  lui     $t8, %hi(gUpgradeShifts+5)
/* 00734 80B10FA4 931871F9 */  lbu     $t8, %lo(gUpgradeShifts+5)($t8)
/* 00738 80B10FA8 01AE7824 */  and     $t7, $t5, $t6              
/* 0073C 80B10FAC 0C00084C */  jal     osSyncPrintf
              
/* 00740 80B10FB0 030F2807 */  srav    $a1, $t7, $t8              
/* 00744 80B10FB4 3C038016 */  lui     $v1, %hi(gSaveContext)
/* 00748 80B10FB8 2463E660 */  addiu   $v1, %lo(gSaveContext)
/* 0074C 80B10FBC 3C088012 */  lui     $t0, %hi(gUpgradeMasks+0x14)
/* 00750 80B10FC0 8D0871C4 */  lw      $t0, %lo(gUpgradeMasks+0x14)($t0)
/* 00754 80B10FC4 8C7900A0 */  lw      $t9, 0x00A0($v1)           ## 8015E700
/* 00758 80B10FC8 3C0A8012 */  lui     $t2, %hi(gUpgradeShifts+5)
/* 0075C 80B10FCC 914A71F9 */  lbu     $t2, %lo(gUpgradeShifts+5)($t2)
/* 00760 80B10FD0 03284824 */  and     $t1, $t9, $t0              
/* 00764 80B10FD4 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 00768 80B10FD8 01495807 */  srav    $t3, $t1, $t2              
/* 0076C 80B10FDC 15610004 */  bne     $t3, $at, .L80B10FF0       
/* 00770 80B10FE0 240D007B */  addiu   $t5, $zero, 0x007B         ## $t5 = 0000007B
/* 00774 80B10FE4 240C0060 */  addiu   $t4, $zero, 0x0060         ## $t4 = 00000060
/* 00778 80B10FE8 1000002D */  beq     $zero, $zero, .L80B110A0   
/* 0077C 80B10FEC AE0C0218 */  sw      $t4, 0x0218($s0)           ## 00000218
.L80B10FF0:
/* 00780 80B10FF0 1000002B */  beq     $zero, $zero, .L80B110A0   
/* 00784 80B10FF4 AE0D0218 */  sw      $t5, 0x0218($s0)           ## 00000218
.L80B10FF8:
/* 00788 80B10FF8 10000029 */  beq     $zero, $zero, .L80B110A0   
/* 0078C 80B10FFC AE0E0218 */  sw      $t6, 0x0218($s0)           ## 00000218
/* 00790 80B11000 946F0EF0 */  lhu     $t7, 0x0EF0($v1)           ## 8015F550
.L80B11004:
/* 00794 80B11004 3C0480B1 */  lui     $a0, %hi(D_80B1171C)       ## $a0 = 80B10000
/* 00798 80B11008 2484171C */  addiu   $a0, $a0, %lo(D_80B1171C)  ## $a0 = 80B1171C
/* 0079C 80B1100C 31F84000 */  andi    $t8, $t7, 0x4000           ## $t8 = 00000000
/* 007A0 80B11010 17000022 */  bne     $t8, $zero, .L80B1109C     
/* 007A4 80B11014 24080055 */  addiu   $t0, $zero, 0x0055         ## $t0 = 00000055
/* 007A8 80B11018 3C088012 */  lui     $t0, %hi(gUpgradeMasks)
/* 007AC 80B1101C 8D0871B0 */  lw      $t0, %lo(gUpgradeMasks)($t0)
/* 007B0 80B11020 8C7900A0 */  lw      $t9, 0x00A0($v1)           ## 8015E700
/* 007B4 80B11024 3C0A8012 */  lui     $t2, %hi(gUpgradeShifts)
/* 007B8 80B11028 914A71F4 */  lbu     $t2, %lo(gUpgradeShifts)($t2)
/* 007BC 80B1102C 03284824 */  and     $t1, $t9, $t0              
/* 007C0 80B11030 0C00084C */  jal     osSyncPrintf
              
/* 007C4 80B11034 01492807 */  srav    $a1, $t1, $t2              
/* 007C8 80B11038 3C038016 */  lui     $v1, %hi(gSaveContext)
/* 007CC 80B1103C 2463E660 */  addiu   $v1, %lo(gSaveContext)
/* 007D0 80B11040 3C0C8012 */  lui     $t4, %hi(gUpgradeMasks)
/* 007D4 80B11044 8D8C71B0 */  lw      $t4, %lo(gUpgradeMasks)($t4)
/* 007D8 80B11048 8C6B00A0 */  lw      $t3, 0x00A0($v1)           ## 8015E700
/* 007DC 80B1104C 3C0E8012 */  lui     $t6, %hi(gUpgradeShifts)
/* 007E0 80B11050 91CE71F4 */  lbu     $t6, %lo(gUpgradeShifts)($t6)
/* 007E4 80B11054 016C6824 */  and     $t5, $t3, $t4              
/* 007E8 80B11058 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 007EC 80B1105C 01CD1007 */  srav    $v0, $t5, $t6              
/* 007F0 80B11060 10400008 */  beq     $v0, $zero, .L80B11084     
/* 007F4 80B11064 240F0055 */  addiu   $t7, $zero, 0x0055         ## $t7 = 00000055
/* 007F8 80B11068 10410008 */  beq     $v0, $at, .L80B1108C       
/* 007FC 80B1106C 24180030 */  addiu   $t8, $zero, 0x0030         ## $t8 = 00000030
/* 00800 80B11070 24010002 */  addiu   $at, $zero, 0x0002         ## $at = 00000002
/* 00804 80B11074 10410007 */  beq     $v0, $at, .L80B11094       
/* 00808 80B11078 24190031 */  addiu   $t9, $zero, 0x0031         ## $t9 = 00000031
/* 0080C 80B1107C 10000009 */  beq     $zero, $zero, .L80B110A4   
/* 00810 80B11080 3C01447A */  lui     $at, 0x447A                ## $at = 447A0000
.L80B11084:
/* 00814 80B11084 10000006 */  beq     $zero, $zero, .L80B110A0   
/* 00818 80B11088 AE0F0218 */  sw      $t7, 0x0218($s0)           ## 00000218
.L80B1108C:
/* 0081C 80B1108C 10000004 */  beq     $zero, $zero, .L80B110A0   
/* 00820 80B11090 AE180218 */  sw      $t8, 0x0218($s0)           ## 00000218
.L80B11094:
/* 00824 80B11094 10000002 */  beq     $zero, $zero, .L80B110A0   
/* 00828 80B11098 AE190218 */  sw      $t9, 0x0218($s0)           ## 00000218
.L80B1109C:
/* 0082C 80B1109C AE080218 */  sw      $t0, 0x0218($s0)           ## 00000218
.L80B110A0:
/* 00830 80B110A0 3C01447A */  lui     $at, 0x447A                ## $at = 447A0000
.L80B110A4:
/* 00834 80B110A4 44812000 */  mtc1    $at, $f4                   ## $f4 = 1000.00
/* 00838 80B110A8 8E060218 */  lw      $a2, 0x0218($s0)           ## 00000218
/* 0083C 80B110AC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00840 80B110B0 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 00844 80B110B4 3C0744FA */  lui     $a3, 0x44FA                ## $a3 = 44FA0000
/* 00848 80B110B8 0C00BD0D */  jal     func_8002F434              
/* 0084C 80B110BC E7A40010 */  swc1    $f4, 0x0010($sp)           
/* 00850 80B110C0 3C0980B1 */  lui     $t1, %hi(func_80B11164)    ## $t1 = 80B10000
/* 00854 80B110C4 25291164 */  addiu   $t1, $t1, %lo(func_80B11164) ## $t1 = 80B11164
/* 00858 80B110C8 10000021 */  beq     $zero, $zero, .L80B11150   
/* 0085C 80B110CC AE0901FC */  sw      $t1, 0x01FC($s0)           ## 000001FC
.L80B110D0:
/* 00860 80B110D0 A60A0216 */  sh      $t2, 0x0216($s0)           ## 00000216
/* 00864 80B110D4 8FA4002C */  lw      $a0, 0x002C($sp)           
/* 00868 80B110D8 0C023BD1 */  jal     func_8008EF44              
/* 0086C 80B110DC 2405000F */  addiu   $a1, $zero, 0x000F         ## $a1 = 0000000F
/* 00870 80B110E0 3C0B80B1 */  lui     $t3, %hi(func_80B112A0)    ## $t3 = 80B10000
/* 00874 80B110E4 256B12A0 */  addiu   $t3, $t3, %lo(func_80B112A0) ## $t3 = 80B112A0
/* 00878 80B110E8 10000019 */  beq     $zero, $zero, .L80B11150   
/* 0087C 80B110EC AE0B01FC */  sw      $t3, 0x01FC($s0)           ## 000001FC
.L80B110F0:
/* 00880 80B110F0 14610005 */  bne     $v1, $at, .L80B11108       
/* 00884 80B110F4 240D0001 */  addiu   $t5, $zero, 0x0001         ## $t5 = 00000001
/* 00888 80B110F8 3C0C80B1 */  lui     $t4, %hi(func_80B109DC)    ## $t4 = 80B10000
/* 0088C 80B110FC 258C09DC */  addiu   $t4, $t4, %lo(func_80B109DC) ## $t4 = 80B109DC
/* 00890 80B11100 10000013 */  beq     $zero, $zero, .L80B11150   
/* 00894 80B11104 AE0C01FC */  sw      $t4, 0x01FC($s0)           ## 000001FC
.L80B11108:
/* 00898 80B11108 86020210 */  lh      $v0, 0x0210($s0)           ## 00000210
/* 0089C 80B1110C 3C0E80B1 */  lui     $t6, %hi(D_80B11690)       ## $t6 = 80B10000
/* 008A0 80B11110 A20D021C */  sb      $t5, 0x021C($s0)           ## 0000021C
/* 008A4 80B11114 00021040 */  sll     $v0, $v0,  1               
/* 008A8 80B11118 01C27021 */  addu    $t6, $t6, $v0              
/* 008AC 80B1111C 85CE1690 */  lh      $t6, %lo(D_80B11690)($t6)  
/* 008B0 80B11120 3C0F80B1 */  lui     $t7, %hi(D_80B11698)       ## $t7 = 80B10000
/* 008B4 80B11124 01E27821 */  addu    $t7, $t7, $v0              
/* 008B8 80B11128 A60E010E */  sh      $t6, 0x010E($s0)           ## 0000010E
/* 008BC 80B1112C 85EF1698 */  lh      $t7, %lo(D_80B11698)($t7)  
/* 008C0 80B11130 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 008C4 80B11134 31C5FFFF */  andi    $a1, $t6, 0xFFFF           ## $a1 = 00000000
/* 008C8 80B11138 A60F0212 */  sh      $t7, 0x0212($s0)           ## 00000212
/* 008CC 80B1113C 0C042DA0 */  jal     func_8010B680              
/* 008D0 80B11140 8FA4002C */  lw      $a0, 0x002C($sp)           
/* 008D4 80B11144 3C1880B1 */  lui     $t8, %hi(func_80B10A84)    ## $t8 = 80B10000
/* 008D8 80B11148 27180A84 */  addiu   $t8, $t8, %lo(func_80B10A84) ## $t8 = 80B10A84
/* 008DC 80B1114C AE1801FC */  sw      $t8, 0x01FC($s0)           ## 000001FC
.L80B11150:
/* 008E0 80B11150 8FBF0024 */  lw      $ra, 0x0024($sp)           
.L80B11154:
/* 008E4 80B11154 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 008E8 80B11158 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
/* 008EC 80B1115C 03E00008 */  jr      $ra                        
/* 008F0 80B11160 00000000 */  nop
