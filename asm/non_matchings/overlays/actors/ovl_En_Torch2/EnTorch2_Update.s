.late_rodata
glabel D_80B1FA5C
 .word 0x44188000
glabel D_80B1FA60
    .float 1.2

glabel D_80B1FA64
    .float 0.6

glabel D_80B1FA68
    .float 1.2

glabel D_80B1FA6C
    .float 0.6

glabel D_80B1FA70
    .float 0.01

.text
glabel EnTorch2_Update
/* 00444 80B1DDC4 27BDFF80 */  addiu   $sp, $sp, 0xFF80           ## $sp = FFFFFF80
/* 00448 80B1DDC8 AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 0044C 80B1DDCC AFB00020 */  sw      $s0, 0x0020($sp)           
/* 00450 80B1DDD0 8CA21C44 */  lw      $v0, 0x1C44($a1)           ## 00001C44
/* 00454 80B1DDD4 848F00B6 */  lh      $t7, 0x00B6($a0)           ## 000000B6
/* 00458 80B1DDD8 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 0045C 80B1DDDC 844E00B6 */  lh      $t6, 0x00B6($v0)           ## 000000B6
/* 00460 80B1DDE0 00A03025 */  or      $a2, $a1, $zero            ## $a2 = 00000000
/* 00464 80B1DDE4 3C0180B2 */  lui     $at, %hi(sInput)       ## $at = 80B20000
/* 00468 80B1DDE8 01CF4023 */  subu    $t0, $t6, $t7              
/* 0046C 80B1DDEC 00084400 */  sll     $t0, $t0, 16               
/* 00470 80B1DDF0 00084403 */  sra     $t0, $t0, 16               
/* 00474 80B1DDF4 00A02025 */  or      $a0, $a1, $zero            ## $a0 = 00000000
/* 00478 80B1DDF8 A4200130 */  sh      $zero, %lo(sInput)($at) 
/* 0047C 80B1DDFC 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 00480 80B1DE00 A7A8005A */  sh      $t0, 0x005A($sp)           
/* 00484 80B1DE04 AFA60084 */  sw      $a2, 0x0084($sp)           
/* 00488 80B1DE08 0C030129 */  jal     Gameplay_GetCamera              
/* 0048C 80B1DE0C AFA20078 */  sw      $v0, 0x0078($sp)           
/* 00490 80B1DE10 AFA20068 */  sw      $v0, 0x0068($sp)           
/* 00494 80B1DE14 8FA40084 */  lw      $a0, 0x0084($sp)           
/* 00498 80B1DE18 0C2C76E6 */  jal     EnTorch2_GetAttackItem              
/* 0049C 80B1DE1C 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 004A0 80B1DE20 3C0380B2 */  lui     $v1, %hi(sActionState)       ## $v1 = 80B20000
/* 004A4 80B1DE24 9063015E */  lbu     $v1, %lo(sActionState)($v1)  
/* 004A8 80B1DE28 87A8005A */  lh      $t0, 0x005A($sp)           
/* 004AC 80B1DE2C AFA2005C */  sw      $v0, 0x005C($sp)           
/* 004B0 80B1DE30 1060000D */  beq     $v1, $zero, .L80B1DE68  #GOTO   
/* 004B4 80B1DE34 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 004B8 80B1DE38 10610069 */  beq     $v1, $at, .L80B1DFE0    #GOTO   
/* 004BC 80B1DE3C 24010002 */  addiu   $at, $zero, 0x0002         ## $at = 00000002
/* 004C0 80B1DE40 106103EC */  beq     $v1, $at, .L80B1EDF4     #GOTO  
/* 004C4 80B1DE44 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
/* 004C8 80B1DE48 10610358 */  beq     $v1, $at, .L80B1EBAC       #GOTO
/* 004CC 80B1DE4C 26180024 */  addiu   $t8, $s0, 0x0024           ## $t8 = 00000024
/* 004D0 80B1DE50 8FB90084 */  lw      $t9, 0x0084($sp)           
/* 004D4 80B1DE54 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 004D8 80B1DE58 AFB80034 */  sw      $t8, 0x0034($sp)           
/* 004DC 80B1DE5C 03215021 */  addu    $t2, $t9, $at              
/* 004E0 80B1DE60 100003F9 */  beq     $zero, $zero, .L80B1EE48   
/* 004E4 80B1DE64 AFAA002C */  sw      $t2, 0x002C($sp)           
.L80B1DE68:
/* 004E8 80B1DE68 8602008A */  lh      $v0, 0x008A($s0)           ## 0000008A
/* 004EC 80B1DE6C 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 004F0 80B1DE70 44803000 */  mtc1    $zero, $f6                 ## $f6 = 0.00
/* 004F4 80B1DE74 A6020032 */  sh      $v0, 0x0032($s0)           ## 00000032
/* 004F8 80B1DE78 86040032 */  lh      $a0, 0x0032($s0)           ## 00000032
/* 004FC 80B1DE7C A60200B6 */  sh      $v0, 0x00B6($s0)           ## 000000B6
/* 00500 80B1DE80 E60401CC */  swc1    $f4, 0x01CC($s0)           ## 000001CC
/* 00504 80B1DE84 0C01DE1C */  jal     Math_SinS
              ## sins?
/* 00508 80B1DE88 E60601D0 */  swc1    $f6, 0x01D0($s0)           ## 000001D0
/* 0050C 80B1DE8C 3C0141C8 */  lui     $at, 0x41C8                ## $at = 41C80000
/* 00510 80B1DE90 44814000 */  mtc1    $at, $f8                   ## $f8 = 25.00
/* 00514 80B1DE94 3C0180B2 */  lui     $at, %hi(sSpawnPoint)       ## $at = 80B20000
/* 00518 80B1DE98 C4300150 */  lwc1    $f16, %lo(sSpawnPoint)($at) 
/* 0051C 80B1DE9C 46080282 */  mul.s   $f10, $f0, $f8             
/* 00520 80B1DEA0 86040032 */  lh      $a0, 0x0032($s0)           ## 00000032
/* 00524 80B1DEA4 46105480 */  add.s   $f18, $f10, $f16           
/* 00528 80B1DEA8 0C01DE0D */  jal     Math_CosS
              ## coss?
/* 0052C 80B1DEAC E6120024 */  swc1    $f18, 0x0024($s0)          ## 00000024
/* 00530 80B1DEB0 3C0141C8 */  lui     $at, 0x41C8                ## $at = 41C80000
/* 00534 80B1DEB4 44812000 */  mtc1    $at, $f4                   ## $f4 = 25.00
/* 00538 80B1DEB8 3C0180B2 */  lui     $at, %hi(sSpawnPoint+8)       ## $at = 80B20000
/* 0053C 80B1DEBC C4280158 */  lwc1    $f8, %lo(sSpawnPoint+8)($at)  
/* 00540 80B1DEC0 46040182 */  mul.s   $f6, $f0, $f4              
/* 00544 80B1DEC4 3C0142F0 */  lui     $at, 0x42F0                ## $at = 42F00000
/* 00548 80B1DEC8 44818000 */  mtc1    $at, $f16                  ## $f16 = 120.00
/* 0054C 80B1DECC C6120090 */  lwc1    $f18, 0x0090($s0)          ## 00000090
/* 00550 80B1DED0 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 00554 80B1DED4 4610903E */  c.le.s  $f18, $f16                 
/* 00558 80B1DED8 46083280 */  add.s   $f10, $f6, $f8             
/* 0055C 80B1DEDC 45010007 */  bc1t    .L80B1DEFC                 
/* 00560 80B1DEE0 E60A002C */  swc1    $f10, 0x002C($s0)          ## 0000002C
/* 00564 80B1DEE4 0C00CEA1 */  jal     func_80033A84              
/* 00568 80B1DEE8 8FA40084 */  lw      $a0, 0x0084($sp)           
/* 0056C 80B1DEEC 14400003 */  bne     $v0, $zero, .L80B1DEFC     
/* 00570 80B1DEF0 8FAB005C */  lw      $t3, 0x005C($sp)           
/* 00574 80B1DEF4 51600034 */  beql    $t3, $zero, .L80B1DFC8     
/* 00578 80B1DEF8 8FB80084 */  lw      $t8, 0x0084($sp)           
.L80B1DEFC:
/* 0057C 80B1DEFC 8FAC005C */  lw      $t4, 0x005C($sp)           
/* 00580 80B1DF00 240D0001 */  addiu   $t5, $zero, 0x0001         ## $t5 = 00000001
/* 00584 80B1DF04 3C0180B2 */  lui     $at, %hi(sDodgeRollState)       ## $at = 80B20000
/* 00588 80B1DF08 11800029 */  beq     $t4, $zero, .L80B1DFB0     
/* 0058C 80B1DF0C 340F8000 */  ori     $t7, $zero, 0x8000         ## $t7 = 00008000
/* 00590 80B1DF10 A02D0161 */  sb      $t5, %lo(sDodgeRollState)($at)  
/* 00594 80B1DF14 860E008A */  lh      $t6, 0x008A($s0)           ## 0000008A
/* 00598 80B1DF18 3C0180B2 */  lui     $at, %hi(sStickAngle)       ## $at = 80B20000
/* 0059C 80B1DF1C 8FB80068 */  lw      $t8, 0x0068($sp)           
/* 005A0 80B1DF20 A42EF9F4 */  sh      $t6, %lo(sStickAngle)($at)  
/* 005A4 80B1DF24 3C0142FE */  lui     $at, 0x42FE                ## $at = 42FE0000
/* 005A8 80B1DF28 44812000 */  mtc1    $at, $f4                   ## $f4 = 127.00
/* 005AC 80B1DF2C 3C0180B2 */  lui     $at, %hi(sStickTilt)       ## $at = 80B20000
/* 005B0 80B1DF30 3C0A80B2 */  lui     $t2, %hi(sStickAngle)       ## $t2 = 80B20000
/* 005B4 80B1DF34 E424F9F0 */  swc1    $f4, %lo(sStickTilt)($at)  
/* 005B8 80B1DF38 3C0180B2 */  lui     $at, %hi(sInput)       ## $at = 80B20000
/* 005BC 80B1DF3C A42F0130 */  sh      $t7, %lo(sInput)($at)  
/* 005C0 80B1DF40 3C0180B2 */  lui     $at, %hi(sZTargetFlag)       ## $at = 80B20000
/* 005C4 80B1DF44 A020FA00 */  sb      $zero, %lo(sZTargetFlag)($at) 
/* 005C8 80B1DF48 854AF9F4 */  lh      $t2, %lo(sStickAngle)($t2)  
/* 005CC 80B1DF4C 8719013C */  lh      $t9, 0x013C($t8)           ## 0000013C
/* 005D0 80B1DF50 032A2023 */  subu    $a0, $t9, $t2              
/* 005D4 80B1DF54 00042400 */  sll     $a0, $a0, 16               
/* 005D8 80B1DF58 00042403 */  sra     $a0, $a0, 16               
/* 005DC 80B1DF5C 0C01DE1C */  jal     Math_SinS
              ## sins?
/* 005E0 80B1DF60 A7A40066 */  sh      $a0, 0x0066($sp)           
/* 005E4 80B1DF64 3C0180B2 */  lui     $at, %hi(sStickTilt)       ## $at = 80B20000
/* 005E8 80B1DF68 C426F9F0 */  lwc1    $f6, %lo(sStickTilt)($at)  
/* 005EC 80B1DF6C 3C0180B2 */  lui     $at, %hi(sInput+2)       ## $at = 80B20000
/* 005F0 80B1DF70 87A40066 */  lh      $a0, 0x0066($sp)           
/* 005F4 80B1DF74 46060202 */  mul.s   $f8, $f0, $f6              
/* 005F8 80B1DF78 4600428D */  trunc.w.s $f10, $f8                  
/* 005FC 80B1DF7C 440C5000 */  mfc1    $t4, $f10                  
/* 00600 80B1DF80 0C01DE0D */  jal     Math_CosS
              ## coss?
/* 00604 80B1DF84 A02C0132 */  sb      $t4, %lo(sInput+2)($at)  
/* 00608 80B1DF88 3C0180B2 */  lui     $at, %hi(sStickTilt)       ## $at = 80B20000
/* 0060C 80B1DF8C C430F9F0 */  lwc1    $f16, %lo(sStickTilt)($at) 
/* 00610 80B1DF90 3C0180B2 */  lui     $at, %hi(sInput+3)       ## $at = 80B20000
/* 00614 80B1DF94 46100482 */  mul.s   $f18, $f0, $f16            
/* 00618 80B1DF98 4600910D */  trunc.w.s $f4, $f18                  
/* 0061C 80B1DF9C 44032000 */  mfc1    $v1, $f4                   
/* 00620 80B1DFA0 00000000 */  nop
/* 00624 80B1DFA4 00031E00 */  sll     $v1, $v1, 24               
/* 00628 80B1DFA8 00031E03 */  sra     $v1, $v1, 24               
/* 0062C 80B1DFAC A0230133 */  sb      $v1, %lo(sInput+3)($at)  
.L80B1DFB0:
/* 00630 80B1DFB0 0C03D6B3 */  jal     func_800F5ACC              
/* 00634 80B1DFB4 24040038 */  addiu   $a0, $zero, 0x0038         ## $a0 = 00000038
/* 00638 80B1DFB8 240E0001 */  addiu   $t6, $zero, 0x0001         ## $t6 = 00000001
/* 0063C 80B1DFBC 3C0180B2 */  lui     $at, %hi(sActionState)       ## $at = 80B20000
/* 00640 80B1DFC0 A02E015E */  sb      $t6, %lo(sActionState)($at)  
/* 00644 80B1DFC4 8FB80084 */  lw      $t8, 0x0084($sp)           
.L80B1DFC8:
/* 00648 80B1DFC8 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 0064C 80B1DFCC 260F0024 */  addiu   $t7, $s0, 0x0024           ## $t7 = 00000024
/* 00650 80B1DFD0 0301C821 */  addu    $t9, $t8, $at              
/* 00654 80B1DFD4 AFB9002C */  sw      $t9, 0x002C($sp)           
/* 00658 80B1DFD8 1000039B */  beq     $zero, $zero, .L80B1EE48   
/* 0065C 80B1DFDC AFAF0034 */  sw      $t7, 0x0034($sp)           
.L80B1DFE0:
/* 00660 80B1DFE0 44803000 */  mtc1    $zero, $f6                 ## $f6 = 0.00
/* 00664 80B1DFE4 3C0780B2 */  lui     $a3, %hi(sStickTilt)       ## $a3 = 80B20000
/* 00668 80B1DFE8 24E7F9F0 */  addiu   $a3, $a3, %lo(sStickTilt)  ## $a3 = 80B1F9F0
/* 0066C 80B1DFEC E4E60000 */  swc1    $f6, 0x0000($a3)           ## 80B1F9F0
/* 00670 80B1DFF0 920204F5 */  lbu     $v0, 0x04F5($s0)           ## 000004F5
/* 00674 80B1DFF4 304A0080 */  andi    $t2, $v0, 0x0080           ## $t2 = 00000000
/* 00678 80B1DFF8 15400005 */  bne     $t2, $zero, .L80B1E010     
/* 0067C 80B1DFFC 304DFF7F */  andi    $t5, $v0, 0xFF7F           ## $t5 = 00000000
/* 00680 80B1E000 920B0575 */  lbu     $t3, 0x0575($s0)           ## 00000575
/* 00684 80B1E004 316C0080 */  andi    $t4, $t3, 0x0080           ## $t4 = 00000000
/* 00688 80B1E008 11800028 */  beq     $t4, $zero, .L80B1E0AC     
/* 0068C 80B1E00C 00000000 */  nop
.L80B1E010:
/* 00690 80B1E010 920E0575 */  lbu     $t6, 0x0575($s0)           ## 00000575
/* 00694 80B1E014 921804F4 */  lbu     $t8, 0x04F4($s0)           ## 000004F4
/* 00698 80B1E018 920A0574 */  lbu     $t2, 0x0574($s0)           ## 00000574
/* 0069C 80B1E01C 920C04A9 */  lbu     $t4, 0x04A9($s0)           ## 000004A9
/* 006A0 80B1E020 A20D04F5 */  sb      $t5, 0x04F5($s0)           ## 000004F5
/* 006A4 80B1E024 31CFFF7F */  andi    $t7, $t6, 0xFF7F           ## $t7 = 00000001
/* 006A8 80B1E028 A20F0575 */  sb      $t7, 0x0575($s0)           ## 00000575
/* 006AC 80B1E02C 37190004 */  ori     $t9, $t8, 0x0004           ## $t9 = 00000004
/* 006B0 80B1E030 354B0004 */  ori     $t3, $t2, 0x0004           ## $t3 = 00000004
/* 006B4 80B1E034 318DFFFD */  andi    $t5, $t4, 0xFFFD           ## $t5 = 00000000
/* 006B8 80B1E038 A21904F4 */  sb      $t9, 0x04F4($s0)           ## 000004F4
/* 006BC 80B1E03C A20B0574 */  sb      $t3, 0x0574($s0)           ## 00000574
/* 006C0 80B1E040 A20D04A9 */  sb      $t5, 0x04A9($s0)           ## 000004A9
/* 006C4 80B1E044 3C0F80B2 */  lui     $t7, %hi(sLastSwordAnim)       ## $t7 = 80B20000
/* 006C8 80B1E048 81EF0164 */  lb      $t7, %lo(sLastSwordAnim)($t7)  
/* 006CC 80B1E04C 820E0842 */  lb      $t6, 0x0842($s0)           ## 00000842
/* 006D0 80B1E050 3C1880B2 */  lui     $t8, %hi(sStaggerCount)       ## $t8 = 80B20000
/* 006D4 80B1E054 3C0B8016 */  lui     $t3, %hi(gSaveContext+0x30)
/* 006D8 80B1E058 11CF0008 */  beq     $t6, $t7, .L80B1E07C       
/* 006DC 80B1E05C 3C0C80B2 */  lui     $t4, %hi(sCounterState)       ## $t4 = 80B20000
/* 006E0 80B1E060 93180162 */  lbu     $t8, %lo(sStaggerCount)($t8)  
/* 006E4 80B1E064 3C0180B2 */  lui     $at, %hi(sStaggerCount)       ## $at = 80B20000
/* 006E8 80B1E068 27190001 */  addiu   $t9, $t8, 0x0001           ## $t9 = 80B20001
/* 006EC 80B1E06C A0390162 */  sb      $t9, %lo(sStaggerCount)($at)  
/* 006F0 80B1E070 820A0842 */  lb      $t2, 0x0842($s0)           ## 00000842
/* 006F4 80B1E074 3C0180B2 */  lui     $at, %hi(sLastSwordAnim)       ## $at = 80B20000
/* 006F8 80B1E078 A02A0164 */  sb      $t2, %lo(sLastSwordAnim)($at)  
.L80B1E07C:
/* 006FC 80B1E07C 856BE690 */  lh      $t3, %lo(gSaveContext+0x30)($t3)
/* 00700 80B1E080 29610050 */  slti    $at, $t3, 0x0050           
/* 00704 80B1E084 10200009 */  beq     $at, $zero, .L80B1E0AC     
/* 00708 80B1E088 00000000 */  nop
/* 0070C 80B1E08C 918C0160 */  lbu     $t4, %lo(sCounterState)($t4)  
/* 00710 80B1E090 3C0180B2 */  lui     $at, %hi(sCounterState)       ## $at = 80B20000
/* 00714 80B1E094 240D0032 */  addiu   $t5, $zero, 0x0032         ## $t5 = 00000032
/* 00718 80B1E098 11800004 */  beq     $t4, $zero, .L80B1E0AC     
/* 0071C 80B1E09C 00000000 */  nop
/* 00720 80B1E0A0 A0200160 */  sb      $zero, %lo(sCounterState)($at) 
/* 00724 80B1E0A4 3C0180B2 */  lui     $at, %hi(sStaggerTimer)       ## $at = 80B20000
/* 00728 80B1E0A8 A02D0163 */  sb      $t5, %lo(sStaggerTimer)($at)  
.L80B1E0AC:
/* 0072C 80B1E0AC 3C0E80B2 */  lui     $t6, %hi(sCounterState)       ## $t6 = 80B20000
/* 00730 80B1E0B0 91CE0160 */  lbu     $t6, %lo(sCounterState)($t6)  
/* 00734 80B1E0B4 51C00013 */  beql    $t6, $zero, .L80B1E104     
/* 00738 80B1E0B8 82180A78 */  lb      $t8, 0x0A78($s0)           ## 00000A78
/* 0073C 80B1E0BC 820F0843 */  lb      $t7, 0x0843($s0)           ## 00000843
/* 00740 80B1E0C0 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 00744 80B1E0C4 8FA40084 */  lw      $a0, 0x0084($sp)           
/* 00748 80B1E0C8 11E0000D */  beq     $t7, $zero, .L80B1E100     
/* 0074C 80B1E0CC 34211E60 */  ori     $at, $at, 0x1E60           ## $at = 00011E60
/* 00750 80B1E0D0 00812821 */  addu    $a1, $a0, $at              
/* 00754 80B1E0D4 AFA50038 */  sw      $a1, 0x0038($sp)           
/* 00758 80B1E0D8 260604E4 */  addiu   $a2, $s0, 0x04E4           ## $a2 = 000004E4
/* 0075C 80B1E0DC 0C01767D */  jal     CollisionCheck_SetAC
              ## CollisionCheck_setAC
/* 00760 80B1E0E0 A7A8005A */  sh      $t0, 0x005A($sp)           
/* 00764 80B1E0E4 8FA40084 */  lw      $a0, 0x0084($sp)           
/* 00768 80B1E0E8 8FA50038 */  lw      $a1, 0x0038($sp)           
/* 0076C 80B1E0EC 0C01767D */  jal     CollisionCheck_SetAC
              ## CollisionCheck_setAC
