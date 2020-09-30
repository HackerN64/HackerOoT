.late_rodata
glabel D_808AFA0C
    .float 0.7

glabel D_808AFA10
    .float 0.1

.text
glabel func_808AEEFC
/* 0077C 808AEEFC 27BDFF80 */  addiu   $sp, $sp, 0xFF80           ## $sp = FFFFFF80
/* 00780 808AEF00 AFBF0054 */  sw      $ra, 0x0054($sp)           
/* 00784 808AEF04 AFB40050 */  sw      $s4, 0x0050($sp)           
/* 00788 808AEF08 AFB3004C */  sw      $s3, 0x004C($sp)           
/* 0078C 808AEF0C AFB20048 */  sw      $s2, 0x0048($sp)           
/* 00790 808AEF10 AFB10044 */  sw      $s1, 0x0044($sp)           
/* 00794 808AEF14 AFB00040 */  sw      $s0, 0x0040($sp)           
/* 00798 808AEF18 F7BA0038 */  sdc1    $f26, 0x0038($sp)          
/* 0079C 808AEF1C F7B80030 */  sdc1    $f24, 0x0030($sp)          
/* 007A0 808AEF20 F7B60028 */  sdc1    $f22, 0x0028($sp)          
/* 007A4 808AEF24 F7B40020 */  sdc1    $f20, 0x0020($sp)          
/* 007A8 808AEF28 908E0181 */  lbu     $t6, 0x0181($a0)           ## 00000181
/* 007AC 808AEF2C 00808825 */  or      $s1, $a0, $zero            ## $s1 = 00000000
/* 007B0 808AEF30 00A09025 */  or      $s2, $a1, $zero            ## $s2 = 00000000
/* 007B4 808AEF34 31CF0002 */  andi    $t7, $t6, 0x0002           ## $t7 = 00000000
/* 007B8 808AEF38 11E00068 */  beq     $t7, $zero, .L808AF0DC     
/* 007BC 808AEF3C 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 007C0 808AEF40 8C990004 */  lw      $t9, 0x0004($a0)           ## 00000004
/* 007C4 808AEF44 24180082 */  addiu   $t8, $zero, 0x0082         ## $t8 = 00000082
/* 007C8 808AEF48 A498016A */  sh      $t8, 0x016A($a0)           ## 0000016A
/* 007CC 808AEF4C 37280010 */  ori     $t0, $t9, 0x0010           ## $t0 = 00000010
/* 007D0 808AEF50 AC880004 */  sw      $t0, 0x0004($a0)           ## 00000004
/* 007D4 808AEF54 0C01DE1C */  jal     Math_Sins
              ## sins?
/* 007D8 808AEF58 84840032 */  lh      $a0, 0x0032($a0)           ## 00000032
/* 007DC 808AEF5C 46000506 */  mov.s   $f20, $f0                  
/* 007E0 808AEF60 0C01DE0D */  jal     Math_Coss
              ## coss?
