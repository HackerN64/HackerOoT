glabel func_800E0CBC
/* B57E5C 800E0CBC 27BDFFC0 */  addiu $sp, $sp, -0x40
/* B57E60 800E0CC0 AFB5002C */  sw    $s5, 0x2c($sp)
/* B57E64 800E0CC4 3C158017 */  lui   $s5, %hi(gAudioContext) # $s5, 0x8017
/* B57E68 800E0CC8 26B5F180 */  addiu $s5, %lo(gAudioContext) # addiu $s5, $s5, -0xe80
/* B57E6C 800E0CCC 8EAE2834 */  lw    $t6, 0x2834($s5)
/* B57E70 800E0CD0 AFBF003C */  sw    $ra, 0x3c($sp)
/* B57E74 800E0CD4 AFBE0038 */  sw    $fp, 0x38($sp)
/* B57E78 800E0CD8 AFB70034 */  sw    $s7, 0x34($sp)
/* B57E7C 800E0CDC AFB60030 */  sw    $s6, 0x30($sp)
/* B57E80 800E0CE0 AFB40028 */  sw    $s4, 0x28($sp)
/* B57E84 800E0CE4 AFB30024 */  sw    $s3, 0x24($sp)
/* B57E88 800E0CE8 AFB20020 */  sw    $s2, 0x20($sp)
/* B57E8C 800E0CEC AFB1001C */  sw    $s1, 0x1c($sp)
/* B57E90 800E0CF0 AFB00018 */  sw    $s0, 0x18($sp)
/* B57E94 800E0CF4 85DE0000 */  lh    $fp, ($t6)
/* B57E98 800E0CF8 0000A025 */  move  $s4, $zero
/* B57E9C 800E0CFC 0000B025 */  move  $s6, $zero
/* B57EA0 800E0D00 1BC00036 */  blez  $fp, .L800E0DDC
/* B57EA4 800E0D04 241700FF */   li    $s7, 255
.L800E0D08:
/* B57EA8 800E0D08 8EAF2844 */  lw    $t7, 0x2844($s5)
/* B57EAC 800E0D0C 24040001 */  li    $a0, 1
/* B57EB0 800E0D10 24050003 */  li    $a1, 3
/* B57EB4 800E0D14 01F61021 */  addu  $v0, $t7, $s6
/* B57EB8 800E0D18 90520002 */  lbu   $s2, 2($v0)
/* B57EBC 800E0D1C 90530003 */  lbu   $s3, 3($v0)
/* B57EC0 800E0D20 16570003 */  bne   $s2, $s7, .L800E0D30
/* B57EC4 800E0D24 00000000 */   nop   
/* B57EC8 800E0D28 5277002A */  beql  $s3, $s7, .L800E0DD4
/* B57ECC 800E0D2C 26940001 */   addiu $s4, $s4, 1
.L800E0D30:
/* B57ED0 800E0D30 0C037C1D */  jal   func_800DF074
/* B57ED4 800E0D34 02803025 */   move  $a2, $s4
/* B57ED8 800E0D38 50400026 */  beql  $v0, $zero, .L800E0DD4
/* B57EDC 800E0D3C 26940001 */   addiu $s4, $s4, 1
/* B57EE0 800E0D40 0C03862C */  jal   Audio_IsBankLoadComplete
/* B57EE4 800E0D44 02802025 */   move  $a0, $s4
/* B57EE8 800E0D48 50400022 */  beql  $v0, $zero, .L800E0DD4
/* B57EEC 800E0D4C 26940001 */   addiu $s4, $s4, 1
/* B57EF0 800E0D50 8EB83170 */  lw    $t8, 0x3170($s5)
/* B57EF4 800E0D54 3C118017 */  lui   $s1, %hi(gAudioContext+0x2ef0) # $s1, 0x8017
/* B57EF8 800E0D58 26312070 */  addiu $s1, %lo(gAudioContext+0x2ef0) # addiu $s1, $s1, 0x2070
/* B57EFC 800E0D5C 1B00000D */  blez  $t8, .L800E0D94
/* B57F00 800E0D60 00008025 */   move  $s0, $zero
/* B57F04 800E0D64 02202025 */  move  $a0, $s1
.L800E0D68:
/* B57F08 800E0D68 02402825 */  move  $a1, $s2
/* B57F0C 800E0D6C 02603025 */  move  $a2, $s3
/* B57F10 800E0D70 0C038320 */  jal   func_800E0C80
/* B57F14 800E0D74 02803825 */   move  $a3, $s4
/* B57F18 800E0D78 8EB93170 */  lw    $t9, 0x3170($s5)
/* B57F1C 800E0D7C 26100001 */  addiu $s0, $s0, 1
/* B57F20 800E0D80 26310014 */  addiu $s1, $s1, 0x14
/* B57F24 800E0D84 0219082A */  slt   $at, $s0, $t9
/* B57F28 800E0D88 5420FFF7 */  bnezl $at, .L800E0D68
/* B57F2C 800E0D8C 02202025 */   move  $a0, $s1
/* B57F30 800E0D90 00008025 */  move  $s0, $zero
.L800E0D94:
/* B57F34 800E0D94 8EA83404 */  lw    $t0, 0x3404($s5)
/* B57F38 800E0D98 3C118017 */  lui   $s1, %hi(gAudioContext+0x3184) # $s1, 0x8017
/* B57F3C 800E0D9C 26312304 */  addiu $s1, %lo(gAudioContext+0x3184) # addiu $s1, $s1, 0x2304
/* B57F40 800E0DA0 1900000B */  blez  $t0, .L800E0DD0
/* B57F44 800E0DA4 02202025 */   move  $a0, $s1
.L800E0DA8:
/* B57F48 800E0DA8 02402825 */  move  $a1, $s2
/* B57F4C 800E0DAC 02603025 */  move  $a2, $s3
/* B57F50 800E0DB0 0C038320 */  jal   func_800E0C80
/* B57F54 800E0DB4 02803825 */   move  $a3, $s4
/* B57F58 800E0DB8 8EA93404 */  lw    $t1, 0x3404($s5)
/* B57F5C 800E0DBC 26100001 */  addiu $s0, $s0, 1
/* B57F60 800E0DC0 26310014 */  addiu $s1, $s1, 0x14
/* B57F64 800E0DC4 0209082A */  slt   $at, $s0, $t1
/* B57F68 800E0DC8 5420FFF7 */  bnezl $at, .L800E0DA8
/* B57F6C 800E0DCC 02202025 */   move  $a0, $s1
.L800E0DD0:
/* B57F70 800E0DD0 26940001 */  addiu $s4, $s4, 1
.L800E0DD4:
/* B57F74 800E0DD4 169EFFCC */  bne   $s4, $fp, .L800E0D08
/* B57F78 800E0DD8 26D60014 */   addiu $s6, $s6, 0x14
.L800E0DDC:
/* B57F7C 800E0DDC 8FBF003C */  lw    $ra, 0x3c($sp)
/* B57F80 800E0DE0 8FB00018 */  lw    $s0, 0x18($sp)
/* B57F84 800E0DE4 8FB1001C */  lw    $s1, 0x1c($sp)
/* B57F88 800E0DE8 8FB20020 */  lw    $s2, 0x20($sp)
/* B57F8C 800E0DEC 8FB30024 */  lw    $s3, 0x24($sp)
/* B57F90 800E0DF0 8FB40028 */  lw    $s4, 0x28($sp)
/* B57F94 800E0DF4 8FB5002C */  lw    $s5, 0x2c($sp)
/* B57F98 800E0DF8 8FB60030 */  lw    $s6, 0x30($sp)
/* B57F9C 800E0DFC 8FB70034 */  lw    $s7, 0x34($sp)
/* B57FA0 800E0E00 8FBE0038 */  lw    $fp, 0x38($sp)
/* B57FA4 800E0E04 03E00008 */  jr    $ra
/* B57FA8 800E0E08 27BD0040 */   addiu $sp, $sp, 0x40

