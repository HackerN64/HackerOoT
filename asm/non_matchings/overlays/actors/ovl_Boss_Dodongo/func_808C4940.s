.rdata
glabel D_808CA5A0
    .asciz "../z_boss_dodongo.c"
    .balign 4

glabel D_808CA5B4
    .asciz "../z_boss_dodongo.c"
    .balign 4

glabel D_808CA5C8
    .asciz "../z_boss_dodongo.c"
    .balign 4

.late_rodata
glabel D_808CA728
 .word 0x3DEB851F
glabel D_808CA72C
 .word 0x3E051EB8
glabel D_808CA730
    .float 0.1

glabel D_808CA734
    .float 0.1

glabel D_808CA738
 .word 0x3E051EB8
glabel D_808CA73C
 .word 0x3DEB851F

.text
glabel func_808C4940
/* 037B0 808C4940 27BDFFB0 */  addiu   $sp, $sp, 0xFFB0           ## $sp = FFFFFFB0
/* 037B4 808C4944 24010006 */  addiu   $at, $zero, 0x0006         ## $at = 00000006
/* 037B8 808C4948 AFBF0014 */  sw      $ra, 0x0014($sp)
/* 037BC 808C494C AFA40050 */  sw      $a0, 0x0050($sp)
/* 037C0 808C4950 AFA50054 */  sw      $a1, 0x0054($sp)
/* 037C4 808C4954 10A10001 */  beq     $a1, $at, .L808C495C
/* 037C8 808C4958 AFA60058 */  sw      $a2, 0x0058($sp)
.L808C495C:
/* 037CC 808C495C 00E02025 */  or      $a0, $a3, $zero            ## $a0 = 00000000
/* 037D0 808C4960 0C0344D0 */  jal     Matrix_JointPosition
/* 037D4 808C4964 8FA50060 */  lw      $a1, 0x0060($sp)
/* 037D8 808C4968 8FAF0058 */  lw      $t7, 0x0058($sp)
/* 037DC 808C496C 3C06808D */  lui     $a2, %hi(D_808CA5A0)       ## $a2 = 808D0000
/* 037E0 808C4970 24C6A5A0 */  addiu   $a2, $a2, %lo(D_808CA5A0)  ## $a2 = 808CA5A0
/* 037E4 808C4974 8DF80000 */  lw      $t8, 0x0000($t7)           ## 00000000
/* 037E8 808C4978 8FB90050 */  lw      $t9, 0x0050($sp)
/* 037EC 808C497C 27A40030 */  addiu   $a0, $sp, 0x0030           ## $a0 = FFFFFFE0
/* 037F0 808C4980 5300007F */  beql    $t8, $zero, .L808C4B80
/* 037F4 808C4984 8FBF0014 */  lw      $ra, 0x0014($sp)
/* 037F8 808C4988 8F250000 */  lw      $a1, 0x0000($t9)           ## 00000000
/* 037FC 808C498C 24070ECB */  addiu   $a3, $zero, 0x0ECB         ## $a3 = 00000ECB
/* 03800 808C4990 0C031AB1 */  jal     Graph_OpenDisps
/* 03804 808C4994 AFA50040 */  sw      $a1, 0x0040($sp)
/* 03808 808C4998 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 0380C 808C499C 44817000 */  mtc1    $at, $f14                  ## $f14 = 1.00
/* 03810 808C49A0 8FA30054 */  lw      $v1, 0x0054($sp)
/* 03814 808C49A4 24010021 */  addiu   $at, $zero, 0x0021         ## $at = 00000021
/* 03818 808C49A8 8FA80064 */  lw      $t0, 0x0064($sp)
/* 0381C 808C49AC 10610004 */  beq     $v1, $at, .L808C49C0
/* 03820 808C49B0 46007006 */  mov.s   $f0, $f14
/* 03824 808C49B4 24010030 */  addiu   $at, $zero, 0x0030         ## $at = 00000030
/* 03828 808C49B8 54610004 */  bnel    $v1, $at, .L808C49CC
/* 0382C 808C49BC E7A00048 */  swc1    $f0, 0x0048($sp)
.L808C49C0:
/* 03830 808C49C0 C50001F8 */  lwc1    $f0, 0x01F8($t0)           ## 000001F8
/* 03834 808C49C4 46000386 */  mov.s   $f14, $f0
/* 03838 808C49C8 E7A00048 */  swc1    $f0, 0x0048($sp)
.L808C49CC:
/* 0383C 808C49CC 0C034213 */  jal     Matrix_Push
/* 03840 808C49D0 E7AE004C */  swc1    $f14, 0x004C($sp)
/* 03844 808C49D4 C7A00048 */  lwc1    $f0, 0x0048($sp)
/* 03848 808C49D8 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 0384C 808C49DC 44816000 */  mtc1    $at, $f12                  ## $f12 = 1.00
/* 03850 808C49E0 44060000 */  mfc1    $a2, $f0
/* 03854 808C49E4 C7AE004C */  lwc1    $f14, 0x004C($sp)
/* 03858 808C49E8 0C0342A3 */  jal     Matrix_Scale
/* 0385C 808C49EC 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 03860 808C49F0 8FA30054 */  lw      $v1, 0x0054($sp)
/* 03864 808C49F4 24010006 */  addiu   $at, $zero, 0x0006         ## $at = 00000006
/* 03868 808C49F8 1061003F */  beq     $v1, $at, .L808C4AF8
/* 0386C 808C49FC 24010007 */  addiu   $at, $zero, 0x0007         ## $at = 00000007
/* 03870 808C4A00 1061003D */  beq     $v1, $at, .L808C4AF8
/* 03874 808C4A04 8FA90064 */  lw      $t1, 0x0064($sp)
/* 03878 808C4A08 00035080 */  sll     $t2, $v1,  2
/* 0387C 808C4A0C 012A1021 */  addu    $v0, $t1, $t2
/* 03880 808C4A10 3C01808D */  lui     $at, %hi(D_808CA728)       ## $at = 808D0000
/* 03884 808C4A14 C426A728 */  lwc1    $f6, %lo(D_808CA728)($at)
/* 03888 808C4A18 C444025C */  lwc1    $f4, 0x025C($v0)           ## 0000025C
/* 0388C 808C4A1C AFA20020 */  sw      $v0, 0x0020($sp)
/* 03890 808C4A20 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 03894 808C4A24 46062302 */  mul.s   $f12, $f4, $f6
/* 03898 808C4A28 0C0342DC */  jal     Matrix_RotateX
/* 0389C 808C4A2C 00000000 */  nop
/* 038A0 808C4A30 8FAB0020 */  lw      $t3, 0x0020($sp)
/* 038A4 808C4A34 3C01808D */  lui     $at, %hi(D_808CA72C)       ## $at = 808D0000
/* 038A8 808C4A38 C42AA72C */  lwc1    $f10, %lo(D_808CA72C)($at)
/* 038AC 808C4A3C C568025C */  lwc1    $f8, 0x025C($t3)           ## 0000025C
/* 038B0 808C4A40 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 038B4 808C4A44 460A4302 */  mul.s   $f12, $f8, $f10
/* 038B8 808C4A48 0C034348 */  jal     Matrix_RotateY
/* 038BC 808C4A4C 00000000 */  nop
/* 038C0 808C4A50 8FAC0020 */  lw      $t4, 0x0020($sp)
/* 038C4 808C4A54 3C01808D */  lui     $at, %hi(D_808CA730)       ## $at = 808D0000
/* 038C8 808C4A58 C432A730 */  lwc1    $f18, %lo(D_808CA730)($at)
/* 038CC 808C4A5C C590025C */  lwc1    $f16, 0x025C($t4)          ## 0000025C
/* 038D0 808C4A60 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 038D4 808C4A64 46128302 */  mul.s   $f12, $f16, $f18
/* 038D8 808C4A68 0C0343B5 */  jal     Matrix_RotateZ
/* 038DC 808C4A6C 00000000 */  nop
/* 038E0 808C4A70 8FAD0064 */  lw      $t5, 0x0064($sp)
/* 038E4 808C4A74 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 038E8 808C4A78 44811000 */  mtc1    $at, $f2                   ## $f2 = 1.00
/* 038EC 808C4A7C C5A00208 */  lwc1    $f0, 0x0208($t5)           ## 00000208
/* 038F0 808C4A80 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 038F4 808C4A84 46001301 */  sub.s   $f12, $f2, $f0
/* 038F8 808C4A88 46020380 */  add.s   $f14, $f0, $f2
/* 038FC 808C4A8C 44066000 */  mfc1    $a2, $f12
/* 03900 808C4A90 0C0342A3 */  jal     Matrix_Scale
/* 03904 808C4A94 00000000 */  nop
/* 03908 808C4A98 8FAE0020 */  lw      $t6, 0x0020($sp)
/* 0390C 808C4A9C 3C01808D */  lui     $at, %hi(D_808CA734)       ## $at = 808D0000
/* 03910 808C4AA0 C426A734 */  lwc1    $f6, %lo(D_808CA734)($at)
/* 03914 808C4AA4 C5C4025C */  lwc1    $f4, 0x025C($t6)           ## 0000025C
/* 03918 808C4AA8 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 0391C 808C4AAC 46062302 */  mul.s   $f12, $f4, $f6
/* 03920 808C4AB0 0C0343B5 */  jal     Matrix_RotateZ
/* 03924 808C4AB4 46006307 */  neg.s   $f12, $f12
/* 03928 808C4AB8 8FAF0020 */  lw      $t7, 0x0020($sp)
/* 0392C 808C4ABC 3C01808D */  lui     $at, %hi(D_808CA738)       ## $at = 808D0000
/* 03930 808C4AC0 C42AA738 */  lwc1    $f10, %lo(D_808CA738)($at)
/* 03934 808C4AC4 C5E8025C */  lwc1    $f8, 0x025C($t7)           ## 0000025C
/* 03938 808C4AC8 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 0393C 808C4ACC 460A4302 */  mul.s   $f12, $f8, $f10
/* 03940 808C4AD0 0C034348 */  jal     Matrix_RotateY
/* 03944 808C4AD4 46006307 */  neg.s   $f12, $f12
/* 03948 808C4AD8 8FB80020 */  lw      $t8, 0x0020($sp)
/* 0394C 808C4ADC 3C01808D */  lui     $at, %hi(D_808CA73C)       ## $at = 808D0000
/* 03950 808C4AE0 C432A73C */  lwc1    $f18, %lo(D_808CA73C)($at)
/* 03954 808C4AE4 C710025C */  lwc1    $f16, 0x025C($t8)          ## 0000025C
/* 03958 808C4AE8 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 0395C 808C4AEC 46128302 */  mul.s   $f12, $f16, $f18
/* 03960 808C4AF0 0C0342DC */  jal     Matrix_RotateX
/* 03964 808C4AF4 46006307 */  neg.s   $f12, $f12
.L808C4AF8:
/* 03968 808C4AF8 8FA70040 */  lw      $a3, 0x0040($sp)
/* 0396C 808C4AFC 3C08DA38 */  lui     $t0, 0xDA38                ## $t0 = DA380000
/* 03970 808C4B00 35080003 */  ori     $t0, $t0, 0x0003           ## $t0 = DA380003
/* 03974 808C4B04 8CE202C0 */  lw      $v0, 0x02C0($a3)           ## 000002C0
/* 03978 808C4B08 3C05808D */  lui     $a1, %hi(D_808CA5B4)       ## $a1 = 808D0000
/* 0397C 808C4B0C 24A5A5B4 */  addiu   $a1, $a1, %lo(D_808CA5B4)  ## $a1 = 808CA5B4
/* 03980 808C4B10 24590008 */  addiu   $t9, $v0, 0x0008           ## $t9 = 00000008
/* 03984 808C4B14 ACF902C0 */  sw      $t9, 0x02C0($a3)           ## 000002C0
/* 03988 808C4B18 AC480000 */  sw      $t0, 0x0000($v0)           ## 00000000
/* 0398C 808C4B1C 8FA90050 */  lw      $t1, 0x0050($sp)
/* 03990 808C4B20 24060EEE */  addiu   $a2, $zero, 0x0EEE         ## $a2 = 00000EEE
/* 03994 808C4B24 8D240000 */  lw      $a0, 0x0000($t1)           ## 00000000
/* 03998 808C4B28 0C0346A2 */  jal     Matrix_NewMtx
/* 0399C 808C4B2C AFA2002C */  sw      $v0, 0x002C($sp)
/* 039A0 808C4B30 8FA3002C */  lw      $v1, 0x002C($sp)
/* 039A4 808C4B34 3C0CDE00 */  lui     $t4, 0xDE00                ## $t4 = DE000000
/* 039A8 808C4B38 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 039AC 808C4B3C 8FAA0040 */  lw      $t2, 0x0040($sp)
/* 039B0 808C4B40 8D4202C0 */  lw      $v0, 0x02C0($t2)           ## 000002C0
/* 039B4 808C4B44 244B0008 */  addiu   $t3, $v0, 0x0008           ## $t3 = 00000008
/* 039B8 808C4B48 AD4B02C0 */  sw      $t3, 0x02C0($t2)           ## 000002C0
/* 039BC 808C4B4C AC4C0000 */  sw      $t4, 0x0000($v0)           ## 00000000
/* 039C0 808C4B50 8FAD0058 */  lw      $t5, 0x0058($sp)
/* 039C4 808C4B54 8DAE0000 */  lw      $t6, 0x0000($t5)           ## 00000000
/* 039C8 808C4B58 0C034221 */  jal     Matrix_Pull
/* 039CC 808C4B5C AC4E0004 */  sw      $t6, 0x0004($v0)           ## 00000004
/* 039D0 808C4B60 8FAF0050 */  lw      $t7, 0x0050($sp)
/* 039D4 808C4B64 3C06808D */  lui     $a2, %hi(D_808CA5C8)       ## $a2 = 808D0000
/* 039D8 808C4B68 24C6A5C8 */  addiu   $a2, $a2, %lo(D_808CA5C8)  ## $a2 = 808CA5C8
/* 039DC 808C4B6C 27A40030 */  addiu   $a0, $sp, 0x0030           ## $a0 = FFFFFFE0
/* 039E0 808C4B70 24070EF2 */  addiu   $a3, $zero, 0x0EF2         ## $a3 = 00000EF2
/* 039E4 808C4B74 0C031AD5 */  jal     Graph_CloseDisps
/* 039E8 808C4B78 8DE50000 */  lw      $a1, 0x0000($t7)           ## 00000000
/* 039EC 808C4B7C 8FBF0014 */  lw      $ra, 0x0014($sp)
.L808C4B80:
/* 039F0 808C4B80 27BD0050 */  addiu   $sp, $sp, 0x0050           ## $sp = 00000000
/* 039F4 808C4B84 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
/* 039F8 808C4B88 03E00008 */  jr      $ra
/* 039FC 808C4B8C 00000000 */  nop