/* 007E4 808AEF64 86240032 */  lh      $a0, 0x0032($s1)           ## 00000032
/* 007E8 808AEF68 3C014040 */  lui     $at, 0x4040                ## $at = 40400000
/* 007EC 808AEF6C 44811000 */  mtc1    $at, $f2                   ## $f2 = 3.00
/* 007F0 808AEF70 C6240024 */  lwc1    $f4, 0x0024($s1)           ## 00000024
/* 007F4 808AEF74 C62A002C */  lwc1    $f10, 0x002C($s1)          ## 0000002C
/* 007F8 808AEF78 46141182 */  mul.s   $f6, $f2, $f20             
/* 007FC 808AEF7C 46000586 */  mov.s   $f22, $f0                  
/* 00800 808AEF80 00008025 */  or      $s0, $zero, $zero          ## $s0 = 00000000
/* 00804 808AEF84 46001402 */  mul.s   $f16, $f2, $f0             
/* 00808 808AEF88 46062200 */  add.s   $f8, $f4, $f6              
/* 0080C 808AEF8C 46105480 */  add.s   $f18, $f10, $f16           
/* 00810 808AEF90 E6280024 */  swc1    $f8, 0x0024($s1)           ## 00000024
/* 00814 808AEF94 E632002C */  swc1    $f18, 0x002C($s1)          ## 0000002C
/* 00818 808AEF98 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
.L808AEF9C:
/* 0081C 808AEF9C 02402825 */  or      $a1, $s2, $zero            ## $a1 = 00000000
/* 00820 808AEFA0 0C22BB9B */  jal     func_808AEE6C              
/* 00824 808AEFA4 24060001 */  addiu   $a2, $zero, 0x0001         ## $a2 = 00000001
/* 00828 808AEFA8 26100001 */  addiu   $s0, $s0, 0x0001           ## $s0 = 00000001
/* 0082C 808AEFAC 2A010014 */  slti    $at, $s0, 0x0014           
/* 00830 808AEFB0 5420FFFA */  bnel    $at, $zero, .L808AEF9C     
/* 00834 808AEFB4 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00838 808AEFB8 3C0140A0 */  lui     $at, 0x40A0                ## $at = 40A00000
/* 0083C 808AEFBC 44810000 */  mtc1    $at, $f0                   ## $f0 = 5.00
/* 00840 808AEFC0 C6240024 */  lwc1    $f4, 0x0024($s1)           ## 00000024
/* 00844 808AEFC4 3C01808B */  lui     $at, %hi(D_808AFA0C)       ## $at = 808B0000
/* 00848 808AEFC8 46140182 */  mul.s   $f6, $f0, $f20             
/* 0084C 808AEFCC C43AFA0C */  lwc1    $f26, %lo(D_808AFA0C)($at) 
/* 00850 808AEFD0 3C01808B */  lui     $at, %hi(D_808AFA10)       ## $at = 808B0000
/* 00854 808AEFD4 46160482 */  mul.s   $f18, $f0, $f22            
/* 00858 808AEFD8 C438FA10 */  lwc1    $f24, %lo(D_808AFA10)($at) 
/* 0085C 808AEFDC 3C0141A0 */  lui     $at, 0x41A0                ## $at = 41A00000
/* 00860 808AEFE0 4481A000 */  mtc1    $at, $f20                  ## $f20 = 20.00
/* 00864 808AEFE4 4480B000 */  mtc1    $zero, $f22                ## $f22 = 0.00
/* 00868 808AEFE8 46062200 */  add.s   $f8, $f4, $f6              
/* 0086C 808AEFEC 00008025 */  or      $s0, $zero, $zero          ## $s0 = 00000000
/* 00870 808AEFF0 24140003 */  addiu   $s4, $zero, 0x0003         ## $s4 = 00000003
/* 00874 808AEFF4 27B30068 */  addiu   $s3, $sp, 0x0068           ## $s3 = FFFFFFE8
/* 00878 808AEFF8 E7A80068 */  swc1    $f8, 0x0068($sp)           
/* 0087C 808AEFFC C62A0028 */  lwc1    $f10, 0x0028($s1)          ## 00000028
/* 00880 808AF000 E7AA006C */  swc1    $f10, 0x006C($sp)          
/* 00884 808AF004 C630002C */  lwc1    $f16, 0x002C($s1)          ## 0000002C
/* 00888 808AF008 46128100 */  add.s   $f4, $f16, $f18            
/* 0088C 808AF00C E7A40070 */  swc1    $f4, 0x0070($sp)           
.L808AF010:
/* 00890 808AF010 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 00894 808AF014 00000000 */  nop
/* 00898 808AF018 46180182 */  mul.s   $f6, $f0, $f24             
/* 0089C 808AF01C 4406B000 */  mfc1    $a2, $f22                  
/* 008A0 808AF020 4407A000 */  mfc1    $a3, $f20                  
/* 008A4 808AF024 02402025 */  or      $a0, $s2, $zero            ## $a0 = 00000000
/* 008A8 808AF028 02602825 */  or      $a1, $s3, $zero            ## $a1 = FFFFFFE8
/* 008AC 808AF02C E7B40010 */  swc1    $f20, 0x0010($sp)          
/* 008B0 808AF030 461A3200 */  add.s   $f8, $f6, $f26             
/* 008B4 808AF034 0C00A4F9 */  jal     EffectSsBubble_Spawn              
/* 008B8 808AF038 E7A80014 */  swc1    $f8, 0x0014($sp)           
/* 008BC 808AF03C 26100001 */  addiu   $s0, $s0, 0x0001           ## $s0 = 00000001
/* 008C0 808AF040 1614FFF3 */  bne     $s0, $s4, .L808AF010       
/* 008C4 808AF044 00000000 */  nop
/* 008C8 808AF048 24090001 */  addiu   $t1, $zero, 0x0001         ## $t1 = 00000001
/* 008CC 808AF04C 240A02BC */  addiu   $t2, $zero, 0x02BC         ## $t2 = 000002BC
/* 008D0 808AF050 AFAA0014 */  sw      $t2, 0x0014($sp)           
/* 008D4 808AF054 AFA90010 */  sw      $t1, 0x0010($sp)           
/* 008D8 808AF058 02402025 */  or      $a0, $s2, $zero            ## $a0 = 00000000
/* 008DC 808AF05C 26250024 */  addiu   $a1, $s1, 0x0024           ## $a1 = 00000024
/* 008E0 808AF060 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 008E4 808AF064 0C00A527 */  jal     EffectSsGSplash_Spawn              
/* 008E8 808AF068 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 008EC 808AF06C 8E2C018C */  lw      $t4, 0x018C($s1)           ## 0000018C
/* 008F0 808AF070 240B002D */  addiu   $t3, $zero, 0x002D         ## $t3 = 0000002D
/* 008F4 808AF074 3C0D808B */  lui     $t5, %hi(func_808AF120)    ## $t5 = 808B0000
/* 008F8 808AF078 3C078013 */  lui     $a3, %hi(D_801333E0)
/* 008FC 808AF07C 25ADF120 */  addiu   $t5, $t5, %lo(func_808AF120) ## $t5 = 808AF120
/* 00900 808AF080 3C0E8013 */  lui     $t6, %hi(D_801333E8)
/* 00904 808AF084 A58B0036 */  sh      $t3, 0x0036($t4)           ## 00000036
/* 00908 808AF088 24E733E0 */  addiu   $a3, %lo(D_801333E0)
/* 0090C 808AF08C AE2D0164 */  sw      $t5, 0x0164($s1)           ## 00000164
/* 00910 808AF090 25CE33E8 */  addiu   $t6, %lo(D_801333E8)
/* 00914 808AF094 3C058013 */  lui     $a1, %hi(D_801333D4)
/* 00918 808AF098 24A533D4 */  addiu   $a1, %lo(D_801333D4)
/* 0091C 808AF09C AFAE0014 */  sw      $t6, 0x0014($sp)           
/* 00920 808AF0A0 AFA70010 */  sw      $a3, 0x0010($sp)           
/* 00924 808AF0A4 24044802 */  addiu   $a0, $zero, 0x4802         ## $a0 = 00004802
/* 00928 808AF0A8 0C03DCE3 */  jal     Audio_PlaySoundGeneral
              
