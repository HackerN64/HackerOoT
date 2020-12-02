.rdata
glabel D_80B16EA0
    .asciz "\x1b[36m 追放タロン \n\x1b[m"
    .balign 4

glabel D_80B16EB8
    .asciz "\x1b[36m 出戻りタロン \n\x1b[m"
    .balign 4

glabel D_80B16ED0
    .asciz "\x1b[36m 夜はいない \n\x1b[m"
    .balign 4

glabel D_80B16EE8
    .asciz "\x1b[36m その他のタロン \n\x1b[m"
    .balign 4

glabel D_80B16F04
    .asciz "\x1b[36m ロンロン牧場の倉庫 の タロン\n\x1b[m"
    .balign 4

.text
glabel EnTa_Init
/* 000E8 80B13B88 27BDFFB0 */  addiu   $sp, $sp, 0xFFB0           ## $sp = FFFFFFB0
/* 000EC 80B13B8C AFB00030 */  sw      $s0, 0x0030($sp)
/* 000F0 80B13B90 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 000F4 80B13B94 AFBF0034 */  sw      $ra, 0x0034($sp)
/* 000F8 80B13B98 AFA50054 */  sw      $a1, 0x0054($sp)
/* 000FC 80B13B9C 3C068003 */  lui     $a2, %hi(ActorShadow_DrawFunc_Circle)
/* 00100 80B13BA0 24C6B5EC */  addiu   $a2, %lo(ActorShadow_DrawFunc_Circle)
/* 00104 80B13BA4 24050000 */  addiu   $a1, $zero, 0x0000         ## $a1 = 00000000
/* 00108 80B13BA8 248400B4 */  addiu   $a0, $a0, 0x00B4           ## $a0 = 000000B4
/* 0010C 80B13BAC 0C00AC78 */  jal     ActorShape_Init

/* 00110 80B13BB0 3C074210 */  lui     $a3, 0x4210                ## $a3 = 42100000
/* 00114 80B13BB4 2605014C */  addiu   $a1, $s0, 0x014C           ## $a1 = 0000014C
/* 00118 80B13BB8 3C060601 */  lui     $a2, 0x0601                ## $a2 = 06010000
/* 0011C 80B13BBC 3C070600 */  lui     $a3, 0x0600                ## $a3 = 06000000
/* 00120 80B13BC0 260E0190 */  addiu   $t6, $s0, 0x0190           ## $t6 = 00000190
/* 00124 80B13BC4 260F01F6 */  addiu   $t7, $s0, 0x01F6           ## $t7 = 000001F6
/* 00128 80B13BC8 24180011 */  addiu   $t8, $zero, 0x0011         ## $t8 = 00000011
/* 0012C 80B13BCC AFB80018 */  sw      $t8, 0x0018($sp)
/* 00130 80B13BD0 AFAF0014 */  sw      $t7, 0x0014($sp)
/* 00134 80B13BD4 AFAE0010 */  sw      $t6, 0x0010($sp)
/* 00138 80B13BD8 24E71C94 */  addiu   $a3, $a3, 0x1C94           ## $a3 = 06001C94
/* 0013C 80B13BDC 24C6B7B8 */  addiu   $a2, $a2, 0xB7B8           ## $a2 = 0600B7B8
/* 00140 80B13BE0 AFA50038 */  sw      $a1, 0x0038($sp)
/* 00144 80B13BE4 0C0291BE */  jal     SkelAnime_InitFlex
/* 00148 80B13BE8 8FA40054 */  lw      $a0, 0x0054($sp)
/* 0014C 80B13BEC 26050264 */  addiu   $a1, $s0, 0x0264           ## $a1 = 00000264
/* 00150 80B13BF0 AFA5003C */  sw      $a1, 0x003C($sp)
/* 00154 80B13BF4 0C0170D9 */  jal     Collider_InitCylinder

/* 00158 80B13BF8 8FA40054 */  lw      $a0, 0x0054($sp)
/* 0015C 80B13BFC 3C0780B1 */  lui     $a3, %hi(D_80B16E50)       ## $a3 = 80B10000
/* 00160 80B13C00 8FA5003C */  lw      $a1, 0x003C($sp)
/* 00164 80B13C04 24E76E50 */  addiu   $a3, $a3, %lo(D_80B16E50)  ## $a3 = 80B16E50
/* 00168 80B13C08 8FA40054 */  lw      $a0, 0x0054($sp)
/* 0016C 80B13C0C 0C01712B */  jal     Collider_SetCylinder

/* 00170 80B13C10 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 00174 80B13C14 3C0980B1 */  lui     $t1, %hi(func_80B166CC)    ## $t1 = 80B10000
/* 00178 80B13C18 241900FF */  addiu   $t9, $zero, 0x00FF         ## $t9 = 000000FF
/* 0017C 80B13C1C 24080014 */  addiu   $t0, $zero, 0x0014         ## $t0 = 00000014
/* 00180 80B13C20 252966CC */  addiu   $t1, $t1, %lo(func_80B166CC) ## $t1 = 80B166CC
/* 00184 80B13C24 3C053C23 */  lui     $a1, 0x3C23                ## $a1 = 3C230000
/* 00188 80B13C28 A21900AE */  sb      $t9, 0x00AE($s0)           ## 000000AE
/* 0018C 80B13C2C A60002E0 */  sh      $zero, 0x02E0($s0)         ## 000002E0
/* 00190 80B13C30 A60002CE */  sh      $zero, 0x02CE($s0)         ## 000002CE
/* 00194 80B13C34 A60002E2 */  sh      $zero, 0x02E2($s0)         ## 000002E2
/* 00198 80B13C38 A60802B6 */  sh      $t0, 0x02B6($s0)           ## 000002B6
/* 0019C 80B13C3C AE0902B0 */  sw      $t1, 0x02B0($s0)           ## 000002B0
/* 001A0 80B13C40 34A5D70A */  ori     $a1, $a1, 0xD70A           ## $a1 = 3C23D70A
/* 001A4 80B13C44 0C00B58B */  jal     Actor_SetScale

