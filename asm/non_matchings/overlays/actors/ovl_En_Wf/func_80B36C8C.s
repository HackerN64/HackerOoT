glabel func_80B36C8C
/* 02FDC 80B36C8C 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 02FE0 80B36C90 AFBF0014 */  sw      $ra, 0x0014($sp)
/* 02FE4 80B36C94 00803825 */  or      $a3, $a0, $zero            ## $a3 = 00000000
/* 02FE8 80B36C98 3C050600 */  lui     $a1, %hi(D_06005430)                ## $a1 = 06000000
/* 02FEC 80B36C9C 24A55430 */  addiu   $a1, $a1, %lo(D_06005430)           ## $a1 = 06005430
/* 02FF0 80B36CA0 AFA70018 */  sw      $a3, 0x0018($sp)
/* 02FF4 80B36CA4 24840188 */  addiu   $a0, $a0, 0x0188           ## $a0 = 00000188
/* 02FF8 80B36CA8 0C029490 */  jal     SkelAnime_ChangeAnimTransitionStop
/* 02FFC 80B36CAC 3C06C080 */  lui     $a2, 0xC080                ## $a2 = C0800000
/* 03000 80B36CB0 8FA70018 */  lw      $a3, 0x0018($sp)
/* 03004 80B36CB4 3C01C0C0 */  lui     $at, 0xC0C0                ## $at = C0C00000
/* 03008 80B36CB8 24190001 */  addiu   $t9, $zero, 0x0001         ## $t9 = 00000001
/* 0300C 80B36CBC 94EF0088 */  lhu     $t7, 0x0088($a3)           ## 00000088
/* 03010 80B36CC0 84EE008A */  lh      $t6, 0x008A($a3)           ## 0000008A
/* 03014 80B36CC4 24080002 */  addiu   $t0, $zero, 0x0002         ## $t0 = 00000002
/* 03018 80B36CC8 31F80001 */  andi    $t8, $t7, 0x0001           ## $t8 = 00000000
/* 0301C 80B36CCC 13000005 */  beq     $t8, $zero, .L80B36CE4
/* 03020 80B36CD0 A4EE0032 */  sh      $t6, 0x0032($a3)           ## 00000032
/* 03024 80B36CD4 44812000 */  mtc1    $at, $f4                   ## $f4 = -6.00
/* 03028 80B36CD8 A4E00300 */  sh      $zero, 0x0300($a3)         ## 00000300
/* 0302C 80B36CDC 10000002 */  beq     $zero, $zero, .L80B36CE8
/* 03030 80B36CE0 E4E40068 */  swc1    $f4, 0x0068($a3)           ## 00000068
.L80B36CE4:
/* 03034 80B36CE4 A4F90300 */  sh      $t9, 0x0300($a3)           ## 00000300
.L80B36CE8:
/* 03038 80B36CE8 C4E6019C */  lwc1    $f6, 0x019C($a3)           ## 0000019C
/* 0303C 80B36CEC 8CE90004 */  lw      $t1, 0x0004($a3)           ## 00000004
/* 03040 80B36CF0 2401FFFE */  addiu   $at, $zero, 0xFFFE         ## $at = FFFFFFFE
/* 03044 80B36CF4 4600320D */  trunc.w.s $f8, $f6
/* 03048 80B36CF8 01215024 */  and     $t2, $t1, $at
/* 0304C 80B36CFC ACE802D4 */  sw      $t0, 0x02D4($a3)           ## 000002D4
/* 03050 80B36D00 ACEA0004 */  sw      $t2, 0x0004($a3)           ## 00000004
/* 03054 80B36D04 440C4000 */  mfc1    $t4, $f8
/* 03058 80B36D08 00E02025 */  or      $a0, $a3, $zero            ## $a0 = 00000000
/* 0305C 80B36D0C 2405384B */  addiu   $a1, $zero, 0x384B         ## $a1 = 0000384B
/* 03060 80B36D10 ACEC02E8 */  sw      $t4, 0x02E8($a3)           ## 000002E8
/* 03064 80B36D14 0C00BE0A */  jal     Audio_PlayActorSound2

/* 03068 80B36D18 AFA70018 */  sw      $a3, 0x0018($sp)
/* 0306C 80B36D1C 3C0580B3 */  lui     $a1, %hi(func_80B36D3C)    ## $a1 = 80B30000
/* 03070 80B36D20 8FA40018 */  lw      $a0, 0x0018($sp)
/* 03074 80B36D24 0C2CCF2C */  jal     func_80B33CB0
/* 03078 80B36D28 24A56D3C */  addiu   $a1, $a1, %lo(func_80B36D3C) ## $a1 = 80B36D3C
/* 0307C 80B36D2C 8FBF0014 */  lw      $ra, 0x0014($sp)
/* 03080 80B36D30 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 03084 80B36D34 03E00008 */  jr      $ra
/* 03088 80B36D38 00000000 */  nop
