.rdata
glabel D_809B2340
    .asciz "\n\n"
    .balign 4

glabel D_809B2344
    .asciz "\x1b[33m☆☆☆☆☆ アヌビス発生 ☆☆☆☆☆ \n\x1b[m"
    .balign 4

.late_rodata
glabel D_809B241C
    .float -4230.0

.text
glabel EnAnubice_Init
/* 00184 809B12A4 27BDFFC8 */  addiu   $sp, $sp, 0xFFC8           ## $sp = FFFFFFC8
/* 00188 809B12A8 AFB00028 */  sw      $s0, 0x0028($sp)           
/* 0018C 809B12AC 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00190 809B12B0 AFBF002C */  sw      $ra, 0x002C($sp)           
/* 00194 809B12B4 AFA5003C */  sw      $a1, 0x003C($sp)           
/* 00198 809B12B8 3C068003 */  lui     $a2, %hi(ActorShadow_DrawCircle)
/* 0019C 809B12BC 24C6B5EC */  addiu   $a2, %lo(ActorShadow_DrawCircle)
/* 001A0 809B12C0 24050000 */  addiu   $a1, $zero, 0x0000         ## $a1 = 00000000
/* 001A4 809B12C4 248400B4 */  addiu   $a0, $a0, 0x00B4           ## $a0 = 000000B4
/* 001A8 809B12C8 0C00AC78 */  jal     ActorShape_Init
              
/* 001AC 809B12CC 3C0741A0 */  lui     $a3, 0x41A0                ## $a3 = 41A00000
/* 001B0 809B12D0 3C060600 */  lui     $a2, %hi(D_06003990)                ## $a2 = 06000000
/* 001B4 809B12D4 3C070600 */  lui     $a3, %hi(D_06000F74)                ## $a3 = 06000000
/* 001B8 809B12D8 260E0190 */  addiu   $t6, $s0, 0x0190           ## $t6 = 00000190
/* 001BC 809B12DC 260F01F0 */  addiu   $t7, $s0, 0x01F0           ## $t7 = 000001F0
/* 001C0 809B12E0 24180010 */  addiu   $t8, $zero, 0x0010         ## $t8 = 00000010
/* 001C4 809B12E4 AFB80018 */  sw      $t8, 0x0018($sp)           
/* 001C8 809B12E8 AFAF0014 */  sw      $t7, 0x0014($sp)           
/* 001CC 809B12EC AFAE0010 */  sw      $t6, 0x0010($sp)           
/* 001D0 809B12F0 24E70F74 */  addiu   $a3, $a3, %lo(D_06000F74)           ## $a3 = 06000F74
/* 001D4 809B12F4 24C63990 */  addiu   $a2, $a2, %lo(D_06003990)           ## $a2 = 06003990
/* 001D8 809B12F8 8FA4003C */  lw      $a0, 0x003C($sp)           
/* 001DC 809B12FC 0C02915F */  jal     SkelAnime_Init
              
/* 001E0 809B1300 2605014C */  addiu   $a1, $s0, 0x014C           ## $a1 = 0000014C
/* 001E4 809B1304 3C04809B */  lui     $a0, %hi(D_809B2340)       ## $a0 = 809B0000
/* 001E8 809B1308 0C00084C */  jal     osSyncPrintf
              
/* 001EC 809B130C 24842340 */  addiu   $a0, $a0, %lo(D_809B2340)  ## $a0 = 809B2340
/* 001F0 809B1310 3C04809B */  lui     $a0, %hi(D_809B2344)       ## $a0 = 809B0000
/* 001F4 809B1314 0C00084C */  jal     osSyncPrintf
              
/* 001F8 809B1318 24842344 */  addiu   $a0, $a0, %lo(D_809B2344)  ## $a0 = 809B2344
/* 001FC 809B131C 2419003A */  addiu   $t9, $zero, 0x003A         ## $t9 = 0000003A
/* 00200 809B1320 A2190117 */  sb      $t9, 0x0117($s0)           ## 00000117
/* 00204 809B1324 260502C8 */  addiu   $a1, $s0, 0x02C8           ## $a1 = 000002C8
/* 00208 809B1328 AFA50030 */  sw      $a1, 0x0030($sp)           
/* 0020C 809B132C 0C0170D9 */  jal     Collider_InitCylinder
              
