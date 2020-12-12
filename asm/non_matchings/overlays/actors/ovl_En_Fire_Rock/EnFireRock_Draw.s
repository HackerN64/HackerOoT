.rdata
glabel D_80A12E58
    .asciz "../z_en_fire_rock.c"
    .balign 4

glabel D_80A12E6C
    .asciz "../z_en_fire_rock.c"
    .balign 4

glabel D_80A12E80
    .asciz "../z_en_fire_rock.c"
    .balign 4

.late_rodata
glabel D_80A12EE0
 .word 0x3C8EFA35
glabel D_80A12EE4
 .word 0x3C8EFA35
glabel D_80A12EE8
 .word 0x3C8EFA35, 0x00000000

.text
glabel EnFireRock_Draw
/* 00EB0 80A12AD0 27BDFFB0 */  addiu   $sp, $sp, 0xFFB0           ## $sp = FFFFFFB0
/* 00EB4 80A12AD4 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 00EB8 80A12AD8 AFB10018 */  sw      $s1, 0x0018($sp)           
/* 00EBC 80A12ADC AFB00014 */  sw      $s0, 0x0014($sp)           
/* 00EC0 80A12AE0 AFA50054 */  sw      $a1, 0x0054($sp)           
/* 00EC4 80A12AE4 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 00EC8 80A12AE8 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00ECC 80A12AEC 3C0680A1 */  lui     $a2, %hi(D_80A12E58)       ## $a2 = 80A10000
/* 00ED0 80A12AF0 24C62E58 */  addiu   $a2, $a2, %lo(D_80A12E58)  ## $a2 = 80A12E58
/* 00ED4 80A12AF4 27A40034 */  addiu   $a0, $sp, 0x0034           ## $a0 = FFFFFFE4
/* 00ED8 80A12AF8 240702EB */  addiu   $a3, $zero, 0x02EB         ## $a3 = 000002EB
/* 00EDC 80A12AFC 0C031AB1 */  jal     Graph_OpenDisps              
/* 00EE0 80A12B00 00A08825 */  or      $s1, $a1, $zero            ## $s1 = 00000000
/* 00EE4 80A12B04 C6040024 */  lwc1    $f4, 0x0024($s0)           ## 00000024
/* 00EE8 80A12B08 C6060170 */  lwc1    $f6, 0x0170($s0)           ## 00000170
/* 00EEC 80A12B0C C610002C */  lwc1    $f16, 0x002C($s0)          ## 0000002C
/* 00EF0 80A12B10 C6120178 */  lwc1    $f18, 0x0178($s0)          ## 00000178
/* 00EF4 80A12B14 46062300 */  add.s   $f12, $f4, $f6             
/* 00EF8 80A12B18 C6080028 */  lwc1    $f8, 0x0028($s0)           ## 00000028
/* 00EFC 80A12B1C C60A0174 */  lwc1    $f10, 0x0174($s0)          ## 00000174
/* 00F00 80A12B20 46128100 */  add.s   $f4, $f16, $f18            
/* 00F04 80A12B24 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 00F08 80A12B28 460A4380 */  add.s   $f14, $f8, $f10            
/* 00F0C 80A12B2C 44062000 */  mfc1    $a2, $f4                   
/* 00F10 80A12B30 0C034261 */  jal     Matrix_Translate              
/* 00F14 80A12B34 00000000 */  nop
/* 00F18 80A12B38 3C0180A1 */  lui     $at, %hi(D_80A12EE0)       ## $at = 80A10000
/* 00F1C 80A12B3C C4282EE0 */  lwc1    $f8, %lo(D_80A12EE0)($at)  
/* 00F20 80A12B40 C6060158 */  lwc1    $f6, 0x0158($s0)           ## 00000158
/* 00F24 80A12B44 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 00F28 80A12B48 46083302 */  mul.s   $f12, $f6, $f8             
/* 00F2C 80A12B4C 0C0342DC */  jal     Matrix_RotateX              
/* 00F30 80A12B50 00000000 */  nop
/* 00F34 80A12B54 3C0180A1 */  lui     $at, %hi(D_80A12EE4)       ## $at = 80A10000
/* 00F38 80A12B58 C4302EE4 */  lwc1    $f16, %lo(D_80A12EE4)($at) 
/* 00F3C 80A12B5C C60A015C */  lwc1    $f10, 0x015C($s0)          ## 0000015C
/* 00F40 80A12B60 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 00F44 80A12B64 46105302 */  mul.s   $f12, $f10, $f16           
/* 00F48 80A12B68 0C034348 */  jal     Matrix_RotateY              
/* 00F4C 80A12B6C 00000000 */  nop
/* 00F50 80A12B70 3C0180A1 */  lui     $at, %hi(D_80A12EE8)       ## $at = 80A10000
/* 00F54 80A12B74 C4242EE8 */  lwc1    $f4, %lo(D_80A12EE8)($at)  
/* 00F58 80A12B78 C6120160 */  lwc1    $f18, 0x0160($s0)          ## 00000160
/* 00F5C 80A12B7C 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 00F60 80A12B80 46049302 */  mul.s   $f12, $f18, $f4            
/* 00F64 80A12B84 0C0343B5 */  jal     Matrix_RotateZ              
/* 00F68 80A12B88 00000000 */  nop
/* 00F6C 80A12B8C C60C0050 */  lwc1    $f12, 0x0050($s0)          ## 00000050
/* 00F70 80A12B90 C60E0054 */  lwc1    $f14, 0x0054($s0)          ## 00000054
/* 00F74 80A12B94 8E060058 */  lw      $a2, 0x0058($s0)           ## 00000058
/* 00F78 80A12B98 0C0342A3 */  jal     Matrix_Scale              
/* 00F7C 80A12B9C 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 00F80 80A12BA0 8FAF0054 */  lw      $t7, 0x0054($sp)           
/* 00F84 80A12BA4 0C024F46 */  jal     func_80093D18              
/* 00F88 80A12BA8 8DE40000 */  lw      $a0, 0x0000($t7)           ## 00000000
/* 00F8C 80A12BAC 8E2202C0 */  lw      $v0, 0x02C0($s1)           ## 000002C0
/* 00F90 80A12BB0 3C08FF9B */  lui     $t0, 0xFF9B                ## $t0 = FF9B0000
/* 00F94 80A12BB4 350837FF */  ori     $t0, $t0, 0x37FF           ## $t0 = FF9B37FF
/* 00F98 80A12BB8 24580008 */  addiu   $t8, $v0, 0x0008           ## $t8 = 00000008
/* 00F9C 80A12BBC AE3802C0 */  sw      $t8, 0x02C0($s1)           ## 000002C0
/* 00FA0 80A12BC0 3C19FA00 */  lui     $t9, 0xFA00                ## $t9 = FA000000
/* 00FA4 80A12BC4 AC590000 */  sw      $t9, 0x0000($v0)           ## 00000000
/* 00FA8 80A12BC8 AC480004 */  sw      $t0, 0x0004($v0)           ## 00000004
/* 00FAC 80A12BCC 8E2202C0 */  lw      $v0, 0x02C0($s1)           ## 000002C0
/* 00FB0 80A12BD0 3C0B9BFF */  lui     $t3, 0x9BFF                ## $t3 = 9BFF0000
/* 00FB4 80A12BD4 356B37FF */  ori     $t3, $t3, 0x37FF           ## $t3 = 9BFF37FF
/* 00FB8 80A12BD8 24490008 */  addiu   $t1, $v0, 0x0008           ## $t1 = 00000008
/* 00FBC 80A12BDC AE2902C0 */  sw      $t1, 0x02C0($s1)           ## 000002C0
/* 00FC0 80A12BE0 3C0AFB00 */  lui     $t2, 0xFB00                ## $t2 = FB000000
/* 00FC4 80A12BE4 AC4A0000 */  sw      $t2, 0x0000($v0)           ## 00000000
/* 00FC8 80A12BE8 AC4B0004 */  sw      $t3, 0x0004($v0)           ## 00000004
/* 00FCC 80A12BEC 8E2202C0 */  lw      $v0, 0x02C0($s1)           ## 000002C0
/* 00FD0 80A12BF0 3C0DDA38 */  lui     $t5, 0xDA38                ## $t5 = DA380000
/* 00FD4 80A12BF4 35AD0003 */  ori     $t5, $t5, 0x0003           ## $t5 = DA380003
/* 00FD8 80A12BF8 244C0008 */  addiu   $t4, $v0, 0x0008           ## $t4 = 00000008
/* 00FDC 80A12BFC AE2C02C0 */  sw      $t4, 0x02C0($s1)           ## 000002C0
/* 00FE0 80A12C00 AC4D0000 */  sw      $t5, 0x0000($v0)           ## 00000000
/* 00FE4 80A12C04 8FAE0054 */  lw      $t6, 0x0054($sp)           
/* 00FE8 80A12C08 3C0580A1 */  lui     $a1, %hi(D_80A12E6C)       ## $a1 = 80A10000
/* 00FEC 80A12C0C 24A52E6C */  addiu   $a1, $a1, %lo(D_80A12E6C)  ## $a1 = 80A12E6C
/* 00FF0 80A12C10 24060300 */  addiu   $a2, $zero, 0x0300         ## $a2 = 00000300
/* 00FF4 80A12C14 00408025 */  or      $s0, $v0, $zero            ## $s0 = 00000000
/* 00FF8 80A12C18 0C0346A2 */  jal     Matrix_NewMtx              
/* 00FFC 80A12C1C 8DC40000 */  lw      $a0, 0x0000($t6)           ## 00000000
/* 01000 80A12C20 AE020004 */  sw      $v0, 0x0004($s0)           ## 00000004
/* 01004 80A12C24 8E2202C0 */  lw      $v0, 0x02C0($s1)           ## 000002C0
/* 01008 80A12C28 3C190600 */  lui     $t9, %hi(D_06000DE0)                ## $t9 = 06000000
/* 0100C 80A12C2C 27390DE0 */  addiu   $t9, $t9, %lo(D_06000DE0)           ## $t9 = 06000DE0
/* 01010 80A12C30 244F0008 */  addiu   $t7, $v0, 0x0008           ## $t7 = 00000008
/* 01014 80A12C34 AE2F02C0 */  sw      $t7, 0x02C0($s1)           ## 000002C0
/* 01018 80A12C38 3C18DE00 */  lui     $t8, 0xDE00                ## $t8 = DE000000
/* 0101C 80A12C3C AC580000 */  sw      $t8, 0x0000($v0)           ## 00000000
/* 01020 80A12C40 AC590004 */  sw      $t9, 0x0004($v0)           ## 00000004
/* 01024 80A12C44 8FA80054 */  lw      $t0, 0x0054($sp)           
/* 01028 80A12C48 3C0680A1 */  lui     $a2, %hi(D_80A12E80)       ## $a2 = 80A10000
/* 0102C 80A12C4C 24C62E80 */  addiu   $a2, $a2, %lo(D_80A12E80)  ## $a2 = 80A12E80
/* 01030 80A12C50 27A40034 */  addiu   $a0, $sp, 0x0034           ## $a0 = FFFFFFE4
/* 01034 80A12C54 24070305 */  addiu   $a3, $zero, 0x0305         ## $a3 = 00000305
/* 01038 80A12C58 0C031AD5 */  jal     Graph_CloseDisps              
/* 0103C 80A12C5C 8D050000 */  lw      $a1, 0x0000($t0)           ## 00000000
/* 01040 80A12C60 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 01044 80A12C64 8FB00014 */  lw      $s0, 0x0014($sp)           
/* 01048 80A12C68 8FB10018 */  lw      $s1, 0x0018($sp)           
/* 0104C 80A12C6C 03E00008 */  jr      $ra                        
/* 01050 80A12C70 27BD0050 */  addiu   $sp, $sp, 0x0050           ## $sp = 00000000
/* 01054 80A12C74 00000000 */  nop
/* 01058 80A12C78 00000000 */  nop
/* 0105C 80A12C7C 00000000 */  nop
