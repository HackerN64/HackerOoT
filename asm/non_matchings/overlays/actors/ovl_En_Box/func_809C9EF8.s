.late_rodata
glabel D_809CA900
    .float 0.3

glabel D_809CA904
    .float 0.8

glabel D_809CA908
 .word 0x3FE66666
glabel D_809CA90C
    .float 1.6

glabel D_809CA910
 .word 0x3FE66666, 0x00000000, 0x00000000, 0x00000000

.text
glabel func_809C9EF8
/* 01138 809C9EF8 27BDFFA8 */  addiu   $sp, $sp, 0xFFA8           ## $sp = FFFFFFA8
/* 0113C 809C9EFC 3C0F809D */  lui     $t7, %hi(D_809CA814)       ## $t7 = 809D0000
/* 01140 809C9F00 AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 01144 809C9F04 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 01148 809C9F08 AFA5005C */  sw      $a1, 0x005C($sp)           
/* 0114C 809C9F0C 25EFA814 */  addiu   $t7, $t7, %lo(D_809CA814)  ## $t7 = 809CA814
/* 01150 809C9F10 8DF90000 */  lw      $t9, 0x0000($t7)           ## 809CA814
/* 01154 809C9F14 27AE0040 */  addiu   $t6, $sp, 0x0040           ## $t6 = FFFFFFE8
/* 01158 809C9F18 8DF80004 */  lw      $t8, 0x0004($t7)           ## 809CA818
/* 0115C 809C9F1C ADD90000 */  sw      $t9, 0x0000($t6)           ## FFFFFFE8
/* 01160 809C9F20 8DF90008 */  lw      $t9, 0x0008($t7)           ## 809CA81C
/* 01164 809C9F24 3C09809D */  lui     $t1, %hi(D_809CA820)       ## $t1 = 809D0000
/* 01168 809C9F28 2529A820 */  addiu   $t1, $t1, %lo(D_809CA820)  ## $t1 = 809CA820
/* 0116C 809C9F2C ADD80004 */  sw      $t8, 0x0004($t6)           ## FFFFFFEC
/* 01170 809C9F30 ADD90008 */  sw      $t9, 0x0008($t6)           ## FFFFFFF0
/* 01174 809C9F34 8D2B0000 */  lw      $t3, 0x0000($t1)           ## 809CA820
/* 01178 809C9F38 27A80034 */  addiu   $t0, $sp, 0x0034           ## $t0 = FFFFFFDC
/* 0117C 809C9F3C 8D2A0004 */  lw      $t2, 0x0004($t1)           ## 809CA824
/* 01180 809C9F40 AD0B0000 */  sw      $t3, 0x0000($t0)           ## FFFFFFDC
/* 01184 809C9F44 8D2B0008 */  lw      $t3, 0x0008($t1)           ## 809CA828
/* 01188 809C9F48 AD0A0004 */  sw      $t2, 0x0004($t0)           ## FFFFFFE0
/* 0118C 809C9F4C 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 01190 809C9F50 AD0B0008 */  sw      $t3, 0x0008($t0)           ## FFFFFFE4
/* 01194 809C9F54 908C01FA */  lbu     $t4, 0x01FA($a0)           ## 000001FA
/* 01198 809C9F58 240531F1 */  addiu   $a1, $zero, 0x31F1         ## $a1 = 000031F1
/* 0119C 809C9F5C 258D0001 */  addiu   $t5, $t4, 0x0001           ## $t5 = 00000001
/* 011A0 809C9F60 0C00BE5D */  jal     func_8002F974              
/* 011A4 809C9F64 A08D01FA */  sb      $t5, 0x01FA($a0)           ## 000001FA
/* 011A8 809C9F68 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 011AC 809C9F6C 00000000 */  nop
/* 011B0 809C9F70 3C01809D */  lui     $at, %hi(D_809CA900)       ## $at = 809D0000
/* 011B4 809C9F74 C424A900 */  lwc1    $f4, %lo(D_809CA900)($at)  
/* 011B8 809C9F78 4604003C */  c.lt.s  $f0, $f4                   
/* 011BC 809C9F7C 00000000 */  nop
/* 011C0 809C9F80 45020083 */  bc1fl   .L809CA190                 
/* 011C4 809C9F84 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 011C8 809C9F88 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 011CC 809C9F8C 00000000 */  nop
/* 011D0 809C9F90 8E180024 */  lw      $t8, 0x0024($s0)           ## 00000024
/* 011D4 809C9F94 27AE004C */  addiu   $t6, $sp, 0x004C           ## $t6 = FFFFFFF4
/* 011D8 809C9F98 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 011DC 809C9F9C ADD80000 */  sw      $t8, 0x0000($t6)           ## FFFFFFF4
/* 011E0 809C9FA0 8E0F0028 */  lw      $t7, 0x0028($s0)           ## 00000028
/* 011E4 809C9FA4 46000180 */  add.s   $f6, $f0, $f0              
/* 011E8 809C9FA8 44814000 */  mtc1    $at, $f8                   ## $f8 = 1.00
/* 011EC 809C9FAC ADCF0004 */  sw      $t7, 0x0004($t6)           ## FFFFFFF8
/* 011F0 809C9FB0 8E18002C */  lw      $t8, 0x002C($s0)           ## 0000002C
/* 011F4 809C9FB4 24010005 */  addiu   $at, $zero, 0x0005         ## $at = 00000005
/* 011F8 809C9FB8 46083081 */  sub.s   $f2, $f6, $f8              
/* 011FC 809C9FBC ADD80008 */  sw      $t8, 0x0008($t6)           ## FFFFFFFC
/* 01200 809C9FC0 920201F9 */  lbu     $v0, 0x01F9($s0)           ## 000001F9
/* 01204 809C9FC4 10410007 */  beq     $v0, $at, .L809C9FE4       
/* 01208 809C9FC8 24010006 */  addiu   $at, $zero, 0x0006         ## $at = 00000006
/* 0120C 809C9FCC 10410005 */  beq     $v0, $at, .L809C9FE4       
/* 01210 809C9FD0 24010007 */  addiu   $at, $zero, 0x0007         ## $at = 00000007
/* 01214 809C9FD4 10410003 */  beq     $v0, $at, .L809C9FE4       
/* 01218 809C9FD8 24010008 */  addiu   $at, $zero, 0x0008         ## $at = 00000008
/* 0121C 809C9FDC 54410034 */  bnel    $v0, $at, .L809CA0B0       
/* 01220 809C9FE0 86040032 */  lh      $a0, 0x0032($s0)           ## 00000032
.L809C9FE4:
/* 01224 809C9FE4 86040032 */  lh      $a0, 0x0032($s0)           ## 00000032
/* 01228 809C9FE8 E7A20030 */  swc1    $f2, 0x0030($sp)           
/* 0122C 809C9FEC 24844000 */  addiu   $a0, $a0, 0x4000           ## $a0 = 00004000
/* 01230 809C9FF0 00042400 */  sll     $a0, $a0, 16               
/* 01234 809C9FF4 0C01DE1C */  jal     Math_Sins
              ## sins?
