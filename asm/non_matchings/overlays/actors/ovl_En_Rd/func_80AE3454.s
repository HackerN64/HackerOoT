.late_rodata
glabel jtbl_80AE49A4
.word L80AE3508
.word L80AE34B4
.word L80AE3538
.word L80AE3724
.word L80AE3754

.text
glabel func_80AE3454
/* 01054 80AE3454 27BDFFB8 */  addiu   $sp, $sp, 0xFFB8           ## $sp = FFFFFFB8
/* 01058 80AE3458 AFB00028 */  sw      $s0, 0x0028($sp)
/* 0105C 80AE345C AFBF002C */  sw      $ra, 0x002C($sp)
/* 01060 80AE3460 AFA5004C */  sw      $a1, 0x004C($sp)
/* 01064 80AE3464 8CAF1C44 */  lw      $t7, 0x1C44($a1)           ## 00001C44
/* 01068 80AE3468 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 0106C 80AE346C 24840188 */  addiu   $a0, $a0, 0x0188           ## $a0 = 00000188
/* 01070 80AE3470 AFA40034 */  sw      $a0, 0x0034($sp)
/* 01074 80AE3474 0C02927F */  jal     SkelAnime_FrameUpdateMatrix

/* 01078 80AE3478 AFAF0040 */  sw      $t7, 0x0040($sp)
/* 0107C 80AE347C 50400005 */  beql    $v0, $zero, .L80AE3494
/* 01080 80AE3480 92080304 */  lbu     $t0, 0x0304($s0)           ## 00000304
/* 01084 80AE3484 92180304 */  lbu     $t8, 0x0304($s0)           ## 00000304
/* 01088 80AE3488 27190001 */  addiu   $t9, $t8, 0x0001           ## $t9 = 00000001
/* 0108C 80AE348C A2190304 */  sb      $t9, 0x0304($s0)           ## 00000304
/* 01090 80AE3490 92080304 */  lbu     $t0, 0x0304($s0)           ## 00000304
.L80AE3494:
/* 01094 80AE3494 2D010005 */  sltiu   $at, $t0, 0x0005
/* 01098 80AE3498 102000C3 */  beq     $at, $zero, .L80AE37A8
/* 0109C 80AE349C 00084080 */  sll     $t0, $t0,  2
/* 010A0 80AE34A0 3C0180AE */  lui     $at, %hi(jtbl_80AE49A4)       ## $at = 80AE0000
/* 010A4 80AE34A4 00280821 */  addu    $at, $at, $t0
/* 010A8 80AE34A8 8C2849A4 */  lw      $t0, %lo(jtbl_80AE49A4)($at)
/* 010AC 80AE34AC 01000008 */  jr      $t0
/* 010B0 80AE34B0 00000000 */  nop
glabel L80AE34B4
/* 010B4 80AE34B4 3C050600 */  lui     $a1, 0x0600                ## $a1 = 06000000
/* 010B8 80AE34B8 24A54268 */  addiu   $a1, $a1, 0x4268           ## $a1 = 06004268
/* 010BC 80AE34BC 0C0294BE */  jal     SkelAnime_ChangeAnimDefaultRepeat
/* 010C0 80AE34C0 8FA40034 */  lw      $a0, 0x0034($sp)
/* 010C4 80AE34C4 92090304 */  lbu     $t1, 0x0304($s0)           ## 00000304
/* 010C8 80AE34C8 8FA4004C */  lw      $a0, 0x004C($sp)
/* 010CC 80AE34CC 3C190001 */  lui     $t9, 0x0001                ## $t9 = 00010000
/* 010D0 80AE34D0 252A0001 */  addiu   $t2, $t1, 0x0001           ## $t2 = 00000001
/* 010D4 80AE34D4 A20A0304 */  sb      $t2, 0x0304($s0)           ## 00000304
/* 010D8 80AE34D8 0324C821 */  addu    $t9, $t9, $a0
/* 010DC 80AE34DC 8F391D58 */  lw      $t9, 0x1D58($t9)           ## 00011D58
/* 010E0 80AE34E0 2405FFF8 */  addiu   $a1, $zero, 0xFFF8         ## $a1 = FFFFFFF8
/* 010E4 80AE34E4 0320F809 */  jalr    $ra, $t9
/* 010E8 80AE34E8 00000000 */  nop
/* 010EC 80AE34EC C60C0090 */  lwc1    $f12, 0x0090($s0)          ## 00000090
/* 010F0 80AE34F0 240500FF */  addiu   $a1, $zero, 0x00FF         ## $a1 = 000000FF
/* 010F4 80AE34F4 24060001 */  addiu   $a2, $zero, 0x0001         ## $a2 = 00000001
/* 010F8 80AE34F8 0C02A800 */  jal     func_800AA000
/* 010FC 80AE34FC 2407000C */  addiu   $a3, $zero, 0x000C         ## $a3 = 0000000C
/* 01100 80AE3500 240B0014 */  addiu   $t3, $zero, 0x0014         ## $t3 = 00000014
/* 01104 80AE3504 A20B0319 */  sb      $t3, 0x0319($s0)           ## 00000319
glabel L80AE3508
/* 01108 80AE3508 2604030E */  addiu   $a0, $s0, 0x030E           ## $a0 = 0000030E
/* 0110C 80AE350C 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 01110 80AE3510 24060001 */  addiu   $a2, $zero, 0x0001         ## $a2 = 00000001
/* 01114 80AE3514 240705DC */  addiu   $a3, $zero, 0x05DC         ## $a3 = 000005DC
/* 01118 80AE3518 0C01E1A7 */  jal     Math_SmoothScaleMaxMinS

