.late_rodata
glabel D_80A17194
    .float 65535.5
glabel D_80A17198
    .float 65535.5

.text
glabel EnFish_Init
/* 001E8 80A15468 27BDFFC0 */  addiu   $sp, $sp, 0xFFC0           ## $sp = FFFFFFC0
/* 001EC 80A1546C AFBF002C */  sw      $ra, 0x002C($sp)
/* 001F0 80A15470 AFB00028 */  sw      $s0, 0x0028($sp)
/* 001F4 80A15474 AFA50044 */  sw      $a1, 0x0044($sp)
/* 001F8 80A15478 848E001C */  lh      $t6, 0x001C($a0)           ## 0000001C
/* 001FC 80A1547C 3C0580A1 */  lui     $a1, %hi(D_80A17070)       ## $a1 = 80A10000
/* 00200 80A15480 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00204 80A15484 24A57070 */  addiu   $a1, $a1, %lo(D_80A17070)  ## $a1 = 80A17070
/* 00208 80A15488 0C01E037 */  jal     Actor_ProcessInitChain

/* 0020C 80A1548C A7AE003A */  sh      $t6, 0x003A($sp)
/* 00210 80A15490 3C060402 */  lui     $a2, %hi(gFishSkel)                ## $a2 = 04020000
/* 00214 80A15494 3C070402 */  lui     $a3, %hi(gFish2Anim)                ## $a3 = 04020000
/* 00218 80A15498 260F01F0 */  addiu   $t7, $s0, 0x01F0           ## $t7 = 000001F0
/* 0021C 80A1549C 2618021A */  addiu   $t8, $s0, 0x021A           ## $t8 = 0000021A
/* 00220 80A154A0 24190007 */  addiu   $t9, $zero, 0x0007         ## $t9 = 00000007
/* 00224 80A154A4 AFB90018 */  sw      $t9, 0x0018($sp)
/* 00228 80A154A8 AFB80014 */  sw      $t8, 0x0014($sp)
/* 0022C 80A154AC AFAF0010 */  sw      $t7, 0x0010($sp)
/* 00230 80A154B0 24E7909C */  addiu   $a3, $a3, %lo(gFish2Anim)           ## $a3 = 0401909C
/* 00234 80A154B4 24C68FE0 */  addiu   $a2, $a2, %lo(gFishSkel)           ## $a2 = 04018FE0
/* 00238 80A154B8 8FA40044 */  lw      $a0, 0x0044($sp)
/* 0023C 80A154BC 0C0291BE */  jal     SkelAnime_InitFlex
/* 00240 80A154C0 260501AC */  addiu   $a1, $s0, 0x01AC           ## $a1 = 000001AC
/* 00244 80A154C4 2605014C */  addiu   $a1, $s0, 0x014C           ## $a1 = 0000014C
/* 00248 80A154C8 AFA50034 */  sw      $a1, 0x0034($sp)
/* 0024C 80A154CC 0C016EFE */  jal     Collider_InitJntSph
/* 00250 80A154D0 8FA40044 */  lw      $a0, 0x0044($sp)
/* 00254 80A154D4 3C0780A1 */  lui     $a3, %hi(D_80A17040)       ## $a3 = 80A10000
/* 00258 80A154D8 2608016C */  addiu   $t0, $s0, 0x016C           ## $t0 = 0000016C
/* 0025C 80A154DC 8FA50034 */  lw      $a1, 0x0034($sp)
/* 00260 80A154E0 AFA80010 */  sw      $t0, 0x0010($sp)
/* 00264 80A154E4 24E77040 */  addiu   $a3, $a3, %lo(D_80A17040)  ## $a3 = 80A17040
/* 00268 80A154E8 8FA40044 */  lw      $a0, 0x0044($sp)
/* 0026C 80A154EC 0C017014 */  jal     Collider_SetJntSph
/* 00270 80A154F0 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 00274 80A154F4 24090032 */  addiu   $t1, $zero, 0x0032         ## $t1 = 00000032
/* 00278 80A154F8 0C03F66B */  jal     Rand_ZeroOne
              ## Rand.Next() float
