.rdata
glabel D_80B5A69C
    .asciz "En_Zl3_inFinal_Check_DemoMode:そんな動作は無い!!!!!!!!\n"
    .balign 4

.late_rodata
glabel jtbl_80B5AB08
.word L80B55490
.word L80B554A0
.word L80B55510
.word L80B554BC
.word L80B554CC
.word L80B554DC
.word L80B554EC
.word L80B554FC
.word L80B55520

.text
glabel func_80B55444
/* 02094 80B55444 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 02098 80B55448 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 0209C 80B5544C AFB00018 */  sw      $s0, 0x0018($sp)           
/* 020A0 80B55450 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 020A4 80B55454 0C2D4E5B */  jal     func_80B5396C              
/* 020A8 80B55458 AFA5002C */  sw      $a1, 0x002C($sp)           
/* 020AC 80B5545C 04400037 */  bltz    $v0, .L80B5553C            
/* 020B0 80B55460 AFA20024 */  sw      $v0, 0x0024($sp)           
/* 020B4 80B55464 8E0302F0 */  lw      $v1, 0x02F0($s0)           ## 000002F0
/* 020B8 80B55468 2C410009 */  sltiu   $at, $v0, 0x0009           
/* 020BC 80B5546C 50430034 */  beql    $v0, $v1, .L80B55540       
/* 020C0 80B55470 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 020C4 80B55474 1020002C */  beq     $at, $zero, .L80B55528     
/* 020C8 80B55478 00027080 */  sll     $t6, $v0,  2               
/* 020CC 80B5547C 3C0180B6 */  lui     $at, %hi(jtbl_80B5AB08)       ## $at = 80B60000
/* 020D0 80B55480 002E0821 */  addu    $at, $at, $t6              
/* 020D4 80B55484 8C2EAB08 */  lw      $t6, %lo(jtbl_80B5AB08)($at)  
/* 020D8 80B55488 01C00008 */  jr      $t6                        
/* 020DC 80B5548C 00000000 */  nop
glabel L80B55490
/* 020E0 80B55490 0C2D5478 */  jal     func_80B551E0              
/* 020E4 80B55494 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 020E8 80B55498 10000027 */  beq     $zero, $zero, .L80B55538   
/* 020EC 80B5549C 8FB80024 */  lw      $t8, 0x0024($sp)           
glabel L80B554A0
/* 020F0 80B554A0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 020F4 80B554A4 0C2D4D55 */  jal     func_80B53554              
/* 020F8 80B554A8 24050003 */  addiu   $a1, $zero, 0x0003         ## $a1 = 00000003
/* 020FC 80B554AC 0C2D53BD */  jal     func_80B54EF4              
/* 02100 80B554B0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 02104 80B554B4 10000020 */  beq     $zero, $zero, .L80B55538   
/* 02108 80B554B8 8FB80024 */  lw      $t8, 0x0024($sp)           
glabel L80B554BC
/* 0210C 80B554BC 0C2D5488 */  jal     func_80B55220              
/* 02110 80B554C0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 02114 80B554C4 1000001C */  beq     $zero, $zero, .L80B55538   
/* 02118 80B554C8 8FB80024 */  lw      $t8, 0x0024($sp)           
glabel L80B554CC
/* 0211C 80B554CC 0C2D549A */  jal     func_80B55268              
/* 02120 80B554D0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 02124 80B554D4 10000018 */  beq     $zero, $zero, .L80B55538   
/* 02128 80B554D8 8FB80024 */  lw      $t8, 0x0024($sp)           
glabel L80B554DC
/* 0212C 80B554DC 0C2D54B7 */  jal     func_80B552DC              
/* 02130 80B554E0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 02134 80B554E4 10000014 */  beq     $zero, $zero, .L80B55538   
/* 02138 80B554E8 8FB80024 */  lw      $t8, 0x0024($sp)           
glabel L80B554EC
/* 0213C 80B554EC 0C2D54DA */  jal     func_80B55368              
/* 02140 80B554F0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 02144 80B554F4 10000010 */  beq     $zero, $zero, .L80B55538   
/* 02148 80B554F8 8FB80024 */  lw      $t8, 0x0024($sp)           
glabel L80B554FC
/* 0214C 80B554FC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 02150 80B55500 0C2D54FA */  jal     func_80B553E8              
/* 02154 80B55504 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 02158 80B55508 1000000B */  beq     $zero, $zero, .L80B55538   
/* 0215C 80B5550C 8FB80024 */  lw      $t8, 0x0024($sp)           
glabel L80B55510
/* 02160 80B55510 0C2D5502 */  jal     func_80B55408              
/* 02164 80B55514 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 02168 80B55518 10000007 */  beq     $zero, $zero, .L80B55538   
/* 0216C 80B5551C 8FB80024 */  lw      $t8, 0x0024($sp)           
glabel L80B55520
/* 02170 80B55520 240F0001 */  addiu   $t7, $zero, 0x0001         ## $t7 = 00000001
/* 02174 80B55524 AE0F0328 */  sw      $t7, 0x0328($s0)           ## 00000328
.L80B55528:
/* 02178 80B55528 3C0480B6 */  lui     $a0, %hi(D_80B5A69C)       ## $a0 = 80B60000
/* 0217C 80B5552C 0C00084C */  jal     osSyncPrintf
              
/* 02180 80B55530 2484A69C */  addiu   $a0, $a0, %lo(D_80B5A69C)  ## $a0 = 80B5A69C
/* 02184 80B55534 8FB80024 */  lw      $t8, 0x0024($sp)           
.L80B55538:
/* 02188 80B55538 AE1802F0 */  sw      $t8, 0x02F0($s0)           ## 000002F0
.L80B5553C:
/* 0218C 80B5553C 8FBF001C */  lw      $ra, 0x001C($sp)           
.L80B55540:
/* 02190 80B55540 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 02194 80B55544 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
/* 02198 80B55548 03E00008 */  jr      $ra                        
/* 0219C 80B5554C 00000000 */  nop
