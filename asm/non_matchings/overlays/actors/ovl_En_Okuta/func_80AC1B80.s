.late_rodata
glabel D_80AC2930
    .float 0.4

glabel D_80AC2934
    .float 0.075

glabel D_80AC2938
 .word 0x3FE66666
glabel D_80AC293C
    .float 0.8

glabel D_80AC2940
    .float 1.3

glabel D_80AC2944
    .float 0.05

glabel D_80AC2948
 .word 0x3D086595
glabel D_80AC294C
 .word 0x3EAA7EFA
glabel D_80AC2950
 .word 0x3EB33333
glabel D_80AC2954
    .float 0.8

glabel D_80AC2958
    .float 0.05

glabel D_80AC295C
    .float 0.8

glabel D_80AC2960
    .float 1.3

glabel D_80AC2964
    .float 0.1

glabel D_80AC2968
 .word 0x3D886595
glabel D_80AC296C
 .word 0x3E490FDB
glabel D_80AC2970
    .float 0.2

.text
glabel func_80AC1B80
/* 01520 80AC1B80 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 01524 80AC1B84 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 01528 80AC1B88 8C820190 */  lw      $v0, 0x0190($a0)           ## 00000190
/* 0152C 80AC1B8C 3C0E80AC */  lui     $t6, %hi(func_80AC0F64)    ## $t6 = 80AC0000
/* 01530 80AC1B90 25CE0F64 */  addiu   $t6, $t6, %lo(func_80AC0F64) ## $t6 = 80AC0F64
/* 01534 80AC1B94 15C2004E */  bne     $t6, $v0, .L80AC1CD0       
/* 01538 80AC1B98 C48E0164 */  lwc1    $f14, 0x0164($a0)          ## 00000164
/* 0153C 80AC1B9C 3C014100 */  lui     $at, 0x4100                ## $at = 41000000
/* 01540 80AC1BA0 44812000 */  mtc1    $at, $f4                   ## $f4 = 8.00
/* 01544 80AC1BA4 3C014120 */  lui     $at, 0x4120                ## $at = 41200000
/* 01548 80AC1BA8 4604703C */  c.lt.s  $f14, $f4                  
/* 0154C 80AC1BAC 00000000 */  nop
/* 01550 80AC1BB0 45020009 */  bc1fl   .L80AC1BD8                 
/* 01554 80AC1BB4 44813000 */  mtc1    $at, $f6                   ## $f6 = 10.00
/* 01558 80AC1BB8 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 0155C 80AC1BBC 44818000 */  mtc1    $at, $f16                  ## $f16 = 1.00
/* 01560 80AC1BC0 00000000 */  nop
/* 01564 80AC1BC4 E490036C */  swc1    $f16, 0x036C($a0)          ## 0000036C
/* 01568 80AC1BC8 E4900368 */  swc1    $f16, 0x0368($a0)          ## 00000368
/* 0156C 80AC1BCC 100000D2 */  beq     $zero, $zero, .L80AC1F18   
/* 01570 80AC1BD0 E4900364 */  swc1    $f16, 0x0364($a0)          ## 00000364
/* 01574 80AC1BD4 44813000 */  mtc1    $at, $f6                   ## $f6 = 1.00
.L80AC1BD8:
/* 01578 80AC1BD8 3C014160 */  lui     $at, 0x4160                ## $at = 41600000
/* 0157C 80AC1BDC 4606703C */  c.lt.s  $f14, $f6                  
/* 01580 80AC1BE0 00000000 */  nop
/* 01584 80AC1BE4 4502000F */  bc1fl   .L80AC1C24                 
/* 01588 80AC1BE8 44814000 */  mtc1    $at, $f8                   ## $f8 = 14.00
/* 0158C 80AC1BEC 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 01590 80AC1BF0 44818000 */  mtc1    $at, $f16                  ## $f16 = 1.00
/* 01594 80AC1BF4 3C0140E0 */  lui     $at, 0x40E0                ## $at = 40E00000
/* 01598 80AC1BF8 44814000 */  mtc1    $at, $f8                   ## $f8 = 7.00
/* 0159C 80AC1BFC 3C0180AC */  lui     $at, %hi(D_80AC2930)       ## $at = 80AC0000
/* 015A0 80AC1C00 E490036C */  swc1    $f16, 0x036C($a0)          ## 0000036C
/* 015A4 80AC1C04 46087281 */  sub.s   $f10, $f14, $f8            
/* 015A8 80AC1C08 E4900364 */  swc1    $f16, 0x0364($a0)          ## 00000364
/* 015AC 80AC1C0C C4322930 */  lwc1    $f18, %lo(D_80AC2930)($at) 
/* 015B0 80AC1C10 46125102 */  mul.s   $f4, $f10, $f18            
/* 015B4 80AC1C14 46102180 */  add.s   $f6, $f4, $f16             
/* 015B8 80AC1C18 100000BF */  beq     $zero, $zero, .L80AC1F18   
/* 015BC 80AC1C1C E4860368 */  swc1    $f6, 0x0368($a0)           ## 00000368
/* 015C0 80AC1C20 44814000 */  mtc1    $at, $f8                   ## $f8 = -0.00
.L80AC1C24:
/* 015C4 80AC1C24 3C0180AC */  lui     $at, %hi(D_80AC293C)       ## $at = 80AC0000
/* 015C8 80AC1C28 4608703C */  c.lt.s  $f14, $f8                  
/* 015CC 80AC1C2C 00000000 */  nop
/* 015D0 80AC1C30 45000015 */  bc1f    .L80AC1C88                 
/* 015D4 80AC1C34 00000000 */  nop
/* 015D8 80AC1C38 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 015DC 80AC1C3C 44818000 */  mtc1    $at, $f16                  ## $f16 = 1.00
/* 015E0 80AC1C40 3C014110 */  lui     $at, 0x4110                ## $at = 41100000
/* 015E4 80AC1C44 44815000 */  mtc1    $at, $f10                  ## $f10 = 9.00
/* 015E8 80AC1C48 3C0180AC */  lui     $at, %hi(D_80AC2934)       ## $at = 80AC0000
/* 015EC 80AC1C4C C4322934 */  lwc1    $f18, %lo(D_80AC2934)($at) 
/* 015F0 80AC1C50 460A7001 */  sub.s   $f0, $f14, $f10            
/* 015F4 80AC1C54 3C0180AC */  lui     $at, %hi(D_80AC2938)       ## $at = 80AC0000
/* 015F8 80AC1C58 46120102 */  mul.s   $f4, $f0, $f18             
/* 015FC 80AC1C5C 46102080 */  add.s   $f2, $f4, $f16             
/* 01600 80AC1C60 E482036C */  swc1    $f2, 0x036C($a0)           ## 0000036C
/* 01604 80AC1C64 E4820364 */  swc1    $f2, 0x0364($a0)           ## 00000364
/* 01608 80AC1C68 C4262938 */  lwc1    $f6, %lo(D_80AC2938)($at)  
/* 0160C 80AC1C6C 3C013E80 */  lui     $at, 0x3E80                ## $at = 3E800000
/* 01610 80AC1C70 44814000 */  mtc1    $at, $f8                   ## $f8 = 0.25
/* 01614 80AC1C74 00000000 */  nop
/* 01618 80AC1C78 46080282 */  mul.s   $f10, $f0, $f8             
/* 0161C 80AC1C7C 460A3481 */  sub.s   $f18, $f6, $f10            
/* 01620 80AC1C80 100000A5 */  beq     $zero, $zero, .L80AC1F18   
/* 01624 80AC1C84 E4920368 */  swc1    $f18, 0x0368($a0)          ## 00000368
.L80AC1C88:
/* 01628 80AC1C88 C42C293C */  lwc1    $f12, %lo(D_80AC293C)($at) 
/* 0162C 80AC1C8C 3C014150 */  lui     $at, 0x4150                ## $at = 41500000
/* 01630 80AC1C90 44812000 */  mtc1    $at, $f4                   ## $f4 = 13.00
/* 01634 80AC1C94 3C0180AC */  lui     $at, %hi(D_80AC2940)       ## $at = 80AC0000
/* 01638 80AC1C98 C4282940 */  lwc1    $f8, %lo(D_80AC2940)($at)  
/* 0163C 80AC1C9C 46047001 */  sub.s   $f0, $f14, $f4             
/* 01640 80AC1CA0 3C0180AC */  lui     $at, %hi(D_80AC2944)       ## $at = 80AC0000
/* 01644 80AC1CA4 C4262944 */  lwc1    $f6, %lo(D_80AC2944)($at)  
/* 01648 80AC1CA8 3C0180AC */  lui     $at, %hi(D_80AC2948)       ## $at = 80AC0000
/* 0164C 80AC1CAC 46060282 */  mul.s   $f10, $f0, $f6             
/* 01650 80AC1CB0 460A4081 */  sub.s   $f2, $f8, $f10             
/* 01654 80AC1CB4 E482036C */  swc1    $f2, 0x036C($a0)           ## 0000036C
/* 01658 80AC1CB8 E4820364 */  swc1    $f2, 0x0364($a0)           ## 00000364
/* 0165C 80AC1CBC C4322948 */  lwc1    $f18, %lo(D_80AC2948)($at) 
/* 01660 80AC1CC0 46120102 */  mul.s   $f4, $f0, $f18             
/* 01664 80AC1CC4 460C2180 */  add.s   $f6, $f4, $f12             
/* 01668 80AC1CC8 10000093 */  beq     $zero, $zero, .L80AC1F18   
/* 0166C 80AC1CCC E4860368 */  swc1    $f6, 0x0368($a0)           ## 00000368
.L80AC1CD0:
/* 01670 80AC1CD0 3C0F80AC */  lui     $t7, %hi(func_80AC10A8)    ## $t7 = 80AC0000
/* 01674 80AC1CD4 25EF10A8 */  addiu   $t7, $t7, %lo(func_80AC10A8) ## $t7 = 80AC10A8
/* 01678 80AC1CD8 15E20027 */  bne     $t7, $v0, .L80AC1D78       
/* 0167C 80AC1CDC 3C1880AC */  lui     $t8, %hi(func_80AC12D8)    ## $t8 = 80AC0000
/* 01680 80AC1CE0 3C014040 */  lui     $at, 0x4040                ## $at = 40400000
/* 01684 80AC1CE4 44810000 */  mtc1    $at, $f0                   ## $f0 = 3.00
/* 01688 80AC1CE8 3C014080 */  lui     $at, 0x4080                ## $at = 40800000
/* 0168C 80AC1CEC 4600703C */  c.lt.s  $f14, $f0                  
/* 01690 80AC1CF0 00000000 */  nop
/* 01694 80AC1CF4 45020006 */  bc1fl   .L80AC1D10                 
/* 01698 80AC1CF8 44814000 */  mtc1    $at, $f8                   ## $f8 = 4.00
/* 0169C 80AC1CFC 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 016A0 80AC1D00 44818000 */  mtc1    $at, $f16                  ## $f16 = 1.00
/* 016A4 80AC1D04 10000019 */  beq     $zero, $zero, .L80AC1D6C   
/* 016A8 80AC1D08 E4900368 */  swc1    $f16, 0x0368($a0)          ## 00000368
/* 016AC 80AC1D0C 44814000 */  mtc1    $at, $f8                   ## $f8 = 1.00
.L80AC1D10:
/* 016B0 80AC1D10 3C0180AC */  lui     $at, %hi(D_80AC294C)       ## $at = 80AC0000
/* 016B4 80AC1D14 4608703C */  c.lt.s  $f14, $f8                  
/* 016B8 80AC1D18 00000000 */  nop
/* 016BC 80AC1D1C 4502000B */  bc1fl   .L80AC1D4C                 
/* 016C0 80AC1D20 46007181 */  sub.s   $f6, $f14, $f0             
/* 016C4 80AC1D24 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 016C8 80AC1D28 44818000 */  mtc1    $at, $f16                  ## $f16 = 1.00
/* 016CC 80AC1D2C 3C014000 */  lui     $at, 0x4000                ## $at = 40000000
/* 016D0 80AC1D30 44815000 */  mtc1    $at, $f10                  ## $f10 = 2.00
/* 016D4 80AC1D34 00000000 */  nop
/* 016D8 80AC1D38 460A7481 */  sub.s   $f18, $f14, $f10           
/* 016DC 80AC1D3C 46109100 */  add.s   $f4, $f18, $f16            
/* 016E0 80AC1D40 1000000A */  beq     $zero, $zero, .L80AC1D6C   
/* 016E4 80AC1D44 E4840368 */  swc1    $f4, 0x0368($a0)           ## 00000368
/* 016E8 80AC1D48 46007181 */  sub.s   $f6, $f14, $f0             
.L80AC1D4C:
/* 016EC 80AC1D4C C428294C */  lwc1    $f8, %lo(D_80AC294C)($at)  
/* 016F0 80AC1D50 3C014000 */  lui     $at, 0x4000                ## $at = 40000000
/* 016F4 80AC1D54 44819000 */  mtc1    $at, $f18                  ## $f18 = 2.00
/* 016F8 80AC1D58 46083282 */  mul.s   $f10, $f6, $f8             
/* 016FC 80AC1D5C 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 01700 80AC1D60 44818000 */  mtc1    $at, $f16                  ## $f16 = 1.00
/* 01704 80AC1D64 460A9101 */  sub.s   $f4, $f18, $f10            
/* 01708 80AC1D68 E4840368 */  swc1    $f4, 0x0368($a0)           ## 00000368
.L80AC1D6C:
/* 0170C 80AC1D6C E490036C */  swc1    $f16, 0x036C($a0)          ## 0000036C
/* 01710 80AC1D70 10000069 */  beq     $zero, $zero, .L80AC1F18   
/* 01714 80AC1D74 E4900364 */  swc1    $f16, 0x0364($a0)          ## 00000364
.L80AC1D78:
/* 01718 80AC1D78 271812D8 */  addiu   $t8, $t8, %lo(func_80AC12D8) ## $t8 = 80AC12D8
/* 0171C 80AC1D7C 1702004B */  bne     $t8, $v0, .L80AC1EAC       
/* 01720 80AC1D80 3C1980AC */  lui     $t9, %hi(func_80AC11A8)    ## $t9 = 80AC0000
/* 01724 80AC1D84 3C0140A0 */  lui     $at, 0x40A0                ## $at = 40A00000
/* 01728 80AC1D88 44813000 */  mtc1    $at, $f6                   ## $f6 = 5.00
/* 0172C 80AC1D8C 3C0140E0 */  lui     $at, 0x40E0                ## $at = 40E00000
/* 01730 80AC1D90 4606703C */  c.lt.s  $f14, $f6                  
/* 01734 80AC1D94 00000000 */  nop
/* 01738 80AC1D98 4502000D */  bc1fl   .L80AC1DD0                 
/* 0173C 80AC1D9C 44815000 */  mtc1    $at, $f10                  ## $f10 = 7.00
/* 01740 80AC1DA0 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 01744 80AC1DA4 44818000 */  mtc1    $at, $f16                  ## $f16 = 1.00
/* 01748 80AC1DA8 3C013E00 */  lui     $at, 0x3E00                ## $at = 3E000000
/* 0174C 80AC1DAC 44814000 */  mtc1    $at, $f8                   ## $f8 = 0.12
/* 01750 80AC1DB0 00000000 */  nop
/* 01754 80AC1DB4 46087482 */  mul.s   $f18, $f14, $f8            
/* 01758 80AC1DB8 46109000 */  add.s   $f0, $f18, $f16            
/* 0175C 80AC1DBC E480036C */  swc1    $f0, 0x036C($a0)           ## 0000036C
/* 01760 80AC1DC0 E4800368 */  swc1    $f0, 0x0368($a0)           ## 00000368
/* 01764 80AC1DC4 10000054 */  beq     $zero, $zero, .L80AC1F18   
/* 01768 80AC1DC8 E4800364 */  swc1    $f0, 0x0364($a0)           ## 00000364
/* 0176C 80AC1DCC 44815000 */  mtc1    $at, $f10                  ## $f10 = 0.12
.L80AC1DD0:
/* 01770 80AC1DD0 3C014188 */  lui     $at, 0x4188                ## $at = 41880000
/* 01774 80AC1DD4 460A703C */  c.lt.s  $f14, $f10                 
/* 01778 80AC1DD8 00000000 */  nop
/* 0177C 80AC1DDC 4502000F */  bc1fl   .L80AC1E1C                 
/* 01780 80AC1DE0 44812000 */  mtc1    $at, $f4                   ## $f4 = 17.00
/* 01784 80AC1DE4 3C014080 */  lui     $at, 0x4080                ## $at = 40800000
/* 01788 80AC1DE8 44812000 */  mtc1    $at, $f4                   ## $f4 = 4.00
/* 0178C 80AC1DEC 3C0180AC */  lui     $at, %hi(D_80AC2950)       ## $at = 80AC0000
/* 01790 80AC1DF0 C4282950 */  lwc1    $f8, %lo(D_80AC2950)($at)  
/* 01794 80AC1DF4 46047181 */  sub.s   $f6, $f14, $f4             
/* 01798 80AC1DF8 3C013FC0 */  lui     $at, 0x3FC0                ## $at = 3FC00000
/* 0179C 80AC1DFC 44815000 */  mtc1    $at, $f10                  ## $f10 = 1.50
/* 017A0 80AC1E00 46083482 */  mul.s   $f18, $f6, $f8             
/* 017A4 80AC1E04 46125001 */  sub.s   $f0, $f10, $f18            
/* 017A8 80AC1E08 E480036C */  swc1    $f0, 0x036C($a0)           ## 0000036C
/* 017AC 80AC1E0C E4800368 */  swc1    $f0, 0x0368($a0)           ## 00000368
/* 017B0 80AC1E10 10000041 */  beq     $zero, $zero, .L80AC1F18   
/* 017B4 80AC1E14 E4800364 */  swc1    $f0, 0x0364($a0)           ## 00000364
/* 017B8 80AC1E18 44812000 */  mtc1    $at, $f4                   ## $f4 = 1.50
.L80AC1E1C:
/* 017BC 80AC1E1C 3C0180AC */  lui     $at, %hi(D_80AC295C)       ## $at = 80AC0000
/* 017C0 80AC1E20 4604703C */  c.lt.s  $f14, $f4                  
/* 017C4 80AC1E24 00000000 */  nop
/* 017C8 80AC1E28 4500000E */  bc1f    .L80AC1E64                 
/* 017CC 80AC1E2C 00000000 */  nop
/* 017D0 80AC1E30 3C0180AC */  lui     $at, %hi(D_80AC2954)       ## $at = 80AC0000
/* 017D4 80AC1E34 C42C2954 */  lwc1    $f12, %lo(D_80AC2954)($at) 
/* 017D8 80AC1E38 3C0140C0 */  lui     $at, 0x40C0                ## $at = 40C00000
/* 017DC 80AC1E3C 44813000 */  mtc1    $at, $f6                   ## $f6 = 6.00
/* 017E0 80AC1E40 3C0180AC */  lui     $at, %hi(D_80AC2958)       ## $at = 80AC0000
/* 017E4 80AC1E44 C42A2958 */  lwc1    $f10, %lo(D_80AC2958)($at) 
/* 017E8 80AC1E48 46067201 */  sub.s   $f8, $f14, $f6             
/* 017EC 80AC1E4C E48C0368 */  swc1    $f12, 0x0368($a0)          ## 00000368
/* 017F0 80AC1E50 460A4482 */  mul.s   $f18, $f8, $f10            
/* 017F4 80AC1E54 460C9000 */  add.s   $f0, $f18, $f12            
/* 017F8 80AC1E58 E480036C */  swc1    $f0, 0x036C($a0)           ## 0000036C
/* 017FC 80AC1E5C 1000002E */  beq     $zero, $zero, .L80AC1F18   
/* 01800 80AC1E60 E4800364 */  swc1    $f0, 0x0364($a0)           ## 00000364
.L80AC1E64:
/* 01804 80AC1E64 C42C295C */  lwc1    $f12, %lo(D_80AC295C)($at) 
/* 01808 80AC1E68 3C014180 */  lui     $at, 0x4180                ## $at = 41800000
/* 0180C 80AC1E6C 44812000 */  mtc1    $at, $f4                   ## $f4 = 16.00
/* 01810 80AC1E70 3C0180AC */  lui     $at, %hi(D_80AC2960)       ## $at = 80AC0000
/* 01814 80AC1E74 C4262960 */  lwc1    $f6, %lo(D_80AC2960)($at)  
/* 01818 80AC1E78 46047001 */  sub.s   $f0, $f14, $f4             
/* 0181C 80AC1E7C 3C0180AC */  lui     $at, %hi(D_80AC2964)       ## $at = 80AC0000
/* 01820 80AC1E80 C4282964 */  lwc1    $f8, %lo(D_80AC2964)($at)  
/* 01824 80AC1E84 3C0180AC */  lui     $at, %hi(D_80AC2968)       ## $at = 80AC0000
/* 01828 80AC1E88 46080282 */  mul.s   $f10, $f0, $f8             
/* 0182C 80AC1E8C 460A3081 */  sub.s   $f2, $f6, $f10             
/* 01830 80AC1E90 E482036C */  swc1    $f2, 0x036C($a0)           ## 0000036C
/* 01834 80AC1E94 E4820364 */  swc1    $f2, 0x0364($a0)           ## 00000364
/* 01838 80AC1E98 C4322968 */  lwc1    $f18, %lo(D_80AC2968)($at) 
/* 0183C 80AC1E9C 46120102 */  mul.s   $f4, $f0, $f18             
/* 01840 80AC1EA0 460C2200 */  add.s   $f8, $f4, $f12             
/* 01844 80AC1EA4 1000001C */  beq     $zero, $zero, .L80AC1F18   
/* 01848 80AC1EA8 E4880368 */  swc1    $f8, 0x0368($a0)           ## 00000368
.L80AC1EAC:
/* 0184C 80AC1EAC 273911A8 */  addiu   $t9, $t9, %lo(func_80AC11A8) ## $t9 = 80AC11A8
/* 01850 80AC1EB0 17220014 */  bne     $t9, $v0, .L80AC1F04       
/* 01854 80AC1EB4 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 01858 80AC1EB8 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 0185C 80AC1EBC 44818000 */  mtc1    $at, $f16                  ## $f16 = 1.00
/* 01860 80AC1EC0 3C0180AC */  lui     $at, %hi(D_80AC296C)       ## $at = 80AC0000
/* 01864 80AC1EC4 E490036C */  swc1    $f16, 0x036C($a0)          ## 0000036C
/* 01868 80AC1EC8 E4900364 */  swc1    $f16, 0x0364($a0)          ## 00000364
/* 0186C 80AC1ECC C426296C */  lwc1    $f6, %lo(D_80AC296C)($at)  
/* 01870 80AC1ED0 AFA40018 */  sw      $a0, 0x0018($sp)           
/* 01874 80AC1ED4 460E3302 */  mul.s   $f12, $f6, $f14            
/* 01878 80AC1ED8 0C0400A4 */  jal     sinf
              