/* 01238 809C9FF8 00042403 */  sra     $a0, $a0, 16               
/* 0123C 809C9FFC 3C014120 */  lui     $at, 0x4120                ## $at = 41200000
/* 01240 809CA000 44815000 */  mtc1    $at, $f10                  ## $f10 = 10.00
/* 01244 809CA004 C7A20030 */  lwc1    $f2, 0x0030($sp)           
/* 01248 809CA008 C7B0004C */  lwc1    $f16, 0x004C($sp)          
/* 0124C 809CA00C 460A1302 */  mul.s   $f12, $f2, $f10            
/* 01250 809CA010 00000000 */  nop
/* 01254 809CA014 46006482 */  mul.s   $f18, $f12, $f0            
/* 01258 809CA018 46128100 */  add.s   $f4, $f16, $f18            
/* 0125C 809CA01C E7A4004C */  swc1    $f4, 0x004C($sp)           
/* 01260 809CA020 86040032 */  lh      $a0, 0x0032($s0)           ## 00000032
/* 01264 809CA024 E7AC0028 */  swc1    $f12, 0x0028($sp)          
/* 01268 809CA028 24844000 */  addiu   $a0, $a0, 0x4000           ## $a0 = 00004000
/* 0126C 809CA02C 00042400 */  sll     $a0, $a0, 16               
/* 01270 809CA030 0C01DE0D */  jal     Math_Coss
              ## coss?