/* 001A8 80B13C48 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 001AC 80B13C4C 3C01C080 */  lui     $at, 0xC080                ## $at = C0800000
/* 001B0 80B13C50 44810000 */  mtc1    $at, $f0                   ## $f0 = -4.00
/* 001B4 80B13C54 3C01BF80 */  lui     $at, 0xBF80                ## $at = BF800000
/* 001B8 80B13C58 44812000 */  mtc1    $at, $f4                   ## $f4 = -1.00
/* 001BC 80B13C5C 8602001C */  lh      $v0, 0x001C($s0)           ## 0000001C
/* 001C0 80B13C60 240A0006 */  addiu   $t2, $zero, 0x0006         ## $t2 = 00000006
/* 001C4 80B13C64 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 001C8 80B13C68 A20A001F */  sb      $t2, 0x001F($s0)           ## 0000001F
/* 001CC 80B13C6C E6000060 */  swc1    $f0, 0x0060($s0)           ## 00000060
/* 001D0 80B13C70 E6000070 */  swc1    $f0, 0x0070($s0)           ## 00000070
/* 001D4 80B13C74 10410006 */  beq     $v0, $at, .L80B13C90
/* 001D8 80B13C78 E604006C */  swc1    $f4, 0x006C($s0)           ## 0000006C
/* 001DC 80B13C7C 24010002 */  addiu   $at, $zero, 0x0002         ## $at = 00000002
/* 001E0 80B13C80 1041003B */  beq     $v0, $at, .L80B13D70
/* 001E4 80B13C84 3C0480B1 */  lui     $a0, %hi(D_80B16EB8)       ## $a0 = 80B10000
/* 001E8 80B13C88 10000069 */  beq     $zero, $zero, .L80B13E30
/* 001EC 80B13C8C 3C0480B1 */  lui     $a0, %hi(D_80B16EE8)       ## $a0 = 80B10000
.L80B13C90:
/* 001F0 80B13C90 3C0480B1 */  lui     $a0, %hi(D_80B16EA0)       ## $a0 = 80B10000
/* 001F4 80B13C94 0C00084C */  jal     osSyncPrintf

/* 001F8 80B13C98 24846EA0 */  addiu   $a0, $a0, %lo(D_80B16EA0)  ## $a0 = 80B16EA0
/* 001FC 80B13C9C 3C028016 */  lui     $v0, %hi(gSaveContext+0xee0)
/* 00200 80B13CA0 9442F540 */  lhu     $v0, %lo(gSaveContext+0xee0)($v0)
/* 00204 80B13CA4 3C0C8016 */  lui     $t4, %hi(gSaveContext+4)
/* 00208 80B13CA8 304B0800 */  andi    $t3, $v0, 0x0800           ## $t3 = 00000000
/* 0020C 80B13CAC 11600005 */  beq     $t3, $zero, .L80B13CC4
/* 00210 80B13CB0 00000000 */  nop
/* 00214 80B13CB4 0C00B55C */  jal     Actor_Kill

/* 00218 80B13CB8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0021C 80B13CBC 1000015E */  beq     $zero, $zero, .L80B14238
/* 00220 80B13CC0 8FBF0034 */  lw      $ra, 0x0034($sp)
.L80B13CC4:
/* 00224 80B13CC4 8D8CE664 */  lw      $t4, %lo(gSaveContext+4)($t4)
/* 00228 80B13CC8 304D0400 */  andi    $t5, $v0, 0x0400           ## $t5 = 00000000
/* 0022C 80B13CCC 11800005 */  beq     $t4, $zero, .L80B13CE4
/* 00230 80B13CD0 00000000 */  nop
/* 00234 80B13CD4 0C00B55C */  jal     Actor_Kill

