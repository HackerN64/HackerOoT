.late_rodata
glabel D_808AB9C4
    .float 1300.0

glabel D_808AB9C8
    .float 1300.0

.text
glabel func_808AAF34
/* 00254 808AAF34 27BDFFA8 */  addiu   $sp, $sp, 0xFFA8           ## $sp = FFFFFFA8
/* 00258 808AAF38 AFBF002C */  sw      $ra, 0x002C($sp)           
/* 0025C 808AAF3C AFB00028 */  sw      $s0, 0x0028($sp)           
/* 00260 808AAF40 AFA40058 */  sw      $a0, 0x0058($sp)           
/* 00264 808AAF44 AFA5005C */  sw      $a1, 0x005C($sp)           
/* 00268 808AAF48 8C8F0170 */  lw      $t7, 0x0170($a0)           ## 00000170
/* 0026C 808AAF4C 3C028016 */  lui     $v0, %hi(gGameInfo)
/* 00270 808AAF50 51E00064 */  beql    $t7, $zero, .L808AB0E4     
/* 00274 808AAF54 8FBF002C */  lw      $ra, 0x002C($sp)           
/* 00278 808AAF58 8C42FA90 */  lw      $v0, %lo(gGameInfo)($v0)
/* 0027C 808AAF5C 3C01808B */  lui     $at, %hi(D_808AB9C4)       ## $at = 808B0000
/* 00280 808AAF60 C428B9C4 */  lwc1    $f8, %lo(D_808AB9C4)($at)  
/* 00284 808AAF64 8458147C */  lh      $t8, 0x147C($v0)           ## 8016147C
/* 00288 808AAF68 3C014348 */  lui     $at, 0x4348                ## $at = 43480000
/* 0028C 808AAF6C 27B00044 */  addiu   $s0, $sp, 0x0044           ## $s0 = FFFFFFEC
/* 00290 808AAF70 44982000 */  mtc1    $t8, $f4                   ## $f4 = 0.00
/* 00294 808AAF74 02002825 */  or      $a1, $s0, $zero            ## $a1 = FFFFFFEC
/* 00298 808AAF78 27A40038 */  addiu   $a0, $sp, 0x0038           ## $a0 = FFFFFFE0
/* 0029C 808AAF7C 468021A0 */  cvt.s.w $f6, $f4                   
/* 002A0 808AAF80 44812000 */  mtc1    $at, $f4                   ## $f4 = 200.00
/* 002A4 808AAF84 46083280 */  add.s   $f10, $f6, $f8             
/* 002A8 808AAF88 44804000 */  mtc1    $zero, $f8                 ## $f8 = 0.00
/* 002AC 808AAF8C E7AA0038 */  swc1    $f10, 0x0038($sp)          
/* 002B0 808AAF90 8459147E */  lh      $t9, 0x147E($v0)           ## 8016147E
/* 002B4 808AAF94 E7A80040 */  swc1    $f8, 0x0040($sp)           
/* 002B8 808AAF98 44998000 */  mtc1    $t9, $f16                  ## $f16 = 0.00
/* 002BC 808AAF9C 00000000 */  nop
/* 002C0 808AAFA0 468084A0 */  cvt.s.w $f18, $f16                 
/* 002C4 808AAFA4 46049180 */  add.s   $f6, $f18, $f4             
/* 002C8 808AAFA8 0C0346BD */  jal     Matrix_MultVec3f              
/* 002CC 808AAFAC E7A6003C */  swc1    $f6, 0x003C($sp)           
/* 002D0 808AAFB0 3C028016 */  lui     $v0, %hi(gGameInfo)
/* 002D4 808AAFB4 8C42FA90 */  lw      $v0, %lo(gGameInfo)($v0)
/* 002D8 808AAFB8 3C0142A0 */  lui     $at, 0x42A0                ## $at = 42A00000
/* 002DC 808AAFBC 44819000 */  mtc1    $at, $f18                  ## $f18 = 80.00
/* 002E0 808AAFC0 84481474 */  lh      $t0, 0x1474($v0)           ## 80161474
/* 002E4 808AAFC4 84491478 */  lh      $t1, 0x1478($v0)           ## 80161478
/* 002E8 808AAFC8 84471476 */  lh      $a3, 0x1476($v0)           ## 80161476
/* 002EC 808AAFCC 44885000 */  mtc1    $t0, $f10                  ## $f10 = 0.00
/* 002F0 808AAFD0 252A03E8 */  addiu   $t2, $t1, 0x03E8           ## $t2 = 000003E8
/* 002F4 808AAFD4 AFAA0010 */  sw      $t2, 0x0010($sp)           
/* 002F8 808AAFD8 46805420 */  cvt.s.w $f16, $f10                 
/* 002FC 808AAFDC 844B147A */  lh      $t3, 0x147A($v0)           ## 8016147A
/* 00300 808AAFE0 AFA00018 */  sw      $zero, 0x0018($sp)         
/* 00304 808AAFE4 8FA4005C */  lw      $a0, 0x005C($sp)           
/* 00308 808AAFE8 02002825 */  or      $a1, $s0, $zero            ## $a1 = FFFFFFEC
/* 0030C 808AAFEC 24E7000A */  addiu   $a3, $a3, 0x000A           ## $a3 = 0000000A
/* 00310 808AAFF0 46128100 */  add.s   $f4, $f16, $f18            
/* 00314 808AAFF4 AFAB0014 */  sw      $t3, 0x0014($sp)           
/* 00318 808AAFF8 44062000 */  mfc1    $a2, $f4                   
/* 0031C 808AAFFC 0C00CD20 */  jal     func_80033480              
/* 00320 808AB000 00000000 */  nop
/* 00324 808AB004 8FA4005C */  lw      $a0, 0x005C($sp)           
/* 00328 808AB008 02002825 */  or      $a1, $s0, $zero            ## $a1 = FFFFFFEC
/* 0032C 808AB00C 0C22AB4F */  jal     func_808AAD3C              
/* 00330 808AB010 24060003 */  addiu   $a2, $zero, 0x0003         ## $a2 = 00000003
/* 00334 808AB014 3C028016 */  lui     $v0, %hi(gGameInfo)
/* 00338 808AB018 8C42FA90 */  lw      $v0, %lo(gGameInfo)($v0)
/* 0033C 808AB01C 3C01808B */  lui     $at, %hi(D_808AB9C8)       ## $at = 808B0000
/* 00340 808AB020 C42AB9C8 */  lwc1    $f10, %lo(D_808AB9C8)($at) 
/* 00344 808AB024 844C147C */  lh      $t4, 0x147C($v0)           ## 8016147C
/* 00348 808AB028 3C014348 */  lui     $at, 0x4348                ## $at = 43480000
/* 0034C 808AB02C 27A40038 */  addiu   $a0, $sp, 0x0038           ## $a0 = FFFFFFE0
/* 00350 808AB030 448C3000 */  mtc1    $t4, $f6                   ## $f6 = 0.00
/* 00354 808AB034 02002825 */  or      $a1, $s0, $zero            ## $a1 = FFFFFFEC
/* 00358 808AB038 46803220 */  cvt.s.w $f8, $f6                   
/* 0035C 808AB03C 460A4400 */  add.s   $f16, $f8, $f10            
/* 00360 808AB040 44814000 */  mtc1    $at, $f8                   ## $f8 = 200.00
/* 00364 808AB044 46008487 */  neg.s   $f18, $f16                 
/* 00368 808AB048 44808000 */  mtc1    $zero, $f16                ## $f16 = 0.00
/* 0036C 808AB04C E7B20038 */  swc1    $f18, 0x0038($sp)          
/* 00370 808AB050 844D147E */  lh      $t5, 0x147E($v0)           ## 8016147E
/* 00374 808AB054 E7B00040 */  swc1    $f16, 0x0040($sp)          
/* 00378 808AB058 448D2000 */  mtc1    $t5, $f4                   ## $f4 = 0.00
/* 0037C 808AB05C 00000000 */  nop
/* 00380 808AB060 468021A0 */  cvt.s.w $f6, $f4                   
/* 00384 808AB064 46083280 */  add.s   $f10, $f6, $f8             
/* 00388 808AB068 0C0346BD */  jal     Matrix_MultVec3f              
/* 0038C 808AB06C E7AA003C */  swc1    $f10, 0x003C($sp)          
/* 00390 808AB070 3C028016 */  lui     $v0, %hi(gGameInfo)
/* 00394 808AB074 8C42FA90 */  lw      $v0, %lo(gGameInfo)($v0)
/* 00398 808AB078 3C0142A0 */  lui     $at, 0x42A0                ## $at = 42A00000
/* 0039C 808AB07C 44813000 */  mtc1    $at, $f6                   ## $f6 = 80.00
/* 003A0 808AB080 844E1474 */  lh      $t6, 0x1474($v0)           ## 80161474
/* 003A4 808AB084 844F1478 */  lh      $t7, 0x1478($v0)           ## 80161478
/* 003A8 808AB088 84471476 */  lh      $a3, 0x1476($v0)           ## 80161476
/* 003AC 808AB08C 448E9000 */  mtc1    $t6, $f18                  ## $f18 = 0.00
/* 003B0 808AB090 25F803E8 */  addiu   $t8, $t7, 0x03E8           ## $t8 = 000003E8
/* 003B4 808AB094 AFB80010 */  sw      $t8, 0x0010($sp)           
/* 003B8 808AB098 46809120 */  cvt.s.w $f4, $f18                  
/* 003BC 808AB09C 8459147A */  lh      $t9, 0x147A($v0)           ## 8016147A
/* 003C0 808AB0A0 AFA00018 */  sw      $zero, 0x0018($sp)         
/* 003C4 808AB0A4 8FA4005C */  lw      $a0, 0x005C($sp)           
/* 003C8 808AB0A8 02002825 */  or      $a1, $s0, $zero            ## $a1 = FFFFFFEC
/* 003CC 808AB0AC 24E7000A */  addiu   $a3, $a3, 0x000A           ## $a3 = 0000000A
/* 003D0 808AB0B0 46062200 */  add.s   $f8, $f4, $f6              
/* 003D4 808AB0B4 AFB90014 */  sw      $t9, 0x0014($sp)           
/* 003D8 808AB0B8 44064000 */  mfc1    $a2, $f8                   
/* 003DC 808AB0BC 0C00CD20 */  jal     func_80033480              
/* 003E0 808AB0C0 00000000 */  nop
/* 003E4 808AB0C4 8FA4005C */  lw      $a0, 0x005C($sp)           
/* 003E8 808AB0C8 02002825 */  or      $a1, $s0, $zero            ## $a1 = FFFFFFEC
/* 003EC 808AB0CC 0C22AB4F */  jal     func_808AAD3C              
/* 003F0 808AB0D0 24060003 */  addiu   $a2, $zero, 0x0003         ## $a2 = 00000003
/* 003F4 808AB0D4 8FA40058 */  lw      $a0, 0x0058($sp)           
/* 003F8 808AB0D8 0C22AB38 */  jal     func_808AACE0              
/* 003FC 808AB0DC AC800170 */  sw      $zero, 0x0170($a0)         ## 00000170
/* 00400 808AB0E0 8FBF002C */  lw      $ra, 0x002C($sp)           
.L808AB0E4:
/* 00404 808AB0E4 8FB00028 */  lw      $s0, 0x0028($sp)           
/* 00408 808AB0E8 27BD0058 */  addiu   $sp, $sp, 0x0058           ## $sp = 00000000
/* 0040C 808AB0EC 03E00008 */  jr      $ra                        
/* 00410 808AB0F0 00000000 */  nop
