glabel func_80B19E28
/* 013A8 80B19E28 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 013AC 80B19E2C AFBF0014 */  sw      $ra, 0x0014($sp)
/* 013B0 80B19E30 240E0003 */  addiu   $t6, $zero, 0x0003         ## $t6 = 00000003
/* 013B4 80B19E34 00803825 */  or      $a3, $a0, $zero            ## $a3 = 00000000
/* 013B8 80B19E38 A08E02BC */  sb      $t6, 0x02BC($a0)           ## 000002BC
/* 013BC 80B19E3C 3C050600 */  lui     $a1, %hi(D_060012E4)                ## $a1 = 06000000
/* 013C0 80B19E40 24A512E4 */  addiu   $a1, $a1, %lo(D_060012E4)           ## $a1 = 060012E4
/* 013C4 80B19E44 AFA70018 */  sw      $a3, 0x0018($sp)
/* 013C8 80B19E48 2484014C */  addiu   $a0, $a0, 0x014C           ## $a0 = 0000014C
/* 013CC 80B19E4C 0C0294D3 */  jal     SkelAnime_ChangeAnimTransitionRepeat
/* 013D0 80B19E50 3C064080 */  lui     $a2, 0x4080                ## $a2 = 40800000
/* 013D4 80B19E54 8FA40018 */  lw      $a0, 0x0018($sp)
/* 013D8 80B19E58 3C01C0C0 */  lui     $at, 0xC0C0                ## $at = C0C00000
/* 013DC 80B19E5C 44812000 */  mtc1    $at, $f4                   ## $f4 = -6.00
/* 013E0 80B19E60 3C01BF80 */  lui     $at, 0xBF80                ## $at = BF800000
/* 013E4 80B19E64 44813000 */  mtc1    $at, $f6                   ## $f6 = -1.00
/* 013E8 80B19E68 848F008A */  lh      $t7, 0x008A($a0)           ## 0000008A
/* 013EC 80B19E6C 3C0580B2 */  lui     $a1, %hi(func_80B19E94)    ## $a1 = 80B20000
/* 013F0 80B19E70 24A59E94 */  addiu   $a1, $a1, %lo(func_80B19E94) ## $a1 = 80B19E94
/* 013F4 80B19E74 E4840068 */  swc1    $f4, 0x0068($a0)           ## 00000068
/* 013F8 80B19E78 A48F0032 */  sh      $t7, 0x0032($a0)           ## 00000032
/* 013FC 80B19E7C 0C2C62A0 */  jal     func_80B18A80
/* 01400 80B19E80 E486006C */  swc1    $f6, 0x006C($a0)           ## 0000006C
/* 01404 80B19E84 8FBF0014 */  lw      $ra, 0x0014($sp)
/* 01408 80B19E88 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 0140C 80B19E8C 03E00008 */  jr      $ra
/* 01410 80B19E90 00000000 */  nop
