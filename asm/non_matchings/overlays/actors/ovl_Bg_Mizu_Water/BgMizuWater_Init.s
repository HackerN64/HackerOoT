.rdata
glabel D_808A0580
    .asciz "<コンストラクト>%x %x %x\n"
    .balign 4

.late_rodata
glabel jtbl_808A05F0
.word L8089FAB4
.word L8089FCCC
.word L8089FBFC
.word L8089FC3C
.word L8089FC84

.text
glabel BgMizuWater_Init
/* 0018C 8089FA3C 27BDFFC0 */  addiu   $sp, $sp, 0xFFC0           ## $sp = FFFFFFC0
/* 00190 8089FA40 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 00194 8089FA44 AFB10018 */  sw      $s1, 0x0018($sp)           
/* 00198 8089FA48 AFB00014 */  sw      $s0, 0x0014($sp)           
/* 0019C 8089FA4C 8CAE07C0 */  lw      $t6, 0x07C0($a1)           ## 000007C0
/* 001A0 8089FA50 00A08825 */  or      $s1, $a1, $zero            ## $s1 = 00000000
/* 001A4 8089FA54 3C05808A */  lui     $a1, %hi(D_808A0578)       ## $a1 = 808A0000
/* 001A8 8089FA58 8DCF0028 */  lw      $t7, 0x0028($t6)           ## 00000028
/* 001AC 8089FA5C 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 001B0 8089FA60 24A50578 */  addiu   $a1, $a1, %lo(D_808A0578)  ## $a1 = 808A0578
/* 001B4 8089FA64 AFAF0034 */  sw      $t7, 0x0034($sp)           
/* 001B8 8089FA68 8482001C */  lh      $v0, 0x001C($a0)           ## 0000001C
/* 001BC 8089FA6C 0002CA03 */  sra     $t9, $v0,  8               
/* 001C0 8089FA70 332800FF */  andi    $t0, $t9, 0x00FF           ## $t0 = 00000000
/* 001C4 8089FA74 305800FF */  andi    $t8, $v0, 0x00FF           ## $t8 = 00000000
/* 001C8 8089FA78 AC980150 */  sw      $t8, 0x0150($a0)           ## 00000150
/* 001CC 8089FA7C 0C01E037 */  jal     Actor_ProcessInitChain
              
/* 001D0 8089FA80 AC88015C */  sw      $t0, 0x015C($a0)           ## 0000015C
/* 001D4 8089FA84 8E090150 */  lw      $t1, 0x0150($s0)           ## 00000150
/* 001D8 8089FA88 C6000028 */  lwc1    $f0, 0x0028($s0)           ## 00000028
/* 001DC 8089FA8C 2D210005 */  sltiu   $at, $t1, 0x0005           
/* 001E0 8089FA90 E6000158 */  swc1    $f0, 0x0158($s0)           ## 00000158
/* 001E4 8089FA94 1020008D */  beq     $at, $zero, .L8089FCCC     
/* 001E8 8089FA98 E6000154 */  swc1    $f0, 0x0154($s0)           ## 00000154
/* 001EC 8089FA9C 00094880 */  sll     $t1, $t1,  2               
/* 001F0 8089FAA0 3C01808A */  lui     $at, %hi(jtbl_808A05F0)       ## $at = 808A0000
/* 001F4 8089FAA4 00290821 */  addu    $at, $at, $t1              
/* 001F8 8089FAA8 8C2905F0 */  lw      $t1, %lo(jtbl_808A05F0)($at)  
/* 001FC 8089FAAC 01200008 */  jr      $t1                        
/* 00200 8089FAB0 00000000 */  nop
glabel L8089FAB4
/* 00204 8089FAB4 3C0A8016 */  lui     $t2, %hi(gGameInfo)
/* 00208 8089FAB8 8D4AFA90 */  lw      $t2, %lo(gGameInfo)($t2)
/* 0020C 8089FABC 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00210 8089FAC0 854B1532 */  lh      $t3, 0x1532($t2)           ## 80161532
/* 00214 8089FAC4 55600012 */  bnel    $t3, $zero, .L8089FB10     
/* 00218 8089FAC8 2404FFFF */  addiu   $a0, $zero, 0xFFFF         ## $a0 = FFFFFFFF
/* 0021C 8089FACC 0C00B2D0 */  jal     Flags_GetSwitch
              
