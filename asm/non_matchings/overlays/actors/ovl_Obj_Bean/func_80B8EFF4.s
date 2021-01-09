glabel func_80B8EFF4
/* 00574 80B8EFF4 27BDFF88 */  addiu   $sp, $sp, 0xFF88           ## $sp = FFFFFF88
/* 00578 80B8EFF8 AFB00018 */  sw      $s0, 0x0018($sp)
/* 0057C 80B8EFFC 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00580 80B8F000 AFBF001C */  sw      $ra, 0x001C($sp)
/* 00584 80B8F004 AFA5007C */  sw      $a1, 0x007C($sp)
/* 00588 80B8F008 920E01F6 */  lbu     $t6, 0x01F6($s0)           ## 000001F6
/* 0058C 80B8F00C 3C1880B9 */  lui     $t8, %hi(D_80B90E80)       ## $t8 = 80B90000
/* 00590 80B8F010 27180E80 */  addiu   $t8, $t8, %lo(D_80B90E80)  ## $t8 = 80B90E80
/* 00594 80B8F014 000E78C0 */  sll     $t7, $t6,  3
/* 00598 80B8F018 01F81021 */  addu    $v0, $t7, $t8
/* 0059C 80B8F01C 8C450000 */  lw      $a1, 0x0000($v0)           ## 00000000
/* 005A0 80B8F020 8C460004 */  lw      $a2, 0x0004($v0)           ## 00000004
/* 005A4 80B8F024 0C01DE80 */  jal     Math_StepToF

/* 005A8 80B8F028 24840068 */  addiu   $a0, $a0, 0x0068           ## $a0 = 00000068
/* 005AC 80B8F02C 8FB9007C */  lw      $t9, 0x007C($sp)
/* 005B0 80B8F030 8609001C */  lh      $t1, 0x001C($s0)           ## 0000001C
/* 005B4 80B8F034 3C080001 */  lui     $t0, 0x0001                ## $t0 = 00010000
/* 005B8 80B8F038 01194021 */  addu    $t0, $t0, $t9
/* 005BC 80B8F03C 8D081E08 */  lw      $t0, 0x1E08($t0)           ## 00011E08
/* 005C0 80B8F040 00095203 */  sra     $t2, $t1,  8
/* 005C4 80B8F044 314B001F */  andi    $t3, $t2, 0x001F           ## $t3 = 00000000
/* 005C8 80B8F048 000B60C0 */  sll     $t4, $t3,  3
/* 005CC 80B8F04C 010C3021 */  addu    $a2, $t0, $t4
/* 005D0 80B8F050 8CC30004 */  lw      $v1, 0x0004($a2)           ## 00000004
/* 005D4 80B8F054 860A01F4 */  lh      $t2, 0x01F4($s0)           ## 000001F4
/* 005D8 80B8F058 3C188016 */  lui     $t8, %hi(gSegments)
/* 005DC 80B8F05C 00036900 */  sll     $t5, $v1,  4               
/* 005E0 80B8F060 000D7702 */  srl     $t6, $t5, 28               
/* 005E4 80B8F064 000E7880 */  sll     $t7, $t6,  2               
/* 005E8 80B8F068 030FC021 */  addu    $t8, $t8, $t7              
/* 005EC 80B8F06C 8F186FA8 */  lw      $t8, %lo(gSegments)($t8)
/* 005F0 80B8F070 3C0100FF */  lui     $at, 0x00FF                ## $at = 00FF0000
/* 005F4 80B8F074 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = 00FFFFFF
/* 005F8 80B8F078 000A5880 */  sll     $t3, $t2,  2
/* 005FC 80B8F07C 0061C824 */  and     $t9, $v1, $at
/* 00600 80B8F080 016A5823 */  subu    $t3, $t3, $t2
/* 00604 80B8F084 000B5840 */  sll     $t3, $t3,  1
/* 00608 80B8F088 03194821 */  addu    $t1, $t8, $t9
/* 0060C 80B8F08C 012B2821 */  addu    $a1, $t1, $t3
/* 00610 80B8F090 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 00614 80B8F094 00A12821 */  addu    $a1, $a1, $at
/* 00618 80B8F098 AFA50054 */  sw      $a1, 0x0054($sp)
/* 0061C 80B8F09C AFA60074 */  sw      $a2, 0x0074($sp)
/* 00620 80B8F0A0 0C01DF97 */  jal     Math_Vec3s_ToVec3f
              ## Vec3f_CopyFrameTable
