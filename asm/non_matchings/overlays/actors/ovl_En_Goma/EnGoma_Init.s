.late_rodata
glabel D_80A4B8F0
 .word 0xBFA66666
glabel D_80A4B8F4
    .float 2.3

glabel D_80A4B8F8
    .float 0.005

glabel D_80A4B8FC
    .float 0.01

glabel D_80A4B900
    .float 0.005

glabel D_80A4B904
    .float 0.01

glabel D_80A4B908
    .float 0.005

glabel D_80A4B90C
    .float 0.01

glabel D_80A4B910
 .word 0xC4BB8000
glabel D_80A4B914
    .float 1500.0

.text
glabel EnGoma_Init
/* 00000 80A48EC0 27BDFFC0 */  addiu   $sp, $sp, 0xFFC0           ## $sp = FFFFFFC0
/* 00004 80A48EC4 AFBF002C */  sw      $ra, 0x002C($sp)
/* 00008 80A48EC8 AFB00028 */  sw      $s0, 0x0028($sp)
/* 0000C 80A48ECC 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00010 80A48ED0 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 00014 80A48ED4 AFA50044 */  sw      $a1, 0x0044($sp)
/* 00018 80A48ED8 3C014348 */  lui     $at, 0x4348                ## $at = 43480000
/* 0001C 80A48EDC 44812000 */  mtc1    $at, $f4                   ## $f4 = 200.00
/* 00020 80A48EE0 3C0580A5 */  lui     $a1, %hi(D_80A4B808)       ## $a1 = 80A50000
/* 00024 80A48EE4 24A5B808 */  addiu   $a1, $a1, %lo(D_80A4B808)  ## $a1 = 80A4B808
/* 00028 80A48EE8 46040182 */  mul.s   $f6, $f0, $f4
/* 0002C 80A48EEC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00030 80A48EF0 4600320D */  trunc.w.s $f8, $f6
/* 00034 80A48EF4 440F4000 */  mfc1    $t7, $f8
/* 00038 80A48EF8 0C01E037 */  jal     Actor_ProcessInitChain

/* 0003C 80A48EFC A60F02C0 */  sh      $t7, 0x02C0($s0)           ## 000002C0
/* 00040 80A48F00 3C053C23 */  lui     $a1, 0x3C23                ## $a1 = 3C230000
/* 00044 80A48F04 34A5D70A */  ori     $a1, $a1, 0xD70A           ## $a1 = 3C23D70A
/* 00048 80A48F08 0C00B58B */  jal     Actor_SetScale

/* 0004C 80A48F0C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00050 80A48F10 8602001C */  lh      $v0, 0x001C($s0)           ## 0000001C
/* 00054 80A48F14 8FA40044 */  lw      $a0, 0x0044($sp)
/* 00058 80A48F18 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 0005C 80A48F1C 28410064 */  slti    $at, $v0, 0x0064
/* 00060 80A48F20 14200017 */  bne     $at, $zero, .L80A48F80
/* 00064 80A48F24 24851C24 */  addiu   $a1, $a0, 0x1C24           ## $a1 = 00001C24
/* 00068 80A48F28 0C00CDD2 */  jal     Actor_ChangeType

/* 0006C 80A48F2C 24070009 */  addiu   $a3, $zero, 0x0009         ## $a3 = 00000009
/* 00070 80A48F30 44801000 */  mtc1    $zero, $f2                 ## $f2 = 0.00
/* 00074 80A48F34 3C1880A5 */  lui     $t8, %hi(func_80A4B554)    ## $t8 = 80A50000
/* 00078 80A48F38 2718B554 */  addiu   $t8, $t8, %lo(func_80A4B554) ## $t8 = 80A4B554
/* 0007C 80A48F3C 24190003 */  addiu   $t9, $zero, 0x0003         ## $t9 = 00000003
/* 00080 80A48F40 3C068003 */  lui     $a2, %hi(ActorShadow_DrawFunc_Circle)
/* 00084 80A48F44 44051000 */  mfc1    $a1, $f2
/* 00088 80A48F48 44071000 */  mfc1    $a3, $f2
/* 0008C 80A48F4C AE1802B0 */  sw      $t8, 0x02B0($s0)           ## 000002B0
/* 00090 80A48F50 A61902B8 */  sh      $t9, 0x02B8($s0)           ## 000002B8
/* 00094 80A48F54 24C6B5EC */  addiu   $a2, %lo(ActorShadow_DrawFunc_Circle)
/* 00098 80A48F58 0C00AC78 */  jal     ActorShape_Init