/* 00220 8089FAD0 2405001C */  addiu   $a1, $zero, 0x001C         ## $a1 = 0000001C
/* 00224 8089FAD4 AFA20024 */  sw      $v0, 0x0024($sp)           
/* 00228 8089FAD8 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 0022C 8089FADC 0C00B2D0 */  jal     Flags_GetSwitch
              
/* 00230 8089FAE0 2405001D */  addiu   $a1, $zero, 0x001D         ## $a1 = 0000001D
/* 00234 8089FAE4 AFA20028 */  sw      $v0, 0x0028($sp)           
/* 00238 8089FAE8 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 0023C 8089FAEC 0C00B2D0 */  jal     Flags_GetSwitch
              
/* 00240 8089FAF0 2405001E */  addiu   $a1, $zero, 0x001E         ## $a1 = 0000001E
/* 00244 8089FAF4 3C04808A */  lui     $a0, %hi(D_808A0580)       ## $a0 = 808A0000
/* 00248 8089FAF8 24840580 */  addiu   $a0, $a0, %lo(D_808A0580)  ## $a0 = 808A0580
/* 0024C 8089FAFC 8FA50024 */  lw      $a1, 0x0024($sp)           
/* 00250 8089FB00 8FA60028 */  lw      $a2, 0x0028($sp)           
/* 00254 8089FB04 0C00084C */  jal     osSyncPrintf
              
/* 00258 8089FB08 00403825 */  or      $a3, $v0, $zero            ## $a3 = 00000000
/* 0025C 8089FB0C 2404FFFF */  addiu   $a0, $zero, 0xFFFF         ## $a0 = FFFFFFFF
.L8089FB10:
/* 00260 8089FB10 0C227E2C */  jal     func_8089F8B0              
/* 00264 8089FB14 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 00268 8089FB18 000260C0 */  sll     $t4, $v0,  3               
/* 0026C 8089FB1C 3C0D808A */  lui     $t5, %hi(D_808A0514)       ## $t5 = 808A0000
/* 00270 8089FB20 01AC6821 */  addu    $t5, $t5, $t4              
/* 00274 8089FB24 8DAD0514 */  lw      $t5, %lo(D_808A0514)($t5)  
/* 00278 8089FB28 AFA20030 */  sw      $v0, 0x0030($sp)           
/* 0027C 8089FB2C C6080158 */  lwc1    $f8, 0x0158($s0)           ## 00000158
/* 00280 8089FB30 448D2000 */  mtc1    $t5, $f4                   ## $f4 = -0.00
/* 00284 8089FB34 00000000 */  nop
/* 00288 8089FB38 468021A0 */  cvt.s.w $f6, $f4                   
/* 0028C 8089FB3C 46083280 */  add.s   $f10, $f6, $f8             
/* 00290 8089FB40 E60A0028 */  swc1    $f10, 0x0028($s0)          ## 00000028
/* 00294 8089FB44 C6100028 */  lwc1    $f16, 0x0028($s0)          ## 00000028
/* 00298 8089FB48 8FA40034 */  lw      $a0, 0x0034($sp)           
/* 0029C 8089FB4C 4600848D */  trunc.w.s $f18, $f16                 
/* 002A0 8089FB50 44059000 */  mfc1    $a1, $f18                  
/* 002A4 8089FB54 00000000 */  nop
/* 002A8 8089FB58 00052C00 */  sll     $a1, $a1, 16               
/* 002AC 8089FB5C 0C227E74 */  jal     func_8089F9D0              
/* 002B0 8089FB60 00052C03 */  sra     $a1, $a1, 16               
/* 002B4 8089FB64 8FAF0030 */  lw      $t7, 0x0030($sp)           
/* 002B8 8089FB68 3C19808A */  lui     $t9, %hi(D_808A0510)       ## $t9 = 808A0000
/* 002BC 8089FB6C 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 002C0 8089FB70 000FC0C0 */  sll     $t8, $t7,  3               
/* 002C4 8089FB74 0338C821 */  addu    $t9, $t9, $t8              
/* 002C8 8089FB78 8F390510 */  lw      $t9, %lo(D_808A0510)($t9)  
/* 002CC 8089FB7C 2405001C */  addiu   $a1, $zero, 0x001C         ## $a1 = 0000001C
/* 002D0 8089FB80 0C00B2ED */  jal     Flags_UnsetSwitch
              
/* 002D4 8089FB84 A619001C */  sh      $t9, 0x001C($s0)           ## 0000001C
/* 002D8 8089FB88 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 002DC 8089FB8C 0C00B2ED */  jal     Flags_UnsetSwitch
              
