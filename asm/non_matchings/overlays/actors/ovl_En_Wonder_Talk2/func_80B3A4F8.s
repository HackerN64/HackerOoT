.rdata
glabel D_80B3AC18
    .asciz "\x1b[35m☆☆☆☆☆ きょり %f\n\x1b[m"
    .balign 4

glabel D_80B3AC38
    .asciz "\n\n"
    .balign 4

glabel D_80B3AC3C
    .asciz "\x1b[32m☆☆☆☆☆ 透明メッセージ君せっと %x\n\x1b[m"
    .balign 4

glabel D_80B3AC6C
    .asciz "\x1b[33m☆☆☆☆☆ セーブ情報 	           %x\n\x1b[m"
    .balign 4

glabel D_80B3AC9C
    .asciz "\x1b[35m☆☆☆☆☆ 指定メッセージ種類     %x\n\x1b[m"
    .balign 4

glabel D_80B3ACCC
    .asciz "\x1b[36m☆☆☆☆☆ 実質メッセージ種類     %x\n\x1b[m"
    .balign 4

glabel D_80B3ACFC
    .asciz "\x1b[32m☆☆☆☆☆ 指定範囲               %d\n\x1b[m"
    .balign 4

glabel D_80B3AD2C
    .asciz "\x1b[33m☆☆☆☆☆ 処理範囲               %f\n\x1b[m"
    .balign 4

glabel D_80B3AD5C
    .asciz "\x1b[35m☆☆☆☆☆ レンジは？ 		   %d\n\x1b[m"
    .balign 4

glabel D_80B3AD84
    .asciz "\n\n"
    .balign 4

glabel D_80B3AD88
    .asciz "\n\n"
    .balign 4

glabel D_80B3AD8C
    .asciz "\x1b[35m ☆☆ 強制 ☆☆ \n\x1b[m"
    .balign 4

glabel D_80B3ADA8
    .asciz "\x1b[31m ☆☆ ゲルドの修練場強制チェックのみ ☆☆ \n\x1b[m"
    .balign 4

glabel D_80B3ADDC
    .asciz "\n\n"
    .balign 4

.text
glabel func_80B3A4F8
/* 00628 80B3A4F8 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 0062C 80B3A4FC AFBF001C */  sw      $ra, 0x001C($sp)           
/* 00630 80B3A500 AFB00018 */  sw      $s0, 0x0018($sp)           
/* 00634 80B3A504 AFA5002C */  sw      $a1, 0x002C($sp)           
/* 00638 80B3A508 8CAF1C44 */  lw      $t7, 0x1C44($a1)           ## 00001C44
/* 0063C 80B3A50C 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00640 80B3A510 AFAF0024 */  sw      $t7, 0x0024($sp)           
/* 00644 80B3A514 84980158 */  lh      $t8, 0x0158($a0)           ## 00000158
/* 00648 80B3A518 84860152 */  lh      $a2, 0x0152($a0)           ## 00000152
/* 0064C 80B3A51C 27190001 */  addiu   $t9, $t8, 0x0001           ## $t9 = 00000001
/* 00650 80B3A520 04C00010 */  bltz    $a2, .L80B3A564            
/* 00654 80B3A524 A4990158 */  sh      $t9, 0x0158($a0)           ## 00000158
/* 00658 80B3A528 8FA4002C */  lw      $a0, 0x002C($sp)           
/* 0065C 80B3A52C 0C00B2D0 */  jal     Flags_GetSwitch
              
