.rdata
glabel D_80AC28D0
    .asciz "../z_en_okuta.c"
    .balign 4

glabel D_80AC28E0
    .asciz "../z_en_okuta.c"
    .balign 4

glabel D_80AC28F0
    .asciz "../z_en_okuta.c"
    .balign 4

.late_rodata
glabel D_80AC2988
    .float 9.58738019108e-05

.text
glabel EnOkuta_Draw
/* 02074 80AC26D4 27BDFFA8 */  addiu   $sp, $sp, 0xFFA8           ## $sp = FFFFFFA8
/* 02078 80AC26D8 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 0207C 80AC26DC 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 02080 80AC26E0 AFBF002C */  sw      $ra, 0x002C($sp)           
/* 02084 80AC26E4 AFB20028 */  sw      $s2, 0x0028($sp)           
/* 02088 80AC26E8 AFB10024 */  sw      $s1, 0x0024($sp)           
/* 0208C 80AC26EC 00A09025 */  or      $s2, $a1, $zero            ## $s2 = 00000000
/* 02090 80AC26F0 0C024F46 */  jal     func_80093D18              
/* 02094 80AC26F4 8CA40000 */  lw      $a0, 0x0000($a1)           ## 00000000
/* 02098 80AC26F8 860E001C */  lh      $t6, 0x001C($s0)           ## 0000001C
/* 0209C 80AC26FC 3C0680AC */  lui     $a2, %hi(D_80AC28D0)       ## $a2 = 80AC0000
/* 020A0 80AC2700 24C628D0 */  addiu   $a2, $a2, %lo(D_80AC28D0)  ## $a2 = 80AC28D0
/* 020A4 80AC2704 15C0000B */  bne     $t6, $zero, .L80AC2734     
/* 020A8 80AC2708 27A4003C */  addiu   $a0, $sp, 0x003C           ## $a0 = FFFFFFE4
/* 020AC 80AC270C 8E050150 */  lw      $a1, 0x0150($s0)           ## 00000150
/* 020B0 80AC2710 8E06016C */  lw      $a2, 0x016C($s0)           ## 0000016C
/* 020B4 80AC2714 3C0780AC */  lui     $a3, %hi(func_80AC25D8)    ## $a3 = 80AC0000
/* 020B8 80AC2718 24E725D8 */  addiu   $a3, $a3, %lo(func_80AC25D8) ## $a3 = 80AC25D8
/* 020BC 80AC271C AFB00014 */  sw      $s0, 0x0014($sp)           
/* 020C0 80AC2720 AFA00010 */  sw      $zero, 0x0010($sp)         
/* 020C4 80AC2724 0C028572 */  jal     SkelAnime_Draw
              
