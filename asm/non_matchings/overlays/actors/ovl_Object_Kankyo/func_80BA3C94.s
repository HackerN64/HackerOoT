.rdata
glabel D_80BA5A40
    .asciz "../z_object_kankyo.c"
    .balign 4

glabel D_80BA5A58
    .asciz "../z_object_kankyo.c"
    .balign 4

glabel D_80BA5A70
    .asciz "../z_object_kankyo.c"
    .balign 4

.late_rodata
glabel D_80BA5C9C
    .float 0.017453292

glabel D_80BA5CA0
    .float 0.05

.text
glabel func_80BA3C94
/* 011F4 80BA3C94 27BDFF48 */  addiu   $sp, $sp, 0xFF48           ## $sp = FFFFFF48
/* 011F8 80BA3C98 3C0F80BA */  lui     $t7, %hi(D_80BA596C)       ## $t7 = 80BA0000
/* 011FC 80BA3C9C AFBF003C */  sw      $ra, 0x003C($sp)           
/* 01200 80BA3CA0 AFB70038 */  sw      $s7, 0x0038($sp)           
/* 01204 80BA3CA4 AFB60034 */  sw      $s6, 0x0034($sp)           
/* 01208 80BA3CA8 AFB50030 */  sw      $s5, 0x0030($sp)           
/* 0120C 80BA3CAC AFB4002C */  sw      $s4, 0x002C($sp)           
/* 01210 80BA3CB0 AFB30028 */  sw      $s3, 0x0028($sp)           
/* 01214 80BA3CB4 AFB20024 */  sw      $s2, 0x0024($sp)           
/* 01218 80BA3CB8 AFB10020 */  sw      $s1, 0x0020($sp)           
/* 0121C 80BA3CBC AFB0001C */  sw      $s0, 0x001C($sp)           
/* 01220 80BA3CC0 F7B40010 */  sdc1    $f20, 0x0010($sp)          
/* 01224 80BA3CC4 25EF596C */  addiu   $t7, $t7, %lo(D_80BA596C)  ## $t7 = 80BA596C
/* 01228 80BA3CC8 8DF90000 */  lw      $t9, 0x0000($t7)           ## 80BA596C
/* 0122C 80BA3CCC 27AE00A0 */  addiu   $t6, $sp, 0x00A0           ## $t6 = FFFFFFE8
/* 01230 80BA3CD0 8DF80004 */  lw      $t8, 0x0004($t7)           ## 80BA5970
/* 01234 80BA3CD4 ADD90000 */  sw      $t9, 0x0000($t6)           ## FFFFFFE8
/* 01238 80BA3CD8 8DF90008 */  lw      $t9, 0x0008($t7)           ## 80BA5974
/* 0123C 80BA3CDC 3C0980BA */  lui     $t1, %hi(D_80BA5978)       ## $t1 = 80BA0000
/* 01240 80BA3CE0 25295978 */  addiu   $t1, $t1, %lo(D_80BA5978)  ## $t1 = 80BA5978
/* 01244 80BA3CE4 ADD80004 */  sw      $t8, 0x0004($t6)           ## FFFFFFEC
/* 01248 80BA3CE8 ADD90008 */  sw      $t9, 0x0008($t6)           ## FFFFFFF0
/* 0124C 80BA3CEC 8D2B0000 */  lw      $t3, 0x0000($t1)           ## 80BA5978
/* 01250 80BA3CF0 27A80094 */  addiu   $t0, $sp, 0x0094           ## $t0 = FFFFFFDC
/* 01254 80BA3CF4 8D2A0004 */  lw      $t2, 0x0004($t1)           ## 80BA597C
/* 01258 80BA3CF8 AD0B0000 */  sw      $t3, 0x0000($t0)           ## FFFFFFDC
/* 0125C 80BA3CFC 8D2B0008 */  lw      $t3, 0x0008($t1)           ## 80BA5980
/* 01260 80BA3D00 AD0A0004 */  sw      $t2, 0x0004($t0)           ## FFFFFFE0
/* 01264 80BA3D04 00808825 */  or      $s1, $a0, $zero            ## $s1 = 00000000
/* 01268 80BA3D08 AD0B0008 */  sw      $t3, 0x0008($t0)           ## FFFFFFE4
/* 0126C 80BA3D0C 8CAC0790 */  lw      $t4, 0x0790($a1)           ## 00000790
/* 01270 80BA3D10 3C0680BA */  lui     $a2, %hi(D_80BA5A40)       ## $a2 = 80BA0000
/* 01274 80BA3D14 00A0A025 */  or      $s4, $a1, $zero            ## $s4 = 00000000
/* 01278 80BA3D18 858D014C */  lh      $t5, 0x014C($t4)           ## 0000014C
/* 0127C 80BA3D1C 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 01280 80BA3D20 24C65A40 */  addiu   $a2, $a2, %lo(D_80BA5A40)  ## $a2 = 80BA5A40
/* 01284 80BA3D24 31AE0100 */  andi    $t6, $t5, 0x0100           ## $t6 = 00000000
/* 01288 80BA3D28 15C000FC */  bne     $t6, $zero, .L80BA411C     
/* 0128C 80BA3D2C 27A4007C */  addiu   $a0, $sp, 0x007C           ## $a0 = FFFFFFC4
/* 01290 80BA3D30 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 01294 80BA3D34 24070327 */  addiu   $a3, $zero, 0x0327         ## $a3 = 00000327
/* 01298 80BA3D38 0C031AB1 */  jal     Graph_OpenDisps              
/* 0129C 80BA3D3C 00A09025 */  or      $s2, $a1, $zero            ## $s2 = 00000000
/* 012A0 80BA3D40 8E4402D0 */  lw      $a0, 0x02D0($s2)           ## 000002D0
/* 012A4 80BA3D44 0C024DDD */  jal     Gfx_CallSetupDL              
/* 012A8 80BA3D48 24050014 */  addiu   $a1, $zero, 0x0014         ## $a1 = 00000014
/* 012AC 80BA3D4C 3C040405 */  lui     $a0, %hi(gSun1Tex)                ## $a0 = 04050000
/* 012B0 80BA3D50 2484C160 */  addiu   $a0, $a0, %lo(gSun1Tex)           ## $a0 = 0404C160
/* 012B4 80BA3D54 0004C900 */  sll     $t9, $a0,  4               
/* 012B8 80BA3D58 AE4202D0 */  sw      $v0, 0x02D0($s2)           ## 000002D0
/* 012BC 80BA3D5C 00194702 */  srl     $t0, $t9, 28               
/* 012C0 80BA3D60 244F0008 */  addiu   $t7, $v0, 0x0008           ## $t7 = 00000008
/* 012C4 80BA3D64 3C18DB06 */  lui     $t8, 0xDB06                ## $t8 = DB060000
/* 012C8 80BA3D68 37180020 */  ori     $t8, $t8, 0x0020           ## $t8 = DB060020
/* 012CC 80BA3D6C AE4F02D0 */  sw      $t7, 0x02D0($s2)           ## 000002D0
/* 012D0 80BA3D70 00084880 */  sll     $t1, $t0,  2               
/* 012D4 80BA3D74 3C0A8016 */  lui     $t2, %hi(gSegments)
/* 012D8 80BA3D78 01495021 */  addu    $t2, $t2, $t1              
/* 012DC 80BA3D7C AC580000 */  sw      $t8, 0x0000($v0)           ## 00000000
/* 012E0 80BA3D80 3C0100FF */  lui     $at, 0x00FF                ## $at = 00FF0000
/* 012E4 80BA3D84 8D4A6FA8 */  lw      $t2, %lo(gSegments)($t2)
/* 012E8 80BA3D88 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = 00FFFFFF
/* 012EC 80BA3D8C 00815824 */  and     $t3, $a0, $at              
/* 012F0 80BA3D90 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 012F4 80BA3D94 014B6021 */  addu    $t4, $t2, $t3              
/* 012F8 80BA3D98 01816821 */  addu    $t5, $t4, $at              
/* 012FC 80BA3D9C AC4D0004 */  sw      $t5, 0x0004($v0)           ## 00000004
/* 01300 80BA3DA0 8E4202D0 */  lw      $v0, 0x02D0($s2)           ## 000002D0
/* 01304 80BA3DA4 3C180405 */  lui     $t8, %hi(gKokiriDustMoteTextureLoadDL )                ## $t8 = 04050000
/* 01308 80BA3DA8 2718D160 */  addiu   $t8, $t8, %lo(gKokiriDustMoteTextureLoadDL )           ## $t8 = 0404D160
/* 0130C 80BA3DAC 244E0008 */  addiu   $t6, $v0, 0x0008           ## $t6 = 00000008
/* 01310 80BA3DB0 AE4E02D0 */  sw      $t6, 0x02D0($s2)           ## 000002D0
/* 01314 80BA3DB4 3C0FDE00 */  lui     $t7, 0xDE00                ## $t7 = DE000000
/* 01318 80BA3DB8 3C190001 */  lui     $t9, 0x0001                ## $t9 = 00010000
/* 0131C 80BA3DBC 0334C821 */  addu    $t9, $t9, $s4              
/* 01320 80BA3DC0 AC4F0000 */  sw      $t7, 0x0000($v0)           ## 00000000
/* 01324 80BA3DC4 AC580004 */  sw      $t8, 0x0004($v0)           ## 00000004
/* 01328 80BA3DC8 93390B15 */  lbu     $t9, 0x0B15($t9)           ## 00010B15
/* 0132C 80BA3DCC 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 01330 80BA3DD0 02014021 */  addu    $t0, $s0, $at              
/* 01334 80BA3DD4 1B2000CB */  blez    $t9, .L80BA4104            
/* 01338 80BA3DD8 00009825 */  or      $s3, $zero, $zero          ## $s3 = 00000000
/* 0133C 80BA3DDC 34211DA0 */  ori     $at, $at, 0x1DA0           ## $at = 00011DA0
/* 01340 80BA3DE0 02815021 */  addu    $t2, $s4, $at              
/* 01344 80BA3DE4 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 01348 80BA3DE8 3C090405 */  lui     $t1, %hi(gKokiriDustMoteDL)                ## $t1 = 04050000
/* 0134C 80BA3DEC 2529D1A8 */  addiu   $t1, $t1, %lo(gKokiriDustMoteDL)           ## $t1 = 0404D1A8
/* 01350 80BA3DF0 4481A000 */  mtc1    $at, $f20                  ## $f20 = 1.00
/* 01354 80BA3DF4 AFA90048 */  sw      $t1, 0x0048($sp)           
/* 01358 80BA3DF8 AFAA0040 */  sw      $t2, 0x0040($sp)           
/* 0135C 80BA3DFC AFA80050 */  sw      $t0, 0x0050($sp)           
/* 01360 80BA3E00 3C17FB00 */  lui     $s7, 0xFB00                ## $s7 = FB000000
/* 01364 80BA3E04 3C16FA00 */  lui     $s6, 0xFA00                ## $s6 = FA000000
/* 01368 80BA3E08 24150002 */  addiu   $s5, $zero, 0x0002         ## $s5 = 00000002
/* 0136C 80BA3E0C 00135880 */  sll     $t3, $s3,  2               
.L80BA3E10:
/* 01370 80BA3E10 01735821 */  addu    $t3, $t3, $s3              
/* 01374 80BA3E14 000B5880 */  sll     $t3, $t3,  2               
/* 01378 80BA3E18 01735821 */  addu    $t3, $t3, $s3              
/* 0137C 80BA3E1C 000B5880 */  sll     $t3, $t3,  2               
/* 01380 80BA3E20 022B8021 */  addu    $s0, $s1, $t3              
/* 01384 80BA3E24 C6040150 */  lwc1    $f4, 0x0150($s0)           ## 00000150
/* 01388 80BA3E28 C6060168 */  lwc1    $f6, 0x0168($s0)           ## 00000168
/* 0138C 80BA3E2C C6100158 */  lwc1    $f16, 0x0158($s0)          ## 00000158
/* 01390 80BA3E30 C6120170 */  lwc1    $f18, 0x0170($s0)          ## 00000170
/* 01394 80BA3E34 46062300 */  add.s   $f12, $f4, $f6             
/* 01398 80BA3E38 C6080154 */  lwc1    $f8, 0x0154($s0)           ## 00000154
/* 0139C 80BA3E3C C60A016C */  lwc1    $f10, 0x016C($s0)          ## 0000016C
/* 013A0 80BA3E40 46128100 */  add.s   $f4, $f16, $f18            
/* 013A4 80BA3E44 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 013A8 80BA3E48 460A4380 */  add.s   $f14, $f8, $f10            
/* 013AC 80BA3E4C 44062000 */  mfc1    $a2, $f4                   
/* 013B0 80BA3E50 0C034261 */  jal     Matrix_Translate              
/* 013B4 80BA3E54 00000000 */  nop
/* 013B8 80BA3E58 920C018C */  lbu     $t4, 0x018C($s0)           ## 0000018C
/* 013BC 80BA3E5C 3C014F80 */  lui     $at, 0x4F80                ## $at = 4F800000
/* 013C0 80BA3E60 448C3000 */  mtc1    $t4, $f6                   ## $f6 = 0.00
/* 013C4 80BA3E64 05810004 */  bgez    $t4, .L80BA3E78            
/* 013C8 80BA3E68 46803220 */  cvt.s.w $f8, $f6                   
/* 013CC 80BA3E6C 44815000 */  mtc1    $at, $f10                  ## $f10 = 4294967296.00
/* 013D0 80BA3E70 00000000 */  nop
/* 013D4 80BA3E74 460A4200 */  add.s   $f8, $f8, $f10             
.L80BA3E78:
/* 013D8 80BA3E78 3C014248 */  lui     $at, 0x4248                ## $at = 42480000
/* 013DC 80BA3E7C 44818000 */  mtc1    $at, $f16                  ## $f16 = 50.00
/* 013E0 80BA3E80 00000000 */  nop
/* 013E4 80BA3E84 46104003 */  div.s   $f0, $f8, $f16             
/* 013E8 80BA3E88 4600A03C */  c.lt.s  $f20, $f0                  
/* 013EC 80BA3E8C 00000000 */  nop
/* 013F0 80BA3E90 45020003 */  bc1fl   .L80BA3EA0                 
/* 013F4 80BA3E94 C6120190 */  lwc1    $f18, 0x0190($s0)          ## 00000190
/* 013F8 80BA3E98 4600A006 */  mov.s   $f0, $f20                  
/* 013FC 80BA3E9C C6120190 */  lwc1    $f18, 0x0190($s0)          ## 00000190
.L80BA3EA0:
/* 01400 80BA3EA0 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 01404 80BA3EA4 46009302 */  mul.s   $f12, $f18, $f0            
/* 01408 80BA3EA8 44066000 */  mfc1    $a2, $f12                  
/* 0140C 80BA3EAC 0C0342A3 */  jal     Matrix_Scale              
/* 01410 80BA3EB0 46006386 */  mov.s   $f14, $f12                 
/* 01414 80BA3EB4 2A610020 */  slti    $at, $s3, 0x0020           
/* 01418 80BA3EB8 1020000F */  beq     $at, $zero, .L80BA3EF8     
/* 0141C 80BA3EBC 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 01420 80BA3EC0 920D014C */  lbu     $t5, 0x014C($s0)           ## 0000014C
/* 01424 80BA3EC4 52AD0007 */  beql    $s5, $t5, .L80BA3EE4       
/* 01428 80BA3EC8 9202018C */  lbu     $v0, 0x018C($s0)           ## 0000018C
/* 0142C 80BA3ECC 9202018C */  lbu     $v0, 0x018C($s0)           ## 0000018C
/* 01430 80BA3ED0 1840002D */  blez    $v0, .L80BA3F88            
/* 01434 80BA3ED4 244EFFFF */  addiu   $t6, $v0, 0xFFFF           ## $t6 = FFFFFFFF
/* 01438 80BA3ED8 1000002B */  beq     $zero, $zero, .L80BA3F88   
/* 0143C 80BA3EDC A20E018C */  sb      $t6, 0x018C($s0)           ## 0000018C
/* 01440 80BA3EE0 9202018C */  lbu     $v0, 0x018C($s0)           ## 0000018C
.L80BA3EE4:
/* 01444 80BA3EE4 28410064 */  slti    $at, $v0, 0x0064           
/* 01448 80BA3EE8 10200027 */  beq     $at, $zero, .L80BA3F88     
/* 0144C 80BA3EEC 244F0001 */  addiu   $t7, $v0, 0x0001           ## $t7 = 00000001
/* 01450 80BA3EF0 10000025 */  beq     $zero, $zero, .L80BA3F88   
/* 01454 80BA3EF4 A20F018C */  sb      $t7, 0x018C($s0)           ## 0000018C
.L80BA3EF8:
/* 01458 80BA3EF8 9218014C */  lbu     $t8, 0x014C($s0)           ## 0000014C
/* 0145C 80BA3EFC 52B80013 */  beql    $s5, $t8, .L80BA3F4C       
/* 01460 80BA3F00 960B0188 */  lhu     $t3, 0x0188($s0)           ## 00000188
/* 01464 80BA3F04 96190188 */  lhu     $t9, 0x0188($s0)           ## 00000188
/* 01468 80BA3F08 3328001F */  andi    $t0, $t9, 0x001F           ## $t0 = 00000000
/* 0146C 80BA3F0C 29010010 */  slti    $at, $t0, 0x0010           
/* 01470 80BA3F10 50200008 */  beql    $at, $zero, .L80BA3F34     
/* 01474 80BA3F14 9202018C */  lbu     $v0, 0x018C($s0)           ## 0000018C
/* 01478 80BA3F18 9202018C */  lbu     $v0, 0x018C($s0)           ## 0000018C
/* 0147C 80BA3F1C 284100EB */  slti    $at, $v0, 0x00EB           
/* 01480 80BA3F20 10200019 */  beq     $at, $zero, .L80BA3F88     
/* 01484 80BA3F24 24490014 */  addiu   $t1, $v0, 0x0014           ## $t1 = 00000014
/* 01488 80BA3F28 10000017 */  beq     $zero, $zero, .L80BA3F88   
/* 0148C 80BA3F2C A209018C */  sb      $t1, 0x018C($s0)           ## 0000018C
/* 01490 80BA3F30 9202018C */  lbu     $v0, 0x018C($s0)           ## 0000018C
.L80BA3F34:
/* 01494 80BA3F34 28410015 */  slti    $at, $v0, 0x0015           
/* 01498 80BA3F38 14200013 */  bne     $at, $zero, .L80BA3F88     
/* 0149C 80BA3F3C 244AFFEC */  addiu   $t2, $v0, 0xFFEC           ## $t2 = FFFFFFEC
/* 014A0 80BA3F40 10000011 */  beq     $zero, $zero, .L80BA3F88   
/* 014A4 80BA3F44 A20A018C */  sb      $t2, 0x018C($s0)           ## 0000018C
/* 014A8 80BA3F48 960B0188 */  lhu     $t3, 0x0188($s0)           ## 00000188
.L80BA3F4C:
/* 014AC 80BA3F4C 316C000F */  andi    $t4, $t3, 0x000F           ## $t4 = 00000000
/* 014B0 80BA3F50 29810008 */  slti    $at, $t4, 0x0008           
/* 014B4 80BA3F54 50200008 */  beql    $at, $zero, .L80BA3F78     
/* 014B8 80BA3F58 9202018C */  lbu     $v0, 0x018C($s0)           ## 0000018C
/* 014BC 80BA3F5C 9202018C */  lbu     $v0, 0x018C($s0)           ## 0000018C
/* 014C0 80BA3F60 284100FF */  slti    $at, $v0, 0x00FF           
/* 014C4 80BA3F64 10200008 */  beq     $at, $zero, .L80BA3F88     
/* 014C8 80BA3F68 244D0064 */  addiu   $t5, $v0, 0x0064           ## $t5 = 00000064
/* 014CC 80BA3F6C 10000006 */  beq     $zero, $zero, .L80BA3F88   
/* 014D0 80BA3F70 A20D018C */  sb      $t5, 0x018C($s0)           ## 0000018C
/* 014D4 80BA3F74 9202018C */  lbu     $v0, 0x018C($s0)           ## 0000018C
.L80BA3F78:
/* 014D8 80BA3F78 2841000B */  slti    $at, $v0, 0x000B           
/* 014DC 80BA3F7C 14200002 */  bne     $at, $zero, .L80BA3F88     
/* 014E0 80BA3F80 244EFFF6 */  addiu   $t6, $v0, 0xFFF6           ## $t6 = FFFFFFF6
/* 014E4 80BA3F84 A20E018C */  sb      $t6, 0x018C($s0)           ## 0000018C
.L80BA3F88:
/* 014E8 80BA3F88 8E4202D0 */  lw      $v0, 0x02D0($s2)           ## 000002D0
/* 014EC 80BA3F8C 3C18E700 */  lui     $t8, 0xE700                ## $t8 = E7000000
/* 014F0 80BA3F90 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 014F4 80BA3F94 244F0008 */  addiu   $t7, $v0, 0x0008           ## $t7 = 00000008
/* 014F8 80BA3F98 AE4F02D0 */  sw      $t7, 0x02D0($s2)           ## 000002D0
/* 014FC 80BA3F9C AC400004 */  sw      $zero, 0x0004($v0)         ## 00000004
/* 01500 80BA3FA0 AC580000 */  sw      $t8, 0x0000($v0)           ## 00000000
/* 01504 80BA3FA4 32620001 */  andi    $v0, $s3, 0x0001           ## $v0 = 00000000
/* 01508 80BA3FA8 50400006 */  beql    $v0, $zero, .L80BA3FC4     
/* 0150C 80BA3FAC 8E4202D0 */  lw      $v0, 0x02D0($s2)           ## 000002D0
/* 01510 80BA3FB0 50410015 */  beql    $v0, $at, .L80BA4008       
/* 01514 80BA3FB4 8E4202D0 */  lw      $v0, 0x02D0($s2)           ## 000002D0
/* 01518 80BA3FB8 10000023 */  beq     $zero, $zero, .L80BA4048   
/* 0151C 80BA3FBC 00000000 */  nop
/* 01520 80BA3FC0 8E4202D0 */  lw      $v0, 0x02D0($s2)           ## 000002D0
.L80BA3FC4:
/* 01524 80BA3FC4 24019B00 */  addiu   $at, $zero, 0x9B00         ## $at = FFFF9B00
/* 01528 80BA3FC8 24590008 */  addiu   $t9, $v0, 0x0008           ## $t9 = 00000008
/* 0152C 80BA3FCC AE5902D0 */  sw      $t9, 0x02D0($s2)           ## 000002D0
/* 01530 80BA3FD0 AC560000 */  sw      $s6, 0x0000($v0)           ## 00000000
/* 01534 80BA3FD4 9209018C */  lbu     $t1, 0x018C($s0)           ## 0000018C
/* 01538 80BA3FD8 01215025 */  or      $t2, $t1, $at              ## $t2 = FFFF9B14
/* 0153C 80BA3FDC AC4A0004 */  sw      $t2, 0x0004($v0)           ## 00000004
/* 01540 80BA3FE0 8E4202D0 */  lw      $v0, 0x02D0($s2)           ## 000002D0
/* 01544 80BA3FE4 3C01FAB4 */  lui     $at, 0xFAB4                ## $at = FAB40000
/* 01548 80BA3FE8 244B0008 */  addiu   $t3, $v0, 0x0008           ## $t3 = 00000008
/* 0154C 80BA3FEC AE4B02D0 */  sw      $t3, 0x02D0($s2)           ## 000002D0
/* 01550 80BA3FF0 AC570000 */  sw      $s7, 0x0000($v0)           ## 00000000
/* 01554 80BA3FF4 920D018C */  lbu     $t5, 0x018C($s0)           ## 0000018C
/* 01558 80BA3FF8 01A17025 */  or      $t6, $t5, $at              ## $t6 = FAB40064
/* 0155C 80BA3FFC 10000012 */  beq     $zero, $zero, .L80BA4048   
/* 01560 80BA4000 AC4E0004 */  sw      $t6, 0x0004($v0)           ## 00000004
/* 01564 80BA4004 8E4202D0 */  lw      $v0, 0x02D0($s2)           ## 000002D0
.L80BA4008:
/* 01568 80BA4008 2401FF00 */  addiu   $at, $zero, 0xFF00         ## $at = FFFFFF00
/* 0156C 80BA400C 244F0008 */  addiu   $t7, $v0, 0x0008           ## $t7 = 00000008
/* 01570 80BA4010 AE4F02D0 */  sw      $t7, 0x02D0($s2)           ## 000002D0
/* 01574 80BA4014 AC560000 */  sw      $s6, 0x0000($v0)           ## 00000000
/* 01578 80BA4018 9219018C */  lbu     $t9, 0x018C($s0)           ## 0000018C
/* 0157C 80BA401C 03214025 */  or      $t0, $t9, $at              ## $t0 = FFFFFF08
/* 01580 80BA4020 AC480004 */  sw      $t0, 0x0004($v0)           ## 00000004
/* 01584 80BA4024 8E4202D0 */  lw      $v0, 0x02D0($s2)           ## 000002D0
/* 01588 80BA4028 3C010064 */  lui     $at, 0x0064                ## $at = 00640000
/* 0158C 80BA402C 3421FF00 */  ori     $at, $at, 0xFF00           ## $at = 0064FF00
/* 01590 80BA4030 24490008 */  addiu   $t1, $v0, 0x0008           ## $t1 = 00000008
/* 01594 80BA4034 AE4902D0 */  sw      $t1, 0x02D0($s2)           ## 000002D0
/* 01598 80BA4038 AC570000 */  sw      $s7, 0x0000($v0)           ## 00000000
/* 0159C 80BA403C 920B018C */  lbu     $t3, 0x018C($s0)           ## 0000018C
/* 015A0 80BA4040 01616025 */  or      $t4, $t3, $at              ## $t4 = 0064FF08
/* 015A4 80BA4044 AC4C0004 */  sw      $t4, 0x0004($v0)           ## 00000004
.L80BA4048:
/* 015A8 80BA4048 0C03424C */  jal     Matrix_Mult              
/* 015AC 80BA404C 8FA40040 */  lw      $a0, 0x0040($sp)           
/* 015B0 80BA4050 8E8D009C */  lw      $t5, 0x009C($s4)           ## 0000009C
/* 015B4 80BA4054 3C014F80 */  lui     $at, 0x4F80                ## $at = 4F800000
/* 015B8 80BA4058 448D2000 */  mtc1    $t5, $f4                   ## $f4 = 0.00
/* 015BC 80BA405C 05A10004 */  bgez    $t5, .L80BA4070            
/* 015C0 80BA4060 468021A0 */  cvt.s.w $f6, $f4                   
/* 015C4 80BA4064 44815000 */  mtc1    $at, $f10                  ## $f10 = 4294967296.00
/* 015C8 80BA4068 00000000 */  nop
/* 015CC 80BA406C 460A3180 */  add.s   $f6, $f6, $f10             
.L80BA4070:
/* 015D0 80BA4070 3C0141A0 */  lui     $at, 0x41A0                ## $at = 41A00000
/* 015D4 80BA4074 44814000 */  mtc1    $at, $f8                   ## $f8 = 20.00
/* 015D8 80BA4078 3C0180BA */  lui     $at, %hi(D_80BA5C9C)       ## $at = 80BA0000
/* 015DC 80BA407C C4325C9C */  lwc1    $f18, %lo(D_80BA5C9C)($at) 
/* 015E0 80BA4080 46083402 */  mul.s   $f16, $f6, $f8             
/* 015E4 80BA4084 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 015E8 80BA4088 46128302 */  mul.s   $f12, $f16, $f18           
/* 015EC 80BA408C 0C0343B5 */  jal     Matrix_RotateZ              
/* 015F0 80BA4090 00000000 */  nop
/* 015F4 80BA4094 8E4202D0 */  lw      $v0, 0x02D0($s2)           ## 000002D0
/* 015F8 80BA4098 3C0FDA38 */  lui     $t7, 0xDA38                ## $t7 = DA380000
/* 015FC 80BA409C 35EF0003 */  ori     $t7, $t7, 0x0003           ## $t7 = DA380003
/* 01600 80BA40A0 244E0008 */  addiu   $t6, $v0, 0x0008           ## $t6 = 00000008
/* 01604 80BA40A4 AE4E02D0 */  sw      $t6, 0x02D0($s2)           ## 000002D0
/* 01608 80BA40A8 3C0580BA */  lui     $a1, %hi(D_80BA5A58)       ## $a1 = 80BA0000
/* 0160C 80BA40AC AC4F0000 */  sw      $t7, 0x0000($v0)           ## 00000000
/* 01610 80BA40B0 8E840000 */  lw      $a0, 0x0000($s4)           ## 00000000
/* 01614 80BA40B4 24A55A58 */  addiu   $a1, $a1, %lo(D_80BA5A58)  ## $a1 = 80BA5A58
/* 01618 80BA40B8 24060391 */  addiu   $a2, $zero, 0x0391         ## $a2 = 00000391
/* 0161C 80BA40BC 0C0346A2 */  jal     Matrix_NewMtx              
/* 01620 80BA40C0 00408025 */  or      $s0, $v0, $zero            ## $s0 = 00000000
/* 01624 80BA40C4 AE020004 */  sw      $v0, 0x0004($s0)           ## 00000004
/* 01628 80BA40C8 8E4202D0 */  lw      $v0, 0x02D0($s2)           ## 000002D0
/* 0162C 80BA40CC 3C19DE00 */  lui     $t9, 0xDE00                ## $t9 = DE000000
/* 01630 80BA40D0 26730001 */  addiu   $s3, $s3, 0x0001           ## $s3 = 00000001
/* 01634 80BA40D4 24580008 */  addiu   $t8, $v0, 0x0008           ## $t8 = 00000008
/* 01638 80BA40D8 AE5802D0 */  sw      $t8, 0x02D0($s2)           ## 000002D0
/* 0163C 80BA40DC AC590000 */  sw      $t9, 0x0000($v0)           ## 00000000
/* 01640 80BA40E0 8FA80048 */  lw      $t0, 0x0048($sp)           
/* 01644 80BA40E4 00139C00 */  sll     $s3, $s3, 16               
/* 01648 80BA40E8 00139C03 */  sra     $s3, $s3, 16               
/* 0164C 80BA40EC AC480004 */  sw      $t0, 0x0004($v0)           ## 00000004
/* 01650 80BA40F0 8FA90050 */  lw      $t1, 0x0050($sp)           
/* 01654 80BA40F4 912A0B15 */  lbu     $t2, 0x0B15($t1)           ## 00000B15
/* 01658 80BA40F8 026A082A */  slt     $at, $s3, $t2              
/* 0165C 80BA40FC 5420FF44 */  bnel    $at, $zero, .L80BA3E10     
/* 01660 80BA4100 00135880 */  sll     $t3, $s3,  2               
.L80BA4104:
/* 01664 80BA4104 3C0680BA */  lui     $a2, %hi(D_80BA5A70)       ## $a2 = 80BA0000
/* 01668 80BA4108 24C65A70 */  addiu   $a2, $a2, %lo(D_80BA5A70)  ## $a2 = 80BA5A70
/* 0166C 80BA410C 27A4007C */  addiu   $a0, $sp, 0x007C           ## $a0 = FFFFFFC4
/* 01670 80BA4110 8E850000 */  lw      $a1, 0x0000($s4)           ## 00000000
/* 01674 80BA4114 0C031AD5 */  jal     Graph_CloseDisps              
/* 01678 80BA4118 2407039A */  addiu   $a3, $zero, 0x039A         ## $a3 = 0000039A
.L80BA411C:
/* 0167C 80BA411C 8FBF003C */  lw      $ra, 0x003C($sp)           
/* 01680 80BA4120 D7B40010 */  ldc1    $f20, 0x0010($sp)          
/* 01684 80BA4124 8FB0001C */  lw      $s0, 0x001C($sp)           
/* 01688 80BA4128 8FB10020 */  lw      $s1, 0x0020($sp)           
/* 0168C 80BA412C 8FB20024 */  lw      $s2, 0x0024($sp)           
/* 01690 80BA4130 8FB30028 */  lw      $s3, 0x0028($sp)           
/* 01694 80BA4134 8FB4002C */  lw      $s4, 0x002C($sp)           
/* 01698 80BA4138 8FB50030 */  lw      $s5, 0x0030($sp)           
/* 0169C 80BA413C 8FB60034 */  lw      $s6, 0x0034($sp)           
/* 016A0 80BA4140 8FB70038 */  lw      $s7, 0x0038($sp)           
/* 016A4 80BA4144 03E00008 */  jr      $ra                        
/* 016A8 80BA4148 27BD00B8 */  addiu   $sp, $sp, 0x00B8           ## $sp = 00000000
