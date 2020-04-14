.late_rodata
glabel D_80A7E048
    .float 0.001

glabel D_80A7E04C
 .word 0x3851B717
glabel D_80A7E050
    .float 0.3

glabel D_80A7E054
    .float 0.04

glabel D_80A7E058
    .float 0.02

.text
glabel func_80A7D26C
/* 0144C 80A7D26C 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 01450 80A7D270 AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 01454 80A7D274 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 01458 80A7D278 AFA5002C */  sw      $a1, 0x002C($sp)           
/* 0145C 80A7D27C 848E00B4 */  lh      $t6, 0x00B4($a0)           ## 000000B4
/* 01460 80A7D280 849800B6 */  lh      $t8, 0x00B6($a0)           ## 000000B6
/* 01464 80A7D284 3C0180A8 */  lui     $at, %hi(D_80A7E048)       ## $at = 80A80000
/* 01468 80A7D288 C42CE048 */  lwc1    $f12, %lo(D_80A7E048)($at) 
/* 0146C 80A7D28C 25CFFE0C */  addiu   $t7, $t6, 0xFE0C           ## $t7 = FFFFFE0C
/* 01470 80A7D290 271900C8 */  addiu   $t9, $t8, 0x00C8           ## $t9 = 000000C8
/* 01474 80A7D294 A48F00B4 */  sh      $t7, 0x00B4($a0)           ## 000000B4
/* 01478 80A7D298 A49900B6 */  sh      $t9, 0x00B6($a0)           ## 000000B6
/* 0147C 80A7D29C 3C0180A8 */  lui     $at, %hi(D_80A7E04C)       ## $at = 80A80000
/* 01480 80A7D2A0 C426E04C */  lwc1    $f6, %lo(D_80A7E04C)($at)  
/* 01484 80A7D2A4 C4840050 */  lwc1    $f4, 0x0050($a0)           ## 00000050
/* 01488 80A7D2A8 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 0148C 80A7D2AC 46062001 */  sub.s   $f0, $f4, $f6              
/* 01490 80A7D2B0 460C003C */  c.lt.s  $f0, $f12                  
/* 01494 80A7D2B4 00000000 */  nop
/* 01498 80A7D2B8 45020004 */  bc1fl   .L80A7D2CC                 
/* 0149C 80A7D2BC 46000086 */  mov.s   $f2, $f0                   
/* 014A0 80A7D2C0 10000002 */  beq     $zero, $zero, .L80A7D2CC   
/* 014A4 80A7D2C4 46006086 */  mov.s   $f2, $f12                  
/* 014A8 80A7D2C8 46000086 */  mov.s   $f2, $f0                   
.L80A7D2CC:
/* 014AC 80A7D2CC 44051000 */  mfc1    $a1, $f2                   
/* 014B0 80A7D2D0 0C00B58B */  jal     Actor_SetScale
              
/* 014B4 80A7D2D4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 014B8 80A7D2D8 3C0140A0 */  lui     $at, 0x40A0                ## $at = 40A00000
/* 014BC 80A7D2DC 44814000 */  mtc1    $at, $f8                   ## $f8 = 5.00
/* 014C0 80A7D2E0 C6000084 */  lwc1    $f0, 0x0084($s0)           ## 00000084
/* 014C4 80A7D2E4 3C0141F0 */  lui     $at, 0x41F0                ## $at = 41F00000
/* 014C8 80A7D2E8 4600403C */  c.lt.s  $f8, $f0                   
/* 014CC 80A7D2EC 00000000 */  nop
/* 014D0 80A7D2F0 45020021 */  bc1fl   .L80A7D378                 
/* 014D4 80A7D2F4 8608031A */  lh      $t0, 0x031A($s0)           ## 0000031A
/* 014D8 80A7D2F8 44815000 */  mtc1    $at, $f10                  ## $f10 = 30.00
/* 014DC 80A7D2FC 00000000 */  nop
/* 014E0 80A7D300 460A003C */  c.lt.s  $f0, $f10                  
/* 014E4 80A7D304 00000000 */  nop
/* 014E8 80A7D308 4502001B */  bc1fl   .L80A7D378                 
/* 014EC 80A7D30C 8608031A */  lh      $t0, 0x031A($s0)           ## 0000031A
/* 014F0 80A7D310 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 014F4 80A7D314 00000000 */  nop
/* 014F8 80A7D318 3C0180A8 */  lui     $at, %hi(D_80A7E050)       ## $at = 80A80000
/* 014FC 80A7D31C C430E050 */  lwc1    $f16, %lo(D_80A7E050)($at) 
/* 01500 80A7D320 4610003C */  c.lt.s  $f0, $f16                  
/* 01504 80A7D324 00000000 */  nop
/* 01508 80A7D328 45020013 */  bc1fl   .L80A7D378                 
/* 0150C 80A7D32C 8608031A */  lh      $t0, 0x031A($s0)           ## 0000031A
/* 01510 80A7D330 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 01514 80A7D334 00000000 */  nop
/* 01518 80A7D338 3C0140A0 */  lui     $at, 0x40A0                ## $at = 40A00000
/* 0151C 80A7D33C 44811000 */  mtc1    $at, $f2                   ## $f2 = 5.00
/* 01520 80A7D340 3C0180A8 */  lui     $at, %hi(D_80A7E054)       ## $at = 80A80000
/* 01524 80A7D344 C432E054 */  lwc1    $f18, %lo(D_80A7E054)($at) 
/* 01528 80A7D348 3C0180A8 */  lui     $at, %hi(D_80A7E058)       ## $at = 80A80000
/* 0152C 80A7D34C C426E058 */  lwc1    $f6, %lo(D_80A7E058)($at)  
/* 01530 80A7D350 46120102 */  mul.s   $f4, $f0, $f18             
/* 01534 80A7D354 44071000 */  mfc1    $a3, $f2                   
/* 01538 80A7D358 8FA4002C */  lw      $a0, 0x002C($sp)           
/* 0153C 80A7D35C 26050024 */  addiu   $a1, $s0, 0x0024           ## $a1 = 00000024
/* 01540 80A7D360 3C06C0A0 */  lui     $a2, 0xC0A0                ## $a2 = C0A00000
/* 01544 80A7D364 E7A20010 */  swc1    $f2, 0x0010($sp)           
/* 01548 80A7D368 46062200 */  add.s   $f8, $f4, $f6              
/* 0154C 80A7D36C 0C00A4F9 */  jal     func_800293E4              
/* 01550 80A7D370 E7A80014 */  swc1    $f8, 0x0014($sp)           
/* 01554 80A7D374 8608031A */  lh      $t0, 0x031A($s0)           ## 0000031A
.L80A7D378:
/* 01558 80A7D378 5D000004 */  bgtzl   $t0, .L80A7D38C            
/* 0155C 80A7D37C 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 01560 80A7D380 0C00B55C */  jal     Actor_Kill
              
/* 01564 80A7D384 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01568 80A7D388 8FBF0024 */  lw      $ra, 0x0024($sp)           
.L80A7D38C:
/* 0156C 80A7D38C 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 01570 80A7D390 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
/* 01574 80A7D394 03E00008 */  jr      $ra                        
/* 01578 80A7D398 00000000 */  nop