/* 0092C 808AF0AC 24060004 */  addiu   $a2, $zero, 0x0004         ## $a2 = 00000004
/* 00930 808AF0B0 02402025 */  or      $a0, $s2, $zero            ## $a0 = 00000000
/* 00934 808AF0B4 0C00B2DD */  jal     Flags_SetSwitch
              
/* 00938 808AF0B8 86250168 */  lh      $a1, 0x0168($s1)           ## 00000168
/* 0093C 808AF0BC 02402025 */  or      $a0, $s2, $zero            ## $a0 = 00000000
/* 00940 808AF0C0 24051018 */  addiu   $a1, $zero, 0x1018         ## $a1 = 00001018
/* 00944 808AF0C4 240600AA */  addiu   $a2, $zero, 0x00AA         ## $a2 = 000000AA
/* 00948 808AF0C8 02203825 */  or      $a3, $s1, $zero            ## $a3 = 00000000
/* 0094C 808AF0CC 0C02003E */  jal     func_800800F8              
/* 00950 808AF0D0 AFA00010 */  sw      $zero, 0x0010($sp)         
/* 00954 808AF0D4 10000007 */  beq     $zero, $zero, .L808AF0F4   
/* 00958 808AF0D8 8FBF0054 */  lw      $ra, 0x0054($sp)           
.L808AF0DC:
/* 0095C 808AF0DC 34211E60 */  ori     $at, $at, 0x1E60           ## $at = 00001E60
/* 00960 808AF0E0 02412821 */  addu    $a1, $s2, $at              
/* 00964 808AF0E4 02402025 */  or      $a0, $s2, $zero            ## $a0 = 00000000
/* 00968 808AF0E8 0C01767D */  jal     CollisionCheck_SetAC
              ## CollisionCheck_setAC
/* 0096C 808AF0EC 26260170 */  addiu   $a2, $s1, 0x0170           ## $a2 = 00000170
/* 00970 808AF0F0 8FBF0054 */  lw      $ra, 0x0054($sp)           
.L808AF0F4:
/* 00974 808AF0F4 D7B40020 */  ldc1    $f20, 0x0020($sp)          
/* 00978 808AF0F8 D7B60028 */  ldc1    $f22, 0x0028($sp)          
/* 0097C 808AF0FC D7B80030 */  ldc1    $f24, 0x0030($sp)          
/* 00980 808AF100 D7BA0038 */  ldc1    $f26, 0x0038($sp)          
/* 00984 808AF104 8FB00040 */  lw      $s0, 0x0040($sp)           
/* 00988 808AF108 8FB10044 */  lw      $s1, 0x0044($sp)           
/* 0098C 808AF10C 8FB20048 */  lw      $s2, 0x0048($sp)           
/* 00990 808AF110 8FB3004C */  lw      $s3, 0x004C($sp)           
/* 00994 808AF114 8FB40050 */  lw      $s4, 0x0050($sp)           
/* 00998 808AF118 03E00008 */  jr      $ra                        
/* 0099C 808AF11C 27BD0080 */  addiu   $sp, $sp, 0x0080           ## $sp = 00000000