/* 00238 80B13CD8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0023C 80B13CDC 10000156 */  beq     $zero, $zero, .L80B14238
/* 00240 80B13CE0 8FBF0034 */  lw      $ra, 0x0034($sp)
.L80B13CE4:
/* 00244 80B13CE4 11A00010 */  beq     $t5, $zero, .L80B13D28
/* 00248 80B13CE8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0024C 80B13CEC 3C0580B1 */  lui     $a1, %hi(func_80B14CAC)    ## $a1 = 80B10000
/* 00250 80B13CF0 3C0680B1 */  lui     $a2, %hi(func_80B167C0)    ## $a2 = 80B10000
/* 00254 80B13CF4 24C667C0 */  addiu   $a2, $a2, %lo(func_80B167C0) ## $a2 = 80B167C0
/* 00258 80B13CF8 24A54CAC */  addiu   $a1, $a1, %lo(func_80B14CAC) ## $a1 = 80B14CAC
/* 0025C 80B13CFC 0C2C4EA8 */  jal     func_80B13AA0
/* 00260 80B13D00 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00264 80B13D04 A60002B4 */  sh      $zero, 0x02B4($s0)         ## 000002B4
/* 00268 80B13D08 3C050600 */  lui     $a1, 0x0600                ## $a1 = 06000000
/* 0026C 80B13D0C 24A51C94 */  addiu   $a1, $a1, 0x1C94           ## $a1 = 06001C94
/* 00270 80B13D10 0C02947A */  jal     SkelAnime_ChangeAnimDefaultStop
/* 00274 80B13D14 8FA40038 */  lw      $a0, 0x0038($sp)
/* 00278 80B13D18 3C0E0600 */  lui     $t6, 0x0600                ## $t6 = 06000000
/* 0027C 80B13D1C 25CE1C94 */  addiu   $t6, $t6, 0x1C94           ## $t6 = 06001C94
/* 00280 80B13D20 10000144 */  beq     $zero, $zero, .L80B14234
/* 00284 80B13D24 AE0E02E4 */  sw      $t6, 0x02E4($s0)           ## 000002E4
.L80B13D28:
/* 00288 80B13D28 3C0580B1 */  lui     $a1, %hi(func_80B14754)    ## $a1 = 80B10000
/* 0028C 80B13D2C 3C0680B1 */  lui     $a2, %hi(func_80B167FC)    ## $a2 = 80B10000
/* 00290 80B13D30 24C667FC */  addiu   $a2, $a2, %lo(func_80B167FC) ## $a2 = 80B167FC
/* 00294 80B13D34 0C2C4EA8 */  jal     func_80B13AA0
/* 00298 80B13D38 24A54754 */  addiu   $a1, $a1, %lo(func_80B14754) ## $a1 = 80B14754
/* 0029C 80B13D3C 240F0002 */  addiu   $t7, $zero, 0x0002         ## $t7 = 00000002
/* 002A0 80B13D40 A60F02B4 */  sh      $t7, 0x02B4($s0)           ## 000002B4
/* 002A4 80B13D44 3C050601 */  lui     $a1, 0x0601                ## $a1 = 06010000
/* 002A8 80B13D48 24A5CD50 */  addiu   $a1, $a1, 0xCD50           ## $a1 = 0600CD50
/* 002AC 80B13D4C 0C02947A */  jal     SkelAnime_ChangeAnimDefaultStop
/* 002B0 80B13D50 8FA40038 */  lw      $a0, 0x0038($sp)
/* 002B4 80B13D54 3C014258 */  lui     $at, 0x4258                ## $at = 42580000
/* 002B8 80B13D58 44813000 */  mtc1    $at, $f6                   ## $f6 = 54.00
/* 002BC 80B13D5C 3C180601 */  lui     $t8, 0x0601                ## $t8 = 06010000
/* 002C0 80B13D60 2718CD50 */  addiu   $t8, $t8, 0xCD50           ## $t8 = 0600CD50
/* 002C4 80B13D64 AE1802E4 */  sw      $t8, 0x02E4($s0)           ## 000002E4
/* 002C8 80B13D68 10000132 */  beq     $zero, $zero, .L80B14234
/* 002CC 80B13D6C E60600C4 */  swc1    $f6, 0x00C4($s0)           ## 000000C4
.L80B13D70:
/* 002D0 80B13D70 0C00084C */  jal     osSyncPrintf

/* 002D4 80B13D74 24846EB8 */  addiu   $a0, $a0, %lo(D_80B16EB8)  ## $a0 = 00006EB8
/* 002D8 80B13D78 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 002DC 80B13D7C 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 002E0 80B13D80 94590EE0 */  lhu     $t9, 0x0EE0($v0)           ## 8015F540
/* 002E4 80B13D84 33280800 */  andi    $t0, $t9, 0x0800           ## $t0 = 00000000
/* 002E8 80B13D88 55000006 */  bnel    $t0, $zero, .L80B13DA4
/* 002EC 80B13D8C 8C490004 */  lw      $t1, 0x0004($v0)           ## 8015E664
/* 002F0 80B13D90 0C00B55C */  jal     Actor_Kill

/* 002F4 80B13D94 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 002F8 80B13D98 10000127 */  beq     $zero, $zero, .L80B14238
/* 002FC 80B13D9C 8FBF0034 */  lw      $ra, 0x0034($sp)
/* 00300 80B13DA0 8C490004 */  lw      $t1, 0x0004($v0)           ## 00000004
.L80B13DA4:
/* 00304 80B13DA4 8FAA0054 */  lw      $t2, 0x0054($sp)
/* 00308 80B13DA8 51200006 */  beql    $t1, $zero, .L80B13DC4
/* 0030C 80B13DAC 854B00A4 */  lh      $t3, 0x00A4($t2)           ## 000000A4
/* 00310 80B13DB0 0C00B55C */  jal     Actor_Kill

/* 00314 80B13DB4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00318 80B13DB8 1000011F */  beq     $zero, $zero, .L80B14238
/* 0031C 80B13DBC 8FBF0034 */  lw      $ra, 0x0034($sp)
/* 00320 80B13DC0 854B00A4 */  lh      $t3, 0x00A4($t2)           ## 000000A4
.L80B13DC4:
/* 00324 80B13DC4 24010036 */  addiu   $at, $zero, 0x0036         ## $at = 00000036
/* 00328 80B13DC8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0032C 80B13DCC 1561000B */  bne     $t3, $at, .L80B13DFC
/* 00330 80B13DD0 3C0580B1 */  lui     $a1, %hi(func_80B14D98)    ## $a1 = 80B10000
/* 00334 80B13DD4 8C4C0010 */  lw      $t4, 0x0010($v0)           ## 00000010
/* 00338 80B13DD8 11800008 */  beq     $t4, $zero, .L80B13DFC
/* 0033C 80B13DDC 00000000 */  nop
/* 00340 80B13DE0 0C00B55C */  jal     Actor_Kill

/* 00344 80B13DE4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00348 80B13DE8 3C0480B1 */  lui     $a0, %hi(D_80B16ED0)       ## $a0 = 80B10000
/* 0034C 80B13DEC 0C00084C */  jal     osSyncPrintf

