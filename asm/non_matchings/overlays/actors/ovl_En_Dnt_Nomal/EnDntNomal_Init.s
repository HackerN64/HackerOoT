.rdata
glabel D_809F5EB0
    .asciz "\n\n"
    .balign 4

glabel D_809F5EB4
    .asciz "\x1b[32m☆☆☆☆☆ デグナッツ的当て ☆☆☆☆☆ \n\x1b[m"
    .balign 4

glabel D_809F5EE8
    .asciz "\n\n"
    .balign 4

glabel D_809F5EEC
    .asciz "\x1b[32m☆☆☆☆☆ デグナッツお面品評会一般人 ☆☆☆☆☆ \n\x1b[m"
    .balign 4

glabel D_809F5F28
    .asciz "\x1b[35m なにみの？ %d\n\x1b[m\n"
    .balign 4

glabel D_809F5F44
    .asciz "\x1b[36m バンクおかしいしぞ！%d\n\x1b[m\n"
    .balign 4

.text
glabel EnDntNomal_Init
/* 00000 809F32C0 27BDFFD0 */  addiu   $sp, $sp, 0xFFD0           ## $sp = FFFFFFD0
/* 00004 809F32C4 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 00008 809F32C8 AFB00018 */  sw      $s0, 0x0018($sp)           
/* 0000C 809F32CC AFA50034 */  sw      $a1, 0x0034($sp)           
/* 00010 809F32D0 848E001C */  lh      $t6, 0x001C($a0)           ## 0000001C
/* 00014 809F32D4 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00018 809F32D8 2401FFFE */  addiu   $at, $zero, 0xFFFE         ## $at = FFFFFFFE
/* 0001C 809F32DC A48E026A */  sh      $t6, 0x026A($a0)           ## 0000026A
/* 00020 809F32E0 8482026A */  lh      $v0, 0x026A($a0)           ## 0000026A
/* 00024 809F32E4 241900FF */  addiu   $t9, $zero, 0x00FF         ## $t9 = 000000FF
/* 00028 809F32E8 2408FFFF */  addiu   $t0, $zero, 0xFFFF         ## $t0 = FFFFFFFF
/* 0002C 809F32EC 04430004 */  bgezl   $v0, .L809F3300            
/* 00030 809F32F0 8E0F0004 */  lw      $t7, 0x0004($s0)           ## 00000004
/* 00034 809F32F4 A480026A */  sh      $zero, 0x026A($a0)         ## 0000026A
/* 00038 809F32F8 8482026A */  lh      $v0, 0x026A($a0)           ## 0000026A
/* 0003C 809F32FC 8E0F0004 */  lw      $t7, 0x0004($s0)           ## 00000004
.L809F3300:
/* 00040 809F3300 A21900AE */  sb      $t9, 0x00AE($s0)           ## 000000AE
/* 00044 809F3304 A6080266 */  sh      $t0, 0x0266($s0)           ## 00000266
/* 00048 809F3308 01E1C024 */  and     $t8, $t7, $at              
/* 0004C 809F330C 14400017 */  bne     $v0, $zero, .L809F336C     
/* 00050 809F3310 AE180004 */  sw      $t8, 0x0004($s0)           ## 00000004
/* 00054 809F3314 3C04809F */  lui     $a0, %hi(D_809F5EB0)       ## $a0 = 809F0000
/* 00058 809F3318 0C00084C */  jal     osSyncPrintf
              
/* 0005C 809F331C 24845EB0 */  addiu   $a0, $a0, %lo(D_809F5EB0)  ## $a0 = 809F5EB0
/* 00060 809F3320 3C04809F */  lui     $a0, %hi(D_809F5EB4)       ## $a0 = 809F0000
/* 00064 809F3324 0C00084C */  jal     osSyncPrintf
              
/* 00068 809F3328 24845EB4 */  addiu   $a0, $a0, %lo(D_809F5EB4)  ## $a0 = 809F5EB4
/* 0006C 809F332C 26050294 */  addiu   $a1, $s0, 0x0294           ## $a1 = 00000294
/* 00070 809F3330 AFA50020 */  sw      $a1, 0x0020($sp)           
/* 00074 809F3334 0C017406 */  jal     Collider_InitQuad              
/* 00078 809F3338 8FA40034 */  lw      $a0, 0x0034($sp)           
/* 0007C 809F333C 3C07809F */  lui     $a3, %hi(D_809F5DFC)       ## $a3 = 809F0000
/* 00080 809F3340 8FA50020 */  lw      $a1, 0x0020($sp)           
/* 00084 809F3344 24E75DFC */  addiu   $a3, $a3, %lo(D_809F5DFC)  ## $a3 = 809F5DFC
/* 00088 809F3348 8FA40034 */  lw      $a0, 0x0034($sp)           
/* 0008C 809F334C 0C017441 */  jal     Collider_SetQuad              
/* 00090 809F3350 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 00094 809F3354 8603008A */  lh      $v1, 0x008A($s0)           ## 0000008A
/* 00098 809F3358 24090164 */  addiu   $t1, $zero, 0x0164         ## $t1 = 00000164
/* 0009C 809F335C A6090266 */  sh      $t1, 0x0266($s0)           ## 00000266
/* 000A0 809F3360 A60300B6 */  sh      $v1, 0x00B6($s0)           ## 000000B6
/* 000A4 809F3364 10000013 */  beq     $zero, $zero, .L809F33B4   
/* 000A8 809F3368 A6030032 */  sh      $v1, 0x0032($s0)           ## 00000032
.L809F336C:
/* 000AC 809F336C 3C04809F */  lui     $a0, %hi(D_809F5EE8)       ## $a0 = 809F0000
/* 000B0 809F3370 0C00084C */  jal     osSyncPrintf
              
