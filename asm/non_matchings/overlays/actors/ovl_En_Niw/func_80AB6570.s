.late_rodata
glabel D_80AB8AD4
    .float 1.99000000954

glabel D_80AB8AD8
    .float 3.99

glabel D_80AB8ADC
    .float 3.99

glabel D_80AB8AE0
    .float 10430.378

.text
glabel func_80AB6570
/* 00DF0 80AB6570 27BDFFC0 */  addiu   $sp, $sp, 0xFFC0           ## $sp = FFFFFFC0
/* 00DF4 80AB6574 3C0142C8 */  lui     $at, 0x42C8                ## $at = 42C80000
/* 00DF8 80AB6578 AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 00DFC 80AB657C AFB00020 */  sw      $s0, 0x0020($sp)           
/* 00E00 80AB6580 44816000 */  mtc1    $at, $f12                  ## $f12 = 100.00
/* 00E04 80AB6584 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00E08 80AB6588 0C00CFC8 */  jal     Math_Rand_CenteredFloat
              
/* 00E0C 80AB658C AFA50044 */  sw      $a1, 0x0044($sp)           
/* 00E10 80AB6590 3C0142C8 */  lui     $at, 0x42C8                ## $at = 42C80000
/* 00E14 80AB6594 44816000 */  mtc1    $at, $f12                  ## $f12 = 100.00
/* 00E18 80AB6598 0C00CFC8 */  jal     Math_Rand_CenteredFloat
              
/* 00E1C 80AB659C E7A00034 */  swc1    $f0, 0x0034($sp)           
/* 00E20 80AB65A0 860E001C */  lh      $t6, 0x001C($s0)           ## 0000001C
/* 00E24 80AB65A4 2401000A */  addiu   $at, $zero, 0x000A         ## $at = 0000000A
/* 00E28 80AB65A8 C7A20034 */  lwc1    $f2, 0x0034($sp)           
/* 00E2C 80AB65AC 11C10022 */  beq     $t6, $at, .L80AB6638       
/* 00E30 80AB65B0 46000386 */  mov.s   $f14, $f0                  
/* 00E34 80AB65B4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00E38 80AB65B8 8FA50044 */  lw      $a1, 0x0044($sp)           
/* 00E3C 80AB65BC E7A20034 */  swc1    $f2, 0x0034($sp)           
/* 00E40 80AB65C0 0C00BD04 */  jal     Actor_HasParent              
/* 00E44 80AB65C4 E7AE0030 */  swc1    $f14, 0x0030($sp)          
/* 00E48 80AB65C8 C7A20034 */  lwc1    $f2, 0x0034($sp)           
/* 00E4C 80AB65CC 10400012 */  beq     $v0, $zero, .L80AB6618     
/* 00E50 80AB65D0 C7AE0030 */  lwc1    $f14, 0x0030($sp)          
/* 00E54 80AB65D4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00E58 80AB65D8 0C00BE0A */  jal     Audio_PlayActorSound2
              