/* 00770 80B1E0F0 26060564 */  addiu   $a2, $s0, 0x0564           ## $a2 = 00000564
/* 00774 80B1E0F4 3C0780B2 */  lui     $a3, %hi(sStickTilt)       ## $a3 = 80B20000
/* 00778 80B1E0F8 24E7F9F0 */  addiu   $a3, $a3, %lo(sStickTilt)  ## $a3 = 80B1F9F0
/* 0077C 80B1E0FC 87A8005A */  lh      $t0, 0x005A($sp)           
.L80B1E100:
/* 00780 80B1E100 82180A78 */  lb      $t8, 0x0A78($s0)           ## 00000A78
.L80B1E104:
/* 00784 80B1E104 3C1980B2 */  lui     $t9, %hi(sActionState)       ## $t9 = 80B20000
/* 00788 80B1E108 3C0C80B2 */  lui     $t4, %hi(sDodgeRollState)       ## $t4 = 80B20000
/* 0078C 80B1E10C 0701000A */  bgez    $t8, .L80B1E138            
/* 00790 80B1E110 00000000 */  nop
/* 00794 80B1E114 9339015E */  lbu     $t9, %lo(sActionState)($t9)  
/* 00798 80B1E118 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
/* 0079C 80B1E11C 13210006 */  beq     $t9, $at, .L80B1E138       
/* 007A0 80B1E120 00000000 */  nop
/* 007A4 80B1E124 920204A9 */  lbu     $v0, 0x04A9($s0)           ## 000004A9
/* 007A8 80B1E128 304A0002 */  andi    $t2, $v0, 0x0002           ## $t2 = 00000000
/* 007AC 80B1E12C 11400002 */  beq     $t2, $zero, .L80B1E138     
/* 007B0 80B1E130 304BFFFD */  andi    $t3, $v0, 0xFFFD           ## $t3 = 00000000
/* 007B4 80B1E134 A20B04A9 */  sb      $t3, 0x04A9($s0)           ## 000004A9
.L80B1E138:
/* 007B8 80B1E138 918C0161 */  lbu     $t4, %lo(sDodgeRollState)($t4)  
/* 007BC 80B1E13C 3C0142FE */  lui     $at, 0x42FE                ## $at = 42FE0000
/* 007C0 80B1E140 8FAD005C */  lw      $t5, 0x005C($sp)           
/* 007C4 80B1E144 11800004 */  beq     $t4, $zero, .L80B1E158     
/* 007C8 80B1E148 00000000 */  nop
/* 007CC 80B1E14C 44814000 */  mtc1    $at, $f8                   ## $f8 = 127.00
/* 007D0 80B1E150 10000266 */  beq     $zero, $zero, .L80B1EAEC   
/* 007D4 80B1E154 E4E80000 */  swc1    $f8, 0x0000($a3)           ## 80B1F9F0
.L80B1E158:
/* 007D8 80B1E158 11A0000E */  beq     $t5, $zero, .L80B1E194     
/* 007DC 80B1E15C 3C1980B2 */  lui     $t9, %hi(sJumpslashTimer)       ## $t9 = 80B20000
/* 007E0 80B1E160 240E0001 */  addiu   $t6, $zero, 0x0001         ## $t6 = 00000001
/* 007E4 80B1E164 3C0180B2 */  lui     $at, %hi(sDodgeRollState)       ## $at = 80B20000
/* 007E8 80B1E168 A02E0161 */  sb      $t6, %lo(sDodgeRollState)($at)  
/* 007EC 80B1E16C 860F008A */  lh      $t7, 0x008A($s0)           ## 0000008A
/* 007F0 80B1E170 3C0180B2 */  lui     $at, %hi(sStickAngle)       ## $at = 80B20000
/* 007F4 80B1E174 34188000 */  ori     $t8, $zero, 0x8000         ## $t8 = 00008000
/* 007F8 80B1E178 A42FF9F4 */  sh      $t7, %lo(sStickAngle)($at)  
/* 007FC 80B1E17C 3C0142FE */  lui     $at, 0x42FE                ## $at = 42FE0000
/* 00800 80B1E180 44815000 */  mtc1    $at, $f10                  ## $f10 = 127.00
/* 00804 80B1E184 3C0180B2 */  lui     $at, %hi(sInput)       ## $at = 80B20000
/* 00808 80B1E188 E4EA0000 */  swc1    $f10, 0x0000($a3)          ## 80B1F9F0
/* 0080C 80B1E18C 10000257 */  beq     $zero, $zero, .L80B1EAEC   
/* 00810 80B1E190 A4380130 */  sh      $t8, %lo(sInput)($at)  
.L80B1E194:
/* 00814 80B1E194 9339015C */  lbu     $t9, %lo(sJumpslashTimer)($t9)  
/* 00818 80B1E198 3C0480B2 */  lui     $a0, %hi(sJumpslashFlag)       ## $a0 = 80B20000
/* 0081C 80B1E19C 8FA90078 */  lw      $t1, 0x0078($sp)           
/* 00820 80B1E1A0 1720021B */  bne     $t9, $zero, .L80B1EA10     
/* 00824 80B1E1A4 2484015D */  addiu   $a0, $a0, %lo(sJumpslashFlag)  ## $a0 = 80B2015D
/* 00828 80B1E1A8 812A0843 */  lb      $t2, 0x0843($t1)           ## 00000843
/* 0082C 80B1E1AC 3C01C040 */  lui     $at, 0xC040                ## $at = C0400000
/* 00830 80B1E1B0 55400008 */  bnel    $t2, $zero, .L80B1E1D4     
/* 00834 80B1E1B4 812B0842 */  lb      $t3, 0x0842($t1)           ## 00000842
/* 00838 80B1E1B8 44818000 */  mtc1    $at, $f16                  ## $f16 = -3.00
/* 0083C 80B1E1BC C5320060 */  lwc1    $f18, 0x0060($t1)          ## 00000060
/* 00840 80B1E1C0 4612803C */  c.lt.s  $f16, $f18                 
/* 00844 80B1E1C4 00000000 */  nop
/* 00848 80B1E1C8 45000024 */  bc1f    .L80B1E25C                 
/* 0084C 80B1E1CC 00000000 */  nop
/* 00850 80B1E1D0 812B0842 */  lb      $t3, 0x0842($t1)           ## 00000842
.L80B1E1D4:
/* 00854 80B1E1D4 24010011 */  addiu   $at, $zero, 0x0011         ## $at = 00000011
/* 00858 80B1E1D8 3C0480B2 */  lui     $a0, %hi(sJumpslashFlag)       ## $a0 = 80B20000
/* 0085C 80B1E1DC 1561001F */  bne     $t3, $at, .L80B1E25C       
/* 00860 80B1E1E0 2484015D */  addiu   $a0, $a0, %lo(sJumpslashFlag)  ## $a0 = 80B2015D
/* 00864 80B1E1E4 8603008A */  lh      $v1, 0x008A($s0)           ## 0000008A
/* 00868 80B1E1E8 3C0D0001 */  lui     $t5, 0x0001                ## $t5 = 00010000
/* 0086C 80B1E1EC 3C0680B2 */  lui     $a2, %hi(sInput)       ## $a2 = 80B20000
/* 00870 80B1E1F0 A60300B6 */  sh      $v1, 0x00B6($s0)           ## 000000B6
/* 00874 80B1E1F4 A6030032 */  sh      $v1, 0x0032($s0)           ## 00000032
/* 00878 80B1E1F8 8FAC0084 */  lw      $t4, 0x0084($sp)           
/* 0087C 80B1E1FC 3C0180B2 */  lui     $at, %hi(sStickAngle)       ## $at = 80B20000
/* 00880 80B1E200 2419000F */  addiu   $t9, $zero, 0x000F         ## $t9 = 0000000F
/* 00884 80B1E204 01AC6821 */  addu    $t5, $t5, $t4              
/* 00888 80B1E208 8DAD1DE4 */  lw      $t5, 0x1DE4($t5)           ## 00011DE4
/* 0088C 80B1E20C 246F4000 */  addiu   $t7, $v1, 0x4000           ## $t7 = 00004000
/* 00890 80B1E210 2478C000 */  addiu   $t8, $v1, 0xC000           ## $t8 = FFFFC000
/* 00894 80B1E214 31AE0001 */  andi    $t6, $t5, 0x0001           ## $t6 = 00000000
/* 00898 80B1E218 11C00004 */  beq     $t6, $zero, .L80B1E22C     
/* 0089C 80B1E21C 00000000 */  nop
/* 008A0 80B1E220 3C0180B2 */  lui     $at, %hi(sStickAngle)       ## $at = 80B20000
/* 008A4 80B1E224 10000002 */  beq     $zero, $zero, .L80B1E230   
/* 008A8 80B1E228 A42FF9F4 */  sh      $t7, %lo(sStickAngle)($at)  
.L80B1E22C:
/* 008AC 80B1E22C A438F9F4 */  sh      $t8, %lo(sStickAngle)($at)  
.L80B1E230:
/* 008B0 80B1E230 3C0142FE */  lui     $at, 0x42FE                ## $at = 42FE0000
/* 008B4 80B1E234 44812000 */  mtc1    $at, $f4                   ## $f4 = 127.00
/* 008B8 80B1E238 94C60130 */  lhu     $a2, %lo(sInput)($a2)  
/* 008BC 80B1E23C 3C0180B2 */  lui     $at, %hi(sJumpslashTimer)       ## $at = 80B20000
/* 008C0 80B1E240 E4E40000 */  swc1    $f4, 0x0000($a3)           ## 80B1F9F0
/* 008C4 80B1E244 A039015C */  sb      $t9, %lo(sJumpslashTimer)($at)  
/* 008C8 80B1E248 A0800000 */  sb      $zero, 0x0000($a0)         ## 80B2015D
/* 008CC 80B1E24C 3C0180B2 */  lui     $at, %hi(sInput)       ## $at = 80B20000
/* 008D0 80B1E250 34C68000 */  ori     $a2, $a2, 0x8000           ## $a2 = 80B28000
/* 008D4 80B1E254 100001EC */  beq     $zero, $zero, .L80B1EA08   
/* 008D8 80B1E258 A4260130 */  sh      $a2, %lo(sInput)($at)  
.L80B1E25C:
/* 008DC 80B1E25C 3C0A80B2 */  lui     $t2, %hi(sSwordJumpState)       ## $t2 = 80B20000
/* 008E0 80B1E260 914A0148 */  lbu     $t2, %lo(sSwordJumpState)($t2)  
/* 008E4 80B1E264 11400072 */  beq     $t2, $zero, .L80B1E430     
/* 008E8 80B1E268 00000000 */  nop
/* 008EC 80B1E26C 44803000 */  mtc1    $zero, $f6                 ## $f6 = 0.00
/* 008F0 80B1E270 00000000 */  nop
/* 008F4 80B1E274 E4E60000 */  swc1    $f6, 0x0000($a3)           ## 80B1F9F0
/* 008F8 80B1E278 852400B6 */  lh      $a0, 0x00B6($t1)           ## 000000B6
/* 008FC 80B1E27C 912B0692 */  lbu     $t3, 0x0692($t1)           ## 00000692
/* 00900 80B1E280 2484FC18 */  addiu   $a0, $a0, 0xFC18           ## $a0 = 80B1FD75
/* 00904 80B1E284 00042400 */  sll     $a0, $a0, 16               
/* 00908 80B1E288 356C0004 */  ori     $t4, $t3, 0x0004           ## $t4 = 00000004
/* 0090C 80B1E28C A12C0692 */  sb      $t4, 0x0692($t1)           ## 00000692
/* 00910 80B1E290 0C01DE1C */  jal     Math_SinS
              ## sins?
/* 00914 80B1E294 00042403 */  sra     $a0, $a0, 16               
/* 00918 80B1E298 3C014234 */  lui     $at, 0x4234                ## $at = 42340000
/* 0091C 80B1E29C 44814000 */  mtc1    $at, $f8                   ## $f8 = 45.00
/* 00920 80B1E2A0 8FAD0078 */  lw      $t5, 0x0078($sp)           
/* 00924 80B1E2A4 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 00928 80B1E2A8 46080282 */  mul.s   $f10, $f0, $f8             
/* 0092C 80B1E2AC C5B00024 */  lwc1    $f16, 0x0024($t5)          ## 00000024
/* 00930 80B1E2B0 26040024 */  addiu   $a0, $s0, 0x0024           ## $a0 = 00000024
/* 00934 80B1E2B4 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 00938 80B1E2B8 3C0740A0 */  lui     $a3, 0x40A0                ## $a3 = 40A00000
/* 0093C 80B1E2BC E7A40010 */  swc1    $f4, 0x0010($sp)           
/* 00940 80B1E2C0 46105480 */  add.s   $f18, $f10, $f16           
/* 00944 80B1E2C4 44059000 */  mfc1    $a1, $f18                  
/* 00948 80B1E2C8 0C01E0C4 */  jal     Math_SmoothStepToF
              
/* 0094C 80B1E2CC 00000000 */  nop
/* 00950 80B1E2D0 8FAE0078 */  lw      $t6, 0x0078($sp)           
/* 00954 80B1E2D4 85C400B6 */  lh      $a0, 0x00B6($t6)           ## 000000B6
/* 00958 80B1E2D8 2484FC18 */  addiu   $a0, $a0, 0xFC18           ## $a0 = FFFFFC18
/* 0095C 80B1E2DC 00042400 */  sll     $a0, $a0, 16               
/* 00960 80B1E2E0 0C01DE0D */  jal     Math_CosS
              ## coss?
/* 00964 80B1E2E4 00042403 */  sra     $a0, $a0, 16               
/* 00968 80B1E2E8 3C014234 */  lui     $at, 0x4234                ## $at = 42340000
/* 0096C 80B1E2EC 44813000 */  mtc1    $at, $f6                   ## $f6 = 45.00
/* 00970 80B1E2F0 8FAF0078 */  lw      $t7, 0x0078($sp)           
/* 00974 80B1E2F4 44809000 */  mtc1    $zero, $f18                ## $f18 = 0.00
/* 00978 80B1E2F8 46060202 */  mul.s   $f8, $f0, $f6              
/* 0097C 80B1E2FC C5EA002C */  lwc1    $f10, 0x002C($t7)          ## 0000002C
/* 00980 80B1E300 2604002C */  addiu   $a0, $s0, 0x002C           ## $a0 = 0000002C
/* 00984 80B1E304 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 00988 80B1E308 3C0740A0 */  lui     $a3, 0x40A0                ## $a3 = 40A00000
/* 0098C 80B1E30C E7B20010 */  swc1    $f18, 0x0010($sp)          
/* 00990 80B1E310 460A4400 */  add.s   $f16, $f8, $f10            
/* 00994 80B1E314 44058000 */  mfc1    $a1, $f16                  
/* 00998 80B1E318 0C01E0C4 */  jal     Math_SmoothStepToF
              
