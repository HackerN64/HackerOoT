.rdata
glabel D_80B9EEF0
    .asciz "../z_obj_switch.c"
    .balign 4

glabel D_80B9EF04
    .asciz "../z_obj_switch.c"
    .balign 4

glabel D_80B9EF18
    .asciz "../z_obj_switch.c"
    .balign 4

glabel D_80B9EF2C
    .asciz "../z_obj_switch.c"
    .balign 4

glabel D_80B9EF40
    .asciz "../z_obj_switch.c"
    .balign 4

glabel D_80B9EF54
    .asciz "../z_obj_switch.c"
    .balign 4

.text
glabel func_80B9E904
/* 016F4 80B9E904 27BDFF60 */  addiu   $sp, $sp, 0xFF60           ## $sp = FFFFFF60
/* 016F8 80B9E908 AFBF003C */  sw      $ra, 0x003C($sp)           
/* 016FC 80B9E90C AFB10038 */  sw      $s1, 0x0038($sp)           
/* 01700 80B9E910 AFB00034 */  sw      $s0, 0x0034($sp)           
/* 01704 80B9E914 848E001C */  lh      $t6, 0x001C($a0)           ## 0000001C
/* 01708 80B9E918 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 0170C 80B9E91C 00A08825 */  or      $s1, $a1, $zero            ## $s1 = 00000000
/* 01710 80B9E920 000E7903 */  sra     $t7, $t6,  4               
/* 01714 80B9E924 31F80007 */  andi    $t8, $t7, 0x0007           ## $t8 = 00000000
/* 01718 80B9E928 AFB80094 */  sw      $t8, 0x0094($sp)           
/* 0171C 80B9E92C 0C00BB60 */  jal     func_8002ED80              
/* 01720 80B9E930 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 01724 80B9E934 8E250000 */  lw      $a1, 0x0000($s1)           ## 00000000
/* 01728 80B9E938 3C0680BA */  lui     $a2, %hi(D_80B9EEF0)       ## $a2 = 80BA0000
/* 0172C 80B9E93C 24C6EEF0 */  addiu   $a2, $a2, %lo(D_80B9EEF0)  ## $a2 = 80B9EEF0
/* 01730 80B9E940 27A40080 */  addiu   $a0, $sp, 0x0080           ## $a0 = FFFFFFE0
/* 01734 80B9E944 240705D6 */  addiu   $a3, $zero, 0x05D6         ## $a3 = 000005D6
/* 01738 80B9E948 0C031AB1 */  jal     Graph_OpenDisps              
/* 0173C 80B9E94C AFA50090 */  sw      $a1, 0x0090($sp)           
/* 01740 80B9E950 0C024F61 */  jal     func_80093D84              
/* 01744 80B9E954 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 01748 80B9E958 8FA70090 */  lw      $a3, 0x0090($sp)           
/* 0174C 80B9E95C 3C0ADA38 */  lui     $t2, 0xDA38                ## $t2 = DA380000
/* 01750 80B9E960 354A0003 */  ori     $t2, $t2, 0x0003           ## $t2 = DA380003
/* 01754 80B9E964 8CE202D0 */  lw      $v0, 0x02D0($a3)           ## 000002D0
/* 01758 80B9E968 3C0580BA */  lui     $a1, %hi(D_80B9EF04)       ## $a1 = 80BA0000
/* 0175C 80B9E96C 24A5EF04 */  addiu   $a1, $a1, %lo(D_80B9EF04)  ## $a1 = 80B9EF04
/* 01760 80B9E970 24590008 */  addiu   $t9, $v0, 0x0008           ## $t9 = 00000008
/* 01764 80B9E974 ACF902D0 */  sw      $t9, 0x02D0($a3)           ## 000002D0
/* 01768 80B9E978 AC4A0000 */  sw      $t2, 0x0000($v0)           ## 00000000
/* 0176C 80B9E97C 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 01770 80B9E980 240605D9 */  addiu   $a2, $zero, 0x05D9         ## $a2 = 000005D9
/* 01774 80B9E984 0C0346A2 */  jal     Matrix_NewMtx              
/* 01778 80B9E988 AFA2007C */  sw      $v0, 0x007C($sp)           
/* 0177C 80B9E98C 8FA3007C */  lw      $v1, 0x007C($sp)           
/* 01780 80B9E990 3C0DDE00 */  lui     $t5, 0xDE00                ## $t5 = DE000000
/* 01784 80B9E994 3C0E80BA */  lui     $t6, %hi(D_80B9EDC0)       ## $t6 = 80BA0000
/* 01788 80B9E998 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 0178C 80B9E99C 8FAB0090 */  lw      $t3, 0x0090($sp)           
/* 01790 80B9E9A0 25CEEDC0 */  addiu   $t6, $t6, %lo(D_80B9EDC0)  ## $t6 = 80B9EDC0
/* 01794 80B9E9A4 3C0680BA */  lui     $a2, %hi(D_80B9EF18)       ## $a2 = 80BA0000
/* 01798 80B9E9A8 8D6202D0 */  lw      $v0, 0x02D0($t3)           ## 000002D0
/* 0179C 80B9E9AC 24C6EF18 */  addiu   $a2, $a2, %lo(D_80B9EF18)  ## $a2 = 80B9EF18
/* 017A0 80B9E9B0 27A40080 */  addiu   $a0, $sp, 0x0080           ## $a0 = FFFFFFE0
/* 017A4 80B9E9B4 244C0008 */  addiu   $t4, $v0, 0x0008           ## $t4 = 00000008
/* 017A8 80B9E9B8 AD6C02D0 */  sw      $t4, 0x02D0($t3)           ## 000002D0
/* 017AC 80B9E9BC AC4D0000 */  sw      $t5, 0x0000($v0)           ## 00000000
/* 017B0 80B9E9C0 8FA80094 */  lw      $t0, 0x0094($sp)           
/* 017B4 80B9E9C4 240705DE */  addiu   $a3, $zero, 0x05DE         ## $a3 = 000005DE
/* 017B8 80B9E9C8 00084080 */  sll     $t0, $t0,  2               
/* 017BC 80B9E9CC 010E4821 */  addu    $t1, $t0, $t6              
/* 017C0 80B9E9D0 8D2F0000 */  lw      $t7, 0x0000($t1)           ## 00000000
/* 017C4 80B9E9D4 AC4F0004 */  sw      $t7, 0x0004($v0)           ## 00000004
/* 017C8 80B9E9D8 8E250000 */  lw      $a1, 0x0000($s1)           ## 00000000
/* 017CC 80B9E9DC AFA90048 */  sw      $t1, 0x0048($sp)           
/* 017D0 80B9E9E0 0C031AD5 */  jal     Graph_CloseDisps              
/* 017D4 80B9E9E4 AFA8004C */  sw      $t0, 0x004C($sp)           
/* 017D8 80B9E9E8 8E250000 */  lw      $a1, 0x0000($s1)           ## 00000000
/* 017DC 80B9E9EC 3C0680BA */  lui     $a2, %hi(D_80B9EF2C)       ## $a2 = 80BA0000
/* 017E0 80B9E9F0 24C6EF2C */  addiu   $a2, $a2, %lo(D_80B9EF2C)  ## $a2 = 80B9EF2C
/* 017E4 80B9E9F4 27A40064 */  addiu   $a0, $sp, 0x0064           ## $a0 = FFFFFFC4
/* 017E8 80B9E9F8 240705E3 */  addiu   $a3, $zero, 0x05E3         ## $a3 = 000005E3
/* 017EC 80B9E9FC 0C031AB1 */  jal     Graph_OpenDisps              
/* 017F0 80B9EA00 AFA50074 */  sw      $a1, 0x0074($sp)           
/* 017F4 80B9EA04 0C024F46 */  jal     func_80093D18              
/* 017F8 80B9EA08 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 017FC 80B9EA0C 8FA80074 */  lw      $t0, 0x0074($sp)           
/* 01800 80B9EA10 3C19DA38 */  lui     $t9, 0xDA38                ## $t9 = DA380000
/* 01804 80B9EA14 37390003 */  ori     $t9, $t9, 0x0003           ## $t9 = DA380003
/* 01808 80B9EA18 8D0202C0 */  lw      $v0, 0x02C0($t0)           ## 000002C0
/* 0180C 80B9EA1C 3C0580BA */  lui     $a1, %hi(D_80B9EF40)       ## $a1 = 80BA0000
/* 01810 80B9EA20 24A5EF40 */  addiu   $a1, $a1, %lo(D_80B9EF40)  ## $a1 = 80B9EF40
/* 01814 80B9EA24 24580008 */  addiu   $t8, $v0, 0x0008           ## $t8 = 00000008
/* 01818 80B9EA28 AD1802C0 */  sw      $t8, 0x02C0($t0)           ## 000002C0
/* 0181C 80B9EA2C AC590000 */  sw      $t9, 0x0000($v0)           ## 00000000
/* 01820 80B9EA30 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 01824 80B9EA34 240605E7 */  addiu   $a2, $zero, 0x05E7         ## $a2 = 000005E7
/* 01828 80B9EA38 AFA80074 */  sw      $t0, 0x0074($sp)           
/* 0182C 80B9EA3C 0C0346A2 */  jal     Matrix_NewMtx              
/* 01830 80B9EA40 AFA20060 */  sw      $v0, 0x0060($sp)           
/* 01834 80B9EA44 8FA30060 */  lw      $v1, 0x0060($sp)           
/* 01838 80B9EA48 8FA80074 */  lw      $t0, 0x0074($sp)           
/* 0183C 80B9EA4C 3C0C80BA */  lui     $t4, %hi(D_80B9EDC4)       ## $t4 = 80BA0000
/* 01840 80B9EA50 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 01844 80B9EA54 8FAA0048 */  lw      $t2, 0x0048($sp)           
/* 01848 80B9EA58 258CEDC4 */  addiu   $t4, $t4, %lo(D_80B9EDC4)  ## $t4 = 80B9EDC4
/* 0184C 80B9EA5C 3C0DDB06 */  lui     $t5, 0xDB06                ## $t5 = DB060000
/* 01850 80B9EA60 554C0015 */  bnel    $t2, $t4, .L80B9EAB8       
/* 01854 80B9EA64 8D0202C0 */  lw      $v0, 0x02C0($t0)           ## 000002C0
/* 01858 80B9EA68 8D0202C0 */  lw      $v0, 0x02C0($t0)           ## 000002C0
/* 0185C 80B9EA6C 35AD0024 */  ori     $t5, $t5, 0x0024           ## $t5 = DB060024
/* 01860 80B9EA70 3C198016 */  lui     $t9, %hi(gSegments)
/* 01864 80B9EA74 244B0008 */  addiu   $t3, $v0, 0x0008           ## $t3 = 00000008
/* 01868 80B9EA78 AD0B02C0 */  sw      $t3, 0x02C0($t0)           ## 000002C0
/* 0186C 80B9EA7C AC4D0000 */  sw      $t5, 0x0000($v0)           ## 00000000
/* 01870 80B9EA80 8E040174 */  lw      $a0, 0x0174($s0)           ## 00000174
/* 01874 80B9EA84 3C0100FF */  lui     $at, 0x00FF                ## $at = 00FF0000
/* 01878 80B9EA88 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = 00FFFFFF
/* 0187C 80B9EA8C 00047100 */  sll     $t6, $a0,  4               
/* 01880 80B9EA90 000E7F02 */  srl     $t7, $t6, 28               
/* 01884 80B9EA94 000FC080 */  sll     $t8, $t7,  2               
/* 01888 80B9EA98 0338C821 */  addu    $t9, $t9, $t8              
/* 0188C 80B9EA9C 8F396FA8 */  lw      $t9, %lo(gSegments)($t9)
/* 01890 80B9EAA0 00815024 */  and     $t2, $a0, $at              
/* 01894 80B9EAA4 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 01898 80B9EAA8 032A6021 */  addu    $t4, $t9, $t2              
/* 0189C 80B9EAAC 01815821 */  addu    $t3, $t4, $at              
/* 018A0 80B9EAB0 AC4B0004 */  sw      $t3, 0x0004($v0)           ## 00000004
/* 018A4 80B9EAB4 8D0202C0 */  lw      $v0, 0x02C0($t0)           ## 000002C0
.L80B9EAB8:
/* 018A8 80B9EAB8 3C0EFB00 */  lui     $t6, 0xFB00                ## $t6 = FB000000
/* 018AC 80B9EABC 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 018B0 80B9EAC0 244D0008 */  addiu   $t5, $v0, 0x0008           ## $t5 = 00000008
/* 018B4 80B9EAC4 AD0D02C0 */  sw      $t5, 0x02C0($t0)           ## 000002C0
/* 018B8 80B9EAC8 AC4E0000 */  sw      $t6, 0x0000($v0)           ## 00000000
/* 018BC 80B9EACC 9218017C */  lbu     $t8, 0x017C($s0)           ## 0000017C
/* 018C0 80B9EAD0 920C017D */  lbu     $t4, 0x017D($s0)           ## 0000017D
/* 018C4 80B9EAD4 920F017E */  lbu     $t7, 0x017E($s0)           ## 0000017E
/* 018C8 80B9EAD8 0018CE00 */  sll     $t9, $t8, 24               
/* 018CC 80B9EADC 000C5C00 */  sll     $t3, $t4, 16               
/* 018D0 80B9EAE0 032B6825 */  or      $t5, $t9, $t3              ## $t5 = 80160008
/* 018D4 80B9EAE4 000FC200 */  sll     $t8, $t7,  8               
/* 018D8 80B9EAE8 01B85025 */  or      $t2, $t5, $t8              ## $t2 = 80160008
/* 018DC 80B9EAEC 354C0080 */  ori     $t4, $t2, 0x0080           ## $t4 = 80160088
/* 018E0 80B9EAF0 AC4C0004 */  sw      $t4, 0x0004($v0)           ## 00000004
/* 018E4 80B9EAF4 8D0202C0 */  lw      $v0, 0x02C0($t0)           ## 000002C0
/* 018E8 80B9EAF8 3C0BDB06 */  lui     $t3, 0xDB06                ## $t3 = DB060000
/* 018EC 80B9EAFC 356B0020 */  ori     $t3, $t3, 0x0020           ## $t3 = DB060020
/* 018F0 80B9EB00 24590008 */  addiu   $t9, $v0, 0x0008           ## $t9 = 00000008
/* 018F4 80B9EB04 AD1902C0 */  sw      $t9, 0x02C0($t0)           ## 000002C0
/* 018F8 80B9EB08 AC4B0000 */  sw      $t3, 0x0000($v0)           ## 00000000
/* 018FC 80B9EB0C 92070179 */  lbu     $a3, 0x0179($s0)           ## 00000179
/* 01900 80B9EB10 92060178 */  lbu     $a2, 0x0178($s0)           ## 00000178
/* 01904 80B9EB14 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 01908 80B9EB18 240D0001 */  addiu   $t5, $zero, 0x0001         ## $t5 = 00000001
/* 0190C 80B9EB1C 240F0020 */  addiu   $t7, $zero, 0x0020         ## $t7 = 00000020
/* 01910 80B9EB20 240E0020 */  addiu   $t6, $zero, 0x0020         ## $t6 = 00000020
/* 01914 80B9EB24 AFAE0010 */  sw      $t6, 0x0010($sp)           
/* 01918 80B9EB28 AFAF0014 */  sw      $t7, 0x0014($sp)           
/* 0191C 80B9EB2C AFAD0018 */  sw      $t5, 0x0018($sp)           
/* 01920 80B9EB30 9218017A */  lbu     $t8, 0x017A($s0)           ## 0000017A
/* 01924 80B9EB34 24190020 */  addiu   $t9, $zero, 0x0020         ## $t9 = 00000020
/* 01928 80B9EB38 240C0020 */  addiu   $t4, $zero, 0x0020         ## $t4 = 00000020
/* 0192C 80B9EB3C AFB8001C */  sw      $t8, 0x001C($sp)           
/* 01930 80B9EB40 920A017B */  lbu     $t2, 0x017B($s0)           ## 0000017B
/* 01934 80B9EB44 AFA80074 */  sw      $t0, 0x0074($sp)           
/* 01938 80B9EB48 AFB90028 */  sw      $t9, 0x0028($sp)           
/* 0193C 80B9EB4C AFAC0024 */  sw      $t4, 0x0024($sp)           
/* 01940 80B9EB50 AFA20054 */  sw      $v0, 0x0054($sp)           
/* 01944 80B9EB54 0C0253D0 */  jal     Gfx_TwoTexScroll              
/* 01948 80B9EB58 AFAA0020 */  sw      $t2, 0x0020($sp)           
/* 0194C 80B9EB5C 8FA30054 */  lw      $v1, 0x0054($sp)           
/* 01950 80B9EB60 8FA80074 */  lw      $t0, 0x0074($sp)           
/* 01954 80B9EB64 3C0EDE00 */  lui     $t6, 0xDE00                ## $t6 = DE000000
/* 01958 80B9EB68 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 0195C 80B9EB6C 8D0202C0 */  lw      $v0, 0x02C0($t0)           ## 000002C0
/* 01960 80B9EB70 3C0D80BA */  lui     $t5, %hi(D_80B9EDD4)       ## $t5 = 80BA0000
/* 01964 80B9EB74 3C0680BA */  lui     $a2, %hi(D_80B9EF54)       ## $a2 = 80BA0000
/* 01968 80B9EB78 244B0008 */  addiu   $t3, $v0, 0x0008           ## $t3 = 00000008
/* 0196C 80B9EB7C AD0B02C0 */  sw      $t3, 0x02C0($t0)           ## 000002C0
/* 01970 80B9EB80 AC4E0000 */  sw      $t6, 0x0000($v0)           ## 00000000
/* 01974 80B9EB84 8FAF004C */  lw      $t7, 0x004C($sp)           
/* 01978 80B9EB88 24C6EF54 */  addiu   $a2, $a2, %lo(D_80B9EF54)  ## $a2 = 80B9EF54
/* 0197C 80B9EB8C 27A40064 */  addiu   $a0, $sp, 0x0064           ## $a0 = FFFFFFC4
/* 01980 80B9EB90 01AF6821 */  addu    $t5, $t5, $t7              
/* 01984 80B9EB94 8DADEDD4 */  lw      $t5, %lo(D_80B9EDD4)($t5)  
/* 01988 80B9EB98 240705FD */  addiu   $a3, $zero, 0x05FD         ## $a3 = 000005FD
/* 0198C 80B9EB9C AC4D0004 */  sw      $t5, 0x0004($v0)           ## 00000004
/* 01990 80B9EBA0 0C031AD5 */  jal     Graph_CloseDisps              
/* 01994 80B9EBA4 8E250000 */  lw      $a1, 0x0000($s1)           ## 00000000
/* 01998 80B9EBA8 8FBF003C */  lw      $ra, 0x003C($sp)           
/* 0199C 80B9EBAC 8FB00034 */  lw      $s0, 0x0034($sp)           
/* 019A0 80B9EBB0 8FB10038 */  lw      $s1, 0x0038($sp)           
/* 019A4 80B9EBB4 03E00008 */  jr      $ra                        
/* 019A8 80B9EBB8 27BD00A0 */  addiu   $sp, $sp, 0x00A0           ## $sp = 00000000