/* 00E5C 80AB65DC 24052813 */  addiu   $a1, $zero, 0x2813         ## $a1 = 00002813
/* 00E60 80AB65E0 8E0F0004 */  lw      $t7, 0x0004($s0)           ## 00000004
/* 00E64 80AB65E4 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 00E68 80AB65E8 2401FFFE */  addiu   $at, $zero, 0xFFFE         ## $at = FFFFFFFE
/* 00E6C 80AB65EC 3C1980AB */  lui     $t9, %hi(func_80AB6BF8)    ## $t9 = 80AB0000
/* 00E70 80AB65F0 2402001E */  addiu   $v0, $zero, 0x001E         ## $v0 = 0000001E
/* 00E74 80AB65F4 27396BF8 */  addiu   $t9, $t9, %lo(func_80AB6BF8) ## $t9 = 80AB6BF8
/* 00E78 80AB65F8 01E1C024 */  and     $t8, $t7, $at              
/* 00E7C 80AB65FC A6020260 */  sh      $v0, 0x0260($s0)           ## 00000260
/* 00E80 80AB6600 A60002E8 */  sh      $zero, 0x02E8($s0)         ## 000002E8
/* 00E84 80AB6604 A602025A */  sh      $v0, 0x025A($s0)           ## 0000025A
/* 00E88 80AB6608 AE180004 */  sw      $t8, 0x0004($s0)           ## 00000004
/* 00E8C 80AB660C AE190250 */  sw      $t9, 0x0250($s0)           ## 00000250
/* 00E90 80AB6610 10000104 */  beq     $zero, $zero, .L80AB6A24   
/* 00E94 80AB6614 E6040068 */  swc1    $f4, 0x0068($s0)           ## 00000068
.L80AB6618:
/* 00E98 80AB6618 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00E9C 80AB661C 8FA50044 */  lw      $a1, 0x0044($sp)           
/* 00EA0 80AB6620 E7A20034 */  swc1    $f2, 0x0034($sp)           
/* 00EA4 80AB6624 0C00BD60 */  jal     func_8002F580              
/* 00EA8 80AB6628 E7AE0030 */  swc1    $f14, 0x0030($sp)          
/* 00EAC 80AB662C C7A20034 */  lwc1    $f2, 0x0034($sp)           
/* 00EB0 80AB6630 1000001E */  beq     $zero, $zero, .L80AB66AC   
/* 00EB4 80AB6634 C7AE0030 */  lwc1    $f14, 0x0030($sp)          
.L80AB6638:
/* 00EB8 80AB6638 860802E8 */  lh      $t0, 0x02E8($s0)           ## 000002E8
/* 00EBC 80AB663C 5100001C */  beql    $t0, $zero, .L80AB66B0     
/* 00EC0 80AB6640 A7A0002E */  sh      $zero, 0x002E($sp)         
/* 00EC4 80AB6644 860A0264 */  lh      $t2, 0x0264($s0)           ## 00000264
/* 00EC8 80AB6648 24090001 */  addiu   $t1, $zero, 0x0001         ## $t1 = 00000001
/* 00ECC 80AB664C A60902A6 */  sh      $t1, 0x02A6($s0)           ## 000002A6
/* 00ED0 80AB6650 15400005 */  bne     $t2, $zero, .L80AB6668     
/* 00ED4 80AB6654 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00ED8 80AB6658 0C00BE0A */  jal     Audio_PlayActorSound2
              
/* 00EDC 80AB665C 24052813 */  addiu   $a1, $zero, 0x2813         ## $a1 = 00002813
/* 00EE0 80AB6660 240B0064 */  addiu   $t3, $zero, 0x0064         ## $t3 = 00000064
/* 00EE4 80AB6664 A60B0264 */  sh      $t3, 0x0264($s0)           ## 00000264
.L80AB6668:
/* 00EE8 80AB6668 3C0180AC */  lui     $at, %hi(D_80AB8AD4)       ## $at = 80AC0000
/* 00EEC 80AB666C 0C00CFBE */  jal     Math_Rand_ZeroFloat
              
