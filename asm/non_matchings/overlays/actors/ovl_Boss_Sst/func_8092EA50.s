glabel func_8092EA50
/* 02480 8092EA50 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 02484 8092EA54 AFBF0014 */  sw      $ra, 0x0014($sp)
/* 02488 8092EA58 00803825 */  or      $a3, $a0, $zero            ## $a3 = 00000000
/* 0248C 8092EA5C 3C050601 */  lui     $a1, 0x0601                ## $a1 = 06010000
/* 02490 8092EA60 24A5D458 */  addiu   $a1, $a1, 0xD458           ## $a1 = 0600D458
/* 02494 8092EA64 AFA70018 */  sw      $a3, 0x0018($sp)
/* 02498 8092EA68 2484014C */  addiu   $a0, $a0, 0x014C           ## $a0 = 0000014C
/* 0249C 8092EA6C 0C029490 */  jal     Animation_MorphToPlayOnce
/* 024A0 8092EA70 3C06C0A0 */  lui     $a2, 0xC0A0                ## $a2 = C0A00000
/* 024A4 8092EA74 8FA70018 */  lw      $a3, 0x0018($sp)
/* 024A8 8092EA78 3C18FFCF */  lui     $t8, 0xFFCF                ## $t8 = FFCF0000
/* 024AC 8092EA7C 3718FFFF */  ori     $t8, $t8, 0xFFFF           ## $t8 = FFCFFFFF
/* 024B0 8092EA80 90EE06C5 */  lbu     $t6, 0x06C5($a3)           ## 000006C5
/* 024B4 8092EA84 8CE203F0 */  lw      $v0, 0x03F0($a3)           ## 000003F0
/* 024B8 8092EA88 ACF806D4 */  sw      $t8, 0x06D4($a3)           ## 000006D4
/* 024BC 8092EA8C 31CFFFFE */  andi    $t7, $t6, 0xFFFE           ## $t7 = 00000000
/* 024C0 8092EA90 A0EF06C5 */  sb      $t7, 0x06C5($a3)           ## 000006C5
/* 024C4 8092EA94 90590296 */  lbu     $t9, 0x0296($v0)           ## 00000296
/* 024C8 8092EA98 3C0140A0 */  lui     $at, 0x40A0                ## $at = 40A00000
/* 024CC 8092EA9C 44812000 */  mtc1    $at, $f4                   ## $f4 = 5.00
/* 024D0 8092EAA0 3328FFFA */  andi    $t0, $t9, 0xFFFA           ## $t0 = 00000000
/* 024D4 8092EAA4 A0480296 */  sb      $t0, 0x0296($v0)           ## 00000296
/* 024D8 8092EAA8 8CE203F0 */  lw      $v0, 0x03F0($a3)           ## 000003F0
/* 024DC 8092EAAC 3C0C8093 */  lui     $t4, %hi(func_8092EAE0)    ## $t4 = 80930000
/* 024E0 8092EAB0 240B0001 */  addiu   $t3, $zero, 0x0001         ## $t3 = 00000001
/* 024E4 8092EAB4 90490016 */  lbu     $t1, 0x0016($v0)           ## 00000016
/* 024E8 8092EAB8 258CEAE0 */  addiu   $t4, $t4, %lo(func_8092EAE0) ## $t4 = 8092EAE0
/* 024EC 8092EABC 352A0001 */  ori     $t2, $t1, 0x0001           ## $t2 = 00000001
/* 024F0 8092EAC0 A04A0016 */  sb      $t2, 0x0016($v0)           ## 00000016
/* 024F4 8092EAC4 A0EB0194 */  sb      $t3, 0x0194($a3)           ## 00000194
/* 024F8 8092EAC8 ACEC0190 */  sw      $t4, 0x0190($a3)           ## 00000190
/* 024FC 8092EACC E4E40068 */  swc1    $f4, 0x0068($a3)           ## 00000068
/* 02500 8092EAD0 8FBF0014 */  lw      $ra, 0x0014($sp)
/* 02504 8092EAD4 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 02508 8092EAD8 03E00008 */  jr      $ra
/* 0250C 8092EADC 00000000 */  nop
