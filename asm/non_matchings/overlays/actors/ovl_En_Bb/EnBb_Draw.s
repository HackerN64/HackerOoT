.rdata
glabel D_809BBC30
    .asciz "../z_en_bb.c"
    .balign 4

glabel D_809BBC40
    .asciz "../z_en_bb.c"
    .balign 4

glabel D_809BBC50
    .asciz "../z_en_bb.c"
    .balign 4

.late_rodata
glabel D_809BBCFC
    .float 0.8
glabel D_809BBD00
    .float 0.0000958738019107841
glabel D_809BBD04
    .float 0.009999999776482582

.text
glabel EnBb_Draw
/* 03264 809BB544 27BDFF38 */  addiu   $sp, $sp, 0xFF38           ## $sp = FFFFFF38
/* 03268 809BB548 3C0F809C */  lui     $t7, %hi(D_809BBC18)       ## $t7 = 809C0000
/* 0326C 809BB54C AFBF003C */  sw      $ra, 0x003C($sp)           
/* 03270 809BB550 AFB00038 */  sw      $s0, 0x0038($sp)           
/* 03274 809BB554 AFA500CC */  sw      $a1, 0x00CC($sp)           
/* 03278 809BB558 25EFBC18 */  addiu   $t7, $t7, %lo(D_809BBC18)  ## $t7 = 809BBC18
/* 0327C 809BB55C 8DF90000 */  lw      $t9, 0x0000($t7)           ## 809BBC18
/* 03280 809BB560 27AE00B4 */  addiu   $t6, $sp, 0x00B4           ## $t6 = FFFFFFEC
/* 03284 809BB564 8DF80004 */  lw      $t8, 0x0004($t7)           ## 809BBC1C
/* 03288 809BB568 ADD90000 */  sw      $t9, 0x0000($t6)           ## FFFFFFEC
/* 0328C 809BB56C 8DF90008 */  lw      $t9, 0x0008($t7)           ## 809BBC20
/* 03290 809BB570 3C0C809C */  lui     $t4, %hi(D_809BBC24)       ## $t4 = 809C0000
/* 03294 809BB574 258CBC24 */  addiu   $t4, $t4, %lo(D_809BBC24)  ## $t4 = 809BBC24
/* 03298 809BB578 ADD80004 */  sw      $t8, 0x0004($t6)           ## FFFFFFF0
/* 0329C 809BB57C ADD90008 */  sw      $t9, 0x0008($t6)           ## FFFFFFF4
/* 032A0 809BB580 8D8E0000 */  lw      $t6, 0x0000($t4)           ## 809BBC24
/* 032A4 809BB584 27AB00A8 */  addiu   $t3, $sp, 0x00A8           ## $t3 = FFFFFFE0
/* 032A8 809BB588 8D8D0004 */  lw      $t5, 0x0004($t4)           ## 809BBC28
/* 032AC 809BB58C AD6E0000 */  sw      $t6, 0x0000($t3)           ## FFFFFFE0
/* 032B0 809BB590 8D8E0008 */  lw      $t6, 0x0008($t4)           ## 809BBC2C
/* 032B4 809BB594 AD6D0004 */  sw      $t5, 0x0004($t3)           ## FFFFFFE4
/* 032B8 809BB598 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 032BC 809BB59C AD6E0008 */  sw      $t6, 0x0008($t3)           ## FFFFFFE8
/* 032C0 809BB5A0 8FAF00CC */  lw      $t7, 0x00CC($sp)           
/* 032C4 809BB5A4 3C06809C */  lui     $a2, %hi(D_809BBC30)       ## $a2 = 809C0000
/* 032C8 809BB5A8 24C6BC30 */  addiu   $a2, $a2, %lo(D_809BBC30)  ## $a2 = 809BBC30
/* 032CC 809BB5AC 8DE50000 */  lw      $a1, 0x0000($t7)           ## 809BBC18
/* 032D0 809BB5B0 27A4007C */  addiu   $a0, $sp, 0x007C           ## $a0 = FFFFFFB4
/* 032D4 809BB5B4 240707FC */  addiu   $a3, $zero, 0x07FC         ## $a3 = 000007FC
/* 032D8 809BB5B8 0C031AB1 */  jal     Graph_OpenDisps              
/* 032DC 809BB5BC AFA5008C */  sw      $a1, 0x008C($sp)           
/* 032E0 809BB5C0 3C0142A0 */  lui     $at, 0x42A0                ## $at = 42A00000
/* 032E4 809BB5C4 44810000 */  mtc1    $at, $f0                   ## $f0 = 80.00
/* 032E8 809BB5C8 C604027C */  lwc1    $f4, 0x027C($s0)           ## 0000027C
/* 032EC 809BB5CC 24010002 */  addiu   $at, $zero, 0x0002         ## $at = 00000002
/* 032F0 809BB5D0 46002182 */  mul.s   $f6, $f4, $f0              
/* 032F4 809BB5D4 E7A600BC */  swc1    $f6, 0x00BC($sp)           
/* 032F8 809BB5D8 C608027C */  lwc1    $f8, 0x027C($s0)           ## 0000027C
/* 032FC 809BB5DC 46004282 */  mul.s   $f10, $f8, $f0             
/* 03300 809BB5E0 E7AA00B0 */  swc1    $f10, 0x00B0($sp)          
/* 03304 809BB5E4 8E18025C */  lw      $t8, 0x025C($s0)           ## 0000025C
/* 03308 809BB5E8 53010117 */  beql    $t8, $at, .L809BBA48       
/* 0330C 809BB5EC 8FB800CC */  lw      $t8, 0x00CC($sp)           
/* 03310 809BB5F0 8619001C */  lh      $t9, 0x001C($s0)           ## 0000001C
/* 03314 809BB5F4 8FAB00CC */  lw      $t3, 0x00CC($sp)           
/* 03318 809BB5F8 3C01C220 */  lui     $at, 0xC220                ## $at = C2200000
/* 0331C 809BB5FC 07210060 */  bgez    $t9, .L809BB780            
/* 03320 809BB600 24060000 */  addiu   $a2, $zero, 0x0000         ## $a2 = 00000000
/* 03324 809BB604 0C024F46 */  jal     func_80093D18              
/* 03328 809BB608 8D640000 */  lw      $a0, 0x0000($t3)           ## 00000000
/* 0332C 809BB60C 3C0C809C */  lui     $t4, %hi(func_809BB4F4)    ## $t4 = 809C0000
/* 03330 809BB610 258CB4F4 */  addiu   $t4, $t4, %lo(func_809BB4F4) ## $t4 = 809BB4F4
/* 03334 809BB614 8E050150 */  lw      $a1, 0x0150($s0)           ## 00000150
/* 03338 809BB618 8E06016C */  lw      $a2, 0x016C($s0)           ## 0000016C
/* 0333C 809BB61C AFB00014 */  sw      $s0, 0x0014($sp)           
/* 03340 809BB620 AFAC0010 */  sw      $t4, 0x0010($sp)           
/* 03344 809BB624 8FA400CC */  lw      $a0, 0x00CC($sp)           
/* 03348 809BB628 0C028572 */  jal     SkelAnime_DrawOpa
              
