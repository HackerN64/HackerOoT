glabel func_800E3BEC
/* B5AD8C 800E3BEC 3C038017 */  lui   $v1, %hi(gAudioContext) # $v1, 0x8017
/* B5AD90 800E3BF0 2463F180 */  addiu $v1, %lo(gAudioContext) # addiu $v1, $v1, -0xe80
/* B5AD94 800E3BF4 27BDFFC8 */  addiu $sp, $sp, -0x38
/* B5AD98 800E3BF8 8C6E2984 */  lw    $t6, 0x2984($v1)
/* B5AD9C 800E3BFC AFB30020 */  sw    $s3, 0x20($sp)
/* B5ADA0 800E3C00 24010001 */  li    $at, 1
/* B5ADA4 800E3C04 00809825 */  move  $s3, $a0
/* B5ADA8 800E3C08 AFBF0024 */  sw    $ra, 0x24($sp)
/* B5ADAC 800E3C0C AFB2001C */  sw    $s2, 0x1c($sp)
/* B5ADB0 800E3C10 AFB10018 */  sw    $s1, 0x18($sp)
/* B5ADB4 800E3C14 11C10037 */  beq   $t6, $at, .L800E3CF4
/* B5ADB8 800E3C18 AFB00014 */   sw    $s0, 0x14($sp)
/* B5ADBC 800E3C1C 8C641D48 */  lw    $a0, 0x1d48($v1)
/* B5ADC0 800E3C20 1480001D */  bnez  $a0, .L800E3C98
/* B5ADC4 800E3C24 00000000 */   nop
/* B5ADC8 800E3C28 1260000E */  beqz  $s3, .L800E3C64
/* B5ADCC 800E3C2C 3C108017 */   lui   $s0, %hi(gAudioContext+0x1cf0)
/* B5ADD0 800E3C30 3C108017 */  lui   $s0, %hi(gAudioContext+0x1cf0) # $s0, 0x8017
/* B5ADD4 800E3C34 26100E70 */  addiu $s0, %lo(gAudioContext+0x1cf0) # addiu $s0, $s0, 0xe70
/* B5ADD8 800E3C38 2412FFFF */  li    $s2, -1
/* B5ADDC 800E3C3C 27B10034 */  addiu $s1, $sp, 0x34
/* B5ADE0 800E3C40 02002025 */  move  $a0, $s0
.L800E3C44:
/* B5ADE4 800E3C44 02202825 */  move  $a1, $s1
/* B5ADE8 800E3C48 0C000CA0 */  jal   osRecvMesg
/* B5ADEC 800E3C4C 00003025 */   move  $a2, $zero
/* B5ADF0 800E3C50 5452FFFC */  bnel  $v0, $s2, .L800E3C44
/* B5ADF4 800E3C54 02002025 */   move  $a0, $s0
/* B5ADF8 800E3C58 3C048017 */  lui   $a0, %hi(gAudioContext+0x1d48) # $a0, 0x8017
/* B5ADFC 800E3C5C 1000000E */  b     .L800E3C98
/* B5AE00 800E3C60 8C840EC8 */   lw    $a0, %lo(gAudioContext+0x1d48)($a0)
.L800E3C64:
/* B5AE04 800E3C64 26040E70 */  addiu $a0, $s0, %lo(gAudioContext+0x1cf0)
/* B5AE08 800E3C68 27A50034 */  addiu $a1, $sp, 0x34
/* B5AE0C 800E3C6C 0C000CA0 */  jal   osRecvMesg
/* B5AE10 800E3C70 00003025 */   move  $a2, $zero
/* B5AE14 800E3C74 3C038017 */  lui   $v1, %hi(gAudioContext) # $v1, 0x8017
/* B5AE18 800E3C78 2412FFFF */  li    $s2, -1
/* B5AE1C 800E3C7C 14520004 */  bne   $v0, $s2, .L800E3C90
/* B5AE20 800E3C80 2463F180 */   addiu $v1, %lo(gAudioContext) # addiu $v1, $v1, -0xe80
/* B5AE24 800E3C84 AC601D48 */  sw    $zero, 0x1d48($v1)
/* B5AE28 800E3C88 10000003 */  b     .L800E3C98
/* B5AE2C 800E3C8C 00002025 */   move  $a0, $zero
.L800E3C90:
/* B5AE30 800E3C90 8FA40034 */  lw    $a0, 0x34($sp)
/* B5AE34 800E3C94 AC641D48 */  sw    $a0, 0x1d48($v1)
.L800E3C98:
/* B5AE38 800E3C98 10800003 */  beqz  $a0, .L800E3CA8
/* B5AE3C 800E3C9C 00000000 */   nop
/* B5AE40 800E3CA0 0C038F44 */  jal   func_800E3D10
/* B5AE44 800E3CA4 02602825 */   move  $a1, $s3
.L800E3CA8:
/* B5AE48 800E3CA8 3C108017 */  lui   $s0, %hi(gAudioContext) # $s0, 0x8017
/* B5AE4C 800E3CAC 3C128017 */  lui   $s2, %hi(gAudioContext+0x580) # $s2, 0x8017
/* B5AE50 800E3CB0 2652F700 */  addiu $s2, %lo(gAudioContext+0x580) # addiu $s2, $s2, -0x900
/* B5AE54 800E3CB4 2610F180 */  addiu $s0, %lo(gAudioContext) # addiu $s0, $s0, -0xe80
/* B5AE58 800E3CB8 24110001 */  li    $s1, 1
/* B5AE5C 800E3CBC 82181770 */  lb    $t8, 0x1770($s0)
.L800E3CC0:
/* B5AE60 800E3CC0 26191770 */  addiu $t9, $s0, 0x1770
/* B5AE64 800E3CC4 56380009 */  bnel  $s1, $t8, .L800E3CEC
/* B5AE68 800E3CC8 26100058 */   addiu $s0, $s0, 0x58
/* B5AE6C 800E3CCC AFB90034 */  sw    $t9, 0x34($sp)
/* B5AE70 800E3CD0 83290002 */  lb    $t1, 2($t9)
/* B5AE74 800E3CD4 03202025 */  move  $a0, $t9
/* B5AE78 800E3CD8 52290004 */  beql  $s1, $t1, .L800E3CEC
/* B5AE7C 800E3CDC 26100058 */   addiu $s0, $s0, 0x58
/* B5AE80 800E3CE0 0C038F96 */  jal   func_800E3E58
/* B5AE84 800E3CE4 02602825 */   move  $a1, $s3
/* B5AE88 800E3CE8 26100058 */  addiu $s0, $s0, 0x58
.L800E3CEC:
/* B5AE8C 800E3CEC 5612FFF4 */  bnel  $s0, $s2, .L800E3CC0
/* B5AE90 800E3CF0 82181770 */   lb    $t8, 0x1770($s0)
.L800E3CF4:
/* B5AE94 800E3CF4 8FBF0024 */  lw    $ra, 0x24($sp)
/* B5AE98 800E3CF8 8FB00014 */  lw    $s0, 0x14($sp)
/* B5AE9C 800E3CFC 8FB10018 */  lw    $s1, 0x18($sp)
/* B5AEA0 800E3D00 8FB2001C */  lw    $s2, 0x1c($sp)
/* B5AEA4 800E3D04 8FB30020 */  lw    $s3, 0x20($sp)
/* B5AEA8 800E3D08 03E00008 */  jr    $ra
/* B5AEAC 800E3D0C 27BD0038 */   addiu $sp, $sp, 0x38

