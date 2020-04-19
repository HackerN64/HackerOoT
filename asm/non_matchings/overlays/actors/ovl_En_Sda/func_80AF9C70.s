.rdata
glabel D_80AFA498
    .asciz "../z_en_sda.c"
    .balign 4

glabel D_80AFA4A8
    .asciz "SDA D 1\n"
    .balign 4

glabel D_80AFA4B4
    .asciz "../z_en_sda.c"
    .balign 4

glabel D_80AFA4C4
    .asciz "../z_en_sda.c"
    .balign 4

glabel D_80AFA4D4
    .asciz "SDA D 2\n"
    .balign 4

glabel D_80AFA4E0
    .asciz "../z_en_sda.c"
    .balign 4

.late_rodata
glabel D_80AFA500
    .float 0.6

.text
glabel func_80AF9C70
/* 00E50 80AF9C70 27BDFF58 */  addiu   $sp, $sp, 0xFF58           ## $sp = FFFFFF58
/* 00E54 80AF9C74 AFBF0034 */  sw      $ra, 0x0034($sp)           
/* 00E58 80AF9C78 AFB40030 */  sw      $s4, 0x0030($sp)           
/* 00E5C 80AF9C7C AFB3002C */  sw      $s3, 0x002C($sp)           
/* 00E60 80AF9C80 AFB20028 */  sw      $s2, 0x0028($sp)           
/* 00E64 80AF9C84 AFB10024 */  sw      $s1, 0x0024($sp)           
/* 00E68 80AF9C88 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 00E6C 80AF9C8C F7B40018 */  sdc1    $f20, 0x0018($sp)          
/* 00E70 80AF9C90 AFA400A8 */  sw      $a0, 0x00A8($sp)           
/* 00E74 80AF9C94 8CD20000 */  lw      $s2, 0x0000($a2)           ## 00000000
/* 00E78 80AF9C98 00C0A025 */  or      $s4, $a2, $zero            ## $s4 = 00000000
/* 00E7C 80AF9C9C 00A08825 */  or      $s1, $a1, $zero            ## $s1 = 00000000
/* 00E80 80AF9CA0 3C0680B0 */  lui     $a2, %hi(D_80AFA498)       ## $a2 = 80B00000
/* 00E84 80AF9CA4 24C6A498 */  addiu   $a2, $a2, %lo(D_80AFA498)  ## $a2 = 80AFA498
/* 00E88 80AF9CA8 27A40080 */  addiu   $a0, $sp, 0x0080           ## $a0 = FFFFFFD8
/* 00E8C 80AF9CAC 2407033A */  addiu   $a3, $zero, 0x033A         ## $a3 = 0000033A
/* 00E90 80AF9CB0 0C031AB1 */  jal     Graph_OpenDisps              
/* 00E94 80AF9CB4 02402825 */  or      $a1, $s2, $zero            ## $a1 = 00000000
/* 00E98 80AF9CB8 3C0480B0 */  lui     $a0, %hi(D_80AFA4A8)       ## $a0 = 80B00000
/* 00E9C 80AF9CBC 0C00084C */  jal     osSyncPrintf
              