/* 0334C 809BB62C 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 03350 809BB630 860D02A8 */  lh      $t5, 0x02A8($s0)           ## 000002A8
/* 03354 809BB634 51A00048 */  beql    $t5, $zero, .L809BB758     
/* 03358 809BB638 3C01C220 */  lui     $at, 0xC220                ## $at = C2200000
/* 0335C 809BB63C 861802A8 */  lh      $t8, 0x02A8($s0)           ## 000002A8
/* 03360 809BB640 920E0114 */  lbu     $t6, 0x0114($s0)           ## 00000114
/* 03364 809BB644 3C0D809C */  lui     $t5, %hi(D_809BBB88)       ## $t5 = 809C0000
/* 03368 809BB648 2719FFFF */  addiu   $t9, $t8, 0xFFFF           ## $t9 = FFFFFFFF
/* 0336C 809BB64C A61902A8 */  sh      $t9, 0x02A8($s0)           ## 000002A8
/* 03370 809BB650 860502A8 */  lh      $a1, 0x02A8($s0)           ## 000002A8
/* 03374 809BB654 25CF0001 */  addiu   $t7, $t6, 0x0001           ## $t7 = 00000001
/* 03378 809BB658 A20F0114 */  sb      $t7, 0x0114($s0)           ## 00000114
/* 0337C 809BB65C 30AB0003 */  andi    $t3, $a1, 0x0003           ## $t3 = 00000000
/* 03380 809BB660 1560003C */  bne     $t3, $zero, .L809BB754     
/* 03384 809BB664 00051883 */  sra     $v1, $a1,  2               
/* 03388 809BB668 00036080 */  sll     $t4, $v1,  2               
/* 0338C 809BB66C 01836023 */  subu    $t4, $t4, $v1              
/* 03390 809BB670 000C6080 */  sll     $t4, $t4,  2               
/* 03394 809BB674 25ADBB88 */  addiu   $t5, $t5, %lo(D_809BBB88)  ## $t5 = 809BBB88
/* 03398 809BB678 018D1021 */  addu    $v0, $t4, $t5              
/* 0339C 809BB67C C4500000 */  lwc1    $f16, 0x0000($v0)          ## 00000000
/* 033A0 809BB680 C6120024 */  lwc1    $f18, 0x0024($s0)          ## 00000024
/* 033A4 809BB684 C4460004 */  lwc1    $f6, 0x0004($v0)           ## 00000004
/* 033A8 809BB688 24010007 */  addiu   $at, $zero, 0x0007         ## $at = 00000007
/* 033AC 809BB68C 46128100 */  add.s   $f4, $f16, $f18            
/* 033B0 809BB690 C4500008 */  lwc1    $f16, 0x0008($v0)          ## 00000008
/* 033B4 809BB694 240D0001 */  addiu   $t5, $zero, 0x0001         ## $t5 = 00000001
/* 033B8 809BB698 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 033BC 809BB69C E7A40070 */  swc1    $f4, 0x0070($sp)           
/* 033C0 809BB6A0 C6080028 */  lwc1    $f8, 0x0028($s0)           ## 00000028
/* 033C4 809BB6A4 27A60070 */  addiu   $a2, $sp, 0x0070           ## $a2 = FFFFFFA8
/* 033C8 809BB6A8 24070028 */  addiu   $a3, $zero, 0x0028         ## $a3 = 00000028
/* 033CC 809BB6AC 46083280 */  add.s   $f10, $f6, $f8             
/* 033D0 809BB6B0 240EFFFF */  addiu   $t6, $zero, 0xFFFF         ## $t6 = FFFFFFFF
/* 033D4 809BB6B4 E7AA0074 */  swc1    $f10, 0x0074($sp)          
/* 033D8 809BB6B8 C612002C */  lwc1    $f18, 0x002C($s0)          ## 0000002C
/* 033DC 809BB6BC C7A80074 */  lwc1    $f8, 0x0074($sp)           
/* 033E0 809BB6C0 46128100 */  add.s   $f4, $f16, $f18            
/* 033E4 809BB6C4 E7A40078 */  swc1    $f4, 0x0078($sp)           
/* 033E8 809BB6C8 920402AA */  lbu     $a0, 0x02AA($s0)           ## 000002AA
/* 033EC 809BB6CC 10810018 */  beq     $a0, $at, .L809BB730       
/* 033F0 809BB6D0 24010005 */  addiu   $at, $zero, 0x0005         ## $at = 00000005
/* 033F4 809BB6D4 10810016 */  beq     $a0, $at, .L809BB730       
/* 033F8 809BB6D8 240F0096 */  addiu   $t7, $zero, 0x0096         ## $t7 = 00000096
/* 033FC 809BB6DC 3C01809C */  lui     $at, %hi(D_809BBCFC)       ## $at = 809C0000
/* 03400 809BB6E0 C426BCFC */  lwc1    $f6, %lo(D_809BBCFC)($at)  
/* 03404 809BB6E4 240E0096 */  addiu   $t6, $zero, 0x0096         ## $t6 = 00000096
/* 03408 809BB6E8 241800FA */  addiu   $t8, $zero, 0x00FA         ## $t8 = 000000FA
/* 0340C 809BB6EC 241900EB */  addiu   $t9, $zero, 0x00EB         ## $t9 = 000000EB
/* 03410 809BB6F0 240B00F5 */  addiu   $t3, $zero, 0x00F5         ## $t3 = 000000F5
/* 03414 809BB6F4 240C00FF */  addiu   $t4, $zero, 0x00FF         ## $t4 = 000000FF
/* 03418 809BB6F8 AFAC0024 */  sw      $t4, 0x0024($sp)           
/* 0341C 809BB6FC AFAB0020 */  sw      $t3, 0x0020($sp)           
/* 03420 809BB700 AFB9001C */  sw      $t9, 0x001C($sp)           
/* 03424 809BB704 AFB80018 */  sw      $t8, 0x0018($sp)           
/* 03428 809BB708 AFAE0010 */  sw      $t6, 0x0010($sp)           
/* 0342C 809BB70C 8FA400CC */  lw      $a0, 0x00CC($sp)           
/* 03430 809BB710 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 03434 809BB714 27A60070 */  addiu   $a2, $sp, 0x0070           ## $a2 = FFFFFFA8
/* 03438 809BB718 24070096 */  addiu   $a3, $zero, 0x0096         ## $a3 = 00000096
/* 0343C 809BB71C AFAF0014 */  sw      $t7, 0x0014($sp)           
/* 03440 809BB720 0C00A850 */  jal     EffectSsEnIce_SpawnFlyingVec3f              
/* 03444 809BB724 E7A60028 */  swc1    $f6, 0x0028($sp)           
/* 03448 809BB728 1000000B */  beq     $zero, $zero, .L809BB758   
/* 0344C 809BB72C 3C01C220 */  lui     $at, 0xC220                ## $at = C2200000
.L809BB730:
/* 03450 809BB730 3C014188 */  lui     $at, 0x4188                ## $at = 41880000
/* 03454 809BB734 44815000 */  mtc1    $at, $f10                  ## $f10 = 17.00
/* 03458 809BB738 8FA400CC */  lw      $a0, 0x00CC($sp)           
/* 0345C 809BB73C AFAD0010 */  sw      $t5, 0x0010($sp)           
/* 03460 809BB740 460A4401 */  sub.s   $f16, $f8, $f10            
/* 03464 809BB744 AFA00014 */  sw      $zero, 0x0014($sp)         
/* 03468 809BB748 AFAE0018 */  sw      $t6, 0x0018($sp)           
/* 0346C 809BB74C 0C00A935 */  jal     EffectSsEnFire_SpawnVec3f              
/* 03470 809BB750 E7B00074 */  swc1    $f16, 0x0074($sp)          
.L809BB754:
/* 03474 809BB754 3C01C220 */  lui     $at, 0xC220                ## $at = C2200000
.L809BB758:
/* 03478 809BB758 44806000 */  mtc1    $zero, $f12                ## $f12 = 0.00
/* 0347C 809BB75C 44812000 */  mtc1    $at, $f4                   ## $f4 = -40.00
/* 03480 809BB760 C612028C */  lwc1    $f18, 0x028C($s0)          ## 0000028C
/* 03484 809BB764 44066000 */  mfc1    $a2, $f12                  
/* 03488 809BB768 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 0348C 809BB76C 46049382 */  mul.s   $f14, $f18, $f4            
/* 03490 809BB770 0C034261 */  jal     Matrix_Translate              
/* 03494 809BB774 00000000 */  nop
/* 03498 809BB778 10000006 */  beq     $zero, $zero, .L809BB794   
/* 0349C 809BB77C 860F001C */  lh      $t7, 0x001C($s0)           ## 0000001C
.L809BB780:
/* 034A0 809BB780 44806000 */  mtc1    $zero, $f12                ## $f12 = 0.00
/* 034A4 809BB784 44817000 */  mtc1    $at, $f14                  ## $f14 = 0.00
/* 034A8 809BB788 0C034261 */  jal     Matrix_Translate              
/* 034AC 809BB78C 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 034B0 809BB790 860F001C */  lh      $t7, 0x001C($s0)           ## 0000001C
.L809BB794:
/* 034B4 809BB794 2401FFFD */  addiu   $at, $zero, 0xFFFD         ## $at = FFFFFFFD
/* 034B8 809BB798 8FB800CC */  lw      $t8, 0x00CC($sp)           
/* 034BC 809BB79C 11E10081 */  beq     $t7, $at, .L809BB9A4       
/* 034C0 809BB7A0 27A400B4 */  addiu   $a0, $sp, 0x00B4           ## $a0 = FFFFFFEC
/* 034C4 809BB7A4 0C024F61 */  jal     func_80093D84              
/* 034C8 809BB7A8 8F040000 */  lw      $a0, 0x0000($t8)           ## 00000000
/* 034CC 809BB7AC 8FA9008C */  lw      $t1, 0x008C($sp)           
/* 034D0 809BB7B0 8FAA00CC */  lw      $t2, 0x00CC($sp)           
/* 034D4 809BB7B4 3C0BDB06 */  lui     $t3, 0xDB06                ## $t3 = DB060000
/* 034D8 809BB7B8 8D2202D0 */  lw      $v0, 0x02D0($t1)           ## 000002D0
/* 034DC 809BB7BC 356B0020 */  ori     $t3, $t3, 0x0020           ## $t3 = DB060020
/* 034E0 809BB7C0 240C0020 */  addiu   $t4, $zero, 0x0020         ## $t4 = 00000020
/* 034E4 809BB7C4 24590008 */  addiu   $t9, $v0, 0x0008           ## $t9 = 00000008
/* 034E8 809BB7C8 AD3902D0 */  sw      $t9, 0x02D0($t1)           ## 000002D0
/* 034EC 809BB7CC AC4B0000 */  sw      $t3, 0x0000($v0)           ## 00000000
/* 034F0 809BB7D0 8D440000 */  lw      $a0, 0x0000($t2)           ## 00000000
/* 034F4 809BB7D4 240D0040 */  addiu   $t5, $zero, 0x0040         ## $t5 = 00000040
/* 034F8 809BB7D8 240E0001 */  addiu   $t6, $zero, 0x0001         ## $t6 = 00000001
/* 034FC 809BB7DC AFAE0018 */  sw      $t6, 0x0018($sp)           
/* 03500 809BB7E0 AFAD0014 */  sw      $t5, 0x0014($sp)           
/* 03504 809BB7E4 AFA0001C */  sw      $zero, 0x001C($sp)         
/* 03508 809BB7E8 AFAC0010 */  sw      $t4, 0x0010($sp)           
/* 0350C 809BB7EC 86030270 */  lh      $v1, 0x0270($s0)           ## 00000270
/* 03510 809BB7F0 3C0F0001 */  lui     $t7, 0x0001                ## $t7 = 00010000
/* 03514 809BB7F4 01EA7821 */  addu    $t7, $t7, $t2              
/* 03518 809BB7F8 8DEF1DE4 */  lw      $t7, 0x1DE4($t7)           ## 00011DE4
/* 0351C 809BB7FC 0003C080 */  sll     $t8, $v1,  2               
/* 03520 809BB800 0303C021 */  addu    $t8, $t8, $v1              
/* 03524 809BB804 00030823 */  subu    $at, $zero, $v1            
/* 03528 809BB808 00015840 */  sll     $t3, $at,  1               
/* 0352C 809BB80C 0018C040 */  sll     $t8, $t8,  1               
/* 03530 809BB810 240CFFEC */  addiu   $t4, $zero, 0xFFEC         ## $t4 = FFFFFFEC
/* 03534 809BB814 018B6823 */  subu    $t5, $t4, $t3              
/* 03538 809BB818 01F8C821 */  addu    $t9, $t7, $t8              
/* 0353C 809BB81C 032D0019 */  multu   $t9, $t5                   
/* 03540 809BB820 24180020 */  addiu   $t8, $zero, 0x0020         ## $t8 = 00000020
/* 03544 809BB824 240C0080 */  addiu   $t4, $zero, 0x0080         ## $t4 = 00000080
/* 03548 809BB828 AFAC0028 */  sw      $t4, 0x0028($sp)           
/* 0354C 809BB82C AFB80024 */  sw      $t8, 0x0024($sp)           
/* 03550 809BB830 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 03554 809BB834 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 03558 809BB838 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 0355C 809BB83C AFA20068 */  sw      $v0, 0x0068($sp)           
/* 03560 809BB840 00007012 */  mflo    $t6                        
/* 03564 809BB844 31CF01FF */  andi    $t7, $t6, 0x01FF           ## $t7 = 00000001
/* 03568 809BB848 0C0253D0 */  jal     Gfx_TwoTexScroll              
/* 0356C 809BB84C AFAF0020 */  sw      $t7, 0x0020($sp)           
/* 03570 809BB850 8FA80068 */  lw      $t0, 0x0068($sp)           
/* 03574 809BB854 3C19FA00 */  lui     $t9, 0xFA00                ## $t9 = FA000000
/* 03578 809BB858 37398080 */  ori     $t9, $t9, 0x8080           ## $t9 = FA008080
/* 0357C 809BB85C AD020004 */  sw      $v0, 0x0004($t0)           ## 00000004
/* 03580 809BB860 8FA5008C */  lw      $a1, 0x008C($sp)           
/* 03584 809BB864 3C01FFFF */  lui     $at, 0xFFFF                ## $at = FFFF0000
/* 03588 809BB868 8CA202D0 */  lw      $v0, 0x02D0($a1)           ## 000002D0
/* 0358C 809BB86C 244B0008 */  addiu   $t3, $v0, 0x0008           ## $t3 = 00000008
/* 03590 809BB870 ACAB02D0 */  sw      $t3, 0x02D0($a1)           ## 000002D0
/* 03594 809BB874 AC590000 */  sw      $t9, 0x0000($v0)           ## 00000000
/* 03598 809BB878 920E029E */  lbu     $t6, 0x029E($s0)           ## 0000029E
/* 0359C 809BB87C 920B029F */  lbu     $t3, 0x029F($s0)           ## 0000029F
/* 035A0 809BB880 000E7A00 */  sll     $t7, $t6,  8               
/* 035A4 809BB884 01E1C025 */  or      $t8, $t7, $at              ## $t8 = FFFF0000
/* 035A8 809BB888 030BC825 */  or      $t9, $t8, $t3              ## $t9 = FFFF0008
/* 035AC 809BB88C AC590004 */  sw      $t9, 0x0004($v0)           ## 00000004
/* 035B0 809BB890 8CA202D0 */  lw      $v0, 0x02D0($a1)           ## 000002D0
/* 035B4 809BB894 3C0EFB00 */  lui     $t6, 0xFB00                ## $t6 = FB000000
/* 035B8 809BB898 244D0008 */  addiu   $t5, $v0, 0x0008           ## $t5 = 00000008
/* 035BC 809BB89C ACAD02D0 */  sw      $t5, 0x02D0($a1)           ## 000002D0
/* 035C0 809BB8A0 AC4E0000 */  sw      $t6, 0x0000($v0)           ## 00000000
/* 035C4 809BB8A4 920C02A0 */  lbu     $t4, 0x02A0($s0)           ## 000002A0
/* 035C8 809BB8A8 921902A1 */  lbu     $t9, 0x02A1($s0)           ## 000002A1
/* 035CC 809BB8AC 000CC600 */  sll     $t8, $t4, 24               
/* 035D0 809BB8B0 920C02A2 */  lbu     $t4, 0x02A2($s0)           ## 000002A2
/* 035D4 809BB8B4 00196C00 */  sll     $t5, $t9, 16               
/* 035D8 809BB8B8 030D7025 */  or      $t6, $t8, $t5              ## $t6 = FFFF0008
/* 035DC 809BB8BC 000C5A00 */  sll     $t3, $t4,  8               
/* 035E0 809BB8C0 01CBC825 */  or      $t9, $t6, $t3              ## $t9 = FFFF0008
/* 035E4 809BB8C4 AC590004 */  sw      $t9, 0x0004($v0)           ## 00000004
/* 035E8 809BB8C8 8FA200CC */  lw      $v0, 0x00CC($sp)           
/* 035EC 809BB8CC 845807A0 */  lh      $t8, 0x07A0($v0)           ## 000007A0
/* 035F0 809BB8D0 00186880 */  sll     $t5, $t8,  2               
/* 035F4 809BB8D4 004D7821 */  addu    $t7, $v0, $t5              
/* 035F8 809BB8D8 0C016A7D */  jal     Camera_GetCamDirYaw              
/* 035FC 809BB8DC 8DE40790 */  lw      $a0, 0x0790($t7)           ## 00000790
/* 03600 809BB8E0 860C00B6 */  lh      $t4, 0x00B6($s0)           ## 000000B6
/* 03604 809BB8E4 34018000 */  ori     $at, $zero, 0x8000         ## $at = 00008000
/* 03608 809BB8E8 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 0360C 809BB8EC 004C7023 */  subu    $t6, $v0, $t4              
/* 03610 809BB8F0 01C15821 */  addu    $t3, $t6, $at              
/* 03614 809BB8F4 000BCC00 */  sll     $t9, $t3, 16               
/* 03618 809BB8F8 0019C403 */  sra     $t8, $t9, 16               
/* 0361C 809BB8FC 44983000 */  mtc1    $t8, $f6                   ## $f6 = 0.00
/* 03620 809BB900 3C01809C */  lui     $at, %hi(D_809BBD00)       ## $at = 809C0000
/* 03624 809BB904 C42ABD00 */  lwc1    $f10, %lo(D_809BBD00)($at) 
/* 03628 809BB908 46803220 */  cvt.s.w $f8, $f6                   
/* 0362C 809BB90C 460A4302 */  mul.s   $f12, $f8, $f10            
/* 03630 809BB910 0C034348 */  jal     Matrix_RotateY              
/* 03634 809BB914 00000000 */  nop
/* 03638 809BB918 3C01809C */  lui     $at, %hi(D_809BBD04)       ## $at = 809C0000
/* 0363C 809BB91C C420BD04 */  lwc1    $f0, %lo(D_809BBD04)($at)  
/* 03640 809BB920 C610028C */  lwc1    $f16, 0x028C($s0)          ## 0000028C
/* 03644 809BB924 C6120288 */  lwc1    $f18, 0x0288($s0)          ## 00000288
/* 03648 809BB928 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 0364C 809BB92C 46008302 */  mul.s   $f12, $f16, $f0            
/* 03650 809BB930 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 03654 809BB934 46009382 */  mul.s   $f14, $f18, $f0            
/* 03658 809BB938 0C0342A3 */  jal     Matrix_Scale              
/* 0365C 809BB93C 00000000 */  nop
/* 03660 809BB940 8FA3008C */  lw      $v1, 0x008C($sp)           
/* 03664 809BB944 3C0FDA38 */  lui     $t7, 0xDA38                ## $t7 = DA380000
/* 03668 809BB948 35EF0003 */  ori     $t7, $t7, 0x0003           ## $t7 = DA380003
/* 0366C 809BB94C 8C6202D0 */  lw      $v0, 0x02D0($v1)           ## 000002D0
/* 03670 809BB950 3C05809C */  lui     $a1, %hi(D_809BBC40)       ## $a1 = 809C0000
/* 03674 809BB954 24A5BC40 */  addiu   $a1, $a1, %lo(D_809BBC40)  ## $a1 = 809BBC40
/* 03678 809BB958 244D0008 */  addiu   $t5, $v0, 0x0008           ## $t5 = 00000008
/* 0367C 809BB95C AC6D02D0 */  sw      $t5, 0x02D0($v1)           ## 000002D0
/* 03680 809BB960 AC4F0000 */  sw      $t7, 0x0000($v0)           ## 00000000
/* 03684 809BB964 8FAC00CC */  lw      $t4, 0x00CC($sp)           
/* 03688 809BB968 2406083A */  addiu   $a2, $zero, 0x083A         ## $a2 = 0000083A
/* 0368C 809BB96C 00408025 */  or      $s0, $v0, $zero            ## $s0 = 00000000
/* 03690 809BB970 0C0346A2 */  jal     Matrix_NewMtx              
/* 03694 809BB974 8D840000 */  lw      $a0, 0x0000($t4)           ## 00000000
/* 03698 809BB978 AE020004 */  sw      $v0, 0x0004($s0)           ## 00000004
/* 0369C 809BB97C 8FAE008C */  lw      $t6, 0x008C($sp)           
/* 036A0 809BB980 3C180405 */  lui     $t8, %hi(D_0404D4E0)                ## $t8 = 04050000
/* 036A4 809BB984 2718D4E0 */  addiu   $t8, $t8, %lo(D_0404D4E0)           ## $t8 = 0404D4E0
/* 036A8 809BB988 8DC202D0 */  lw      $v0, 0x02D0($t6)           ## 000002D0
/* 036AC 809BB98C 3C19DE00 */  lui     $t9, 0xDE00                ## $t9 = DE000000
/* 036B0 809BB990 244B0008 */  addiu   $t3, $v0, 0x0008           ## $t3 = 00000008
/* 036B4 809BB994 ADCB02D0 */  sw      $t3, 0x02D0($t6)           ## 000002D0
/* 036B8 809BB998 AC580004 */  sw      $t8, 0x0004($v0)           ## 00000004
/* 036BC 809BB99C 10000029 */  beq     $zero, $zero, .L809BBA44   
/* 036C0 809BB9A0 AC590000 */  sw      $t9, 0x0000($v0)           ## 00000000
.L809BB9A4:
/* 036C4 809BB9A4 0C0346BD */  jal     Matrix_MultVec3f              
/* 036C8 809BB9A8 27A5009C */  addiu   $a1, $sp, 0x009C           ## $a1 = FFFFFFD4
/* 036CC 809BB9AC 27A400A8 */  addiu   $a0, $sp, 0x00A8           ## $a0 = FFFFFFE0
/* 036D0 809BB9B0 0C0346BD */  jal     Matrix_MultVec3f              
/* 036D4 809BB9B4 27A50090 */  addiu   $a1, $sp, 0x0090           ## $a1 = FFFFFFC8
/* 036D8 809BB9B8 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 036DC 809BB9BC C606027C */  lwc1    $f6, 0x027C($s0)           ## 0000027C
/* 036E0 809BB9C0 46062032 */  c.eq.s  $f4, $f6                   
/* 036E4 809BB9C4 00000000 */  nop
/* 036E8 809BB9C8 45030017 */  bc1tl   .L809BBA28                 
/* 036EC 809BB9CC 8E190250 */  lw      $t9, 0x0250($s0)           ## 00000250
/* 036F0 809BB9D0 8E0D0250 */  lw      $t5, 0x0250($s0)           ## 00000250
/* 036F4 809BB9D4 24010008 */  addiu   $at, $zero, 0x0008         ## $at = 00000008
/* 036F8 809BB9D8 8FAF00CC */  lw      $t7, 0x00CC($sp)           
/* 036FC 809BB9DC 15A10011 */  bne     $t5, $at, .L809BBA24       
/* 03700 809BB9E0 3C0C0001 */  lui     $t4, 0x0001                ## $t4 = 00010000
/* 03704 809BB9E4 018F6021 */  addu    $t4, $t4, $t7              
/* 03708 809BB9E8 8D8C1DE4 */  lw      $t4, 0x1DE4($t4)           ## 00011DE4
/* 0370C 809BB9EC 318B0001 */  andi    $t3, $t4, 0x0001           ## $t3 = 00000000
/* 03710 809BB9F0 5560000D */  bnel    $t3, $zero, .L809BBA28     
/* 03714 809BB9F4 8E190250 */  lw      $t9, 0x0250($s0)           ## 00000250
/* 03718 809BB9F8 920E00AF */  lbu     $t6, 0x00AF($s0)           ## 000000AF
/* 0371C 809BB9FC 51C0000A */  beql    $t6, $zero, .L809BBA28     
/* 03720 809BBA00 8E190250 */  lw      $t9, 0x0250($s0)           ## 00000250
/* 03724 809BBA04 0C009AC3 */  jal     Effect_GetByIndex              
/* 03728 809BBA08 8E0402A4 */  lw      $a0, 0x02A4($s0)           ## 000002A4
/* 0372C 809BBA0C 00402025 */  or      $a0, $v0, $zero            ## $a0 = 00000000
/* 03730 809BBA10 27A5009C */  addiu   $a1, $sp, 0x009C           ## $a1 = FFFFFFD4
/* 03734 809BBA14 0C007F7C */  jal     EffectBlure_AddVertex              
/* 03738 809BBA18 27A60090 */  addiu   $a2, $sp, 0x0090           ## $a2 = FFFFFFC8
/* 0373C 809BBA1C 1000000A */  beq     $zero, $zero, .L809BBA48   
/* 03740 809BBA20 8FB800CC */  lw      $t8, 0x00CC($sp)           
.L809BBA24:
/* 03744 809BBA24 8E190250 */  lw      $t9, 0x0250($s0)           ## 00000250
.L809BBA28:
/* 03748 809BBA28 24010008 */  addiu   $at, $zero, 0x0008         ## $at = 00000008
/* 0374C 809BBA2C 53210006 */  beql    $t9, $at, .L809BBA48       
/* 03750 809BBA30 8FB800CC */  lw      $t8, 0x00CC($sp)           
/* 03754 809BBA34 0C009AC3 */  jal     Effect_GetByIndex              
/* 03758 809BBA38 8E0402A4 */  lw      $a0, 0x02A4($s0)           ## 000002A4
/* 0375C 809BBA3C 0C008048 */  jal     EffectBlure_AddSpace              
/* 03760 809BBA40 00402025 */  or      $a0, $v0, $zero            ## $a0 = 00000000
.L809BBA44:
/* 03764 809BBA44 8FB800CC */  lw      $t8, 0x00CC($sp)           
.L809BBA48:
/* 03768 809BBA48 3C06809C */  lui     $a2, %hi(D_809BBC50)       ## $a2 = 809C0000
/* 0376C 809BBA4C 24C6BC50 */  addiu   $a2, $a2, %lo(D_809BBC50)  ## $a2 = 809BBC50
/* 03770 809BBA50 27A4007C */  addiu   $a0, $sp, 0x007C           ## $a0 = FFFFFFB4
/* 03774 809BBA54 2407084F */  addiu   $a3, $zero, 0x084F         ## $a3 = 0000084F
/* 03778 809BBA58 0C031AD5 */  jal     Graph_CloseDisps              
/* 0377C 809BBA5C 8F050000 */  lw      $a1, 0x0000($t8)           ## 00000000
/* 03780 809BBA60 8FBF003C */  lw      $ra, 0x003C($sp)           
/* 03784 809BBA64 8FB00038 */  lw      $s0, 0x0038($sp)           
/* 03788 809BBA68 27BD00C8 */  addiu   $sp, $sp, 0x00C8           ## $sp = 00000000
/* 0378C 809BBA6C 03E00008 */  jr      $ra                        
/* 03790 809BBA70 00000000 */  nop
/* 03794 809BBA74 00000000 */  nop
/* 03798 809BBA78 00000000 */  nop
/* 0379C 809BBA7C 00000000 */  nop
