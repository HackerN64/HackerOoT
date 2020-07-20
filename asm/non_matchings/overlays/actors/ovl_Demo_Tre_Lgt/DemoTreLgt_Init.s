.rdata
glabel D_80993DC0
    # Construct failure
    .asciz "Demo_Tre_Lgt_Actor_ct();コンストラクト失敗\n"
    .balign 4

glabel D_80993DE4
    .asciz "1"
    .balign 4

glabel D_80993DE8
    .asciz "../z_demo_tre_lgt.c"
    .balign 4

.text
glabel DemoTreLgt_Init
/* 00000 809936C0 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 00004 809936C4 AFB00018 */  sw      $s0, 0x0018($sp)
/* 00008 809936C8 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 0000C 809936CC AFBF001C */  sw      $ra, 0x001C($sp)
/* 00010 809936D0 AFA50024 */  sw      $a1, 0x0024($sp)
/* 00014 809936D4 00A02025 */  or      $a0, $a1, $zero            ## $a0 = 00000000
/* 00018 809936D8 3C060600 */  lui     $a2, 0x0600                ## $a2 = 06000000
/* 0001C 809936DC 3C078099 */  lui     $a3, %hi(D_80993DB0)       ## $a3 = 80990000
/* 00020 809936E0 8CE73DB0 */  lw      $a3, %lo(D_80993DB0)($a3)
/* 00024 809936E4 24C65EB8 */  addiu   $a2, $a2, 0x5EB8           ## $a2 = 06005EB8
/* 00028 809936E8 0C01B1DE */  jal     SkelCurve_Init
/* 0002C 809936EC 2605014C */  addiu   $a1, $s0, 0x014C           ## $a1 = 0000014C
/* 00030 809936F0 14400003 */  bne     $v0, $zero, .L80993700
/* 00034 809936F4 3C048099 */  lui     $a0, %hi(D_80993DC0)       ## $a0 = 80990000
/* 00038 809936F8 0C00084C */  jal     osSyncPrintf

/* 0003C 809936FC 24843DC0 */  addiu   $a0, $a0, %lo(D_80993DC0)  ## $a0 = 80993DC0
.L80993700:
/* 00040 80993700 240200FF */  addiu   $v0, $zero, 0x00FF         ## $v0 = 000000FF
/* 00044 80993704 AE020170 */  sw      $v0, 0x0170($s0)           ## 00000170
/* 00048 80993708 AE020174 */  sw      $v0, 0x0174($s0)           ## 00000174
/* 0004C 8099370C A2000178 */  sb      $zero, 0x0178($s0)         ## 00000178
/* 00050 80993710 0C264DD5 */  jal     func_80993754
/* 00054 80993714 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00058 80993718 8FBF001C */  lw      $ra, 0x001C($sp)
/* 0005C 8099371C 8FB00018 */  lw      $s0, 0x0018($sp)
/* 00060 80993720 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
/* 00064 80993724 03E00008 */  jr      $ra
/* 00068 80993728 00000000 */  nop
