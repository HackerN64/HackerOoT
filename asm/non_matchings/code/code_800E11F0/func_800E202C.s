glabel func_800E202C
/* B591CC 800E202C 3C0E8017 */  lui   $t6, %hi(gAudioContext+0x2c22) # $t6, 0x8017
/* B591D0 800E2030 85CE1DA2 */  lh    $t6, %lo(gAudioContext+0x2c22)($t6)
/* B591D4 800E2034 27BDFFE8 */  addiu $sp, $sp, -0x18
/* B591D8 800E2038 AFBF0014 */  sw    $ra, 0x14($sp)
/* B591DC 800E203C 148E0005 */  bne   $a0, $t6, .L800E2054
/* B591E0 800E2040 00803025 */   move  $a2, $a0
/* B591E4 800E2044 240FFFFF */  li    $t7, -1
/* B591E8 800E2048 3C018017 */  lui   $at, %hi(gAudioContext+0x2c22) # $at, 0x8017
/* B591EC 800E204C 10000008 */  b     .L800E2070
/* B591F0 800E2050 A42F1DA2 */   sh    $t7, %lo(gAudioContext+0x2c22)($at)
.L800E2054:
/* B591F4 800E2054 3C188017 */  lui   $t8, %hi(gAudioContext+0x2c2e) # $t8, 0x8017
/* B591F8 800E2058 87181DAE */  lh    $t8, %lo(gAudioContext+0x2c2e)($t8)
/* B591FC 800E205C 2419FFFF */  li    $t9, -1
/* B59200 800E2060 3C018017 */  lui   $at, %hi(gAudioContext+0x2c2e) # $at, 0x8017
/* B59204 800E2064 14D80002 */  bne   $a2, $t8, .L800E2070
/* B59208 800E2068 00000000 */   nop
/* B5920C 800E206C A4391DAE */  sh    $t9, %lo(gAudioContext+0x2c2e)($at)
.L800E2070:
/* B59210 800E2070 3C098017 */  lui   $t1, %hi(gAudioContext+0x2b30) # $t1, 0x8017
/* B59214 800E2074 8D291CB0 */  lw    $t1, %lo(gAudioContext+0x2b30)($t1)
/* B59218 800E2078 3C088017 */  lui   $t0, %hi(gAudioContext+0x2b30) # $t0, 0x8017
/* B5921C 800E207C 25081CB0 */  addiu $t0, %lo(gAudioContext+0x2b30) # addiu $t0, $t0, 0x1cb0
/* B59220 800E2080 01002025 */  move  $a0, $t0
/* B59224 800E2084 1120000D */  beqz  $t1, .L800E20BC
/* B59228 800E2088 00001825 */   move  $v1, $zero
/* B5922C 800E208C 01001025 */  move  $v0, $t0
/* B59230 800E2090 2405FFFF */  li    $a1, -1
/* B59234 800E2094 844A001E */  lh    $t2, 0x1e($v0)
.L800E2098:
/* B59238 800E2098 54CA0003 */  bnel  $a2, $t2, .L800E20A8
/* B5923C 800E209C 8C8B0000 */   lw    $t3, ($a0)
/* B59240 800E20A0 A445001E */  sh    $a1, 0x1e($v0)
/* B59244 800E20A4 8C8B0000 */  lw    $t3, ($a0)
.L800E20A8:
/* B59248 800E20A8 24630001 */  addiu $v1, $v1, 1
/* B5924C 800E20AC 2442000C */  addiu $v0, $v0, 0xc
/* B59250 800E20B0 006B082B */  sltu  $at, $v1, $t3
/* B59254 800E20B4 5420FFF8 */  bnezl $at, .L800E2098
/* B59258 800E20B8 844A001E */   lh    $t2, 0x1e($v0)
.L800E20BC:
/* B5925C 800E20BC 0C037812 */  jal   Audio_DiscardBank
/* B59260 800E20C0 00C02025 */   move  $a0, $a2
/* B59264 800E20C4 8FBF0014 */  lw    $ra, 0x14($sp)
/* B59268 800E20C8 27BD0018 */  addiu $sp, $sp, 0x18
/* B5926C 800E20CC 03E00008 */  jr    $ra
/* B59270 800E20D0 00000000 */   nop

