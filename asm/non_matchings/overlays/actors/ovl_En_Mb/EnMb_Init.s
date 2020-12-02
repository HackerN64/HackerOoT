.late_rodata
glabel D_80AA9E70
 .word 0x44DAC000
glabel D_80AA9E74
 .word 0x44318000
glabel D_80AA9E78
 .word 0x44DAC000

.text
glabel EnMb_Init
/* 00008 80AA6058 27BDFFB0 */  addiu   $sp, $sp, 0xFFB0           ## $sp = FFFFFFB0
/* 0000C 80AA605C AFBF002C */  sw      $ra, 0x002C($sp)
/* 00010 80AA6060 AFB10028 */  sw      $s1, 0x0028($sp)
/* 00014 80AA6064 AFB00024 */  sw      $s0, 0x0024($sp)
/* 00018 80AA6068 8CAE1C44 */  lw      $t6, 0x1C44($a1)           ## 00001C44
/* 0001C 80AA606C 00A08825 */  or      $s1, $a1, $zero            ## $s1 = 00000000
/* 00020 80AA6070 3C0580AB */  lui     $a1, %hi(D_80AA9D44)       ## $a1 = 80AB0000
/* 00024 80AA6074 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00028 80AA6078 24A59D44 */  addiu   $a1, $a1, %lo(D_80AA9D44)  ## $a1 = 80AA9D44
/* 0002C 80AA607C 0C01E037 */  jal     Actor_ProcessInitChain

/* 00030 80AA6080 AFAE0044 */  sw      $t6, 0x0044($sp)
/* 00034 80AA6084 260400B4 */  addiu   $a0, $s0, 0x00B4           ## $a0 = 000000B4
/* 00038 80AA6088 3C068003 */  lui     $a2, %hi(ActorShadow_DrawFunc_Circle)
/* 0003C 80AA608C 24C6B5EC */  addiu   $a2, %lo(ActorShadow_DrawFunc_Circle)
/* 00040 80AA6090 AFA40034 */  sw      $a0, 0x0034($sp)
/* 00044 80AA6094 24050000 */  addiu   $a1, $zero, 0x0000         ## $a1 = 00000000
/* 00048 80AA6098 0C00AC78 */  jal     ActorShape_Init

/* 0004C 80AA609C 3C074238 */  lui     $a3, 0x4238                ## $a3 = 42380000
/* 00050 80AA60A0 3C1880AB */  lui     $t8, %hi(D_80AA9D04)       ## $t8 = 80AB0000
/* 00054 80AA60A4 240F00FF */  addiu   $t7, $zero, 0x00FF         ## $t7 = 000000FF
/* 00058 80AA60A8 27189D04 */  addiu   $t8, $t8, %lo(D_80AA9D04)  ## $t8 = 80AA9D04
/* 0005C 80AA60AC A20F00AE */  sb      $t7, 0x00AE($s0)           ## 000000AE
/* 00060 80AA60B0 AE180098 */  sw      $t8, 0x0098($s0)           ## 00000098
/* 00064 80AA60B4 26050368 */  addiu   $a1, $s0, 0x0368           ## $a1 = 00000368
/* 00068 80AA60B8 AFA50038 */  sw      $a1, 0x0038($sp)
/* 0006C 80AA60BC 0C0170D9 */  jal     Collider_InitCylinder

/* 00070 80AA60C0 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00074 80AA60C4 3C0780AB */  lui     $a3, %hi(D_80AA9C00)       ## $a3 = 80AB0000
/* 00078 80AA60C8 8FA50038 */  lw      $a1, 0x0038($sp)
/* 0007C 80AA60CC 24E79C00 */  addiu   $a3, $a3, %lo(D_80AA9C00)  ## $a3 = 80AA9C00
/* 00080 80AA60D0 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00084 80AA60D4 0C01712B */  jal     Collider_SetCylinder

