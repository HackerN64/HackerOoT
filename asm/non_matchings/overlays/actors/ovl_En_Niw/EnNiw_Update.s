.rdata
glabel D_80AB880C
    .asciz "\x1b[32m☆☆☆☆☆ 上下？ ☆☆☆☆☆ %f\n\x1b[m"
    .balign 4

glabel D_80AB8838
    .asciz "\x1b[31m☆☆☆☆☆ 範囲外Ｘ！ ☆☆☆☆☆ %f\n\x1b[m"
    .balign 4

glabel D_80AB8868
    .asciz "\x1b[31m☆☆☆☆☆ 範囲外Ｙ！ ☆☆☆☆☆ %f\n\x1b[m"
    .balign 4

glabel D_80AB8898
    .asciz "\x1b[31m☆☆☆☆☆ 範囲外Ｚ！ ☆☆☆☆☆ %f\n\x1b[m"
    .balign 4

glabel D_80AB88C8
    .asciz "\x1b[32m☆☆☆☆☆ セットＸ！ ☆☆☆☆☆ %f\n\x1b[m"
    .balign 4

glabel D_80AB88F8
    .asciz "\x1b[32m☆☆☆☆☆ セットＹ！ ☆☆☆☆☆ %f\n\x1b[m"
    .balign 4

glabel D_80AB8928
    .asciz "\x1b[32m☆☆☆☆☆ セットＺ！ ☆☆☆☆☆ %f\n\x1b[m"
    .balign 4

glabel D_80AB8958
    .asciz "\x1b[33m☆☆☆☆☆ 修整後Ｘ！ ☆☆☆☆☆ %f\n\x1b[m"
    .balign 4

glabel D_80AB8988
    .asciz "\x1b[33m☆☆☆☆☆ 修整後Ｙ！ ☆☆☆☆☆ %f\n\x1b[m"
    .balign 4

glabel D_80AB89B8
    .asciz "\x1b[33m☆☆☆☆☆ 修整後Ｚ！ ☆☆☆☆☆ %f\n\x1b[m"
    .balign 4

glabel D_80AB89E8
    .asciz "\n\n"
    .balign 4

glabel D_80AB89EC
    .asciz "\n\n"
    .balign 4

glabel D_80AB89F0
    .asciz "\x1b[33m☆☆☆☆☆ ぶくぶく ☆☆☆☆☆ \n\x1b[m"
    .balign 4

glabel D_80AB8A1C
    .asciz "\n\n"
    .balign 4

.late_rodata
glabel D_80AB8B0C
    .float -0.15

.text
glabel EnNiw_Update
/* 01DB4 80AB7534 27BDFF20 */  addiu   $sp, $sp, 0xFF20           ## $sp = FFFFFF20
/* 01DB8 80AB7538 AFBF002C */  sw      $ra, 0x002C($sp)           
/* 01DBC 80AB753C AFB10028 */  sw      $s1, 0x0028($sp)           
/* 01DC0 80AB7540 AFB00024 */  sw      $s0, 0x0024($sp)           
/* 01DC4 80AB7544 F7B40018 */  sdc1    $f20, 0x0018($sp)          
/* 01DC8 80AB7548 AFA500E4 */  sw      $a1, 0x00E4($sp)           
/* 01DCC 80AB754C 8CAF1C44 */  lw      $t7, 0x1C44($a1)           ## 00001C44
/* 01DD0 80AB7550 3C1980AC */  lui     $t9, %hi(D_80AB86E8)       ## $t9 = 80AC0000
/* 01DD4 80AB7554 273986E8 */  addiu   $t9, $t9, %lo(D_80AB86E8)  ## $t9 = 80AB86E8
/* 01DD8 80AB7558 AFAF00D4 */  sw      $t7, 0x00D4($sp)           
/* 01DDC 80AB755C 8F290000 */  lw      $t1, 0x0000($t9)           ## 80AB86E8
/* 01DE0 80AB7560 27B800C4 */  addiu   $t8, $sp, 0x00C4           ## $t8 = FFFFFFE4
/* 01DE4 80AB7564 8F280004 */  lw      $t0, 0x0004($t9)           ## 80AB86EC
/* 01DE8 80AB7568 AF090000 */  sw      $t1, 0x0000($t8)           ## FFFFFFE4
/* 01DEC 80AB756C 8F290008 */  lw      $t1, 0x0008($t9)           ## 80AB86F0
/* 01DF0 80AB7570 3C0B80AC */  lui     $t3, %hi(D_80AB86F4)       ## $t3 = 80AC0000
/* 01DF4 80AB7574 256B86F4 */  addiu   $t3, $t3, %lo(D_80AB86F4)  ## $t3 = 80AB86F4
/* 01DF8 80AB7578 AF080004 */  sw      $t0, 0x0004($t8)           ## FFFFFFE8
/* 01DFC 80AB757C AF090008 */  sw      $t1, 0x0008($t8)           ## FFFFFFEC
/* 01E00 80AB7580 8D6D0000 */  lw      $t5, 0x0000($t3)           ## 80AB86F4
/* 01E04 80AB7584 27AA00B8 */  addiu   $t2, $sp, 0x00B8           ## $t2 = FFFFFFD8
/* 01E08 80AB7588 8D6C0004 */  lw      $t4, 0x0004($t3)           ## 80AB86F8
/* 01E0C 80AB758C AD4D0000 */  sw      $t5, 0x0000($t2)           ## FFFFFFD8
/* 01E10 80AB7590 8D6D0008 */  lw      $t5, 0x0008($t3)           ## 80AB86FC
/* 01E14 80AB7594 AD4C0004 */  sw      $t4, 0x0004($t2)           ## FFFFFFDC
/* 01E18 80AB7598 3C1880AB */  lui     $t8, %hi(func_80AB6570)    ## $t8 = 80AB0000
/* 01E1C 80AB759C AD4D0008 */  sw      $t5, 0x0008($t2)           ## FFFFFFE0
/* 01E20 80AB75A0 848E0294 */  lh      $t6, 0x0294($a0)           ## 00000294
/* 01E24 80AB75A4 27186570 */  addiu   $t8, $t8, %lo(func_80AB6570) ## $t8 = 80AB6570
/* 01E28 80AB75A8 00808825 */  or      $s1, $a0, $zero            ## $s1 = 00000000
/* 01E2C 80AB75AC 25CF0001 */  addiu   $t7, $t6, 0x0001           ## $t7 = 00000001
/* 01E30 80AB75B0 A48F0294 */  sh      $t7, 0x0294($a0)           ## 00000294
/* 01E34 80AB75B4 AFB8003C */  sw      $t8, 0x003C($sp)           
/* 01E38 80AB75B8 8C990250 */  lw      $t9, 0x0250($a0)           ## 00000250
/* 01E3C 80AB75BC 53190005 */  beql    $t8, $t9, .L80AB75D4       
/* 01E40 80AB75C0 862202A6 */  lh      $v0, 0x02A6($s1)           ## 000002A6
/* 01E44 80AB75C4 4480A000 */  mtc1    $zero, $f20                ## $f20 = 0.00
/* 01E48 80AB75C8 00000000 */  nop
/* 01E4C 80AB75CC E4940290 */  swc1    $f20, 0x0290($a0)          ## 00000290
/* 01E50 80AB75D0 862202A6 */  lh      $v0, 0x02A6($s1)           ## 000002A6
.L80AB75D4:
/* 01E54 80AB75D4 4480A000 */  mtc1    $zero, $f20                ## $f20 = 0.00
/* 01E58 80AB75D8 10400069 */  beq     $v0, $zero, .L80AB7780     
/* 01E5C 80AB75DC 24010002 */  addiu   $at, $zero, 0x0002         ## $at = 00000002
/* 01E60 80AB75E0 14410002 */  bne     $v0, $at, .L80AB75EC       
/* 01E64 80AB75E4 24030014 */  addiu   $v1, $zero, 0x0014         ## $v1 = 00000014
/* 01E68 80AB75E8 24030004 */  addiu   $v1, $zero, 0x0004         ## $v1 = 00000004
.L80AB75EC:
/* 01E6C 80AB75EC 18600063 */  blez    $v1, .L80AB777C            
/* 01E70 80AB75F0 00008025 */  or      $s0, $zero, $zero          ## $s0 = 00000000
/* 01E74 80AB75F4 A7A300D0 */  sh      $v1, 0x00D0($sp)           
/* 01E78 80AB75F8 3C014120 */  lui     $at, 0x4120                ## $at = 41200000
.L80AB75FC:
/* 01E7C 80AB75FC 44816000 */  mtc1    $at, $f12                  ## $f12 = 10.00
/* 01E80 80AB7600 0C00CFC8 */  jal     Math_Rand_CenteredFloat
              
/* 01E84 80AB7604 00000000 */  nop
/* 01E88 80AB7608 C6240024 */  lwc1    $f4, 0x0024($s1)           ## 00000024
/* 01E8C 80AB760C 3C014120 */  lui     $at, 0x4120                ## $at = 41200000
/* 01E90 80AB7610 44816000 */  mtc1    $at, $f12                  ## $f12 = 10.00
/* 01E94 80AB7614 46040180 */  add.s   $f6, $f0, $f4              
/* 01E98 80AB7618 0C00CFC8 */  jal     Math_Rand_CenteredFloat
              
