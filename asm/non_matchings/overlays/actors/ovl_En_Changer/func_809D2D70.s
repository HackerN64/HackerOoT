.rdata
glabel D_809D33F0
    .asciz "\x1b[32m☆☆☆☆☆ 右宝開く ☆☆☆☆☆ %d\n\x1b[m"
    .balign 4

glabel D_809D341C
    .asciz "\x1b[32m☆☆☆☆☆ 左宝開く ☆☆☆☆☆ %d\n\x1b[m"
    .balign 4

.text
glabel func_809D2D70
/* 006E0 809D2D70 27BDFFB0 */  addiu   $sp, $sp, 0xFFB0           ## $sp = FFFFFFB0
/* 006E4 809D2D74 AFBF003C */  sw      $ra, 0x003C($sp)           
/* 006E8 809D2D78 AFB20038 */  sw      $s2, 0x0038($sp)           
/* 006EC 809D2D7C AFB10034 */  sw      $s1, 0x0034($sp)           
/* 006F0 809D2D80 AFB00030 */  sw      $s0, 0x0030($sp)           
/* 006F4 809D2D84 848E0166 */  lh      $t6, 0x0166($a0)           ## 00000166
/* 006F8 809D2D88 00A08825 */  or      $s1, $a1, $zero            ## $s1 = 00000000
/* 006FC 809D2D8C 00809025 */  or      $s2, $a0, $zero            ## $s2 = 00000000
/* 00700 809D2D90 8C820150 */  lw      $v0, 0x0150($a0)           ## 00000150
/* 00704 809D2D94 15C00071 */  bne     $t6, $zero, .L809D2F5C     
/* 00708 809D2D98 8C830154 */  lw      $v1, 0x0154($a0)           ## 00000154
/* 0070C 809D2D9C 84840164 */  lh      $a0, 0x0164($a0)           ## 00000164
/* 00710 809D2DA0 24010071 */  addiu   $at, $zero, 0x0071         ## $at = 00000071
/* 00714 809D2DA4 50800007 */  beql    $a0, $zero, .L809D2DC4     
/* 00718 809D2DA8 86420162 */  lh      $v0, 0x0162($s2)           ## 00000162
/* 0071C 809D2DAC 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 00720 809D2DB0 50810037 */  beql    $a0, $at, .L809D2E90       
/* 00724 809D2DB4 86430160 */  lh      $v1, 0x0160($s2)           ## 00000160
/* 00728 809D2DB8 10000066 */  beq     $zero, $zero, .L809D2F54   
/* 0072C 809D2DBC 00000000 */  nop
/* 00730 809D2DC0 86420162 */  lh      $v0, 0x0162($s2)           ## 00000162
.L809D2DC4:
/* 00734 809D2DC4 C4600024 */  lwc1    $f0, 0x0024($v1)           ## 00000024
/* 00738 809D2DC8 C4620028 */  lwc1    $f2, 0x0028($v1)           ## 00000028
/* 0073C 809D2DCC 14410012 */  bne     $v0, $at, .L809D2E18       
/* 00740 809D2DD0 C46C002C */  lwc1    $f12, 0x002C($v1)          ## 0000002C
/* 00744 809D2DD4 44070000 */  mfc1    $a3, $f0                   
/* 00748 809D2DD8 240F000F */  addiu   $t7, $zero, 0x000F         ## $t7 = 0000000F
/* 0074C 809D2DDC AFAF0024 */  sw      $t7, 0x0024($sp)           
/* 00750 809D2DE0 26241C24 */  addiu   $a0, $s1, 0x1C24           ## $a0 = 00001C24
/* 00754 809D2DE4 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 00758 809D2DE8 24060168 */  addiu   $a2, $zero, 0x0168         ## $a2 = 00000168
/* 0075C 809D2DEC E7A20010 */  swc1    $f2, 0x0010($sp)           
/* 00760 809D2DF0 E7AC0014 */  swc1    $f12, 0x0014($sp)          
/* 00764 809D2DF4 AFA00018 */  sw      $zero, 0x0018($sp)         
/* 00768 809D2DF8 AFA0001C */  sw      $zero, 0x001C($sp)         
/* 0076C 809D2DFC 0C00C7D4 */  jal     Actor_Spawn
              ## ActorSpawn
/* 00770 809D2E00 AFA00020 */  sw      $zero, 0x0020($sp)         
/* 00774 809D2E04 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00778 809D2E08 0C00B2DD */  jal     Flags_SetSwitch
              
