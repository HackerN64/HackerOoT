glabel func_8006F0FC
/* AE629C 8006F0FC 27BDFFE8 */  addiu $sp, $sp, -0x18
/* AE62A0 8006F100 AFA40018 */  sw    $a0, 0x18($sp)
/* AE62A4 8006F104 AFA5001C */  sw    $a1, 0x1c($sp)
/* AE62A8 8006F108 AFBF0014 */  sw    $ra, 0x14($sp)
/* AE62AC 8006F10C 3C058016 */  lui   $a1, %hi(D_8015FD80) # $a1, 0x8016
/* AE62B0 8006F110 3C048016 */  lui   $a0, %hi(D_8015FD7E) # $a0, 0x8016
/* AE62B4 8006F114 8484FD7E */  lh    $a0, %lo(D_8015FD7E)($a0)
/* AE62B8 8006F118 0C01BC35 */  jal   func_8006F0D4
/* AE62BC 8006F11C 84A5FD80 */   lh    $a1, %lo(D_8015FD80)($a1)
/* AE62C0 8006F120 3C018012 */  lui   $at, %hi(D_8011FB44) # $at, 0x8012
/* AE62C4 8006F124 A422FB44 */  sh    $v0, %lo(D_8011FB44)($at)
/* AE62C8 8006F128 0C01EA6D */  jal   Lights_GlowCheck
/* AE62CC 8006F12C 8FA4001C */   lw    $a0, 0x1c($sp)
/* AE62D0 8006F130 8FBF0014 */  lw    $ra, 0x14($sp)
/* AE62D4 8006F134 27BD0018 */  addiu $sp, $sp, 0x18
/* AE62D8 8006F138 03E00008 */  jr    $ra
/* AE62DC 8006F13C 00000000 */   nop   