/* 00EF0 80AB6670 C42C8AD4 */  lwc1    $f12, %lo(D_80AB8AD4)($at) 
/* 00EF4 80AB6674 4600018D */  trunc.w.s $f6, $f0                   
/* 00EF8 80AB6678 3C014080 */  lui     $at, 0x4080                ## $at = 40800000
/* 00EFC 80AB667C 44814000 */  mtc1    $at, $f8                   ## $f8 = 4.00
/* 00F00 80AB6680 44805000 */  mtc1    $zero, $f10                ## $f10 = 0.00
/* 00F04 80AB6684 440D3000 */  mfc1    $t5, $f6                   
/* 00F08 80AB6688 44809000 */  mtc1    $zero, $f18                ## $f18 = 0.00
/* 00F0C 80AB668C 3C0E80AB */  lui     $t6, %hi(func_80AB6A38)    ## $t6 = 80AB0000
/* 00F10 80AB6690 25CE6A38 */  addiu   $t6, $t6, %lo(func_80AB6A38) ## $t6 = 80AB6A38
/* 00F14 80AB6694 AE0E0250 */  sw      $t6, 0x0250($s0)           ## 00000250
/* 00F18 80AB6698 E6080068 */  swc1    $f8, 0x0068($s0)           ## 00000068
/* 00F1C 80AB669C E60A0300 */  swc1    $f10, 0x0300($s0)          ## 00000300
/* 00F20 80AB66A0 A60D02A0 */  sh      $t5, 0x02A0($s0)           ## 000002A0
/* 00F24 80AB66A4 100000DF */  beq     $zero, $zero, .L80AB6A24   
/* 00F28 80AB66A8 E61202FC */  swc1    $f18, 0x02FC($s0)          ## 000002FC
.L80AB66AC:
/* 00F2C 80AB66AC A7A0002E */  sh      $zero, 0x002E($sp)         
.L80AB66B0:
/* 00F30 80AB66B0 8602025C */  lh      $v0, 0x025C($s0)           ## 0000025C
/* 00F34 80AB66B4 3C0180AC */  lui     $at, %hi(D_80AB8AD8)       ## $at = 80AC0000
/* 00F38 80AB66B8 1040001F */  beq     $v0, $zero, .L80AB6738     
/* 00F3C 80AB66BC 00000000 */  nop
/* 00F40 80AB66C0 C42C8AD8 */  lwc1    $f12, %lo(D_80AB8AD8)($at) 
/* 00F44 80AB66C4 E7A20034 */  swc1    $f2, 0x0034($sp)           
/* 00F48 80AB66C8 0C00CFBE */  jal     Math_Rand_ZeroFloat
              
/* 00F4C 80AB66CC E7AE0030 */  swc1    $f14, 0x0030($sp)          
/* 00F50 80AB66D0 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 00F54 80AB66D4 44812000 */  mtc1    $at, $f4                   ## $f4 = 1.00
/* 00F58 80AB66D8 C7A20034 */  lwc1    $f2, 0x0034($sp)           
/* 00F5C 80AB66DC C7AE0030 */  lwc1    $f14, 0x0030($sp)          
/* 00F60 80AB66E0 4604003C */  c.lt.s  $f0, $f4                   
/* 00F64 80AB66E4 26040290 */  addiu   $a0, $s0, 0x0290           ## $a0 = 00000290
/* 00F68 80AB66E8 3C0580AC */  lui     $a1, %hi(D_80AB8604)       ## $a1 = 80AC0000
/* 00F6C 80AB66EC 3C063F00 */  lui     $a2, 0x3F00                ## $a2 = 3F000000
/* 00F70 80AB66F0 45000007 */  bc1f    .L80AB6710                 
/* 00F74 80AB66F4 3C07457A */  lui     $a3, 0x457A                ## $a3 = 457A0000
/* 00F78 80AB66F8 860F02E6 */  lh      $t7, 0x02E6($s0)           ## 000002E6
/* 00F7C 80AB66FC 25F80001 */  addiu   $t8, $t7, 0x0001           ## $t8 = 00000001
/* 00F80 80AB6700 A61802E6 */  sh      $t8, 0x02E6($s0)           ## 000002E6
/* 00F84 80AB6704 861902E6 */  lh      $t9, 0x02E6($s0)           ## 000002E6
/* 00F88 80AB6708 33280001 */  andi    $t0, $t9, 0x0001           ## $t0 = 00000000
/* 00F8C 80AB670C A60802E6 */  sh      $t0, 0x02E6($s0)           ## 000002E6
.L80AB6710:
/* 00F90 80AB6710 860902E6 */  lh      $t1, 0x02E6($s0)           ## 000002E6
/* 00F94 80AB6714 E7AE0030 */  swc1    $f14, 0x0030($sp)          
/* 00F98 80AB6718 E7A20034 */  swc1    $f2, 0x0034($sp)           
/* 00F9C 80AB671C 00095080 */  sll     $t2, $t1,  2               
/* 00FA0 80AB6720 00AA2821 */  addu    $a1, $a1, $t2              
/* 00FA4 80AB6724 0C01E107 */  jal     Math_SmoothScaleMaxF
              
