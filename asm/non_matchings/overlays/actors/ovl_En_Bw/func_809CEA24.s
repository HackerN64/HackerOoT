.late_rodata
glabel D_809D15C8
    .float 0.1

glabel D_809D15CC
    .float 0.8

glabel D_809D15D0
    .float 0.1

glabel D_809D15D4
 .word 0x3B83126F
glabel D_809D15D8
 .word 0x3C54FDF4
glabel D_809D15DC
 .word 0x3B83126F
glabel D_809D15E0
 .word 0x3C54FDF4
glabel D_809D15E4
 .word 0x3B83126F
glabel D_809D15E8
 .word 0x3C54FDF4
glabel D_809D15EC
 .word 0x4622F983
glabel jtbl_809D15F0
.word L809CEEB0
.word L809CEEC0
.word L809CEF60
.word L809CEF70
.word L809CEF7C
.word L809CEF8C
.word L809CEF9C
.word L809CEF98
glabel D_809D1610
 .word 0x4622F983

.text
glabel func_809CEA24
/* 00344 809CEA24 27BDFF88 */  addiu   $sp, $sp, 0xFF88           ## $sp = FFFFFF88
/* 00348 809CEA28 AFBF0034 */  sw      $ra, 0x0034($sp)           
/* 0034C 809CEA2C AFB00030 */  sw      $s0, 0x0030($sp)           
/* 00350 809CEA30 AFA5007C */  sw      $a1, 0x007C($sp)           
/* 00354 809CEA34 AFA00074 */  sw      $zero, 0x0074($sp)         
/* 00358 809CEA38 AFA00064 */  sw      $zero, 0x0064($sp)         
/* 0035C 809CEA3C 8CA21C44 */  lw      $v0, 0x1C44($a1)           ## 00001C44
/* 00360 809CEA40 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00364 809CEA44 2484014C */  addiu   $a0, $a0, 0x014C           ## $a0 = 0000014C
/* 00368 809CEA48 AFA20054 */  sw      $v0, 0x0054($sp)           
/* 0036C 809CEA4C 0C02927F */  jal     SkelAnime_FrameUpdateMatrix
              
/* 00370 809CEA50 AFA20050 */  sw      $v0, 0x0050($sp)           
/* 00374 809CEA54 3C01809D */  lui     $at, %hi(D_809D15C8)       ## $at = 809D0000
/* 00378 809CEA58 C42615C8 */  lwc1    $f6, %lo(D_809D15C8)($at)  
/* 0037C 809CEA5C C6040250 */  lwc1    $f4, 0x0250($s0)           ## 00000250
/* 00380 809CEA60 C60C0240 */  lwc1    $f12, 0x0240($s0)          ## 00000240
/* 00384 809CEA64 46062200 */  add.s   $f8, $f4, $f6              
/* 00388 809CEA68 0C0329DD */  jal     func_800CA774              
/* 0038C 809CEA6C E6080244 */  swc1    $f8, 0x0244($s0)           ## 00000244
/* 00390 809CEA70 C60A0240 */  lwc1    $f10, 0x0240($s0)          ## 00000240
/* 00394 809CEA74 C6100244 */  lwc1    $f16, 0x0244($s0)          ## 00000244
/* 00398 809CEA78 3C01809D */  lui     $at, %hi(D_809D15CC)       ## $at = 809D0000
/* 0039C 809CEA7C C60C024C */  lwc1    $f12, 0x024C($s0)          ## 0000024C
/* 003A0 809CEA80 46105480 */  add.s   $f18, $f10, $f16           
/* 003A4 809CEA84 46000086 */  mov.s   $f2, $f0                   
/* 003A8 809CEA88 E6120240 */  swc1    $f18, 0x0240($s0)          ## 00000240
/* 003AC 809CEA8C C42415CC */  lwc1    $f4, %lo(D_809D15CC)($at)  
/* 003B0 809CEA90 3C01809D */  lui     $at, %hi(D_809D15D0)       ## $at = 809D0000
/* 003B4 809CEA94 4604603C */  c.lt.s  $f12, $f4                  
/* 003B8 809CEA98 00000000 */  nop
/* 003BC 809CEA9C 45020005 */  bc1fl   .L809CEAB4                 
/* 003C0 809CEAA0 C60C0240 */  lwc1    $f12, 0x0240($s0)          ## 00000240
/* 003C4 809CEAA4 C42615D0 */  lwc1    $f6, %lo(D_809D15D0)($at)  
/* 003C8 809CEAA8 46066200 */  add.s   $f8, $f12, $f6             
/* 003CC 809CEAAC E608024C */  swc1    $f8, 0x024C($s0)           ## 0000024C
/* 003D0 809CEAB0 C60C0240 */  lwc1    $f12, 0x0240($s0)          ## 00000240
.L809CEAB4:
/* 003D4 809CEAB4 0C0329C8 */  jal     func_800CA720              
/* 003D8 809CEAB8 E7A20058 */  swc1    $f2, 0x0058($sp)           
/* 003DC 809CEABC 3C01809D */  lui     $at, %hi(D_809D15D4)       ## $at = 809D0000
/* 003E0 809CEAC0 C43015D4 */  lwc1    $f16, %lo(D_809D15D4)($at) 
/* 003E4 809CEAC4 C60A024C */  lwc1    $f10, 0x024C($s0)          ## 0000024C
/* 003E8 809CEAC8 3C01809D */  lui     $at, %hi(D_809D15D8)       ## $at = 809D0000
/* 003EC 809CEACC C42615D8 */  lwc1    $f6, %lo(D_809D15D8)($at)  
/* 003F0 809CEAD0 46105482 */  mul.s   $f18, $f10, $f16           
/* 003F4 809CEAD4 C60C0240 */  lwc1    $f12, 0x0240($s0)          ## 00000240
/* 003F8 809CEAD8 46120102 */  mul.s   $f4, $f0, $f18             
/* 003FC 809CEADC 46043201 */  sub.s   $f8, $f6, $f4              
/* 00400 809CEAE0 0C0329C8 */  jal     func_800CA720              
/* 00404 809CEAE4 E6080050 */  swc1    $f8, 0x0050($s0)           ## 00000050
/* 00408 809CEAE8 3C01809D */  lui     $at, %hi(D_809D15DC)       ## $at = 809D0000
/* 0040C 809CEAEC C43015DC */  lwc1    $f16, %lo(D_809D15DC)($at) 
/* 00410 809CEAF0 C60A024C */  lwc1    $f10, 0x024C($s0)          ## 0000024C
/* 00414 809CEAF4 3C01809D */  lui     $at, %hi(D_809D15E0)       ## $at = 809D0000
/* 00418 809CEAF8 C42415E0 */  lwc1    $f4, %lo(D_809D15E0)($at)  
/* 0041C 809CEAFC 46105482 */  mul.s   $f18, $f10, $f16           
/* 00420 809CEB00 C60C0240 */  lwc1    $f12, 0x0240($s0)          ## 00000240
/* 00424 809CEB04 46120182 */  mul.s   $f6, $f0, $f18             
/* 00428 809CEB08 46062201 */  sub.s   $f8, $f4, $f6              
/* 0042C 809CEB0C 0C0329C8 */  jal     func_800CA720              
/* 00430 809CEB10 E6080054 */  swc1    $f8, 0x0054($s0)           ## 00000054
/* 00434 809CEB14 3C01809D */  lui     $at, %hi(D_809D15E4)       ## $at = 809D0000
/* 00438 809CEB18 C43015E4 */  lwc1    $f16, %lo(D_809D15E4)($at) 
/* 0043C 809CEB1C C60A024C */  lwc1    $f10, 0x024C($s0)          ## 0000024C
/* 00440 809CEB20 3C01809D */  lui     $at, %hi(D_809D15E8)       ## $at = 809D0000
/* 00444 809CEB24 C42615E8 */  lwc1    $f6, %lo(D_809D15E8)($at)  
/* 00448 809CEB28 46105482 */  mul.s   $f18, $f10, $f16           
/* 0044C 809CEB2C C60C0240 */  lwc1    $f12, 0x0240($s0)          ## 00000240
/* 00450 809CEB30 46120102 */  mul.s   $f4, $f0, $f18             
/* 00454 809CEB34 46062200 */  add.s   $f8, $f4, $f6              
/* 00458 809CEB38 0C0329DD */  jal     func_800CA774              
/* 0045C 809CEB3C E6080058 */  swc1    $f8, 0x0058($s0)           ## 00000058
/* 00460 809CEB40 92020232 */  lbu     $v0, 0x0232($s0)           ## 00000232
/* 00464 809CEB44 C7A20058 */  lwc1    $f2, 0x0058($sp)           
/* 00468 809CEB48 46000386 */  mov.s   $f14, $f0                  
/* 0046C 809CEB4C 54400019 */  bnel    $v0, $zero, .L809CEBB4     
/* 00470 809CEB50 44809000 */  mtc1    $zero, $f18                ## $f18 = 0.00
/* 00474 809CEB54 44805000 */  mtc1    $zero, $f10                ## $f10 = 0.00
/* 00478 809CEB58 44808000 */  mtc1    $zero, $f16                ## $f16 = 0.00
/* 0047C 809CEB5C 244F0001 */  addiu   $t7, $v0, 0x0001           ## $t7 = 00000001
/* 00480 809CEB60 4602503E */  c.le.s  $f10, $f2                  
/* 00484 809CEB64 00000000 */  nop
/* 00488 809CEB68 45020004 */  bc1fl   .L809CEB7C                 
/* 0048C 809CEB6C 46001307 */  neg.s   $f12, $f2                  
/* 00490 809CEB70 10000002 */  beq     $zero, $zero, .L809CEB7C   
/* 00494 809CEB74 46001306 */  mov.s   $f12, $f2                  
/* 00498 809CEB78 46001307 */  neg.s   $f12, $f2                  
.L809CEB7C:
/* 0049C 809CEB7C 4600803E */  c.le.s  $f16, $f0                  
/* 004A0 809CEB80 00000000 */  nop
/* 004A4 809CEB84 45020004 */  bc1fl   .L809CEB98                 
/* 004A8 809CEB88 46000087 */  neg.s   $f2, $f0                   
/* 004AC 809CEB8C 10000002 */  beq     $zero, $zero, .L809CEB98   
/* 004B0 809CEB90 46000086 */  mov.s   $f2, $f0                   
/* 004B4 809CEB94 46000087 */  neg.s   $f2, $f0                   
.L809CEB98:
/* 004B8 809CEB98 4602603C */  c.lt.s  $f12, $f2                  
/* 004BC 809CEB9C 00000000 */  nop
/* 004C0 809CEBA0 4502001D */  bc1fl   .L809CEC18                 
/* 004C4 809CEBA4 3C014120 */  lui     $at, 0x4120                ## $at = 41200000
/* 004C8 809CEBA8 1000001A */  beq     $zero, $zero, .L809CEC14   
/* 004CC 809CEBAC A20F0232 */  sb      $t7, 0x0232($s0)           ## 00000232
/* 004D0 809CEBB0 44809000 */  mtc1    $zero, $f18                ## $f18 = 0.00
.L809CEBB4:
/* 004D4 809CEBB4 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 004D8 809CEBB8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 004DC 809CEBBC 4602903E */  c.le.s  $f18, $f2                  
/* 004E0 809CEBC0 24053974 */  addiu   $a1, $zero, 0x3974         ## $a1 = 00003974
/* 004E4 809CEBC4 45020004 */  bc1fl   .L809CEBD8                 
/* 004E8 809CEBC8 46001307 */  neg.s   $f12, $f2                  
/* 004EC 809CEBCC 10000002 */  beq     $zero, $zero, .L809CEBD8   
/* 004F0 809CEBD0 46001306 */  mov.s   $f12, $f2                  
/* 004F4 809CEBD4 46001307 */  neg.s   $f12, $f2                  
.L809CEBD8:
/* 004F8 809CEBD8 4600203E */  c.le.s  $f4, $f0                   
/* 004FC 809CEBDC 00000000 */  nop
/* 00500 809CEBE0 45020004 */  bc1fl   .L809CEBF4                 
/* 00504 809CEBE4 46000087 */  neg.s   $f2, $f0                   
/* 00508 809CEBE8 10000002 */  beq     $zero, $zero, .L809CEBF4   
/* 0050C 809CEBEC 46000086 */  mov.s   $f2, $f0                   
/* 00510 809CEBF0 46000087 */  neg.s   $f2, $f0                   
.L809CEBF4:
/* 00514 809CEBF4 460C103C */  c.lt.s  $f2, $f12                  
/* 00518 809CEBF8 00000000 */  nop
/* 0051C 809CEBFC 45020006 */  bc1fl   .L809CEC18                 
/* 00520 809CEC00 3C014120 */  lui     $at, 0x4120                ## $at = 41200000
/* 00524 809CEC04 0C00BE0A */  jal     Audio_PlayActorSound2
              
