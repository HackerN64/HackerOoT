glabel func_800F8F88
/* B70128 800F8F88 3C0F8017 */  lui   $t7, %hi(gAudioContext+0x3828) # $t7, 0x8017
/* B7012C 800F8F8C 8DEF29A8 */  lw    $t7, %lo(gAudioContext+0x3828)($t7)
/* B70130 800F8F90 3C0E8017 */  lui   $t6, %hi(gAudioContext+0x5AB0) # $t6, 0x8017
/* B70134 800F8F94 27BDFFE0 */  addiu $sp, $sp, -0x20
/* B70138 800F8F98 25CE4C30 */  addiu $t6, %lo(gAudioContext+0x5AB0) # addiu $t6, $t6, 0x4c30
/* B7013C 800F8F9C AFBF001C */  sw    $ra, 0x1c($sp)
/* B70140 800F8FA0 11CF000F */  beq   $t6, $t7, .L800F8FE0
/* B70144 800F8FA4 AFB00018 */   sw    $s0, 0x18($sp)
/* B70148 800F8FA8 3C018017 */  lui   $at, %hi(D_8016E260) # $at, 0x8017
/* B7014C 800F8FAC A020E260 */  sb    $zero, %lo(D_8016E260)($at)
/* B70150 800F8FB0 00008025 */  move  $s0, $zero
.L800F8FB4:
/* B70154 800F8FB4 0C03DF3B */  jal   func_800F7CEC
/* B70158 800F8FB8 320400FF */   andi  $a0, $s0, 0xff
/* B7015C 800F8FBC 0C03E120 */  jal   func_800F8480
/* B70160 800F8FC0 320400FF */   andi  $a0, $s0, 0xff
/* B70164 800F8FC4 0C03E3CD */  jal   func_800F8F34
/* B70168 800F8FC8 320400FF */   andi  $a0, $s0, 0xff
/* B7016C 800F8FCC 26100001 */  addiu $s0, $s0, 1
/* B70170 800F8FD0 321000FF */  andi  $s0, $s0, 0xff
/* B70174 800F8FD4 2A010007 */  slti  $at, $s0, 7
/* B70178 800F8FD8 1420FFF6 */  bnez  $at, .L800F8FB4
/* B7017C 800F8FDC 00000000 */   nop   
.L800F8FE0:
/* B70180 800F8FE0 8FBF001C */  lw    $ra, 0x1c($sp)
/* B70184 800F8FE4 8FB00018 */  lw    $s0, 0x18($sp)
/* B70188 800F8FE8 27BD0020 */  addiu $sp, $sp, 0x20
/* B7018C 800F8FEC 03E00008 */  jr    $ra
/* B70190 800F8FF0 00000000 */   nop   