/* 00FA8 80AB6728 8CA58604 */  lw      $a1, %lo(D_80AB8604)($a1)  
/* 00FAC 80AB672C C7A20034 */  lwc1    $f2, 0x0034($sp)           
/* 00FB0 80AB6730 C7AE0030 */  lwc1    $f14, 0x0030($sp)          
/* 00FB4 80AB6734 8602025C */  lh      $v0, 0x025C($s0)           ## 0000025C
.L80AB6738:
/* 00FB8 80AB6738 54400066 */  bnel    $v0, $zero, .L80AB68D4     
/* 00FBC 80AB673C 860C025A */  lh      $t4, 0x025A($s0)           ## 0000025A
/* 00FC0 80AB6740 860B025A */  lh      $t3, 0x025A($s0)           ## 0000025A
/* 00FC4 80AB6744 55600063 */  bnel    $t3, $zero, .L80AB68D4     
/* 00FC8 80AB6748 860C025A */  lh      $t4, 0x025A($s0)           ## 0000025A
/* 00FCC 80AB674C 860C029E */  lh      $t4, 0x029E($s0)           ## 0000029E
/* 00FD0 80AB6750 258D0001 */  addiu   $t5, $t4, 0x0001           ## $t5 = 00000001
/* 00FD4 80AB6754 A60D029E */  sh      $t5, 0x029E($s0)           ## 0000029E
/* 00FD8 80AB6758 860E029E */  lh      $t6, 0x029E($s0)           ## 0000029E
/* 00FDC 80AB675C 29C10008 */  slti    $at, $t6, 0x0008           
/* 00FE0 80AB6760 14200051 */  bne     $at, $zero, .L80AB68A8     
/* 00FE4 80AB6764 3C0141F0 */  lui     $at, 0x41F0                ## $at = 41F00000
/* 00FE8 80AB6768 44816000 */  mtc1    $at, $f12                  ## $f12 = 30.00
/* 00FEC 80AB676C E7A20034 */  swc1    $f2, 0x0034($sp)           
/* 00FF0 80AB6770 0C00CFBE */  jal     Math_Rand_ZeroFloat
              
/* 00FF4 80AB6774 E7AE0030 */  swc1    $f14, 0x0030($sp)          
/* 00FF8 80AB6778 4600018D */  trunc.w.s $f6, $f0                   
/* 00FFC 80AB677C 3C0180AC */  lui     $at, %hi(D_80AB8ADC)       ## $at = 80AC0000
/* 01000 80AB6780 44183000 */  mfc1    $t8, $f6                   
/* 01004 80AB6784 00000000 */  nop
/* 01008 80AB6788 A618025C */  sh      $t8, 0x025C($s0)           ## 0000025C
/* 0100C 80AB678C 0C00CFBE */  jal     Math_Rand_ZeroFloat
              