/* 00528 809CEC08 E7AE005C */  swc1    $f14, 0x005C($sp)          
/* 0052C 809CEC0C C7AE005C */  lwc1    $f14, 0x005C($sp)          
/* 00530 809CEC10 A2000232 */  sb      $zero, 0x0232($s0)         ## 00000232
.L809CEC14:
/* 00534 809CEC14 3C014120 */  lui     $at, 0x4120                ## $at = 41200000
.L809CEC18:
/* 00538 809CEC18 44813000 */  mtc1    $at, $f6                   ## $f6 = 10.00
/* 0053C 809CEC1C C6080244 */  lwc1    $f8, 0x0244($s0)           ## 00000244
/* 00540 809CEC20 C610024C */  lwc1    $f16, 0x024C($s0)          ## 0000024C
/* 00544 809CEC24 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 00548 809CEC28 46083282 */  mul.s   $f10, $f6, $f8             
/* 0054C 809CEC2C 00000000 */  nop
/* 00550 809CEC30 460A8482 */  mul.s   $f18, $f16, $f10           
/* 00554 809CEC34 00000000 */  nop
/* 00558 809CEC38 46127382 */  mul.s   $f14, $f14, $f18           
/* 0055C 809CEC3C 460E203E */  c.le.s  $f4, $f14                  
/* 00560 809CEC40 00000000 */  nop
/* 00564 809CEC44 45000003 */  bc1f    .L809CEC54                 
/* 00568 809CEC48 00000000 */  nop
/* 0056C 809CEC4C 10000003 */  beq     $zero, $zero, .L809CEC5C   
/* 00570 809CEC50 E60E0068 */  swc1    $f14, 0x0068($s0)          ## 00000068
.L809CEC54:
/* 00574 809CEC54 46007187 */  neg.s   $f6, $f14                  
/* 00578 809CEC58 E6060068 */  swc1    $f6, 0x0068($s0)           ## 00000068
.L809CEC5C:
/* 0057C 809CEC5C 92180221 */  lbu     $t8, 0x0221($s0)           ## 00000221
/* 00580 809CEC60 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 00584 809CEC64 53010013 */  beql    $t8, $at, .L809CECB4       
/* 00588 809CEC68 8FAB007C */  lw      $t3, 0x007C($sp)           
/* 0058C 809CEC6C 0C0329C8 */  jal     func_800CA720              
/* 00590 809CEC70 C60C0240 */  lwc1    $f12, 0x0240($s0)          ## 00000240
/* 00594 809CEC74 44804000 */  mtc1    $zero, $f8                 ## $f8 = 0.00
/* 00598 809CEC78 3C0142AA */  lui     $at, 0x42AA                ## $at = 42AA0000
/* 0059C 809CEC7C 44818000 */  mtc1    $at, $f16                  ## $f16 = 85.00
/* 005A0 809CEC80 4600403E */  c.le.s  $f8, $f0                   
/* 005A4 809CEC84 00000000 */  nop
/* 005A8 809CEC88 45020004 */  bc1fl   .L809CEC9C                 
/* 005AC 809CEC8C 46000087 */  neg.s   $f2, $f0                   
/* 005B0 809CEC90 10000002 */  beq     $zero, $zero, .L809CEC9C   
/* 005B4 809CEC94 46000086 */  mov.s   $f2, $f0                   
/* 005B8 809CEC98 46000087 */  neg.s   $f2, $f0                   
.L809CEC9C:
/* 005BC 809CEC9C 46101282 */  mul.s   $f10, $f2, $f16            
/* 005C0 809CECA0 4600548D */  trunc.w.s $f18, $f10                 
/* 005C4 809CECA4 440A9000 */  mfc1    $t2, $f18                  
/* 005C8 809CECA8 00000000 */  nop
/* 005CC 809CECAC A20A022D */  sb      $t2, 0x022D($s0)           ## 0000022D
/* 005D0 809CECB0 8FAB007C */  lw      $t3, 0x007C($sp)           
.L809CECB4:
/* 005D4 809CECB4 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 005D8 809CECB8 3C0E0001 */  lui     $t6, 0x0001                ## $t6 = 00010000
/* 005DC 809CECBC 01616021 */  addu    $t4, $t3, $at              
/* 005E0 809CECC0 AFAC003C */  sw      $t4, 0x003C($sp)           
/* 005E4 809CECC4 01CB7021 */  addu    $t6, $t6, $t3              
/* 005E8 809CECC8 8DCE1DE4 */  lw      $t6, 0x1DE4($t6)           ## 00011DE4
/* 005EC 809CECCC 860D001C */  lh      $t5, 0x001C($s0)           ## 0000001C
/* 005F0 809CECD0 31CF0003 */  andi    $t7, $t6, 0x0003           ## $t7 = 00000000
/* 005F4 809CECD4 55AF0015 */  bnel    $t5, $t7, .L809CED2C       
/* 005F8 809CECD8 86090222 */  lh      $t1, 0x0222($s0)           ## 00000222
/* 005FC 809CECDC 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 00600 809CECE0 C6060068 */  lwc1    $f6, 0x0068($s0)           ## 00000068
/* 00604 809CECE4 256407C0 */  addiu   $a0, $t3, 0x07C0           ## $a0 = 000007C0
/* 00608 809CECE8 26050024 */  addiu   $a1, $s0, 0x0024           ## $a1 = 00000024
/* 0060C 809CECEC 46062032 */  c.eq.s  $f4, $f6                   
/* 00610 809CECF0 26060264 */  addiu   $a2, $s0, 0x0264           ## $a2 = 00000264
/* 00614 809CECF4 27A70068 */  addiu   $a3, $sp, 0x0068           ## $a3 = FFFFFFF0
/* 00618 809CECF8 27B80074 */  addiu   $t8, $sp, 0x0074           ## $t8 = FFFFFFFC
/* 0061C 809CECFC 4501000A */  bc1t    .L809CED28                 
/* 00620 809CED00 24190001 */  addiu   $t9, $zero, 0x0001         ## $t9 = 00000001
/* 00624 809CED04 24080001 */  addiu   $t0, $zero, 0x0001         ## $t0 = 00000001
/* 00628 809CED08 AFA80020 */  sw      $t0, 0x0020($sp)           
/* 0062C 809CED0C AFB80010 */  sw      $t8, 0x0010($sp)           
/* 00630 809CED10 AFB90014 */  sw      $t9, 0x0014($sp)           
/* 00634 809CED14 AFA00018 */  sw      $zero, 0x0018($sp)         
/* 00638 809CED18 0C00F83F */  jal     func_8003E0FC              
/* 0063C 809CED1C AFA0001C */  sw      $zero, 0x001C($sp)         
/* 00640 809CED20 14400004 */  bne     $v0, $zero, .L809CED34     
/* 00644 809CED24 AFA20064 */  sw      $v0, 0x0064($sp)           
.L809CED28:
/* 00648 809CED28 86090222 */  lh      $t1, 0x0222($s0)           ## 00000222
.L809CED2C:
/* 0064C 809CED2C 552000AC */  bnel    $t1, $zero, .L809CEFE0     
/* 00650 809CED30 44808000 */  mtc1    $zero, $f16                ## $f16 = 0.00
.L809CED34:
/* 00654 809CED34 8FAA0074 */  lw      $t2, 0x0074($sp)           
/* 00658 809CED38 8FAC0074 */  lw      $t4, 0x0074($sp)           
/* 0065C 809CED3C 3C0B8016 */  lui     $t3, %hi(gSegments)
/* 00660 809CED40 11400020 */  beq     $t2, $zero, .L809CEDC4     
/* 00664 809CED44 000C7100 */  sll     $t6, $t4,  4               
/* 00668 809CED48 000E6F02 */  srl     $t5, $t6, 28               
/* 0066C 809CED4C 000D7880 */  sll     $t7, $t5,  2               
/* 00670 809CED50 016F5821 */  addu    $t3, $t3, $t7              
/* 00674 809CED54 3C0100FF */  lui     $at, 0x00FF                ## $at = 00FF0000
/* 00678 809CED58 8D6B6FA8 */  lw      $t3, %lo(gSegments)($t3)
/* 0067C 809CED5C 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = 00FFFFFF
/* 00680 809CED60 0181C024 */  and     $t8, $t4, $at              
/* 00684 809CED64 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 00688 809CED68 0178C821 */  addu    $t9, $t3, $t8              
/* 0068C 809CED6C 03214021 */  addu    $t0, $t9, $at              
/* 00690 809CED70 AFA80074 */  sw      $t0, 0x0074($sp)           
/* 00694 809CED74 3C098000 */  lui     $t1, %hi(D_80000008)
/* 00698 809CED78 3C0A8000 */  lui     $t2, %hi(D_8000000C)
/* 0069C 809CED7C 01595021 */  addu    $t2, $t2, $t9              
/* 006A0 809CED80 01394821 */  addu    $t1, $t1, $t9              
/* 006A4 809CED84 85290008 */  lh      $t1, %lo(D_80000008)($t1)
/* 006A8 809CED88 854A000C */  lh      $t2, %lo(D_8000000C)($t2)
/* 006AC 809CED8C 44894000 */  mtc1    $t1, $f8                   ## $f8 = -0.00
/* 006B0 809CED90 448A8000 */  mtc1    $t2, $f16                  ## $f16 = -0.00
/* 006B4 809CED94 46804320 */  cvt.s.w $f12, $f8                  
/* 006B8 809CED98 0C03F494 */  jal     Math_atan2f              
/* 006BC 809CED9C 468083A0 */  cvt.s.w $f14, $f16                 
/* 006C0 809CEDA0 3C01809D */  lui     $at, %hi(D_809D15EC)       ## $at = 809D0000
/* 006C4 809CEDA4 C42A15EC */  lwc1    $f10, %lo(D_809D15EC)($at) 
/* 006C8 809CEDA8 460A0482 */  mul.s   $f18, $f0, $f10            
/* 006CC 809CEDAC 4600910D */  trunc.w.s $f4, $f18                  
/* 006D0 809CEDB0 44032000 */  mfc1    $v1, $f4                   
/* 006D4 809CEDB4 00000000 */  nop
/* 006D8 809CEDB8 00031C00 */  sll     $v1, $v1, 16               
/* 006DC 809CEDBC 10000006 */  beq     $zero, $zero, .L809CEDD8   
/* 006E0 809CEDC0 00031C03 */  sra     $v1, $v1, 16               
.L809CEDC4:
/* 006E4 809CEDC4 86030032 */  lh      $v1, 0x0032($s0)           ## 00000032
/* 006E8 809CEDC8 34018000 */  ori     $at, $zero, 0x8000         ## $at = 00008000
/* 006EC 809CEDCC 00611821 */  addu    $v1, $v1, $at              
/* 006F0 809CEDD0 00031C00 */  sll     $v1, $v1, 16               
/* 006F4 809CEDD4 00031C03 */  sra     $v1, $v1, 16               
.L809CEDD8:
/* 006F8 809CEDD8 860D0236 */  lh      $t5, 0x0236($s0)           ## 00000236
/* 006FC 809CEDDC 8FA4007C */  lw      $a0, 0x007C($sp)           
/* 00700 809CEDE0 8FAF0064 */  lw      $t7, 0x0064($sp)           
/* 00704 809CEDE4 146D0002 */  bne     $v1, $t5, .L809CEDF0       
/* 00708 809CEDE8 248407C0 */  addiu   $a0, $a0, 0x07C0           ## $a0 = 000007C0
/* 0070C 809CEDEC 15E000FC */  bne     $t7, $zero, .L809CF1E0     
.L809CEDF0:
/* 00710 809CEDF0 26050270 */  addiu   $a1, $s0, 0x0270           ## $a1 = 00000270
/* 00714 809CEDF4 27AC0074 */  addiu   $t4, $sp, 0x0074           ## $t4 = FFFFFFFC
/* 00718 809CEDF8 240B0001 */  addiu   $t3, $zero, 0x0001         ## $t3 = 00000001
/* 0071C 809CEDFC 24180001 */  addiu   $t8, $zero, 0x0001         ## $t8 = 00000001
/* 00720 809CEE00 AFB80020 */  sw      $t8, 0x0020($sp)           
/* 00724 809CEE04 AFAB0014 */  sw      $t3, 0x0014($sp)           
/* 00728 809CEE08 AFAC0010 */  sw      $t4, 0x0010($sp)           
/* 0072C 809CEE0C AFA50038 */  sw      $a1, 0x0038($sp)           
/* 00730 809CEE10 26060288 */  addiu   $a2, $s0, 0x0288           ## $a2 = 00000288
/* 00734 809CEE14 27A70068 */  addiu   $a3, $sp, 0x0068           ## $a3 = FFFFFFF0
/* 00738 809CEE18 AFA00018 */  sw      $zero, 0x0018($sp)         
/* 0073C 809CEE1C AFA0001C */  sw      $zero, 0x001C($sp)         
/* 00740 809CEE20 A7A30062 */  sh      $v1, 0x0062($sp)           
/* 00744 809CEE24 0C00F83F */  jal     func_8003E0FC              
/* 00748 809CEE28 AFA40040 */  sw      $a0, 0x0040($sp)           
/* 0074C 809CEE2C 87A30062 */  lh      $v1, 0x0062($sp)           
/* 00750 809CEE30 8FA40040 */  lw      $a0, 0x0040($sp)           
/* 00754 809CEE34 10400004 */  beq     $v0, $zero, .L809CEE48     
/* 00758 809CEE38 8FA50038 */  lw      $a1, 0x0038($sp)           
/* 0075C 809CEE3C 8FA80064 */  lw      $t0, 0x0064($sp)           
/* 00760 809CEE40 35090002 */  ori     $t1, $t0, 0x0002           ## $t1 = 00000002
/* 00764 809CEE44 AFA90064 */  sw      $t1, 0x0064($sp)           
.L809CEE48:
/* 00768 809CEE48 27B90074 */  addiu   $t9, $sp, 0x0074           ## $t9 = FFFFFFFC
/* 0076C 809CEE4C 240A0001 */  addiu   $t2, $zero, 0x0001         ## $t2 = 00000001
/* 00770 809CEE50 240E0001 */  addiu   $t6, $zero, 0x0001         ## $t6 = 00000001
/* 00774 809CEE54 AFAE0020 */  sw      $t6, 0x0020($sp)           
/* 00778 809CEE58 AFAA0014 */  sw      $t2, 0x0014($sp)           
/* 0077C 809CEE5C AFB90010 */  sw      $t9, 0x0010($sp)           
/* 00780 809CEE60 2606027C */  addiu   $a2, $s0, 0x027C           ## $a2 = 0000027C
/* 00784 809CEE64 27A70068 */  addiu   $a3, $sp, 0x0068           ## $a3 = FFFFFFF0
/* 00788 809CEE68 AFA00018 */  sw      $zero, 0x0018($sp)         
/* 0078C 809CEE6C AFA0001C */  sw      $zero, 0x001C($sp)         
/* 00790 809CEE70 0C00F83F */  jal     func_8003E0FC              
/* 00794 809CEE74 A7A30062 */  sh      $v1, 0x0062($sp)           
/* 00798 809CEE78 10400004 */  beq     $v0, $zero, .L809CEE8C     
/* 0079C 809CEE7C 87A30062 */  lh      $v1, 0x0062($sp)           
/* 007A0 809CEE80 8FAD0064 */  lw      $t5, 0x0064($sp)           
/* 007A4 809CEE84 35AF0004 */  ori     $t7, $t5, 0x0004           ## $t7 = 00000004
/* 007A8 809CEE88 AFAF0064 */  sw      $t7, 0x0064($sp)           
.L809CEE8C:
/* 007AC 809CEE8C 8FAC0064 */  lw      $t4, 0x0064($sp)           
/* 007B0 809CEE90 2D810008 */  sltiu   $at, $t4, 0x0008           
/* 007B4 809CEE94 10200041 */  beq     $at, $zero, .L809CEF9C     
/* 007B8 809CEE98 000C6080 */  sll     $t4, $t4,  2               
/* 007BC 809CEE9C 3C01809D */  lui     $at, %hi(jtbl_809D15F0)       ## $at = 809D0000
/* 007C0 809CEEA0 002C0821 */  addu    $at, $at, $t4              
/* 007C4 809CEEA4 8C2C15F0 */  lw      $t4, %lo(jtbl_809D15F0)($at)  
/* 007C8 809CEEA8 01800008 */  jr      $t4                        
/* 007CC 809CEEAC 00000000 */  nop
glabel L809CEEB0
/* 007D0 809CEEB0 860B0236 */  lh      $t3, 0x0236($s0)           ## 00000236
/* 007D4 809CEEB4 86180238 */  lh      $t8, 0x0238($s0)           ## 00000238
/* 007D8 809CEEB8 01784021 */  addu    $t0, $t3, $t8              
/* 007DC 809CEEBC A6080236 */  sh      $t0, 0x0236($s0)           ## 00000236
glabel L809CEEC0
/* 007E0 809CEEC0 92090221 */  lbu     $t1, 0x0221($s0)           ## 00000221
/* 007E4 809CEEC4 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
/* 007E8 809CEEC8 8FB9003C */  lw      $t9, 0x003C($sp)           
/* 007EC 809CEECC 5521000C */  bnel    $t1, $at, .L809CEF00       
/* 007F0 809CEED0 860C008A */  lh      $t4, 0x008A($s0)           ## 0000008A
/* 007F4 809CEED4 8F2A1DE4 */  lw      $t2, 0x1DE4($t9)           ## 00001DE4
/* 007F8 809CEED8 240D4000 */  addiu   $t5, $zero, 0x4000         ## $t5 = 00004000
/* 007FC 809CEEDC 240FC000 */  addiu   $t7, $zero, 0xC000         ## $t7 = FFFFC000
/* 00800 809CEEE0 314E0002 */  andi    $t6, $t2, 0x0002           ## $t6 = 00000000
/* 00804 809CEEE4 11C00003 */  beq     $t6, $zero, .L809CEEF4     
/* 00808 809CEEE8 00000000 */  nop
/* 0080C 809CEEEC 1000002B */  beq     $zero, $zero, .L809CEF9C   
/* 00810 809CEEF0 A60D0238 */  sh      $t5, 0x0238($s0)           ## 00000238
.L809CEEF4:
/* 00814 809CEEF4 10000029 */  beq     $zero, $zero, .L809CEF9C   
/* 00818 809CEEF8 A60F0238 */  sh      $t7, 0x0238($s0)           ## 00000238
/* 0081C 809CEEFC 860C008A */  lh      $t4, 0x008A($s0)           ## 0000008A
.L809CEF00:
/* 00820 809CEF00 860B00B6 */  lh      $t3, 0x00B6($s0)           ## 000000B6
/* 00824 809CEF04 44808000 */  mtc1    $zero, $f16                ## $f16 = 0.00
/* 00828 809CEF08 24194000 */  addiu   $t9, $zero, 0x4000         ## $t9 = 00004000
/* 0082C 809CEF0C 018BC023 */  subu    $t8, $t4, $t3              
/* 00830 809CEF10 00184400 */  sll     $t0, $t8, 16               
/* 00834 809CEF14 00084C03 */  sra     $t1, $t0, 16               
/* 00838 809CEF18 44893000 */  mtc1    $t1, $f6                   ## $f6 = 0.00
/* 0083C 809CEF1C 240AC000 */  addiu   $t2, $zero, 0xC000         ## $t2 = FFFFC000
/* 00840 809CEF20 46803220 */  cvt.s.w $f8, $f6                   
/* 00844 809CEF24 4608803E */  c.le.s  $f16, $f8                  
/* 00848 809CEF28 00000000 */  nop
/* 0084C 809CEF2C 45020004 */  bc1fl   .L809CEF40                 
/* 00850 809CEF30 A60A0238 */  sh      $t2, 0x0238($s0)           ## 00000238
/* 00854 809CEF34 10000002 */  beq     $zero, $zero, .L809CEF40   
/* 00858 809CEF38 A6190238 */  sh      $t9, 0x0238($s0)           ## 00000238
/* 0085C 809CEF3C A60A0238 */  sh      $t2, 0x0238($s0)           ## 00000238
.L809CEF40:
/* 00860 809CEF40 920E0221 */  lbu     $t6, 0x0221($s0)           ## 00000221
/* 00864 809CEF44 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 00868 809CEF48 55C10015 */  bnel    $t6, $at, .L809CEFA0       
/* 0086C 809CEF4C 8FAD0064 */  lw      $t5, 0x0064($sp)           
/* 00870 809CEF50 860D0238 */  lh      $t5, 0x0238($s0)           ## 00000238
/* 00874 809CEF54 000D7823 */  subu    $t7, $zero, $t5            
/* 00878 809CEF58 10000010 */  beq     $zero, $zero, .L809CEF9C   
/* 0087C 809CEF5C A60F0238 */  sh      $t7, 0x0238($s0)           ## 00000238
glabel L809CEF60
/* 00880 809CEF60 860C0236 */  lh      $t4, 0x0236($s0)           ## 00000236
/* 00884 809CEF64 860B0238 */  lh      $t3, 0x0238($s0)           ## 00000238
/* 00888 809CEF68 018BC021 */  addu    $t8, $t4, $t3              
/* 0088C 809CEF6C A6180236 */  sh      $t8, 0x0236($s0)           ## 00000236
glabel L809CEF70
/* 00890 809CEF70 24084000 */  addiu   $t0, $zero, 0x4000         ## $t0 = 00004000
/* 00894 809CEF74 10000009 */  beq     $zero, $zero, .L809CEF9C   
/* 00898 809CEF78 A6080238 */  sh      $t0, 0x0238($s0)           ## 00000238
glabel L809CEF7C
/* 0089C 809CEF7C 86090236 */  lh      $t1, 0x0236($s0)           ## 00000236
/* 008A0 809CEF80 86190238 */  lh      $t9, 0x0238($s0)           ## 00000238
/* 008A4 809CEF84 01395021 */  addu    $t2, $t1, $t9              
/* 008A8 809CEF88 A60A0236 */  sh      $t2, 0x0236($s0)           ## 00000236
glabel L809CEF8C
/* 008AC 809CEF8C 240EC000 */  addiu   $t6, $zero, 0xC000         ## $t6 = FFFFC000
/* 008B0 809CEF90 10000002 */  beq     $zero, $zero, .L809CEF9C   
/* 008B4 809CEF94 A60E0238 */  sh      $t6, 0x0238($s0)           ## 00000238
glabel L809CEF98
/* 008B8 809CEF98 A6000238 */  sh      $zero, 0x0238($s0)         ## 00000238
glabel L809CEF9C
.L809CEF9C:
/* 008BC 809CEF9C 8FAD0064 */  lw      $t5, 0x0064($sp)           
.L809CEFA0:
/* 008C0 809CEFA0 24010006 */  addiu   $at, $zero, 0x0006         ## $at = 00000006
/* 008C4 809CEFA4 11A10002 */  beq     $t5, $at, .L809CEFB0       
/* 008C8 809CEFA8 00000000 */  nop
/* 008CC 809CEFAC A6030236 */  sh      $v1, 0x0236($s0)           ## 00000236
.L809CEFB0:
/* 008D0 809CEFB0 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 008D4 809CEFB4 00000000 */  nop
/* 008D8 809CEFB8 3C014348 */  lui     $at, 0x4348                ## $at = 43480000
/* 008DC 809CEFBC 44815000 */  mtc1    $at, $f10                  ## $f10 = 200.00
/* 008E0 809CEFC0 44812000 */  mtc1    $at, $f4                   ## $f4 = 200.00
/* 008E4 809CEFC4 460A0482 */  mul.s   $f18, $f0, $f10            
/* 008E8 809CEFC8 46049180 */  add.s   $f6, $f18, $f4             
/* 008EC 809CEFCC 4600320D */  trunc.w.s $f8, $f6                   
/* 008F0 809CEFD0 440C4000 */  mfc1    $t4, $f8                   
/* 008F4 809CEFD4 10000082 */  beq     $zero, $zero, .L809CF1E0   
/* 008F8 809CEFD8 A60C0222 */  sh      $t4, 0x0222($s0)           ## 00000222
/* 008FC 809CEFDC 44808000 */  mtc1    $zero, $f16                ## $f16 = 0.00
.L809CEFE0:
/* 00900 809CEFE0 C60A0068 */  lwc1    $f10, 0x0068($s0)          ## 00000068
/* 00904 809CEFE4 460A8032 */  c.eq.s  $f16, $f10                 
/* 00908 809CEFE8 00000000 */  nop
/* 0090C 809CEFEC 4503007D */  bc1tl   .L809CF1E4                 
/* 00910 809CEFF0 86080222 */  lh      $t0, 0x0222($s0)           ## 00000222
/* 00914 809CEFF4 960B0088 */  lhu     $t3, 0x0088($s0)           ## 00000088
/* 00918 809CEFF8 31780008 */  andi    $t8, $t3, 0x0008           ## $t8 = 00000000
/* 0091C 809CEFFC 53000079 */  beql    $t8, $zero, .L809CF1E4     
/* 00920 809CF000 86080222 */  lh      $t0, 0x0222($s0)           ## 00000222
/* 00924 809CF004 8603007E */  lh      $v1, 0x007E($s0)           ## 0000007E
/* 00928 809CF008 86080236 */  lh      $t0, 0x0236($s0)           ## 00000236
/* 0092C 809CF00C 92020221 */  lbu     $v0, 0x0221($s0)           ## 00000221
/* 00930 809CF010 24090001 */  addiu   $t1, $zero, 0x0001         ## $t1 = 00000001
/* 00934 809CF014 10680030 */  beq     $v1, $t0, .L809CF0D8       
/* 00938 809CF018 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
/* 0093C 809CF01C AFA90064 */  sw      $t1, 0x0064($sp)           
/* 00940 809CF020 14410019 */  bne     $v0, $at, .L809CF088       
/* 00944 809CF024 A6030236 */  sh      $v1, 0x0236($s0)           ## 00000236
/* 00948 809CF028 8FB9003C */  lw      $t9, 0x003C($sp)           
/* 0094C 809CF02C 240D4000 */  addiu   $t5, $zero, 0x4000         ## $t5 = 00004000
/* 00950 809CF030 240FC000 */  addiu   $t7, $zero, 0xC000         ## $t7 = FFFFC000
/* 00954 809CF034 8F2A1DE4 */  lw      $t2, 0x1DE4($t9)           ## 00001DE4
/* 00958 809CF038 314E0020 */  andi    $t6, $t2, 0x0020           ## $t6 = 00000000
/* 0095C 809CF03C 51C00004 */  beql    $t6, $zero, .L809CF050     
/* 00960 809CF040 A60F0238 */  sh      $t7, 0x0238($s0)           ## 00000238
/* 00964 809CF044 10000002 */  beq     $zero, $zero, .L809CF050   
/* 00968 809CF048 A60D0238 */  sh      $t5, 0x0238($s0)           ## 00000238
/* 0096C 809CF04C A60F0238 */  sh      $t7, 0x0238($s0)           ## 00000238
.L809CF050:
/* 00970 809CF050 960C0088 */  lhu     $t4, 0x0088($s0)           ## 00000088
/* 00974 809CF054 318BFFF7 */  andi    $t3, $t4, 0xFFF7           ## $t3 = 00000000
/* 00978 809CF058 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 0097C 809CF05C A60B0088 */  sh      $t3, 0x0088($s0)           ## 00000088
/* 00980 809CF060 3C0141A0 */  lui     $at, 0x41A0                ## $at = 41A00000
/* 00984 809CF064 44819000 */  mtc1    $at, $f18                  ## $f18 = 20.00
/* 00988 809CF068 3C014320 */  lui     $at, 0x4320                ## $at = 43200000
/* 0098C 809CF06C 44813000 */  mtc1    $at, $f6                   ## $f6 = 160.00
/* 00990 809CF070 46120102 */  mul.s   $f4, $f0, $f18             
/* 00994 809CF074 46062200 */  add.s   $f8, $f4, $f6              
/* 00998 809CF078 4600440D */  trunc.w.s $f16, $f8                  
/* 0099C 809CF07C 44088000 */  mfc1    $t0, $f16                  
/* 009A0 809CF080 10000057 */  beq     $zero, $zero, .L809CF1E0   
/* 009A4 809CF084 A6080222 */  sh      $t0, 0x0222($s0)           ## 00000222
.L809CF088:
/* 009A8 809CF088 8609008A */  lh      $t1, 0x008A($s0)           ## 0000008A
/* 009AC 809CF08C 86190236 */  lh      $t9, 0x0236($s0)           ## 00000236
/* 009B0 809CF090 240F4000 */  addiu   $t7, $zero, 0x4000         ## $t7 = 00004000
/* 009B4 809CF094 240CC000 */  addiu   $t4, $zero, 0xC000         ## $t4 = FFFFC000
/* 009B8 809CF098 01395023 */  subu    $t2, $t1, $t9              
/* 009BC 809CF09C 000A7400 */  sll     $t6, $t2, 16               
/* 009C0 809CF0A0 000E6C03 */  sra     $t5, $t6, 16               
/* 009C4 809CF0A4 05A20004 */  bltzl   $t5, .L809CF0B8            
/* 009C8 809CF0A8 A60C0238 */  sh      $t4, 0x0238($s0)           ## 00000238
/* 009CC 809CF0AC 10000002 */  beq     $zero, $zero, .L809CF0B8   
/* 009D0 809CF0B0 A60F0238 */  sh      $t7, 0x0238($s0)           ## 00000238
/* 009D4 809CF0B4 A60C0238 */  sh      $t4, 0x0238($s0)           ## 00000238
.L809CF0B8:
/* 009D8 809CF0B8 920B0221 */  lbu     $t3, 0x0221($s0)           ## 00000221
/* 009DC 809CF0BC 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 009E0 809CF0C0 55610048 */  bnel    $t3, $at, .L809CF1E4       
/* 009E4 809CF0C4 86080222 */  lh      $t0, 0x0222($s0)           ## 00000222
/* 009E8 809CF0C8 86180238 */  lh      $t8, 0x0238($s0)           ## 00000238
/* 009EC 809CF0CC 00184023 */  subu    $t0, $zero, $t8            
/* 009F0 809CF0D0 10000043 */  beq     $zero, $zero, .L809CF1E0   
/* 009F4 809CF0D4 A6080238 */  sh      $t0, 0x0238($s0)           ## 00000238
.L809CF0D8:
/* 009F8 809CF0D8 14400041 */  bne     $v0, $zero, .L809CF1E0     
/* 009FC 809CF0DC 8FA4007C */  lw      $a0, 0x007C($sp)           
/* 00A00 809CF0E0 8FA60054 */  lw      $a2, 0x0054($sp)           
/* 00A04 809CF0E4 27A90074 */  addiu   $t1, $sp, 0x0074           ## $t1 = FFFFFFFC
/* 00A08 809CF0E8 24190001 */  addiu   $t9, $zero, 0x0001         ## $t9 = 00000001
/* 00A0C 809CF0EC 240A0001 */  addiu   $t2, $zero, 0x0001         ## $t2 = 00000001
/* 00A10 809CF0F0 AFAA0020 */  sw      $t2, 0x0020($sp)           
/* 00A14 809CF0F4 AFB90014 */  sw      $t9, 0x0014($sp)           
/* 00A18 809CF0F8 AFA90010 */  sw      $t1, 0x0010($sp)           
/* 00A1C 809CF0FC 248407C0 */  addiu   $a0, $a0, 0x07C0           ## $a0 = 000007C0
/* 00A20 809CF100 26050024 */  addiu   $a1, $s0, 0x0024           ## $a1 = 00000024
/* 00A24 809CF104 27A70068 */  addiu   $a3, $sp, 0x0068           ## $a3 = FFFFFFF0
/* 00A28 809CF108 AFA00018 */  sw      $zero, 0x0018($sp)         
/* 00A2C 809CF10C AFA0001C */  sw      $zero, 0x001C($sp)         
/* 00A30 809CF110 0C00F83F */  jal     func_8003E0FC              
/* 00A34 809CF114 24C60024 */  addiu   $a2, $a2, 0x0024           ## $a2 = 00000024
/* 00A38 809CF118 10400031 */  beq     $v0, $zero, .L809CF1E0     
/* 00A3C 809CF11C AFA20064 */  sw      $v0, 0x0064($sp)           
/* 00A40 809CF120 8FAE0074 */  lw      $t6, 0x0074($sp)           
/* 00A44 809CF124 3C0B8016 */  lui     $t3, %hi(gSegments)
/* 00A48 809CF128 3C0100FF */  lui     $at, 0x00FF                ## $at = 00FF0000
/* 00A4C 809CF12C 000E6900 */  sll     $t5, $t6,  4               
/* 00A50 809CF130 000D7F02 */  srl     $t7, $t5, 28               
/* 00A54 809CF134 000F6080 */  sll     $t4, $t7,  2               
/* 00A58 809CF138 016C5821 */  addu    $t3, $t3, $t4              
/* 00A5C 809CF13C 8D6B6FA8 */  lw      $t3, %lo(gSegments)($t3)
/* 00A60 809CF140 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = 00FFFFFF
/* 00A64 809CF144 01C1C024 */  and     $t8, $t6, $at              
/* 00A68 809CF148 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 00A6C 809CF14C 01784021 */  addu    $t0, $t3, $t8              
/* 00A70 809CF150 01014821 */  addu    $t1, $t0, $at              
/* 00A74 809CF154 AFA90074 */  sw      $t1, 0x0074($sp)           
/* 00A78 809CF158 3C198000 */  lui     $t9, %hi(D_80000008)
/* 00A7C 809CF15C 3C0A8000 */  lui     $t2, %hi(D_8000000C)
/* 00A80 809CF160 01485021 */  addu    $t2, $t2, $t0              
/* 00A84 809CF164 0328C821 */  addu    $t9, $t9, $t0              
/* 00A88 809CF168 87390008 */  lh      $t9, %lo(D_80000008)($t9)
/* 00A8C 809CF16C 854A000C */  lh      $t2, %lo(D_8000000C)($t2)
/* 00A90 809CF170 44995000 */  mtc1    $t9, $f10                  ## $f10 = -0.00
/* 00A94 809CF174 448A9000 */  mtc1    $t2, $f18                  ## $f18 = -0.00
/* 00A98 809CF178 46805320 */  cvt.s.w $f12, $f10                 
/* 00A9C 809CF17C 0C03F494 */  jal     Math_atan2f              
/* 00AA0 809CF180 468093A0 */  cvt.s.w $f14, $f18                 
/* 00AA4 809CF184 3C01809D */  lui     $at, %hi(D_809D1610)       ## $at = 809D0000
/* 00AA8 809CF188 C4241610 */  lwc1    $f4, %lo(D_809D1610)($at)  
/* 00AAC 809CF18C 860F0236 */  lh      $t7, 0x0236($s0)           ## 00000236
/* 00AB0 809CF190 46040182 */  mul.s   $f6, $f0, $f4              
/* 00AB4 809CF194 4600320D */  trunc.w.s $f8, $f6                   
/* 00AB8 809CF198 44024000 */  mfc1    $v0, $f8                   
/* 00ABC 809CF19C 00000000 */  nop
/* 00AC0 809CF1A0 00021400 */  sll     $v0, $v0, 16               
/* 00AC4 809CF1A4 00021403 */  sra     $v0, $v0, 16               
/* 00AC8 809CF1A8 504F000E */  beql    $v0, $t7, .L809CF1E4       
/* 00ACC 809CF1AC 86080222 */  lh      $t0, 0x0222($s0)           ## 00000222
/* 00AD0 809CF1B0 860C008A */  lh      $t4, 0x008A($s0)           ## 0000008A
/* 00AD4 809CF1B4 24094000 */  addiu   $t1, $zero, 0x4000         ## $t1 = 00004000
/* 00AD8 809CF1B8 2419C000 */  addiu   $t9, $zero, 0xC000         ## $t9 = FFFFC000
/* 00ADC 809CF1BC 01827023 */  subu    $t6, $t4, $v0              
/* 00AE0 809CF1C0 000E5C00 */  sll     $t3, $t6, 16               
/* 00AE4 809CF1C4 000BC403 */  sra     $t8, $t3, 16               
/* 00AE8 809CF1C8 07020004 */  bltzl   $t8, .L809CF1DC            
/* 00AEC 809CF1CC A6190238 */  sh      $t9, 0x0238($s0)           ## 00000238
/* 00AF0 809CF1D0 10000002 */  beq     $zero, $zero, .L809CF1DC   
/* 00AF4 809CF1D4 A6090238 */  sh      $t1, 0x0238($s0)           ## 00000238
/* 00AF8 809CF1D8 A6190238 */  sh      $t9, 0x0238($s0)           ## 00000238
.L809CF1DC:
/* 00AFC 809CF1DC A6020236 */  sh      $v0, 0x0236($s0)           ## 00000236
.L809CF1E0:
/* 00B00 809CF1E0 86080222 */  lh      $t0, 0x0222($s0)           ## 00000222
.L809CF1E4:
/* 00B04 809CF1E4 86020224 */  lh      $v0, 0x0224($s0)           ## 00000224
/* 00B08 809CF1E8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00B0C 809CF1EC 250AFFFF */  addiu   $t2, $t0, 0xFFFF           ## $t2 = FFFFFFFF
/* 00B10 809CF1F0 10400003 */  beq     $v0, $zero, .L809CF200     
/* 00B14 809CF1F4 A60A0222 */  sh      $t2, 0x0222($s0)           ## 00000222
/* 00B18 809CF1F8 244DFFFF */  addiu   $t5, $v0, 0xFFFF           ## $t5 = FFFFFFFF
/* 00B1C 809CF1FC A60D0224 */  sh      $t5, 0x0224($s0)           ## 00000224
.L809CF200:
/* 00B20 809CF200 860F0234 */  lh      $t7, 0x0234($s0)           ## 00000234
/* 00B24 809CF204 55E00014 */  bnel    $t7, $zero, .L809CF258     
/* 00B28 809CF208 92030221 */  lbu     $v1, 0x0221($s0)           ## 00000221
/* 00B2C 809CF20C 860C0236 */  lh      $t4, 0x0236($s0)           ## 00000236
/* 00B30 809CF210 860E0238 */  lh      $t6, 0x0238($s0)           ## 00000238
/* 00B34 809CF214 8FA5007C */  lw      $a1, 0x007C($sp)           
/* 00B38 809CF218 3C064248 */  lui     $a2, 0x4248                ## $a2 = 42480000
/* 00B3C 809CF21C 018E3821 */  addu    $a3, $t4, $t6              
/* 00B40 809CF220 00073C00 */  sll     $a3, $a3, 16               
/* 00B44 809CF224 0C00CE6E */  jal     func_800339B8              
/* 00B48 809CF228 00073C03 */  sra     $a3, $a3, 16               
/* 00B4C 809CF22C 5440000A */  bnel    $v0, $zero, .L809CF258     
/* 00B50 809CF230 92030221 */  lbu     $v1, 0x0221($s0)           ## 00000221
/* 00B54 809CF234 860B0238 */  lh      $t3, 0x0238($s0)           ## 00000238
/* 00B58 809CF238 24014000 */  addiu   $at, $zero, 0x4000         ## $at = 00004000
/* 00B5C 809CF23C 24184000 */  addiu   $t8, $zero, 0x4000         ## $t8 = 00004000
/* 00B60 809CF240 11610003 */  beq     $t3, $at, .L809CF250       
/* 00B64 809CF244 2409C000 */  addiu   $t1, $zero, 0xC000         ## $t1 = FFFFC000
/* 00B68 809CF248 10000002 */  beq     $zero, $zero, .L809CF254   
/* 00B6C 809CF24C A6180238 */  sh      $t8, 0x0238($s0)           ## 00000238
.L809CF250:
/* 00B70 809CF250 A6090238 */  sh      $t1, 0x0238($s0)           ## 00000238
.L809CF254:
/* 00B74 809CF254 92030221 */  lbu     $v1, 0x0221($s0)           ## 00000221
.L809CF258:
/* 00B78 809CF258 3C053F19 */  lui     $a1, 0x3F19                ## $a1 = 3F190000
/* 00B7C 809CF25C 34A5999A */  ori     $a1, $a1, 0x999A           ## $a1 = 3F19999A
/* 00B80 809CF260 10600045 */  beq     $v1, $zero, .L809CF378     
/* 00B84 809CF264 26040248 */  addiu   $a0, $s0, 0x0248           ## $a0 = 00000248
/* 00B88 809CF268 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 00B8C 809CF26C 106100A6 */  beq     $v1, $at, .L809CF508       
/* 00B90 809CF270 8FAC0064 */  lw      $t4, 0x0064($sp)           
/* 00B94 809CF274 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
/* 00B98 809CF278 14610125 */  bne     $v1, $at, .L809CF710       
/* 00B9C 809CF27C 26040248 */  addiu   $a0, $s0, 0x0248           ## $a0 = 00000248
/* 00BA0 809CF280 44808000 */  mtc1    $zero, $f16                ## $f16 = 0.00
/* 00BA4 809CF284 3C053F19 */  lui     $a1, 0x3F19                ## $a1 = 3F190000
/* 00BA8 809CF288 3C073D4C */  lui     $a3, 0x3D4C                ## $a3 = 3D4C0000
/* 00BAC 809CF28C 34E7CCCD */  ori     $a3, $a3, 0xCCCD           ## $a3 = 3D4CCCCD
/* 00BB0 809CF290 34A5999A */  ori     $a1, $a1, 0x999A           ## $a1 = 3F19999A
/* 00BB4 809CF294 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 00BB8 809CF298 0C01E0C4 */  jal     Math_SmoothScaleMaxMinF
              
