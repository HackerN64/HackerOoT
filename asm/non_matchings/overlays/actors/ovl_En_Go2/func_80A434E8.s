.late_rodata
.late_rodata_alignment 4
glabel jtbl_80A48654
    .word L80A43550
    .word L80A43530
    .word L80A43518
    .word L80A43528
    .word L80A43520
    .word L80A43558
    .word L80A43558
    .word L80A43540
    .word L80A43558
    .word L80A43538
    .word L80A43548

.text
glabel func_80A434E8
/* 007B8 80A434E8 848E001C */  lh      $t6, 0x001C($a0)           ## 0000001C
/* 007BC 80A434EC 31CFFC00 */  andi    $t7, $t6, 0xFC00           ## $t7 = 00000000
/* 007C0 80A434F0 000FC283 */  sra     $t8, $t7, 10               
/* 007C4 80A434F4 2719FFFF */  addiu   $t9, $t8, 0xFFFF           ## $t9 = FFFFFFFF
/* 007C8 80A434F8 2F21000B */  sltiu   $at, $t9, 0x000B           
/* 007CC 80A434FC 10200016 */  beq     $at, $zero, .L80A43558     
/* 007D0 80A43500 0019C880 */  sll     $t9, $t9,  2               
/* 007D4 80A43504 3C0180A5 */  lui     $at, %hi(jtbl_80A48654)       ## $at = 80A50000
/* 007D8 80A43508 00390821 */  addu    $at, $at, $t9              
/* 007DC 80A4350C 8C398654 */  lw      $t9, %lo(jtbl_80A48654)($at)  
/* 007E0 80A43510 03200008 */  jr      $t9                        
/* 007E4 80A43514 00000000 */  nop
glabel L80A43518
/* 007E8 80A43518 03E00008 */  jr      $ra                        
/* 007EC 80A4351C 24023069 */  addiu   $v0, $zero, 0x3069         ## $v0 = 00003069
glabel L80A43520
/* 007F0 80A43520 03E00008 */  jr      $ra                        
/* 007F4 80A43524 2402306A */  addiu   $v0, $zero, 0x306A         ## $v0 = 0000306A
glabel L80A43528
/* 007F8 80A43528 03E00008 */  jr      $ra                        
/* 007FC 80A4352C 2402306B */  addiu   $v0, $zero, 0x306B         ## $v0 = 0000306B
glabel L80A43530
/* 00800 80A43530 03E00008 */  jr      $ra                        
/* 00804 80A43534 2402306C */  addiu   $v0, $zero, 0x306C         ## $v0 = 0000306C
glabel L80A43538
/* 00808 80A43538 03E00008 */  jr      $ra                        
/* 0080C 80A4353C 2402306D */  addiu   $v0, $zero, 0x306D         ## $v0 = 0000306D
glabel L80A43540
/* 00810 80A43540 03E00008 */  jr      $ra                        
/* 00814 80A43544 2402306E */  addiu   $v0, $zero, 0x306E         ## $v0 = 0000306E
glabel L80A43548
/* 00818 80A43548 03E00008 */  jr      $ra                        
/* 0081C 80A4354C 2402306F */  addiu   $v0, $zero, 0x306F         ## $v0 = 0000306F
glabel L80A43550
/* 00820 80A43550 03E00008 */  jr      $ra                        
/* 00824 80A43554 24023070 */  addiu   $v0, $zero, 0x3070         ## $v0 = 00003070
glabel L80A43558
.L80A43558:
/* 00828 80A43558 24023052 */  addiu   $v0, $zero, 0x3052         ## $v0 = 00003052
/* 0082C 80A4355C 03E00008 */  jr      $ra                        
/* 00830 80A43560 00000000 */  nop
