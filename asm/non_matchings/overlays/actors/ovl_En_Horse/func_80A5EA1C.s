.late_rodata
glabel D_80A668D0
    .float 0.01

.text
glabel func_80A5EA1C
/* 0372C 80A5EA1C 27BDFFC8 */  addiu   $sp, $sp, 0xFFC8           ## $sp = FFFFFFC8
/* 03730 80A5EA20 AFBF002C */  sw      $ra, 0x002C($sp)
/* 03734 80A5EA24 AFB00028 */  sw      $s0, 0x0028($sp)
/* 03738 80A5EA28 AFA5003C */  sw      $a1, 0x003C($sp)
/* 0373C 80A5EA2C C48401C4 */  lwc1    $f4, 0x01C4($a0)           ## 000001C4
/* 03740 80A5EA30 240E000E */  addiu   $t6, $zero, 0x000E         ## $t6 = 0000000E
/* 03744 80A5EA34 240F0007 */  addiu   $t7, $zero, 0x0007         ## $t7 = 00000007
/* 03748 80A5EA38 AC8E014C */  sw      $t6, 0x014C($a0)           ## 0000014C
/* 0374C 80A5EA3C AC8F0210 */  sw      $t7, 0x0210($a0)           ## 00000210
/* 03750 80A5EA40 E7A40034 */  swc1    $f4, 0x0034($sp)
/* 03754 80A5EA44 8C980158 */  lw      $t8, 0x0158($a0)           ## 00000158
/* 03758 80A5EA48 3C0880A6 */  lui     $t0, %hi(D_80A65E58)       ## $t0 = 80A60000
/* 0375C 80A5EA4C 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 03760 80A5EA50 0018C880 */  sll     $t9, $t8,  2
/* 03764 80A5EA54 01194021 */  addu    $t0, $t0, $t9
/* 03768 80A5EA58 8D085E58 */  lw      $t0, %lo(D_80A65E58)($t0)
/* 0376C 80A5EA5C 0C028800 */  jal     Animation_GetLastFrame

/* 03770 80A5EA60 8D04001C */  lw      $a0, 0x001C($t0)           ## 80A6001C
/* 03774 80A5EA64 8E090158 */  lw      $t1, 0x0158($s0)           ## 00000158
/* 03778 80A5EA68 44823000 */  mtc1    $v0, $f6                   ## $f6 = 0.00
/* 0377C 80A5EA6C 3C0B80A6 */  lui     $t3, %hi(D_80A65E58)       ## $t3 = 80A60000
/* 03780 80A5EA70 00095080 */  sll     $t2, $t1,  2
/* 03784 80A5EA74 8E0C0210 */  lw      $t4, 0x0210($s0)           ## 00000210
/* 03788 80A5EA78 016A5821 */  addu    $t3, $t3, $t2
/* 0378C 80A5EA7C 8D6B5E58 */  lw      $t3, %lo(D_80A65E58)($t3)
/* 03790 80A5EA80 46803220 */  cvt.s.w $f8, $f6
/* 03794 80A5EA84 000C6880 */  sll     $t5, $t4,  2
/* 03798 80A5EA88 3C01C040 */  lui     $at, 0xC040                ## $at = C0400000
/* 0379C 80A5EA8C 016D7021 */  addu    $t6, $t3, $t5
/* 037A0 80A5EA90 44815000 */  mtc1    $at, $f10                  ## $f10 = -3.00
/* 037A4 80A5EA94 8DC50000 */  lw      $a1, 0x0000($t6)           ## 00000000
/* 037A8 80A5EA98 240F0002 */  addiu   $t7, $zero, 0x0002         ## $t7 = 00000002
/* 037AC 80A5EA9C AFAF0014 */  sw      $t7, 0x0014($sp)
/* 037B0 80A5EAA0 E7A80010 */  swc1    $f8, 0x0010($sp)
/* 037B4 80A5EAA4 260401AC */  addiu   $a0, $s0, 0x01AC           ## $a0 = 000001AC
/* 037B8 80A5EAA8 3C063FC0 */  lui     $a2, 0x3FC0                ## $a2 = 3FC00000
/* 037BC 80A5EAAC 8FA70034 */  lw      $a3, 0x0034($sp)
/* 037C0 80A5EAB0 0C029468 */  jal     Animation_Change