/* 00BBC 809CF29C E7B00010 */  swc1    $f16, 0x0010($sp)          
/* 00BC0 809CF2A0 86190224 */  lh      $t9, 0x0224($s0)           ## 00000224
/* 00BC4 809CF2A4 3C014348 */  lui     $at, 0x4348                ## $at = 43480000
/* 00BC8 809CF2A8 57200020 */  bnel    $t9, $zero, .L809CF32C     
/* 00BCC 809CF2AC 3C01447A */  lui     $at, 0x447A                ## $at = 447A0000
/* 00BD0 809CF2B0 C60A0090 */  lwc1    $f10, 0x0090($s0)          ## 00000090
/* 00BD4 809CF2B4 44819000 */  mtc1    $at, $f18                  ## $f18 = 1000.00
/* 00BD8 809CF2B8 3C014248 */  lui     $at, 0x4248                ## $at = 42480000
/* 00BDC 809CF2BC 4612503C */  c.lt.s  $f10, $f18                 
/* 00BE0 809CF2C0 00000000 */  nop
/* 00BE4 809CF2C4 45020019 */  bc1fl   .L809CF32C                 
/* 00BE8 809CF2C8 3C01447A */  lui     $at, 0x447A                ## $at = 447A0000
/* 00BEC 809CF2CC C6000094 */  lwc1    $f0, 0x0094($s0)           ## 00000094
/* 00BF0 809CF2D0 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 00BF4 809CF2D4 44813000 */  mtc1    $at, $f6                   ## $f6 = 1000.00
/* 00BF8 809CF2D8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00BFC 809CF2DC 4600203E */  c.le.s  $f4, $f0                   
/* 00C00 809CF2E0 00000000 */  nop
/* 00C04 809CF2E4 45020004 */  bc1fl   .L809CF2F8                 
/* 00C08 809CF2E8 46000087 */  neg.s   $f2, $f0                   
/* 00C0C 809CF2EC 10000002 */  beq     $zero, $zero, .L809CF2F8   
/* 00C10 809CF2F0 46000086 */  mov.s   $f2, $f0                   
/* 00C14 809CF2F4 46000087 */  neg.s   $f2, $f0                   
.L809CF2F8:
/* 00C18 809CF2F8 4606103C */  c.lt.s  $f2, $f6                   
/* 00C1C 809CF2FC 00000000 */  nop
/* 00C20 809CF300 4502000A */  bc1fl   .L809CF32C                 
/* 00C24 809CF304 3C01447A */  lui     $at, 0x447A                ## $at = 447A0000
/* 00C28 809CF308 0C00B821 */  jal     func_8002E084              
/* 00C2C 809CF30C 24051C70 */  addiu   $a1, $zero, 0x1C70         ## $a1 = 00001C70
/* 00C30 809CF310 50400006 */  beql    $v0, $zero, .L809CF32C     
/* 00C34 809CF314 3C01447A */  lui     $at, 0x447A                ## $at = 447A0000
/* 00C38 809CF318 0C273DCB */  jal     func_809CF72C              
/* 00C3C 809CF31C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00C40 809CF320 100000FC */  beq     $zero, $zero, .L809CF714   
/* 00C44 809CF324 86090032 */  lh      $t1, 0x0032($s0)           ## 00000032
/* 00C48 809CF328 3C01447A */  lui     $at, 0x447A                ## $at = 447A0000
.L809CF32C:
/* 00C4C 809CF32C 44818000 */  mtc1    $at, $f16                  ## $f16 = 1000.00
/* 00C50 809CF330 C6080068 */  lwc1    $f8, 0x0068($s0)           ## 00000068
/* 00C54 809CF334 86080236 */  lh      $t0, 0x0236($s0)           ## 00000236
/* 00C58 809CF338 860A0238 */  lh      $t2, 0x0238($s0)           ## 00000238
/* 00C5C 809CF33C 46104282 */  mul.s   $f10, $f8, $f16            
/* 00C60 809CF340 AFA00010 */  sw      $zero, 0x0010($sp)         
/* 00C64 809CF344 010A2821 */  addu    $a1, $t0, $t2              
/* 00C68 809CF348 00052C00 */  sll     $a1, $a1, 16               
/* 00C6C 809CF34C 00052C03 */  sra     $a1, $a1, 16               
/* 00C70 809CF350 26040032 */  addiu   $a0, $s0, 0x0032           ## $a0 = 00000032
/* 00C74 809CF354 24060001 */  addiu   $a2, $zero, 0x0001         ## $a2 = 00000001
/* 00C78 809CF358 4600548D */  trunc.w.s $f18, $f10                 
/* 00C7C 809CF35C 44079000 */  mfc1    $a3, $f18                  
/* 00C80 809CF360 00000000 */  nop
/* 00C84 809CF364 00073C00 */  sll     $a3, $a3, 16               
/* 00C88 809CF368 0C01E1A7 */  jal     Math_SmoothScaleMaxMinS
              
