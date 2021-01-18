.rdata
glabel D_80A327C0
    .asciz "\x1b[36m谷底 ゲルド 撤退 \n\x1b[m"
    .balign 4

glabel D_80A327DC
    .asciz "\x1b[36mやぶさめ ゲルド EVENT_INF(0) = %x\n\x1b[m"
    .balign 4

.text
glabel EnGe1_Init
/* 00000 80A30970 27BDFFC0 */  addiu   $sp, $sp, 0xFFC0           ## $sp = FFFFFFC0
/* 00004 80A30974 AFB00028 */  sw      $s0, 0x0028($sp)
/* 00008 80A30978 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 0000C 80A3097C AFBF002C */  sw      $ra, 0x002C($sp)
/* 00010 80A30980 AFA50044 */  sw      $a1, 0x0044($sp)
/* 00014 80A30984 3C068003 */  lui     $a2, %hi(ActorShadow_DrawCircle)
/* 00018 80A30988 24C6B5EC */  addiu   $a2, %lo(ActorShadow_DrawCircle)
/* 0001C 80A3098C 24050000 */  addiu   $a1, $zero, 0x0000         ## $a1 = 00000000
/* 00020 80A30990 248400B4 */  addiu   $a0, $a0, 0x00B4           ## $a0 = 000000B4
/* 00024 80A30994 0C00AC78 */  jal     ActorShape_Init

/* 00028 80A30998 3C0741F0 */  lui     $a3, 0x41F0                ## $a3 = 41F00000
/* 0002C 80A3099C 26050198 */  addiu   $a1, $s0, 0x0198           ## $a1 = 00000198
/* 00030 80A309A0 3C060600 */  lui     $a2, %hi(D_06000330)                ## $a2 = 06000000
/* 00034 80A309A4 3C070600 */  lui     $a3, %hi(D_06000228)                ## $a3 = 06000000
/* 00038 80A309A8 260E01DC */  addiu   $t6, $s0, 0x01DC           ## $t6 = 000001DC
/* 0003C 80A309AC 260F023C */  addiu   $t7, $s0, 0x023C           ## $t7 = 0000023C
/* 00040 80A309B0 24180010 */  addiu   $t8, $zero, 0x0010         ## $t8 = 00000010
/* 00044 80A309B4 AFB80018 */  sw      $t8, 0x0018($sp)
/* 00048 80A309B8 AFAF0014 */  sw      $t7, 0x0014($sp)
/* 0004C 80A309BC AFAE0010 */  sw      $t6, 0x0010($sp)
/* 00050 80A309C0 24E70228 */  addiu   $a3, $a3, %lo(D_06000228)           ## $a3 = 06000228
/* 00054 80A309C4 24C60330 */  addiu   $a2, $a2, %lo(D_06000330)           ## $a2 = 06000330
/* 00058 80A309C8 AFA50030 */  sw      $a1, 0x0030($sp)
/* 0005C 80A309CC 0C0291BE */  jal     SkelAnime_InitFlex
/* 00060 80A309D0 8FA40044 */  lw      $a0, 0x0044($sp)
/* 00064 80A309D4 3C050600 */  lui     $a1, %hi(D_06000228)                ## $a1 = 06000000
/* 00068 80A309D8 24A50228 */  addiu   $a1, $a1, %lo(D_06000228)           ## $a1 = 06000228
/* 0006C 80A309DC 0C02947A */  jal     Animation_PlayOnce
/* 00070 80A309E0 8FA40030 */  lw      $a0, 0x0030($sp)
/* 00074 80A309E4 2605014C */  addiu   $a1, $s0, 0x014C           ## $a1 = 0000014C
/* 00078 80A309E8 AFA50030 */  sw      $a1, 0x0030($sp)
/* 0007C 80A309EC 0C0170D9 */  jal     Collider_InitCylinder