/* 0009C 80A48F5C 260400B4 */  addiu   $a0, $s0, 0x00B4           ## $a0 = 000000B4
/* 000A0 80A48F60 8608001C */  lh      $t0, 0x001C($s0)           ## 0000001C
/* 000A4 80A48F64 8E0A0004 */  lw      $t2, 0x0004($s0)           ## 00000004
/* 000A8 80A48F68 2401FFFE */  addiu   $at, $zero, 0xFFFE         ## $at = FFFFFFFE
/* 000AC 80A48F6C 25090096 */  addiu   $t1, $t0, 0x0096           ## $t1 = 00000096
/* 000B0 80A48F70 01415824 */  and     $t3, $t2, $at
/* 000B4 80A48F74 A60902CC */  sh      $t1, 0x02CC($s0)           ## 000002CC
/* 000B8 80A48F78 100000AE */  beq     $zero, $zero, .L80A49234
/* 000BC 80A48F7C AE0B0004 */  sw      $t3, 0x0004($s0)           ## 00000004
.L80A48F80:
/* 000C0 80A48F80 2841000A */  slti    $at, $v0, 0x000A
/* 000C4 80A48F84 14200043 */  bne     $at, $zero, .L80A49094
/* 000C8 80A48F88 260400B4 */  addiu   $a0, $s0, 0x00B4           ## $a0 = 000000B4
/* 000CC 80A48F8C 8E0C0004 */  lw      $t4, 0x0004($s0)           ## 00000004
/* 000D0 80A48F90 3C0180A5 */  lui     $at, %hi(D_80A4B8F0)       ## $at = 80A50000
/* 000D4 80A48F94 C42AB8F0 */  lwc1    $f10, %lo(D_80A4B8F0)($at)
/* 000D8 80A48F98 2401FFFE */  addiu   $at, $zero, 0xFFFE         ## $at = FFFFFFFE
/* 000DC 80A48F9C 01816824 */  and     $t5, $t4, $at
/* 000E0 80A48FA0 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 000E4 80A48FA4 44818000 */  mtc1    $at, $f16                  ## $f16 = 1.00
/* 000E8 80A48FA8 240E0032 */  addiu   $t6, $zero, 0x0032         ## $t6 = 00000032
/* 000EC 80A48FAC 240F0002 */  addiu   $t7, $zero, 0x0002         ## $t7 = 00000002
/* 000F0 80A48FB0 AE0D0004 */  sw      $t5, 0x0004($s0)           ## 00000004
/* 000F4 80A48FB4 A60E02CC */  sh      $t6, 0x02CC($s0)           ## 000002CC
/* 000F8 80A48FB8 A60F02B8 */  sh      $t7, 0x02B8($s0)           ## 000002B8
/* 000FC 80A48FBC E60A006C */  swc1    $f10, 0x006C($s0)          ## 0000006C
/* 00100 80A48FC0 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 00104 80A48FC4 E61002D0 */  swc1    $f16, 0x02D0($s0)          ## 000002D0
/* 00108 80A48FC8 3C0140A0 */  lui     $at, 0x40A0                ## $at = 40A00000
/* 0010C 80A48FCC 44811000 */  mtc1    $at, $f2                   ## $f2 = 5.00
/* 00110 80A48FD0 3C1880A5 */  lui     $t8, %hi(func_80A4B3AC)    ## $t8 = 80A50000
/* 00114 80A48FD4 2718B3AC */  addiu   $t8, $t8, %lo(func_80A4B3AC) ## $t8 = 80A4B3AC
/* 00118 80A48FD8 46020482 */  mul.s   $f18, $f0, $f2
/* 0011C 80A48FDC AE1802B0 */  sw      $t8, 0x02B0($s0)           ## 000002B0
/* 00120 80A48FE0 46029100 */  add.s   $f4, $f18, $f2
/* 00124 80A48FE4 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 00128 80A48FE8 E6040060 */  swc1    $f4, 0x0060($s0)           ## 00000060
/* 0012C 80A48FEC 3C0180A5 */  lui     $at, %hi(D_80A4B8F4)       ## $at = 80A50000
/* 00130 80A48FF0 C426B8F4 */  lwc1    $f6, %lo(D_80A4B8F4)($at)
/* 00134 80A48FF4 3C013FC0 */  lui     $at, 0x3FC0                ## $at = 3FC00000
/* 00138 80A48FF8 44815000 */  mtc1    $at, $f10                  ## $f10 = 1.50
/* 0013C 80A48FFC 46060202 */  mul.s   $f8, $f0, $f6
/* 00140 80A49000 2419001E */  addiu   $t9, $zero, 0x001E         ## $t9 = 0000001E
/* 00144 80A49004 A61902CC */  sh      $t9, 0x02CC($s0)           ## 000002CC
/* 00148 80A49008 460A4400 */  add.s   $f16, $f8, $f10
/* 0014C 80A4900C 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 00150 80A49010 E6100068 */  swc1    $f16, 0x0068($s0)          ## 00000068
/* 00154 80A49014 3C0180A5 */  lui     $at, %hi(D_80A4B8F8)       ## $at = 80A50000
/* 00158 80A49018 C432B8F8 */  lwc1    $f18, %lo(D_80A4B8F8)($at)
/* 0015C 80A4901C 3C0180A5 */  lui     $at, %hi(D_80A4B8FC)       ## $at = 80A50000
/* 00160 80A49020 C426B8FC */  lwc1    $f6, %lo(D_80A4B8FC)($at)
/* 00164 80A49024 46120102 */  mul.s   $f4, $f0, $f18
/* 00168 80A49028 46062200 */  add.s   $f8, $f4, $f6
/* 0016C 80A4902C 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 00170 80A49030 E6080050 */  swc1    $f8, 0x0050($s0)           ## 00000050
/* 00174 80A49034 3C0180A5 */  lui     $at, %hi(D_80A4B900)       ## $at = 80A50000
/* 00178 80A49038 C42AB900 */  lwc1    $f10, %lo(D_80A4B900)($at)
/* 0017C 80A4903C 3C0180A5 */  lui     $at, %hi(D_80A4B904)       ## $at = 80A50000
/* 00180 80A49040 C432B904 */  lwc1    $f18, %lo(D_80A4B904)($at)
/* 00184 80A49044 460A0402 */  mul.s   $f16, $f0, $f10
/* 00188 80A49048 46128100 */  add.s   $f4, $f16, $f18
/* 0018C 80A4904C 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 00190 80A49050 E6040054 */  swc1    $f4, 0x0054($s0)           ## 00000054
/* 00194 80A49054 3C0180A5 */  lui     $at, %hi(D_80A4B908)       ## $at = 80A50000
/* 00198 80A49058 C426B908 */  lwc1    $f6, %lo(D_80A4B908)($at)
/* 0019C 80A4905C 3C0180A5 */  lui     $at, %hi(D_80A4B90C)       ## $at = 80A50000
/* 001A0 80A49060 C42AB90C */  lwc1    $f10, %lo(D_80A4B90C)($at)
/* 001A4 80A49064 46060202 */  mul.s   $f8, $f0, $f6
/* 001A8 80A49068 44801000 */  mtc1    $zero, $f2                 ## $f2 = 0.00
/* 001AC 80A4906C 3C068003 */  lui     $a2, %hi(ActorShadow_DrawFunc_Circle)
/* 001B0 80A49070 24C6B5EC */  addiu   $a2, %lo(ActorShadow_DrawFunc_Circle)
/* 001B4 80A49074 44051000 */  mfc1    $a1, $f2
/* 001B8 80A49078 44071000 */  mfc1    $a3, $f2
/* 001BC 80A4907C 260400B4 */  addiu   $a0, $s0, 0x00B4           ## $a0 = 000000B4
/* 001C0 80A49080 460A4400 */  add.s   $f16, $f8, $f10
/* 001C4 80A49084 0C00AC78 */  jal     ActorShape_Init

