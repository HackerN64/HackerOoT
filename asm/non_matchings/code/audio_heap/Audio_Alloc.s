glabel Audio_Alloc
/* B5557C 800DE3DC 8C860004 */  lw    $a2, 4($a0)
/* B55580 800DE3E0 8C8E0000 */  lw    $t6, ($a0)
/* B55584 800DE3E4 8C8F0008 */  lw    $t7, 8($a0)
/* B55588 800DE3E8 24A2000F */  addiu $v0, $a1, 0xf
/* B5558C 800DE3EC 2401FFF0 */  li    $at, -16
/* B55590 800DE3F0 00411024 */  and   $v0, $v0, $at
/* B55594 800DE3F4 00C2C821 */  addu  $t9, $a2, $v0
/* B55598 800DE3F8 01CFC021 */  addu  $t8, $t6, $t7
/* B5559C 800DE3FC 0319082B */  sltu  $at, $t8, $t9
/* B555A0 800DE400 14200004 */  bnez  $at, .L800DE414
/* B555A4 800DE404 00C01825 */   move  $v1, $a2
/* B555A8 800DE408 00C24021 */  addu  $t0, $a2, $v0
/* B555AC 800DE40C 10000003 */  b     .L800DE41C
/* B555B0 800DE410 AC880004 */   sw    $t0, 4($a0)
.L800DE414:
/* B555B4 800DE414 03E00008 */  jr    $ra
/* B555B8 800DE418 00001025 */   move  $v0, $zero

.L800DE41C:
/* B555BC 800DE41C 8C89000C */  lw    $t1, 0xc($a0)
/* B555C0 800DE420 00601025 */  move  $v0, $v1
/* B555C4 800DE424 252A0001 */  addiu $t2, $t1, 1
/* B555C8 800DE428 AC8A000C */  sw    $t2, 0xc($a0)
/* B555CC 800DE42C 03E00008 */  jr    $ra
/* B555D0 800DE430 00000000 */   nop   