/* 00350 80B13DF0 24846ED0 */  addiu   $a0, $a0, %lo(D_80B16ED0)  ## $a0 = 80B16ED0
/* 00354 80B13DF4 10000110 */  beq     $zero, $zero, .L80B14238
/* 00358 80B13DF8 8FBF0034 */  lw      $ra, 0x0034($sp)
.L80B13DFC:
/* 0035C 80B13DFC 3C0680B1 */  lui     $a2, %hi(func_80B167C0)    ## $a2 = 80B10000
/* 00360 80B13E00 24C667C0 */  addiu   $a2, $a2, %lo(func_80B167C0) ## $a2 = 80B167C0
/* 00364 80B13E04 0C2C4EA8 */  jal     func_80B13AA0
/* 00368 80B13E08 24A54D98 */  addiu   $a1, $a1, %lo(func_80B14D98) ## $a1 = 00004D98
/* 0036C 80B13E0C A60002B4 */  sh      $zero, 0x02B4($s0)         ## 000002B4
/* 00370 80B13E10 3C050600 */  lui     $a1, 0x0600                ## $a1 = 06000000
/* 00374 80B13E14 24A51C94 */  addiu   $a1, $a1, 0x1C94           ## $a1 = 06001C94
/* 00378 80B13E18 0C02947A */  jal     SkelAnime_ChangeAnimDefaultStop
/* 0037C 80B13E1C 8FA40038 */  lw      $a0, 0x0038($sp)
/* 00380 80B13E20 3C0D0600 */  lui     $t5, 0x0600                ## $t5 = 06000000
/* 00384 80B13E24 25AD1C94 */  addiu   $t5, $t5, 0x1C94           ## $t5 = 06001C94
/* 00388 80B13E28 10000102 */  beq     $zero, $zero, .L80B14234
/* 0038C 80B13E2C AE0D02E4 */  sw      $t5, 0x02E4($s0)           ## 000002E4
.L80B13E30:
/* 00390 80B13E30 0C00084C */  jal     osSyncPrintf

/* 00394 80B13E34 24846EE8 */  addiu   $a0, $a0, %lo(D_80B16EE8)  ## $a0 = 00006EE8
/* 00398 80B13E38 8FA30054 */  lw      $v1, 0x0054($sp)
/* 0039C 80B13E3C 2401005F */  addiu   $at, $zero, 0x005F         ## $at = 0000005F
/* 003A0 80B13E40 846200A4 */  lh      $v0, 0x00A4($v1)           ## 000000A4
/* 003A4 80B13E44 5441002E */  bnel    $v0, $at, .L80B13F00
/* 003A8 80B13E48 2401004C */  addiu   $at, $zero, 0x004C         ## $at = 0000004C
/* 003AC 80B13E4C 3C028016 */  lui     $v0, %hi(gSaveContext+0xed6)
/* 003B0 80B13E50 9442F536 */  lhu     $v0, %lo(gSaveContext+0xed6)($v0)
/* 003B4 80B13E54 304E0010 */  andi    $t6, $v0, 0x0010           ## $t6 = 00000000
/* 003B8 80B13E58 11C00005 */  beq     $t6, $zero, .L80B13E70
/* 003BC 80B13E5C 304F0008 */  andi    $t7, $v0, 0x0008           ## $t7 = 00000000
/* 003C0 80B13E60 0C00B55C */  jal     Actor_Kill

/* 003C4 80B13E64 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 003C8 80B13E68 100000F3 */  beq     $zero, $zero, .L80B14238
/* 003CC 80B13E6C 8FBF0034 */  lw      $ra, 0x0034($sp)
.L80B13E70:
/* 003D0 80B13E70 11E00010 */  beq     $t7, $zero, .L80B13EB4
/* 003D4 80B13E74 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 003D8 80B13E78 3C0580B1 */  lui     $a1, %hi(func_80B14C18)    ## $a1 = 80B10000
/* 003DC 80B13E7C 3C0680B1 */  lui     $a2, %hi(func_80B167C0)    ## $a2 = 80B10000
/* 003E0 80B13E80 24C667C0 */  addiu   $a2, $a2, %lo(func_80B167C0) ## $a2 = 80B167C0
/* 003E4 80B13E84 24A54C18 */  addiu   $a1, $a1, %lo(func_80B14C18) ## $a1 = 80B14C18
/* 003E8 80B13E88 0C2C4EA8 */  jal     func_80B13AA0
/* 003EC 80B13E8C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 003F0 80B13E90 A60002B4 */  sh      $zero, 0x02B4($s0)         ## 000002B4
/* 003F4 80B13E94 3C050600 */  lui     $a1, 0x0600                ## $a1 = 06000000
/* 003F8 80B13E98 24A51C94 */  addiu   $a1, $a1, 0x1C94           ## $a1 = 06001C94
/* 003FC 80B13E9C 0C02947A */  jal     SkelAnime_ChangeAnimDefaultStop
/* 00400 80B13EA0 8FA40038 */  lw      $a0, 0x0038($sp)
/* 00404 80B13EA4 3C180600 */  lui     $t8, 0x0600                ## $t8 = 06000000
/* 00408 80B13EA8 27181C94 */  addiu   $t8, $t8, 0x1C94           ## $t8 = 06001C94
/* 0040C 80B13EAC 100000E1 */  beq     $zero, $zero, .L80B14234
/* 00410 80B13EB0 AE1802E4 */  sw      $t8, 0x02E4($s0)           ## 000002E4
.L80B13EB4:
/* 00414 80B13EB4 3C0580B1 */  lui     $a1, %hi(func_80B14634)    ## $a1 = 80B10000
/* 00418 80B13EB8 3C0680B1 */  lui     $a2, %hi(func_80B167FC)    ## $a2 = 80B10000
/* 0041C 80B13EBC 24C667FC */  addiu   $a2, $a2, %lo(func_80B167FC) ## $a2 = 80B167FC
/* 00420 80B13EC0 0C2C4EA8 */  jal     func_80B13AA0
/* 00424 80B13EC4 24A54634 */  addiu   $a1, $a1, %lo(func_80B14634) ## $a1 = 80B14634
/* 00428 80B13EC8 24190002 */  addiu   $t9, $zero, 0x0002         ## $t9 = 00000002
/* 0042C 80B13ECC A61902B4 */  sh      $t9, 0x02B4($s0)           ## 000002B4
/* 00430 80B13ED0 3C050601 */  lui     $a1, 0x0601                ## $a1 = 06010000
/* 00434 80B13ED4 24A5CD50 */  addiu   $a1, $a1, 0xCD50           ## $a1 = 0600CD50
/* 00438 80B13ED8 0C02947A */  jal     SkelAnime_ChangeAnimDefaultStop
/* 0043C 80B13EDC 8FA40038 */  lw      $a0, 0x0038($sp)
/* 00440 80B13EE0 3C014258 */  lui     $at, 0x4258                ## $at = 42580000
/* 00444 80B13EE4 44814000 */  mtc1    $at, $f8                   ## $f8 = 54.00
/* 00448 80B13EE8 3C080601 */  lui     $t0, 0x0601                ## $t0 = 06010000
/* 0044C 80B13EEC 2508CD50 */  addiu   $t0, $t0, 0xCD50           ## $t0 = 0600CD50
/* 00450 80B13EF0 AE0802E4 */  sw      $t0, 0x02E4($s0)           ## 000002E4
/* 00454 80B13EF4 100000CF */  beq     $zero, $zero, .L80B14234
/* 00458 80B13EF8 E60800C4 */  swc1    $f8, 0x00C4($s0)           ## 000000C4
/* 0045C 80B13EFC 2401004C */  addiu   $at, $zero, 0x004C         ## $at = 0000004C
.L80B13F00:
/* 00460 80B13F00 144100BB */  bne     $v0, $at, .L80B141F0
/* 00464 80B13F04 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00468 80B13F08 3C0480B1 */  lui     $a0, %hi(D_80B16F04)       ## $a0 = 80B10000
/* 0046C 80B13F0C 0C00084C */  jal     osSyncPrintf