/* 00088 80AA60D8 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 0008C 80AA60DC 26050434 */  addiu   $a1, $s0, 0x0434           ## $a1 = 00000434
/* 00090 80AA60E0 AFA50038 */  sw      $a1, 0x0038($sp)
/* 00094 80AA60E4 0C0171F8 */  jal     Collider_InitTris
/* 00098 80AA60E8 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 0009C 80AA60EC 3C0780AB */  lui     $a3, %hi(D_80AA9CA4)       ## $a3 = 80AB0000
/* 000A0 80AA60F0 26190454 */  addiu   $t9, $s0, 0x0454           ## $t9 = 00000454
/* 000A4 80AA60F4 8FA50038 */  lw      $a1, 0x0038($sp)
/* 000A8 80AA60F8 AFB90010 */  sw      $t9, 0x0010($sp)
/* 000AC 80AA60FC 24E79CA4 */  addiu   $a3, $a3, %lo(D_80AA9CA4)  ## $a3 = 80AA9CA4
/* 000B0 80AA6100 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 000B4 80AA6104 0C0172EB */  jal     Collider_SetTris
/* 000B8 80AA6108 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 000BC 80AA610C 260503B4 */  addiu   $a1, $s0, 0x03B4           ## $a1 = 000003B4
/* 000C0 80AA6110 AFA50038 */  sw      $a1, 0x0038($sp)
/* 000C4 80AA6114 0C017406 */  jal     Collider_InitQuad
/* 000C8 80AA6118 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 000CC 80AA611C 3C0780AB */  lui     $a3, %hi(D_80AA9CB4)       ## $a3 = 80AB0000
/* 000D0 80AA6120 8FA50038 */  lw      $a1, 0x0038($sp)
/* 000D4 80AA6124 24E79CB4 */  addiu   $a3, $a3, %lo(D_80AA9CB4)  ## $a3 = 80AA9CB4
/* 000D8 80AA6128 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 000DC 80AA612C 0C017441 */  jal     Collider_SetQuad
/* 000E0 80AA6130 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 000E4 80AA6134 8603001C */  lh      $v1, 0x001C($s0)           ## 0000001C
/* 000E8 80AA6138 2401FFFF */  addiu   $at, $zero, 0xFFFF         ## $at = FFFFFFFF
/* 000EC 80AA613C 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 000F0 80AA6140 10610005 */  beq     $v1, $at, .L80AA6158
/* 000F4 80AA6144 2605018C */  addiu   $a1, $s0, 0x018C           ## $a1 = 0000018C
/* 000F8 80AA6148 1060001C */  beq     $v1, $zero, .L80AA61BC
/* 000FC 80AA614C 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00100 80AA6150 1000006C */  beq     $zero, $zero, .L80AA6304
/* 00104 80AA6154 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
.L80AA6158:
/* 00108 80AA6158 3C060601 */  lui     $a2, 0x0601                ## $a2 = 06010000
/* 0010C 80AA615C 3C070600 */  lui     $a3, 0x0600                ## $a3 = 06000000
/* 00110 80AA6160 260801D0 */  addiu   $t0, $s0, 0x01D0           ## $t0 = 000001D0
/* 00114 80AA6164 26090278 */  addiu   $t1, $s0, 0x0278           ## $t1 = 00000278
/* 00118 80AA6168 240A001C */  addiu   $t2, $zero, 0x001C         ## $t2 = 0000001C
/* 0011C 80AA616C AFAA0018 */  sw      $t2, 0x0018($sp)
/* 00120 80AA6170 AFA90014 */  sw      $t1, 0x0014($sp)
/* 00124 80AA6174 AFA80010 */  sw      $t0, 0x0010($sp)
/* 00128 80AA6178 24E728E0 */  addiu   $a3, $a3, 0x28E0           ## $a3 = 060028E0
/* 0012C 80AA617C 0C0291BE */  jal     SkelAnime_InitFlex
/* 00130 80AA6180 24C68F38 */  addiu   $a2, $a2, 0x8F38           ## $a2 = 06008F38
/* 00134 80AA6184 3C01447A */  lui     $at, 0x447A                ## $at = 447A0000
/* 00138 80AA6188 44812000 */  mtc1    $at, $f4                   ## $f4 = 1000.00
/* 0013C 80AA618C 240B0002 */  addiu   $t3, $zero, 0x0002         ## $t3 = 00000002
/* 00140 80AA6190 240C00FE */  addiu   $t4, $zero, 0x00FE         ## $t4 = 000000FE
/* 00144 80AA6194 A20B00AF */  sb      $t3, 0x00AF($s0)           ## 000000AF
/* 00148 80AA6198 A20C00AE */  sb      $t4, 0x00AE($s0)           ## 000000AE
/* 0014C 80AA619C 3C0180AB */  lui     $at, %hi(D_80AA9E70)       ## $at = 80AB0000
/* 00150 80AA61A0 E6040360 */  swc1    $f4, 0x0360($s0)           ## 00000360
/* 00154 80AA61A4 C4269E70 */  lwc1    $f6, %lo(D_80AA9E70)($at)
/* 00158 80AA61A8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0015C 80AA61AC 0C2A9A0C */  jal     func_80AA6830
/* 00160 80AA61B0 E6060364 */  swc1    $f6, 0x0364($s0)           ## 00000364
/* 00164 80AA61B4 1000007C */  beq     $zero, $zero, .L80AA63A8
/* 00168 80AA61B8 8FBF002C */  lw      $ra, 0x002C($sp)
.L80AA61BC:
/* 0016C 80AA61BC 3C060601 */  lui     $a2, 0x0601                ## $a2 = 06010000
/* 00170 80AA61C0 3C070601 */  lui     $a3, 0x0601                ## $a3 = 06010000
/* 00174 80AA61C4 260D01D0 */  addiu   $t5, $s0, 0x01D0           ## $t5 = 000001D0
/* 00178 80AA61C8 260E0278 */  addiu   $t6, $s0, 0x0278           ## $t6 = 00000278
/* 0017C 80AA61CC 240F001C */  addiu   $t7, $zero, 0x001C         ## $t7 = 0000001C
/* 00180 80AA61D0 AFAF0018 */  sw      $t7, 0x0018($sp)
/* 00184 80AA61D4 AFAE0014 */  sw      $t6, 0x0014($sp)
/* 00188 80AA61D8 AFAD0010 */  sw      $t5, 0x0010($sp)
/* 0018C 80AA61DC 24E7EBE4 */  addiu   $a3, $a3, 0xEBE4           ## $a3 = 0600EBE4
/* 00190 80AA61E0 24C64190 */  addiu   $a2, $a2, 0x4190           ## $a2 = 06014190
/* 00194 80AA61E4 0C0291BE */  jal     SkelAnime_InitFlex
/* 00198 80AA61E8 2605018C */  addiu   $a1, $s0, 0x018C           ## $a1 = 0000018C
/* 0019C 80AA61EC 3C0880AB */  lui     $t0, %hi(D_80AA9D24)       ## $t0 = 80AB0000
/* 001A0 80AA61F0 24180006 */  addiu   $t8, $zero, 0x0006         ## $t8 = 00000006
/* 001A4 80AA61F4 241900FF */  addiu   $t9, $zero, 0x00FF         ## $t9 = 000000FF
/* 001A8 80AA61F8 25089D24 */  addiu   $t0, $t0, %lo(D_80AA9D24)  ## $t0 = 80AA9D24
/* 001AC 80AA61FC 3C053CA3 */  lui     $a1, 0x3CA3                ## $a1 = 3CA30000
/* 001B0 80AA6200 A21800AF */  sb      $t8, 0x00AF($s0)           ## 000000AF
/* 001B4 80AA6204 A21900AE */  sb      $t9, 0x00AE($s0)           ## 000000AE
/* 001B8 80AA6208 AE080098 */  sw      $t0, 0x0098($s0)           ## 00000098
/* 001BC 80AA620C 34A5D70A */  ori     $a1, $a1, 0xD70A           ## $a1 = 3CA3D70A
/* 001C0 80AA6210 0C00B58B */  jal     Actor_SetScale