/* 001C8 80A49088 E6100058 */  swc1    $f16, 0x0058($s0)          ## 00000058
/* 001CC 80A4908C 1000006A */  beq     $zero, $zero, .L80A49238
/* 001D0 80A49090 8FBF002C */  lw      $ra, 0x002C($sp)
.L80A49094:
/* 001D4 80A49094 44801000 */  mtc1    $zero, $f2                 ## $f2 = 0.00
/* 001D8 80A49098 3C068003 */  lui     $a2, %hi(ActorShadow_DrawFunc_Circle)
/* 001DC 80A4909C 24C6B5EC */  addiu   $a2, %lo(ActorShadow_DrawFunc_Circle)
/* 001E0 80A490A0 44051000 */  mfc1    $a1, $f2
/* 001E4 80A490A4 0C00AC78 */  jal     ActorShape_Init

/* 001E8 80A490A8 3C074220 */  lui     $a3, 0x4220                ## $a3 = 42200000
/* 001EC 80A490AC 2605014C */  addiu   $a1, $s0, 0x014C           ## $a1 = 0000014C
/* 001F0 80A490B0 3C060600 */  lui     $a2, %hi(D_06003B40)                ## $a2 = 06000000
/* 001F4 80A490B4 3C070600 */  lui     $a3, %hi(D_06001548)                ## $a3 = 06000000
/* 001F8 80A490B8 26080190 */  addiu   $t0, $s0, 0x0190           ## $t0 = 00000190
/* 001FC 80A490BC 26090220 */  addiu   $t1, $s0, 0x0220           ## $t1 = 00000220
/* 00200 80A490C0 240A0018 */  addiu   $t2, $zero, 0x0018         ## $t2 = 00000018
/* 00204 80A490C4 AFAA0018 */  sw      $t2, 0x0018($sp)
/* 00208 80A490C8 AFA90014 */  sw      $t1, 0x0014($sp)
/* 0020C 80A490CC AFA80010 */  sw      $t0, 0x0010($sp)
/* 00210 80A490D0 24E71548 */  addiu   $a3, $a3, %lo(D_06001548)           ## $a3 = 06001548
/* 00214 80A490D4 24C63B40 */  addiu   $a2, $a2, %lo(D_06003B40)           ## $a2 = 06003B40
/* 00218 80A490D8 AFA50034 */  sw      $a1, 0x0034($sp)
/* 0021C 80A490DC 0C02915F */  jal     SkelAnime_Init

