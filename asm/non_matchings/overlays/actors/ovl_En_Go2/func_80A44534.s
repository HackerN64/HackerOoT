.late_rodata
glabel jtbl_80A48680
    .word L80A44590
    .word L80A445A0
    .word L80A445B0
    .word L80A445C0
    .word L80A445D0
    .word L80A445E0
    .word L80A445F0
    .word L80A44600
    .word L80A44610
    .word L80A44620
    .word L80A44630
    .word L80A44640
    .word L80A44650
    .word L80A44660

.text
glabel func_80A44534
/* 01804 80A44534 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 01808 80A44538 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 0180C 80A4453C 00A03025 */  or      $a2, $a1, $zero            ## $a2 = 00000000
/* 01810 80A44540 AFA6001C */  sw      $a2, 0x001C($sp)           
/* 01814 80A44544 24050020 */  addiu   $a1, $zero, 0x0020         ## $a1 = 00000020
/* 01818 80A44548 0C01B0D8 */  jal     Text_GetFaceReaction              
/* 0181C 80A4454C AFA40018 */  sw      $a0, 0x0018($sp)           
/* 01820 80A44550 8FA40018 */  lw      $a0, 0x0018($sp)           
/* 01824 80A44554 8FA6001C */  lw      $a2, 0x001C($sp)           
/* 01828 80A44558 10400003 */  beq     $v0, $zero, .L80A44568     
/* 0182C 80A4455C 3043FFFF */  andi    $v1, $v0, 0xFFFF           ## $v1 = 00000000
/* 01830 80A44560 10000041 */  beq     $zero, $zero, .L80A44668   
/* 01834 80A44564 00601025 */  or      $v0, $v1, $zero            ## $v0 = 00000000
.L80A44568:
/* 01838 80A44568 84CE001C */  lh      $t6, 0x001C($a2)           ## 0000001C
/* 0183C 80A4456C 31CF001F */  andi    $t7, $t6, 0x001F           ## $t7 = 00000000
/* 01840 80A44570 2DE1000E */  sltiu   $at, $t7, 0x000E           
/* 01844 80A44574 1020003C */  beq     $at, $zero, .L80A44668     
/* 01848 80A44578 000F7880 */  sll     $t7, $t7,  2               
/* 0184C 80A4457C 3C0180A5 */  lui     $at, %hi(jtbl_80A48680)       ## $at = 80A50000
/* 01850 80A44580 002F0821 */  addu    $at, $at, $t7              
/* 01854 80A44584 8C2F8680 */  lw      $t7, %lo(jtbl_80A48680)($at)  
/* 01858 80A44588 01E00008 */  jr      $t7                        
/* 0185C 80A4458C 00000000 */  nop
glabel L80A44590
/* 01860 80A44590 0C290D59 */  jal     func_80A43564              
/* 01864 80A44594 00C02825 */  or      $a1, $a2, $zero            ## $a1 = 00000000
/* 01868 80A44598 10000034 */  beq     $zero, $zero, .L80A4466C   
/* 0186C 80A4459C 8FBF0014 */  lw      $ra, 0x0014($sp)           
glabel L80A445A0
/* 01870 80A445A0 0C290F27 */  jal     func_80A43C9C              
/* 01874 80A445A4 00C02825 */  or      $a1, $a2, $zero            ## $a1 = 00000000
/* 01878 80A445A8 10000030 */  beq     $zero, $zero, .L80A4466C   
/* 0187C 80A445AC 8FBF0014 */  lw      $ra, 0x0014($sp)           
glabel L80A445B0
/* 01880 80A445B0 0C290FE4 */  jal     func_80A43F90              
/* 01884 80A445B4 00C02825 */  or      $a1, $a2, $zero            ## $a1 = 00000000
/* 01888 80A445B8 1000002C */  beq     $zero, $zero, .L80A4466C   
/* 0188C 80A445BC 8FBF0014 */  lw      $ra, 0x0014($sp)           
glabel L80A445C0
/* 01890 80A445C0 0C291089 */  jal     func_80A44224              
/* 01894 80A445C4 00C02825 */  or      $a1, $a2, $zero            ## $a1 = 00000000
/* 01898 80A445C8 10000028 */  beq     $zero, $zero, .L80A4466C   
/* 0189C 80A445CC 8FBF0014 */  lw      $ra, 0x0014($sp)           
glabel L80A445D0
/* 018A0 80A445D0 0C290DB7 */  jal     func_80A436DC              
/* 018A4 80A445D4 00C02825 */  or      $a1, $a2, $zero            ## $a1 = 00000000
/* 018A8 80A445D8 10000024 */  beq     $zero, $zero, .L80A4466C   
/* 018AC 80A445DC 8FBF0014 */  lw      $ra, 0x0014($sp)           
glabel L80A445E0
/* 018B0 80A445E0 0C290E09 */  jal     func_80A43824              
/* 018B4 80A445E4 00C02825 */  or      $a1, $a2, $zero            ## $a1 = 00000000
/* 018B8 80A445E8 10000020 */  beq     $zero, $zero, .L80A4466C   
/* 018BC 80A445EC 8FBF0014 */  lw      $ra, 0x0014($sp)           
glabel L80A445F0
/* 018C0 80A445F0 0C290E2D */  jal     func_80A438B4              
/* 018C4 80A445F4 00C02825 */  or      $a1, $a2, $zero            ## $a1 = 00000000
/* 018C8 80A445F8 1000001C */  beq     $zero, $zero, .L80A4466C   
/* 018CC 80A445FC 8FBF0014 */  lw      $ra, 0x0014($sp)           
glabel L80A44600
/* 018D0 80A44600 0C290E6B */  jal     func_80A439AC              
/* 018D4 80A44604 00C02825 */  or      $a1, $a2, $zero            ## $a1 = 00000000
/* 018D8 80A44608 10000018 */  beq     $zero, $zero, .L80A4466C   
/* 018DC 80A4460C 8FBF0014 */  lw      $ra, 0x0014($sp)           
glabel L80A44610
/* 018E0 80A44610 0C290EA2 */  jal     func_80A43A88              
/* 018E4 80A44614 00C02825 */  or      $a1, $a2, $zero            ## $a1 = 00000000
/* 018E8 80A44618 10000014 */  beq     $zero, $zero, .L80A4466C   
/* 018EC 80A4461C 8FBF0014 */  lw      $ra, 0x0014($sp)           
glabel L80A44620
/* 018F0 80A44620 0C290ED9 */  jal     func_80A43B64              
/* 018F4 80A44624 00C02825 */  or      $a1, $a2, $zero            ## $a1 = 00000000
/* 018F8 80A44628 10000010 */  beq     $zero, $zero, .L80A4466C   
/* 018FC 80A4462C 8FBF0014 */  lw      $ra, 0x0014($sp)           
glabel L80A44630
/* 01900 80A44630 0C2910BC */  jal     func_80A442F0              
/* 01904 80A44634 00C02825 */  or      $a1, $a2, $zero            ## $a1 = 00000000
/* 01908 80A44638 1000000C */  beq     $zero, $zero, .L80A4466C   
/* 0190C 80A4463C 8FBF0014 */  lw      $ra, 0x0014($sp)           
glabel L80A44640
/* 01910 80A44640 0C2910F8 */  jal     func_80A443E0              
/* 01914 80A44644 00C02825 */  or      $a1, $a2, $zero            ## $a1 = 00000000
/* 01918 80A44648 10000008 */  beq     $zero, $zero, .L80A4466C   
/* 0191C 80A4464C 8FBF0014 */  lw      $ra, 0x0014($sp)           
glabel L80A44650
/* 01920 80A44650 0C29112A */  jal     func_80A444A8              
/* 01924 80A44654 00C02825 */  or      $a1, $a2, $zero            ## $a1 = 00000000
/* 01928 80A44658 10000004 */  beq     $zero, $zero, .L80A4466C   
/* 0192C 80A4465C 8FBF0014 */  lw      $ra, 0x0014($sp)           
glabel L80A44660
/* 01930 80A44660 0C2910E6 */  jal     func_80A44398              
/* 01934 80A44664 00C02825 */  or      $a1, $a2, $zero            ## $a1 = 00000000
.L80A44668:
/* 01938 80A44668 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L80A4466C:
/* 0193C 80A4466C 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 01940 80A44670 03E00008 */  jr      $ra                        
/* 01944 80A44674 00000000 */  nop