/* 00080 80A309F0 8FA40044 */  lw      $a0, 0x0044($sp)
/* 00084 80A309F4 3C0780A3 */  lui     $a3, %hi(D_80A32770)       ## $a3 = 80A30000
/* 00088 80A309F8 8FA50030 */  lw      $a1, 0x0030($sp)
/* 0008C 80A309FC 24E72770 */  addiu   $a3, $a3, %lo(D_80A32770)  ## $a3 = 80A32770
/* 00090 80A30A00 8FA40044 */  lw      $a0, 0x0044($sp)
/* 00094 80A30A04 0C01712B */  jal     Collider_SetCylinder

/* 00098 80A30A08 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 0009C 80A30A0C 3C080600 */  lui     $t0, %hi(D_06000228)                ## $t0 = 06000000
/* 000A0 80A30A10 3C0980A3 */  lui     $t1, %hi(func_80A323B0)    ## $t1 = 80A30000
/* 000A4 80A30A14 241900FF */  addiu   $t9, $zero, 0x00FF         ## $t9 = 000000FF
/* 000A8 80A30A18 25080228 */  addiu   $t0, $t0, %lo(D_06000228)           ## $t0 = 06000228
/* 000AC 80A30A1C 252923B0 */  addiu   $t1, $t1, %lo(func_80A323B0) ## $t1 = 80A323B0
/* 000B0 80A30A20 240A0006 */  addiu   $t2, $zero, 0x0006         ## $t2 = 00000006
/* 000B4 80A30A24 3C053C23 */  lui     $a1, 0x3C23                ## $a1 = 3C230000
/* 000B8 80A30A28 A21900AE */  sb      $t9, 0x00AE($s0)           ## 000000AE
/* 000BC 80A30A2C AE0802B0 */  sw      $t0, 0x02B0($s0)           ## 000002B0
/* 000C0 80A30A30 AE0902B8 */  sw      $t1, 0x02B8($s0)           ## 000002B8
/* 000C4 80A30A34 A20A001F */  sb      $t2, 0x001F($s0)           ## 0000001F
/* 000C8 80A30A38 34A5D70A */  ori     $a1, $a1, 0xD70A           ## $a1 = 3C23D70A
/* 000CC 80A30A3C 0C00B58B */  jal     Actor_SetScale

