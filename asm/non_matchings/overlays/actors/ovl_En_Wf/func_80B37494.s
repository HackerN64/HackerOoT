.late_rodata
glabel jtbl_80B37BD4
.late_rodata_alignment 4
.word L80B375C0
.word L80B375A0
.word L80B37598
.word L80B375C4
.word L80B375A8
.word L80B375B8
.word L80B375C4
.word L80B37590
.word L80B375C4
.word L80B37580
.word L80B375C4
.word L80B375C4
.word L80B375C4
.word L80B37578
.word L80B375C4
.word L80B37588
.word L80B375C4
.word L80B375C4
.word L80B375C4
.word L80B375C4
.word L80B375C4
.word L80B375C4
.word L80B375C4
.word L80B375C4
.word L80B375C4
.word L80B375C4
.word L80B375C4
.word L80B375C4
.word L80B375C4
.word L80B375C4
.word L80B375C4
.word L80B375C4
.word L80B375B0

.text
glabel func_80B37494
/* 037E4 80B37494 27BDFFC8 */  addiu   $sp, $sp, 0xFFC8           ## $sp = FFFFFFC8
/* 037E8 80B37498 AFA60040 */  sw      $a2, 0x0040($sp)           
/* 037EC 80B3749C 8FA60048 */  lw      $a2, 0x0048($sp)           
/* 037F0 80B374A0 AFA40038 */  sw      $a0, 0x0038($sp)           
/* 037F4 80B374A4 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 037F8 80B374A8 AFA5003C */  sw      $a1, 0x003C($sp)           
/* 037FC 80B374AC 2403FFFF */  addiu   $v1, $zero, 0xFFFF         ## $v1 = FFFFFFFF
/* 03800 80B374B0 00A02025 */  or      $a0, $a1, $zero            ## $a0 = 00000000
/* 03804 80B374B4 AFA70044 */  sw      $a3, 0x0044($sp)           
/* 03808 80B374B8 AFA30030 */  sw      $v1, 0x0030($sp)           
/* 0380C 80B374BC 0C018A29 */  jal     Collider_UpdateSpheres              
/* 03810 80B374C0 24C50304 */  addiu   $a1, $a2, 0x0304           ## $a1 = 00000304
/* 03814 80B374C4 8FAE003C */  lw      $t6, 0x003C($sp)           
/* 03818 80B374C8 24010006 */  addiu   $at, $zero, 0x0006         ## $at = 00000006
/* 0381C 80B374CC 8FA30030 */  lw      $v1, 0x0030($sp)           
/* 03820 80B374D0 15C10017 */  bne     $t6, $at, .L80B37530       
/* 03824 80B374D4 8FA60048 */  lw      $a2, 0x0048($sp)           
/* 03828 80B374D8 3C0480B3 */  lui     $a0, %hi(D_80B37ADC)       ## $a0 = 80B30000
/* 0382C 80B374DC 24847ADC */  addiu   $a0, $a0, %lo(D_80B37ADC)  ## $a0 = 80B37ADC
/* 03830 80B374E0 27A50024 */  addiu   $a1, $sp, 0x0024           ## $a1 = FFFFFFEC
/* 03834 80B374E4 0C0346BD */  jal     Matrix_MultVec3f              
/* 03838 80B374E8 AFA30030 */  sw      $v1, 0x0030($sp)           
/* 0383C 80B374EC C7A40024 */  lwc1    $f4, 0x0024($sp)           
/* 03840 80B374F0 8FA60048 */  lw      $a2, 0x0048($sp)           
/* 03844 80B374F4 8FA30030 */  lw      $v1, 0x0030($sp)           
/* 03848 80B374F8 4600218D */  trunc.w.s $f6, $f4                   
/* 0384C 80B374FC 44183000 */  mfc1    $t8, $f6                   
/* 03850 80B37500 00000000 */  nop
/* 03854 80B37504 A4D804B6 */  sh      $t8, 0x04B6($a2)           ## 000004B6
/* 03858 80B37508 C7A80028 */  lwc1    $f8, 0x0028($sp)           
/* 0385C 80B3750C 4600428D */  trunc.w.s $f10, $f8                  
/* 03860 80B37510 44085000 */  mfc1    $t0, $f10                  
/* 03864 80B37514 00000000 */  nop
/* 03868 80B37518 A4C804B8 */  sh      $t0, 0x04B8($a2)           ## 000004B8
/* 0386C 80B3751C C7B0002C */  lwc1    $f16, 0x002C($sp)          
/* 03870 80B37520 4600848D */  trunc.w.s $f18, $f16                 
/* 03874 80B37524 440A9000 */  mfc1    $t2, $f18                  
/* 03878 80B37528 00000000 */  nop
/* 0387C 80B3752C A4CA04BA */  sh      $t2, 0x04BA($a2)           ## 000004BA
.L80B37530:
/* 03880 80B37530 84CB02E4 */  lh      $t3, 0x02E4($a2)           ## 000002E4
/* 03884 80B37534 8FAF003C */  lw      $t7, 0x003C($sp)           
/* 03888 80B37538 15600007 */  bne     $t3, $zero, .L80B37558     
/* 0388C 80B3753C 25F8FFFB */  addiu   $t8, $t7, 0xFFFB           ## $t8 = FFFFFFFB
/* 03890 80B37540 90CC0114 */  lbu     $t4, 0x0114($a2)           ## 00000114
/* 03894 80B37544 5180003A */  beql    $t4, $zero, .L80B37630     
/* 03898 80B37548 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 0389C 80B3754C 94CD0112 */  lhu     $t5, 0x0112($a2)           ## 00000112
/* 038A0 80B37550 31AE4000 */  andi    $t6, $t5, 0x4000           ## $t6 = 00000000
/* 038A4 80B37554 11C00035 */  beq     $t6, $zero, .L80B3762C     
.L80B37558:
/* 038A8 80B37558 2F010021 */  sltiu   $at, $t8, 0x0021           
/* 038AC 80B3755C 10200019 */  beq     $at, $zero, .L80B375C4     
/* 038B0 80B37560 0018C080 */  sll     $t8, $t8,  2               
/* 038B4 80B37564 3C0180B3 */  lui     $at, %hi(jtbl_80B37BD4)       ## $at = 80B30000
/* 038B8 80B37568 00380821 */  addu    $at, $at, $t8              
/* 038BC 80B3756C 8C387BD4 */  lw      $t8, %lo(jtbl_80B37BD4)($at)  
/* 038C0 80B37570 03000008 */  jr      $t8                        
/* 038C4 80B37574 00000000 */  nop
glabel L80B37578
/* 038C8 80B37578 10000012 */  beq     $zero, $zero, .L80B375C4   
/* 038CC 80B3757C 00001825 */  or      $v1, $zero, $zero          ## $v1 = 00000000
glabel L80B37580
/* 038D0 80B37580 10000010 */  beq     $zero, $zero, .L80B375C4   
/* 038D4 80B37584 24030001 */  addiu   $v1, $zero, 0x0001         ## $v1 = 00000001
glabel L80B37588
/* 038D8 80B37588 1000000E */  beq     $zero, $zero, .L80B375C4   
/* 038DC 80B3758C 24030002 */  addiu   $v1, $zero, 0x0002         ## $v1 = 00000002
glabel L80B37590
/* 038E0 80B37590 1000000C */  beq     $zero, $zero, .L80B375C4   
/* 038E4 80B37594 24030003 */  addiu   $v1, $zero, 0x0003         ## $v1 = 00000003
glabel L80B37598
/* 038E8 80B37598 1000000A */  beq     $zero, $zero, .L80B375C4   
/* 038EC 80B3759C 24030004 */  addiu   $v1, $zero, 0x0004         ## $v1 = 00000004
glabel L80B375A0
/* 038F0 80B375A0 10000008 */  beq     $zero, $zero, .L80B375C4   
/* 038F4 80B375A4 24030005 */  addiu   $v1, $zero, 0x0005         ## $v1 = 00000005
glabel L80B375A8
/* 038F8 80B375A8 10000006 */  beq     $zero, $zero, .L80B375C4   
/* 038FC 80B375AC 24030006 */  addiu   $v1, $zero, 0x0006         ## $v1 = 00000006
glabel L80B375B0
/* 03900 80B375B0 10000004 */  beq     $zero, $zero, .L80B375C4   
/* 03904 80B375B4 24030007 */  addiu   $v1, $zero, 0x0007         ## $v1 = 00000007
glabel L80B375B8
/* 03908 80B375B8 10000002 */  beq     $zero, $zero, .L80B375C4   
/* 0390C 80B375BC 24030008 */  addiu   $v1, $zero, 0x0008         ## $v1 = 00000008
glabel L80B375C0
/* 03910 80B375C0 24030009 */  addiu   $v1, $zero, 0x0009         ## $v1 = 00000009
glabel L80B375C4
.L80B375C4:
/* 03914 80B375C4 04600019 */  bltz    $v1, .L80B3762C            
/* 03918 80B375C8 3C0480B3 */  lui     $a0, %hi(D_80B37AE8)       ## $a0 = 80B30000
/* 0391C 80B375CC 24847AE8 */  addiu   $a0, $a0, %lo(D_80B37AE8)  ## $a0 = 80B37AE8
/* 03920 80B375D0 27A50018 */  addiu   $a1, $sp, 0x0018           ## $a1 = FFFFFFE0
/* 03924 80B375D4 0C0346BD */  jal     Matrix_MultVec3f              
/* 03928 80B375D8 AFA30030 */  sw      $v1, 0x0030($sp)           
/* 0392C 80B375DC C7A40018 */  lwc1    $f4, 0x0018($sp)           
/* 03930 80B375E0 8FA30030 */  lw      $v1, 0x0030($sp)           
/* 03934 80B375E4 8FA60048 */  lw      $a2, 0x0048($sp)           
/* 03938 80B375E8 4600218D */  trunc.w.s $f6, $f4                   
/* 0393C 80B375EC 0003C880 */  sll     $t9, $v1,  2               
/* 03940 80B375F0 0323C823 */  subu    $t9, $t9, $v1              
/* 03944 80B375F4 0019C840 */  sll     $t9, $t9,  1               
/* 03948 80B375F8 44093000 */  mfc1    $t1, $f6                   
/* 0394C 80B375FC 00D91021 */  addu    $v0, $a2, $t9              
/* 03950 80B37600 A449014C */  sh      $t1, 0x014C($v0)           ## 0000014C
/* 03954 80B37604 C7A8001C */  lwc1    $f8, 0x001C($sp)           
/* 03958 80B37608 4600428D */  trunc.w.s $f10, $f8                  
/* 0395C 80B3760C 440B5000 */  mfc1    $t3, $f10                  
/* 03960 80B37610 00000000 */  nop
/* 03964 80B37614 A44B014E */  sh      $t3, 0x014E($v0)           ## 0000014E
/* 03968 80B37618 C7B00020 */  lwc1    $f16, 0x0020($sp)          
/* 0396C 80B3761C 4600848D */  trunc.w.s $f18, $f16                 
/* 03970 80B37620 440D9000 */  mfc1    $t5, $f18                  
/* 03974 80B37624 00000000 */  nop
/* 03978 80B37628 A44D0150 */  sh      $t5, 0x0150($v0)           ## 00000150
.L80B3762C:
/* 0397C 80B3762C 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L80B37630:
/* 03980 80B37630 27BD0038 */  addiu   $sp, $sp, 0x0038           ## $sp = 00000000
/* 03984 80B37634 03E00008 */  jr      $ra                        
/* 03988 80B37638 00000000 */  nop
