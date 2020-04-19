.rdata
glabel D_80B42000
    .asciz "MAX speed = %f\n"
    .balign 4

.late_rodata
glabel D_80B42204
 .word 0x40E1E2B0
glabel D_80B42208
    .float 0.4

glabel D_80B4220C
    .float 0.6

.text
glabel func_80B3D158
/* 00F78 80B3D158 3C0E8016 */  lui     $t6, %hi(gSaveContext+0x1360)
/* 00F7C 80B3D15C 8DCEF9C0 */  lw      $t6, %lo(gSaveContext+0x1360)($t6)
/* 00F80 80B3D160 27BDFFC8 */  addiu   $sp, $sp, 0xFFC8           ## $sp = FFFFFFC8
/* 00F84 80B3D164 24010004 */  addiu   $at, $zero, 0x0004         ## $at = 00000004
/* 00F88 80B3D168 AFBF0014 */  sw      $ra, 0x0014($sp)
/* 00F8C 80B3D16C 15C10046 */  bne     $t6, $at, .L80B3D288
/* 00F90 80B3D170 00803025 */  or      $a2, $a0, $zero            ## $a2 = 00000000
/* 00F94 80B3D174 848200A4 */  lh      $v0, 0x00A4($a0)           ## 000000A4
/* 00F98 80B3D178 2401005C */  addiu   $at, $zero, 0x005C         ## $at = 0000005C
/* 00F9C 80B3D17C 54410043 */  bnel    $v0, $at, .L80B3D28C
/* 00FA0 80B3D180 8FBF0014 */  lw      $ra, 0x0014($sp)
/* 00FA4 80B3D184 94821D74 */  lhu     $v0, 0x1D74($a0)           ## 00001D74
/* 00FA8 80B3D188 28410078 */  slti    $at, $v0, 0x0078
/* 00FAC 80B3D18C 1420003E */  bne     $at, $zero, .L80B3D288
/* 00FB0 80B3D190 284100A4 */  slti    $at, $v0, 0x00A4
/* 00FB4 80B3D194 1020003C */  beq     $at, $zero, .L80B3D288
/* 00FB8 80B3D198 3C0F80B4 */  lui     $t7, %hi(D_80B41D90)       ## $t7 = 80B40000
/* 00FBC 80B3D19C 8DEF1D90 */  lw      $t7, %lo(D_80B41D90)($t7)
/* 00FC0 80B3D1A0 3C0480B4 */  lui     $a0, %hi(D_80B42DB0)       ## $a0 = 80B40000
/* 00FC4 80B3D1A4 24842DB0 */  addiu   $a0, $a0, %lo(D_80B42DB0)  ## $a0 = 80B42DB0
/* 00FC8 80B3D1A8 11E0002B */  beq     $t7, $zero, .L80B3D258
/* 00FCC 80B3D1AC 24C500E0 */  addiu   $a1, $a2, 0x00E0           ## $a1 = 000000E0
/* 00FD0 80B3D1B0 0C032D9E */  jal     Math3D_Vec3f_DistXYZ
/* 00FD4 80B3D1B4 AFA60038 */  sw      $a2, 0x0038($sp)
/* 00FD8 80B3D1B8 3C0180B4 */  lui     $at, %hi(D_80B41DA0)       ## $at = 80B40000
/* 00FDC 80B3D1BC C42E1DA0 */  lwc1    $f14, %lo(D_80B41DA0)($at)
/* 00FE0 80B3D1C0 3C0180B4 */  lui     $at, %hi(D_80B42204)       ## $at = 80B40000
/* 00FE4 80B3D1C4 C4242204 */  lwc1    $f4, %lo(D_80B42204)($at)
/* 00FE8 80B3D1C8 3C0480B4 */  lui     $a0, %hi(D_80B42000)       ## $a0 = 80B40000
/* 00FEC 80B3D1CC 24842000 */  addiu   $a0, $a0, %lo(D_80B42000)  ## $a0 = 80B42000
/* 00FF0 80B3D1D0 46040083 */  div.s   $f2, $f0, $f4
/* 00FF4 80B3D1D4 3C0180B4 */  lui     $at, %hi(D_80B41DA0)       ## $at = 80B40000
/* 00FF8 80B3D1D8 4602703C */  c.lt.s  $f14, $f2
/* 00FFC 80B3D1DC 46001306 */  mov.s   $f12, $f2
/* 01000 80B3D1E0 45020003 */  bc1fl   .L80B3D1F0
/* 01004 80B3D1E4 460071A1 */  cvt.d.s $f6, $f14
/* 01008 80B3D1E8 46001386 */  mov.s   $f14, $f2
/* 0100C 80B3D1EC 460071A1 */  cvt.d.s $f6, $f14
.L80B3D1F0:
/* 01010 80B3D1F0 E7AC001C */  swc1    $f12, 0x001C($sp)
/* 01014 80B3D1F4 44073000 */  mfc1    $a3, $f6
/* 01018 80B3D1F8 44063800 */  mfc1    $a2, $f7
/* 0101C 80B3D1FC 0C00084C */  jal     osSyncPrintf

