glabel func_800E0BF8
/* B57D98 800E0BF8 27BDFFE8 */  addiu $sp, $sp, -0x18
/* B57D9C 800E0BFC AFA40018 */  sw    $a0, 0x18($sp)
/* B57DA0 800E0C00 AFBF0014 */  sw    $ra, 0x14($sp)
/* B57DA4 800E0C04 3C048017 */  lui   $a0, %hi(gAudioContext+0x2ee0) # $a0, 0x8017
/* B57DA8 800E0C08 24842060 */  addiu $a0, %lo(gAudioContext+0x2ee0) # addiu $a0, $a0, 0x2060
/* B57DAC 800E0C0C 0C0378F7 */  jal   Audio_Alloc
/* B57DB0 800E0C10 8FA50018 */   lw    $a1, 0x18($sp)
/* B57DB4 800E0C14 14400003 */  bnez  $v0, .L800E0C24
/* B57DB8 800E0C18 00402025 */   move  $a0, $v0
/* B57DBC 800E0C1C 10000014 */  b     .L800E0C70
/* B57DC0 800E0C20 00001025 */   move  $v0, $zero
.L800E0C24:
/* B57DC4 800E0C24 3C0E8017 */  lui   $t6, %hi(gAudioContext+0x3170) # $t6, 0x8017
/* B57DC8 800E0C28 8DCE22F0 */  lw    $t6, %lo(gAudioContext+0x3170)($t6)
/* B57DCC 800E0C2C 3C198017 */  lui   $t9, %hi(gAudioContext+0x2ee0) # $t9, 0x8017
/* B57DD0 800E0C30 27392060 */  addiu $t9, %lo(gAudioContext+0x2ee0) # addiu $t9, $t9, 0x2060
/* B57DD4 800E0C34 000E7880 */  sll   $t7, $t6, 2
/* B57DD8 800E0C38 01EE7821 */  addu  $t7, $t7, $t6
/* B57DDC 800E0C3C 000F7880 */  sll   $t7, $t7, 2
/* B57DE0 800E0C40 25F80010 */  addiu $t8, $t7, 0x10
/* B57DE4 800E0C44 03191021 */  addu  $v0, $t8, $t9
/* B57DE8 800E0C48 24080001 */  li    $t0, 1
/* B57DEC 800E0C4C A0480000 */  sb    $t0, ($v0)
/* B57DF0 800E0C50 AC440008 */  sw    $a0, 8($v0)
/* B57DF4 800E0C54 8FA90018 */  lw    $t1, 0x18($sp)
/* B57DF8 800E0C58 3C0A8017 */  lui   $t2, %hi(gAudioContext+0x3170) # $t2, 0x8017
/* B57DFC 800E0C5C 3C018017 */  lui   $at, %hi(gAudioContext+0x3170) # $at, 0x8017
/* B57E00 800E0C60 AC490010 */  sw    $t1, 0x10($v0)
/* B57E04 800E0C64 8D4A22F0 */  lw    $t2, %lo(gAudioContext+0x3170)($t2)
/* B57E08 800E0C68 254B0001 */  addiu $t3, $t2, 1
/* B57E0C 800E0C6C AC2B22F0 */  sw    $t3, %lo(gAudioContext+0x3170)($at)
.L800E0C70:
/* B57E10 800E0C70 8FBF0014 */  lw    $ra, 0x14($sp)
/* B57E14 800E0C74 27BD0018 */  addiu $sp, $sp, 0x18
/* B57E18 800E0C78 03E00008 */  jr    $ra
/* B57E1C 800E0C7C 00000000 */   nop   

