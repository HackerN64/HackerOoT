.late_rodata
glabel D_809CE498
    .float 10000.0

glabel D_809CE49C
 .word 0x44992000
glabel D_809CE4A0
    .float 0.3

glabel D_809CE4A4
    .float 0.4

glabel D_809CE4A8
    .float 0.2

glabel D_809CE4AC
    .float 0.15

glabel D_809CE4B0
    .float 0.3

.text
glabel func_809CD7E8
/* 00778 809CD7E8 27BDFFB0 */  addiu   $sp, $sp, 0xFFB0           ## $sp = FFFFFFB0
/* 0077C 809CD7EC AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 00780 809CD7F0 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 00784 809CD7F4 908E0256 */  lbu     $t6, 0x0256($a0)           ## 00000256
/* 00788 809CD7F8 3C18809D */  lui     $t8, %hi(D_809CE344)       ## $t8 = 809D0000
/* 0078C 809CD7FC 2718E344 */  addiu   $t8, $t8, %lo(D_809CE344)  ## $t8 = 809CE344
/* 00790 809CD800 000E7880 */  sll     $t7, $t6,  2               
/* 00794 809CD804 01EE7821 */  addu    $t7, $t7, $t6              
/* 00798 809CD808 000F7880 */  sll     $t7, $t7,  2               
/* 0079C 809CD80C 01F8C821 */  addu    $t9, $t7, $t8              
/* 007A0 809CD810 AFB9004C */  sw      $t9, 0x004C($sp)           
/* 007A4 809CD814 8CA81C44 */  lw      $t0, 0x1C44($a1)           ## 00001C44
/* 007A8 809CD818 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 007AC 809CD81C AFA80044 */  sw      $t0, 0x0044($sp)           
/* 007B0 809CD820 8C870010 */  lw      $a3, 0x0010($a0)           ## 00000010
/* 007B4 809CD824 8C860008 */  lw      $a2, 0x0008($a0)           ## 00000008
/* 007B8 809CD828 C48E002C */  lwc1    $f14, 0x002C($a0)          ## 0000002C
/* 007BC 809CD82C 0C032D65 */  jal     Math3D_Dist2DSq              
/* 007C0 809CD830 C48C0024 */  lwc1    $f12, 0x0024($a0)          ## 00000024
/* 007C4 809CD834 E7A00040 */  swc1    $f0, 0x0040($sp)           
/* 007C8 809CD838 0C27355B */  jal     func_809CD56C              
/* 007CC 809CD83C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 007D0 809CD840 8FA2004C */  lw      $v0, 0x004C($sp)           
/* 007D4 809CD844 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 007D8 809CD848 26040068 */  addiu   $a0, $s0, 0x0068           ## $a0 = 00000068
/* 007DC 809CD84C 8C450004 */  lw      $a1, 0x0004($v0)           ## 00000004
/* 007E0 809CD850 8C460008 */  lw      $a2, 0x0008($v0)           ## 00000008
/* 007E4 809CD854 8C47000C */  lw      $a3, 0x000C($v0)           ## 0000000C
/* 007E8 809CD858 0C01E0C4 */  jal     Math_SmoothScaleMaxMinF
              
