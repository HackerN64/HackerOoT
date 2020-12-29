glabel func_808D3D98
/* 01728 808D3D98 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 0172C 808D3D9C AFBF001C */  sw      $ra, 0x001C($sp)
/* 01730 808D3DA0 AFB10018 */  sw      $s1, 0x0018($sp)
/* 01734 808D3DA4 AFB00014 */  sw      $s0, 0x0014($sp)
/* 01738 808D3DA8 AFA5002C */  sw      $a1, 0x002C($sp)
/* 0173C 808D3DAC 8C8E0118 */  lw      $t6, 0x0118($a0)           ## 00000118
/* 01740 808D3DB0 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 01744 808D3DB4 2491014C */  addiu   $s1, $a0, 0x014C           ## $s1 = 0000014C
/* 01748 808D3DB8 02202025 */  or      $a0, $s1, $zero            ## $a0 = 0000014C
/* 0174C 808D3DBC 0C02927F */  jal     SkelAnime_Update

/* 01750 808D3DC0 AFAE0024 */  sw      $t6, 0x0024($sp)
/* 01754 808D3DC4 86030198 */  lh      $v1, 0x0198($s0)           ## 00000198
/* 01758 808D3DC8 240F0001 */  addiu   $t7, $zero, 0x0001         ## $t7 = 00000001
/* 0175C 808D3DCC A20F0194 */  sb      $t7, 0x0194($s0)           ## 00000194
/* 01760 808D3DD0 14600012 */  bne     $v1, $zero, .L808D3E1C
/* 01764 808D3DD4 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 01768 808D3DD8 02202025 */  or      $a0, $s1, $zero            ## $a0 = 0000014C
/* 0176C 808D3DDC 0C0295B2 */  jal     Animation_OnFrame
/* 01770 808D3DE0 8E0501F0 */  lw      $a1, 0x01F0($s0)           ## 000001F0
/* 01774 808D3DE4 10400033 */  beq     $v0, $zero, .L808D3EB4
/* 01778 808D3DE8 02202025 */  or      $a0, $s1, $zero            ## $a0 = 0000014C
/* 0177C 808D3DEC 3C050601 */  lui     $a1, 0x0601                ## $a1 = 06010000
/* 01780 808D3DF0 0C02947A */  jal     Animation_PlayOnce
/* 01784 808D3DF4 24A589DC */  addiu   $a1, $a1, 0x89DC           ## $a1 = 060089DC
/* 01788 808D3DF8 3C040601 */  lui     $a0, 0x0601                ## $a0 = 06010000
/* 0178C 808D3DFC 0C028800 */  jal     Animation_GetLastFrame

/* 01790 808D3E00 248489DC */  addiu   $a0, $a0, 0x89DC           ## $a0 = 060089DC
/* 01794 808D3E04 44822000 */  mtc1    $v0, $f4                   ## $f4 = 0.00
/* 01798 808D3E08 24180001 */  addiu   $t8, $zero, 0x0001         ## $t8 = 00000001
/* 0179C 808D3E0C A6180198 */  sh      $t8, 0x0198($s0)           ## 00000198
/* 017A0 808D3E10 468021A0 */  cvt.s.w $f6, $f4
/* 017A4 808D3E14 10000027 */  beq     $zero, $zero, .L808D3EB4
/* 017A8 808D3E18 E60601F0 */  swc1    $f6, 0x01F0($s0)           ## 000001F0
.L808D3E1C:
/* 017AC 808D3E1C 14610018 */  bne     $v1, $at, .L808D3E80
/* 017B0 808D3E20 26040028 */  addiu   $a0, $s0, 0x0028           ## $a0 = 00000028
/* 017B4 808D3E24 02202025 */  or      $a0, $s1, $zero            ## $a0 = 0000014C
/* 017B8 808D3E28 0C0295B2 */  jal     Animation_OnFrame
/* 017BC 808D3E2C 3C0540C0 */  lui     $a1, 0x40C0                ## $a1 = 40C00000
/* 017C0 808D3E30 10400003 */  beq     $v0, $zero, .L808D3E40
/* 017C4 808D3E34 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 017C8 808D3E38 0C00BE0A */  jal     Audio_PlayActorSound2

