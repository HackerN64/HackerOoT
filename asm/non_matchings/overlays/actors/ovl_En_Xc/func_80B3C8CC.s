glabel func_80B3C8CC
/* 006EC 80B3C8CC 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 006F0 80B3C8D0 AFBF0014 */  sw      $ra, 0x0014($sp)
/* 006F4 80B3C8D4 AFA40018 */  sw      $a0, 0x0018($sp)
/* 006F8 80B3C8D8 AFA5001C */  sw      $a1, 0x001C($sp)
/* 006FC 80B3C8DC 8C8F016C */  lw      $t7, 0x016C($a0)           ## 0000016C
/* 00700 80B3C8E0 8499018C */  lh      $t9, 0x018C($a0)           ## 0000018C
/* 00704 80B3C8E4 2486014C */  addiu   $a2, $a0, 0x014C           ## $a2 = 0000014C
/* 00708 80B3C8E8 85F80002 */  lh      $t8, 0x0002($t7)           ## 00000002
/* 0070C 80B3C8EC 0319082A */  slt     $at, $t8, $t9
/* 00710 80B3C8F0 54200009 */  bnel    $at, $zero, .L80B3C918
/* 00714 80B3C8F4 8FBF0014 */  lw      $ra, 0x0014($sp)
/* 00718 80B3C8F8 90C80035 */  lbu     $t0, 0x0035($a2)           ## 00000181
/* 0071C 80B3C8FC 3C073F80 */  lui     $a3, 0x3F80                ## $a3 = 3F800000
/* 00720 80B3C900 35090003 */  ori     $t1, $t0, 0x0003           ## $t1 = 00000003
/* 00724 80B3C904 A0C90035 */  sb      $t1, 0x0035($a2)           ## 00000181
/* 00728 80B3C908 8FA50018 */  lw      $a1, 0x0018($sp)
/* 0072C 80B3C90C 0C028D88 */  jal     AnimationContext_SetMoveActor
/* 00730 80B3C910 8FA4001C */  lw      $a0, 0x001C($sp)
/* 00734 80B3C914 8FBF0014 */  lw      $ra, 0x0014($sp)
.L80B3C918:
/* 00738 80B3C918 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 0073C 80B3C91C 03E00008 */  jr      $ra
/* 00740 80B3C920 00000000 */  nop