/* 002E0 8089FB90 2405001D */  addiu   $a1, $zero, 0x001D         ## $a1 = 0000001D
/* 002E4 8089FB94 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 002E8 8089FB98 0C00B2ED */  jal     Flags_UnsetSwitch
              
/* 002EC 8089FB9C 2405001E */  addiu   $a1, $zero, 0x001E         ## $a1 = 0000001E
/* 002F0 8089FBA0 8602001C */  lh      $v0, 0x001C($s0)           ## 0000001C
/* 002F4 8089FBA4 2401001C */  addiu   $at, $zero, 0x001C         ## $at = 0000001C
/* 002F8 8089FBA8 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 002FC 8089FBAC 1041000E */  beq     $v0, $at, .L8089FBE8       
/* 00300 8089FBB0 2401001D */  addiu   $at, $zero, 0x001D         ## $at = 0000001D
/* 00304 8089FBB4 10410008 */  beq     $v0, $at, .L8089FBD8       
/* 00308 8089FBB8 2405001D */  addiu   $a1, $zero, 0x001D         ## $a1 = 0000001D
/* 0030C 8089FBBC 2401001E */  addiu   $at, $zero, 0x001E         ## $at = 0000001E
/* 00310 8089FBC0 14410009 */  bne     $v0, $at, .L8089FBE8       
/* 00314 8089FBC4 2405001E */  addiu   $a1, $zero, 0x001E         ## $a1 = 0000001E
/* 00318 8089FBC8 0C00B2DD */  jal     Flags_SetSwitch
              
/* 0031C 8089FBCC 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00320 8089FBD0 10000008 */  beq     $zero, $zero, .L8089FBF4   
/* 00324 8089FBD4 C6040028 */  lwc1    $f4, 0x0028($s0)           ## 00000028
.L8089FBD8:
/* 00328 8089FBD8 0C00B2DD */  jal     Flags_SetSwitch
              
/* 0032C 8089FBDC 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00330 8089FBE0 10000004 */  beq     $zero, $zero, .L8089FBF4   
/* 00334 8089FBE4 C6040028 */  lwc1    $f4, 0x0028($s0)           ## 00000028
.L8089FBE8:
/* 00338 8089FBE8 0C00B2DD */  jal     Flags_SetSwitch
              
/* 0033C 8089FBEC 2405001C */  addiu   $a1, $zero, 0x001C         ## $a1 = 0000001C
/* 00340 8089FBF0 C6040028 */  lwc1    $f4, 0x0028($s0)           ## 00000028
.L8089FBF4:
/* 00344 8089FBF4 10000035 */  beq     $zero, $zero, .L8089FCCC   
/* 00348 8089FBF8 E6040154 */  swc1    $f4, 0x0154($s0)           ## 00000154
glabel L8089FBFC
/* 0034C 8089FBFC 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00350 8089FC00 0C00B2D0 */  jal     Flags_GetSwitch
              
/* 00354 8089FC04 8E05015C */  lw      $a1, 0x015C($s0)           ## 0000015C
/* 00358 8089FC08 10400006 */  beq     $v0, $zero, .L8089FC24     
/* 0035C 8089FC0C 3C0142AA */  lui     $at, 0x42AA                ## $at = 42AA0000
/* 00360 8089FC10 C6060158 */  lwc1    $f6, 0x0158($s0)           ## 00000158
/* 00364 8089FC14 44814000 */  mtc1    $at, $f8                   ## $f8 = 85.00
/* 00368 8089FC18 00000000 */  nop
/* 0036C 8089FC1C 46083280 */  add.s   $f10, $f6, $f8             
/* 00370 8089FC20 E60A0028 */  swc1    $f10, 0x0028($s0)          ## 00000028
.L8089FC24:
/* 00374 8089FC24 C6100028 */  lwc1    $f16, 0x0028($s0)          ## 00000028
/* 00378 8089FC28 8FAA0034 */  lw      $t2, 0x0034($sp)           
/* 0037C 8089FC2C 4600848D */  trunc.w.s $f18, $f16                 
/* 00380 8089FC30 44099000 */  mfc1    $t1, $f18                  
/* 00384 8089FC34 10000025 */  beq     $zero, $zero, .L8089FCCC   
/* 00388 8089FC38 A5490062 */  sh      $t1, 0x0062($t2)           ## 00000062
glabel L8089FC3C
/* 0038C 8089FC3C 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00390 8089FC40 0C00B2D0 */  jal     Flags_GetSwitch
              