/* 0099C 80B1E31C 00000000 */  nop
/* 009A0 80B1E320 3C0380B2 */  lui     $v1, %hi(sSwordJumpTimer)       ## $v1 = 80B20000
/* 009A4 80B1E324 2463015F */  addiu   $v1, $v1, %lo(sSwordJumpTimer)  ## $v1 = 80B2015F
/* 009A8 80B1E328 90780000 */  lbu     $t8, 0x0000($v1)           ## 80B2015F
/* 009AC 80B1E32C 340C8000 */  ori     $t4, $zero, 0x8000         ## $t4 = 00008000
/* 009B0 80B1E330 2719FFFF */  addiu   $t9, $t8, 0xFFFF           ## $t9 = FFFFFFFF
/* 009B4 80B1E334 332200FF */  andi    $v0, $t9, 0x00FF           ## $v0 = 000000FF
/* 009B8 80B1E338 10400008 */  beq     $v0, $zero, .L80B1E35C     
/* 009BC 80B1E33C A0790000 */  sb      $t9, 0x0000($v1)           ## 80B2015F
/* 009C0 80B1E340 8FA70078 */  lw      $a3, 0x0078($sp)           
/* 009C4 80B1E344 80EA0A78 */  lb      $t2, 0x0A78($a3)           ## 00000A78
/* 009C8 80B1E348 19400020 */  blez    $t2, .L80B1E3CC            
/* 009CC 80B1E34C 00000000 */  nop
/* 009D0 80B1E350 820B0843 */  lb      $t3, 0x0843($s0)           ## 00000843
/* 009D4 80B1E354 1560001D */  bne     $t3, $zero, .L80B1E3CC     
/* 009D8 80B1E358 00000000 */  nop
.L80B1E35C:
/* 009DC 80B1E35C 8602008A */  lh      $v0, 0x008A($s0)           ## 0000008A
/* 009E0 80B1E360 8FA70078 */  lw      $a3, 0x0078($sp)           
/* 009E4 80B1E364 3C0180B2 */  lui     $at, %hi(sInput)       ## $at = 80B20000
/* 009E8 80B1E368 A6020032 */  sh      $v0, 0x0032($s0)           ## 00000032
/* 009EC 80B1E36C A60200B6 */  sh      $v0, 0x00B6($s0)           ## 000000B6
/* 009F0 80B1E370 A42C0130 */  sh      $t4, %lo(sInput)($at)  
/* 009F4 80B1E374 90ED0692 */  lbu     $t5, 0x0692($a3)           ## 00000692
/* 009F8 80B1E378 3C0142FE */  lui     $at, 0x42FE                ## $at = 42FE0000
/* 009FC 80B1E37C 44812000 */  mtc1    $at, $f4                   ## $f4 = 127.00
/* 00A00 80B1E380 31AEFFFB */  andi    $t6, $t5, 0xFFFB           ## $t6 = 00000000
/* 00A04 80B1E384 3C0180B2 */  lui     $at, %hi(sStickTilt)       ## $at = 80B20000
/* 00A08 80B1E388 A0EE0692 */  sb      $t6, 0x0692($a3)           ## 00000692
/* 00A0C 80B1E38C E424F9F0 */  swc1    $f4, %lo(sStickTilt)($at)  
/* 00A10 80B1E390 3C014040 */  lui     $at, 0x4040                ## $at = 40400000
/* 00A14 80B1E394 44813000 */  mtc1    $at, $f6                   ## $f6 = 3.00
/* 00A18 80B1E398 34018000 */  ori     $at, $zero, 0x8000         ## $at = 00008000
/* 00A1C 80B1E39C E4E601CC */  swc1    $f6, 0x01CC($a3)           ## 000001CC
/* 00A20 80B1E3A0 860F008A */  lh      $t7, 0x008A($s0)           ## 0000008A
/* 00A24 80B1E3A4 01E1C021 */  addu    $t8, $t7, $at              
/* 00A28 80B1E3A8 3C0180B2 */  lui     $at, %hi(sStickAngle)       ## $at = 80B20000
/* 00A2C 80B1E3AC A438F9F4 */  sh      $t8, %lo(sStickAngle)($at)  
/* 00A30 80B1E3B0 3C0180B2 */  lui     $at, %hi(sSwordJumpState)       ## $at = 80B20000
/* 00A34 80B1E3B4 A0200148 */  sb      $zero, %lo(sSwordJumpState)($at) 
/* 00A38 80B1E3B8 A0600000 */  sb      $zero, 0x0000($v1)         ## 80B2015F
/* 00A3C 80B1E3BC 8E190004 */  lw      $t9, 0x0004($s0)           ## 00000004
/* 00A40 80B1E3C0 372A0001 */  ori     $t2, $t9, 0x0001           ## $t2 = FFFFFFFF
/* 00A44 80B1E3C4 10000190 */  beq     $zero, $zero, .L80B1EA08   
/* 00A48 80B1E3C8 AE0A0004 */  sw      $t2, 0x0004($s0)           ## 00000004
.L80B1E3CC:
/* 00A4C 80B1E3CC 3C0B80B2 */  lui     $t3, %hi(sSwordJumpState)       ## $t3 = 80B20000
/* 00A50 80B1E3D0 916B0148 */  lbu     $t3, %lo(sSwordJumpState)($t3)  
/* 00A54 80B1E3D4 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 00A58 80B1E3D8 1561018B */  bne     $t3, $at, .L80B1EA08       
/* 00A5C 80B1E3DC 28410010 */  slti    $at, $v0, 0x0010           
/* 00A60 80B1E3E0 1020000C */  beq     $at, $zero, .L80B1E414     
/* 00A64 80B1E3E4 00401825 */  or      $v1, $v0, $zero            ## $v1 = 000000FF
/* 00A68 80B1E3E8 3C0580B2 */  lui     $a1, %hi(sInput)       ## $a1 = 80B20000
/* 00A6C 80B1E3EC 24A50130 */  addiu   $a1, $a1, %lo(sInput)  ## $a1 = 80B20130
/* 00A70 80B1E3F0 8FA40084 */  lw      $a0, 0x0084($sp)           
/* 00A74 80B1E3F4 0C2C76F6 */  jal     EnTorch2_SwingSword              
/* 00A78 80B1E3F8 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 00A7C 80B1E3FC 3C0C80B2 */  lui     $t4, %hi(sSwordJumpState)       ## $t4 = 80B20000
/* 00A80 80B1E400 918C0148 */  lbu     $t4, %lo(sSwordJumpState)($t4)  
/* 00A84 80B1E404 3C0180B2 */  lui     $at, %hi(sSwordJumpState)       ## $at = 80B20000
/* 00A88 80B1E408 258D0001 */  addiu   $t5, $t4, 0x0001           ## $t5 = 80B20001
/* 00A8C 80B1E40C 1000017E */  beq     $zero, $zero, .L80B1EA08   
/* 00A90 80B1E410 A02D0148 */  sb      $t5, %lo(sSwordJumpState)($at)  
.L80B1E414:
/* 00A94 80B1E414 24010013 */  addiu   $at, $zero, 0x0013         ## $at = 00000013
/* 00A98 80B1E418 1461017B */  bne     $v1, $at, .L80B1EA08       
/* 00A9C 80B1E41C 260400E4 */  addiu   $a0, $s0, 0x00E4           ## $a0 = 000000E4
/* 00AA0 80B1E420 0C03D064 */  jal     func_800F4190              
/* 00AA4 80B1E424 24056814 */  addiu   $a1, $zero, 0x6814         ## $a1 = 00006814
/* 00AA8 80B1E428 10000177 */  beq     $zero, $zero, .L80B1EA08   
/* 00AAC 80B1E42C 00000000 */  nop
.L80B1E430:
/* 00AB0 80B1E430 3C0380B2 */  lui     $v1, %hi(sHoldShieldTimer)       ## $v1 = 80B20000
/* 00AB4 80B1E434 2463F9FC */  addiu   $v1, $v1, %lo(sHoldShieldTimer)  ## $v1 = 80B1F9FC
/* 00AB8 80B1E438 8C620000 */  lw      $v0, 0x0000($v1)           ## 80B1F9FC
/* 00ABC 80B1E43C 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 00AC0 80B1E440 24077FFF */  addiu   $a3, $zero, 0x7FFF         ## $a3 = 00007FFF
/* 00AC4 80B1E444 10400006 */  beq     $v0, $zero, .L80B1E460     
/* 00AC8 80B1E448 240F7FFF */  addiu   $t7, $zero, 0x7FFF         ## $t7 = 00007FFF
/* 00ACC 80B1E44C 244EFFFF */  addiu   $t6, $v0, 0xFFFF           ## $t6 = FFFFFFFF
/* 00AD0 80B1E450 AC6E0000 */  sw      $t6, 0x0000($v1)           ## 80B1F9FC
/* 00AD4 80B1E454 24060010 */  addiu   $a2, $zero, 0x0010         ## $a2 = 00000010
/* 00AD8 80B1E458 3C0180B2 */  lui     $at, %hi(sInput)       ## $at = 80B20000
/* 00ADC 80B1E45C A4260130 */  sh      $a2, %lo(sInput)($at)  
.L80B1E460:
/* 00AE0 80B1E460 AFAF0010 */  sw      $t7, 0x0010($sp)           
/* 00AE4 80B1E464 86180032 */  lh      $t8, 0x0032($s0)           ## 00000032
/* 00AE8 80B1E468 A7A8005A */  sh      $t0, 0x005A($sp)           
/* 00AEC 80B1E46C 8FA40084 */  lw      $a0, 0x0084($sp)           
/* 00AF0 80B1E470 3C0642F0 */  lui     $a2, 0x42F0                ## $a2 = 42F00000
/* 00AF4 80B1E474 0C00D52D */  jal     func_800354B4              
/* 00AF8 80B1E478 AFB80014 */  sw      $t8, 0x0014($sp)           
/* 00AFC 80B1E47C 1040009B */  beq     $v0, $zero, .L80B1E6EC     
/* 00B00 80B1E480 87A8005A */  lh      $t0, 0x005A($sp)           
/* 00B04 80B1E484 8FA70078 */  lw      $a3, 0x0078($sp)           
/* 00B08 80B1E488 2403000C */  addiu   $v1, $zero, 0x000C         ## $v1 = 0000000C
/* 00B0C 80B1E48C 3C0142B4 */  lui     $at, 0x42B4                ## $at = 42B40000
/* 00B10 80B1E490 80E20842 */  lb      $v0, 0x0842($a3)           ## 00000842
/* 00B14 80B1E494 24184000 */  addiu   $t8, $zero, 0x4000         ## $t8 = 00004000
/* 00B18 80B1E498 5462004F */  bnel    $v1, $v0, .L80B1E5D8       
/* 00B1C 80B1E49C 860D008A */  lh      $t5, 0x008A($s0)           ## 0000008A
/* 00B20 80B1E4A0 C6000090 */  lwc1    $f0, 0x0090($s0)           ## 00000090
/* 00B24 80B1E4A4 44814000 */  mtc1    $at, $f8                   ## $f8 = 90.00
/* 00B28 80B1E4A8 00000000 */  nop
/* 00B2C 80B1E4AC 4608003C */  c.lt.s  $f0, $f8                   
/* 00B30 80B1E4B0 00000000 */  nop
/* 00B34 80B1E4B4 45020048 */  bc1fl   .L80B1E5D8                 
/* 00B38 80B1E4B8 860D008A */  lh      $t5, 0x008A($s0)           ## 0000008A
/* 00B3C 80B1E4BC 82190843 */  lb      $t9, 0x0843($s0)           ## 00000843
/* 00B40 80B1E4C0 3C0A80B2 */  lui     $t2, %hi(sCounterState)       ## $t2 = 80B20000
/* 00B44 80B1E4C4 1720003C */  bne     $t9, $zero, .L80B1E5B8     
/* 00B48 80B1E4C8 00000000 */  nop
/* 00B4C 80B1E4CC 914A0160 */  lbu     $t2, %lo(sCounterState)($t2)  
/* 00B50 80B1E4D0 15400039 */  bne     $t2, $zero, .L80B1E5B8     
/* 00B54 80B1E4D4 00000000 */  nop
/* 00B58 80B1E4D8 80EB0A78 */  lb      $t3, 0x0A78($a3)           ## 00000A78
/* 00B5C 80B1E4DC 15600036 */  bne     $t3, $zero, .L80B1E5B8     
/* 00B60 80B1E4E0 00000000 */  nop
/* 00B64 80B1E4E4 14620034 */  bne     $v1, $v0, .L80B1E5B8       
/* 00B68 80B1E4E8 3C0142AA */  lui     $at, 0x42AA                ## $at = 42AA0000
/* 00B6C 80B1E4EC 44815000 */  mtc1    $at, $f10                  ## $f10 = 85.00
/* 00B70 80B1E4F0 8FA40084 */  lw      $a0, 0x0084($sp)           
/* 00B74 80B1E4F4 460A003E */  c.le.s  $f0, $f10                  
/* 00B78 80B1E4F8 00000000 */  nop
/* 00B7C 80B1E4FC 4500002E */  bc1f    .L80B1E5B8                 
/* 00B80 80B1E500 00000000 */  nop
/* 00B84 80B1E504 0C00CEA1 */  jal     func_80033A84              
/* 00B88 80B1E508 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 00B8C 80B1E50C 1040002A */  beq     $v0, $zero, .L80B1E5B8     
/* 00B90 80B1E510 3C0380B2 */  lui     $v1, %hi(sSwordJumpTimer)       ## $v1 = 80B20000
/* 00B94 80B1E514 44808000 */  mtc1    $zero, $f16                ## $f16 = 0.00
/* 00B98 80B1E518 3C0180B2 */  lui     $at, %hi(sStickTilt)       ## $at = 80B20000
/* 00B9C 80B1E51C 8FAD0078 */  lw      $t5, 0x0078($sp)           
/* 00BA0 80B1E520 E430F9F0 */  swc1    $f16, %lo(sStickTilt)($at) 
/* 00BA4 80B1E524 3C0180B2 */  lui     $at, %hi(sSwordJumpState)       ## $at = 80B20000
/* 00BA8 80B1E528 240C0001 */  addiu   $t4, $zero, 0x0001         ## $t4 = 00000001
/* 00BAC 80B1E52C A02C0148 */  sb      $t4, %lo(sSwordJumpState)($at)  
/* 00BB0 80B1E530 91AE0692 */  lbu     $t6, 0x0692($t5)           ## 00000692
/* 00BB4 80B1E534 2401FFFE */  addiu   $at, $zero, 0xFFFE         ## $at = FFFFFFFE
/* 00BB8 80B1E538 2463015F */  addiu   $v1, $v1, %lo(sSwordJumpTimer)  ## $v1 = 80B2015F
/* 00BBC 80B1E53C 35CF0004 */  ori     $t7, $t6, 0x0004           ## $t7 = 00000004
/* 00BC0 80B1E540 A1AF0692 */  sb      $t7, 0x0692($t5)           ## 00000692
/* 00BC4 80B1E544 8E180004 */  lw      $t8, 0x0004($s0)           ## 00000004
/* 00BC8 80B1E548 240A001B */  addiu   $t2, $zero, 0x001B         ## $t2 = 0000001B
/* 00BCC 80B1E54C 44809000 */  mtc1    $zero, $f18                ## $f18 = 0.00
/* 00BD0 80B1E550 0301C824 */  and     $t9, $t8, $at              
/* 00BD4 80B1E554 AE190004 */  sw      $t9, 0x0004($s0)           ## 00000004
/* 00BD8 80B1E558 8FAB0078 */  lw      $t3, 0x0078($sp)           
/* 00BDC 80B1E55C A06A0000 */  sb      $t2, 0x0000($v1)           ## 80B2015F
/* 00BE0 80B1E560 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 00BE4 80B1E564 A1600843 */  sb      $zero, 0x0843($t3)         ## 00000843
/* 00BE8 80B1E568 8FAC0078 */  lw      $t4, 0x0078($sp)           
/* 00BEC 80B1E56C 240EFFF9 */  addiu   $t6, $zero, 0xFFF9         ## $t6 = FFFFFFF9
/* 00BF0 80B1E570 3C014000 */  lui     $at, 0x4000                ## $at = 40000000
/* 00BF4 80B1E574 E5920838 */  swc1    $f18, 0x0838($t4)          ## 00000839
/* 00BF8 80B1E578 A20E0A78 */  sb      $t6, 0x0A78($s0)           ## 00000A78
/* 00BFC 80B1E57C E6040838 */  swc1    $f4, 0x0838($s0)           ## 00000838
/* 00C00 80B1E580 8FAF0078 */  lw      $t7, 0x0078($sp)           
/* 00C04 80B1E584 44813000 */  mtc1    $at, $f6                   ## $f6 = 2.00
/* 00C08 80B1E588 00000000 */  nop
/* 00C0C 80B1E58C E5E601CC */  swc1    $f6, 0x01CC($t7)           ## 000001D0
/* 00C10 80B1E590 8FA50078 */  lw      $a1, 0x0078($sp)           
/* 00C14 80B1E594 8FA40084 */  lw      $a0, 0x0084($sp)           
/* 00C18 80B1E598 0C028EF0 */  jal     LinkAnimation_Update              
/* 00C1C 80B1E59C 24A501B4 */  addiu   $a1, $a1, 0x01B4           ## $a1 = 000001B4
/* 00C20 80B1E5A0 3C0180B2 */  lui     $at, %hi(sHoldShieldTimer)       ## $at = 80B20000
/* 00C24 80B1E5A4 AC20F9FC */  sw      $zero, %lo(sHoldShieldTimer)($at) 
/* 00C28 80B1E5A8 3C0180B2 */  lui     $at, %hi(sInput)       ## $at = 80B20000
/* 00C2C 80B1E5AC 34068000 */  ori     $a2, $zero, 0x8000         ## $a2 = 00008000
/* 00C30 80B1E5B0 10000006 */  beq     $zero, $zero, .L80B1E5CC   
/* 00C34 80B1E5B4 A4260130 */  sh      $a2, %lo(sInput)($at)  
.L80B1E5B8:
/* 00C38 80B1E5B8 3C0580B2 */  lui     $a1, %hi(sInput)       ## $a1 = 80B20000
/* 00C3C 80B1E5BC 24A50130 */  addiu   $a1, $a1, %lo(sInput)  ## $a1 = 80B20130
/* 00C40 80B1E5C0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00C44 80B1E5C4 0C2C775C */  jal     EnTorch2_Backflip              
/* 00C48 80B1E5C8 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
.L80B1E5CC:
/* 00C4C 80B1E5CC 1000010E */  beq     $zero, $zero, .L80B1EA08   
/* 00C50 80B1E5D0 00000000 */  nop
/* 00C54 80B1E5D4 860D008A */  lh      $t5, 0x008A($s0)           ## 0000008A
.L80B1E5D8:
/* 00C58 80B1E5D8 3C0380B2 */  lui     $v1, %hi(sStickAngle)       ## $v1 = 80B20000
/* 00C5C 80B1E5DC 2463F9F4 */  addiu   $v1, $v1, %lo(sStickAngle)  ## $v1 = 80B1F9F4
/* 00C60 80B1E5E0 3C0180B2 */  lui     $at, %hi(sInput)       ## $at = 80B20000
/* 00C64 80B1E5E4 A46D0000 */  sh      $t5, 0x0000($v1)           ## 80B1F9F4
/* 00C68 80B1E5E8 A4380130 */  sh      $t8, %lo(sInput)($at)  
/* 00C6C 80B1E5EC 80E20842 */  lb      $v0, 0x0842($a3)           ## 00000842
/* 00C70 80B1E5F0 28410004 */  slti    $at, $v0, 0x0004           
/* 00C74 80B1E5F4 50200006 */  beql    $at, $zero, .L80B1E610     
/* 00C78 80B1E5F8 28410008 */  slti    $at, $v0, 0x0008           
/* 00C7C 80B1E5FC 44804000 */  mtc1    $zero, $f8                 ## $f8 = 0.00
/* 00C80 80B1E600 3C0180B2 */  lui     $at, %hi(sStickTilt)       ## $at = 80B20000
/* 00C84 80B1E604 1000002A */  beq     $zero, $zero, .L80B1E6B0   
/* 00C88 80B1E608 E428F9F0 */  swc1    $f8, %lo(sStickTilt)($at)  
/* 00C8C 80B1E60C 28410008 */  slti    $at, $v0, 0x0008           
.L80B1E610:
/* 00C90 80B1E610 10200008 */  beq     $at, $zero, .L80B1E634     
/* 00C94 80B1E614 3C0142FE */  lui     $at, 0x42FE                ## $at = 42FE0000
/* 00C98 80B1E618 44815000 */  mtc1    $at, $f10                  ## $f10 = 127.00
/* 00C9C 80B1E61C 3C0180B2 */  lui     $at, %hi(sStickTilt)       ## $at = 80B20000
/* 00CA0 80B1E620 E42AF9F0 */  swc1    $f10, %lo(sStickTilt)($at) 
/* 00CA4 80B1E624 84790000 */  lh      $t9, 0x0000($v1)           ## 80B1F9F4
/* 00CA8 80B1E628 272A4000 */  addiu   $t2, $t9, 0x4000           ## $t2 = 00004000
/* 00CAC 80B1E62C 10000020 */  beq     $zero, $zero, .L80B1E6B0   
/* 00CB0 80B1E630 A46A0000 */  sh      $t2, 0x0000($v1)           ## 80B1F9F4
.L80B1E634:
/* 00CB4 80B1E634 2841000C */  slti    $at, $v0, 0x000C           
/* 00CB8 80B1E638 10200008 */  beq     $at, $zero, .L80B1E65C     
/* 00CBC 80B1E63C 3C0142FE */  lui     $at, 0x42FE                ## $at = 42FE0000
/* 00CC0 80B1E640 44818000 */  mtc1    $at, $f16                  ## $f16 = 127.00
/* 00CC4 80B1E644 3C0180B2 */  lui     $at, %hi(sStickTilt)       ## $at = 80B20000
/* 00CC8 80B1E648 E430F9F0 */  swc1    $f16, %lo(sStickTilt)($at) 
/* 00CCC 80B1E64C 846B0000 */  lh      $t3, 0x0000($v1)           ## 80B1F9F4
/* 00CD0 80B1E650 256CC000 */  addiu   $t4, $t3, 0xC000           ## $t4 = FFFFC000
/* 00CD4 80B1E654 10000016 */  beq     $zero, $zero, .L80B1E6B0   
/* 00CD8 80B1E658 A46C0000 */  sh      $t4, 0x0000($v1)           ## 80B1F9F4
.L80B1E65C:
/* 00CDC 80B1E65C 28410018 */  slti    $at, $v0, 0x0018           
/* 00CE0 80B1E660 10200004 */  beq     $at, $zero, .L80B1E674     
/* 00CE4 80B1E664 24060010 */  addiu   $a2, $zero, 0x0010         ## $a2 = 00000010
/* 00CE8 80B1E668 3C0180B2 */  lui     $at, %hi(sInput)       ## $at = 80B20000
/* 00CEC 80B1E66C 10000010 */  beq     $zero, $zero, .L80B1E6B0   
/* 00CF0 80B1E670 A4260130 */  sh      $a2, %lo(sInput)($at)  
.L80B1E674:
/* 00CF4 80B1E674 2841001C */  slti    $at, $v0, 0x001C           
/* 00CF8 80B1E678 10200008 */  beq     $at, $zero, .L80B1E69C     
/* 00CFC 80B1E67C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00D00 80B1E680 3C0580B2 */  lui     $a1, %hi(sInput)       ## $a1 = 80B20000
/* 00D04 80B1E684 24A50130 */  addiu   $a1, $a1, %lo(sInput)  ## $a1 = 80B20130
/* 00D08 80B1E688 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00D0C 80B1E68C 0C2C775C */  jal     EnTorch2_Backflip              
/* 00D10 80B1E690 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 00D14 80B1E694 10000006 */  beq     $zero, $zero, .L80B1E6B0   
/* 00D18 80B1E698 8FA70078 */  lw      $a3, 0x0078($sp)           
.L80B1E69C:
/* 00D1C 80B1E69C 3C0580B2 */  lui     $a1, %hi(sInput)       ## $a1 = 80B20000
/* 00D20 80B1E6A0 24A50130 */  addiu   $a1, $a1, %lo(sInput)  ## $a1 = 80B20130
/* 00D24 80B1E6A4 0C2C775C */  jal     EnTorch2_Backflip              
/* 00D28 80B1E6A8 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 00D2C 80B1E6AC 8FA70078 */  lw      $a3, 0x0078($sp)           
.L80B1E6B0:
/* 00D30 80B1E6B0 3C0680B2 */  lui     $a2, %hi(sInput)       ## $a2 = 80B20000
/* 00D34 80B1E6B4 94C60130 */  lhu     $a2, %lo(sInput)($a2)  
/* 00D38 80B1E6B8 30CE8010 */  andi    $t6, $a2, 0x8010           ## $t6 = 00000000
/* 00D3C 80B1E6BC 15C000D2 */  bne     $t6, $zero, .L80B1EA08     
/* 00D40 80B1E6C0 00000000 */  nop
/* 00D44 80B1E6C4 820F0843 */  lb      $t7, 0x0843($s0)           ## 00000843
/* 00D48 80B1E6C8 15E000CF */  bne     $t7, $zero, .L80B1EA08     
/* 00D4C 80B1E6CC 00000000 */  nop
/* 00D50 80B1E6D0 80ED0843 */  lb      $t5, 0x0843($a3)           ## 00000843
/* 00D54 80B1E6D4 24180001 */  addiu   $t8, $zero, 0x0001         ## $t8 = 00000001
/* 00D58 80B1E6D8 3C0180B2 */  lui     $at, %hi(sCounterState)       ## $at = 80B20000
/* 00D5C 80B1E6DC 11A000CA */  beq     $t5, $zero, .L80B1EA08     
/* 00D60 80B1E6E0 00000000 */  nop
/* 00D64 80B1E6E4 100000C8 */  beq     $zero, $zero, .L80B1EA08   
/* 00D68 80B1E6E8 A0380160 */  sb      $t8, %lo(sCounterState)($at)  
.L80B1E6EC:
/* 00D6C 80B1E6EC 8619008A */  lh      $t9, 0x008A($s0)           ## 0000008A
/* 00D70 80B1E6F0 3C0180B2 */  lui     $at, %hi(sStickAngle)       ## $at = 80B20000
/* 00D74 80B1E6F4 A439F9F4 */  sh      $t9, %lo(sStickAngle)($at)  
/* 00D78 80B1E6F8 3C0142B4 */  lui     $at, 0x42B4                ## $at = 42B40000
/* 00D7C 80B1E6FC 44819000 */  mtc1    $at, $f18                  ## $f18 = 90.00
/* 00D80 80B1E700 C6000090 */  lwc1    $f0, 0x0090($s0)           ## 00000090
/* 00D84 80B1E704 3C01428C */  lui     $at, 0x428C                ## $at = 428C0000
/* 00D88 80B1E708 4612003E */  c.le.s  $f0, $f18                  
/* 00D8C 80B1E70C 00000000 */  nop
/* 00D90 80B1E710 4502001C */  bc1fl   .L80B1E784                 
/* 00D94 80B1E714 3C01428C */  lui     $at, 0x428C                ## $at = 428C0000
/* 00D98 80B1E718 44812000 */  mtc1    $at, $f4                   ## $f4 = 70.00
/* 00D9C 80B1E71C 00000000 */  nop
/* 00DA0 80B1E720 4600203C */  c.lt.s  $f4, $f0                   
/* 00DA4 80B1E724 00000000 */  nop
/* 00DA8 80B1E728 45020016 */  bc1fl   .L80B1E784                 
/* 00DAC 80B1E72C 3C01428C */  lui     $at, 0x428C                ## $at = 428C0000
/* 00DB0 80B1E730 05000003 */  bltz    $t0, .L80B1E740            
/* 00DB4 80B1E734 00081823 */  subu    $v1, $zero, $t0            
/* 00DB8 80B1E738 10000001 */  beq     $zero, $zero, .L80B1E740   
/* 00DBC 80B1E73C 01001825 */  or      $v1, $t0, $zero            ## $v1 = 00000000
.L80B1E740:
/* 00DC0 80B1E740 28617800 */  slti    $at, $v1, 0x7800           
/* 00DC4 80B1E744 5420000F */  bnel    $at, $zero, .L80B1E784     
/* 00DC8 80B1E748 3C01428C */  lui     $at, 0x428C                ## $at = 428C0000
/* 00DCC 80B1E74C 920A010C */  lbu     $t2, 0x010C($s0)           ## 0000010C
/* 00DD0 80B1E750 8FAB0078 */  lw      $t3, 0x0078($sp)           
/* 00DD4 80B1E754 8FA40084 */  lw      $a0, 0x0084($sp)           
/* 00DD8 80B1E758 15400004 */  bne     $t2, $zero, .L80B1E76C     
/* 00DDC 80B1E75C 3C0580B2 */  lui     $a1, %hi(sInput)       ## $a1 = 80B20000
/* 00DE0 80B1E760 8D6C067C */  lw      $t4, 0x067C($t3)           ## 0000067C
/* 00DE4 80B1E764 000C7240 */  sll     $t6, $t4,  9               
/* 00DE8 80B1E768 05C00005 */  bltz    $t6, .L80B1E780           
.L80B1E76C:
/* 00DEC 80B1E76C 24A50130 */  addiu   $a1, $a1, %lo(sInput)  ## $a1 = 80B20130
/* 00DF0 80B1E770 0C2C76F6 */  jal     EnTorch2_SwingSword              
/* 00DF4 80B1E774 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 00DF8 80B1E778 100000A3 */  beq     $zero, $zero, .L80B1EA08   
/* 00DFC 80B1E77C 00000000 */  nop
.L80B1E780:
/* 00E00 80B1E780 3C01428C */  lui     $at, 0x428C                ## $at = 428C0000
.L80B1E784:
/* 00E04 80B1E784 44813000 */  mtc1    $at, $f6                   ## $f6 = 70.00
/* 00E08 80B1E788 3C0142A0 */  lui     $at, 0x42A0                ## $at = 42A00000
/* 00E0C 80B1E78C 4606003E */  c.le.s  $f0, $f6                   
/* 00E10 80B1E790 00000000 */  nop
/* 00E14 80B1E794 4503000D */  bc1tl   .L80B1E7CC                 
/* 00E18 80B1E798 82180843 */  lb      $t8, 0x0843($s0)           ## 00000843
/* 00E1C 80B1E79C 44814000 */  mtc1    $at, $f8                   ## $f8 = 80.00
/* 00E20 80B1E7A0 44805000 */  mtc1    $zero, $f10                ## $f10 = 0.00
/* 00E24 80B1E7A4 8FAF0078 */  lw      $t7, 0x0078($sp)           
/* 00E28 80B1E7A8 460A4400 */  add.s   $f16, $f8, $f10            
/* 00E2C 80B1E7AC 4610003E */  c.le.s  $f0, $f16                  
/* 00E30 80B1E7B0 00000000 */  nop
/* 00E34 80B1E7B4 4502001B */  bc1fl   .L80B1E824                 
/* 00E38 80B1E7B8 3C014248 */  lui     $at, 0x4248                ## $at = 42480000
/* 00E3C 80B1E7BC 81ED0843 */  lb      $t5, 0x0843($t7)           ## 00000843
/* 00E40 80B1E7C0 51A00018 */  beql    $t5, $zero, .L80B1E824     
/* 00E44 80B1E7C4 3C014248 */  lui     $at, 0x4248                ## $at = 42480000
/* 00E48 80B1E7C8 82180843 */  lb      $t8, 0x0843($s0)           ## 00000843
.L80B1E7CC:
/* 00E4C 80B1E7CC 3C0580B2 */  lui     $a1, %hi(sInput)       ## $a1 = 80B20000
/* 00E50 80B1E7D0 24A50130 */  addiu   $a1, $a1, %lo(sInput)  ## $a1 = 80B20130
/* 00E54 80B1E7D4 17000012 */  bne     $t8, $zero, .L80B1E820     
/* 00E58 80B1E7D8 8FA40084 */  lw      $a0, 0x0084($sp)           
/* 00E5C 80B1E7DC 0C2C76F6 */  jal     EnTorch2_SwingSword              
/* 00E60 80B1E7E0 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 00E64 80B1E7E4 14400088 */  bne     $v0, $zero, .L80B1EA08     
/* 00E68 80B1E7E8 00000000 */  nop
/* 00E6C 80B1E7EC 82190843 */  lb      $t9, 0x0843($s0)           ## 00000843
/* 00E70 80B1E7F0 3C0A80B2 */  lui     $t2, %hi(sCounterState)       ## $t2 = 80B20000
/* 00E74 80B1E7F4 17200084 */  bne     $t9, $zero, .L80B1EA08     
/* 00E78 80B1E7F8 00000000 */  nop
/* 00E7C 80B1E7FC 914A0160 */  lbu     $t2, %lo(sCounterState)($t2)  
/* 00E80 80B1E800 3C0580B2 */  lui     $a1, %hi(sInput)       ## $a1 = 80B20000
/* 00E84 80B1E804 24A50130 */  addiu   $a1, $a1, %lo(sInput)  ## $a1 = 80B20130
/* 00E88 80B1E808 1540007F */  bne     $t2, $zero, .L80B1EA08     
/* 00E8C 80B1E80C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00E90 80B1E810 0C2C775C */  jal     EnTorch2_Backflip              
/* 00E94 80B1E814 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 00E98 80B1E818 1000007B */  beq     $zero, $zero, .L80B1EA08   
/* 00E9C 80B1E81C 00000000 */  nop
.L80B1E820:
/* 00EA0 80B1E820 3C014248 */  lui     $at, 0x4248                ## $at = 42480000
.L80B1E824:
/* 00EA4 80B1E824 44819000 */  mtc1    $at, $f18                  ## $f18 = 50.00
/* 00EA8 80B1E828 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 00EAC 80B1E82C 3C0142C8 */  lui     $at, 0x42C8                ## $at = 42C80000
/* 00EB0 80B1E830 46049180 */  add.s   $f6, $f18, $f4             
/* 00EB4 80B1E834 4606003E */  c.le.s  $f0, $f6                   
/* 00EB8 80B1E838 00000000 */  nop
/* 00EBC 80B1E83C 45020019 */  bc1fl   .L80B1E8A4                 
/* 00EC0 80B1E840 44815000 */  mtc1    $at, $f10                  ## $f10 = 100.00
/* 00EC4 80B1E844 3C0142FE */  lui     $at, 0x42FE                ## $at = 42FE0000
/* 00EC8 80B1E848 44814000 */  mtc1    $at, $f8                   ## $f8 = 127.00
/* 00ECC 80B1E84C 3C0180B2 */  lui     $at, %hi(sStickTilt)       ## $at = 80B20000
/* 00ED0 80B1E850 3C0480B2 */  lui     $a0, %hi(sStickAngle)       ## $a0 = 80B20000
/* 00ED4 80B1E854 E428F9F0 */  swc1    $f8, %lo(sStickTilt)($at)  
/* 00ED8 80B1E858 860B008A */  lh      $t3, 0x008A($s0)           ## 0000008A
/* 00EDC 80B1E85C 3C0180B2 */  lui     $at, %hi(sStickAngle)       ## $at = 80B20000
/* 00EE0 80B1E860 8FAE0078 */  lw      $t6, 0x0078($sp)           
/* 00EE4 80B1E864 A42BF9F4 */  sh      $t3, %lo(sStickAngle)($at)  
/* 00EE8 80B1E868 920C010C */  lbu     $t4, 0x010C($s0)           ## 0000010C
/* 00EEC 80B1E86C 24060001 */  addiu   $a2, $zero, 0x0001         ## $a2 = 00000001
/* 00EF0 80B1E870 24072328 */  addiu   $a3, $zero, 0x2328         ## $a3 = 00002328
/* 00EF4 80B1E874 15800064 */  bne     $t4, $zero, .L80B1EA08     
/* 00EF8 80B1E878 00000000 */  nop
/* 00EFC 80B1E87C 85C500B6 */  lh      $a1, 0x00B6($t6)           ## 000000B6
/* 00F00 80B1E880 AFA00010 */  sw      $zero, 0x0010($sp)         
/* 00F04 80B1E884 2484F9F4 */  addiu   $a0, $a0, %lo(sStickAngle)  ## $a0 = 80B1F9F4
/* 00F08 80B1E888 24A57FFF */  addiu   $a1, $a1, 0x7FFF           ## $a1 = 00007FFF
/* 00F0C 80B1E88C 00052C00 */  sll     $a1, $a1, 16               
/* 00F10 80B1E890 0C01E1A7 */  jal     Math_SmoothStepToS
              
