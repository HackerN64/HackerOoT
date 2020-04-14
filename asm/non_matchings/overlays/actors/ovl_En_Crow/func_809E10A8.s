.late_rodata
glabel D_809E1710
    .float 0.03

glabel D_809E1714
    .float 0.01

glabel D_809E1718
    .float 0.1

.text
glabel func_809E10A8
/* 00E68 809E10A8 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 00E6C 809E10AC AFBF001C */  sw      $ra, 0x001C($sp)           
/* 00E70 809E10B0 AFB00018 */  sw      $s0, 0x0018($sp)           
/* 00E74 809E10B4 AFA50024 */  sw      $a1, 0x0024($sp)           
/* 00E78 809E10B8 848201C4 */  lh      $v0, 0x01C4($a0)           ## 000001C4
/* 00E7C 809E10BC 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00E80 809E10C0 10400003 */  beq     $v0, $zero, .L809E10D0     
/* 00E84 809E10C4 244EFFFF */  addiu   $t6, $v0, 0xFFFF           ## $t6 = FFFFFFFF
/* 00E88 809E10C8 A48E01C4 */  sh      $t6, 0x01C4($a0)           ## 000001C4
/* 00E8C 809E10CC 848201C4 */  lh      $v0, 0x01C4($a0)           ## 000001C4
.L809E10D0:
/* 00E90 809E10D0 54400024 */  bnel    $v0, $zero, .L809E1164     
/* 00E94 809E10D4 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 00E98 809E10D8 0C02927F */  jal     SkelAnime_FrameUpdateMatrix
              
/* 00E9C 809E10DC 2604017C */  addiu   $a0, $s0, 0x017C           ## $a0 = 0000017C
/* 00EA0 809E10E0 8618001C */  lh      $t8, 0x001C($s0)           ## 0000001C
/* 00EA4 809E10E4 3C0F809E */  lui     $t7, %hi(EnCrow_Draw)    ## $t7 = 809E0000
/* 00EA8 809E10E8 25EF15E0 */  addiu   $t7, $t7, %lo(EnCrow_Draw) ## $t7 = 809E15E0
/* 00EAC 809E10EC 13000004 */  beq     $t8, $zero, .L809E1100     
/* 00EB0 809E10F0 AE0F0134 */  sw      $t7, 0x0134($s0)           ## 00000134
/* 00EB4 809E10F4 3C01809E */  lui     $at, %hi(D_809E1710)       ## $at = 809E0000
/* 00EB8 809E10F8 10000003 */  beq     $zero, $zero, .L809E1108   
/* 00EBC 809E10FC C4201710 */  lwc1    $f0, %lo(D_809E1710)($at)  
.L809E1100:
/* 00EC0 809E1100 3C01809E */  lui     $at, %hi(D_809E1714)       ## $at = 809E0000
/* 00EC4 809E1104 C4201714 */  lwc1    $f0, %lo(D_809E1714)($at)  
.L809E1108:
/* 00EC8 809E1108 3C01809E */  lui     $at, %hi(D_809E1718)       ## $at = 809E0000
/* 00ECC 809E110C C4241718 */  lwc1    $f4, %lo(D_809E1718)($at)  
/* 00ED0 809E1110 44050000 */  mfc1    $a1, $f0                   
/* 00ED4 809E1114 26040050 */  addiu   $a0, $s0, 0x0050           ## $a0 = 00000050
/* 00ED8 809E1118 46040182 */  mul.s   $f6, $f0, $f4              
/* 00EDC 809E111C 44063000 */  mfc1    $a2, $f6                   
/* 00EE0 809E1120 0C01DE80 */  jal     Math_ApproxF
              
/* 00EE4 809E1124 00000000 */  nop
/* 00EE8 809E1128 1040000A */  beq     $v0, $zero, .L809E1154     
/* 00EEC 809E112C 2401FFEF */  addiu   $at, $zero, 0xFFEF         ## $at = FFFFFFEF
/* 00EF0 809E1130 8E190004 */  lw      $t9, 0x0004($s0)           ## 00000004
/* 00EF4 809E1134 240B0001 */  addiu   $t3, $zero, 0x0001         ## $t3 = 00000001
/* 00EF8 809E1138 A20B00AF */  sb      $t3, 0x00AF($s0)           ## 000000AF
/* 00EFC 809E113C 37280001 */  ori     $t0, $t9, 0x0001           ## $t0 = 00000001
/* 00F00 809E1140 AE080004 */  sw      $t0, 0x0004($s0)           ## 00000004
/* 00F04 809E1144 01015024 */  and     $t2, $t0, $at              
/* 00F08 809E1148 AE0A0004 */  sw      $t2, 0x0004($s0)           ## 00000004
/* 00F0C 809E114C 0C2780D5 */  jal     func_809E0354              
/* 00F10 809E1150 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
.L809E1154:
/* 00F14 809E1154 C6000050 */  lwc1    $f0, 0x0050($s0)           ## 00000050
/* 00F18 809E1158 E6000054 */  swc1    $f0, 0x0054($s0)           ## 00000054
/* 00F1C 809E115C E6000058 */  swc1    $f0, 0x0058($s0)           ## 00000058
/* 00F20 809E1160 8FBF001C */  lw      $ra, 0x001C($sp)           
.L809E1164:
/* 00F24 809E1164 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 00F28 809E1168 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
/* 00F2C 809E116C 03E00008 */  jr      $ra                        
/* 00F30 809E1170 00000000 */  nop