/* 01274 809CA034 00042403 */  sra     $a0, $a0, 16               
/* 01278 809CA038 C7AC0028 */  lwc1    $f12, 0x0028($sp)          
/* 0127C 809CA03C C7A60054 */  lwc1    $f6, 0x0054($sp)           
/* 01280 809CA040 46006202 */  mul.s   $f8, $f12, $f0             
/* 01284 809CA044 46083280 */  add.s   $f10, $f6, $f8             
/* 01288 809CA048 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 0128C 809CA04C E7AA0054 */  swc1    $f10, 0x0054($sp)          
/* 01290 809CA050 46000400 */  add.s   $f16, $f0, $f0             
/* 01294 809CA054 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 01298 809CA058 44819000 */  mtc1    $at, $f18                  ## $f18 = 1.00
/* 0129C 809CA05C 86040032 */  lh      $a0, 0x0032($s0)           ## 00000032
/* 012A0 809CA060 46128081 */  sub.s   $f2, $f16, $f18            
/* 012A4 809CA064 0C01DE1C */  jal     Math_Sins
              ## sins?
/* 012A8 809CA068 E7A20030 */  swc1    $f2, 0x0030($sp)           
/* 012AC 809CA06C 3C01809D */  lui     $at, %hi(D_809CA904)       ## $at = 809D0000
/* 012B0 809CA070 C424A904 */  lwc1    $f4, %lo(D_809CA904)($at)  
/* 012B4 809CA074 C7A20030 */  lwc1    $f2, 0x0030($sp)           
/* 012B8 809CA078 3C01809D */  lui     $at, %hi(D_809CA908)       ## $at = 809D0000
/* 012BC 809CA07C C428A908 */  lwc1    $f8, %lo(D_809CA908)($at)  
/* 012C0 809CA080 46041302 */  mul.s   $f12, $f2, $f4             
/* 012C4 809CA084 E7A80044 */  swc1    $f8, 0x0044($sp)           
/* 012C8 809CA088 460C0182 */  mul.s   $f6, $f0, $f12             
/* 012CC 809CA08C E7A60040 */  swc1    $f6, 0x0040($sp)           
/* 012D0 809CA090 86040032 */  lh      $a0, 0x0032($s0)           ## 00000032
/* 012D4 809CA094 0C01DE0D */  jal     Math_Coss
              ## coss?
/* 012D8 809CA098 E7AC0028 */  swc1    $f12, 0x0028($sp)          
/* 012DC 809CA09C C7AC0028 */  lwc1    $f12, 0x0028($sp)          
/* 012E0 809CA0A0 460C0282 */  mul.s   $f10, $f0, $f12            
/* 012E4 809CA0A4 10000032 */  beq     $zero, $zero, .L809CA170   
/* 012E8 809CA0A8 E7AA0048 */  swc1    $f10, 0x0048($sp)          
/* 012EC 809CA0AC 86040032 */  lh      $a0, 0x0032($s0)           ## 00000032
.L809CA0B0:
/* 012F0 809CA0B0 E7A20030 */  swc1    $f2, 0x0030($sp)           
/* 012F4 809CA0B4 24844000 */  addiu   $a0, $a0, 0x4000           ## $a0 = 00004000
/* 012F8 809CA0B8 00042400 */  sll     $a0, $a0, 16               
/* 012FC 809CA0BC 0C01DE1C */  jal     Math_Sins
              ## sins?
/* 01300 809CA0C0 00042403 */  sra     $a0, $a0, 16               
/* 01304 809CA0C4 3C0141A0 */  lui     $at, 0x41A0                ## $at = 41A00000
/* 01308 809CA0C8 44818000 */  mtc1    $at, $f16                  ## $f16 = 20.00
/* 0130C 809CA0CC C7A20030 */  lwc1    $f2, 0x0030($sp)           
/* 01310 809CA0D0 C7B2004C */  lwc1    $f18, 0x004C($sp)          
/* 01314 809CA0D4 46101302 */  mul.s   $f12, $f2, $f16            
/* 01318 809CA0D8 00000000 */  nop
/* 0131C 809CA0DC 46006102 */  mul.s   $f4, $f12, $f0             
/* 01320 809CA0E0 46049180 */  add.s   $f6, $f18, $f4             
/* 01324 809CA0E4 E7A6004C */  swc1    $f6, 0x004C($sp)           
/* 01328 809CA0E8 86040032 */  lh      $a0, 0x0032($s0)           ## 00000032
/* 0132C 809CA0EC E7AC0028 */  swc1    $f12, 0x0028($sp)          
/* 01330 809CA0F0 24844000 */  addiu   $a0, $a0, 0x4000           ## $a0 = 00004000
/* 01334 809CA0F4 00042400 */  sll     $a0, $a0, 16               
/* 01338 809CA0F8 0C01DE0D */  jal     Math_Coss
              ## coss?