/* 0111C 80AE351C AFA00010 */  sw      $zero, 0x0010($sp)
/* 01120 80AE3520 26040310 */  addiu   $a0, $s0, 0x0310           ## $a0 = 00000310
/* 01124 80AE3524 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 01128 80AE3528 24060001 */  addiu   $a2, $zero, 0x0001         ## $a2 = 00000001
/* 0112C 80AE352C 240705DC */  addiu   $a3, $zero, 0x05DC         ## $a3 = 000005DC
/* 01130 80AE3530 0C01E1A7 */  jal     Math_SmoothScaleMaxMinS

/* 01134 80AE3534 AFA00010 */  sw      $zero, 0x0010($sp)
glabel L80AE3538
/* 01138 80AE3538 8FAC0040 */  lw      $t4, 0x0040($sp)
/* 0113C 80AE353C 3C040600 */  lui     $a0, 0x0600                ## $a0 = 06000000
/* 01140 80AE3540 3C0A8016 */  lui     $t2, %hi(gSaveContext+4)
/* 01144 80AE3544 8D8D0680 */  lw      $t5, 0x0680($t4)           ## 00000680
/* 01148 80AE3548 31AE0080 */  andi    $t6, $t5, 0x0080           ## $t6 = 00000000
/* 0114C 80AE354C 15C00016 */  bne     $t6, $zero, .L80AE35A8
/* 01150 80AE3550 00000000 */  nop
/* 01154 80AE3554 0C028800 */  jal     SkelAnime_GetFrameCount

/* 01158 80AE3558 248446F8 */  addiu   $a0, $a0, 0x46F8           ## $a0 = 060046F8
/* 0115C 80AE355C 44822000 */  mtc1    $v0, $f4                   ## $f4 = 0.00
/* 01160 80AE3560 44800000 */  mtc1    $zero, $f0                 ## $f0 = 0.00
/* 01164 80AE3564 3C050600 */  lui     $a1, 0x0600                ## $a1 = 06000000
/* 01168 80AE3568 468021A0 */  cvt.s.w $f6, $f4
/* 0116C 80AE356C 240F0003 */  addiu   $t7, $zero, 0x0003         ## $t7 = 00000003
/* 01170 80AE3570 44070000 */  mfc1    $a3, $f0
/* 01174 80AE3574 AFAF0014 */  sw      $t7, 0x0014($sp)
/* 01178 80AE3578 24A546F8 */  addiu   $a1, $a1, 0x46F8           ## $a1 = 060046F8
/* 0117C 80AE357C 8FA40034 */  lw      $a0, 0x0034($sp)
/* 01180 80AE3580 E7A60010 */  swc1    $f6, 0x0010($sp)
/* 01184 80AE3584 3C063F00 */  lui     $a2, 0x3F00                ## $a2 = 3F000000
/* 01188 80AE3588 0C029468 */  jal     SkelAnime_ChangeAnim