/* 01E9C 80AB761C E7A600AC */  swc1    $f6, 0x00AC($sp)           
/* 01EA0 80AB7620 C6280028 */  lwc1    $f8, 0x0028($s1)           ## 00000028
/* 01EA4 80AB7624 C62A0304 */  lwc1    $f10, 0x0304($s1)          ## 00000304
/* 01EA8 80AB7628 3C014120 */  lui     $at, 0x4120                ## $at = 41200000
/* 01EAC 80AB762C 44816000 */  mtc1    $at, $f12                  ## $f12 = 10.00
/* 01EB0 80AB7630 460A4400 */  add.s   $f16, $f8, $f10            
/* 01EB4 80AB7634 46100480 */  add.s   $f18, $f0, $f16            
/* 01EB8 80AB7638 0C00CFC8 */  jal     Math_Rand_CenteredFloat
              
/* 01EBC 80AB763C E7B200B0 */  swc1    $f18, 0x00B0($sp)          
/* 01EC0 80AB7640 C624002C */  lwc1    $f4, 0x002C($s1)           ## 0000002C
/* 01EC4 80AB7644 3C0140C0 */  lui     $at, 0x40C0                ## $at = 40C00000
/* 01EC8 80AB7648 44816000 */  mtc1    $at, $f12                  ## $f12 = 6.00
/* 01ECC 80AB764C 46040180 */  add.s   $f6, $f0, $f4              
/* 01ED0 80AB7650 0C00CFBE */  jal     Math_Rand_ZeroFloat
              
/* 01ED4 80AB7654 E7A600B4 */  swc1    $f6, 0x00B4($sp)           
/* 01ED8 80AB7658 3C0140C0 */  lui     $at, 0x40C0                ## $at = 40C00000
/* 01EDC 80AB765C 44814000 */  mtc1    $at, $f8                   ## $f8 = 6.00
/* 01EE0 80AB7660 24010002 */  addiu   $at, $zero, 0x0002         ## $at = 00000002
/* 01EE4 80AB7664 46080280 */  add.s   $f10, $f0, $f8             
/* 01EE8 80AB7668 E7AA008C */  swc1    $f10, 0x008C($sp)          
/* 01EEC 80AB766C 862802A6 */  lh      $t0, 0x02A6($s1)           ## 000002A6
/* 01EF0 80AB7670 44805000 */  mtc1    $zero, $f10                ## $f10 = 0.00
/* 01EF4 80AB7674 5501000E */  bnel    $t0, $at, .L80AB76B0       
/* 01EF8 80AB7678 C6300304 */  lwc1    $f16, 0x0304($s1)          ## 00000304
/* 01EFC 80AB767C 44808000 */  mtc1    $zero, $f16                ## $f16 = 0.00
/* 01F00 80AB7680 C6320304 */  lwc1    $f18, 0x0304($s1)          ## 00000304
/* 01F04 80AB7684 C7A400B0 */  lwc1    $f4, 0x00B0($sp)           
/* 01F08 80AB7688 3C014120 */  lui     $at, 0x4120                ## $at = 41200000
/* 01F0C 80AB768C 46128032 */  c.eq.s  $f16, $f18                 
/* 01F10 80AB7690 00000000 */  nop
/* 01F14 80AB7694 45030006 */  bc1tl   .L80AB76B0                 
/* 01F18 80AB7698 C6300304 */  lwc1    $f16, 0x0304($s1)          ## 00000304
/* 01F1C 80AB769C 44813000 */  mtc1    $at, $f6                   ## $f6 = 10.00
/* 01F20 80AB76A0 00000000 */  nop
/* 01F24 80AB76A4 46062200 */  add.s   $f8, $f4, $f6              
/* 01F28 80AB76A8 E7A800B0 */  swc1    $f8, 0x00B0($sp)           
/* 01F2C 80AB76AC C6300304 */  lwc1    $f16, 0x0304($s1)          ## 00000304
.L80AB76B0:
/* 01F30 80AB76B0 3C014000 */  lui     $at, 0x4000                ## $at = 40000000
/* 01F34 80AB76B4 46105032 */  c.eq.s  $f10, $f16                 
/* 01F38 80AB76B8 00000000 */  nop
/* 01F3C 80AB76BC 4502000A */  bc1fl   .L80AB76E8                 
/* 01F40 80AB76C0 3C014040 */  lui     $at, 0x4040                ## $at = 40400000
/* 01F44 80AB76C4 44816000 */  mtc1    $at, $f12                  ## $f12 = 3.00
/* 01F48 80AB76C8 0C00CFBE */  jal     Math_Rand_ZeroFloat
              
/* 01F4C 80AB76CC 00000000 */  nop
/* 01F50 80AB76D0 3C014000 */  lui     $at, 0x4000                ## $at = 40000000
/* 01F54 80AB76D4 44819000 */  mtc1    $at, $f18                  ## $f18 = 2.00
/* 01F58 80AB76D8 00000000 */  nop
/* 01F5C 80AB76DC 46120100 */  add.s   $f4, $f0, $f18             
/* 01F60 80AB76E0 E7A4008C */  swc1    $f4, 0x008C($sp)           
/* 01F64 80AB76E4 3C014040 */  lui     $at, 0x4040                ## $at = 40400000
.L80AB76E8:
/* 01F68 80AB76E8 44816000 */  mtc1    $at, $f12                  ## $f12 = 3.00
/* 01F6C 80AB76EC 0C00CFC8 */  jal     Math_Rand_CenteredFloat
              
/* 01F70 80AB76F0 00000000 */  nop
/* 01F74 80AB76F4 3C014000 */  lui     $at, 0x4000                ## $at = 40000000
/* 01F78 80AB76F8 44816000 */  mtc1    $at, $f12                  ## $f12 = 2.00
/* 01F7C 80AB76FC 0C00CFBE */  jal     Math_Rand_ZeroFloat
              
/* 01F80 80AB7700 E7A000A0 */  swc1    $f0, 0x00A0($sp)           
/* 01F84 80AB7704 3C013F00 */  lui     $at, 0x3F00                ## $at = 3F000000
/* 01F88 80AB7708 44813000 */  mtc1    $at, $f6                   ## $f6 = 0.50
/* 01F8C 80AB770C 3C014000 */  lui     $at, 0x4000                ## $at = 40000000
/* 01F90 80AB7710 44815000 */  mtc1    $at, $f10                  ## $f10 = 2.00
/* 01F94 80AB7714 46060202 */  mul.s   $f8, $f0, $f6              
/* 01F98 80AB7718 3C014040 */  lui     $at, 0x4040                ## $at = 40400000
/* 01F9C 80AB771C 44816000 */  mtc1    $at, $f12                  ## $f12 = 3.00
/* 01FA0 80AB7720 460A4400 */  add.s   $f16, $f8, $f10            
/* 01FA4 80AB7724 0C00CFC8 */  jal     Math_Rand_CenteredFloat
              