/* 001C4 80AA6214 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 001C8 80AA6218 3C01457A */  lui     $at, 0x457A                ## $at = 457A0000
/* 001CC 80AA621C 44814000 */  mtc1    $at, $f8                   ## $f8 = 4000.00
/* 001D0 80AA6220 3C014448 */  lui     $at, 0x4448                ## $at = 44480000
/* 001D4 80AA6224 44815000 */  mtc1    $at, $f10                  ## $f10 = 800.00
/* 001D8 80AA6228 3C0144E1 */  lui     $at, 0x44E1                ## $at = 44E10000
/* 001DC 80AA622C 44818000 */  mtc1    $at, $f16                  ## $f16 = 1800.00
/* 001E0 80AA6230 240900AA */  addiu   $t1, $zero, 0x00AA         ## $t1 = 000000AA
/* 001E4 80AA6234 240A002D */  addiu   $t2, $zero, 0x002D         ## $t2 = 0000002D
/* 001E8 80AA6238 A60903AA */  sh      $t1, 0x03AA($s0)           ## 000003AA
/* 001EC 80AA623C A60A03A8 */  sh      $t2, 0x03A8($s0)           ## 000003A8
/* 001F0 80AA6240 3C0180AB */  lui     $at, %hi(D_80AA9E74)       ## $at = 80AB0000
/* 001F4 80AA6244 E60800F4 */  swc1    $f8, 0x00F4($s0)           ## 000000F4
/* 001F8 80AA6248 E60A00F8 */  swc1    $f10, 0x00F8($s0)          ## 000000F8
/* 001FC 80AA624C E61000FC */  swc1    $f16, 0x00FC($s0)          ## 000000FC
/* 00200 80AA6250 C4329E74 */  lwc1    $f18, %lo(D_80AA9E74)($at)
/* 00204 80AA6254 3C0B2000 */  lui     $t3, 0x2000                ## $t3 = 20000000
/* 00208 80AA6258 AE0B03CC */  sw      $t3, 0x03CC($s0)           ## 000003CC
/* 0020C 80AA625C E6120364 */  swc1    $f18, 0x0364($s0)          ## 00000364
/* 00210 80AA6260 8FA50044 */  lw      $a1, 0x0044($sp)
/* 00214 80AA6264 26040024 */  addiu   $a0, $s0, 0x0024           ## $a0 = 00000024
/* 00218 80AA6268 0C01E01A */  jal     Math_Vec3f_Yaw