/* 0133C 809CA0FC 00042403 */  sra     $a0, $a0, 16               
/* 01340 809CA100 C7AC0028 */  lwc1    $f12, 0x0028($sp)          
/* 01344 809CA104 C7A80054 */  lwc1    $f8, 0x0054($sp)           
/* 01348 809CA108 46006282 */  mul.s   $f10, $f12, $f0            
/* 0134C 809CA10C 460A4400 */  add.s   $f16, $f8, $f10            
/* 01350 809CA110 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 01354 809CA114 E7B00054 */  swc1    $f16, 0x0054($sp)          
/* 01358 809CA118 46000480 */  add.s   $f18, $f0, $f0             
/* 0135C 809CA11C 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 01360 809CA120 44812000 */  mtc1    $at, $f4                   ## $f4 = 1.00
/* 01364 809CA124 86040032 */  lh      $a0, 0x0032($s0)           ## 00000032
/* 01368 809CA128 46049081 */  sub.s   $f2, $f18, $f4             
/* 0136C 809CA12C 0C01DE1C */  jal     Math_Sins
              ## sins?
/* 01370 809CA130 E7A20030 */  swc1    $f2, 0x0030($sp)           
/* 01374 809CA134 3C01809D */  lui     $at, %hi(D_809CA90C)       ## $at = 809D0000
/* 01378 809CA138 C426A90C */  lwc1    $f6, %lo(D_809CA90C)($at)  
/* 0137C 809CA13C C7A20030 */  lwc1    $f2, 0x0030($sp)           
/* 01380 809CA140 3C01809D */  lui     $at, %hi(D_809CA910)       ## $at = 809D0000
/* 01384 809CA144 C42AA910 */  lwc1    $f10, %lo(D_809CA910)($at) 
/* 01388 809CA148 46061302 */  mul.s   $f12, $f2, $f6             
/* 0138C 809CA14C E7AA0044 */  swc1    $f10, 0x0044($sp)          
/* 01390 809CA150 460C0202 */  mul.s   $f8, $f0, $f12             
/* 01394 809CA154 E7A80040 */  swc1    $f8, 0x0040($sp)           
/* 01398 809CA158 86040032 */  lh      $a0, 0x0032($s0)           ## 00000032
/* 0139C 809CA15C 0C01DE0D */  jal     Math_Coss
              ## coss?
/* 013A0 809CA160 E7AC0028 */  swc1    $f12, 0x0028($sp)          
/* 013A4 809CA164 C7AC0028 */  lwc1    $f12, 0x0028($sp)          
/* 013A8 809CA168 460C0402 */  mul.s   $f16, $f0, $f12            
/* 013AC 809CA16C E7B00048 */  swc1    $f16, 0x0048($sp)          
.L809CA170:
/* 013B0 809CA170 24190096 */  addiu   $t9, $zero, 0x0096         ## $t9 = 00000096
/* 013B4 809CA174 AFB90010 */  sw      $t9, 0x0010($sp)           
/* 013B8 809CA178 8FA4005C */  lw      $a0, 0x005C($sp)           
/* 013BC 809CA17C 27A5004C */  addiu   $a1, $sp, 0x004C           ## $a1 = FFFFFFF4
/* 013C0 809CA180 27A60040 */  addiu   $a2, $sp, 0x0040           ## $a2 = FFFFFFE8
/* 013C4 809CA184 0C00AA91 */  jal     EffectSsIceSmoke_Spawn              
/* 013C8 809CA188 27A70034 */  addiu   $a3, $sp, 0x0034           ## $a3 = FFFFFFDC
/* 013CC 809CA18C 8FBF0024 */  lw      $ra, 0x0024($sp)           
.L809CA190:
/* 013D0 809CA190 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 013D4 809CA194 27BD0058 */  addiu   $sp, $sp, 0x0058           ## $sp = 00000000
/* 013D8 809CA198 03E00008 */  jr      $ra                        
/* 013DC 809CA19C 00000000 */  nop
