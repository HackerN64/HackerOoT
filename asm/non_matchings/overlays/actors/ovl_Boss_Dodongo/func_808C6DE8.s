.rdata
glabel D_808CA604
    .asciz "../z_boss_dodongo.c"
    .balign 4

glabel D_808CA618
    .asciz "../z_boss_dodongo.c"
    .balign 4

glabel D_808CA62C
    .asciz "../z_boss_dodongo.c"
    .balign 4

.text
glabel func_808C6DE8
/* 05C58 808C6DE8 27BDFF70 */  addiu   $sp, $sp, 0xFF70           ## $sp = FFFFFF70
/* 05C5C 808C6DEC AFB00020 */  sw      $s0, 0x0020($sp)           
/* 05C60 808C6DF0 AFBF0044 */  sw      $ra, 0x0044($sp)           
/* 05C64 808C6DF4 AFBE0040 */  sw      $s8, 0x0040($sp)           
/* 05C68 808C6DF8 AFB7003C */  sw      $s7, 0x003C($sp)           
/* 05C6C 808C6DFC AFB60038 */  sw      $s6, 0x0038($sp)           
/* 05C70 808C6E00 AFB50034 */  sw      $s5, 0x0034($sp)           
/* 05C74 808C6E04 AFB40030 */  sw      $s4, 0x0030($sp)           
/* 05C78 808C6E08 AFB3002C */  sw      $s3, 0x002C($sp)           
/* 05C7C 808C6E0C AFB20028 */  sw      $s2, 0x0028($sp)           
/* 05C80 808C6E10 AFB10024 */  sw      $s1, 0x0024($sp)           
/* 05C84 808C6E14 F7B40018 */  sdc1    $f20, 0x0018($sp)          
/* 05C88 808C6E18 8C910000 */  lw      $s1, 0x0000($a0)           ## 00000000
/* 05C8C 808C6E1C 3C100001 */  lui     $s0, 0x0001                ## $s0 = 00010000
/* 05C90 808C6E20 0080B825 */  or      $s7, $a0, $zero            ## $s7 = 00000000
/* 05C94 808C6E24 02048021 */  addu    $s0, $s0, $a0              
/* 05C98 808C6E28 3C06808D */  lui     $a2, %hi(D_808CA604)       ## $a2 = 808D0000
/* 05C9C 808C6E2C 00009825 */  or      $s3, $zero, $zero          ## $s3 = 00000000
/* 05CA0 808C6E30 8E101E10 */  lw      $s0, 0x1E10($s0)           ## 00011E10
/* 05CA4 808C6E34 24C6A604 */  addiu   $a2, $a2, %lo(D_808CA604)  ## $a2 = 808CA604
/* 05CA8 808C6E38 27A4006C */  addiu   $a0, $sp, 0x006C           ## $a0 = FFFFFFDC
/* 05CAC 808C6E3C 2407146C */  addiu   $a3, $zero, 0x146C         ## $a3 = 0000146C
/* 05CB0 808C6E40 0C031AB1 */  jal     Graph_OpenDisps              
/* 05CB4 808C6E44 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 05CB8 808C6E48 0C024F61 */  jal     func_80093D84              
/* 05CBC 808C6E4C 8EE40000 */  lw      $a0, 0x0000($s7)           ## 00000000
/* 05CC0 808C6E50 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 05CC4 808C6E54 4481A000 */  mtc1    $at, $f20                  ## $f20 = 1.00
/* 05CC8 808C6E58 0000A025 */  or      $s4, $zero, $zero          ## $s4 = 00000000
/* 05CCC 808C6E5C 241E0001 */  addiu   $s8, $zero, 0x0001         ## $s8 = 00000001
/* 05CD0 808C6E60 3C16DE00 */  lui     $s6, 0xDE00                ## $s6 = DE000000
.L808C6E64:
/* 05CD4 808C6E64 920E0024 */  lbu     $t6, 0x0024($s0)           ## 00010024
/* 05CD8 808C6E68 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 05CDC 808C6E6C 34211DA0 */  ori     $at, $at, 0x1DA0           ## $at = 00011DA0
/* 05CE0 808C6E70 17CE0042 */  bne     $s8, $t6, .L808C6F7C       
/* 05CE4 808C6E74 02E19021 */  addu    $s2, $s7, $at              
/* 05CE8 808C6E78 8E2202D0 */  lw      $v0, 0x02D0($s1)           ## 000002D0
/* 05CEC 808C6E7C 3C150601 */  lui     $s5, %hi(D_06009DD0)                ## $s5 = 06010000
/* 05CF0 808C6E80 3C18E700 */  lui     $t8, 0xE700                ## $t8 = E7000000
/* 05CF4 808C6E84 244F0008 */  addiu   $t7, $v0, 0x0008           ## $t7 = 00000008
/* 05CF8 808C6E88 AE2F02D0 */  sw      $t7, 0x02D0($s1)           ## 000002D0
/* 05CFC 808C6E8C 26B59DD0 */  addiu   $s5, $s5, %lo(D_06009DD0)           ## $s5 = 06009DD0
/* 05D00 808C6E90 AC400004 */  sw      $zero, 0x0004($v0)         ## 00000004
/* 05D04 808C6E94 1660000A */  bne     $s3, $zero, .L808C6EC0     
/* 05D08 808C6E98 AC580000 */  sw      $t8, 0x0000($v0)           ## 00000000
/* 05D0C 808C6E9C 8E2202D0 */  lw      $v0, 0x02D0($s1)           ## 000002D0
/* 05D10 808C6EA0 3C040601 */  lui     $a0, %hi(D_06009D50)                ## $a0 = 06010000
/* 05D14 808C6EA4 24849D50 */  addiu   $a0, $a0, %lo(D_06009D50)           ## $a0 = 06009D50
/* 05D18 808C6EA8 24590008 */  addiu   $t9, $v0, 0x0008           ## $t9 = 00000008
/* 05D1C 808C6EAC AE3902D0 */  sw      $t9, 0x02D0($s1)           ## 000002D0
/* 05D20 808C6EB0 26730001 */  addiu   $s3, $s3, 0x0001           ## $s3 = 00000001
/* 05D24 808C6EB4 327300FF */  andi    $s3, $s3, 0x00FF           ## $s3 = 00000001
/* 05D28 808C6EB8 AC440004 */  sw      $a0, 0x0004($v0)           ## 00000004
/* 05D2C 808C6EBC AC560000 */  sw      $s6, 0x0000($v0)           ## 00000000
.L808C6EC0:
/* 05D30 808C6EC0 8E2202D0 */  lw      $v0, 0x02D0($s1)           ## 000002D0
/* 05D34 808C6EC4 3C09FA00 */  lui     $t1, 0xFA00                ## $t1 = FA000000
/* 05D38 808C6EC8 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 05D3C 808C6ECC 24480008 */  addiu   $t0, $v0, 0x0008           ## $t0 = 00000008
/* 05D40 808C6ED0 AE2802D0 */  sw      $t0, 0x02D0($s1)           ## 000002D0
/* 05D44 808C6ED4 AC490000 */  sw      $t1, 0x0000($v0)           ## 00000000
/* 05D48 808C6ED8 920B0026 */  lbu     $t3, 0x0026($s0)           ## 00010026
/* 05D4C 808C6EDC 920E0027 */  lbu     $t6, 0x0027($s0)           ## 00010027
/* 05D50 808C6EE0 92080028 */  lbu     $t0, 0x0028($s0)           ## 00010028
/* 05D54 808C6EE4 000B6600 */  sll     $t4, $t3, 24               
/* 05D58 808C6EE8 860B002A */  lh      $t3, 0x002A($s0)           ## 0001002A
/* 05D5C 808C6EEC 000E7C00 */  sll     $t7, $t6, 16               
/* 05D60 808C6EF0 018FC025 */  or      $t8, $t4, $t7              ## $t8 = 00000008
/* 05D64 808C6EF4 00084A00 */  sll     $t1, $t0,  8               
/* 05D68 808C6EF8 03095025 */  or      $t2, $t8, $t1              ## $t2 = FA000008
/* 05D6C 808C6EFC 316D00FF */  andi    $t5, $t3, 0x00FF           ## $t5 = 00000000
/* 05D70 808C6F00 014D7025 */  or      $t6, $t2, $t5              ## $t6 = FA000008
/* 05D74 808C6F04 AC4E0004 */  sw      $t6, 0x0004($v0)           ## 00000004
/* 05D78 808C6F08 8E060008 */  lw      $a2, 0x0008($s0)           ## 00010008
/* 05D7C 808C6F0C C60E0004 */  lwc1    $f14, 0x0004($s0)          ## 00010004
/* 05D80 808C6F10 0C034261 */  jal     Matrix_Translate              
/* 05D84 808C6F14 C60C0000 */  lwc1    $f12, 0x0000($s0)          ## 00010000
/* 05D88 808C6F18 0C0347F5 */  jal     func_800D1FD4              
/* 05D8C 808C6F1C 02402025 */  or      $a0, $s2, $zero            ## $a0 = 00000000
/* 05D90 808C6F20 C60C002C */  lwc1    $f12, 0x002C($s0)          ## 0001002C
/* 05D94 808C6F24 4406A000 */  mfc1    $a2, $f20                  
/* 05D98 808C6F28 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 05D9C 808C6F2C 0C0342A3 */  jal     Matrix_Scale              
/* 05DA0 808C6F30 46006386 */  mov.s   $f14, $f12                 
/* 05DA4 808C6F34 8E2202D0 */  lw      $v0, 0x02D0($s1)           ## 000002D0
/* 05DA8 808C6F38 3C0FDA38 */  lui     $t7, 0xDA38                ## $t7 = DA380000
/* 05DAC 808C6F3C 35EF0003 */  ori     $t7, $t7, 0x0003           ## $t7 = DA380003
/* 05DB0 808C6F40 244C0008 */  addiu   $t4, $v0, 0x0008           ## $t4 = 00000008
/* 05DB4 808C6F44 AE2C02D0 */  sw      $t4, 0x02D0($s1)           ## 000002D0
/* 05DB8 808C6F48 3C05808D */  lui     $a1, %hi(D_808CA618)       ## $a1 = 808D0000
/* 05DBC 808C6F4C 24A5A618 */  addiu   $a1, $a1, %lo(D_808CA618)  ## $a1 = 808CA618
/* 05DC0 808C6F50 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 05DC4 808C6F54 24061485 */  addiu   $a2, $zero, 0x1485         ## $a2 = 00001485
/* 05DC8 808C6F58 AC4F0000 */  sw      $t7, 0x0000($v0)           ## 00000000
/* 05DCC 808C6F5C 0C0346A2 */  jal     Matrix_NewMtx              
/* 05DD0 808C6F60 00409025 */  or      $s2, $v0, $zero            ## $s2 = 00000000
/* 05DD4 808C6F64 AE420004 */  sw      $v0, 0x0004($s2)           ## 00000004
/* 05DD8 808C6F68 8E2202D0 */  lw      $v0, 0x02D0($s1)           ## 000002D0
/* 05DDC 808C6F6C 24590008 */  addiu   $t9, $v0, 0x0008           ## $t9 = 00000008
/* 05DE0 808C6F70 AE3902D0 */  sw      $t9, 0x02D0($s1)           ## 000002D0
/* 05DE4 808C6F74 AC550004 */  sw      $s5, 0x0004($v0)           ## 00000004
/* 05DE8 808C6F78 AC560000 */  sw      $s6, 0x0000($v0)           ## 00000000
.L808C6F7C:
/* 05DEC 808C6F7C 26940001 */  addiu   $s4, $s4, 0x0001           ## $s4 = 00000001
/* 05DF0 808C6F80 0014A400 */  sll     $s4, $s4, 16               
/* 05DF4 808C6F84 0014A403 */  sra     $s4, $s4, 16               
/* 05DF8 808C6F88 2A810050 */  slti    $at, $s4, 0x0050           
/* 05DFC 808C6F8C 1420FFB5 */  bne     $at, $zero, .L808C6E64     
/* 05E00 808C6F90 26100030 */  addiu   $s0, $s0, 0x0030           ## $s0 = 00010030
/* 05E04 808C6F94 3C06808D */  lui     $a2, %hi(D_808CA62C)       ## $a2 = 808D0000
/* 05E08 808C6F98 24C6A62C */  addiu   $a2, $a2, %lo(D_808CA62C)  ## $a2 = 808CA62C
/* 05E0C 808C6F9C 27A4006C */  addiu   $a0, $sp, 0x006C           ## $a0 = FFFFFFDC
/* 05E10 808C6FA0 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 05E14 808C6FA4 0C031AD5 */  jal     Graph_CloseDisps              
/* 05E18 808C6FA8 2407148A */  addiu   $a3, $zero, 0x148A         ## $a3 = 0000148A
/* 05E1C 808C6FAC 8FBF0044 */  lw      $ra, 0x0044($sp)           
/* 05E20 808C6FB0 D7B40018 */  ldc1    $f20, 0x0018($sp)          
/* 05E24 808C6FB4 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 05E28 808C6FB8 8FB10024 */  lw      $s1, 0x0024($sp)           
/* 05E2C 808C6FBC 8FB20028 */  lw      $s2, 0x0028($sp)           
/* 05E30 808C6FC0 8FB3002C */  lw      $s3, 0x002C($sp)           
/* 05E34 808C6FC4 8FB40030 */  lw      $s4, 0x0030($sp)           
/* 05E38 808C6FC8 8FB50034 */  lw      $s5, 0x0034($sp)           
/* 05E3C 808C6FCC 8FB60038 */  lw      $s6, 0x0038($sp)           
/* 05E40 808C6FD0 8FB7003C */  lw      $s7, 0x003C($sp)           
/* 05E44 808C6FD4 8FBE0040 */  lw      $s8, 0x0040($sp)           
/* 05E48 808C6FD8 03E00008 */  jr      $ra                        
/* 05E4C 808C6FDC 27BD0090 */  addiu   $sp, $sp, 0x0090           ## $sp = 00000000
