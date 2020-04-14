.rdata
glabel D_809E55A8
    .asciz "../z_en_daiku_kakariko.c"
    .balign 4

glabel D_809E55C4
    .asciz "../z_en_daiku_kakariko.c"
    .balign 4

.text
glabel func_809E5288
/* 00F68 809E5288 27BDFFC8 */  addiu   $sp, $sp, 0xFFC8           ## $sp = FFFFFFC8
/* 00F6C 809E528C AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 00F70 809E5290 AFA40038 */  sw      $a0, 0x0038($sp)           
/* 00F74 809E5294 AFA5003C */  sw      $a1, 0x003C($sp)           
/* 00F78 809E5298 AFA60040 */  sw      $a2, 0x0040($sp)           
/* 00F7C 809E529C AFA70044 */  sw      $a3, 0x0044($sp)           
/* 00F80 809E52A0 8C850000 */  lw      $a1, 0x0000($a0)           ## 00000000
/* 00F84 809E52A4 3C06809E */  lui     $a2, %hi(D_809E55A8)       ## $a2 = 809E0000
/* 00F88 809E52A8 24C655A8 */  addiu   $a2, $a2, %lo(D_809E55A8)  ## $a2 = 809E55A8
/* 00F8C 809E52AC 27A40020 */  addiu   $a0, $sp, 0x0020           ## $a0 = FFFFFFE8
/* 00F90 809E52B0 24070450 */  addiu   $a3, $zero, 0x0450         ## $a3 = 00000450
/* 00F94 809E52B4 0C031AB1 */  jal     Graph_OpenDisps              
/* 00F98 809E52B8 AFA50030 */  sw      $a1, 0x0030($sp)           
/* 00F9C 809E52BC 8FAF003C */  lw      $t7, 0x003C($sp)           
/* 00FA0 809E52C0 2401000F */  addiu   $at, $zero, 0x000F         ## $at = 0000000F
/* 00FA4 809E52C4 3C04809E */  lui     $a0, %hi(D_809E5590)       ## $a0 = 809E0000
/* 00FA8 809E52C8 15E10012 */  bne     $t7, $at, .L809E5314       
/* 00FAC 809E52CC 8FA50048 */  lw      $a1, 0x0048($sp)           
/* 00FB0 809E52D0 24845590 */  addiu   $a0, $a0, %lo(D_809E5590)  ## $a0 = 809E5590
/* 00FB4 809E52D4 0C0346BD */  jal     Matrix_MultVec3f              
/* 00FB8 809E52D8 24A50038 */  addiu   $a1, $a1, 0x0038           ## $a1 = 00000038
/* 00FBC 809E52DC 8FA40030 */  lw      $a0, 0x0030($sp)           
/* 00FC0 809E52E0 3C19DE00 */  lui     $t9, 0xDE00                ## $t9 = DE000000
/* 00FC4 809E52E4 3C0C809E */  lui     $t4, %hi(D_809E5580)       ## $t4 = 809E0000
/* 00FC8 809E52E8 8C8302C0 */  lw      $v1, 0x02C0($a0)           ## 000002C0
/* 00FCC 809E52EC 24780008 */  addiu   $t8, $v1, 0x0008           ## $t8 = 00000008
/* 00FD0 809E52F0 AC9802C0 */  sw      $t8, 0x02C0($a0)           ## 000002C0
/* 00FD4 809E52F4 AC790000 */  sw      $t9, 0x0000($v1)           ## 00000000
/* 00FD8 809E52F8 8FA80048 */  lw      $t0, 0x0048($sp)           
/* 00FDC 809E52FC 8509001C */  lh      $t1, 0x001C($t0)           ## 0000001C
/* 00FE0 809E5300 312A0003 */  andi    $t2, $t1, 0x0003           ## $t2 = 00000000
/* 00FE4 809E5304 000A5880 */  sll     $t3, $t2,  2               
/* 00FE8 809E5308 018B6021 */  addu    $t4, $t4, $t3              
/* 00FEC 809E530C 8D8C5580 */  lw      $t4, %lo(D_809E5580)($t4)  
/* 00FF0 809E5310 AC6C0004 */  sw      $t4, 0x0004($v1)           ## 00000004
.L809E5314:
/* 00FF4 809E5314 8FAD0038 */  lw      $t5, 0x0038($sp)           
/* 00FF8 809E5318 3C06809E */  lui     $a2, %hi(D_809E55C4)       ## $a2 = 809E0000
/* 00FFC 809E531C 24C655C4 */  addiu   $a2, $a2, %lo(D_809E55C4)  ## $a2 = 809E55C4
/* 01000 809E5320 27A40020 */  addiu   $a0, $sp, 0x0020           ## $a0 = FFFFFFE8
/* 01004 809E5324 24070459 */  addiu   $a3, $zero, 0x0459         ## $a3 = 00000459
/* 01008 809E5328 0C031AD5 */  jal     Graph_CloseDisps              
/* 0100C 809E532C 8DA50000 */  lw      $a1, 0x0000($t5)           ## 00000000
/* 01010 809E5330 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 01014 809E5334 27BD0038 */  addiu   $sp, $sp, 0x0038           ## $sp = 00000000
/* 01018 809E5338 03E00008 */  jr      $ra                        
/* 0101C 809E533C 00000000 */  nop
