glabel EnIk_Init
/* 03F50 80A78260 27BDFFD0 */  addiu   $sp, $sp, 0xFFD0           ## $sp = FFFFFFD0
/* 03F54 80A78264 AFBF002C */  sw      $ra, 0x002C($sp)
/* 03F58 80A78268 AFB00028 */  sw      $s0, 0x0028($sp)
/* 03F5C 80A7826C AFA50034 */  sw      $a1, 0x0034($sp)
/* 03F60 80A78270 8482001C */  lh      $v0, 0x001C($a0)           ## 0000001C
/* 03F64 80A78274 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 03F68 80A78278 3C0F8016 */  lui     $t7, %hi(gSaveContext+0xeda)
/* 03F6C 80A7827C 304E00FF */  andi    $t6, $v0, 0x00FF           ## $t6 = 00000000
/* 03F70 80A78280 15C00005 */  bne     $t6, $zero, .L80A78298
/* 03F74 80A78284 3043FF00 */  andi    $v1, $v0, 0xFF00           ## $v1 = 00000000
/* 03F78 80A78288 95EFF53A */  lhu     $t7, %lo(gSaveContext+0xeda)($t7)
/* 03F7C 80A7828C 31F81000 */  andi    $t8, $t7, 0x1000           ## $t8 = 00000000
/* 03F80 80A78290 17000007 */  bne     $t8, $zero, .L80A782B0
/* 03F84 80A78294 00000000 */  nop
.L80A78298:
/* 03F88 80A78298 10600009 */  beq     $v1, $zero, .L80A782C0
/* 03F8C 80A7829C 8FA40034 */  lw      $a0, 0x0034($sp)
/* 03F90 80A782A0 0C00B2D0 */  jal     Flags_GetSwitch

/* 03F94 80A782A4 00032A03 */  sra     $a1, $v1,  8
/* 03F98 80A782A8 10400005 */  beq     $v0, $zero, .L80A782C0
/* 03F9C 80A782AC 00000000 */  nop
.L80A782B0:
/* 03FA0 80A782B0 0C00B55C */  jal     Actor_Kill

/* 03FA4 80A782B4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 03FA8 80A782B8 1000001B */  beq     $zero, $zero, .L80A78328
/* 03FAC 80A782BC 8FBF002C */  lw      $ra, 0x002C($sp)
.L80A782C0:
/* 03FB0 80A782C0 3C068003 */  lui     $a2, %hi(ActorShadow_DrawFunc_Circle)
/* 03FB4 80A782C4 24C6B5EC */  addiu   $a2, %lo(ActorShadow_DrawFunc_Circle)
/* 03FB8 80A782C8 260400B4 */  addiu   $a0, $s0, 0x00B4           ## $a0 = 000000B4
/* 03FBC 80A782CC 24050000 */  addiu   $a1, $zero, 0x0000         ## $a1 = 00000000
/* 03FC0 80A782D0 0C00AC78 */  jal     ActorShape_Init

/* 03FC4 80A782D4 3C0741F0 */  lui     $a3, 0x41F0                ## $a3 = 41F00000
/* 03FC8 80A782D8 3C060602 */  lui     $a2, 0x0602                ## $a2 = 06020000
/* 03FCC 80A782DC 3C070601 */  lui     $a3, 0x0601                ## $a3 = 06010000
/* 03FD0 80A782E0 26190190 */  addiu   $t9, $s0, 0x0190           ## $t9 = 00000190
/* 03FD4 80A782E4 26080244 */  addiu   $t0, $s0, 0x0244           ## $t0 = 00000244
/* 03FD8 80A782E8 2409001E */  addiu   $t1, $zero, 0x001E         ## $t1 = 0000001E
/* 03FDC 80A782EC AFA90018 */  sw      $t1, 0x0018($sp)
/* 03FE0 80A782F0 AFA80014 */  sw      $t0, 0x0014($sp)
/* 03FE4 80A782F4 AFB90010 */  sw      $t9, 0x0010($sp)
/* 03FE8 80A782F8 24E7C114 */  addiu   $a3, $a3, 0xC114           ## $a3 = 0600C114
/* 03FEC 80A782FC 24C6E178 */  addiu   $a2, $a2, 0xE178           ## $a2 = 0601E178
/* 03FF0 80A78300 8FA40034 */  lw      $a0, 0x0034($sp)
/* 03FF4 80A78304 0C0291BE */  jal     SkelAnime_InitSV
/* 03FF8 80A78308 2605014C */  addiu   $a1, $s0, 0x014C           ## $a1 = 0000014C
/* 03FFC 80A7830C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 04000 80A78310 0C29D0E6 */  jal     func_80A74398
/* 04004 80A78314 8FA50034 */  lw      $a1, 0x0034($sp)
/* 04008 80A78318 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0400C 80A7831C 0C29E034 */  jal     func_80A780D0
/* 04010 80A78320 8FA50034 */  lw      $a1, 0x0034($sp)
/* 04014 80A78324 8FBF002C */  lw      $ra, 0x002C($sp)
.L80A78328:
/* 04018 80A78328 8FB00028 */  lw      $s0, 0x0028($sp)
/* 0401C 80A7832C 27BD0030 */  addiu   $sp, $sp, 0x0030           ## $sp = 00000000
/* 04020 80A78330 03E00008 */  jr      $ra
/* 04024 80A78334 00000000 */  nop
/* 04028 80A78338 00000000 */  nop
/* 0402C 80A7833C 00000000 */  nop