/* 0027C 80A154FC A20900AE */  sb      $t1, 0x00AE($s0)           ## 000000AE
/* 00280 80A15500 3C0180A1 */  lui     $at, %hi(D_80A17194)       ## $at = 80A10000
/* 00284 80A15504 C4247194 */  lwc1    $f4, %lo(D_80A17194)($at)
/* 00288 80A15508 46040182 */  mul.s   $f6, $f0, $f4
/* 0028C 80A1550C 4600320D */  trunc.w.s $f8, $f6
/* 00290 80A15510 440B4000 */  mfc1    $t3, $f8
/* 00294 80A15514 0C03F66B */  jal     Rand_ZeroOne
              ## Rand.Next() float
/* 00298 80A15518 A60B024C */  sh      $t3, 0x024C($s0)           ## 0000024C
/* 0029C 80A1551C 3C0180A1 */  lui     $at, %hi(D_80A17198)       ## $at = 80A10000
/* 002A0 80A15520 C42A7198 */  lwc1    $f10, %lo(D_80A17198)($at)
/* 002A4 80A15524 87A2003A */  lh      $v0, 0x003A($sp)
/* 002A8 80A15528 260400B4 */  addiu   $a0, $s0, 0x00B4           ## $a0 = 000000B4
/* 002AC 80A1552C 460A0402 */  mul.s   $f16, $f0, $f10
/* 002B0 80A15530 24050000 */  addiu   $a1, $zero, 0x0000         ## $a1 = 00000000
/* 002B4 80A15534 3C068003 */  lui     $a2, %hi(ActorShadow_DrawCircle)
/* 002B8 80A15538 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 002BC 80A1553C 4600848D */  trunc.w.s $f18, $f16
/* 002C0 80A15540 440D9000 */  mfc1    $t5, $f18
/* 002C4 80A15544 1440000B */  bne     $v0, $zero, .L80A15574
/* 002C8 80A15548 A60D024E */  sh      $t5, 0x024E($s0)           ## 0000024E
/* 002CC 80A1554C 8E0E0004 */  lw      $t6, 0x0004($s0)           ## 00000004
/* 002D0 80A15550 24C6B5EC */  addiu   $a2, %lo(ActorShadow_DrawCircle)
/* 002D4 80A15554 3C074100 */  lui     $a3, 0x4100                ## $a3 = 41000000
/* 002D8 80A15558 35CF0010 */  ori     $t7, $t6, 0x0010           ## $t7 = 00000010
/* 002DC 80A1555C 0C00AC78 */  jal     ActorShape_Init

/* 002E0 80A15560 AE0F0004 */  sw      $t7, 0x0004($s0)           ## 00000004
/* 002E4 80A15564 0C2857C9 */  jal     func_80A15F24
/* 002E8 80A15568 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 002EC 80A1556C 1000000A */  beq     $zero, $zero, .L80A15598
/* 002F0 80A15570 8FBF002C */  lw      $ra, 0x002C($sp)
.L80A15574:
/* 002F4 80A15574 14410005 */  bne     $v0, $at, .L80A1558C
/* 002F8 80A15578 00000000 */  nop
/* 002FC 80A1557C 0C285986 */  jal     func_80A16618
/* 00300 80A15580 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00304 80A15584 10000004 */  beq     $zero, $zero, .L80A15598
/* 00308 80A15588 8FBF002C */  lw      $ra, 0x002C($sp)
.L80A1558C:
/* 0030C 80A1558C 0C2855E9 */  jal     func_80A157A4
/* 00310 80A15590 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00314 80A15594 8FBF002C */  lw      $ra, 0x002C($sp)
.L80A15598:
/* 00318 80A15598 8FB00028 */  lw      $s0, 0x0028($sp)
/* 0031C 80A1559C 27BD0040 */  addiu   $sp, $sp, 0x0040           ## $sp = 00000000
/* 00320 80A155A0 03E00008 */  jr      $ra
/* 00324 80A155A4 00000000 */  nop