/* 007EC 809CD85C E7A40010 */  swc1    $f4, 0x0010($sp)           
/* 007F0 809CD860 92090257 */  lbu     $t1, 0x0257($s0)           ## 00000257
/* 007F4 809CD864 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 007F8 809CD868 44803000 */  mtc1    $zero, $f6                 ## $f6 = 0.00
/* 007FC 809CD86C 14E90005 */  bne     $a3, $t1, .L809CD884       
/* 00800 809CD870 3C01809D */  lui     $at, %hi(D_809CE49C)       ## $at = 809D0000
/* 00804 809CD874 3C01809D */  lui     $at, %hi(D_809CE498)       ## $at = 809D0000
/* 00808 809CD878 C420E498 */  lwc1    $f0, %lo(D_809CE498)($at)  
/* 0080C 809CD87C 10000003 */  beq     $zero, $zero, .L809CD88C   
/* 00810 809CD880 240603E8 */  addiu   $a2, $zero, 0x03E8         ## $a2 = 000003E8
.L809CD884:
/* 00814 809CD884 C420E49C */  lwc1    $f0, %lo(D_809CE49C)($at)  
/* 00818 809CD888 24060258 */  addiu   $a2, $zero, 0x0258         ## $a2 = 00000258
.L809CD88C:
/* 0081C 809CD88C E7A60038 */  swc1    $f6, 0x0038($sp)           
/* 00820 809CD890 920A0256 */  lbu     $t2, 0x0256($s0)           ## 00000256
/* 00824 809CD894 C608000C */  lwc1    $f8, 0x000C($s0)           ## 0000000C
/* 00828 809CD898 11400018 */  beq     $t2, $zero, .L809CD8FC     
/* 0082C 809CD89C E6080264 */  swc1    $f8, 0x0264($s0)           ## 00000264
/* 00830 809CD8A0 C7AA0040 */  lwc1    $f10, 0x0040($sp)          
/* 00834 809CD8A4 26040024 */  addiu   $a0, $s0, 0x0024           ## $a0 = 00000024
/* 00838 809CD8A8 460A003C */  c.lt.s  $f0, $f10                  
/* 0083C 809CD8AC 00000000 */  nop
/* 00840 809CD8B0 45010005 */  bc1t    .L809CD8C8                 
/* 00844 809CD8B4 00000000 */  nop
/* 00848 809CD8B8 860B0254 */  lh      $t3, 0x0254($s0)           ## 00000254
/* 0084C 809CD8BC 29610004 */  slti    $at, $t3, 0x0004           
/* 00850 809CD8C0 5020000F */  beql    $at, $zero, .L809CD900     
/* 00854 809CD8C4 92030257 */  lbu     $v1, 0x0257($s0)           ## 00000257
.L809CD8C8:
/* 00858 809CD8C8 0C01E01A */  jal     Math_Vec3f_Yaw
              
/* 0085C 809CD8CC 26050008 */  addiu   $a1, $s0, 0x0008           ## $a1 = 00000008
/* 00860 809CD8D0 8FAC004C */  lw      $t4, 0x004C($sp)           
/* 00864 809CD8D4 00022C00 */  sll     $a1, $v0, 16               
/* 00868 809CD8D8 00052C03 */  sra     $a1, $a1, 16               
/* 0086C 809CD8DC 26040032 */  addiu   $a0, $s0, 0x0032           ## $a0 = 00000032
/* 00870 809CD8E0 0C01DE2B */  jal     Math_ApproxUpdateScaledS
              
/* 00874 809CD8E4 85860010 */  lh      $a2, 0x0010($t4)           ## 00000010
/* 00878 809CD8E8 14400041 */  bne     $v0, $zero, .L809CD9F0     
/* 0087C 809CD8EC 3C013F00 */  lui     $at, 0x3F00                ## $at = 3F000000
/* 00880 809CD8F0 44819000 */  mtc1    $at, $f18                  ## $f18 = 0.50
/* 00884 809CD8F4 1000003E */  beq     $zero, $zero, .L809CD9F0   
/* 00888 809CD8F8 E7B20038 */  swc1    $f18, 0x0038($sp)          
.L809CD8FC:
/* 0088C 809CD8FC 92030257 */  lbu     $v1, 0x0257($s0)           ## 00000257
.L809CD900:
/* 00890 809CD900 14600013 */  bne     $v1, $zero, .L809CD950     
/* 00894 809CD904 00000000 */  nop
/* 00898 809CD908 8E02011C */  lw      $v0, 0x011C($s0)           ## 0000011C
/* 0089C 809CD90C 10400010 */  beq     $v0, $zero, .L809CD950     
/* 008A0 809CD910 00000000 */  nop
/* 008A4 809CD914 1202000E */  beq     $s0, $v0, .L809CD950       
/* 008A8 809CD918 26040024 */  addiu   $a0, $s0, 0x0024           ## $a0 = 00000024
/* 008AC 809CD91C 24450024 */  addiu   $a1, $v0, 0x0024           ## $a1 = 00000024
/* 008B0 809CD920 0C01E01A */  jal     Math_Vec3f_Yaw
              