/* 00470 80B13F10 24846F04 */  addiu   $a0, $a0, %lo(D_80B16F04)  ## $a0 = 80B16F04
/* 00474 80B13F14 3C038016 */  lui     $v1, %hi(gSaveContext)
/* 00478 80B13F18 2463E660 */  addiu   $v1, %lo(gSaveContext)
/* 0047C 80B13F1C 94690ED6 */  lhu     $t1, 0x0ED6($v1)           ## 8015F536
/* 00480 80B13F20 312A0010 */  andi    $t2, $t1, 0x0010           ## $t2 = 00000000
/* 00484 80B13F24 55400006 */  bnel    $t2, $zero, .L80B13F40
/* 00488 80B13F28 8C6B0004 */  lw      $t3, 0x0004($v1)           ## 8015E664
/* 0048C 80B13F2C 0C00B55C */  jal     Actor_Kill

/* 00490 80B13F30 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00494 80B13F34 100000C0 */  beq     $zero, $zero, .L80B14238
/* 00498 80B13F38 8FBF0034 */  lw      $ra, 0x0034($sp)
/* 0049C 80B13F3C 8C6B0004 */  lw      $t3, 0x0004($v1)           ## 00000004
.L80B13F40:
/* 004A0 80B13F40 55600006 */  bnel    $t3, $zero, .L80B13F5C
/* 004A4 80B13F44 8C6C0010 */  lw      $t4, 0x0010($v1)           ## 00000010
/* 004A8 80B13F48 0C00B55C */  jal     Actor_Kill

/* 004AC 80B13F4C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 004B0 80B13F50 100000B9 */  beq     $zero, $zero, .L80B14238
/* 004B4 80B13F54 8FBF0034 */  lw      $ra, 0x0034($sp)
/* 004B8 80B13F58 8C6C0010 */  lw      $t4, 0x0010($v1)           ## 00000010
.L80B13F5C:
/* 004BC 80B13F5C 3C0580B1 */  lui     $a1, %hi(func_80B146F8)    ## $a1 = 80B10000
/* 004C0 80B13F60 24A546F8 */  addiu   $a1, $a1, %lo(func_80B146F8) ## $a1 = 80B146F8
/* 004C4 80B13F64 15800092 */  bne     $t4, $zero, .L80B141B0
/* 004C8 80B13F68 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 004CC 80B13F6C 3C0140A0 */  lui     $at, 0x40A0                ## $at = 40A00000
/* 004D0 80B13F70 44818000 */  mtc1    $at, $f16                  ## $f16 = 5.00
/* 004D4 80B13F74 3C014040 */  lui     $at, 0x4040                ## $at = 40400000
/* 004D8 80B13F78 8FA50054 */  lw      $a1, 0x0054($sp)
/* 004DC 80B13F7C 44813000 */  mtc1    $at, $f6                   ## $f6 = 3.00
/* 004E0 80B13F80 C6040028 */  lwc1    $f4, 0x0028($s0)           ## 00000028
/* 004E4 80B13F84 240F0007 */  addiu   $t7, $zero, 0x0007         ## $t7 = 00000007
/* 004E8 80B13F88 A60F02C8 */  sh      $t7, 0x02C8($s0)           ## 000002C8
/* 004EC 80B13F8C 8E0D0004 */  lw      $t5, 0x0004($s0)           ## 00000004
/* 004F0 80B13F90 860202C8 */  lh      $v0, 0x02C8($s0)           ## 000002C8
/* 004F4 80B13F94 C60A0024 */  lwc1    $f10, 0x0024($s0)          ## 00000024
/* 004F8 80B13F98 46062200 */  add.s   $f8, $f4, $f6
/* 004FC 80B13F9C 35AE0010 */  ori     $t6, $t5, 0x0010           ## $t6 = 00000010
/* 00500 80B13FA0 AE0E0004 */  sw      $t6, 0x0004($s0)           ## 00000004
/* 00504 80B13FA4 46105480 */  add.s   $f18, $f10, $f16
/* 00508 80B13FA8 A60202C6 */  sh      $v0, 0x02C6($s0)           ## 000002C6
/* 0050C 80B13FAC A60202C4 */  sh      $v0, 0x02C4($s0)           ## 000002C4
/* 00510 80B13FB0 E7A80010 */  swc1    $f8, 0x0010($sp)
/* 00514 80B13FB4 3C0141D0 */  lui     $at, 0x41D0                ## $at = 41D00000
/* 00518 80B13FB8 44818000 */  mtc1    $at, $f16                  ## $f16 = 26.00
/* 0051C 80B13FBC C60A002C */  lwc1    $f10, 0x002C($s0)          ## 0000002C
/* 00520 80B13FC0 44079000 */  mfc1    $a3, $f18
/* 00524 80B13FC4 2418000D */  addiu   $t8, $zero, 0x000D         ## $t8 = 0000000D
/* 00528 80B13FC8 46105480 */  add.s   $f18, $f10, $f16
/* 0052C 80B13FCC 24A41C24 */  addiu   $a0, $a1, 0x1C24           ## $a0 = 80B1631C
/* 00530 80B13FD0 AFA4003C */  sw      $a0, 0x003C($sp)
/* 00534 80B13FD4 AFB80024 */  sw      $t8, 0x0024($sp)
/* 00538 80B13FD8 E7B20014 */  swc1    $f18, 0x0014($sp)
/* 0053C 80B13FDC AFA00020 */  sw      $zero, 0x0020($sp)
/* 00540 80B13FE0 AFA0001C */  sw      $zero, 0x001C($sp)
/* 00544 80B13FE4 AFA00018 */  sw      $zero, 0x0018($sp)
/* 00548 80B13FE8 0C00C7D4 */  jal     Actor_Spawn
              ## ActorSpawn
