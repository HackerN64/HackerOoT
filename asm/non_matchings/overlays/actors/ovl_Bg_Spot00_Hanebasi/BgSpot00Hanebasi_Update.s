.late_rodata
glabel D_808AA884
 .word 0x44D48000
glabel D_808AA888
 .word 0x3B3B3EE7

.text
glabel BgSpot00Hanebasi_Update
/* 0082C 808A9FAC 27BDFFD0 */  addiu   $sp, $sp, 0xFFD0           ## $sp = FFFFFFD0
/* 00830 808A9FB0 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 00834 808A9FB4 AFB00018 */  sw      $s0, 0x0018($sp)           
/* 00838 808A9FB8 AFA40030 */  sw      $a0, 0x0030($sp)           
/* 0083C 808A9FBC 8C990164 */  lw      $t9, 0x0164($a0)           ## 00000164
/* 00840 808A9FC0 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 00844 808A9FC4 0320F809 */  jalr    $ra, $t9                   
/* 00848 808A9FC8 00000000 */  nop
/* 0084C 808A9FCC 8FA70030 */  lw      $a3, 0x0030($sp)           
/* 00850 808A9FD0 2401FFFF */  addiu   $at, $zero, 0xFFFF         ## $at = FFFFFFFF
/* 00854 808A9FD4 84EE001C */  lh      $t6, 0x001C($a3)           ## 0000001C
/* 00858 808A9FD8 55C100B1 */  bnel    $t6, $at, .L808AA2A0       
/* 0085C 808A9FDC 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 00860 808A9FE0 860F00A4 */  lh      $t7, 0x00A4($s0)           ## 000000A4
/* 00864 808A9FE4 24010051 */  addiu   $at, $zero, 0x0051         ## $at = 00000051
/* 00868 808A9FE8 3C038012 */  lui     $v1, %hi(gBitFlags)
/* 0086C 808A9FEC 15E10066 */  bne     $t7, $at, .L808AA188       
/* 00870 808A9FF0 24637120 */  addiu   $v1, %lo(gBitFlags)
/* 00874 808A9FF4 3C088016 */  lui     $t0, %hi(gSaveContext)
/* 00878 808A9FF8 2508E660 */  addiu   $t0, %lo(gSaveContext)
/* 0087C 808A9FFC 8D0200A4 */  lw      $v0, 0x00A4($t0)           ## 8015E704
/* 00880 808AA000 8C780048 */  lw      $t8, 0x0048($v1)           ## 80127168
/* 00884 808AA004 03024824 */  and     $t1, $t8, $v0              
/* 00888 808AA008 1120005F */  beq     $t1, $zero, .L808AA188     
/* 0088C 808AA00C 00000000 */  nop
/* 00890 808AA010 8C6A004C */  lw      $t2, 0x004C($v1)           ## 8012716C
/* 00894 808AA014 01425824 */  and     $t3, $t2, $v0              
/* 00898 808AA018 1160005B */  beq     $t3, $zero, .L808AA188     
/* 0089C 808AA01C 00000000 */  nop
/* 008A0 808AA020 8C6C0050 */  lw      $t4, 0x0050($v1)           ## 80127170
/* 008A4 808AA024 01826824 */  and     $t5, $t4, $v0              
/* 008A8 808AA028 11A00057 */  beq     $t5, $zero, .L808AA188     
/* 008AC 808AA02C 00000000 */  nop
/* 008B0 808AA030 95190EE4 */  lhu     $t9, 0x0EE4($t0)           ## 8015F544
/* 008B4 808AA034 332E0001 */  andi    $t6, $t9, 0x0001           ## $t6 = 00000000
/* 008B8 808AA038 15C00053 */  bne     $t6, $zero, .L808AA188     
/* 008BC 808AA03C 00000000 */  nop
/* 008C0 808AA040 8D0F0004 */  lw      $t7, 0x0004($t0)           ## 8015E664
/* 008C4 808AA044 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 008C8 808AA048 15E1004F */  bne     $t7, $at, .L808AA188       
/* 008CC 808AA04C 00000000 */  nop
/* 008D0 808AA050 8E051C44 */  lw      $a1, 0x1C44($s0)           ## 00001C44
/* 008D4 808AA054 3C01C3E1 */  lui     $at, 0xC3E1                ## $at = C3E10000
/* 008D8 808AA058 44812000 */  mtc1    $at, $f4                   ## $f4 = -450.00
/* 008DC 808AA05C C4A00024 */  lwc1    $f0, 0x0024($a1)           ## 00000024
/* 008E0 808AA060 3C0143E1 */  lui     $at, 0x43E1                ## $at = 43E10000
/* 008E4 808AA064 4600203C */  c.lt.s  $f4, $f0                   
/* 008E8 808AA068 00000000 */  nop
/* 008EC 808AA06C 4502003D */  bc1fl   .L808AA164                 
/* 008F0 808AA070 3C05453B */  lui     $a1, 0x453B                ## $a1 = 453B0000
/* 008F4 808AA074 44813000 */  mtc1    $at, $f6                   ## $f6 = 450.00
/* 008F8 808AA078 3C014487 */  lui     $at, 0x4487                ## $at = 44870000
/* 008FC 808AA07C 4606003C */  c.lt.s  $f0, $f6                   
/* 00900 808AA080 00000000 */  nop
/* 00904 808AA084 45020037 */  bc1fl   .L808AA164                 
/* 00908 808AA088 3C05453B */  lui     $a1, 0x453B                ## $a1 = 453B0000
/* 0090C 808AA08C C4A0002C */  lwc1    $f0, 0x002C($a1)           ## 453B002C
/* 00910 808AA090 44814000 */  mtc1    $at, $f8                   ## $f8 = 1080.00
/* 00914 808AA094 3C01808B */  lui     $at, %hi(D_808AA884)       ## $at = 808B0000
/* 00918 808AA098 4600403C */  c.lt.s  $f8, $f0                   
/* 0091C 808AA09C 00000000 */  nop
/* 00920 808AA0A0 45020030 */  bc1fl   .L808AA164                 
/* 00924 808AA0A4 3C05453B */  lui     $a1, 0x453B                ## $a1 = 453B0000
/* 00928 808AA0A8 C42AA884 */  lwc1    $f10, %lo(D_808AA884)($at) 
/* 0092C 808AA0AC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00930 808AA0B0 460A003C */  c.lt.s  $f0, $f10                  
/* 00934 808AA0B4 00000000 */  nop
/* 00938 808AA0B8 4502002A */  bc1fl   .L808AA164                 
/* 0093C 808AA0BC 3C05453B */  lui     $a1, 0x453B                ## $a1 = 453B0000
/* 00940 808AA0C0 AFA50024 */  sw      $a1, 0x0024($sp)           
/* 00944 808AA0C4 0C02FF21 */  jal     Gameplay_InCsMode              
/* 00948 808AA0C8 AFA70030 */  sw      $a3, 0x0030($sp)           
/* 0094C 808AA0CC 3C088016 */  lui     $t0, %hi(gSaveContext)
/* 00950 808AA0D0 2508E660 */  addiu   $t0, %lo(gSaveContext)
/* 00954 808AA0D4 8FA50024 */  lw      $a1, 0x0024($sp)           
/* 00958 808AA0D8 14400021 */  bne     $v0, $zero, .L808AA160     
/* 0095C 808AA0DC 8FA70030 */  lw      $a3, 0x0030($sp)           
/* 00960 808AA0E0 95180EE4 */  lhu     $t8, 0x0EE4($t0)           ## 8015F544
/* 00964 808AA0E4 24040082 */  addiu   $a0, $zero, 0x0082         ## $a0 = 00000082
/* 00968 808AA0E8 AFA50024 */  sw      $a1, 0x0024($sp)           
/* 0096C 808AA0EC 37090001 */  ori     $t1, $t8, 0x0001           ## $t1 = 00000001
/* 00970 808AA0F0 A5090EE4 */  sh      $t1, 0x0EE4($t0)           ## 8015F544
/* 00974 808AA0F4 0C00D6DD */  jal     Flags_SetEventChkInf
              
