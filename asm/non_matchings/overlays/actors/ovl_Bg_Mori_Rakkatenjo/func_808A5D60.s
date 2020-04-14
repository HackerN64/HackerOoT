.rdata
glabel D_808A5FF8
    .asciz "../z_bg_mori_rakkatenjo.c"
    .balign 4

glabel D_808A6014
    .asciz "../z_bg_mori_rakkatenjo.c"
    .balign 4

glabel D_808A6030
    .asciz "../z_bg_mori_rakkatenjo.c"
    .balign 4

.text
glabel func_808A5D60
/* 007F0 808A5D60 27BDFFB0 */  addiu   $sp, $sp, 0xFFB0           ## $sp = FFFFFFB0
/* 007F4 808A5D64 AFB10018 */  sw      $s1, 0x0018($sp)           
/* 007F8 808A5D68 00A08825 */  or      $s1, $a1, $zero            ## $s1 = 00000000
/* 007FC 808A5D6C AFBF001C */  sw      $ra, 0x001C($sp)           
/* 00800 808A5D70 AFB00014 */  sw      $s0, 0x0014($sp)           
/* 00804 808A5D74 AFA40050 */  sw      $a0, 0x0050($sp)           
/* 00808 808A5D78 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 0080C 808A5D7C 3C06808A */  lui     $a2, %hi(D_808A5FF8)       ## $a2 = 808A0000
/* 00810 808A5D80 24C65FF8 */  addiu   $a2, $a2, %lo(D_808A5FF8)  ## $a2 = 808A5FF8
/* 00814 808A5D84 27A40034 */  addiu   $a0, $sp, 0x0034           ## $a0 = FFFFFFE4
/* 00818 808A5D88 240701F1 */  addiu   $a3, $zero, 0x01F1         ## $a3 = 000001F1
/* 0081C 808A5D8C 0C031AB1 */  jal     Graph_OpenDisps              
/* 00820 808A5D90 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 00824 808A5D94 0C024F46 */  jal     func_80093D18              
/* 00828 808A5D98 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 0082C 808A5D9C 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 00830 808A5DA0 3C0FDB06 */  lui     $t7, 0xDB06                ## $t7 = DB060000
/* 00834 808A5DA4 35EF0020 */  ori     $t7, $t7, 0x0020           ## $t7 = DB060020
/* 00838 808A5DA8 244E0008 */  addiu   $t6, $v0, 0x0008           ## $t6 = 00000008
/* 0083C 808A5DAC AE0E02C0 */  sw      $t6, 0x02C0($s0)           ## 000002C0
/* 00840 808A5DB0 AC4F0000 */  sw      $t7, 0x0000($v0)           ## 00000000
/* 00844 808A5DB4 8FB80050 */  lw      $t8, 0x0050($sp)           
/* 00848 808A5DB8 3C0A0001 */  lui     $t2, 0x0001                ## $t2 = 00010000
/* 0084C 808A5DBC 3C0CDA38 */  lui     $t4, 0xDA38                ## $t4 = DA380000
/* 00850 808A5DC0 83190174 */  lb      $t9, 0x0174($t8)           ## 00000174
/* 00854 808A5DC4 358C0003 */  ori     $t4, $t4, 0x0003           ## $t4 = DA380003
/* 00858 808A5DC8 3C05808A */  lui     $a1, %hi(D_808A6014)       ## $a1 = 808A0000
/* 0085C 808A5DCC 00194100 */  sll     $t0, $t9,  4               
/* 00860 808A5DD0 01194021 */  addu    $t0, $t0, $t9              
/* 00864 808A5DD4 00084080 */  sll     $t0, $t0,  2               
/* 00868 808A5DD8 02284821 */  addu    $t1, $s1, $t0              
/* 0086C 808A5DDC 01495021 */  addu    $t2, $t2, $t1              
/* 00870 808A5DE0 8D4A17B4 */  lw      $t2, 0x17B4($t2)           ## 000117B4
/* 00874 808A5DE4 24A56014 */  addiu   $a1, $a1, %lo(D_808A6014)  ## $a1 = 808A6014
/* 00878 808A5DE8 240601F6 */  addiu   $a2, $zero, 0x01F6         ## $a2 = 000001F6
/* 0087C 808A5DEC AC4A0004 */  sw      $t2, 0x0004($v0)           ## 00000004
/* 00880 808A5DF0 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 00884 808A5DF4 244B0008 */  addiu   $t3, $v0, 0x0008           ## $t3 = 00000008
/* 00888 808A5DF8 AE0B02C0 */  sw      $t3, 0x02C0($s0)           ## 000002C0
/* 0088C 808A5DFC AC4C0000 */  sw      $t4, 0x0000($v0)           ## 00000000
/* 00890 808A5E00 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 00894 808A5E04 0C0346A2 */  jal     Matrix_NewMtx              
/* 00898 808A5E08 AFA2002C */  sw      $v0, 0x002C($sp)           
/* 0089C 808A5E0C 8FA3002C */  lw      $v1, 0x002C($sp)           
/* 008A0 808A5E10 3C0F0600 */  lui     $t7, 0x0600                ## $t7 = 06000000
/* 008A4 808A5E14 25EF7690 */  addiu   $t7, $t7, 0x7690           ## $t7 = 06007690
/* 008A8 808A5E18 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 008AC 808A5E1C 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 008B0 808A5E20 3C0EDE00 */  lui     $t6, 0xDE00                ## $t6 = DE000000
/* 008B4 808A5E24 3C06808A */  lui     $a2, %hi(D_808A6030)       ## $a2 = 808A0000
/* 008B8 808A5E28 244D0008 */  addiu   $t5, $v0, 0x0008           ## $t5 = 00000008
/* 008BC 808A5E2C AE0D02C0 */  sw      $t5, 0x02C0($s0)           ## 000002C0
/* 008C0 808A5E30 AC4F0004 */  sw      $t7, 0x0004($v0)           ## 00000004
/* 008C4 808A5E34 AC4E0000 */  sw      $t6, 0x0000($v0)           ## 00000000
/* 008C8 808A5E38 8E250000 */  lw      $a1, 0x0000($s1)           ## 00000000
/* 008CC 808A5E3C 24C66030 */  addiu   $a2, $a2, %lo(D_808A6030)  ## $a2 = 808A6030
/* 008D0 808A5E40 27A40034 */  addiu   $a0, $sp, 0x0034           ## $a0 = FFFFFFE4
/* 008D4 808A5E44 0C031AD5 */  jal     Graph_CloseDisps              
/* 008D8 808A5E48 240701FA */  addiu   $a3, $zero, 0x01FA         ## $a3 = 000001FA
/* 008DC 808A5E4C 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 008E0 808A5E50 8FB00014 */  lw      $s0, 0x0014($sp)           
/* 008E4 808A5E54 8FB10018 */  lw      $s1, 0x0018($sp)           
/* 008E8 808A5E58 03E00008 */  jr      $ra                        
/* 008EC 808A5E5C 27BD0050 */  addiu   $sp, $sp, 0x0050           ## $sp = 00000000