/* 01010 80AB6790 C42C8ADC */  lwc1    $f12, %lo(D_80AB8ADC)($at) 
/* 01014 80AB6794 4600020D */  trunc.w.s $f8, $f0                   
/* 01018 80AB6798 8602001C */  lh      $v0, 0x001C($s0)           ## 0000001C
/* 0101C 80AB679C C7A20034 */  lwc1    $f2, 0x0034($sp)           
/* 01020 80AB67A0 C7AE0030 */  lwc1    $f14, 0x0030($sp)          
/* 01024 80AB67A4 44084000 */  mfc1    $t0, $f8                   
/* 01028 80AB67A8 2401000A */  addiu   $at, $zero, 0x000A         ## $at = 0000000A
/* 0102C 80AB67AC 1041001A */  beq     $v0, $at, .L80AB6818       
/* 01030 80AB67B0 A608029E */  sh      $t0, 0x029E($s0)           ## 0000029E
/* 01034 80AB67B4 24010008 */  addiu   $at, $zero, 0x0008         ## $at = 00000008
/* 01038 80AB67B8 50410018 */  beql    $v0, $at, .L80AB681C       
/* 0103C 80AB67BC 3C0141F0 */  lui     $at, 0x41F0                ## $at = 41F00000
/* 01040 80AB67C0 44805000 */  mtc1    $zero, $f10                ## $f10 = 0.00
/* 01044 80AB67C4 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 01048 80AB67C8 3C0142C8 */  lui     $at, 0x42C8                ## $at = 42C80000
/* 0104C 80AB67CC 460A103C */  c.lt.s  $f2, $f10                  
/* 01050 80AB67D0 00000000 */  nop
/* 01054 80AB67D4 45020006 */  bc1fl   .L80AB67F0                 
/* 01058 80AB67D8 44819000 */  mtc1    $at, $f18                  ## $f18 = 100.00
/* 0105C 80AB67DC 3C0142C8 */  lui     $at, 0x42C8                ## $at = 42C80000
/* 01060 80AB67E0 44810000 */  mtc1    $at, $f0                   ## $f0 = 100.00
/* 01064 80AB67E4 10000004 */  beq     $zero, $zero, .L80AB67F8   
/* 01068 80AB67E8 46001081 */  sub.s   $f2, $f2, $f0              
/* 0106C 80AB67EC 44819000 */  mtc1    $at, $f18                  ## $f18 = 100.00
.L80AB67F0:
/* 01070 80AB67F0 44810000 */  mtc1    $at, $f0                   ## $f0 = 100.00
/* 01074 80AB67F4 46121080 */  add.s   $f2, $f2, $f18             
.L80AB67F8:
/* 01078 80AB67F8 4604703C */  c.lt.s  $f14, $f4                  
/* 0107C 80AB67FC 00000000 */  nop
/* 01080 80AB6800 45000003 */  bc1f    .L80AB6810                 
/* 01084 80AB6804 00000000 */  nop
/* 01088 80AB6808 10000020 */  beq     $zero, $zero, .L80AB688C   
/* 0108C 80AB680C 46007381 */  sub.s   $f14, $f14, $f0            
.L80AB6810:
/* 01090 80AB6810 1000001E */  beq     $zero, $zero, .L80AB688C   
/* 01094 80AB6814 46007380 */  add.s   $f14, $f14, $f0            
.L80AB6818:
/* 01098 80AB6818 3C0141F0 */  lui     $at, 0x41F0                ## $at = 41F00000
.L80AB681C:
/* 0109C 80AB681C 44816000 */  mtc1    $at, $f12                  ## $f12 = 30.00
/* 010A0 80AB6820 0C00CFC8 */  jal     Math_Rand_CenteredFloat
              
/* 010A4 80AB6824 00000000 */  nop
/* 010A8 80AB6828 3C0141F0 */  lui     $at, 0x41F0                ## $at = 41F00000
/* 010AC 80AB682C 44816000 */  mtc1    $at, $f12                  ## $f12 = 30.00
/* 010B0 80AB6830 0C00CFC8 */  jal     Math_Rand_CenteredFloat
              