/* 00624 80B8F0A4 27A4005C */  addiu   $a0, $sp, 0x005C           ## $a0 = FFFFFFE4
/* 00628 80B8F0A8 260501D8 */  addiu   $a1, $s0, 0x01D8           ## $a1 = 000001D8
/* 0062C 80B8F0AC AFA50028 */  sw      $a1, 0x0028($sp)
/* 00630 80B8F0B0 27A4005C */  addiu   $a0, $sp, 0x005C           ## $a0 = FFFFFFE4
/* 00634 80B8F0B4 0C01DFB4 */  jal     Math_Vec3f_Diff
              ## Vec3f_Sub
/* 00638 80B8F0B8 27A60068 */  addiu   $a2, $sp, 0x0068           ## $a2 = FFFFFFF0
/* 0063C 80B8F0BC 0C032D8A */  jal     Math3D_Vec3fMagnitude
/* 00640 80B8F0C0 27A40068 */  addiu   $a0, $sp, 0x0068           ## $a0 = FFFFFFF0
/* 00644 80B8F0C4 3C013F00 */  lui     $at, 0x3F00                ## $at = 3F000000
/* 00648 80B8F0C8 44818000 */  mtc1    $at, $f16                  ## $f16 = 0.50
/* 0064C 80B8F0CC C6020068 */  lwc1    $f2, 0x0068($s0)           ## 00000068
/* 00650 80B8F0D0 3C0100FF */  lui     $at, 0x00FF                ## $at = 00FF0000
/* 00654 80B8F0D4 46000386 */  mov.s   $f14, $f0
/* 00658 80B8F0D8 4610103C */  c.lt.s  $f2, $f16
/* 0065C 80B8F0DC 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = 00FFFFFF
/* 00660 80B8F0E0 8FA80074 */  lw      $t0, 0x0074($sp)           
/* 00664 80B8F0E4 3C0F8016 */  lui     $t7, %hi(gSegments)
/* 00668 80B8F0E8 45000003 */  bc1f    .L80B8F0F8                 
/* 0066C 80B8F0EC 27A5005C */  addiu   $a1, $sp, 0x005C           ## $a1 = FFFFFFE4
/* 00670 80B8F0F0 10000002 */  beq     $zero, $zero, .L80B8F0FC
/* 00674 80B8F0F4 46008306 */  mov.s   $f12, $f16
.L80B8F0F8:
/* 00678 80B8F0F8 46001306 */  mov.s   $f12, $f2
.L80B8F0FC:
/* 0067C 80B8F0FC 460C003C */  c.lt.s  $f0, $f12
/* 00680 80B8F100 00000000 */  nop
/* 00684 80B8F104 4502004F */  bc1fl   .L80B8F244
/* 00688 80B8F108 460E1283 */  div.s   $f10, $f2, $f14
/* 0068C 80B8F10C 8D030004 */  lw      $v1, 0x0004($t0)           ## 00000004
/* 00690 80B8F110 860A01F2 */  lh      $t2, 0x01F2($s0)           ## 000001F2
/* 00694 80B8F114 8FA40028 */  lw      $a0, 0x0028($sp)           
/* 00698 80B8F118 00036100 */  sll     $t4, $v1,  4               
/* 0069C 80B8F11C 000C6F02 */  srl     $t5, $t4, 28               
/* 006A0 80B8F120 000D7080 */  sll     $t6, $t5,  2               
/* 006A4 80B8F124 01EE7821 */  addu    $t7, $t7, $t6              
/* 006A8 80B8F128 8DEF6FA8 */  lw      $t7, %lo(gSegments)($t7)
/* 006AC 80B8F12C 000A4880 */  sll     $t1, $t2,  2               
/* 006B0 80B8F130 0061C024 */  and     $t8, $v1, $at              
/* 006B4 80B8F134 012A4823 */  subu    $t1, $t1, $t2              
/* 006B8 80B8F138 00094840 */  sll     $t1, $t1,  1               
/* 006BC 80B8F13C 01F8C821 */  addu    $t9, $t7, $t8              
/* 006C0 80B8F140 03295821 */  addu    $t3, $t9, $t1              
/* 006C4 80B8F144 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 006C8 80B8F148 01614021 */  addu    $t0, $t3, $at
/* 006CC 80B8F14C 0C01DF90 */  jal     Math_Vec3f_Copy
              ## Vec3f_Copy
