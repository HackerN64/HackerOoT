.late_rodata
glabel D_80A6D5B0
 .word 0xC4368000
glabel D_80A6D5B4
 .word 0xC4898000
glabel D_80A6D5B8
 .word 0xC4924000
glabel D_80A6D5BC
 .word 0x4567B000
glabel D_80A6D5C0
 .word 0x44B0A000
glabel D_80A6D5C4
 .word 0xC4264000

.text
glabel EnHorseNormal_Init
/* 00180 80A6B3D0 27BDFFC8 */  addiu   $sp, $sp, 0xFFC8           ## $sp = FFFFFFC8
/* 00184 80A6B3D4 AFA5003C */  sw      $a1, 0x003C($sp)
/* 00188 80A6B3D8 AFBF0024 */  sw      $ra, 0x0024($sp)
/* 0018C 80A6B3DC AFB00020 */  sw      $s0, 0x0020($sp)
/* 00190 80A6B3E0 3C0580A7 */  lui     $a1, %hi(D_80A6D4EC)       ## $a1 = 80A70000
/* 00194 80A6B3E4 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00198 80A6B3E8 0C01E037 */  jal     Actor_ProcessInitChain

/* 0019C 80A6B3EC 24A5D4EC */  addiu   $a1, $a1, %lo(D_80A6D4EC)  ## $a1 = 80A6D4EC
/* 001A0 80A6B3F0 3C053C23 */  lui     $a1, 0x3C23                ## $a1 = 3C230000
/* 001A4 80A6B3F4 34A5D70A */  ori     $a1, $a1, 0xD70A           ## $a1 = 3C23D70A
/* 001A8 80A6B3F8 0C00B58B */  jal     Actor_SetScale

/* 001AC 80A6B3FC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 001B0 80A6B400 3C01C060 */  lui     $at, 0xC060                ## $at = C0600000
/* 001B4 80A6B404 44812000 */  mtc1    $at, $f4                   ## $f4 = -3.50
/* 001B8 80A6B408 3C068003 */  lui     $a2, %hi(ActorShadow_DrawFunc_Squiggly)
/* 001BC 80A6B40C 24C6B644 */  addiu   $a2, %lo(ActorShadow_DrawFunc_Squiggly)
/* 001C0 80A6B410 260400B4 */  addiu   $a0, $s0, 0x00B4           ## $a0 = 000000B4
/* 001C4 80A6B414 24050000 */  addiu   $a1, $zero, 0x0000         ## $a1 = 00000000
/* 001C8 80A6B418 3C0741A0 */  lui     $a3, 0x41A0                ## $a3 = 41A00000
/* 001CC 80A6B41C 0C00AC78 */  jal     ActorShape_Init

/* 001D0 80A6B420 E604006C */  swc1    $f4, 0x006C($s0)           ## 0000006C
/* 001D4 80A6B424 8E0E0028 */  lw      $t6, 0x0028($s0)           ## 00000028
/* 001D8 80A6B428 3C01428C */  lui     $at, 0x428C                ## $at = 428C0000
/* 001DC 80A6B42C 8E0F0024 */  lw      $t7, 0x0024($s0)           ## 00000024
/* 001E0 80A6B430 AE0E003C */  sw      $t6, 0x003C($s0)           ## 0000003C
/* 001E4 80A6B434 C608003C */  lwc1    $f8, 0x003C($s0)           ## 0000003C
/* 001E8 80A6B438 44815000 */  mtc1    $at, $f10                  ## $f10 = 70.00
/* 001EC 80A6B43C AE0F0038 */  sw      $t7, 0x0038($s0)           ## 00000038
/* 001F0 80A6B440 44803000 */  mtc1    $zero, $f6                 ## $f6 = 0.00
/* 001F4 80A6B444 460A4400 */  add.s   $f16, $f8, $f10
/* 001F8 80A6B448 8E0F002C */  lw      $t7, 0x002C($s0)           ## 0000002C
/* 001FC 80A6B44C AE00014C */  sw      $zero, 0x014C($s0)         ## 0000014C
/* 00200 80A6B450 AE000150 */  sw      $zero, 0x0150($s0)         ## 00000150
/* 00204 80A6B454 E610003C */  swc1    $f16, 0x003C($s0)          ## 0000003C
/* 00208 80A6B458 26050228 */  addiu   $a1, $s0, 0x0228           ## $a1 = 00000228
/* 0020C 80A6B45C E6060068 */  swc1    $f6, 0x0068($s0)           ## 00000068
/* 00210 80A6B460 AE0F0040 */  sw      $t7, 0x0040($s0)           ## 00000040
/* 00214 80A6B464 AFA50028 */  sw      $a1, 0x0028($sp)
/* 00218 80A6B468 0C0170D9 */  jal     Collider_InitCylinder

