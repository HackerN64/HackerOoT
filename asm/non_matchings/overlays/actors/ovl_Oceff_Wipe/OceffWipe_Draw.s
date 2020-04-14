.rdata
glabel D_80BA9AE0
    .asciz "../z_oceff_wipe.c"
    .balign 4

glabel D_80BA9AF4
    .asciz "../z_oceff_wipe.c"
    .balign 4

glabel D_80BA9B08
    .asciz "../z_oceff_wipe.c"
    .balign 4

.late_rodata
glabel D_80BA9B1C
    .float 0.1

.text
glabel OceffWipe_Draw
/* 0011C 80BA8EAC 27BDFF48 */  addiu   $sp, $sp, 0xFF48           ## $sp = FFFFFF48
/* 00120 80BA8EB0 AFBF003C */  sw      $ra, 0x003C($sp)           
/* 00124 80BA8EB4 AFB10038 */  sw      $s1, 0x0038($sp)           
/* 00128 80BA8EB8 AFB00034 */  sw      $s0, 0x0034($sp)           
/* 0012C 80BA8EBC AFA400B8 */  sw      $a0, 0x00B8($sp)           
/* 00130 80BA8EC0 8CAE009C */  lw      $t6, 0x009C($a1)           ## 0000009C
/* 00134 80BA8EC4 27B80094 */  addiu   $t8, $sp, 0x0094           ## $t8 = FFFFFFDC
/* 00138 80BA8EC8 00A08825 */  or      $s1, $a1, $zero            ## $s1 = 00000000
/* 0013C 80BA8ECC 31CF00FF */  andi    $t7, $t6, 0x00FF           ## $t7 = 00000000
/* 00140 80BA8ED0 AFAF00B4 */  sw      $t7, 0x00B4($sp)           
/* 00144 80BA8ED4 84B907A0 */  lh      $t9, 0x07A0($a1)           ## 000007A0
/* 00148 80BA8ED8 27A40084 */  addiu   $a0, $sp, 0x0084           ## $a0 = FFFFFFCC
/* 0014C 80BA8EDC 00195880 */  sll     $t3, $t9,  2               
/* 00150 80BA8EE0 00AB6021 */  addu    $t4, $a1, $t3              
/* 00154 80BA8EE4 8D8D0790 */  lw      $t5, 0x0790($t4)           ## 00000790
/* 00158 80BA8EE8 8DAF005C */  lw      $t7, 0x005C($t5)           ## 0000005C
/* 0015C 80BA8EEC AF0F0000 */  sw      $t7, 0x0000($t8)           ## FFFFFFDC
/* 00160 80BA8EF0 8DAE0060 */  lw      $t6, 0x0060($t5)           ## 00000060
/* 00164 80BA8EF4 AF0E0004 */  sw      $t6, 0x0004($t8)           ## FFFFFFE0
/* 00168 80BA8EF8 8DAF0064 */  lw      $t7, 0x0064($t5)           ## 00000064
/* 0016C 80BA8EFC AF0F0008 */  sw      $t7, 0x0008($t8)           ## FFFFFFE4
/* 00170 80BA8F00 84B907A0 */  lh      $t9, 0x07A0($a1)           ## 000007A0
/* 00174 80BA8F04 00195880 */  sll     $t3, $t9,  2               
/* 00178 80BA8F08 00AB6021 */  addu    $t4, $a1, $t3              
/* 0017C 80BA8F0C 0C016BED */  jal     func_8005AFB4              
/* 00180 80BA8F10 8D850790 */  lw      $a1, 0x0790($t4)           ## 00000790
/* 00184 80BA8F14 8E250000 */  lw      $a1, 0x0000($s1)           ## 00000000
/* 00188 80BA8F18 3C0680BB */  lui     $a2, %hi(D_80BA9AE0)       ## $a2 = 80BB0000
/* 0018C 80BA8F1C 24C69AE0 */  addiu   $a2, $a2, %lo(D_80BA9AE0)  ## $a2 = 80BA9AE0
/* 00190 80BA8F20 27A40070 */  addiu   $a0, $sp, 0x0070           ## $a0 = FFFFFFB8
/* 00194 80BA8F24 2407015A */  addiu   $a3, $zero, 0x015A         ## $a3 = 0000015A
/* 00198 80BA8F28 0C031AB1 */  jal     Graph_OpenDisps              
/* 0019C 80BA8F2C 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 001A0 80BA8F30 8FAA00B8 */  lw      $t2, 0x00B8($sp)           
/* 001A4 80BA8F34 8542014C */  lh      $v0, 0x014C($t2)           ## 0000014C
/* 001A8 80BA8F38 28410020 */  slti    $at, $v0, 0x0020           
/* 001AC 80BA8F3C 1020000B */  beq     $at, $zero, .L80BA8F6C     
/* 001B0 80BA8F40 00402025 */  or      $a0, $v0, $zero            ## $a0 = 00000000
/* 001B4 80BA8F44 00042640 */  sll     $a0, $a0, 25               
/* 001B8 80BA8F48 0C01DE1C */  jal     Math_Sins
              ## sins?