/* 0187C 80AC1EDC 00000000 */  nop
/* 01880 80AC1EE0 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 01884 80AC1EE4 44818000 */  mtc1    $at, $f16                  ## $f16 = 1.00
/* 01888 80AC1EE8 3C0180AC */  lui     $at, %hi(D_80AC2970)       ## $at = 80AC0000
/* 0188C 80AC1EEC C42A2970 */  lwc1    $f10, %lo(D_80AC2970)($at) 
/* 01890 80AC1EF0 8FA40018 */  lw      $a0, 0x0018($sp)           
/* 01894 80AC1EF4 460A0482 */  mul.s   $f18, $f0, $f10            
/* 01898 80AC1EF8 46109100 */  add.s   $f4, $f18, $f16            
/* 0189C 80AC1EFC 10000006 */  beq     $zero, $zero, .L80AC1F18   
/* 018A0 80AC1F00 E4840368 */  swc1    $f4, 0x0368($a0)           ## 00000368
.L80AC1F04:
/* 018A4 80AC1F04 44818000 */  mtc1    $at, $f16                  ## $f16 = -0.00
/* 018A8 80AC1F08 00000000 */  nop
/* 018AC 80AC1F0C E490036C */  swc1    $f16, 0x036C($a0)          ## 0000036C
/* 018B0 80AC1F10 E4900368 */  swc1    $f16, 0x0368($a0)          ## 00000368
/* 018B4 80AC1F14 E4900364 */  swc1    $f16, 0x0364($a0)          ## 00000364
.L80AC1F18:
/* 018B8 80AC1F18 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 018BC 80AC1F1C 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 018C0 80AC1F20 03E00008 */  jr      $ra                        
/* 018C4 80AC1F24 00000000 */  nop
