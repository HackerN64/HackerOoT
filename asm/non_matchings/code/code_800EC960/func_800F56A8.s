glabel func_800F56A8
/* B6C848 800F56A8 27BDFFE8 */  addiu $sp, $sp, -0x18
/* B6C84C 800F56AC AFBF0014 */  sw    $ra, 0x14($sp)
/* B6C850 800F56B0 0C03E82D */  jal   func_800FA0B4
/* B6C854 800F56B4 00002025 */   move  $a0, $zero
/* B6C858 800F56B8 3401FFFF */  li    $at, 65535
/* B6C85C 800F56BC 10410012 */  beq   $v0, $at, .L800F5708
/* B6C860 800F56C0 304F00FF */   andi  $t7, $v0, 0xff
/* B6C864 800F56C4 3C188013 */  lui   $t8, %hi(D_80130658)
/* B6C868 800F56C8 030FC021 */  addu  $t8, $t8, $t7
/* B6C86C 800F56CC 93180658 */  lbu   $t8, %lo(D_80130658)($t8)
/* B6C870 800F56D0 3C028013 */  lui   $v0, %hi(D_8013062C) # $v0, 0x8013
/* B6C874 800F56D4 2442062C */  addiu $v0, %lo(D_8013062C) # addiu $v0, $v0, 0x62c
/* B6C878 800F56D8 33190010 */  andi  $t9, $t8, 0x10
/* B6C87C 800F56DC 5320000B */  beql  $t9, $zero, .L800F570C
/* B6C880 800F56E0 8FBF0014 */   lw    $ra, 0x14($sp)
/* B6C884 800F56E4 90480000 */  lbu   $t0, ($v0)
/* B6C888 800F56E8 240100C0 */  li    $at, 192
/* B6C88C 800F56EC 3C098017 */  lui   $t1, %hi(gAudioContext+0x368b) # $t1, 0x8017
/* B6C890 800F56F0 51010005 */  beql  $t0, $at, .L800F5708
/* B6C894 800F56F4 A0400000 */   sb    $zero, ($v0)
/* B6C898 800F56F8 8129280B */  lb    $t1, %lo(gAudioContext+0x368b)($t1)
/* B6C89C 800F56FC 10000002 */  b     .L800F5708
/* B6C8A0 800F5700 A0490000 */   sb    $t1, ($v0)
/* B6C8A4 800F5704 A0400000 */  sb    $zero, ($v0)
.L800F5708:
/* B6C8A8 800F5708 8FBF0014 */  lw    $ra, 0x14($sp)
.L800F570C:
/* B6C8AC 800F570C 27BD0018 */  addiu $sp, $sp, 0x18
/* B6C8B0 800F5710 03E00008 */  jr    $ra
/* B6C8B4 800F5714 00000000 */   nop   

