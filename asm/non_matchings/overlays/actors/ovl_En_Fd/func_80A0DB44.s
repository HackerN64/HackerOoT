.rdata
glabel D_80A0E170
    .asciz "../z_en_fd.c"
    .balign 4

glabel D_80A0E180
    .asciz "../z_en_fd.c"
    .balign 4

glabel D_80A0E190
    .asciz "../z_en_fd.c"
    .balign 4

.text
glabel func_80A0DB44
/* 02484 80A0DB44 27BDFF70 */  addiu   $sp, $sp, 0xFF70           ## $sp = FFFFFF70
/* 02488 80A0DB48 AFB5003C */  sw      $s5, 0x003C($sp)           
/* 0248C 80A0DB4C 00A0A825 */  or      $s5, $a1, $zero            ## $s5 = 00000000
/* 02490 80A0DB50 AFBF004C */  sw      $ra, 0x004C($sp)           
/* 02494 80A0DB54 AFBE0048 */  sw      $s8, 0x0048($sp)           
/* 02498 80A0DB58 AFB70044 */  sw      $s7, 0x0044($sp)           
/* 0249C 80A0DB5C AFB60040 */  sw      $s6, 0x0040($sp)           
/* 024A0 80A0DB60 AFB40038 */  sw      $s4, 0x0038($sp)           
/* 024A4 80A0DB64 AFB30034 */  sw      $s3, 0x0034($sp)           
/* 024A8 80A0DB68 AFB20030 */  sw      $s2, 0x0030($sp)           
/* 024AC 80A0DB6C AFB1002C */  sw      $s1, 0x002C($sp)           
/* 024B0 80A0DB70 AFB00028 */  sw      $s0, 0x0028($sp)           
/* 024B4 80A0DB74 F7B60020 */  sdc1    $f22, 0x0020($sp)          
/* 024B8 80A0DB78 F7B40018 */  sdc1    $f20, 0x0018($sp)          
/* 024BC 80A0DB7C AFA40090 */  sw      $a0, 0x0090($sp)           
/* 024C0 80A0DB80 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 024C4 80A0DB84 24900620 */  addiu   $s0, $a0, 0x0620           ## $s0 = 00000620
/* 024C8 80A0DB88 3C0680A1 */  lui     $a2, %hi(D_80A0E170)       ## $a2 = 80A10000
/* 024CC 80A0DB8C 24C6E170 */  addiu   $a2, $a2, %lo(D_80A0E170)  ## $a2 = 80A0E170
/* 024D0 80A0DB90 27A40074 */  addiu   $a0, $sp, 0x0074           ## $a0 = FFFFFFE4
/* 024D4 80A0DB94 240707F2 */  addiu   $a3, $zero, 0x07F2         ## $a3 = 000007F2
/* 024D8 80A0DB98 0C031AB1 */  jal     Graph_OpenDisps              
/* 024DC 80A0DB9C 00A09025 */  or      $s2, $a1, $zero            ## $s2 = 00000000
/* 024E0 80A0DBA0 0000F025 */  or      $s8, $zero, $zero          ## $s8 = 00000000
/* 024E4 80A0DBA4 0C024F61 */  jal     func_80093D84              
/* 024E8 80A0DBA8 8EA40000 */  lw      $a0, 0x0000($s5)           ## 00000000
/* 024EC 80A0DBAC 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 024F0 80A0DBB0 4481B000 */  mtc1    $at, $f22                  ## $f22 = 1.00
/* 024F4 80A0DBB4 3C01437F */  lui     $at, 0x437F                ## $at = 437F0000
/* 024F8 80A0DBB8 4481A000 */  mtc1    $at, $f20                  ## $f20 = 255.00
/* 024FC 80A0DBBC 0000A025 */  or      $s4, $zero, $zero          ## $s4 = 00000000
/* 02500 80A0DBC0 3C17DE00 */  lui     $s7, 0xDE00                ## $s7 = DE000000
.L80A0DBC4:
/* 02504 80A0DBC4 920E0000 */  lbu     $t6, 0x0000($s0)           ## 00000620
/* 02508 80A0DBC8 24010002 */  addiu   $at, $zero, 0x0002         ## $at = 00000002
/* 0250C 80A0DBCC 3C160600 */  lui     $s6, 0x0600                ## $s6 = 06000000
/* 02510 80A0DBD0 15C10070 */  bne     $t6, $at, .L80A0DD94       
/* 02514 80A0DBD4 26D67A78 */  addiu   $s6, $s6, 0x7A78           ## $s6 = 06007A78
/* 02518 80A0DBD8 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 0251C 80A0DBDC 34211DA0 */  ori     $at, $at, 0x1DA0           ## $at = 00011DA0
/* 02520 80A0DBE0 17C0000B */  bne     $s8, $zero, .L80A0DC10     
/* 02524 80A0DBE4 02A19821 */  addu    $s3, $s5, $at              
/* 02528 80A0DBE8 3C110600 */  lui     $s1, 0x0600                ## $s1 = 06000000
/* 0252C 80A0DBEC 263179F8 */  addiu   $s1, $s1, 0x79F8           ## $s1 = 060079F8
/* 02530 80A0DBF0 8EA40000 */  lw      $a0, 0x0000($s5)           ## 00000000
/* 02534 80A0DBF4 0C024F61 */  jal     func_80093D84              
/* 02538 80A0DBF8 241E0001 */  addiu   $s8, $zero, 0x0001         ## $s8 = 00000001
/* 0253C 80A0DBFC 8E4202D0 */  lw      $v0, 0x02D0($s2)           ## 000002D0
/* 02540 80A0DC00 244F0008 */  addiu   $t7, $v0, 0x0008           ## $t7 = 00000008
/* 02544 80A0DC04 AE4F02D0 */  sw      $t7, 0x02D0($s2)           ## 000002D0
/* 02548 80A0DC08 AC510004 */  sw      $s1, 0x0004($v0)           ## 00000004
/* 0254C 80A0DC0C AC570000 */  sw      $s7, 0x0000($v0)           ## 00000000
.L80A0DC10:
/* 02550 80A0DC10 8E4302D0 */  lw      $v1, 0x02D0($s2)           ## 000002D0
/* 02554 80A0DC14 3C19FA00 */  lui     $t9, 0xFA00                ## $t9 = FA000000
/* 02558 80A0DC18 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 0255C 80A0DC1C 24780008 */  addiu   $t8, $v1, 0x0008           ## $t8 = 00000008
/* 02560 80A0DC20 AE5802D0 */  sw      $t8, 0x02D0($s2)           ## 000002D0
/* 02564 80A0DC24 AC790000 */  sw      $t9, 0x0000($v1)           ## 00000000
/* 02568 80A0DC28 9209000C */  lbu     $t1, 0x000C($s0)           ## 0000062C
/* 0256C 80A0DC2C 920C000D */  lbu     $t4, 0x000D($s0)           ## 0000062D
/* 02570 80A0DC30 9218000E */  lbu     $t8, 0x000E($s0)           ## 0000062E
/* 02574 80A0DC34 00095600 */  sll     $t2, $t1, 24               
/* 02578 80A0DC38 9209000F */  lbu     $t1, 0x000F($s0)           ## 0000062F
/* 0257C 80A0DC3C 000C6C00 */  sll     $t5, $t4, 16               
/* 02580 80A0DC40 014D7025 */  or      $t6, $t2, $t5              ## $t6 = 00000000
/* 02584 80A0DC44 44892000 */  mtc1    $t1, $f4                   ## $f4 = 0.00
/* 02588 80A0DC48 0018CA00 */  sll     $t9, $t8,  8               
/* 0258C 80A0DC4C 01D94025 */  or      $t0, $t6, $t9              ## $t0 = FA000000
/* 02590 80A0DC50 8FAB0090 */  lw      $t3, 0x0090($sp)           
/* 02594 80A0DC54 05210005 */  bgez    $t1, .L80A0DC6C            
/* 02598 80A0DC58 468021A0 */  cvt.s.w $f6, $f4                   
/* 0259C 80A0DC5C 3C014F80 */  lui     $at, 0x4F80                ## $at = 4F800000
/* 025A0 80A0DC60 44814000 */  mtc1    $at, $f8                   ## $f8 = 4294967296.00
/* 025A4 80A0DC64 00000000 */  nop
/* 025A8 80A0DC68 46083180 */  add.s   $f6, $f6, $f8              
.L80A0DC6C:
/* 025AC 80A0DC6C C56A04CC */  lwc1    $f10, 0x04CC($t3)          ## 000004CC
/* 025B0 80A0DC70 240A0001 */  addiu   $t2, $zero, 0x0001         ## $t2 = 00000001
/* 025B4 80A0DC74 3C014F00 */  lui     $at, 0x4F00                ## $at = 4F000000
/* 025B8 80A0DC78 46145403 */  div.s   $f16, $f10, $f20           
/* 025BC 80A0DC7C 46103482 */  mul.s   $f18, $f6, $f16            
/* 025C0 80A0DC80 444CF800 */  cfc1    $t4, $31
/* 025C4 80A0DC84 44CAF800 */  ctc1    $t2, $31
/* 025C8 80A0DC88 00000000 */  nop
/* 025CC 80A0DC8C 46009124 */  cvt.w.s $f4, $f18                  
/* 025D0 80A0DC90 444AF800 */  cfc1    $t2, $31
/* 025D4 80A0DC94 00000000 */  nop
/* 025D8 80A0DC98 314A0078 */  andi    $t2, $t2, 0x0078           ## $t2 = 00000000
/* 025DC 80A0DC9C 51400013 */  beql    $t2, $zero, .L80A0DCEC     
/* 025E0 80A0DCA0 440A2000 */  mfc1    $t2, $f4                   
/* 025E4 80A0DCA4 44812000 */  mtc1    $at, $f4                   ## $f4 = 2147483648.00
/* 025E8 80A0DCA8 240A0001 */  addiu   $t2, $zero, 0x0001         ## $t2 = 00000001
/* 025EC 80A0DCAC 46049101 */  sub.s   $f4, $f18, $f4             
/* 025F0 80A0DCB0 44CAF800 */  ctc1    $t2, $31
/* 025F4 80A0DCB4 00000000 */  nop
/* 025F8 80A0DCB8 46002124 */  cvt.w.s $f4, $f4                   
/* 025FC 80A0DCBC 444AF800 */  cfc1    $t2, $31
/* 02600 80A0DCC0 00000000 */  nop
/* 02604 80A0DCC4 314A0078 */  andi    $t2, $t2, 0x0078           ## $t2 = 00000000
/* 02608 80A0DCC8 15400005 */  bne     $t2, $zero, .L80A0DCE0     
/* 0260C 80A0DCCC 00000000 */  nop
/* 02610 80A0DCD0 440A2000 */  mfc1    $t2, $f4                   
/* 02614 80A0DCD4 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 02618 80A0DCD8 10000007 */  beq     $zero, $zero, .L80A0DCF8   
/* 0261C 80A0DCDC 01415025 */  or      $t2, $t2, $at              ## $t2 = 80000000
.L80A0DCE0:
/* 02620 80A0DCE0 10000005 */  beq     $zero, $zero, .L80A0DCF8   
/* 02624 80A0DCE4 240AFFFF */  addiu   $t2, $zero, 0xFFFF         ## $t2 = FFFFFFFF
/* 02628 80A0DCE8 440A2000 */  mfc1    $t2, $f4                   
.L80A0DCEC:
/* 0262C 80A0DCEC 00000000 */  nop
/* 02630 80A0DCF0 0540FFFB */  bltz    $t2, .L80A0DCE0            
/* 02634 80A0DCF4 00000000 */  nop
.L80A0DCF8:
/* 02638 80A0DCF8 314F00FF */  andi    $t7, $t2, 0x00FF           ## $t7 = 000000FF
/* 0263C 80A0DCFC 010FC025 */  or      $t8, $t0, $t7              ## $t8 = FA0000FF
/* 02640 80A0DD00 AC780004 */  sw      $t8, 0x0004($v1)           ## 00000004
/* 02644 80A0DD04 8E4202D0 */  lw      $v0, 0x02D0($s2)           ## 000002D0
/* 02648 80A0DD08 3C19E700 */  lui     $t9, 0xE700                ## $t9 = E7000000
/* 0264C 80A0DD0C 44CCF800 */  ctc1    $t4, $31
/* 02650 80A0DD10 244E0008 */  addiu   $t6, $v0, 0x0008           ## $t6 = 00000008
/* 02654 80A0DD14 AE4E02D0 */  sw      $t6, 0x02D0($s2)           ## 000002D0
/* 02658 80A0DD18 AC400004 */  sw      $zero, 0x0004($v0)         ## 00000004
/* 0265C 80A0DD1C AC590000 */  sw      $t9, 0x0000($v0)           ## 00000000
/* 02660 80A0DD20 8E06001C */  lw      $a2, 0x001C($s0)           ## 0000063C
/* 02664 80A0DD24 C60E0018 */  lwc1    $f14, 0x0018($s0)          ## 00000638
/* 02668 80A0DD28 0C034261 */  jal     Matrix_Translate              
/* 0266C 80A0DD2C C60C0014 */  lwc1    $f12, 0x0014($s0)          ## 00000634
/* 02670 80A0DD30 0C0347F5 */  jal     func_800D1FD4              
/* 02674 80A0DD34 02602025 */  or      $a0, $s3, $zero            ## $a0 = 00000000
/* 02678 80A0DD38 C60C0004 */  lwc1    $f12, 0x0004($s0)          ## 00000624
/* 0267C 80A0DD3C 4406B000 */  mfc1    $a2, $f22                  
/* 02680 80A0DD40 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 02684 80A0DD44 0C0342A3 */  jal     Matrix_Scale              
/* 02688 80A0DD48 46006386 */  mov.s   $f14, $f12                 
/* 0268C 80A0DD4C 8E4202D0 */  lw      $v0, 0x02D0($s2)           ## 000002D0
/* 02690 80A0DD50 3C0BDA38 */  lui     $t3, 0xDA38                ## $t3 = DA380000
/* 02694 80A0DD54 356B0003 */  ori     $t3, $t3, 0x0003           ## $t3 = DA380003
/* 02698 80A0DD58 24490008 */  addiu   $t1, $v0, 0x0008           ## $t1 = 00000008
/* 0269C 80A0DD5C AE4902D0 */  sw      $t1, 0x02D0($s2)           ## 000002D0
/* 026A0 80A0DD60 3C0580A1 */  lui     $a1, %hi(D_80A0E180)       ## $a1 = 80A10000
/* 026A4 80A0DD64 AC4B0000 */  sw      $t3, 0x0000($v0)           ## 00000000
/* 026A8 80A0DD68 8EA40000 */  lw      $a0, 0x0000($s5)           ## 00000000
/* 026AC 80A0DD6C 24A5E180 */  addiu   $a1, $a1, %lo(D_80A0E180)  ## $a1 = 80A0E180
/* 026B0 80A0DD70 24060810 */  addiu   $a2, $zero, 0x0810         ## $a2 = 00000810
/* 026B4 80A0DD74 0C0346A2 */  jal     Matrix_NewMtx              
/* 026B8 80A0DD78 00408825 */  or      $s1, $v0, $zero            ## $s1 = 00000000
/* 026BC 80A0DD7C AE220004 */  sw      $v0, 0x0004($s1)           ## 00000004
/* 026C0 80A0DD80 8E4202D0 */  lw      $v0, 0x02D0($s2)           ## 000002D0
/* 026C4 80A0DD84 244C0008 */  addiu   $t4, $v0, 0x0008           ## $t4 = 00000008
/* 026C8 80A0DD88 AE4C02D0 */  sw      $t4, 0x02D0($s2)           ## 000002D0
/* 026CC 80A0DD8C AC560004 */  sw      $s6, 0x0004($v0)           ## 00000004
/* 026D0 80A0DD90 AC570000 */  sw      $s7, 0x0000($v0)           ## 00000000
.L80A0DD94:
/* 026D4 80A0DD94 26940001 */  addiu   $s4, $s4, 0x0001           ## $s4 = 00000001
/* 026D8 80A0DD98 0014A400 */  sll     $s4, $s4, 16               
/* 026DC 80A0DD9C 0014A403 */  sra     $s4, $s4, 16               
/* 026E0 80A0DDA0 2A8100C8 */  slti    $at, $s4, 0x00C8           
/* 026E4 80A0DDA4 1420FF87 */  bne     $at, $zero, .L80A0DBC4     
/* 026E8 80A0DDA8 26100038 */  addiu   $s0, $s0, 0x0038           ## $s0 = 00000658
/* 026EC 80A0DDAC 3C0680A1 */  lui     $a2, %hi(D_80A0E190)       ## $a2 = 80A10000
/* 026F0 80A0DDB0 24C6E190 */  addiu   $a2, $a2, %lo(D_80A0E190)  ## $a2 = 80A0E190
/* 026F4 80A0DDB4 27A40074 */  addiu   $a0, $sp, 0x0074           ## $a0 = FFFFFFE4
/* 026F8 80A0DDB8 8EA50000 */  lw      $a1, 0x0000($s5)           ## 00000000
/* 026FC 80A0DDBC 0C031AD5 */  jal     Graph_CloseDisps              
/* 02700 80A0DDC0 24070817 */  addiu   $a3, $zero, 0x0817         ## $a3 = 00000817
/* 02704 80A0DDC4 8FBF004C */  lw      $ra, 0x004C($sp)           
/* 02708 80A0DDC8 D7B40018 */  ldc1    $f20, 0x0018($sp)          
/* 0270C 80A0DDCC D7B60020 */  ldc1    $f22, 0x0020($sp)          
/* 02710 80A0DDD0 8FB00028 */  lw      $s0, 0x0028($sp)           
/* 02714 80A0DDD4 8FB1002C */  lw      $s1, 0x002C($sp)           
/* 02718 80A0DDD8 8FB20030 */  lw      $s2, 0x0030($sp)           
/* 0271C 80A0DDDC 8FB30034 */  lw      $s3, 0x0034($sp)           
/* 02720 80A0DDE0 8FB40038 */  lw      $s4, 0x0038($sp)           
/* 02724 80A0DDE4 8FB5003C */  lw      $s5, 0x003C($sp)           
/* 02728 80A0DDE8 8FB60040 */  lw      $s6, 0x0040($sp)           
/* 0272C 80A0DDEC 8FB70044 */  lw      $s7, 0x0044($sp)           
/* 02730 80A0DDF0 8FBE0048 */  lw      $s8, 0x0048($sp)           
/* 02734 80A0DDF4 03E00008 */  jr      $ra                        
/* 02738 80A0DDF8 27BD0090 */  addiu   $sp, $sp, 0x0090           ## $sp = 00000000
/* 0273C 80A0DDFC 00000000 */  nop
