glabel EnHorseGameCheck_Init
/* 00DC0 80A68310 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 00DC4 80A68314 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 00DC8 80A68318 84AE00A4 */  lh      $t6, 0x00A4($a1)           ## 000000A4
/* 00DCC 80A6831C 00803025 */  or      $a2, $a0, $zero            ## $a2 = 00000000
/* 00DD0 80A68320 24010063 */  addiu   $at, $zero, 0x0063         ## $at = 00000063
/* 00DD4 80A68324 15C1000D */  bne     $t6, $at, .L80A6835C       
/* 00DD8 80A68328 24040018 */  addiu   $a0, $zero, 0x0018         ## $a0 = 00000018
/* 00DDC 80A6832C AFA5001C */  sw      $a1, 0x001C($sp)           
/* 00DE0 80A68330 0C00D6D3 */  jal     Flags_GetEventChkInf
              
/* 00DE4 80A68334 AFA60018 */  sw      $a2, 0x0018($sp)           
/* 00DE8 80A68338 8FA5001C */  lw      $a1, 0x001C($sp)           
/* 00DEC 80A6833C 14400005 */  bne     $v0, $zero, .L80A68354     
/* 00DF0 80A68340 8FA60018 */  lw      $a2, 0x0018($sp)           
/* 00DF4 80A68344 3C0F8016 */  lui     $t7, %hi(gGameInfo)
/* 00DF8 80A68348 8DEFFA90 */  lw      $t7, %lo(gGameInfo)($t7)
/* 00DFC 80A6834C 85F80556 */  lh      $t8, 0x0556($t7)           ## 80160556
/* 00E00 80A68350 13000002 */  beq     $t8, $zero, .L80A6835C     
.L80A68354:
/* 00E04 80A68354 24190004 */  addiu   $t9, $zero, 0x0004         ## $t9 = 00000004
/* 00E08 80A68358 A4D9001C */  sh      $t9, 0x001C($a2)           ## 0000001C
.L80A6835C:
/* 00E0C 80A6835C 84C8001C */  lh      $t0, 0x001C($a2)           ## 0000001C
/* 00E10 80A68360 3C0280A7 */  lui     $v0, %hi(D_80A684F0)       ## $v0 = 80A70000
/* 00E14 80A68364 00084880 */  sll     $t1, $t0,  2               
/* 00E18 80A68368 00491021 */  addu    $v0, $v0, $t1              
/* 00E1C 80A6836C 8C4284F0 */  lw      $v0, %lo(D_80A684F0)($v0)  
/* 00E20 80A68370 50400004 */  beql    $v0, $zero, .L80A68384     
/* 00E24 80A68374 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 00E28 80A68378 0040F809 */  jalr    $ra, $v0                   
/* 00E2C 80A6837C 00C02025 */  or      $a0, $a2, $zero            ## $a0 = 00000000
/* 00E30 80A68380 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L80A68384:
/* 00E34 80A68384 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 00E38 80A68388 03E00008 */  jr      $ra                        
/* 00E3C 80A6838C 00000000 */  nop