/* 0077C 809D2E0C 24050032 */  addiu   $a1, $zero, 0x0032         ## $a1 = 00000032
/* 00780 809D2E10 10000050 */  beq     $zero, $zero, .L809D2F54   
/* 00784 809D2E14 00000000 */  nop
.L809D2E18:
/* 00788 809D2E18 2450FF8E */  addiu   $s0, $v0, 0xFF8E           ## $s0 = FFFFFF8E
/* 0078C 809D2E1C 00108400 */  sll     $s0, $s0, 16               
/* 00790 809D2E20 00108403 */  sra     $s0, $s0, 16               
/* 00794 809D2E24 2610000A */  addiu   $s0, $s0, 0x000A           ## $s0 = FFFFFF98
/* 00798 809D2E28 00108400 */  sll     $s0, $s0, 16               
/* 0079C 809D2E2C 00108403 */  sra     $s0, $s0, 16               
/* 007A0 809D2E30 3C04809D */  lui     $a0, %hi(D_809D33F0)       ## $a0 = 809D0000
/* 007A4 809D2E34 248433F0 */  addiu   $a0, $a0, %lo(D_809D33F0)  ## $a0 = 809D33F0
/* 007A8 809D2E38 02002825 */  or      $a1, $s0, $zero            ## $a1 = FFFFFF98
/* 007AC 809D2E3C E7A00044 */  swc1    $f0, 0x0044($sp)           
/* 007B0 809D2E40 E7A20048 */  swc1    $f2, 0x0048($sp)           
/* 007B4 809D2E44 0C00084C */  jal     osSyncPrintf
              
/* 007B8 809D2E48 E7AC004C */  swc1    $f12, 0x004C($sp)          
/* 007BC 809D2E4C C7A00044 */  lwc1    $f0, 0x0044($sp)           
/* 007C0 809D2E50 C7A20048 */  lwc1    $f2, 0x0048($sp)           
/* 007C4 809D2E54 C7AC004C */  lwc1    $f12, 0x004C($sp)          
/* 007C8 809D2E58 44070000 */  mfc1    $a3, $f0                   
/* 007CC 809D2E5C 26241C24 */  addiu   $a0, $s1, 0x1C24           ## $a0 = 00001C24
/* 007D0 809D2E60 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 007D4 809D2E64 24060168 */  addiu   $a2, $zero, 0x0168         ## $a2 = 00000168
/* 007D8 809D2E68 AFA00018 */  sw      $zero, 0x0018($sp)         
/* 007DC 809D2E6C AFA0001C */  sw      $zero, 0x001C($sp)         
/* 007E0 809D2E70 AFA00020 */  sw      $zero, 0x0020($sp)         
/* 007E4 809D2E74 AFB00024 */  sw      $s0, 0x0024($sp)           
/* 007E8 809D2E78 E7A20010 */  swc1    $f2, 0x0010($sp)           
/* 007EC 809D2E7C 0C00C7D4 */  jal     Actor_Spawn
              ## ActorSpawn
/* 007F0 809D2E80 E7AC0014 */  swc1    $f12, 0x0014($sp)          
/* 007F4 809D2E84 10000033 */  beq     $zero, $zero, .L809D2F54   
/* 007F8 809D2E88 00000000 */  nop
/* 007FC 809D2E8C 86430160 */  lh      $v1, 0x0160($s2)           ## 00000160
.L809D2E90:
/* 00800 809D2E90 24010071 */  addiu   $at, $zero, 0x0071         ## $at = 00000071
/* 00804 809D2E94 C4400024 */  lwc1    $f0, 0x0024($v0)           ## 00000024
/* 00808 809D2E98 C4420028 */  lwc1    $f2, 0x0028($v0)           ## 00000028
/* 0080C 809D2E9C 14610012 */  bne     $v1, $at, .L809D2EE8       
/* 00810 809D2EA0 C44C002C */  lwc1    $f12, 0x002C($v0)          ## 0000002C
/* 00814 809D2EA4 44070000 */  mfc1    $a3, $f0                   
/* 00818 809D2EA8 2418000F */  addiu   $t8, $zero, 0x000F         ## $t8 = 0000000F
/* 0081C 809D2EAC AFB80024 */  sw      $t8, 0x0024($sp)           
/* 00820 809D2EB0 26241C24 */  addiu   $a0, $s1, 0x1C24           ## $a0 = 00001C24
/* 00824 809D2EB4 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 00828 809D2EB8 24060168 */  addiu   $a2, $zero, 0x0168         ## $a2 = 00000168
/* 0082C 809D2EBC E7A20010 */  swc1    $f2, 0x0010($sp)           
/* 00830 809D2EC0 E7AC0014 */  swc1    $f12, 0x0014($sp)          
/* 00834 809D2EC4 AFA00018 */  sw      $zero, 0x0018($sp)         
/* 00838 809D2EC8 AFA0001C */  sw      $zero, 0x001C($sp)         
/* 0083C 809D2ECC 0C00C7D4 */  jal     Actor_Spawn
              ## ActorSpawn