/* 00C8C 809CF36C 00073C03 */  sra     $a3, $a3, 16               
/* 00C90 809CF370 100000E8 */  beq     $zero, $zero, .L809CF714   
/* 00C94 809CF374 86090032 */  lh      $t1, 0x0032($s0)           ## 00000032
.L809CF378:
/* 00C98 809CF378 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 00C9C 809CF37C 3C073D4C */  lui     $a3, 0x3D4C                ## $a3 = 3D4C0000
/* 00CA0 809CF380 34E7CCCD */  ori     $a3, $a3, 0xCCCD           ## $a3 = 3D4CCCCD
/* 00CA4 809CF384 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 00CA8 809CF388 0C01E0C4 */  jal     Math_SmoothScaleMaxMinF
              
/* 00CAC 809CF38C E7A40010 */  swc1    $f4, 0x0010($sp)           
/* 00CB0 809CF390 8FAF0064 */  lw      $t7, 0x0064($sp)           
/* 00CB4 809CF394 3C01447A */  lui     $at, 0x447A                ## $at = 447A0000
/* 00CB8 809CF398 55E0002E */  bnel    $t7, $zero, .L809CF454     
/* 00CBC 809CF39C C6100068 */  lwc1    $f16, 0x0068($s0)          ## 00000068
/* 00CC0 809CF3A0 3C01447A */  lui     $at, 0x447A                ## $at = 447A0000
/* 00CC4 809CF3A4 44814000 */  mtc1    $at, $f8                   ## $f8 = 1000.00
/* 00CC8 809CF3A8 C6060068 */  lwc1    $f6, 0x0068($s0)           ## 00000068
/* 00CCC 809CF3AC 8605008A */  lh      $a1, 0x008A($s0)           ## 0000008A
/* 00CD0 809CF3B0 AFA00010 */  sw      $zero, 0x0010($sp)         
/* 00CD4 809CF3B4 46083402 */  mul.s   $f16, $f6, $f8             
/* 00CD8 809CF3B8 26040032 */  addiu   $a0, $s0, 0x0032           ## $a0 = 00000032
/* 00CDC 809CF3BC 24060001 */  addiu   $a2, $zero, 0x0001         ## $a2 = 00000001
/* 00CE0 809CF3C0 4600828D */  trunc.w.s $f10, $f16                 
/* 00CE4 809CF3C4 44075000 */  mfc1    $a3, $f10                  
/* 00CE8 809CF3C8 00000000 */  nop
/* 00CEC 809CF3CC 00073C00 */  sll     $a3, $a3, 16               
/* 00CF0 809CF3D0 0C01E1A7 */  jal     Math_SmoothScaleMaxMinS
              
