.rdata
glabel D_8013C390
    .asciz "\x1b[43;30m\n水ポリゴンデータに水中カラーが設定されておりません!\x1b[m"
    # EUC-JP: 水ポリゴンデータに水中カラーが設定されておりません | Underwater color is not set in the water poly data
    .balign 4

.text
glabel func_80070600
/* AE77A0 80070600 27BDFFE8 */  addiu $sp, $sp, -0x18
/* AE77A4 80070604 2401001F */  li    $at, 31
/* AE77A8 80070608 AFBF0014 */  sw    $ra, 0x14($sp)
/* AE77AC 8007060C 14A10008 */  bne   $a1, $at, .L80070630
/* AE77B0 80070610 00803025 */   move  $a2, $a0
/* AE77B4 80070614 3C048014 */  lui   $a0, %hi(D_8013C390) # $a0, 0x8014
/* AE77B8 80070618 2484C390 */  addiu $a0, %lo(D_8013C390) # addiu $a0, $a0, -0x3c70
/* AE77BC 8007061C AFA0001C */  sw    $zero, 0x1c($sp)
/* AE77C0 80070620 0C00084C */  jal   osSyncPrintf
/* AE77C4 80070624 AFA60018 */   sw    $a2, 0x18($sp)
/* AE77C8 80070628 8FA5001C */  lw    $a1, 0x1c($sp)
/* AE77CC 8007062C 8FA60018 */  lw    $a2, 0x18($sp)
.L80070630:
/* AE77D0 80070630 3C010001 */  lui   $at, 1
/* AE77D4 80070634 00C11021 */  addu  $v0, $a2, $at
/* AE77D8 80070638 904E0A42 */  lbu   $t6, 0xa42($v0)
/* AE77DC 8007063C 3C010001 */  lui   $at, 1
/* AE77E0 80070640 00260821 */  addu  $at, $at, $a2
/* AE77E4 80070644 55C0000F */  bnezl $t6, .L80070684
/* AE77E8 80070648 A0200AE0 */   sb    $zero, 0xae0($at)
/* AE77EC 8007064C 904F0A44 */  lbu   $t7, 0xa44($v0)
/* AE77F0 80070650 3C018012 */  lui   $at, %hi(D_8011FB34) # $at, 0x8012
/* AE77F4 80070654 A02FFB34 */  sb    $t7, %lo(D_8011FB34)($at)
/* AE77F8 80070658 90580A43 */  lbu   $t8, 0xa43($v0)
/* AE77FC 8007065C 3C010001 */  lui   $at, 1
/* AE7800 80070660 00260821 */  addu  $at, $at, $a2
/* AE7804 80070664 50B8000B */  beql  $a1, $t8, .L80070694
/* AE7808 80070668 8FBF0014 */   lw    $ra, 0x14($sp)
/* AE780C 8007066C A0250A43 */  sb    $a1, 0xa43($at)
/* AE7810 80070670 3C010001 */  lui   $at, 1
/* AE7814 80070674 00260821 */  addu  $at, $at, $a2
/* AE7818 80070678 10000005 */  b     .L80070690
/* AE781C 8007067C A0250A44 */   sb    $a1, 0xa44($at)
/* AE7820 80070680 A0200AE0 */  sb    $zero, 0xae0($at)
.L80070684:
/* AE7824 80070684 3C010001 */  lui   $at, 1
/* AE7828 80070688 00260821 */  addu  $at, $at, $a2
/* AE782C 8007068C A0250AE3 */  sb    $a1, 0xae3($at)
.L80070690:
/* AE7830 80070690 8FBF0014 */  lw    $ra, 0x14($sp)
.L80070694:
/* AE7834 80070694 27BD0018 */  addiu $sp, $sp, 0x18
/* AE7838 80070698 03E00008 */  jr    $ra
/* AE783C 8007069C 00000000 */   nop   

