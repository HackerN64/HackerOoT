.rdata
glabel D_808F7A8C
    .asciz "../z_boss_ganon.c"
    .balign 4

glabel D_808F7AA0
    .asciz "../z_boss_ganon.c"
    .balign 4

glabel D_808F7AB4
    .asciz "../z_boss_ganon.c"
    .balign 4

glabel D_808F7AC8
    .asciz "../z_boss_ganon.c"
    .balign 4

.late_rodata
glabel D_808F8138
    .float 3.14159274101

glabel D_808F813C
    .float 3.14159274101

.text
glabel func_808DEE70
/* 08600 808DEE70 27BDFF38 */  addiu   $sp, $sp, 0xFF38           ## $sp = FFFFFF38
/* 08604 808DEE74 AFBF0064 */  sw      $ra, 0x0064($sp)           
/* 08608 808DEE78 AFBE0060 */  sw      $s8, 0x0060($sp)           
/* 0860C 808DEE7C AFB7005C */  sw      $s7, 0x005C($sp)           
/* 08610 808DEE80 AFB60058 */  sw      $s6, 0x0058($sp)           
/* 08614 808DEE84 AFB50054 */  sw      $s5, 0x0054($sp)           
/* 08618 808DEE88 AFB40050 */  sw      $s4, 0x0050($sp)           
/* 0861C 808DEE8C AFB3004C */  sw      $s3, 0x004C($sp)           
/* 08620 808DEE90 AFB20048 */  sw      $s2, 0x0048($sp)           
/* 08624 808DEE94 AFB10044 */  sw      $s1, 0x0044($sp)           
/* 08628 808DEE98 AFB00040 */  sw      $s0, 0x0040($sp)           
/* 0862C 808DEE9C F7B40038 */  sdc1    $f20, 0x0038($sp)          
/* 08630 808DEEA0 AFA500CC */  sw      $a1, 0x00CC($sp)           
/* 08634 808DEEA4 8CB10000 */  lw      $s1, 0x0000($a1)           ## 00000000
/* 08638 808DEEA8 0080A025 */  or      $s4, $a0, $zero            ## $s4 = 00000000
/* 0863C 808DEEAC 3C06808F */  lui     $a2, %hi(D_808F7A8C)       ## $a2 = 808F0000
/* 08640 808DEEB0 24C67A8C */  addiu   $a2, $a2, %lo(D_808F7A8C)  ## $a2 = 808F7A8C
/* 08644 808DEEB4 27A400A8 */  addiu   $a0, $sp, 0x00A8           ## $a0 = FFFFFFE0
/* 08648 808DEEB8 24071CB6 */  addiu   $a3, $zero, 0x1CB6         ## $a3 = 00001CB6
/* 0864C 808DEEBC 0C031AB1 */  jal     Graph_OpenDisps              
/* 08650 808DEEC0 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 08654 808DEEC4 868F02E8 */  lh      $t7, 0x02E8($s4)           ## 000002E8
/* 08658 808DEEC8 8FB900CC */  lw      $t9, 0x00CC($sp)           
/* 0865C 808DEECC 15E00004 */  bne     $t7, $zero, .L808DEEE0     
/* 08660 808DEED0 00000000 */  nop
/* 08664 808DEED4 869802E6 */  lh      $t8, 0x02E6($s4)           ## 000002E6
/* 08668 808DEED8 130000CD */  beq     $t8, $zero, .L808DF210     
/* 0866C 808DEEDC 00000000 */  nop
.L808DEEE0:
/* 08670 808DEEE0 0C024F61 */  jal     func_80093D84              
/* 08674 808DEEE4 8F240000 */  lw      $a0, 0x0000($t9)           ## 00000000
/* 08678 808DEEE8 8E2202D0 */  lw      $v0, 0x02D0($s1)           ## 000002D0
/* 0867C 808DEEEC 3C0AFA00 */  lui     $t2, 0xFA00                ## $t2 = FA000000
/* 08680 808DEEF0 240BFFFF */  addiu   $t3, $zero, 0xFFFF         ## $t3 = FFFFFFFF
/* 08684 808DEEF4 24490008 */  addiu   $t1, $v0, 0x0008           ## $t1 = 00000008
/* 08688 808DEEF8 AE2902D0 */  sw      $t1, 0x02D0($s1)           ## 000002D0
/* 0868C 808DEEFC AC4B0004 */  sw      $t3, 0x0004($v0)           ## 00000004
/* 08690 808DEF00 AC4A0000 */  sw      $t2, 0x0000($v0)           ## 00000000
/* 08694 808DEF04 8E2202D0 */  lw      $v0, 0x02D0($s1)           ## 000002D0
/* 08698 808DEF08 3C0DFB00 */  lui     $t5, 0xFB00                ## $t5 = FB000000
/* 0869C 808DEF0C 3C0EFFFF */  lui     $t6, 0xFFFF                ## $t6 = FFFF0000
/* 086A0 808DEF10 244C0008 */  addiu   $t4, $v0, 0x0008           ## $t4 = 00000008
/* 086A4 808DEF14 AE2C02D0 */  sw      $t4, 0x02D0($s1)           ## 000002D0
/* 086A8 808DEF18 AC4E0004 */  sw      $t6, 0x0004($v0)           ## 00000004
/* 086AC 808DEF1C AC4D0000 */  sw      $t5, 0x0000($v0)           ## 00000000
/* 086B0 808DEF20 8E2202D0 */  lw      $v0, 0x02D0($s1)           ## 000002D0
/* 086B4 808DEF24 3C18808E */  lui     $t8, %hi(D_808E7DE8)       ## $t8 = 808E0000
/* 086B8 808DEF28 27187DE8 */  addiu   $t8, $t8, %lo(D_808E7DE8)  ## $t8 = 808E7DE8
/* 086BC 808DEF2C 244F0008 */  addiu   $t7, $v0, 0x0008           ## $t7 = 00000008
/* 086C0 808DEF30 AE2F02D0 */  sw      $t7, 0x02D0($s1)           ## 000002D0
/* 086C4 808DEF34 3C15DE00 */  lui     $s5, 0xDE00                ## $s5 = DE000000
/* 086C8 808DEF38 AC550000 */  sw      $s5, 0x0000($v0)           ## 00000000
/* 086CC 808DEF3C AC580004 */  sw      $t8, 0x0004($v0)           ## 00000004
/* 086D0 808DEF40 869902E8 */  lh      $t9, 0x02E8($s4)           ## 000002E8
/* 086D4 808DEF44 8FB600CC */  lw      $s6, 0x00CC($sp)           
/* 086D8 808DEF48 24120001 */  addiu   $s2, $zero, 0x0001         ## $s2 = 00000001
/* 086DC 808DEF4C 1320003D */  beq     $t9, $zero, .L808DF044     
/* 086E0 808DEF50 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 086E4 808DEF54 8FA200CC */  lw      $v0, 0x00CC($sp)           
/* 086E8 808DEF58 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 086EC 808DEF5C 34211DA0 */  ori     $at, $at, 0x1DA0           ## $at = 00011DA0
/* 086F0 808DEF60 8C431C44 */  lw      $v1, 0x1C44($v0)           ## 00001C44
/* 086F4 808DEF64 0041B021 */  addu    $s6, $v0, $at              
/* 086F8 808DEF68 3C018090 */  lui     $at, %hi(D_808F8138)       ## $at = 80900000
/* 086FC 808DEF6C 3C13808E */  lui     $s3, %hi(D_808E7E58)       ## $s3 = 808E0000
/* 08700 808DEF70 3C1EDA38 */  lui     $s8, 0xDA38                ## $s8 = DA380000
/* 08704 808DEF74 37DE0003 */  ori     $s8, $s8, 0x0003           ## $s8 = DA380003
/* 08708 808DEF78 26737E58 */  addiu   $s3, $s3, %lo(D_808E7E58)  ## $s3 = 808E7E58
/* 0870C 808DEF7C C4348138 */  lwc1    $f20, %lo(D_808F8138)($at) 
/* 08710 808DEF80 00009025 */  or      $s2, $zero, $zero          ## $s2 = 00000000
/* 08714 808DEF84 2417000C */  addiu   $s7, $zero, 0x000C         ## $s7 = 0000000C
/* 08718 808DEF88 AFA30098 */  sw      $v1, 0x0098($sp)           
.L808DEF8C:
/* 0871C 808DEF8C 02570019 */  multu   $s2, $s7                   
/* 08720 808DEF90 8FA30098 */  lw      $v1, 0x0098($sp)           
/* 08724 808DEF94 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 08728 808DEF98 00004812 */  mflo    $t1                        
/* 0872C 808DEF9C 00691021 */  addu    $v0, $v1, $t1              
/* 08730 808DEFA0 C44C0908 */  lwc1    $f12, 0x0908($v0)          ## 00000908
/* 08734 808DEFA4 C44E090C */  lwc1    $f14, 0x090C($v0)          ## 0000090C
/* 08738 808DEFA8 0C034261 */  jal     Matrix_Translate              
/* 0873C 808DEFAC 8C460910 */  lw      $a2, 0x0910($v0)           ## 00000910
/* 08740 808DEFB0 0C0347F5 */  jal     func_800D1FD4              
/* 08744 808DEFB4 02C02025 */  or      $a0, $s6, $zero            ## $a0 = 00000000
/* 08748 808DEFB8 00125080 */  sll     $t2, $s2,  2               
/* 0874C 808DEFBC 028A5821 */  addu    $t3, $s4, $t2              
/* 08750 808DEFC0 C56C049C */  lwc1    $f12, 0x049C($t3)          ## 0000049C
/* 08754 808DEFC4 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 08758 808DEFC8 44066000 */  mfc1    $a2, $f12                  
/* 0875C 808DEFCC 0C0342A3 */  jal     Matrix_Scale              
/* 08760 808DEFD0 46006386 */  mov.s   $f14, $f12                 
/* 08764 808DEFD4 0C00CFC8 */  jal     Rand_CenteredFloat
              