/* 00F14 80B1E894 00052C03 */  sra     $a1, $a1, 16               
/* 00F18 80B1E898 1000005B */  beq     $zero, $zero, .L80B1EA08   
/* 00F1C 80B1E89C 00000000 */  nop
/* 00F20 80B1E8A0 44815000 */  mtc1    $at, $f10                  ## $f10 = 0.00
.L80B1E8A4:
/* 00F24 80B1E8A4 44808000 */  mtc1    $zero, $f16                ## $f16 = 0.00
/* 00F28 80B1E8A8 8FAF0078 */  lw      $t7, 0x0078($sp)           
/* 00F2C 80B1E8AC 46105480 */  add.s   $f18, $f10, $f16           
/* 00F30 80B1E8B0 4600903C */  c.lt.s  $f18, $f0                  
/* 00F34 80B1E8B4 00000000 */  nop
/* 00F38 80B1E8B8 4500002B */  bc1f    .L80B1E968                 
/* 00F3C 80B1E8BC 00000000 */  nop
/* 00F40 80B1E8C0 81ED0843 */  lb      $t5, 0x0843($t7)           ## 00000843
/* 00F44 80B1E8C4 51A0000E */  beql    $t5, $zero, .L80B1E900     
/* 00F48 80B1E8C8 3C0142FE */  lui     $at, 0x42FE                ## $at = 42FE0000
/* 00F4C 80B1E8CC 81E20842 */  lb      $v0, 0x0842($t7)           ## 00000842
/* 00F50 80B1E8D0 28410018 */  slti    $at, $v0, 0x0018           
/* 00F54 80B1E8D4 14200009 */  bne     $at, $zero, .L80B1E8FC     
/* 00F58 80B1E8D8 2841001C */  slti    $at, $v0, 0x001C           
/* 00F5C 80B1E8DC 10200007 */  beq     $at, $zero, .L80B1E8FC     
/* 00F60 80B1E8E0 3C01438C */  lui     $at, 0x438C                ## $at = 438C0000
/* 00F64 80B1E8E4 44812000 */  mtc1    $at, $f4                   ## $f4 = 280.00
/* 00F68 80B1E8E8 3C0580B2 */  lui     $a1, %hi(sInput)       ## $a1 = 80B20000
/* 00F6C 80B1E8EC 24A50130 */  addiu   $a1, $a1, %lo(sInput)  ## $a1 = 80B20130
/* 00F70 80B1E8F0 4600203E */  c.le.s  $f4, $f0                   
/* 00F74 80B1E8F4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00F78 80B1E8F8 45000017 */  bc1f    .L80B1E958                 
.L80B1E8FC:
/* 00F7C 80B1E8FC 3C0142FE */  lui     $at, 0x42FE                ## $at = 42FE0000
.L80B1E900:
/* 00F80 80B1E900 44813000 */  mtc1    $at, $f6                   ## $f6 = 127.00
/* 00F84 80B1E904 3C0180B2 */  lui     $at, %hi(sStickTilt)       ## $at = 80B20000
/* 00F88 80B1E908 3C0480B2 */  lui     $a0, %hi(sStickAngle)       ## $a0 = 80B20000
/* 00F8C 80B1E90C E426F9F0 */  swc1    $f6, %lo(sStickTilt)($at)  
/* 00F90 80B1E910 8618008A */  lh      $t8, 0x008A($s0)           ## 0000008A
/* 00F94 80B1E914 3C0180B2 */  lui     $at, %hi(sStickAngle)       ## $at = 80B20000
/* 00F98 80B1E918 8FAA0078 */  lw      $t2, 0x0078($sp)           
/* 00F9C 80B1E91C A438F9F4 */  sh      $t8, %lo(sStickAngle)($at)  
/* 00FA0 80B1E920 9219010C */  lbu     $t9, 0x010C($s0)           ## 0000010C
/* 00FA4 80B1E924 24060001 */  addiu   $a2, $zero, 0x0001         ## $a2 = 00000001
/* 00FA8 80B1E928 24072328 */  addiu   $a3, $zero, 0x2328         ## $a3 = 00002328
/* 00FAC 80B1E92C 17200036 */  bne     $t9, $zero, .L80B1EA08     
/* 00FB0 80B1E930 00000000 */  nop
/* 00FB4 80B1E934 854500B6 */  lh      $a1, 0x00B6($t2)           ## 000000B6
/* 00FB8 80B1E938 AFA00010 */  sw      $zero, 0x0010($sp)         
/* 00FBC 80B1E93C 2484F9F4 */  addiu   $a0, $a0, %lo(sStickAngle)  ## $a0 = 80B1F9F4
/* 00FC0 80B1E940 24A57FFF */  addiu   $a1, $a1, 0x7FFF           ## $a1 = 80B2812F
/* 00FC4 80B1E944 00052C00 */  sll     $a1, $a1, 16               
/* 00FC8 80B1E948 0C01E1A7 */  jal     Math_SmoothStepToS
              
/* 00FCC 80B1E94C 00052C03 */  sra     $a1, $a1, 16               
/* 00FD0 80B1E950 1000002D */  beq     $zero, $zero, .L80B1EA08   
/* 00FD4 80B1E954 00000000 */  nop
.L80B1E958:
/* 00FD8 80B1E958 0C2C775C */  jal     EnTorch2_Backflip              
/* 00FDC 80B1E95C 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 00FE0 80B1E960 10000029 */  beq     $zero, $zero, .L80B1EA08   
/* 00FE4 80B1E964 00000000 */  nop
.L80B1E968:
/* 00FE8 80B1E968 05000003 */  bltz    $t0, .L80B1E978            
/* 00FEC 80B1E96C 00081823 */  subu    $v1, $zero, $t0            
/* 00FF0 80B1E970 10000001 */  beq     $zero, $zero, .L80B1E978   
/* 00FF4 80B1E974 01001825 */  or      $v1, $t0, $zero            ## $v1 = 00000000
.L80B1E978:
/* 00FF8 80B1E978 28617800 */  slti    $at, $v1, 0x7800           
/* 00FFC 80B1E97C 10200007 */  beq     $at, $zero, .L80B1E99C     
/* 01000 80B1E980 8FA40084 */  lw      $a0, 0x0084($sp)           
/* 01004 80B1E984 05000003 */  bltz    $t0, .L80B1E994            
/* 01008 80B1E988 00081023 */  subu    $v0, $zero, $t0            
/* 0100C 80B1E98C 10000001 */  beq     $zero, $zero, .L80B1E994   
/* 01010 80B1E990 01001025 */  or      $v0, $t0, $zero            ## $v0 = 00000000
.L80B1E994:
/* 01014 80B1E994 28413000 */  slti    $at, $v0, 0x3000           
/* 01018 80B1E998 10200006 */  beq     $at, $zero, .L80B1E9B4     
.L80B1E99C:
/* 0101C 80B1E99C 3C0580B2 */  lui     $a1, %hi(sInput)       ## $a1 = 80B20000
/* 01020 80B1E9A0 24A50130 */  addiu   $a1, $a1, %lo(sInput)  ## $a1 = 80B20130
/* 01024 80B1E9A4 0C2C76F6 */  jal     EnTorch2_SwingSword              
/* 01028 80B1E9A8 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 0102C 80B1E9AC 14400016 */  bne     $v0, $zero, .L80B1EA08     
/* 01030 80B1E9B0 00000000 */  nop
.L80B1E9B4:
/* 01034 80B1E9B4 860B008A */  lh      $t3, 0x008A($s0)           ## 0000008A
/* 01038 80B1E9B8 3C0180B2 */  lui     $at, %hi(sStickAngle)       ## $at = 80B20000
/* 0103C 80B1E9BC 3C0480B2 */  lui     $a0, %hi(sStickAngle)       ## $a0 = 80B20000
/* 01040 80B1E9C0 A42BF9F4 */  sh      $t3, %lo(sStickAngle)($at)  
/* 01044 80B1E9C4 3C0142FE */  lui     $at, 0x42FE                ## $at = 42FE0000
/* 01048 80B1E9C8 44814000 */  mtc1    $at, $f8                   ## $f8 = 127.00
/* 0104C 80B1E9CC 3C0180B2 */  lui     $at, %hi(sStickTilt)       ## $at = 80B20000
/* 01050 80B1E9D0 8FAE0078 */  lw      $t6, 0x0078($sp)           
/* 01054 80B1E9D4 E428F9F0 */  swc1    $f8, %lo(sStickTilt)($at)  
/* 01058 80B1E9D8 920C010C */  lbu     $t4, 0x010C($s0)           ## 0000010C
/* 0105C 80B1E9DC 24060001 */  addiu   $a2, $zero, 0x0001         ## $a2 = 00000001
/* 01060 80B1E9E0 24072328 */  addiu   $a3, $zero, 0x2328         ## $a3 = 00002328
/* 01064 80B1E9E4 15800008 */  bne     $t4, $zero, .L80B1EA08     
/* 01068 80B1E9E8 00000000 */  nop
/* 0106C 80B1E9EC 85C500B6 */  lh      $a1, 0x00B6($t6)           ## 000000B6
/* 01070 80B1E9F0 AFA00010 */  sw      $zero, 0x0010($sp)         
/* 01074 80B1E9F4 2484F9F4 */  addiu   $a0, $a0, %lo(sStickAngle)  ## $a0 = 80B1F9F4
/* 01078 80B1E9F8 24A57FFF */  addiu   $a1, $a1, 0x7FFF           ## $a1 = 00007FFF
/* 0107C 80B1E9FC 00052C00 */  sll     $a1, $a1, 16               
/* 01080 80B1EA00 0C01E1A7 */  jal     Math_SmoothStepToS
              
/* 01084 80B1EA04 00052C03 */  sra     $a1, $a1, 16               
.L80B1EA08:
/* 01088 80B1EA08 10000039 */  beq     $zero, $zero, .L80B1EAF0   
/* 0108C 80B1EA0C 8FB90068 */  lw      $t9, 0x0068($sp)           
.L80B1EA10:
/* 01090 80B1EA10 90820000 */  lbu     $v0, 0x0000($a0)           ## 00000000
/* 01094 80B1EA14 3C0D80B2 */  lui     $t5, %hi(sAlpha)       ## $t5 = 80B20000
/* 01098 80B1EA18 10400011 */  beq     $v0, $zero, .L80B1EA60     
/* 0109C 80B1EA1C 00000000 */  nop
/* 010A0 80B1EA20 91AD0165 */  lbu     $t5, %lo(sAlpha)($t5)  
/* 010A4 80B1EA24 240100FF */  addiu   $at, $zero, 0x00FF         ## $at = 000000FF
/* 010A8 80B1EA28 15A1000D */  bne     $t5, $at, .L80B1EA60       
/* 010AC 80B1EA2C 00000000 */  nop
/* 010B0 80B1EA30 44805000 */  mtc1    $zero, $f10                ## $f10 = 0.00
/* 010B4 80B1EA34 C6100060 */  lwc1    $f16, 0x0060($s0)          ## 00000060
/* 010B8 80B1EA38 3C0680B2 */  lui     $a2, %hi(sInput)       ## $a2 = 80B20000
/* 010BC 80B1EA3C 4610503C */  c.lt.s  $f10, $f16                 
/* 010C0 80B1EA40 00000000 */  nop
/* 010C4 80B1EA44 45000006 */  bc1f    .L80B1EA60                 
/* 010C8 80B1EA48 00000000 */  nop
/* 010CC 80B1EA4C 94C60130 */  lhu     $a2, %lo(sInput)($a2)  
/* 010D0 80B1EA50 3C0180B2 */  lui     $at, %hi(sInput)       ## $at = 80B20000
/* 010D4 80B1EA54 34C64000 */  ori     $a2, $a2, 0x4000           ## $a2 = 80B24000
/* 010D8 80B1EA58 10000024 */  beq     $zero, $zero, .L80B1EAEC   
/* 010DC 80B1EA5C A4260130 */  sh      $a2, %lo(sInput)($at)  
.L80B1EA60:
/* 010E0 80B1EA60 54400023 */  bnel    $v0, $zero, .L80B1EAF0     
/* 010E4 80B1EA64 8FB90068 */  lw      $t9, 0x0068($sp)           
/* 010E8 80B1EA68 960F0088 */  lhu     $t7, 0x0088($s0)           ## 00000088
/* 010EC 80B1EA6C 3C0E80B2 */  lui     $t6, %hi(sInput)       ## $t6 = 80B20000
/* 010F0 80B1EA70 31F80001 */  andi    $t8, $t7, 0x0001           ## $t8 = 00000000
/* 010F4 80B1EA74 1300001D */  beq     $t8, $zero, .L80B1EAEC     
/* 010F8 80B1EA78 240F0001 */  addiu   $t7, $zero, 0x0001         ## $t7 = 00000001
/* 010FC 80B1EA7C 8602008A */  lh      $v0, 0x008A($s0)           ## 0000008A
/* 01100 80B1EA80 3C1980B2 */  lui     $t9, %hi(sAlpha)       ## $t9 = 80B20000
/* 01104 80B1EA84 3C0180B2 */  lui     $at, %hi(sStickAngle)       ## $at = 80B20000
/* 01108 80B1EA88 A60200B6 */  sh      $v0, 0x00B6($s0)           ## 000000B6
/* 0110C 80B1EA8C A6020032 */  sh      $v0, 0x0032($s0)           ## 00000032
/* 01110 80B1EA90 93390165 */  lbu     $t9, %lo(sAlpha)($t9)  
/* 01114 80B1EA94 A422F9F4 */  sh      $v0, %lo(sStickAngle)($at)  
/* 01118 80B1EA98 240100FF */  addiu   $at, $zero, 0x00FF         ## $at = 000000FF
/* 0111C 80B1EA9C 1321000C */  beq     $t9, $at, .L80B1EAD0       
/* 01120 80B1EAA0 3C0A80B2 */  lui     $t2, %hi(sStickAngle)       ## $t2 = 80B20000
/* 01124 80B1EAA4 854AF9F4 */  lh      $t2, %lo(sStickAngle)($t2)  
/* 01128 80B1EAA8 34018000 */  ori     $at, $zero, 0x8000         ## $at = 00008000
/* 0112C 80B1EAAC 240C0001 */  addiu   $t4, $zero, 0x0001         ## $t4 = 00000001
/* 01130 80B1EAB0 01415821 */  addu    $t3, $t2, $at              
/* 01134 80B1EAB4 3C0180B2 */  lui     $at, %hi(sStickAngle)       ## $at = 80B20000
/* 01138 80B1EAB8 A42BF9F4 */  sh      $t3, %lo(sStickAngle)($at)  
/* 0113C 80B1EABC 3C0142FE */  lui     $at, 0x42FE                ## $at = 42FE0000
/* 01140 80B1EAC0 44819000 */  mtc1    $at, $f18                  ## $f18 = 127.00
/* 01144 80B1EAC4 3C0180B2 */  lui     $at, %hi(sZTargetFlag)       ## $at = 80B20000
/* 01148 80B1EAC8 E4F20000 */  swc1    $f18, 0x0000($a3)          ## 00000000
/* 0114C 80B1EACC A02CFA00 */  sb      $t4, %lo(sZTargetFlag)($at)  
.L80B1EAD0:
/* 01150 80B1EAD0 95CE0130 */  lhu     $t6, %lo(sInput)($t6)  
/* 01154 80B1EAD4 3C0180B2 */  lui     $at, %hi(sInput)       ## $at = 80B20000
/* 01158 80B1EAD8 2418000A */  addiu   $t8, $zero, 0x000A         ## $t8 = 0000000A
/* 0115C 80B1EADC 35CD8000 */  ori     $t5, $t6, 0x8000           ## $t5 = 80B28000
/* 01160 80B1EAE0 A42D0130 */  sh      $t5, %lo(sInput)($at)  
/* 01164 80B1EAE4 A08F0000 */  sb      $t7, 0x0000($a0)           ## 00000000
/* 01168 80B1EAE8 A2180A78 */  sb      $t8, 0x0A78($s0)           ## 00000A78
.L80B1EAEC:
/* 0116C 80B1EAEC 8FB90068 */  lw      $t9, 0x0068($sp)           
.L80B1EAF0:
/* 01170 80B1EAF0 3C0B80B2 */  lui     $t3, %hi(sStickAngle)       ## $t3 = 80B20000
/* 01174 80B1EAF4 856BF9F4 */  lh      $t3, %lo(sStickAngle)($t3)  
/* 01178 80B1EAF8 872A013C */  lh      $t2, 0x013C($t9)           ## 80B2013C
/* 0117C 80B1EAFC 8FAE0084 */  lw      $t6, 0x0084($sp)           
/* 01180 80B1EB00 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 01184 80B1EB04 014B2023 */  subu    $a0, $t2, $t3              
/* 01188 80B1EB08 00042400 */  sll     $a0, $a0, 16               
/* 0118C 80B1EB0C 00042403 */  sra     $a0, $a0, 16               
/* 01190 80B1EB10 260C0024 */  addiu   $t4, $s0, 0x0024           ## $t4 = 00000024
/* 01194 80B1EB14 01C16821 */  addu    $t5, $t6, $at              
/* 01198 80B1EB18 AFAD002C */  sw      $t5, 0x002C($sp)           
/* 0119C 80B1EB1C AFAC0034 */  sw      $t4, 0x0034($sp)           
/* 011A0 80B1EB20 0C01DE1C */  jal     Math_SinS
              ## sins?