/* 010B4 80AB6834 E7A00034 */  swc1    $f0, 0x0034($sp)           
/* 010B8 80AB6838 C7A20034 */  lwc1    $f2, 0x0034($sp)           
/* 010BC 80AB683C 44808000 */  mtc1    $zero, $f16                ## $f16 = 0.00
/* 010C0 80AB6840 3C0141A0 */  lui     $at, 0x41A0                ## $at = 41A00000
/* 010C4 80AB6844 4610103C */  c.lt.s  $f2, $f16                  
/* 010C8 80AB6848 00000000 */  nop
/* 010CC 80AB684C 45020006 */  bc1fl   .L80AB6868                 
/* 010D0 80AB6850 44816000 */  mtc1    $at, $f12                  ## $f12 = 20.00
/* 010D4 80AB6854 3C0141A0 */  lui     $at, 0x41A0                ## $at = 41A00000
/* 010D8 80AB6858 44816000 */  mtc1    $at, $f12                  ## $f12 = 20.00
/* 010DC 80AB685C 10000004 */  beq     $zero, $zero, .L80AB6870   
/* 010E0 80AB6860 460C1081 */  sub.s   $f2, $f2, $f12             
/* 010E4 80AB6864 44816000 */  mtc1    $at, $f12                  ## $f12 = 20.00
.L80AB6868:
/* 010E8 80AB6868 00000000 */  nop
/* 010EC 80AB686C 460C1080 */  add.s   $f2, $f2, $f12             
.L80AB6870:
/* 010F0 80AB6870 4610003C */  c.lt.s  $f0, $f16                  
/* 010F4 80AB6874 00000000 */  nop
/* 010F8 80AB6878 45020004 */  bc1fl   .L80AB688C                 
/* 010FC 80AB687C 460C0380 */  add.s   $f14, $f0, $f12            
/* 01100 80AB6880 10000002 */  beq     $zero, $zero, .L80AB688C   
/* 01104 80AB6884 460C0381 */  sub.s   $f14, $f0, $f12            
/* 01108 80AB6888 460C0380 */  add.s   $f14, $f0, $f12            
.L80AB688C:
/* 0110C 80AB688C C60602AC */  lwc1    $f6, 0x02AC($s0)           ## 000002AC
/* 01110 80AB6890 C60A02B4 */  lwc1    $f10, 0x02B4($s0)          ## 000002B4
/* 01114 80AB6894 46023200 */  add.s   $f8, $f6, $f2              
/* 01118 80AB6898 460E5480 */  add.s   $f18, $f10, $f14           
/* 0111C 80AB689C E60802B8 */  swc1    $f8, 0x02B8($s0)           ## 000002B8
/* 01120 80AB68A0 1000000B */  beq     $zero, $zero, .L80AB68D0   
/* 01124 80AB68A4 E61202C0 */  swc1    $f18, 0x02C0($s0)          ## 000002C0
.L80AB68A8:
/* 01128 80AB68A8 960A0088 */  lhu     $t2, 0x0088($s0)           ## 00000088
/* 0112C 80AB68AC 24090004 */  addiu   $t1, $zero, 0x0004         ## $t1 = 00000004
/* 01130 80AB68B0 A609025A */  sh      $t1, 0x025A($s0)           ## 0000025A
/* 01134 80AB68B4 314B0001 */  andi    $t3, $t2, 0x0001           ## $t3 = 00000000
/* 01138 80AB68B8 11600005 */  beq     $t3, $zero, .L80AB68D0     
/* 0113C 80AB68BC 3C014060 */  lui     $at, 0x4060                ## $at = 40600000
/* 01140 80AB68C0 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 01144 80AB68C4 44813000 */  mtc1    $at, $f6                   ## $f6 = 3.50
/* 01148 80AB68C8 E6040068 */  swc1    $f4, 0x0068($s0)           ## 00000068
/* 0114C 80AB68CC E6060060 */  swc1    $f6, 0x0060($s0)           ## 00000060
.L80AB68D0:
/* 01150 80AB68D0 860C025A */  lh      $t4, 0x025A($s0)           ## 0000025A
.L80AB68D4:
/* 01154 80AB68D4 26040290 */  addiu   $a0, $s0, 0x0290           ## $a0 = 00000290
/* 01158 80AB68D8 3C053F00 */  lui     $a1, 0x3F00                ## $a1 = 3F000000
/* 0115C 80AB68DC 5180004E */  beql    $t4, $zero, .L80AB6A18     
/* 01160 80AB68E0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01164 80AB68E4 0C01E123 */  jal     Math_SmoothDownscaleMaxF
              