/* 00CF4 809CF3D4 00073C03 */  sra     $a3, $a3, 16               
/* 00CF8 809CF3D8 3C0142B4 */  lui     $at, 0x42B4                ## $at = 42B40000
/* 00CFC 809CF3DC 44812000 */  mtc1    $at, $f4                   ## $f4 = 90.00
/* 00D00 809CF3E0 C6120090 */  lwc1    $f18, 0x0090($s0)          ## 00000090
/* 00D04 809CF3E4 3C014248 */  lui     $at, 0x4248                ## $at = 42480000
/* 00D08 809CF3E8 4604903C */  c.lt.s  $f18, $f4                  
/* 00D0C 809CF3EC 00000000 */  nop
/* 00D10 809CF3F0 45020029 */  bc1fl   .L809CF498                 
/* 00D14 809CF3F4 86090224 */  lh      $t1, 0x0224($s0)           ## 00000224
/* 00D18 809CF3F8 C6060094 */  lwc1    $f6, 0x0094($s0)           ## 00000094
/* 00D1C 809CF3FC 44814000 */  mtc1    $at, $f8                   ## $f8 = 50.00
/* 00D20 809CF400 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00D24 809CF404 4608303C */  c.lt.s  $f6, $f8                   
/* 00D28 809CF408 00000000 */  nop
/* 00D2C 809CF40C 45020022 */  bc1fl   .L809CF498                 
/* 00D30 809CF410 86090224 */  lh      $t1, 0x0224($s0)           ## 00000224
/* 00D34 809CF414 0C00B821 */  jal     func_8002E084              
/* 00D38 809CF418 24051554 */  addiu   $a1, $zero, 0x1554         ## $a1 = 00001554
/* 00D3C 809CF41C 1040001D */  beq     $v0, $zero, .L809CF494     
/* 00D40 809CF420 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00D44 809CF424 3C06428E */  lui     $a2, 0x428E                ## $a2 = 428E0000
/* 00D48 809CF428 34C67EFC */  ori     $a2, $a2, 0x7EFC           ## $a2 = 428E7EFC
/* 00D4C 809CF42C 8FA5007C */  lw      $a1, 0x007C($sp)           
/* 00D50 809CF430 0C00CE6E */  jal     func_800339B8              
/* 00D54 809CF434 8607008A */  lh      $a3, 0x008A($s0)           ## 0000008A
/* 00D58 809CF438 50400017 */  beql    $v0, $zero, .L809CF498     
/* 00D5C 809CF43C 86090224 */  lh      $t1, 0x0224($s0)           ## 00000224
/* 00D60 809CF440 0C273E3C */  jal     func_809CF8F0              
/* 00D64 809CF444 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00D68 809CF448 10000013 */  beq     $zero, $zero, .L809CF498   
/* 00D6C 809CF44C 86090224 */  lh      $t1, 0x0224($s0)           ## 00000224
/* 00D70 809CF450 C6100068 */  lwc1    $f16, 0x0068($s0)          ## 00000068
.L809CF454:
/* 00D74 809CF454 44815000 */  mtc1    $at, $f10                  ## $f10 = 0.00
/* 00D78 809CF458 860E0236 */  lh      $t6, 0x0236($s0)           ## 00000236
/* 00D7C 809CF45C 860B0238 */  lh      $t3, 0x0238($s0)           ## 00000238
/* 00D80 809CF460 460A8482 */  mul.s   $f18, $f16, $f10           
/* 00D84 809CF464 AFA00010 */  sw      $zero, 0x0010($sp)         
/* 00D88 809CF468 01CB2821 */  addu    $a1, $t6, $t3              
/* 00D8C 809CF46C 00052C00 */  sll     $a1, $a1, 16               
/* 00D90 809CF470 00052C03 */  sra     $a1, $a1, 16               
/* 00D94 809CF474 26040032 */  addiu   $a0, $s0, 0x0032           ## $a0 = 00000032
/* 00D98 809CF478 24060001 */  addiu   $a2, $zero, 0x0001         ## $a2 = 00000001
/* 00D9C 809CF47C 4600910D */  trunc.w.s $f4, $f18                  
/* 00DA0 809CF480 44072000 */  mfc1    $a3, $f4                   
/* 00DA4 809CF484 00000000 */  nop
/* 00DA8 809CF488 00073C00 */  sll     $a3, $a3, 16               
/* 00DAC 809CF48C 0C01E1A7 */  jal     Math_SmoothScaleMaxMinS
              