/* 017CC 808D3E3C 240538D6 */  addiu   $a1, $zero, 0x38D6         ## $a1 = 000038D6
.L808D3E40:
/* 017D0 808D3E40 02202025 */  or      $a0, $s1, $zero            ## $a0 = 0000014C
/* 017D4 808D3E44 0C0295B2 */  jal     Animation_OnFrame
/* 017D8 808D3E48 3C0541A0 */  lui     $a1, 0x41A0                ## $a1 = 41A00000
/* 017DC 808D3E4C 10400004 */  beq     $v0, $zero, .L808D3E60
/* 017E0 808D3E50 02202025 */  or      $a0, $s1, $zero            ## $a0 = 0000014C
/* 017E4 808D3E54 8FA80024 */  lw      $t0, 0x0024($sp)
/* 017E8 808D3E58 2419001E */  addiu   $t9, $zero, 0x001E         ## $t9 = 0000001E
/* 017EC 808D3E5C A5190250 */  sh      $t9, 0x0250($t0)           ## 00000250
.L808D3E60:
/* 017F0 808D3E60 0C0295B2 */  jal     Animation_OnFrame
/* 017F4 808D3E64 8E0501F0 */  lw      $a1, 0x01F0($s0)           ## 000001F0
/* 017F8 808D3E68 10400012 */  beq     $v0, $zero, .L808D3EB4
/* 017FC 808D3E6C 24090002 */  addiu   $t1, $zero, 0x0002         ## $t1 = 00000002
/* 01800 808D3E70 240A0019 */  addiu   $t2, $zero, 0x0019         ## $t2 = 00000019
/* 01804 808D3E74 A6090198 */  sh      $t1, 0x0198($s0)           ## 00000198
/* 01808 808D3E78 1000000E */  beq     $zero, $zero, .L808D3EB4
/* 0180C 808D3E7C A60A01BC */  sh      $t2, 0x01BC($s0)           ## 000001BC
.L808D3E80:
/* 01810 808D3E80 3C05C2C8 */  lui     $a1, 0xC2C8                ## $a1 = C2C80000
/* 01814 808D3E84 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 01818 808D3E88 0C01E107 */  jal     Math_ApproachF

/* 0181C 808D3E8C 3C074120 */  lui     $a3, 0x4120                ## $a3 = 41200000
/* 01820 808D3E90 860B01BC */  lh      $t3, 0x01BC($s0)           ## 000001BC
/* 01824 808D3E94 3C0C808D */  lui     $t4, %hi(func_808D4748)    ## $t4 = 808D0000
/* 01828 808D3E98 258C4748 */  addiu   $t4, $t4, %lo(func_808D4748) ## $t4 = 808D4748
/* 0182C 808D3E9C 55600006 */  bnel    $t3, $zero, .L808D3EB8
/* 01830 808D3EA0 8FBF001C */  lw      $ra, 0x001C($sp)
/* 01834 808D3EA4 AE0C0190 */  sw      $t4, 0x0190($s0)           ## 00000190
/* 01838 808D3EA8 8FAE0024 */  lw      $t6, 0x0024($sp)
/* 0183C 808D3EAC 240D0001 */  addiu   $t5, $zero, 0x0001         ## $t5 = 00000001
/* 01840 808D3EB0 A1CD02D8 */  sb      $t5, 0x02D8($t6)           ## 000002D8
.L808D3EB4:
/* 01844 808D3EB4 8FBF001C */  lw      $ra, 0x001C($sp)
.L808D3EB8:
/* 01848 808D3EB8 8FB00014 */  lw      $s0, 0x0014($sp)
/* 0184C 808D3EBC 8FB10018 */  lw      $s1, 0x0018($sp)
/* 01850 808D3EC0 03E00008 */  jr      $ra
/* 01854 808D3EC4 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
