glabel func_80AD2FFC
/* 0034C 80AD2FFC 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 00350 80AD3000 AFBF0014 */  sw      $ra, 0x0014($sp)
/* 00354 80AD3004 00803825 */  or      $a3, $a0, $zero            ## $a3 = 00000000
/* 00358 80AD3008 3C050600 */  lui     $a1, 0x0600                ## $a1 = 06000000
/* 0035C 80AD300C 24A51360 */  addiu   $a1, $a1, 0x1360           ## $a1 = 06001360
/* 00360 80AD3010 AFA70018 */  sw      $a3, 0x0018($sp)
/* 00364 80AD3014 2484014C */  addiu   $a0, $a0, 0x014C           ## $a0 = 0000014C
/* 00368 80AD3018 0C029490 */  jal     SkelAnime_ChangeAnimTransitionStop
/* 0036C 80AD301C 3C06C0C0 */  lui     $a2, 0xC0C0                ## $a2 = C0C00000
/* 00370 80AD3020 8FA40018 */  lw      $a0, 0x0018($sp)
/* 00374 80AD3024 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 00378 80AD3028 240E0010 */  addiu   $t6, $zero, 0x0010         ## $t6 = 00000010
/* 0037C 80AD302C 24053874 */  addiu   $a1, $zero, 0x3874         ## $a1 = 00003874
/* 00380 80AD3030 A48E0194 */  sh      $t6, 0x0194($a0)           ## 00000194
/* 00384 80AD3034 0C00BE0A */  jal     Audio_PlayActorSound2

/* 00388 80AD3038 E4840068 */  swc1    $f4, 0x0068($a0)           ## 00000068
/* 0038C 80AD303C 8FA70018 */  lw      $a3, 0x0018($sp)
/* 00390 80AD3040 3C0F80AD */  lui     $t7, %hi(func_80AD3328)    ## $t7 = 80AD0000
/* 00394 80AD3044 25EF3328 */  addiu   $t7, $t7, %lo(func_80AD3328) ## $t7 = 80AD3328
/* 00398 80AD3048 ACEF0190 */  sw      $t7, 0x0190($a3)           ## 00000190
/* 0039C 80AD304C 8FBF0014 */  lw      $ra, 0x0014($sp)
/* 003A0 80AD3050 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 003A4 80AD3054 03E00008 */  jr      $ra
/* 003A8 80AD3058 00000000 */  nop