/* 00210 809B1330 8FA4003C */  lw      $a0, 0x003C($sp)           
/* 00214 809B1334 3C07809B */  lui     $a3, %hi(D_809B22D0)       ## $a3 = 809B0000
/* 00218 809B1338 8FA50030 */  lw      $a1, 0x0030($sp)           
/* 0021C 809B133C 24E722D0 */  addiu   $a3, $a3, %lo(D_809B22D0)  ## $a3 = 809B22D0
/* 00220 809B1340 8FA4003C */  lw      $a0, 0x003C($sp)           
/* 00224 809B1344 0C01712B */  jal     Collider_SetCylinder
              
/* 00228 809B1348 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 0022C 809B134C 3C053C75 */  lui     $a1, 0x3C75                ## $a1 = 3C750000
/* 00230 809B1350 34A5C28F */  ori     $a1, $a1, 0xC28F           ## $a1 = 3C75C28F
/* 00234 809B1354 0C00B58B */  jal     Actor_SetScale
              
/* 00238 809B1358 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0023C 809B135C 3C08809B */  lui     $t0, %hi(D_809B22FC)       ## $t0 = 809B0000
/* 00240 809B1360 250822FC */  addiu   $t0, $t0, %lo(D_809B22FC)  ## $t0 = 809B22FC
/* 00244 809B1364 240900FF */  addiu   $t1, $zero, 0x00FF         ## $t1 = 000000FF
/* 00248 809B1368 AE080098 */  sw      $t0, 0x0098($s0)           ## 00000098
/* 0024C 809B136C A20900AE */  sb      $t1, 0x00AE($s0)           ## 000000AE
/* 00250 809B1370 3C01809B */  lui     $at, %hi(D_809B241C)       ## $at = 809B0000
/* 00254 809B1374 C424241C */  lwc1    $f4, %lo(D_809B241C)($at)  
/* 00258 809B1378 8E0D0024 */  lw      $t5, 0x0024($s0)           ## 00000024
/* 0025C 809B137C 8E0A0004 */  lw      $t2, 0x0004($s0)           ## 00000004
/* 00260 809B1380 44803000 */  mtc1    $zero, $f6                 ## $f6 = 0.00
/* 00264 809B1384 AE0D0298 */  sw      $t5, 0x0298($s0)           ## 00000298
/* 00268 809B1388 8E0D002C */  lw      $t5, 0x002C($s0)           ## 0000002C
/* 0026C 809B138C 8E0C0028 */  lw      $t4, 0x0028($s0)           ## 00000028
/* 00270 809B1390 2401FFFE */  addiu   $at, $zero, 0xFFFE         ## $at = FFFFFFFE
/* 00274 809B1394 3C0F809B */  lui     $t7, %hi(func_809B142C)    ## $t7 = 809B0000
/* 00278 809B1398 240E0003 */  addiu   $t6, $zero, 0x0003         ## $t6 = 00000003
/* 0027C 809B139C 25EF142C */  addiu   $t7, $t7, %lo(func_809B142C) ## $t7 = 809B142C
/* 00280 809B13A0 01415824 */  and     $t3, $t2, $at              
/* 00284 809B13A4 AE0B0004 */  sw      $t3, 0x0004($s0)           ## 00000004
/* 00288 809B13A8 A20E001F */  sb      $t6, 0x001F($s0)           ## 0000001F
/* 0028C 809B13AC AE0F0250 */  sw      $t7, 0x0250($s0)           ## 00000250
/* 00290 809B13B0 E60400BC */  swc1    $f4, 0x00BC($s0)           ## 000000BC
/* 00294 809B13B4 E606027C */  swc1    $f6, 0x027C($s0)           ## 0000027C
/* 00298 809B13B8 AE0D02A0 */  sw      $t5, 0x02A0($s0)           ## 000002A0
/* 0029C 809B13BC AE0C029C */  sw      $t4, 0x029C($s0)           ## 0000029C
/* 002A0 809B13C0 8FBF002C */  lw      $ra, 0x002C($sp)           
/* 002A4 809B13C4 8FB00028 */  lw      $s0, 0x0028($sp)           
/* 002A8 809B13C8 27BD0038 */  addiu   $sp, $sp, 0x0038           ## $sp = 00000000
/* 002AC 809B13CC 03E00008 */  jr      $ra                        
/* 002B0 809B13D0 00000000 */  nop