/* 01FA8 80AB7728 E7B000A4 */  swc1    $f16, 0x00A4($sp)          
/* 01FAC 80AB772C 3C0180AC */  lui     $at, %hi(D_80AB8B0C)       ## $at = 80AC0000
/* 01FB0 80AB7730 C4328B0C */  lwc1    $f18, %lo(D_80AB8B0C)($at) 
/* 01FB4 80AB7734 C7A4008C */  lwc1    $f4, 0x008C($sp)           
/* 01FB8 80AB7738 E7A000A8 */  swc1    $f0, 0x00A8($sp)           
/* 01FBC 80AB773C E7B40094 */  swc1    $f20, 0x0094($sp)          
/* 01FC0 80AB7740 E7B4009C */  swc1    $f20, 0x009C($sp)          
/* 01FC4 80AB7744 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 01FC8 80AB7748 27A500AC */  addiu   $a1, $sp, 0x00AC           ## $a1 = FFFFFFCC
/* 01FCC 80AB774C 27A600A0 */  addiu   $a2, $sp, 0x00A0           ## $a2 = FFFFFFC0
/* 01FD0 80AB7750 27A70094 */  addiu   $a3, $sp, 0x0094           ## $a3 = FFFFFFB4
/* 01FD4 80AB7754 E7B20098 */  swc1    $f18, 0x0098($sp)          
/* 01FD8 80AB7758 0C2AE05A */  jal     func_80AB8168              
/* 01FDC 80AB775C E7A40010 */  swc1    $f4, 0x0010($sp)           
/* 01FE0 80AB7760 87A900D0 */  lh      $t1, 0x00D0($sp)           
/* 01FE4 80AB7764 26100001 */  addiu   $s0, $s0, 0x0001           ## $s0 = 00000001
/* 01FE8 80AB7768 00108400 */  sll     $s0, $s0, 16               
/* 01FEC 80AB776C 00108403 */  sra     $s0, $s0, 16               
/* 01FF0 80AB7770 0209082A */  slt     $at, $s0, $t1              
/* 01FF4 80AB7774 5420FFA1 */  bnel    $at, $zero, .L80AB75FC     
/* 01FF8 80AB7778 3C014120 */  lui     $at, 0x4120                ## $at = 41200000
.L80AB777C:
/* 01FFC 80AB777C A62002A6 */  sh      $zero, 0x02A6($s1)         ## 000002A6
.L80AB7780:
/* 02000 80AB7780 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 02004 80AB7784 0C2AE096 */  jal     func_80AB8258              
/* 02008 80AB7788 8FA500E4 */  lw      $a1, 0x00E4($sp)           
/* 0200C 80AB778C 86220254 */  lh      $v0, 0x0254($s1)           ## 00000254
/* 02010 80AB7790 10400002 */  beq     $v0, $zero, .L80AB779C     
/* 02014 80AB7794 244AFFFF */  addiu   $t2, $v0, 0xFFFF           ## $t2 = FFFFFFFF
/* 02018 80AB7798 A62A0254 */  sh      $t2, 0x0254($s1)           ## 00000254
.L80AB779C:
/* 0201C 80AB779C 86220256 */  lh      $v0, 0x0256($s1)           ## 00000256
/* 02020 80AB77A0 3C014170 */  lui     $at, 0x4170                ## $at = 41700000
/* 02024 80AB77A4 10400002 */  beq     $v0, $zero, .L80AB77B0     
/* 02028 80AB77A8 244BFFFF */  addiu   $t3, $v0, 0xFFFF           ## $t3 = FFFFFFFF
/* 0202C 80AB77AC A62B0256 */  sh      $t3, 0x0256($s1)           ## 00000256
.L80AB77B0:
/* 02030 80AB77B0 86220258 */  lh      $v0, 0x0258($s1)           ## 00000258
/* 02034 80AB77B4 10400002 */  beq     $v0, $zero, .L80AB77C0     
/* 02038 80AB77B8 244CFFFF */  addiu   $t4, $v0, 0xFFFF           ## $t4 = FFFFFFFF
/* 0203C 80AB77BC A62C0258 */  sh      $t4, 0x0258($s1)           ## 00000258
.L80AB77C0:
/* 02040 80AB77C0 8622025A */  lh      $v0, 0x025A($s1)           ## 0000025A
/* 02044 80AB77C4 10400002 */  beq     $v0, $zero, .L80AB77D0     
/* 02048 80AB77C8 244DFFFF */  addiu   $t5, $v0, 0xFFFF           ## $t5 = FFFFFFFF
/* 0204C 80AB77CC A62D025A */  sh      $t5, 0x025A($s1)           ## 0000025A
.L80AB77D0:
/* 02050 80AB77D0 8622025C */  lh      $v0, 0x025C($s1)           ## 0000025C
/* 02054 80AB77D4 10400002 */  beq     $v0, $zero, .L80AB77E0     
/* 02058 80AB77D8 244EFFFF */  addiu   $t6, $v0, 0xFFFF           ## $t6 = FFFFFFFF
/* 0205C 80AB77DC A62E025C */  sh      $t6, 0x025C($s1)           ## 0000025C
.L80AB77E0:
/* 02060 80AB77E0 86220266 */  lh      $v0, 0x0266($s1)           ## 00000266
/* 02064 80AB77E4 10400002 */  beq     $v0, $zero, .L80AB77F0     
/* 02068 80AB77E8 244FFFFF */  addiu   $t7, $v0, 0xFFFF           ## $t7 = FFFFFFFF
/* 0206C 80AB77EC A62F0266 */  sh      $t7, 0x0266($s1)           ## 00000266
.L80AB77F0:
/* 02070 80AB77F0 8622025E */  lh      $v0, 0x025E($s1)           ## 0000025E
/* 02074 80AB77F4 10400002 */  beq     $v0, $zero, .L80AB7800     
/* 02078 80AB77F8 2458FFFF */  addiu   $t8, $v0, 0xFFFF           ## $t8 = FFFFFFFF
/* 0207C 80AB77FC A638025E */  sh      $t8, 0x025E($s1)           ## 0000025E
.L80AB7800:
/* 02080 80AB7800 86220260 */  lh      $v0, 0x0260($s1)           ## 00000260
/* 02084 80AB7804 10400002 */  beq     $v0, $zero, .L80AB7810     
/* 02088 80AB7808 2459FFFF */  addiu   $t9, $v0, 0xFFFF           ## $t9 = FFFFFFFF
/* 0208C 80AB780C A6390260 */  sh      $t9, 0x0260($s1)           ## 00000260
.L80AB7810:
/* 02090 80AB7810 86220262 */  lh      $v0, 0x0262($s1)           ## 00000262
/* 02094 80AB7814 10400002 */  beq     $v0, $zero, .L80AB7820     
/* 02098 80AB7818 2448FFFF */  addiu   $t0, $v0, 0xFFFF           ## $t0 = FFFFFFFF
/* 0209C 80AB781C A6280262 */  sh      $t0, 0x0262($s1)           ## 00000262
.L80AB7820:
/* 020A0 80AB7820 86220264 */  lh      $v0, 0x0264($s1)           ## 00000264
/* 020A4 80AB7824 10400002 */  beq     $v0, $zero, .L80AB7830     
/* 020A8 80AB7828 2449FFFF */  addiu   $t1, $v0, 0xFFFF           ## $t1 = FFFFFFFF
/* 020AC 80AB782C A6290264 */  sh      $t1, 0x0264($s1)           ## 00000264
.L80AB7830:
/* 020B0 80AB7830 86220268 */  lh      $v0, 0x0268($s1)           ## 00000268
/* 020B4 80AB7834 10400002 */  beq     $v0, $zero, .L80AB7840     
/* 020B8 80AB7838 244AFFFF */  addiu   $t2, $v0, 0xFFFF           ## $t2 = FFFFFFFF
/* 020BC 80AB783C A62A0268 */  sh      $t2, 0x0268($s1)           ## 00000268
.L80AB7840:
/* 020C0 80AB7840 8622026A */  lh      $v0, 0x026A($s1)           ## 0000026A
/* 020C4 80AB7844 10400002 */  beq     $v0, $zero, .L80AB7850     
/* 020C8 80AB7848 244BFFFF */  addiu   $t3, $v0, 0xFFFF           ## $t3 = FFFFFFFF
/* 020CC 80AB784C A62B026A */  sh      $t3, 0x026A($s1)           ## 0000026A
.L80AB7850:
/* 020D0 80AB7850 8A2D0030 */  lwl     $t5, 0x0030($s1)           ## 00000030
/* 020D4 80AB7854 9A2D0033 */  lwr     $t5, 0x0033($s1)           ## 00000033
/* 020D8 80AB7858 44813000 */  mtc1    $at, $f6                   ## $f6 = 15.00
/* 020DC 80AB785C 8E390250 */  lw      $t9, 0x0250($s1)           ## 00000250
/* 020E0 80AB7860 AA2D00B4 */  swl     $t5, 0x00B4($s1)           ## 000000B4
/* 020E4 80AB7864 BA2D00B7 */  swr     $t5, 0x00B7($s1)           ## 000000B7
/* 020E8 80AB7868 962D0034 */  lhu     $t5, 0x0034($s1)           ## 00000034
/* 020EC 80AB786C E62600C4 */  swc1    $f6, 0x00C4($s1)           ## 000000C4
/* 020F0 80AB7870 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 020F4 80AB7874 A62D00B8 */  sh      $t5, 0x00B8($s1)           ## 000000B8
/* 020F8 80AB7878 0320F809 */  jalr    $ra, $t9                   
/* 020FC 80AB787C 8FA500E4 */  lw      $a1, 0x00E4($sp)           
/* 02100 80AB7880 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 02104 80AB7884 0C00B56E */  jal     Actor_SetHeight
              
/* 02108 80AB7888 8E250304 */  lw      $a1, 0x0304($s1)           ## 00000304
/* 0210C 80AB788C 0C00B638 */  jal     Actor_MoveForward
              
