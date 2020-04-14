.late_rodata
glabel jtbl_80AEA8F8
.word L80AE96CC
.word L80AE96E4
.word L80AE9710
.word L80AE9738
.word L80AE9764
glabel D_80AEA90C
    .float 0.8

.text
glabel func_80AE9670
/* 01230 80AE9670 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 01234 80AE9674 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 01238 80AE9678 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 0123C 80AE967C AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 01240 80AE9680 AFA5002C */  sw      $a1, 0x002C($sp)           
/* 01244 80AE9684 8605008A */  lh      $a1, 0x008A($s0)           ## 0000008A
/* 01248 80AE9688 AFA00010 */  sw      $zero, 0x0010($sp)         
/* 0124C 80AE968C 248400B6 */  addiu   $a0, $a0, 0x00B6           ## $a0 = 000000B6
/* 01250 80AE9690 2406000A */  addiu   $a2, $zero, 0x000A         ## $a2 = 0000000A
/* 01254 80AE9694 0C01E1A7 */  jal     Math_SmoothScaleMaxMinS
              
/* 01258 80AE9698 240701F4 */  addiu   $a3, $zero, 0x01F4         ## $a3 = 000001F4
/* 0125C 80AE969C 920F0370 */  lbu     $t7, 0x0370($s0)           ## 00000370
/* 01260 80AE96A0 860E00B6 */  lh      $t6, 0x00B6($s0)           ## 000000B6
/* 01264 80AE96A4 25F8FFFF */  addiu   $t8, $t7, 0xFFFF           ## $t8 = FFFFFFFF
/* 01268 80AE96A8 2F010005 */  sltiu   $at, $t8, 0x0005           
/* 0126C 80AE96AC 10200032 */  beq     $at, $zero, .L80AE9778     
/* 01270 80AE96B0 A60E0032 */  sh      $t6, 0x0032($s0)           ## 00000032
/* 01274 80AE96B4 0018C080 */  sll     $t8, $t8,  2               
/* 01278 80AE96B8 3C0180AF */  lui     $at, %hi(jtbl_80AEA8F8)       ## $at = 80AF0000
/* 0127C 80AE96BC 00380821 */  addu    $at, $at, $t8              
/* 01280 80AE96C0 8C38A8F8 */  lw      $t8, %lo(jtbl_80AEA8F8)($at)  
/* 01284 80AE96C4 03000008 */  jr      $t8                        
/* 01288 80AE96C8 00000000 */  nop
glabel L80AE96CC
/* 0128C 80AE96CC 861901EA */  lh      $t9, 0x01EA($s0)           ## 000001EA
/* 01290 80AE96D0 24080002 */  addiu   $t0, $zero, 0x0002         ## $t0 = 00000002
/* 01294 80AE96D4 57200029 */  bnel    $t9, $zero, .L80AE977C     
/* 01298 80AE96D8 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 0129C 80AE96DC 10000026 */  beq     $zero, $zero, .L80AE9778   
/* 012A0 80AE96E0 A2080370 */  sb      $t0, 0x0370($s0)           ## 00000370
glabel L80AE96E4
/* 012A4 80AE96E4 860901EA */  lh      $t1, 0x01EA($s0)           ## 000001EA
/* 012A8 80AE96E8 3C013FC0 */  lui     $at, 0x3FC0                ## $at = 3FC00000
/* 012AC 80AE96EC 240A0005 */  addiu   $t2, $zero, 0x0005         ## $t2 = 00000005
/* 012B0 80AE96F0 15200021 */  bne     $t1, $zero, .L80AE9778     
/* 012B4 80AE96F4 240B0003 */  addiu   $t3, $zero, 0x0003         ## $t3 = 00000003
/* 012B8 80AE96F8 44810000 */  mtc1    $at, $f0                   ## $f0 = 1.50
/* 012BC 80AE96FC A60A01EA */  sh      $t2, 0x01EA($s0)           ## 000001EA
/* 012C0 80AE9700 A20B0370 */  sb      $t3, 0x0370($s0)           ## 00000370
/* 012C4 80AE9704 E6000340 */  swc1    $f0, 0x0340($s0)           ## 00000340
/* 012C8 80AE9708 1000001B */  beq     $zero, $zero, .L80AE9778   
/* 012CC 80AE970C E6000338 */  swc1    $f0, 0x0338($s0)           ## 00000338
glabel L80AE9710
/* 012D0 80AE9710 860C01EA */  lh      $t4, 0x01EA($s0)           ## 000001EA
/* 012D4 80AE9714 240D0002 */  addiu   $t5, $zero, 0x0002         ## $t5 = 00000002
/* 012D8 80AE9718 3C0144FA */  lui     $at, 0x44FA                ## $at = 44FA0000
/* 012DC 80AE971C 15800016 */  bne     $t4, $zero, .L80AE9778     
/* 012E0 80AE9720 240E0004 */  addiu   $t6, $zero, 0x0004         ## $t6 = 00000004
/* 012E4 80AE9724 44812000 */  mtc1    $at, $f4                   ## $f4 = 2000.00
/* 012E8 80AE9728 A60D01EA */  sh      $t5, 0x01EA($s0)           ## 000001EA
/* 012EC 80AE972C A20E0370 */  sb      $t6, 0x0370($s0)           ## 00000370
/* 012F0 80AE9730 10000011 */  beq     $zero, $zero, .L80AE9778   
/* 012F4 80AE9734 E6040328 */  swc1    $f4, 0x0328($s0)           ## 00000328
glabel L80AE9738
/* 012F8 80AE9738 860F01EA */  lh      $t7, 0x01EA($s0)           ## 000001EA
/* 012FC 80AE973C 3C0180AF */  lui     $at, %hi(D_80AEA90C)       ## $at = 80AF0000
/* 01300 80AE9740 24180014 */  addiu   $t8, $zero, 0x0014         ## $t8 = 00000014
/* 01304 80AE9744 15E0000C */  bne     $t7, $zero, .L80AE9778     
/* 01308 80AE9748 24190005 */  addiu   $t9, $zero, 0x0005         ## $t9 = 00000005
/* 0130C 80AE974C C420A90C */  lwc1    $f0, %lo(D_80AEA90C)($at)  
/* 01310 80AE9750 A61801EA */  sh      $t8, 0x01EA($s0)           ## 000001EA
/* 01314 80AE9754 A2190370 */  sb      $t9, 0x0370($s0)           ## 00000370
/* 01318 80AE9758 E6000340 */  swc1    $f0, 0x0340($s0)           ## 00000340
/* 0131C 80AE975C 10000006 */  beq     $zero, $zero, .L80AE9778   
/* 01320 80AE9760 E6000338 */  swc1    $f0, 0x0338($s0)           ## 00000338
glabel L80AE9764
/* 01324 80AE9764 860801EA */  lh      $t0, 0x01EA($s0)           ## 000001EA
/* 01328 80AE9768 55000004 */  bnel    $t0, $zero, .L80AE977C     
/* 0132C 80AE976C 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 01330 80AE9770 0C2BA1D1 */  jal     func_80AE8744              
/* 01334 80AE9774 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
.L80AE9778:
/* 01338 80AE9778 8FBF0024 */  lw      $ra, 0x0024($sp)           
.L80AE977C:
/* 0133C 80AE977C 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 01340 80AE9780 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
/* 01344 80AE9784 03E00008 */  jr      $ra                        
/* 01348 80AE9788 00000000 */  nop
