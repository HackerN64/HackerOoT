.rdata
glabel D_80BA6F94
    .asciz "../z_oceff_spot.c"
    .balign 4

glabel D_80BA6FA8
    .asciz "../z_oceff_spot.c"
    .balign 4

glabel D_80BA6FBC
    .asciz "../z_oceff_spot.c"
    .balign 4

.text
glabel OceffSpot_Draw
/* 00674 80BA66E4 27BDFF90 */  addiu   $sp, $sp, 0xFF90           ## $sp = FFFFFF90
/* 00678 80BA66E8 AFBF003C */  sw      $ra, 0x003C($sp)           
/* 0067C 80BA66EC AFB10038 */  sw      $s1, 0x0038($sp)           
/* 00680 80BA66F0 AFB00034 */  sw      $s0, 0x0034($sp)           
/* 00684 80BA66F4 AFA40070 */  sw      $a0, 0x0070($sp)           
/* 00688 80BA66F8 8CAE009C */  lw      $t6, 0x009C($a1)           ## 0000009C
/* 0068C 80BA66FC 00A08825 */  or      $s1, $a1, $zero            ## $s1 = 00000000
/* 00690 80BA6700 3C0680BA */  lui     $a2, %hi(D_80BA6F94)       ## $a2 = 80BA0000
/* 00694 80BA6704 31CFFFFF */  andi    $t7, $t6, 0xFFFF           ## $t7 = 00000000
/* 00698 80BA6708 AFAF0068 */  sw      $t7, 0x0068($sp)           
/* 0069C 80BA670C 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 006A0 80BA6710 24C66F94 */  addiu   $a2, $a2, %lo(D_80BA6F94)  ## $a2 = 80BA6F94
/* 006A4 80BA6714 27A40054 */  addiu   $a0, $sp, 0x0054           ## $a0 = FFFFFFE4
/* 006A8 80BA6718 240701D2 */  addiu   $a3, $zero, 0x01D2         ## $a3 = 000001D2
/* 006AC 80BA671C 0C031AB1 */  jal     Graph_OpenDisps              
/* 006B0 80BA6720 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 006B4 80BA6724 0C024F61 */  jal     func_80093D84              
/* 006B8 80BA6728 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 006BC 80BA672C 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 006C0 80BA6730 3C19DA38 */  lui     $t9, 0xDA38                ## $t9 = DA380000
/* 006C4 80BA6734 37390003 */  ori     $t9, $t9, 0x0003           ## $t9 = DA380003
/* 006C8 80BA6738 24580008 */  addiu   $t8, $v0, 0x0008           ## $t8 = 00000008
/* 006CC 80BA673C AE1802D0 */  sw      $t8, 0x02D0($s0)           ## 000002D0
/* 006D0 80BA6740 AC590000 */  sw      $t9, 0x0000($v0)           ## 00000000
/* 006D4 80BA6744 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 006D8 80BA6748 3C0580BA */  lui     $a1, %hi(D_80BA6FA8)       ## $a1 = 80BA0000
/* 006DC 80BA674C 24A56FA8 */  addiu   $a1, $a1, %lo(D_80BA6FA8)  ## $a1 = 80BA6FA8
/* 006E0 80BA6750 240601D5 */  addiu   $a2, $zero, 0x01D5         ## $a2 = 000001D5
/* 006E4 80BA6754 0C0346A2 */  jal     Matrix_NewMtx              
/* 006E8 80BA6758 AFA20050 */  sw      $v0, 0x0050($sp)           
/* 006EC 80BA675C 8FA30050 */  lw      $v1, 0x0050($sp)           
/* 006F0 80BA6760 3C0B80BA */  lui     $t3, %hi(D_80BA6E10)       ## $t3 = 80BA0000
/* 006F4 80BA6764 256B6E10 */  addiu   $t3, $t3, %lo(D_80BA6E10)  ## $t3 = 80BA6E10
/* 006F8 80BA6768 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 006FC 80BA676C 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 00700 80BA6770 3C09DE00 */  lui     $t1, 0xDE00                ## $t1 = DE000000
/* 00704 80BA6774 240D0020 */  addiu   $t5, $zero, 0x0020         ## $t5 = 00000020
/* 00708 80BA6778 244A0008 */  addiu   $t2, $v0, 0x0008           ## $t2 = 00000008
/* 0070C 80BA677C AE0A02D0 */  sw      $t2, 0x02D0($s0)           ## 000002D0
/* 00710 80BA6780 AC490000 */  sw      $t1, 0x0000($v0)           ## 00000000
/* 00714 80BA6784 AC4B0004 */  sw      $t3, 0x0004($v0)           ## 00000004
/* 00718 80BA6788 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 0071C 80BA678C 8FA80068 */  lw      $t0, 0x0068($sp)           
/* 00720 80BA6790 240A0020 */  addiu   $t2, $zero, 0x0020         ## $t2 = 00000020
/* 00724 80BA6794 244C0008 */  addiu   $t4, $v0, 0x0008           ## $t4 = 00000008
/* 00728 80BA6798 AE0C02D0 */  sw      $t4, 0x02D0($s0)           ## 000002D0
/* 0072C 80BA679C AC490000 */  sw      $t1, 0x0000($v0)           ## 00000000
/* 00730 80BA67A0 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 00734 80BA67A4 00080823 */  subu    $at, $zero, $t0            
/* 00738 80BA67A8 0001C0C0 */  sll     $t8, $at,  3               
/* 0073C 80BA67AC 240E0020 */  addiu   $t6, $zero, 0x0020         ## $t6 = 00000020
/* 00740 80BA67B0 240F0001 */  addiu   $t7, $zero, 0x0001         ## $t7 = 00000001
/* 00744 80BA67B4 24190020 */  addiu   $t9, $zero, 0x0020         ## $t9 = 00000020
/* 00748 80BA67B8 AFB90024 */  sw      $t9, 0x0024($sp)           
/* 0074C 80BA67BC AFAF0018 */  sw      $t7, 0x0018($sp)           
/* 00750 80BA67C0 AFAE0014 */  sw      $t6, 0x0014($sp)           
/* 00754 80BA67C4 AFB80020 */  sw      $t8, 0x0020($sp)           
/* 00758 80BA67C8 00013840 */  sll     $a3, $at,  1               
/* 0075C 80BA67CC AFAA0028 */  sw      $t2, 0x0028($sp)           
/* 00760 80BA67D0 AFA0001C */  sw      $zero, 0x001C($sp)         
/* 00764 80BA67D4 AFAD0010 */  sw      $t5, 0x0010($sp)           
/* 00768 80BA67D8 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 0076C 80BA67DC AFA20048 */  sw      $v0, 0x0048($sp)           
/* 00770 80BA67E0 0C0253D0 */  jal     Gfx_TwoTexScroll              
/* 00774 80BA67E4 00083040 */  sll     $a2, $t0,  1               
/* 00778 80BA67E8 8FA30048 */  lw      $v1, 0x0048($sp)           
/* 0077C 80BA67EC 3C0D80BA */  lui     $t5, %hi(D_80BA6EA8)       ## $t5 = 80BA0000
/* 00780 80BA67F0 25AD6EA8 */  addiu   $t5, $t5, %lo(D_80BA6EA8)  ## $t5 = 80BA6EA8
/* 00784 80BA67F4 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 00788 80BA67F8 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 0078C 80BA67FC 3C0CDE00 */  lui     $t4, 0xDE00                ## $t4 = DE000000
/* 00790 80BA6800 3C0680BA */  lui     $a2, %hi(D_80BA6FBC)       ## $a2 = 80BA0000
/* 00794 80BA6804 244B0008 */  addiu   $t3, $v0, 0x0008           ## $t3 = 00000008
/* 00798 80BA6808 AE0B02D0 */  sw      $t3, 0x02D0($s0)           ## 000002D0
/* 0079C 80BA680C AC4D0004 */  sw      $t5, 0x0004($v0)           ## 00000004
/* 007A0 80BA6810 AC4C0000 */  sw      $t4, 0x0000($v0)           ## 00000000
/* 007A4 80BA6814 8E250000 */  lw      $a1, 0x0000($s1)           ## 00000000
/* 007A8 80BA6818 24C66FBC */  addiu   $a2, $a2, %lo(D_80BA6FBC)  ## $a2 = 80BA6FBC
/* 007AC 80BA681C 27A40054 */  addiu   $a0, $sp, 0x0054           ## $a0 = FFFFFFE4
/* 007B0 80BA6820 0C031AD5 */  jal     Graph_CloseDisps              
/* 007B4 80BA6824 240701E5 */  addiu   $a3, $zero, 0x01E5         ## $a3 = 000001E5
/* 007B8 80BA6828 8FBF003C */  lw      $ra, 0x003C($sp)           
/* 007BC 80BA682C 8FB00034 */  lw      $s0, 0x0034($sp)           
/* 007C0 80BA6830 8FB10038 */  lw      $s1, 0x0038($sp)           
/* 007C4 80BA6834 03E00008 */  jr      $ra                        
/* 007C8 80BA6838 27BD0070 */  addiu   $sp, $sp, 0x0070           ## $sp = 00000000
/* 007CC 80BA683C 00000000 */  nop