/* 00DB0 809CF490 00073C03 */  sra     $a3, $a3, 16               
.L809CF494:
/* 00DB4 809CF494 86090224 */  lh      $t1, 0x0224($s0)           ## 00000224
.L809CF498:
/* 00DB8 809CF498 3C014270 */  lui     $at, 0x4270                ## $at = 42700000
/* 00DBC 809CF49C 240D0003 */  addiu   $t5, $zero, 0x0003         ## $t5 = 00000003
/* 00DC0 809CF4A0 11200014 */  beq     $t1, $zero, .L809CF4F4     
/* 00DC4 809CF4A4 240F0096 */  addiu   $t7, $zero, 0x0096         ## $t7 = 00000096
/* 00DC8 809CF4A8 C6000094 */  lwc1    $f0, 0x0094($s0)           ## 00000094
/* 00DCC 809CF4AC 44803000 */  mtc1    $zero, $f6                 ## $f6 = 0.00
/* 00DD0 809CF4B0 44814000 */  mtc1    $at, $f8                   ## $f8 = 60.00
/* 00DD4 809CF4B4 8FB90050 */  lw      $t9, 0x0050($sp)           
/* 00DD8 809CF4B8 4600303E */  c.le.s  $f6, $f0                   
/* 00DDC 809CF4BC 00000000 */  nop
/* 00DE0 809CF4C0 45020004 */  bc1fl   .L809CF4D4                 
/* 00DE4 809CF4C4 46000087 */  neg.s   $f2, $f0                   
/* 00DE8 809CF4C8 10000002 */  beq     $zero, $zero, .L809CF4D4   
/* 00DEC 809CF4CC 46000086 */  mov.s   $f2, $f0                   
/* 00DF0 809CF4D0 46000087 */  neg.s   $f2, $f0                   
.L809CF4D4:
/* 00DF4 809CF4D4 4602403C */  c.lt.s  $f8, $f2                   
/* 00DF8 809CF4D8 00000000 */  nop
/* 00DFC 809CF4DC 45030006 */  bc1tl   .L809CF4F8                 
/* 00E00 809CF4E0 44808000 */  mtc1    $zero, $f16                ## $f16 = 0.00
/* 00E04 809CF4E4 8F28067C */  lw      $t0, 0x067C($t9)           ## 0000067C
/* 00E08 809CF4E8 310A6000 */  andi    $t2, $t0, 0x6000           ## $t2 = 00000000
/* 00E0C 809CF4EC 51400089 */  beql    $t2, $zero, .L809CF714     
/* 00E10 809CF4F0 86090032 */  lh      $t1, 0x0032($s0)           ## 00000032
.L809CF4F4:
/* 00E14 809CF4F4 44808000 */  mtc1    $zero, $f16                ## $f16 = 0.00
.L809CF4F8:
/* 00E18 809CF4F8 A20D0221 */  sb      $t5, 0x0221($s0)           ## 00000221
/* 00E1C 809CF4FC A60F0224 */  sh      $t7, 0x0224($s0)           ## 00000224
/* 00E20 809CF500 10000083 */  beq     $zero, $zero, .L809CF710   
/* 00E24 809CF504 E6100250 */  swc1    $f16, 0x0250($s0)          ## 00000250
.L809CF508:
/* 00E28 809CF508 15800005 */  bne     $t4, $zero, .L809CF520     
/* 00E2C 809CF50C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00E30 809CF510 960E0088 */  lhu     $t6, 0x0088($s0)           ## 00000088
/* 00E34 809CF514 31CB0008 */  andi    $t3, $t6, 0x0008           ## $t3 = 00000000
/* 00E38 809CF518 51600006 */  beql    $t3, $zero, .L809CF534     
/* 00E3C 809CF51C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
.L809CF520:
/* 00E40 809CF520 0C00B821 */  jal     func_8002E084              
/* 00E44 809CF524 24051C70 */  addiu   $a1, $zero, 0x1C70         ## $a1 = 00001C70
/* 00E48 809CF528 1040001D */  beq     $v0, $zero, .L809CF5A0     
/* 00E4C 809CF52C 3C01447A */  lui     $at, 0x447A                ## $at = 447A0000
/* 00E50 809CF530 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
.L809CF534:
/* 00E54 809CF534 0C00B821 */  jal     func_8002E084              
/* 00E58 809CF538 24051C70 */  addiu   $a1, $zero, 0x1C70         ## $a1 = 00001C70
/* 00E5C 809CF53C 50400005 */  beql    $v0, $zero, .L809CF554     
/* 00E60 809CF540 8605008A */  lh      $a1, 0x008A($s0)           ## 0000008A
/* 00E64 809CF544 86180238 */  lh      $t8, 0x0238($s0)           ## 00000238
/* 00E68 809CF548 00184823 */  subu    $t1, $zero, $t8            
/* 00E6C 809CF54C A6090238 */  sh      $t1, 0x0238($s0)           ## 00000238
/* 00E70 809CF550 8605008A */  lh      $a1, 0x008A($s0)           ## 0000008A
.L809CF554:
/* 00E74 809CF554 24018000 */  addiu   $at, $zero, 0x8000         ## $at = FFFF8000
/* 00E78 809CF558 C60A0068 */  lwc1    $f10, 0x0068($s0)          ## 00000068
/* 00E7C 809CF55C 00A12821 */  addu    $a1, $a1, $at              
/* 00E80 809CF560 3C01447A */  lui     $at, 0x447A                ## $at = 447A0000
/* 00E84 809CF564 44819000 */  mtc1    $at, $f18                  ## $f18 = 1000.00
/* 00E88 809CF568 00052C00 */  sll     $a1, $a1, 16               
/* 00E8C 809CF56C 00052C03 */  sra     $a1, $a1, 16               
/* 00E90 809CF570 46125102 */  mul.s   $f4, $f10, $f18            
/* 00E94 809CF574 AFA00010 */  sw      $zero, 0x0010($sp)         
/* 00E98 809CF578 26040032 */  addiu   $a0, $s0, 0x0032           ## $a0 = 00000032
/* 00E9C 809CF57C 24060001 */  addiu   $a2, $zero, 0x0001         ## $a2 = 00000001
/* 00EA0 809CF580 4600218D */  trunc.w.s $f6, $f4                   
/* 00EA4 809CF584 44073000 */  mfc1    $a3, $f6                   
/* 00EA8 809CF588 00000000 */  nop
/* 00EAC 809CF58C 00073C00 */  sll     $a3, $a3, 16               
/* 00EB0 809CF590 0C01E1A7 */  jal     Math_SmoothScaleMaxMinS
              