/* 0021C 80A6B46C 8FA4003C */  lw      $a0, 0x003C($sp)
/* 00220 80A6B470 3C0780A7 */  lui     $a3, %hi(D_80A6D394)       ## $a3 = 80A70000
/* 00224 80A6B474 8FA50028 */  lw      $a1, 0x0028($sp)
/* 00228 80A6B478 24E7D394 */  addiu   $a3, $a3, %lo(D_80A6D394)  ## $a3 = 80A6D394
/* 0022C 80A6B47C 8FA4003C */  lw      $a0, 0x003C($sp)
/* 00230 80A6B480 0C01712B */  jal     Collider_SetCylinder

/* 00234 80A6B484 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 00238 80A6B488 26050274 */  addiu   $a1, $s0, 0x0274           ## $a1 = 00000274
/* 0023C 80A6B48C AFA50028 */  sw      $a1, 0x0028($sp)
/* 00240 80A6B490 0C016EFE */  jal     Collider_InitJntSph
/* 00244 80A6B494 8FA4003C */  lw      $a0, 0x003C($sp)
/* 00248 80A6B498 3C0780A7 */  lui     $a3, %hi(D_80A6D410)       ## $a3 = 80A70000
/* 0024C 80A6B49C 26180294 */  addiu   $t8, $s0, 0x0294           ## $t8 = 00000294
/* 00250 80A6B4A0 8FA50028 */  lw      $a1, 0x0028($sp)
/* 00254 80A6B4A4 AFB80010 */  sw      $t8, 0x0010($sp)
/* 00258 80A6B4A8 24E7D410 */  addiu   $a3, $a3, %lo(D_80A6D410)  ## $a3 = 80A6D410
/* 0025C 80A6B4AC 8FA4003C */  lw      $a0, 0x003C($sp)
/* 00260 80A6B4B0 0C017014 */  jal     Collider_SetJntSph
/* 00264 80A6B4B4 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 00268 80A6B4B8 260502D4 */  addiu   $a1, $s0, 0x02D4           ## $a1 = 000002D4
/* 0026C 80A6B4BC AFA50028 */  sw      $a1, 0x0028($sp)
/* 00270 80A6B4C0 0C0170D9 */  jal     Collider_InitCylinder

/* 00274 80A6B4C4 8FA4003C */  lw      $a0, 0x003C($sp)
/* 00278 80A6B4C8 3C0780A7 */  lui     $a3, %hi(D_80A6D3C0)       ## $a3 = 80A70000
/* 0027C 80A6B4CC 8FA50028 */  lw      $a1, 0x0028($sp)
/* 00280 80A6B4D0 24E7D3C0 */  addiu   $a3, $a3, %lo(D_80A6D3C0)  ## $a3 = 80A6D3C0
/* 00284 80A6B4D4 8FA4003C */  lw      $a0, 0x003C($sp)
/* 00288 80A6B4D8 0C01712B */  jal     Collider_SetCylinder

