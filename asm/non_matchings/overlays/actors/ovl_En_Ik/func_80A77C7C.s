.rdata
glabel D_80A7887C
    .asciz "../z_en_ik_inConfrontion.c"
    .balign 4

glabel D_80A78898
    .asciz "../z_en_ik_inConfrontion.c"
    .balign 4

glabel D_80A788B4
    .asciz "../z_en_ik_inConfrontion.c"
    .balign 4

glabel D_80A788D0
    .asciz "../z_en_ik_inConfrontion.c"
    .balign 4

glabel D_80A788EC
    .asciz "../z_en_ik_inConfrontion.c"
    .balign 4

glabel D_80A78908
    .asciz "../z_en_ik_inConfrontion.c"
    .balign 4

glabel D_80A78924
    .asciz "../z_en_ik_inConfrontion.c"
    .balign 4

.late_rodata
glabel jtbl_80A78A3C
.word L80A77CDC
.word L80A77EA4
.word L80A77EA4
.word L80A77EA4
.word L80A77EA4
.word L80A77EA4
.word L80A77EA4
.word L80A77EA4
.word L80A77EA4
.word L80A77EA4
.word L80A77D38
.word L80A77EA4
.word L80A77D94
.word L80A77EA4
.word L80A77DF0
.word L80A77E4C
.word 0x00000000