/* 011A4 80B1EB24 A7A40066 */  sh      $a0, 0x0066($sp)           
/* 011A8 80B1EB28 3C0180B2 */  lui     $at, %hi(sStickTilt)       ## $at = 80B20000
/* 011AC 80B1EB2C C424F9F0 */  lwc1    $f4, %lo(sStickTilt)($at)  
/* 011B0 80B1EB30 3C0180B2 */  lui     $at, %hi(sInput+2)       ## $at = 80B20000
/* 011B4 80B1EB34 87A40066 */  lh      $a0, 0x0066($sp)           
/* 011B8 80B1EB38 46040182 */  mul.s   $f6, $f0, $f4              
/* 011BC 80B1EB3C 4600320D */  trunc.w.s $f8, $f6                   
/* 011C0 80B1EB40 44184000 */  mfc1    $t8, $f8                   
/* 011C4 80B1EB44 0C01DE0D */  jal     Math_CosS
              ## coss?
/* 011C8 80B1EB48 A0380132 */  sb      $t8, %lo(sInput+2)($at)  
/* 011CC 80B1EB4C 3C0180B2 */  lui     $at, %hi(sStickTilt)       ## $at = 80B20000
/* 011D0 80B1EB50 C42AF9F0 */  lwc1    $f10, %lo(sStickTilt)($at) 
/* 011D4 80B1EB54 3C0280B2 */  lui     $v0, %hi(sAlpha)       ## $v0 = 80B20000
/* 011D8 80B1EB58 90420165 */  lbu     $v0, %lo(sAlpha)($v0)  
/* 011DC 80B1EB5C 460A0402 */  mul.s   $f16, $f0, $f10            
/* 011E0 80B1EB60 3C0180B2 */  lui     $at, %hi(sInput+3)       ## $at = 80B20000
/* 011E4 80B1EB64 8FAA002C */  lw      $t2, 0x002C($sp)           
/* 011E8 80B1EB68 4600848D */  trunc.w.s $f18, $f16                 
/* 011EC 80B1EB6C 44039000 */  mfc1    $v1, $f18                  
/* 011F0 80B1EB70 00000000 */  nop
/* 011F4 80B1EB74 00031E00 */  sll     $v1, $v1, 24               
/* 011F8 80B1EB78 00031E03 */  sra     $v1, $v1, 24               
/* 011FC 80B1EB7C A0230133 */  sb      $v1, %lo(sInput+3)($at)  
/* 01200 80B1EB80 240100FF */  addiu   $at, $zero, 0x00FF         ## $at = 000000FF
/* 01204 80B1EB84 104100B0 */  beq     $v0, $at, .L80B1EE48       
/* 01208 80B1EB88 00000000 */  nop
/* 0120C 80B1EB8C 8D4B1DE4 */  lw      $t3, 0x1DE4($t2)           ## 00001DE4
/* 01210 80B1EB90 244E0001 */  addiu   $t6, $v0, 0x0001           ## $t6 = 80B20001
/* 01214 80B1EB94 3C0180B2 */  lui     $at, %hi(sAlpha)       ## $at = 80B20000
/* 01218 80B1EB98 316C0007 */  andi    $t4, $t3, 0x0007           ## $t4 = 00000000
/* 0121C 80B1EB9C 158000AA */  bne     $t4, $zero, .L80B1EE48     
/* 01220 80B1EBA0 00000000 */  nop
/* 01224 80B1EBA4 100000A8 */  beq     $zero, $zero, .L80B1EE48   
/* 01228 80B1EBA8 A02E0165 */  sb      $t6, %lo(sAlpha)($at)  
.L80B1EBAC:
/* 0122C 80B1EBAC A2000843 */  sb      $zero, 0x0843($s0)         ## 00000843
/* 01230 80B1EBB0 3C0180B2 */  lui     $at, %hi(sInput+3)       ## $at = 80B20000
/* 01234 80B1EBB4 A0200133 */  sb      $zero, %lo(sInput+3)($at) 
/* 01238 80B1EBB8 A0200132 */  sb      $zero, %lo(sInput+2)($at) 
/* 0123C 80B1EBBC 820D0A78 */  lb      $t5, 0x0A78($s0)           ## 00000A78
/* 01240 80B1EBC0 3C014320 */  lui     $at, 0x4320                ## $at = 43200000
/* 01244 80B1EBC4 59A00085 */  blezl   $t5, .L80B1EDDC            
/* 01248 80B1EBC8 8FAD0084 */  lw      $t5, 0x0084($sp)           
/* 0124C 80B1EBCC C6060080 */  lwc1    $f6, 0x0080($s0)           ## 00000080
/* 01250 80B1EBD0 44814000 */  mtc1    $at, $f8                   ## $f8 = 160.00
/* 01254 80B1EBD4 C6040028 */  lwc1    $f4, 0x0028($s0)           ## 00000028
/* 01258 80B1EBD8 3C0180B2 */  lui     $at, %hi(sSpawnPoint+4)       ## $at = 80B20000
/* 0125C 80B1EBDC 46083281 */  sub.s   $f10, $f6, $f8             
/* 01260 80B1EBE0 460A203C */  c.lt.s  $f4, $f10                  
/* 01264 80B1EBE4 00000000 */  nop
/* 01268 80B1EBE8 4502007C */  bc1fl   .L80B1EDDC                 
/* 0126C 80B1EBEC 8FAD0084 */  lw      $t5, 0x0084($sp)           
/* 01270 80B1EBF0 920F0692 */  lbu     $t7, 0x0692($s0)           ## 00000692
/* 01274 80B1EBF4 8E190004 */  lw      $t9, 0x0004($s0)           ## 00000004
/* 01278 80B1EBF8 44808000 */  mtc1    $zero, $f16                ## $f16 = 0.00
/* 0127C 80B1EBFC 31F8FFFE */  andi    $t8, $t7, 0xFFFE           ## $t8 = 00000000
/* 01280 80B1EC00 372A0001 */  ori     $t2, $t9, 0x0001           ## $t2 = 00000001
/* 01284 80B1EC04 A2180692 */  sb      $t8, 0x0692($s0)           ## 00000692
/* 01288 80B1EC08 AE0A0004 */  sw      $t2, 0x0004($s0)           ## 00000004
/* 0128C 80B1EC0C A2000A78 */  sb      $zero, 0x0A78($s0)         ## 00000A78
/* 01290 80B1EC10 E6100060 */  swc1    $f16, 0x0060($s0)          ## 00000060
/* 01294 80B1EC14 C4320154 */  lwc1    $f18, %lo(sSpawnPoint+4)($at) 
/* 01298 80B1EC18 3C014220 */  lui     $at, 0x4220                ## $at = 42200000
/* 0129C 80B1EC1C 44813000 */  mtc1    $at, $f6                   ## $f6 = 40.00
/* 012A0 80B1EC20 00000000 */  nop
/* 012A4 80B1EC24 46069200 */  add.s   $f8, $f18, $f6             
/* 012A8 80B1EC28 E6080028 */  swc1    $f8, 0x0028($s0)           ## 00000028
/* 012AC 80B1EC2C 8FAB0078 */  lw      $t3, 0x0078($sp)           
/* 012B0 80B1EC30 0C01DE1C */  jal     Math_SinS
              ## sins?
/* 012B4 80B1EC34 856400B6 */  lh      $a0, 0x00B6($t3)           ## 000000B6
/* 012B8 80B1EC38 3C01C2F0 */  lui     $at, 0xC2F0                ## $at = C2F00000
/* 012BC 80B1EC3C 44812000 */  mtc1    $at, $f4                   ## $f4 = -120.00
/* 012C0 80B1EC40 8FA20078 */  lw      $v0, 0x0078($sp)           
/* 012C4 80B1EC44 46040282 */  mul.s   $f10, $f0, $f4             
/* 012C8 80B1EC48 C4500024 */  lwc1    $f16, 0x0024($v0)          ## 00000024
/* 012CC 80B1EC4C 46105480 */  add.s   $f18, $f10, $f16           
/* 012D0 80B1EC50 E6120024 */  swc1    $f18, 0x0024($s0)          ## 00000024
/* 012D4 80B1EC54 0C01DE0D */  jal     Math_CosS
              ## coss?
/* 012D8 80B1EC58 844400B6 */  lh      $a0, 0x00B6($v0)           ## 000000B6
/* 012DC 80B1EC5C 3C01C2F0 */  lui     $at, 0xC2F0                ## $at = C2F00000
/* 012E0 80B1EC60 44813000 */  mtc1    $at, $f6                   ## $f6 = -120.00
/* 012E4 80B1EC64 8FAC0078 */  lw      $t4, 0x0078($sp)           
/* 012E8 80B1EC68 3C0580B2 */  lui     $a1, %hi(sSpawnPoint)       ## $a1 = 80B20000
/* 012EC 80B1EC6C 46060202 */  mul.s   $f8, $f0, $f6              
/* 012F0 80B1EC70 C584002C */  lwc1    $f4, 0x002C($t4)           ## 0000002C
/* 012F4 80B1EC74 24A50150 */  addiu   $a1, $a1, %lo(sSpawnPoint)  ## $a1 = 80B20150
/* 012F8 80B1EC78 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 012FC 80B1EC7C 46044280 */  add.s   $f10, $f8, $f4             
/* 01300 80B1EC80 0C00B6DB */  jal     Actor_WorldDistXYZToPoint              
/* 01304 80B1EC84 E60A002C */  swc1    $f10, 0x002C($s0)          ## 0000002C
/* 01308 80B1EC88 3C014448 */  lui     $at, 0x4448                ## $at = 44480000
/* 0130C 80B1EC8C 44818000 */  mtc1    $at, $f16                  ## $f16 = 800.00
/* 01310 80B1EC90 00000000 */  nop
/* 01314 80B1EC94 4600803C */  c.lt.s  $f16, $f0                  
/* 01318 80B1EC98 00000000 */  nop
/* 0131C 80B1EC9C 45020035 */  bc1fl   .L80B1ED74                 
/* 01320 80B1ECA0 C6120080 */  lwc1    $f18, 0x0080($s0)          ## 00000080
/* 01324 80B1ECA4 0C03F66B */  jal     Rand_ZeroOne
              ## Rand.Next() float
/* 01328 80B1ECA8 00000000 */  nop
/* 0132C 80B1ECAC 3C0141A0 */  lui     $at, 0x41A0                ## $at = 41A00000
/* 01330 80B1ECB0 44819000 */  mtc1    $at, $f18                  ## $f18 = 20.00
/* 01334 80B1ECB4 3C01457A */  lui     $at, 0x457A                ## $at = 457A0000
/* 01338 80B1ECB8 44816000 */  mtc1    $at, $f12                  ## $f12 = 4000.00
/* 0133C 80B1ECBC 46120182 */  mul.s   $f6, $f0, $f18             
/* 01340 80B1ECC0 0C00CFC8 */  jal     Rand_CenteredFloat
              
/* 01344 80B1ECC4 E7A60050 */  swc1    $f6, 0x0050($sp)           
/* 01348 80B1ECC8 4600020D */  trunc.w.s $f8, $f0                   
/* 0134C 80B1ECCC 8FA50078 */  lw      $a1, 0x0078($sp)           
/* 01350 80B1ECD0 3C0480B2 */  lui     $a0, %hi(sSpawnPoint)       ## $a0 = 80B20000
/* 01354 80B1ECD4 24840150 */  addiu   $a0, $a0, %lo(sSpawnPoint)  ## $a0 = 80B20150
/* 01358 80B1ECD8 440D4000 */  mfc1    $t5, $f8                   
/* 0135C 80B1ECDC 24A50024 */  addiu   $a1, $a1, 0x0024           ## $a1 = 00000024
/* 01360 80B1ECE0 0C01E01A */  jal     Math_Vec3f_Yaw
              
/* 01364 80B1ECE4 A7AD004E */  sh      $t5, 0x004E($sp)           
/* 01368 80B1ECE8 A6020032 */  sh      $v0, 0x0032($s0)           ## 00000032
/* 0136C 80B1ECEC A60200B6 */  sh      $v0, 0x00B6($s0)           ## 000000B6
/* 01370 80B1ECF0 87B8004E */  lh      $t8, 0x004E($sp)           
/* 01374 80B1ECF4 860F0032 */  lh      $t7, 0x0032($s0)           ## 00000032
/* 01378 80B1ECF8 01F82021 */  addu    $a0, $t7, $t8              
/* 0137C 80B1ECFC 00042400 */  sll     $a0, $a0, 16               
/* 01380 80B1ED00 0C01DE1C */  jal     Math_SinS
              ## sins?
/* 01384 80B1ED04 00042403 */  sra     $a0, $a0, 16               
/* 01388 80B1ED08 3C0141C8 */  lui     $at, 0x41C8                ## $at = 41C80000
/* 0138C 80B1ED0C 44812000 */  mtc1    $at, $f4                   ## $f4 = 25.00
/* 01390 80B1ED10 C7AA0050 */  lwc1    $f10, 0x0050($sp)          
/* 01394 80B1ED14 3C0180B2 */  lui     $at, %hi(sSpawnPoint)       ## $at = 80B20000
/* 01398 80B1ED18 C4320150 */  lwc1    $f18, %lo(sSpawnPoint)($at) 
/* 0139C 80B1ED1C 460A2080 */  add.s   $f2, $f4, $f10             
/* 013A0 80B1ED20 86190032 */  lh      $t9, 0x0032($s0)           ## 00000032
/* 013A4 80B1ED24 46020402 */  mul.s   $f16, $f0, $f2             
/* 013A8 80B1ED28 46128180 */  add.s   $f6, $f16, $f18            
/* 013AC 80B1ED2C E6060024 */  swc1    $f6, 0x0024($s0)           ## 00000024
/* 013B0 80B1ED30 87AA004E */  lh      $t2, 0x004E($sp)           
/* 013B4 80B1ED34 E7A20038 */  swc1    $f2, 0x0038($sp)           
/* 013B8 80B1ED38 032A2021 */  addu    $a0, $t9, $t2              
/* 013BC 80B1ED3C 00042400 */  sll     $a0, $a0, 16               
/* 013C0 80B1ED40 0C01DE0D */  jal     Math_CosS
              ## coss?
/* 013C4 80B1ED44 00042403 */  sra     $a0, $a0, 16               
/* 013C8 80B1ED48 C7A20038 */  lwc1    $f2, 0x0038($sp)           
/* 013CC 80B1ED4C 3C0180B2 */  lui     $at, %hi(sSpawnPoint+8)       ## $at = 80B20000
/* 013D0 80B1ED50 C4240158 */  lwc1    $f4, %lo(sSpawnPoint+8)($at)  
/* 013D4 80B1ED54 46020202 */  mul.s   $f8, $f0, $f2              
/* 013D8 80B1ED58 3C0180B2 */  lui     $at, %hi(sSpawnPoint+4)       ## $at = 80B20000
/* 013DC 80B1ED5C 46044280 */  add.s   $f10, $f8, $f4             
/* 013E0 80B1ED60 E60A002C */  swc1    $f10, 0x002C($s0)          ## 0000002C
/* 013E4 80B1ED64 C4300154 */  lwc1    $f16, %lo(sSpawnPoint+4)($at) 
/* 013E8 80B1ED68 10000003 */  beq     $zero, $zero, .L80B1ED78   
/* 013EC 80B1ED6C E6100028 */  swc1    $f16, 0x0028($s0)          ## 00000028
/* 013F0 80B1ED70 C6120080 */  lwc1    $f18, 0x0080($s0)          ## 00000080
.L80B1ED74:
/* 013F4 80B1ED74 E6120028 */  swc1    $f18, 0x0028($s0)          ## 00000028
.L80B1ED78:
/* 013F8 80B1ED78 26040008 */  addiu   $a0, $s0, 0x0008           ## $a0 = 00000008
/* 013FC 80B1ED7C 0C01DF90 */  jal     Math_Vec3f_Copy
              ## Vec3f_Copy
/* 01400 80B1ED80 26050024 */  addiu   $a1, $s0, 0x0024           ## $a1 = 00000024
/* 01404 80B1ED84 8FA50084 */  lw      $a1, 0x0084($sp)           
/* 01408 80B1ED88 3C190001 */  lui     $t9, 0x0001                ## $t9 = 00010000
/* 0140C 80B1ED8C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01410 80B1ED90 0325C821 */  addu    $t9, $t9, $a1              
/* 01414 80B1ED94 8F391D54 */  lw      $t9, 0x1D54($t9)           ## 00011D54
/* 01418 80B1ED98 0320F809 */  jalr    $ra, $t9                   
/* 0141C 80B1ED9C 00000000 */  nop
/* 01420 80B1EDA0 44803000 */  mtc1    $zero, $f6                 ## $f6 = 0.00
/* 01424 80B1EDA4 240B0001 */  addiu   $t3, $zero, 0x0001         ## $t3 = 00000001
/* 01428 80B1EDA8 3C0180B2 */  lui     $at, %hi(sActionState)       ## $at = 80B20000
/* 0142C 80B1EDAC A02B015E */  sb      $t3, %lo(sActionState)($at)  
/* 01430 80B1EDB0 3C0C80B2 */  lui     $t4, %hi(sAlpha)       ## $t4 = 80B20000
/* 01434 80B1EDB4 918C0165 */  lbu     $t4, %lo(sAlpha)($t4)  
/* 01438 80B1EDB8 3C0180B2 */  lui     $at, %hi(sStickTilt)       ## $at = 80B20000
/* 0143C 80B1EDBC E426F9F0 */  swc1    $f6, %lo(sStickTilt)($at)  
/* 01440 80B1EDC0 240100FF */  addiu   $at, $zero, 0x00FF         ## $at = 000000FF
/* 01444 80B1EDC4 11810004 */  beq     $t4, $at, .L80B1EDD8       
/* 01448 80B1EDC8 3C0180B2 */  lui     $at, %hi(sStaggerCount)       ## $at = 80B20000
/* 0144C 80B1EDCC A0200162 */  sb      $zero, %lo(sStaggerCount)($at) 
/* 01450 80B1EDD0 3C0180B2 */  lui     $at, %hi(sStaggerTimer)       ## $at = 80B20000
/* 01454 80B1EDD4 A0200163 */  sb      $zero, %lo(sStaggerTimer)($at) 
.L80B1EDD8:
/* 01458 80B1EDD8 8FAD0084 */  lw      $t5, 0x0084($sp)           
.L80B1EDDC:
/* 0145C 80B1EDDC 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 01460 80B1EDE0 260E0024 */  addiu   $t6, $s0, 0x0024           ## $t6 = 00000024
/* 01464 80B1EDE4 01A17821 */  addu    $t7, $t5, $at              
/* 01468 80B1EDE8 AFAF002C */  sw      $t7, 0x002C($sp)           
/* 0146C 80B1EDEC 10000016 */  beq     $zero, $zero, .L80B1EE48   
/* 01470 80B1EDF0 AFAE0034 */  sw      $t6, 0x0034($sp)           
.L80B1EDF4:
/* 01474 80B1EDF4 3C0380B2 */  lui     $v1, %hi(sAlpha)       ## $v1 = 80B20000
/* 01478 80B1EDF8 24630165 */  addiu   $v1, $v1, %lo(sAlpha)  ## $v1 = 80B20165
/* 0147C 80B1EDFC 90620000 */  lbu     $v0, 0x0000($v1)           ## 80B20165
/* 01480 80B1EE00 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01484 80B1EE04 2442FFF3 */  addiu   $v0, $v0, 0xFFF3           ## $v0 = FFFFFFF3
/* 01488 80B1EE08 5C400006 */  bgtzl   $v0, .L80B1EE24            
/* 0148C 80B1EE0C A0620000 */  sb      $v0, 0x0000($v1)           ## 80B20165
/* 01490 80B1EE10 0C00B55C */  jal     Actor_Kill
              
