.rdata
glabel D_80B136E0
    .asciz "\n\n"
    .balign 4

glabel D_80B136E4
    .asciz "[32m☆☆☆☆☆ 射的場鶏 ☆☆☆☆☆ \n[m"
    .balign 4

glabel D_80B13710
    .asciz "\n\n"
    .balign 4

glabel D_80B13714
    .asciz "[32m☆☆☆☆☆ ボムにわ！ ☆☆☆☆☆ \n[m"
    .balign 4

.text
glabel EnSyatekiNiw_Init
/* 00000 80B118F0 27BDFFC8 */  addiu   $sp, $sp, 0xFFC8           ## $sp = FFFFFFC8
/* 00004 80B118F4 AFA5003C */  sw      $a1, 0x003C($sp)
/* 00008 80B118F8 AFBF002C */  sw      $ra, 0x002C($sp)
/* 0000C 80B118FC AFB00028 */  sw      $s0, 0x0028($sp)
/* 00010 80B11900 3C0580B1 */  lui     $a1, %hi(D_80B1368C)       ## $a1 = 80B10000
/* 00014 80B11904 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00018 80B11908 0C01E037 */  jal     Actor_ProcessInitChain

/* 0001C 80B1190C 24A5368C */  addiu   $a1, $a1, %lo(D_80B1368C)  ## $a1 = 80B1368C
/* 00020 80B11910 8E0E0004 */  lw      $t6, 0x0004($s0)           ## 00000004
/* 00024 80B11914 2401FFFE */  addiu   $at, $zero, 0xFFFE         ## $at = FFFFFFFE
/* 00028 80B11918 3C068003 */  lui     $a2, %hi(ActorShadow_DrawFunc_Circle)
/* 0002C 80B1191C 01C17824 */  and     $t7, $t6, $at
/* 00030 80B11920 AE0F0004 */  sw      $t7, 0x0004($s0)           ## 00000004
/* 00034 80B11924 24C6B5EC */  addiu   $a2, %lo(ActorShadow_DrawFunc_Circle)
/* 00038 80B11928 260400B4 */  addiu   $a0, $s0, 0x00B4           ## $a0 = 000000B4
/* 0003C 80B1192C 24050000 */  addiu   $a1, $zero, 0x0000         ## $a1 = 00000000
/* 00040 80B11930 0C00AC78 */  jal     ActorShape_Init

/* 00044 80B11934 3C0741C8 */  lui     $a3, 0x41C8                ## $a3 = 41C80000
/* 00048 80B11938 3C060600 */  lui     $a2, 0x0600                ## $a2 = 06000000
/* 0004C 80B1193C 3C070600 */  lui     $a3, 0x0600                ## $a3 = 06000000
/* 00050 80B11940 26180190 */  addiu   $t8, $s0, 0x0190           ## $t8 = 00000190
/* 00054 80B11944 261901F0 */  addiu   $t9, $s0, 0x01F0           ## $t9 = 000001F0
/* 00058 80B11948 24080010 */  addiu   $t0, $zero, 0x0010         ## $t0 = 00000010
/* 0005C 80B1194C AFA80018 */  sw      $t0, 0x0018($sp)
/* 00060 80B11950 AFB90014 */  sw      $t9, 0x0014($sp)
/* 00064 80B11954 AFB80010 */  sw      $t8, 0x0010($sp)
/* 00068 80B11958 24E700E8 */  addiu   $a3, $a3, 0x00E8           ## $a3 = 060000E8
/* 0006C 80B1195C 24C62530 */  addiu   $a2, $a2, 0x2530           ## $a2 = 06002530
/* 00070 80B11960 8FA4003C */  lw      $a0, 0x003C($sp)
/* 00074 80B11964 0C0291BE */  jal     SkelAnime_InitSV
/* 00078 80B11968 2605014C */  addiu   $a1, $s0, 0x014C           ## $a1 = 0000014C
/* 0007C 80B1196C 8609001C */  lh      $t1, 0x001C($s0)           ## 0000001C
/* 00080 80B11970 260502FC */  addiu   $a1, $s0, 0x02FC           ## $a1 = 000002FC
/* 00084 80B11974 A609029E */  sh      $t1, 0x029E($s0)           ## 0000029E
/* 00088 80B11978 860A029E */  lh      $t2, 0x029E($s0)           ## 0000029E
/* 0008C 80B1197C 05430003 */  bgezl   $t2, .L80B1198C
/* 00090 80B11980 8FA4003C */  lw      $a0, 0x003C($sp)
/* 00094 80B11984 A600029E */  sh      $zero, 0x029E($s0)         ## 0000029E
/* 00098 80B11988 8FA4003C */  lw      $a0, 0x003C($sp)
.L80B1198C:
/* 0009C 80B1198C 0C0170D9 */  jal     ActorCollider_AllocCylinder

/* 000A0 80B11990 AFA50030 */  sw      $a1, 0x0030($sp)
/* 000A4 80B11994 3C0780B1 */  lui     $a3, %hi(D_80B13660)       ## $a3 = 80B10000
/* 000A8 80B11998 8FA50030 */  lw      $a1, 0x0030($sp)
/* 000AC 80B1199C 24E73660 */  addiu   $a3, $a3, %lo(D_80B13660)  ## $a3 = 80B13660
/* 000B0 80B119A0 8FA4003C */  lw      $a0, 0x003C($sp)
/* 000B4 80B119A4 0C01712B */  jal     ActorCollider_InitCylinder