/* 00EB4 809CF594 00073C03 */  sra     $a3, $a3, 16               
/* 00EB8 809CF598 10000013 */  beq     $zero, $zero, .L809CF5E8   
/* 00EBC 809CF59C 86020224 */  lh      $v0, 0x0224($s0)           ## 00000224
.L809CF5A0:
/* 00EC0 809CF5A0 C6080068 */  lwc1    $f8, 0x0068($s0)           ## 00000068
/* 00EC4 809CF5A4 44818000 */  mtc1    $at, $f16                  ## $f16 = 0.00
/* 00EC8 809CF5A8 86080236 */  lh      $t0, 0x0236($s0)           ## 00000236
/* 00ECC 809CF5AC 860A0238 */  lh      $t2, 0x0238($s0)           ## 00000238
/* 00ED0 809CF5B0 46104282 */  mul.s   $f10, $f8, $f16            
/* 00ED4 809CF5B4 AFA00010 */  sw      $zero, 0x0010($sp)         
/* 00ED8 809CF5B8 010A2821 */  addu    $a1, $t0, $t2              
/* 00EDC 809CF5BC 00052C00 */  sll     $a1, $a1, 16               
/* 00EE0 809CF5C0 00052C03 */  sra     $a1, $a1, 16               
/* 00EE4 809CF5C4 26040032 */  addiu   $a0, $s0, 0x0032           ## $a0 = 00000032
/* 00EE8 809CF5C8 24060001 */  addiu   $a2, $zero, 0x0001         ## $a2 = 00000001
/* 00EEC 809CF5CC 4600548D */  trunc.w.s $f18, $f10                 
/* 00EF0 809CF5D0 44079000 */  mfc1    $a3, $f18                  
/* 00EF4 809CF5D4 00000000 */  nop
/* 00EF8 809CF5D8 00073C00 */  sll     $a3, $a3, 16               
/* 00EFC 809CF5DC 0C01E1A7 */  jal     Math_SmoothScaleMaxMinS
              