/* 0021C 80AA626C 24A50024 */  addiu   $a1, $a1, 0x0024           ## $a1 = 00000024
/* 00220 80AA6270 86050032 */  lh      $a1, 0x0032($s0)           ## 00000032
/* 00224 80AA6274 3C068003 */  lui     $a2, %hi(ActorShadow_DrawFunc_Teardrop)
/* 00228 80AA6278 24C6B8C4 */  addiu   $a2, %lo(ActorShadow_DrawFunc_Teardrop)
/* 0022C 80AA627C 00A22023 */  subu    $a0, $a1, $v0
/* 00230 80AA6280 00042400 */  sll     $a0, $a0, 16
/* 00234 80AA6284 00042403 */  sra     $a0, $a0, 16
/* 00238 80AA6288 04800003 */  bltz    $a0, .L80AA6298
/* 0023C 80AA628C 3C0742B4 */  lui     $a3, 0x42B4                ## $a3 = 42B40000
/* 00240 80AA6290 10000002 */  beq     $zero, $zero, .L80AA629C
/* 00244 80AA6294 00801825 */  or      $v1, $a0, $zero            ## $v1 = 00000000
.L80AA6298:
/* 00248 80AA6298 00041823 */  subu    $v1, $zero, $a0
.L80AA629C:
/* 0024C 80AA629C 28614001 */  slti    $at, $v1, 0x4001
/* 00250 80AA62A0 1420000A */  bne     $at, $zero, .L80AA62CC
/* 00254 80AA62A4 34018000 */  ori     $at, $zero, 0x8000         ## $at = 00008000
/* 00258 80AA62A8 00A16021 */  addu    $t4, $a1, $at
/* 0025C 80AA62AC 3C014416 */  lui     $at, 0x4416                ## $at = 44160000
/* 00260 80AA62B0 44813000 */  mtc1    $at, $f6                   ## $f6 = 600.00
/* 00264 80AA62B4 C604002C */  lwc1    $f4, 0x002C($s0)           ## 0000002C
/* 00268 80AA62B8 A60C0032 */  sh      $t4, 0x0032($s0)           ## 00000032
/* 0026C 80AA62BC 860D0032 */  lh      $t5, 0x0032($s0)           ## 00000032
/* 00270 80AA62C0 46062200 */  add.s   $f8, $f4, $f6
/* 00274 80AA62C4 A60D00B6 */  sh      $t5, 0x00B6($s0)           ## 000000B6
/* 00278 80AA62C8 E608002C */  swc1    $f8, 0x002C($s0)           ## 0000002C
.L80AA62CC:
/* 0027C 80AA62CC 8FA40034 */  lw      $a0, 0x0034($sp)
/* 00280 80AA62D0 0C00AC78 */  jal     ActorShape_Init

