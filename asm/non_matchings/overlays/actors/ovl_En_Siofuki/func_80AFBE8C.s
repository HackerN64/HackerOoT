.late_rodata
glabel D_80AFC870
 .word 0x4622F983
glabel D_80AFC874
    .float 0.3

.text
glabel func_80AFBE8C
/* 0030C 80AFBE8C 27BDFFB8 */  addiu   $sp, $sp, 0xFFB8           ## $sp = FFFFFFB8
/* 00310 80AFBE90 AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 00314 80AFBE94 AFB10020 */  sw      $s1, 0x0020($sp)           
/* 00318 80AFBE98 AFB0001C */  sw      $s0, 0x001C($sp)           
/* 0031C 80AFBE9C AFA5004C */  sw      $a1, 0x004C($sp)           
/* 00320 80AFBEA0 8CB11C44 */  lw      $s1, 0x1C44($a1)           ## 00001C44
/* 00324 80AFBEA4 C4860024 */  lwc1    $f6, 0x0024($a0)           ## 00000024
/* 00328 80AFBEA8 C48A0028 */  lwc1    $f10, 0x0028($a0)          ## 00000028
/* 0032C 80AFBEAC C6240024 */  lwc1    $f4, 0x0024($s1)           ## 00000024
/* 00330 80AFBEB0 C6280028 */  lwc1    $f8, 0x0028($s1)           ## 00000028
/* 00334 80AFBEB4 3C01C3AD */  lui     $at, 0xC3AD                ## $at = C3AD0000
/* 00338 80AFBEB8 46062301 */  sub.s   $f12, $f4, $f6             
/* 0033C 80AFBEBC 44813000 */  mtc1    $at, $f6                   ## $f6 = -346.00
/* 00340 80AFBEC0 C4800050 */  lwc1    $f0, 0x0050($a0)           ## 00000050
/* 00344 80AFBEC4 460A4081 */  sub.s   $f2, $f8, $f10             
/* 00348 80AFBEC8 C484002C */  lwc1    $f4, 0x002C($a0)           ## 0000002C
/* 0034C 80AFBECC 46060202 */  mul.s   $f8, $f0, $f6              
/* 00350 80AFBED0 C632002C */  lwc1    $f18, 0x002C($s1)          ## 0000002C
/* 00354 80AFBED4 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00358 80AFBED8 3C0143AD */  lui     $at, 0x43AD                ## $at = 43AD0000
/* 0035C 80AFBEDC 46049381 */  sub.s   $f14, $f18, $f4            
/* 00360 80AFBEE0 460C403C */  c.lt.s  $f8, $f12                  
/* 00364 80AFBEE4 00000000 */  nop
/* 00368 80AFBEE8 450200A8 */  bc1fl   .L80AFC18C                 
/* 0036C 80AFBEEC 8E0A0188 */  lw      $t2, 0x0188($s0)           ## 00000188
/* 00370 80AFBEF0 44815000 */  mtc1    $at, $f10                  ## $f10 = 346.00
/* 00374 80AFBEF4 3C01C3C8 */  lui     $at, 0xC3C8                ## $at = C3C80000
/* 00378 80AFBEF8 460A0482 */  mul.s   $f18, $f0, $f10            
/* 0037C 80AFBEFC 4612603C */  c.lt.s  $f12, $f18                 
/* 00380 80AFBF00 00000000 */  nop
/* 00384 80AFBF04 450200A1 */  bc1fl   .L80AFC18C                 
/* 00388 80AFBF08 8E0A0188 */  lw      $t2, 0x0188($s0)           ## 00000188
/* 0038C 80AFBF0C C4800058 */  lwc1    $f0, 0x0058($a0)           ## 00000058
/* 00390 80AFBF10 44812000 */  mtc1    $at, $f4                   ## $f4 = -400.00
/* 00394 80AFBF14 3C0143C8 */  lui     $at, 0x43C8                ## $at = 43C80000
/* 00398 80AFBF18 46040182 */  mul.s   $f6, $f0, $f4              
/* 0039C 80AFBF1C 460E303C */  c.lt.s  $f6, $f14                  
/* 003A0 80AFBF20 00000000 */  nop
/* 003A4 80AFBF24 45020099 */  bc1fl   .L80AFC18C                 
/* 003A8 80AFBF28 8E0A0188 */  lw      $t2, 0x0188($s0)           ## 00000188
/* 003AC 80AFBF2C 44814000 */  mtc1    $at, $f8                   ## $f8 = 400.00
/* 003B0 80AFBF30 00000000 */  nop
/* 003B4 80AFBF34 46080282 */  mul.s   $f10, $f0, $f8             
/* 003B8 80AFBF38 460A703C */  c.lt.s  $f14, $f10                 
/* 003BC 80AFBF3C 00000000 */  nop
/* 003C0 80AFBF40 45020092 */  bc1fl   .L80AFC18C                 
/* 003C4 80AFBF44 8E0A0188 */  lw      $t2, 0x0188($s0)           ## 00000188
/* 003C8 80AFBF48 44808000 */  mtc1    $zero, $f16                ## $f16 = 0.00
/* 003CC 80AFBF4C 00000000 */  nop
/* 003D0 80AFBF50 4610103C */  c.lt.s  $f2, $f16                  
/* 003D4 80AFBF54 00000000 */  nop
/* 003D8 80AFBF58 4502008C */  bc1fl   .L80AFC18C                 
/* 003DC 80AFBF5C 8E0A0188 */  lw      $t2, 0x0188($s0)           ## 00000188
/* 003E0 80AFBF60 E7AC0040 */  swc1    $f12, 0x0040($sp)          
/* 003E4 80AFBF64 0C010D5B */  jal     func_8004356C              
/* 003E8 80AFBF68 E7AE0038 */  swc1    $f14, 0x0038($sp)          
/* 003EC 80AFBF6C 44808000 */  mtc1    $zero, $f16                ## $f16 = 0.00
/* 003F0 80AFBF70 C7AC0040 */  lwc1    $f12, 0x0040($sp)          
/* 003F4 80AFBF74 10400016 */  beq     $v0, $zero, .L80AFBFD0     
/* 003F8 80AFBF78 C7AE0038 */  lwc1    $f14, 0x0038($sp)          
/* 003FC 80AFBF7C 8E020184 */  lw      $v0, 0x0184($s0)           ## 00000184
/* 00400 80AFBF80 8FA4004C */  lw      $a0, 0x004C($sp)           
/* 00404 80AFBF84 26250024 */  addiu   $a1, $s1, 0x0024           ## $a1 = 00000024
/* 00408 80AFBF88 1C40000C */  bgtz    $v0, .L80AFBFBC            
/* 0040C 80AFBF8C 2448FFFF */  addiu   $t0, $v0, 0xFFFF           ## $t0 = FFFFFFFF
/* 00410 80AFBF90 240F0001 */  addiu   $t7, $zero, 0x0001         ## $t7 = 00000001
/* 00414 80AFBF94 24180001 */  addiu   $t8, $zero, 0x0001         ## $t8 = 00000001
/* 00418 80AFBF98 AFB80014 */  sw      $t8, 0x0014($sp)           
/* 0041C 80AFBF9C AFAF0010 */  sw      $t7, 0x0010($sp)           
/* 00420 80AFBFA0 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 00424 80AFBFA4 0C00A527 */  jal     EffectSsGSplash_Spawn              
/* 00428 80AFBFA8 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 0042C 80AFBFAC 44808000 */  mtc1    $zero, $f16                ## $f16 = 0.00
/* 00430 80AFBFB0 2419000A */  addiu   $t9, $zero, 0x000A         ## $t9 = 0000000A
/* 00434 80AFBFB4 10000002 */  beq     $zero, $zero, .L80AFBFC0   
/* 00438 80AFBFB8 AE190184 */  sw      $t9, 0x0184($s0)           ## 00000184
.L80AFBFBC:
/* 0043C 80AFBFBC AE080184 */  sw      $t0, 0x0184($s0)           ## 00000184
.L80AFBFC0:
/* 00440 80AFBFC0 AE000188 */  sw      $zero, 0x0188($s0)         ## 00000188
/* 00444 80AFBFC4 E610018C */  swc1    $f16, 0x018C($s0)          ## 0000018C
/* 00448 80AFBFC8 1000007C */  beq     $zero, $zero, .L80AFC1BC   
/* 0044C 80AFBFCC E6100190 */  swc1    $f16, 0x0190($s0)          ## 00000190
.L80AFBFD0:
/* 00450 80AFBFD0 460C6482 */  mul.s   $f18, $f12, $f12           
/* 00454 80AFBFD4 24090001 */  addiu   $t1, $zero, 0x0001         ## $t1 = 00000001
/* 00458 80AFBFD8 460E7102 */  mul.s   $f4, $f14, $f14            
/* 0045C 80AFBFDC 46049000 */  add.s   $f0, $f18, $f4             
/* 00460 80AFBFE0 46000004 */  sqrt.s  $f0, $f0                   
/* 00464 80AFBFE4 E7A00030 */  swc1    $f0, 0x0030($sp)           
/* 00468 80AFBFE8 AE090188 */  sw      $t1, 0x0188($s0)           ## 00000188
/* 0046C 80AFBFEC 0C03F494 */  jal     Math_atan2f              
/* 00470 80AFBFF0 AE000184 */  sw      $zero, 0x0184($s0)         ## 00000184
/* 00474 80AFBFF4 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 00478 80AFBFF8 44811000 */  mtc1    $at, $f2                   ## $f2 = 1.00
/* 0047C 80AFBFFC 3C0180B0 */  lui     $at, %hi(D_80AFC870)       ## $at = 80B00000
/* 00480 80AFC000 C426C870 */  lwc1    $f6, %lo(D_80AFC870)($at)  
/* 00484 80AFC004 862A0032 */  lh      $t2, 0x0032($s1)           ## 00000032
/* 00488 80AFC008 44808000 */  mtc1    $zero, $f16                ## $f16 = 0.00
/* 0048C 80AFC00C 46060202 */  mul.s   $f8, $f0, $f6              
/* 00490 80AFC010 394B8000 */  xori    $t3, $t2, 0x8000           ## $t3 = FFFF8000
/* 00494 80AFC014 E630006C */  swc1    $f16, 0x006C($s1)          ## 0000006C
/* 00498 80AFC018 E6300060 */  swc1    $f16, 0x0060($s1)          ## 00000060
/* 0049C 80AFC01C 8E050028 */  lw      $a1, 0x0028($s0)           ## 00000028
/* 004A0 80AFC020 26240028 */  addiu   $a0, $s1, 0x0028           ## $a0 = 00000028
/* 004A4 80AFC024 3C063F00 */  lui     $a2, 0x3F00                ## $a2 = 3F000000
/* 004A8 80AFC028 4600428D */  trunc.w.s $f10, $f8                  
/* 004AC 80AFC02C 3C074080 */  lui     $a3, 0x4080                ## $a3 = 40800000
/* 004B0 80AFC030 E7A20010 */  swc1    $f2, 0x0010($sp)           
/* 004B4 80AFC034 440F5000 */  mfc1    $t7, $f10                  
/* 004B8 80AFC038 00000000 */  nop
/* 004BC 80AFC03C 016F1023 */  subu    $v0, $t3, $t7              
/* 004C0 80AFC040 00021400 */  sll     $v0, $v0, 16               
/* 004C4 80AFC044 00021403 */  sra     $v0, $v0, 16               
/* 004C8 80AFC048 0C01E0C4 */  jal     Math_SmoothScaleMaxMinF
              