/* 000D0 80A30A40 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 000D4 80A30A44 8FAB0044 */  lw      $t3, 0x0044($sp)
/* 000D8 80A30A48 2401005A */  addiu   $at, $zero, 0x005A         ## $at = 0000005A
/* 000DC 80A30A4C 3C0E80A3 */  lui     $t6, %hi(func_80A31880)    ## $t6 = 80A30000
/* 000E0 80A30A50 856C00A4 */  lh      $t4, 0x00A4($t3)           ## 000000A4
/* 000E4 80A30A54 240D0002 */  addiu   $t5, $zero, 0x0002         ## $t5 = 00000002
/* 000E8 80A30A58 25CE1880 */  addiu   $t6, $t6, %lo(func_80A31880) ## $t6 = 80A31880
/* 000EC 80A30A5C 15810004 */  bne     $t4, $at, .L80A30A70
/* 000F0 80A30A60 3C01447A */  lui     $at, 0x447A                ## $at = 447A0000
/* 000F4 80A30A64 44812000 */  mtc1    $at, $f4                   ## $f4 = 1000.00
/* 000F8 80A30A68 10000005 */  beq     $zero, $zero, .L80A30A80
/* 000FC 80A30A6C E60400F4 */  swc1    $f4, 0x00F4($s0)           ## 000000F4
.L80A30A70:
/* 00100 80A30A70 3C014496 */  lui     $at, 0x4496                ## $at = 44960000
/* 00104 80A30A74 44813000 */  mtc1    $at, $f6                   ## $f6 = 1200.00
/* 00108 80A30A78 00000000 */  nop
/* 0010C 80A30A7C E60600F4 */  swc1    $f6, 0x00F4($s0)           ## 000000F4
.L80A30A80:
/* 00110 80A30A80 8602001C */  lh      $v0, 0x001C($s0)           ## 0000001C
/* 00114 80A30A84 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 00118 80A30A88 304200FF */  andi    $v0, $v0, 0x00FF           ## $v0 = 00000000
/* 0011C 80A30A8C 50400012 */  beql    $v0, $zero, .L80A30AD8
/* 00120 80A30A90 A20D02AE */  sb      $t5, 0x02AE($s0)           ## 000002AE
/* 00124 80A30A94 10410012 */  beq     $v0, $at, .L80A30AE0
/* 00128 80A30A98 240F0001 */  addiu   $t7, $zero, 0x0001         ## $t7 = 00000001
/* 0012C 80A30A9C 24010004 */  addiu   $at, $zero, 0x0004         ## $at = 00000004
/* 00130 80A30AA0 1041001A */  beq     $v0, $at, .L80A30B0C
/* 00134 80A30AA4 24080001 */  addiu   $t0, $zero, 0x0001         ## $t0 = 00000001
/* 00138 80A30AA8 24010005 */  addiu   $at, $zero, 0x0005         ## $at = 00000005
/* 0013C 80A30AAC 10410022 */  beq     $v0, $at, .L80A30B38
/* 00140 80A30AB0 3C0B8016 */  lui     $t3, %hi(gSaveContext+4)
/* 00144 80A30AB4 24010045 */  addiu   $at, $zero, 0x0045         ## $at = 00000045
/* 00148 80A30AB8 1041002D */  beq     $v0, $at, .L80A30B70
/* 0014C 80A30ABC 3C0D8012 */  lui     $t5, %hi(gItemSlots+3)
/* 00150 80A30AC0 24010046 */  addiu   $at, $zero, 0x0046         ## $at = 00000046
/* 00154 80A30AC4 10410050 */  beq     $v0, $at, .L80A30C08
/* 00158 80A30AC8 240C0001 */  addiu   $t4, $zero, 0x0001         ## $t4 = 00000001
/* 0015C 80A30ACC 10000059 */  beq     $zero, $zero, .L80A30C34
/* 00160 80A30AD0 A60002AC */  sh      $zero, 0x02AC($s0)         ## 000002AC
/* 00164 80A30AD4 A20D02AE */  sb      $t5, 0x02AE($s0)           ## 000002AE
.L80A30AD8:
/* 00168 80A30AD8 10000055 */  beq     $zero, $zero, .L80A30C30
/* 0016C 80A30ADC AE0E02B4 */  sw      $t6, 0x02B4($s0)           ## 000002B4
.L80A30AE0:
/* 00170 80A30AE0 0C28C373 */  jal     func_80A30DCC
/* 00174 80A30AE4 A20F02AE */  sb      $t7, 0x02AE($s0)           ## 000002AE
/* 00178 80A30AE8 10400005 */  beq     $v0, $zero, .L80A30B00
/* 0017C 80A30AEC 3C1980A3 */  lui     $t9, %hi(func_80A30F48)    ## $t9 = 80A30000
/* 00180 80A30AF0 3C1880A3 */  lui     $t8, %hi(func_80A317C0)    ## $t8 = 80A30000
/* 00184 80A30AF4 271817C0 */  addiu   $t8, $t8, %lo(func_80A317C0) ## $t8 = 80A317C0
/* 00188 80A30AF8 1000004D */  beq     $zero, $zero, .L80A30C30
/* 0018C 80A30AFC AE1802B4 */  sw      $t8, 0x02B4($s0)           ## 000002B4
.L80A30B00:
/* 00190 80A30B00 27390F48 */  addiu   $t9, $t9, %lo(func_80A30F48) ## $t9 = 80A30F48
/* 00194 80A30B04 1000004A */  beq     $zero, $zero, .L80A30C30
/* 00198 80A30B08 AE1902B4 */  sw      $t9, 0x02B4($s0)           ## 000002B4
.L80A30B0C:
/* 0019C 80A30B0C 0C28C373 */  jal     func_80A30DCC
/* 001A0 80A30B10 A20802AE */  sb      $t0, 0x02AE($s0)           ## 000002AE
/* 001A4 80A30B14 10400005 */  beq     $v0, $zero, .L80A30B2C
/* 001A8 80A30B18 3C0A80A3 */  lui     $t2, %hi(func_80A310C4)    ## $t2 = 80A30000
/* 001AC 80A30B1C 3C0980A3 */  lui     $t1, %hi(func_80A31094)    ## $t1 = 80A30000
/* 001B0 80A30B20 25291094 */  addiu   $t1, $t1, %lo(func_80A31094) ## $t1 = 80A31094
/* 001B4 80A30B24 10000042 */  beq     $zero, $zero, .L80A30C30
/* 001B8 80A30B28 AE0902B4 */  sw      $t1, 0x02B4($s0)           ## 000002B4
.L80A30B2C:
/* 001BC 80A30B2C 254A10C4 */  addiu   $t2, $t2, %lo(func_80A310C4) ## $t2 = 80A310C4
/* 001C0 80A30B30 1000003F */  beq     $zero, $zero, .L80A30C30
/* 001C4 80A30B34 AE0A02B4 */  sw      $t2, 0x02B4($s0)           ## 000002B4
.L80A30B38:
/* 001C8 80A30B38 8D6BE664 */  lw      $t3, %lo(gSaveContext+4)($t3)
/* 001CC 80A30B3C 3C0C80A3 */  lui     $t4, %hi(func_80A3118C)    ## $t4 = 80A30000
/* 001D0 80A30B40 3C0480A3 */  lui     $a0, %hi(D_80A327C0)       ## $a0 = 80A30000
/* 001D4 80A30B44 15600007 */  bne     $t3, $zero, .L80A30B64
/* 001D8 80A30B48 258C118C */  addiu   $t4, $t4, %lo(func_80A3118C) ## $t4 = 80A3118C
/* 001DC 80A30B4C 0C00084C */  jal     osSyncPrintf