/* 02110 80AB7890 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 02114 80AB7894 8E220250 */  lw      $v0, 0x0250($s1)           ## 00000250
/* 02118 80AB7898 3C0E80AB */  lui     $t6, %hi(func_80AB6EB4)    ## $t6 = 80AB0000
/* 0211C 80AB789C 25CE6EB4 */  addiu   $t6, $t6, %lo(func_80AB6EB4) ## $t6 = 80AB6EB4
/* 02120 80AB78A0 11C20013 */  beq     $t6, $v0, .L80AB78F0       
/* 02124 80AB78A4 3C0F80AB */  lui     $t7, %hi(func_80AB6450)    ## $t7 = 80AB0000
/* 02128 80AB78A8 25EF6450 */  addiu   $t7, $t7, %lo(func_80AB6450) ## $t7 = 80AB6450
/* 0212C 80AB78AC 11E20010 */  beq     $t7, $v0, .L80AB78F0       
/* 02130 80AB78B0 8FB800E4 */  lw      $t8, 0x00E4($sp)           
/* 02134 80AB78B4 870800A4 */  lh      $t0, 0x00A4($t8)           ## 000000A4
/* 02138 80AB78B8 24010054 */  addiu   $at, $zero, 0x0054         ## $at = 00000054
/* 0213C 80AB78BC 03002025 */  or      $a0, $t8, $zero            ## $a0 = 00000000
/* 02140 80AB78C0 1101000B */  beq     $t0, $at, .L80AB78F0       
/* 02144 80AB78C4 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 02148 80AB78C8 3C0141A0 */  lui     $at, 0x41A0                ## $at = 41A00000
/* 0214C 80AB78CC 44810000 */  mtc1    $at, $f0                   ## $f0 = 20.00
/* 02150 80AB78D0 3C014270 */  lui     $at, 0x4270                ## $at = 42700000
/* 02154 80AB78D4 44814000 */  mtc1    $at, $f8                   ## $f8 = 60.00
/* 02158 80AB78D8 2409001F */  addiu   $t1, $zero, 0x001F         ## $t1 = 0000001F
/* 0215C 80AB78DC 44060000 */  mfc1    $a2, $f0                   
/* 02160 80AB78E0 44070000 */  mfc1    $a3, $f0                   
/* 02164 80AB78E4 AFA90014 */  sw      $t1, 0x0014($sp)           
/* 02168 80AB78E8 0C00B92D */  jal     func_8002E4B4              
/* 0216C 80AB78EC E7A80010 */  swc1    $f8, 0x0010($sp)           
.L80AB78F0:
/* 02170 80AB78F0 8FAA00E4 */  lw      $t2, 0x00E4($sp)           
/* 02174 80AB78F4 24010054 */  addiu   $at, $zero, 0x0054         ## $at = 00000054
/* 02178 80AB78F8 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 0217C 80AB78FC 854B00A4 */  lh      $t3, 0x00A4($t2)           ## 000000A4
/* 02180 80AB7900 240C001D */  addiu   $t4, $zero, 0x001D         ## $t4 = 0000001D
/* 02184 80AB7904 01402025 */  or      $a0, $t2, $zero            ## $a0 = 00000000
/* 02188 80AB7908 15610009 */  bne     $t3, $at, .L80AB7930       
/* 0218C 80AB790C 3C0141A0 */  lui     $at, 0x41A0                ## $at = 41A00000
/* 02190 80AB7910 44810000 */  mtc1    $at, $f0                   ## $f0 = 20.00
/* 02194 80AB7914 3C014270 */  lui     $at, 0x4270                ## $at = 42700000
/* 02198 80AB7918 44815000 */  mtc1    $at, $f10                  ## $f10 = 60.00
/* 0219C 80AB791C 44060000 */  mfc1    $a2, $f0                   
/* 021A0 80AB7920 44070000 */  mfc1    $a3, $f0                   
/* 021A4 80AB7924 AFAC0014 */  sw      $t4, 0x0014($sp)           
/* 021A8 80AB7928 0C00B92D */  jal     func_8002E4B4              
/* 021AC 80AB792C E7AA0010 */  swc1    $f10, 0x0010($sp)          
.L80AB7930:
/* 021B0 80AB7930 3C01C6FA */  lui     $at, 0xC6FA                ## $at = C6FA0000
/* 021B4 80AB7934 44818000 */  mtc1    $at, $f16                  ## $f16 = -32000.00
/* 021B8 80AB7938 C6200080 */  lwc1    $f0, 0x0080($s1)           ## 00000080
/* 021BC 80AB793C 3C0146FA */  lui     $at, 0x46FA                ## $at = 46FA0000
/* 021C0 80AB7940 3C0480AC */  lui     $a0, %hi(D_80AB880C)       ## $a0 = 80AC0000
/* 021C4 80AB7944 4610003E */  c.le.s  $f0, $f16                  
/* 021C8 80AB7948 00000000 */  nop
/* 021CC 80AB794C 45030008 */  bc1tl   .L80AB7970                 
/* 021D0 80AB7950 46000121 */  cvt.d.s $f4, $f0                   
/* 021D4 80AB7954 44819000 */  mtc1    $at, $f18                  ## $f18 = 32000.00
/* 021D8 80AB7958 00000000 */  nop
/* 021DC 80AB795C 4600903E */  c.le.s  $f18, $f0                  
/* 021E0 80AB7960 00000000 */  nop
/* 021E4 80AB7964 450200AB */  bc1fl   .L80AB7C14                 
/* 021E8 80AB7968 96380088 */  lhu     $t8, 0x0088($s1)           ## 00000088
/* 021EC 80AB796C 46000121 */  cvt.d.s $f4, $f0                   
.L80AB7970:
/* 021F0 80AB7970 2484880C */  addiu   $a0, $a0, %lo(D_80AB880C)  ## $a0 = 80AB880C
/* 021F4 80AB7974 44072000 */  mfc1    $a3, $f4                   
/* 021F8 80AB7978 44062800 */  mfc1    $a2, $f5                   
/* 021FC 80AB797C 0C00084C */  jal     osSyncPrintf
              
/* 02200 80AB7980 00008025 */  or      $s0, $zero, $zero          ## $s0 = 00000000
/* 02204 80AB7984 8FAD00E4 */  lw      $t5, 0x00E4($sp)           
/* 02208 80AB7988 3C0480AC */  lui     $a0, %hi(D_80AB8838)       ## $a0 = 80AC0000
/* 0220C 80AB798C 24848838 */  addiu   $a0, $a0, %lo(D_80AB8838)  ## $a0 = 80AB8838
/* 02210 80AB7990 C5A600EC */  lwc1    $f6, 0x00EC($t5)           ## 000000EC
/* 02214 80AB7994 C5A800E0 */  lwc1    $f8, 0x00E0($t5)           ## 000000E0
/* 02218 80AB7998 C5AA00F0 */  lwc1    $f10, 0x00F0($t5)          ## 000000F0
/* 0221C 80AB799C C5B000E4 */  lwc1    $f16, 0x00E4($t5)          ## 000000E4
/* 02220 80AB79A0 46083301 */  sub.s   $f12, $f6, $f8             
/* 02224 80AB79A4 C5B200F4 */  lwc1    $f18, 0x00F4($t5)          ## 000000F4
/* 02228 80AB79A8 C5A400E8 */  lwc1    $f4, 0x00E8($t5)           ## 000000E8
/* 0222C 80AB79AC 46105081 */  sub.s   $f2, $f10, $f16            
/* 02230 80AB79B0 460C6182 */  mul.s   $f6, $f12, $f12            
/* 02234 80AB79B4 46049381 */  sub.s   $f14, $f18, $f4            
/* 02238 80AB79B8 46021202 */  mul.s   $f8, $f2, $f2              
/* 0223C 80AB79BC 46083280 */  add.s   $f10, $f6, $f8             
/* 02240 80AB79C0 460E7402 */  mul.s   $f16, $f14, $f14           
/* 02244 80AB79C4 46105000 */  add.s   $f0, $f10, $f16            
/* 02248 80AB79C8 46000004 */  sqrt.s  $f0, $f0                   
/* 0224C 80AB79CC 46001483 */  div.s   $f18, $f2, $f0             
/* 02250 80AB79D0 E7B20078 */  swc1    $f18, 0x0078($sp)          
/* 02254 80AB79D4 C6240024 */  lwc1    $f4, 0x0024($s1)           ## 00000024
/* 02258 80AB79D8 460021A1 */  cvt.d.s $f6, $f4                   
/* 0225C 80AB79DC 44073000 */  mfc1    $a3, $f6                   
/* 02260 80AB79E0 44063800 */  mfc1    $a2, $f7                   
/* 02264 80AB79E4 0C00084C */  jal     osSyncPrintf
              
/* 02268 80AB79E8 00000000 */  nop
/* 0226C 80AB79EC C6280028 */  lwc1    $f8, 0x0028($s1)           ## 00000028
/* 02270 80AB79F0 3C0480AC */  lui     $a0, %hi(D_80AB8868)       ## $a0 = 80AC0000
/* 02274 80AB79F4 24848868 */  addiu   $a0, $a0, %lo(D_80AB8868)  ## $a0 = 80AB8868
/* 02278 80AB79F8 460042A1 */  cvt.d.s $f10, $f8                  
/* 0227C 80AB79FC 44075000 */  mfc1    $a3, $f10                  
/* 02280 80AB7A00 44065800 */  mfc1    $a2, $f11                  
/* 02284 80AB7A04 0C00084C */  jal     osSyncPrintf
              
/* 02288 80AB7A08 00000000 */  nop
/* 0228C 80AB7A0C C630002C */  lwc1    $f16, 0x002C($s1)          ## 0000002C
/* 02290 80AB7A10 3C0480AC */  lui     $a0, %hi(D_80AB8898)       ## $a0 = 80AC0000
/* 02294 80AB7A14 24848898 */  addiu   $a0, $a0, %lo(D_80AB8898)  ## $a0 = 80AB8898
/* 02298 80AB7A18 460084A1 */  cvt.d.s $f18, $f16                 
/* 0229C 80AB7A1C 44079000 */  mfc1    $a3, $f18                  
/* 022A0 80AB7A20 44069800 */  mfc1    $a2, $f19                  
/* 022A4 80AB7A24 0C00084C */  jal     osSyncPrintf
              