/* 01020 80B3D200 E42E1DA0 */  swc1    $f14, %lo(D_80B41DA0)($at)
/* 01024 80B3D204 3C014000 */  lui     $at, 0x4000                ## $at = 40000000
/* 01028 80B3D208 44810000 */  mtc1    $at, $f0                   ## $f0 = 2.00
/* 0102C 80B3D20C C7AC001C */  lwc1    $f12, 0x001C($sp)
/* 01030 80B3D210 3C0180B4 */  lui     $at, %hi(D_80B42208)       ## $at = 80B40000
/* 01034 80B3D214 460C003C */  c.lt.s  $f0, $f12
/* 01038 80B3D218 00000000 */  nop
/* 0103C 80B3D21C 45000002 */  bc1f    .L80B3D228
/* 01040 80B3D220 00000000 */  nop
/* 01044 80B3D224 46000306 */  mov.s   $f12, $f0
.L80B3D228:
/* 01048 80B3D228 C4282208 */  lwc1    $f8, %lo(D_80B42208)($at)
/* 0104C 80B3D22C 3C0180B4 */  lui     $at, %hi(D_80B4220C)       ## $at = 80B40000
/* 01050 80B3D230 C430220C */  lwc1    $f16, %lo(D_80B4220C)($at)
/* 01054 80B3D234 460C4282 */  mul.s   $f10, $f8, $f12
/* 01058 80B3D238 3C0480B4 */  lui     $a0, %hi(D_80B41D94)       ## $a0 = 80B40000
/* 0105C 80B3D23C 24841D94 */  addiu   $a0, $a0, %lo(D_80B41D94)  ## $a0 = 80B41D94
/* 01060 80B3D240 240520BD */  addiu   $a1, $zero, 0x20BD         ## $a1 = 000020BD
/* 01064 80B3D244 46105480 */  add.s   $f18, $f10, $f16
/* 01068 80B3D248 44069000 */  mfc1    $a2, $f18
/* 0106C 80B3D24C 0C03D0DB */  jal     func_800F436C
/* 01070 80B3D250 00000000 */  nop
/* 01074 80B3D254 8FA60038 */  lw      $a2, 0x0038($sp)
.L80B3D258:
/* 01078 80B3D258 24C200E0 */  addiu   $v0, $a2, 0x00E0           ## $v0 = 000000E0
/* 0107C 80B3D25C C4440000 */  lwc1    $f4, 0x0000($v0)           ## 000000E0
/* 01080 80B3D260 3C0180B4 */  lui     $at, %hi(D_80B42DB0)       ## $at = 80B40000
/* 01084 80B3D264 24180001 */  addiu   $t8, $zero, 0x0001         ## $t8 = 00000001
/* 01088 80B3D268 E4242DB0 */  swc1    $f4, %lo(D_80B42DB0)($at)
/* 0108C 80B3D26C C4460004 */  lwc1    $f6, 0x0004($v0)           ## 000000E4
/* 01090 80B3D270 E4262DB4 */  swc1    $f6, %lo(D_80B42DB4)($at)
/* 01094 80B3D274 C4480008 */  lwc1    $f8, 0x0008($v0)           ## 000000E8
/* 01098 80B3D278 3C0180B4 */  lui     $at, %hi(D_80B42DB8)       ## $at = 80B40000
/* 0109C 80B3D27C E4282DB8 */  swc1    $f8, %lo(D_80B42DB8)($at)
/* 010A0 80B3D280 3C0180B4 */  lui     $at, %hi(D_80B41D90)       ## $at = 80B40000
/* 010A4 80B3D284 AC381D90 */  sw      $t8, %lo(D_80B41D90)($at)
.L80B3D288:
/* 010A8 80B3D288 8FBF0014 */  lw      $ra, 0x0014($sp)
.L80B3D28C:
/* 010AC 80B3D28C 27BD0038 */  addiu   $sp, $sp, 0x0038           ## $sp = 00000000
/* 010B0 80B3D290 03E00008 */  jr      $ra
/* 010B4 80B3D294 00000000 */  nop