/* 000B4 809F3374 24845EE8 */  addiu   $a0, $a0, %lo(D_809F5EE8)  ## $a0 = 809F5EE8
/* 000B8 809F3378 3C04809F */  lui     $a0, %hi(D_809F5EEC)       ## $a0 = 809F0000
/* 000BC 809F337C 0C00084C */  jal     osSyncPrintf
              
/* 000C0 809F3380 24845EEC */  addiu   $a0, $a0, %lo(D_809F5EEC)  ## $a0 = 809F5EEC
/* 000C4 809F3384 26050314 */  addiu   $a1, $s0, 0x0314           ## $a1 = 00000314
/* 000C8 809F3388 AFA50020 */  sw      $a1, 0x0020($sp)           
/* 000CC 809F338C 0C0170D9 */  jal     Collider_InitCylinder
              
/* 000D0 809F3390 8FA40034 */  lw      $a0, 0x0034($sp)           
/* 000D4 809F3394 3C07809F */  lui     $a3, %hi(D_809F5DD0)       ## $a3 = 809F0000
/* 000D8 809F3398 8FA50020 */  lw      $a1, 0x0020($sp)           
/* 000DC 809F339C 24E75DD0 */  addiu   $a3, $a3, %lo(D_809F5DD0)  ## $a3 = 809F5DD0
/* 000E0 809F33A0 8FA40034 */  lw      $a0, 0x0034($sp)           
/* 000E4 809F33A4 0C01712B */  jal     Collider_SetCylinder
              
/* 000E8 809F33A8 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 000EC 809F33AC 240A0172 */  addiu   $t2, $zero, 0x0172         ## $t2 = 00000172
/* 000F0 809F33B0 A60A0266 */  sh      $t2, 0x0266($s0)           ## 00000266
.L809F33B4:
/* 000F4 809F33B4 86050266 */  lh      $a1, 0x0266($s0)           ## 00000266
/* 000F8 809F33B8 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 000FC 809F33BC 342117A4 */  ori     $at, $at, 0x17A4           ## $at = 000117A4
/* 00100 809F33C0 04A00013 */  bltz    $a1, .L809F3410            
/* 00104 809F33C4 8FA40034 */  lw      $a0, 0x0034($sp)           
/* 00108 809F33C8 0C02604B */  jal     Object_GetIndex
              ## ObjectIndex
/* 0010C 809F33CC 00812021 */  addu    $a0, $a0, $at              
/* 00110 809F33D0 A2020279 */  sb      $v0, 0x0279($s0)           ## 00000279
/* 00114 809F33D4 820B0279 */  lb      $t3, 0x0279($s0)           ## 00000279
/* 00118 809F33D8 0561000F */  bgez    $t3, .L809F3418            
/* 0011C 809F33DC 00000000 */  nop
/* 00120 809F33E0 0C00B55C */  jal     Actor_Kill
              
/* 00124 809F33E4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00128 809F33E8 3C04809F */  lui     $a0, %hi(D_809F5F28)       ## $a0 = 809F0000
/* 0012C 809F33EC 24845F28 */  addiu   $a0, $a0, %lo(D_809F5F28)  ## $a0 = 809F5F28
/* 00130 809F33F0 0C00084C */  jal     osSyncPrintf
              
/* 00134 809F33F4 82050279 */  lb      $a1, 0x0279($s0)           ## 00000279
/* 00138 809F33F8 3C04809F */  lui     $a0, %hi(D_809F5F44)       ## $a0 = 809F0000
/* 0013C 809F33FC 24845F44 */  addiu   $a0, $a0, %lo(D_809F5F44)  ## $a0 = 809F5F44
/* 00140 809F3400 0C00084C */  jal     osSyncPrintf
              
/* 00144 809F3404 8605001C */  lh      $a1, 0x001C($s0)           ## 0000001C
/* 00148 809F3408 10000007 */  beq     $zero, $zero, .L809F3428   
/* 0014C 809F340C 8FBF001C */  lw      $ra, 0x001C($sp)           
.L809F3410:
/* 00150 809F3410 0C00B55C */  jal     Actor_Kill
              
/* 00154 809F3414 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
.L809F3418:
/* 00158 809F3418 3C0C809F */  lui     $t4, %hi(func_809F3480)    ## $t4 = 809F0000
/* 0015C 809F341C 258C3480 */  addiu   $t4, $t4, %lo(func_809F3480) ## $t4 = 809F3480
/* 00160 809F3420 AE0C0214 */  sw      $t4, 0x0214($s0)           ## 00000214
/* 00164 809F3424 8FBF001C */  lw      $ra, 0x001C($sp)           
.L809F3428:
/* 00168 809F3428 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 0016C 809F342C 27BD0030 */  addiu   $sp, $sp, 0x0030           ## $sp = 00000000
/* 00170 809F3430 03E00008 */  jr      $ra                        
/* 00174 809F3434 00000000 */  nop