/* 01494 80B1EE14 A0600000 */  sb      $zero, 0x0000($v1)         ## 80B20165
/* 01498 80B1EE18 1000025F */  beq     $zero, $zero, .L80B1F798   
/* 0149C 80B1EE1C 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 014A0 80B1EE20 A0620000 */  sb      $v0, 0x0000($v1)           ## 00000000
.L80B1EE24:
/* 014A4 80B1EE24 921800C8 */  lbu     $t8, 0x00C8($s0)           ## 000000C8
/* 014A8 80B1EE28 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 014AC 80B1EE2C 26190024 */  addiu   $t9, $s0, 0x0024           ## $t9 = 00000024
/* 014B0 80B1EE30 270AFFF3 */  addiu   $t2, $t8, 0xFFF3           ## $t2 = FFFFFFF3
/* 014B4 80B1EE34 A20A00C8 */  sb      $t2, 0x00C8($s0)           ## 000000C8
/* 014B8 80B1EE38 8FAB0084 */  lw      $t3, 0x0084($sp)           
/* 014BC 80B1EE3C AFB90034 */  sw      $t9, 0x0034($sp)           
/* 014C0 80B1EE40 01616021 */  addu    $t4, $t3, $at              
/* 014C4 80B1EE44 AFAC002C */  sw      $t4, 0x002C($sp)           
.L80B1EE48:
/* 014C8 80B1EE48 3C0E8016 */  lui     $t6, %hi(gSaveContext+0x13f0)
/* 014CC 80B1EE4C 85CEFA50 */  lh      $t6, %lo(gSaveContext+0x13f0)($t6)
/* 014D0 80B1EE50 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
/* 014D4 80B1EE54 3C1880B2 */  lui     $t8, %hi(sActionState)       ## $t8 = 80B20000
/* 014D8 80B1EE58 15C10013 */  bne     $t6, $at, .L80B1EEA8       
/* 014DC 80B1EE5C 3C0580B2 */  lui     $a1, %hi(sInput+6)       ## $a1 = 80B20000
/* 014E0 80B1EE60 8FA70078 */  lw      $a3, 0x0078($sp)           
/* 014E4 80B1EE64 80ED0843 */  lb      $t5, 0x0843($a3)           ## 00000843
/* 014E8 80B1EE68 51A00008 */  beql    $t5, $zero, .L80B1EE8C     
/* 014EC 80B1EE6C 44804000 */  mtc1    $zero, $f8                 ## $f8 = 0.00
/* 014F0 80B1EE70 80E20842 */  lb      $v0, 0x0842($a3)           ## 00000842
/* 014F4 80B1EE74 28410018 */  slti    $at, $v0, 0x0018           
/* 014F8 80B1EE78 14200003 */  bne     $at, $zero, .L80B1EE88     
/* 014FC 80B1EE7C 2841001C */  slti    $at, $v0, 0x001C           
/* 01500 80B1EE80 14200009 */  bne     $at, $zero, .L80B1EEA8     
/* 01504 80B1EE84 00000000 */  nop
.L80B1EE88:
/* 01508 80B1EE88 44804000 */  mtc1    $zero, $f8                 ## $f8 = 0.00
.L80B1EE8C:
/* 0150C 80B1EE8C 3C0180B2 */  lui     $at, %hi(sStickTilt)       ## $at = 80B20000
/* 01510 80B1EE90 24060010 */  addiu   $a2, $zero, 0x0010         ## $a2 = 00000010
/* 01514 80B1EE94 E428F9F0 */  swc1    $f8, %lo(sStickTilt)($at)  
/* 01518 80B1EE98 3C0180B2 */  lui     $at, %hi(sInput+2)       ## $at = 80B20000
/* 0151C 80B1EE9C A0200132 */  sb      $zero, %lo(sInput+2)($at) 
/* 01520 80B1EEA0 A0200133 */  sb      $zero, %lo(sInput+3)($at) 
/* 01524 80B1EEA4 A4260130 */  sh      $a2, %lo(sInput)($at)  
.L80B1EEA8:
/* 01528 80B1EEA8 9318015E */  lbu     $t8, %lo(sActionState)($t8)  
/* 0152C 80B1EEAC 3C0F80B2 */  lui     $t7, %hi(sInput)       ## $t7 = 80B20000
/* 01530 80B1EEB0 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 01534 80B1EEB4 1701000F */  bne     $t8, $at, .L80B1EEF4       
/* 01538 80B1EEB8 95EF0130 */  lhu     $t7, %lo(sInput)($t7)  
/* 0153C 80B1EEBC 3C0180B2 */  lui     $at, %hi(D_80B1FA5C)       ## $at = 80B20000
/* 01540 80B1EEC0 C424FA5C */  lwc1    $f4, %lo(D_80B1FA5C)($at)  
/* 01544 80B1EEC4 C60A0090 */  lwc1    $f10, 0x0090($s0)          ## 00000090
/* 01548 80B1EEC8 3C0A80B2 */  lui     $t2, %hi(sZTargetFlag)       ## $t2 = 80B20000
/* 0154C 80B1EECC 4604503E */  c.le.s  $f10, $f4                  
/* 01550 80B1EED0 00000000 */  nop
/* 01554 80B1EED4 45000007 */  bc1f    .L80B1EEF4                 
/* 01558 80B1EED8 00000000 */  nop
/* 0155C 80B1EEDC 914AFA00 */  lbu     $t2, %lo(sZTargetFlag)($t2)  
/* 01560 80B1EEE0 35E62000 */  ori     $a2, $t7, 0x2000           ## $a2 = 80B22000
/* 01564 80B1EEE4 3C0180B2 */  lui     $at, %hi(sInput)       ## $at = 80B20000
/* 01568 80B1EEE8 11400002 */  beq     $t2, $zero, .L80B1EEF4     
/* 0156C 80B1EEEC 00000000 */  nop
/* 01570 80B1EEF0 A4260130 */  sh      $a2, %lo(sInput)($at)  
.L80B1EEF4:
/* 01574 80B1EEF4 3C0680B2 */  lui     $a2, %hi(sInput)       ## $a2 = 80B20000
/* 01578 80B1EEF8 94C60130 */  lhu     $a2, %lo(sInput)($a2)  
/* 0157C 80B1EEFC 94A50136 */  lhu     $a1, %lo(sInput+6)($a1)  
/* 01580 80B1EF00 3C0180B2 */  lui     $at, %hi(sInput+12)       ## $at = 80B20000
/* 01584 80B1EF04 30CB0010 */  andi    $t3, $a2, 0x0010           ## $t3 = 00000000
/* 01588 80B1EF08 00A61826 */  xor     $v1, $a1, $a2              
/* 0158C 80B1EF0C 00C3C824 */  and     $t9, $a2, $v1              
/* 01590 80B1EF10 A439013C */  sh      $t9, %lo(sInput+12)($at)  
/* 01594 80B1EF14 1160000F */  beq     $t3, $zero, .L80B1EF54     
/* 01598 80B1EF18 00C01025 */  or      $v0, $a2, $zero            ## $v0 = 80B20000
/* 0159C 80B1EF1C 3C0C80B2 */  lui     $t4, %hi(sCounterState)       ## $t4 = 80B20000
/* 015A0 80B1EF20 918C0160 */  lbu     $t4, %lo(sCounterState)($t4)  
/* 015A4 80B1EF24 3C0180B2 */  lui     $at, %hi(sInput)       ## $at = 80B20000
/* 015A8 80B1EF28 A4260130 */  sh      $a2, %lo(sInput)($at)  
/* 015AC 80B1EF2C 15800007 */  bne     $t4, $zero, .L80B1EF4C     
/* 015B0 80B1EF30 38460010 */  xori    $a2, $v0, 0x0010           ## $a2 = 80B20010
/* 015B4 80B1EF34 820E0843 */  lb      $t6, 0x0843($s0)           ## 00000843
/* 015B8 80B1EF38 55C00005 */  bnel    $t6, $zero, .L80B1EF50     
/* 015BC 80B1EF3C 30C6FFFF */  andi    $a2, $a2, 0xFFFF           ## $a2 = 00000010
/* 015C0 80B1EF40 24060010 */  addiu   $a2, $zero, 0x0010         ## $a2 = 00000010
/* 015C4 80B1EF44 10000003 */  beq     $zero, $zero, .L80B1EF54   
/* 015C8 80B1EF48 24020010 */  addiu   $v0, $zero, 0x0010         ## $v0 = 00000010
.L80B1EF4C:
/* 015CC 80B1EF4C 30C6FFFF */  andi    $a2, $a2, 0xFFFF           ## $a2 = 00000010
.L80B1EF50:
/* 015D0 80B1EF50 00C01025 */  or      $v0, $a2, $zero            ## $v0 = 00000010
.L80B1EF54:
/* 015D4 80B1EF54 00A36824 */  and     $t5, $a1, $v1              
/* 015D8 80B1EF58 3C0180B2 */  lui     $at, %hi(sInput+18)       ## $at = 80B20000
/* 015DC 80B1EF5C A42D0142 */  sh      $t5, %lo(sInput+18)($at)  
/* 015E0 80B1EF60 3C0180B2 */  lui     $at, %hi(sInput+6)       ## $at = 80B20000
/* 015E4 80B1EF64 30583FFF */  andi    $t8, $v0, 0x3FFF           ## $t8 = 00000010
/* 015E8 80B1EF68 3C0480B2 */  lui     $a0, %hi(sInput)       ## $a0 = 80B20000
/* 015EC 80B1EF6C A4380136 */  sh      $t8, %lo(sInput+6)($at)  
/* 015F0 80B1EF70 24840130 */  addiu   $a0, $a0, %lo(sInput)  ## $a0 = 80B20130
/* 015F4 80B1EF74 0C03F31B */  jal     PadUtils_UpdateRelXY              
/* 015F8 80B1EF78 A4260130 */  sh      $a2, %lo(sInput)($at)  
/* 015FC 80B1EF7C 3C0F80B2 */  lui     $t7, %hi(sInput+2)       ## $t7 = 80B20000
/* 01600 80B1EF80 3C0A80B2 */  lui     $t2, %hi(sInput+8)       ## $t2 = 80B20000
/* 01604 80B1EF84 814A0138 */  lb      $t2, %lo(sInput+8)($t2)  
/* 01608 80B1EF88 81EF0132 */  lb      $t7, %lo(sInput+2)($t7)  
/* 0160C 80B1EF8C 3C0E80B2 */  lui     $t6, %hi(sInput+14)       ## $t6 = 80B20000
/* 01610 80B1EF90 81CE013E */  lb      $t6, %lo(sInput+14)($t6)  
/* 01614 80B1EF94 01EA6023 */  subu    $t4, $t7, $t2              
/* 01618 80B1EF98 3C0180B2 */  lui     $at, %hi(sInput+14)       ## $at = 80B20000
/* 0161C 80B1EF9C 01CC6821 */  addu    $t5, $t6, $t4              
/* 01620 80B1EFA0 A02D013E */  sb      $t5, %lo(sInput+14)($at)  
/* 01624 80B1EFA4 3C0F80B2 */  lui     $t7, %hi(sInput+9)       ## $t7 = 80B20000
/* 01628 80B1EFA8 3C1880B2 */  lui     $t8, %hi(sInput+3)       ## $t8 = 80B20000
/* 0162C 80B1EFAC 83180133 */  lb      $t8, %lo(sInput+3)($t8)  
/* 01630 80B1EFB0 81EF0139 */  lb      $t7, %lo(sInput+9)($t7)  
/* 01634 80B1EFB4 3C0E80B2 */  lui     $t6, %hi(sInput+15)       ## $t6 = 80B20000
/* 01638 80B1EFB8 81CE013F */  lb      $t6, %lo(sInput+15)($t6)  
/* 0163C 80B1EFBC 030F5823 */  subu    $t3, $t8, $t7              
/* 01640 80B1EFC0 01CB6021 */  addu    $t4, $t6, $t3              
/* 01644 80B1EFC4 A02C013F */  sb      $t4, %lo(sInput+15)($at)  
/* 01648 80B1EFC8 920D00AF */  lbu     $t5, 0x00AF($s0)           ## 000000AF
/* 0164C 80B1EFCC 15A0000C */  bne     $t5, $zero, .L80B1F000     
/* 01650 80B1EFD0 3C1880B2 */  lui     $t8, %hi(sDeathFlag)       ## $t8 = 80B20000
/* 01654 80B1EFD4 9318FA04 */  lbu     $t8, %lo(sDeathFlag)($t8)  
/* 01658 80B1EFD8 240F0018 */  addiu   $t7, $zero, 0x0018         ## $t7 = 00000018
/* 0165C 80B1EFDC 24190001 */  addiu   $t9, $zero, 0x0001         ## $t9 = 00000001
/* 01660 80B1EFE0 53000008 */  beql    $t8, $zero, .L80B1F004     
/* 01664 80B1EFE4 820E0A78 */  lb      $t6, 0x0A78($s0)           ## 00000A78
/* 01668 80B1EFE8 A20F0444 */  sb      $t7, 0x0444($s0)           ## 00000444
/* 0166C 80B1EFEC 8FAA0078 */  lw      $t2, 0x0078($sp)           
/* 01670 80B1EFF0 A619046A */  sh      $t9, 0x046A($s0)           ## 0000046A
/* 01674 80B1EFF4 3C0180B2 */  lui     $at, %hi(sDeathFlag)       ## $at = 80B20000
/* 01678 80B1EFF8 AE0A0448 */  sw      $t2, 0x0448($s0)           ## 00000448
/* 0167C 80B1EFFC A020FA04 */  sb      $zero, %lo(sDeathFlag)($at) 
.L80B1F000:
/* 01680 80B1F000 820E0A78 */  lb      $t6, 0x0A78($s0)           ## 00000A78
.L80B1F004:
/* 01684 80B1F004 55C0008D */  bnel    $t6, $zero, .L80B1F23C     
/* 01688 80B1F008 920F0114 */  lbu     $t7, 0x0114($s0)           ## 00000114
/* 0168C 80B1F00C 920B00AF */  lbu     $t3, 0x00AF($s0)           ## 000000AF
/* 01690 80B1F010 5160008A */  beql    $t3, $zero, .L80B1F23C     
/* 01694 80B1F014 920F0114 */  lbu     $t7, 0x0114($s0)           ## 00000114
/* 01698 80B1F018 920C04A9 */  lbu     $t4, 0x04A9($s0)           ## 000004A9
/* 0169C 80B1F01C 318D0002 */  andi    $t5, $t4, 0x0002           ## $t5 = 00000000
/* 016A0 80B1F020 51A00086 */  beql    $t5, $zero, .L80B1F23C     
/* 016A4 80B1F024 920F0114 */  lbu     $t7, 0x0114($s0)           ## 00000114
/* 016A8 80B1F028 8E18067C */  lw      $t8, 0x067C($s0)           ## 0000067C
/* 016AC 80B1F02C 00187940 */  sll     $t7, $t8,  5               
/* 016B0 80B1F030 05E20082 */  bltzl   $t7, .L80B1F23C            
/* 016B4 80B1F034 920F0114 */  lbu     $t7, 0x0114($s0)           ## 00000114
/* 016B8 80B1F038 920A04F4 */  lbu     $t2, 0x04F4($s0)           ## 000004F4
/* 016BC 80B1F03C 31590002 */  andi    $t9, $t2, 0x0002           ## $t9 = 00000000
/* 016C0 80B1F040 5720007E */  bnel    $t9, $zero, .L80B1F23C     
/* 016C4 80B1F044 920F0114 */  lbu     $t7, 0x0114($s0)           ## 00000114
/* 016C8 80B1F048 920E0574 */  lbu     $t6, 0x0574($s0)           ## 00000574
/* 016CC 80B1F04C 31CB0002 */  andi    $t3, $t6, 0x0002           ## $t3 = 00000000
/* 016D0 80B1F050 5560007A */  bnel    $t3, $zero, .L80B1F23C     
/* 016D4 80B1F054 920F0114 */  lbu     $t7, 0x0114($s0)           ## 00000114
/* 016D8 80B1F058 0C00D58A */  jal     Actor_ApplyDamage
              
/* 016DC 80B1F05C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 016E0 80B1F060 14400026 */  bne     $v0, $zero, .L80B1F0FC     
/* 016E4 80B1F064 00000000 */  nop
/* 016E8 80B1F068 0C03D6D6 */  jal     func_800F5B58              
/* 016EC 80B1F06C 00000000 */  nop
/* 016F0 80B1F070 8E0C0004 */  lw      $t4, 0x0004($s0)           ## 00000004
/* 016F4 80B1F074 3C0140C0 */  lui     $at, 0x40C0                ## $at = 40C00000
/* 016F8 80B1F078 44810000 */  mtc1    $at, $f0                   ## $f0 = 6.00
/* 016FC 80B1F07C 860F008A */  lh      $t7, 0x008A($s0)           ## 0000008A
/* 01700 80B1F080 2401FFFA */  addiu   $at, $zero, 0xFFFA         ## $at = FFFFFFFA
/* 01704 80B1F084 921800B0 */  lbu     $t8, 0x00B0($s0)           ## 000000B0
/* 01708 80B1F088 01816824 */  and     $t5, $t4, $at              
/* 0170C 80B1F08C 34018000 */  ori     $at, $zero, 0x8000         ## $at = 00008000
/* 01710 80B1F090 3C0280B2 */  lui     $v0, %hi(sDeathFlag)       ## $v0 = 80B20000
/* 01714 80B1F094 24030002 */  addiu   $v1, $zero, 0x0002         ## $v1 = 00000002
/* 01718 80B1F098 01E15021 */  addu    $t2, $t7, $at              
/* 0171C 80B1F09C 2442FA04 */  addiu   $v0, $v0, %lo(sDeathFlag)  ## $v0 = 80B1FA04
/* 01720 80B1F0A0 AE0D0004 */  sw      $t5, 0x0004($s0)           ## 00000004
/* 01724 80B1F0A4 A20308A1 */  sb      $v1, 0x08A1($s0)           ## 000008A1
/* 01728 80B1F0A8 A60A08A2 */  sh      $t2, 0x08A2($s0)           ## 000008A2
/* 0172C 80B1F0AC E60008A4 */  swc1    $f0, 0x08A4($s0)           ## 000008A4
/* 01730 80B1F0B0 E60008A8 */  swc1    $f0, 0x08A8($s0)           ## 000008A8
/* 01734 80B1F0B4 A21808A0 */  sb      $t8, 0x08A0($s0)           ## 000008A0
/* 01738 80B1F0B8 90590000 */  lbu     $t9, 0x0000($v0)           ## 80B1FA04
/* 0173C 80B1F0BC 3C0180B2 */  lui     $at, %hi(sActionState)       ## $at = 80B20000
/* 01740 80B1F0C0 8FA40084 */  lw      $a0, 0x0084($sp)           
/* 01744 80B1F0C4 272E0001 */  addiu   $t6, $t9, 0x0001           ## $t6 = 00000001
/* 01748 80B1F0C8 A04E0000 */  sb      $t6, 0x0000($v0)           ## 80B1FA04
/* 0174C 80B1F0CC A023015E */  sb      $v1, %lo(sActionState)($at)  
/* 01750 80B1F0D0 0C00CB1F */  jal     func_80032C7C              
/* 01754 80B1F0D4 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 01758 80B1F0D8 8FA40084 */  lw      $a0, 0x0084($sp)           
/* 0175C 80B1F0DC 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 01760 80B1F0E0 8FA60034 */  lw      $a2, 0x0034($sp)           
/* 01764 80B1F0E4 0C007E50 */  jal     Item_DropCollectibleRandom
              