/* 0118C 80AE358C E7A00018 */  swc1    $f0, 0x0018($sp)
/* 01190 80AE3590 92180304 */  lbu     $t8, 0x0304($s0)           ## 00000304
/* 01194 80AE3594 24090004 */  addiu   $t1, $zero, 0x0004         ## $t1 = 00000004
/* 01198 80AE3598 A209031B */  sb      $t1, 0x031B($s0)           ## 0000031B
/* 0119C 80AE359C 27080001 */  addiu   $t0, $t8, 0x0001           ## $t0 = 00000001
/* 011A0 80AE35A0 10000081 */  beq     $zero, $zero, .L80AE37A8
/* 011A4 80AE35A4 A2080304 */  sb      $t0, 0x0304($s0)           ## 00000304
.L80AE35A8:
/* 011A8 80AE35A8 8D4AE664 */  lw      $t2, %lo(gSaveContext+4)($t2)
/* 011AC 80AE35AC 3C05C4BB */  lui     $a1, 0xC4BB                ## $a1 = C4BB0000
/* 011B0 80AE35B0 34A58000 */  ori     $a1, $a1, 0x8000           ## $a1 = C4BB8000
/* 011B4 80AE35B4 11400006 */  beq     $t2, $zero, .L80AE35D0
/* 011B8 80AE35B8 260400BC */  addiu   $a0, $s0, 0x00BC           ## $a0 = 000000BC
/* 011BC 80AE35BC 44804000 */  mtc1    $zero, $f8                 ## $f8 = 0.00
/* 011C0 80AE35C0 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 011C4 80AE35C4 3C074316 */  lui     $a3, 0x4316                ## $a3 = 43160000
/* 011C8 80AE35C8 0C01E0C4 */  jal     Math_SmoothScaleMaxMinF

/* 011CC 80AE35CC E7A80010 */  swc1    $f8, 0x0010($sp)
.L80AE35D0:
/* 011D0 80AE35D0 8FB90040 */  lw      $t9, 0x0040($sp)
/* 011D4 80AE35D4 0C01DE1C */  jal     Math_Sins
              ## sins?
/* 011D8 80AE35D8 872400B6 */  lh      $a0, 0x00B6($t9)           ## 000000B6
/* 011DC 80AE35DC 3C01C1C8 */  lui     $at, 0xC1C8                ## $at = C1C80000
/* 011E0 80AE35E0 44815000 */  mtc1    $at, $f10                  ## $f10 = -25.00
/* 011E4 80AE35E4 8FAB0040 */  lw      $t3, 0x0040($sp)
/* 011E8 80AE35E8 44803000 */  mtc1    $zero, $f6                 ## $f6 = 0.00
/* 011EC 80AE35EC 460A0402 */  mul.s   $f16, $f0, $f10
/* 011F0 80AE35F0 C5720024 */  lwc1    $f18, 0x0024($t3)          ## 00000024
/* 011F4 80AE35F4 26040024 */  addiu   $a0, $s0, 0x0024           ## $a0 = 00000024
/* 011F8 80AE35F8 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 011FC 80AE35FC 3C074120 */  lui     $a3, 0x4120                ## $a3 = 41200000
/* 01200 80AE3600 E7A60010 */  swc1    $f6, 0x0010($sp)
/* 01204 80AE3604 46128100 */  add.s   $f4, $f16, $f18
/* 01208 80AE3608 44052000 */  mfc1    $a1, $f4
/* 0120C 80AE360C 0C01E0C4 */  jal     Math_SmoothScaleMaxMinF

/* 01210 80AE3610 00000000 */  nop
/* 01214 80AE3614 8FAC0040 */  lw      $t4, 0x0040($sp)
/* 01218 80AE3618 44804000 */  mtc1    $zero, $f8                 ## $f8 = 0.00
/* 0121C 80AE361C 26040028 */  addiu   $a0, $s0, 0x0028           ## $a0 = 00000028
/* 01220 80AE3620 8D850028 */  lw      $a1, 0x0028($t4)           ## 00000028
/* 01224 80AE3624 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 01228 80AE3628 3C074120 */  lui     $a3, 0x4120                ## $a3 = 41200000
/* 0122C 80AE362C 0C01E0C4 */  jal     Math_SmoothScaleMaxMinF

/* 01230 80AE3630 E7A80010 */  swc1    $f8, 0x0010($sp)
/* 01234 80AE3634 8FAD0040 */  lw      $t5, 0x0040($sp)
/* 01238 80AE3638 0C01DE0D */  jal     Math_Coss
              ## coss?
/* 0123C 80AE363C 85A400B6 */  lh      $a0, 0x00B6($t5)           ## 000000B6
/* 01240 80AE3640 3C01C1C8 */  lui     $at, 0xC1C8                ## $at = C1C80000
/* 01244 80AE3644 44815000 */  mtc1    $at, $f10                  ## $f10 = -25.00
/* 01248 80AE3648 8FAE0040 */  lw      $t6, 0x0040($sp)
/* 0124C 80AE364C 44803000 */  mtc1    $zero, $f6                 ## $f6 = 0.00
/* 01250 80AE3650 460A0402 */  mul.s   $f16, $f0, $f10
/* 01254 80AE3654 C5D2002C */  lwc1    $f18, 0x002C($t6)          ## 0000002C
/* 01258 80AE3658 2604002C */  addiu   $a0, $s0, 0x002C           ## $a0 = 0000002C
/* 0125C 80AE365C 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 01260 80AE3660 3C074120 */  lui     $a3, 0x4120                ## $a3 = 41200000
/* 01264 80AE3664 E7A60010 */  swc1    $f6, 0x0010($sp)
/* 01268 80AE3668 46128100 */  add.s   $f4, $f16, $f18
/* 0126C 80AE366C 44052000 */  mfc1    $a1, $f4
/* 01270 80AE3670 0C01E0C4 */  jal     Math_SmoothScaleMaxMinF

