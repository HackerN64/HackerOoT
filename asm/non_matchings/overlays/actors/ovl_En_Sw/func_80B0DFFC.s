.late_rodata
glabel D_80B0F238
 .word 0x4622F983

.text
glabel func_80B0DFFC
/* 0224C 80B0DFFC 27BDFF98 */  addiu   $sp, $sp, 0xFF98           ## $sp = FFFFFF98
/* 02250 80B0E000 240E0001 */  addiu   $t6, $zero, 0x0001         ## $t6 = 00000001
/* 02254 80B0E004 AFBF003C */  sw      $ra, 0x003C($sp)           
/* 02258 80B0E008 AFB20038 */  sw      $s2, 0x0038($sp)           
/* 0225C 80B0E00C AFB10034 */  sw      $s1, 0x0034($sp)           
/* 02260 80B0E010 AFB00030 */  sw      $s0, 0x0030($sp)           
/* 02264 80B0E014 AFA5006C */  sw      $a1, 0x006C($sp)           
/* 02268 80B0E018 AFAE004C */  sw      $t6, 0x004C($sp)           
/* 0226C 80B0E01C 908F01A6 */  lbu     $t7, 0x01A6($a0)           ## 000001A6
/* 02270 80B0E020 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 02274 80B0E024 8FA9006C */  lw      $t1, 0x006C($sp)           
/* 02278 80B0E028 31F80002 */  andi    $t8, $t7, 0x0002           ## $t8 = 00000000
/* 0227C 80B0E02C 5300000A */  beql    $t8, $zero, .L80B0E058     
/* 02280 80B0E030 8D2A009C */  lw      $t2, 0x009C($t1)           ## 0000009C
/* 02284 80B0E034 909901A5 */  lbu     $t9, 0x01A5($a0)           ## 000001A5
/* 02288 80B0E038 24910024 */  addiu   $s1, $a0, 0x0024           ## $s1 = 00000024
/* 0228C 80B0E03C 3328FFFD */  andi    $t0, $t9, 0xFFFD           ## $t0 = 00000000
/* 02290 80B0E040 A08801A5 */  sb      $t0, 0x01A5($a0)           ## 000001A5
/* 02294 80B0E044 8FB2006C */  lw      $s2, 0x006C($sp)           
/* 02298 80B0E048 AFA0004C */  sw      $zero, 0x004C($sp)         
/* 0229C 80B0E04C 10000062 */  beq     $zero, $zero, .L80B0E1D8   
/* 022A0 80B0E050 265207C0 */  addiu   $s2, $s2, 0x07C0           ## $s2 = 000007C0
/* 022A4 80B0E054 8D2A009C */  lw      $t2, 0x009C($t1)           ## 0000009C
.L80B0E058:
/* 022A8 80B0E058 253207C0 */  addiu   $s2, $t1, 0x07C0           ## $s2 = 000007C0
/* 022AC 80B0E05C 02402025 */  or      $a0, $s2, $zero            ## $a0 = 000007C0
/* 022B0 80B0E060 314B0003 */  andi    $t3, $t2, 0x0003           ## $t3 = 00000000
/* 022B4 80B0E064 15600013 */  bne     $t3, $zero, .L80B0E0B4     
/* 022B8 80B0E068 26110024 */  addiu   $s1, $s0, 0x0024           ## $s1 = 00000024
/* 022BC 80B0E06C 27AC0060 */  addiu   $t4, $sp, 0x0060           ## $t4 = FFFFFFF8
/* 022C0 80B0E070 240D0001 */  addiu   $t5, $zero, 0x0001         ## $t5 = 00000001
/* 022C4 80B0E074 240E0001 */  addiu   $t6, $zero, 0x0001         ## $t6 = 00000001
/* 022C8 80B0E078 27AF005C */  addiu   $t7, $sp, 0x005C           ## $t7 = FFFFFFF4
/* 022CC 80B0E07C AFAF0024 */  sw      $t7, 0x0024($sp)           
/* 022D0 80B0E080 AFAE0020 */  sw      $t6, 0x0020($sp)           
/* 022D4 80B0E084 AFAD0014 */  sw      $t5, 0x0014($sp)           
/* 022D8 80B0E088 AFAC0010 */  sw      $t4, 0x0010($sp)           
/* 022DC 80B0E08C 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000024
/* 022E0 80B0E090 26060454 */  addiu   $a2, $s0, 0x0454           ## $a2 = 00000454
/* 022E4 80B0E094 27A70050 */  addiu   $a3, $sp, 0x0050           ## $a3 = FFFFFFE8
/* 022E8 80B0E098 AFA00018 */  sw      $zero, 0x0018($sp)         
/* 022EC 80B0E09C 0C00F7A1 */  jal     BgCheck_EntityLineTest1              
/* 022F0 80B0E0A0 AFA0001C */  sw      $zero, 0x001C($sp)         
/* 022F4 80B0E0A4 54400004 */  bnel    $v0, $zero, .L80B0E0B8     
/* 022F8 80B0E0A8 8FB8006C */  lw      $t8, 0x006C($sp)           
/* 022FC 80B0E0AC 1000004A */  beq     $zero, $zero, .L80B0E1D8   
/* 02300 80B0E0B0 AFA0004C */  sw      $zero, 0x004C($sp)         
.L80B0E0B4:
/* 02304 80B0E0B4 8FB8006C */  lw      $t8, 0x006C($sp)           
.L80B0E0B8:
/* 02308 80B0E0B8 26110024 */  addiu   $s1, $s0, 0x0024           ## $s1 = 00000024
/* 0230C 80B0E0BC 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 02310 80B0E0C0 8F19009C */  lw      $t9, 0x009C($t8)           ## 0000009C
/* 02314 80B0E0C4 271207C0 */  addiu   $s2, $t8, 0x07C0           ## $s2 = 000007C0
/* 02318 80B0E0C8 02402025 */  or      $a0, $s2, $zero            ## $a0 = 000007C0
/* 0231C 80B0E0CC 33280003 */  andi    $t0, $t9, 0x0003           ## $t0 = 00000000
/* 02320 80B0E0D0 15010012 */  bne     $t0, $at, .L80B0E11C       
/* 02324 80B0E0D4 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000024
/* 02328 80B0E0D8 27AA0060 */  addiu   $t2, $sp, 0x0060           ## $t2 = FFFFFFF8
/* 0232C 80B0E0DC 240B0001 */  addiu   $t3, $zero, 0x0001         ## $t3 = 00000001
/* 02330 80B0E0E0 24090001 */  addiu   $t1, $zero, 0x0001         ## $t1 = 00000001
/* 02334 80B0E0E4 27AC005C */  addiu   $t4, $sp, 0x005C           ## $t4 = FFFFFFF4
/* 02338 80B0E0E8 AFAC0024 */  sw      $t4, 0x0024($sp)           
/* 0233C 80B0E0EC AFA90020 */  sw      $t1, 0x0020($sp)           
/* 02340 80B0E0F0 AFAB0014 */  sw      $t3, 0x0014($sp)           
/* 02344 80B0E0F4 AFAA0010 */  sw      $t2, 0x0010($sp)           
/* 02348 80B0E0F8 26060460 */  addiu   $a2, $s0, 0x0460           ## $a2 = 00000460
/* 0234C 80B0E0FC 27A70050 */  addiu   $a3, $sp, 0x0050           ## $a3 = FFFFFFE8
/* 02350 80B0E100 AFA00018 */  sw      $zero, 0x0018($sp)         
/* 02354 80B0E104 0C00F7A1 */  jal     BgCheck_EntityLineTest1              
/* 02358 80B0E108 AFA0001C */  sw      $zero, 0x001C($sp)         
/* 0235C 80B0E10C 50400004 */  beql    $v0, $zero, .L80B0E120     
/* 02360 80B0E110 8FAD006C */  lw      $t5, 0x006C($sp)           
/* 02364 80B0E114 10000030 */  beq     $zero, $zero, .L80B0E1D8   
/* 02368 80B0E118 AFA0004C */  sw      $zero, 0x004C($sp)         
.L80B0E11C:
/* 0236C 80B0E11C 8FAD006C */  lw      $t5, 0x006C($sp)           
.L80B0E120:
/* 02370 80B0E120 24010002 */  addiu   $at, $zero, 0x0002         ## $at = 00000002
/* 02374 80B0E124 02402025 */  or      $a0, $s2, $zero            ## $a0 = 000007C0
/* 02378 80B0E128 8DAE009C */  lw      $t6, 0x009C($t5)           ## 0000009C
/* 0237C 80B0E12C 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000024
/* 02380 80B0E130 2606046C */  addiu   $a2, $s0, 0x046C           ## $a2 = 0000046C
/* 02384 80B0E134 31CF0003 */  andi    $t7, $t6, 0x0003           ## $t7 = 00000000
/* 02388 80B0E138 15E10010 */  bne     $t7, $at, .L80B0E17C       
/* 0238C 80B0E13C 27A70050 */  addiu   $a3, $sp, 0x0050           ## $a3 = FFFFFFE8
/* 02390 80B0E140 27B80060 */  addiu   $t8, $sp, 0x0060           ## $t8 = FFFFFFF8
/* 02394 80B0E144 24190001 */  addiu   $t9, $zero, 0x0001         ## $t9 = 00000001
/* 02398 80B0E148 24080001 */  addiu   $t0, $zero, 0x0001         ## $t0 = 00000001
/* 0239C 80B0E14C 27AA005C */  addiu   $t2, $sp, 0x005C           ## $t2 = FFFFFFF4
/* 023A0 80B0E150 AFAA0024 */  sw      $t2, 0x0024($sp)           
/* 023A4 80B0E154 AFA80020 */  sw      $t0, 0x0020($sp)           
/* 023A8 80B0E158 AFB90014 */  sw      $t9, 0x0014($sp)           
/* 023AC 80B0E15C AFB80010 */  sw      $t8, 0x0010($sp)           
/* 023B0 80B0E160 AFA00018 */  sw      $zero, 0x0018($sp)         
/* 023B4 80B0E164 0C00F7A1 */  jal     BgCheck_EntityLineTest1              
/* 023B8 80B0E168 AFA0001C */  sw      $zero, 0x001C($sp)         
/* 023BC 80B0E16C 54400004 */  bnel    $v0, $zero, .L80B0E180     
/* 023C0 80B0E170 8FAB006C */  lw      $t3, 0x006C($sp)           
/* 023C4 80B0E174 10000018 */  beq     $zero, $zero, .L80B0E1D8   
/* 023C8 80B0E178 AFA0004C */  sw      $zero, 0x004C($sp)         
.L80B0E17C:
/* 023CC 80B0E17C 8FAB006C */  lw      $t3, 0x006C($sp)           
.L80B0E180:
/* 023D0 80B0E180 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
/* 023D4 80B0E184 02402025 */  or      $a0, $s2, $zero            ## $a0 = 000007C0
/* 023D8 80B0E188 8D69009C */  lw      $t1, 0x009C($t3)           ## 0000009C
/* 023DC 80B0E18C 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000024
/* 023E0 80B0E190 26060478 */  addiu   $a2, $s0, 0x0478           ## $a2 = 00000478
/* 023E4 80B0E194 312C0003 */  andi    $t4, $t1, 0x0003           ## $t4 = 00000000
/* 023E8 80B0E198 1581000F */  bne     $t4, $at, .L80B0E1D8       
/* 023EC 80B0E19C 27A70050 */  addiu   $a3, $sp, 0x0050           ## $a3 = FFFFFFE8
/* 023F0 80B0E1A0 27AD0060 */  addiu   $t5, $sp, 0x0060           ## $t5 = FFFFFFF8
/* 023F4 80B0E1A4 240E0001 */  addiu   $t6, $zero, 0x0001         ## $t6 = 00000001
/* 023F8 80B0E1A8 240F0001 */  addiu   $t7, $zero, 0x0001         ## $t7 = 00000001
/* 023FC 80B0E1AC 27B8005C */  addiu   $t8, $sp, 0x005C           ## $t8 = FFFFFFF4
/* 02400 80B0E1B0 AFB80024 */  sw      $t8, 0x0024($sp)           
/* 02404 80B0E1B4 AFAF0020 */  sw      $t7, 0x0020($sp)           
/* 02408 80B0E1B8 AFAE0014 */  sw      $t6, 0x0014($sp)           
/* 0240C 80B0E1BC AFAD0010 */  sw      $t5, 0x0010($sp)           
/* 02410 80B0E1C0 AFA00018 */  sw      $zero, 0x0018($sp)         
/* 02414 80B0E1C4 0C00F7A1 */  jal     BgCheck_EntityLineTest1              
/* 02418 80B0E1C8 AFA0001C */  sw      $zero, 0x001C($sp)         
/* 0241C 80B0E1CC 50400003 */  beql    $v0, $zero, .L80B0E1DC     
/* 02420 80B0E1D0 26190430 */  addiu   $t9, $s0, 0x0430           ## $t9 = 00000430
/* 02424 80B0E1D4 AFA0004C */  sw      $zero, 0x004C($sp)         
.L80B0E1D8:
/* 02428 80B0E1D8 26190430 */  addiu   $t9, $s0, 0x0430           ## $t9 = 00000430
.L80B0E1DC:
/* 0242C 80B0E1DC 24080001 */  addiu   $t0, $zero, 0x0001         ## $t0 = 00000001
/* 02430 80B0E1E0 240A0001 */  addiu   $t2, $zero, 0x0001         ## $t2 = 00000001
/* 02434 80B0E1E4 27AB005C */  addiu   $t3, $sp, 0x005C           ## $t3 = FFFFFFF4
/* 02438 80B0E1E8 AFAB0024 */  sw      $t3, 0x0024($sp)           
/* 0243C 80B0E1EC AFAA0020 */  sw      $t2, 0x0020($sp)           
/* 02440 80B0E1F0 AFA80014 */  sw      $t0, 0x0014($sp)           
/* 02444 80B0E1F4 AFB90010 */  sw      $t9, 0x0010($sp)           
/* 02448 80B0E1F8 02402025 */  or      $a0, $s2, $zero            ## $a0 = 000007C0
/* 0244C 80B0E1FC 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000024
/* 02450 80B0E200 26060484 */  addiu   $a2, $s0, 0x0484           ## $a2 = 00000484
/* 02454 80B0E204 27A70050 */  addiu   $a3, $sp, 0x0050           ## $a3 = FFFFFFE8
/* 02458 80B0E208 AFA00018 */  sw      $zero, 0x0018($sp)         
/* 0245C 80B0E20C 0C00F7A1 */  jal     BgCheck_EntityLineTest1              
/* 02460 80B0E210 AFA0001C */  sw      $zero, 0x001C($sp)         
/* 02464 80B0E214 50400039 */  beql    $v0, $zero, .L80B0E2FC     
/* 02468 80B0E218 8FBF003C */  lw      $ra, 0x003C($sp)           
/* 0246C 80B0E21C 8E020430 */  lw      $v0, 0x0430($s0)           ## 00000430
/* 02470 80B0E220 84490008 */  lh      $t1, 0x0008($v0)           ## 00000008
/* 02474 80B0E224 844C000C */  lh      $t4, 0x000C($v0)           ## 0000000C
/* 02478 80B0E228 44892000 */  mtc1    $t1, $f4                   ## $f4 = 0.00
/* 0247C 80B0E22C 448C3000 */  mtc1    $t4, $f6                   ## $f6 = 0.00
/* 02480 80B0E230 46802320 */  cvt.s.w $f12, $f4                  
/* 02484 80B0E234 0C03F494 */  jal     Math_FAtan2F              
/* 02488 80B0E238 468033A0 */  cvt.s.w $f14, $f6                  
/* 0248C 80B0E23C 3C0180B1 */  lui     $at, %hi(D_80B0F238)       ## $at = 80B10000
/* 02490 80B0E240 C428F238 */  lwc1    $f8, %lo(D_80B0F238)($at)  
/* 02494 80B0E244 27AF0050 */  addiu   $t7, $sp, 0x0050           ## $t7 = FFFFFFE8
/* 02498 80B0E248 46080282 */  mul.s   $f10, $f0, $f8             
/* 0249C 80B0E24C 4600540D */  trunc.w.s $f16, $f10                 
/* 024A0 80B0E250 440E8000 */  mfc1    $t6, $f16                  
/* 024A4 80B0E254 00000000 */  nop
/* 024A8 80B0E258 A60E007E */  sh      $t6, 0x007E($s0)           ## 0000007E
/* 024AC 80B0E25C 8DF90000 */  lw      $t9, 0x0000($t7)           ## FFFFFFE8
/* 024B0 80B0E260 AE390000 */  sw      $t9, 0x0000($s1)           ## 00000024
/* 024B4 80B0E264 8DF80004 */  lw      $t8, 0x0004($t7)           ## FFFFFFEC
/* 024B8 80B0E268 AE380004 */  sw      $t8, 0x0004($s1)           ## 00000028
/* 024BC 80B0E26C 8DF90008 */  lw      $t9, 0x0008($t7)           ## FFFFFFF0
/* 024C0 80B0E270 AE390008 */  sw      $t9, 0x0008($s1)           ## 0000002C
/* 024C4 80B0E274 0C01DE1C */  jal     Math_SinS
              ## sins?