/* 08768 808DEFD8 4600A306 */  mov.s   $f12, $f20                 
/* 0876C 808DEFDC 46000306 */  mov.s   $f12, $f0                  
/* 08770 808DEFE0 0C0343B5 */  jal     Matrix_RotateZ              
/* 08774 808DEFE4 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 08778 808DEFE8 8E2202D0 */  lw      $v0, 0x02D0($s1)           ## 000002D0
/* 0877C 808DEFEC 3C05808F */  lui     $a1, %hi(D_808F7AA0)       ## $a1 = 808F0000
/* 08780 808DEFF0 24A57AA0 */  addiu   $a1, $a1, %lo(D_808F7AA0)  ## $a1 = 808F7AA0
/* 08784 808DEFF4 244C0008 */  addiu   $t4, $v0, 0x0008           ## $t4 = 00000008
/* 08788 808DEFF8 AE2C02D0 */  sw      $t4, 0x02D0($s1)           ## 000002D0
/* 0878C 808DEFFC 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 08790 808DF000 24061CD8 */  addiu   $a2, $zero, 0x1CD8         ## $a2 = 00001CD8
/* 08794 808DF004 AC5E0000 */  sw      $s8, 0x0000($v0)           ## 00000000
/* 08798 808DF008 0C0346A2 */  jal     Matrix_NewMtx              
/* 0879C 808DF00C 00408025 */  or      $s0, $v0, $zero            ## $s0 = 00000000
/* 087A0 808DF010 AE020004 */  sw      $v0, 0x0004($s0)           ## 00000004
/* 087A4 808DF014 8E2202D0 */  lw      $v0, 0x02D0($s1)           ## 000002D0
/* 087A8 808DF018 26520001 */  addiu   $s2, $s2, 0x0001           ## $s2 = 00000001
/* 087AC 808DF01C 00129400 */  sll     $s2, $s2, 16               
/* 087B0 808DF020 00129403 */  sra     $s2, $s2, 16               
/* 087B4 808DF024 244D0008 */  addiu   $t5, $v0, 0x0008           ## $t5 = 00000008
/* 087B8 808DF028 2A410012 */  slti    $at, $s2, 0x0012           
/* 087BC 808DF02C AE2D02D0 */  sw      $t5, 0x02D0($s1)           ## 000002D0
/* 087C0 808DF030 AC530004 */  sw      $s3, 0x0004($v0)           ## 00000004
/* 087C4 808DF034 1420FFD5 */  bne     $at, $zero, .L808DEF8C     
/* 087C8 808DF038 AC550000 */  sw      $s5, 0x0000($v0)           ## 00000000
/* 087CC 808DF03C 10000074 */  beq     $zero, $zero, .L808DF210   
/* 087D0 808DF040 00000000 */  nop
.L808DF044:
/* 087D4 808DF044 34211DA0 */  ori     $at, $at, 0x1DA0           ## $at = 00001DA0
/* 087D8 808DF048 02C1B021 */  addu    $s6, $s6, $at              
/* 087DC 808DF04C 3C018090 */  lui     $at, %hi(D_808F813C)       ## $at = 80900000
/* 087E0 808DF050 3C1EDA38 */  lui     $s8, 0xDA38                ## $s8 = DA380000
/* 087E4 808DF054 37DE0003 */  ori     $s8, $s8, 0x0003           ## $s8 = DA380003
/* 087E8 808DF058 C434813C */  lwc1    $f20, %lo(D_808F813C)($at) 
/* 087EC 808DF05C 2417000C */  addiu   $s7, $zero, 0x000C         ## $s7 = 0000000C
.L808DF060:
/* 087F0 808DF060 02570019 */  multu   $s2, $s7                   
/* 087F4 808DF064 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 087F8 808DF068 00007012 */  mflo    $t6                        
/* 087FC 808DF06C 028E1021 */  addu    $v0, $s4, $t6              
/* 08800 808DF070 C44C02EC */  lwc1    $f12, 0x02EC($v0)          ## 000002EC
/* 08804 808DF074 C44E02F0 */  lwc1    $f14, 0x02F0($v0)          ## 000002F0
/* 08808 808DF078 0C034261 */  jal     Matrix_Translate              
/* 0880C 808DF07C 8C4602F4 */  lw      $a2, 0x02F4($v0)           ## 000002F4
/* 08810 808DF080 0C0347F5 */  jal     func_800D1FD4              
/* 08814 808DF084 02C02025 */  or      $a0, $s6, $zero            ## $a0 = 00000000
/* 08818 808DF088 00127880 */  sll     $t7, $s2,  2               
/* 0881C 808DF08C 028FC021 */  addu    $t8, $s4, $t7              
/* 08820 808DF090 C70C049C */  lwc1    $f12, 0x049C($t8)          ## 0000049C
/* 08824 808DF094 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 08828 808DF098 44066000 */  mfc1    $a2, $f12                  
/* 0882C 808DF09C 0C0342A3 */  jal     Matrix_Scale              
/* 08830 808DF0A0 46006386 */  mov.s   $f14, $f12                 
/* 08834 808DF0A4 929902E4 */  lbu     $t9, 0x02E4($s4)           ## 000002E4
/* 08838 808DF0A8 57200007 */  bnel    $t9, $zero, .L808DF0C8     
/* 0883C 808DF0AC 8E2202D0 */  lw      $v0, 0x02D0($s1)           ## 000002D0
/* 08840 808DF0B0 0C00CFC8 */  jal     Rand_CenteredFloat
              
