.rdata
glabel D_801407D0
    .asciz "\x1b[43;30m"
    .balign 4

glabel D_801407DC
    .asciz "Skin_Matrix_InverseMatrix():逆行列つくれません\n"
    # EUC-JP: 逆行列つくれません | Inverse matrix cannot be created
    .balign 4

glabel D_8014080C
    .asciz "\x1b[m"
    .balign 4

.late_rodata
glabel D_80140844
    .float 0.0005

.text
glabel SkinMatrix_Invert
/* B1E580 800A73E0 27BDFF48 */  addiu $sp, $sp, -0xb8
/* B1E584 800A73E4 AFB40028 */  sw    $s4, 0x28($sp)
/* B1E588 800A73E8 AFB30024 */  sw    $s3, 0x24($sp)
/* B1E58C 800A73EC 00A09825 */  move  $s3, $a1
/* B1E590 800A73F0 27B40078 */  addiu $s4, $sp, 0x78
/* B1E594 800A73F4 AFBF002C */  sw    $ra, 0x2c($sp)
/* B1E598 800A73F8 AFB20020 */  sw    $s2, 0x20($sp)
/* B1E59C 800A73FC AFB1001C */  sw    $s1, 0x1c($sp)
/* B1E5A0 800A7400 AFB00018 */  sw    $s0, 0x18($sp)
/* B1E5A4 800A7404 0C029CD7 */  jal   SkinMatrix_MtxFCopy
/* B1E5A8 800A7408 02802825 */   move  $a1, $s4
/* B1E5AC 800A740C 0C029CC3 */  jal   SkinMatrix_Clear
/* B1E5B0 800A7410 02602025 */   move  $a0, $s3
/* B1E5B4 800A7414 3C018014 */  lui   $at, %hi(D_80140844)
/* B1E5B8 800A7418 C42C0844 */  lwc1  $f12, %lo(D_80140844)($at)
/* B1E5BC 800A741C 00008025 */  move  $s0, $zero
/* B1E5C0 800A7420 240C0004 */  li    $t4, 4
/* B1E5C4 800A7424 2A010004 */  slti  $at, $s0, 4
.L800A7428:
/* B1E5C8 800A7428 10200016 */  beqz  $at, .L800A7484
/* B1E5CC 800A742C 02004825 */   move  $t1, $s0
/* B1E5D0 800A7430 00107100 */  sll   $t6, $s0, 4
/* B1E5D4 800A7434 028E5821 */  addu  $t3, $s4, $t6
/* B1E5D8 800A7438 00107880 */  sll   $t7, $s0, 2
/* B1E5DC 800A743C 016FC021 */  addu  $t8, $t3, $t7
/* B1E5E0 800A7440 C7000000 */  lwc1  $f0, ($t8)
/* B1E5E4 800A7444 46000005 */  abs.s $f0, $f0
/* B1E5E8 800A7448 460C003C */  c.lt.s $f0, $f12
/* B1E5EC 800A744C 00000000 */  nop   
/* B1E5F0 800A7450 4500000C */  bc1f  .L800A7484
/* B1E5F4 800A7454 00000000 */   nop   
/* B1E5F8 800A7458 25290001 */  addiu $t1, $t1, 1
.L800A745C:
/* B1E5FC 800A745C 29210004 */  slti  $at, $t1, 4
/* B1E600 800A7460 10200008 */  beqz  $at, .L800A7484
/* B1E604 800A7464 0009C880 */   sll   $t9, $t1, 2
/* B1E608 800A7468 01797021 */  addu  $t6, $t3, $t9
/* B1E60C 800A746C C5C00000 */  lwc1  $f0, ($t6)
/* B1E610 800A7470 46000005 */  abs.s $f0, $f0
/* B1E614 800A7474 460C003C */  c.lt.s $f0, $f12
/* B1E618 800A7478 00000000 */  nop   
/* B1E61C 800A747C 4503FFF7 */  bc1tl .L800A745C
/* B1E620 800A7480 25290001 */   addiu $t1, $t1, 1
.L800A7484:
/* B1E624 800A7484 152C000C */  bne   $t1, $t4, .L800A74B8
/* B1E628 800A7488 00107900 */   sll   $t7, $s0, 4
/* B1E62C 800A748C 3C048014 */  lui   $a0, %hi(D_801407D0) # $a0, 0x8014
/* B1E630 800A7490 0C00084C */  jal   osSyncPrintf
/* B1E634 800A7494 248407D0 */   addiu $a0, %lo(D_801407D0) # addiu $a0, $a0, 0x7d0
/* B1E638 800A7498 3C048014 */  lui   $a0, %hi(D_801407DC) # $a0, 0x8014
/* B1E63C 800A749C 0C00084C */  jal   osSyncPrintf
/* B1E640 800A74A0 248407DC */   addiu $a0, %lo(D_801407DC) # addiu $a0, $a0, 0x7dc
/* B1E644 800A74A4 3C048014 */  lui   $a0, %hi(D_8014080C) # $a0, 0x8014
/* B1E648 800A74A8 0C00084C */  jal   osSyncPrintf
/* B1E64C 800A74AC 2484080C */   addiu $a0, %lo(D_8014080C) # addiu $a0, $a0, 0x80c
/* B1E650 800A74B0 10000074 */  b     .L800A7684
/* B1E654 800A74B4 24020002 */   li    $v0, 2
.L800A74B8:
/* B1E658 800A74B8 00106880 */  sll   $t5, $s0, 2
/* B1E65C 800A74BC 028F5821 */  addu  $t3, $s4, $t7
/* B1E660 800A74C0 016D9021 */  addu  $s2, $t3, $t5
/* B1E664 800A74C4 028D2021 */  addu  $a0, $s4, $t5
/* B1E668 800A74C8 026D2821 */  addu  $a1, $s3, $t5
/* B1E66C 800A74CC 1130001E */  beq   $t1, $s0, .L800A7548
/* B1E670 800A74D0 0260F825 */   move  $ra, $s3
/* B1E674 800A74D4 00094080 */  sll   $t0, $t1, 2
/* B1E678 800A74D8 27B80078 */  addiu $t8, $sp, 0x78
/* B1E67C 800A74DC 01181021 */  addu  $v0, $t0, $t8
/* B1E680 800A74E0 01B81821 */  addu  $v1, $t5, $t8
/* B1E684 800A74E4 02683021 */  addu  $a2, $s3, $t0
/* B1E688 800A74E8 00005025 */  move  $t2, $zero
/* B1E68C 800A74EC 026D3821 */  addu  $a3, $s3, $t5
.L800A74F0:
/* B1E690 800A74F0 C4640000 */  lwc1  $f4, ($v1)
/* B1E694 800A74F4 C4400000 */  lwc1  $f0, ($v0)
/* B1E698 800A74F8 254A0002 */  addiu $t2, $t2, 2
/* B1E69C 800A74FC E4440000 */  swc1  $f4, ($v0)
/* B1E6A0 800A7500 E4600000 */  swc1  $f0, ($v1)
/* B1E6A4 800A7504 C4E60000 */  lwc1  $f6, ($a3)
/* B1E6A8 800A7508 C4C20000 */  lwc1  $f2, ($a2)
/* B1E6AC 800A750C 24420020 */  addiu $v0, $v0, 0x20
/* B1E6B0 800A7510 E4C60000 */  swc1  $f6, ($a2)
/* B1E6B4 800A7514 E4E20000 */  swc1  $f2, ($a3)
/* B1E6B8 800A7518 C4680010 */  lwc1  $f8, 0x10($v1)
/* B1E6BC 800A751C C440FFF0 */  lwc1  $f0, -0x10($v0)
/* B1E6C0 800A7520 24630020 */  addiu $v1, $v1, 0x20
/* B1E6C4 800A7524 E448FFF0 */  swc1  $f8, -0x10($v0)
/* B1E6C8 800A7528 E460FFF0 */  swc1  $f0, -0x10($v1)
/* B1E6CC 800A752C C4EA0010 */  lwc1  $f10, 0x10($a3)
/* B1E6D0 800A7530 C4C20010 */  lwc1  $f2, 0x10($a2)
/* B1E6D4 800A7534 24C60020 */  addiu $a2, $a2, 0x20
/* B1E6D8 800A7538 E4CAFFF0 */  swc1  $f10, -0x10($a2)
/* B1E6DC 800A753C 24E70020 */  addiu $a3, $a3, 0x20
/* B1E6E0 800A7540 154CFFEB */  bne   $t2, $t4, .L800A74F0
/* B1E6E4 800A7544 E4E2FFF0 */   swc1  $f2, -0x10($a3)
.L800A7548:
/* B1E6E8 800A7548 C6400000 */  lwc1  $f0, ($s2)
/* B1E6EC 800A754C C4900000 */  lwc1  $f16, ($a0)
/* B1E6F0 800A7550 00004825 */  move  $t1, $zero
/* B1E6F4 800A7554 46008483 */  div.s $f18, $f16, $f0
/* B1E6F8 800A7558 E4920000 */  swc1  $f18, ($a0)
/* B1E6FC 800A755C C4A40000 */  lwc1  $f4, ($a1)
/* B1E700 800A7560 46002183 */  div.s $f6, $f4, $f0
/* B1E704 800A7564 E4A60000 */  swc1  $f6, ($a1)
/* B1E708 800A7568 C4880010 */  lwc1  $f8, 0x10($a0)
/* B1E70C 800A756C 46004283 */  div.s $f10, $f8, $f0
/* B1E710 800A7570 E48A0010 */  swc1  $f10, 0x10($a0)
/* B1E714 800A7574 C4B00010 */  lwc1  $f16, 0x10($a1)
/* B1E718 800A7578 46008483 */  div.s $f18, $f16, $f0
/* B1E71C 800A757C E4B20010 */  swc1  $f18, 0x10($a1)
/* B1E720 800A7580 C4840020 */  lwc1  $f4, 0x20($a0)
/* B1E724 800A7584 46002183 */  div.s $f6, $f4, $f0
/* B1E728 800A7588 E4860020 */  swc1  $f6, 0x20($a0)
/* B1E72C 800A758C C4A80020 */  lwc1  $f8, 0x20($a1)
/* B1E730 800A7590 46004283 */  div.s $f10, $f8, $f0
/* B1E734 800A7594 E4AA0020 */  swc1  $f10, 0x20($a1)
/* B1E738 800A7598 C4900030 */  lwc1  $f16, 0x30($a0)
/* B1E73C 800A759C 46008483 */  div.s $f18, $f16, $f0
/* B1E740 800A75A0 E4920030 */  swc1  $f18, 0x30($a0)
/* B1E744 800A75A4 C4A40030 */  lwc1  $f4, 0x30($a1)
/* B1E748 800A75A8 46002183 */  div.s $f6, $f4, $f0
/* B1E74C 800A75AC E4A60030 */  swc1  $f6, 0x30($a1)
.L800A75B0:
/* B1E750 800A75B0 1130002D */  beq   $t1, $s0, .L800A7668
/* B1E754 800A75B4 00094080 */   sll   $t0, $t1, 2
/* B1E758 800A75B8 0168C821 */  addu  $t9, $t3, $t0
/* B1E75C 800A75BC C7200000 */  lwc1  $f0, ($t9)
/* B1E760 800A75C0 C48A0000 */  lwc1  $f10, ($a0)
/* B1E764 800A75C4 02881021 */  addu  $v0, $s4, $t0
/* B1E768 800A75C8 C4480000 */  lwc1  $f8, ($v0)
/* B1E76C 800A75CC 46005402 */  mul.s $f16, $f10, $f0
/* B1E770 800A75D0 03E81821 */  addu  $v1, $ra, $t0
/* B1E774 800A75D4 46104481 */  sub.s $f18, $f8, $f16
/* B1E778 800A75D8 E4520000 */  swc1  $f18, ($v0)
/* B1E77C 800A75DC C4A60000 */  lwc1  $f6, ($a1)
/* B1E780 800A75E0 C4640000 */  lwc1  $f4, ($v1)
/* B1E784 800A75E4 46003282 */  mul.s $f10, $f6, $f0
/* B1E788 800A75E8 460A2201 */  sub.s $f8, $f4, $f10
/* B1E78C 800A75EC E4680000 */  swc1  $f8, ($v1)
/* B1E790 800A75F0 C4920010 */  lwc1  $f18, 0x10($a0)
/* B1E794 800A75F4 C4500010 */  lwc1  $f16, 0x10($v0)
/* B1E798 800A75F8 46009182 */  mul.s $f6, $f18, $f0
/* B1E79C 800A75FC 46068101 */  sub.s $f4, $f16, $f6
/* B1E7A0 800A7600 E4440010 */  swc1  $f4, 0x10($v0)
/* B1E7A4 800A7604 C4A80010 */  lwc1  $f8, 0x10($a1)
/* B1E7A8 800A7608 C46A0010 */  lwc1  $f10, 0x10($v1)
/* B1E7AC 800A760C 46004482 */  mul.s $f18, $f8, $f0
/* B1E7B0 800A7610 46125401 */  sub.s $f16, $f10, $f18
/* B1E7B4 800A7614 E4700010 */  swc1  $f16, 0x10($v1)
/* B1E7B8 800A7618 C4840020 */  lwc1  $f4, 0x20($a0)
/* B1E7BC 800A761C C4460020 */  lwc1  $f6, 0x20($v0)
/* B1E7C0 800A7620 46002202 */  mul.s $f8, $f4, $f0
/* B1E7C4 800A7624 46083281 */  sub.s $f10, $f6, $f8
/* B1E7C8 800A7628 E44A0020 */  swc1  $f10, 0x20($v0)
/* B1E7CC 800A762C C4B00020 */  lwc1  $f16, 0x20($a1)
/* B1E7D0 800A7630 C4720020 */  lwc1  $f18, 0x20($v1)
/* B1E7D4 800A7634 46008102 */  mul.s $f4, $f16, $f0
/* B1E7D8 800A7638 46049181 */  sub.s $f6, $f18, $f4
/* B1E7DC 800A763C E4660020 */  swc1  $f6, 0x20($v1)
/* B1E7E0 800A7640 C48A0030 */  lwc1  $f10, 0x30($a0)
/* B1E7E4 800A7644 C4480030 */  lwc1  $f8, 0x30($v0)
/* B1E7E8 800A7648 46005402 */  mul.s $f16, $f10, $f0
/* B1E7EC 800A764C 46104481 */  sub.s $f18, $f8, $f16
/* B1E7F0 800A7650 E4520030 */  swc1  $f18, 0x30($v0)
/* B1E7F4 800A7654 C4A60030 */  lwc1  $f6, 0x30($a1)
/* B1E7F8 800A7658 C4640030 */  lwc1  $f4, 0x30($v1)
/* B1E7FC 800A765C 46003282 */  mul.s $f10, $f6, $f0
/* B1E800 800A7660 460A2201 */  sub.s $f8, $f4, $f10
/* B1E804 800A7664 E4680030 */  swc1  $f8, 0x30($v1)
.L800A7668:
/* B1E808 800A7668 25290001 */  addiu $t1, $t1, 1
/* B1E80C 800A766C 152CFFD0 */  bne   $t1, $t4, .L800A75B0
/* B1E810 800A7670 00000000 */   nop   
/* B1E814 800A7674 26100001 */  addiu $s0, $s0, 1
/* B1E818 800A7678 560CFF6B */  bnel  $s0, $t4, .L800A7428
/* B1E81C 800A767C 2A010004 */   slti  $at, $s0, 4
/* B1E820 800A7680 00001025 */  move  $v0, $zero
.L800A7684:
/* B1E824 800A7684 8FBF002C */  lw    $ra, 0x2c($sp)
/* B1E828 800A7688 8FB00018 */  lw    $s0, 0x18($sp)
/* B1E82C 800A768C 8FB1001C */  lw    $s1, 0x1c($sp)
/* B1E830 800A7690 8FB20020 */  lw    $s2, 0x20($sp)
/* B1E834 800A7694 8FB30024 */  lw    $s3, 0x24($sp)
/* B1E838 800A7698 8FB40028 */  lw    $s4, 0x28($sp)
/* B1E83C 800A769C 03E00008 */  jr    $ra
/* B1E840 800A76A0 27BD00B8 */   addiu $sp, $sp, 0xb8