/* 004CC 80AFC04C A7A20034 */  sh      $v0, 0x0034($sp)           
/* 004D0 80AFC050 87A20034 */  lh      $v0, 0x0034($sp)           
/* 004D4 80AFC054 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 004D8 80AFC058 44811000 */  mtc1    $at, $f2                   ## $f2 = 1.00
/* 004DC 80AFC05C 44808000 */  mtc1    $zero, $f16                ## $f16 = 0.00
/* 004E0 80AFC060 28414000 */  slti    $at, $v0, 0x4000           
/* 004E4 80AFC064 1020002F */  beq     $at, $zero, .L80AFC124     
/* 004E8 80AFC068 2841C001 */  slti    $at, $v0, 0xC001           
/* 004EC 80AFC06C 1420002D */  bne     $at, $zero, .L80AFC124     
/* 004F0 80AFC070 3C014220 */  lui     $at, 0x4220                ## $at = 42200000
/* 004F4 80AFC074 44812000 */  mtc1    $at, $f4                   ## $f4 = 40.00
/* 004F8 80AFC078 C6120050 */  lwc1    $f18, 0x0050($s0)          ## 00000050
/* 004FC 80AFC07C 3C014120 */  lui     $at, 0x4120                ## $at = 41200000
/* 00500 80AFC080 44814000 */  mtc1    $at, $f8                   ## $f8 = 10.00
/* 00504 80AFC084 46049182 */  mul.s   $f6, $f18, $f4             
/* 00508 80AFC088 86380032 */  lh      $t8, 0x0032($s1)           ## 00000032
/* 0050C 80AFC08C 3B198000 */  xori    $t9, $t8, 0x8000           ## $t9 = FFFF8000
/* 00510 80AFC090 A6190194 */  sh      $t9, 0x0194($s0)           ## 00000194
/* 00514 80AFC094 C7B20030 */  lwc1    $f18, 0x0030($sp)          
/* 00518 80AFC098 46083282 */  mul.s   $f10, $f6, $f8             
/* 0051C 80AFC09C 460A9003 */  div.s   $f0, $f18, $f10            
/* 00520 80AFC0A0 4610003C */  c.lt.s  $f0, $f16                  
/* 00524 80AFC0A4 00000000 */  nop
/* 00528 80AFC0A8 45020003 */  bc1fl   .L80AFC0B8                 
/* 0052C 80AFC0AC 4600103C */  c.lt.s  $f2, $f0                   
/* 00530 80AFC0B0 46008006 */  mov.s   $f0, $f16                  
/* 00534 80AFC0B4 4600103C */  c.lt.s  $f2, $f0                   
.L80AFC0B8:
/* 00538 80AFC0B8 00000000 */  nop
/* 0053C 80AFC0BC 45020003 */  bc1fl   .L80AFC0CC                 
/* 00540 80AFC0C0 C6240838 */  lwc1    $f4, 0x0838($s1)           ## 00000838
/* 00544 80AFC0C4 46001006 */  mov.s   $f0, $f2                   
/* 00548 80AFC0C8 C6240838 */  lwc1    $f4, 0x0838($s1)           ## 00000838
.L80AFC0CC:
/* 0054C 80AFC0CC 44061000 */  mfc1    $a2, $f2                   
/* 00550 80AFC0D0 44071000 */  mfc1    $a3, $f2                   
/* 00554 80AFC0D4 46002182 */  mul.s   $f6, $f4, $f0              
/* 00558 80AFC0D8 26040190 */  addiu   $a0, $s0, 0x0190           ## $a0 = 00000190
/* 0055C 80AFC0DC 3C054040 */  lui     $a1, 0x4040                ## $a1 = 40400000
/* 00560 80AFC0E0 E6260838 */  swc1    $f6, 0x0838($s1)           ## 00000838
/* 00564 80AFC0E4 0C01E107 */  jal     Math_SmoothScaleMaxF
              