/* 01168 80AB68E8 3C06457A */  lui     $a2, 0x457A                ## $a2 = 457A0000
/* 0116C 80AB68EC 240D0001 */  addiu   $t5, $zero, 0x0001         ## $t5 = 00000001
/* 01170 80AB68F0 A7AD002E */  sh      $t5, 0x002E($sp)           
/* 01174 80AB68F4 8E0702FC */  lw      $a3, 0x02FC($s0)           ## 000002FC
/* 01178 80AB68F8 8E0502B8 */  lw      $a1, 0x02B8($s0)           ## 000002B8
/* 0117C 80AB68FC 26040024 */  addiu   $a0, $s0, 0x0024           ## $a0 = 00000024
/* 01180 80AB6900 0C01E107 */  jal     Math_SmoothScaleMaxF
              
/* 01184 80AB6904 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 01188 80AB6908 2604002C */  addiu   $a0, $s0, 0x002C           ## $a0 = 0000002C
/* 0118C 80AB690C 8E0502C0 */  lw      $a1, 0x02C0($s0)           ## 000002C0
/* 01190 80AB6910 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 01194 80AB6914 0C01E107 */  jal     Math_SmoothScaleMaxF
              
/* 01198 80AB6918 8E0702FC */  lw      $a3, 0x02FC($s0)           ## 000002FC
/* 0119C 80AB691C 3C073E99 */  lui     $a3, 0x3E99                ## $a3 = 3E990000
/* 011A0 80AB6920 34E7999A */  ori     $a3, $a3, 0x999A           ## $a3 = 3E99999A
/* 011A4 80AB6924 260402FC */  addiu   $a0, $s0, 0x02FC           ## $a0 = 000002FC
/* 011A8 80AB6928 3C054040 */  lui     $a1, 0x4040                ## $a1 = 40400000
/* 011AC 80AB692C 0C01E107 */  jal     Math_SmoothScaleMaxF
              