/* 001BC 80BA8F4C 00042403 */  sra     $a0, $a0, 16               
/* 001C0 80BA8F50 3C0144AF */  lui     $at, 0x44AF                ## $at = 44AF0000
/* 001C4 80BA8F54 44812000 */  mtc1    $at, $f4                   ## $f4 = 1400.00
/* 001C8 80BA8F58 8FAA00B8 */  lw      $t2, 0x00B8($sp)           
/* 001CC 80BA8F5C 46040182 */  mul.s   $f6, $f0, $f4              
/* 001D0 80BA8F60 E7A600AC */  swc1    $f6, 0x00AC($sp)           
/* 001D4 80BA8F64 10000005 */  beq     $zero, $zero, .L80BA8F7C   
/* 001D8 80BA8F68 8542014C */  lh      $v0, 0x014C($t2)           ## 0000014C
.L80BA8F6C:
/* 001DC 80BA8F6C 3C0144AF */  lui     $at, 0x44AF                ## $at = 44AF0000
/* 001E0 80BA8F70 44814000 */  mtc1    $at, $f8                   ## $f8 = 1400.00
/* 001E4 80BA8F74 00000000 */  nop
/* 001E8 80BA8F78 E7A800AC */  swc1    $f8, 0x00AC($sp)           
.L80BA8F7C:
/* 001EC 80BA8F7C 28410050 */  slti    $at, $v0, 0x0050           
/* 001F0 80BA8F80 1420000E */  bne     $at, $zero, .L80BA8FBC     
/* 001F4 80BA8F84 3C0380BB */  lui     $v1, %hi(D_80BA96E0)       ## $v1 = 80BB0000
/* 001F8 80BA8F88 A3A000A4 */  sb      $zero, 0x00A4($sp)         
/* 001FC 80BA8F8C 854D014C */  lh      $t5, 0x014C($t2)           ## 0000014C
/* 00200 80BA8F90 24020064 */  addiu   $v0, $zero, 0x0064         ## $v0 = 00000064
/* 00204 80BA8F94 004D7023 */  subu    $t6, $v0, $t5              
/* 00208 80BA8F98 000E78C0 */  sll     $t7, $t6,  3               
/* 0020C 80BA8F9C A3AF00A5 */  sb      $t7, 0x00A5($sp)           
/* 00210 80BA8FA0 8559014C */  lh      $t9, 0x014C($t2)           ## 0000014C
/* 00214 80BA8FA4 00595823 */  subu    $t3, $v0, $t9              
/* 00218 80BA8FA8 000B6080 */  sll     $t4, $t3,  2               
/* 0021C 80BA8FAC 018B6023 */  subu    $t4, $t4, $t3              
/* 00220 80BA8FB0 000C6080 */  sll     $t4, $t4,  2               
/* 00224 80BA8FB4 10000006 */  beq     $zero, $zero, .L80BA8FD0   
/* 00228 80BA8FB8 A3AC00A6 */  sb      $t4, 0x00A6($sp)           
.L80BA8FBC:
/* 0022C 80BA8FBC 241800A0 */  addiu   $t8, $zero, 0x00A0         ## $t8 = 000000A0
/* 00230 80BA8FC0 240D00FF */  addiu   $t5, $zero, 0x00FF         ## $t5 = 000000FF
/* 00234 80BA8FC4 A3A000A4 */  sb      $zero, 0x00A4($sp)         
/* 00238 80BA8FC8 A3B800A5 */  sb      $t8, 0x00A5($sp)           
/* 0023C 80BA8FCC A3AD00A6 */  sb      $t5, 0x00A6($sp)           
.L80BA8FD0:
/* 00240 80BA8FD0 3C0480BB */  lui     $a0, %hi(D_80BA9AA0)       ## $a0 = 80BB0000
/* 00244 80BA8FD4 3C0980BB */  lui     $t1, %hi(D_80BA9AB4)       ## $t1 = 80BB0000
/* 00248 80BA8FD8 25299AB4 */  addiu   $t1, $t1, %lo(D_80BA9AB4)  ## $t1 = 80BA9AB4
/* 0024C 80BA8FDC 24849AA0 */  addiu   $a0, $a0, %lo(D_80BA9AA0)  ## $a0 = 80BA9AA0
/* 00250 80BA8FE0 246396E0 */  addiu   $v1, $v1, %lo(D_80BA96E0)  ## $v1 = 80BA96E0
/* 00254 80BA8FE4 27A200A4 */  addiu   $v0, $sp, 0x00A4           ## $v0 = FFFFFFEC
.L80BA8FE8:
/* 00258 80BA8FE8 90850000 */  lbu     $a1, 0x0000($a0)           ## 80BA9AA0
/* 0025C 80BA8FEC 90860001 */  lbu     $a2, 0x0001($a0)           ## 80BA9AA1
/* 00260 80BA8FF0 90870002 */  lbu     $a3, 0x0002($a0)           ## 80BA9AA2
/* 00264 80BA8FF4 30AE00F0 */  andi    $t6, $a1, 0x00F0           ## $t6 = 00000000
/* 00268 80BA8FF8 000E7903 */  sra     $t7, $t6,  4               
/* 0026C 80BA8FFC 004FC821 */  addu    $t9, $v0, $t7              
/* 00270 80BA9000 30AC000F */  andi    $t4, $a1, 0x000F           ## $t4 = 00000000
/* 00274 80BA9004 932B0000 */  lbu     $t3, 0x0000($t9)           ## 00000000
/* 00278 80BA9008 004CC021 */  addu    $t8, $v0, $t4              
/* 0027C 80BA900C 930D0000 */  lbu     $t5, 0x0000($t8)           ## 000000A0
/* 00280 80BA9010 30CE00F0 */  andi    $t6, $a2, 0x00F0           ## $t6 = 00000000
/* 00284 80BA9014 000E7903 */  sra     $t7, $t6,  4               
/* 00288 80BA9018 004FC821 */  addu    $t9, $v0, $t7              
/* 0028C 80BA901C 30CC000F */  andi    $t4, $a2, 0x000F           ## $t4 = 00000000
/* 00290 80BA9020 A06B000F */  sb      $t3, 0x000F($v1)           ## 80BA96EF
/* 00294 80BA9024 932B0000 */  lbu     $t3, 0x0000($t9)           ## 00000000
/* 00298 80BA9028 004CC021 */  addu    $t8, $v0, $t4              
/* 0029C 80BA902C A06D001F */  sb      $t5, 0x001F($v1)           ## 80BA96FF
/* 002A0 80BA9030 930D0000 */  lbu     $t5, 0x0000($t8)           ## 000000A0
/* 002A4 80BA9034 30EE00F0 */  andi    $t6, $a3, 0x00F0           ## $t6 = 00000000
/* 002A8 80BA9038 000E7903 */  sra     $t7, $t6,  4               
/* 002AC 80BA903C 90880003 */  lbu     $t0, 0x0003($a0)           ## 80BA9AA3
/* 002B0 80BA9040 004FC821 */  addu    $t9, $v0, $t7              
/* 002B4 80BA9044 30EC000F */  andi    $t4, $a3, 0x000F           ## $t4 = 00000000
/* 002B8 80BA9048 A06B002F */  sb      $t3, 0x002F($v1)           ## 80BA970F
/* 002BC 80BA904C 932B0000 */  lbu     $t3, 0x0000($t9)           ## 00000000
/* 002C0 80BA9050 004CC021 */  addu    $t8, $v0, $t4              
/* 002C4 80BA9054 A06D003F */  sb      $t5, 0x003F($v1)           ## 80BA971F
/* 002C8 80BA9058 930D0000 */  lbu     $t5, 0x0000($t8)           ## 000000A0
/* 002CC 80BA905C 310E00F0 */  andi    $t6, $t0, 0x00F0           ## $t6 = 00000000
/* 002D0 80BA9060 000E7903 */  sra     $t7, $t6,  4               
/* 002D4 80BA9064 310C000F */  andi    $t4, $t0, 0x000F           ## $t4 = 00000000
/* 002D8 80BA9068 A06B004F */  sb      $t3, 0x004F($v1)           ## 80BA972F
/* 002DC 80BA906C 004CC021 */  addu    $t8, $v0, $t4              
/* 002E0 80BA9070 004FC821 */  addu    $t9, $v0, $t7              
/* 002E4 80BA9074 A06D005F */  sb      $t5, 0x005F($v1)           ## 80BA973F
/* 002E8 80BA9078 930D0000 */  lbu     $t5, 0x0000($t8)           ## 000000A0
/* 002EC 80BA907C 932B0000 */  lbu     $t3, 0x0000($t9)           ## 00000000
/* 002F0 80BA9080 24840004 */  addiu   $a0, $a0, 0x0004           ## $a0 = 80BA9AA4
/* 002F4 80BA9084 24630080 */  addiu   $v1, $v1, 0x0080           ## $v1 = 80BA9760
/* 002F8 80BA9088 A06DFFFF */  sb      $t5, -0x0001($v1)          ## 80BA975F
/* 002FC 80BA908C 1489FFD6 */  bne     $a0, $t1, .L80BA8FE8       
/* 00300 80BA9090 A06BFFEF */  sb      $t3, -0x0011($v1)          ## 80BA974F
/* 00304 80BA9094 0C024F61 */  jal     func_80093D84              
/* 00308 80BA9098 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 0030C 80BA909C C7AA0094 */  lwc1    $f10, 0x0094($sp)          
/* 00310 80BA90A0 C7B00084 */  lwc1    $f16, 0x0084($sp)          
/* 00314 80BA90A4 C7A6009C */  lwc1    $f6, 0x009C($sp)           
/* 00318 80BA90A8 C7A8008C */  lwc1    $f8, 0x008C($sp)           
/* 0031C 80BA90AC 46105300 */  add.s   $f12, $f10, $f16           
/* 00320 80BA90B0 C7B20098 */  lwc1    $f18, 0x0098($sp)          
/* 00324 80BA90B4 C7A40088 */  lwc1    $f4, 0x0088($sp)           
/* 00328 80BA90B8 46083280 */  add.s   $f10, $f6, $f8             
/* 0032C 80BA90BC 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 00330 80BA90C0 46049380 */  add.s   $f14, $f18, $f4            
/* 00334 80BA90C4 44065000 */  mfc1    $a2, $f10                  
/* 00338 80BA90C8 0C034261 */  jal     Matrix_Translate              
/* 0033C 80BA90CC 00000000 */  nop
/* 00340 80BA90D0 3C0180BB */  lui     $at, %hi(D_80BA9B1C)       ## $at = 80BB0000
/* 00344 80BA90D4 C42C9B1C */  lwc1    $f12, %lo(D_80BA9B1C)($at) 
/* 00348 80BA90D8 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 0034C 80BA90DC 44066000 */  mfc1    $a2, $f12                  
/* 00350 80BA90E0 0C0342A3 */  jal     Matrix_Scale              
/* 00354 80BA90E4 46006386 */  mov.s   $f14, $f12                 
/* 00358 80BA90E8 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 0035C 80BA90EC 34211DA0 */  ori     $at, $at, 0x1DA0           ## $at = 00011DA0
/* 00360 80BA90F0 0C0347F5 */  jal     func_800D1FD4              
/* 00364 80BA90F4 02212021 */  addu    $a0, $s1, $at              
/* 00368 80BA90F8 C7B000AC */  lwc1    $f16, 0x00AC($sp)          
/* 0036C 80BA90FC 44806000 */  mtc1    $zero, $f12                ## $f12 = 0.00
/* 00370 80BA9100 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 00374 80BA9104 46008487 */  neg.s   $f18, $f16                 
/* 00378 80BA9108 46006386 */  mov.s   $f14, $f12                 
/* 0037C 80BA910C 44069000 */  mfc1    $a2, $f18                  
/* 00380 80BA9110 0C034261 */  jal     Matrix_Translate              
/* 00384 80BA9114 00000000 */  nop
/* 00388 80BA9118 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 0038C 80BA911C 3C0FDA38 */  lui     $t7, 0xDA38                ## $t7 = DA380000
/* 00390 80BA9120 35EF0003 */  ori     $t7, $t7, 0x0003           ## $t7 = DA380003
/* 00394 80BA9124 244E0008 */  addiu   $t6, $v0, 0x0008           ## $t6 = 00000008
/* 00398 80BA9128 AE0E02D0 */  sw      $t6, 0x02D0($s0)           ## 000002D0
/* 0039C 80BA912C AC4F0000 */  sw      $t7, 0x0000($v0)           ## 00000000
/* 003A0 80BA9130 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 003A4 80BA9134 3C0580BB */  lui     $a1, %hi(D_80BA9AF4)       ## $a1 = 80BB0000
/* 003A8 80BA9138 24A59AF4 */  addiu   $a1, $a1, %lo(D_80BA9AF4)  ## $a1 = 80BA9AF4
/* 003AC 80BA913C 24060177 */  addiu   $a2, $zero, 0x0177         ## $a2 = 00000177
/* 003B0 80BA9140 0C0346A2 */  jal     Matrix_NewMtx              
/* 003B4 80BA9144 AFA2006C */  sw      $v0, 0x006C($sp)           
/* 003B8 80BA9148 8FA3006C */  lw      $v1, 0x006C($sp)           
/* 003BC 80BA914C 3C18FA00 */  lui     $t8, 0xFA00                ## $t8 = FA000000
/* 003C0 80BA9150 3C0DAAFF */  lui     $t5, 0xAAFF                ## $t5 = AAFF0000
/* 003C4 80BA9154 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 003C8 80BA9158 8FB900B8 */  lw      $t9, 0x00B8($sp)           
/* 003CC 80BA915C 3C0CFA00 */  lui     $t4, 0xFA00                ## $t4 = FA000000
/* 003D0 80BA9160 3C08DE00 */  lui     $t0, 0xDE00                ## $t0 = DE000000
/* 003D4 80BA9164 872B001C */  lh      $t3, 0x001C($t9)           ## 0000001C
/* 003D8 80BA9168 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 003DC 80BA916C 51600011 */  beql    $t3, $zero, .L80BA91B4     
/* 003E0 80BA9170 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 003E4 80BA9174 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 003E8 80BA9178 35ADFFFF */  ori     $t5, $t5, 0xFFFF           ## $t5 = AAFFFFFF
/* 003EC 80BA917C 3C190096 */  lui     $t9, 0x0096                ## $t9 = 00960000
/* 003F0 80BA9180 244C0008 */  addiu   $t4, $v0, 0x0008           ## $t4 = 00000008
/* 003F4 80BA9184 AE0C02D0 */  sw      $t4, 0x02D0($s0)           ## 000002D0
/* 003F8 80BA9188 AC4D0004 */  sw      $t5, 0x0004($v0)           ## 00000004
/* 003FC 80BA918C AC580000 */  sw      $t8, 0x0000($v0)           ## 00000000
/* 00400 80BA9190 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 00404 80BA9194 3739FF80 */  ori     $t9, $t9, 0xFF80           ## $t9 = 0096FF80
/* 00408 80BA9198 3C0FFB00 */  lui     $t7, 0xFB00                ## $t7 = FB000000
/* 0040C 80BA919C 244E0008 */  addiu   $t6, $v0, 0x0008           ## $t6 = 00000008
/* 00410 80BA91A0 AE0E02D0 */  sw      $t6, 0x02D0($s0)           ## 000002D0
/* 00414 80BA91A4 AC590004 */  sw      $t9, 0x0004($v0)           ## 00000004
/* 00418 80BA91A8 1000000F */  beq     $zero, $zero, .L80BA91E8   
/* 0041C 80BA91AC AC4F0000 */  sw      $t7, 0x0000($v0)           ## 00000000
/* 00420 80BA91B0 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
.L80BA91B4:
/* 00424 80BA91B4 2418C8FF */  addiu   $t8, $zero, 0xC8FF         ## $t8 = FFFFC8FF
/* 00428 80BA91B8 3C0F6400 */  lui     $t7, 0x6400                ## $t7 = 64000000
/* 0042C 80BA91BC 244B0008 */  addiu   $t3, $v0, 0x0008           ## $t3 = 00000008
/* 00430 80BA91C0 AE0B02D0 */  sw      $t3, 0x02D0($s0)           ## 000002D0
/* 00434 80BA91C4 AC580004 */  sw      $t8, 0x0004($v0)           ## 00000004
/* 00438 80BA91C8 AC4C0000 */  sw      $t4, 0x0000($v0)           ## 00000000
/* 0043C 80BA91CC 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 00440 80BA91D0 35EFFF80 */  ori     $t7, $t7, 0xFF80           ## $t7 = 6400FF80
/* 00444 80BA91D4 3C0EFB00 */  lui     $t6, 0xFB00                ## $t6 = FB000000
/* 00448 80BA91D8 244D0008 */  addiu   $t5, $v0, 0x0008           ## $t5 = 00000008
/* 0044C 80BA91DC AE0D02D0 */  sw      $t5, 0x02D0($s0)           ## 000002D0
/* 00450 80BA91E0 AC4F0004 */  sw      $t7, 0x0004($v0)           ## 00000004
/* 00454 80BA91E4 AC4E0000 */  sw      $t6, 0x0000($v0)           ## 00000000
.L80BA91E8:
/* 00458 80BA91E8 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 0045C 80BA91EC 3C0B80BB */  lui     $t3, %hi(D_80BA9960)       ## $t3 = 80BB0000
/* 00460 80BA91F0 256B9960 */  addiu   $t3, $t3, %lo(D_80BA9960)  ## $t3 = 80BA9960
/* 00464 80BA91F4 24590008 */  addiu   $t9, $v0, 0x0008           ## $t9 = 00000008
/* 00468 80BA91F8 AE1902D0 */  sw      $t9, 0x02D0($s0)           ## 000002D0
/* 0046C 80BA91FC AC480000 */  sw      $t0, 0x0000($v0)           ## 00000000
/* 00470 80BA9200 AC4B0004 */  sw      $t3, 0x0004($v0)           ## 00000004
/* 00474 80BA9204 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 00478 80BA9208 8FA900B4 */  lw      $t1, 0x00B4($sp)           
/* 0047C 80BA920C 24190020 */  addiu   $t9, $zero, 0x0020         ## $t9 = 00000020
/* 00480 80BA9210 244C0008 */  addiu   $t4, $v0, 0x0008           ## $t4 = 00000008
/* 00484 80BA9214 AE0C02D0 */  sw      $t4, 0x02D0($s0)           ## 000002D0
/* 00488 80BA9218 AC480000 */  sw      $t0, 0x0000($v0)           ## 00000000
/* 0048C 80BA921C 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 00490 80BA9220 00090823 */  subu    $at, $zero, $t1            
/* 00494 80BA9224 00013840 */  sll     $a3, $at,  1               
/* 00498 80BA9228 24180020 */  addiu   $t8, $zero, 0x0020         ## $t8 = 00000020
/* 0049C 80BA922C 240D0020 */  addiu   $t5, $zero, 0x0020         ## $t5 = 00000020
/* 004A0 80BA9230 240E0001 */  addiu   $t6, $zero, 0x0001         ## $t6 = 00000001
/* 004A4 80BA9234 240F0020 */  addiu   $t7, $zero, 0x0020         ## $t7 = 00000020
/* 004A8 80BA9238 00093023 */  subu    $a2, $zero, $t1            
/* 004AC 80BA923C AFA6001C */  sw      $a2, 0x001C($sp)           
/* 004B0 80BA9240 AFAF0024 */  sw      $t7, 0x0024($sp)           
/* 004B4 80BA9244 AFAE0018 */  sw      $t6, 0x0018($sp)           
/* 004B8 80BA9248 AFAD0014 */  sw      $t5, 0x0014($sp)           
/* 004BC 80BA924C AFB80010 */  sw      $t8, 0x0010($sp)           
/* 004C0 80BA9250 AFA70020 */  sw      $a3, 0x0020($sp)           
/* 004C4 80BA9254 AFB90028 */  sw      $t9, 0x0028($sp)           
/* 004C8 80BA9258 0C0253D0 */  jal     Gfx_TwoTexScroll              
/* 004CC 80BA925C AFA20054 */  sw      $v0, 0x0054($sp)           
/* 004D0 80BA9260 8FA30054 */  lw      $v1, 0x0054($sp)           
/* 004D4 80BA9264 3C1880BB */  lui     $t8, %hi(D_80BA99E8)       ## $t8 = 80BB0000
/* 004D8 80BA9268 271899E8 */  addiu   $t8, $t8, %lo(D_80BA99E8)  ## $t8 = 80BA99E8
/* 004DC 80BA926C AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 004E0 80BA9270 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 004E4 80BA9274 3C0CDE00 */  lui     $t4, 0xDE00                ## $t4 = DE000000
/* 004E8 80BA9278 3C0680BB */  lui     $a2, %hi(D_80BA9B08)       ## $a2 = 80BB0000
/* 004EC 80BA927C 244B0008 */  addiu   $t3, $v0, 0x0008           ## $t3 = 00000008
/* 004F0 80BA9280 AE0B02D0 */  sw      $t3, 0x02D0($s0)           ## 000002D0
/* 004F4 80BA9284 AC580004 */  sw      $t8, 0x0004($v0)           ## 00000004
/* 004F8 80BA9288 AC4C0000 */  sw      $t4, 0x0000($v0)           ## 00000000
/* 004FC 80BA928C 8E250000 */  lw      $a1, 0x0000($s1)           ## 00000000
/* 00500 80BA9290 24C69B08 */  addiu   $a2, $a2, %lo(D_80BA9B08)  ## $a2 = 80BA9B08
/* 00504 80BA9294 27A40070 */  addiu   $a0, $sp, 0x0070           ## $a0 = FFFFFFB8
/* 00508 80BA9298 0C031AD5 */  jal     Graph_CloseDisps              
/* 0050C 80BA929C 2407018E */  addiu   $a3, $zero, 0x018E         ## $a3 = 0000018E
/* 00510 80BA92A0 8FBF003C */  lw      $ra, 0x003C($sp)           
/* 00514 80BA92A4 8FB00034 */  lw      $s0, 0x0034($sp)           
/* 00518 80BA92A8 8FB10038 */  lw      $s1, 0x0038($sp)           
/* 0051C 80BA92AC 03E00008 */  jr      $ra                        
/* 00520 80BA92B0 27BD00B8 */  addiu   $sp, $sp, 0x00B8           ## $sp = 00000000
/* 00524 80BA92B4 00000000 */  nop
/* 00528 80BA92B8 00000000 */  nop
/* 0052C 80BA92BC 00000000 */  nop