/* 000B8 80B119A8 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 000BC 80B119AC 860B029E */  lh      $t3, 0x029E($s0)           ## 0000029E
/* 000C0 80B119B0 3C0480B1 */  lui     $a0, %hi(D_80B13710)       ## $a0 = 80B10000
/* 000C4 80B119B4 1560000D */  bne     $t3, $zero, .L80B119EC
/* 000C8 80B119B8 00000000 */  nop
/* 000CC 80B119BC 3C0480B1 */  lui     $a0, %hi(D_80B136E0)       ## $a0 = 80B10000
/* 000D0 80B119C0 0C00084C */  jal     osSyncPrintf

/* 000D4 80B119C4 248436E0 */  addiu   $a0, $a0, %lo(D_80B136E0)  ## $a0 = 80B136E0
/* 000D8 80B119C8 3C0480B1 */  lui     $a0, %hi(D_80B136E4)       ## $a0 = 80B10000
/* 000DC 80B119CC 0C00084C */  jal     osSyncPrintf

/* 000E0 80B119D0 248436E4 */  addiu   $a0, $a0, %lo(D_80B136E4)  ## $a0 = 80B136E4
/* 000E4 80B119D4 3C053C23 */  lui     $a1, 0x3C23                ## $a1 = 3C230000
/* 000E8 80B119D8 34A5D70A */  ori     $a1, $a1, 0xD70A           ## $a1 = 3C23D70A
/* 000EC 80B119DC 0C00B58B */  jal     Actor_SetScale

/* 000F0 80B119E0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 000F4 80B119E4 1000000D */  beq     $zero, $zero, .L80B11A1C
/* 000F8 80B119E8 26020024 */  addiu   $v0, $s0, 0x0024           ## $v0 = 00000024
.L80B119EC:
/* 000FC 80B119EC 0C00084C */  jal     osSyncPrintf

/* 00100 80B119F0 24843710 */  addiu   $a0, $a0, %lo(D_80B13710)  ## $a0 = 00003710
/* 00104 80B119F4 3C0480B1 */  lui     $a0, %hi(D_80B13714)       ## $a0 = 80B10000
/* 00108 80B119F8 0C00084C */  jal     osSyncPrintf

/* 0010C 80B119FC 24843714 */  addiu   $a0, $a0, %lo(D_80B13714)  ## $a0 = 80B13714
/* 00110 80B11A00 240C00FF */  addiu   $t4, $zero, 0x00FF         ## $t4 = 000000FF
/* 00114 80B11A04 3C053C23 */  lui     $a1, 0x3C23                ## $a1 = 3C230000
/* 00118 80B11A08 A20C00AE */  sb      $t4, 0x00AE($s0)           ## 000000AE
/* 0011C 80B11A0C 34A5D70A */  ori     $a1, $a1, 0xD70A           ## $a1 = 3C23D70A
/* 00120 80B11A10 0C00B58B */  jal     Actor_SetScale

/* 00124 80B11A14 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00128 80B11A18 26020024 */  addiu   $v0, $s0, 0x0024           ## $v0 = 00000024
.L80B11A1C:
/* 0012C 80B11A1C 8C4E0000 */  lw      $t6, 0x0000($v0)           ## 00000024
/* 00130 80B11A20 3C1980B1 */  lui     $t9, %hi(func_80B11DEC)    ## $t9 = 80B10000
/* 00134 80B11A24 27391DEC */  addiu   $t9, $t9, %lo(func_80B11DEC) ## $t9 = 80B11DEC
/* 00138 80B11A28 AE0E02DC */  sw      $t6, 0x02DC($s0)           ## 000002DC
/* 0013C 80B11A2C 8C4D0004 */  lw      $t5, 0x0004($v0)           ## 00000028
/* 00140 80B11A30 AE0D02E0 */  sw      $t5, 0x02E0($s0)           ## 000002E0
/* 00144 80B11A34 8C4E0008 */  lw      $t6, 0x0008($v0)           ## 0000002C
/* 00148 80B11A38 AE0E02E4 */  sw      $t6, 0x02E4($s0)           ## 000002E4
/* 0014C 80B11A3C 8C580000 */  lw      $t8, 0x0000($v0)           ## 00000024
/* 00150 80B11A40 AE1802E8 */  sw      $t8, 0x02E8($s0)           ## 000002E8
/* 00154 80B11A44 8C4F0004 */  lw      $t7, 0x0004($v0)           ## 00000028
/* 00158 80B11A48 AE0F02EC */  sw      $t7, 0x02EC($s0)           ## 000002EC
/* 0015C 80B11A4C 8C580008 */  lw      $t8, 0x0008($v0)           ## 0000002C
/* 00160 80B11A50 AE190250 */  sw      $t9, 0x0250($s0)           ## 00000250
/* 00164 80B11A54 AE1802F0 */  sw      $t8, 0x02F0($s0)           ## 000002F0
/* 00168 80B11A58 8FBF002C */  lw      $ra, 0x002C($sp)
/* 0016C 80B11A5C 8FB00028 */  lw      $s0, 0x0028($sp)
/* 00170 80B11A60 27BD0038 */  addiu   $sp, $sp, 0x0038           ## $sp = 00000000
/* 00174 80B11A64 03E00008 */  jr      $ra
/* 00178 80B11A68 00000000 */  nop
