.rdata
glabel D_80A72850
    .asciz "../z_en_hy.c"
    .balign 4

glabel D_80A72860
    .asciz "../z_en_hy.c"
    .balign 4

.late_rodata
glabel jtbl_80A72AA0
.word L80A71D08
.word L80A71D08
.word L80A71D08
.word L80A71D08
.word L80A71E38
.word L80A71D08
.word L80A71D08
.word L80A71D08
.word L80A71D08
.word L80A71D08
.word L80A71D08
.word L80A71D08
.word L80A71D08
.word L80A71D08
.word L80A71D08
.word L80A71D08
.word L80A71E38
.word L80A71D08
.word L80A71D08

.text
glabel EnHy_Draw
/* 02678 80A71C28 27BDFF98 */  addiu   $sp, $sp, 0xFF98           ## $sp = FFFFFF98
/* 0267C 80A71C2C AFBF002C */  sw      $ra, 0x002C($sp)
/* 02680 80A71C30 AFB00028 */  sw      $s0, 0x0028($sp)
/* 02684 80A71C34 AFA5006C */  sw      $a1, 0x006C($sp)
/* 02688 80A71C38 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 0268C 80A71C3C 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 02690 80A71C40 3C0680A7 */  lui     $a2, %hi(D_80A72850)       ## $a2 = 80A70000
/* 02694 80A71C44 24C62850 */  addiu   $a2, $a2, %lo(D_80A72850)  ## $a2 = 80A72850
/* 02698 80A71C48 27A40044 */  addiu   $a0, $sp, 0x0044           ## $a0 = FFFFFFDC
/* 0269C 80A71C4C 2407090E */  addiu   $a3, $zero, 0x090E         ## $a3 = 0000090E
/* 026A0 80A71C50 0C031AB1 */  jal     Graph_OpenDisps
/* 026A4 80A71C54 AFA50054 */  sw      $a1, 0x0054($sp)
/* 026A8 80A71C58 8E180190 */  lw      $t8, 0x0190($s0)           ## 00000190
/* 026AC 80A71C5C 3C0F80A7 */  lui     $t7, %hi(func_80A70E34)    ## $t7 = 80A70000
/* 026B0 80A71C60 25EF0E34 */  addiu   $t7, $t7, %lo(func_80A70E34) ## $t7 = 80A70E34
/* 026B4 80A71C64 11F80080 */  beq     $t7, $t8, .L80A71E68
/* 026B8 80A71C68 8FB9006C */  lw      $t9, 0x006C($sp)
/* 026BC 80A71C6C 0C024F46 */  jal     func_80093D18
/* 026C0 80A71C70 8F240000 */  lw      $a0, 0x0000($t9)           ## 00000000
/* 026C4 80A71C74 C60C0264 */  lwc1    $f12, 0x0264($s0)          ## 00000264
/* 026C8 80A71C78 C60E0268 */  lwc1    $f14, 0x0268($s0)          ## 00000268
/* 026CC 80A71C7C 8E06026C */  lw      $a2, 0x026C($s0)           ## 0000026C
/* 026D0 80A71C80 0C034261 */  jal     Matrix_Translate
/* 026D4 80A71C84 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 026D8 80A71C88 860A001C */  lh      $t2, 0x001C($s0)           ## 0000001C
/* 026DC 80A71C8C 2403000C */  addiu   $v1, $zero, 0x000C         ## $v1 = 0000000C
/* 026E0 80A71C90 3C0280A7 */  lui     $v0, %hi(D_80A722D8)       ## $v0 = 80A70000
/* 026E4 80A71C94 314B007F */  andi    $t3, $t2, 0x007F           ## $t3 = 00000000
/* 026E8 80A71C98 01630019 */  multu   $t3, $v1
/* 026EC 80A71C9C 244222D8 */  addiu   $v0, $v0, %lo(D_80A722D8)  ## $v0 = 80A722D8
/* 026F0 80A71CA0 27A90060 */  addiu   $t1, $sp, 0x0060           ## $t1 = FFFFFFF8
/* 026F4 80A71CA4 27B8005C */  addiu   $t8, $sp, 0x005C           ## $t8 = FFFFFFF4
/* 026F8 80A71CA8 00006012 */  mflo    $t4
/* 026FC 80A71CAC 004C6821 */  addu    $t5, $v0, $t4
/* 02700 80A71CB0 89AF0002 */  lwl     $t7, 0x0002($t5)           ## 00000002
/* 02704 80A71CB4 99AF0005 */  lwr     $t7, 0x0005($t5)           ## 00000005
/* 02708 80A71CB8 AD2F0000 */  sw      $t7, 0x0000($t1)           ## FFFFFFF8
/* 0270C 80A71CBC 8619001C */  lh      $t9, 0x001C($s0)           ## 0000001C
/* 02710 80A71CC0 332A007F */  andi    $t2, $t9, 0x007F           ## $t2 = 00000000
/* 02714 80A71CC4 01430019 */  multu   $t2, $v1
/* 02718 80A71CC8 00005812 */  mflo    $t3
/* 0271C 80A71CCC 004B6021 */  addu    $t4, $v0, $t3
/* 02720 80A71CD0 898D0007 */  lwl     $t5, 0x0007($t4)           ## 00000007
/* 02724 80A71CD4 998D000A */  lwr     $t5, 0x000A($t4)           ## 0000000A
/* 02728 80A71CD8 AF0D0000 */  sw      $t5, 0x0000($t8)           ## FFFFFFF4
/* 0272C 80A71CDC 860E001C */  lh      $t6, 0x001C($s0)           ## 0000001C
/* 02730 80A71CE0 31CF007F */  andi    $t7, $t6, 0x007F           ## $t7 = 00000000
/* 02734 80A71CE4 25F9FFFE */  addiu   $t9, $t7, 0xFFFE           ## $t9 = FFFFFFFE
/* 02738 80A71CE8 2F210013 */  sltiu   $at, $t9, 0x0013
/* 0273C 80A71CEC 10200052 */  beq     $at, $zero, .L80A71E38
/* 02740 80A71CF0 0019C880 */  sll     $t9, $t9,  2
/* 02744 80A71CF4 3C0180A7 */  lui     $at, %hi(jtbl_80A72AA0)       ## $at = 80A70000
/* 02748 80A71CF8 00390821 */  addu    $at, $at, $t9
/* 0274C 80A71CFC 8C392AA0 */  lw      $t9, %lo(jtbl_80A72AA0)($at)
/* 02750 80A71D00 03200008 */  jr      $t9
/* 02754 80A71D04 00000000 */  nop
glabel L80A71D08
/* 02758 80A71D08 8FA80054 */  lw      $t0, 0x0054($sp)
/* 0275C 80A71D0C 3C0BDB06 */  lui     $t3, 0xDB06                ## $t3 = DB060000
/* 02760 80A71D10 356B0020 */  ori     $t3, $t3, 0x0020           ## $t3 = DB060020
/* 02764 80A71D14 8D0202C0 */  lw      $v0, 0x02C0($t0)           ## 000002C0
/* 02768 80A71D18 244A0008 */  addiu   $t2, $v0, 0x0008           ## $t2 = 80A722E0
/* 0276C 80A71D1C AD0A02C0 */  sw      $t2, 0x02C0($t0)           ## 000002C0
/* 02770 80A71D20 AC4B0000 */  sw      $t3, 0x0000($v0)           ## 80A722D8
/* 02774 80A71D24 8FB8006C */  lw      $t8, 0x006C($sp)
/* 02778 80A71D28 93AC0063 */  lbu     $t4, 0x0063($sp)
/* 0277C 80A71D2C 93A70062 */  lbu     $a3, 0x0062($sp)
/* 02780 80A71D30 8F040000 */  lw      $a0, 0x0000($t8)           ## FFFFFFF4
/* 02784 80A71D34 93A60061 */  lbu     $a2, 0x0061($sp)
/* 02788 80A71D38 93A50060 */  lbu     $a1, 0x0060($sp)
/* 0278C 80A71D3C AFA20040 */  sw      $v0, 0x0040($sp)
/* 02790 80A71D40 0C29C6EF */  jal     func_80A71BBC
/* 02794 80A71D44 AFAC0010 */  sw      $t4, 0x0010($sp)
/* 02798 80A71D48 8FA30040 */  lw      $v1, 0x0040($sp)
/* 0279C 80A71D4C 3C0DDB06 */  lui     $t5, 0xDB06                ## $t5 = DB060000
/* 027A0 80A71D50 35AD0024 */  ori     $t5, $t5, 0x0024           ## $t5 = DB060024
/* 027A4 80A71D54 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 027A8 80A71D58 8FA80054 */  lw      $t0, 0x0054($sp)
/* 027AC 80A71D5C 8D0202C0 */  lw      $v0, 0x02C0($t0)           ## 000002C0
/* 027B0 80A71D60 24490008 */  addiu   $t1, $v0, 0x0008           ## $t1 = 00000008
/* 027B4 80A71D64 AD0902C0 */  sw      $t1, 0x02C0($t0)           ## 000002C0
/* 027B8 80A71D68 AC4D0000 */  sw      $t5, 0x0000($v0)           ## 00000000
/* 027BC 80A71D6C 8FAE006C */  lw      $t6, 0x006C($sp)
/* 027C0 80A71D70 93AF005F */  lbu     $t7, 0x005F($sp)
/* 027C4 80A71D74 93A7005E */  lbu     $a3, 0x005E($sp)
/* 027C8 80A71D78 8DC40000 */  lw      $a0, 0x0000($t6)           ## 00000000
/* 027CC 80A71D7C 93A6005D */  lbu     $a2, 0x005D($sp)
/* 027D0 80A71D80 93A5005C */  lbu     $a1, 0x005C($sp)
/* 027D4 80A71D84 AFA2003C */  sw      $v0, 0x003C($sp)
/* 027D8 80A71D88 0C29C6EF */  jal     func_80A71BBC
/* 027DC 80A71D8C AFAF0010 */  sw      $t7, 0x0010($sp)
/* 027E0 80A71D90 8FA3003C */  lw      $v1, 0x003C($sp)
/* 027E4 80A71D94 2401000B */  addiu   $at, $zero, 0x000B         ## $at = 0000000B
/* 027E8 80A71D98 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 027EC 80A71D9C 8602001C */  lh      $v0, 0x001C($s0)           ## 0000001C
/* 027F0 80A71DA0 24030008 */  addiu   $v1, $zero, 0x0008         ## $v1 = 00000008
/* 027F4 80A71DA4 3042007F */  andi    $v0, $v0, 0x007F           ## $v0 = 00000000
/* 027F8 80A71DA8 10620003 */  beq     $v1, $v0, .L80A71DB8
/* 027FC 80A71DAC 00000000 */  nop
/* 02800 80A71DB0 54410022 */  bnel    $v0, $at, .L80A71E3C
/* 02804 80A71DB4 8E050150 */  lw      $a1, 0x0150($s0)           ## 00000150
.L80A71DB8:
/* 02808 80A71DB8 14620005 */  bne     $v1, $v0, .L80A71DD0
/* 0280C 80A71DBC 2401000B */  addiu   $at, $zero, 0x000B         ## $at = 0000000B
/* 02810 80A71DC0 8FB90060 */  lw      $t9, 0x0060($sp)
/* 02814 80A71DC4 AFB90058 */  sw      $t9, 0x0058($sp)
/* 02818 80A71DC8 8602001C */  lh      $v0, 0x001C($s0)           ## 0000001C
/* 0281C 80A71DCC 3042007F */  andi    $v0, $v0, 0x007F           ## $v0 = 00000000
.L80A71DD0:
/* 02820 80A71DD0 14410007 */  bne     $v0, $at, .L80A71DF0
/* 02824 80A71DD4 240A00FF */  addiu   $t2, $zero, 0x00FF         ## $t2 = 000000FF
/* 02828 80A71DD8 240B00FF */  addiu   $t3, $zero, 0x00FF         ## $t3 = 000000FF
/* 0282C 80A71DDC 241800FF */  addiu   $t8, $zero, 0x00FF         ## $t8 = 000000FF
/* 02830 80A71DE0 A3B80058 */  sb      $t8, 0x0058($sp)
/* 02834 80A71DE4 A3AB0059 */  sb      $t3, 0x0059($sp)
/* 02838 80A71DE8 A3AA005A */  sb      $t2, 0x005A($sp)
/* 0283C 80A71DEC A3A0005B */  sb      $zero, 0x005B($sp)
.L80A71DF0:
/* 02840 80A71DF0 8FAC0054 */  lw      $t4, 0x0054($sp)
/* 02844 80A71DF4 3C0DDB06 */  lui     $t5, 0xDB06                ## $t5 = DB060000
/* 02848 80A71DF8 35AD0028 */  ori     $t5, $t5, 0x0028           ## $t5 = DB060028
/* 0284C 80A71DFC 8D8202C0 */  lw      $v0, 0x02C0($t4)           ## 000002C0
/* 02850 80A71E00 24490008 */  addiu   $t1, $v0, 0x0008           ## $t1 = 00000008
/* 02854 80A71E04 AD8902C0 */  sw      $t1, 0x02C0($t4)           ## 000002C0
/* 02858 80A71E08 AC4D0000 */  sw      $t5, 0x0000($v0)           ## 00000000
/* 0285C 80A71E0C 8FAE006C */  lw      $t6, 0x006C($sp)
/* 02860 80A71E10 93AF005B */  lbu     $t7, 0x005B($sp)
/* 02864 80A71E14 93A7005A */  lbu     $a3, 0x005A($sp)
/* 02868 80A71E18 8DC40000 */  lw      $a0, 0x0000($t6)           ## 00000000
/* 0286C 80A71E1C 93A60059 */  lbu     $a2, 0x0059($sp)
/* 02870 80A71E20 93A50058 */  lbu     $a1, 0x0058($sp)
/* 02874 80A71E24 AFA20038 */  sw      $v0, 0x0038($sp)
/* 02878 80A71E28 0C29C6EF */  jal     func_80A71BBC
/* 0287C 80A71E2C AFAF0010 */  sw      $t7, 0x0010($sp)
/* 02880 80A71E30 8FA30038 */  lw      $v1, 0x0038($sp)
/* 02884 80A71E34 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
glabel L80A71E38
.L80A71E38:
/* 02888 80A71E38 8E050150 */  lw      $a1, 0x0150($s0)           ## 00000150
.L80A71E3C:
/* 0288C 80A71E3C 8E06016C */  lw      $a2, 0x016C($s0)           ## 0000016C
/* 02890 80A71E40 9207014E */  lbu     $a3, 0x014E($s0)           ## 0000014E
/* 02894 80A71E44 3C1980A7 */  lui     $t9, %hi(func_80A716B8)    ## $t9 = 80A70000
/* 02898 80A71E48 3C0A80A7 */  lui     $t2, %hi(func_80A71A64)    ## $t2 = 80A70000
/* 0289C 80A71E4C 254A1A64 */  addiu   $t2, $t2, %lo(func_80A71A64) ## $t2 = 80A71A64
/* 028A0 80A71E50 273916B8 */  addiu   $t9, $t9, %lo(func_80A716B8) ## $t9 = 80A716B8
/* 028A4 80A71E54 AFB90010 */  sw      $t9, 0x0010($sp)
/* 028A8 80A71E58 AFAA0014 */  sw      $t2, 0x0014($sp)
/* 028AC 80A71E5C AFB00018 */  sw      $s0, 0x0018($sp)
/* 028B0 80A71E60 0C0286B2 */  jal     SkelAnime_DrawFlexOpa
/* 028B4 80A71E64 8FA4006C */  lw      $a0, 0x006C($sp)
.L80A71E68:
/* 028B8 80A71E68 8FAB006C */  lw      $t3, 0x006C($sp)
/* 028BC 80A71E6C 3C0680A7 */  lui     $a2, %hi(D_80A72860)       ## $a2 = 80A70000
/* 028C0 80A71E70 24C62860 */  addiu   $a2, $a2, %lo(D_80A72860)  ## $a2 = 80A72860
/* 028C4 80A71E74 27A40044 */  addiu   $a0, $sp, 0x0044           ## $a0 = FFFFFFDC
/* 028C8 80A71E78 24070954 */  addiu   $a3, $zero, 0x0954         ## $a3 = 00000954
/* 028CC 80A71E7C 0C031AD5 */  jal     Graph_CloseDisps
/* 028D0 80A71E80 8D650000 */  lw      $a1, 0x0000($t3)           ## 00000000
/* 028D4 80A71E84 8FBF002C */  lw      $ra, 0x002C($sp)
/* 028D8 80A71E88 8FB00028 */  lw      $s0, 0x0028($sp)
/* 028DC 80A71E8C 27BD0068 */  addiu   $sp, $sp, 0x0068           ## $sp = 00000000
/* 028E0 80A71E90 03E00008 */  jr      $ra
/* 028E4 80A71E94 00000000 */  nop
/* 028E8 80A71E98 00000000 */  nop
/* 028EC 80A71E9C 00000000 */  nop
