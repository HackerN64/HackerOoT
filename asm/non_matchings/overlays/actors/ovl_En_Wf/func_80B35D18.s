glabel func_80B35D18
/* 02068 80B35D18 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 0206C 80B35D1C AFBF0014 */  sw      $ra, 0x0014($sp)
/* 02070 80B35D20 948E0088 */  lhu     $t6, 0x0088($a0)           ## 00000088
/* 02074 80B35D24 00803825 */  or      $a3, $a0, $zero            ## $a3 = 00000000
/* 02078 80B35D28 2405389E */  addiu   $a1, $zero, 0x389E         ## $a1 = 0000389E
/* 0207C 80B35D2C 31CF0001 */  andi    $t7, $t6, 0x0001           ## $t7 = 00000000
/* 02080 80B35D30 51E00005 */  beql    $t7, $zero, .L80B35D48
/* 02084 80B35D34 00E02025 */  or      $a0, $a3, $zero            ## $a0 = 00000000
/* 02088 80B35D38 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 0208C 80B35D3C 00000000 */  nop
/* 02090 80B35D40 E4840068 */  swc1    $f4, 0x0068($a0)           ## 00000068
/* 02094 80B35D44 00E02025 */  or      $a0, $a3, $zero            ## $a0 = 00000000
.L80B35D48:
/* 02098 80B35D48 0C00BE0A */  jal     Audio_PlayActorSound2

/* 0209C 80B35D4C AFA70018 */  sw      $a3, 0x0018($sp)
/* 020A0 80B35D50 8FA70018 */  lw      $a3, 0x0018($sp)
/* 020A4 80B35D54 3C050601 */  lui     $a1, %hi(D_06009B20)                ## $a1 = 06010000
/* 020A8 80B35D58 24A59B20 */  addiu   $a1, $a1, %lo(D_06009B20)           ## $a1 = 06009B20
/* 020AC 80B35D5C 24060000 */  addiu   $a2, $zero, 0x0000         ## $a2 = 00000000
/* 020B0 80B35D60 0C0294A7 */  jal     Animation_PlayOnceSetSpeed
/* 020B4 80B35D64 24E40188 */  addiu   $a0, $a3, 0x0188           ## $a0 = 00000188
/* 020B8 80B35D68 8FA40018 */  lw      $a0, 0x0018($sp)
/* 020BC 80B35D6C 2418000F */  addiu   $t8, $zero, 0x000F         ## $t8 = 0000000F
/* 020C0 80B35D70 3C0580B3 */  lui     $a1, %hi(func_80B35D90)    ## $a1 = 80B30000
/* 020C4 80B35D74 24A55D90 */  addiu   $a1, $a1, %lo(func_80B35D90) ## $a1 = 80B35D90
/* 020C8 80B35D78 0C2CCF2C */  jal     func_80B33CB0
/* 020CC 80B35D7C AC9802D4 */  sw      $t8, 0x02D4($a0)           ## 000002D4
/* 020D0 80B35D80 8FBF0014 */  lw      $ra, 0x0014($sp)
/* 020D4 80B35D84 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 020D8 80B35D88 03E00008 */  jr      $ra
/* 020DC 80B35D8C 00000000 */  nop