/* 001E0 80A30B50 248427C0 */  addiu   $a0, $a0, %lo(D_80A327C0)  ## $a0 = 80A327C0
/* 001E4 80A30B54 0C00B55C */  jal     Actor_Kill

/* 001E8 80A30B58 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 001EC 80A30B5C 10000036 */  beq     $zero, $zero, .L80A30C38
/* 001F0 80A30B60 8FBF002C */  lw      $ra, 0x002C($sp)
.L80A30B64:
/* 001F4 80A30B64 A20002AE */  sb      $zero, 0x02AE($s0)         ## 000002AE
/* 001F8 80A30B68 10000031 */  beq     $zero, $zero, .L80A30C30
/* 001FC 80A30B6C AE0C02B4 */  sw      $t4, 0x02B4($s0)           ## 000002B4
.L80A30B70:
/* 00200 80A30B70 91AD7467 */  lbu     $t5, %lo(gItemSlots+3)($t5)
/* 00204 80A30B74 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00208 80A30B78 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 0020C 80A30B7C 004D7021 */  addu    $t6, $v0, $t5
/* 00210 80A30B80 91CF0074 */  lbu     $t7, 0x0074($t6)           ## 00000074
/* 00214 80A30B84 240100FF */  addiu   $at, $zero, 0x00FF         ## $at = 000000FF
/* 00218 80A30B88 24180003 */  addiu   $t8, $zero, 0x0003         ## $t8 = 00000003
/* 0021C 80A30B8C 15E10005 */  bne     $t7, $at, .L80A30BA4
/* 00220 80A30B90 3C0480A3 */  lui     $a0, %hi(D_80A327DC)       ## $a0 = 80A30000
/* 00224 80A30B94 0C00B55C */  jal     Actor_Kill

/* 00228 80A30B98 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0022C 80A30B9C 10000026 */  beq     $zero, $zero, .L80A30C38
/* 00230 80A30BA0 8FBF002C */  lw      $ra, 0x002C($sp)
.L80A30BA4:
/* 00234 80A30BA4 A218001F */  sb      $t8, 0x001F($s0)           ## 0000001F
/* 00238 80A30BA8 A20002AE */  sb      $zero, 0x02AE($s0)         ## 000002AE
/* 0023C 80A30BAC 944513FA */  lhu     $a1, 0x13FA($v0)           ## 000013FA
/* 00240 80A30BB0 0C00084C */  jal     osSyncPrintf

