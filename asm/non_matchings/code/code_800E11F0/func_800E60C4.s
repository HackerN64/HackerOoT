glabel func_800E60C4
/* B5D264 800E60C4 00047080 */  sll   $t6, $a0, 2
/* B5D268 800E60C8 01C47023 */  subu  $t6, $t6, $a0
/* B5D26C 800E60CC 000E7080 */  sll   $t6, $t6, 2
/* B5D270 800E60D0 01C47023 */  subu  $t6, $t6, $a0
/* B5D274 800E60D4 000E7140 */  sll   $t6, $t6, 5
/* B5D278 800E60D8 01C57821 */  addu  $t7, $t6, $a1
/* B5D27C 800E60DC 3C028017 */  lui   $v0, %hi(gAudioContext+0x3688)
/* B5D280 800E60E0 004F1021 */  addu  $v0, $v0, $t7
/* B5D284 800E60E4 03E00008 */  jr    $ra
/* B5D288 800E60E8 80422808 */   lb    $v0, %lo(gAudioContext+0x3688)($v0)

