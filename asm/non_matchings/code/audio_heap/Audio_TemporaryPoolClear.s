glabel Audio_TemporaryPoolClear
/* B55610 800DE470 8C820004 */  lw    $v0, 4($a0)
/* B55614 800DE474 8C8E000C */  lw    $t6, 0xc($a0)
/* B55618 800DE478 2403FFFF */  li    $v1, -1
/* B5561C 800DE47C AC800010 */  sw    $zero, 0x10($a0)
/* B55620 800DE480 004E7821 */  addu  $t7, $v0, $t6
/* B55624 800DE484 AC800000 */  sw    $zero, ($a0)
/* B55628 800DE488 AC8F0020 */  sw    $t7, 0x20($a0)
/* B5562C 800DE48C A483001E */  sh    $v1, 0x1e($a0)
/* B55630 800DE490 A483002A */  sh    $v1, 0x2a($a0)
/* B55634 800DE494 AC820008 */  sw    $v0, 8($a0)
/* B55638 800DE498 03E00008 */  jr    $ra
/* B5563C 800DE49C AC820014 */   sw    $v0, 0x14($a0)