/* 00220 80A490E0 8FA40044 */  lw      $a0, 0x0044($sp)
/* 00224 80A490E4 3C050600 */  lui     $a1, %hi(D_06001548)                ## $a1 = 06000000
/* 00228 80A490E8 24A51548 */  addiu   $a1, $a1, %lo(D_06001548)           ## $a1 = 06001548
/* 0022C 80A490EC 0C0294BE */  jal     SkelAnime_ChangeAnimDefaultRepeat
/* 00230 80A490F0 8FA40034 */  lw      $a0, 0x0034($sp)
/* 00234 80A490F4 8602001C */  lh      $v0, 0x001C($s0)           ## 0000001C
/* 00238 80A490F8 240B0002 */  addiu   $t3, $zero, 0x0002         ## $t3 = 00000002
/* 0023C 80A490FC A20B00AF */  sb      $t3, 0x00AF($s0)           ## 000000AF
/* 00240 80A49100 28410003 */  slti    $at, $v0, 0x0003
/* 00244 80A49104 1020000A */  beq     $at, $zero, .L80A49130
/* 00248 80A49108 3C0C80A5 */  lui     $t4, %hi(func_80A493D8)    ## $t4 = 80A50000
/* 0024C 80A4910C 3C013FC0 */  lui     $at, 0x3FC0                ## $at = 3FC00000
/* 00250 80A49110 44819000 */  mtc1    $at, $f18                  ## $f18 = 1.50
/* 00254 80A49114 258C93D8 */  addiu   $t4, $t4, %lo(func_80A493D8) ## $t4 = 80A493D8
/* 00258 80A49118 240D000A */  addiu   $t5, $zero, 0x000A         ## $t5 = 0000000A
/* 0025C 80A4911C AE0C02B0 */  sw      $t4, 0x02B0($s0)           ## 000002B0
/* 00260 80A49120 A60D02CA */  sh      $t5, 0x02CA($s0)           ## 000002CA
/* 00264 80A49124 8602001C */  lh      $v0, 0x001C($s0)           ## 0000001C
/* 00268 80A49128 10000019 */  beq     $zero, $zero, .L80A49190
/* 0026C 80A4912C E6120068 */  swc1    $f18, 0x0068($s0)          ## 00000068
.L80A49130:
/* 00270 80A49130 24010008 */  addiu   $at, $zero, 0x0008         ## $at = 00000008
/* 00274 80A49134 10410003 */  beq     $v0, $at, .L80A49144
/* 00278 80A49138 3C0380A5 */  lui     $v1, %hi(D_80A4B7F8)       ## $v1 = 80A50000
/* 0027C 80A4913C 24010006 */  addiu   $at, $zero, 0x0006         ## $at = 00000006
/* 00280 80A49140 1441000B */  bne     $v0, $at, .L80A49170
.L80A49144:
/* 00284 80A49144 3C0E80A5 */  lui     $t6, %hi(func_80A49668)    ## $t6 = 80A50000
/* 00288 80A49148 25CE9668 */  addiu   $t6, $t6, %lo(func_80A49668) ## $t6 = 80A49668
/* 0028C 80A4914C 2463B7F8 */  addiu   $v1, $v1, %lo(D_80A4B7F8)  ## $v1 = 80A4B7F8
/* 00290 80A49150 AE0E02B0 */  sw      $t6, 0x02B0($s0)           ## 000002B0
/* 00294 80A49154 906F0000 */  lbu     $t7, 0x0000($v1)           ## 80A4B7F8
/* 00298 80A49158 A60F02C8 */  sh      $t7, 0x02C8($s0)           ## 000002C8
/* 0029C 80A4915C 90780000 */  lbu     $t8, 0x0000($v1)           ## 80A4B7F8
/* 002A0 80A49160 27190001 */  addiu   $t9, $t8, 0x0001           ## $t9 = 00000001
/* 002A4 80A49164 A0790000 */  sb      $t9, 0x0000($v1)           ## 80A4B7F8
/* 002A8 80A49168 10000009 */  beq     $zero, $zero, .L80A49190
/* 002AC 80A4916C 8602001C */  lh      $v0, 0x001C($s0)           ## 0000001C
.L80A49170:
/* 002B0 80A49170 24010009 */  addiu   $at, $zero, 0x0009         ## $at = 00000009
/* 002B4 80A49174 10410002 */  beq     $v0, $at, .L80A49180
/* 002B8 80A49178 24010007 */  addiu   $at, $zero, 0x0007         ## $at = 00000007
/* 002BC 80A4917C 14410004 */  bne     $v0, $at, .L80A49190
.L80A49180:
/* 002C0 80A49180 3C0880A5 */  lui     $t0, %hi(func_80A49668)    ## $t0 = 80A50000
/* 002C4 80A49184 25089668 */  addiu   $t0, $t0, %lo(func_80A49668) ## $t0 = 80A49668
/* 002C8 80A49188 AE0802B0 */  sw      $t0, 0x02B0($s0)           ## 000002B0
/* 002CC 80A4918C 8602001C */  lh      $v0, 0x001C($s0)           ## 0000001C
.L80A49190:
/* 002D0 80A49190 28410008 */  slti    $at, $v0, 0x0008
/* 002D4 80A49194 14200005 */  bne     $at, $zero, .L80A491AC
/* 002D8 80A49198 24090001 */  addiu   $t1, $zero, 0x0001         ## $t1 = 00000001
/* 002DC 80A4919C 3C0180A5 */  lui     $at, %hi(D_80A4B910)       ## $at = 80A50000
/* 002E0 80A491A0 C424B910 */  lwc1    $f4, %lo(D_80A4B910)($at)
/* 002E4 80A491A4 10000004 */  beq     $zero, $zero, .L80A491B8
/* 002E8 80A491A8 E60402F0 */  swc1    $f4, 0x02F0($s0)           ## 000002F0
.L80A491AC:
/* 002EC 80A491AC 3C0180A5 */  lui     $at, %hi(D_80A4B914)       ## $at = 80A50000
/* 002F0 80A491B0 C426B914 */  lwc1    $f6, %lo(D_80A4B914)($at)
/* 002F4 80A491B4 E60602F0 */  swc1    $f6, 0x02F0($s0)           ## 000002F0
.L80A491B8:
/* 002F8 80A491B8 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 002FC 80A491BC 44814000 */  mtc1    $at, $f8                   ## $f8 = 1.00
/* 00300 80A491C0 A60902B8 */  sh      $t1, 0x02B8($s0)           ## 000002B8
/* 00304 80A491C4 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 00308 80A491C8 E60802D0 */  swc1    $f8, 0x02D0($s0)           ## 000002D0
/* 0030C 80A491CC 3C01447A */  lui     $at, 0x447A                ## $at = 447A0000
/* 00310 80A491D0 44815000 */  mtc1    $at, $f10                  ## $f10 = 1000.00
/* 00314 80A491D4 240A0032 */  addiu   $t2, $zero, 0x0032         ## $t2 = 00000032
/* 00318 80A491D8 A60A02CC */  sh      $t2, 0x02CC($s0)           ## 000002CC
/* 0031C 80A491DC 460A0402 */  mul.s   $f16, $f0, $f10
/* 00320 80A491E0 2605030C */  addiu   $a1, $s0, 0x030C           ## $a1 = 0000030C
/* 00324 80A491E4 E61002D8 */  swc1    $f16, 0x02D8($s0)          ## 000002D8
/* 00328 80A491E8 AFA50034 */  sw      $a1, 0x0034($sp)
/* 0032C 80A491EC 0C0170D9 */  jal     Collider_InitCylinder

