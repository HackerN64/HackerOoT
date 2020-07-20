.rdata
glabel D_80139C58
    .asciz "\x1b[41;37mcamera: error: illegal camera set (%d) !!!!\n\x1b[m"
    .balign 4

glabel D_80139C90
    .asciz "\x1b[1m%06u:\x1b[m camera: change camera[%d] set %s\n"
    .balign 4

.text
glabel Camera_ChangeSetting
/* AD16E8 8005A548 27BDFFE0 */  addiu $sp, $sp, -0x20
/* AD16EC 8005A54C AFBF001C */  sw    $ra, 0x1c($sp)
/* AD16F0 8005A550 AFB00018 */  sw    $s0, 0x18($sp)
/* AD16F4 8005A554 AFA50024 */  sw    $a1, 0x24($sp)
/* AD16F8 8005A558 AFA60028 */  sw    $a2, 0x28($sp)
/* AD16FC 8005A55C 8483014A */  lh    $v1, 0x14a($a0)
/* AD1700 8005A560 00063400 */  sll   $a2, $a2, 0x10
/* AD1704 8005A564 00053C00 */  sll   $a3, $a1, 0x10
/* AD1708 8005A568 306E0001 */  andi  $t6, $v1, 1
/* AD170C 8005A56C 00073C03 */  sra   $a3, $a3, 0x10
/* AD1710 8005A570 00063403 */  sra   $a2, $a2, 0x10
/* AD1714 8005A574 11C00015 */  beqz  $t6, .L8005A5CC
/* AD1718 8005A578 00808025 */   move  $s0, $a0
/* AD171C 8005A57C 848F0142 */  lh    $t7, 0x142($a0)
/* AD1720 8005A580 3C058012 */  lui   $a1, %hi(sCameraSettings) # $a1, 0x8012
/* AD1724 8005A584 24A5D064 */  addiu $a1, %lo(sCameraSettings) # addiu $a1, $a1, -0x2f9c
/* AD1728 8005A588 000758C0 */  sll   $t3, $a3, 3
/* AD172C 8005A58C 000FC0C0 */  sll   $t8, $t7, 3
/* AD1730 8005A590 00B8C821 */  addu  $t9, $a1, $t8
/* AD1734 8005A594 00AB6021 */  addu  $t4, $a1, $t3
/* AD1738 8005A598 8D8D0000 */  lw    $t5, ($t4)
/* AD173C 8005A59C 8F280000 */  lw    $t0, ($t9)
/* AD1740 8005A5A0 3C020F00 */  lui   $v0, 0xf00
/* AD1744 8005A5A4 01A27024 */  and   $t6, $t5, $v0
/* AD1748 8005A5A8 01024824 */  and   $t1, $t0, $v0
/* AD174C 8005A5AC 00095602 */  srl   $t2, $t1, 0x18
/* AD1750 8005A5B0 000E7E02 */  srl   $t7, $t6, 0x18
/* AD1754 8005A5B4 014F082B */  sltu  $at, $t2, $t7
/* AD1758 8005A5B8 14200004 */  bnez  $at, .L8005A5CC
/* AD175C 8005A5BC 34780010 */   ori   $t8, $v1, 0x10
/* AD1760 8005A5C0 A498014A */  sh    $t8, 0x14a($a0)
/* AD1764 8005A5C4 10000068 */  b     .L8005A768
/* AD1768 8005A5C8 2402FFFE */   li    $v0, -2
.L8005A5CC:
/* AD176C 8005A5CC 3C058012 */  lui   $a1, %hi(sCameraSettings) # $a1, 0x8012
/* AD1770 8005A5D0 24010035 */  li    $at, 53
/* AD1774 8005A5D4 10E10003 */  beq   $a3, $at, .L8005A5E4
/* AD1778 8005A5D8 24A5D064 */   addiu $a1, %lo(sCameraSettings) # addiu $a1, $a1, -0x2f9c
/* AD177C 8005A5DC 24010036 */  li    $at, 54
/* AD1780 8005A5E0 14E1000D */  bne   $a3, $at, .L8005A618
.L8005A5E4:
/* AD1784 8005A5E4 3C198016 */   lui   $t9, %hi(gSaveContext+4) # $t9, 0x8016
/* AD1788 8005A5E8 8F39E664 */  lw    $t9, %lo(gSaveContext+4)($t9)
/* AD178C 8005A5EC 1720000A */  bnez  $t9, .L8005A618
/* AD1790 8005A5F0 00000000 */   nop
/* AD1794 8005A5F4 8E08008C */  lw    $t0, 0x8c($s0)
/* AD1798 8005A5F8 24010056 */  li    $at, 86
/* AD179C 8005A5FC 346B0010 */  ori   $t3, $v1, 0x10
/* AD17A0 8005A600 850900A4 */  lh    $t1, 0xa4($t0)
/* AD17A4 8005A604 2402FFFB */  li    $v0, -5
/* AD17A8 8005A608 15210003 */  bne   $t1, $at, .L8005A618
/* AD17AC 8005A60C 00000000 */   nop
/* AD17B0 8005A610 10000055 */  b     .L8005A768
/* AD17B4 8005A614 A60B014A */   sh    $t3, 0x14a($s0)
.L8005A618:
/* AD17B8 8005A618 10E00002 */  beqz  $a3, .L8005A624
/* AD17BC 8005A61C 28E10042 */   slti  $at, $a3, 0x42
/* AD17C0 8005A620 14200006 */  bnez  $at, .L8005A63C
.L8005A624:
/* AD17C4 8005A624 3C048014 */   lui   $a0, %hi(D_80139C58) # $a0, 0x8014
/* AD17C8 8005A628 24849C58 */  addiu $a0, %lo(D_80139C58) # addiu $a0, $a0, -0x63a8
/* AD17CC 8005A62C 0C00084C */  jal   osSyncPrintf
/* AD17D0 8005A630 00E02825 */   move  $a1, $a3
/* AD17D4 8005A634 1000004C */  b     .L8005A768
/* AD17D8 8005A638 2402FF9D */   li    $v0, -99
.L8005A63C:
/* AD17DC 8005A63C 860C0142 */  lh    $t4, 0x142($s0)
/* AD17E0 8005A640 30CD0001 */  andi  $t5, $a2, 1
/* AD17E4 8005A644 34790010 */  ori   $t9, $v1, 0x10
/* AD17E8 8005A648 14EC000B */  bne   $a3, $t4, .L8005A678
/* AD17EC 8005A64C 30C80002 */   andi  $t0, $a2, 2
/* AD17F0 8005A650 15A00009 */  bnez  $t5, .L8005A678
/* AD17F4 8005A654 346E0010 */   ori   $t6, $v1, 0x10
/* AD17F8 8005A658 30CA0002 */  andi  $t2, $a2, 2
/* AD17FC 8005A65C 15400004 */  bnez  $t2, .L8005A670
/* AD1800 8005A660 A60E014A */   sh    $t6, 0x14a($s0)
/* AD1804 8005A664 860F014A */  lh    $t7, 0x14a($s0)
/* AD1808 8005A668 35F80001 */  ori   $t8, $t7, 1
/* AD180C 8005A66C A618014A */  sh    $t8, 0x14a($s0)
.L8005A670:
/* AD1810 8005A670 1000003D */  b     .L8005A768
/* AD1814 8005A674 2402FFFF */   li    $v0, -1
.L8005A678:
/* AD1818 8005A678 15000004 */  bnez  $t0, .L8005A68C
/* AD181C 8005A67C A619014A */   sh    $t9, 0x14a($s0)
/* AD1820 8005A680 8609014A */  lh    $t1, 0x14a($s0)
/* AD1824 8005A684 352B0001 */  ori   $t3, $t1, 1
/* AD1828 8005A688 A60B014A */  sh    $t3, 0x14a($s0)
.L8005A68C:
/* AD182C 8005A68C 860C014C */  lh    $t4, 0x14c($s0)
/* AD1830 8005A690 86020142 */  lh    $v0, 0x142($s0)
/* AD1834 8005A694 3C044000 */  lui   $a0, 0x4000
/* AD1838 8005A698 358D000C */  ori   $t5, $t4, 0xc
/* AD183C 8005A69C A60D014C */  sh    $t5, 0x14c($s0)
/* AD1840 8005A6A0 860E014C */  lh    $t6, 0x14c($s0)
/* AD1844 8005A6A4 000278C0 */  sll   $t7, $v0, 3
/* AD1848 8005A6A8 00AF1821 */  addu  $v1, $a1, $t7
/* AD184C 8005A6AC 31CAEFF7 */  andi  $t2, $t6, 0xeff7
/* AD1850 8005A6B0 A60A014C */  sh    $t2, 0x14c($s0)
/* AD1854 8005A6B4 8C780000 */  lw    $t8, ($v1)
/* AD1858 8005A6B8 30C80008 */  andi  $t0, $a2, 8
/* AD185C 8005A6BC 240BFFFF */  li    $t3, -1
/* AD1860 8005A6C0 0018C840 */  sll   $t9, $t8, 1
/* AD1864 8005A6C4 07200002 */  bltz  $t9, .L8005A6D0
/* AD1868 8005A6C8 30CC0004 */   andi  $t4, $a2, 4
/* AD186C 8005A6CC A6020154 */  sh    $v0, 0x154($s0)
.L8005A6D0:
/* AD1870 8005A6D0 11000005 */  beqz  $t0, .L8005A6E8
/* AD1874 8005A6D4 24060001 */   li    $a2, 1
/* AD1878 8005A6D8 86090166 */  lh    $t1, 0x166($s0)
/* AD187C 8005A6DC A60B0166 */  sh    $t3, 0x166($s0)
/* AD1880 8005A6E0 1000000A */  b     .L8005A70C
/* AD1884 8005A6E4 A6090148 */   sh    $t1, 0x148($s0)
.L8005A6E8:
/* AD1888 8005A6E8 15800008 */  bnez  $t4, .L8005A70C
/* AD188C 8005A6EC 240FFFFF */   li    $t7, -1
/* AD1890 8005A6F0 8C6D0000 */  lw    $t5, ($v1)
/* AD1894 8005A6F4 01A47024 */  and   $t6, $t5, $a0
/* AD1898 8005A6F8 55C00004 */  bnezl $t6, .L8005A70C
/* AD189C 8005A6FC A60F0148 */   sh    $t7, 0x148($s0)
/* AD18A0 8005A700 860A0148 */  lh    $t2, 0x148($s0)
/* AD18A4 8005A704 A60A0166 */  sh    $t2, 0x166($s0)
/* AD18A8 8005A708 A60F0148 */  sh    $t7, 0x148($s0)
.L8005A70C:
/* AD18AC 8005A70C A6070142 */  sh    $a3, 0x142($s0)
/* AD18B0 8005A710 86050144 */  lh    $a1, 0x144($s0)
/* AD18B4 8005A714 A7A70026 */  sh    $a3, 0x26($sp)
/* AD18B8 8005A718 0C016813 */  jal   Camera_ChangeMode
/* AD18BC 8005A71C 02002025 */   move  $a0, $s0
/* AD18C0 8005A720 04400003 */  bltz  $v0, .L8005A730
/* AD18C4 8005A724 02002025 */   move  $a0, $s0
/* AD18C8 8005A728 0C01144A */  jal   Camera_CopyModeValuesToPREG
/* AD18CC 8005A72C 86050144 */   lh    $a1, 0x144($s0)
.L8005A730:
/* AD18D0 8005A730 86190142 */  lh    $t9, 0x142($s0)
/* AD18D4 8005A734 8E18008C */  lw    $t8, 0x8c($s0)
/* AD18D8 8005A738 3C098012 */  lui   $t1, %hi(sCameraSettingNames) # $t1, 0x8012
/* AD18DC 8005A73C 00194080 */  sll   $t0, $t9, 2
/* AD18E0 8005A740 01194023 */  subu  $t0, $t0, $t9
/* AD18E4 8005A744 00084080 */  sll   $t0, $t0, 2
/* AD18E8 8005A748 25299F8C */  addiu $t1, %lo(sCameraSettingNames) # addiu $t1, $t1, -0x6074
/* AD18EC 8005A74C 3C048014 */  lui   $a0, %hi(D_80139C90) # $a0, 0x8014
/* AD18F0 8005A750 24849C90 */  addiu $a0, %lo(D_80139C90) # addiu $a0, $a0, -0x6370
/* AD18F4 8005A754 01093821 */  addu  $a3, $t0, $t1
/* AD18F8 8005A758 86060164 */  lh    $a2, 0x164($s0)
/* AD18FC 8005A75C 0C00084C */  jal   osSyncPrintf
/* AD1900 8005A760 8F05009C */   lw    $a1, 0x9c($t8)
/* AD1904 8005A764 87A20026 */  lh    $v0, 0x26($sp)
.L8005A768:
/* AD1908 8005A768 8FBF001C */  lw    $ra, 0x1c($sp)
/* AD190C 8005A76C 8FB00018 */  lw    $s0, 0x18($sp)
/* AD1910 8005A770 27BD0020 */  addiu $sp, $sp, 0x20
/* AD1914 8005A774 03E00008 */  jr    $ra
/* AD1918 8005A778 00000000 */   nop

