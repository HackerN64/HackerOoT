.rdata
glabel D_80A4FE50
    .asciz "../z_en_gs.c"
    .balign 4

glabel D_80A4FE60
    .asciz "../z_en_gs.c"
    .balign 4

glabel D_80A4FE70
    .asciz "../z_en_gs.c"
    .balign 4

glabel D_80A4FE80
    .asciz "../z_en_gs.c"
    .balign 4

.late_rodata
glabel D_80A4FF38
    .float 9.58738019108e-05

glabel D_80A4FF3C
    .float 9.58738019108e-05

glabel D_80A4FF40
    .float 9.58738019108e-05

glabel D_80A4FF44
    .float 9.58738019108e-05

glabel D_80A4FF48
    .float 9.58738019108e-05

glabel D_80A4FF4C
    .float 9.58738019108e-05

glabel D_80A4FF50
    .float 0.05

glabel D_80A4FF54
 .word 0xBD4CCCCD, 0x00000000, 0x00000000

.text
glabel EnGs_Draw
/* 01668 80A4F988 27BDFF70 */  addiu   $sp, $sp, 0xFF70           ## $sp = FFFFFF70
/* 0166C 80A4F98C AFBF003C */  sw      $ra, 0x003C($sp)           
/* 01670 80A4F990 AFB10038 */  sw      $s1, 0x0038($sp)           
/* 01674 80A4F994 AFB00034 */  sw      $s0, 0x0034($sp)           
/* 01678 80A4F998 AFA50094 */  sw      $a1, 0x0094($sp)           
/* 0167C 80A4F99C 908E019E */  lbu     $t6, 0x019E($a0)           ## 0000019E
/* 01680 80A4F9A0 00808825 */  or      $s1, $a0, $zero            ## $s1 = 00000000
/* 01684 80A4F9A4 27A40070 */  addiu   $a0, $sp, 0x0070           ## $a0 = FFFFFFE0
/* 01688 80A4F9A8 31CF0008 */  andi    $t7, $t6, 0x0008           ## $t7 = 00000000
/* 0168C 80A4F9AC 15E000EF */  bne     $t7, $zero, .L80A4FD6C     
/* 01690 80A4F9B0 3C0680A5 */  lui     $a2, %hi(D_80A4FE50)       ## $a2 = 80A50000
/* 01694 80A4F9B4 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 01698 80A4F9B8 24C6FE50 */  addiu   $a2, $a2, %lo(D_80A4FE50)  ## $a2 = 80A4FE50
/* 0169C 80A4F9BC 24070416 */  addiu   $a3, $zero, 0x0416         ## $a3 = 00000416
/* 016A0 80A4F9C0 0C031AB1 */  jal     Graph_OpenDisps              
/* 016A4 80A4F9C4 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 016A8 80A4F9C8 8FA20094 */  lw      $v0, 0x0094($sp)           
/* 016AC 80A4F9CC 3C190001 */  lui     $t9, 0x0001                ## $t9 = 00010000
/* 016B0 80A4F9D0 0322C821 */  addu    $t9, $t9, $v0              
/* 016B4 80A4F9D4 8F391DE4 */  lw      $t9, 0x1DE4($t9)           ## 00011DE4
/* 016B8 80A4F9D8 AFB90084 */  sw      $t9, 0x0084($sp)           
/* 016BC 80A4F9DC 0C024F46 */  jal     func_80093D18              
/* 016C0 80A4F9E0 8C440000 */  lw      $a0, 0x0000($v0)           ## 00000000
/* 016C4 80A4F9E4 0C034213 */  jal     Matrix_Push              
/* 016C8 80A4F9E8 00000000 */  nop
/* 016CC 80A4F9EC 9228019E */  lbu     $t0, 0x019E($s1)           ## 0000019E
/* 016D0 80A4F9F0 31090001 */  andi    $t1, $t0, 0x0001           ## $t1 = 00000000
/* 016D4 80A4F9F4 5120003D */  beql    $t1, $zero, .L80A4FAEC     
/* 016D8 80A4F9F8 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 016DC 80A4F9FC 862A01A2 */  lh      $t2, 0x01A2($s1)           ## 000001A2
/* 016E0 80A4FA00 3C0180A5 */  lui     $at, %hi(D_80A4FF38)       ## $at = 80A50000
/* 016E4 80A4FA04 C428FF38 */  lwc1    $f8, %lo(D_80A4FF38)($at)  
/* 016E8 80A4FA08 448A2000 */  mtc1    $t2, $f4                   ## $f4 = 0.00
/* 016EC 80A4FA0C 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 016F0 80A4FA10 468021A0 */  cvt.s.w $f6, $f4                   
/* 016F4 80A4FA14 46083302 */  mul.s   $f12, $f6, $f8             
/* 016F8 80A4FA18 0C034348 */  jal     Matrix_RotateY              
/* 016FC 80A4FA1C 00000000 */  nop
/* 01700 80A4FA20 862B01A0 */  lh      $t3, 0x01A0($s1)           ## 000001A0
/* 01704 80A4FA24 3C0180A5 */  lui     $at, %hi(D_80A4FF3C)       ## $at = 80A50000
/* 01708 80A4FA28 C432FF3C */  lwc1    $f18, %lo(D_80A4FF3C)($at) 
/* 0170C 80A4FA2C 448B5000 */  mtc1    $t3, $f10                  ## $f10 = 0.00
/* 01710 80A4FA30 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 01714 80A4FA34 46805420 */  cvt.s.w $f16, $f10                 
/* 01718 80A4FA38 46128302 */  mul.s   $f12, $f16, $f18           
/* 0171C 80A4FA3C 0C0342DC */  jal     Matrix_RotateX              
/* 01720 80A4FA40 00000000 */  nop
/* 01724 80A4FA44 862C01A4 */  lh      $t4, 0x01A4($s1)           ## 000001A4
/* 01728 80A4FA48 3C0180A5 */  lui     $at, %hi(D_80A4FF40)       ## $at = 80A50000
/* 0172C 80A4FA4C C428FF40 */  lwc1    $f8, %lo(D_80A4FF40)($at)  
/* 01730 80A4FA50 448C2000 */  mtc1    $t4, $f4                   ## $f4 = 0.00
/* 01734 80A4FA54 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 01738 80A4FA58 468021A0 */  cvt.s.w $f6, $f4                   
/* 0173C 80A4FA5C 46083302 */  mul.s   $f12, $f6, $f8             
/* 01740 80A4FA60 0C0343B5 */  jal     Matrix_RotateZ              
/* 01744 80A4FA64 00000000 */  nop
/* 01748 80A4FA68 C62C01B4 */  lwc1    $f12, 0x01B4($s1)          ## 000001B4
/* 0174C 80A4FA6C C62E01B8 */  lwc1    $f14, 0x01B8($s1)          ## 000001B8
/* 01750 80A4FA70 8E2601BC */  lw      $a2, 0x01BC($s1)           ## 000001BC
/* 01754 80A4FA74 0C0342A3 */  jal     Matrix_Scale              
/* 01758 80A4FA78 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 0175C 80A4FA7C 862D01A8 */  lh      $t5, 0x01A8($s1)           ## 000001A8
/* 01760 80A4FA80 3C0180A5 */  lui     $at, %hi(D_80A4FF44)       ## $at = 80A50000
/* 01764 80A4FA84 C432FF44 */  lwc1    $f18, %lo(D_80A4FF44)($at) 
/* 01768 80A4FA88 448D5000 */  mtc1    $t5, $f10                  ## $f10 = 0.00
/* 0176C 80A4FA8C 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 01770 80A4FA90 46805420 */  cvt.s.w $f16, $f10                 
/* 01774 80A4FA94 46128302 */  mul.s   $f12, $f16, $f18           
/* 01778 80A4FA98 0C034348 */  jal     Matrix_RotateY              
/* 0177C 80A4FA9C 00000000 */  nop
/* 01780 80A4FAA0 862E01A6 */  lh      $t6, 0x01A6($s1)           ## 000001A6
/* 01784 80A4FAA4 3C0180A5 */  lui     $at, %hi(D_80A4FF48)       ## $at = 80A50000
/* 01788 80A4FAA8 C428FF48 */  lwc1    $f8, %lo(D_80A4FF48)($at)  
/* 0178C 80A4FAAC 448E2000 */  mtc1    $t6, $f4                   ## $f4 = 0.00
/* 01790 80A4FAB0 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 01794 80A4FAB4 468021A0 */  cvt.s.w $f6, $f4                   
/* 01798 80A4FAB8 46083302 */  mul.s   $f12, $f6, $f8             
/* 0179C 80A4FABC 0C0342DC */  jal     Matrix_RotateX              
/* 017A0 80A4FAC0 00000000 */  nop
/* 017A4 80A4FAC4 862F01AA */  lh      $t7, 0x01AA($s1)           ## 000001AA
/* 017A8 80A4FAC8 3C0180A5 */  lui     $at, %hi(D_80A4FF4C)       ## $at = 80A50000
/* 017AC 80A4FACC C432FF4C */  lwc1    $f18, %lo(D_80A4FF4C)($at) 
/* 017B0 80A4FAD0 448F5000 */  mtc1    $t7, $f10                  ## $f10 = 0.00
/* 017B4 80A4FAD4 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 017B8 80A4FAD8 46805420 */  cvt.s.w $f16, $f10                 
/* 017BC 80A4FADC 46128302 */  mul.s   $f12, $f16, $f18           
/* 017C0 80A4FAE0 0C0343B5 */  jal     Matrix_RotateZ              
/* 017C4 80A4FAE4 00000000 */  nop
/* 017C8 80A4FAE8 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
.L80A4FAEC:
/* 017CC 80A4FAEC 3C19DA38 */  lui     $t9, 0xDA38                ## $t9 = DA380000
/* 017D0 80A4FAF0 37390003 */  ori     $t9, $t9, 0x0003           ## $t9 = DA380003
/* 017D4 80A4FAF4 24580008 */  addiu   $t8, $v0, 0x0008           ## $t8 = 00000008
/* 017D8 80A4FAF8 AE1802C0 */  sw      $t8, 0x02C0($s0)           ## 000002C0
/* 017DC 80A4FAFC AC590000 */  sw      $t9, 0x0000($v0)           ## 00000000
/* 017E0 80A4FB00 8FA80094 */  lw      $t0, 0x0094($sp)           
/* 017E4 80A4FB04 3C0580A5 */  lui     $a1, %hi(D_80A4FE60)       ## $a1 = 80A50000
/* 017E8 80A4FB08 24A5FE60 */  addiu   $a1, $a1, %lo(D_80A4FE60)  ## $a1 = 80A4FE60
/* 017EC 80A4FB0C 8D040000 */  lw      $a0, 0x0000($t0)           ## 00000000
/* 017F0 80A4FB10 24060428 */  addiu   $a2, $zero, 0x0428         ## $a2 = 00000428
/* 017F4 80A4FB14 0C0346A2 */  jal     Matrix_NewMtx              
/* 017F8 80A4FB18 AFA2006C */  sw      $v0, 0x006C($sp)           
/* 017FC 80A4FB1C 8FA3006C */  lw      $v1, 0x006C($sp)           
/* 01800 80A4FB20 3C0A0600 */  lui     $t2, 0x0600                ## $t2 = 06000000
/* 01804 80A4FB24 254A0950 */  addiu   $t2, $t2, 0x0950           ## $t2 = 06000950
/* 01808 80A4FB28 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 0180C 80A4FB2C 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 01810 80A4FB30 3C04DE00 */  lui     $a0, 0xDE00                ## $a0 = DE000000
/* 01814 80A4FB34 24490008 */  addiu   $t1, $v0, 0x0008           ## $t1 = 00000008
/* 01818 80A4FB38 AE0902C0 */  sw      $t1, 0x02C0($s0)           ## 000002C0
/* 0181C 80A4FB3C AC4A0004 */  sw      $t2, 0x0004($v0)           ## 00000004
/* 01820 80A4FB40 AC440000 */  sw      $a0, 0x0000($v0)           ## 00000000
/* 01824 80A4FB44 922B019E */  lbu     $t3, 0x019E($s1)           ## 0000019E
/* 01828 80A4FB48 316C0004 */  andi    $t4, $t3, 0x0004           ## $t4 = 00000000
/* 0182C 80A4FB4C 51800013 */  beql    $t4, $zero, .L80A4FB9C     
/* 01830 80A4FB50 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 01834 80A4FB54 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 01838 80A4FB58 3C0EFA00 */  lui     $t6, 0xFA00                ## $t6 = FA000000
/* 0183C 80A4FB5C 244D0008 */  addiu   $t5, $v0, 0x0008           ## $t5 = 00000008
/* 01840 80A4FB60 AE0D02C0 */  sw      $t5, 0x02C0($s0)           ## 000002C0
/* 01844 80A4FB64 AC4E0000 */  sw      $t6, 0x0000($v0)           ## 00000000
/* 01848 80A4FB68 922901E5 */  lbu     $t1, 0x01E5($s1)           ## 000001E5
/* 0184C 80A4FB6C 923801E4 */  lbu     $t8, 0x01E4($s1)           ## 000001E4
/* 01850 80A4FB70 922D01E6 */  lbu     $t5, 0x01E6($s1)           ## 000001E6
/* 01854 80A4FB74 922801E7 */  lbu     $t0, 0x01E7($s1)           ## 000001E7
/* 01858 80A4FB78 00095400 */  sll     $t2, $t1, 16               
/* 0185C 80A4FB7C 0018CE00 */  sll     $t9, $t8, 24               
/* 01860 80A4FB80 032A5825 */  or      $t3, $t9, $t2              ## $t3 = 06000950
/* 01864 80A4FB84 000D7200 */  sll     $t6, $t5,  8               
/* 01868 80A4FB88 016E7825 */  or      $t7, $t3, $t6              ## $t7 = FE000950
/* 0186C 80A4FB8C 01E84825 */  or      $t1, $t7, $t0              ## $t1 = FE000950
/* 01870 80A4FB90 10000008 */  beq     $zero, $zero, .L80A4FBB4   
/* 01874 80A4FB94 AC490004 */  sw      $t1, 0x0004($v0)           ## 00000004
/* 01878 80A4FB98 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
.L80A4FB9C:
/* 0187C 80A4FB9C 3C0AFA00 */  lui     $t2, 0xFA00                ## $t2 = FA000000
/* 01880 80A4FBA0 240CFFFF */  addiu   $t4, $zero, 0xFFFF         ## $t4 = FFFFFFFF
/* 01884 80A4FBA4 24590008 */  addiu   $t9, $v0, 0x0008           ## $t9 = 00000008
/* 01888 80A4FBA8 AE1902C0 */  sw      $t9, 0x02C0($s0)           ## 000002C0
/* 0188C 80A4FBAC AC4C0004 */  sw      $t4, 0x0004($v0)           ## 00000004
/* 01890 80A4FBB0 AC4A0000 */  sw      $t2, 0x0000($v0)           ## 00000000
.L80A4FBB4:
/* 01894 80A4FBB4 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 01898 80A4FBB8 3C0B0600 */  lui     $t3, 0x0600                ## $t3 = 06000000
/* 0189C 80A4FBBC 256B09D0 */  addiu   $t3, $t3, 0x09D0           ## $t3 = 060009D0
/* 018A0 80A4FBC0 244D0008 */  addiu   $t5, $v0, 0x0008           ## $t5 = 00000008
/* 018A4 80A4FBC4 AE0D02C0 */  sw      $t5, 0x02C0($s0)           ## 000002C0
/* 018A8 80A4FBC8 AC4B0004 */  sw      $t3, 0x0004($v0)           ## 00000004
/* 018AC 80A4FBCC AC440000 */  sw      $a0, 0x0000($v0)           ## 00000000
/* 018B0 80A4FBD0 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 018B4 80A4FBD4 3C180600 */  lui     $t8, 0x0600                ## $t8 = 06000000
/* 018B8 80A4FBD8 27180A60 */  addiu   $t8, $t8, 0x0A60           ## $t8 = 06000A60
/* 018BC 80A4FBDC 244E0008 */  addiu   $t6, $v0, 0x0008           ## $t6 = 00000008
/* 018C0 80A4FBE0 AE0E02C0 */  sw      $t6, 0x02C0($s0)           ## 000002C0
/* 018C4 80A4FBE4 AC580004 */  sw      $t8, 0x0004($v0)           ## 00000004
/* 018C8 80A4FBE8 0C034221 */  jal     Matrix_Pull              
/* 018CC 80A4FBEC AC440000 */  sw      $a0, 0x0000($v0)           ## 00000000
/* 018D0 80A4FBF0 922F019E */  lbu     $t7, 0x019E($s1)           ## 0000019E
/* 018D4 80A4FBF4 8FA90094 */  lw      $t1, 0x0094($sp)           
/* 018D8 80A4FBF8 31E80002 */  andi    $t0, $t7, 0x0002           ## $t0 = 00000000
/* 018DC 80A4FBFC 51000055 */  beql    $t0, $zero, .L80A4FD54     
/* 018E0 80A4FC00 8FAD0094 */  lw      $t5, 0x0094($sp)           
/* 018E4 80A4FC04 0C024F61 */  jal     func_80093D84              
/* 018E8 80A4FC08 8D240000 */  lw      $a0, 0x0000($t1)           ## 00000000
/* 018EC 80A4FC0C 8FA40094 */  lw      $a0, 0x0094($sp)           
/* 018F0 80A4FC10 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 018F4 80A4FC14 34211DA0 */  ori     $at, $at, 0x1DA0           ## $at = 00011DA0
/* 018F8 80A4FC18 0C0347F5 */  jal     func_800D1FD4              
/* 018FC 80A4FC1C 00812021 */  addu    $a0, $a0, $at              
/* 01900 80A4FC20 3C0180A5 */  lui     $at, %hi(D_80A4FF50)       ## $at = 80A50000
/* 01904 80A4FC24 C42CFF50 */  lwc1    $f12, %lo(D_80A4FF50)($at) 
/* 01908 80A4FC28 3C0180A5 */  lui     $at, %hi(D_80A4FF54)       ## $at = 80A50000
/* 0190C 80A4FC2C C42EFF54 */  lwc1    $f14, %lo(D_80A4FF54)($at) 
/* 01910 80A4FC30 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 01914 80A4FC34 0C0342A3 */  jal     Matrix_Scale              
/* 01918 80A4FC38 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 0191C 80A4FC3C 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 01920 80A4FC40 3C0ADA38 */  lui     $t2, 0xDA38                ## $t2 = DA380000
/* 01924 80A4FC44 354A0003 */  ori     $t2, $t2, 0x0003           ## $t2 = DA380003
/* 01928 80A4FC48 24590008 */  addiu   $t9, $v0, 0x0008           ## $t9 = 00000008
/* 0192C 80A4FC4C AE1902D0 */  sw      $t9, 0x02D0($s0)           ## 000002D0
/* 01930 80A4FC50 AC4A0000 */  sw      $t2, 0x0000($v0)           ## 00000000
/* 01934 80A4FC54 8FAC0094 */  lw      $t4, 0x0094($sp)           
/* 01938 80A4FC58 3C0580A5 */  lui     $a1, %hi(D_80A4FE70)       ## $a1 = 80A50000
/* 0193C 80A4FC5C 24A5FE70 */  addiu   $a1, $a1, %lo(D_80A4FE70)  ## $a1 = 80A4FE70
/* 01940 80A4FC60 2406043F */  addiu   $a2, $zero, 0x043F         ## $a2 = 0000043F
/* 01944 80A4FC64 00408825 */  or      $s1, $v0, $zero            ## $s1 = 00000000
/* 01948 80A4FC68 0C0346A2 */  jal     Matrix_NewMtx              
/* 0194C 80A4FC6C 8D840000 */  lw      $a0, 0x0000($t4)           ## 00000000
/* 01950 80A4FC70 AE220004 */  sw      $v0, 0x0004($s1)           ## 00000004
/* 01954 80A4FC74 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 01958 80A4FC78 3C0BDB06 */  lui     $t3, 0xDB06                ## $t3 = DB060000
/* 0195C 80A4FC7C 356B0020 */  ori     $t3, $t3, 0x0020           ## $t3 = DB060020
/* 01960 80A4FC80 244D0008 */  addiu   $t5, $v0, 0x0008           ## $t5 = 00000008
/* 01964 80A4FC84 AE0D02D0 */  sw      $t5, 0x02D0($s0)           ## 000002D0
/* 01968 80A4FC88 AC4B0000 */  sw      $t3, 0x0000($v0)           ## 00000000
/* 0196C 80A4FC8C 8FAE0094 */  lw      $t6, 0x0094($sp)           
/* 01970 80A4FC90 8FA90084 */  lw      $t1, 0x0084($sp)           
/* 01974 80A4FC94 240D0080 */  addiu   $t5, $zero, 0x0080         ## $t5 = 00000080
/* 01978 80A4FC98 8DC40000 */  lw      $a0, 0x0000($t6)           ## 00000000
/* 0197C 80A4FC9C 0009C823 */  subu    $t9, $zero, $t1            
/* 01980 80A4FCA0 00195080 */  sll     $t2, $t9,  2               
/* 01984 80A4FCA4 01595021 */  addu    $t2, $t2, $t9              
/* 01988 80A4FCA8 000A5080 */  sll     $t2, $t2,  2               
/* 0198C 80A4FCAC 24180020 */  addiu   $t8, $zero, 0x0020         ## $t8 = 00000020
/* 01990 80A4FCB0 240F0040 */  addiu   $t7, $zero, 0x0040         ## $t7 = 00000040
/* 01994 80A4FCB4 24080001 */  addiu   $t0, $zero, 0x0001         ## $t0 = 00000001
/* 01998 80A4FCB8 240C0020 */  addiu   $t4, $zero, 0x0020         ## $t4 = 00000020
/* 0199C 80A4FCBC AFAC0024 */  sw      $t4, 0x0024($sp)           
/* 019A0 80A4FCC0 AFA80018 */  sw      $t0, 0x0018($sp)           
/* 019A4 80A4FCC4 AFAF0014 */  sw      $t7, 0x0014($sp)           
/* 019A8 80A4FCC8 AFB80010 */  sw      $t8, 0x0010($sp)           
/* 019AC 80A4FCCC AFAA0020 */  sw      $t2, 0x0020($sp)           
/* 019B0 80A4FCD0 AFAD0028 */  sw      $t5, 0x0028($sp)           
/* 019B4 80A4FCD4 AFA0001C */  sw      $zero, 0x001C($sp)         
/* 019B8 80A4FCD8 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 019BC 80A4FCDC 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 019C0 80A4FCE0 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 019C4 80A4FCE4 0C0253D0 */  jal     Gfx_TwoTexScroll              
/* 019C8 80A4FCE8 00408825 */  or      $s1, $v0, $zero            ## $s1 = 00000000
/* 019CC 80A4FCEC AE220004 */  sw      $v0, 0x0004($s1)           ## 00000004
/* 019D0 80A4FCF0 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 019D4 80A4FCF4 3C0EFA00 */  lui     $t6, 0xFA00                ## $t6 = FA000000
/* 019D8 80A4FCF8 3C18FFFF */  lui     $t8, 0xFFFF                ## $t8 = FFFF0000
/* 019DC 80A4FCFC 244B0008 */  addiu   $t3, $v0, 0x0008           ## $t3 = 00000008
/* 019E0 80A4FD00 AE0B02D0 */  sw      $t3, 0x02D0($s0)           ## 000002D0
/* 019E4 80A4FD04 371800FF */  ori     $t8, $t8, 0x00FF           ## $t8 = FFFF00FF
/* 019E8 80A4FD08 35CE8080 */  ori     $t6, $t6, 0x8080           ## $t6 = FA008080
/* 019EC 80A4FD0C AC4E0000 */  sw      $t6, 0x0000($v0)           ## 00000000
/* 019F0 80A4FD10 AC580004 */  sw      $t8, 0x0004($v0)           ## 00000004
/* 019F4 80A4FD14 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 019F8 80A4FD18 3C08FB00 */  lui     $t0, 0xFB00                ## $t0 = FB000000
/* 019FC 80A4FD1C 3C09FF00 */  lui     $t1, 0xFF00                ## $t1 = FF000000
/* 01A00 80A4FD20 244F0008 */  addiu   $t7, $v0, 0x0008           ## $t7 = 00000008
/* 01A04 80A4FD24 AE0F02D0 */  sw      $t7, 0x02D0($s0)           ## 000002D0
/* 01A08 80A4FD28 AC490004 */  sw      $t1, 0x0004($v0)           ## 00000004
/* 01A0C 80A4FD2C AC480000 */  sw      $t0, 0x0000($v0)           ## 00000000
/* 01A10 80A4FD30 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 01A14 80A4FD34 3C0C0405 */  lui     $t4, 0x0405                ## $t4 = 04050000
/* 01A18 80A4FD38 258CD4E0 */  addiu   $t4, $t4, 0xD4E0           ## $t4 = 0404D4E0
/* 01A1C 80A4FD3C 24590008 */  addiu   $t9, $v0, 0x0008           ## $t9 = 00000008
/* 01A20 80A4FD40 AE1902D0 */  sw      $t9, 0x02D0($s0)           ## 000002D0
/* 01A24 80A4FD44 3C0ADE00 */  lui     $t2, 0xDE00                ## $t2 = DE000000
/* 01A28 80A4FD48 AC4A0000 */  sw      $t2, 0x0000($v0)           ## 00000000
/* 01A2C 80A4FD4C AC4C0004 */  sw      $t4, 0x0004($v0)           ## 00000004
/* 01A30 80A4FD50 8FAD0094 */  lw      $t5, 0x0094($sp)           
.L80A4FD54:
/* 01A34 80A4FD54 3C0680A5 */  lui     $a2, %hi(D_80A4FE80)       ## $a2 = 80A50000
/* 01A38 80A4FD58 24C6FE80 */  addiu   $a2, $a2, %lo(D_80A4FE80)  ## $a2 = 80A4FE80
/* 01A3C 80A4FD5C 27A40070 */  addiu   $a0, $sp, 0x0070           ## $a0 = FFFFFFE0
/* 01A40 80A4FD60 2407044D */  addiu   $a3, $zero, 0x044D         ## $a3 = 0000044D
/* 01A44 80A4FD64 0C031AD5 */  jal     Graph_CloseDisps              
/* 01A48 80A4FD68 8DA50000 */  lw      $a1, 0x0000($t5)           ## 00000000
.L80A4FD6C:
/* 01A4C 80A4FD6C 8FBF003C */  lw      $ra, 0x003C($sp)           
/* 01A50 80A4FD70 8FB00034 */  lw      $s0, 0x0034($sp)           
/* 01A54 80A4FD74 8FB10038 */  lw      $s1, 0x0038($sp)           
/* 01A58 80A4FD78 03E00008 */  jr      $ra                        
/* 01A5C 80A4FD7C 27BD0090 */  addiu   $sp, $sp, 0x0090           ## $sp = 00000000