/* 08844 808DF0B4 4600A306 */  mov.s   $f12, $f20                 
/* 08848 808DF0B8 46000306 */  mov.s   $f12, $f0                  
/* 0884C 808DF0BC 0C0343B5 */  jal     Matrix_RotateZ              
/* 08850 808DF0C0 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 08854 808DF0C4 8E2202D0 */  lw      $v0, 0x02D0($s1)           ## 000002D0
.L808DF0C8:
/* 08858 808DF0C8 3C05808F */  lui     $a1, %hi(D_808F7AB4)       ## $a1 = 808F0000
/* 0885C 808DF0CC 24A57AB4 */  addiu   $a1, $a1, %lo(D_808F7AB4)  ## $a1 = 808F7AB4
/* 08860 808DF0D0 24490008 */  addiu   $t1, $v0, 0x0008           ## $t1 = 00000008
/* 08864 808DF0D4 AE2902D0 */  sw      $t1, 0x02D0($s1)           ## 000002D0
/* 08868 808DF0D8 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 0886C 808DF0DC 24061CE9 */  addiu   $a2, $zero, 0x1CE9         ## $a2 = 00001CE9
/* 08870 808DF0E0 AC5E0000 */  sw      $s8, 0x0000($v0)           ## 00000000
/* 08874 808DF0E4 0C0346A2 */  jal     Matrix_NewMtx              
/* 08878 808DF0E8 00408025 */  or      $s0, $v0, $zero            ## $s0 = 00000000
/* 0887C 808DF0EC AE020004 */  sw      $v0, 0x0004($s0)           ## 00000004
/* 08880 808DF0F0 928A02E4 */  lbu     $t2, 0x02E4($s4)           ## 000002E4
/* 08884 808DF0F4 3C08808F */  lui     $t0, %hi(D_808F5738)       ## $t0 = 808F0000
/* 08888 808DF0F8 25085738 */  addiu   $t0, $t0, %lo(D_808F5738)  ## $t0 = 808F5738
/* 0888C 808DF0FC 11400037 */  beq     $t2, $zero, .L808DF1DC     
/* 08890 808DF100 3C0CDB06 */  lui     $t4, 0xDB06                ## $t4 = DB060000
/* 08894 808DF104 8E2202D0 */  lw      $v0, 0x02D0($s1)           ## 000002D0
/* 08898 808DF108 358C0020 */  ori     $t4, $t4, 0x0020           ## $t4 = DB060020
/* 0889C 808DF10C 240E0020 */  addiu   $t6, $zero, 0x0020         ## $t6 = 00000020
/* 088A0 808DF110 244B0008 */  addiu   $t3, $v0, 0x0008           ## $t3 = 00000008
/* 088A4 808DF114 AE2B02D0 */  sw      $t3, 0x02D0($s1)           ## 000002D0
/* 088A8 808DF118 AC4C0000 */  sw      $t4, 0x0000($v0)           ## 00000000
/* 088AC 808DF11C 8FAD00CC */  lw      $t5, 0x00CC($sp)           
/* 088B0 808DF120 240F0040 */  addiu   $t7, $zero, 0x0040         ## $t7 = 00000040
/* 088B4 808DF124 24180001 */  addiu   $t8, $zero, 0x0001         ## $t8 = 00000001
/* 088B8 808DF128 8DA40000 */  lw      $a0, 0x0000($t5)           ## 00000000
/* 088BC 808DF12C AFA0001C */  sw      $zero, 0x001C($sp)         
/* 088C0 808DF130 AFB80018 */  sw      $t8, 0x0018($sp)           
/* 088C4 808DF134 AFAF0014 */  sw      $t7, 0x0014($sp)           
/* 088C8 808DF138 AFAE0010 */  sw      $t6, 0x0010($sp)           
/* 088CC 808DF13C 869901A2 */  lh      $t9, 0x01A2($s4)           ## 000001A2
/* 088D0 808DF140 240C0040 */  addiu   $t4, $zero, 0x0040         ## $t4 = 00000040
/* 088D4 808DF144 240B0020 */  addiu   $t3, $zero, 0x0020         ## $t3 = 00000020
/* 088D8 808DF148 03324821 */  addu    $t1, $t9, $s2              
/* 088DC 808DF14C 00090823 */  subu    $at, $zero, $t1            
/* 088E0 808DF150 00015100 */  sll     $t2, $at,  4               
/* 088E4 808DF154 01415023 */  subu    $t2, $t2, $at              
/* 088E8 808DF158 AFAA0020 */  sw      $t2, 0x0020($sp)           
/* 088EC 808DF15C AFAB0024 */  sw      $t3, 0x0024($sp)           
/* 088F0 808DF160 AFAC0028 */  sw      $t4, 0x0028($sp)           
/* 088F4 808DF164 AFA8006C */  sw      $t0, 0x006C($sp)           
/* 088F8 808DF168 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 088FC 808DF16C 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 08900 808DF170 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 08904 808DF174 0C0253D0 */  jal     Gfx_TwoTexScroll              
/* 08908 808DF178 00408025 */  or      $s0, $v0, $zero            ## $s0 = 00000000
/* 0890C 808DF17C 8FA8006C */  lw      $t0, 0x006C($sp)           
/* 08910 808DF180 AE020004 */  sw      $v0, 0x0004($s0)           ## 00000004
/* 08914 808DF184 8E2202D0 */  lw      $v0, 0x02D0($s1)           ## 000002D0
/* 08918 808DF188 3C0FC8FF */  lui     $t7, 0xC8FF                ## $t7 = C8FF0000
/* 0891C 808DF18C 35EFAAFF */  ori     $t7, $t7, 0xAAFF           ## $t7 = C8FFAAFF
/* 08920 808DF190 244D0008 */  addiu   $t5, $v0, 0x0008           ## $t5 = 00000008
/* 08924 808DF194 AE2D02D0 */  sw      $t5, 0x02D0($s1)           ## 000002D0
/* 08928 808DF198 3C0EFA00 */  lui     $t6, 0xFA00                ## $t6 = FA000000
/* 0892C 808DF19C AC4E0000 */  sw      $t6, 0x0000($v0)           ## 00000000
/* 08930 808DF1A0 AC4F0004 */  sw      $t7, 0x0004($v0)           ## 00000004
/* 08934 808DF1A4 8E2202D0 */  lw      $v0, 0x02D0($s1)           ## 000002D0
/* 08938 808DF1A8 3C09FFFF */  lui     $t1, 0xFFFF                ## $t1 = FFFF0000
/* 0893C 808DF1AC 35290080 */  ori     $t1, $t1, 0x0080           ## $t1 = FFFF0080
/* 08940 808DF1B0 24580008 */  addiu   $t8, $v0, 0x0008           ## $t8 = 00000008
/* 08944 808DF1B4 AE3802D0 */  sw      $t8, 0x02D0($s1)           ## 000002D0
/* 08948 808DF1B8 3C19FB00 */  lui     $t9, 0xFB00                ## $t9 = FB000000
/* 0894C 808DF1BC AC590000 */  sw      $t9, 0x0000($v0)           ## 00000000
/* 08950 808DF1C0 AC490004 */  sw      $t1, 0x0004($v0)           ## 00000004
/* 08954 808DF1C4 8E2202D0 */  lw      $v0, 0x02D0($s1)           ## 000002D0
/* 08958 808DF1C8 244A0008 */  addiu   $t2, $v0, 0x0008           ## $t2 = 00000008
/* 0895C 808DF1CC AE2A02D0 */  sw      $t2, 0x02D0($s1)           ## 000002D0
/* 08960 808DF1D0 AC480004 */  sw      $t0, 0x0004($v0)           ## 00000004
/* 08964 808DF1D4 10000008 */  beq     $zero, $zero, .L808DF1F8   
/* 08968 808DF1D8 AC550000 */  sw      $s5, 0x0000($v0)           ## 00000000
.L808DF1DC:
/* 0896C 808DF1DC 8E2202D0 */  lw      $v0, 0x02D0($s1)           ## 000002D0
/* 08970 808DF1E0 3C13808E */  lui     $s3, %hi(D_808E7E58)       ## $s3 = 808E0000
/* 08974 808DF1E4 26737E58 */  addiu   $s3, $s3, %lo(D_808E7E58)  ## $s3 = 808E7E58
/* 08978 808DF1E8 244B0008 */  addiu   $t3, $v0, 0x0008           ## $t3 = 00000008
/* 0897C 808DF1EC AE2B02D0 */  sw      $t3, 0x02D0($s1)           ## 000002D0
/* 08980 808DF1F0 AC530004 */  sw      $s3, 0x0004($v0)           ## 00000004
/* 08984 808DF1F4 AC550000 */  sw      $s5, 0x0000($v0)           ## 00000000
.L808DF1F8:
/* 08988 808DF1F8 26520001 */  addiu   $s2, $s2, 0x0001           ## $s2 = 00000002
/* 0898C 808DF1FC 00129400 */  sll     $s2, $s2, 16               
/* 08990 808DF200 00129403 */  sra     $s2, $s2, 16               
/* 08994 808DF204 2A41000F */  slti    $at, $s2, 0x000F           
/* 08998 808DF208 1420FF95 */  bne     $at, $zero, .L808DF060     
/* 0899C 808DF20C 00000000 */  nop
.L808DF210:
/* 089A0 808DF210 3C06808F */  lui     $a2, %hi(D_808F7AC8)       ## $a2 = 808F0000
/* 089A4 808DF214 24C67AC8 */  addiu   $a2, $a2, %lo(D_808F7AC8)  ## $a2 = 808F7AC8
/* 089A8 808DF218 27A400A8 */  addiu   $a0, $sp, 0x00A8           ## $a0 = FFFFFFE0
/* 089AC 808DF21C 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 089B0 808DF220 0C031AD5 */  jal     Graph_CloseDisps              
/* 089B4 808DF224 24071D29 */  addiu   $a3, $zero, 0x1D29         ## $a3 = 00001D29
/* 089B8 808DF228 8FBF0064 */  lw      $ra, 0x0064($sp)           
/* 089BC 808DF22C D7B40038 */  ldc1    $f20, 0x0038($sp)          
/* 089C0 808DF230 8FB00040 */  lw      $s0, 0x0040($sp)           
/* 089C4 808DF234 8FB10044 */  lw      $s1, 0x0044($sp)           
/* 089C8 808DF238 8FB20048 */  lw      $s2, 0x0048($sp)           
/* 089CC 808DF23C 8FB3004C */  lw      $s3, 0x004C($sp)           
/* 089D0 808DF240 8FB40050 */  lw      $s4, 0x0050($sp)           
/* 089D4 808DF244 8FB50054 */  lw      $s5, 0x0054($sp)           
/* 089D8 808DF248 8FB60058 */  lw      $s6, 0x0058($sp)           
/* 089DC 808DF24C 8FB7005C */  lw      $s7, 0x005C($sp)           
/* 089E0 808DF250 8FBE0060 */  lw      $s8, 0x0060($sp)           
/* 089E4 808DF254 03E00008 */  jr      $ra                        
/* 089E8 808DF258 27BD00C8 */  addiu   $sp, $sp, 0x00C8           ## $sp = 00000000