/* 024C8 80B0E278 86040032 */  lh      $a0, 0x0032($s0)           ## 00000032
/* 024CC 80B0E27C 3C0140C0 */  lui     $at, 0x40C0                ## $at = 40C00000
/* 024D0 80B0E280 44812000 */  mtc1    $at, $f4                   ## $f4 = 6.00
/* 024D4 80B0E284 C6120024 */  lwc1    $f18, 0x0024($s0)          ## 00000024
/* 024D8 80B0E288 86040032 */  lh      $a0, 0x0032($s0)           ## 00000032
/* 024DC 80B0E28C 46002182 */  mul.s   $f6, $f4, $f0              
/* 024E0 80B0E290 46069200 */  add.s   $f8, $f18, $f6             
/* 024E4 80B0E294 0C01DE0D */  jal     Math_CosS
              ## coss?
/* 024E8 80B0E298 E6080024 */  swc1    $f8, 0x0024($s0)           ## 00000024
/* 024EC 80B0E29C 3C0140C0 */  lui     $at, 0x40C0                ## $at = 40C00000
/* 024F0 80B0E2A0 44818000 */  mtc1    $at, $f16                  ## $f16 = 6.00
/* 024F4 80B0E2A4 C60A002C */  lwc1    $f10, 0x002C($s0)          ## 0000002C
/* 024F8 80B0E2A8 27A80050 */  addiu   $t0, $sp, 0x0050           ## $t0 = FFFFFFE8
/* 024FC 80B0E2AC 46008102 */  mul.s   $f4, $f16, $f0             
/* 02500 80B0E2B0 86040032 */  lh      $a0, 0x0032($s0)           ## 00000032
/* 02504 80B0E2B4 46045480 */  add.s   $f18, $f10, $f4            
/* 02508 80B0E2B8 E612002C */  swc1    $f18, 0x002C($s0)          ## 0000002C
/* 0250C 80B0E2BC 8D0B0000 */  lw      $t3, 0x0000($t0)           ## FFFFFFE8
/* 02510 80B0E2C0 AE0B0434 */  sw      $t3, 0x0434($s0)           ## 00000434
/* 02514 80B0E2C4 8D0A0004 */  lw      $t2, 0x0004($t0)           ## FFFFFFEC
/* 02518 80B0E2C8 AE0A0438 */  sw      $t2, 0x0438($s0)           ## 00000438
/* 0251C 80B0E2CC 8D0B0008 */  lw      $t3, 0x0008($t0)           ## FFFFFFF0
/* 02520 80B0E2D0 0C01DE1C */  jal     Math_SinS
              ## sins?
