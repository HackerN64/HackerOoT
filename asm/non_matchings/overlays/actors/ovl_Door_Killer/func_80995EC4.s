glabel func_80995EC4
/* 01274 80995EC4 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 01278 80995EC8 AFBF0024 */  sw      $ra, 0x0024($sp)
/* 0127C 80995ECC AFA40028 */  sw      $a0, 0x0028($sp)
/* 01280 80995ED0 AFA5002C */  sw      $a1, 0x002C($sp)
/* 01284 80995ED4 0C0250F2 */  jal     func_800943C8
/* 01288 80995ED8 8CA40000 */  lw      $a0, 0x0000($a1)           ## 00000000
/* 0128C 80995EDC 8FA40028 */  lw      $a0, 0x0028($sp)
/* 01290 80995EE0 0C265790 */  jal     func_80995E40
/* 01294 80995EE4 8FA5002C */  lw      $a1, 0x002C($sp)
/* 01298 80995EE8 8FA20028 */  lw      $v0, 0x0028($sp)
/* 0129C 80995EEC 8FA4002C */  lw      $a0, 0x002C($sp)
/* 012A0 80995EF0 8C450150 */  lw      $a1, 0x0150($v0)           ## 00000150
/* 012A4 80995EF4 8C46016C */  lw      $a2, 0x016C($v0)           ## 0000016C
/* 012A8 80995EF8 9047014E */  lbu     $a3, 0x014E($v0)           ## 0000014E
/* 012AC 80995EFC AFA00018 */  sw      $zero, 0x0018($sp)
/* 012B0 80995F00 AFA00014 */  sw      $zero, 0x0014($sp)
/* 012B4 80995F04 0C0286B2 */  jal     SkelAnime_DrawFlexOpa
/* 012B8 80995F08 AFA00010 */  sw      $zero, 0x0010($sp)
/* 012BC 80995F0C 8FBF0024 */  lw      $ra, 0x0024($sp)
/* 012C0 80995F10 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
/* 012C4 80995F14 03E00008 */  jr      $ra
/* 012C8 80995F18 00000000 */  nop