/* 00660 80B3A530 00C02825 */  or      $a1, $a2, $zero            ## $a1 = 00000000
/* 00664 80B3A534 5040000C */  beql    $v0, $zero, .L80B3A568     
/* 00668 80B3A538 860C0154 */  lh      $t4, 0x0154($s0)           ## 00000154
/* 0066C 80B3A53C 9208015A */  lbu     $t0, 0x015A($s0)           ## 0000015A
/* 00670 80B3A540 2401FFFE */  addiu   $at, $zero, 0xFFFE         ## $at = FFFFFFFE
/* 00674 80B3A544 55000086 */  bnel    $t0, $zero, .L80B3A760     
/* 00678 80B3A548 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 0067C 80B3A54C 8E090004 */  lw      $t1, 0x0004($s0)           ## 00000004
/* 00680 80B3A550 240B0001 */  addiu   $t3, $zero, 0x0001         ## $t3 = 00000001
/* 00684 80B3A554 A20B015A */  sb      $t3, 0x015A($s0)           ## 0000015A
/* 00688 80B3A558 01215024 */  and     $t2, $t1, $at              
/* 0068C 80B3A55C 1000007F */  beq     $zero, $zero, .L80B3A75C   
/* 00690 80B3A560 AE0A0004 */  sw      $t2, 0x0004($s0)           ## 00000004
.L80B3A564:
/* 00694 80B3A564 860C0154 */  lh      $t4, 0x0154($s0)           ## 00000154
.L80B3A568:
/* 00698 80B3A568 24010004 */  addiu   $at, $zero, 0x0004         ## $at = 00000004
/* 0069C 80B3A56C 3C0E8016 */  lui     $t6, %hi(gGameInfo)
/* 006A0 80B3A570 15810004 */  bne     $t4, $at, .L80B3A584       
/* 006A4 80B3A574 00000000 */  nop
/* 006A8 80B3A578 920D015A */  lbu     $t5, 0x015A($s0)           ## 0000015A
/* 006AC 80B3A57C 55A00078 */  bnel    $t5, $zero, .L80B3A760     
/* 006B0 80B3A580 8FBF001C */  lw      $ra, 0x001C($sp)           
.L80B3A584:
/* 006B4 80B3A584 8DCEFA90 */  lw      $t6, %lo(gGameInfo)($t6)
/* 006B8 80B3A588 85CF12D8 */  lh      $t7, 0x12D8($t6)           ## 801612D8
/* 006BC 80B3A58C 51E0000A */  beql    $t7, $zero, .L80B3A5B8     
/* 006C0 80B3A590 3C014220 */  lui     $at, 0x4220                ## $at = 42200000
/* 006C4 80B3A594 C6040090 */  lwc1    $f4, 0x0090($s0)           ## 00000090
/* 006C8 80B3A598 3C0480B4 */  lui     $a0, %hi(D_80B3AC18)       ## $a0 = 80B40000
/* 006CC 80B3A59C 2484AC18 */  addiu   $a0, $a0, %lo(D_80B3AC18)  ## $a0 = 80B3AC18
/* 006D0 80B3A5A0 460021A1 */  cvt.d.s $f6, $f4                   
/* 006D4 80B3A5A4 44073000 */  mfc1    $a3, $f6                   
/* 006D8 80B3A5A8 44063800 */  mfc1    $a2, $f7                   
/* 006DC 80B3A5AC 0C00084C */  jal     osSyncPrintf
              
/* 006E0 80B3A5B0 00000000 */  nop
/* 006E4 80B3A5B4 3C014220 */  lui     $at, 0x4220                ## $at = 42200000
.L80B3A5B8:
/* 006E8 80B3A5B8 44815000 */  mtc1    $at, $f10                  ## $f10 = 40.00
/* 006EC 80B3A5BC C610015C */  lwc1    $f16, 0x015C($s0)          ## 0000015C
/* 006F0 80B3A5C0 C6080090 */  lwc1    $f8, 0x0090($s0)           ## 00000090
/* 006F4 80B3A5C4 8FB80024 */  lw      $t8, 0x0024($sp)           
/* 006F8 80B3A5C8 46105480 */  add.s   $f18, $f10, $f16           
/* 006FC 80B3A5CC 4612403C */  c.lt.s  $f8, $f18                  
/* 00700 80B3A5D0 00000000 */  nop
/* 00704 80B3A5D4 45020061 */  bc1fl   .L80B3A75C                 
/* 00708 80B3A5D8 A6000156 */  sh      $zero, 0x0156($s0)         ## 00000156
/* 0070C 80B3A5DC C7040028 */  lwc1    $f4, 0x0028($t8)           ## 00000028
/* 00710 80B3A5E0 C6060028 */  lwc1    $f6, 0x0028($s0)           ## 00000028
/* 00714 80B3A5E4 3C0142C8 */  lui     $at, 0x42C8                ## $at = 42C80000
/* 00718 80B3A5E8 44815000 */  mtc1    $at, $f10                  ## $f10 = 100.00
/* 0071C 80B3A5EC 46062001 */  sub.s   $f0, $f4, $f6              
/* 00720 80B3A5F0 46000005 */  abs.s   $f0, $f0                   
/* 00724 80B3A5F4 460A003C */  c.lt.s  $f0, $f10                  
/* 00728 80B3A5F8 00000000 */  nop
/* 0072C 80B3A5FC 45020057 */  bc1fl   .L80B3A75C                 
/* 00730 80B3A600 A6000156 */  sh      $zero, 0x0156($s0)         ## 00000156
/* 00734 80B3A604 0C02FF21 */  jal     Gameplay_InCsMode              
/* 00738 80B3A608 8FA4002C */  lw      $a0, 0x002C($sp)           
/* 0073C 80B3A60C 54400053 */  bnel    $v0, $zero, .L80B3A75C     
/* 00740 80B3A610 A6000156 */  sh      $zero, 0x0156($s0)         ## 00000156
/* 00744 80B3A614 86190158 */  lh      $t9, 0x0158($s0)           ## 00000158
/* 00748 80B3A618 3C0480B4 */  lui     $a0, %hi(D_80B3AC38)       ## $a0 = 80B40000
/* 0074C 80B3A61C 2B210002 */  slti    $at, $t9, 0x0002           
/* 00750 80B3A620 5420003C */  bnel    $at, $zero, .L80B3A714     
/* 00754 80B3A624 86080156 */  lh      $t0, 0x0156($s0)           ## 00000156
/* 00758 80B3A628 0C00084C */  jal     osSyncPrintf
              