/* 008B4 809CD924 A7A60032 */  sh      $a2, 0x0032($sp)           
/* 008B8 809CD928 00022C00 */  sll     $a1, $v0, 16               
/* 008BC 809CD92C 87A60032 */  lh      $a2, 0x0032($sp)           
/* 008C0 809CD930 00052C03 */  sra     $a1, $a1, 16               
/* 008C4 809CD934 0C01DE2B */  jal     Math_ApproxUpdateScaledS
              
/* 008C8 809CD938 26040032 */  addiu   $a0, $s0, 0x0032           ## $a0 = 00000032
/* 008CC 809CD93C 1440002C */  bne     $v0, $zero, .L809CD9F0     
/* 008D0 809CD940 3C01809D */  lui     $at, %hi(D_809CE4A0)       ## $at = 809D0000
/* 008D4 809CD944 C424E4A0 */  lwc1    $f4, %lo(D_809CE4A0)($at)  
/* 008D8 809CD948 10000029 */  beq     $zero, $zero, .L809CD9F0   
/* 008DC 809CD94C E7A40038 */  swc1    $f4, 0x0038($sp)           
.L809CD950:
/* 008E0 809CD950 54E3001B */  bnel    $a3, $v1, .L809CD9C0       
/* 008E4 809CD954 8608025C */  lh      $t0, 0x025C($s0)           ## 0000025C
/* 008E8 809CD958 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 008EC 809CD95C A7A60032 */  sh      $a2, 0x0032($sp)           
/* 008F0 809CD960 3C013F00 */  lui     $at, 0x3F00                ## $at = 3F000000
/* 008F4 809CD964 44813000 */  mtc1    $at, $f6                   ## $f6 = 0.50
/* 008F8 809CD968 3C0146C0 */  lui     $at, 0x46C0                ## $at = 46C00000
/* 008FC 809CD96C 44815000 */  mtc1    $at, $f10                  ## $f10 = 24576.00
/* 00900 809CD970 46060201 */  sub.s   $f8, $f0, $f6              
/* 00904 809CD974 8619008A */  lh      $t9, 0x008A($s0)           ## 0000008A
/* 00908 809CD978 34018000 */  ori     $at, $zero, 0x8000         ## $at = 00008000
/* 0090C 809CD97C 87A60032 */  lh      $a2, 0x0032($sp)           
/* 00910 809CD980 460A4482 */  mul.s   $f18, $f8, $f10            
/* 00914 809CD984 26040032 */  addiu   $a0, $s0, 0x0032           ## $a0 = 00000032
/* 00918 809CD988 4600910D */  trunc.w.s $f4, $f18                  
/* 0091C 809CD98C 44182000 */  mfc1    $t8, $f4                   
/* 00920 809CD990 00000000 */  nop
/* 00924 809CD994 03192821 */  addu    $a1, $t8, $t9              
/* 00928 809CD998 00A12821 */  addu    $a1, $a1, $at              
/* 0092C 809CD99C 00052C00 */  sll     $a1, $a1, 16               
/* 00930 809CD9A0 0C01DE2B */  jal     Math_ApproxUpdateScaledS
              
/* 00934 809CD9A4 00052C03 */  sra     $a1, $a1, 16               
/* 00938 809CD9A8 14400011 */  bne     $v0, $zero, .L809CD9F0     
/* 0093C 809CD9AC 3C01809D */  lui     $at, %hi(D_809CE4A4)       ## $at = 809D0000
/* 00940 809CD9B0 C426E4A4 */  lwc1    $f6, %lo(D_809CE4A4)($at)  
/* 00944 809CD9B4 1000000E */  beq     $zero, $zero, .L809CD9F0   
/* 00948 809CD9B8 E7A60038 */  swc1    $f6, 0x0038($sp)           
/* 0094C 809CD9BC 8608025C */  lh      $t0, 0x025C($s0)           ## 0000025C
.L809CD9C0:
/* 00950 809CD9C0 44884000 */  mtc1    $t0, $f8                   ## $f8 = 0.00
/* 00954 809CD9C4 0C0400A4 */  jal     sinf
              
