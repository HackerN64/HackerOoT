.rdata
glabel D_80AE665C
    .asciz "../z_en_reeba.c"
    .balign 4

glabel D_80AE666C
    .asciz "../z_en_reeba.c"
    .balign 4

.text
glabel EnReeba_Draw
/* 016F4 80AE63C4 27BDFF78 */  addiu   $sp, $sp, 0xFF78           ## $sp = FFFFFF78
/* 016F8 80AE63C8 AFB10048 */  sw      $s1, 0x0048($sp)           
/* 016FC 80AE63CC 00A08825 */  or      $s1, $a1, $zero            ## $s1 = 00000000
/* 01700 80AE63D0 AFBF004C */  sw      $ra, 0x004C($sp)           
/* 01704 80AE63D4 AFB00044 */  sw      $s0, 0x0044($sp)           
/* 01708 80AE63D8 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 0170C 80AE63DC 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 01710 80AE63E0 3C0680AE */  lui     $a2, %hi(D_80AE665C)       ## $a2 = 80AE0000
/* 01714 80AE63E4 24C6665C */  addiu   $a2, $a2, %lo(D_80AE665C)  ## $a2 = 80AE665C
/* 01718 80AE63E8 27A4006C */  addiu   $a0, $sp, 0x006C           ## $a0 = FFFFFFE4
/* 0171C 80AE63EC 24070426 */  addiu   $a3, $zero, 0x0426         ## $a3 = 00000426
/* 01720 80AE63F0 0C031AB1 */  jal     Graph_OpenDisps              
/* 01724 80AE63F4 AFA5007C */  sw      $a1, 0x007C($sp)           
/* 01728 80AE63F8 0C024F46 */  jal     func_80093D18              
/* 0172C 80AE63FC 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 01730 80AE6400 860E027A */  lh      $t6, 0x027A($s0)           ## 0000027A
/* 01734 80AE6404 8FA8007C */  lw      $t0, 0x007C($sp)           
/* 01738 80AE6408 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 0173C 80AE640C 11C0000B */  beq     $t6, $zero, .L80AE643C     
/* 01740 80AE6410 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 01744 80AE6414 8D0302C0 */  lw      $v1, 0x02C0($t0)           ## 000002C0
/* 01748 80AE6418 3C18FA00 */  lui     $t8, 0xFA00                ## $t8 = FA000000
/* 0174C 80AE641C 3C199B37 */  lui     $t9, 0x9B37                ## $t9 = 9B370000
/* 01750 80AE6420 246F0008 */  addiu   $t7, $v1, 0x0008           ## $t7 = 00000008
/* 01754 80AE6424 AD0F02C0 */  sw      $t7, 0x02C0($t0)           ## 000002C0
/* 01758 80AE6428 3739FFFF */  ori     $t9, $t9, 0xFFFF           ## $t9 = 9B37FFFF
/* 0175C 80AE642C 37180001 */  ori     $t8, $t8, 0x0001           ## $t8 = FA000001
/* 01760 80AE6430 AC780000 */  sw      $t8, 0x0000($v1)           ## 00000000
/* 01764 80AE6434 10000009 */  beq     $zero, $zero, .L80AE645C   
/* 01768 80AE6438 AC790004 */  sw      $t9, 0x0004($v1)           ## 00000004
.L80AE643C:
/* 0176C 80AE643C 8D0302C0 */  lw      $v1, 0x02C0($t0)           ## 000002C0
/* 01770 80AE6440 3C0AFA00 */  lui     $t2, 0xFA00                ## $t2 = FA000000
/* 01774 80AE6444 354A0001 */  ori     $t2, $t2, 0x0001           ## $t2 = FA000001
/* 01778 80AE6448 24690008 */  addiu   $t1, $v1, 0x0008           ## $t1 = 00000008
/* 0177C 80AE644C AD0902C0 */  sw      $t1, 0x02C0($t0)           ## 000002C0
/* 01780 80AE6450 240BFFFF */  addiu   $t3, $zero, 0xFFFF         ## $t3 = FFFFFFFF
/* 01784 80AE6454 AC6B0004 */  sw      $t3, 0x0004($v1)           ## 00000004
/* 01788 80AE6458 AC6A0000 */  sw      $t2, 0x0000($v1)           ## 00000000
.L80AE645C:
/* 0178C 80AE645C 8E050150 */  lw      $a1, 0x0150($s0)           ## 00000150
/* 01790 80AE6460 8E06016C */  lw      $a2, 0x016C($s0)           ## 0000016C
/* 01794 80AE6464 AFB00014 */  sw      $s0, 0x0014($sp)           
/* 01798 80AE6468 0C028572 */  jal     SkelAnime_Draw
              
/* 0179C 80AE646C AFA00010 */  sw      $zero, 0x0010($sp)         
/* 017A0 80AE6470 3C0680AE */  lui     $a2, %hi(D_80AE666C)       ## $a2 = 80AE0000
/* 017A4 80AE6474 24C6666C */  addiu   $a2, $a2, %lo(D_80AE666C)  ## $a2 = 80AE666C
/* 017A8 80AE6478 27A4006C */  addiu   $a0, $sp, 0x006C           ## $a0 = FFFFFFE4
/* 017AC 80AE647C 8E250000 */  lw      $a1, 0x0000($s1)           ## 00000000
/* 017B0 80AE6480 0C031AD5 */  jal     Graph_CloseDisps              
/* 017B4 80AE6484 24070440 */  addiu   $a3, $zero, 0x0440         ## $a3 = 00000440
/* 017B8 80AE6488 3C0C8016 */  lui     $t4, %hi(gGameInfo)
/* 017BC 80AE648C 8D8CFA90 */  lw      $t4, %lo(gGameInfo)($t4)
/* 017C0 80AE6490 858D12D4 */  lh      $t5, 0x12D4($t4)           ## 801612D4
/* 017C4 80AE6494 51A0002E */  beql    $t5, $zero, .L80AE6550     
/* 017C8 80AE6498 8FBF004C */  lw      $ra, 0x004C($sp)           
/* 017CC 80AE649C 0C01DE1C */  jal     Math_Sins
              ## sins?