/* 00F00 809CF5E0 00073C03 */  sra     $a3, $a3, 16               
/* 00F04 809CF5E4 86020224 */  lh      $v0, 0x0224($s0)           ## 00000224
.L809CF5E8:
/* 00F08 809CF5E8 240F0960 */  addiu   $t7, $zero, 0x0960         ## $t7 = 00000960
/* 00F0C 809CF5EC 284100C9 */  slti    $at, $v0, 0x00C9           
/* 00F10 809CF5F0 10200047 */  beq     $at, $zero, .L809CF710     
/* 00F14 809CF5F4 01E26023 */  subu    $t4, $t7, $v0              
/* 00F18 809CF5F8 004C0019 */  multu   $v0, $t4                   
/* 00F1C 809CF5FC 00002012 */  mflo    $a0                        
/* 00F20 809CF600 00042400 */  sll     $a0, $a0, 16               
/* 00F24 809CF604 0C01DE1C */  jal     Math_Sins
              ## sins?
/* 00F28 809CF608 00042403 */  sra     $a0, $a0, 16               
/* 00F2C 809CF60C 3C01425C */  lui     $at, 0x425C                ## $at = 425C0000
/* 00F30 809CF610 44812000 */  mtc1    $at, $f4                   ## $f4 = 55.00
/* 00F34 809CF614 00000000 */  nop
/* 00F38 809CF618 46040182 */  mul.s   $f6, $f0, $f4              
/* 00F3C 809CF61C 4600320D */  trunc.w.s $f8, $f6                   
/* 00F40 809CF620 44024000 */  mfc1    $v0, $f8                   
/* 00F44 809CF624 00000000 */  nop
/* 00F48 809CF628 00021400 */  sll     $v0, $v0, 16               
/* 00F4C 809CF62C 00021403 */  sra     $v0, $v0, 16               
/* 00F50 809CF630 04400003 */  bltz    $v0, .L809CF640            
/* 00F54 809CF634 00021823 */  subu    $v1, $zero, $v0            
/* 00F58 809CF638 10000001 */  beq     $zero, $zero, .L809CF640   
/* 00F5C 809CF63C 00401825 */  or      $v1, $v0, $zero            ## $v1 = 00000000
.L809CF640:
/* 00F60 809CF640 86020224 */  lh      $v0, 0x0224($s0)           ## 00000224
/* 00F64 809CF644 24090960 */  addiu   $t1, $zero, 0x0960         ## $t1 = 00000960
/* 00F68 809CF648 240B00FF */  addiu   $t3, $zero, 0x00FF         ## $t3 = 000000FF
/* 00F6C 809CF64C 0122C823 */  subu    $t9, $t1, $v0              
/* 00F70 809CF650 00590019 */  multu   $v0, $t9                   
/* 00F74 809CF654 0163C023 */  subu    $t8, $t3, $v1              
/* 00F78 809CF658 A218022C */  sb      $t8, 0x022C($s0)           ## 0000022C
/* 00F7C 809CF65C 00002012 */  mflo    $a0                        
/* 00F80 809CF660 00042400 */  sll     $a0, $a0, 16               
/* 00F84 809CF664 0C01DE1C */  jal     Math_Sins
              ## sins?
/* 00F88 809CF668 00042403 */  sra     $a0, $a0, 16               
/* 00F8C 809CF66C 3C0142E6 */  lui     $at, 0x42E6                ## $at = 42E60000
/* 00F90 809CF670 44818000 */  mtc1    $at, $f16                  ## $f16 = 115.00
/* 00F94 809CF674 240F0960 */  addiu   $t7, $zero, 0x0960         ## $t7 = 00000960
/* 00F98 809CF678 46100282 */  mul.s   $f10, $f0, $f16            
/* 00F9C 809CF67C 4600548D */  trunc.w.s $f18, $f10                 
/* 00FA0 809CF680 44029000 */  mfc1    $v0, $f18                  
/* 00FA4 809CF684 00000000 */  nop
/* 00FA8 809CF688 00021400 */  sll     $v0, $v0, 16               
/* 00FAC 809CF68C 00021403 */  sra     $v0, $v0, 16               
/* 00FB0 809CF690 04400003 */  bltz    $v0, .L809CF6A0            
/* 00FB4 809CF694 00021823 */  subu    $v1, $zero, $v0            
/* 00FB8 809CF698 10000001 */  beq     $zero, $zero, .L809CF6A0   
/* 00FBC 809CF69C 00401825 */  or      $v1, $v0, $zero            ## $v1 = 00000000
.L809CF6A0:
/* 00FC0 809CF6A0 860D0224 */  lh      $t5, 0x0224($s0)           ## 00000224
/* 00FC4 809CF6A4 246A0055 */  addiu   $t2, $v1, 0x0055           ## $t2 = 00000055
/* 00FC8 809CF6A8 A20A022D */  sb      $t2, 0x022D($s0)           ## 0000022D
/* 00FCC 809CF6AC 01ED2023 */  subu    $a0, $t7, $t5              
/* 00FD0 809CF6B0 00042400 */  sll     $a0, $a0, 16               
/* 00FD4 809CF6B4 0C01DE1C */  jal     Math_Sins
              ## sins?
/* 00FD8 809CF6B8 00042403 */  sra     $a0, $a0, 16               
/* 00FDC 809CF6BC 3C01437F */  lui     $at, 0x437F                ## $at = 437F0000
/* 00FE0 809CF6C0 44812000 */  mtc1    $at, $f4                   ## $f4 = 255.00
/* 00FE4 809CF6C4 00000000 */  nop
/* 00FE8 809CF6C8 46040182 */  mul.s   $f6, $f0, $f4              
/* 00FEC 809CF6CC 4600320D */  trunc.w.s $f8, $f6                   
/* 00FF0 809CF6D0 44024000 */  mfc1    $v0, $f8                   
/* 00FF4 809CF6D4 00000000 */  nop
/* 00FF8 809CF6D8 00021400 */  sll     $v0, $v0, 16               
/* 00FFC 809CF6DC 00021403 */  sra     $v0, $v0, 16               
/* 01000 809CF6E0 04400003 */  bltz    $v0, .L809CF6F0            
/* 01004 809CF6E4 00027023 */  subu    $t6, $zero, $v0            
/* 01008 809CF6E8 10000002 */  beq     $zero, $zero, .L809CF6F4   
/* 0100C 809CF6EC A202022E */  sb      $v0, 0x022E($s0)           ## 0000022E
.L809CF6F0:
/* 01010 809CF6F0 A20E022E */  sb      $t6, 0x022E($s0)           ## 0000022E
.L809CF6F4:
/* 01014 809CF6F4 860B0224 */  lh      $t3, 0x0224($s0)           ## 00000224
/* 01018 809CF6F8 55600006 */  bnel    $t3, $zero, .L809CF714     
/* 0101C 809CF6FC 86090032 */  lh      $t1, 0x0032($s0)           ## 00000032
/* 01020 809CF700 44808000 */  mtc1    $zero, $f16                ## $f16 = 0.00
/* 01024 809CF704 24180003 */  addiu   $t8, $zero, 0x0003         ## $t8 = 00000003
/* 01028 809CF708 A2180221 */  sb      $t8, 0x0221($s0)           ## 00000221
/* 0102C 809CF70C E6100250 */  swc1    $f16, 0x0250($s0)          ## 00000250
.L809CF710:
/* 01030 809CF710 86090032 */  lh      $t1, 0x0032($s0)           ## 00000032
.L809CF714:
/* 01034 809CF714 A60900B6 */  sh      $t1, 0x00B6($s0)           ## 000000B6
/* 01038 809CF718 8FBF0034 */  lw      $ra, 0x0034($sp)           
/* 0103C 809CF71C 8FB00030 */  lw      $s0, 0x0030($sp)           
/* 01040 809CF720 27BD0078 */  addiu   $sp, $sp, 0x0078           ## $sp = 00000000
/* 01044 809CF724 03E00008 */  jr      $ra                        
/* 01048 809CF728 00000000 */  nop
