glabel func_800E04E8
/* B57688 800E04E8 3C038017 */  lui   $v1, %hi(gAudioContext+0x2d5c) # $v1, 0x8017
/* B5768C 800E04EC 8C631EDC */  lw    $v1, %lo(gAudioContext+0x2d5c)($v1)
/* B57690 800E04F0 00A03025 */  move  $a2, $a1
/* B57694 800E04F4 3C058017 */  lui   $a1, %hi(gAudioContext) # $a1, 0x8017
/* B57698 800E04F8 1860000E */  blez  $v1, .L800E0534
/* B5769C 800E04FC 00001025 */   move  $v0, $zero
/* B576A0 800E0500 24A5F180 */  addiu $a1, %lo(gAudioContext) # addiu $a1, $a1, -0xe80
.L800E0504:
/* B576A4 800E0504 84AE2D68 */  lh    $t6, 0x2d68($a1)
/* B576A8 800E0508 24420001 */  addiu $v0, $v0, 1
/* B576AC 800E050C 0043082A */  slt   $at, $v0, $v1
/* B576B0 800E0510 148E0006 */  bne   $a0, $t6, .L800E052C
/* B576B4 800E0514 00000000 */   nop   
/* B576B8 800E0518 84AF2D6A */  lh    $t7, 0x2d6a($a1)
/* B576BC 800E051C 14CF0003 */  bne   $a2, $t7, .L800E052C
/* B576C0 800E0520 00000000 */   nop   
/* B576C4 800E0524 03E00008 */  jr    $ra
/* B576C8 800E0528 8CA22D60 */   lw    $v0, 0x2d60($a1)

.L800E052C:
/* B576CC 800E052C 1420FFF5 */  bnez  $at, .L800E0504
/* B576D0 800E0530 24A5000C */   addiu $a1, $a1, 0xc
.L800E0534:
/* B576D4 800E0534 00001025 */  move  $v0, $zero
/* B576D8 800E0538 03E00008 */  jr    $ra
/* B576DC 800E053C 00000000 */   nop   