/* 00244 80A30BB4 248427DC */  addiu   $a0, $a0, %lo(D_80A327DC)  ## $a0 = 000027DC
/* 00248 80A30BB8 3C198016 */  lui     $t9, %hi(gSaveContext+0x13fa)
/* 0024C 80A30BBC 9739FA5A */  lhu     $t9, %lo(gSaveContext+0x13fa)($t9)
/* 00250 80A30BC0 3C0980A3 */  lui     $t1, %hi(func_80A31E2C)    ## $t1 = 80A30000
/* 00254 80A30BC4 25291E2C */  addiu   $t1, $t1, %lo(func_80A31E2C) ## $t1 = 80A31E2C
/* 00258 80A30BC8 33280100 */  andi    $t0, $t9, 0x0100           ## $t0 = 00000000
/* 0025C 80A30BCC 11000003 */  beq     $t0, $zero, .L80A30BDC
/* 00260 80A30BD0 00000000 */  nop
/* 00264 80A30BD4 10000016 */  beq     $zero, $zero, .L80A30C30
/* 00268 80A30BD8 AE0902B4 */  sw      $t1, 0x02B4($s0)           ## 000002B4
.L80A30BDC:
/* 0026C 80A30BDC 0C28C373 */  jal     func_80A30DCC
/* 00270 80A30BE0 00000000 */  nop
/* 00274 80A30BE4 10400005 */  beq     $v0, $zero, .L80A30BFC
/* 00278 80A30BE8 3C0B80A3 */  lui     $t3, %hi(func_80A30F48)    ## $t3 = 80A30000
/* 0027C 80A30BEC 3C0A80A3 */  lui     $t2, %hi(func_80A31FE0)    ## $t2 = 80A30000
/* 00280 80A30BF0 254A1FE0 */  addiu   $t2, $t2, %lo(func_80A31FE0) ## $t2 = 80A31FE0
/* 00284 80A30BF4 1000000E */  beq     $zero, $zero, .L80A30C30
/* 00288 80A30BF8 AE0A02B4 */  sw      $t2, 0x02B4($s0)           ## 000002B4
.L80A30BFC:
/* 0028C 80A30BFC 256B0F48 */  addiu   $t3, $t3, %lo(func_80A30F48) ## $t3 = 80A30F48
/* 00290 80A30C00 1000000B */  beq     $zero, $zero, .L80A30C30
/* 00294 80A30C04 AE0B02B4 */  sw      $t3, 0x02B4($s0)           ## 000002B4
.L80A30C08:
/* 00298 80A30C08 0C28C373 */  jal     func_80A30DCC
/* 0029C 80A30C0C A20C02AE */  sb      $t4, 0x02AE($s0)           ## 000002AE
/* 002A0 80A30C10 10400005 */  beq     $v0, $zero, .L80A30C28
/* 002A4 80A30C14 3C0E80A3 */  lui     $t6, %hi(func_80A30F48)    ## $t6 = 80A30000
/* 002A8 80A30C18 3C0D80A3 */  lui     $t5, %hi(func_80A31514)    ## $t5 = 80A30000
/* 002AC 80A30C1C 25AD1514 */  addiu   $t5, $t5, %lo(func_80A31514) ## $t5 = 80A31514
/* 002B0 80A30C20 10000003 */  beq     $zero, $zero, .L80A30C30
/* 002B4 80A30C24 AE0D02B4 */  sw      $t5, 0x02B4($s0)           ## 000002B4
.L80A30C28:
/* 002B8 80A30C28 25CE0F48 */  addiu   $t6, $t6, %lo(func_80A30F48) ## $t6 = 80A30F48
/* 002BC 80A30C2C AE0E02B4 */  sw      $t6, 0x02B4($s0)           ## 000002B4
.L80A30C30:
/* 002C0 80A30C30 A60002AC */  sh      $zero, 0x02AC($s0)         ## 000002AC
.L80A30C34:
/* 002C4 80A30C34 8FBF002C */  lw      $ra, 0x002C($sp)
.L80A30C38:
/* 002C8 80A30C38 8FB00028 */  lw      $s0, 0x0028($sp)
/* 002CC 80A30C3C 27BD0040 */  addiu   $sp, $sp, 0x0040           ## $sp = 00000000
/* 002D0 80A30C40 03E00008 */  jr      $ra
/* 002D4 80A30C44 00000000 */  nop
