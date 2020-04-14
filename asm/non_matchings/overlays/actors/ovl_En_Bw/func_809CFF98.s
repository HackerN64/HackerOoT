glabel func_809CFF98
/* 018B8 809CFF98 27BDFFC8 */  addiu   $sp, $sp, 0xFFC8           ## $sp = FFFFFFC8
/* 018BC 809CFF9C AFB00030 */  sw      $s0, 0x0030($sp)           
/* 018C0 809CFFA0 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 018C4 809CFFA4 AFBF0034 */  sw      $ra, 0x0034($sp)           
/* 018C8 809CFFA8 AFA5003C */  sw      $a1, 0x003C($sp)           
/* 018CC 809CFFAC 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 018D0 809CFFB0 248400B8 */  addiu   $a0, $a0, 0x00B8           ## $a0 = 000000B8
/* 018D4 809CFFB4 AFA00010 */  sw      $zero, 0x0010($sp)         
/* 018D8 809CFFB8 24060001 */  addiu   $a2, $zero, 0x0001         ## $a2 = 00000001
/* 018DC 809CFFBC 0C01E1A7 */  jal     Math_SmoothScaleMaxMinS
              
/* 018E0 809CFFC0 24070FA0 */  addiu   $a3, $zero, 0x0FA0         ## $a3 = 00000FA0
/* 018E4 809CFFC4 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 018E8 809CFFC8 3C053F19 */  lui     $a1, 0x3F19                ## $a1 = 3F190000
/* 018EC 809CFFCC 3C073D4C */  lui     $a3, 0x3D4C                ## $a3 = 3D4C0000
/* 018F0 809CFFD0 34E7CCCD */  ori     $a3, $a3, 0xCCCD           ## $a3 = 3D4CCCCD
/* 018F4 809CFFD4 34A5999A */  ori     $a1, $a1, 0x999A           ## $a1 = 3F19999A
/* 018F8 809CFFD8 26040248 */  addiu   $a0, $s0, 0x0248           ## $a0 = 00000248
/* 018FC 809CFFDC 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 01900 809CFFE0 0C01E0C4 */  jal     Math_SmoothScaleMaxMinF
              
/* 01904 809CFFE4 E7A40010 */  swc1    $f4, 0x0010($sp)           
/* 01908 809CFFE8 0C02927F */  jal     SkelAnime_FrameUpdateMatrix
              
/* 0190C 809CFFEC 2604014C */  addiu   $a0, $s0, 0x014C           ## $a0 = 0000014C
/* 01910 809CFFF0 960E0088 */  lhu     $t6, 0x0088($s0)           ## 00000088
/* 01914 809CFFF4 8FA4003C */  lw      $a0, 0x003C($sp)           
/* 01918 809CFFF8 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 0191C 809CFFFC 31CF0003 */  andi    $t7, $t6, 0x0003           ## $t7 = 00000000
/* 01920 809D0000 11E00016 */  beq     $t7, $zero, .L809D005C     
/* 01924 809D0004 26060024 */  addiu   $a2, $s0, 0x0024           ## $a2 = 00000024
/* 01928 809D0008 3C014080 */  lui     $at, 0x4080                ## $at = 40800000
/* 0192C 809D000C 44813000 */  mtc1    $at, $f6                   ## $f6 = 4.00
/* 01930 809D0010 2418000B */  addiu   $t8, $zero, 0x000B         ## $t8 = 0000000B
/* 01934 809D0014 AFB80010 */  sw      $t8, 0x0010($sp)           
/* 01938 809D0018 3C0741F0 */  lui     $a3, 0x41F0                ## $a3 = 41F00000
/* 0193C 809D001C AFA00018 */  sw      $zero, 0x0018($sp)         
/* 01940 809D0020 AFA0001C */  sw      $zero, 0x001C($sp)         
/* 01944 809D0024 AFA00020 */  sw      $zero, 0x0020($sp)         
/* 01948 809D0028 0C00CC98 */  jal     func_80033260              
/* 0194C 809D002C E7A60014 */  swc1    $f6, 0x0014($sp)           
/* 01950 809D0030 44804000 */  mtc1    $zero, $f8                 ## $f8 = 0.00
/* 01954 809D0034 24190BB8 */  addiu   $t9, $zero, 0x0BB8         ## $t9 = 00000BB8
/* 01958 809D0038 A6190222 */  sh      $t9, 0x0222($s0)           ## 00000222
/* 0195C 809D003C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01960 809D0040 2405387B */  addiu   $a1, $zero, 0x387B         ## $a1 = 0000387B
/* 01964 809D0044 0C00BE0A */  jal     Audio_PlayActorSound2
              