/* 01768 80B1F0E8 240700C0 */  addiu   $a3, $zero, 0x00C0         ## $a3 = 000000C0
/* 0176C 80B1F0EC 920B0692 */  lbu     $t3, 0x0692($s0)           ## 00000692
/* 01770 80B1F0F0 316CFFFB */  andi    $t4, $t3, 0xFFFB           ## $t4 = 00000000
/* 01774 80B1F0F4 1000004E */  beq     $zero, $zero, .L80B1F230   
/* 01778 80B1F0F8 A20C0692 */  sb      $t4, 0x0692($s0)           ## 00000692
.L80B1F0FC:
/* 0177C 80B1F0FC 0C03D6B3 */  jal     func_800F5ACC              
/* 01780 80B1F100 24040038 */  addiu   $a0, $zero, 0x0038         ## $a0 = 00000038
/* 01784 80B1F104 920D00B1 */  lbu     $t5, 0x00B1($s0)           ## 000000B1
/* 01788 80B1F108 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 0178C 80B1F10C 240C0001 */  addiu   $t4, $zero, 0x0001         ## $t4 = 00000001
/* 01790 80B1F110 15A10017 */  bne     $t5, $at, .L80B1F170       
/* 01794 80B1F114 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01798 80B1F118 3C1880B2 */  lui     $t8, %hi(sAlpha)       ## $t8 = 80B20000
/* 0179C 80B1F11C 93180165 */  lbu     $t8, %lo(sAlpha)($t8)  
/* 017A0 80B1F120 240100FF */  addiu   $at, $zero, 0x00FF         ## $at = 000000FF
/* 017A4 80B1F124 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 017A8 80B1F128 1701000A */  bne     $t8, $at, .L80B1F154       
/* 017AC 80B1F12C 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 017B0 80B1F130 240F0050 */  addiu   $t7, $zero, 0x0050         ## $t7 = 00000050
/* 017B4 80B1F134 AFAF0010 */  sw      $t7, 0x0010($sp)           
/* 017B8 80B1F138 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 017BC 80B1F13C 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 017C0 80B1F140 240600FF */  addiu   $a2, $zero, 0x00FF         ## $a2 = 000000FF
/* 017C4 80B1F144 0C00D09B */  jal     func_8003426C              
/* 017C8 80B1F148 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 017CC 80B1F14C 10000039 */  beq     $zero, $zero, .L80B1F234   
/* 017D0 80B1F150 A20000B0 */  sb      $zero, 0x00B0($s0)         ## 000000B0
.L80B1F154:
/* 017D4 80B1F154 240A0050 */  addiu   $t2, $zero, 0x0050         ## $t2 = 00000050
/* 017D8 80B1F158 AFAA0010 */  sw      $t2, 0x0010($sp)           
/* 017DC 80B1F15C 240600FF */  addiu   $a2, $zero, 0x00FF         ## $a2 = 000000FF
/* 017E0 80B1F160 0C00D09B */  jal     func_8003426C              
/* 017E4 80B1F164 24072000 */  addiu   $a3, $zero, 0x2000         ## $a3 = 00002000
/* 017E8 80B1F168 10000032 */  beq     $zero, $zero, .L80B1F234   
/* 017EC 80B1F16C A20000B0 */  sb      $zero, 0x00B0($s0)         ## 000000B0
.L80B1F170:
/* 017F0 80B1F170 8E190004 */  lw      $t9, 0x0004($s0)           ## 00000004
/* 017F4 80B1F174 3C0140C0 */  lui     $at, 0x40C0                ## $at = 40C00000
/* 017F8 80B1F178 44810000 */  mtc1    $at, $f0                   ## $f0 = 6.00
/* 017FC 80B1F17C 2401FFFE */  addiu   $at, $zero, 0xFFFE         ## $at = FFFFFFFE
/* 01800 80B1F180 03217024 */  and     $t6, $t9, $at              
/* 01804 80B1F184 860D008A */  lh      $t5, 0x008A($s0)           ## 0000008A
/* 01808 80B1F188 3C014100 */  lui     $at, 0x4100                ## $at = 41000000
/* 0180C 80B1F18C 44818000 */  mtc1    $at, $f16                  ## $f16 = 8.00
/* 01810 80B1F190 920B00B0 */  lbu     $t3, 0x00B0($s0)           ## 000000B0
/* 01814 80B1F194 34018000 */  ori     $at, $zero, 0x8000         ## $at = 00008000
/* 01818 80B1F198 01A1C021 */  addu    $t8, $t5, $at              
/* 0181C 80B1F19C AE0E0004 */  sw      $t6, 0x0004($s0)           ## 00000004
/* 01820 80B1F1A0 A20C08A1 */  sb      $t4, 0x08A1($s0)           ## 000008A1
/* 01824 80B1F1A4 A61808A2 */  sh      $t8, 0x08A2($s0)           ## 000008A2
/* 01828 80B1F1A8 260504B0 */  addiu   $a1, $s0, 0x04B0           ## $a1 = 000004B0
/* 0182C 80B1F1AC 24060001 */  addiu   $a2, $zero, 0x0001         ## $a2 = 00000001
/* 01830 80B1F1B0 E60008A8 */  swc1    $f0, 0x08A8($s0)           ## 000008A8
/* 01834 80B1F1B4 A20B08A0 */  sb      $t3, 0x08A0($s0)           ## 000008A0
/* 01838 80B1F1B8 0C00D594 */  jal     func_80035650              
/* 0183C 80B1F1BC E61008A4 */  swc1    $f16, 0x08A4($s0)          ## 000008A4
/* 01840 80B1F1C0 920F0692 */  lbu     $t7, 0x0692($s0)           ## 00000692
/* 01844 80B1F1C4 3C0C80B2 */  lui     $t4, %hi(sAlpha)       ## $t4 = 80B20000
/* 01848 80B1F1C8 240B0003 */  addiu   $t3, $zero, 0x0003         ## $t3 = 00000003
/* 0184C 80B1F1CC 31F9FFFB */  andi    $t9, $t7, 0xFFFB           ## $t9 = 00000000
/* 01850 80B1F1D0 A2190692 */  sb      $t9, 0x0692($s0)           ## 00000692
/* 01854 80B1F1D4 372E0001 */  ori     $t6, $t9, 0x0001           ## $t6 = 00000001
/* 01858 80B1F1D8 A20E0692 */  sb      $t6, 0x0692($s0)           ## 00000692
/* 0185C 80B1F1DC 918C0165 */  lbu     $t4, %lo(sAlpha)($t4)  
/* 01860 80B1F1E0 3C0180B2 */  lui     $at, %hi(sActionState)       ## $at = 80B20000
/* 01864 80B1F1E4 A02B015E */  sb      $t3, %lo(sActionState)($at)  
/* 01868 80B1F1E8 240100FF */  addiu   $at, $zero, 0x00FF         ## $at = 000000FF
/* 0186C 80B1F1EC 1581000A */  bne     $t4, $at, .L80B1F218       
/* 01870 80B1F1F0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01874 80B1F1F4 240D000C */  addiu   $t5, $zero, 0x000C         ## $t5 = 0000000C
/* 01878 80B1F1F8 AFAD0010 */  sw      $t5, 0x0010($sp)           
/* 0187C 80B1F1FC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01880 80B1F200 24054000 */  addiu   $a1, $zero, 0x4000         ## $a1 = 00004000
/* 01884 80B1F204 240600FF */  addiu   $a2, $zero, 0x00FF         ## $a2 = 000000FF
/* 01888 80B1F208 0C00D09B */  jal     func_8003426C              
/* 0188C 80B1F20C 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 01890 80B1F210 10000008 */  beq     $zero, $zero, .L80B1F234   
/* 01894 80B1F214 A20000B0 */  sb      $zero, 0x00B0($s0)         ## 000000B0
.L80B1F218:
/* 01898 80B1F218 2418000C */  addiu   $t8, $zero, 0x000C         ## $t8 = 0000000C
/* 0189C 80B1F21C AFB80010 */  sw      $t8, 0x0010($sp)           
/* 018A0 80B1F220 24054000 */  addiu   $a1, $zero, 0x4000         ## $a1 = 00004000
/* 018A4 80B1F224 240600FF */  addiu   $a2, $zero, 0x00FF         ## $a2 = 000000FF
/* 018A8 80B1F228 0C00D09B */  jal     func_8003426C              
/* 018AC 80B1F22C 24072000 */  addiu   $a3, $zero, 0x2000         ## $a3 = 00002000
.L80B1F230:
/* 018B0 80B1F230 A20000B0 */  sb      $zero, 0x00B0($s0)         ## 000000B0
.L80B1F234:
/* 018B4 80B1F234 A20008A0 */  sb      $zero, 0x08A0($s0)         ## 000008A0
/* 018B8 80B1F238 920F0114 */  lbu     $t7, 0x0114($s0)           ## 00000114
.L80B1F23C:
/* 018BC 80B1F23C 51E00008 */  beql    $t7, $zero, .L80B1F260     
/* 018C0 80B1F240 920E0692 */  lbu     $t6, 0x0692($s0)           ## 00000692
/* 018C4 80B1F244 960A0112 */  lhu     $t2, 0x0112($s0)           ## 00000112
/* 018C8 80B1F248 3C01FBFF */  lui     $at, 0xFBFF                ## $at = FBFF0000
/* 018CC 80B1F24C 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = FBFFFFFF
/* 018D0 80B1F250 31594000 */  andi    $t9, $t2, 0x4000           ## $t9 = 00000000
/* 018D4 80B1F254 53200006 */  beql    $t9, $zero, .L80B1F270     
/* 018D8 80B1F258 8E18067C */  lw      $t8, 0x067C($s0)           ## 0000067C
/* 018DC 80B1F25C 920E0692 */  lbu     $t6, 0x0692($s0)           ## 00000692
.L80B1F260:
/* 018E0 80B1F260 31CBFFFB */  andi    $t3, $t6, 0xFFFB           ## $t3 = 00000000
/* 018E4 80B1F264 10000011 */  beq     $zero, $zero, .L80B1F2AC   
/* 018E8 80B1F268 A20B0692 */  sb      $t3, 0x0692($s0)           ## 00000692
/* 018EC 80B1F26C 8E18067C */  lw      $t8, 0x067C($s0)           ## 0000067C
.L80B1F270:
/* 018F0 80B1F270 920C0692 */  lbu     $t4, 0x0692($s0)           ## 00000692
/* 018F4 80B1F274 A2000A78 */  sb      $zero, 0x0A78($s0)         ## 00000A78
/* 018F8 80B1F278 03017824 */  and     $t7, $t8, $at              
/* 018FC 80B1F27C 358D0004 */  ori     $t5, $t4, 0x0004           ## $t5 = 00000004
/* 01900 80B1F280 A20D0692 */  sb      $t5, 0x0692($s0)           ## 00000692
/* 01904 80B1F284 AE0F067C */  sw      $t7, 0x067C($s0)           ## 0000067C
/* 01908 80B1F288 3C0180B2 */  lui     $at, %hi(sInput+15)       ## $at = 80B20000
/* 0190C 80B1F28C A020013F */  sb      $zero, %lo(sInput+15)($at) 
/* 01910 80B1F290 A020013E */  sb      $zero, %lo(sInput+14)($at) 
/* 01914 80B1F294 3C0180B2 */  lui     $at, %hi(sInput)       ## $at = 80B20000
/* 01918 80B1F298 44809000 */  mtc1    $zero, $f18                ## $f18 = 0.00
/* 0191C 80B1F29C A4200130 */  sh      $zero, %lo(sInput)($at) 
/* 01920 80B1F2A0 3C0180B2 */  lui     $at, %hi(sInput+12)       ## $at = 80B20000
/* 01924 80B1F2A4 A420013C */  sh      $zero, %lo(sInput+12)($at) 
/* 01928 80B1F2A8 E6120838 */  swc1    $f18, 0x0838($s0)          ## 00000838
.L80B1F2AC:
/* 0192C 80B1F2AC 8FAA002C */  lw      $t2, 0x002C($sp)           
/* 01930 80B1F2B0 3C0680B2 */  lui     $a2, %hi(sInput)       ## $a2 = 80B20000
/* 01934 80B1F2B4 8FA50084 */  lw      $a1, 0x0084($sp)           
/* 01938 80B1F2B8 8D591D40 */  lw      $t9, 0x1D40($t2)           ## 00001D40
/* 0193C 80B1F2BC 24C60130 */  addiu   $a2, $a2, %lo(sInput)  ## $a2 = 80B20130
/* 01940 80B1F2C0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01944 80B1F2C4 0320F809 */  jalr    $ra, $t9                   
/* 01948 80B1F2C8 00000000 */  nop
/* 0194C 80B1F2CC 3C01C190 */  lui     $at, 0xC190                ## $at = C1900000
/* 01950 80B1F2D0 44813000 */  mtc1    $at, $f6                   ## $f6 = -18.00
/* 01954 80B1F2D4 C6080838 */  lwc1    $f8, 0x0838($s0)           ## 00000838
/* 01958 80B1F2D8 3C014000 */  lui     $at, 0x4000                ## $at = 40000000
/* 0195C 80B1F2DC 46083032 */  c.eq.s  $f6, $f8                   
/* 01960 80B1F2E0 00000000 */  nop
/* 01964 80B1F2E4 4502007B */  bc1fl   .L80B1F4D4                 
/* 01968 80B1F2E8 8FA30078 */  lw      $v1, 0x0078($sp)           
/* 0196C 80B1F2EC 44816000 */  mtc1    $at, $f12                  ## $f12 = 2.00
/* 01970 80B1F2F0 0C00CFC8 */  jal     Rand_CenteredFloat
              
/* 01974 80B1F2F4 00000000 */  nop
/* 01978 80B1F2F8 444EF800 */  cfc1    $t6, $31
/* 0197C 80B1F2FC 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
/* 01980 80B1F300 44C2F800 */  ctc1    $v0, $31
/* 01984 80B1F304 3C014F00 */  lui     $at, 0x4F00                ## $at = 4F000000
/* 01988 80B1F308 3C0B8016 */  lui     $t3, %hi(gSaveContext+0x30)
/* 0198C 80B1F30C 46000124 */  cvt.w.s $f4, $f0                   
/* 01990 80B1F310 4442F800 */  cfc1    $v0, $31
/* 01994 80B1F314 00000000 */  nop
/* 01998 80B1F318 30420078 */  andi    $v0, $v0, 0x0078           ## $v0 = 00000000
/* 0199C 80B1F31C 50400013 */  beql    $v0, $zero, .L80B1F36C     
/* 019A0 80B1F320 44022000 */  mfc1    $v0, $f4                   
/* 019A4 80B1F324 44812000 */  mtc1    $at, $f4                   ## $f4 = 2147483648.00
/* 019A8 80B1F328 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
/* 019AC 80B1F32C 46040101 */  sub.s   $f4, $f0, $f4              
/* 019B0 80B1F330 44C2F800 */  ctc1    $v0, $31
/* 019B4 80B1F334 00000000 */  nop
/* 019B8 80B1F338 46002124 */  cvt.w.s $f4, $f4                   
/* 019BC 80B1F33C 4442F800 */  cfc1    $v0, $31
/* 019C0 80B1F340 00000000 */  nop
/* 019C4 80B1F344 30420078 */  andi    $v0, $v0, 0x0078           ## $v0 = 00000000
/* 019C8 80B1F348 14400005 */  bne     $v0, $zero, .L80B1F360     
/* 019CC 80B1F34C 00000000 */  nop
/* 019D0 80B1F350 44022000 */  mfc1    $v0, $f4                   
/* 019D4 80B1F354 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 019D8 80B1F358 10000007 */  beq     $zero, $zero, .L80B1F378   
/* 019DC 80B1F35C 00411025 */  or      $v0, $v0, $at              ## $v0 = 80000000
.L80B1F360:
/* 019E0 80B1F360 10000005 */  beq     $zero, $zero, .L80B1F378   
/* 019E4 80B1F364 2402FFFF */  addiu   $v0, $zero, 0xFFFF         ## $v0 = FFFFFFFF
/* 019E8 80B1F368 44022000 */  mfc1    $v0, $f4                   
.L80B1F36C:
/* 019EC 80B1F36C 00000000 */  nop
/* 019F0 80B1F370 0440FFFB */  bltz    $v0, .L80B1F360            
/* 019F4 80B1F374 00000000 */  nop
.L80B1F378:
/* 019F8 80B1F378 856BE690 */  lh      $t3, %lo(gSaveContext+0x30)($t3)
/* 019FC 80B1F37C 44CEF800 */  ctc1    $t6, $31
/* 01A00 80B1F380 24420006 */  addiu   $v0, $v0, 0x0006           ## $v0 = 00000005
/* 01A04 80B1F384 29610050 */  slti    $at, $t3, 0x0050           
/* 01A08 80B1F388 10200027 */  beq     $at, $zero, .L80B1F428     
/* 01A0C 80B1F38C 304200FF */  andi    $v0, $v0, 0x00FF           ## $v0 = 00000005
/* 01A10 80B1F390 3C014000 */  lui     $at, 0x4000                ## $at = 40000000
/* 01A14 80B1F394 44816000 */  mtc1    $at, $f12                  ## $f12 = 2.00
/* 01A18 80B1F398 0C00CFC8 */  jal     Rand_CenteredFloat
              