/* 01274 80AE3674 00000000 */  nop
/* 01278 80AE3678 8FAF0040 */  lw      $t7, 0x0040($sp)
/* 0127C 80AE367C 260400B6 */  addiu   $a0, $s0, 0x00B6           ## $a0 = 000000B6
/* 01280 80AE3680 24060001 */  addiu   $a2, $zero, 0x0001         ## $a2 = 00000001
/* 01284 80AE3684 85E500B6 */  lh      $a1, 0x00B6($t7)           ## 000000B6
/* 01288 80AE3688 AFA00010 */  sw      $zero, 0x0010($sp)
/* 0128C 80AE368C 0C01E1A7 */  jal     Math_SmoothScaleMaxMinS

/* 01290 80AE3690 24071770 */  addiu   $a3, $zero, 0x1770         ## $a3 = 00001770
/* 01294 80AE3694 44804000 */  mtc1    $zero, $f8                 ## $f8 = 0.00
/* 01298 80AE3698 C60A01A0 */  lwc1    $f10, 0x01A0($s0)          ## 000001A0
/* 0129C 80AE369C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 012A0 80AE36A0 460A4032 */  c.eq.s  $f8, $f10
/* 012A4 80AE36A4 00000000 */  nop
/* 012A8 80AE36A8 45020004 */  bc1fl   .L80AE36BC
/* 012AC 80AE36AC 92180319 */  lbu     $t8, 0x0319($s0)           ## 00000319
/* 012B0 80AE36B0 0C00BE0A */  jal     Audio_PlayActorSound2

/* 012B4 80AE36B4 240538E8 */  addiu   $a1, $zero, 0x38E8         ## $a1 = 000038E8
/* 012B8 80AE36B8 92180319 */  lbu     $t8, 0x0319($s0)           ## 00000319
.L80AE36BC:
/* 012BC 80AE36BC 2708FFFF */  addiu   $t0, $t8, 0xFFFF           ## $t0 = FFFFFFFF
/* 012C0 80AE36C0 310900FF */  andi    $t1, $t0, 0x00FF           ## $t1 = 000000FF
/* 012C4 80AE36C4 15200038 */  bne     $t1, $zero, .L80AE37A8
/* 012C8 80AE36C8 A2080319 */  sb      $t0, 0x0319($s0)           ## 00000319
/* 012CC 80AE36CC 8FA4004C */  lw      $a0, 0x004C($sp)
/* 012D0 80AE36D0 3C190001 */  lui     $t9, 0x0001                ## $t9 = 00010000
/* 012D4 80AE36D4 2405FFF8 */  addiu   $a1, $zero, 0xFFF8         ## $a1 = FFFFFFF8
/* 012D8 80AE36D8 0324C821 */  addu    $t9, $t9, $a0
/* 012DC 80AE36DC 8F391D58 */  lw      $t9, 0x1D58($t9)           ## 00011D58
/* 012E0 80AE36E0 0320F809 */  jalr    $ra, $t9
/* 012E4 80AE36E4 00000000 */  nop
/* 012E8 80AE36E8 C60C0090 */  lwc1    $f12, 0x0090($s0)          ## 00000090
/* 012EC 80AE36EC 240500F0 */  addiu   $a1, $zero, 0x00F0         ## $a1 = 000000F0
/* 012F0 80AE36F0 24060001 */  addiu   $a2, $zero, 0x0001         ## $a2 = 00000001
/* 012F4 80AE36F4 0C02A800 */  jal     func_800AA000
/* 012F8 80AE36F8 2407000C */  addiu   $a3, $zero, 0x000C         ## $a3 = 0000000C
/* 012FC 80AE36FC 240A0014 */  addiu   $t2, $zero, 0x0014         ## $t2 = 00000014
/* 01300 80AE3700 A20A0319 */  sb      $t2, 0x0319($s0)           ## 00000319
/* 01304 80AE3704 8FA40040 */  lw      $a0, 0x0040($sp)
/* 01308 80AE3708 8C8C0678 */  lw      $t4, 0x0678($a0)           ## 00000678
/* 0130C 80AE370C 95850092 */  lhu     $a1, 0x0092($t4)           ## 00000092
/* 01310 80AE3710 24A56805 */  addiu   $a1, $a1, 0x6805           ## $a1 = 00006805
/* 01314 80AE3714 0C00BDF7 */  jal     func_8002F7DC
/* 01318 80AE3718 30A5FFFF */  andi    $a1, $a1, 0xFFFF           ## $a1 = 00006805
/* 0131C 80AE371C 10000023 */  beq     $zero, $zero, .L80AE37AC
/* 01320 80AE3720 8FBF002C */  lw      $ra, 0x002C($sp)
glabel L80AE3724
/* 01324 80AE3724 3C0D8016 */  lui     $t5, %hi(gSaveContext+4)
/* 01328 80AE3728 8DADE664 */  lw      $t5, %lo(gSaveContext+4)($t5)
/* 0132C 80AE372C 260400BC */  addiu   $a0, $s0, 0x00BC           ## $a0 = 000000BC
/* 01330 80AE3730 24050000 */  addiu   $a1, $zero, 0x0000         ## $a1 = 00000000
/* 01334 80AE3734 11A0001C */  beq     $t5, $zero, .L80AE37A8
/* 01338 80AE3738 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 0133C 80AE373C 44808000 */  mtc1    $zero, $f16                ## $f16 = 0.00
/* 01340 80AE3740 3C0743C8 */  lui     $a3, 0x43C8                ## $a3 = 43C80000
/* 01344 80AE3744 0C01E0C4 */  jal     Math_SmoothScaleMaxMinF

