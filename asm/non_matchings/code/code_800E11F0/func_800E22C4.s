glabel func_800E22C4
/* B59464 800E22C4 27BDFFD8 */  addiu $sp, $sp, -0x28
/* B59468 800E22C8 AFBF0014 */  sw    $ra, 0x14($sp)
/* B5946C 800E22CC AFA40028 */  sw    $a0, 0x28($sp)
/* B59470 800E22D0 8FA50028 */  lw    $a1, 0x28($sp)
/* B59474 800E22D4 0C0389DA */  jal   func_800E2768
/* B59478 800E22D8 00002025 */   move  $a0, $zero
/* B5947C 800E22DC 3C0E8017 */  lui   $t6, %hi(gAudioContext+0x3498)
/* B59480 800E22E0 01C27021 */  addu  $t6, $t6, $v0
/* B59484 800E22E4 91CE2618 */  lbu   $t6, %lo(gAudioContext+0x3498)($t6)
/* B59488 800E22E8 24010001 */  li    $at, 1
/* B5948C 800E22EC 00002025 */  move  $a0, $zero
/* B59490 800E22F0 15C10003 */  bne   $t6, $at, .L800E2300
/* B59494 800E22F4 8FA50028 */   lw    $a1, 0x28($sp)
/* B59498 800E22F8 10000003 */  b     .L800E2308
/* B5949C 800E22FC 00001025 */   move  $v0, $zero
.L800E2300:
/* B594A0 800E2300 0C038956 */  jal   func_800E2558
/* B594A4 800E2304 27A60020 */   addiu $a2, $sp, 0x20
.L800E2308:
/* B594A8 800E2308 8FBF0014 */  lw    $ra, 0x14($sp)
/* B594AC 800E230C 27BD0028 */  addiu $sp, $sp, 0x28
/* B594B0 800E2310 03E00008 */  jr    $ra
/* B594B4 800E2314 00000000 */   nop

