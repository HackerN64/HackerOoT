.rdata
glabel D_8013C3D0
    .asciz "T%03d "
    .balign 4

glabel D_8013C3D8
    .asciz "E%03d"
    .balign 4

glabel D_8013C3E0
    .asciz "%s"
    .balign 4

glabel D_8013C3E4
    .asciz "ZELDATIME "
    .balign 4

glabel D_8013C3F0
    .asciz "%02d"
    .balign 4

glabel D_8013C3F8
    .asciz "%s"
    .balign 4

glabel D_8013C3FC
    .asciz ":"
    .balign 4

glabel D_8013C400
    .asciz "%s"
    .balign 4

glabel D_8013C404
    .asciz " "
    .balign 4

glabel D_8013C408
    .asciz "%02d"
    .balign 4

glabel D_8013C410
    .asciz "%s"
    .balign 4

glabel D_8013C414
    .asciz "VRBOXTIME "
    .balign 4

glabel D_8013C420
    .asciz "%02d"
    .balign 4

glabel D_8013C428
    .asciz "%s"
    .balign 4

glabel D_8013C42C
    .asciz ":"
    .balign 4

glabel D_8013C430
    .asciz "%s"
    .balign 4

glabel D_8013C434
    .asciz " "
    .balign 4

glabel D_8013C438
    .asciz "%02d"
    .balign 4

glabel D_8013C440
    .asciz "%s"
    .balign 4

glabel D_8013C444
    .asciz "YORU"
    .balign 4

glabel D_8013C44C
    .asciz "%s"
    .balign 4

glabel D_8013C450
    .asciz "HIRU"
    .balign 4