/* 00284 80AA62D4 24050000 */  addiu   $a1, $zero, 0x0000         ## $a1 = 00000000
/* 00288 80AA62D8 8E0E0004 */  lw      $t6, 0x0004($s0)           ## 00000004
/* 0028C 80AA62DC 92180117 */  lbu     $t8, 0x0117($s0)           ## 00000117
/* 00290 80AA62E0 2401FFFE */  addiu   $at, $zero, 0xFFFE         ## $at = FFFFFFFE
/* 00294 80AA62E4 01C17824 */  and     $t7, $t6, $at
/* 00298 80AA62E8 27190001 */  addiu   $t9, $t8, 0x0001           ## $t9 = 00000001
/* 0029C 80AA62EC AE0F0004 */  sw      $t7, 0x0004($s0)           ## 00000004
/* 002A0 80AA62F0 A2190117 */  sb      $t9, 0x0117($s0)           ## 00000117
/* 002A4 80AA62F4 0C2A9A26 */  jal     func_80AA6898
/* 002A8 80AA62F8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 002AC 80AA62FC 1000002A */  beq     $zero, $zero, .L80AA63A8
/* 002B0 80AA6300 8FBF002C */  lw      $ra, 0x002C($sp)
.L80AA6304:
/* 002B4 80AA6304 3C060601 */  lui     $a2, 0x0601                ## $a2 = 06010000
/* 002B8 80AA6308 3C070600 */  lui     $a3, 0x0600                ## $a3 = 06000000
/* 002BC 80AA630C 260801D0 */  addiu   $t0, $s0, 0x01D0           ## $t0 = 000001D0
/* 002C0 80AA6310 26090278 */  addiu   $t1, $s0, 0x0278           ## $t1 = 00000278
/* 002C4 80AA6314 240A001C */  addiu   $t2, $zero, 0x001C         ## $t2 = 0000001C
/* 002C8 80AA6318 AFAA0018 */  sw      $t2, 0x0018($sp)
/* 002CC 80AA631C AFA90014 */  sw      $t1, 0x0014($sp)
/* 002D0 80AA6320 AFA80010 */  sw      $t0, 0x0010($sp)
/* 002D4 80AA6324 24E728E0 */  addiu   $a3, $a3, 0x28E0           ## $a3 = 060028E0
/* 002D8 80AA6328 24C68F38 */  addiu   $a2, $a2, 0x8F38           ## $a2 = 06008F38
/* 002DC 80AA632C 0C0291BE */  jal     SkelAnime_InitFlex
/* 002E0 80AA6330 2605018C */  addiu   $a1, $s0, 0x018C           ## $a1 = 0000018C
/* 002E4 80AA6334 3C053C65 */  lui     $a1, 0x3C65                ## $a1 = 3C650000
/* 002E8 80AA6338 34A56042 */  ori     $a1, $a1, 0x6042           ## $a1 = 3C656042
/* 002EC 80AA633C 0C00B58B */  jal     Actor_SetScale