/* 022A8 80AB7A28 00000000 */  nop
/* 022AC 80AB7A2C C6240008 */  lwc1    $f4, 0x0008($s1)           ## 00000008
/* 022B0 80AB7A30 3C0480AC */  lui     $a0, %hi(D_80AB88C8)       ## $a0 = 80AC0000
/* 022B4 80AB7A34 248488C8 */  addiu   $a0, $a0, %lo(D_80AB88C8)  ## $a0 = 80AB88C8
/* 022B8 80AB7A38 460021A1 */  cvt.d.s $f6, $f4                   
/* 022BC 80AB7A3C 44073000 */  mfc1    $a3, $f6                   
/* 022C0 80AB7A40 44063800 */  mfc1    $a2, $f7                   
/* 022C4 80AB7A44 0C00084C */  jal     osSyncPrintf
              
/* 022C8 80AB7A48 00000000 */  nop
/* 022CC 80AB7A4C C628000C */  lwc1    $f8, 0x000C($s1)           ## 0000000C
/* 022D0 80AB7A50 3C0480AC */  lui     $a0, %hi(D_80AB88F8)       ## $a0 = 80AC0000
/* 022D4 80AB7A54 248488F8 */  addiu   $a0, $a0, %lo(D_80AB88F8)  ## $a0 = 80AB88F8
/* 022D8 80AB7A58 460042A1 */  cvt.d.s $f10, $f8                  
/* 022DC 80AB7A5C 44075000 */  mfc1    $a3, $f10                  
/* 022E0 80AB7A60 44065800 */  mfc1    $a2, $f11                  
/* 022E4 80AB7A64 0C00084C */  jal     osSyncPrintf
              
/* 022E8 80AB7A68 00000000 */  nop
/* 022EC 80AB7A6C C6300010 */  lwc1    $f16, 0x0010($s1)          ## 00000010
/* 022F0 80AB7A70 3C0480AC */  lui     $a0, %hi(D_80AB8928)       ## $a0 = 80AC0000
/* 022F4 80AB7A74 24848928 */  addiu   $a0, $a0, %lo(D_80AB8928)  ## $a0 = 80AB8928
/* 022F8 80AB7A78 460084A1 */  cvt.d.s $f18, $f16                 
/* 022FC 80AB7A7C 44079000 */  mfc1    $a3, $f18                  
/* 02300 80AB7A80 44069800 */  mfc1    $a2, $f19                  
/* 02304 80AB7A84 0C00084C */  jal     osSyncPrintf
              
/* 02308 80AB7A88 00000000 */  nop
/* 0230C 80AB7A8C C6240008 */  lwc1    $f4, 0x0008($s1)           ## 00000008
/* 02310 80AB7A90 C6260010 */  lwc1    $f6, 0x0010($s1)           ## 00000010
/* 02314 80AB7A94 3C014320 */  lui     $at, 0x4320                ## $at = 43200000
/* 02318 80AB7A98 E6240024 */  swc1    $f4, 0x0024($s1)           ## 00000024
/* 0231C 80AB7A9C E626002C */  swc1    $f6, 0x002C($s1)           ## 0000002C
/* 02320 80AB7AA0 8FB900E4 */  lw      $t9, 0x00E4($sp)           
/* 02324 80AB7AA4 C7A80078 */  lwc1    $f8, 0x0078($sp)           
/* 02328 80AB7AA8 44815000 */  mtc1    $at, $f10                  ## $f10 = 160.00
/* 0232C 80AB7AAC C620000C */  lwc1    $f0, 0x000C($s1)           ## 0000000C
/* 02330 80AB7AB0 C73200E4 */  lwc1    $f18, 0x00E4($t9)          ## 000000E4
/* 02334 80AB7AB4 460A4402 */  mul.s   $f16, $f8, $f10            
/* 02338 80AB7AB8 3C014396 */  lui     $at, 0x4396                ## $at = 43960000
/* 0233C 80AB7ABC 46120100 */  add.s   $f4, $f0, $f18             
/* 02340 80AB7AC0 46102180 */  add.s   $f6, $f4, $f16             
/* 02344 80AB7AC4 E6260028 */  swc1    $f6, 0x0028($s1)           ## 00000028
/* 02348 80AB7AC8 C6280028 */  lwc1    $f8, 0x0028($s1)           ## 00000028
/* 0234C 80AB7ACC 4600403C */  c.lt.s  $f8, $f0                   
/* 02350 80AB7AD0 00000000 */  nop
/* 02354 80AB7AD4 45020006 */  bc1fl   .L80AB7AF0                 
/* 02358 80AB7AD8 C6240024 */  lwc1    $f4, 0x0024($s1)           ## 00000024
/* 0235C 80AB7ADC 44815000 */  mtc1    $at, $f10                  ## $f10 = 300.00
/* 02360 80AB7AE0 00000000 */  nop
/* 02364 80AB7AE4 460A0480 */  add.s   $f18, $f0, $f10            
/* 02368 80AB7AE8 E6320028 */  swc1    $f18, 0x0028($s1)          ## 00000028
/* 0236C 80AB7AEC C6240024 */  lwc1    $f4, 0x0024($s1)           ## 00000024
.L80AB7AF0:
/* 02370 80AB7AF0 3C0480AC */  lui     $a0, %hi(D_80AB8958)       ## $a0 = 80AC0000
/* 02374 80AB7AF4 24848958 */  addiu   $a0, $a0, %lo(D_80AB8958)  ## $a0 = 80AB8958
/* 02378 80AB7AF8 46002421 */  cvt.d.s $f16, $f4                  
/* 0237C 80AB7AFC 44078000 */  mfc1    $a3, $f16                  
/* 02380 80AB7B00 44068800 */  mfc1    $a2, $f17                  
/* 02384 80AB7B04 0C00084C */  jal     osSyncPrintf
              
/* 02388 80AB7B08 00000000 */  nop
/* 0238C 80AB7B0C C6260028 */  lwc1    $f6, 0x0028($s1)           ## 00000028
/* 02390 80AB7B10 3C0480AC */  lui     $a0, %hi(D_80AB8988)       ## $a0 = 80AC0000
/* 02394 80AB7B14 24848988 */  addiu   $a0, $a0, %lo(D_80AB8988)  ## $a0 = 80AB8988
/* 02398 80AB7B18 46003221 */  cvt.d.s $f8, $f6                   
/* 0239C 80AB7B1C 44074000 */  mfc1    $a3, $f8                   
/* 023A0 80AB7B20 44064800 */  mfc1    $a2, $f9                   
/* 023A4 80AB7B24 0C00084C */  jal     osSyncPrintf
              
/* 023A8 80AB7B28 00000000 */  nop
/* 023AC 80AB7B2C C62A002C */  lwc1    $f10, 0x002C($s1)          ## 0000002C
/* 023B0 80AB7B30 3C0480AC */  lui     $a0, %hi(D_80AB89B8)       ## $a0 = 80AC0000
/* 023B4 80AB7B34 248489B8 */  addiu   $a0, $a0, %lo(D_80AB89B8)  ## $a0 = 80AB89B8
/* 023B8 80AB7B38 460054A1 */  cvt.d.s $f18, $f10                 
/* 023BC 80AB7B3C 44079000 */  mfc1    $a3, $f18                  
/* 023C0 80AB7B40 44069800 */  mfc1    $a2, $f19                  
/* 023C4 80AB7B44 0C00084C */  jal     osSyncPrintf
              
/* 023C8 80AB7B48 00000000 */  nop
/* 023CC 80AB7B4C 3C0480AC */  lui     $a0, %hi(D_80AB89E8)       ## $a0 = 80AC0000
/* 023D0 80AB7B50 0C00084C */  jal     osSyncPrintf
              
/* 023D4 80AB7B54 248489E8 */  addiu   $a0, $a0, %lo(D_80AB89E8)  ## $a0 = 80AB89E8
/* 023D8 80AB7B58 3C01C000 */  lui     $at, 0xC000                ## $at = C0000000
/* 023DC 80AB7B5C 44812000 */  mtc1    $at, $f4                   ## $f4 = -2.00
/* 023E0 80AB7B60 E6340068 */  swc1    $f20, 0x0068($s1)          ## 00000068
/* 023E4 80AB7B64 26250008 */  addiu   $a1, $s1, 0x0008           ## $a1 = 00000008
/* 023E8 80AB7B68 E624006C */  swc1    $f4, 0x006C($s1)           ## 0000006C
/* 023EC 80AB7B6C AFA5003C */  sw      $a1, 0x003C($sp)           
/* 023F0 80AB7B70 0C01DF90 */  jal     Math_Vec3f_Copy
              ## Vec3f_Copy
/* 023F4 80AB7B74 262402AC */  addiu   $a0, $s1, 0x02AC           ## $a0 = 000002AC
/* 023F8 80AB7B78 8FA5003C */  lw      $a1, 0x003C($sp)           
/* 023FC 80AB7B7C 0C01DF90 */  jal     Math_Vec3f_Copy
              ## Vec3f_Copy