/* 0075C 80B3A62C 2484AC38 */  addiu   $a0, $a0, %lo(D_80B3AC38)  ## $a0 = 80B3AC38
/* 00760 80B3A630 3C0480B4 */  lui     $a0, %hi(D_80B3AC3C)       ## $a0 = 80B40000
/* 00764 80B3A634 2484AC3C */  addiu   $a0, $a0, %lo(D_80B3AC3C)  ## $a0 = 80B3AC3C
/* 00768 80B3A638 0C00084C */  jal     osSyncPrintf
              
/* 0076C 80B3A63C 8605001C */  lh      $a1, 0x001C($s0)           ## 0000001C
/* 00770 80B3A640 3C0480B4 */  lui     $a0, %hi(D_80B3AC6C)       ## $a0 = 80B40000
/* 00774 80B3A644 2484AC6C */  addiu   $a0, $a0, %lo(D_80B3AC6C)  ## $a0 = 80B3AC6C
/* 00778 80B3A648 0C00084C */  jal     osSyncPrintf
              
/* 0077C 80B3A64C 86050152 */  lh      $a1, 0x0152($s0)           ## 00000152
/* 00780 80B3A650 3C0480B4 */  lui     $a0, %hi(D_80B3AC9C)       ## $a0 = 80B40000
/* 00784 80B3A654 2484AC9C */  addiu   $a0, $a0, %lo(D_80B3AC9C)  ## $a0 = 80B3AC9C
/* 00788 80B3A658 0C00084C */  jal     osSyncPrintf
              
/* 0078C 80B3A65C 86050150 */  lh      $a1, 0x0150($s0)           ## 00000150
/* 00790 80B3A660 3C0480B4 */  lui     $a0, %hi(D_80B3ACCC)       ## $a0 = 80B40000
/* 00794 80B3A664 2484ACCC */  addiu   $a0, $a0, %lo(D_80B3ACCC)  ## $a0 = 80B3ACCC
/* 00798 80B3A668 0C00084C */  jal     osSyncPrintf
              
/* 0079C 80B3A66C 9605010E */  lhu     $a1, 0x010E($s0)           ## 0000010E
/* 007A0 80B3A670 3C0480B4 */  lui     $a0, %hi(D_80B3ACFC)       ## $a0 = 80B40000
/* 007A4 80B3A674 2484ACFC */  addiu   $a0, $a0, %lo(D_80B3ACFC)  ## $a0 = 80B3ACFC
/* 007A8 80B3A678 0C00084C */  jal     osSyncPrintf
              
/* 007AC 80B3A67C 86050034 */  lh      $a1, 0x0034($s0)           ## 00000034
/* 007B0 80B3A680 C610015C */  lwc1    $f16, 0x015C($s0)          ## 0000015C
/* 007B4 80B3A684 3C0480B4 */  lui     $a0, %hi(D_80B3AD2C)       ## $a0 = 80B40000
/* 007B8 80B3A688 2484AD2C */  addiu   $a0, $a0, %lo(D_80B3AD2C)  ## $a0 = 80B3AD2C
/* 007BC 80B3A68C 46008221 */  cvt.d.s $f8, $f16                  
/* 007C0 80B3A690 44074000 */  mfc1    $a3, $f8                   
/* 007C4 80B3A694 44064800 */  mfc1    $a2, $f9                   
/* 007C8 80B3A698 0C00084C */  jal     osSyncPrintf
              
/* 007CC 80B3A69C 00000000 */  nop
/* 007D0 80B3A6A0 3C0480B4 */  lui     $a0, %hi(D_80B3AD5C)       ## $a0 = 80B40000
/* 007D4 80B3A6A4 2484AD5C */  addiu   $a0, $a0, %lo(D_80B3AD5C)  ## $a0 = 80B3AD5C
/* 007D8 80B3A6A8 0C00084C */  jal     osSyncPrintf
              
/* 007DC 80B3A6AC 8205001F */  lb      $a1, 0x001F($s0)           ## 0000001F
/* 007E0 80B3A6B0 3C0480B4 */  lui     $a0, %hi(D_80B3AD84)       ## $a0 = 80B40000
/* 007E4 80B3A6B4 0C00084C */  jal     osSyncPrintf
              