/* 0028C 80A6B4DC 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 00290 80A6B4E0 3C0680A7 */  lui     $a2, %hi(D_80A6D420)       ## $a2 = 80A70000
/* 00294 80A6B4E4 24C6D420 */  addiu   $a2, $a2, %lo(D_80A6D420)  ## $a2 = 80A6D420
/* 00298 80A6B4E8 26040098 */  addiu   $a0, $s0, 0x0098           ## $a0 = 00000098
/* 0029C 80A6B4EC 0C0187B5 */  jal     func_80061ED4
/* 002A0 80A6B4F0 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 002A4 80A6B4F4 8FB9003C */  lw      $t9, 0x003C($sp)
/* 002A8 80A6B4F8 24010063 */  addiu   $at, $zero, 0x0063         ## $at = 00000063
/* 002AC 80A6B4FC 872200A4 */  lh      $v0, 0x00A4($t9)           ## 000000A4
/* 002B0 80A6B500 5441007A */  bnel    $v0, $at, .L80A6B6EC
/* 002B4 80A6B504 24010036 */  addiu   $at, $zero, 0x0036         ## $at = 00000036
/* 002B8 80A6B508 86080034 */  lh      $t0, 0x0034($s0)           ## 00000034
/* 002BC 80A6B50C 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 002C0 80A6B510 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 002C4 80A6B514 11000004 */  beq     $t0, $zero, .L80A6B528
/* 002C8 80A6B518 00000000 */  nop
/* 002CC 80A6B51C 8C490010 */  lw      $t1, 0x0010($v0)           ## 8015E670
/* 002D0 80A6B520 51200006 */  beql    $t1, $zero, .L80A6B53C
/* 002D4 80A6B524 8C4A0004 */  lw      $t2, 0x0004($v0)           ## 8015E664
.L80A6B528:
/* 002D8 80A6B528 0C00B55C */  jal     Actor_Kill

/* 002DC 80A6B52C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 002E0 80A6B530 100000DE */  beq     $zero, $zero, .L80A6B8AC
/* 002E4 80A6B534 8FBF0024 */  lw      $ra, 0x0024($sp)
/* 002E8 80A6B538 8C4A0004 */  lw      $t2, 0x0004($v0)           ## 00000004
.L80A6B53C:
/* 002EC 80A6B53C 11400015 */  beq     $t2, $zero, .L80A6B594
/* 002F0 80A6B540 00000000 */  nop
/* 002F4 80A6B544 0C00D6D3 */  jal     Flags_GetEventChkInf

/* 002F8 80A6B548 24040014 */  addiu   $a0, $zero, 0x0014         ## $a0 = 00000014
/* 002FC 80A6B54C 5040000A */  beql    $v0, $zero, .L80A6B578
/* 00300 80A6B550 860C0034 */  lh      $t4, 0x0034($s0)           ## 00000034
/* 00304 80A6B554 860B0034 */  lh      $t3, 0x0034($s0)           ## 00000034
/* 00308 80A6B558 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
/* 0030C 80A6B55C 51610026 */  beql    $t3, $at, .L80A6B5F8
/* 00310 80A6B560 A60000B8 */  sh      $zero, 0x00B8($s0)         ## 000000B8
/* 00314 80A6B564 0C00B55C */  jal     Actor_Kill

/* 00318 80A6B568 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0031C 80A6B56C 100000CF */  beq     $zero, $zero, .L80A6B8AC
/* 00320 80A6B570 8FBF0024 */  lw      $ra, 0x0024($sp)
/* 00324 80A6B574 860C0034 */  lh      $t4, 0x0034($s0)           ## 00000034
.L80A6B578:
/* 00328 80A6B578 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 0032C 80A6B57C 5181001E */  beql    $t4, $at, .L80A6B5F8
/* 00330 80A6B580 A60000B8 */  sh      $zero, 0x00B8($s0)         ## 000000B8
/* 00334 80A6B584 0C00B55C */  jal     Actor_Kill

/* 00338 80A6B588 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0033C 80A6B58C 100000C7 */  beq     $zero, $zero, .L80A6B8AC
/* 00340 80A6B590 8FBF0024 */  lw      $ra, 0x0024($sp)
.L80A6B594:
/* 00344 80A6B594 0C00D6D3 */  jal     Flags_GetEventChkInf