.text
glabel func_80A77C7C
/* 0396C 80A77C7C 27BDFF98 */  addiu   $sp, $sp, 0xFF98           ## $sp = FFFFFF98
/* 03970 80A77C80 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 03974 80A77C84 AFB00018 */  sw      $s0, 0x0018($sp)           
/* 03978 80A77C88 AFA40068 */  sw      $a0, 0x0068($sp)           
/* 0397C 80A77C8C AFA5006C */  sw      $a1, 0x006C($sp)           
/* 03980 80A77C90 AFA60070 */  sw      $a2, 0x0070($sp)           
/* 03984 80A77C94 AFA70074 */  sw      $a3, 0x0074($sp)           
/* 03988 80A77C98 8C900000 */  lw      $s0, 0x0000($a0)           ## 00000000
/* 0398C 80A77C9C 3C0680A8 */  lui     $a2, %hi(D_80A7887C)       ## $a2 = 80A80000
/* 03990 80A77CA0 24C6887C */  addiu   $a2, $a2, %lo(D_80A7887C)  ## $a2 = 80A7887C
/* 03994 80A77CA4 27A40050 */  addiu   $a0, $sp, 0x0050           ## $a0 = FFFFFFE8
/* 03998 80A77CA8 2407023B */  addiu   $a3, $zero, 0x023B         ## $a3 = 0000023B
/* 0399C 80A77CAC 0C031AB1 */  jal     Graph_OpenDisps              
/* 039A0 80A77CB0 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 039A4 80A77CB4 8FAF006C */  lw      $t7, 0x006C($sp)           
/* 039A8 80A77CB8 25F8FFF4 */  addiu   $t8, $t7, 0xFFF4           ## $t8 = FFFFFFF4
/* 039AC 80A77CBC 2F010010 */  sltiu   $at, $t8, 0x0010           
/* 039B0 80A77CC0 10200078 */  beq     $at, $zero, .L80A77EA4     
/* 039B4 80A77CC4 0018C080 */  sll     $t8, $t8,  2               
/* 039B8 80A77CC8 3C0180A8 */  lui     $at, %hi(jtbl_80A78A3C)       ## $at = 80A80000
/* 039BC 80A77CCC 00380821 */  addu    $at, $at, $t8              
/* 039C0 80A77CD0 8C388A3C */  lw      $t8, %lo(jtbl_80A78A3C)($at)  
/* 039C4 80A77CD4 03000008 */  jr      $t8                        
/* 039C8 80A77CD8 00000000 */  nop
glabel L80A77CDC
/* 039CC 80A77CDC 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 039D0 80A77CE0 3C08DA38 */  lui     $t0, 0xDA38                ## $t0 = DA380000
/* 039D4 80A77CE4 35080003 */  ori     $t0, $t0, 0x0003           ## $t0 = DA380003
/* 039D8 80A77CE8 24590008 */  addiu   $t9, $v0, 0x0008           ## $t9 = 00000008
/* 039DC 80A77CEC AE1902D0 */  sw      $t9, 0x02D0($s0)           ## 000002D0
/* 039E0 80A77CF0 3C0580A8 */  lui     $a1, %hi(D_80A78898)       ## $a1 = 80A80000
/* 039E4 80A77CF4 AC480000 */  sw      $t0, 0x0000($v0)           ## 00000000
/* 039E8 80A77CF8 24A58898 */  addiu   $a1, $a1, %lo(D_80A78898)  ## $a1 = 80A78898
/* 039EC 80A77CFC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 039F0 80A77D00 2406023F */  addiu   $a2, $zero, 0x023F         ## $a2 = 0000023F
/* 039F4 80A77D04 0C0346A2 */  jal     Matrix_NewMtx              
/* 039F8 80A77D08 AFA2004C */  sw      $v0, 0x004C($sp)           
/* 039FC 80A77D0C 8FA3004C */  lw      $v1, 0x004C($sp)           
/* 03A00 80A77D10 3C0B0601 */  lui     $t3, 0x0601                ## $t3 = 06010000
/* 03A04 80A77D14 256B6D88 */  addiu   $t3, $t3, 0x6D88           ## $t3 = 06016D88
/* 03A08 80A77D18 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 03A0C 80A77D1C 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 03A10 80A77D20 3C0ADE00 */  lui     $t2, 0xDE00                ## $t2 = DE000000
/* 03A14 80A77D24 24490008 */  addiu   $t1, $v0, 0x0008           ## $t1 = 00000008
/* 03A18 80A77D28 AE0902D0 */  sw      $t1, 0x02D0($s0)           ## 000002D0
/* 03A1C 80A77D2C AC4B0004 */  sw      $t3, 0x0004($v0)           ## 00000004
/* 03A20 80A77D30 1000005C */  beq     $zero, $zero, .L80A77EA4   
/* 03A24 80A77D34 AC4A0000 */  sw      $t2, 0x0000($v0)           ## 00000000
glabel L80A77D38
/* 03A28 80A77D38 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 03A2C 80A77D3C 3C0DDA38 */  lui     $t5, 0xDA38                ## $t5 = DA380000
/* 03A30 80A77D40 35AD0003 */  ori     $t5, $t5, 0x0003           ## $t5 = DA380003
/* 03A34 80A77D44 244C0008 */  addiu   $t4, $v0, 0x0008           ## $t4 = 00000008
/* 03A38 80A77D48 AE0C02D0 */  sw      $t4, 0x02D0($s0)           ## 000002D0
/* 03A3C 80A77D4C 3C0580A8 */  lui     $a1, %hi(D_80A788B4)       ## $a1 = 80A80000
/* 03A40 80A77D50 AC4D0000 */  sw      $t5, 0x0000($v0)           ## 00000000
/* 03A44 80A77D54 24A588B4 */  addiu   $a1, $a1, %lo(D_80A788B4)  ## $a1 = 80A788B4
/* 03A48 80A77D58 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 03A4C 80A77D5C 24060245 */  addiu   $a2, $zero, 0x0245         ## $a2 = 00000245
/* 03A50 80A77D60 0C0346A2 */  jal     Matrix_NewMtx              
/* 03A54 80A77D64 AFA20044 */  sw      $v0, 0x0044($sp)           
/* 03A58 80A77D68 8FA30044 */  lw      $v1, 0x0044($sp)           
/* 03A5C 80A77D6C 3C180601 */  lui     $t8, 0x0601                ## $t8 = 06010000
/* 03A60 80A77D70 27186F88 */  addiu   $t8, $t8, 0x6F88           ## $t8 = 06016F88
/* 03A64 80A77D74 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 03A68 80A77D78 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 03A6C 80A77D7C 3C0FDE00 */  lui     $t7, 0xDE00                ## $t7 = DE000000
/* 03A70 80A77D80 244E0008 */  addiu   $t6, $v0, 0x0008           ## $t6 = 00000008
/* 03A74 80A77D84 AE0E02D0 */  sw      $t6, 0x02D0($s0)           ## 000002D0
/* 03A78 80A77D88 AC580004 */  sw      $t8, 0x0004($v0)           ## 00000004
/* 03A7C 80A77D8C 10000045 */  beq     $zero, $zero, .L80A77EA4   
/* 03A80 80A77D90 AC4F0000 */  sw      $t7, 0x0000($v0)           ## 00000000
glabel L80A77D94
/* 03A84 80A77D94 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 03A88 80A77D98 3C08DA38 */  lui     $t0, 0xDA38                ## $t0 = DA380000
/* 03A8C 80A77D9C 35080003 */  ori     $t0, $t0, 0x0003           ## $t0 = DA380003
/* 03A90 80A77DA0 24590008 */  addiu   $t9, $v0, 0x0008           ## $t9 = 00000008
/* 03A94 80A77DA4 AE1902D0 */  sw      $t9, 0x02D0($s0)           ## 000002D0
/* 03A98 80A77DA8 3C0580A8 */  lui     $a1, %hi(D_80A788D0)       ## $a1 = 80A80000
/* 03A9C 80A77DAC AC480000 */  sw      $t0, 0x0000($v0)           ## 00000000
/* 03AA0 80A77DB0 24A588D0 */  addiu   $a1, $a1, %lo(D_80A788D0)  ## $a1 = 80A788D0
/* 03AA4 80A77DB4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 03AA8 80A77DB8 2406024B */  addiu   $a2, $zero, 0x024B         ## $a2 = 0000024B
/* 03AAC 80A77DBC 0C0346A2 */  jal     Matrix_NewMtx              
/* 03AB0 80A77DC0 AFA2003C */  sw      $v0, 0x003C($sp)           
/* 03AB4 80A77DC4 8FA3003C */  lw      $v1, 0x003C($sp)           
/* 03AB8 80A77DC8 3C0B0601 */  lui     $t3, 0x0601                ## $t3 = 06010000
/* 03ABC 80A77DCC 256B6EE8 */  addiu   $t3, $t3, 0x6EE8           ## $t3 = 06016EE8
/* 03AC0 80A77DD0 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 03AC4 80A77DD4 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 03AC8 80A77DD8 3C0ADE00 */  lui     $t2, 0xDE00                ## $t2 = DE000000
/* 03ACC 80A77DDC 24490008 */  addiu   $t1, $v0, 0x0008           ## $t1 = 00000008
/* 03AD0 80A77DE0 AE0902D0 */  sw      $t1, 0x02D0($s0)           ## 000002D0
/* 03AD4 80A77DE4 AC4B0004 */  sw      $t3, 0x0004($v0)           ## 00000004
/* 03AD8 80A77DE8 1000002E */  beq     $zero, $zero, .L80A77EA4   
/* 03ADC 80A77DEC AC4A0000 */  sw      $t2, 0x0000($v0)           ## 00000000
glabel L80A77DF0
/* 03AE0 80A77DF0 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 03AE4 80A77DF4 3C0DDA38 */  lui     $t5, 0xDA38                ## $t5 = DA380000
/* 03AE8 80A77DF8 35AD0003 */  ori     $t5, $t5, 0x0003           ## $t5 = DA380003
/* 03AEC 80A77DFC 244C0008 */  addiu   $t4, $v0, 0x0008           ## $t4 = 00000008
/* 03AF0 80A77E00 AE0C02D0 */  sw      $t4, 0x02D0($s0)           ## 000002D0
/* 03AF4 80A77E04 3C0580A8 */  lui     $a1, %hi(D_80A788EC)       ## $a1 = 80A80000
/* 03AF8 80A77E08 AC4D0000 */  sw      $t5, 0x0000($v0)           ## 00000000
/* 03AFC 80A77E0C 24A588EC */  addiu   $a1, $a1, %lo(D_80A788EC)  ## $a1 = 80A788EC
/* 03B00 80A77E10 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 03B04 80A77E14 24060251 */  addiu   $a2, $zero, 0x0251         ## $a2 = 00000251
/* 03B08 80A77E18 0C0346A2 */  jal     Matrix_NewMtx              
/* 03B0C 80A77E1C AFA20034 */  sw      $v0, 0x0034($sp)           
/* 03B10 80A77E20 8FA30034 */  lw      $v1, 0x0034($sp)           
/* 03B14 80A77E24 3C180601 */  lui     $t8, 0x0601                ## $t8 = 06010000
/* 03B18 80A77E28 27186BE0 */  addiu   $t8, $t8, 0x6BE0           ## $t8 = 06016BE0
/* 03B1C 80A77E2C AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 03B20 80A77E30 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 03B24 80A77E34 3C0FDE00 */  lui     $t7, 0xDE00                ## $t7 = DE000000
/* 03B28 80A77E38 244E0008 */  addiu   $t6, $v0, 0x0008           ## $t6 = 00000008
/* 03B2C 80A77E3C AE0E02D0 */  sw      $t6, 0x02D0($s0)           ## 000002D0
/* 03B30 80A77E40 AC580004 */  sw      $t8, 0x0004($v0)           ## 00000004
/* 03B34 80A77E44 10000017 */  beq     $zero, $zero, .L80A77EA4   
/* 03B38 80A77E48 AC4F0000 */  sw      $t7, 0x0000($v0)           ## 00000000
glabel L80A77E4C
/* 03B3C 80A77E4C 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 03B40 80A77E50 3C08DA38 */  lui     $t0, 0xDA38                ## $t0 = DA380000
/* 03B44 80A77E54 35080003 */  ori     $t0, $t0, 0x0003           ## $t0 = DA380003
/* 03B48 80A77E58 24590008 */  addiu   $t9, $v0, 0x0008           ## $t9 = 00000008
/* 03B4C 80A77E5C AE1902D0 */  sw      $t9, 0x02D0($s0)           ## 000002D0
/* 03B50 80A77E60 3C0580A8 */  lui     $a1, %hi(D_80A78908)       ## $a1 = 80A80000
/* 03B54 80A77E64 AC480000 */  sw      $t0, 0x0000($v0)           ## 00000000
/* 03B58 80A77E68 24A58908 */  addiu   $a1, $a1, %lo(D_80A78908)  ## $a1 = 80A78908
/* 03B5C 80A77E6C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 03B60 80A77E70 24060257 */  addiu   $a2, $zero, 0x0257         ## $a2 = 00000257
/* 03B64 80A77E74 0C0346A2 */  jal     Matrix_NewMtx              
/* 03B68 80A77E78 AFA2002C */  sw      $v0, 0x002C($sp)           
/* 03B6C 80A77E7C 8FA3002C */  lw      $v1, 0x002C($sp)           
/* 03B70 80A77E80 3C0B0601 */  lui     $t3, 0x0601                ## $t3 = 06010000
/* 03B74 80A77E84 256B6CD8 */  addiu   $t3, $t3, 0x6CD8           ## $t3 = 06016CD8
/* 03B78 80A77E88 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 03B7C 80A77E8C 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 03B80 80A77E90 3C0ADE00 */  lui     $t2, 0xDE00                ## $t2 = DE000000
/* 03B84 80A77E94 24490008 */  addiu   $t1, $v0, 0x0008           ## $t1 = 00000008
/* 03B88 80A77E98 AE0902D0 */  sw      $t1, 0x02D0($s0)           ## 000002D0
/* 03B8C 80A77E9C AC4B0004 */  sw      $t3, 0x0004($v0)           ## 00000004
/* 03B90 80A77EA0 AC4A0000 */  sw      $t2, 0x0000($v0)           ## 00000000
glabel L80A77EA4
.L80A77EA4:
/* 03B94 80A77EA4 3C0680A8 */  lui     $a2, %hi(D_80A78924)       ## $a2 = 80A80000
/* 03B98 80A77EA8 24C68924 */  addiu   $a2, $a2, %lo(D_80A78924)  ## $a2 = 80A78924
/* 03B9C 80A77EAC 27A40050 */  addiu   $a0, $sp, 0x0050           ## $a0 = FFFFFFE8
/* 03BA0 80A77EB0 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 03BA4 80A77EB4 0C031AD5 */  jal     Graph_CloseDisps              
/* 03BA8 80A77EB8 2407025C */  addiu   $a3, $zero, 0x025C         ## $a3 = 0000025C
/* 03BAC 80A77EBC 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 03BB0 80A77EC0 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 03BB4 80A77EC4 27BD0068 */  addiu   $sp, $sp, 0x0068           ## $sp = 00000000
/* 03BB8 80A77EC8 03E00008 */  jr      $ra                        
/* 03BBC 80A77ECC 00000000 */  nop