/* 00978 808AA0F8 AFA70030 */  sw      $a3, 0x0030($sp)           
/* 0097C 808AA0FC 8FA70030 */  lw      $a3, 0x0030($sp)           
/* 00980 808AA100 3C0A808B */  lui     $t2, %hi(func_808A9D18)    ## $t2 = 808B0000
/* 00984 808AA104 8FA50024 */  lw      $a1, 0x0024($sp)           
/* 00988 808AA108 254A9D18 */  addiu   $t2, $t2, %lo(func_808A9D18) ## $t2 = 808A9D18
/* 0098C 808AA10C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00990 808AA110 24060008 */  addiu   $a2, $zero, 0x0008         ## $a2 = 00000008
/* 00994 808AA114 0C00B7D5 */  jal     func_8002DF54              
/* 00998 808AA118 ACEA0164 */  sw      $t2, 0x0164($a3)           ## 00000164
/* 0099C 808AA11C 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 009A0 808AA120 00300821 */  addu    $at, $at, $s0              
/* 009A4 808AA124 240B00CD */  addiu   $t3, $zero, 0x00CD         ## $t3 = 000000CD
/* 009A8 808AA128 3C088016 */  lui     $t0, %hi(gSaveContext)
/* 009AC 808AA12C A42B1E1A */  sh      $t3, 0x1E1A($at)           ## 00011E1A
/* 009B0 808AA130 2508E660 */  addiu   $t0, %lo(gSaveContext)
/* 009B4 808AA134 340CFFF1 */  ori     $t4, $zero, 0xFFF1         ## $t4 = 0000FFF1
/* 009B8 808AA138 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 009BC 808AA13C A50C1412 */  sh      $t4, 0x1412($t0)           ## 8015FA72
/* 009C0 808AA140 00300821 */  addu    $at, $at, $s0              
/* 009C4 808AA144 240D0014 */  addiu   $t5, $zero, 0x0014         ## $t5 = 00000014
/* 009C8 808AA148 A02D1E15 */  sb      $t5, 0x1E15($at)           ## 00011E15
/* 009CC 808AA14C 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 009D0 808AA150 00300821 */  addu    $at, $at, $s0              
/* 009D4 808AA154 24190004 */  addiu   $t9, $zero, 0x0004         ## $t9 = 00000004
/* 009D8 808AA158 1000000B */  beq     $zero, $zero, .L808AA188   
/* 009DC 808AA15C A0391E5E */  sb      $t9, 0x1E5E($at)           ## 00011E5E
.L808AA160:
/* 009E0 808AA160 3C05453B */  lui     $a1, 0x453B                ## $a1 = 453B0000
.L808AA164:
/* 009E4 808AA164 34A58000 */  ori     $a1, $a1, 0x8000           ## $a1 = 453B8000
/* 009E8 808AA168 00E02025 */  or      $a0, $a3, $zero            ## $a0 = 00000000
/* 009EC 808AA16C 0C00B84B */  jal     func_8002E12C              
/* 009F0 808AA170 24067530 */  addiu   $a2, $zero, 0x7530         ## $a2 = 00007530
/* 009F4 808AA174 10400004 */  beq     $v0, $zero, .L808AA188     
/* 009F8 808AA178 240E0001 */  addiu   $t6, $zero, 0x0001         ## $t6 = 00000001
/* 009FC 808AA17C 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 00A00 808AA180 00300821 */  addu    $at, $at, $s0              
/* 00A04 808AA184 A02E0B01 */  sb      $t6, 0x0B01($at)           ## 00010B01
.L808AA188:
/* 00A08 808AA188 3C088016 */  lui     $t0, %hi(gSaveContext)
/* 00A0C 808AA18C 2508E660 */  addiu   $t0, %lo(gSaveContext)
/* 00A10 808AA190 8D041360 */  lw      $a0, 0x1360($t0)           ## 8015F9C0
/* 00A14 808AA194 24060005 */  addiu   $a2, $zero, 0x0005         ## $a2 = 00000005
/* 00A18 808AA198 3C058012 */  lui     $a1, %hi(D_8011FB40)
/* 00A1C 808AA19C 14C4003F */  bne     $a2, $a0, .L808AA29C       
/* 00A20 808AA1A0 24A5FB40 */  addiu   $a1, %lo(D_8011FB40)
/* 00A24 808AA1A4 94AF0000 */  lhu     $t7, 0x0000($a1)           ## 8011FB40
/* 00A28 808AA1A8 24010032 */  addiu   $at, $zero, 0x0032         ## $at = 00000032
/* 00A2C 808AA1AC 55E10033 */  bnel    $t7, $at, .L808AA27C       
/* 00A30 808AA1B0 9502000C */  lhu     $v0, 0x000C($t0)           ## 8015E66C
/* 00A34 808AA1B4 9503000C */  lhu     $v1, 0x000C($t0)           ## 8015E66C
/* 00A38 808AA1B8 3401D557 */  ori     $at, $zero, 0xD557         ## $at = 0000D557
/* 00A3C 808AA1BC 3402D556 */  ori     $v0, $zero, 0xD556         ## $v0 = 0000D556
/* 00A40 808AA1C0 0061082A */  slt     $at, $v1, $at              
/* 00A44 808AA1C4 54200004 */  bnel    $at, $zero, .L808AA1D8     
/* 00A48 808AA1C8 0043C023 */  subu    $t8, $v0, $v1              
/* 00A4C 808AA1CC 3C020001 */  lui     $v0, 0x0001                ## $v0 = 00010000
/* 00A50 808AA1D0 3442D556 */  ori     $v0, $v0, 0xD556           ## $v0 = 0001D556
/* 00A54 808AA1D4 0043C023 */  subu    $t8, $v0, $v1              
.L808AA1D8:
/* 00A58 808AA1D8 44988000 */  mtc1    $t8, $f16                  ## $f16 = 0.00
/* 00A5C 808AA1DC 3C01808B */  lui     $at, %hi(D_808AA888)       ## $at = 808B0000
/* 00A60 808AA1E0 C424A888 */  lwc1    $f4, %lo(D_808AA888)($at)  
/* 00A64 808AA1E4 468084A0 */  cvt.s.w $f18, $f16                 
/* 00A68 808AA1E8 240A0001 */  addiu   $t2, $zero, 0x0001         ## $t2 = 00000001
/* 00A6C 808AA1EC 3C014F00 */  lui     $at, 0x4F00                ## $at = 4F000000
/* 00A70 808AA1F0 46049182 */  mul.s   $f6, $f18, $f4             
/* 00A74 808AA1F4 4449F800 */  cfc1    $t1, $31
/* 00A78 808AA1F8 44CAF800 */  ctc1    $t2, $31
/* 00A7C 808AA1FC 00000000 */  nop
/* 00A80 808AA200 46003224 */  cvt.w.s $f8, $f6                   
/* 00A84 808AA204 444AF800 */  cfc1    $t2, $31
/* 00A88 808AA208 00000000 */  nop
/* 00A8C 808AA20C 314A0078 */  andi    $t2, $t2, 0x0078           ## $t2 = 00000000
/* 00A90 808AA210 51400013 */  beql    $t2, $zero, .L808AA260     
/* 00A94 808AA214 440A4000 */  mfc1    $t2, $f8                   
/* 00A98 808AA218 44814000 */  mtc1    $at, $f8                   ## $f8 = 2147483648.00
/* 00A9C 808AA21C 240A0001 */  addiu   $t2, $zero, 0x0001         ## $t2 = 00000001
/* 00AA0 808AA220 46083201 */  sub.s   $f8, $f6, $f8              
/* 00AA4 808AA224 44CAF800 */  ctc1    $t2, $31
/* 00AA8 808AA228 00000000 */  nop
/* 00AAC 808AA22C 46004224 */  cvt.w.s $f8, $f8                   
/* 00AB0 808AA230 444AF800 */  cfc1    $t2, $31
/* 00AB4 808AA234 00000000 */  nop
/* 00AB8 808AA238 314A0078 */  andi    $t2, $t2, 0x0078           ## $t2 = 00000000
/* 00ABC 808AA23C 15400005 */  bne     $t2, $zero, .L808AA254     
/* 00AC0 808AA240 00000000 */  nop
/* 00AC4 808AA244 440A4000 */  mfc1    $t2, $f8                   
/* 00AC8 808AA248 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 00ACC 808AA24C 10000007 */  beq     $zero, $zero, .L808AA26C   
/* 00AD0 808AA250 01415025 */  or      $t2, $t2, $at              ## $t2 = 80000000
.L808AA254:
/* 00AD4 808AA254 10000005 */  beq     $zero, $zero, .L808AA26C   
/* 00AD8 808AA258 240AFFFF */  addiu   $t2, $zero, 0xFFFF         ## $t2 = FFFFFFFF
/* 00ADC 808AA25C 440A4000 */  mfc1    $t2, $f8                   
.L808AA260:
/* 00AE0 808AA260 00000000 */  nop
/* 00AE4 808AA264 0540FFFB */  bltz    $t2, .L808AA254            
/* 00AE8 808AA268 00000000 */  nop
.L808AA26C:
/* 00AEC 808AA26C 44C9F800 */  ctc1    $t1, $31
/* 00AF0 808AA270 A4AA0000 */  sh      $t2, 0x0000($a1)           ## 8011FB40
/* 00AF4 808AA274 00000000 */  nop
/* 00AF8 808AA278 9502000C */  lhu     $v0, 0x000C($t0)           ## 8015E66C
.L808AA27C:
/* 00AFC 808AA27C 28412AAC */  slti    $at, $v0, 0x2AAC           
/* 00B00 808AA280 14200006 */  bne     $at, $zero, .L808AA29C     
/* 00B04 808AA284 28413000 */  slti    $at, $v0, 0x3000           
/* 00B08 808AA288 50200005 */  beql    $at, $zero, .L808AA2A0     
/* 00B0C 808AA28C 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 00B10 808AA290 54C40003 */  bnel    $a2, $a0, .L808AA2A0       
/* 00B14 808AA294 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 00B18 808AA298 A4A00000 */  sh      $zero, 0x0000($a1)         ## 8011FB40
.L808AA29C:
/* 00B1C 808AA29C 8FBF001C */  lw      $ra, 0x001C($sp)           
.L808AA2A0:
/* 00B20 808AA2A0 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 00B24 808AA2A4 27BD0030 */  addiu   $sp, $sp, 0x0030           ## $sp = 00000000
/* 00B28 808AA2A8 03E00008 */  jr      $ra                        
/* 00B2C 808AA2AC 00000000 */  nop
