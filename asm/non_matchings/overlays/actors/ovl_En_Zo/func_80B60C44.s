.rdata
glabel D_80B62638
    .asciz "../z_en_zo_eff.c"
    .balign 4

glabel D_80B6264C
    .asciz "../z_en_zo_eff.c"
    .balign 4

glabel D_80B62660
    .asciz "../z_en_zo_eff.c"
    .balign 4

.text
glabel func_80B60C44
/* 00A24 80B60C44 27BDFF70 */  addiu   $sp, $sp, 0xFF70           ## $sp = FFFFFF70
/* 00A28 80B60C48 AFB60038 */  sw      $s6, 0x0038($sp)           
/* 00A2C 80B60C4C 00A0B025 */  or      $s6, $a1, $zero            ## $s6 = 00000000
/* 00A30 80B60C50 AFBF0044 */  sw      $ra, 0x0044($sp)           
/* 00A34 80B60C54 AFBE0040 */  sw      $s8, 0x0040($sp)           
/* 00A38 80B60C58 AFB7003C */  sw      $s7, 0x003C($sp)           
/* 00A3C 80B60C5C AFB50034 */  sw      $s5, 0x0034($sp)           
/* 00A40 80B60C60 AFB40030 */  sw      $s4, 0x0030($sp)           
/* 00A44 80B60C64 AFB3002C */  sw      $s3, 0x002C($sp)           
/* 00A48 80B60C68 AFB20028 */  sw      $s2, 0x0028($sp)           
/* 00A4C 80B60C6C AFB10024 */  sw      $s1, 0x0024($sp)           
/* 00A50 80B60C70 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 00A54 80B60C74 F7B40018 */  sdc1    $f20, 0x0018($sp)          
/* 00A58 80B60C78 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 00A5C 80B60C7C 249202FC */  addiu   $s2, $a0, 0x02FC           ## $s2 = 000002FC
/* 00A60 80B60C80 3C0680B6 */  lui     $a2, %hi(D_80B62638)       ## $a2 = 80B60000
/* 00A64 80B60C84 24C62638 */  addiu   $a2, $a2, %lo(D_80B62638)  ## $a2 = 80B62638
/* 00A68 80B60C88 27A40074 */  addiu   $a0, $sp, 0x0074           ## $a0 = FFFFFFE4
/* 00A6C 80B60C8C 2407012A */  addiu   $a3, $zero, 0x012A         ## $a3 = 0000012A
/* 00A70 80B60C90 0C031AB1 */  jal     Graph_OpenDisps              
/* 00A74 80B60C94 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 00A78 80B60C98 0000A825 */  or      $s5, $zero, $zero          ## $s5 = 00000000
/* 00A7C 80B60C9C 0C024F61 */  jal     func_80093D84              
/* 00A80 80B60CA0 8EC40000 */  lw      $a0, 0x0000($s6)           ## 00000000
/* 00A84 80B60CA4 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 00A88 80B60CA8 4481A000 */  mtc1    $at, $f20                  ## $f20 = 1.00
/* 00A8C 80B60CAC 00009825 */  or      $s3, $zero, $zero          ## $s3 = 00000000
/* 00A90 80B60CB0 241E0002 */  addiu   $s8, $zero, 0x0002         ## $s8 = 00000002
/* 00A94 80B60CB4 3C17DE00 */  lui     $s7, 0xDE00                ## $s7 = DE000000
.L80B60CB8:
/* 00A98 80B60CB8 924E0000 */  lbu     $t6, 0x0000($s2)           ## 000002FC
/* 00A9C 80B60CBC 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 00AA0 80B60CC0 34211DA0 */  ori     $at, $at, 0x1DA0           ## $at = 00011DA0
/* 00AA4 80B60CC4 17CE0042 */  bne     $s8, $t6, .L80B60DD0       
/* 00AA8 80B60CC8 02C18821 */  addu    $s1, $s6, $at              
/* 00AAC 80B60CCC 3C140600 */  lui     $s4, 0x0600                ## $s4 = 06000000
/* 00AB0 80B60CD0 16A00017 */  bne     $s5, $zero, .L80B60D30     
/* 00AB4 80B60CD4 26942510 */  addiu   $s4, $s4, 0x2510           ## $s4 = 06002510
/* 00AB8 80B60CD8 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 00ABC 80B60CDC 3C040600 */  lui     $a0, 0x0600                ## $a0 = 06000000
/* 00AC0 80B60CE0 248424A0 */  addiu   $a0, $a0, 0x24A0           ## $a0 = 060024A0
/* 00AC4 80B60CE4 244F0008 */  addiu   $t7, $v0, 0x0008           ## $t7 = 00000008
/* 00AC8 80B60CE8 AE0F02D0 */  sw      $t7, 0x02D0($s0)           ## 000002D0
/* 00ACC 80B60CEC AC440004 */  sw      $a0, 0x0004($v0)           ## 00000004
/* 00AD0 80B60CF0 AC570000 */  sw      $s7, 0x0000($v0)           ## 00000000
/* 00AD4 80B60CF4 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 00AD8 80B60CF8 3C19E700 */  lui     $t9, 0xE700                ## $t9 = E7000000
/* 00ADC 80B60CFC 3C0AC8C8 */  lui     $t2, 0xC8C8                ## $t2 = C8C80000
/* 00AE0 80B60D00 24580008 */  addiu   $t8, $v0, 0x0008           ## $t8 = 00000008
/* 00AE4 80B60D04 AE1802D0 */  sw      $t8, 0x02D0($s0)           ## 000002D0
/* 00AE8 80B60D08 AC400004 */  sw      $zero, 0x0004($v0)         ## 00000004
/* 00AEC 80B60D0C AC590000 */  sw      $t9, 0x0000($v0)           ## 00000000
/* 00AF0 80B60D10 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 00AF4 80B60D14 354AC800 */  ori     $t2, $t2, 0xC800           ## $t2 = C8C8C800
/* 00AF8 80B60D18 3C09FB00 */  lui     $t1, 0xFB00                ## $t1 = FB000000
/* 00AFC 80B60D1C 24480008 */  addiu   $t0, $v0, 0x0008           ## $t0 = 00000008
/* 00B00 80B60D20 AE0802D0 */  sw      $t0, 0x02D0($s0)           ## 000002D0
/* 00B04 80B60D24 24150001 */  addiu   $s5, $zero, 0x0001         ## $s5 = 00000001
/* 00B08 80B60D28 AC4A0004 */  sw      $t2, 0x0004($v0)           ## 00000004
/* 00B0C 80B60D2C AC490000 */  sw      $t1, 0x0000($v0)           ## 00000000
.L80B60D30:
/* 00B10 80B60D30 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 00B14 80B60D34 3C0CFA00 */  lui     $t4, 0xFA00                ## $t4 = FA000000
/* 00B18 80B60D38 3C01B4B4 */  lui     $at, 0xB4B4                ## $at = B4B40000
/* 00B1C 80B60D3C 244B0008 */  addiu   $t3, $v0, 0x0008           ## $t3 = 00000008
/* 00B20 80B60D40 AE0B02D0 */  sw      $t3, 0x02D0($s0)           ## 000002D0
/* 00B24 80B60D44 AC4C0000 */  sw      $t4, 0x0000($v0)           ## 00000000
/* 00B28 80B60D48 924E000F */  lbu     $t6, 0x000F($s2)           ## 0000030B
/* 00B2C 80B60D4C 3421B400 */  ori     $at, $at, 0xB400           ## $at = B4B4B400
/* 00B30 80B60D50 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 00B34 80B60D54 01C17825 */  or      $t7, $t6, $at              ## $t7 = B4B4B400
/* 00B38 80B60D58 AC4F0004 */  sw      $t7, 0x0004($v0)           ## 00000004
/* 00B3C 80B60D5C 8E46001C */  lw      $a2, 0x001C($s2)           ## 00000318
/* 00B40 80B60D60 C64E0018 */  lwc1    $f14, 0x0018($s2)          ## 00000314
/* 00B44 80B60D64 0C034261 */  jal     Matrix_Translate              
/* 00B48 80B60D68 C64C0014 */  lwc1    $f12, 0x0014($s2)          ## 00000310
/* 00B4C 80B60D6C 0C0347F5 */  jal     func_800D1FD4              
/* 00B50 80B60D70 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00B54 80B60D74 C64C0004 */  lwc1    $f12, 0x0004($s2)          ## 00000300
/* 00B58 80B60D78 4406A000 */  mfc1    $a2, $f20                  
/* 00B5C 80B60D7C 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 00B60 80B60D80 0C0342A3 */  jal     Matrix_Scale              
/* 00B64 80B60D84 46006386 */  mov.s   $f14, $f12                 
/* 00B68 80B60D88 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 00B6C 80B60D8C 3C19DA38 */  lui     $t9, 0xDA38                ## $t9 = DA380000
/* 00B70 80B60D90 37390003 */  ori     $t9, $t9, 0x0003           ## $t9 = DA380003
/* 00B74 80B60D94 24580008 */  addiu   $t8, $v0, 0x0008           ## $t8 = 00000008
/* 00B78 80B60D98 AE1802D0 */  sw      $t8, 0x02D0($s0)           ## 000002D0
/* 00B7C 80B60D9C 3C0580B6 */  lui     $a1, %hi(D_80B6264C)       ## $a1 = 80B60000
/* 00B80 80B60DA0 AC590000 */  sw      $t9, 0x0000($v0)           ## 00000000
/* 00B84 80B60DA4 8EC40000 */  lw      $a0, 0x0000($s6)           ## 00000000
/* 00B88 80B60DA8 24A5264C */  addiu   $a1, $a1, %lo(D_80B6264C)  ## $a1 = 80B6264C
/* 00B8C 80B60DAC 24060145 */  addiu   $a2, $zero, 0x0145         ## $a2 = 00000145
/* 00B90 80B60DB0 0C0346A2 */  jal     Matrix_NewMtx              
/* 00B94 80B60DB4 00408825 */  or      $s1, $v0, $zero            ## $s1 = 00000000
/* 00B98 80B60DB8 AE220004 */  sw      $v0, 0x0004($s1)           ## 00000004
/* 00B9C 80B60DBC 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 00BA0 80B60DC0 24480008 */  addiu   $t0, $v0, 0x0008           ## $t0 = 00000008
/* 00BA4 80B60DC4 AE0802D0 */  sw      $t0, 0x02D0($s0)           ## 000002D0
/* 00BA8 80B60DC8 AC540004 */  sw      $s4, 0x0004($v0)           ## 00000004
/* 00BAC 80B60DCC AC570000 */  sw      $s7, 0x0000($v0)           ## 00000000
.L80B60DD0:
/* 00BB0 80B60DD0 26730001 */  addiu   $s3, $s3, 0x0001           ## $s3 = 00000001
/* 00BB4 80B60DD4 00139C00 */  sll     $s3, $s3, 16               
/* 00BB8 80B60DD8 00139C03 */  sra     $s3, $s3, 16               
/* 00BBC 80B60DDC 2A61000F */  slti    $at, $s3, 0x000F           
/* 00BC0 80B60DE0 1420FFB5 */  bne     $at, $zero, .L80B60CB8     
/* 00BC4 80B60DE4 26520038 */  addiu   $s2, $s2, 0x0038           ## $s2 = 00000334
/* 00BC8 80B60DE8 3C0680B6 */  lui     $a2, %hi(D_80B62660)       ## $a2 = 80B60000
/* 00BCC 80B60DEC 24C62660 */  addiu   $a2, $a2, %lo(D_80B62660)  ## $a2 = 80B62660
/* 00BD0 80B60DF0 27A40074 */  addiu   $a0, $sp, 0x0074           ## $a0 = FFFFFFE4
/* 00BD4 80B60DF4 8EC50000 */  lw      $a1, 0x0000($s6)           ## 00000000
/* 00BD8 80B60DF8 0C031AD5 */  jal     Graph_CloseDisps              
/* 00BDC 80B60DFC 2407014B */  addiu   $a3, $zero, 0x014B         ## $a3 = 0000014B
/* 00BE0 80B60E00 8FBF0044 */  lw      $ra, 0x0044($sp)           
/* 00BE4 80B60E04 D7B40018 */  ldc1    $f20, 0x0018($sp)          
/* 00BE8 80B60E08 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 00BEC 80B60E0C 8FB10024 */  lw      $s1, 0x0024($sp)           
/* 00BF0 80B60E10 8FB20028 */  lw      $s2, 0x0028($sp)           
/* 00BF4 80B60E14 8FB3002C */  lw      $s3, 0x002C($sp)           
/* 00BF8 80B60E18 8FB40030 */  lw      $s4, 0x0030($sp)           
/* 00BFC 80B60E1C 8FB50034 */  lw      $s5, 0x0034($sp)           
/* 00C00 80B60E20 8FB60038 */  lw      $s6, 0x0038($sp)           
/* 00C04 80B60E24 8FB7003C */  lw      $s7, 0x003C($sp)           
/* 00C08 80B60E28 8FBE0040 */  lw      $s8, 0x0040($sp)           
/* 00C0C 80B60E2C 03E00008 */  jr      $ra                        
/* 00C10 80B60E30 27BD0090 */  addiu   $sp, $sp, 0x0090           ## $sp = 00000000