/* 017D0 80AE64A0 86040032 */  lh      $a0, 0x0032($s0)           ## 00000032
/* 017D4 80AE64A4 3C0141F0 */  lui     $at, 0x41F0                ## $at = 41F00000
/* 017D8 80AE64A8 44812000 */  mtc1    $at, $f4                   ## $f4 = 30.00
/* 017DC 80AE64AC C6080024 */  lwc1    $f8, 0x0024($s0)           ## 00000024
/* 017E0 80AE64B0 3C0141A0 */  lui     $at, 0x41A0                ## $at = 41A00000
/* 017E4 80AE64B4 46040182 */  mul.s   $f6, $f0, $f4              
/* 017E8 80AE64B8 44812000 */  mtc1    $at, $f4                   ## $f4 = 20.00
/* 017EC 80AE64BC 46083280 */  add.s   $f10, $f6, $f8             
/* 017F0 80AE64C0 E7AA0058 */  swc1    $f10, 0x0058($sp)          
/* 017F4 80AE64C4 C6120028 */  lwc1    $f18, 0x0028($s0)          ## 00000028
/* 017F8 80AE64C8 46049180 */  add.s   $f6, $f18, $f4             
/* 017FC 80AE64CC E7A6005C */  swc1    $f6, 0x005C($sp)           
/* 01800 80AE64D0 0C01DE0D */  jal     Math_Coss
              ## coss?
/* 01804 80AE64D4 86040032 */  lh      $a0, 0x0032($s0)           ## 00000032
/* 01808 80AE64D8 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 0180C 80AE64DC 44818000 */  mtc1    $at, $f16                  ## $f16 = 1.00
/* 01810 80AE64E0 860E0032 */  lh      $t6, 0x0032($s0)           ## 00000032
/* 01814 80AE64E4 3C0141F0 */  lui     $at, 0x41F0                ## $at = 41F00000
/* 01818 80AE64E8 44814000 */  mtc1    $at, $f8                   ## $f8 = 30.00
/* 0181C 80AE64EC C612002C */  lwc1    $f18, 0x002C($s0)          ## 0000002C
/* 01820 80AE64F0 86070030 */  lh      $a3, 0x0030($s0)           ## 00000030
/* 01824 80AE64F4 AFAE0010 */  sw      $t6, 0x0010($sp)           
/* 01828 80AE64F8 46080282 */  mul.s   $f10, $f0, $f8             
/* 0182C 80AE64FC 860F0034 */  lh      $t7, 0x0034($s0)           ## 00000034
/* 01830 80AE6500 241800FF */  addiu   $t8, $zero, 0x00FF         ## $t8 = 000000FF
/* 01834 80AE6504 241900FF */  addiu   $t9, $zero, 0x00FF         ## $t9 = 000000FF
/* 01838 80AE6508 24090004 */  addiu   $t1, $zero, 0x0004         ## $t1 = 00000004
/* 0183C 80AE650C AFA90034 */  sw      $t1, 0x0034($sp)           
/* 01840 80AE6510 AFB90030 */  sw      $t9, 0x0030($sp)           
/* 01844 80AE6514 46125080 */  add.s   $f2, $f10, $f18            
/* 01848 80AE6518 AFB80024 */  sw      $t8, 0x0024($sp)           
/* 0184C 80AE651C AFA0002C */  sw      $zero, 0x002C($sp)         
/* 01850 80AE6520 AFA00028 */  sw      $zero, 0x0028($sp)         
/* 01854 80AE6524 E7B00020 */  swc1    $f16, 0x0020($sp)          
/* 01858 80AE6528 E7B0001C */  swc1    $f16, 0x001C($sp)          
/* 0185C 80AE652C E7B00018 */  swc1    $f16, 0x0018($sp)          
/* 01860 80AE6530 AFAF0014 */  sw      $t7, 0x0014($sp)           
/* 01864 80AE6534 8E2A0000 */  lw      $t2, 0x0000($s1)           ## 00000000
/* 01868 80AE6538 44061000 */  mfc1    $a2, $f2                   
/* 0186C 80AE653C C7AC0058 */  lwc1    $f12, 0x0058($sp)          
/* 01870 80AE6540 C7AE005C */  lwc1    $f14, 0x005C($sp)          
/* 01874 80AE6544 0C018FA7 */  jal     DebugDisplay_AddObject
              
/* 01878 80AE6548 AFAA0038 */  sw      $t2, 0x0038($sp)           
/* 0187C 80AE654C 8FBF004C */  lw      $ra, 0x004C($sp)           
.L80AE6550:
/* 01880 80AE6550 8FB00044 */  lw      $s0, 0x0044($sp)           
/* 01884 80AE6554 8FB10048 */  lw      $s1, 0x0048($sp)           
/* 01888 80AE6558 03E00008 */  jr      $ra                        
/* 0188C 80AE655C 27BD0088 */  addiu   $sp, $sp, 0x0088           ## $sp = 00000000
