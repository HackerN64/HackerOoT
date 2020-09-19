.rdata
glabel D_809AC640
    .asciz "../z_eff_ss_stick.c"
    .balign 4

glabel D_809AC654
    .asciz "../z_eff_ss_stick.c"
    .balign 4

glabel D_809AC668
    .asciz "../z_eff_ss_stick.c"
    .balign 4

.late_rodata
glabel D_809AC67C
    .float 0.01

glabel D_809AC680
    .float 0.0025

glabel D_809AC684
    .float 0.01

.text
glabel func_809AC42C
/* 0015C 809AC42C 27BDFFB0 */  addiu   $sp, $sp, 0xFFB0           ## $sp = FFFFFFB0
/* 00160 809AC430 AFB10018 */  sw      $s1, 0x0018($sp)
/* 00164 809AC434 AFBF001C */  sw      $ra, 0x001C($sp)
/* 00168 809AC438 AFB00014 */  sw      $s0, 0x0014($sp)
/* 0016C 809AC43C AFA40050 */  sw      $a0, 0x0050($sp)
/* 00170 809AC440 AFA50054 */  sw      $a1, 0x0054($sp)
/* 00174 809AC444 8C900000 */  lw      $s0, 0x0000($a0)           ## 00000000
/* 00178 809AC448 00C08825 */  or      $s1, $a2, $zero            ## $s1 = 00000000
/* 0017C 809AC44C 3C06809B */  lui     $a2, %hi(D_809AC640)       ## $a2 = 809B0000
/* 00180 809AC450 24C6C640 */  addiu   $a2, $a2, %lo(D_809AC640)  ## $a2 = 809AC640
/* 00184 809AC454 27A40034 */  addiu   $a0, $sp, 0x0034           ## $a0 = FFFFFFE4
/* 00188 809AC458 24070099 */  addiu   $a3, $zero, 0x0099         ## $a3 = 00000099
/* 0018C 809AC45C 0C031AB1 */  jal     Graph_OpenDisps
/* 00190 809AC460 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 00194 809AC464 C62C0000 */  lwc1    $f12, 0x0000($s1)          ## 00000000
/* 00198 809AC468 C62E0004 */  lwc1    $f14, 0x0004($s1)          ## 00000004
/* 0019C 809AC46C 8E260008 */  lw      $a2, 0x0008($s1)           ## 00000008
/* 001A0 809AC470 0C034261 */  jal     Matrix_Translate
/* 001A4 809AC474 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 001A8 809AC478 3C0F8016 */  lui     $t7, %hi(gSaveContext+4)
/* 001AC 809AC47C 8DEFE664 */  lw      $t7, %lo(gSaveContext+4)($t7)
/* 001B0 809AC480 3C01809B */  lui     $at, %hi(D_809AC684)       ## $at = 809B0000
/* 001B4 809AC484 11E0000F */  beq     $t7, $zero, .L809AC4C4
/* 001B8 809AC488 00000000 */  nop
/* 001BC 809AC48C 3C01809B */  lui     $at, %hi(D_809AC67C)       ## $at = 809B0000
/* 001C0 809AC490 C42CC67C */  lwc1    $f12, %lo(D_809AC67C)($at)
/* 001C4 809AC494 3C01809B */  lui     $at, %hi(D_809AC680)       ## $at = 809B0000
/* 001C8 809AC498 C42EC680 */  lwc1    $f14, %lo(D_809AC680)($at)
/* 001CC 809AC49C 44066000 */  mfc1    $a2, $f12
/* 001D0 809AC4A0 0C0342A3 */  jal     Matrix_Scale
/* 001D4 809AC4A4 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 001D8 809AC4A8 00002025 */  or      $a0, $zero, $zero          ## $a0 = 00000000
/* 001DC 809AC4AC 86250042 */  lh      $a1, 0x0042($s1)           ## 00000042
/* 001E0 809AC4B0 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 001E4 809AC4B4 0C034421 */  jal     Matrix_RotateRPY
/* 001E8 809AC4B8 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 001EC 809AC4BC 10000017 */  beq     $zero, $zero, .L809AC51C
/* 001F0 809AC4C0 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
.L809AC4C4:
/* 001F4 809AC4C4 C42CC684 */  lwc1    $f12, %lo(D_809AC684)($at)
/* 001F8 809AC4C8 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 001FC 809AC4CC 44066000 */  mfc1    $a2, $f12
/* 00200 809AC4D0 0C0342A3 */  jal     Matrix_Scale
/* 00204 809AC4D4 46006386 */  mov.s   $f14, $f12
/* 00208 809AC4D8 8FB80050 */  lw      $t8, 0x0050($sp)
/* 0020C 809AC4DC 00002025 */  or      $a0, $zero, $zero          ## $a0 = 00000000
/* 00210 809AC4E0 86250042 */  lh      $a1, 0x0042($s1)           ## 00000042
/* 00214 809AC4E4 8F06009C */  lw      $a2, 0x009C($t8)           ## 0000009C
/* 00218 809AC4E8 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 0021C 809AC4EC 00C00821 */  addu    $at, $a2, $zero
/* 00220 809AC4F0 00063080 */  sll     $a2, $a2,  2
/* 00224 809AC4F4 00C13021 */  addu    $a2, $a2, $at
/* 00228 809AC4F8 000630C0 */  sll     $a2, $a2,  3
/* 0022C 809AC4FC 00C13023 */  subu    $a2, $a2, $at
/* 00230 809AC500 00063100 */  sll     $a2, $a2,  4
/* 00234 809AC504 00C13021 */  addu    $a2, $a2, $at
/* 00238 809AC508 00063100 */  sll     $a2, $a2,  4
/* 0023C 809AC50C 00063400 */  sll     $a2, $a2, 16
/* 00240 809AC510 0C034421 */  jal     Matrix_RotateRPY
/* 00244 809AC514 00063403 */  sra     $a2, $a2, 16
/* 00248 809AC518 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
.L809AC51C:
/* 0024C 809AC51C 3C08DA38 */  lui     $t0, 0xDA38                ## $t0 = DA380000
/* 00250 809AC520 35080003 */  ori     $t0, $t0, 0x0003           ## $t0 = DA380003
/* 00254 809AC524 24590008 */  addiu   $t9, $v0, 0x0008           ## $t9 = 00000008
/* 00258 809AC528 AE1902C0 */  sw      $t9, 0x02C0($s0)           ## 000002C0
/* 0025C 809AC52C 3C05809B */  lui     $a1, %hi(D_809AC654)       ## $a1 = 809B0000
/* 00260 809AC530 AC480000 */  sw      $t0, 0x0000($v0)           ## 00000000
/* 00264 809AC534 24A5C654 */  addiu   $a1, $a1, %lo(D_809AC654)  ## $a1 = 809AC654
/* 00268 809AC538 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0026C 809AC53C 240600B0 */  addiu   $a2, $zero, 0x00B0         ## $a2 = 000000B0
/* 00270 809AC540 0C0346A2 */  jal     Matrix_NewMtx
/* 00274 809AC544 AFA20030 */  sw      $v0, 0x0030($sp)
/* 00278 809AC548 8FA30030 */  lw      $v1, 0x0030($sp)
/* 0027C 809AC54C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00280 809AC550 0C024F46 */  jal     func_80093D18
/* 00284 809AC554 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 00288 809AC558 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 0028C 809AC55C 3C0ADB06 */  lui     $t2, 0xDB06                ## $t2 = DB060000
/* 00290 809AC560 354A0018 */  ori     $t2, $t2, 0x0018           ## $t2 = DB060018
/* 00294 809AC564 24490008 */  addiu   $t1, $v0, 0x0008           ## $t1 = 00000008
/* 00298 809AC568 AE0902C0 */  sw      $t1, 0x02C0($s0)           ## 000002C0
/* 0029C 809AC56C AC4A0000 */  sw      $t2, 0x0000($v0)           ## 00000000
/* 002A0 809AC570 862C0040 */  lh      $t4, 0x0040($s1)           ## 00000040
/* 002A4 809AC574 8FAB0050 */  lw      $t3, 0x0050($sp)
/* 002A8 809AC578 3C0F0001 */  lui     $t7, 0x0001                ## $t7 = 00010000
/* 002AC 809AC57C 000C6900 */  sll     $t5, $t4,  4
/* 002B0 809AC580 01AC6821 */  addu    $t5, $t5, $t4
/* 002B4 809AC584 000D6880 */  sll     $t5, $t5,  2
/* 002B8 809AC588 016D7021 */  addu    $t6, $t3, $t5
/* 002BC 809AC58C 01EE7821 */  addu    $t7, $t7, $t6
/* 002C0 809AC590 8DEF17B4 */  lw      $t7, 0x17B4($t7)           ## 000117B4
/* 002C4 809AC594 3C19DB06 */  lui     $t9, 0xDB06                ## $t9 = DB060000
/* 002C8 809AC598 3C088012 */  lui     $t0, %hi(gCullBackDList)
/* 002CC 809AC59C AC4F0004 */  sw      $t7, 0x0004($v0)           ## 00000004
/* 002D0 809AC5A0 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 002D4 809AC5A4 25085F98 */  addiu   $t0, %lo(gCullBackDList)
/* 002D8 809AC5A8 37390030 */  ori     $t9, $t9, 0x0030           ## $t9 = DB060030
/* 002DC 809AC5AC 24580008 */  addiu   $t8, $v0, 0x0008           ## $t8 = 00000008
/* 002E0 809AC5B0 AE1802C0 */  sw      $t8, 0x02C0($s0)           ## 000002C0
/* 002E4 809AC5B4 AC480004 */  sw      $t0, 0x0004($v0)           ## 00000004
/* 002E8 809AC5B8 AC590000 */  sw      $t9, 0x0000($v0)           ## 00000000
/* 002EC 809AC5BC 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 002F0 809AC5C0 3C0ADE00 */  lui     $t2, 0xDE00                ## $t2 = DE000000
/* 002F4 809AC5C4 3C06809B */  lui     $a2, %hi(D_809AC668)       ## $a2 = 809B0000
/* 002F8 809AC5C8 24490008 */  addiu   $t1, $v0, 0x0008           ## $t1 = 00000008
/* 002FC 809AC5CC AE0902C0 */  sw      $t1, 0x02C0($s0)           ## 000002C0
/* 00300 809AC5D0 AC4A0000 */  sw      $t2, 0x0000($v0)           ## 00000000
/* 00304 809AC5D4 8E2C0038 */  lw      $t4, 0x0038($s1)           ## 00000038
/* 00308 809AC5D8 24C6C668 */  addiu   $a2, $a2, %lo(D_809AC668)  ## $a2 = 809AC668
/* 0030C 809AC5DC 27A40034 */  addiu   $a0, $sp, 0x0034           ## $a0 = FFFFFFE4
/* 00310 809AC5E0 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 00314 809AC5E4 240700BC */  addiu   $a3, $zero, 0x00BC         ## $a3 = 000000BC
/* 00318 809AC5E8 0C031AD5 */  jal     Graph_CloseDisps
/* 0031C 809AC5EC AC4C0004 */  sw      $t4, 0x0004($v0)           ## 00000004
/* 00320 809AC5F0 8FBF001C */  lw      $ra, 0x001C($sp)
/* 00324 809AC5F4 8FB00014 */  lw      $s0, 0x0014($sp)
/* 00328 809AC5F8 8FB10018 */  lw      $s1, 0x0018($sp)
/* 0032C 809AC5FC 03E00008 */  jr      $ra
/* 00330 809AC600 27BD0050 */  addiu   $sp, $sp, 0x0050           ## $sp = 00000000
