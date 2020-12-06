.late_rodata
glabel D_809EF1BC
    .float 0.1

glabel D_809EF1C0
    .float 0.04

.text
glabel func_809EE1F4
/* 00984 809EE1F4 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 00988 809EE1F8 AFB00014 */  sw      $s0, 0x0014($sp)           
/* 0098C 809EE1FC 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00990 809EE200 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 00994 809EE204 AFB10018 */  sw      $s1, 0x0018($sp)           
/* 00998 809EE208 00A08825 */  or      $s1, $a1, $zero            ## $s1 = 00000000
/* 0099C 809EE20C 0C02927F */  jal     SkelAnime_FrameUpdateMatrix
              
/* 009A0 809EE210 2484014C */  addiu   $a0, $a0, 0x014C           ## $a0 = 0000014C
/* 009A4 809EE214 0C03008C */  jal     Gameplay_CreateSubCamera              
/* 009A8 809EE218 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 009AC 809EE21C A60202A0 */  sh      $v0, 0x02A0($s0)           ## 000002A0
/* 009B0 809EE220 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 009B4 809EE224 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 009B8 809EE228 0C0300C5 */  jal     Gameplay_ChangeCameraStatus              
/* 009BC 809EE22C 24060001 */  addiu   $a2, $zero, 0x0001         ## $a2 = 00000001
/* 009C0 809EE230 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 009C4 809EE234 860502A0 */  lh      $a1, 0x02A0($s0)           ## 000002A0
/* 009C8 809EE238 0C0300C5 */  jal     Gameplay_ChangeCameraStatus              
/* 009CC 809EE23C 24060007 */  addiu   $a2, $zero, 0x0007         ## $a2 = 00000007
/* 009D0 809EE240 3C01C352 */  lui     $at, 0xC352                ## $at = C3520000
/* 009D4 809EE244 44812000 */  mtc1    $at, $f4                   ## $f4 = -210.00
/* 009D8 809EE248 3C01C2A0 */  lui     $at, 0xC2A0                ## $at = C2A00000
/* 009DC 809EE24C 44813000 */  mtc1    $at, $f6                   ## $f6 = -80.00
/* 009E0 809EE250 3C01C47F */  lui     $at, 0xC47F                ## $at = C47F0000
/* 009E4 809EE254 44814000 */  mtc1    $at, $f8                   ## $f8 = -1020.00
/* 009E8 809EE258 3C01C38C */  lui     $at, 0xC38C                ## $at = C38C0000
/* 009EC 809EE25C 44815000 */  mtc1    $at, $f10                  ## $f10 = -280.00
/* 009F0 809EE260 3C01C1A0 */  lui     $at, 0xC1A0                ## $at = C1A00000
/* 009F4 809EE264 44818000 */  mtc1    $at, $f16                  ## $f16 = -20.00
/* 009F8 809EE268 3C01C370 */  lui     $at, 0xC370                ## $at = C3700000
/* 009FC 809EE26C 44819000 */  mtc1    $at, $f18                  ## $f18 = -240.00
/* 00A00 809EE270 2403000A */  addiu   $v1, $zero, 0x000A         ## $v1 = 0000000A
/* 00A04 809EE274 A603029A */  sh      $v1, 0x029A($s0)           ## 0000029A
/* 00A08 809EE278 3C0E8016 */  lui     $t6, %hi(gSaveContext+0xeda)
/* 00A0C 809EE27C E60402F4 */  swc1    $f4, 0x02F4($s0)           ## 000002F4
/* 00A10 809EE280 E60602F8 */  swc1    $f6, 0x02F8($s0)           ## 000002F8
/* 00A14 809EE284 E60802FC */  swc1    $f8, 0x02FC($s0)           ## 000002FC
/* 00A18 809EE288 E60A02D0 */  swc1    $f10, 0x02D0($s0)          ## 000002D0
/* 00A1C 809EE28C E61002D4 */  swc1    $f16, 0x02D4($s0)          ## 000002D4
/* 00A20 809EE290 E61202D8 */  swc1    $f18, 0x02D8($s0)          ## 000002D8
/* 00A24 809EE294 95CEF53A */  lhu     $t6, %lo(gSaveContext+0xeda)($t6)
/* 00A28 809EE298 24180005 */  addiu   $t8, $zero, 0x0005         ## $t8 = 00000005
/* 00A2C 809EE29C 3C01809F */  lui     $at, %hi(D_809EF1BC)       ## $at = 809F0000
/* 00A30 809EE2A0 31CF0100 */  andi    $t7, $t6, 0x0100           ## $t7 = 00000000
/* 00A34 809EE2A4 55E00004 */  bnel    $t7, $zero, .L809EE2B8     
/* 00A38 809EE2A8 A60302A6 */  sh      $v1, 0x02A6($s0)           ## 000002A6
/* 00A3C 809EE2AC 10000002 */  beq     $zero, $zero, .L809EE2B8   
/* 00A40 809EE2B0 A61802A6 */  sh      $t8, 0x02A6($s0)           ## 000002A6
/* 00A44 809EE2B4 A60302A6 */  sh      $v1, 0x02A6($s0)           ## 000002A6
.L809EE2B8:
/* 00A48 809EE2B8 C422F1BC */  lwc1    $f2, %lo(D_809EF1BC)($at)  
/* 00A4C 809EE2BC 3C0142A0 */  lui     $at, 0x42A0                ## $at = 42A00000
/* 00A50 809EE2C0 44819000 */  mtc1    $at, $f18                  ## $f18 = 80.00
/* 00A54 809EE2C4 E6020308 */  swc1    $f2, 0x0308($s0)           ## 00000308
/* 00A58 809EE2C8 E6020304 */  swc1    $f2, 0x0304($s0)           ## 00000304
/* 00A5C 809EE2CC E6020300 */  swc1    $f2, 0x0300($s0)           ## 00000300
/* 00A60 809EE2D0 E60202E4 */  swc1    $f2, 0x02E4($s0)           ## 000002E4
/* 00A64 809EE2D4 E60202E0 */  swc1    $f2, 0x02E0($s0)           ## 000002E0
/* 00A68 809EE2D8 E60202DC */  swc1    $f2, 0x02DC($s0)           ## 000002DC
/* 00A6C 809EE2DC C62400EC */  lwc1    $f4, 0x00EC($s1)           ## 000000EC
/* 00A70 809EE2E0 3C01437A */  lui     $at, 0x437A                ## $at = 437A0000
/* 00A74 809EE2E4 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00A78 809EE2E8 E60402B8 */  swc1    $f4, 0x02B8($s0)           ## 000002B8
/* 00A7C 809EE2EC C62600F0 */  lwc1    $f6, 0x00F0($s1)           ## 000000F0
/* 00A80 809EE2F0 860502A0 */  lh      $a1, 0x02A0($s0)           ## 000002A0
/* 00A84 809EE2F4 260602B8 */  addiu   $a2, $s0, 0x02B8           ## $a2 = 000002B8
/* 00A88 809EE2F8 E60602BC */  swc1    $f6, 0x02BC($s0)           ## 000002BC
/* 00A8C 809EE2FC C62800F4 */  lwc1    $f8, 0x00F4($s1)           ## 000000F4
/* 00A90 809EE300 260702C4 */  addiu   $a3, $s0, 0x02C4           ## $a3 = 000002C4
/* 00A94 809EE304 E60802C0 */  swc1    $f8, 0x02C0($s0)           ## 000002C0
/* 00A98 809EE308 C62A00E0 */  lwc1    $f10, 0x00E0($s1)          ## 000000E0
/* 00A9C 809EE30C 44814000 */  mtc1    $at, $f8                   ## $f8 = 250.00
/* 00AA0 809EE310 3C01809F */  lui     $at, %hi(D_809EF1C0)       ## $at = 809F0000
/* 00AA4 809EE314 E60A02C4 */  swc1    $f10, 0x02C4($s0)          ## 000002C4
/* 00AA8 809EE318 C63000E4 */  lwc1    $f16, 0x00E4($s1)          ## 000000E4
/* 00AAC 809EE31C 46128100 */  add.s   $f4, $f16, $f18            
/* 00AB0 809EE320 C61202D0 */  lwc1    $f18, 0x02D0($s0)          ## 000002D0
/* 00AB4 809EE324 C61002C4 */  lwc1    $f16, 0x02C4($s0)          ## 000002C4
/* 00AB8 809EE328 E60402C8 */  swc1    $f4, 0x02C8($s0)           ## 000002C8
/* 00ABC 809EE32C C62600E8 */  lwc1    $f6, 0x00E8($s1)           ## 000000E8
/* 00AC0 809EE330 46128001 */  sub.s   $f0, $f16, $f18            
/* 00AC4 809EE334 C61202D8 */  lwc1    $f18, 0x02D8($s0)          ## 000002D8
/* 00AC8 809EE338 46083280 */  add.s   $f10, $f6, $f8             
/* 00ACC 809EE33C C60802D4 */  lwc1    $f8, 0x02D4($s0)           ## 000002D4
/* 00AD0 809EE340 C60602C8 */  lwc1    $f6, 0x02C8($s0)           ## 000002C8
/* 00AD4 809EE344 46000005 */  abs.s   $f0, $f0                   
/* 00AD8 809EE348 E60A02CC */  swc1    $f10, 0x02CC($s0)          ## 000002CC
/* 00ADC 809EE34C C422F1C0 */  lwc1    $f2, %lo(D_809EF1C0)($at)  
/* 00AE0 809EE350 C61002CC */  lwc1    $f16, 0x02CC($s0)          ## 000002CC
/* 00AE4 809EE354 46020102 */  mul.s   $f4, $f0, $f2              
/* 00AE8 809EE358 46083001 */  sub.s   $f0, $f6, $f8              
/* 00AEC 809EE35C C60802F4 */  lwc1    $f8, 0x02F4($s0)           ## 000002F4
/* 00AF0 809EE360 C60602B8 */  lwc1    $f6, 0x02B8($s0)           ## 000002B8
/* 00AF4 809EE364 46000005 */  abs.s   $f0, $f0                   
/* 00AF8 809EE368 E60402E8 */  swc1    $f4, 0x02E8($s0)           ## 000002E8
/* 00AFC 809EE36C 46020282 */  mul.s   $f10, $f0, $f2             
/* 00B00 809EE370 46128001 */  sub.s   $f0, $f16, $f18            
/* 00B04 809EE374 C61202F8 */  lwc1    $f18, 0x02F8($s0)          ## 000002F8
/* 00B08 809EE378 C61002BC */  lwc1    $f16, 0x02BC($s0)          ## 000002BC
/* 00B0C 809EE37C 46000005 */  abs.s   $f0, $f0                   
/* 00B10 809EE380 E60A02EC */  swc1    $f10, 0x02EC($s0)          ## 000002EC
/* 00B14 809EE384 46020102 */  mul.s   $f4, $f0, $f2              
/* 00B18 809EE388 46083001 */  sub.s   $f0, $f6, $f8              
/* 00B1C 809EE38C C60802FC */  lwc1    $f8, 0x02FC($s0)           ## 000002FC
/* 00B20 809EE390 C60602C0 */  lwc1    $f6, 0x02C0($s0)           ## 000002C0
/* 00B24 809EE394 46000005 */  abs.s   $f0, $f0                   
/* 00B28 809EE398 E60402F0 */  swc1    $f4, 0x02F0($s0)           ## 000002F0
/* 00B2C 809EE39C 46020282 */  mul.s   $f10, $f0, $f2             
/* 00B30 809EE3A0 46128001 */  sub.s   $f0, $f16, $f18            
/* 00B34 809EE3A4 46000005 */  abs.s   $f0, $f0                   
/* 00B38 809EE3A8 E60A030C */  swc1    $f10, 0x030C($s0)          ## 0000030C
/* 00B3C 809EE3AC 46020102 */  mul.s   $f4, $f0, $f2              
/* 00B40 809EE3B0 46083001 */  sub.s   $f0, $f6, $f8              
/* 00B44 809EE3B4 46000005 */  abs.s   $f0, $f0                   
/* 00B48 809EE3B8 E6040310 */  swc1    $f4, 0x0310($s0)           ## 00000310
/* 00B4C 809EE3BC 46020282 */  mul.s   $f10, $f0, $f2             
/* 00B50 809EE3C0 0C030136 */  jal     Gameplay_CameraSetAtEye              
/* 00B54 809EE3C4 E60A0314 */  swc1    $f10, 0x0314($s0)          ## 00000314
/* 00B58 809EE3C8 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00B5C 809EE3CC 860502A0 */  lh      $a1, 0x02A0($s0)           ## 000002A0
/* 00B60 809EE3D0 0C0301C1 */  jal     Gameplay_CameraSetFov              
/* 00B64 809EE3D4 8E2602DC */  lw      $a2, 0x02DC($s1)           ## 000002DC
/* 00B68 809EE3D8 44808000 */  mtc1    $zero, $f16                ## $f16 = 0.00
/* 00B6C 809EE3DC 3C08809F */  lui     $t0, %hi(func_809EE408)    ## $t0 = 809F0000
/* 00B70 809EE3E0 2419003C */  addiu   $t9, $zero, 0x003C         ## $t9 = 0000003C
/* 00B74 809EE3E4 2508E408 */  addiu   $t0, $t0, %lo(func_809EE408) ## $t0 = 809EE408
/* 00B78 809EE3E8 A6190294 */  sh      $t9, 0x0294($s0)           ## 00000294
/* 00B7C 809EE3EC AE080280 */  sw      $t0, 0x0280($s0)           ## 00000280
/* 00B80 809EE3F0 E6100318 */  swc1    $f16, 0x0318($s0)          ## 00000318
/* 00B84 809EE3F4 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 00B88 809EE3F8 8FB10018 */  lw      $s1, 0x0018($sp)           
/* 00B8C 809EE3FC 8FB00014 */  lw      $s0, 0x0014($sp)           
/* 00B90 809EE400 03E00008 */  jr      $ra                        
/* 00B94 809EE404 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