/* 01968 809D0048 E6080250 */  swc1    $f8, 0x0250($s0)           ## 00000250
/* 0196C 809D004C 3C05809D */  lui     $a1, %hi(func_809CE884)    ## $a1 = 809D0000
/* 01970 809D0050 24A5E884 */  addiu   $a1, $a1, %lo(func_809CE884) ## $a1 = 809CE884
/* 01974 809D0054 0C2739B8 */  jal     func_809CE6E0              
/* 01978 809D0058 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
.L809D005C:
/* 0197C 809D005C 9202022C */  lbu     $v0, 0x022C($s0)           ## 0000022C
/* 01980 809D0060 44805000 */  mtc1    $zero, $f10                ## $f10 = 0.00
/* 01984 809D0064 240900FF */  addiu   $t1, $zero, 0x00FF         ## $t1 = 000000FF
/* 01988 809D0068 284100F7 */  slti    $at, $v0, 0x00F7           
/* 0198C 809D006C 10200003 */  beq     $at, $zero, .L809D007C     
/* 01990 809D0070 24480008 */  addiu   $t0, $v0, 0x0008           ## $t0 = 00000008
/* 01994 809D0074 10000002 */  beq     $zero, $zero, .L809D0080   
/* 01998 809D0078 A208022C */  sb      $t0, 0x022C($s0)           ## 0000022C
.L809D007C:
/* 0199C 809D007C A209022C */  sb      $t1, 0x022C($s0)           ## 0000022C
.L809D0080:
/* 019A0 809D0080 9202022D */  lbu     $v0, 0x022D($s0)           ## 0000022D
/* 019A4 809D0084 28410020 */  slti    $at, $v0, 0x0020           
/* 019A8 809D0088 10200003 */  beq     $at, $zero, .L809D0098     
/* 019AC 809D008C 244AFFE0 */  addiu   $t2, $v0, 0xFFE0           ## $t2 = FFFFFFE0
/* 019B0 809D0090 10000002 */  beq     $zero, $zero, .L809D009C   
/* 019B4 809D0094 A200022D */  sb      $zero, 0x022D($s0)         ## 0000022D
.L809D0098:
/* 019B8 809D0098 A20A022D */  sb      $t2, 0x022D($s0)           ## 0000022D
.L809D009C:
/* 019BC 809D009C 9202022E */  lbu     $v0, 0x022E($s0)           ## 0000022E
/* 019C0 809D00A0 28410028 */  slti    $at, $v0, 0x0028           
/* 019C4 809D00A4 10200003 */  beq     $at, $zero, .L809D00B4     
/* 019C8 809D00A8 244BFFD8 */  addiu   $t3, $v0, 0xFFD8           ## $t3 = FFFFFFD8
/* 019CC 809D00AC 10000002 */  beq     $zero, $zero, .L809D00B8   
/* 019D0 809D00B0 A200022E */  sb      $zero, 0x022E($s0)         ## 0000022E
.L809D00B4:
/* 019D4 809D00B4 A20B022E */  sb      $t3, 0x022E($s0)           ## 0000022E
.L809D00B8:
/* 019D8 809D00B8 C60000BC */  lwc1    $f0, 0x00BC($s0)           ## 000000BC
/* 019DC 809D00BC 3C014348 */  lui     $at, 0x4348                ## $at = 43480000
/* 019E0 809D00C0 4600503C */  c.lt.s  $f10, $f0                  
/* 019E4 809D00C4 00000000 */  nop
/* 019E8 809D00C8 45020006 */  bc1fl   .L809D00E4                 
/* 019EC 809D00CC 8FBF0034 */  lw      $ra, 0x0034($sp)           
/* 019F0 809D00D0 44818000 */  mtc1    $at, $f16                  ## $f16 = 200.00
/* 019F4 809D00D4 00000000 */  nop
/* 019F8 809D00D8 46100481 */  sub.s   $f18, $f0, $f16            
/* 019FC 809D00DC E61200BC */  swc1    $f18, 0x00BC($s0)          ## 000000BC
/* 01A00 809D00E0 8FBF0034 */  lw      $ra, 0x0034($sp)           
.L809D00E4:
/* 01A04 809D00E4 8FB00030 */  lw      $s0, 0x0030($sp)           
/* 01A08 809D00E8 27BD0038 */  addiu   $sp, $sp, 0x0038           ## $sp = 00000000
/* 01A0C 809D00EC 03E00008 */  jr      $ra                        
/* 01A10 809D00F0 00000000 */  nop