/* 00840 809D2ED0 AFA00020 */  sw      $zero, 0x0020($sp)         
/* 00844 809D2ED4 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00848 809D2ED8 0C00B2DD */  jal     Flags_SetSwitch
              
/* 0084C 809D2EDC 24050032 */  addiu   $a1, $zero, 0x0032         ## $a1 = 00000032
/* 00850 809D2EE0 1000001C */  beq     $zero, $zero, .L809D2F54   
/* 00854 809D2EE4 00000000 */  nop
.L809D2EE8:
/* 00858 809D2EE8 2470FF8E */  addiu   $s0, $v1, 0xFF8E           ## $s0 = FFFFFF8E
/* 0085C 809D2EEC 00108400 */  sll     $s0, $s0, 16               
/* 00860 809D2EF0 00108403 */  sra     $s0, $s0, 16               
/* 00864 809D2EF4 2610000A */  addiu   $s0, $s0, 0x000A           ## $s0 = FFFFFF98
/* 00868 809D2EF8 00108400 */  sll     $s0, $s0, 16               
/* 0086C 809D2EFC 00108403 */  sra     $s0, $s0, 16               
/* 00870 809D2F00 3C04809D */  lui     $a0, %hi(D_809D341C)       ## $a0 = 809D0000
/* 00874 809D2F04 2484341C */  addiu   $a0, $a0, %lo(D_809D341C)  ## $a0 = 809D341C
/* 00878 809D2F08 02002825 */  or      $a1, $s0, $zero            ## $a1 = FFFFFF98
/* 0087C 809D2F0C E7A00044 */  swc1    $f0, 0x0044($sp)           
/* 00880 809D2F10 E7A20048 */  swc1    $f2, 0x0048($sp)           
/* 00884 809D2F14 0C00084C */  jal     osSyncPrintf
              
/* 00888 809D2F18 E7AC004C */  swc1    $f12, 0x004C($sp)          
/* 0088C 809D2F1C C7A00044 */  lwc1    $f0, 0x0044($sp)           
/* 00890 809D2F20 C7A20048 */  lwc1    $f2, 0x0048($sp)           
/* 00894 809D2F24 C7AC004C */  lwc1    $f12, 0x004C($sp)          
/* 00898 809D2F28 44070000 */  mfc1    $a3, $f0                   
/* 0089C 809D2F2C 26241C24 */  addiu   $a0, $s1, 0x1C24           ## $a0 = 00001C24
/* 008A0 809D2F30 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 008A4 809D2F34 24060168 */  addiu   $a2, $zero, 0x0168         ## $a2 = 00000168
/* 008A8 809D2F38 AFA00018 */  sw      $zero, 0x0018($sp)         
/* 008AC 809D2F3C AFA0001C */  sw      $zero, 0x001C($sp)         
/* 008B0 809D2F40 AFA00020 */  sw      $zero, 0x0020($sp)         
/* 008B4 809D2F44 AFB00024 */  sw      $s0, 0x0024($sp)           
/* 008B8 809D2F48 E7A20010 */  swc1    $f2, 0x0010($sp)           
/* 008BC 809D2F4C 0C00C7D4 */  jal     Actor_Spawn
              ## ActorSpawn
/* 008C0 809D2F50 E7AC0014 */  swc1    $f12, 0x0014($sp)          
.L809D2F54:
/* 008C4 809D2F54 0C00B55C */  jal     Actor_Kill
              
/* 008C8 809D2F58 02402025 */  or      $a0, $s2, $zero            ## $a0 = 00000000
.L809D2F5C:
/* 008CC 809D2F5C 8FBF003C */  lw      $ra, 0x003C($sp)           
/* 008D0 809D2F60 8FB00030 */  lw      $s0, 0x0030($sp)           
/* 008D4 809D2F64 8FB10034 */  lw      $s1, 0x0034($sp)           
/* 008D8 809D2F68 8FB20038 */  lw      $s2, 0x0038($sp)           
/* 008DC 809D2F6C 03E00008 */  jr      $ra                        
/* 008E0 809D2F70 27BD0050 */  addiu   $sp, $sp, 0x0050           ## $sp = 00000000