/* 007E8 80B3A6B8 2484AD84 */  addiu   $a0, $a0, %lo(D_80B3AD84)  ## $a0 = 80B3AD84
/* 007EC 80B3A6BC 3C0480B4 */  lui     $a0, %hi(D_80B3AD88)       ## $a0 = 80B40000
/* 007F0 80B3A6C0 0C00084C */  jal     osSyncPrintf
              
/* 007F4 80B3A6C4 2484AD88 */  addiu   $a0, $a0, %lo(D_80B3AD88)  ## $a0 = 80B3AD88
/* 007F8 80B3A6C8 86020154 */  lh      $v0, 0x0154($s0)           ## 00000154
/* 007FC 80B3A6CC 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 00800 80B3A6D0 3C0480B4 */  lui     $a0, %hi(D_80B3AD8C)       ## $a0 = 80B40000
/* 00804 80B3A6D4 10410005 */  beq     $v0, $at, .L80B3A6EC       
/* 00808 80B3A6D8 24010004 */  addiu   $at, $zero, 0x0004         ## $at = 00000004
/* 0080C 80B3A6DC 10410007 */  beq     $v0, $at, .L80B3A6FC       
/* 00810 80B3A6E0 3C0480B4 */  lui     $a0, %hi(D_80B3ADA8)       ## $a0 = 80B40000
/* 00814 80B3A6E4 10000007 */  beq     $zero, $zero, .L80B3A704   
/* 00818 80B3A6E8 00000000 */  nop
.L80B3A6EC:
/* 0081C 80B3A6EC 0C00084C */  jal     osSyncPrintf
              
/* 00820 80B3A6F0 2484AD8C */  addiu   $a0, $a0, %lo(D_80B3AD8C)  ## $a0 = 80B3AD8C
/* 00824 80B3A6F4 10000003 */  beq     $zero, $zero, .L80B3A704   
/* 00828 80B3A6F8 00000000 */  nop
.L80B3A6FC:
/* 0082C 80B3A6FC 0C00084C */  jal     osSyncPrintf
              
/* 00830 80B3A700 2484ADA8 */  addiu   $a0, $a0, %lo(D_80B3ADA8)  ## $a0 = FFFFADA8
.L80B3A704:
/* 00834 80B3A704 3C0480B4 */  lui     $a0, %hi(D_80B3ADDC)       ## $a0 = 80B40000
/* 00838 80B3A708 0C00084C */  jal     osSyncPrintf
              
/* 0083C 80B3A70C 2484ADDC */  addiu   $a0, $a0, %lo(D_80B3ADDC)  ## $a0 = 80B3ADDC
/* 00840 80B3A710 86080156 */  lh      $t0, 0x0156($s0)           ## 00000156
.L80B3A714:
/* 00844 80B3A714 A6000158 */  sh      $zero, 0x0158($s0)         ## 00000158
/* 00848 80B3A718 8FA4002C */  lw      $a0, 0x002C($sp)           
/* 0084C 80B3A71C 1500000F */  bne     $t0, $zero, .L80B3A75C     
/* 00850 80B3A720 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 00854 80B3A724 0C042DA0 */  jal     func_8010B680              
/* 00858 80B3A728 9605010E */  lhu     $a1, 0x010E($s0)           ## 0000010E
/* 0085C 80B3A72C 8FA4002C */  lw      $a0, 0x002C($sp)           
/* 00860 80B3A730 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 00864 80B3A734 0C00B7D5 */  jal     func_8002DF54              
/* 00868 80B3A738 24060008 */  addiu   $a2, $zero, 0x0008         ## $a2 = 00000008
/* 0086C 80B3A73C 8E090004 */  lw      $t1, 0x0004($s0)           ## 00000004
/* 00870 80B3A740 3C0B80B4 */  lui     $t3, %hi(func_80B3A3D4)    ## $t3 = 80B40000
/* 00874 80B3A744 256BA3D4 */  addiu   $t3, $t3, %lo(func_80B3A3D4) ## $t3 = 80B3A3D4
/* 00878 80B3A748 352A0011 */  ori     $t2, $t1, 0x0011           ## $t2 = 00000011
/* 0087C 80B3A74C AE0A0004 */  sw      $t2, 0x0004($s0)           ## 00000004
/* 00880 80B3A750 10000002 */  beq     $zero, $zero, .L80B3A75C   
/* 00884 80B3A754 AE0B014C */  sw      $t3, 0x014C($s0)           ## 0000014C
/* 00888 80B3A758 A6000156 */  sh      $zero, 0x0156($s0)         ## 00000156
.L80B3A75C:
/* 0088C 80B3A75C 8FBF001C */  lw      $ra, 0x001C($sp)           
.L80B3A760:
/* 00890 80B3A760 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 00894 80B3A764 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
/* 00898 80B3A768 03E00008 */  jr      $ra                        
/* 0089C 80B3A76C 00000000 */  nop
