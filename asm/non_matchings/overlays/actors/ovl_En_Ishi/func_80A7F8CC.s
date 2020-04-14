.rdata
glabel D_80A87428
    .asciz "../z_en_ishi.c"
    .balign 4

glabel D_80A87438
    .asciz "../z_en_ishi.c"
    .balign 4

glabel D_80A87448
    .asciz "../z_en_ishi.c"
    .balign 4

.text
glabel func_80A7F8CC
/* 0146C 80A7F8CC 27BDFFB8 */  addiu   $sp, $sp, 0xFFB8           ## $sp = FFFFFFB8
/* 01470 80A7F8D0 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 01474 80A7F8D4 AFB00018 */  sw      $s0, 0x0018($sp)           
/* 01478 80A7F8D8 AFA40048 */  sw      $a0, 0x0048($sp)           
/* 0147C 80A7F8DC AFA5004C */  sw      $a1, 0x004C($sp)           
/* 01480 80A7F8E0 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 01484 80A7F8E4 3C0680A8 */  lui     $a2, %hi(D_80A87428)       ## $a2 = 80A80000
/* 01488 80A7F8E8 24C67428 */  addiu   $a2, $a2, %lo(D_80A87428)  ## $a2 = 80A87428
/* 0148C 80A7F8EC 27A40034 */  addiu   $a0, $sp, 0x0034           ## $a0 = FFFFFFEC
/* 01490 80A7F8F0 2407041A */  addiu   $a3, $zero, 0x041A         ## $a3 = 0000041A
/* 01494 80A7F8F4 0C031AB1 */  jal     Graph_OpenDisps              
/* 01498 80A7F8F8 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 0149C 80A7F8FC 8FAF004C */  lw      $t7, 0x004C($sp)           
/* 014A0 80A7F900 0C024F46 */  jal     func_80093D18              
/* 014A4 80A7F904 8DE40000 */  lw      $a0, 0x0000($t7)           ## 00000000
/* 014A8 80A7F908 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 014AC 80A7F90C 3C19DA38 */  lui     $t9, 0xDA38                ## $t9 = DA380000
/* 014B0 80A7F910 37390003 */  ori     $t9, $t9, 0x0003           ## $t9 = DA380003
/* 014B4 80A7F914 24580008 */  addiu   $t8, $v0, 0x0008           ## $t8 = 00000008
/* 014B8 80A7F918 AE1802C0 */  sw      $t8, 0x02C0($s0)           ## 000002C0
/* 014BC 80A7F91C AC590000 */  sw      $t9, 0x0000($v0)           ## 00000000
/* 014C0 80A7F920 8FA8004C */  lw      $t0, 0x004C($sp)           
/* 014C4 80A7F924 3C0580A8 */  lui     $a1, %hi(D_80A87438)       ## $a1 = 80A80000
/* 014C8 80A7F928 24A57438 */  addiu   $a1, $a1, %lo(D_80A87438)  ## $a1 = 80A87438
/* 014CC 80A7F92C 8D040000 */  lw      $a0, 0x0000($t0)           ## 00000000
/* 014D0 80A7F930 2406041F */  addiu   $a2, $zero, 0x041F         ## $a2 = 0000041F
/* 014D4 80A7F934 0C0346A2 */  jal     Matrix_NewMtx              
/* 014D8 80A7F938 AFA20030 */  sw      $v0, 0x0030($sp)           
/* 014DC 80A7F93C 8FA30030 */  lw      $v1, 0x0030($sp)           
/* 014E0 80A7F940 3C0AFA00 */  lui     $t2, 0xFA00                ## $t2 = FA000000
/* 014E4 80A7F944 240BFFFF */  addiu   $t3, $zero, 0xFFFF         ## $t3 = FFFFFFFF
/* 014E8 80A7F948 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 014EC 80A7F94C 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 014F0 80A7F950 3C0E0501 */  lui     $t6, 0x0501                ## $t6 = 05010000
/* 014F4 80A7F954 25CEA3B8 */  addiu   $t6, $t6, 0xA3B8           ## $t6 = 0500A3B8
/* 014F8 80A7F958 24490008 */  addiu   $t1, $v0, 0x0008           ## $t1 = 00000008
/* 014FC 80A7F95C AE0902C0 */  sw      $t1, 0x02C0($s0)           ## 000002C0
/* 01500 80A7F960 AC4B0004 */  sw      $t3, 0x0004($v0)           ## 00000004
/* 01504 80A7F964 AC4A0000 */  sw      $t2, 0x0000($v0)           ## 00000000
/* 01508 80A7F968 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 0150C 80A7F96C 3C0DDE00 */  lui     $t5, 0xDE00                ## $t5 = DE000000
/* 01510 80A7F970 3C0680A8 */  lui     $a2, %hi(D_80A87448)       ## $a2 = 80A80000
/* 01514 80A7F974 244C0008 */  addiu   $t4, $v0, 0x0008           ## $t4 = 00000008
/* 01518 80A7F978 AE0C02C0 */  sw      $t4, 0x02C0($s0)           ## 000002C0
/* 0151C 80A7F97C AC4E0004 */  sw      $t6, 0x0004($v0)           ## 00000004
/* 01520 80A7F980 AC4D0000 */  sw      $t5, 0x0000($v0)           ## 00000000
/* 01524 80A7F984 8FAF004C */  lw      $t7, 0x004C($sp)           
/* 01528 80A7F988 24C67448 */  addiu   $a2, $a2, %lo(D_80A87448)  ## $a2 = 80A87448
/* 0152C 80A7F98C 27A40034 */  addiu   $a0, $sp, 0x0034           ## $a0 = FFFFFFEC
/* 01530 80A7F990 24070426 */  addiu   $a3, $zero, 0x0426         ## $a3 = 00000426
/* 01534 80A7F994 0C031AD5 */  jal     Graph_CloseDisps              
/* 01538 80A7F998 8DE50000 */  lw      $a1, 0x0000($t7)           ## 00000000
/* 0153C 80A7F99C 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 01540 80A7F9A0 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 01544 80A7F9A4 27BD0048 */  addiu   $sp, $sp, 0x0048           ## $sp = 00000000
/* 01548 80A7F9A8 03E00008 */  jr      $ra                        
/* 0154C 80A7F9AC 00000000 */  nop