/* 02400 80AB7B80 262402B8 */  addiu   $a0, $s1, 0x02B8           ## $a0 = 000002B8
/* 02404 80AB7B84 A62002A2 */  sh      $zero, 0x02A2($s1)         ## 000002A2
/* 02408 80AB7B88 862202A2 */  lh      $v0, 0x02A2($s1)           ## 000002A2
/* 0240C 80AB7B8C E6340300 */  swc1    $f20, 0x0300($s1)          ## 00000300
/* 02410 80AB7B90 E63402FC */  swc1    $f20, 0x02FC($s1)          ## 000002FC
/* 02414 80AB7B94 E63402F8 */  swc1    $f20, 0x02F8($s1)          ## 000002F8
/* 02418 80AB7B98 E63402F4 */  swc1    $f20, 0x02F4($s1)          ## 000002F4
/* 0241C 80AB7B9C E63402F0 */  swc1    $f20, 0x02F0($s1)          ## 000002F0
/* 02420 80AB7BA0 E63402D8 */  swc1    $f20, 0x02D8($s1)          ## 000002D8
/* 02424 80AB7BA4 E63402D4 */  swc1    $f20, 0x02D4($s1)          ## 000002D4
/* 02428 80AB7BA8 E63402D0 */  swc1    $f20, 0x02D0($s1)          ## 000002D0
/* 0242C 80AB7BAC E63402CC */  swc1    $f20, 0x02CC($s1)          ## 000002CC
/* 02430 80AB7BB0 E63402C8 */  swc1    $f20, 0x02C8($s1)          ## 000002C8
/* 02434 80AB7BB4 E63402C4 */  swc1    $f20, 0x02C4($s1)          ## 000002C4
/* 02438 80AB7BB8 E63402DC */  swc1    $f20, 0x02DC($s1)          ## 000002DC
/* 0243C 80AB7BBC E63402E0 */  swc1    $f20, 0x02E0($s1)          ## 000002E0
/* 02440 80AB7BC0 A62202A0 */  sh      $v0, 0x02A0($s1)           ## 000002A0
/* 02444 80AB7BC4 A622029E */  sh      $v0, 0x029E($s1)           ## 0000029E
/* 02448 80AB7BC8 A62202A6 */  sh      $v0, 0x02A6($s1)           ## 000002A6
/* 0244C 80AB7BCC A6220298 */  sh      $v0, 0x0298($s1)           ## 00000298
/* 02450 80AB7BD0 A6220294 */  sh      $v0, 0x0294($s1)           ## 00000294
/* 02454 80AB7BD4 A62202A8 */  sh      $v0, 0x02A8($s1)           ## 000002A8
.L80AB7BD8:
/* 02458 80AB7BD8 00107080 */  sll     $t6, $s0,  2               
/* 0245C 80AB7BDC 26100001 */  addiu   $s0, $s0, 0x0001           ## $s0 = 00000001
/* 02460 80AB7BE0 00108400 */  sll     $s0, $s0, 16               
/* 02464 80AB7BE4 44808000 */  mtc1    $zero, $f16                ## $f16 = 0.00
/* 02468 80AB7BE8 00108403 */  sra     $s0, $s0, 16               
/* 0246C 80AB7BEC 2A01000A */  slti    $at, $s0, 0x000A           
/* 02470 80AB7BF0 022E7821 */  addu    $t7, $s1, $t6              
/* 02474 80AB7BF4 1420FFF8 */  bne     $at, $zero, .L80AB7BD8     
/* 02478 80AB7BF8 E5F0026C */  swc1    $f16, 0x026C($t7)          ## 0000026C
/* 0247C 80AB7BFC 3C0880AB */  lui     $t0, %hi(func_80AB7420)    ## $t0 = 80AB0000
/* 02480 80AB7C00 25087420 */  addiu   $t0, $t0, %lo(func_80AB7420) ## $t0 = 80AB7420
/* 02484 80AB7C04 A62002A8 */  sh      $zero, 0x02A8($s1)         ## 000002A8
/* 02488 80AB7C08 100000CF */  beq     $zero, $zero, .L80AB7F48   
/* 0248C 80AB7C0C AE280250 */  sw      $t0, 0x0250($s1)           ## 00000250
/* 02490 80AB7C10 96380088 */  lhu     $t8, 0x0088($s1)           ## 00000088
.L80AB7C14:
/* 02494 80AB7C14 3C0480AC */  lui     $a0, %hi(D_80AB85E0)       ## $a0 = 80AC0000
/* 02498 80AB7C18 3C014170 */  lui     $at, 0x4170                ## $at = 41700000
/* 0249C 80AB7C1C 33090020 */  andi    $t1, $t8, 0x0020           ## $t1 = 00000000
/* 024A0 80AB7C20 11200032 */  beq     $t1, $zero, .L80AB7CEC     
/* 024A4 80AB7C24 248485E0 */  addiu   $a0, $a0, %lo(D_80AB85E0)  ## $a0 = 80AB85E0
/* 024A8 80AB7C28 44813000 */  mtc1    $at, $f6                   ## $f6 = 15.00
/* 024AC 80AB7C2C C6280084 */  lwc1    $f8, 0x0084($s1)           ## 00000084
/* 024B0 80AB7C30 4608303C */  c.lt.s  $f6, $f8                   
/* 024B4 80AB7C34 00000000 */  nop
/* 024B8 80AB7C38 4502002D */  bc1fl   .L80AB7CF0                 
/* 024BC 80AB7C3C 848D0000 */  lh      $t5, 0x0000($a0)           ## 80AB85E0
/* 024C0 80AB7C40 8E2B0250 */  lw      $t3, 0x0250($s1)           ## 00000250
/* 024C4 80AB7C44 3C1080AB */  lui     $s0, %hi(func_80AB6F04)    ## $s0 = 80AB0000
/* 024C8 80AB7C48 26106F04 */  addiu   $s0, $s0, %lo(func_80AB6F04) ## $s0 = 80AB6F04
/* 024CC 80AB7C4C 520B0028 */  beql    $s0, $t3, .L80AB7CF0       
/* 024D0 80AB7C50 848D0000 */  lh      $t5, 0x0000($a0)           ## 80AB85E0
/* 024D4 80AB7C54 8622001C */  lh      $v0, 0x001C($s1)           ## 0000001C
/* 024D8 80AB7C58 2401000D */  addiu   $at, $zero, 0x000D         ## $at = 0000000D
/* 024DC 80AB7C5C 10410023 */  beq     $v0, $at, .L80AB7CEC       
/* 024E0 80AB7C60 2401000E */  addiu   $at, $zero, 0x000E         ## $at = 0000000E
/* 024E4 80AB7C64 10410021 */  beq     $v0, $at, .L80AB7CEC       
/* 024E8 80AB7C68 2401000A */  addiu   $at, $zero, 0x000A         ## $at = 0000000A
/* 024EC 80AB7C6C 1041001F */  beq     $v0, $at, .L80AB7CEC       
/* 024F0 80AB7C70 26250024 */  addiu   $a1, $s1, 0x0024           ## $a1 = 00000024
/* 024F4 80AB7C74 E6340060 */  swc1    $f20, 0x0060($s1)          ## 00000060
/* 024F8 80AB7C78 E634006C */  swc1    $f20, 0x006C($s1)          ## 0000006C
/* 024FC 80AB7C7C 0C01DF90 */  jal     Math_Vec3f_Copy
              ## Vec3f_Copy
/* 02500 80AB7C80 27A400AC */  addiu   $a0, $sp, 0x00AC           ## $a0 = FFFFFFCC
/* 02504 80AB7C84 C7AA00B0 */  lwc1    $f10, 0x00B0($sp)          
/* 02508 80AB7C88 C6320084 */  lwc1    $f18, 0x0084($s1)          ## 00000084
/* 0250C 80AB7C8C 240A001E */  addiu   $t2, $zero, 0x001E         ## $t2 = 0000001E
/* 02510 80AB7C90 240C0190 */  addiu   $t4, $zero, 0x0190         ## $t4 = 00000190
/* 02514 80AB7C94 46125100 */  add.s   $f4, $f10, $f18            
/* 02518 80AB7C98 27A500AC */  addiu   $a1, $sp, 0x00AC           ## $a1 = FFFFFFCC
/* 0251C 80AB7C9C 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 02520 80AB7CA0 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 02524 80AB7CA4 E7A400B0 */  swc1    $f4, 0x00B0($sp)           
/* 02528 80AB7CA8 A62A025A */  sh      $t2, 0x025A($s1)           ## 0000025A
/* 0252C 80AB7CAC AFAC0014 */  sw      $t4, 0x0014($sp)           
/* 02530 80AB7CB0 AFA00010 */  sw      $zero, 0x0010($sp)         
/* 02534 80AB7CB4 0C00A527 */  jal     EffectSsGSplash_Spawn              
/* 02538 80AB7CB8 8FA400E4 */  lw      $a0, 0x00E4($sp)           
/* 0253C 80AB7CBC 3C0480AC */  lui     $a0, %hi(D_80AB89EC)       ## $a0 = 80AC0000
/* 02540 80AB7CC0 A620025C */  sh      $zero, 0x025C($s1)         ## 0000025C
/* 02544 80AB7CC4 0C00084C */  jal     osSyncPrintf
              