/* 020C8 80AC2728 02402025 */  or      $a0, $s2, $zero            ## $a0 = 00000000
/* 020CC 80AC272C 1000002F */  beq     $zero, $zero, .L80AC27EC   
/* 020D0 80AC2730 8FBF002C */  lw      $ra, 0x002C($sp)           
.L80AC2734:
/* 020D4 80AC2734 8E450000 */  lw      $a1, 0x0000($s2)           ## 00000000
/* 020D8 80AC2738 24070675 */  addiu   $a3, $zero, 0x0675         ## $a3 = 00000675
/* 020DC 80AC273C 0C031AB1 */  jal     Graph_OpenDisps              
/* 020E0 80AC2740 00A08825 */  or      $s1, $a1, $zero            ## $s1 = 00000000
/* 020E4 80AC2744 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 020E8 80AC2748 34211DA0 */  ori     $at, $at, 0x1DA0           ## $at = 00011DA0
/* 020EC 80AC274C 02412021 */  addu    $a0, $s2, $at              
/* 020F0 80AC2750 0C03424C */  jal     Matrix_Mult              
/* 020F4 80AC2754 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 020F8 80AC2758 860F0018 */  lh      $t7, 0x0018($s0)           ## 00000018
/* 020FC 80AC275C 3C0180AC */  lui     $at, %hi(D_80AC2988)       ## $at = 80AC0000
/* 02100 80AC2760 C4282988 */  lwc1    $f8, %lo(D_80AC2988)($at)  
/* 02104 80AC2764 448F2000 */  mtc1    $t7, $f4                   ## $f4 = 0.00
/* 02108 80AC2768 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 0210C 80AC276C 468021A0 */  cvt.s.w $f6, $f4                   
/* 02110 80AC2770 46083302 */  mul.s   $f12, $f6, $f8             
/* 02114 80AC2774 0C0343B5 */  jal     Matrix_RotateZ              
/* 02118 80AC2778 00000000 */  nop
/* 0211C 80AC277C 8E2202C0 */  lw      $v0, 0x02C0($s1)           ## 000002C0
/* 02120 80AC2780 3C19DA38 */  lui     $t9, 0xDA38                ## $t9 = DA380000
/* 02124 80AC2784 37390003 */  ori     $t9, $t9, 0x0003           ## $t9 = DA380003
/* 02128 80AC2788 24580008 */  addiu   $t8, $v0, 0x0008           ## $t8 = 00000008
/* 0212C 80AC278C AE3802C0 */  sw      $t8, 0x02C0($s1)           ## 000002C0
/* 02130 80AC2790 3C0580AC */  lui     $a1, %hi(D_80AC28E0)       ## $a1 = 80AC0000
/* 02134 80AC2794 AC590000 */  sw      $t9, 0x0000($v0)           ## 00000000
/* 02138 80AC2798 8E440000 */  lw      $a0, 0x0000($s2)           ## 00000000
/* 0213C 80AC279C 24A528E0 */  addiu   $a1, $a1, %lo(D_80AC28E0)  ## $a1 = 80AC28E0
/* 02140 80AC27A0 24060679 */  addiu   $a2, $zero, 0x0679         ## $a2 = 00000679
/* 02144 80AC27A4 0C0346A2 */  jal     Matrix_NewMtx              
/* 02148 80AC27A8 00408025 */  or      $s0, $v0, $zero            ## $s0 = 00000000
/* 0214C 80AC27AC AE020004 */  sw      $v0, 0x0004($s0)           ## 00000004
/* 02150 80AC27B0 8E2202C0 */  lw      $v0, 0x02C0($s1)           ## 000002C0
/* 02154 80AC27B4 3C0A0600 */  lui     $t2, 0x0600                ## $t2 = 06000000
/* 02158 80AC27B8 254A3380 */  addiu   $t2, $t2, 0x3380           ## $t2 = 06003380
/* 0215C 80AC27BC 24480008 */  addiu   $t0, $v0, 0x0008           ## $t0 = 00000008
/* 02160 80AC27C0 AE2802C0 */  sw      $t0, 0x02C0($s1)           ## 000002C0
/* 02164 80AC27C4 3C09DE00 */  lui     $t1, 0xDE00                ## $t1 = DE000000
/* 02168 80AC27C8 3C0680AC */  lui     $a2, %hi(D_80AC28F0)       ## $a2 = 80AC0000
/* 0216C 80AC27CC AC490000 */  sw      $t1, 0x0000($v0)           ## 00000000
/* 02170 80AC27D0 AC4A0004 */  sw      $t2, 0x0004($v0)           ## 00000004
/* 02174 80AC27D4 8E450000 */  lw      $a1, 0x0000($s2)           ## 00000000
/* 02178 80AC27D8 24C628F0 */  addiu   $a2, $a2, %lo(D_80AC28F0)  ## $a2 = 80AC28F0
/* 0217C 80AC27DC 27A4003C */  addiu   $a0, $sp, 0x003C           ## $a0 = FFFFFFE4
/* 02180 80AC27E0 0C031AD5 */  jal     Graph_CloseDisps              
/* 02184 80AC27E4 2407067E */  addiu   $a3, $zero, 0x067E         ## $a3 = 0000067E
/* 02188 80AC27E8 8FBF002C */  lw      $ra, 0x002C($sp)           
.L80AC27EC:
/* 0218C 80AC27EC 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 02190 80AC27F0 8FB10024 */  lw      $s1, 0x0024($sp)           
/* 02194 80AC27F4 8FB20028 */  lw      $s2, 0x0028($sp)           
/* 02198 80AC27F8 03E00008 */  jr      $ra                        
/* 0219C 80AC27FC 27BD0058 */  addiu   $sp, $sp, 0x0058           ## $sp = 00000000