/* 011B0 80AB6930 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 011B4 80AB6934 C60802B8 */  lwc1    $f8, 0x02B8($s0)           ## 000002B8
/* 011B8 80AB6938 C60A0024 */  lwc1    $f10, 0x0024($s0)          ## 00000024
/* 011BC 80AB693C 3C014120 */  lui     $at, 0x4120                ## $at = 41200000
/* 011C0 80AB6940 44811000 */  mtc1    $at, $f2                   ## $f2 = 10.00
/* 011C4 80AB6944 460A4301 */  sub.s   $f12, $f8, $f10            
/* 011C8 80AB6948 C61202C0 */  lwc1    $f18, 0x02C0($s0)          ## 000002C0
/* 011CC 80AB694C C604002C */  lwc1    $f4, 0x002C($s0)           ## 0000002C
/* 011D0 80AB6950 46006005 */  abs.s   $f0, $f12                  
/* 011D4 80AB6954 46049381 */  sub.s   $f14, $f18, $f4            
/* 011D8 80AB6958 4602003C */  c.lt.s  $f0, $f2                   
/* 011DC 80AB695C 46007005 */  abs.s   $f0, $f14                  
/* 011E0 80AB6960 45020004 */  bc1fl   .L80AB6974                 
/* 011E4 80AB6964 4602003C */  c.lt.s  $f0, $f2                   
/* 011E8 80AB6968 44806000 */  mtc1    $zero, $f12                ## $f12 = 0.00
/* 011EC 80AB696C 00000000 */  nop
/* 011F0 80AB6970 4602003C */  c.lt.s  $f0, $f2                   
.L80AB6974:
/* 011F4 80AB6974 44800000 */  mtc1    $zero, $f0                 ## $f0 = 0.00
/* 011F8 80AB6978 45020004 */  bc1fl   .L80AB698C                 
/* 011FC 80AB697C 46006032 */  c.eq.s  $f12, $f0                  
/* 01200 80AB6980 44807000 */  mtc1    $zero, $f14                ## $f14 = 0.00
/* 01204 80AB6984 00000000 */  nop
/* 01208 80AB6988 46006032 */  c.eq.s  $f12, $f0                  
.L80AB698C:
/* 0120C 80AB698C 00000000 */  nop
/* 01210 80AB6990 45000007 */  bc1f    .L80AB69B0                 
/* 01214 80AB6994 00000000 */  nop
/* 01218 80AB6998 46007032 */  c.eq.s  $f14, $f0                  
/* 0121C 80AB699C 240E0007 */  addiu   $t6, $zero, 0x0007         ## $t6 = 00000007
/* 01220 80AB69A0 45000003 */  bc1f    .L80AB69B0                 
/* 01224 80AB69A4 00000000 */  nop
/* 01228 80AB69A8 A600025A */  sh      $zero, 0x025A($s0)         ## 0000025A
/* 0122C 80AB69AC A60E029E */  sh      $t6, 0x029E($s0)           ## 0000029E
.L80AB69B0:
/* 01230 80AB69B0 0C03F494 */  jal     Math_atan2f              
/* 01234 80AB69B4 00000000 */  nop
/* 01238 80AB69B8 3C0180AC */  lui     $at, %hi(D_80AB8AE0)       ## $at = 80AC0000
/* 0123C 80AB69BC C4268AE0 */  lwc1    $f6, %lo(D_80AB8AE0)($at)  
/* 01240 80AB69C0 C6120300 */  lwc1    $f18, 0x0300($s0)          ## 00000300
/* 01244 80AB69C4 AFA00010 */  sw      $zero, 0x0010($sp)         
/* 01248 80AB69C8 46060202 */  mul.s   $f8, $f0, $f6              
/* 0124C 80AB69CC 4600910D */  trunc.w.s $f4, $f18                  
/* 01250 80AB69D0 26040032 */  addiu   $a0, $s0, 0x0032           ## $a0 = 00000032
/* 01254 80AB69D4 24060003 */  addiu   $a2, $zero, 0x0003         ## $a2 = 00000003
/* 01258 80AB69D8 44072000 */  mfc1    $a3, $f4                   
/* 0125C 80AB69DC 4600428D */  trunc.w.s $f10, $f8                  
/* 01260 80AB69E0 00073C00 */  sll     $a3, $a3, 16               
/* 01264 80AB69E4 00073C03 */  sra     $a3, $a3, 16               
/* 01268 80AB69E8 44055000 */  mfc1    $a1, $f10                  
/* 0126C 80AB69EC 00000000 */  nop
/* 01270 80AB69F0 00052C00 */  sll     $a1, $a1, 16               
/* 01274 80AB69F4 0C01E1A7 */  jal     Math_SmoothScaleMaxMinS
              
/* 01278 80AB69F8 00052C03 */  sra     $a1, $a1, 16               
/* 0127C 80AB69FC 3C05461C */  lui     $a1, 0x461C                ## $a1 = 461C0000
/* 01280 80AB6A00 34A54000 */  ori     $a1, $a1, 0x4000           ## $a1 = 461C4000
/* 01284 80AB6A04 26040300 */  addiu   $a0, $s0, 0x0300           ## $a0 = 00000300
/* 01288 80AB6A08 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 0128C 80AB6A0C 0C01E107 */  jal     Math_SmoothScaleMaxF
              
/* 01290 80AB6A10 3C07447A */  lui     $a3, 0x447A                ## $a3 = 447A0000
/* 01294 80AB6A14 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
.L80AB6A18:
/* 01298 80AB6A18 8FA50044 */  lw      $a1, 0x0044($sp)           
/* 0129C 80AB6A1C 0C2AD6FE */  jal     func_80AB5BF8              
/* 012A0 80AB6A20 87A6002E */  lh      $a2, 0x002E($sp)           
.L80AB6A24:
/* 012A4 80AB6A24 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 012A8 80AB6A28 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 012AC 80AB6A2C 27BD0040 */  addiu   $sp, $sp, 0x0040           ## $sp = 00000000
/* 012B0 80AB6A30 03E00008 */  jr      $ra                        
/* 012B4 80AB6A34 00000000 */  nop
