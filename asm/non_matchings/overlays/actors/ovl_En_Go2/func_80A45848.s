glabel func_80A45848
/* 02B18 80A45848 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 02B1C 80A4584C AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 02B20 80A45850 8482001C */  lh      $v0, 0x001C($a0)           ## 0000001C
/* 02B24 80A45854 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 02B28 80A45858 3C038016 */  lui     $v1, %hi(gSaveContext)
/* 02B2C 80A4585C 3042001F */  andi    $v0, $v0, 0x001F           ## $v0 = 00000000
/* 02B30 80A45860 1041001B */  beq     $v0, $at, .L80A458D0       
/* 02B34 80A45864 2463E660 */  addiu   $v1, %lo(gSaveContext)
/* 02B38 80A45868 24010002 */  addiu   $at, $zero, 0x0002         ## $at = 00000002
/* 02B3C 80A4586C 10410014 */  beq     $v0, $at, .L80A458C0       
/* 02B40 80A45870 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
/* 02B44 80A45874 1041000E */  beq     $v0, $at, .L80A458B0       
/* 02B48 80A45878 24010004 */  addiu   $at, $zero, 0x0004         ## $at = 00000004
/* 02B4C 80A4587C 14410025 */  bne     $v0, $at, .L80A45914       
/* 02B50 80A45880 240E0001 */  addiu   $t6, $zero, 0x0001         ## $t6 = 00000001
/* 02B54 80A45884 A08E020F */  sb      $t6, 0x020F($a0)           ## 0000020F
/* 02B58 80A45888 0C291370 */  jal     func_80A44DC0              
/* 02B5C 80A4588C AFA40018 */  sw      $a0, 0x0018($sp)           
/* 02B60 80A45890 10400004 */  beq     $v0, $zero, .L80A458A4     
/* 02B64 80A45894 8FA40018 */  lw      $a0, 0x0018($sp)           
/* 02B68 80A45898 240F0002 */  addiu   $t7, $zero, 0x0002         ## $t7 = 00000002
/* 02B6C 80A4589C 1000001F */  beq     $zero, $zero, .L80A4591C   
/* 02B70 80A458A0 A48F026E */  sh      $t7, 0x026E($a0)           ## 0000026E
.L80A458A4:
/* 02B74 80A458A4 24180001 */  addiu   $t8, $zero, 0x0001         ## $t8 = 00000001
/* 02B78 80A458A8 1000001C */  beq     $zero, $zero, .L80A4591C   
/* 02B7C 80A458AC A498026E */  sh      $t8, 0x026E($a0)           ## 0000026E
.L80A458B0:
/* 02B80 80A458B0 0C2915E3 */  jal     func_80A4578C              
/* 02B84 80A458B4 00000000 */  nop
/* 02B88 80A458B8 10000019 */  beq     $zero, $zero, .L80A45920   
/* 02B8C 80A458BC 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L80A458C0:
/* 02B90 80A458C0 0C2915FE */  jal     func_80A457F8              
/* 02B94 80A458C4 00000000 */  nop
/* 02B98 80A458C8 10000015 */  beq     $zero, $zero, .L80A45920   
/* 02B9C 80A458CC 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L80A458D0:
/* 02BA0 80A458D0 3C028012 */  lui     $v0, %hi(gBitFlags+4)
/* 02BA4 80A458D4 8C427124 */  lw      $v0, %lo(gBitFlags+4)($v0)
/* 02BA8 80A458D8 8C7900A4 */  lw      $t9, 0x00A4($v1)           ## 000000A4
/* 02BAC 80A458DC 3C098012 */  lui     $t1, %hi(gEquipShifts+2)
/* 02BB0 80A458E0 00594024 */  and     $t0, $v0, $t9              
/* 02BB4 80A458E4 1500000B */  bne     $t0, $zero, .L80A45914     
/* 02BB8 80A458E8 00000000 */  nop
/* 02BBC 80A458EC 912971F2 */  lbu     $t1, %lo(gEquipShifts+2)($t1)
/* 02BC0 80A458F0 946B009C */  lhu     $t3, 0x009C($v1)           ## 0000009C
/* 02BC4 80A458F4 01225004 */  sllv    $t2, $v0, $t1              
/* 02BC8 80A458F8 014B6024 */  and     $t4, $t2, $t3              
/* 02BCC 80A458FC 11800005 */  beq     $t4, $zero, .L80A45914     
/* 02BD0 80A45900 00000000 */  nop
/* 02BD4 80A45904 0C2915E3 */  jal     func_80A4578C              
/* 02BD8 80A45908 00000000 */  nop
/* 02BDC 80A4590C 10000004 */  beq     $zero, $zero, .L80A45920   
/* 02BE0 80A45910 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L80A45914:
/* 02BE4 80A45914 0C2915CD */  jal     func_80A45734              
/* 02BE8 80A45918 00000000 */  nop
.L80A4591C:
/* 02BEC 80A4591C 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L80A45920:
/* 02BF0 80A45920 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 02BF4 80A45924 03E00008 */  jr      $ra                        
/* 02BF8 80A45928 00000000 */  nop
