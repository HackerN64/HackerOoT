.rdata
glabel D_80BA294C
    .asciz "../z_obj_warp2block.c"
    .balign 4

glabel D_80BA2964
    .asciz "../z_obj_warp2block.c"
    .balign 4

glabel D_80BA297C
    .asciz "../z_obj_warp2block.c"
    .balign 4

.text
glabel ObjWarp2block_Draw
/* 00904 80BA26F4 27BDFFB8 */  addiu   $sp, $sp, 0xFFB8           ## $sp = FFFFFFB8
/* 00908 80BA26F8 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 0090C 80BA26FC AFB00018 */  sw      $s0, 0x0018($sp)           
/* 00910 80BA2700 AFA40048 */  sw      $a0, 0x0048($sp)           
/* 00914 80BA2704 AFA5004C */  sw      $a1, 0x004C($sp)           
/* 00918 80BA2708 848F0018 */  lh      $t7, 0x0018($a0)           ## 00000018
/* 0091C 80BA270C 3C0880BA */  lui     $t0, %hi(D_80BA2884)       ## $t0 = 80BA0000
/* 00920 80BA2710 25082884 */  addiu   $t0, $t0, %lo(D_80BA2884)  ## $t0 = 80BA2884
/* 00924 80BA2714 31F80007 */  andi    $t8, $t7, 0x0007           ## $t8 = 00000000
/* 00928 80BA2718 0018C880 */  sll     $t9, $t8,  2               
/* 0092C 80BA271C 0338C823 */  subu    $t9, $t9, $t8              
/* 00930 80BA2720 03284821 */  addu    $t1, $t9, $t0              
/* 00934 80BA2724 AFA90044 */  sw      $t1, 0x0044($sp)           
/* 00938 80BA2728 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 0093C 80BA272C 3C0680BA */  lui     $a2, %hi(D_80BA294C)       ## $a2 = 80BA0000
/* 00940 80BA2730 24C6294C */  addiu   $a2, $a2, %lo(D_80BA294C)  ## $a2 = 80BA294C
/* 00944 80BA2734 27A40030 */  addiu   $a0, $sp, 0x0030           ## $a0 = FFFFFFE8
/* 00948 80BA2738 24070248 */  addiu   $a3, $zero, 0x0248         ## $a3 = 00000248
/* 0094C 80BA273C 0C031AB1 */  jal     Graph_OpenDisps              
/* 00950 80BA2740 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 00954 80BA2744 8FAB004C */  lw      $t3, 0x004C($sp)           
/* 00958 80BA2748 0C024F46 */  jal     func_80093D18              
/* 0095C 80BA274C 8D640000 */  lw      $a0, 0x0000($t3)           ## 00000000
/* 00960 80BA2750 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 00964 80BA2754 3C0DDA38 */  lui     $t5, 0xDA38                ## $t5 = DA380000
/* 00968 80BA2758 35AD0003 */  ori     $t5, $t5, 0x0003           ## $t5 = DA380003
/* 0096C 80BA275C 244C0008 */  addiu   $t4, $v0, 0x0008           ## $t4 = 00000008
/* 00970 80BA2760 AE0C02C0 */  sw      $t4, 0x02C0($s0)           ## 000002C0
/* 00974 80BA2764 AC4D0000 */  sw      $t5, 0x0000($v0)           ## 00000000
/* 00978 80BA2768 8FAE004C */  lw      $t6, 0x004C($sp)           
/* 0097C 80BA276C 3C0580BA */  lui     $a1, %hi(D_80BA2964)       ## $a1 = 80BA0000
/* 00980 80BA2770 24A52964 */  addiu   $a1, $a1, %lo(D_80BA2964)  ## $a1 = 80BA2964
/* 00984 80BA2774 8DC40000 */  lw      $a0, 0x0000($t6)           ## 00000000
/* 00988 80BA2778 2406024C */  addiu   $a2, $zero, 0x024C         ## $a2 = 0000024C
/* 0098C 80BA277C 0C0346A2 */  jal     Matrix_NewMtx              
/* 00990 80BA2780 AFA2002C */  sw      $v0, 0x002C($sp)           
/* 00994 80BA2784 8FA3002C */  lw      $v1, 0x002C($sp)           
/* 00998 80BA2788 3C18FA00 */  lui     $t8, 0xFA00                ## $t8 = FA000000
/* 0099C 80BA278C 3C0680BA */  lui     $a2, %hi(D_80BA297C)       ## $a2 = 80BA0000
/* 009A0 80BA2790 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 009A4 80BA2794 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 009A8 80BA2798 8FA40044 */  lw      $a0, 0x0044($sp)           
/* 009AC 80BA279C 24C6297C */  addiu   $a2, $a2, %lo(D_80BA297C)  ## $a2 = 80BA297C
/* 009B0 80BA27A0 244F0008 */  addiu   $t7, $v0, 0x0008           ## $t7 = 00000008
/* 009B4 80BA27A4 AE0F02C0 */  sw      $t7, 0x02C0($s0)           ## 000002C0
/* 009B8 80BA27A8 AC580000 */  sw      $t8, 0x0000($v0)           ## 00000000
/* 009BC 80BA27AC 908B0001 */  lbu     $t3, 0x0001($a0)           ## 00000001
/* 009C0 80BA27B0 90880000 */  lbu     $t0, 0x0000($a0)           ## 00000000
/* 009C4 80BA27B4 908F0002 */  lbu     $t7, 0x0002($a0)           ## 00000002
/* 009C8 80BA27B8 000B6400 */  sll     $t4, $t3, 16               
/* 009CC 80BA27BC 00084E00 */  sll     $t1, $t0, 24               
/* 009D0 80BA27C0 012C6825 */  or      $t5, $t1, $t4              ## $t5 = 00000000
/* 009D4 80BA27C4 000FC200 */  sll     $t8, $t7,  8               
/* 009D8 80BA27C8 01B8C825 */  or      $t9, $t5, $t8              ## $t9 = FA000000
/* 009DC 80BA27CC 372800FF */  ori     $t0, $t9, 0x00FF           ## $t0 = FA0000FF
/* 009E0 80BA27D0 AC480004 */  sw      $t0, 0x0004($v0)           ## 00000004
/* 009E4 80BA27D4 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 009E8 80BA27D8 3C090600 */  lui     $t1, %hi(D_06000980)                ## $t1 = 06000000
/* 009EC 80BA27DC 25290980 */  addiu   $t1, $t1, %lo(D_06000980)           ## $t1 = 06000980
/* 009F0 80BA27E0 244A0008 */  addiu   $t2, $v0, 0x0008           ## $t2 = 00000008
/* 009F4 80BA27E4 AE0A02C0 */  sw      $t2, 0x02C0($s0)           ## 000002C0
/* 009F8 80BA27E8 3C0BDE00 */  lui     $t3, 0xDE00                ## $t3 = DE000000
/* 009FC 80BA27EC AC4B0000 */  sw      $t3, 0x0000($v0)           ## 00000000
/* 00A00 80BA27F0 AC490004 */  sw      $t1, 0x0004($v0)           ## 00000004
/* 00A04 80BA27F4 8FAC004C */  lw      $t4, 0x004C($sp)           
/* 00A08 80BA27F8 27A40030 */  addiu   $a0, $sp, 0x0030           ## $a0 = FFFFFFE8
/* 00A0C 80BA27FC 24070252 */  addiu   $a3, $zero, 0x0252         ## $a3 = 00000252
/* 00A10 80BA2800 0C031AD5 */  jal     Graph_CloseDisps              
/* 00A14 80BA2804 8D850000 */  lw      $a1, 0x0000($t4)           ## 00000000
/* 00A18 80BA2808 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 00A1C 80BA280C 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 00A20 80BA2810 27BD0048 */  addiu   $sp, $sp, 0x0048           ## $sp = 00000000
/* 00A24 80BA2814 03E00008 */  jr      $ra                        
/* 00A28 80BA2818 00000000 */  nop
/* 00A2C 80BA281C 00000000 */  nop
