glabel func_809CB008
/* 004F8 809CB008 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 004FC 809CB00C AFBF0014 */  sw      $ra, 0x0014($sp)
/* 00500 809CB010 00803825 */  or      $a3, $a0, $zero            ## $a3 = 00000000
/* 00504 809CB014 3C050600 */  lui     $a1, %hi(D_06001678)                ## $a1 = 06000000
/* 00508 809CB018 24A51678 */  addiu   $a1, $a1, %lo(D_06001678)           ## $a1 = 06001678
/* 0050C 809CB01C AFA70018 */  sw      $a3, 0x0018($sp)
/* 00510 809CB020 24840164 */  addiu   $a0, $a0, 0x0164           ## $a0 = 00000164
/* 00514 809CB024 0C0294D3 */  jal     Animation_MorphToLoop
/* 00518 809CB028 3C06C0A0 */  lui     $a2, 0xC0A0                ## $a2 = C0A00000
/* 0051C 809CB02C 8FA70018 */  lw      $a3, 0x0018($sp)
/* 00520 809CB030 3C0F809D */  lui     $t7, %hi(func_809CB458)    ## $t7 = 809D0000
/* 00524 809CB034 240E000A */  addiu   $t6, $zero, 0x000A         ## $t6 = 0000000A
/* 00528 809CB038 25EFB458 */  addiu   $t7, $t7, %lo(func_809CB458) ## $t7 = 809CB458
/* 0052C 809CB03C A4EE01AC */  sh      $t6, 0x01AC($a3)           ## 000001AC
/* 00530 809CB040 ACEF01A8 */  sw      $t7, 0x01A8($a3)           ## 000001A8
/* 00534 809CB044 8FBF0014 */  lw      $ra, 0x0014($sp)
/* 00538 809CB048 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 0053C 809CB04C 03E00008 */  jr      $ra
/* 00540 809CB050 00000000 */  nop
