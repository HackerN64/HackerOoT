glabel func_80B3C700
/* 00520 80B3C700 00057100 */  sll     $t6, $a1,  4
/* 00524 80B3C704 000E7F02 */  srl     $t7, $t6, 28
/* 00528 80B3C708 000FC080 */  sll     $t8, $t7,  2
/* 0052C 80B3C70C 3C198016 */  lui     $t9, %hi(gSegments)
/* 00530 80B3C710 0338C821 */  addu    $t9, $t9, $t8
/* 00534 80B3C714 3C0100FF */  lui     $at, 0x00FF                ## $at = 00FF0000
/* 00538 80B3C718 8F396FA8 */  lw      $t9, %lo(gSegments)($t9)
/* 0053C 80B3C71C 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = 00FFFFFF
/* 00540 80B3C720 27BDFFC8 */  addiu   $sp, $sp, 0xFFC8           ## $sp = FFFFFFC8
/* 00544 80B3C724 00A14024 */  and     $t0, $a1, $at
/* 00548 80B3C728 AFA40038 */  sw      $a0, 0x0038($sp)
/* 0054C 80B3C72C 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 00550 80B3C730 03282021 */  addu    $a0, $t9, $t0
/* 00554 80B3C734 AFBF0024 */  sw      $ra, 0x0024($sp)
/* 00558 80B3C738 00812021 */  addu    $a0, $a0, $at
/* 0055C 80B3C73C AFA60040 */  sw      $a2, 0x0040($sp)
/* 00560 80B3C740 AFA70044 */  sw      $a3, 0x0044($sp)
/* 00564 80B3C744 0C028800 */  jal     Animation_GetLastFrame

/* 00568 80B3C748 AFA4002C */  sw      $a0, 0x002C($sp)
/* 0056C 80B3C74C 8FA90048 */  lw      $t1, 0x0048($sp)
/* 00570 80B3C750 8FA40038 */  lw      $a0, 0x0038($sp)
/* 00574 80B3C754 8FA5002C */  lw      $a1, 0x002C($sp)
/* 00578 80B3C758 15200007 */  bne     $t1, $zero, .L80B3C778
/* 0057C 80B3C75C 2484014C */  addiu   $a0, $a0, 0x014C           ## $a0 = 0000014C
/* 00580 80B3C760 44822000 */  mtc1    $v0, $f4                   ## $f4 = 0.00
/* 00584 80B3C764 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 00588 80B3C768 44800000 */  mtc1    $zero, $f0                 ## $f0 = 0.00
/* 0058C 80B3C76C 44816000 */  mtc1    $at, $f12                  ## $f12 = 1.00
/* 00590 80B3C770 10000006 */  beq     $zero, $zero, .L80B3C78C
/* 00594 80B3C774 468020A0 */  cvt.s.w $f2, $f4
.L80B3C778:
/* 00598 80B3C778 44823000 */  mtc1    $v0, $f6                   ## $f6 = 0.00
/* 0059C 80B3C77C 3C01BF80 */  lui     $at, 0xBF80                ## $at = BF800000
/* 005A0 80B3C780 44801000 */  mtc1    $zero, $f2                 ## $f2 = 0.00
/* 005A4 80B3C784 44816000 */  mtc1    $at, $f12                  ## $f12 = -1.00
/* 005A8 80B3C788 46803020 */  cvt.s.w $f0, $f6
.L80B3C78C:
/* 005AC 80B3C78C 93AA0043 */  lbu     $t2, 0x0043($sp)
/* 005B0 80B3C790 C7A80044 */  lwc1    $f8, 0x0044($sp)
/* 005B4 80B3C794 44066000 */  mfc1    $a2, $f12
/* 005B8 80B3C798 44070000 */  mfc1    $a3, $f0
/* 005BC 80B3C79C E7A20010 */  swc1    $f2, 0x0010($sp)
/* 005C0 80B3C7A0 AFAA0014 */  sw      $t2, 0x0014($sp)
/* 005C4 80B3C7A4 0C029468 */  jal     Animation_Change

/* 005C8 80B3C7A8 E7A80018 */  swc1    $f8, 0x0018($sp)
/* 005CC 80B3C7AC 8FBF0024 */  lw      $ra, 0x0024($sp)
/* 005D0 80B3C7B0 27BD0038 */  addiu   $sp, $sp, 0x0038           ## $sp = 00000000
/* 005D4 80B3C7B4 03E00008 */  jr      $ra
/* 005D8 80B3C7B8 00000000 */  nop