/* 00348 80A6B598 24040018 */  addiu   $a0, $zero, 0x0018         ## $a0 = 00000018
/* 0034C 80A6B59C 14400005 */  bne     $v0, $zero, .L80A6B5B4
/* 00350 80A6B5A0 3C0D8016 */  lui     $t5, %hi(gGameInfo)
/* 00354 80A6B5A4 8DADFA90 */  lw      $t5, %lo(gGameInfo)($t5)
/* 00358 80A6B5A8 85AE0556 */  lh      $t6, 0x0556($t5)           ## 80160556
/* 0035C 80A6B5AC 51C0000A */  beql    $t6, $zero, .L80A6B5D8
/* 00360 80A6B5B0 86180034 */  lh      $t8, 0x0034($s0)           ## 00000034
.L80A6B5B4:
/* 00364 80A6B5B4 860F0034 */  lh      $t7, 0x0034($s0)           ## 00000034
/* 00368 80A6B5B8 24010007 */  addiu   $at, $zero, 0x0007         ## $at = 00000007
/* 0036C 80A6B5BC 51E1000E */  beql    $t7, $at, .L80A6B5F8
/* 00370 80A6B5C0 A60000B8 */  sh      $zero, 0x00B8($s0)         ## 000000B8
/* 00374 80A6B5C4 0C00B55C */  jal     Actor_Kill

/* 00378 80A6B5C8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0037C 80A6B5CC 100000B7 */  beq     $zero, $zero, .L80A6B8AC
/* 00380 80A6B5D0 8FBF0024 */  lw      $ra, 0x0024($sp)
/* 00384 80A6B5D4 86180034 */  lh      $t8, 0x0034($s0)           ## 00000034
.L80A6B5D8:
/* 00388 80A6B5D8 24010005 */  addiu   $at, $zero, 0x0005         ## $at = 00000005
/* 0038C 80A6B5DC 53010006 */  beql    $t8, $at, .L80A6B5F8
/* 00390 80A6B5E0 A60000B8 */  sh      $zero, 0x00B8($s0)         ## 000000B8
/* 00394 80A6B5E4 0C00B55C */  jal     Actor_Kill