/* 02548 80AB7CC8 248489EC */  addiu   $a0, $a0, %lo(D_80AB89EC)  ## $a0 = 80AB89EC
/* 0254C 80AB7CCC 3C0480AC */  lui     $a0, %hi(D_80AB89F0)       ## $a0 = 80AC0000
/* 02550 80AB7CD0 0C00084C */  jal     osSyncPrintf
              
/* 02554 80AB7CD4 248489F0 */  addiu   $a0, $a0, %lo(D_80AB89F0)  ## $a0 = 80AB89F0
/* 02558 80AB7CD8 3C0480AC */  lui     $a0, %hi(D_80AB8A1C)       ## $a0 = 80AC0000
/* 0255C 80AB7CDC 0C00084C */  jal     osSyncPrintf
              
/* 02560 80AB7CE0 24848A1C */  addiu   $a0, $a0, %lo(D_80AB8A1C)  ## $a0 = 80AB8A1C
/* 02564 80AB7CE4 10000098 */  beq     $zero, $zero, .L80AB7F48   
/* 02568 80AB7CE8 AE300250 */  sw      $s0, 0x0250($s1)           ## 00000250
.L80AB7CEC:
/* 0256C 80AB7CEC 848D0000 */  lh      $t5, 0x0000($a0)           ## 00000000
.L80AB7CF0:
/* 02570 80AB7CF0 55A00030 */  bnel    $t5, $zero, .L80AB7DB4     
/* 02574 80AB7CF4 863802A8 */  lh      $t8, 0x02A8($s1)           ## 000002A8
/* 02578 80AB7CF8 863902A4 */  lh      $t9, 0x02A4($s1)           ## 000002A4
/* 0257C 80AB7CFC 5F20002D */  bgtzl   $t9, .L80AB7DB4            
/* 02580 80AB7D00 863802A8 */  lh      $t8, 0x02A8($s1)           ## 000002A8
/* 02584 80AB7D04 8622001C */  lh      $v0, 0x001C($s1)           ## 0000001C
/* 02588 80AB7D08 2401000D */  addiu   $at, $zero, 0x000D         ## $at = 0000000D
/* 0258C 80AB7D0C 10410028 */  beq     $v0, $at, .L80AB7DB0       
/* 02590 80AB7D10 2401000E */  addiu   $at, $zero, 0x000E         ## $at = 0000000E
/* 02594 80AB7D14 10410026 */  beq     $v0, $at, .L80AB7DB0       
/* 02598 80AB7D18 2401000A */  addiu   $at, $zero, 0x000A         ## $at = 0000000A
/* 0259C 80AB7D1C 10410024 */  beq     $v0, $at, .L80AB7DB0       
/* 025A0 80AB7D20 3C014120 */  lui     $at, 0x4120                ## $at = 41200000
/* 025A4 80AB7D24 44818000 */  mtc1    $at, $f16                  ## $f16 = 10.00
/* 025A8 80AB7D28 C6260090 */  lwc1    $f6, 0x0090($s1)           ## 00000090
/* 025AC 80AB7D2C 240E0064 */  addiu   $t6, $zero, 0x0064         ## $t6 = 00000064
/* 025B0 80AB7D30 3C0880AB */  lui     $t0, %hi(func_80AB70A0)    ## $t0 = 80AB0000
/* 025B4 80AB7D34 4606803C */  c.lt.s  $f16, $f6                  
/* 025B8 80AB7D38 A62E025E */  sh      $t6, 0x025E($s1)           ## 0000025E
/* 025BC 80AB7D3C 24030001 */  addiu   $v1, $zero, 0x0001         ## $v1 = 00000001
/* 025C0 80AB7D40 240F2710 */  addiu   $t7, $zero, 0x2710         ## $t7 = 00002710
/* 025C4 80AB7D44 4500001A */  bc1f    .L80AB7DB0                 
/* 025C8 80AB7D48 250870A0 */  addiu   $t0, $t0, %lo(func_80AB70A0) ## $t0 = 80AB70A0
/* 025CC 80AB7D4C A4830000 */  sh      $v1, 0x0000($a0)           ## 00000000
/* 025D0 80AB7D50 C6200024 */  lwc1    $f0, 0x0024($s1)           ## 00000024
/* 025D4 80AB7D54 A620029E */  sh      $zero, 0x029E($s1)         ## 0000029E
/* 025D8 80AB7D58 8622029E */  lh      $v0, 0x029E($s1)           ## 0000029E
/* 025DC 80AB7D5C E62002B8 */  swc1    $f0, 0x02B8($s1)           ## 000002B8
/* 025E0 80AB7D60 E62002AC */  swc1    $f0, 0x02AC($s1)           ## 000002AC
/* 025E4 80AB7D64 C6200028 */  lwc1    $f0, 0x0028($s1)           ## 00000028
/* 025E8 80AB7D68 E6340068 */  swc1    $f20, 0x0068($s1)          ## 00000068
/* 025EC 80AB7D6C E63402FC */  swc1    $f20, 0x02FC($s1)          ## 000002FC
/* 025F0 80AB7D70 E62002BC */  swc1    $f0, 0x02BC($s1)           ## 000002BC
/* 025F4 80AB7D74 E62002B0 */  swc1    $f0, 0x02B0($s1)           ## 000002B0
/* 025F8 80AB7D78 C620002C */  lwc1    $f0, 0x002C($s1)           ## 0000002C
/* 025FC 80AB7D7C E6340300 */  swc1    $f20, 0x0300($s1)          ## 00000300
/* 02600 80AB7D80 E6340288 */  swc1    $f20, 0x0288($s1)          ## 00000288
/* 02604 80AB7D84 E6340280 */  swc1    $f20, 0x0280($s1)          ## 00000280
/* 02608 80AB7D88 E6340284 */  swc1    $f20, 0x0284($s1)          ## 00000284
/* 0260C 80AB7D8C E634028C */  swc1    $f20, 0x028C($s1)          ## 0000028C
/* 02610 80AB7D90 A62F0260 */  sh      $t7, 0x0260($s1)           ## 00000260
/* 02614 80AB7D94 A62302A8 */  sh      $v1, 0x02A8($s1)           ## 000002A8
/* 02618 80AB7D98 AE280250 */  sw      $t0, 0x0250($s1)           ## 00000250
/* 0261C 80AB7D9C A622025A */  sh      $v0, 0x025A($s1)           ## 0000025A
/* 02620 80AB7DA0 A622025C */  sh      $v0, 0x025C($s1)           ## 0000025C
/* 02624 80AB7DA4 E62002C0 */  swc1    $f0, 0x02C0($s1)           ## 000002C0
/* 02628 80AB7DA8 10000067 */  beq     $zero, $zero, .L80AB7F48   
/* 0262C 80AB7DAC E62002B4 */  swc1    $f0, 0x02B4($s1)           ## 000002B4
.L80AB7DB0:
/* 02630 80AB7DB0 863802A8 */  lh      $t8, 0x02A8($s1)           ## 000002A8
.L80AB7DB4:
/* 02634 80AB7DB4 3C0141A0 */  lui     $at, 0x41A0                ## $at = 41A00000
/* 02638 80AB7DB8 53000015 */  beql    $t8, $zero, .L80AB7E10     
/* 0263C 80AB7DBC 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 02640 80AB7DC0 44815000 */  mtc1    $at, $f10                  ## $f10 = 20.00
/* 02644 80AB7DC4 44819000 */  mtc1    $at, $f18                  ## $f18 = 20.00
/* 02648 80AB7DC8 C628008C */  lwc1    $f8, 0x008C($s1)           ## 0000008C
/* 0264C 80AB7DCC 8FA900D4 */  lw      $t1, 0x00D4($sp)           
/* 02650 80AB7DD0 46125102 */  mul.s   $f4, $f10, $f18            
/* 02654 80AB7DD4 4604403C */  c.lt.s  $f8, $f4                   
/* 02658 80AB7DD8 00000000 */  nop
/* 0265C 80AB7DDC 4502000C */  bc1fl   .L80AB7E10                 
/* 02660 80AB7DE0 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 02664 80AB7DE4 812B0A78 */  lb      $t3, 0x0A78($t1)           ## 00000A78
/* 02668 80AB7DE8 8FA400E4 */  lw      $a0, 0x00E4($sp)           
/* 0266C 80AB7DEC 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 02670 80AB7DF0 15600006 */  bne     $t3, $zero, .L80AB7E0C     
/* 02674 80AB7DF4 3C064000 */  lui     $a2, 0x4000                ## $a2 = 40000000
/* 02678 80AB7DF8 86270032 */  lh      $a3, 0x0032($s1)           ## 00000032
/* 0267C 80AB7DFC 240A0010 */  addiu   $t2, $zero, 0x0010         ## $t2 = 00000010
/* 02680 80AB7E00 AFAA0014 */  sw      $t2, 0x0014($sp)           
/* 02684 80AB7E04 0C00BDB5 */  jal     func_8002F6D4              
/* 02688 80AB7E08 E7B40010 */  swc1    $f20, 0x0010($sp)          
.L80AB7E0C:
/* 0268C 80AB7E0C 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
.L80AB7E10:
/* 02690 80AB7E10 0C2ADD1F */  jal     func_80AB747C              
/* 02694 80AB7E14 8FA500E4 */  lw      $a1, 0x00E4($sp)           
/* 02698 80AB7E18 862C0262 */  lh      $t4, 0x0262($s1)           ## 00000262
/* 0269C 80AB7E1C 5580000B */  bnel    $t4, $zero, .L80AB7E4C     
/* 026A0 80AB7E20 862F0260 */  lh      $t7, 0x0260($s1)           ## 00000260
/* 026A4 80AB7E24 8E390250 */  lw      $t9, 0x0250($s1)           ## 00000250
/* 026A8 80AB7E28 3C0D80AB */  lui     $t5, %hi(func_80AB6BF8)    ## $t5 = 80AB0000
/* 026AC 80AB7E2C 25AD6BF8 */  addiu   $t5, $t5, %lo(func_80AB6BF8) ## $t5 = 80AB6BF8
/* 026B0 80AB7E30 15B90005 */  bne     $t5, $t9, .L80AB7E48       
/* 026B4 80AB7E34 240E0007 */  addiu   $t6, $zero, 0x0007         ## $t6 = 00000007
/* 026B8 80AB7E38 A62E0262 */  sh      $t6, 0x0262($s1)           ## 00000262
/* 026BC 80AB7E3C 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 026C0 80AB7E40 0C00BE0A */  jal     Audio_PlayActorSound2
              
