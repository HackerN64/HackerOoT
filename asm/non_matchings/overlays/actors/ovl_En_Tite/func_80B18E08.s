glabel func_80B18E08
/* 00388 80B18E08 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 0038C 80B18E0C AFBF0014 */  sw      $ra, 0x0014($sp)
/* 00390 80B18E10 00803025 */  or      $a2, $a0, $zero            ## $a2 = 00000000
/* 00394 80B18E14 3C050600 */  lui     $a1, %hi(D_0600083C)                ## $a1 = 06000000
/* 00398 80B18E18 24A5083C */  addiu   $a1, $a1, %lo(D_0600083C)           ## $a1 = 0600083C
/* 0039C 80B18E1C AFA60018 */  sw      $a2, 0x0018($sp)
/* 003A0 80B18E20 0C02947A */  jal     SkelAnime_ChangeAnimDefaultStop
/* 003A4 80B18E24 2484014C */  addiu   $a0, $a0, 0x014C           ## $a0 = 0000014C
/* 003A8 80B18E28 8FA60018 */  lw      $a2, 0x0018($sp)
/* 003AC 80B18E2C 240E0009 */  addiu   $t6, $zero, 0x0009         ## $t6 = 00000009
/* 003B0 80B18E30 24040001 */  addiu   $a0, $zero, 0x0001         ## $a0 = 00000001
/* 003B4 80B18E34 24050003 */  addiu   $a1, $zero, 0x0003         ## $a1 = 00000003
/* 003B8 80B18E38 A0CE02BC */  sb      $t6, 0x02BC($a2)           ## 000002BC
/* 003BC 80B18E3C 0C01DF64 */  jal     Math_Rand_S16Offset

/* 003C0 80B18E40 A4C002E0 */  sh      $zero, 0x02E0($a2)         ## 000002E0
/* 003C4 80B18E44 8FA40018 */  lw      $a0, 0x0018($sp)
/* 003C8 80B18E48 44800000 */  mtc1    $zero, $f0                 ## $f0 = 0.00
/* 003CC 80B18E4C 3C0580B2 */  lui     $a1, %hi(func_80B18E7C)    ## $a1 = 80B20000
/* 003D0 80B18E50 848F00B6 */  lh      $t7, 0x00B6($a0)           ## 000000B6
/* 003D4 80B18E54 24A58E7C */  addiu   $a1, $a1, %lo(func_80B18E7C) ## $a1 = 80B18E7C
/* 003D8 80B18E58 A08202E2 */  sb      $v0, 0x02E2($a0)           ## 000002E2
/* 003DC 80B18E5C E4800068 */  swc1    $f0, 0x0068($a0)           ## 00000068
/* 003E0 80B18E60 E4800060 */  swc1    $f0, 0x0060($a0)           ## 00000060
/* 003E4 80B18E64 0C2C62A0 */  jal     func_80B18A80
/* 003E8 80B18E68 A48F0032 */  sh      $t7, 0x0032($a0)           ## 00000032
/* 003EC 80B18E6C 8FBF0014 */  lw      $ra, 0x0014($sp)
/* 003F0 80B18E70 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 003F4 80B18E74 03E00008 */  jr      $ra
/* 003F8 80B18E78 00000000 */  nop