.text
glabel func_80070718
/* AE78B8 80070718 27BDFF98 */  addiu $sp, $sp, -0x68
/* AE78BC 8007071C AFB00020 */  sw    $s0, 0x20($sp)
/* AE78C0 80070720 27B00038 */  addiu $s0, $sp, 0x38
/* AE78C4 80070724 AFBF0024 */  sw    $ra, 0x24($sp)
/* AE78C8 80070728 AFA40068 */  sw    $a0, 0x68($sp)
/* AE78CC 8007072C AFA5006C */  sw    $a1, 0x6c($sp)
/* AE78D0 80070730 0C03EEE3 */  jal   GfxPrint_Init
/* AE78D4 80070734 02002025 */   move  $a0, $s0
/* AE78D8 80070738 8FAE006C */  lw    $t6, 0x6c($sp)
/* AE78DC 8007073C 02002025 */  move  $a0, $s0
/* AE78E0 80070740 0C03EF07 */  jal   GfxPrint_Open
/* AE78E4 80070744 8DC50000 */   lw    $a1, ($t6)
/* AE78E8 80070748 02002025 */  move  $a0, $s0
/* AE78EC 8007074C 24050016 */  li    $a1, 22
/* AE78F0 80070750 0C03ED07 */  jal   GfxPrint_SetPos
/* AE78F4 80070754 24060007 */   li    $a2, 7
/* AE78F8 80070758 240F0040 */  li    $t7, 64
/* AE78FC 8007075C AFAF0010 */  sw    $t7, 0x10($sp)
/* AE7900 80070760 02002025 */  move  $a0, $s0
/* AE7904 80070764 2405009B */  li    $a1, 155
/* AE7908 80070768 2406009B */  li    $a2, 155
/* AE790C 8007076C 0C03ECEB */  jal   GfxPrint_SetColor
/* AE7910 80070770 240700FF */   li    $a3, 255
/* AE7914 80070774 3C068016 */  lui   $a2, %hi(gSaveContext+0x14) # $a2, 0x8016
/* AE7918 80070778 3C058014 */  lui   $a1, %hi(D_8013C3D0) # $a1, 0x8014
/* AE791C 8007077C 24A5C3D0 */  addiu $a1, %lo(D_8013C3D0) # addiu $a1, $a1, -0x3c30
/* AE7920 80070780 8CC6E674 */  lw    $a2, %lo(gSaveContext+0x14)($a2)
/* AE7924 80070784 0C03EF2D */  jal   GfxPrint_Printf
/* AE7928 80070788 02002025 */   move  $a0, $s0
/* AE792C 8007078C 3C068016 */  lui   $a2, %hi(gSaveContext+0x18) # $a2, 0x8016
/* AE7930 80070790 3C058014 */  lui   $a1, %hi(D_8013C3D8) # $a1, 0x8014
/* AE7934 80070794 24A5C3D8 */  addiu $a1, %lo(D_8013C3D8) # addiu $a1, $a1, -0x3c28
/* AE7938 80070798 8CC6E678 */  lw    $a2, %lo(gSaveContext+0x18)($a2)
/* AE793C 8007079C 0C03EF2D */  jal   GfxPrint_Printf
/* AE7940 800707A0 02002025 */   move  $a0, $s0
/* AE7944 800707A4 24180040 */  li    $t8, 64
/* AE7948 800707A8 AFB80010 */  sw    $t8, 0x10($sp)
/* AE794C 800707AC 02002025 */  move  $a0, $s0
/* AE7950 800707B0 240500FF */  li    $a1, 255
/* AE7954 800707B4 240600FF */  li    $a2, 255
/* AE7958 800707B8 0C03ECEB */  jal   GfxPrint_SetColor
/* AE795C 800707BC 24070037 */   li    $a3, 55
/* AE7960 800707C0 02002025 */  move  $a0, $s0
/* AE7964 800707C4 24050016 */  li    $a1, 22
/* AE7968 800707C8 0C03ED07 */  jal   GfxPrint_SetPos
/* AE796C 800707CC 24060008 */   li    $a2, 8
/* AE7970 800707D0 3C058014 */  lui   $a1, %hi(D_8013C3E0) # $a1, 0x8014
/* AE7974 800707D4 3C068014 */  lui   $a2, %hi(D_8013C3E4) # $a2, 0x8014
/* AE7978 800707D8 24C6C3E4 */  addiu $a2, %lo(D_8013C3E4) # addiu $a2, $a2, -0x3c1c
/* AE797C 800707DC 24A5C3E0 */  addiu $a1, %lo(D_8013C3E0) # addiu $a1, $a1, -0x3c20
/* AE7980 800707E0 0C03EF2D */  jal   GfxPrint_Printf
/* AE7984 800707E4 02002025 */   move  $a0, $s0
/* AE7988 800707E8 24190040 */  li    $t9, 64
/* AE798C 800707EC AFB90010 */  sw    $t9, 0x10($sp)
/* AE7990 800707F0 02002025 */  move  $a0, $s0
/* AE7994 800707F4 240500FF */  li    $a1, 255
/* AE7998 800707F8 240600FF */  li    $a2, 255
/* AE799C 800707FC 0C03ECEB */  jal   GfxPrint_SetColor
/* AE79A0 80070800 240700FF */   li    $a3, 255
/* AE79A4 80070804 3C028016 */  lui   $v0, %hi(gSaveContext+0xc) # $v0, 0x8016
/* AE79A8 80070808 9442E66C */  lhu   $v0, %lo(gSaveContext+0xc)($v0)
/* AE79AC 8007080C 3C058014 */  lui   $a1, %hi(D_8013C3F0)
/* AE79B0 80070810 24A5C3F0 */  addiu $a1, %lo(D_8013C3F0) # addiu $a1, $a1, -0x3c10
/* AE79B4 80070814 44822000 */  mtc1  $v0, $f4
/* AE79B8 80070818 02002025 */  move  $a0, $s0
/* AE79BC 8007081C 04410005 */  bgez  $v0, .L80070834
/* AE79C0 80070820 468021A0 */   cvt.s.w $f6, $f4
/* AE79C4 80070824 3C014F80 */  li    $at, 0x4F800000 # 0.000000
/* AE79C8 80070828 44814000 */  mtc1  $at, $f8
/* AE79CC 8007082C 00000000 */  nop   
/* AE79D0 80070830 46083180 */  add.s $f6, $f6, $f8
.L80070834:
/* AE79D4 80070834 3C013CB4 */  li    $at, 0x3CB40000 # 0.000000
/* AE79D8 80070838 44815000 */  mtc1  $at, $f10
/* AE79DC 8007083C 3C014270 */  li    $at, 0x42700000 # 0.000000
/* AE79E0 80070840 44819000 */  mtc1  $at, $f18
/* AE79E4 80070844 460A3402 */  mul.s $f16, $f6, $f10
/* AE79E8 80070848 24060001 */  li    $a2, 1
/* AE79EC 8007084C 46128103 */  div.s $f4, $f16, $f18
/* AE79F0 80070850 4448F800 */  cfc1  $t0, $31
/* AE79F4 80070854 44C6F800 */  ctc1  $a2, $31
/* AE79F8 80070858 00000000 */  nop   
/* AE79FC 8007085C 46002224 */  cvt.w.s $f8, $f4
/* AE7A00 80070860 4446F800 */  cfc1  $a2, $31
/* AE7A04 80070864 00000000 */  nop   
/* AE7A08 80070868 30C60078 */  andi  $a2, $a2, 0x78
/* AE7A0C 8007086C 10C00012 */  beqz  $a2, .L800708B8
/* AE7A10 80070870 3C014F00 */   li    $at, 0x4F000000 # 0.000000
/* AE7A14 80070874 44814000 */  mtc1  $at, $f8
/* AE7A18 80070878 24060001 */  li    $a2, 1
/* AE7A1C 8007087C 46082201 */  sub.s $f8, $f4, $f8
/* AE7A20 80070880 44C6F800 */  ctc1  $a2, $31
/* AE7A24 80070884 00000000 */  nop   
/* AE7A28 80070888 46004224 */  cvt.w.s $f8, $f8
/* AE7A2C 8007088C 4446F800 */  cfc1  $a2, $31
/* AE7A30 80070890 00000000 */  nop   
/* AE7A34 80070894 30C60078 */  andi  $a2, $a2, 0x78
/* AE7A38 80070898 14C00005 */  bnez  $a2, .L800708B0
/* AE7A3C 8007089C 00000000 */   nop   
/* AE7A40 800708A0 44064000 */  mfc1  $a2, $f8
/* AE7A44 800708A4 3C018000 */  lui   $at, 0x8000
/* AE7A48 800708A8 10000007 */  b     .L800708C8
/* AE7A4C 800708AC 00C13025 */   or    $a2, $a2, $at
.L800708B0:
/* AE7A50 800708B0 10000005 */  b     .L800708C8
/* AE7A54 800708B4 2406FFFF */   li    $a2, -1
.L800708B8:
/* AE7A58 800708B8 44064000 */  mfc1  $a2, $f8
/* AE7A5C 800708BC 00000000 */  nop   
/* AE7A60 800708C0 04C0FFFB */  bltz  $a2, .L800708B0
/* AE7A64 800708C4 00000000 */   nop   
.L800708C8:
/* AE7A68 800708C8 44C8F800 */  ctc1  $t0, $31
/* AE7A6C 800708CC 0C03EF2D */  jal   GfxPrint_Printf
/* AE7A70 800708D0 30C600FF */   andi  $a2, $a2, 0xff
/* AE7A74 800708D4 3C098016 */  lui   $t1, %hi(gSaveContext+0xc) # $t1, 0x8016
/* AE7A78 800708D8 9529E66C */  lhu   $t1, %lo(gSaveContext+0xc)($t1)
/* AE7A7C 800708DC 312A001F */  andi  $t2, $t1, 0x1f
/* AE7A80 800708E0 29410010 */  slti  $at, $t2, 0x10
/* AE7A84 800708E4 10200007 */  beqz  $at, .L80070904
/* AE7A88 800708E8 3C0B8012 */   lui   $t3, %hi(D_8011FB40) # $t3, 0x8012
/* AE7A8C 800708EC 956BFB40 */  lhu   $t3, %lo(D_8011FB40)($t3)
/* AE7A90 800708F0 3C058014 */  lui   $a1, %hi(D_8013C400) # $a1, 0x8014
/* AE7A94 800708F4 24A5C400 */  addiu $a1, %lo(D_8013C400) # addiu $a1, $a1, -0x3c00
/* AE7A98 800708F8 29610006 */  slti  $at, $t3, 6
/* AE7A9C 800708FC 14200009 */  bnez  $at, .L80070924
/* AE7AA0 80070900 02002025 */   move  $a0, $s0
.L80070904:
/* AE7AA4 80070904 3C058014 */  lui   $a1, %hi(D_8013C3F8) # $a1, 0x8014
/* AE7AA8 80070908 3C068014 */  lui   $a2, %hi(D_8013C3FC) # $a2, 0x8014
/* AE7AAC 8007090C 24C6C3FC */  addiu $a2, %lo(D_8013C3FC) # addiu $a2, $a2, -0x3c04
/* AE7AB0 80070910 24A5C3F8 */  addiu $a1, %lo(D_8013C3F8) # addiu $a1, $a1, -0x3c08
/* AE7AB4 80070914 0C03EF2D */  jal   GfxPrint_Printf
/* AE7AB8 80070918 02002025 */   move  $a0, $s0
/* AE7ABC 8007091C 10000004 */  b     .L80070930
/* AE7AC0 80070920 00000000 */   nop   
.L80070924:
/* AE7AC4 80070924 3C068014 */  lui   $a2, %hi(D_8013C404) # $a2, 0x8014
/* AE7AC8 80070928 0C03EF2D */  jal   GfxPrint_Printf
/* AE7ACC 8007092C 24C6C404 */   addiu $a2, %lo(D_8013C404) # addiu $a2, $a2, -0x3bfc
.L80070930:
/* AE7AD0 80070930 3C028016 */  lui   $v0, %hi(gSaveContext+0xc) # $v0, 0x8016
/* AE7AD4 80070934 9442E66C */  lhu   $v0, %lo(gSaveContext+0xc)($v0)
/* AE7AD8 80070938 3C058014 */  lui   $a1, %hi(D_8013C408)
/* AE7ADC 8007093C 24A5C408 */  addiu $a1, %lo(D_8013C408) # addiu $a1, $a1, -0x3bf8
/* AE7AE0 80070940 44823000 */  mtc1  $v0, $f6
/* AE7AE4 80070944 02002025 */  move  $a0, $s0
/* AE7AE8 80070948 04410005 */  bgez  $v0, .L80070960
/* AE7AEC 8007094C 468032A0 */   cvt.s.w $f10, $f6
/* AE7AF0 80070950 3C014F80 */  li    $at, 0x4F800000 # 0.000000
/* AE7AF4 80070954 44818000 */  mtc1  $at, $f16
/* AE7AF8 80070958 00000000 */  nop   
/* AE7AFC 8007095C 46105280 */  add.s $f10, $f10, $f16
.L80070960:
/* AE7B00 80070960 3C013CB4 */  li    $at, 0x3CB40000 # 0.000000
/* AE7B04 80070964 44819000 */  mtc1  $at, $f18
/* AE7B08 80070968 2401003C */  li    $at, 60
/* AE7B0C 8007096C 46125102 */  mul.s $f4, $f10, $f18
/* AE7B10 80070970 4600220D */  trunc.w.s $f8, $f4
/* AE7B14 80070974 44064000 */  mfc1  $a2, $f8
/* AE7B18 80070978 00000000 */  nop   
/* AE7B1C 8007097C 00063400 */  sll   $a2, $a2, 0x10
/* AE7B20 80070980 00063403 */  sra   $a2, $a2, 0x10
/* AE7B24 80070984 00C1001A */  div   $zero, $a2, $at
/* AE7B28 80070988 00003010 */  mfhi  $a2
/* AE7B2C 8007098C 0C03EF2D */  jal   GfxPrint_Printf
/* AE7B30 80070990 00000000 */   nop   
/* AE7B34 80070994 240D0040 */  li    $t5, 64
/* AE7B38 80070998 AFAD0010 */  sw    $t5, 0x10($sp)
/* AE7B3C 8007099C 02002025 */  move  $a0, $s0
/* AE7B40 800709A0 240500FF */  li    $a1, 255
/* AE7B44 800709A4 240600FF */  li    $a2, 255
/* AE7B48 800709A8 0C03ECEB */  jal   GfxPrint_SetColor
/* AE7B4C 800709AC 24070037 */   li    $a3, 55
/* AE7B50 800709B0 02002025 */  move  $a0, $s0
/* AE7B54 800709B4 24050016 */  li    $a1, 22
/* AE7B58 800709B8 0C03ED07 */  jal   GfxPrint_SetPos
/* AE7B5C 800709BC 24060009 */   li    $a2, 9
/* AE7B60 800709C0 3C058014 */  lui   $a1, %hi(D_8013C410) # $a1, 0x8014
/* AE7B64 800709C4 3C068014 */  lui   $a2, %hi(D_8013C414) # $a2, 0x8014
/* AE7B68 800709C8 24C6C414 */  addiu $a2, %lo(D_8013C414) # addiu $a2, $a2, -0x3bec
/* AE7B6C 800709CC 24A5C410 */  addiu $a1, %lo(D_8013C410) # addiu $a1, $a1, -0x3bf0
/* AE7B70 800709D0 0C03EF2D */  jal   GfxPrint_Printf
/* AE7B74 800709D4 02002025 */   move  $a0, $s0
/* AE7B78 800709D8 240E0040 */  li    $t6, 64
/* AE7B7C 800709DC AFAE0010 */  sw    $t6, 0x10($sp)
/* AE7B80 800709E0 02002025 */  move  $a0, $s0
/* AE7B84 800709E4 240500FF */  li    $a1, 255
/* AE7B88 800709E8 240600FF */  li    $a2, 255
/* AE7B8C 800709EC 0C03ECEB */  jal   GfxPrint_SetColor
/* AE7B90 800709F0 240700FF */   li    $a3, 255
/* AE7B94 800709F4 3C028016 */  lui   $v0, %hi(gSaveContext+0x141a) # $v0, 0x8016
/* AE7B98 800709F8 9442FA7A */  lhu   $v0, %lo(gSaveContext+0x141a)($v0)
/* AE7B9C 800709FC 3C058014 */  lui   $a1, %hi(D_8013C420)
/* AE7BA0 80070A00 24A5C420 */  addiu $a1, %lo(D_8013C420) # addiu $a1, $a1, -0x3be0
/* AE7BA4 80070A04 44823000 */  mtc1  $v0, $f6
/* AE7BA8 80070A08 02002025 */  move  $a0, $s0
/* AE7BAC 80070A0C 04410005 */  bgez  $v0, .L80070A24
/* AE7BB0 80070A10 46803420 */   cvt.s.w $f16, $f6
/* AE7BB4 80070A14 3C014F80 */  li    $at, 0x4F800000 # 0.000000
/* AE7BB8 80070A18 44815000 */  mtc1  $at, $f10
/* AE7BBC 80070A1C 00000000 */  nop   
/* AE7BC0 80070A20 460A8400 */  add.s $f16, $f16, $f10
.L80070A24:
/* AE7BC4 80070A24 3C013CB4 */  li    $at, 0x3CB40000 # 0.000000
/* AE7BC8 80070A28 44819000 */  mtc1  $at, $f18
/* AE7BCC 80070A2C 3C014270 */  li    $at, 0x42700000 # 0.000000
/* AE7BD0 80070A30 44814000 */  mtc1  $at, $f8
/* AE7BD4 80070A34 46128102 */  mul.s $f4, $f16, $f18
/* AE7BD8 80070A38 24060001 */  li    $a2, 1
/* AE7BDC 80070A3C 46082183 */  div.s $f6, $f4, $f8
/* AE7BE0 80070A40 444FF800 */  cfc1  $t7, $31
/* AE7BE4 80070A44 44C6F800 */  ctc1  $a2, $31
/* AE7BE8 80070A48 00000000 */  nop   
/* AE7BEC 80070A4C 460032A4 */  cvt.w.s $f10, $f6
/* AE7BF0 80070A50 4446F800 */  cfc1  $a2, $31
/* AE7BF4 80070A54 00000000 */  nop   
/* AE7BF8 80070A58 30C60078 */  andi  $a2, $a2, 0x78
/* AE7BFC 80070A5C 10C00012 */  beqz  $a2, .L80070AA8
/* AE7C00 80070A60 3C014F00 */   li    $at, 0x4F000000 # 0.000000
/* AE7C04 80070A64 44815000 */  mtc1  $at, $f10
/* AE7C08 80070A68 24060001 */  li    $a2, 1
/* AE7C0C 80070A6C 460A3281 */  sub.s $f10, $f6, $f10
/* AE7C10 80070A70 44C6F800 */  ctc1  $a2, $31
/* AE7C14 80070A74 00000000 */  nop   
/* AE7C18 80070A78 460052A4 */  cvt.w.s $f10, $f10
/* AE7C1C 80070A7C 4446F800 */  cfc1  $a2, $31
/* AE7C20 80070A80 00000000 */  nop   
/* AE7C24 80070A84 30C60078 */  andi  $a2, $a2, 0x78
/* AE7C28 80070A88 14C00005 */  bnez  $a2, .L80070AA0
/* AE7C2C 80070A8C 00000000 */   nop   
/* AE7C30 80070A90 44065000 */  mfc1  $a2, $f10
/* AE7C34 80070A94 3C018000 */  lui   $at, 0x8000
/* AE7C38 80070A98 10000007 */  b     .L80070AB8
/* AE7C3C 80070A9C 00C13025 */   or    $a2, $a2, $at
.L80070AA0:
/* AE7C40 80070AA0 10000005 */  b     .L80070AB8
/* AE7C44 80070AA4 2406FFFF */   li    $a2, -1
.L80070AA8:
/* AE7C48 80070AA8 44065000 */  mfc1  $a2, $f10
/* AE7C4C 80070AAC 00000000 */  nop   
/* AE7C50 80070AB0 04C0FFFB */  bltz  $a2, .L80070AA0
/* AE7C54 80070AB4 00000000 */   nop   
.L80070AB8:
/* AE7C58 80070AB8 44CFF800 */  ctc1  $t7, $31
/* AE7C5C 80070ABC 0C03EF2D */  jal   GfxPrint_Printf
/* AE7C60 80070AC0 30C600FF */   andi  $a2, $a2, 0xff
/* AE7C64 80070AC4 3C188016 */  lui   $t8, %hi(gSaveContext+0x141a) # $t8, 0x8016
/* AE7C68 80070AC8 9718FA7A */  lhu   $t8, %lo(gSaveContext+0x141a)($t8)
/* AE7C6C 80070ACC 3C088012 */  lui   $t0, %hi(D_8011FB40) # $t0, 0x8012
/* AE7C70 80070AD0 02002025 */  move  $a0, $s0
/* AE7C74 80070AD4 3319001F */  andi  $t9, $t8, 0x1f
/* AE7C78 80070AD8 2B210010 */  slti  $at, $t9, 0x10
/* AE7C7C 80070ADC 10200007 */  beqz  $at, .L80070AFC
/* AE7C80 80070AE0 3C058014 */   lui   $a1, %hi(D_8013C428) # $a1, 0x8014
/* AE7C84 80070AE4 9508FB40 */  lhu   $t0, %lo(D_8011FB40)($t0)
/* AE7C88 80070AE8 3C068014 */  lui   $a2, %hi(D_8013C434) # $a2, 0x8014
/* AE7C8C 80070AEC 24C6C434 */  addiu $a2, %lo(D_8013C434) # addiu $a2, $a2, -0x3bcc
/* AE7C90 80070AF0 29010006 */  slti  $at, $t0, 6
/* AE7C94 80070AF4 14200007 */  bnez  $at, .L80070B14
/* AE7C98 80070AF8 00000000 */   nop   
.L80070AFC:
/* AE7C9C 80070AFC 3C068014 */  lui   $a2, %hi(D_8013C42C) # $a2, 0x8014
/* AE7CA0 80070B00 24C6C42C */  addiu $a2, %lo(D_8013C42C) # addiu $a2, $a2, -0x3bd4
/* AE7CA4 80070B04 0C03EF2D */  jal   GfxPrint_Printf
/* AE7CA8 80070B08 24A5C428 */   addiu $a1, %lo(D_8013C428) # addiu $a1, $a1, -0x3bd8
/* AE7CAC 80070B0C 10000005 */  b     .L80070B24
/* AE7CB0 80070B10 00000000 */   nop   
.L80070B14:
/* AE7CB4 80070B14 3C058014 */  lui   $a1, %hi(D_8013C430) # $a1, 0x8014
/* AE7CB8 80070B18 24A5C430 */  addiu $a1, %lo(D_8013C430) # addiu $a1, $a1, -0x3bd0
/* AE7CBC 80070B1C 0C03EF2D */  jal   GfxPrint_Printf
/* AE7CC0 80070B20 02002025 */   move  $a0, $s0
.L80070B24:
/* AE7CC4 80070B24 3C028016 */  lui   $v0, %hi(gSaveContext+0x141a) # $v0, 0x8016
/* AE7CC8 80070B28 9442FA7A */  lhu   $v0, %lo(gSaveContext+0x141a)($v0)
/* AE7CCC 80070B2C 3C058014 */  lui   $a1, %hi(D_8013C438)
/* AE7CD0 80070B30 24A5C438 */  addiu $a1, %lo(D_8013C438) # addiu $a1, $a1, -0x3bc8
/* AE7CD4 80070B34 44828000 */  mtc1  $v0, $f16
/* AE7CD8 80070B38 02002025 */  move  $a0, $s0
/* AE7CDC 80070B3C 04410005 */  bgez  $v0, .L80070B54
/* AE7CE0 80070B40 468084A0 */   cvt.s.w $f18, $f16
/* AE7CE4 80070B44 3C014F80 */  li    $at, 0x4F800000 # 0.000000
/* AE7CE8 80070B48 44812000 */  mtc1  $at, $f4
/* AE7CEC 80070B4C 00000000 */  nop   
/* AE7CF0 80070B50 46049480 */  add.s $f18, $f18, $f4
.L80070B54:
/* AE7CF4 80070B54 3C013CB4 */  li    $at, 0x3CB40000 # 0.000000
/* AE7CF8 80070B58 44814000 */  mtc1  $at, $f8
/* AE7CFC 80070B5C 2401003C */  li    $at, 60
/* AE7D00 80070B60 46089182 */  mul.s $f6, $f18, $f8
/* AE7D04 80070B64 4600328D */  trunc.w.s $f10, $f6
/* AE7D08 80070B68 44065000 */  mfc1  $a2, $f10
/* AE7D0C 80070B6C 00000000 */  nop   
/* AE7D10 80070B70 00063400 */  sll   $a2, $a2, 0x10
/* AE7D14 80070B74 00063403 */  sra   $a2, $a2, 0x10
/* AE7D18 80070B78 00C1001A */  div   $zero, $a2, $at
/* AE7D1C 80070B7C 00003010 */  mfhi  $a2
/* AE7D20 80070B80 0C03EF2D */  jal   GfxPrint_Printf
/* AE7D24 80070B84 00000000 */   nop   
/* AE7D28 80070B88 240A0040 */  li    $t2, 64
/* AE7D2C 80070B8C AFAA0010 */  sw    $t2, 0x10($sp)
/* AE7D30 80070B90 02002025 */  move  $a0, $s0
/* AE7D34 80070B94 24050037 */  li    $a1, 55
/* AE7D38 80070B98 240600FF */  li    $a2, 255
/* AE7D3C 80070B9C 0C03ECEB */  jal   GfxPrint_SetColor
/* AE7D40 80070BA0 240700FF */   li    $a3, 255
/* AE7D44 80070BA4 02002025 */  move  $a0, $s0
/* AE7D48 80070BA8 24050016 */  li    $a1, 22
/* AE7D4C 80070BAC 0C03ED07 */  jal   GfxPrint_SetPos
/* AE7D50 80070BB0 24060006 */   li    $a2, 6
/* AE7D54 80070BB4 3C0B8016 */  lui   $t3, %hi(gSaveContext+0x10) # $t3, 0x8016
/* AE7D58 80070BB8 8D6BE670 */  lw    $t3, %lo(gSaveContext+0x10)($t3)
/* AE7D5C 80070BBC 3C058014 */  lui   $a1, %hi(D_8013C44C) # $a1, 0x8014
/* AE7D60 80070BC0 24A5C44C */  addiu $a1, %lo(D_8013C44C) # addiu $a1, $a1, -0x3bb4
/* AE7D64 80070BC4 11600009 */  beqz  $t3, .L80070BEC
/* AE7D68 80070BC8 02002025 */   move  $a0, $s0
/* AE7D6C 80070BCC 3C058014 */  lui   $a1, %hi(D_8013C440) # $a1, 0x8014
/* AE7D70 80070BD0 3C068014 */  lui   $a2, %hi(D_8013C444) # $a2, 0x8014
/* AE7D74 80070BD4 24C6C444 */  addiu $a2, %lo(D_8013C444) # addiu $a2, $a2, -0x3bbc
/* AE7D78 80070BD8 24A5C440 */  addiu $a1, %lo(D_8013C440) # addiu $a1, $a1, -0x3bc0
/* AE7D7C 80070BDC 0C03EF2D */  jal   GfxPrint_Printf
/* AE7D80 80070BE0 02002025 */   move  $a0, $s0
/* AE7D84 80070BE4 10000004 */  b     .L80070BF8
/* AE7D88 80070BE8 00000000 */   nop   
.L80070BEC:
/* AE7D8C 80070BEC 3C068014 */  lui   $a2, %hi(D_8013C450) # $a2, 0x8014
/* AE7D90 80070BF0 0C03EF2D */  jal   GfxPrint_Printf
/* AE7D94 80070BF4 24C6C450 */   addiu $a2, %lo(D_8013C450) # addiu $a2, $a2, -0x3bb0
.L80070BF8:
/* AE7D98 80070BF8 0C03EF19 */  jal   GfxPrint_Close
/* AE7D9C 80070BFC 02002025 */   move  $a0, $s0
/* AE7DA0 80070C00 8FAC006C */  lw    $t4, 0x6c($sp)
/* AE7DA4 80070C04 02002025 */  move  $a0, $s0
/* AE7DA8 80070C08 0C03EF05 */  jal   GfxPrint_Destroy
/* AE7DAC 80070C0C AD820000 */   sw    $v0, ($t4)
/* AE7DB0 80070C10 8FBF0024 */  lw    $ra, 0x24($sp)
/* AE7DB4 80070C14 8FB00020 */  lw    $s0, 0x20($sp)
/* AE7DB8 80070C18 27BD0068 */  addiu $sp, $sp, 0x68
/* AE7DBC 80070C1C 03E00008 */  jr    $ra
/* AE7DC0 80070C20 00000000 */   nop   