/* 026C4 80AB7E44 240538FF */  addiu   $a1, $zero, 0x38FF         ## $a1 = 000038FF
.L80AB7E48:
/* 026C8 80AB7E48 862F0260 */  lh      $t7, 0x0260($s1)           ## 00000260
.L80AB7E4C:
/* 026CC 80AB7E4C 8FA8003C */  lw      $t0, 0x003C($sp)           
/* 026D0 80AB7E50 55E00010 */  bnel    $t7, $zero, .L80AB7E94     
/* 026D4 80AB7E54 862A02A8 */  lh      $t2, 0x02A8($s1)           ## 000002A8
/* 026D8 80AB7E58 8E380250 */  lw      $t8, 0x0250($s1)           ## 00000250
/* 026DC 80AB7E5C 240B012C */  addiu   $t3, $zero, 0x012C         ## $t3 = 0000012C
/* 026E0 80AB7E60 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 026E4 80AB7E64 11180008 */  beq     $t0, $t8, .L80AB7E88       
/* 026E8 80AB7E68 24052811 */  addiu   $a1, $zero, 0x2811         ## $a1 = 00002811
/* 026EC 80AB7E6C 2409001E */  addiu   $t1, $zero, 0x001E         ## $t1 = 0000001E
/* 026F0 80AB7E70 A6290260 */  sh      $t1, 0x0260($s1)           ## 00000260
/* 026F4 80AB7E74 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 026F8 80AB7E78 0C00BE0A */  jal     Audio_PlayActorSound2
              
/* 026FC 80AB7E7C 24052812 */  addiu   $a1, $zero, 0x2812         ## $a1 = 00002812
/* 02700 80AB7E80 10000004 */  beq     $zero, $zero, .L80AB7E94   
/* 02704 80AB7E84 862A02A8 */  lh      $t2, 0x02A8($s1)           ## 000002A8
.L80AB7E88:
/* 02708 80AB7E88 0C00BE0A */  jal     Audio_PlayActorSound2
              
/* 0270C 80AB7E8C A62B0260 */  sh      $t3, 0x0260($s1)           ## 00000260
/* 02710 80AB7E90 862A02A8 */  lh      $t2, 0x02A8($s1)           ## 000002A8
.L80AB7E94:
/* 02714 80AB7E94 2630030C */  addiu   $s0, $s1, 0x030C           ## $s0 = 0000030C
/* 02718 80AB7E98 02002825 */  or      $a1, $s0, $zero            ## $a1 = 0000030C
/* 0271C 80AB7E9C 1540002A */  bne     $t2, $zero, .L80AB7F48     
/* 02720 80AB7EA0 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 02724 80AB7EA4 3C0C80AB */  lui     $t4, %hi(func_80AB6BF8)    ## $t4 = 80AB0000
/* 02728 80AB7EA8 258C6BF8 */  addiu   $t4, $t4, %lo(func_80AB6BF8) ## $t4 = 80AB6BF8
/* 0272C 80AB7EAC 0C0189B7 */  jal     Collider_CylinderUpdate
              
/* 02730 80AB7EB0 AFAC003C */  sw      $t4, 0x003C($sp)           
/* 02734 80AB7EB4 8622001C */  lh      $v0, 0x001C($s1)           ## 0000001C
/* 02738 80AB7EB8 2401000A */  addiu   $at, $zero, 0x000A         ## $at = 0000000A
/* 0273C 80AB7EBC 1041000C */  beq     $v0, $at, .L80AB7EF0       
/* 02740 80AB7EC0 2401000D */  addiu   $at, $zero, 0x000D         ## $at = 0000000D
/* 02744 80AB7EC4 1041000A */  beq     $v0, $at, .L80AB7EF0       
/* 02748 80AB7EC8 2401000E */  addiu   $at, $zero, 0x000E         ## $at = 0000000E
/* 0274C 80AB7ECC 10410008 */  beq     $v0, $at, .L80AB7EF0       
/* 02750 80AB7ED0 24010004 */  addiu   $at, $zero, 0x0004         ## $at = 00000004
/* 02754 80AB7ED4 10410006 */  beq     $v0, $at, .L80AB7EF0       
/* 02758 80AB7ED8 8FA400E4 */  lw      $a0, 0x00E4($sp)           
/* 0275C 80AB7EDC 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 02760 80AB7EE0 34211E60 */  ori     $at, $at, 0x1E60           ## $at = 00011E60
/* 02764 80AB7EE4 00812821 */  addu    $a1, $a0, $at              
/* 02768 80AB7EE8 0C01767D */  jal     CollisionCheck_SetAC
              ## CollisionCheck_setAC
/* 0276C 80AB7EEC 02003025 */  or      $a2, $s0, $zero            ## $a2 = 0000030C
.L80AB7EF0:
/* 02770 80AB7EF0 8E220250 */  lw      $v0, 0x0250($s1)           ## 00000250
/* 02774 80AB7EF4 8FB9003C */  lw      $t9, 0x003C($sp)           
/* 02778 80AB7EF8 3C0E80AB */  lui     $t6, %hi(func_80AB6D08)    ## $t6 = 80AB0000
/* 0277C 80AB7EFC 25CE6D08 */  addiu   $t6, $t6, %lo(func_80AB6D08) ## $t6 = 80AB6D08
/* 02780 80AB7F00 53220012 */  beql    $t9, $v0, .L80AB7F4C       
/* 02784 80AB7F04 8FBF002C */  lw      $ra, 0x002C($sp)           
/* 02788 80AB7F08 11C2000F */  beq     $t6, $v0, .L80AB7F48       
/* 0278C 80AB7F0C 3C0F80AB */  lui     $t7, %hi(func_80AB6324)    ## $t7 = 80AB0000
/* 02790 80AB7F10 25EF6324 */  addiu   $t7, $t7, %lo(func_80AB6324) ## $t7 = 80AB6324
/* 02794 80AB7F14 11E2000C */  beq     $t7, $v0, .L80AB7F48       
/* 02798 80AB7F18 3C0880AB */  lui     $t0, %hi(func_80AB63A8)    ## $t0 = 80AB0000
/* 0279C 80AB7F1C 250863A8 */  addiu   $t0, $t0, %lo(func_80AB63A8) ## $t0 = 80AB63A8
/* 027A0 80AB7F20 11020009 */  beq     $t0, $v0, .L80AB7F48       
/* 027A4 80AB7F24 3C1880AB */  lui     $t8, %hi(func_80AB6450)    ## $t8 = 80AB0000
/* 027A8 80AB7F28 27186450 */  addiu   $t8, $t8, %lo(func_80AB6450) ## $t8 = 80AB6450
/* 027AC 80AB7F2C 13020006 */  beq     $t8, $v0, .L80AB7F48       
/* 027B0 80AB7F30 8FA400E4 */  lw      $a0, 0x00E4($sp)           
/* 027B4 80AB7F34 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 027B8 80AB7F38 34211E60 */  ori     $at, $at, 0x1E60           ## $at = 00011E60
/* 027BC 80AB7F3C 00812821 */  addu    $a1, $a0, $at              
/* 027C0 80AB7F40 0C017713 */  jal     CollisionCheck_SetOC
              ## CollisionCheck_setOT
/* 027C4 80AB7F44 02003025 */  or      $a2, $s0, $zero            ## $a2 = 0000030C
.L80AB7F48:
/* 027C8 80AB7F48 8FBF002C */  lw      $ra, 0x002C($sp)           
.L80AB7F4C:
/* 027CC 80AB7F4C D7B40018 */  ldc1    $f20, 0x0018($sp)          
/* 027D0 80AB7F50 8FB00024 */  lw      $s0, 0x0024($sp)           
/* 027D4 80AB7F54 8FB10028 */  lw      $s1, 0x0028($sp)           
/* 027D8 80AB7F58 03E00008 */  jr      $ra                        
/* 027DC 80AB7F5C 27BD00E0 */  addiu   $sp, $sp, 0x00E0           ## $sp = 00000000