/* 00568 80AFC0E8 E7A0002C */  swc1    $f0, 0x002C($sp)           
/* 0056C 80AFC0EC 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 00570 80AFC0F0 44811000 */  mtc1    $at, $f2                   ## $f2 = 1.00
/* 00574 80AFC0F4 3C0180B0 */  lui     $at, %hi(D_80AFC874)       ## $at = 80B00000
/* 00578 80AFC0F8 C7A0002C */  lwc1    $f0, 0x002C($sp)           
/* 0057C 80AFC0FC C428C874 */  lwc1    $f8, %lo(D_80AFC874)($at)  
/* 00580 80AFC100 44061000 */  mfc1    $a2, $f2                   
/* 00584 80AFC104 2604018C */  addiu   $a0, $s0, 0x018C           ## $a0 = 0000018C
/* 00588 80AFC108 46004482 */  mul.s   $f18, $f8, $f0             
/* 0058C 80AFC10C 8E050190 */  lw      $a1, 0x0190($s0)           ## 00000190
/* 00590 80AFC110 44079000 */  mfc1    $a3, $f18                  
/* 00594 80AFC114 0C01E107 */  jal     Math_SmoothScaleMaxF
              
/* 00598 80AFC118 00000000 */  nop
/* 0059C 80AFC11C 10000016 */  beq     $zero, $zero, .L80AFC178   
/* 005A0 80AFC120 86090194 */  lh      $t1, 0x0194($s0)           ## 00000194
.L80AFC124:
/* 005A4 80AFC124 86280032 */  lh      $t0, 0x0032($s1)           ## 00000032
/* 005A8 80AFC128 3C013F00 */  lui     $at, 0x3F00                ## $at = 3F000000
/* 005AC 80AFC12C 44812000 */  mtc1    $at, $f4                   ## $f4 = 0.50
/* 005B0 80AFC130 A6080194 */  sh      $t0, 0x0194($s0)           ## 00000194
/* 005B4 80AFC134 C62A0838 */  lwc1    $f10, 0x0838($s1)          ## 00000838
/* 005B8 80AFC138 44061000 */  mfc1    $a2, $f2                   
/* 005BC 80AFC13C 44071000 */  mfc1    $a3, $f2                   
/* 005C0 80AFC140 46045182 */  mul.s   $f6, $f10, $f4             
/* 005C4 80AFC144 26040190 */  addiu   $a0, $s0, 0x0190           ## $a0 = 00000190
/* 005C8 80AFC148 3C054040 */  lui     $a1, 0x4040                ## $a1 = 40400000
/* 005CC 80AFC14C 0C01E107 */  jal     Math_SmoothScaleMaxF
              
