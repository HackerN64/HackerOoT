glabel func_8096D64C
/* 0019C 8096D64C 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 001A0 8096D650 AFBF0014 */  sw      $ra, 0x0014($sp)
/* 001A4 8096D654 AFA40018 */  sw      $a0, 0x0018($sp)
/* 001A8 8096D658 AFA5001C */  sw      $a1, 0x001C($sp)
/* 001AC 8096D65C 908E0181 */  lbu     $t6, 0x0181($a0)           ## 00000181
/* 001B0 8096D660 00802825 */  or      $a1, $a0, $zero            ## $a1 = 00000000
/* 001B4 8096D664 24A6014C */  addiu   $a2, $a1, 0x014C           ## $a2 = 0000014C
/* 001B8 8096D668 35CF0003 */  ori     $t7, $t6, 0x0003           ## $t7 = 00000003
/* 001BC 8096D66C A08F0181 */  sb      $t7, 0x0181($a0)           ## 00000181
/* 001C0 8096D670 8FA4001C */  lw      $a0, 0x001C($sp)
/* 001C4 8096D674 0C028D88 */  jal     SkelAnime_LoadAnimationType5
/* 001C8 8096D678 3C073F80 */  lui     $a3, 0x3F80                ## $a3 = 3F800000
/* 001CC 8096D67C 8FBF0014 */  lw      $ra, 0x0014($sp)
/* 001D0 8096D680 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 001D4 8096D684 03E00008 */  jr      $ra
/* 001D8 8096D688 00000000 */  nop