/* 0054C 80B13FEC 24060019 */  addiu   $a2, $zero, 0x0019         ## $a2 = 00000019
/* 00550 80B13FF0 3C0141A0 */  lui     $at, 0x41A0                ## $at = 41A00000
/* 00554 80B13FF4 44813000 */  mtc1    $at, $f6                   ## $f6 = 20.00
/* 00558 80B13FF8 3C014220 */  lui     $at, 0x4220                ## $at = 42200000
/* 0055C 80B13FFC 44818000 */  mtc1    $at, $f16                  ## $f16 = 40.00
/* 00560 80B14000 C60A0028 */  lwc1    $f10, 0x0028($s0)          ## 00000028
/* 00564 80B14004 C6040024 */  lwc1    $f4, 0x0024($s0)           ## 00000024
/* 00568 80B14008 8FA50054 */  lw      $a1, 0x0054($sp)
/* 0056C 80B1400C 46105480 */  add.s   $f18, $f10, $f16
/* 00570 80B14010 AE0202B8 */  sw      $v0, 0x02B8($s0)           ## 000002B8
/* 00574 80B14014 3C0141F0 */  lui     $at, 0x41F0                ## $at = 41F00000
/* 00578 80B14018 46062201 */  sub.s   $f8, $f4, $f6
/* 0057C 80B1401C E7B20010 */  swc1    $f18, 0x0010($sp)
/* 00580 80B14020 C604002C */  lwc1    $f4, 0x002C($s0)           ## 0000002C
/* 00584 80B14024 44813000 */  mtc1    $at, $f6                   ## $f6 = 30.00
/* 00588 80B14028 44074000 */  mfc1    $a3, $f8
/* 0058C 80B1402C 2419000D */  addiu   $t9, $zero, 0x000D         ## $t9 = 0000000D
/* 00590 80B14030 46062201 */  sub.s   $f8, $f4, $f6
/* 00594 80B14034 AFB90024 */  sw      $t9, 0x0024($sp)
/* 00598 80B14038 AFA00020 */  sw      $zero, 0x0020($sp)
/* 0059C 80B1403C AFA0001C */  sw      $zero, 0x001C($sp)
/* 005A0 80B14040 E7A80014 */  swc1    $f8, 0x0014($sp)
/* 005A4 80B14044 AFA00018 */  sw      $zero, 0x0018($sp)
/* 005A8 80B14048 8FA4003C */  lw      $a0, 0x003C($sp)
/* 005AC 80B1404C 0C00C7D4 */  jal     Actor_Spawn
              ## ActorSpawn
/* 005B0 80B14050 24060019 */  addiu   $a2, $zero, 0x0019         ## $a2 = 00000019
/* 005B4 80B14054 3C0141A0 */  lui     $at, 0x41A0                ## $at = 41A00000
/* 005B8 80B14058 44818000 */  mtc1    $at, $f16                  ## $f16 = 20.00
/* 005BC 80B1405C 3C014220 */  lui     $at, 0x4220                ## $at = 42200000
/* 005C0 80B14060 44813000 */  mtc1    $at, $f6                   ## $f6 = 40.00
/* 005C4 80B14064 C6040028 */  lwc1    $f4, 0x0028($s0)           ## 00000028
/* 005C8 80B14068 C60A0024 */  lwc1    $f10, 0x0024($s0)          ## 00000024
/* 005CC 80B1406C 8FA50054 */  lw      $a1, 0x0054($sp)
/* 005D0 80B14070 46062200 */  add.s   $f8, $f4, $f6
/* 005D4 80B14074 AE0202BC */  sw      $v0, 0x02BC($s0)           ## 000002BC
/* 005D8 80B14078 3C0141F0 */  lui     $at, 0x41F0                ## $at = 41F00000
/* 005DC 80B1407C 46105480 */  add.s   $f18, $f10, $f16
/* 005E0 80B14080 E7A80010 */  swc1    $f8, 0x0010($sp)
/* 005E4 80B14084 C60A002C */  lwc1    $f10, 0x002C($s0)          ## 0000002C
/* 005E8 80B14088 44818000 */  mtc1    $at, $f16                  ## $f16 = 30.00
/* 005EC 80B1408C 44079000 */  mfc1    $a3, $f18
/* 005F0 80B14090 2408000D */  addiu   $t0, $zero, 0x000D         ## $t0 = 0000000D
/* 005F4 80B14094 46105481 */  sub.s   $f18, $f10, $f16
/* 005F8 80B14098 AFA80024 */  sw      $t0, 0x0024($sp)
/* 005FC 80B1409C AFA00020 */  sw      $zero, 0x0020($sp)
/* 00600 80B140A0 AFA0001C */  sw      $zero, 0x001C($sp)
/* 00604 80B140A4 E7B20014 */  swc1    $f18, 0x0014($sp)
/* 00608 80B140A8 AFA00018 */  sw      $zero, 0x0018($sp)
/* 0060C 80B140AC 8FA4003C */  lw      $a0, 0x003C($sp)
/* 00610 80B140B0 0C00C7D4 */  jal     Actor_Spawn
              ## ActorSpawn