/* 00958 809CD9C8 46804320 */  cvt.s.w $f12, $f8                  
/* 0095C 809CD9CC 3C0142C8 */  lui     $at, 0x42C8                ## $at = 42C80000
/* 00960 809CD9D0 44815000 */  mtc1    $at, $f10                  ## $f10 = 100.00
/* 00964 809CD9D4 86090032 */  lh      $t1, 0x0032($s0)           ## 00000032
/* 00968 809CD9D8 460A0482 */  mul.s   $f18, $f0, $f10            
/* 0096C 809CD9DC 4600910D */  trunc.w.s $f4, $f18                  
/* 00970 809CD9E0 440D2000 */  mfc1    $t5, $f4                   
/* 00974 809CD9E4 00000000 */  nop
/* 00978 809CD9E8 012D7021 */  addu    $t6, $t1, $t5              
/* 0097C 809CD9EC A60E0032 */  sh      $t6, 0x0032($s0)           ## 00000032
.L809CD9F0:
/* 00980 809CD9F0 0C2735BF */  jal     func_809CD6FC              
/* 00984 809CD9F4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00988 809CD9F8 0C01DE1C */  jal     Math_Sins
              ## sins?
/* 0098C 809CD9FC 86040260 */  lh      $a0, 0x0260($s0)           ## 00000260
/* 00990 809CDA00 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 00994 809CDA04 E7A00028 */  swc1    $f0, 0x0028($sp)           
/* 00998 809CDA08 8604025E */  lh      $a0, 0x025E($s0)           ## 0000025E
/* 0099C 809CDA0C 0C01DE1C */  jal     Math_Sins
              ## sins?
/* 009A0 809CDA10 E7A0002C */  swc1    $f0, 0x002C($sp)           
/* 009A4 809CDA14 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 009A8 809CDA18 44817000 */  mtc1    $at, $f14                  ## $f14 = 1.00
/* 009AC 809CDA1C 3C01809D */  lui     $at, %hi(D_809CE4A8)       ## $at = 809D0000
/* 009B0 809CDA20 C430E4A8 */  lwc1    $f16, %lo(D_809CE4A8)($at) 
/* 009B4 809CDA24 3C013F00 */  lui     $at, 0x3F00                ## $at = 3F000000
/* 009B8 809CDA28 44814000 */  mtc1    $at, $f8                   ## $f8 = 0.50
/* 009BC 809CDA2C C6060068 */  lwc1    $f6, 0x0068($s0)           ## 00000068
/* 009C0 809CDA30 C7A2002C */  lwc1    $f2, 0x002C($sp)           
/* 009C4 809CDA34 3C01809D */  lui     $at, %hi(D_809CE4AC)       ## $at = 809D0000
/* 009C8 809CDA38 46083282 */  mul.s   $f10, $f6, $f8             
/* 009CC 809CDA3C C7A60028 */  lwc1    $f6, 0x0028($sp)           
/* 009D0 809CDA40 46101482 */  mul.s   $f18, $f2, $f16            
/* 009D4 809CDA44 46067201 */  sub.s   $f8, $f14, $f6             
/* 009D8 809CDA48 46125100 */  add.s   $f4, $f10, $f18            
/* 009DC 809CDA4C C42AE4AC */  lwc1    $f10, %lo(D_809CE4AC)($at) 
/* 009E0 809CDA50 3C01809D */  lui     $at, %hi(D_809CE4B0)       ## $at = 809D0000
/* 009E4 809CDA54 460A4482 */  mul.s   $f18, $f8, $f10            
/* 009E8 809CDA58 46007201 */  sub.s   $f8, $f14, $f0             
/* 009EC 809CDA5C C42AE4B0 */  lwc1    $f10, %lo(D_809CE4B0)($at) 
/* 009F0 809CDA60 3C013FC0 */  lui     $at, 0x3FC0                ## $at = 3FC00000
/* 009F4 809CDA64 46122180 */  add.s   $f6, $f4, $f18             
/* 009F8 809CDA68 460A4102 */  mul.s   $f4, $f8, $f10             
/* 009FC 809CDA6C C7A80038 */  lwc1    $f8, 0x0038($sp)           
/* 00A00 809CDA70 46062480 */  add.s   $f18, $f4, $f6             
/* 00A04 809CDA74 46089300 */  add.s   $f12, $f18, $f8            
/* 00A08 809CDA78 4610603C */  c.lt.s  $f12, $f16                 
/* 00A0C 809CDA7C 00000000 */  nop
/* 00A10 809CDA80 45020004 */  bc1fl   .L809CDA94                 
/* 00A14 809CDA84 44810000 */  mtc1    $at, $f0                   ## $f0 = 1.50
/* 00A18 809CDA88 1000000B */  beq     $zero, $zero, .L809CDAB8   
/* 00A1C 809CDA8C E61001C8 */  swc1    $f16, 0x01C8($s0)          ## 000001C8
/* 00A20 809CDA90 44810000 */  mtc1    $at, $f0                   ## $f0 = 1.50
.L809CDA94:
/* 00A24 809CDA94 00000000 */  nop
/* 00A28 809CDA98 460C003C */  c.lt.s  $f0, $f12                  
/* 00A2C 809CDA9C 00000000 */  nop
/* 00A30 809CDAA0 45020004 */  bc1fl   .L809CDAB4                 
/* 00A34 809CDAA4 46006086 */  mov.s   $f2, $f12                  
/* 00A38 809CDAA8 10000002 */  beq     $zero, $zero, .L809CDAB4   
/* 00A3C 809CDAAC 46000086 */  mov.s   $f2, $f0                   
/* 00A40 809CDAB0 46006086 */  mov.s   $f2, $f12                  
.L809CDAB4:
/* 00A44 809CDAB4 E60201C8 */  swc1    $f2, 0x01C8($s0)           ## 000001C8
.L809CDAB8:
/* 00A48 809CDAB8 0C02927F */  jal     SkelAnime_FrameUpdateMatrix
              