/* 02524 80B0E2D4 AE0B043C */  sw      $t3, 0x043C($s0)           ## 0000043C
/* 02528 80B0E2D8 C6060434 */  lwc1    $f6, 0x0434($s0)           ## 00000434
/* 0252C 80B0E2DC 86040032 */  lh      $a0, 0x0032($s0)           ## 00000032
/* 02530 80B0E2E0 46003200 */  add.s   $f8, $f6, $f0              
/* 02534 80B0E2E4 0C01DE0D */  jal     Math_CosS
              ## coss?
/* 02538 80B0E2E8 E6080434 */  swc1    $f8, 0x0434($s0)           ## 00000434
/* 0253C 80B0E2EC C610043C */  lwc1    $f16, 0x043C($s0)          ## 0000043C
/* 02540 80B0E2F0 46008280 */  add.s   $f10, $f16, $f0            
/* 02544 80B0E2F4 E60A043C */  swc1    $f10, 0x043C($s0)          ## 0000043C
/* 02548 80B0E2F8 8FBF003C */  lw      $ra, 0x003C($sp)           
.L80B0E2FC:
/* 0254C 80B0E2FC 8FA2004C */  lw      $v0, 0x004C($sp)           
/* 02550 80B0E300 8FB00030 */  lw      $s0, 0x0030($sp)           
/* 02554 80B0E304 8FB10034 */  lw      $s1, 0x0034($sp)           
/* 02558 80B0E308 8FB20038 */  lw      $s2, 0x0038($sp)           
/* 0255C 80B0E30C 03E00008 */  jr      $ra                        
/* 02560 80B0E310 27BD0068 */  addiu   $sp, $sp, 0x0068           ## $sp = 00000000