/* 006D0 80B8F150 AFA80050 */  sw      $t0, 0x0050($sp)
/* 006D4 80B8F154 860201F4 */  lh      $v0, 0x01F4($s0)           ## 000001F4
/* 006D8 80B8F158 860D01F0 */  lh      $t5, 0x01F0($s0)           ## 000001F0
/* 006DC 80B8F15C 3C098016 */  lui     $t1, %hi(gSegments)
/* 006E0 80B8F160 A60201F2 */  sh      $v0, 0x01F2($s0)           ## 000001F2
/* 006E4 80B8F164 860C01F2 */  lh      $t4, 0x01F2($s0)           ## 000001F2
/* 006E8 80B8F168 27A40040 */  addiu   $a0, $sp, 0x0040           ## $a0 = FFFFFFC8
/* 006EC 80B8F16C 244E0001 */  addiu   $t6, $v0, 0x0001           ## $t6 = 00000001
/* 006F0 80B8F170 018D082A */  slt     $at, $t4, $t5
/* 006F4 80B8F174 54200004 */  bnel    $at, $zero, .L80B8F188
/* 006F8 80B8F178 A60E01F4 */  sh      $t6, 0x01F4($s0)           ## 000001F4
/* 006FC 80B8F17C 10000002 */  beq     $zero, $zero, .L80B8F188
/* 00700 80B8F180 A60001F4 */  sh      $zero, 0x01F4($s0)         ## 000001F4
/* 00704 80B8F184 A60E01F4 */  sh      $t6, 0x01F4($s0)           ## 000001F4
.L80B8F188:
/* 00708 80B8F188 8FAF0074 */  lw      $t7, 0x0074($sp)
/* 0070C 80B8F18C 860C01F4 */  lh      $t4, 0x01F4($s0)           ## 000001F4
/* 00710 80B8F190 3C0100FF */  lui     $at, 0x00FF                ## $at = 00FF0000
/* 00714 80B8F194 8DE30004 */  lw      $v1, 0x0004($t7)           ## 00000004
/* 00718 80B8F198 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = 00FFFFFF
/* 0071C 80B8F19C 000C6880 */  sll     $t5, $t4,  2               
/* 00720 80B8F1A0 0003C100 */  sll     $t8, $v1,  4               
/* 00724 80B8F1A4 00185702 */  srl     $t2, $t8, 28               
/* 00728 80B8F1A8 000AC880 */  sll     $t9, $t2,  2               
/* 0072C 80B8F1AC 01394821 */  addu    $t1, $t1, $t9              
/* 00730 80B8F1B0 8D296FA8 */  lw      $t1, %lo(gSegments)($t1)
/* 00734 80B8F1B4 01AC6823 */  subu    $t5, $t5, $t4              
/* 00738 80B8F1B8 00615824 */  and     $t3, $v1, $at              
/* 0073C 80B8F1BC 000D6840 */  sll     $t5, $t5,  1               
/* 00740 80B8F1C0 012B4021 */  addu    $t0, $t1, $t3              
/* 00744 80B8F1C4 010D7021 */  addu    $t6, $t0, $t5              
/* 00748 80B8F1C8 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 0074C 80B8F1CC 01C17821 */  addu    $t7, $t6, $at
/* 00750 80B8F1D0 AFAF004C */  sw      $t7, 0x004C($sp)
/* 00754 80B8F1D4 8FA50054 */  lw      $a1, 0x0054($sp)
/* 00758 80B8F1D8 0C01DFC1 */  jal     Math_Vec3s_DiffToVec3f

/* 0075C 80B8F1DC 8FA60050 */  lw      $a2, 0x0050($sp)
/* 00760 80B8F1E0 27A40034 */  addiu   $a0, $sp, 0x0034           ## $a0 = FFFFFFBC
/* 00764 80B8F1E4 8FA5004C */  lw      $a1, 0x004C($sp)
/* 00768 80B8F1E8 0C01DFC1 */  jal     Math_Vec3s_DiffToVec3f