/* 005D0 80AFC150 E6260838 */  swc1    $f6, 0x0838($s1)           ## 00000838
/* 005D4 80AFC154 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 005D8 80AFC158 44811000 */  mtc1    $at, $f2                   ## $f2 = 1.00
/* 005DC 80AFC15C 3C073DCC */  lui     $a3, 0x3DCC                ## $a3 = 3DCC0000
/* 005E0 80AFC160 34E7CCCD */  ori     $a3, $a3, 0xCCCD           ## $a3 = 3DCCCCCD
/* 005E4 80AFC164 44061000 */  mfc1    $a2, $f2                   
/* 005E8 80AFC168 2604018C */  addiu   $a0, $s0, 0x018C           ## $a0 = 0000018C
/* 005EC 80AFC16C 0C01E107 */  jal     Math_SmoothScaleMaxF
              
/* 005F0 80AFC170 8E050190 */  lw      $a1, 0x0190($s0)           ## 00000190
/* 005F4 80AFC174 86090194 */  lh      $t1, 0x0194($s0)           ## 00000194
.L80AFC178:
/* 005F8 80AFC178 A62908B0 */  sh      $t1, 0x08B0($s1)           ## 000008B0
/* 005FC 80AFC17C C608018C */  lwc1    $f8, 0x018C($s0)           ## 0000018C
/* 00600 80AFC180 1000000E */  beq     $zero, $zero, .L80AFC1BC   
/* 00604 80AFC184 E62808AC */  swc1    $f8, 0x08AC($s1)           ## 000008AC
/* 00608 80AFC188 8E0A0188 */  lw      $t2, 0x0188($s0)           ## 00000188
.L80AFC18C:
/* 0060C 80AFC18C 44808000 */  mtc1    $zero, $f16                ## $f16 = 0.00
/* 00610 80AFC190 51400008 */  beql    $t2, $zero, .L80AFC1B4     
/* 00614 80AFC194 E6100190 */  swc1    $f16, 0x0190($s0)          ## 00000190
/* 00618 80AFC198 C612018C */  lwc1    $f18, 0x018C($s0)          ## 0000018C
/* 0061C 80AFC19C C62A0838 */  lwc1    $f10, 0x0838($s1)          ## 00000838
/* 00620 80AFC1A0 460A9100 */  add.s   $f4, $f18, $f10            
/* 00624 80AFC1A4 E6240838 */  swc1    $f4, 0x0838($s1)           ## 00000838
/* 00628 80AFC1A8 860C0194 */  lh      $t4, 0x0194($s0)           ## 00000194
/* 0062C 80AFC1AC A62C083C */  sh      $t4, 0x083C($s1)           ## 0000083C
/* 00630 80AFC1B0 E6100190 */  swc1    $f16, 0x0190($s0)          ## 00000190
.L80AFC1B4:
/* 00634 80AFC1B4 E610018C */  swc1    $f16, 0x018C($s0)          ## 0000018C
/* 00638 80AFC1B8 AE000188 */  sw      $zero, 0x0188($s0)         ## 00000188
.L80AFC1BC:
/* 0063C 80AFC1BC 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 00640 80AFC1C0 8FB0001C */  lw      $s0, 0x001C($sp)           
/* 00644 80AFC1C4 8FB10020 */  lw      $s1, 0x0020($sp)           
/* 00648 80AFC1C8 03E00008 */  jr      $ra                        
/* 0064C 80AFC1CC 27BD0048 */  addiu   $sp, $sp, 0x0048           ## $sp = 00000000