/* 01A1C 80B1F39C 00000000 */  nop
/* 01A20 80B1F3A0 444CF800 */  cfc1    $t4, $31
/* 01A24 80B1F3A4 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
/* 01A28 80B1F3A8 44C2F800 */  ctc1    $v0, $31
/* 01A2C 80B1F3AC 3C014F00 */  lui     $at, 0x4F00                ## $at = 4F000000
/* 01A30 80B1F3B0 460002A4 */  cvt.w.s $f10, $f0                  
/* 01A34 80B1F3B4 4442F800 */  cfc1    $v0, $31
/* 01A38 80B1F3B8 00000000 */  nop
/* 01A3C 80B1F3BC 30420078 */  andi    $v0, $v0, 0x0078           ## $v0 = 00000000
/* 01A40 80B1F3C0 50400013 */  beql    $v0, $zero, .L80B1F410     
/* 01A44 80B1F3C4 44025000 */  mfc1    $v0, $f10                  
/* 01A48 80B1F3C8 44815000 */  mtc1    $at, $f10                  ## $f10 = 2147483648.00
/* 01A4C 80B1F3CC 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
/* 01A50 80B1F3D0 460A0281 */  sub.s   $f10, $f0, $f10            
/* 01A54 80B1F3D4 44C2F800 */  ctc1    $v0, $31
/* 01A58 80B1F3D8 00000000 */  nop
/* 01A5C 80B1F3DC 460052A4 */  cvt.w.s $f10, $f10                 
/* 01A60 80B1F3E0 4442F800 */  cfc1    $v0, $31
/* 01A64 80B1F3E4 00000000 */  nop
/* 01A68 80B1F3E8 30420078 */  andi    $v0, $v0, 0x0078           ## $v0 = 00000000
/* 01A6C 80B1F3EC 14400005 */  bne     $v0, $zero, .L80B1F404     
/* 01A70 80B1F3F0 00000000 */  nop
/* 01A74 80B1F3F4 44025000 */  mfc1    $v0, $f10                  
/* 01A78 80B1F3F8 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 01A7C 80B1F3FC 10000007 */  beq     $zero, $zero, .L80B1F41C   
/* 01A80 80B1F400 00411025 */  or      $v0, $v0, $at              ## $v0 = 80000000
.L80B1F404:
/* 01A84 80B1F404 10000005 */  beq     $zero, $zero, .L80B1F41C   
/* 01A88 80B1F408 2402FFFF */  addiu   $v0, $zero, 0xFFFF         ## $v0 = FFFFFFFF
/* 01A8C 80B1F40C 44025000 */  mfc1    $v0, $f10                  
.L80B1F410:
/* 01A90 80B1F410 00000000 */  nop
/* 01A94 80B1F414 0440FFFB */  bltz    $v0, .L80B1F404            
/* 01A98 80B1F418 00000000 */  nop
.L80B1F41C:
/* 01A9C 80B1F41C 44CCF800 */  ctc1    $t4, $31
/* 01AA0 80B1F420 24420003 */  addiu   $v0, $v0, 0x0003           ## $v0 = 00000002
/* 01AA4 80B1F424 304200FF */  andi    $v0, $v0, 0x00FF           ## $v0 = 00000002
.L80B1F428:
/* 01AA8 80B1F428 3C0142A0 */  lui     $at, 0x42A0                ## $at = 42A00000
/* 01AAC 80B1F42C 44818000 */  mtc1    $at, $f16                  ## $f16 = 80.00
/* 01AB0 80B1F430 C6000090 */  lwc1    $f0, 0x0090($s0)           ## 00000090
/* 01AB4 80B1F434 3C01428C */  lui     $at, 0x428C                ## $at = 428C0000
/* 01AB8 80B1F438 3C0D80B2 */  lui     $t5, %hi(sStaggerCount)       ## $t5 = 80B20000
/* 01ABC 80B1F43C 4600803C */  c.lt.s  $f16, $f0                  
/* 01AC0 80B1F440 00000000 */  nop
/* 01AC4 80B1F444 45020006 */  bc1fl   .L80B1F460                 
/* 01AC8 80B1F448 44813000 */  mtc1    $at, $f6                   ## $f6 = 70.00
/* 01ACC 80B1F44C 3C0180B2 */  lui     $at, %hi(D_80B1FA60)       ## $at = 80B20000
/* 01AD0 80B1F450 C432FA60 */  lwc1    $f18, %lo(D_80B1FA60)($at) 
/* 01AD4 80B1F454 1000000E */  beq     $zero, $zero, .L80B1F490   
/* 01AD8 80B1F458 E6120838 */  swc1    $f18, 0x0838($s0)          ## 00000838
/* 01ADC 80B1F45C 44813000 */  mtc1    $at, $f6                   ## $f6 = -0.00
.L80B1F460:
/* 01AE0 80B1F460 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 01AE4 80B1F464 4606003C */  c.lt.s  $f0, $f6                   
/* 01AE8 80B1F468 00000000 */  nop
/* 01AEC 80B1F46C 45020006 */  bc1fl   .L80B1F488                 
/* 01AF0 80B1F470 44812000 */  mtc1    $at, $f4                   ## $f4 = 1.00
/* 01AF4 80B1F474 3C01BFC0 */  lui     $at, 0xBFC0                ## $at = BFC00000
/* 01AF8 80B1F478 44814000 */  mtc1    $at, $f8                   ## $f8 = -1.50
/* 01AFC 80B1F47C 10000004 */  beq     $zero, $zero, .L80B1F490   
/* 01B00 80B1F480 E6080838 */  swc1    $f8, 0x0838($s0)           ## 00000838
/* 01B04 80B1F484 44812000 */  mtc1    $at, $f4                   ## $f4 = -1.50
.L80B1F488:
/* 01B08 80B1F488 00000000 */  nop
/* 01B0C 80B1F48C E6040838 */  swc1    $f4, 0x0838($s0)           ## 00000838
.L80B1F490:
/* 01B10 80B1F490 91AD0162 */  lbu     $t5, %lo(sStaggerCount)($t5)  
/* 01B14 80B1F494 004D082A */  slt     $at, $v0, $t5              
/* 01B18 80B1F498 1020000D */  beq     $at, $zero, .L80B1F4D0     
/* 01B1C 80B1F49C 3C0180B2 */  lui     $at, %hi(D_80B1FA64)       ## $at = 80B20000
/* 01B20 80B1F4A0 C430FA64 */  lwc1    $f16, %lo(D_80B1FA64)($at) 
/* 01B24 80B1F4A4 C60A01D0 */  lwc1    $f10, 0x01D0($s0)          ## 000001D0
/* 01B28 80B1F4A8 260400E4 */  addiu   $a0, $s0, 0x00E4           ## $a0 = 000000E4
/* 01B2C 80B1F4AC 2405083F */  addiu   $a1, $zero, 0x083F         ## $a1 = 0000083F
/* 01B30 80B1F4B0 46105482 */  mul.s   $f18, $f10, $f16           
/* 01B34 80B1F4B4 0C03D064 */  jal     func_800F4190              
/* 01B38 80B1F4B8 E61201D0 */  swc1    $f18, 0x01D0($s0)          ## 000001D0
/* 01B3C 80B1F4BC 3C0780B2 */  lui     $a3, %hi(sStaggerTimer)       ## $a3 = 80B20000
/* 01B40 80B1F4C0 24E70163 */  addiu   $a3, $a3, %lo(sStaggerTimer)  ## $a3 = 80B20163
/* 01B44 80B1F4C4 A0E00000 */  sb      $zero, 0x0000($a3)         ## 80B20163
/* 01B48 80B1F4C8 3C0180B2 */  lui     $at, %hi(sStaggerCount)       ## $at = 80B20000
/* 01B4C 80B1F4CC A0200162 */  sb      $zero, %lo(sStaggerCount)($at) 
.L80B1F4D0:
/* 01B50 80B1F4D0 8FA30078 */  lw      $v1, 0x0078($sp)           
.L80B1F4D4:
/* 01B54 80B1F4D4 3C01C190 */  lui     $at, 0xC190                ## $at = C1900000
/* 01B58 80B1F4D8 44813000 */  mtc1    $at, $f6                   ## $f6 = -18.00
/* 01B5C 80B1F4DC C4680838 */  lwc1    $f8, 0x0838($v1)           ## 00000838
/* 01B60 80B1F4E0 3C0780B2 */  lui     $a3, %hi(sStaggerTimer)       ## $a3 = 80B20000
/* 01B64 80B1F4E4 3C0680B2 */  lui     $a2, %hi(sCounterState)       ## $a2 = 80B20000
/* 01B68 80B1F4E8 46083032 */  c.eq.s  $f6, $f8                   
/* 01B6C 80B1F4EC 24E70163 */  addiu   $a3, $a3, %lo(sStaggerTimer)  ## $a3 = 80B20163
/* 01B70 80B1F4F0 3C0142A0 */  lui     $at, 0x42A0                ## $at = 42A00000
/* 01B74 80B1F4F4 24C60160 */  addiu   $a2, $a2, %lo(sCounterState)  ## $a2 = 80B20160
/* 01B78 80B1F4F8 4502001A */  bc1fl   .L80B1F564                 
/* 01B7C 80B1F4FC 90C20000 */  lbu     $v0, 0x0000($a2)           ## 80B20160
/* 01B80 80B1F500 C6000090 */  lwc1    $f0, 0x0090($s0)           ## 00000090
/* 01B84 80B1F504 44812000 */  mtc1    $at, $f4                   ## $f4 = 80.00
/* 01B88 80B1F508 3C01428C */  lui     $at, 0x428C                ## $at = 428C0000
/* 01B8C 80B1F50C 4600203C */  c.lt.s  $f4, $f0                   
/* 01B90 80B1F510 00000000 */  nop
/* 01B94 80B1F514 45020006 */  bc1fl   .L80B1F530                 
/* 01B98 80B1F518 44818000 */  mtc1    $at, $f16                  ## $f16 = 70.00
/* 01B9C 80B1F51C 3C0180B2 */  lui     $at, %hi(D_80B1FA68)       ## $at = 80B20000
/* 01BA0 80B1F520 C42AFA68 */  lwc1    $f10, %lo(D_80B1FA68)($at) 
/* 01BA4 80B1F524 1000000E */  beq     $zero, $zero, .L80B1F560   
/* 01BA8 80B1F528 E46A0838 */  swc1    $f10, 0x0838($v1)          ## 00000838
/* 01BAC 80B1F52C 44818000 */  mtc1    $at, $f16                  ## $f16 = -0.00
.L80B1F530:
/* 01BB0 80B1F530 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 01BB4 80B1F534 4610003C */  c.lt.s  $f0, $f16                  
/* 01BB8 80B1F538 00000000 */  nop
/* 01BBC 80B1F53C 45020006 */  bc1fl   .L80B1F558                 
/* 01BC0 80B1F540 44813000 */  mtc1    $at, $f6                   ## $f6 = 1.00
/* 01BC4 80B1F544 3C01BFC0 */  lui     $at, 0xBFC0                ## $at = BFC00000
/* 01BC8 80B1F548 44819000 */  mtc1    $at, $f18                  ## $f18 = -1.50
/* 01BCC 80B1F54C 10000004 */  beq     $zero, $zero, .L80B1F560   
/* 01BD0 80B1F550 E4720838 */  swc1    $f18, 0x0838($v1)          ## 00000838
/* 01BD4 80B1F554 44813000 */  mtc1    $at, $f6                   ## $f6 = -1.50
.L80B1F558:
/* 01BD8 80B1F558 00000000 */  nop
/* 01BDC 80B1F55C E4660838 */  swc1    $f6, 0x0838($v1)           ## 00000838
.L80B1F560:
/* 01BE0 80B1F560 90C20000 */  lbu     $v0, 0x0000($a2)           ## 80B20160
.L80B1F564:
/* 01BE4 80B1F564 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 01BE8 80B1F568 50400024 */  beql    $v0, $zero, .L80B1F5FC     
/* 01BEC 80B1F56C 90E20000 */  lbu     $v0, 0x0000($a3)           ## 80B20163
/* 01BF0 80B1F570 54410022 */  bnel    $v0, $at, .L80B1F5FC       
/* 01BF4 80B1F574 90E20000 */  lbu     $v0, 0x0000($a3)           ## 80B20163
/* 01BF8 80B1F578 82180843 */  lb      $t8, 0x0843($s0)           ## 00000843
/* 01BFC 80B1F57C 240F0002 */  addiu   $t7, $zero, 0x0002         ## $t7 = 00000002
/* 01C00 80B1F580 240A0001 */  addiu   $t2, $zero, 0x0001         ## $t2 = 00000001
/* 01C04 80B1F584 57000004 */  bnel    $t8, $zero, .L80B1F598     
/* 01C08 80B1F588 A0CF0000 */  sb      $t7, 0x0000($a2)           ## 80B20160
/* 01C0C 80B1F58C 1000001A */  beq     $zero, $zero, .L80B1F5F8   
/* 01C10 80B1F590 A0C00000 */  sb      $zero, 0x0000($a2)         ## 80B20160
/* 01C14 80B1F594 A0CF0000 */  sb      $t7, 0x0000($a2)           ## 80B20160
.L80B1F598:
/* 01C18 80B1F598 A20A0843 */  sb      $t2, 0x0843($s0)           ## 00000843
/* 01C1C 80B1F59C C46401D0 */  lwc1    $f4, 0x01D0($v1)           ## 000001D0
/* 01C20 80B1F5A0 C46801CC */  lwc1    $f8, 0x01CC($v1)           ## 000001CC
/* 01C24 80B1F5A4 26190564 */  addiu   $t9, $s0, 0x0564           ## $t9 = 00000564
/* 01C28 80B1F5A8 260E04E4 */  addiu   $t6, $s0, 0x04E4           ## $t6 = 000004E4
/* 01C2C 80B1F5AC 46044281 */  sub.s   $f10, $f8, $f4             
/* 01C30 80B1F5B0 260501B4 */  addiu   $a1, $s0, 0x01B4           ## $a1 = 000001B4
/* 01C34 80B1F5B4 E60A01CC */  swc1    $f10, 0x01CC($s0)          ## 000001CC
/* 01C38 80B1F5B8 C47001D0 */  lwc1    $f16, 0x01D0($v1)          ## 000001D0
/* 01C3C 80B1F5BC E61001D0 */  swc1    $f16, 0x01D0($s0)          ## 000001D0
/* 01C40 80B1F5C0 AFAE0030 */  sw      $t6, 0x0030($sp)           
/* 01C44 80B1F5C4 AFB90038 */  sw      $t9, 0x0038($sp)           
/* 01C48 80B1F5C8 0C028EF0 */  jal     LinkAnimation_Update              
/* 01C4C 80B1F5CC 8FA40084 */  lw      $a0, 0x0084($sp)           
/* 01C50 80B1F5D0 8FA40084 */  lw      $a0, 0x0084($sp)           
/* 01C54 80B1F5D4 0C017458 */  jal     Collider_ResetQuadAT              
/* 01C58 80B1F5D8 8FA50030 */  lw      $a1, 0x0030($sp)           
/* 01C5C 80B1F5DC 8FA40084 */  lw      $a0, 0x0084($sp)           
/* 01C60 80B1F5E0 0C017458 */  jal     Collider_ResetQuadAT              
/* 01C64 80B1F5E4 8FA50038 */  lw      $a1, 0x0038($sp)           
/* 01C68 80B1F5E8 3C0780B2 */  lui     $a3, %hi(sStaggerTimer)       ## $a3 = 80B20000
/* 01C6C 80B1F5EC 3C0680B2 */  lui     $a2, %hi(sCounterState)       ## $a2 = 80B20000
/* 01C70 80B1F5F0 24C60160 */  addiu   $a2, $a2, %lo(sCounterState)  ## $a2 = 80B20160
/* 01C74 80B1F5F4 24E70163 */  addiu   $a3, $a3, %lo(sStaggerTimer)  ## $a3 = 80B20163
.L80B1F5F8:
/* 01C78 80B1F5F8 90E20000 */  lbu     $v0, 0x0000($a3)           ## 80B20163
.L80B1F5FC:
/* 01C7C 80B1F5FC 3C0380B2 */  lui     $v1, %hi(sDodgeRollState)       ## $v1 = 80B20000
/* 01C80 80B1F600 24630161 */  addiu   $v1, $v1, %lo(sDodgeRollState)  ## $v1 = 80B20161
/* 01C84 80B1F604 10400007 */  beq     $v0, $zero, .L80B1F624     
/* 01C88 80B1F608 244BFFFF */  addiu   $t3, $v0, 0xFFFF           ## $t3 = FFFFFFFF
/* 01C8C 80B1F60C 316C00FF */  andi    $t4, $t3, 0x00FF           ## $t4 = 000000FF
/* 01C90 80B1F610 15800004 */  bne     $t4, $zero, .L80B1F624     
/* 01C94 80B1F614 A0EB0000 */  sb      $t3, 0x0000($a3)           ## 80B20163
/* 01C98 80B1F618 A0C00000 */  sb      $zero, 0x0000($a2)         ## 80B20160
/* 01C9C 80B1F61C 3C0180B2 */  lui     $at, %hi(sStaggerCount)       ## $at = 80B20000
/* 01CA0 80B1F620 A0200162 */  sb      $zero, %lo(sStaggerCount)($at) 
.L80B1F624:
/* 01CA4 80B1F624 90620000 */  lbu     $v0, 0x0000($v1)           ## 80B20161
/* 01CA8 80B1F628 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 01CAC 80B1F62C 240B0005 */  addiu   $t3, $zero, 0x0005         ## $t3 = 00000005
/* 01CB0 80B1F630 1040000B */  beq     $v0, $zero, .L80B1F660     
/* 01CB4 80B1F634 240C0001 */  addiu   $t4, $zero, 0x0001         ## $t4 = 00000001
/* 01CB8 80B1F638 14410002 */  bne     $v0, $at, .L80B1F644       
/* 01CBC 80B1F63C 240D0014 */  addiu   $t5, $zero, 0x0014         ## $t5 = 00000014
/* 01CC0 80B1F640 A20D0A78 */  sb      $t5, 0x0A78($s0)           ## 00000A78
.L80B1F644:
/* 01CC4 80B1F644 82180A78 */  lb      $t8, 0x0A78($s0)           ## 00000A78
/* 01CC8 80B1F648 240F0002 */  addiu   $t7, $zero, 0x0002         ## $t7 = 00000002
/* 01CCC 80B1F64C 5B000004 */  blezl   $t8, .L80B1F660            
/* 01CD0 80B1F650 A0600000 */  sb      $zero, 0x0000($v1)         ## 80B20161
/* 01CD4 80B1F654 10000002 */  beq     $zero, $zero, .L80B1F660   
/* 01CD8 80B1F658 A06F0000 */  sb      $t7, 0x0000($v1)           ## 80B20161
/* 01CDC 80B1F65C A0600000 */  sb      $zero, 0x0000($v1)         ## 80B20161
.L80B1F660:
/* 01CE0 80B1F660 820A0A78 */  lb      $t2, 0x0A78($s0)           ## 00000A78
/* 01CE4 80B1F664 2419000A */  addiu   $t9, $zero, 0x000A         ## $t9 = 0000000A
/* 01CE8 80B1F668 240E0005 */  addiu   $t6, $zero, 0x0005         ## $t6 = 00000005
/* 01CEC 80B1F66C 11400004 */  beq     $t2, $zero, .L80B1F680     
/* 01CF0 80B1F670 3C0D80B2 */  lui     $t5, %hi(sSwordJumpState)       ## $t5 = 80B20000
/* 01CF4 80B1F674 A21904AC */  sb      $t9, 0x04AC($s0)           ## 000004AC
/* 01CF8 80B1F678 10000003 */  beq     $zero, $zero, .L80B1F688   
/* 01CFC 80B1F67C A20E04C4 */  sb      $t6, 0x04C4($s0)           ## 000004C4
.L80B1F680:
/* 01D00 80B1F680 A20B04AC */  sb      $t3, 0x04AC($s0)           ## 000004AC
/* 01D04 80B1F684 A20C04C4 */  sb      $t4, 0x04C4($s0)           ## 000004C4
.L80B1F688:
/* 01D08 80B1F688 91AD0148 */  lbu     $t5, %lo(sSwordJumpState)($t5)  
/* 01D0C 80B1F68C 3C0380B2 */  lui     $v1, %hi(sSwordJumpHeight)       ## $v1 = 80B20000
/* 01D10 80B1F690 3C0480B2 */  lui     $a0, %hi(sSwordJumpHeight)       ## $a0 = 80B20000
/* 01D14 80B1F694 11A00011 */  beq     $t5, $zero, .L80B1F6DC     
/* 01D18 80B1F698 2463F9F8 */  addiu   $v1, $v1, %lo(sSwordJumpHeight)  ## $v1 = 80B1F9F8
/* 01D1C 80B1F69C 44809000 */  mtc1    $zero, $f18                ## $f18 = 0.00
/* 01D20 80B1F6A0 3C054524 */  lui     $a1, 0x4524                ## $a1 = 45240000
/* 01D24 80B1F6A4 34A56000 */  ori     $a1, $a1, 0x6000           ## $a1 = 45246000
/* 01D28 80B1F6A8 2484F9F8 */  addiu   $a0, $a0, %lo(sSwordJumpHeight)  ## $a0 = 80B1F9F8
/* 01D2C 80B1F6AC 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 01D30 80B1F6B0 3C0744FA */  lui     $a3, 0x44FA                ## $a3 = 44FA0000
/* 01D34 80B1F6B4 0C01E0C4 */  jal     Math_SmoothStepToF
              
/* 01D38 80B1F6B8 E7B20010 */  swc1    $f18, 0x0010($sp)          
/* 01D3C 80B1F6BC 3C0180B2 */  lui     $at, %hi(D_80B1FA6C)       ## $at = 80B20000
/* 01D40 80B1F6C0 C428FA6C */  lwc1    $f8, %lo(D_80B1FA6C)($at)  
/* 01D44 80B1F6C4 C6060060 */  lwc1    $f6, 0x0060($s0)           ## 00000060
/* 01D48 80B1F6C8 3C0380B2 */  lui     $v1, %hi(sSwordJumpHeight)       ## $v1 = 80B20000
/* 01D4C 80B1F6CC 2463F9F8 */  addiu   $v1, $v1, %lo(sSwordJumpHeight)  ## $v1 = 80B1F9F8
/* 01D50 80B1F6D0 46083101 */  sub.s   $f4, $f6, $f8              
/* 01D54 80B1F6D4 1000000F */  beq     $zero, $zero, .L80B1F714   
/* 01D58 80B1F6D8 E6040060 */  swc1    $f4, 0x0060($s0)           ## 00000060
.L80B1F6DC:
/* 01D5C 80B1F6DC C4600000 */  lwc1    $f0, 0x0000($v1)           ## 80B1F9F8
/* 01D60 80B1F6E0 44805000 */  mtc1    $zero, $f10                ## $f10 = 0.00
/* 01D64 80B1F6E4 3C0180B2 */  lui     $at, %hi(D_80B1FA70)       ## $at = 80B20000
/* 01D68 80B1F6E8 46005032 */  c.eq.s  $f10, $f0                  
/* 01D6C 80B1F6EC 00000000 */  nop
/* 01D70 80B1F6F0 45010008 */  bc1t    .L80B1F714                 
/* 01D74 80B1F6F4 00000000 */  nop
/* 01D78 80B1F6F8 C432FA70 */  lwc1    $f18, %lo(D_80B1FA70)($at) 
/* 01D7C 80B1F6FC C6100028 */  lwc1    $f16, 0x0028($s0)          ## 00000028
/* 01D80 80B1F700 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 01D84 80B1F704 46120182 */  mul.s   $f6, $f0, $f18             
/* 01D88 80B1F708 46068200 */  add.s   $f8, $f16, $f6             
/* 01D8C 80B1F70C E6080028 */  swc1    $f8, 0x0028($s0)           ## 00000028
/* 01D90 80B1F710 E4640000 */  swc1    $f4, 0x0000($v1)           ## 80B1F9F8
.L80B1F714:
/* 01D94 80B1F714 3C1880B2 */  lui     $t8, %hi(sActionState)       ## $t8 = 80B20000
/* 01D98 80B1F718 9318015E */  lbu     $t8, %lo(sActionState)($t8)  
/* 01D9C 80B1F71C 3C0480B2 */  lui     $a0, %hi(sJumpslashTimer)       ## $a0 = 80B20000
/* 01DA0 80B1F720 3C0180B2 */  lui     $at, %hi(sZTargetFlag)       ## $at = 80B20000
/* 01DA4 80B1F724 13000005 */  beq     $t8, $zero, .L80B1F73C     
/* 01DA8 80B1F728 2484015C */  addiu   $a0, $a0, %lo(sJumpslashTimer)  ## $a0 = 80B2015C
/* 01DAC 80B1F72C 820F0A78 */  lb      $t7, 0x0A78($s0)           ## 00000A78
/* 01DB0 80B1F730 240A0001 */  addiu   $t2, $zero, 0x0001         ## $t2 = 00000001
/* 01DB4 80B1F734 05E10003 */  bgez    $t7, .L80B1F744            
/* 01DB8 80B1F738 00000000 */  nop
.L80B1F73C:
/* 01DBC 80B1F73C 10000003 */  beq     $zero, $zero, .L80B1F74C   
/* 01DC0 80B1F740 A020FA00 */  sb      $zero, %lo(sZTargetFlag)($at) 
.L80B1F744:
/* 01DC4 80B1F744 3C0180B2 */  lui     $at, %hi(sZTargetFlag)       ## $at = 80B20000
/* 01DC8 80B1F748 A02AFA00 */  sb      $t2, %lo(sZTargetFlag)($at)  
.L80B1F74C:
/* 01DCC 80B1F74C 90820000 */  lbu     $v0, 0x0000($a0)           ## 80B2015C
/* 01DD0 80B1F750 10400002 */  beq     $v0, $zero, .L80B1F75C     
/* 01DD4 80B1F754 2459FFFF */  addiu   $t9, $v0, 0xFFFF           ## $t9 = FFFFFFFF
/* 01DD8 80B1F758 A0990000 */  sb      $t9, 0x0000($a0)           ## 80B2015C
.L80B1F75C:
/* 01DDC 80B1F75C 8FAE0034 */  lw      $t6, 0x0034($sp)           
/* 01DE0 80B1F760 3C0141A0 */  lui     $at, 0x41A0                ## $at = 41A00000
/* 01DE4 80B1F764 44819000 */  mtc1    $at, $f18                  ## $f18 = 20.00
/* 01DE8 80B1F768 8DCC0000 */  lw      $t4, 0x0000($t6)           ## 00000000
/* 01DEC 80B1F76C AE0C0038 */  sw      $t4, 0x0038($s0)           ## 00000038
/* 01DF0 80B1F770 8DCB0004 */  lw      $t3, 0x0004($t6)           ## 00000004
/* 01DF4 80B1F774 AE0B003C */  sw      $t3, 0x003C($s0)           ## 0000003C
/* 01DF8 80B1F778 C60A003C */  lwc1    $f10, 0x003C($s0)          ## 0000003C
/* 01DFC 80B1F77C 8DCC0008 */  lw      $t4, 0x0008($t6)           ## 00000008
/* 01E00 80B1F780 46125400 */  add.s   $f16, $f10, $f18           
/* 01E04 80B1F784 AE0C0040 */  sw      $t4, 0x0040($s0)           ## 00000040
/* 01E08 80B1F788 E610003C */  swc1    $f16, 0x003C($s0)          ## 0000003C
/* 01E0C 80B1F78C C4660000 */  lwc1    $f6, 0x0000($v1)           ## 80B1F9F8
/* 01E10 80B1F790 E60600BC */  swc1    $f6, 0x00BC($s0)           ## 000000BC
/* 01E14 80B1F794 8FBF0024 */  lw      $ra, 0x0024($sp)           
.L80B1F798:
/* 01E18 80B1F798 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 01E1C 80B1F79C 27BD0080 */  addiu   $sp, $sp, 0x0080           ## $sp = 00000000
/* 01E20 80B1F7A0 03E00008 */  jr      $ra                        
/* 01E24 80B1F7A4 00000000 */  nop
