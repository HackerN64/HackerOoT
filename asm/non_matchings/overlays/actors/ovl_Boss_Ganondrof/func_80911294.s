glabel func_80911294
/* 00C54 80911294 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 00C58 80911298 AFBF0014 */  sw      $ra, 0x0014($sp)
/* 00C5C 8091129C AFA40018 */  sw      $a0, 0x0018($sp)
/* 00C60 809112A0 3C050600 */  lui     $a1, 0x0600                ## $a1 = 06000000
/* 00C64 809112A4 24A53CA4 */  addiu   $a1, $a1, 0x3CA4           ## $a1 = 06003CA4
/* 00C68 809112A8 2484014C */  addiu   $a0, $a0, 0x014C           ## $a0 = 0000014C
/* 00C6C 809112AC 0C0294D3 */  jal     Animation_MorphToLoop
/* 00C70 809112B0 3C06C0A0 */  lui     $a2, 0xC0A0                ## $a2 = C0A00000
/* 00C74 809112B4 8FAF0018 */  lw      $t7, 0x0018($sp)
/* 00C78 809112B8 3C0E8091 */  lui     $t6, %hi(func_809112D4)    ## $t6 = 80910000
/* 00C7C 809112BC 25CE12D4 */  addiu   $t6, $t6, %lo(func_809112D4) ## $t6 = 809112D4
/* 00C80 809112C0 ADEE0190 */  sw      $t6, 0x0190($t7)           ## 00000190
/* 00C84 809112C4 8FBF0014 */  lw      $ra, 0x0014($sp)
/* 00C88 809112C8 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 00C8C 809112CC 03E00008 */  jr      $ra
/* 00C90 809112D0 00000000 */  nop
