glabel func_800B8F58
/* B300F8 800B8F58 27BDFFD0 */  addiu $sp, $sp, -0x30
/* B300FC 800B8F5C 3C0E8016 */  lui   $t6, %hi(sDbgEditorSlots) # $t6, 0x8016
/* B30100 800B8F60 91CE1150 */  lbu   $t6, %lo(sDbgEditorSlots)($t6)
/* B30104 800B8F64 AFBF001C */  sw    $ra, 0x1c($sp)
/* B30108 800B8F68 AFB00018 */  sw    $s0, 0x18($sp)
/* B3010C 800B8F6C AFA50034 */  sw    $a1, 0x34($sp)
/* B30110 800B8F70 AFA60038 */  sw    $a2, 0x38($sp)
/* B30114 800B8F74 AFA7003C */  sw    $a3, 0x3c($sp)
/* B30118 800B8F78 2408002D */  li    $t0, 45
/* B3011C 800B8F7C A0880000 */  sb    $t0, ($a0)
/* B30120 800B8F80 3C0F8016 */  lui   $t7, %hi(D_80161160) # $t7, 0x8016
/* B30124 800B8F84 A08E0001 */  sb    $t6, 1($a0)
/* B30128 800B8F88 91EF1160 */  lbu   $t7, %lo(D_80161160)($t7)
/* B3012C 800B8F8C A0880002 */  sb    $t0, 2($a0)
/* B30130 800B8F90 3C188016 */  lui   $t8, %hi(D_80161170) # $t8, 0x8016
/* B30134 800B8F94 A08F0003 */  sb    $t7, 3($a0)
/* B30138 800B8F98 93181170 */  lbu   $t8, %lo(D_80161170)($t8)
/* B3013C 800B8F9C 00808025 */  move  $s0, $a0
/* B30140 800B8FA0 A0880004 */  sb    $t0, 4($a0)
/* B30144 800B8FA4 A0980005 */  sb    $t8, 5($a0)
/* B30148 800B8FA8 3C048016 */  lui   $a0, %hi(D_80161240) # $a0, 0x8016
/* B3014C 800B8FAC 3C038016 */  lui   $v1, %hi(D_80161180) # $v1, 0x8016
/* B30150 800B8FB0 24631180 */  addiu $v1, %lo(D_80161180) # addiu $v1, $v1, 0x1180
/* B30154 800B8FB4 24841240 */  addiu $a0, %lo(D_80161240) # addiu $a0, $a0, 0x1240
/* B30158 800B8FB8 26020006 */  addiu $v0, $s0, 6
.L800B8FBC:
/* B3015C 800B8FBC 90790000 */  lbu   $t9, ($v1)
/* B30160 800B8FC0 A0480000 */  sb    $t0, ($v0)
/* B30164 800B8FC4 24630040 */  addiu $v1, $v1, 0x40
/* B30168 800B8FC8 A0590001 */  sb    $t9, 1($v0)
/* B3016C 800B8FCC 9069FFD0 */  lbu   $t1, -0x30($v1)
/* B30170 800B8FD0 A0480002 */  sb    $t0, 2($v0)
/* B30174 800B8FD4 24420008 */  addiu $v0, $v0, 8
/* B30178 800B8FD8 A049FFFB */  sb    $t1, -5($v0)
/* B3017C 800B8FDC 906AFFE0 */  lbu   $t2, -0x20($v1)
/* B30180 800B8FE0 A048FFFC */  sb    $t0, -4($v0)
/* B30184 800B8FE4 A04AFFFD */  sb    $t2, -3($v0)
/* B30188 800B8FE8 906BFFF0 */  lbu   $t3, -0x10($v1)
/* B3018C 800B8FEC A048FFFE */  sb    $t0, -2($v0)
/* B30190 800B8FF0 1464FFF2 */  bne   $v1, $a0, .L800B8FBC
/* B30194 800B8FF4 A04BFFFF */   sb    $t3, -1($v0)
/* B30198 800B8FF8 A0400001 */  sb    $zero, 1($v0)
/* B3019C 800B8FFC A2000014 */  sb    $zero, 0x14($s0)
/* B301A0 800B9000 93A6003F */  lbu   $a2, 0x3f($sp)
/* B301A4 800B9004 93A50037 */  lbu   $a1, 0x37($sp)
/* B301A8 800B9008 AFA20028 */  sw    $v0, 0x28($sp)
/* B301AC 800B900C 93A4003B */  lbu   $a0, 0x3b($sp)
/* B301B0 800B9010 02003825 */  move  $a3, $s0
/* B301B4 800B9014 AFA60020 */  sw    $a2, 0x20($sp)
/* B301B8 800B9018 0C018DDB */  jal   func_8006376C
/* B301BC 800B901C AFA50024 */   sw    $a1, 0x24($sp)
/* B301C0 800B9020 8FA20028 */  lw    $v0, 0x28($sp)
/* B301C4 800B9024 8FA50024 */  lw    $a1, 0x24($sp)
/* B301C8 800B9028 8FA60020 */  lw    $a2, 0x20($sp)
/* B301CC 800B902C 240D002D */  li    $t5, 45
/* B301D0 800B9030 A04D0000 */  sb    $t5, ($v0)
/* B301D4 800B9034 A20D0014 */  sb    $t5, 0x14($s0)
/* B301D8 800B9038 87A4003A */  lh    $a0, 0x3a($sp)
/* B301DC 800B903C 26070014 */  addiu $a3, $s0, 0x14
/* B301E0 800B9040 24840014 */  addiu $a0, $a0, 0x14
/* B301E4 800B9044 0C018DDB */  jal   func_8006376C
/* B301E8 800B9048 308400FF */   andi  $a0, $a0, 0xff
/* B301EC 800B904C 8FBF001C */  lw    $ra, 0x1c($sp)
/* B301F0 800B9050 8FB00018 */  lw    $s0, 0x18($sp)
/* B301F4 800B9054 27BD0030 */  addiu $sp, $sp, 0x30
/* B301F8 800B9058 03E00008 */  jr    $ra
/* B301FC 800B905C 00000000 */   nop   

