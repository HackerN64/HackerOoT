glabel func_80A15310
/* 00090 80A15310 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 00094 80A15314 AFA40028 */  sw      $a0, 0x0028($sp)
/* 00098 80A15318 AFBF0024 */  sw      $ra, 0x0024($sp)
/* 0009C 80A1531C 3C040402 */  lui     $a0, %hi(gFish1Anim)                ## $a0 = 04020000
/* 000A0 80A15320 0C028800 */  jal     Animation_GetLastFrame

/* 000A4 80A15324 248485FC */  addiu   $a0, $a0, %lo(gFish1Anim)           ## $a0 = 040185FC
/* 000A8 80A15328 44822000 */  mtc1    $v0, $f4                   ## $f4 = 0.00
/* 000AC 80A1532C 3C014000 */  lui     $at, 0x4000                ## $at = 40000000
/* 000B0 80A15330 44814000 */  mtc1    $at, $f8                   ## $f8 = 2.00
/* 000B4 80A15334 468021A0 */  cvt.s.w $f6, $f4
/* 000B8 80A15338 8FA40028 */  lw      $a0, 0x0028($sp)
/* 000BC 80A1533C 3C050402 */  lui     $a1, %hi(gFish1Anim)                ## $a1 = 04020000
/* 000C0 80A15340 240E0001 */  addiu   $t6, $zero, 0x0001         ## $t6 = 00000001
/* 000C4 80A15344 AFAE0014 */  sw      $t6, 0x0014($sp)
/* 000C8 80A15348 24A585FC */  addiu   $a1, $a1, %lo(gFish1Anim)           ## $a1 = 040185FC
/* 000CC 80A1534C E7A60010 */  swc1    $f6, 0x0010($sp)
/* 000D0 80A15350 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 000D4 80A15354 24070000 */  addiu   $a3, $zero, 0x0000         ## $a3 = 00000000
/* 000D8 80A15358 E7A80018 */  swc1    $f8, 0x0018($sp)
/* 000DC 80A1535C 0C029468 */  jal     Animation_Change

/* 000E0 80A15360 248401AC */  addiu   $a0, $a0, 0x01AC           ## $a0 = 000001AC
/* 000E4 80A15364 8FBF0024 */  lw      $ra, 0x0024($sp)
/* 000E8 80A15368 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
/* 000EC 80A1536C 03E00008 */  jr      $ra
/* 000F0 80A15370 00000000 */  nop