/* 037C4 80A5EAB4 E7AA0018 */  swc1    $f10, 0x0018($sp)
/* 037C8 80A5EAB8 C6100028 */  lwc1    $f16, 0x0028($s0)          ## 00000028
/* 037CC 80A5EABC 44809000 */  mtc1    $zero, $f18                ## $f18 = 0.00
/* 037D0 80A5EAC0 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 037D4 80A5EAC4 8E0201CC */  lw      $v0, 0x01CC($s0)           ## 000001CC
/* 037D8 80A5EAC8 AE000244 */  sw      $zero, 0x0244($s0)         ## 00000244
/* 037DC 80A5EACC E6100274 */  swc1    $f16, 0x0274($s0)          ## 00000274
/* 037E0 80A5EAD0 E612006C */  swc1    $f18, 0x006C($s0)          ## 0000006C
/* 037E4 80A5EAD4 E6040060 */  swc1    $f4, 0x0060($s0)           ## 00000060
/* 037E8 80A5EAD8 84580002 */  lh      $t8, 0x0002($v0)           ## 00000002
/* 037EC 80A5EADC 3C0180A6 */  lui     $at, %hi(D_80A668D0)       ## $at = 80A60000
/* 037F0 80A5EAE0 C42A68D0 */  lwc1    $f10, %lo(D_80A668D0)($at)
/* 037F4 80A5EAE4 44983000 */  mtc1    $t8, $f6                   ## $f6 = 0.00
/* 037F8 80A5EAE8 C608025C */  lwc1    $f8, 0x025C($s0)           ## 0000025C
/* 037FC 80A5EAEC 3C078013 */  lui     $a3, %hi(D_801333E0)
/* 03800 80A5EAF0 46803020 */  cvt.s.w $f0, $f6
/* 03804 80A5EAF4 3C198013 */  lui     $t9, %hi(D_801333E8)
/* 03808 80A5EAF8 24E733E0 */  addiu   $a3, %lo(D_801333E0)
/* 0380C 80A5EAFC 273933E8 */  addiu   $t9, %lo(D_801333E8)
/* 03810 80A5EB00 24042818 */  addiu   $a0, $zero, 0x2818         ## $a0 = 00002818
/* 03814 80A5EB04 260500E4 */  addiu   $a1, $s0, 0x00E4           ## $a1 = 000000E4
/* 03818 80A5EB08 460A0402 */  mul.s   $f16, $f0, $f10
/* 0381C 80A5EB0C 24060004 */  addiu   $a2, $zero, 0x0004         ## $a2 = 00000004
/* 03820 80A5EB10 46104481 */  sub.s   $f18, $f8, $f16
/* 03824 80A5EB14 E612025C */  swc1    $f18, 0x025C($s0)          ## 0000025C
/* 03828 80A5EB18 AFB90014 */  sw      $t9, 0x0014($sp)
/* 0382C 80A5EB1C 0C03DCE3 */  jal     Audio_PlaySoundGeneral

/* 03830 80A5EB20 AFA70010 */  sw      $a3, 0x0010($sp)
/* 03834 80A5EB24 44806000 */  mtc1    $zero, $f12                ## $f12 = 0.00
/* 03838 80A5EB28 240500AA */  addiu   $a1, $zero, 0x00AA         ## $a1 = 000000AA
/* 0383C 80A5EB2C 2406000A */  addiu   $a2, $zero, 0x000A         ## $a2 = 0000000A
/* 03840 80A5EB30 0C02A800 */  jal     func_800AA000
/* 03844 80A5EB34 2407000A */  addiu   $a3, $zero, 0x000A         ## $a3 = 0000000A
/* 03848 80A5EB38 8FBF002C */  lw      $ra, 0x002C($sp)
/* 0384C 80A5EB3C 8FB00028 */  lw      $s0, 0x0028($sp)
/* 03850 80A5EB40 27BD0038 */  addiu   $sp, $sp, 0x0038           ## $sp = 00000000
/* 03854 80A5EB44 03E00008 */  jr      $ra
/* 03858 80A5EB48 00000000 */  nop
