.rdata
glabel D_80A5B070
    .asciz "Warning : vector size zero (%s %d)\n"
    .balign 4

glabel D_80A5B094
    .asciz "../z_en_honotrap.c"
    .balign 4

.late_rodata
glabel D_80A5B120
    .float 0.001

.text
glabel func_80A59CC0
/* 00090 80A59CC0 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 00094 80A59CC4 AFBF0014 */  sw      $ra, 0x0014($sp)
/* 00098 80A59CC8 00803825 */  or      $a3, $a0, $zero            ## $a3 = 00000000
/* 0009C 80A59CCC AFA70018 */  sw      $a3, 0x0018($sp)
/* 000A0 80A59CD0 00A02025 */  or      $a0, $a1, $zero            ## $a0 = 00000000
/* 000A4 80A59CD4 0C032D8A */  jal     Math3D_Vec3fMagnitude
/* 000A8 80A59CD8 AFA5001C */  sw      $a1, 0x001C($sp)
/* 000AC 80A59CDC 3C0180A6 */  lui     $at, %hi(D_80A5B120)       ## $at = 80A60000
/* 000B0 80A59CE0 C424B120 */  lwc1    $f4, %lo(D_80A5B120)($at)
/* 000B4 80A59CE4 3C0480A6 */  lui     $a0, %hi(D_80A5B070)       ## $a0 = 80A60000
/* 000B8 80A59CE8 8FA5001C */  lw      $a1, 0x001C($sp)
/* 000BC 80A59CEC 4604003C */  c.lt.s  $f0, $f4
/* 000C0 80A59CF0 8FA70018 */  lw      $a3, 0x0018($sp)
/* 000C4 80A59CF4 2484B070 */  addiu   $a0, $a0, %lo(D_80A5B070)  ## $a0 = 80A5B070
/* 000C8 80A59CF8 24060148 */  addiu   $a2, $zero, 0x0148         ## $a2 = 00000148
/* 000CC 80A59CFC 4500000D */  bc1f    .L80A59D34
/* 000D0 80A59D00 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 000D4 80A59D04 3C0580A6 */  lui     $a1, %hi(D_80A5B094)       ## $a1 = 80A60000
/* 000D8 80A59D08 24A5B094 */  addiu   $a1, $a1, %lo(D_80A5B094)  ## $a1 = 80A5B094
/* 000DC 80A59D0C 0C00084C */  jal     osSyncPrintf

/* 000E0 80A59D10 AFA70018 */  sw      $a3, 0x0018($sp)
/* 000E4 80A59D14 8FA70018 */  lw      $a3, 0x0018($sp)
/* 000E8 80A59D18 44800000 */  mtc1    $zero, $f0                 ## $f0 = 0.00
/* 000EC 80A59D1C 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 000F0 80A59D20 44813000 */  mtc1    $at, $f6                   ## $f6 = 1.00
/* 000F4 80A59D24 E4E00004 */  swc1    $f0, 0x0004($a3)           ## 00000004
/* 000F8 80A59D28 E4E00000 */  swc1    $f0, 0x0000($a3)           ## 00000000
/* 000FC 80A59D2C 1000000C */  beq     $zero, $zero, .L80A59D60
/* 00100 80A59D30 E4E60008 */  swc1    $f6, 0x0008($a3)           ## 00000008
.L80A59D34:
/* 00104 80A59D34 44814000 */  mtc1    $at, $f8                   ## $f8 = 1.00
/* 00108 80A59D38 C4AA0000 */  lwc1    $f10, 0x0000($a1)          ## 00000000
/* 0010C 80A59D3C 46004083 */  div.s   $f2, $f8, $f0
/* 00110 80A59D40 46025402 */  mul.s   $f16, $f10, $f2
/* 00114 80A59D44 E4F00000 */  swc1    $f16, 0x0000($a3)          ## 00000000
/* 00118 80A59D48 C4B20004 */  lwc1    $f18, 0x0004($a1)          ## 00000004
/* 0011C 80A59D4C 46029102 */  mul.s   $f4, $f18, $f2
/* 00120 80A59D50 E4E40004 */  swc1    $f4, 0x0004($a3)           ## 00000004
/* 00124 80A59D54 C4A60008 */  lwc1    $f6, 0x0008($a1)           ## 00000008
/* 00128 80A59D58 46023202 */  mul.s   $f8, $f6, $f2
/* 0012C 80A59D5C E4E80008 */  swc1    $f8, 0x0008($a3)           ## 00000008
.L80A59D60:
/* 00130 80A59D60 8FBF0014 */  lw      $ra, 0x0014($sp)
/* 00134 80A59D64 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 00138 80A59D68 03E00008 */  jr      $ra
/* 0013C 80A59D6C 00000000 */  nop
