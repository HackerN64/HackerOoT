.late_rodata
.late_rodata_alignment 8
glabel jtbl_8099C758
    .word L80999558
    .word L80999548
    .word L80999538
    .word L80999538
    .word L80999538
    .word L80999568
    .word L80999538
    .word L80999538
    .word L80999538
    .word L80999538
    .word L80999538
    .word L80999538
    .word L80999538

.text
glabel func_80999508
/* 00D88 80999508 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 00D8C 8099950C AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 00D90 80999510 848E001C */  lh      $t6, 0x001C($a0)           ## 0000001C
/* 00D94 80999514 25CF0002 */  addiu   $t7, $t6, 0x0002           ## $t7 = 00000002
/* 00D98 80999518 2DE1000D */  sltiu   $at, $t7, 0x000D           
/* 00D9C 8099951C 10200014 */  beq     $at, $zero, .L80999570     
/* 00DA0 80999520 000F7880 */  sll     $t7, $t7,  2               
/* 00DA4 80999524 3C01809A */  lui     $at, %hi(jtbl_8099C758)       ## $at = 809A0000
/* 00DA8 80999528 002F0821 */  addu    $at, $at, $t7              
/* 00DAC 8099952C 8C2FC758 */  lw      $t7, %lo(jtbl_8099C758)($at)  
/* 00DB0 80999530 01E00008 */  jr      $t7                        
/* 00DB4 80999534 00000000 */  nop
glabel L80999538
/* 00DB8 80999538 0C266263 */  jal     func_8099898C              
/* 00DBC 8099953C 00000000 */  nop
/* 00DC0 80999540 1000000C */  beq     $zero, $zero, .L80999574   
/* 00DC4 80999544 8FBF0014 */  lw      $ra, 0x0014($sp)           
glabel L80999548
/* 00DC8 80999548 0C266324 */  jal     func_80998C90              
/* 00DCC 8099954C 00000000 */  nop
/* 00DD0 80999550 10000008 */  beq     $zero, $zero, .L80999574   
/* 00DD4 80999554 8FBF0014 */  lw      $ra, 0x0014($sp)           
glabel L80999558
/* 00DD8 80999558 0C266397 */  jal     func_80998E5C              
/* 00DDC 8099955C 00000000 */  nop
/* 00DE0 80999560 10000004 */  beq     $zero, $zero, .L80999574   
/* 00DE4 80999564 8FBF0014 */  lw      $ra, 0x0014($sp)           
glabel L80999568
/* 00DE8 80999568 0C2663FD */  jal     func_80998FF4              
/* 00DEC 8099956C 00000000 */  nop
.L80999570:
/* 00DF0 80999570 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L80999574:
/* 00DF4 80999574 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 00DF8 80999578 03E00008 */  jr      $ra                        
/* 00DFC 8099957C 00000000 */  nop
