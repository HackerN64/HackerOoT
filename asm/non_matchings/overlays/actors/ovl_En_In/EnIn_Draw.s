.rdata
glabel D_80A7BA0C
    .asciz "../z_en_in.c"
    .balign 4

glabel D_80A7BA1C
    .asciz "../z_en_in.c"
    .balign 4

.text
glabel EnIn_Draw
/* 02704 80A7B6B4 27BDFFA8 */  addiu   $sp, $sp, 0xFFA8           ## $sp = FFFFFFA8
/* 02708 80A7B6B8 AFBF002C */  sw      $ra, 0x002C($sp)
/* 0270C 80A7B6BC AFB00028 */  sw      $s0, 0x0028($sp)
/* 02710 80A7B6C0 AFA5005C */  sw      $a1, 0x005C($sp)
/* 02714 80A7B6C4 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 02718 80A7B6C8 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 0271C 80A7B6CC 3C0680A8 */  lui     $a2, %hi(D_80A7BA0C)       ## $a2 = 80A80000
/* 02720 80A7B6D0 24C6BA0C */  addiu   $a2, $a2, %lo(D_80A7BA0C)  ## $a2 = 80A7BA0C
/* 02724 80A7B6D4 27A40040 */  addiu   $a0, $sp, 0x0040           ## $a0 = FFFFFFE8
/* 02728 80A7B6D8 24070950 */  addiu   $a3, $zero, 0x0950         ## $a3 = 00000950
/* 0272C 80A7B6DC 0C031AB1 */  jal     Graph_OpenDisps
/* 02730 80A7B6E0 AFA50050 */  sw      $a1, 0x0050($sp)
/* 02734 80A7B6E4 8E180190 */  lw      $t8, 0x0190($s0)           ## 00000190
/* 02738 80A7B6E8 3C0F80A8 */  lui     $t7, %hi(func_80A79FB0)    ## $t7 = 80A80000
/* 0273C 80A7B6EC 25EF9FB0 */  addiu   $t7, $t7, %lo(func_80A79FB0) ## $t7 = 80A79FB0
/* 02740 80A7B6F0 11F8003C */  beq     $t7, $t8, .L80A7B7E4
/* 02744 80A7B6F4 8FA80050 */  lw      $t0, 0x0050($sp)
/* 02748 80A7B6F8 8FB9005C */  lw      $t9, 0x005C($sp)
/* 0274C 80A7B6FC 8F240000 */  lw      $a0, 0x0000($t9)           ## 00000000
/* 02750 80A7B700 0C024F46 */  jal     func_80093D18
/* 02754 80A7B704 AFA80050 */  sw      $t0, 0x0050($sp)
/* 02758 80A7B708 8FA80050 */  lw      $t0, 0x0050($sp)
/* 0275C 80A7B70C 3C0ADB06 */  lui     $t2, 0xDB06                ## $t2 = DB060000
/* 02760 80A7B710 354A0020 */  ori     $t2, $t2, 0x0020           ## $t2 = DB060020
/* 02764 80A7B714 8D0302C0 */  lw      $v1, 0x02C0($t0)           ## 000002C0
/* 02768 80A7B718 3C0480A8 */  lui     $a0, %hi(D_80A7B9B4)       ## $a0 = 80A80000
/* 0276C 80A7B71C 3C068016 */  lui     $a2, %hi(gSegments)
/* 02770 80A7B720 24690008 */  addiu   $t1, $v1, 0x0008           ## $t1 = 00000008
/* 02774 80A7B724 AD0902C0 */  sw      $t1, 0x02C0($t0)           ## 000002C0
/* 02778 80A7B728 AC6A0000 */  sw      $t2, 0x0000($v1)           ## 00000000
/* 0277C 80A7B72C 860B01EE */  lh      $t3, 0x01EE($s0)           ## 000001EE
/* 02780 80A7B730 24C66FA8 */  addiu   $a2, %lo(gSegments)
/* 02784 80A7B734 3C0500FF */  lui     $a1, 0x00FF                ## $a1 = 00FF0000
/* 02788 80A7B738 000B6080 */  sll     $t4, $t3,  2
/* 0278C 80A7B73C 008C2021 */  addu    $a0, $a0, $t4
/* 02790 80A7B740 8C84B9B4 */  lw      $a0, %lo(D_80A7B9B4)($a0)
/* 02794 80A7B744 34A5FFFF */  ori     $a1, $a1, 0xFFFF           ## $a1 = 00FFFFFF
/* 02798 80A7B748 3C078000 */  lui     $a3, 0x8000                ## $a3 = 80000000
/* 0279C 80A7B74C 00047100 */  sll     $t6, $a0,  4
/* 027A0 80A7B750 000E7F02 */  srl     $t7, $t6, 28
/* 027A4 80A7B754 000FC080 */  sll     $t8, $t7,  2
/* 027A8 80A7B758 00D8C821 */  addu    $t9, $a2, $t8
/* 027AC 80A7B75C 8F290000 */  lw      $t1, 0x0000($t9)           ## 00000000
/* 027B0 80A7B760 00856824 */  and     $t5, $a0, $a1
/* 027B4 80A7B764 3C040600 */  lui     $a0, %hi(D_060034D0)                ## $a0 = 06000000
/* 027B8 80A7B768 01A95021 */  addu    $t2, $t5, $t1
/* 027BC 80A7B76C 01475821 */  addu    $t3, $t2, $a3
/* 027C0 80A7B770 AC6B0004 */  sw      $t3, 0x0004($v1)           ## 00000004
/* 027C4 80A7B774 8D0302C0 */  lw      $v1, 0x02C0($t0)           ## 000002C0
/* 027C8 80A7B778 248434D0 */  addiu   $a0, $a0, %lo(D_060034D0)           ## $a0 = 060034D0
/* 027CC 80A7B77C 00047900 */  sll     $t7, $a0,  4
/* 027D0 80A7B780 000FC702 */  srl     $t8, $t7, 28
/* 027D4 80A7B784 3C0EDB06 */  lui     $t6, 0xDB06                ## $t6 = DB060000
/* 027D8 80A7B788 246C0008 */  addiu   $t4, $v1, 0x0008           ## $t4 = 00000008
/* 027DC 80A7B78C 35CE0024 */  ori     $t6, $t6, 0x0024           ## $t6 = DB060024
/* 027E0 80A7B790 0018C880 */  sll     $t9, $t8,  2
/* 027E4 80A7B794 AD0C02C0 */  sw      $t4, 0x02C0($t0)           ## 000002C0
/* 027E8 80A7B798 00D96821 */  addu    $t5, $a2, $t9
/* 027EC 80A7B79C AC6E0000 */  sw      $t6, 0x0000($v1)           ## 00000000
/* 027F0 80A7B7A0 8DA90000 */  lw      $t1, 0x0000($t5)           ## 00000000
/* 027F4 80A7B7A4 00855024 */  and     $t2, $a0, $a1
/* 027F8 80A7B7A8 3C0E80A8 */  lui     $t6, %hi(func_80A7B320)    ## $t6 = 80A80000
/* 027FC 80A7B7AC 012A5821 */  addu    $t3, $t1, $t2
/* 02800 80A7B7B0 01676021 */  addu    $t4, $t3, $a3
/* 02804 80A7B7B4 AC6C0004 */  sw      $t4, 0x0004($v1)           ## 00000004
/* 02808 80A7B7B8 9207014E */  lbu     $a3, 0x014E($s0)           ## 0000014E
/* 0280C 80A7B7BC 8E06016C */  lw      $a2, 0x016C($s0)           ## 0000016C
/* 02810 80A7B7C0 8E050150 */  lw      $a1, 0x0150($s0)           ## 00000150
/* 02814 80A7B7C4 3C0F80A8 */  lui     $t7, %hi(func_80A7B570)    ## $t7 = 80A80000
/* 02818 80A7B7C8 25EFB570 */  addiu   $t7, $t7, %lo(func_80A7B570) ## $t7 = 80A7B570
/* 0281C 80A7B7CC 25CEB320 */  addiu   $t6, $t6, %lo(func_80A7B320) ## $t6 = 80A7B320
/* 02820 80A7B7D0 AFAE0010 */  sw      $t6, 0x0010($sp)
/* 02824 80A7B7D4 AFAF0014 */  sw      $t7, 0x0014($sp)
/* 02828 80A7B7D8 AFB00018 */  sw      $s0, 0x0018($sp)
/* 0282C 80A7B7DC 0C0286B2 */  jal     SkelAnime_DrawFlexOpa
/* 02830 80A7B7E0 8FA4005C */  lw      $a0, 0x005C($sp)
.L80A7B7E4:
/* 02834 80A7B7E4 8FB8005C */  lw      $t8, 0x005C($sp)
/* 02838 80A7B7E8 3C0680A8 */  lui     $a2, %hi(D_80A7BA1C)       ## $a2 = 80A80000
/* 0283C 80A7B7EC 24C6BA1C */  addiu   $a2, $a2, %lo(D_80A7BA1C)  ## $a2 = 80A7BA1C
/* 02840 80A7B7F0 27A40040 */  addiu   $a0, $sp, 0x0040           ## $a0 = FFFFFFE8
/* 02844 80A7B7F4 24070970 */  addiu   $a3, $zero, 0x0970         ## $a3 = 00000970
/* 02848 80A7B7F8 0C031AD5 */  jal     Graph_CloseDisps
/* 0284C 80A7B7FC 8F050000 */  lw      $a1, 0x0000($t8)           ## 00000000
/* 02850 80A7B800 8FBF002C */  lw      $ra, 0x002C($sp)
/* 02854 80A7B804 8FB00028 */  lw      $s0, 0x0028($sp)
/* 02858 80A7B808 27BD0058 */  addiu   $sp, $sp, 0x0058           ## $sp = 00000000
/* 0285C 80A7B80C 03E00008 */  jr      $ra
/* 02860 80A7B810 00000000 */  nop
/* 02864 80A7B814 00000000 */  nop
/* 02868 80A7B818 00000000 */  nop
/* 0286C 80A7B81C 00000000 */  nop