/* 00394 8089FC44 8E05015C */  lw      $a1, 0x015C($s0)           ## 0000015C
/* 00398 8089FC48 10400008 */  beq     $v0, $zero, .L8089FC6C     
/* 0039C 8089FC4C 3C0142DC */  lui     $at, 0x42DC                ## $at = 42DC0000
/* 003A0 8089FC50 C6040158 */  lwc1    $f4, 0x0158($s0)           ## 00000158
/* 003A4 8089FC54 44813000 */  mtc1    $at, $f6                   ## $f6 = 110.00
/* 003A8 8089FC58 00000000 */  nop
/* 003AC 8089FC5C 46062200 */  add.s   $f8, $f4, $f6              
/* 003B0 8089FC60 E6080028 */  swc1    $f8, 0x0028($s0)           ## 00000028
/* 003B4 8089FC64 C60A0028 */  lwc1    $f10, 0x0028($s0)          ## 00000028
/* 003B8 8089FC68 E60A0154 */  swc1    $f10, 0x0154($s0)          ## 00000154
.L8089FC6C:
/* 003BC 8089FC6C C6100028 */  lwc1    $f16, 0x0028($s0)          ## 00000028
/* 003C0 8089FC70 8FAD0034 */  lw      $t5, 0x0034($sp)           
/* 003C4 8089FC74 4600848D */  trunc.w.s $f18, $f16                 
/* 003C8 8089FC78 440C9000 */  mfc1    $t4, $f18                  
/* 003CC 8089FC7C 10000013 */  beq     $zero, $zero, .L8089FCCC   
/* 003D0 8089FC80 A5AC0082 */  sh      $t4, 0x0082($t5)           ## 00000082
glabel L8089FC84
/* 003D4 8089FC84 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 003D8 8089FC88 0C00B2D0 */  jal     Flags_GetSwitch
              
/* 003DC 8089FC8C 8E05015C */  lw      $a1, 0x015C($s0)           ## 0000015C
/* 003E0 8089FC90 10400008 */  beq     $v0, $zero, .L8089FCB4     
/* 003E4 8089FC94 3C014320 */  lui     $at, 0x4320                ## $at = 43200000
/* 003E8 8089FC98 C6040158 */  lwc1    $f4, 0x0158($s0)           ## 00000158
/* 003EC 8089FC9C 44813000 */  mtc1    $at, $f6                   ## $f6 = 160.00
/* 003F0 8089FCA0 00000000 */  nop
/* 003F4 8089FCA4 46062200 */  add.s   $f8, $f4, $f6              
/* 003F8 8089FCA8 E6080028 */  swc1    $f8, 0x0028($s0)           ## 00000028
/* 003FC 8089FCAC C60A0028 */  lwc1    $f10, 0x0028($s0)          ## 00000028
/* 00400 8089FCB0 E60A0154 */  swc1    $f10, 0x0154($s0)          ## 00000154
.L8089FCB4:
/* 00404 8089FCB4 C6100028 */  lwc1    $f16, 0x0028($s0)          ## 00000028
/* 00408 8089FCB8 8FB80034 */  lw      $t8, 0x0034($sp)           
/* 0040C 8089FCBC 4600848D */  trunc.w.s $f18, $f16                 
/* 00410 8089FCC0 440F9000 */  mfc1    $t7, $f18                  
/* 00414 8089FCC4 00000000 */  nop
/* 00418 8089FCC8 A70F0102 */  sh      $t7, 0x0102($t8)           ## 00000102
glabel L8089FCCC
.L8089FCCC:
/* 0041C 8089FCCC 3C19808A */  lui     $t9, %hi(func_8089FCF8)    ## $t9 = 808A0000
/* 00420 8089FCD0 2739FCF8 */  addiu   $t9, $t9, %lo(func_8089FCF8) ## $t9 = 8089FCF8
/* 00424 8089FCD4 AE19014C */  sw      $t9, 0x014C($s0)           ## 0000014C
/* 00428 8089FCD8 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 0042C 8089FCDC 8FB10018 */  lw      $s1, 0x0018($sp)           
/* 00430 8089FCE0 8FB00014 */  lw      $s0, 0x0014($sp)           
/* 00434 8089FCE4 03E00008 */  jr      $ra                        
/* 00438 8089FCE8 27BD0040 */  addiu   $sp, $sp, 0x0040           ## $sp = 00000000