/* 0076C 80B8F1EC 8FA60054 */  lw      $a2, 0x0054($sp)
/* 00770 80B8F1F0 27A40040 */  addiu   $a0, $sp, 0x0040           ## $a0 = FFFFFFC8
/* 00774 80B8F1F4 27A50034 */  addiu   $a1, $sp, 0x0034           ## $a1 = FFFFFFBC
/* 00778 80B8F1F8 0C032C04 */  jal     Math3D_CosOut
/* 0077C 80B8F1FC 27A60030 */  addiu   $a2, $sp, 0x0030           ## $a2 = FFFFFFB8
/* 00780 80B8F200 10400004 */  beq     $v0, $zero, .L80B8F214
/* 00784 80B8F204 C7A60030 */  lwc1    $f6, 0x0030($sp)
/* 00788 80B8F208 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 0078C 80B8F20C 1000001D */  beq     $zero, $zero, .L80B8F284
/* 00790 80B8F210 E6040068 */  swc1    $f4, 0x0068($s0)           ## 00000068
.L80B8F214:
/* 00794 80B8F214 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 00798 80B8F218 44814000 */  mtc1    $at, $f8                   ## $f8 = 1.00
/* 0079C 80B8F21C 3C013F00 */  lui     $at, 0x3F00                ## $at = 3F000000
/* 007A0 80B8F220 44819000 */  mtc1    $at, $f18                  ## $f18 = 0.50
/* 007A4 80B8F224 46083280 */  add.s   $f10, $f6, $f8
/* 007A8 80B8F228 C6060068 */  lwc1    $f6, 0x0068($s0)           ## 00000068
/* 007AC 80B8F22C 46125102 */  mul.s   $f4, $f10, $f18
/* 007B0 80B8F230 00000000 */  nop
/* 007B4 80B8F234 46043202 */  mul.s   $f8, $f6, $f4
/* 007B8 80B8F238 10000012 */  beq     $zero, $zero, .L80B8F284
/* 007BC 80B8F23C E6080068 */  swc1    $f8, 0x0068($s0)           ## 00000068
/* 007C0 80B8F240 460E1283 */  div.s   $f10, $f2, $f14
.L80B8F244:
/* 007C4 80B8F244 27A40068 */  addiu   $a0, $sp, 0x0068           ## $a0 = FFFFFFF0
/* 007C8 80B8F248 44055000 */  mfc1    $a1, $f10
/* 007CC 80B8F24C 0C01DFD7 */  jal     Math_Vec3f_Scale

/* 007D0 80B8F250 00000000 */  nop
/* 007D4 80B8F254 C61201D8 */  lwc1    $f18, 0x01D8($s0)          ## 000001D8
/* 007D8 80B8F258 C7A60068 */  lwc1    $f6, 0x0068($sp)
/* 007DC 80B8F25C C60801DC */  lwc1    $f8, 0x01DC($s0)           ## 000001DC
/* 007E0 80B8F260 46069100 */  add.s   $f4, $f18, $f6
/* 007E4 80B8F264 C60601E0 */  lwc1    $f6, 0x01E0($s0)           ## 000001E0
/* 007E8 80B8F268 E60401D8 */  swc1    $f4, 0x01D8($s0)           ## 000001D8
/* 007EC 80B8F26C C7AA006C */  lwc1    $f10, 0x006C($sp)
/* 007F0 80B8F270 460A4480 */  add.s   $f18, $f8, $f10
/* 007F4 80B8F274 E61201DC */  swc1    $f18, 0x01DC($s0)          ## 000001DC
/* 007F8 80B8F278 C7A40070 */  lwc1    $f4, 0x0070($sp)
/* 007FC 80B8F27C 46043200 */  add.s   $f8, $f6, $f4
/* 00800 80B8F280 E60801E0 */  swc1    $f8, 0x01E0($s0)           ## 000001E0
.L80B8F284:
/* 00804 80B8F284 8FBF001C */  lw      $ra, 0x001C($sp)
/* 00808 80B8F288 8FB00018 */  lw      $s0, 0x0018($sp)
/* 0080C 80B8F28C 27BD0078 */  addiu   $sp, $sp, 0x0078           ## $sp = 00000000
/* 00810 80B8F290 03E00008 */  jr      $ra
/* 00814 80B8F294 00000000 */  nop