/* 00614 80B140B4 24060019 */  addiu   $a2, $zero, 0x0019         ## $a2 = 00000019
/* 00618 80B140B8 AE0202C0 */  sw      $v0, 0x02C0($s0)           ## 000002C0
/* 0061C 80B140BC 8FA50054 */  lw      $a1, 0x0054($sp)
/* 00620 80B140C0 0C2C4EAB */  jal     func_80B13AAC
/* 00624 80B140C4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00628 80B140C8 3C098016 */  lui     $t1, %hi(gSaveContext+0x13fa)
/* 0062C 80B140CC 9529FA5A */  lhu     $t1, %lo(gSaveContext+0x13fa)($t1)
/* 00630 80B140D0 3C0580B1 */  lui     $a1, %hi(func_80B16608)    ## $a1 = 80B10000
/* 00634 80B140D4 24A56608 */  addiu   $a1, $a1, %lo(func_80B16608) ## $a1 = 80B16608
/* 00638 80B140D8 312A0400 */  andi    $t2, $t1, 0x0400           ## $t2 = 00000000
/* 0063C 80B140DC 11400025 */  beq     $t2, $zero, .L80B14174
/* 00640 80B140E0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00644 80B140E4 3C0680B1 */  lui     $a2, %hi(func_80B16938)    ## $a2 = 80B10000
/* 00648 80B140E8 0C2C4EA8 */  jal     func_80B13AA0
/* 0064C 80B140EC 24C66938 */  addiu   $a2, $a2, %lo(func_80B16938) ## $a2 = 80B16938
/* 00650 80B140F0 3C040601 */  lui     $a0, 0x0601                ## $a0 = 06010000
/* 00654 80B140F4 0C028800 */  jal     SkelAnime_GetFrameCount

/* 00658 80B140F8 2484C48C */  addiu   $a0, $a0, 0xC48C           ## $a0 = 0600C48C
/* 0065C 80B140FC 3C040601 */  lui     $a0, 0x0601                ## $a0 = 06010000
/* 00660 80B14100 2484C48C */  addiu   $a0, $a0, 0xC48C           ## $a0 = 0600C48C
/* 00664 80B14104 0C028800 */  jal     SkelAnime_GetFrameCount

/* 00668 80B14108 A7A20040 */  sh      $v0, 0x0040($sp)
/* 0066C 80B1410C 87AB0040 */  lh      $t3, 0x0040($sp)
/* 00670 80B14110 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 00674 80B14114 44810000 */  mtc1    $at, $f0                   ## $f0 = 1.00
/* 00678 80B14118 448B2000 */  mtc1    $t3, $f4                   ## $f4 = 0.00
/* 0067C 80B1411C 44825000 */  mtc1    $v0, $f10                  ## $f10 = 0.00
/* 00680 80B14120 44809000 */  mtc1    $zero, $f18                ## $f18 = 0.00
/* 00684 80B14124 468021A0 */  cvt.s.w $f6, $f4
/* 00688 80B14128 3C050601 */  lui     $a1, 0x0601                ## $a1 = 06010000
/* 0068C 80B1412C 240C0002 */  addiu   $t4, $zero, 0x0002         ## $t4 = 00000002
/* 00690 80B14130 44060000 */  mfc1    $a2, $f0
/* 00694 80B14134 AFAC0014 */  sw      $t4, 0x0014($sp)
/* 00698 80B14138 46805420 */  cvt.s.w $f16, $f10
/* 0069C 80B1413C 24A5C48C */  addiu   $a1, $a1, 0xC48C           ## $a1 = 0600C48C
/* 006A0 80B14140 8FA40038 */  lw      $a0, 0x0038($sp)
/* 006A4 80B14144 E7B20018 */  swc1    $f18, 0x0018($sp)
/* 006A8 80B14148 46003201 */  sub.s   $f8, $f6, $f0
/* 006AC 80B1414C E7B00010 */  swc1    $f16, 0x0010($sp)
/* 006B0 80B14150 44074000 */  mfc1    $a3, $f8
/* 006B4 80B14154 0C029468 */  jal     SkelAnime_ChangeAnim