/* 00EA0 80AF9CC0 2484A4A8 */  addiu   $a0, $a0, %lo(D_80AFA4A8)  ## $a0 = 80AFA4A8
/* 00EA4 80AF9CC4 0C025011 */  jal     func_80094044              
/* 00EA8 80AF9CC8 8E840000 */  lw      $a0, 0x0000($s4)           ## 00000000
/* 00EAC 80AF9CCC 8E4302D0 */  lw      $v1, 0x02D0($s2)           ## 000002D0
/* 00EB0 80AF9CD0 3C138016 */  lui     $s3, %hi(gGameInfo)
/* 00EB4 80AF9CD4 3C0FFA00 */  lui     $t7, 0xFA00                ## $t7 = FA000000
/* 00EB8 80AF9CD8 246E0008 */  addiu   $t6, $v1, 0x0008           ## $t6 = 00000008
/* 00EBC 80AF9CDC AE4E02D0 */  sw      $t6, 0x02D0($s2)           ## 000002D0
/* 00EC0 80AF9CE0 2673FA90 */  addiu   $s3, %lo(gGameInfo)
/* 00EC4 80AF9CE4 AC6F0000 */  sw      $t7, 0x0000($v1)           ## 00000000
/* 00EC8 80AF9CE8 8E780000 */  lw      $t8, 0x0000($s3)           ## 8015FA90
/* 00ECC 80AF9CEC 3C0BFB00 */  lui     $t3, 0xFB00                ## $t3 = FB000000
/* 00ED0 80AF9CF0 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 00ED4 80AF9CF4 8719133C */  lh      $t9, 0x133C($t8)           ## 0000133C
/* 00ED8 80AF9CF8 27280032 */  addiu   $t0, $t9, 0x0032           ## $t0 = 00000032
/* 00EDC 80AF9CFC 310900FF */  andi    $t1, $t0, 0x00FF           ## $t1 = 00000032
/* 00EE0 80AF9D00 AC690004 */  sw      $t1, 0x0004($v1)           ## 00000004
/* 00EE4 80AF9D04 8E4302D0 */  lw      $v1, 0x02D0($s2)           ## 000002D0
/* 00EE8 80AF9D08 246A0008 */  addiu   $t2, $v1, 0x0008           ## $t2 = 00000008
/* 00EEC 80AF9D0C AE4A02D0 */  sw      $t2, 0x02D0($s2)           ## 000002D0
/* 00EF0 80AF9D10 AC600004 */  sw      $zero, 0x0004($v1)         ## 00000004
/* 00EF4 80AF9D14 AC6B0000 */  sw      $t3, 0x0000($v1)           ## 00000000
/* 00EF8 80AF9D18 8E26002C */  lw      $a2, 0x002C($s1)           ## 0000002C
/* 00EFC 80AF9D1C C62E0080 */  lwc1    $f14, 0x0080($s1)          ## 00000080
/* 00F00 80AF9D20 0C034261 */  jal     Matrix_Translate              
/* 00F04 80AF9D24 C62C0024 */  lwc1    $f12, 0x0024($s1)          ## 00000024
/* 00F08 80AF9D28 8E6C0000 */  lw      $t4, 0x0000($s3)           ## 8015FA90
/* 00F0C 80AF9D2C 3C0142C8 */  lui     $at, 0x42C8                ## $at = 42C80000
/* 00F10 80AF9D30 44814000 */  mtc1    $at, $f8                   ## $f8 = 100.00
/* 00F14 80AF9D34 858D133A */  lh      $t5, 0x133A($t4)           ## 0000133A
/* 00F18 80AF9D38 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 00F1C 80AF9D3C 448D2000 */  mtc1    $t5, $f4                   ## $f4 = 0.00
/* 00F20 80AF9D40 00000000 */  nop
/* 00F24 80AF9D44 468021A0 */  cvt.s.w $f6, $f4                   
/* 00F28 80AF9D48 0C034348 */  jal     Matrix_RotateY              
/* 00F2C 80AF9D4C 46083303 */  div.s   $f12, $f6, $f8             
/* 00F30 80AF9D50 8E6E0000 */  lw      $t6, 0x0000($s3)           ## 8015FA90
/* 00F34 80AF9D54 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 00F38 80AF9D58 4481A000 */  mtc1    $at, $f20                  ## $f20 = 1.00
/* 00F3C 80AF9D5C 85CF1352 */  lh      $t7, 0x1352($t6)           ## 00001352
/* 00F40 80AF9D60 3C014120 */  lui     $at, 0x4120                ## $at = 41200000
/* 00F44 80AF9D64 44819000 */  mtc1    $at, $f18                  ## $f18 = 10.00
/* 00F48 80AF9D68 448F5000 */  mtc1    $t7, $f10                  ## $f10 = 0.00
/* 00F4C 80AF9D6C 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 00F50 80AF9D70 4600A306 */  mov.s   $f12, $f20                 
/* 00F54 80AF9D74 46805420 */  cvt.s.w $f16, $f10                 
/* 00F58 80AF9D78 4600A386 */  mov.s   $f14, $f20                 
/* 00F5C 80AF9D7C 46128103 */  div.s   $f4, $f16, $f18            
/* 00F60 80AF9D80 46142180 */  add.s   $f6, $f4, $f20             
/* 00F64 80AF9D84 44063000 */  mfc1    $a2, $f6                   
/* 00F68 80AF9D88 0C0342A3 */  jal     Matrix_Scale              
/* 00F6C 80AF9D8C 00000000 */  nop
/* 00F70 80AF9D90 8E700000 */  lw      $s0, 0x0000($s3)           ## 8015FA90
/* 00F74 80AF9D94 3C014120 */  lui     $at, 0x4120                ## $at = 41200000
/* 00F78 80AF9D98 44811000 */  mtc1    $at, $f2                   ## $f2 = 10.00
/* 00F7C 80AF9D9C 86181350 */  lh      $t8, 0x1350($s0)           ## 00001350
/* 00F80 80AF9DA0 86191340 */  lh      $t9, 0x1340($s0)           ## 00001340
/* 00F84 80AF9DA4 3C014000 */  lui     $at, 0x4000                ## $at = 40000000
/* 00F88 80AF9DA8 44984000 */  mtc1    $t8, $f8                   ## $f8 = 0.00
/* 00F8C 80AF9DAC 44819000 */  mtc1    $at, $f18                  ## $f18 = 2.00
/* 00F90 80AF9DB0 C6240028 */  lwc1    $f4, 0x0028($s1)           ## 00000028
/* 00F94 80AF9DB4 468042A0 */  cvt.s.w $f10, $f8                  
/* 00F98 80AF9DB8 C6260080 */  lwc1    $f6, 0x0080($s1)           ## 00000080
/* 00F9C 80AF9DBC 86081342 */  lh      $t0, 0x1342($s0)           ## 00001342
/* 00FA0 80AF9DC0 860A1348 */  lh      $t2, 0x1348($s0)           ## 00001348
/* 00FA4 80AF9DC4 3C0141A0 */  lui     $at, 0x41A0                ## $at = 41A00000
/* 00FA8 80AF9DC8 46062201 */  sub.s   $f8, $f4, $f6              
/* 00FAC 80AF9DCC 2509FFFB */  addiu   $t1, $t0, 0xFFFB           ## $t1 = FFFFFFFB
/* 00FB0 80AF9DD0 44892000 */  mtc1    $t1, $f4                   ## $f4 = NaN
/* 00FB4 80AF9DD4 46025403 */  div.s   $f16, $f10, $f2            
/* 00FB8 80AF9DD8 44995000 */  mtc1    $t9, $f10                  ## $f10 = 0.00
/* 00FBC 80AF9DDC 44807000 */  mtc1    $zero, $f14                ## $f14 = 0.00
/* 00FC0 80AF9DE0 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 00FC4 80AF9DE4 468021A0 */  cvt.s.w $f6, $f4                   
/* 00FC8 80AF9DE8 46128300 */  add.s   $f12, $f16, $f18           
/* 00FCC 80AF9DEC 46805420 */  cvt.s.w $f16, $f10                 
/* 00FD0 80AF9DF0 46104480 */  add.s   $f18, $f8, $f16            
/* 00FD4 80AF9DF4 448A8000 */  mtc1    $t2, $f16                  ## $f16 = 0.00
/* 00FD8 80AF9DF8 46069282 */  mul.s   $f10, $f18, $f6            
/* 00FDC 80AF9DFC 44813000 */  mtc1    $at, $f6                   ## $f6 = 20.00
/* 00FE0 80AF9E00 46808120 */  cvt.s.w $f4, $f16                  
/* 00FE4 80AF9E04 46025203 */  div.s   $f8, $f10, $f2             
/* 00FE8 80AF9E08 46082480 */  add.s   $f18, $f4, $f8             
/* 00FEC 80AF9E0C 46069001 */  sub.s   $f0, $f18, $f6             
/* 00FF0 80AF9E10 44060000 */  mfc1    $a2, $f0                   
/* 00FF4 80AF9E14 0C034261 */  jal     Matrix_Translate              
/* 00FF8 80AF9E18 00000000 */  nop
/* 00FFC 80AF9E1C 8E700000 */  lw      $s0, 0x0000($s3)           ## 8015FA90
/* 01000 80AF9E20 3C01447A */  lui     $at, 0x447A                ## $at = 447A0000
/* 01004 80AF9E24 44810000 */  mtc1    $at, $f0                   ## $f0 = 1000.00
/* 01008 80AF9E28 860D134A */  lh      $t5, 0x134A($s0)           ## 0000134A
/* 0100C 80AF9E2C 860B1344 */  lh      $t3, 0x1344($s0)           ## 00001344
/* 01010 80AF9E30 3C0180B0 */  lui     $at, %hi(D_80AFA500)       ## $at = 80B00000
/* 01014 80AF9E34 25AEFF06 */  addiu   $t6, $t5, 0xFF06           ## $t6 = FFFFFF06
/* 01018 80AF9E38 448E4000 */  mtc1    $t6, $f8                   ## $f8 = NaN
/* 0101C 80AF9E3C 256CFF06 */  addiu   $t4, $t3, 0xFF06           ## $t4 = FFFFFF06
/* 01020 80AF9E40 448C5000 */  mtc1    $t4, $f10                  ## $f10 = NaN
/* 01024 80AF9E44 468044A0 */  cvt.s.w $f18, $f8                  
/* 01028 80AF9E48 C422A500 */  lwc1    $f2, %lo(D_80AFA500)($at)  
/* 0102C 80AF9E4C 4600A386 */  mov.s   $f14, $f20                 
/* 01030 80AF9E50 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 01034 80AF9E54 46805420 */  cvt.s.w $f16, $f10                 
/* 01038 80AF9E58 46009183 */  div.s   $f6, $f18, $f0             
/* 0103C 80AF9E5C 46008103 */  div.s   $f4, $f16, $f0             
/* 01040 80AF9E60 46023280 */  add.s   $f10, $f6, $f2             
/* 01044 80AF9E64 44065000 */  mfc1    $a2, $f10                  
/* 01048 80AF9E68 0C0342A3 */  jal     Matrix_Scale              
/* 0104C 80AF9E6C 46022300 */  add.s   $f12, $f4, $f2             
/* 01050 80AF9E70 8E5002D0 */  lw      $s0, 0x02D0($s2)           ## 000002D0
/* 01054 80AF9E74 3C18DA38 */  lui     $t8, 0xDA38                ## $t8 = DA380000
/* 01058 80AF9E78 37180003 */  ori     $t8, $t8, 0x0003           ## $t8 = DA380003
/* 0105C 80AF9E7C 260F0008 */  addiu   $t7, $s0, 0x0008           ## $t7 = 00000008
/* 01060 80AF9E80 AE4F02D0 */  sw      $t7, 0x02D0($s2)           ## 000002D0
/* 01064 80AF9E84 3C0580B0 */  lui     $a1, %hi(D_80AFA4B4)       ## $a1 = 80B00000
/* 01068 80AF9E88 AE180000 */  sw      $t8, 0x0000($s0)           ## 00000000
/* 0106C 80AF9E8C 8E840000 */  lw      $a0, 0x0000($s4)           ## 00000000
/* 01070 80AF9E90 24A5A4B4 */  addiu   $a1, $a1, %lo(D_80AFA4B4)  ## $a1 = 80AFA4B4
/* 01074 80AF9E94 0C0346A2 */  jal     Matrix_NewMtx              
/* 01078 80AF9E98 2406035C */  addiu   $a2, $zero, 0x035C         ## $a2 = 0000035C
/* 0107C 80AF9E9C AE020004 */  sw      $v0, 0x0004($s0)           ## 00000004
/* 01080 80AF9EA0 8E4302D0 */  lw      $v1, 0x02D0($s2)           ## 000002D0
/* 01084 80AF9EA4 3C0880B0 */  lui     $t0, %hi(D_80AFA3D8)       ## $t0 = 80B00000
/* 01088 80AF9EA8 2508A3D8 */  addiu   $t0, $t0, %lo(D_80AFA3D8)  ## $t0 = 80AFA3D8
/* 0108C 80AF9EAC 24790008 */  addiu   $t9, $v1, 0x0008           ## $t9 = 00000008
/* 01090 80AF9EB0 AE5902D0 */  sw      $t9, 0x02D0($s2)           ## 000002D0
/* 01094 80AF9EB4 3C05DE00 */  lui     $a1, 0xDE00                ## $a1 = DE000000
/* 01098 80AF9EB8 AC650000 */  sw      $a1, 0x0000($v1)           ## 00000000
/* 0109C 80AF9EBC AC680004 */  sw      $t0, 0x0004($v1)           ## 00000004
/* 010A0 80AF9EC0 8E4302D0 */  lw      $v1, 0x02D0($s2)           ## 000002D0
/* 010A4 80AF9EC4 3C0AFD90 */  lui     $t2, 0xFD90                ## $t2 = FD900000
/* 010A8 80AF9EC8 3C0E0709 */  lui     $t6, 0x0709                ## $t6 = 07090000
/* 010AC 80AF9ECC 24690008 */  addiu   $t1, $v1, 0x0008           ## $t1 = 00000008
/* 010B0 80AF9ED0 AE4902D0 */  sw      $t1, 0x02D0($s2)           ## 000002D0
/* 010B4 80AF9ED4 AC6A0000 */  sw      $t2, 0x0000($v1)           ## 00000000
/* 010B8 80AF9ED8 8FAB00A8 */  lw      $t3, 0x00A8($sp)           
/* 010BC 80AF9EDC 35CE8260 */  ori     $t6, $t6, 0x8260           ## $t6 = 07098260
/* 010C0 80AF9EE0 3C0DF590 */  lui     $t5, 0xF590                ## $t5 = F5900000
/* 010C4 80AF9EE4 AC6B0004 */  sw      $t3, 0x0004($v1)           ## 00000004
/* 010C8 80AF9EE8 8E4302D0 */  lw      $v1, 0x02D0($s2)           ## 000002D0
/* 010CC 80AF9EEC 3C18E600 */  lui     $t8, 0xE600                ## $t8 = E6000000
/* 010D0 80AF9EF0 3C09077F */  lui     $t1, 0x077F                ## $t1 = 077F0000
/* 010D4 80AF9EF4 246C0008 */  addiu   $t4, $v1, 0x0008           ## $t4 = 00000008
/* 010D8 80AF9EF8 AE4C02D0 */  sw      $t4, 0x02D0($s2)           ## 000002D0
/* 010DC 80AF9EFC AC6E0004 */  sw      $t6, 0x0004($v1)           ## 00000004
/* 010E0 80AF9F00 AC6D0000 */  sw      $t5, 0x0000($v1)           ## 00000000
/* 010E4 80AF9F04 8E4302D0 */  lw      $v1, 0x02D0($s2)           ## 000002D0
/* 010E8 80AF9F08 3529F100 */  ori     $t1, $t1, 0xF100           ## $t1 = 077FF100
/* 010EC 80AF9F0C 3C08F300 */  lui     $t0, 0xF300                ## $t0 = F3000000
/* 010F0 80AF9F10 246F0008 */  addiu   $t7, $v1, 0x0008           ## $t7 = 00000008
/* 010F4 80AF9F14 AE4F02D0 */  sw      $t7, 0x02D0($s2)           ## 000002D0
/* 010F8 80AF9F18 AC600004 */  sw      $zero, 0x0004($v1)         ## 00000004
/* 010FC 80AF9F1C AC780000 */  sw      $t8, 0x0000($v1)           ## 00000000
/* 01100 80AF9F20 8E4302D0 */  lw      $v1, 0x02D0($s2)           ## 000002D0
/* 01104 80AF9F24 3C0BE700 */  lui     $t3, 0xE700                ## $t3 = E7000000
/* 01108 80AF9F28 3C0DF588 */  lui     $t5, 0xF588                ## $t5 = F5880000
/* 0110C 80AF9F2C 24790008 */  addiu   $t9, $v1, 0x0008           ## $t9 = 00000008
/* 01110 80AF9F30 AE5902D0 */  sw      $t9, 0x02D0($s2)           ## 000002D0
/* 01114 80AF9F34 AC690004 */  sw      $t1, 0x0004($v1)           ## 00000004
/* 01118 80AF9F38 AC680000 */  sw      $t0, 0x0000($v1)           ## 00000000
/* 0111C 80AF9F3C 8E4302D0 */  lw      $v1, 0x02D0($s2)           ## 000002D0
/* 01120 80AF9F40 3C0E0009 */  lui     $t6, 0x0009                ## $t6 = 00090000
/* 01124 80AF9F44 35CE8260 */  ori     $t6, $t6, 0x8260           ## $t6 = 00098260
/* 01128 80AF9F48 246A0008 */  addiu   $t2, $v1, 0x0008           ## $t2 = 00000008
/* 0112C 80AF9F4C AE4A02D0 */  sw      $t2, 0x02D0($s2)           ## 000002D0
/* 01130 80AF9F50 AC600004 */  sw      $zero, 0x0004($v1)         ## 00000004
/* 01134 80AF9F54 AC6B0000 */  sw      $t3, 0x0000($v1)           ## 00000000
/* 01138 80AF9F58 8E4302D0 */  lw      $v1, 0x02D0($s2)           ## 000002D0
/* 0113C 80AF9F5C 35AD1000 */  ori     $t5, $t5, 0x1000           ## $t5 = F5881000
/* 01140 80AF9F60 3C19000F */  lui     $t9, 0x000F                ## $t9 = 000F0000
/* 01144 80AF9F64 246C0008 */  addiu   $t4, $v1, 0x0008           ## $t4 = 00000008
/* 01148 80AF9F68 AE4C02D0 */  sw      $t4, 0x02D0($s2)           ## 000002D0
/* 0114C 80AF9F6C AC6E0004 */  sw      $t6, 0x0004($v1)           ## 00000004
/* 01150 80AF9F70 AC6D0000 */  sw      $t5, 0x0000($v1)           ## 00000000
/* 01154 80AF9F74 8E4302D0 */  lw      $v1, 0x02D0($s2)           ## 000002D0
/* 01158 80AF9F78 3739C0FC */  ori     $t9, $t9, 0xC0FC           ## $t9 = 000FC0FC
/* 0115C 80AF9F7C 3C18F200 */  lui     $t8, 0xF200                ## $t8 = F2000000
/* 01160 80AF9F80 246F0008 */  addiu   $t7, $v1, 0x0008           ## $t7 = 00000008
/* 01164 80AF9F84 AE4F02D0 */  sw      $t7, 0x02D0($s2)           ## 000002D0
/* 01168 80AF9F88 AC790004 */  sw      $t9, 0x0004($v1)           ## 00000004
/* 0116C 80AF9F8C AC780000 */  sw      $t8, 0x0000($v1)           ## 00000000
/* 01170 80AF9F90 8E4302D0 */  lw      $v1, 0x02D0($s2)           ## 000002D0
/* 01174 80AF9F94 3C0480B0 */  lui     $a0, %hi(D_80AFA3F8)       ## $a0 = 80B00000
/* 01178 80AF9F98 2484A3F8 */  addiu   $a0, $a0, %lo(D_80AFA3F8)  ## $a0 = 80AFA3F8
/* 0117C 80AF9F9C 24680008 */  addiu   $t0, $v1, 0x0008           ## $t0 = 00000008
/* 01180 80AF9FA0 AE4802D0 */  sw      $t0, 0x02D0($s2)           ## 000002D0
/* 01184 80AF9FA4 AC640004 */  sw      $a0, 0x0004($v1)           ## 00000004
/* 01188 80AF9FA8 AC650000 */  sw      $a1, 0x0000($v1)           ## 00000000
/* 0118C 80AF9FAC 8E700000 */  lw      $s0, 0x0000($s3)           ## 8015FA90
/* 01190 80AF9FB0 00008825 */  or      $s1, $zero, $zero          ## $s1 = 00000000
/* 01194 80AF9FB4 86090A70 */  lh      $t1, 0x0A70($s0)           ## 00000A70
/* 01198 80AF9FB8 19200029 */  blez    $t1, .L80AFA060            
/* 0119C 80AF9FBC 00000000 */  nop
/* 011A0 80AF9FC0 AFA40040 */  sw      $a0, 0x0040($sp)           
/* 011A4 80AF9FC4 860A0A72 */  lh      $t2, 0x0A72($s0)           ## 00000A72
.L80AF9FC8:
/* 011A8 80AF9FC8 3C0142C8 */  lui     $at, 0x42C8                ## $at = 42C80000
/* 011AC 80AF9FCC 44814000 */  mtc1    $at, $f8                   ## $f8 = 100.00
/* 011B0 80AF9FD0 448A8000 */  mtc1    $t2, $f16                  ## $f16 = 0.00
/* 011B4 80AF9FD4 4600A386 */  mov.s   $f14, $f20                 
/* 011B8 80AF9FD8 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 011BC 80AF9FDC 46808120 */  cvt.s.w $f4, $f16                  
/* 011C0 80AF9FE0 46082483 */  div.s   $f18, $f4, $f8             
/* 011C4 80AF9FE4 46149300 */  add.s   $f12, $f18, $f20           
/* 011C8 80AF9FE8 44066000 */  mfc1    $a2, $f12                  
/* 011CC 80AF9FEC 0C0342A3 */  jal     Matrix_Scale              
/* 011D0 80AF9FF0 00000000 */  nop
/* 011D4 80AF9FF4 8E5002D0 */  lw      $s0, 0x02D0($s2)           ## 000002D0
/* 011D8 80AF9FF8 3C0CDA38 */  lui     $t4, 0xDA38                ## $t4 = DA380000
/* 011DC 80AF9FFC 358C0003 */  ori     $t4, $t4, 0x0003           ## $t4 = DA380003
/* 011E0 80AFA000 260B0008 */  addiu   $t3, $s0, 0x0008           ## $t3 = 00000008
/* 011E4 80AFA004 AE4B02D0 */  sw      $t3, 0x02D0($s2)           ## 000002D0
/* 011E8 80AFA008 3C0580B0 */  lui     $a1, %hi(D_80AFA4C4)       ## $a1 = 80B00000
/* 011EC 80AFA00C AE0C0000 */  sw      $t4, 0x0000($s0)           ## 00000000
/* 011F0 80AFA010 8E840000 */  lw      $a0, 0x0000($s4)           ## 00000000
/* 011F4 80AFA014 24A5A4C4 */  addiu   $a1, $a1, %lo(D_80AFA4C4)  ## $a1 = 80AFA4C4
/* 011F8 80AFA018 0C0346A2 */  jal     Matrix_NewMtx              
/* 011FC 80AFA01C 2406036D */  addiu   $a2, $zero, 0x036D         ## $a2 = 0000036D
/* 01200 80AFA020 AE020004 */  sw      $v0, 0x0004($s0)           ## 00000004
/* 01204 80AFA024 8E4302D0 */  lw      $v1, 0x02D0($s2)           ## 000002D0
/* 01208 80AFA028 3C0EDE00 */  lui     $t6, 0xDE00                ## $t6 = DE000000
/* 0120C 80AFA02C 26310001 */  addiu   $s1, $s1, 0x0001           ## $s1 = 00000001
/* 01210 80AFA030 246D0008 */  addiu   $t5, $v1, 0x0008           ## $t5 = 00000008
/* 01214 80AFA034 AE4D02D0 */  sw      $t5, 0x02D0($s2)           ## 000002D0
/* 01218 80AFA038 AC6E0000 */  sw      $t6, 0x0000($v1)           ## 00000000
/* 0121C 80AFA03C 8FAF0040 */  lw      $t7, 0x0040($sp)           
/* 01220 80AFA040 00118C00 */  sll     $s1, $s1, 16               
/* 01224 80AFA044 00118C03 */  sra     $s1, $s1, 16               
/* 01228 80AFA048 AC6F0004 */  sw      $t7, 0x0004($v1)           ## 00000004
/* 0122C 80AFA04C 8E700000 */  lw      $s0, 0x0000($s3)           ## 8015FA90
/* 01230 80AFA050 86180A70 */  lh      $t8, 0x0A70($s0)           ## 00000A70
/* 01234 80AFA054 0238082A */  slt     $at, $s1, $t8              
/* 01238 80AFA058 5420FFDB */  bnel    $at, $zero, .L80AF9FC8     
/* 0123C 80AFA05C 860A0A72 */  lh      $t2, 0x0A72($s0)           ## 00000A72
.L80AFA060:
/* 01240 80AFA060 3C0480B0 */  lui     $a0, %hi(D_80AFA4D4)       ## $a0 = 80B00000
/* 01244 80AFA064 0C00084C */  jal     osSyncPrintf
              