/* 00330 80A491F0 8FA40044 */  lw      $a0, 0x0044($sp)
/* 00334 80A491F4 3C0780A5 */  lui     $a3, %hi(D_80A4B7A0)       ## $a3 = 80A50000
/* 00338 80A491F8 8FA50034 */  lw      $a1, 0x0034($sp)
/* 0033C 80A491FC 24E7B7A0 */  addiu   $a3, $a3, %lo(D_80A4B7A0)  ## $a3 = 80A4B7A0
/* 00340 80A49200 8FA40044 */  lw      $a0, 0x0044($sp)
/* 00344 80A49204 0C01712B */  jal     Collider_SetCylinder

/* 00348 80A49208 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 0034C 80A4920C 26050358 */  addiu   $a1, $s0, 0x0358           ## $a1 = 00000358
/* 00350 80A49210 AFA50034 */  sw      $a1, 0x0034($sp)
/* 00354 80A49214 0C0170D9 */  jal     Collider_InitCylinder

/* 00358 80A49218 8FA40044 */  lw      $a0, 0x0044($sp)
/* 0035C 80A4921C 3C0780A5 */  lui     $a3, %hi(D_80A4B7CC)       ## $a3 = 80A50000
/* 00360 80A49220 8FA50034 */  lw      $a1, 0x0034($sp)
/* 00364 80A49224 24E7B7CC */  addiu   $a3, $a3, %lo(D_80A4B7CC)  ## $a3 = 80A4B7CC
/* 00368 80A49228 8FA40044 */  lw      $a0, 0x0044($sp)
/* 0036C 80A4922C 0C01712B */  jal     Collider_SetCylinder

/* 00370 80A49230 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
.L80A49234:
/* 00374 80A49234 8FBF002C */  lw      $ra, 0x002C($sp)
.L80A49238:
/* 00378 80A49238 8FB00028 */  lw      $s0, 0x0028($sp)
/* 0037C 80A4923C 27BD0040 */  addiu   $sp, $sp, 0x0040           ## $sp = 00000000
/* 00380 80A49240 03E00008 */  jr      $ra
/* 00384 80A49244 00000000 */  nop
