.rdata
glabel D_809E4190
    .asciz "../z_en_daiku.c"
    .balign 4

glabel D_809E41A0
    .asciz "../z_en_daiku.c"
    .balign 4

.text
glabel func_809E3F7C
/* 0144C 809E3F7C 27BDFFC8 */  addiu   $sp, $sp, 0xFFC8           ## $sp = FFFFFFC8
/* 01450 809E3F80 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 01454 809E3F84 AFA40038 */  sw      $a0, 0x0038($sp)           
/* 01458 809E3F88 AFA5003C */  sw      $a1, 0x003C($sp)           
/* 0145C 809E3F8C AFA60040 */  sw      $a2, 0x0040($sp)           
/* 01460 809E3F90 AFA70044 */  sw      $a3, 0x0044($sp)           
/* 01464 809E3F94 8C850000 */  lw      $a1, 0x0000($a0)           ## 00000000
/* 01468 809E3F98 3C06809E */  lui     $a2, %hi(D_809E4190)       ## $a2 = 809E0000
/* 0146C 809E3F9C 24C64190 */  addiu   $a2, $a2, %lo(D_809E4190)  ## $a2 = 809E4190
/* 01470 809E3FA0 27A40020 */  addiu   $a0, $sp, 0x0020           ## $a0 = FFFFFFE8
/* 01474 809E3FA4 2407052B */  addiu   $a3, $zero, 0x052B         ## $a3 = 0000052B
/* 01478 809E3FA8 0C031AB1 */  jal     Graph_OpenDisps              
/* 0147C 809E3FAC AFA50030 */  sw      $a1, 0x0030($sp)           
/* 01480 809E3FB0 8FAF003C */  lw      $t7, 0x003C($sp)           
/* 01484 809E3FB4 2401000F */  addiu   $at, $zero, 0x000F         ## $at = 0000000F
/* 01488 809E3FB8 3C04809E */  lui     $a0, %hi(D_809E4164)       ## $a0 = 809E0000
/* 0148C 809E3FBC 15E10012 */  bne     $t7, $at, .L809E4008       
/* 01490 809E3FC0 8FA50048 */  lw      $a1, 0x0048($sp)           
/* 01494 809E3FC4 24844164 */  addiu   $a0, $a0, %lo(D_809E4164)  ## $a0 = 809E4164
/* 01498 809E3FC8 0C0346BD */  jal     Matrix_MultVec3f              
/* 0149C 809E3FCC 24A50038 */  addiu   $a1, $a1, 0x0038           ## $a1 = 00000038
/* 014A0 809E3FD0 8FA40030 */  lw      $a0, 0x0030($sp)           
/* 014A4 809E3FD4 3C19DE00 */  lui     $t9, 0xDE00                ## $t9 = DE000000
/* 014A8 809E3FD8 3C0C809E */  lui     $t4, %hi(D_809E4154)       ## $t4 = 809E0000
/* 014AC 809E3FDC 8C8302C0 */  lw      $v1, 0x02C0($a0)           ## 000002C0
/* 014B0 809E3FE0 24780008 */  addiu   $t8, $v1, 0x0008           ## $t8 = 00000008
/* 014B4 809E3FE4 AC9802C0 */  sw      $t8, 0x02C0($a0)           ## 000002C0
/* 014B8 809E3FE8 AC790000 */  sw      $t9, 0x0000($v1)           ## 00000000
/* 014BC 809E3FEC 8FA80048 */  lw      $t0, 0x0048($sp)           
/* 014C0 809E3FF0 8509001C */  lh      $t1, 0x001C($t0)           ## 0000001C
/* 014C4 809E3FF4 312A0003 */  andi    $t2, $t1, 0x0003           ## $t2 = 00000000
/* 014C8 809E3FF8 000A5880 */  sll     $t3, $t2,  2               
/* 014CC 809E3FFC 018B6021 */  addu    $t4, $t4, $t3              
/* 014D0 809E4000 8D8C4154 */  lw      $t4, %lo(D_809E4154)($t4)  
/* 014D4 809E4004 AC6C0004 */  sw      $t4, 0x0004($v1)           ## 00000004
.L809E4008:
/* 014D8 809E4008 8FAD0038 */  lw      $t5, 0x0038($sp)           
/* 014DC 809E400C 3C06809E */  lui     $a2, %hi(D_809E41A0)       ## $a2 = 809E0000
/* 014E0 809E4010 24C641A0 */  addiu   $a2, $a2, %lo(D_809E41A0)  ## $a2 = 809E41A0
/* 014E4 809E4014 27A40020 */  addiu   $a0, $sp, 0x0020           ## $a0 = FFFFFFE8
/* 014E8 809E4018 24070532 */  addiu   $a3, $zero, 0x0532         ## $a3 = 00000532
/* 014EC 809E401C 0C031AD5 */  jal     Graph_CloseDisps              
/* 014F0 809E4020 8DA50000 */  lw      $a1, 0x0000($t5)           ## 00000000
/* 014F4 809E4024 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 014F8 809E4028 27BD0038 */  addiu   $sp, $sp, 0x0038           ## $sp = 00000000
/* 014FC 809E402C 03E00008 */  jr      $ra                        
/* 01500 809E4030 00000000 */  nop
/* 01504 809E4034 00000000 */  nop
/* 01508 809E4038 00000000 */  nop
/* 0150C 809E403C 00000000 */  nop