/* 006B8 80B14158 00000000 */  nop
/* 006BC 80B1415C 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 006C0 80B14160 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 006C4 80B14164 944D13FA */  lhu     $t5, 0x13FA($v0)           ## 8015FA5A
/* 006C8 80B14168 31AEFBFF */  andi    $t6, $t5, 0xFBFF           ## $t6 = 00000000
/* 006CC 80B1416C 10000031 */  beq     $zero, $zero, .L80B14234
/* 006D0 80B14170 A44E13FA */  sh      $t6, 0x13FA($v0)           ## 8015FA5A
.L80B14174:
/* 006D4 80B14174 3C0580B1 */  lui     $a1, %hi(func_80B16504)    ## $a1 = 80B10000
/* 006D8 80B14178 3C0680B1 */  lui     $a2, %hi(func_80B16854)    ## $a2 = 80B10000
/* 006DC 80B1417C 24C66854 */  addiu   $a2, $a2, %lo(func_80B16854) ## $a2 = 80B16854
/* 006E0 80B14180 24A56504 */  addiu   $a1, $a1, %lo(func_80B16504) ## $a1 = 80B16504
/* 006E4 80B14184 0C2C4EA8 */  jal     func_80B13AA0
/* 006E8 80B14188 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 006EC 80B1418C A60002B4 */  sh      $zero, 0x02B4($s0)         ## 000002B4
/* 006F0 80B14190 3C050600 */  lui     $a1, 0x0600                ## $a1 = 06000000
/* 006F4 80B14194 24A517E8 */  addiu   $a1, $a1, 0x17E8           ## $a1 = 060017E8
/* 006F8 80B14198 0C02947A */  jal     SkelAnime_ChangeAnimDefaultStop
/* 006FC 80B1419C 8FA40038 */  lw      $a0, 0x0038($sp)
/* 00700 80B141A0 3C0F0600 */  lui     $t7, 0x0600                ## $t7 = 06000000
/* 00704 80B141A4 25EF17E8 */  addiu   $t7, $t7, 0x17E8           ## $t7 = 060017E8
/* 00708 80B141A8 10000022 */  beq     $zero, $zero, .L80B14234
/* 0070C 80B141AC AE0F02E4 */  sw      $t7, 0x02E4($s0)           ## 000002E4
.L80B141B0:
/* 00710 80B141B0 3C0680B1 */  lui     $a2, %hi(func_80B167FC)    ## $a2 = 80B10000
/* 00714 80B141B4 0C2C4EA8 */  jal     func_80B13AA0
/* 00718 80B141B8 24C667FC */  addiu   $a2, $a2, %lo(func_80B167FC) ## $a2 = 80B167FC
/* 0071C 80B141BC 24180002 */  addiu   $t8, $zero, 0x0002         ## $t8 = 00000002
/* 00720 80B141C0 A61802B4 */  sh      $t8, 0x02B4($s0)           ## 000002B4
/* 00724 80B141C4 3C050601 */  lui     $a1, 0x0601                ## $a1 = 06010000
/* 00728 80B141C8 24A5CD50 */  addiu   $a1, $a1, 0xCD50           ## $a1 = 0600CD50
/* 0072C 80B141CC 0C02947A */  jal     SkelAnime_ChangeAnimDefaultStop
/* 00730 80B141D0 8FA40038 */  lw      $a0, 0x0038($sp)
/* 00734 80B141D4 3C014258 */  lui     $at, 0x4258                ## $at = 42580000
/* 00738 80B141D8 44812000 */  mtc1    $at, $f4                   ## $f4 = 54.00
/* 0073C 80B141DC 3C190601 */  lui     $t9, 0x0601                ## $t9 = 06010000
/* 00740 80B141E0 2739CD50 */  addiu   $t9, $t9, 0xCD50           ## $t9 = 0600CD50
/* 00744 80B141E4 AE1902E4 */  sw      $t9, 0x02E4($s0)           ## 000002E4
/* 00748 80B141E8 10000012 */  beq     $zero, $zero, .L80B14234
/* 0074C 80B141EC E60400C4 */  swc1    $f4, 0x00C4($s0)           ## 000000C4
.L80B141F0:
/* 00750 80B141F0 3C0580B1 */  lui     $a1, %hi(func_80B14634)    ## $a1 = 80B10000
/* 00754 80B141F4 3C0680B1 */  lui     $a2, %hi(func_80B167FC)    ## $a2 = 80B10000
/* 00758 80B141F8 24C667FC */  addiu   $a2, $a2, %lo(func_80B167FC) ## $a2 = 80B167FC
/* 0075C 80B141FC 0C2C4EA8 */  jal     func_80B13AA0
/* 00760 80B14200 24A54634 */  addiu   $a1, $a1, %lo(func_80B14634) ## $a1 = 80B14634
/* 00764 80B14204 24080002 */  addiu   $t0, $zero, 0x0002         ## $t0 = 00000002
/* 00768 80B14208 A60802B4 */  sh      $t0, 0x02B4($s0)           ## 000002B4
/* 0076C 80B1420C 3C050601 */  lui     $a1, 0x0601                ## $a1 = 06010000
/* 00770 80B14210 24A5CD50 */  addiu   $a1, $a1, 0xCD50           ## $a1 = 0600CD50
/* 00774 80B14214 0C02947A */  jal     SkelAnime_ChangeAnimDefaultStop
/* 00778 80B14218 8FA40038 */  lw      $a0, 0x0038($sp)
/* 0077C 80B1421C 3C014258 */  lui     $at, 0x4258                ## $at = 42580000
/* 00780 80B14220 44813000 */  mtc1    $at, $f6                   ## $f6 = 54.00
/* 00784 80B14224 3C090601 */  lui     $t1, 0x0601                ## $t1 = 06010000
/* 00788 80B14228 2529CD50 */  addiu   $t1, $t1, 0xCD50           ## $t1 = 0600CD50
/* 0078C 80B1422C AE0902E4 */  sw      $t1, 0x02E4($s0)           ## 000002E4
/* 00790 80B14230 E60600C4 */  swc1    $f6, 0x00C4($s0)           ## 000000C4
.L80B14234:
/* 00794 80B14234 8FBF0034 */  lw      $ra, 0x0034($sp)
.L80B14238:
/* 00798 80B14238 8FB00030 */  lw      $s0, 0x0030($sp)
/* 0079C 80B1423C 27BD0050 */  addiu   $sp, $sp, 0x0050           ## $sp = 00000000
/* 007A0 80B14240 03E00008 */  jr      $ra
/* 007A4 80B14244 00000000 */  nop