/* 002F0 80AA6340 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 002F4 80AA6344 860B001C */  lh      $t3, 0x001C($s0)           ## 0000001C
/* 002F8 80AA6348 3C0143AF */  lui     $at, 0x43AF                ## $at = 43AF0000
/* 002FC 80AA634C 44815000 */  mtc1    $at, $f10                  ## $f10 = 350.00
/* 00300 80AA6350 316CFF00 */  andi    $t4, $t3, 0xFF00           ## $t4 = 00000000
/* 00304 80AA6354 000C6A03 */  sra     $t5, $t4,  8
/* 00308 80AA6358 240E0001 */  addiu   $t6, $zero, 0x0001         ## $t6 = 00000001
/* 0030C 80AA635C 240F0001 */  addiu   $t7, $zero, 0x0001         ## $t7 = 00000001
/* 00310 80AA6360 241800FE */  addiu   $t8, $zero, 0x00FE         ## $t8 = 000000FE
/* 00314 80AA6364 8E190004 */  lw      $t9, 0x0004($s0)           ## 00000004
/* 00318 80AA6368 A20D035D */  sb      $t5, 0x035D($s0)           ## 0000035D
/* 0031C 80AA636C A60E001C */  sh      $t6, 0x001C($s0)           ## 0000001C
/* 00320 80AA6370 A200035C */  sb      $zero, 0x035C($s0)         ## 0000035C
/* 00324 80AA6374 A20F00AF */  sb      $t7, 0x00AF($s0)           ## 000000AF
/* 00328 80AA6378 A21800AE */  sb      $t8, 0x00AE($s0)           ## 000000AE
/* 0032C 80AA637C 3C0180AB */  lui     $at, %hi(D_80AA9E78)       ## $at = 80AB0000
/* 00330 80AA6380 E60A0360 */  swc1    $f10, 0x0360($s0)          ## 00000360
/* 00334 80AA6384 C4309E78 */  lwc1    $f16, %lo(D_80AA9E78)($at)
/* 00338 80AA6388 2401FFFE */  addiu   $at, $zero, 0xFFFE         ## $at = FFFFFFFE
/* 0033C 80AA638C 03214024 */  and     $t0, $t9, $at
/* 00340 80AA6390 AE080004 */  sw      $t0, 0x0004($s0)           ## 00000004
/* 00344 80AA6394 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00348 80AA6398 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 0034C 80AA639C 0C2A9A3F */  jal     func_80AA68FC
/* 00350 80AA63A0 E6100364 */  swc1    $f16, 0x0364($s0)          ## 00000364
/* 00354 80AA63A4 8FBF002C */  lw      $ra, 0x002C($sp)
.L80AA63A8:
/* 00358 80AA63A8 8FB00024 */  lw      $s0, 0x0024($sp)
/* 0035C 80AA63AC 8FB10028 */  lw      $s1, 0x0028($sp)
/* 00360 80AA63B0 03E00008 */  jr      $ra
/* 00364 80AA63B4 27BD0050 */  addiu   $sp, $sp, 0x0050           ## $sp = 00000000
