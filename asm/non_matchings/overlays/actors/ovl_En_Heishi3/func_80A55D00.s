glabel func_80A55D00
/* 006C0 80A55D00 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 006C4 80A55D04 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 006C8 80A55D08 AFB00018 */  sw      $s0, 0x0018($sp)           
/* 006CC 80A55D0C AFA40020 */  sw      $a0, 0x0020($sp)           
/* 006D0 80A55D10 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 006D4 80A55D14 0C02927F */  jal     SkelAnime_FrameUpdateMatrix
              
/* 006D8 80A55D18 2484014C */  addiu   $a0, $a0, 0x014C           ## $a0 = 0000014C
/* 006DC 80A55D1C 0C042F6F */  jal     func_8010BDBC              
/* 006E0 80A55D20 260420D8 */  addiu   $a0, $s0, 0x20D8           ## $a0 = 000020D8
/* 006E4 80A55D24 24010005 */  addiu   $at, $zero, 0x0005         ## $at = 00000005
/* 006E8 80A55D28 5441001C */  bnel    $v0, $at, .L80A55D9C       
/* 006EC 80A55D2C 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 006F0 80A55D30 0C041AF2 */  jal     func_80106BC8              
/* 006F4 80A55D34 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 006F8 80A55D38 10400017 */  beq     $v0, $zero, .L80A55D98     
/* 006FC 80A55D3C 8FA40020 */  lw      $a0, 0x0020($sp)           
/* 00700 80A55D40 908E0276 */  lbu     $t6, 0x0276($a0)           ## 00000276
/* 00704 80A55D44 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00708 80A55D48 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 0070C 80A55D4C 15C00012 */  bne     $t6, $zero, .L80A55D98     
/* 00710 80A55D50 2403002E */  addiu   $v1, $zero, 0x002E         ## $v1 = 0000002E
/* 00714 80A55D54 944F0EDC */  lhu     $t7, 0x0EDC($v0)           ## 8015F53C
/* 00718 80A55D58 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 0071C 80A55D5C 00300821 */  addu    $at, $at, $s0              
/* 00720 80A55D60 35F84000 */  ori     $t8, $t7, 0x4000           ## $t8 = 00004000
/* 00724 80A55D64 A4580EDC */  sh      $t8, 0x0EDC($v0)           ## 8015F53C
/* 00728 80A55D68 2419047E */  addiu   $t9, $zero, 0x047E         ## $t9 = 0000047E
/* 0072C 80A55D6C A4391E1A */  sh      $t9, 0x1E1A($at)           ## 00011E1A
/* 00730 80A55D70 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 00734 80A55D74 00300821 */  addu    $at, $at, $s0              
/* 00738 80A55D78 24080014 */  addiu   $t0, $zero, 0x0014         ## $t0 = 00000014
/* 0073C 80A55D7C A0281E15 */  sb      $t0, 0x1E15($at)           ## 00011E15
/* 00740 80A55D80 24090001 */  addiu   $t1, $zero, 0x0001         ## $t1 = 00000001
/* 00744 80A55D84 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 00748 80A55D88 A0890276 */  sb      $t1, 0x0276($a0)           ## 00000276
/* 0074C 80A55D8C 00300821 */  addu    $at, $at, $s0              
/* 00750 80A55D90 A0231E5E */  sb      $v1, 0x1E5E($at)           ## 00011E5E
/* 00754 80A55D94 A043141D */  sb      $v1, 0x141D($v0)           ## 8015FA7D
.L80A55D98:
/* 00758 80A55D98 8FBF001C */  lw      $ra, 0x001C($sp)           
.L80A55D9C:
/* 0075C 80A55D9C 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 00760 80A55DA0 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
/* 00764 80A55DA4 03E00008 */  jr      $ra                        
/* 00768 80A55DA8 00000000 */  nop