/* 00398 80A6B5E8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0039C 80A6B5EC 100000AF */  beq     $zero, $zero, .L80A6B8AC
/* 003A0 80A6B5F0 8FBF0024 */  lw      $ra, 0x0024($sp)
/* 003A4 80A6B5F4 A60000B8 */  sh      $zero, 0x00B8($s0)         ## 000000B8
.L80A6B5F8:
/* 003A8 80A6B5F8 860200B8 */  lh      $v0, 0x00B8($s0)           ## 000000B8
/* 003AC 80A6B5FC 3C060601 */  lui     $a2, 0x0601                ## $a2 = 06010000
/* 003B0 80A6B600 3C070600 */  lui     $a3, 0x0600                ## $a3 = 06000000
/* 003B4 80A6B604 A6020034 */  sh      $v0, 0x0034($s0)           ## 00000034
/* 003B8 80A6B608 A6020018 */  sh      $v0, 0x0018($s0)           ## 00000018
/* 003BC 80A6B60C 8FA4003C */  lw      $a0, 0x003C($sp)
/* 003C0 80A6B610 24E74580 */  addiu   $a3, $a3, 0x4580           ## $a3 = 06004580
/* 003C4 80A6B614 24C69FAC */  addiu   $a2, $a2, 0x9FAC           ## $a2 = 06009FAC
/* 003C8 80A6B618 0C02998F */  jal     func_800A663C
/* 003CC 80A6B61C 26050154 */  addiu   $a1, $s0, 0x0154           ## $a1 = 00000154
/* 003D0 80A6B620 8E190150 */  lw      $t9, 0x0150($s0)           ## 00000150
/* 003D4 80A6B624 3C0580A7 */  lui     $a1, %hi(D_80A6D370)       ## $a1 = 80A70000
/* 003D8 80A6B628 260401A0 */  addiu   $a0, $s0, 0x01A0           ## $a0 = 000001A0
/* 003DC 80A6B62C 00194080 */  sll     $t0, $t9,  2
/* 003E0 80A6B630 00A82821 */  addu    $a1, $a1, $t0
/* 003E4 80A6B634 0C02947A */  jal     SkelAnime_ChangeAnimDefaultStop
/* 003E8 80A6B638 8CA5D370 */  lw      $a1, %lo(D_80A6D370)($a1)
/* 003EC 80A6B63C 3C0180A7 */  lui     $at, %hi(D_80A6D5B0)       ## $at = 80A70000
/* 003F0 80A6B640 C432D5B0 */  lwc1    $f18, %lo(D_80A6D5B0)($at)
/* 003F4 80A6B644 C6000024 */  lwc1    $f0, 0x0024($s0)           ## 00000024
/* 003F8 80A6B648 46009032 */  c.eq.s  $f18, $f0
/* 003FC 80A6B64C 00000000 */  nop
/* 00400 80A6B650 4502000E */  bc1fl   .L80A6B68C
/* 00404 80A6B654 3C01445C */  lui     $at, 0x445C                ## $at = 445C0000
/* 00408 80A6B658 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 0040C 80A6B65C C6060028 */  lwc1    $f6, 0x0028($s0)           ## 00000028
/* 00410 80A6B660 3C0180A7 */  lui     $at, %hi(D_80A6D5B4)       ## $at = 80A70000
/* 00414 80A6B664 46062032 */  c.eq.s  $f4, $f6
/* 00418 80A6B668 00000000 */  nop
/* 0041C 80A6B66C 45020007 */  bc1fl   .L80A6B68C
/* 00420 80A6B670 3C01445C */  lui     $at, 0x445C                ## $at = 445C0000
/* 00424 80A6B674 C428D5B4 */  lwc1    $f8, %lo(D_80A6D5B4)($at)
/* 00428 80A6B678 C60A002C */  lwc1    $f10, 0x002C($s0)          ## 0000002C
/* 0042C 80A6B67C 460A4032 */  c.eq.s  $f8, $f10
/* 00430 80A6B680 00000000 */  nop
/* 00434 80A6B684 45010014 */  bc1t    .L80A6B6D8
/* 00438 80A6B688 3C01445C */  lui     $at, 0x445C                ## $at = 445C0000
.L80A6B68C:
/* 0043C 80A6B68C 44818000 */  mtc1    $at, $f16                  ## $f16 = 880.00
/* 00440 80A6B690 00000000 */  nop
/* 00444 80A6B694 46008032 */  c.eq.s  $f16, $f0
/* 00448 80A6B698 00000000 */  nop
/* 0044C 80A6B69C 45020075 */  bc1fl   .L80A6B874
/* 00450 80A6B6A0 8602001C */  lh      $v0, 0x001C($s0)           ## 0000001C
/* 00454 80A6B6A4 44809000 */  mtc1    $zero, $f18                ## $f18 = 0.00
/* 00458 80A6B6A8 C6040028 */  lwc1    $f4, 0x0028($s0)           ## 00000028
/* 0045C 80A6B6AC 3C0180A7 */  lui     $at, %hi(D_80A6D5B8)       ## $at = 80A70000
/* 00460 80A6B6B0 46049032 */  c.eq.s  $f18, $f4
/* 00464 80A6B6B4 00000000 */  nop
/* 00468 80A6B6B8 4502006E */  bc1fl   .L80A6B874
/* 0046C 80A6B6BC 8602001C */  lh      $v0, 0x001C($s0)           ## 0000001C
/* 00470 80A6B6C0 C426D5B8 */  lwc1    $f6, %lo(D_80A6D5B8)($at)
/* 00474 80A6B6C4 C608002C */  lwc1    $f8, 0x002C($s0)           ## 0000002C
/* 00478 80A6B6C8 46083032 */  c.eq.s  $f6, $f8
/* 0047C 80A6B6CC 00000000 */  nop
/* 00480 80A6B6D0 45020068 */  bc1fl   .L80A6B874
/* 00484 80A6B6D4 8602001C */  lh      $v0, 0x001C($s0)           ## 0000001C
.L80A6B6D8:
/* 00488 80A6B6D8 0C29B1AC */  jal     func_80A6C6B0
/* 0048C 80A6B6DC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00490 80A6B6E0 10000072 */  beq     $zero, $zero, .L80A6B8AC
/* 00494 80A6B6E4 8FBF0024 */  lw      $ra, 0x0024($sp)
/* 00498 80A6B6E8 24010036 */  addiu   $at, $zero, 0x0036         ## $at = 00000036
.L80A6B6EC:
/* 0049C 80A6B6EC 5441001C */  bnel    $v0, $at, .L80A6B760
/* 004A0 80A6B6F0 2401005D */  addiu   $at, $zero, 0x005D         ## $at = 0000005D
/* 004A4 80A6B6F4 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 004A8 80A6B6F8 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 004AC 80A6B6FC 8C490010 */  lw      $t1, 0x0010($v0)           ## 8015E670
/* 004B0 80A6B700 8FA4003C */  lw      $a0, 0x003C($sp)
/* 004B4 80A6B704 26050154 */  addiu   $a1, $s0, 0x0154           ## $a1 = 00000154
/* 004B8 80A6B708 15200005 */  bne     $t1, $zero, .L80A6B720
/* 004BC 80A6B70C 3C060601 */  lui     $a2, 0x0601                ## $a2 = 06010000
/* 004C0 80A6B710 0C00B55C */  jal     Actor_Kill

