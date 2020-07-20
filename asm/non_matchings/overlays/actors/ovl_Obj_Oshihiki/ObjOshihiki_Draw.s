.rdata
glabel D_80B9CC5C
    .asciz "../z_obj_oshihiki.c"
    .balign 4

glabel D_80B9CC70
    .asciz "../z_obj_oshihiki.c"
    .balign 4

glabel D_80B9CC84
    .asciz "../z_obj_oshihiki.c"
    .balign 4

.late_rodata
glabel jtbl_80B9CD1C
    .word L80B9C8B8
    .word L80B9C8B8
    .word L80B9C8F8
    .word L80B9C8B8
    .word L80B9C8B8
    .word L80B9C8B8
    .word L80B9C8B8
    .word L80B9C8B8
    .word L80B9C8F8
    .word L80B9C8F8
    .word L80B9C8F8
    .word L80B9C8B8

.text
glabel ObjOshihiki_Draw
/* 015E4 80B9C764 27BDFFA8 */  addiu   $sp, $sp, 0xFFA8           ## $sp = FFFFFFA8
/* 015E8 80B9C768 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 015EC 80B9C76C AFB00018 */  sw      $s0, 0x0018($sp)           
/* 015F0 80B9C770 AFA5005C */  sw      $a1, 0x005C($sp)           
/* 015F4 80B9C774 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 015F8 80B9C778 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 015FC 80B9C77C 3C0680BA */  lui     $a2, %hi(D_80B9CC5C)       ## $a2 = 80BA0000
/* 01600 80B9C780 24C6CC5C */  addiu   $a2, $a2, %lo(D_80B9CC5C)  ## $a2 = 80B9CC5C
/* 01604 80B9C784 27A4003C */  addiu   $a0, $sp, 0x003C           ## $a0 = FFFFFFE4
/* 01608 80B9C788 24070509 */  addiu   $a3, $zero, 0x0509         ## $a3 = 00000509
/* 0160C 80B9C78C 0C031AB1 */  jal     Graph_OpenDisps              
/* 01610 80B9C790 AFA5004C */  sw      $a1, 0x004C($sp)           
/* 01614 80B9C794 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01618 80B9C798 0C2E6FC2 */  jal     func_80B9BF08              
/* 0161C 80B9C79C 8FA5005C */  lw      $a1, 0x005C($sp)           
/* 01620 80B9C7A0 1040000E */  beq     $v0, $zero, .L80B9C7DC     
/* 01624 80B9C7A4 8FA8004C */  lw      $t0, 0x004C($sp)           
/* 01628 80B9C7A8 3C014120 */  lui     $at, 0x4120                ## $at = 41200000
/* 0162C 80B9C7AC 44810000 */  mtc1    $at, $f0                   ## $f0 = 10.00
/* 01630 80B9C7B0 C60401C4 */  lwc1    $f4, 0x01C4($s0)           ## 000001C4
/* 01634 80B9C7B4 C60601C8 */  lwc1    $f6, 0x01C8($s0)           ## 000001C8
/* 01638 80B9C7B8 44807000 */  mtc1    $zero, $f14                ## $f14 = 0.00
/* 0163C 80B9C7BC 46002302 */  mul.s   $f12, $f4, $f0             
/* 01640 80B9C7C0 AFA8004C */  sw      $t0, 0x004C($sp)           
/* 01644 80B9C7C4 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 01648 80B9C7C8 46003202 */  mul.s   $f8, $f6, $f0              
/* 0164C 80B9C7CC 44064000 */  mfc1    $a2, $f8                   
/* 01650 80B9C7D0 0C034261 */  jal     Matrix_Translate              
/* 01654 80B9C7D4 00000000 */  nop
/* 01658 80B9C7D8 8FA8004C */  lw      $t0, 0x004C($sp)           
.L80B9C7DC:
/* 0165C 80B9C7DC 960F0168 */  lhu     $t7, 0x0168($s0)           ## 00000168
/* 01660 80B9C7E0 31F8FEFF */  andi    $t8, $t7, 0xFEFF           ## $t8 = 00000000
/* 01664 80B9C7E4 A6180168 */  sh      $t8, 0x0168($s0)           ## 00000168
/* 01668 80B9C7E8 8FB9005C */  lw      $t9, 0x005C($sp)           
/* 0166C 80B9C7EC 8F240000 */  lw      $a0, 0x0000($t9)           ## 00000000
/* 01670 80B9C7F0 0C024F46 */  jal     func_80093D18              
/* 01674 80B9C7F4 AFA8004C */  sw      $t0, 0x004C($sp)           
/* 01678 80B9C7F8 8FA8004C */  lw      $t0, 0x004C($sp)           
/* 0167C 80B9C7FC 3C0ADB06 */  lui     $t2, 0xDB06                ## $t2 = DB060000
/* 01680 80B9C800 354A0020 */  ori     $t2, $t2, 0x0020           ## $t2 = DB060020
/* 01684 80B9C804 8D0202C0 */  lw      $v0, 0x02C0($t0)           ## 000002C0
/* 01688 80B9C808 3C0E8016 */  lui     $t6, %hi(gSegments)
/* 0168C 80B9C80C 3C0100FF */  lui     $at, 0x00FF                ## $at = 00FF0000
/* 01690 80B9C810 24490008 */  addiu   $t1, $v0, 0x0008           ## $t1 = 00000008
/* 01694 80B9C814 AD0902C0 */  sw      $t1, 0x02C0($t0)           ## 000002C0
/* 01698 80B9C818 AC4A0000 */  sw      $t2, 0x0000($v0)           ## 00000000
/* 0169C 80B9C81C 8E0401CC */  lw      $a0, 0x01CC($s0)           ## 000001CC
/* 016A0 80B9C820 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = 00FFFFFF
/* 016A4 80B9C824 3C0ADA38 */  lui     $t2, 0xDA38                ## $t2 = DA380000
/* 016A8 80B9C828 00045900 */  sll     $t3, $a0,  4               
/* 016AC 80B9C82C 000B6702 */  srl     $t4, $t3, 28               
/* 016B0 80B9C830 000C6880 */  sll     $t5, $t4,  2               
/* 016B4 80B9C834 01CD7021 */  addu    $t6, $t6, $t5              
/* 016B8 80B9C838 8DCE6FA8 */  lw      $t6, %lo(gSegments)($t6)
/* 016BC 80B9C83C 00817824 */  and     $t7, $a0, $at              
/* 016C0 80B9C840 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 016C4 80B9C844 01CFC021 */  addu    $t8, $t6, $t7              
/* 016C8 80B9C848 0301C821 */  addu    $t9, $t8, $at              
/* 016CC 80B9C84C AC590004 */  sw      $t9, 0x0004($v0)           ## 00000004
/* 016D0 80B9C850 8D0202C0 */  lw      $v0, 0x02C0($t0)           ## 000002C0
/* 016D4 80B9C854 354A0003 */  ori     $t2, $t2, 0x0003           ## $t2 = DA380003
/* 016D8 80B9C858 3C0580BA */  lui     $a1, %hi(D_80B9CC70)       ## $a1 = 80BA0000
/* 016DC 80B9C85C 24490008 */  addiu   $t1, $v0, 0x0008           ## $t1 = 00000008
/* 016E0 80B9C860 AD0902C0 */  sw      $t1, 0x02C0($t0)           ## 000002C0
/* 016E4 80B9C864 AC4A0000 */  sw      $t2, 0x0000($v0)           ## 00000000
/* 016E8 80B9C868 8FAB005C */  lw      $t3, 0x005C($sp)           
/* 016EC 80B9C86C 24A5CC70 */  addiu   $a1, $a1, %lo(D_80B9CC70)  ## $a1 = 80B9CC70
/* 016F0 80B9C870 2406051C */  addiu   $a2, $zero, 0x051C         ## $a2 = 0000051C
/* 016F4 80B9C874 8D640000 */  lw      $a0, 0x0000($t3)           ## 00000000
/* 016F8 80B9C878 AFA8004C */  sw      $t0, 0x004C($sp)           
/* 016FC 80B9C87C 0C0346A2 */  jal     Matrix_NewMtx              
/* 01700 80B9C880 AFA20034 */  sw      $v0, 0x0034($sp)           
/* 01704 80B9C884 8FA30034 */  lw      $v1, 0x0034($sp)           
/* 01708 80B9C888 8FA8004C */  lw      $t0, 0x004C($sp)           
/* 0170C 80B9C88C AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 01710 80B9C890 8FAC005C */  lw      $t4, 0x005C($sp)           
/* 01714 80B9C894 958D00A4 */  lhu     $t5, 0x00A4($t4)           ## 000000A4
/* 01718 80B9C898 2DA1000C */  sltiu   $at, $t5, 0x000C           
/* 0171C 80B9C89C 10200016 */  beq     $at, $zero, .L80B9C8F8     
/* 01720 80B9C8A0 000D6880 */  sll     $t5, $t5,  2               
/* 01724 80B9C8A4 3C0180BA */  lui     $at, %hi(jtbl_80B9CD1C)       ## $at = 80BA0000
/* 01728 80B9C8A8 002D0821 */  addu    $at, $at, $t5              
/* 0172C 80B9C8AC 8C2DCD1C */  lw      $t5, %lo(jtbl_80B9CD1C)($at)  
/* 01730 80B9C8B0 01A00008 */  jr      $t5                        
/* 01734 80B9C8B4 00000000 */  nop
glabel L80B9C8B8
/* 01738 80B9C8B8 8D0202C0 */  lw      $v0, 0x02C0($t0)           ## 000002C0
/* 0173C 80B9C8BC 3C0FFB00 */  lui     $t7, 0xFB00                ## $t7 = FB000000
/* 01740 80B9C8C0 244E0008 */  addiu   $t6, $v0, 0x0008           ## $t6 = 00000008
/* 01744 80B9C8C4 AD0E02C0 */  sw      $t6, 0x02C0($t0)           ## 000002C0
/* 01748 80B9C8C8 AC4F0000 */  sw      $t7, 0x0000($v0)           ## 00000000
/* 0174C 80B9C8CC 920B01D1 */  lbu     $t3, 0x01D1($s0)           ## 000001D1
/* 01750 80B9C8D0 921901D0 */  lbu     $t9, 0x01D0($s0)           ## 000001D0
/* 01754 80B9C8D4 920F01D2 */  lbu     $t7, 0x01D2($s0)           ## 000001D2
/* 01758 80B9C8D8 000B6400 */  sll     $t4, $t3, 16               
/* 0175C 80B9C8DC 00194E00 */  sll     $t1, $t9, 24               
/* 01760 80B9C8E0 012C6825 */  or      $t5, $t1, $t4              ## $t5 = 00000000
/* 01764 80B9C8E4 000FC200 */  sll     $t8, $t7,  8               
/* 01768 80B9C8E8 01B8C825 */  or      $t9, $t5, $t8              ## $t9 = 00000000
/* 0176C 80B9C8EC 372A00FF */  ori     $t2, $t9, 0x00FF           ## $t2 = 000000FF
/* 01770 80B9C8F0 10000014 */  beq     $zero, $zero, .L80B9C944   
/* 01774 80B9C8F4 AC4A0004 */  sw      $t2, 0x0004($v0)           ## 00000004
glabel L80B9C8F8
.L80B9C8F8:
/* 01778 80B9C8F8 8D0202C0 */  lw      $v0, 0x02C0($t0)           ## 000002C0
/* 0177C 80B9C8FC 3C09FB00 */  lui     $t1, 0xFB00                ## $t1 = FB000000
/* 01780 80B9C900 3C038016 */  lui     $v1, %hi(gGameInfo)
/* 01784 80B9C904 244B0008 */  addiu   $t3, $v0, 0x0008           ## $t3 = 00000008
/* 01788 80B9C908 AD0B02C0 */  sw      $t3, 0x02C0($t0)           ## 000002C0
/* 0178C 80B9C90C AC490000 */  sw      $t1, 0x0000($v0)           ## 00000000
/* 01790 80B9C910 8C63FA90 */  lw      $v1, %lo(gGameInfo)($v1)
/* 01794 80B9C914 846C1172 */  lh      $t4, 0x1172($v1)           ## 80161172
/* 01798 80B9C918 8478116E */  lh      $t8, 0x116E($v1)           ## 8016116E
/* 0179C 80B9C91C 846B1170 */  lh      $t3, 0x1170($v1)           ## 80161170
/* 017A0 80B9C920 318E00FF */  andi    $t6, $t4, 0x00FF           ## $t6 = 00000000
/* 017A4 80B9C924 000E7A00 */  sll     $t7, $t6,  8               
/* 017A8 80B9C928 0018CE00 */  sll     $t9, $t8, 24               
/* 017AC 80B9C92C 316900FF */  andi    $t1, $t3, 0x00FF           ## $t1 = 00000008
/* 017B0 80B9C930 00096400 */  sll     $t4, $t1, 16               
/* 017B4 80B9C934 01F95025 */  or      $t2, $t7, $t9              ## $t2 = FB000000
/* 017B8 80B9C938 014C7025 */  or      $t6, $t2, $t4              ## $t6 = FB000000
/* 017BC 80B9C93C 35CD00FF */  ori     $t5, $t6, 0x00FF           ## $t5 = FB0000FF
/* 017C0 80B9C940 AC4D0004 */  sw      $t5, 0x0004($v0)           ## 00000004
.L80B9C944:
/* 017C4 80B9C944 8D0202C0 */  lw      $v0, 0x02C0($t0)           ## 000002C0
/* 017C8 80B9C948 3C190500 */  lui     $t9, 0x0500                ## $t9 = 05000000
/* 017CC 80B9C94C 27394CD0 */  addiu   $t9, $t9, 0x4CD0           ## $t9 = 05004CD0
/* 017D0 80B9C950 24580008 */  addiu   $t8, $v0, 0x0008           ## $t8 = 00000008
/* 017D4 80B9C954 AD1802C0 */  sw      $t8, 0x02C0($t0)           ## 000002C0
/* 017D8 80B9C958 3C0FDE00 */  lui     $t7, 0xDE00                ## $t7 = DE000000
/* 017DC 80B9C95C AC4F0000 */  sw      $t7, 0x0000($v0)           ## 00000000
/* 017E0 80B9C960 AC590004 */  sw      $t9, 0x0004($v0)           ## 00000004
/* 017E4 80B9C964 8FAB005C */  lw      $t3, 0x005C($sp)           
/* 017E8 80B9C968 3C0680BA */  lui     $a2, %hi(D_80B9CC84)       ## $a2 = 80BA0000
/* 017EC 80B9C96C 24C6CC84 */  addiu   $a2, $a2, %lo(D_80B9CC84)  ## $a2 = 80B9CC84
/* 017F0 80B9C970 27A4003C */  addiu   $a0, $sp, 0x003C           ## $a0 = FFFFFFE4
/* 017F4 80B9C974 24070536 */  addiu   $a3, $zero, 0x0536         ## $a3 = 00000536
/* 017F8 80B9C978 0C031AD5 */  jal     Graph_CloseDisps              
/* 017FC 80B9C97C 8D650000 */  lw      $a1, 0x0000($t3)           ## 00000008
/* 01800 80B9C980 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 01804 80B9C984 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 01808 80B9C988 27BD0058 */  addiu   $sp, $sp, 0x0058           ## $sp = 00000000
/* 0180C 80B9C98C 03E00008 */  jr      $ra                        
/* 01810 80B9C990 00000000 */  nop
/* 01814 80B9C994 00000000 */  nop
/* 01818 80B9C998 00000000 */  nop
/* 0181C 80B9C99C 00000000 */  nop
