.late_rodata
glabel jtbl_80A9A7F0
    .word L80A97378
    .word L80A973C0
    .word L80A973F0
    .word L80A97438
    .word L80A97468
    .word L80A97498
    .word L80A974A0
    .word L80A974E8
    .word L80A97518
    .word L80A97560
    .word L80A97590
    .word L80A975C0
    .word L80A97368

.text
glabel func_80A97338
/* 00588 80A97338 84AE001C */  lh      $t6, 0x001C($a1)           ## 0000001C
/* 0058C 80A9733C 8C831C44 */  lw      $v1, 0x1C44($a0)           ## 00001C44
/* 00590 80A97340 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
/* 00594 80A97344 31CF00FF */  andi    $t7, $t6, 0x00FF           ## $t7 = 00000000
/* 00598 80A97348 2DE1000D */  sltiu   $at, $t7, 0x000D           
/* 0059C 80A9734C 102000AE */  beq     $at, $zero, .L80A97608     
/* 005A0 80A97350 000F7880 */  sll     $t7, $t7,  2               
/* 005A4 80A97354 3C0180AA */  lui     $at, %hi(jtbl_80A9A7F0)       ## $at = 80AA0000
/* 005A8 80A97358 002F0821 */  addu    $at, $at, $t7              
/* 005AC 80A9735C 8C2FA7F0 */  lw      $t7, %lo(jtbl_80A9A7F0)($at)  
/* 005B0 80A97360 01E00008 */  jr      $t7                        
/* 005B4 80A97364 00000000 */  nop
glabel L80A97368
/* 005B8 80A97368 24180009 */  addiu   $t8, $zero, 0x0009         ## $t8 = 00000009
/* 005BC 80A9736C A0780693 */  sb      $t8, 0x0693($v1)           ## 00000693
/* 005C0 80A97370 03E00008 */  jr      $ra                        
/* 005C4 80A97374 240210B9 */  addiu   $v0, $zero, 0x10B9         ## $v0 = 000010B9
glabel L80A97378
/* 005C8 80A97378 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 005CC 80A9737C 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 005D0 80A97380 3C198012 */  lui     $t9, %hi(gBitFlags)
/* 005D4 80A97384 8F397120 */  lw      $t9, %lo(gBitFlags)($t9)
/* 005D8 80A97388 8C4800A4 */  lw      $t0, 0x00A4($v0)           ## 8015E704
/* 005DC 80A9738C 03284824 */  and     $t1, $t9, $t0              
/* 005E0 80A97390 51200004 */  beql    $t1, $zero, .L80A973A4     
/* 005E4 80A97394 944A0F00 */  lhu     $t2, 0x0F00($v0)           ## 8015F560
/* 005E8 80A97398 03E00008 */  jr      $ra                        
/* 005EC 80A9739C 24021072 */  addiu   $v0, $zero, 0x1072         ## $v0 = 00001072
.L80A973A0:
/* 005F0 80A973A0 944A0F00 */  lhu     $t2, 0x0F00($v0)           ## 00001F72
.L80A973A4:
/* 005F4 80A973A4 314B0002 */  andi    $t3, $t2, 0x0002           ## $t3 = 00000000
/* 005F8 80A973A8 11600003 */  beq     $t3, $zero, .L80A973B8     
/* 005FC 80A973AC 00000000 */  nop
/* 00600 80A973B0 03E00008 */  jr      $ra                        
/* 00604 80A973B4 24021056 */  addiu   $v0, $zero, 0x1056         ## $v0 = 00001056
.L80A973B8:
/* 00608 80A973B8 03E00008 */  jr      $ra                        
/* 0060C 80A973BC 24021055 */  addiu   $v0, $zero, 0x1055         ## $v0 = 00001055
glabel L80A973C0
/* 00610 80A973C0 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00614 80A973C4 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00618 80A973C8 3C0C8012 */  lui     $t4, %hi(gBitFlags)
/* 0061C 80A973CC 8D8C7120 */  lw      $t4, %lo(gBitFlags)($t4)
/* 00620 80A973D0 8C4D00A4 */  lw      $t5, 0x00A4($v0)           ## 8015E704
/* 00624 80A973D4 018D7024 */  and     $t6, $t4, $t5              
/* 00628 80A973D8 11C00003 */  beq     $t6, $zero, .L80A973E8     
/* 0062C 80A973DC 00000000 */  nop
/* 00630 80A973E0 03E00008 */  jr      $ra                        
/* 00634 80A973E4 24021073 */  addiu   $v0, $zero, 0x1073         ## $v0 = 00001073
.L80A973E8:
/* 00638 80A973E8 03E00008 */  jr      $ra                        
/* 0063C 80A973EC 2402105A */  addiu   $v0, $zero, 0x105A         ## $v0 = 0000105A
glabel L80A973F0
/* 00640 80A973F0 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00644 80A973F4 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00648 80A973F8 3C0F8012 */  lui     $t7, %hi(gBitFlags)
/* 0064C 80A973FC 8DEF7120 */  lw      $t7, %lo(gBitFlags)($t7)
/* 00650 80A97400 8C5800A4 */  lw      $t8, 0x00A4($v0)           ## 8015E704
/* 00654 80A97404 01F8C824 */  and     $t9, $t7, $t8              
/* 00658 80A97408 53200004 */  beql    $t9, $zero, .L80A9741C     
/* 0065C 80A9740C 94480F00 */  lhu     $t0, 0x0F00($v0)           ## 8015F560
/* 00660 80A97410 03E00008 */  jr      $ra                        
/* 00664 80A97414 24021074 */  addiu   $v0, $zero, 0x1074         ## $v0 = 00001074
.L80A97418:
/* 00668 80A97418 94480F00 */  lhu     $t0, 0x0F00($v0)           ## 00001F74
.L80A9741C:
/* 0066C 80A9741C 31090080 */  andi    $t1, $t0, 0x0080           ## $t1 = 00000000
/* 00670 80A97420 11200003 */  beq     $t1, $zero, .L80A97430     
/* 00674 80A97424 00000000 */  nop
/* 00678 80A97428 03E00008 */  jr      $ra                        
/* 0067C 80A9742C 2402105E */  addiu   $v0, $zero, 0x105E         ## $v0 = 0000105E
.L80A97430:
/* 00680 80A97430 03E00008 */  jr      $ra                        
/* 00684 80A97434 2402105D */  addiu   $v0, $zero, 0x105D         ## $v0 = 0000105D
glabel L80A97438
/* 00688 80A97438 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 0068C 80A9743C 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00690 80A97440 3C0A8012 */  lui     $t2, %hi(gBitFlags)
/* 00694 80A97444 8D4A7120 */  lw      $t2, %lo(gBitFlags)($t2)
/* 00698 80A97448 8C4B00A4 */  lw      $t3, 0x00A4($v0)           ## 8015E704
/* 0069C 80A9744C 014B6024 */  and     $t4, $t2, $t3              
/* 006A0 80A97450 11800003 */  beq     $t4, $zero, .L80A97460     
/* 006A4 80A97454 00000000 */  nop
/* 006A8 80A97458 03E00008 */  jr      $ra                        
/* 006AC 80A9745C 24021075 */  addiu   $v0, $zero, 0x1075         ## $v0 = 00001075
.L80A97460:
/* 006B0 80A97460 03E00008 */  jr      $ra                        
/* 006B4 80A97464 2402105B */  addiu   $v0, $zero, 0x105B         ## $v0 = 0000105B
glabel L80A97468
/* 006B8 80A97468 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 006BC 80A9746C 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 006C0 80A97470 3C0D8012 */  lui     $t5, %hi(gBitFlags)
/* 006C4 80A97474 8DAD7120 */  lw      $t5, %lo(gBitFlags)($t5)
/* 006C8 80A97478 8C4E00A4 */  lw      $t6, 0x00A4($v0)           ## 8015E704
/* 006CC 80A9747C 01AE7824 */  and     $t7, $t5, $t6              
/* 006D0 80A97480 11E00003 */  beq     $t7, $zero, .L80A97490     
/* 006D4 80A97484 00000000 */  nop
/* 006D8 80A97488 03E00008 */  jr      $ra                        
/* 006DC 80A9748C 24021076 */  addiu   $v0, $zero, 0x1076         ## $v0 = 00001076
.L80A97490:
/* 006E0 80A97490 03E00008 */  jr      $ra                        
/* 006E4 80A97494 2402105F */  addiu   $v0, $zero, 0x105F         ## $v0 = 0000105F
glabel L80A97498
/* 006E8 80A97498 03E00008 */  jr      $ra                        
/* 006EC 80A9749C 24021057 */  addiu   $v0, $zero, 0x1057         ## $v0 = 00001057
glabel L80A974A0
/* 006F0 80A974A0 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 006F4 80A974A4 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 006F8 80A974A8 3C188012 */  lui     $t8, %hi(gBitFlags)
/* 006FC 80A974AC 8F187120 */  lw      $t8, %lo(gBitFlags)($t8)
/* 00700 80A974B0 8C5900A4 */  lw      $t9, 0x00A4($v0)           ## 8015E704
/* 00704 80A974B4 03194024 */  and     $t0, $t8, $t9              
/* 00708 80A974B8 51000004 */  beql    $t0, $zero, .L80A974CC     
/* 0070C 80A974BC 94490F02 */  lhu     $t1, 0x0F02($v0)           ## 8015F562
/* 00710 80A974C0 03E00008 */  jr      $ra                        
/* 00714 80A974C4 24021077 */  addiu   $v0, $zero, 0x1077         ## $v0 = 00001077
.L80A974C8:
/* 00718 80A974C8 94490F02 */  lhu     $t1, 0x0F02($v0)           ## 00001F79
.L80A974CC:
/* 0071C 80A974CC 312A0002 */  andi    $t2, $t1, 0x0002           ## $t2 = 00000000
/* 00720 80A974D0 11400003 */  beq     $t2, $zero, .L80A974E0     
/* 00724 80A974D4 00000000 */  nop
/* 00728 80A974D8 03E00008 */  jr      $ra                        
/* 0072C 80A974DC 24021059 */  addiu   $v0, $zero, 0x1059         ## $v0 = 00001059
.L80A974E0:
/* 00730 80A974E0 03E00008 */  jr      $ra                        
/* 00734 80A974E4 24021058 */  addiu   $v0, $zero, 0x1058         ## $v0 = 00001058
glabel L80A974E8
/* 00738 80A974E8 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 0073C 80A974EC 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00740 80A974F0 3C0B8012 */  lui     $t3, %hi(gBitFlags)
/* 00744 80A974F4 8D6B7120 */  lw      $t3, %lo(gBitFlags)($t3)
/* 00748 80A974F8 8C4C00A4 */  lw      $t4, 0x00A4($v0)           ## 8015E704
/* 0074C 80A974FC 016C6824 */  and     $t5, $t3, $t4              
/* 00750 80A97500 11A00003 */  beq     $t5, $zero, .L80A97510     
/* 00754 80A97504 00000000 */  nop
/* 00758 80A97508 03E00008 */  jr      $ra                        
/* 0075C 80A9750C 24021079 */  addiu   $v0, $zero, 0x1079         ## $v0 = 00001079
.L80A97510:
/* 00760 80A97510 03E00008 */  jr      $ra                        
/* 00764 80A97514 2402104E */  addiu   $v0, $zero, 0x104E         ## $v0 = 0000104E
glabel L80A97518
/* 00768 80A97518 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 0076C 80A9751C 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00770 80A97520 3C0E8012 */  lui     $t6, %hi(gBitFlags)
/* 00774 80A97524 8DCE7120 */  lw      $t6, %lo(gBitFlags)($t6)
/* 00778 80A97528 8C4F00A4 */  lw      $t7, 0x00A4($v0)           ## 8015E704
/* 0077C 80A9752C 01CFC024 */  and     $t8, $t6, $t7              
/* 00780 80A97530 53000004 */  beql    $t8, $zero, .L80A97544     
/* 00784 80A97534 94590F02 */  lhu     $t9, 0x0F02($v0)           ## 8015F562
/* 00788 80A97538 03E00008 */  jr      $ra                        
/* 0078C 80A9753C 2402107A */  addiu   $v0, $zero, 0x107A         ## $v0 = 0000107A
.L80A97540:
/* 00790 80A97540 94590F02 */  lhu     $t9, 0x0F02($v0)           ## 00001F7C
.L80A97544:
/* 00794 80A97544 33280200 */  andi    $t0, $t9, 0x0200           ## $t0 = 00000000
/* 00798 80A97548 11000003 */  beq     $t0, $zero, .L80A97558     
/* 0079C 80A9754C 00000000 */  nop
/* 007A0 80A97550 03E00008 */  jr      $ra                        
/* 007A4 80A97554 24021050 */  addiu   $v0, $zero, 0x1050         ## $v0 = 00001050
.L80A97558:
/* 007A8 80A97558 03E00008 */  jr      $ra                        
/* 007AC 80A9755C 2402104F */  addiu   $v0, $zero, 0x104F         ## $v0 = 0000104F
glabel L80A97560
/* 007B0 80A97560 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 007B4 80A97564 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 007B8 80A97568 3C098012 */  lui     $t1, %hi(gBitFlags)
/* 007BC 80A9756C 8D297120 */  lw      $t1, %lo(gBitFlags)($t1)
/* 007C0 80A97570 8C4A00A4 */  lw      $t2, 0x00A4($v0)           ## 8015E704
/* 007C4 80A97574 012A5824 */  and     $t3, $t1, $t2              
/* 007C8 80A97578 11600003 */  beq     $t3, $zero, .L80A97588     
/* 007CC 80A9757C 00000000 */  nop
/* 007D0 80A97580 03E00008 */  jr      $ra                        
/* 007D4 80A97584 2402107B */  addiu   $v0, $zero, 0x107B         ## $v0 = 0000107B
.L80A97588:
/* 007D8 80A97588 03E00008 */  jr      $ra                        
/* 007DC 80A9758C 24021051 */  addiu   $v0, $zero, 0x1051         ## $v0 = 00001051
glabel L80A97590
/* 007E0 80A97590 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 007E4 80A97594 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 007E8 80A97598 3C0C8012 */  lui     $t4, %hi(gBitFlags)
/* 007EC 80A9759C 8D8C7120 */  lw      $t4, %lo(gBitFlags)($t4)
/* 007F0 80A975A0 8C4D00A4 */  lw      $t5, 0x00A4($v0)           ## 8015E704
/* 007F4 80A975A4 018D7024 */  and     $t6, $t4, $t5              
/* 007F8 80A975A8 11C00003 */  beq     $t6, $zero, .L80A975B8     
/* 007FC 80A975AC 00000000 */  nop
/* 00800 80A975B0 03E00008 */  jr      $ra                        
/* 00804 80A975B4 2402107C */  addiu   $v0, $zero, 0x107C         ## $v0 = 0000107C
.L80A975B8:
/* 00808 80A975B8 03E00008 */  jr      $ra                        
/* 0080C 80A975BC 24021052 */  addiu   $v0, $zero, 0x1052         ## $v0 = 00001052
glabel L80A975C0
/* 00810 80A975C0 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00814 80A975C4 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00818 80A975C8 3C0F8012 */  lui     $t7, %hi(gBitFlags)
/* 0081C 80A975CC 8DEF7120 */  lw      $t7, %lo(gBitFlags)($t7)
/* 00820 80A975D0 8C5800A4 */  lw      $t8, 0x00A4($v0)           ## 8015E704
/* 00824 80A975D4 01F8C824 */  and     $t9, $t7, $t8              
/* 00828 80A975D8 53200004 */  beql    $t9, $zero, .L80A975EC     
/* 0082C 80A975DC 94480F04 */  lhu     $t0, 0x0F04($v0)           ## 8015F564
/* 00830 80A975E0 03E00008 */  jr      $ra                        
/* 00834 80A975E4 2402107C */  addiu   $v0, $zero, 0x107C         ## $v0 = 0000107C
.L80A975E8:
/* 00838 80A975E8 94480F04 */  lhu     $t0, 0x0F04($v0)           ## 00001F80
.L80A975EC:
/* 0083C 80A975EC 31090002 */  andi    $t1, $t0, 0x0002           ## $t1 = 00000000
/* 00840 80A975F0 11200003 */  beq     $t1, $zero, .L80A97600     
/* 00844 80A975F4 00000000 */  nop
/* 00848 80A975F8 03E00008 */  jr      $ra                        
/* 0084C 80A975FC 24021054 */  addiu   $v0, $zero, 0x1054         ## $v0 = 00001054
.L80A97600:
/* 00850 80A97600 03E00008 */  jr      $ra                        
/* 00854 80A97604 24021053 */  addiu   $v0, $zero, 0x1053         ## $v0 = 00001053
.L80A97608:
/* 00858 80A97608 03E00008 */  jr      $ra                        
/* 0085C 80A9760C 00000000 */  nop