/* 004C4 80A6B714 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 004C8 80A6B718 10000064 */  beq     $zero, $zero, .L80A6B8AC
/* 004CC 80A6B71C 8FBF0024 */  lw      $ra, 0x0024($sp)
.L80A6B720:
/* 004D0 80A6B720 3C070600 */  lui     $a3, 0x0600                ## $a3 = 06000000
/* 004D4 80A6B724 24E74580 */  addiu   $a3, $a3, 0x4580           ## $a3 = 06004580
/* 004D8 80A6B728 0C02998F */  jal     func_800A663C
/* 004DC 80A6B72C 24C69FAC */  addiu   $a2, $a2, 0x9FAC           ## $a2 = FFFF9FAC
/* 004E0 80A6B730 8E0A0150 */  lw      $t2, 0x0150($s0)           ## 00000150
/* 004E4 80A6B734 3C0580A7 */  lui     $a1, %hi(D_80A6D370)       ## $a1 = 80A70000
/* 004E8 80A6B738 260401A0 */  addiu   $a0, $s0, 0x01A0           ## $a0 = 000001A0
/* 004EC 80A6B73C 000A5880 */  sll     $t3, $t2,  2
/* 004F0 80A6B740 00AB2821 */  addu    $a1, $a1, $t3
/* 004F4 80A6B744 0C02947A */  jal     SkelAnime_ChangeAnimDefaultStop
/* 004F8 80A6B748 8CA5D370 */  lw      $a1, %lo(D_80A6D370)($a1)
/* 004FC 80A6B74C 0C29B1AC */  jal     func_80A6C6B0
/* 00500 80A6B750 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00504 80A6B754 10000055 */  beq     $zero, $zero, .L80A6B8AC
/* 00508 80A6B758 8FBF0024 */  lw      $ra, 0x0024($sp)
/* 0050C 80A6B75C 2401005D */  addiu   $at, $zero, 0x005D         ## $at = 0000005D
.L80A6B760:
/* 00510 80A6B760 14410036 */  bne     $v0, $at, .L80A6B83C
/* 00514 80A6B764 8FA4003C */  lw      $a0, 0x003C($sp)
/* 00518 80A6B768 3C0180A7 */  lui     $at, %hi(D_80A6D5BC)       ## $at = 80A70000
/* 0051C 80A6B76C C42AD5BC */  lwc1    $f10, %lo(D_80A6D5BC)($at)
/* 00520 80A6B770 C6100024 */  lwc1    $f16, 0x0024($s0)          ## 00000024
/* 00524 80A6B774 3C060601 */  lui     $a2, 0x0601                ## $a2 = 06010000
/* 00528 80A6B778 3C0180A7 */  lui     $at, %hi(D_80A6D5C0)       ## $at = 80A70000
/* 0052C 80A6B77C 46105032 */  c.eq.s  $f10, $f16
/* 00530 80A6B780 24C69FAC */  addiu   $a2, $a2, 0x9FAC           ## $a2 = 06009FAC
/* 00534 80A6B784 8FA4003C */  lw      $a0, 0x003C($sp)
/* 00538 80A6B788 26050154 */  addiu   $a1, $s0, 0x0154           ## $a1 = 00000154
/* 0053C 80A6B78C 45000020 */  bc1f    .L80A6B810
/* 00540 80A6B790 3C070600 */  lui     $a3, 0x0600                ## $a3 = 06000000
/* 00544 80A6B794 C432D5C0 */  lwc1    $f18, %lo(D_80A6D5C0)($at)
/* 00548 80A6B798 C6040028 */  lwc1    $f4, 0x0028($s0)           ## 00000028
/* 0054C 80A6B79C 3C0180A7 */  lui     $at, %hi(D_80A6D5C4)       ## $at = 80A70000
/* 00550 80A6B7A0 46049032 */  c.eq.s  $f18, $f4
/* 00554 80A6B7A4 00000000 */  nop
/* 00558 80A6B7A8 45000019 */  bc1f    .L80A6B810
/* 0055C 80A6B7AC 00000000 */  nop
/* 00560 80A6B7B0 C426D5C4 */  lwc1    $f6, %lo(D_80A6D5C4)($at)
/* 00564 80A6B7B4 C608002C */  lwc1    $f8, 0x002C($s0)           ## 0000002C
/* 00568 80A6B7B8 46083032 */  c.eq.s  $f6, $f8
/* 0056C 80A6B7BC 00000000 */  nop
/* 00570 80A6B7C0 45000013 */  bc1f    .L80A6B810
/* 00574 80A6B7C4 00000000 */  nop
/* 00578 80A6B7C8 3C060601 */  lui     $a2, 0x0601                ## $a2 = 06010000
/* 0057C 80A6B7CC 3C070600 */  lui     $a3, 0x0600                ## $a3 = 06000000
/* 00580 80A6B7D0 24E74580 */  addiu   $a3, $a3, 0x4580           ## $a3 = 06004580
/* 00584 80A6B7D4 24C69FAC */  addiu   $a2, $a2, 0x9FAC           ## $a2 = 06009FAC
/* 00588 80A6B7D8 8FA4003C */  lw      $a0, 0x003C($sp)
/* 0058C 80A6B7DC 0C02998F */  jal     func_800A663C
/* 00590 80A6B7E0 26050154 */  addiu   $a1, $s0, 0x0154           ## $a1 = 00000154
/* 00594 80A6B7E4 8E0C0150 */  lw      $t4, 0x0150($s0)           ## 00000150
/* 00598 80A6B7E8 3C0580A7 */  lui     $a1, %hi(D_80A6D370)       ## $a1 = 80A70000
/* 0059C 80A6B7EC 260401A0 */  addiu   $a0, $s0, 0x01A0           ## $a0 = 000001A0
/* 005A0 80A6B7F0 000C6880 */  sll     $t5, $t4,  2
/* 005A4 80A6B7F4 00AD2821 */  addu    $a1, $a1, $t5
/* 005A8 80A6B7F8 0C02947A */  jal     SkelAnime_ChangeAnimDefaultStop
/* 005AC 80A6B7FC 8CA5D370 */  lw      $a1, %lo(D_80A6D370)($a1)
/* 005B0 80A6B800 0C29B133 */  jal     func_80A6C4CC
/* 005B4 80A6B804 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 005B8 80A6B808 10000028 */  beq     $zero, $zero, .L80A6B8AC
/* 005BC 80A6B80C 8FBF0024 */  lw      $ra, 0x0024($sp)
.L80A6B810:
/* 005C0 80A6B810 0C02998F */  jal     func_800A663C
/* 005C4 80A6B814 24E74580 */  addiu   $a3, $a3, 0x4580           ## $a3 = 00004580
/* 005C8 80A6B818 8E0E0150 */  lw      $t6, 0x0150($s0)           ## 00000150
/* 005CC 80A6B81C 3C0580A7 */  lui     $a1, %hi(D_80A6D370)       ## $a1 = 80A70000
/* 005D0 80A6B820 260401A0 */  addiu   $a0, $s0, 0x01A0           ## $a0 = 000001A0
/* 005D4 80A6B824 000E7880 */  sll     $t7, $t6,  2
/* 005D8 80A6B828 00AF2821 */  addu    $a1, $a1, $t7
/* 005DC 80A6B82C 0C02947A */  jal     SkelAnime_ChangeAnimDefaultStop
/* 005E0 80A6B830 8CA5D370 */  lw      $a1, %lo(D_80A6D370)($a1)
/* 005E4 80A6B834 1000000F */  beq     $zero, $zero, .L80A6B874
/* 005E8 80A6B838 8602001C */  lh      $v0, 0x001C($s0)           ## 0000001C
.L80A6B83C:
/* 005EC 80A6B83C 3C060601 */  lui     $a2, 0x0601                ## $a2 = 06010000
/* 005F0 80A6B840 3C070600 */  lui     $a3, 0x0600                ## $a3 = 06000000
/* 005F4 80A6B844 24E74580 */  addiu   $a3, $a3, 0x4580           ## $a3 = 06004580
/* 005F8 80A6B848 24C69FAC */  addiu   $a2, $a2, 0x9FAC           ## $a2 = 06009FAC
/* 005FC 80A6B84C 0C02998F */  jal     func_800A663C
/* 00600 80A6B850 26050154 */  addiu   $a1, $s0, 0x0154           ## $a1 = 00000154
/* 00604 80A6B854 8E180150 */  lw      $t8, 0x0150($s0)           ## 00000150
/* 00608 80A6B858 3C0580A7 */  lui     $a1, %hi(D_80A6D370)       ## $a1 = 80A70000
/* 0060C 80A6B85C 260401A0 */  addiu   $a0, $s0, 0x01A0           ## $a0 = 000001A0
/* 00610 80A6B860 0018C880 */  sll     $t9, $t8,  2
/* 00614 80A6B864 00B92821 */  addu    $a1, $a1, $t9
/* 00618 80A6B868 0C02947A */  jal     SkelAnime_ChangeAnimDefaultStop
/* 0061C 80A6B86C 8CA5D370 */  lw      $a1, %lo(D_80A6D370)($a1)
/* 00620 80A6B870 8602001C */  lh      $v0, 0x001C($s0)           ## 0000001C
.L80A6B874:
/* 00624 80A6B874 24010010 */  addiu   $at, $zero, 0x0010         ## $at = 00000010
/* 00628 80A6B878 304800F0 */  andi    $t0, $v0, 0x00F0           ## $t0 = 00000000
/* 0062C 80A6B87C 15010008 */  bne     $t0, $at, .L80A6B8A0
/* 00630 80A6B880 3049000F */  andi    $t1, $v0, 0x000F           ## $t1 = 00000000
/* 00634 80A6B884 2401000F */  addiu   $at, $zero, 0x000F         ## $at = 0000000F
/* 00638 80A6B888 11210005 */  beq     $t1, $at, .L80A6B8A0
/* 0063C 80A6B88C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00640 80A6B890 0C29AE47 */  jal     func_80A6B91C
/* 00644 80A6B894 8FA5003C */  lw      $a1, 0x003C($sp)
/* 00648 80A6B898 10000004 */  beq     $zero, $zero, .L80A6B8AC
/* 0064C 80A6B89C 8FBF0024 */  lw      $ra, 0x0024($sp)
.L80A6B8A0:
/* 00650 80A6B8A0 0C29AF12 */  jal     func_80A6BC48
/* 00654 80A6B8A4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00658 80A6B8A8 8FBF0024 */  lw      $ra, 0x0024($sp)
.L80A6B8AC:
/* 0065C 80A6B8AC 8FB00020 */  lw      $s0, 0x0020($sp)
/* 00660 80A6B8B0 27BD0038 */  addiu   $sp, $sp, 0x0038           ## $sp = 00000000
/* 00664 80A6B8B4 03E00008 */  jr      $ra
/* 00668 80A6B8B8 00000000 */  nop