/* 01248 80AFA068 2484A4D4 */  addiu   $a0, $a0, %lo(D_80AFA4D4)  ## $a0 = 80AFA4D4
/* 0124C 80AFA06C 3C0680B0 */  lui     $a2, %hi(D_80AFA4E0)       ## $a2 = 80B00000
/* 01250 80AFA070 24C6A4E0 */  addiu   $a2, $a2, %lo(D_80AFA4E0)  ## $a2 = 80AFA4E0
/* 01254 80AFA074 27A40080 */  addiu   $a0, $sp, 0x0080           ## $a0 = FFFFFFD8
/* 01258 80AFA078 02402825 */  or      $a1, $s2, $zero            ## $a1 = 00000000
/* 0125C 80AFA07C 0C031AD5 */  jal     Graph_CloseDisps              
/* 01260 80AFA080 24070372 */  addiu   $a3, $zero, 0x0372         ## $a3 = 00000372
/* 01264 80AFA084 8FBF0034 */  lw      $ra, 0x0034($sp)           
/* 01268 80AFA088 D7B40018 */  ldc1    $f20, 0x0018($sp)          
/* 0126C 80AFA08C 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 01270 80AFA090 8FB10024 */  lw      $s1, 0x0024($sp)           
/* 01274 80AFA094 8FB20028 */  lw      $s2, 0x0028($sp)           
/* 01278 80AFA098 8FB3002C */  lw      $s3, 0x002C($sp)           
/* 0127C 80AFA09C 8FB40030 */  lw      $s4, 0x0030($sp)           
/* 01280 80AFA0A0 03E00008 */  jr      $ra                        
/* 01284 80AFA0A4 27BD00A8 */  addiu   $sp, $sp, 0x00A8           ## $sp = 00000000
/* 01288 80AFA0A8 00000000 */  nop
/* 0128C 80AFA0AC 00000000 */  nop
