glabel func_80A152AC
/* 0002C 80A152AC 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 00030 80A152B0 AFA40028 */  sw      $a0, 0x0028($sp)
/* 00034 80A152B4 AFBF0024 */  sw      $ra, 0x0024($sp)
/* 00038 80A152B8 3C040402 */  lui     $a0, %hi(gFish2Anim)                ## $a0 = 04020000
/* 0003C 80A152BC 0C028800 */  jal     Animation_GetLastFrame

/* 00040 80A152C0 2484909C */  addiu   $a0, $a0, %lo(gFish2Anim)           ## $a0 = 0401909C
/* 00044 80A152C4 44822000 */  mtc1    $v0, $f4                   ## $f4 = 0.00
/* 00048 80A152C8 3C014000 */  lui     $at, 0x4000                ## $at = 40000000
/* 0004C 80A152CC 44814000 */  mtc1    $at, $f8                   ## $f8 = 2.00
/* 00050 80A152D0 468021A0 */  cvt.s.w $f6, $f4
/* 00054 80A152D4 8FA40028 */  lw      $a0, 0x0028($sp)
/* 00058 80A152D8 3C050402 */  lui     $a1, %hi(gFish2Anim)                ## $a1 = 04020000
/* 0005C 80A152DC 240E0001 */  addiu   $t6, $zero, 0x0001         ## $t6 = 00000001
/* 00060 80A152E0 AFAE0014 */  sw      $t6, 0x0014($sp)
/* 00064 80A152E4 24A5909C */  addiu   $a1, $a1, %lo(gFish2Anim)           ## $a1 = 0401909C
/* 00068 80A152E8 E7A60010 */  swc1    $f6, 0x0010($sp)
/* 0006C 80A152EC 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 00070 80A152F0 24070000 */  addiu   $a3, $zero, 0x0000         ## $a3 = 00000000
/* 00074 80A152F4 E7A80018 */  swc1    $f8, 0x0018($sp)
/* 00078 80A152F8 0C029468 */  jal     Animation_Change

/* 0007C 80A152FC 248401AC */  addiu   $a0, $a0, 0x01AC           ## $a0 = 000001AC
/* 00080 80A15300 8FBF0024 */  lw      $ra, 0x0024($sp)
/* 00084 80A15304 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
/* 00088 80A15308 03E00008 */  jr      $ra
/* 0008C 80A1530C 00000000 */  nop
