glabel func_809123D4
/* 01D94 809123D4 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 01D98 809123D8 00803825 */  or      $a3, $a0, $zero            ## $a3 = 00000000
/* 01D9C 809123DC AFBF0014 */  sw      $ra, 0x0014($sp)
/* 01DA0 809123E0 3C040601 */  lui     $a0, 0x0601                ## $a0 = 06010000
/* 01DA4 809123E4 AFA5001C */  sw      $a1, 0x001C($sp)
/* 01DA8 809123E8 24840344 */  addiu   $a0, $a0, 0x0344           ## $a0 = 06010344
/* 01DAC 809123EC 0C028800 */  jal     Animation_GetLastFrame

/* 01DB0 809123F0 AFA70018 */  sw      $a3, 0x0018($sp)
/* 01DB4 809123F4 44822000 */  mtc1    $v0, $f4                   ## $f4 = 0.00
/* 01DB8 809123F8 8FA70018 */  lw      $a3, 0x0018($sp)
/* 01DBC 809123FC 3C050601 */  lui     $a1, 0x0601                ## $a1 = 06010000
/* 01DC0 80912400 468021A0 */  cvt.s.w $f6, $f4
/* 01DC4 80912404 24A50344 */  addiu   $a1, $a1, 0x0344           ## $a1 = 06010344
/* 01DC8 80912408 3C06C040 */  lui     $a2, 0xC040                ## $a2 = C0400000
/* 01DCC 8091240C 24E4014C */  addiu   $a0, $a3, 0x014C           ## $a0 = 0000014C
/* 01DD0 80912410 0C0294D3 */  jal     Animation_MorphToLoop
/* 01DD4 80912414 E4E601D0 */  swc1    $f6, 0x01D0($a3)           ## 000001D0
/* 01DD8 80912418 8FA40018 */  lw      $a0, 0x0018($sp)
/* 01DDC 8091241C 3C0E8091 */  lui     $t6, %hi(func_80912448)    ## $t6 = 80910000
/* 01DE0 80912420 25CE2448 */  addiu   $t6, $t6, %lo(func_80912448) ## $t6 = 80912448
/* 01DE4 80912424 240F000A */  addiu   $t7, $zero, 0x000A         ## $t7 = 0000000A
/* 01DE8 80912428 240538AA */  addiu   $a1, $zero, 0x38AA         ## $a1 = 000038AA
/* 01DEC 8091242C AC8E0190 */  sw      $t6, 0x0190($a0)           ## 00000190
/* 01DF0 80912430 0C00BE0A */  jal     Audio_PlayActorSound2

/* 01DF4 80912434 A48F01BC */  sh      $t7, 0x01BC($a0)           ## 000001BC
/* 01DF8 80912438 8FBF0014 */  lw      $ra, 0x0014($sp)
/* 01DFC 8091243C 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 01E00 80912440 03E00008 */  jr      $ra
/* 01E04 80912444 00000000 */  nop