/* 01348 80AE3748 E7B00010 */  swc1    $f16, 0x0010($sp)
/* 0134C 80AE374C 10000017 */  beq     $zero, $zero, .L80AE37AC
/* 01350 80AE3750 8FBF002C */  lw      $ra, 0x002C($sp)
glabel L80AE3754
/* 01354 80AE3754 3C0E8016 */  lui     $t6, %hi(gSaveContext+4)
/* 01358 80AE3758 8DCEE664 */  lw      $t6, %lo(gSaveContext+4)($t6)
/* 0135C 80AE375C 260400BC */  addiu   $a0, $s0, 0x00BC           ## $a0 = 000000BC
/* 01360 80AE3760 24050000 */  addiu   $a1, $zero, 0x0000         ## $a1 = 00000000
/* 01364 80AE3764 11C00005 */  beq     $t6, $zero, .L80AE377C
/* 01368 80AE3768 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 0136C 80AE376C 44809000 */  mtc1    $zero, $f18                ## $f18 = 0.00
/* 01370 80AE3770 3C0743C8 */  lui     $a3, 0x43C8                ## $a3 = 43C80000
/* 01374 80AE3774 0C01E0C4 */  jal     Math_SmoothScaleMaxMinF

/* 01378 80AE3778 E7B20010 */  swc1    $f18, 0x0010($sp)
.L80AE377C:
/* 0137C 80AE377C 8E0F0004 */  lw      $t7, 0x0004($s0)           ## 00000004
/* 01380 80AE3780 2408000A */  addiu   $t0, $zero, 0x000A         ## $t0 = 0000000A
/* 01384 80AE3784 2409000F */  addiu   $t1, $zero, 0x000F         ## $t1 = 0000000F
/* 01388 80AE3788 35F80001 */  ori     $t8, $t7, 0x0001           ## $t8 = 00000001
/* 0138C 80AE378C A200001F */  sb      $zero, 0x001F($s0)         ## 0000001F
/* 01390 80AE3790 AE180004 */  sw      $t8, 0x0004($s0)           ## 00000004
/* 01394 80AE3794 A2080306 */  sb      $t0, 0x0306($s0)           ## 00000306
/* 01398 80AE3798 A2090307 */  sb      $t1, 0x0307($s0)           ## 00000307
/* 0139C 80AE379C 8FA5004C */  lw      $a1, 0x004C($sp)
/* 013A0 80AE37A0 0C2B8AE4 */  jal     func_80AE2B90
/* 013A4 80AE37A4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
.L80AE37A8:
/* 013A8 80AE37A8 8FBF002C */  lw      $ra, 0x002C($sp)
.L80AE37AC:
/* 013AC 80AE37AC 8FB00028 */  lw      $s0, 0x0028($sp)
/* 013B0 80AE37B0 27BD0048 */  addiu   $sp, $sp, 0x0048           ## $sp = 00000000
/* 013B4 80AE37B4 03E00008 */  jr      $ra
/* 013B8 80AE37B8 00000000 */  nop