/* 00A4C 809CDABC 260401AC */  addiu   $a0, $s0, 0x01AC           ## $a0 = 000001AC
/* 00A50 809CDAC0 860F0254 */  lh      $t7, 0x0254($s0)           ## 00000254
/* 00A54 809CDAC4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00A58 809CDAC8 5DE0000A */  bgtzl   $t7, .L809CDAF4            
/* 00A5C 809CDACC 860A001C */  lh      $t2, 0x001C($s0)           ## 0000001C
/* 00A60 809CDAD0 92180256 */  lbu     $t8, 0x0256($s0)           ## 00000256
/* 00A64 809CDAD4 3C08809D */  lui     $t0, %hi(D_809CE344)       ## $t0 = 809D0000
/* 00A68 809CDAD8 2508E344 */  addiu   $t0, $t0, %lo(D_809CE344)  ## $t0 = 809CE344
/* 00A6C 809CDADC 0018C880 */  sll     $t9, $t8,  2               
/* 00A70 809CDAE0 0338C821 */  addu    $t9, $t9, $t8              
/* 00A74 809CDAE4 0019C880 */  sll     $t9, $t9,  2               
/* 00A78 809CDAE8 0C27341C */  jal     func_809CD070              
/* 00A7C 809CDAEC 03282821 */  addu    $a1, $t9, $t0              
/* 00A80 809CDAF0 860A001C */  lh      $t2, 0x001C($s0)           ## 0000001C
.L809CDAF4:
/* 00A84 809CDAF4 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 00A88 809CDAF8 8FA20044 */  lw      $v0, 0x0044($sp)           
/* 00A8C 809CDAFC 314B0001 */  andi    $t3, $t2, 0x0001           ## $t3 = 00000000
/* 00A90 809CDB00 55610021 */  bnel    $t3, $at, .L809CDB88       
/* 00A94 809CDB04 C6120090 */  lwc1    $f18, 0x0090($s0)          ## 00000090
/* 00A98 809CDB08 804C0151 */  lb      $t4, 0x0151($v0)           ## 00000151
/* 00A9C 809CDB0C 24010006 */  addiu   $at, $zero, 0x0006         ## $at = 00000006
/* 00AA0 809CDB10 5581001D */  bnel    $t4, $at, .L809CDB88       
/* 00AA4 809CDB14 C6120090 */  lwc1    $f18, 0x0090($s0)          ## 00000090
/* 00AA8 809CDB18 8609025A */  lh      $t1, 0x025A($s0)           ## 0000025A
/* 00AAC 809CDB1C 5D20001A */  bgtzl   $t1, .L809CDB88            
/* 00AB0 809CDB20 C6120090 */  lwc1    $f18, 0x0090($s0)          ## 00000090
/* 00AB4 809CDB24 C44C0024 */  lwc1    $f12, 0x0024($v0)          ## 00000024
/* 00AB8 809CDB28 C44E002C */  lwc1    $f14, 0x002C($v0)          ## 0000002C
/* 00ABC 809CDB2C 8E060008 */  lw      $a2, 0x0008($s0)           ## 00000008
/* 00AC0 809CDB30 0C032D65 */  jal     Math3D_Dist2DSq              
/* 00AC4 809CDB34 8E070010 */  lw      $a3, 0x0010($s0)           ## 00000010
/* 00AC8 809CDB38 3C014661 */  lui     $at, 0x4661                ## $at = 46610000
/* 00ACC 809CDB3C 44815000 */  mtc1    $at, $f10                  ## $f10 = 14400.00
/* 00AD0 809CDB40 3C014270 */  lui     $at, 0x4270                ## $at = 42700000
/* 00AD4 809CDB44 460A003C */  c.lt.s  $f0, $f10                  
/* 00AD8 809CDB48 00000000 */  nop
/* 00ADC 809CDB4C 45010008 */  bc1t    .L809CDB70                 
/* 00AE0 809CDB50 00000000 */  nop
/* 00AE4 809CDB54 C6040090 */  lwc1    $f4, 0x0090($s0)           ## 00000090
/* 00AE8 809CDB58 44813000 */  mtc1    $at, $f6                   ## $f6 = 60.00
/* 00AEC 809CDB5C 00000000 */  nop
/* 00AF0 809CDB60 4606203C */  c.lt.s  $f4, $f6                   
/* 00AF4 809CDB64 00000000 */  nop
/* 00AF8 809CDB68 45020007 */  bc1fl   .L809CDB88                 
/* 00AFC 809CDB6C C6120090 */  lwc1    $f18, 0x0090($s0)          ## 00000090
.L809CDB70:
/* 00B00 809CDB70 0C2736F3 */  jal     func_809CDBCC              
/* 00B04 809CDB74 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00B08 809CDB78 240D0002 */  addiu   $t5, $zero, 0x0002         ## $t5 = 00000002
/* 00B0C 809CDB7C 1000000E */  beq     $zero, $zero, .L809CDBB8   
/* 00B10 809CDB80 A20D0257 */  sb      $t5, 0x0257($s0)           ## 00000257
/* 00B14 809CDB84 C6120090 */  lwc1    $f18, 0x0090($s0)          ## 00000090
.L809CDB88:
/* 00B18 809CDB88 3C01405E */  lui     $at, 0x405E                ## $at = 405E0000
/* 00B1C 809CDB8C 44815800 */  mtc1    $at, $f11                  ## $f11 = 3.47
/* 00B20 809CDB90 44805000 */  mtc1    $zero, $f10                ## $f10 = 0.00
/* 00B24 809CDB94 46009221 */  cvt.d.s $f8, $f18                  
/* 00B28 809CDB98 240E0001 */  addiu   $t6, $zero, 0x0001         ## $t6 = 00000001
/* 00B2C 809CDB9C 462A403C */  c.lt.d  $f8, $f10                  
/* 00B30 809CDBA0 00000000 */  nop
/* 00B34 809CDBA4 45020004 */  bc1fl   .L809CDBB8                 
/* 00B38 809CDBA8 A2000257 */  sb      $zero, 0x0257($s0)         ## 00000257
/* 00B3C 809CDBAC 10000002 */  beq     $zero, $zero, .L809CDBB8   
/* 00B40 809CDBB0 A20E0257 */  sb      $t6, 0x0257($s0)           ## 00000257
/* 00B44 809CDBB4 A2000257 */  sb      $zero, 0x0257($s0)         ## 00000257
.L809CDBB8:
/* 00B48 809CDBB8 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 00B4C 809CDBBC 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 00B50 809CDBC0 27BD0050 */  addiu   $sp, $sp, 0x0050           ## $sp = 00000000
/* 00B54 809CDBC4 03E00008 */  jr      $ra                        
/* 00B58 809CDBC8 00000000 */  nop
