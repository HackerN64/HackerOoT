glabel func_80B4B010
/* 004D0 80B4B010 27BDFF90 */  addiu   $sp, $sp, 0xFF90           ## $sp = FFFFFF90
/* 004D4 80B4B014 AFBF002C */  sw      $ra, 0x002C($sp)
/* 004D8 80B4B018 AFB10028 */  sw      $s1, 0x0028($sp)
/* 004DC 80B4B01C AFB00024 */  sw      $s0, 0x0024($sp)
/* 004E0 80B4B020 8CAE1C44 */  lw      $t6, 0x1C44($a1)           ## 00001C44
/* 004E4 80B4B024 3C1880B5 */  lui     $t8, %hi(D_80B4E630)       ## $t8 = 80B50000
/* 004E8 80B4B028 2718E630 */  addiu   $t8, $t8, %lo(D_80B4E630)  ## $t8 = 80B4E630
/* 004EC 80B4B02C AFAE006C */  sw      $t6, 0x006C($sp)
/* 004F0 80B4B030 8F090000 */  lw      $t1, 0x0000($t8)           ## 80B4E630
/* 004F4 80B4B034 27AF0054 */  addiu   $t7, $sp, 0x0054           ## $t7 = FFFFFFE4
/* 004F8 80B4B038 8F190004 */  lw      $t9, 0x0004($t8)           ## 80B4E634
/* 004FC 80B4B03C ADE90000 */  sw      $t1, 0x0000($t7)           ## FFFFFFE4
/* 00500 80B4B040 8F090008 */  lw      $t1, 0x0008($t8)           ## 80B4E638
/* 00504 80B4B044 3C0B80B5 */  lui     $t3, %hi(D_80B4E63C)       ## $t3 = 80B50000
/* 00508 80B4B048 256BE63C */  addiu   $t3, $t3, %lo(D_80B4E63C)  ## $t3 = 80B4E63C
/* 0050C 80B4B04C ADF90004 */  sw      $t9, 0x0004($t7)           ## FFFFFFE8
/* 00510 80B4B050 ADE90008 */  sw      $t1, 0x0008($t7)           ## FFFFFFEC
/* 00514 80B4B054 8D6D0000 */  lw      $t5, 0x0000($t3)           ## 80B4E63C
/* 00518 80B4B058 27AA0048 */  addiu   $t2, $sp, 0x0048           ## $t2 = FFFFFFD8
/* 0051C 80B4B05C 8D6C0004 */  lw      $t4, 0x0004($t3)           ## 80B4E640
/* 00520 80B4B060 AD4D0000 */  sw      $t5, 0x0000($t2)           ## FFFFFFD8
/* 00524 80B4B064 8D6D0008 */  lw      $t5, 0x0008($t3)           ## 80B4E644
/* 00528 80B4B068 3C0F80B5 */  lui     $t7, %hi(D_80B4E648)       ## $t7 = 80B50000
/* 0052C 80B4B06C 25EFE648 */  addiu   $t7, $t7, %lo(D_80B4E648)  ## $t7 = 80B4E648
/* 00530 80B4B070 AD4C0004 */  sw      $t4, 0x0004($t2)           ## FFFFFFDC
/* 00534 80B4B074 AD4D0008 */  sw      $t5, 0x0008($t2)           ## FFFFFFE0
/* 00538 80B4B078 8DF90000 */  lw      $t9, 0x0000($t7)           ## 80B4E648
/* 0053C 80B4B07C 27AE003C */  addiu   $t6, $sp, 0x003C           ## $t6 = FFFFFFCC
/* 00540 80B4B080 8DF80004 */  lw      $t8, 0x0004($t7)           ## 80B4E64C
/* 00544 80B4B084 ADD90000 */  sw      $t9, 0x0000($t6)           ## FFFFFFCC
/* 00548 80B4B088 8DF90008 */  lw      $t9, 0x0008($t7)           ## 80B4E650
/* 0054C 80B4B08C 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00550 80B4B090 00A08825 */  or      $s1, $a1, $zero            ## $s1 = 00000000
/* 00554 80B4B094 ADD80004 */  sw      $t8, 0x0004($t6)           ## FFFFFFD0
/* 00558 80B4B098 0C00BC65 */  jal     func_8002F194
/* 0055C 80B4B09C ADD90008 */  sw      $t9, 0x0008($t6)           ## FFFFFFD4
/* 00560 80B4B0A0 1040004B */  beq     $v0, $zero, .L80B4B1D0
/* 00564 80B4B0A4 3C040601 */  lui     $a0, 0x0601                ## $a0 = 06010000
/* 00568 80B4B0A8 0C028800 */  jal     SkelAnime_GetFrameCount

/* 0056C 80B4B0AC 24840B38 */  addiu   $a0, $a0, 0x0B38           ## $a0 = 06010B38
/* 00570 80B4B0B0 44822000 */  mtc1    $v0, $f4                   ## $f4 = 0.00
/* 00574 80B4B0B4 3C01C120 */  lui     $at, 0xC120                ## $at = C1200000
/* 00578 80B4B0B8 44814000 */  mtc1    $at, $f8                   ## $f8 = -10.00
/* 0057C 80B4B0BC 468021A0 */  cvt.s.w $f6, $f4
/* 00580 80B4B0C0 3C050601 */  lui     $a1, 0x0601                ## $a1 = 06010000
/* 00584 80B4B0C4 24090003 */  addiu   $t1, $zero, 0x0003         ## $t1 = 00000003
/* 00588 80B4B0C8 AFA90014 */  sw      $t1, 0x0014($sp)
/* 0058C 80B4B0CC 24A50B38 */  addiu   $a1, $a1, 0x0B38           ## $a1 = 06010B38
/* 00590 80B4B0D0 2604014C */  addiu   $a0, $s0, 0x014C           ## $a0 = 0000014C
/* 00594 80B4B0D4 E7A60010 */  swc1    $f6, 0x0010($sp)
/* 00598 80B4B0D8 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 0059C 80B4B0DC 24070000 */  addiu   $a3, $zero, 0x0000         ## $a3 = 00000000
/* 005A0 80B4B0E0 0C029468 */  jal     SkelAnime_ChangeAnim

/* 005A4 80B4B0E4 E7A80018 */  swc1    $f8, 0x0018($sp)
/* 005A8 80B4B0E8 0C03008C */  jal     Gameplay_CreateSubCamera
/* 005AC 80B4B0EC 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 005B0 80B4B0F0 A60201E8 */  sh      $v0, 0x01E8($s0)           ## 000001E8
/* 005B4 80B4B0F4 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 005B8 80B4B0F8 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 005BC 80B4B0FC 0C0300C5 */  jal     Gameplay_ChangeCameraStatus
/* 005C0 80B4B100 24060001 */  addiu   $a2, $zero, 0x0001         ## $a2 = 00000001
/* 005C4 80B4B104 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 005C8 80B4B108 860501E8 */  lh      $a1, 0x01E8($s0)           ## 000001E8
/* 005CC 80B4B10C 0C0300C5 */  jal     Gameplay_ChangeCameraStatus
/* 005D0 80B4B110 24060007 */  addiu   $a2, $zero, 0x0007         ## $a2 = 00000007
/* 005D4 80B4B114 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 005D8 80B4B118 860501E8 */  lh      $a1, 0x01E8($s0)           ## 000001E8
/* 005DC 80B4B11C 8FA6006C */  lw      $a2, 0x006C($sp)
/* 005E0 80B4B120 0C030202 */  jal     func_800C0808
/* 005E4 80B4B124 24070021 */  addiu   $a3, $zero, 0x0021         ## $a3 = 00000021
/* 005E8 80B4B128 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 005EC 80B4B12C 02211821 */  addu    $v1, $s1, $at
/* 005F0 80B4B130 240800FF */  addiu   $t0, $zero, 0x00FF         ## $t0 = 000000FF
/* 005F4 80B4B134 240A0018 */  addiu   $t2, $zero, 0x0018         ## $t2 = 00000018
/* 005F8 80B4B138 A0680B06 */  sb      $t0, 0x0B06($v1)           ## 00000B06
/* 005FC 80B4B13C A0680B07 */  sb      $t0, 0x0B07($v1)           ## 00000B07
/* 00600 80B4B140 A0680B08 */  sb      $t0, 0x0B08($v1)           ## 00000B08
/* 00604 80B4B144 A06A0B09 */  sb      $t2, 0x0B09($v1)           ## 00000B09
/* 00608 80B4B148 00310821 */  addu    $at, $at, $s1
/* 0060C 80B4B14C 240B0001 */  addiu   $t3, $zero, 0x0001         ## $t3 = 00000001
/* 00610 80B4B150 A02B0B05 */  sb      $t3, 0x0B05($at)           ## 00010B05
/* 00614 80B4B154 860501E8 */  lh      $a1, 0x01E8($s0)           ## 000001E8
/* 00618 80B4B158 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 0061C 80B4B15C 27A60054 */  addiu   $a2, $sp, 0x0054           ## $a2 = FFFFFFE4
/* 00620 80B4B160 0C030136 */  jal     func_800C04D8
/* 00624 80B4B164 27A70048 */  addiu   $a3, $sp, 0x0048           ## $a3 = FFFFFFD8
/* 00628 80B4B168 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 0062C 80B4B16C 860501E8 */  lh      $a1, 0x01E8($s0)           ## 000001E8
/* 00630 80B4B170 0C0301C1 */  jal     func_800C0704
/* 00634 80B4B174 3C0641F0 */  lui     $a2, 0x41F0                ## $a2 = 41F00000
/* 00638 80B4B178 0C02CE10 */  jal     func_800B3840              ## letterbox_target_addr
/* 0063C 80B4B17C 24040020 */  addiu   $a0, $zero, 0x0020         ## $a0 = 00000020
/* 00640 80B4B180 0C020978 */  jal     Interface_ChangeAlpha
/* 00644 80B4B184 24040002 */  addiu   $a0, $zero, 0x0002         ## $a0 = 00000002
/* 00648 80B4B188 27AC003C */  addiu   $t4, $sp, 0x003C           ## $t4 = FFFFFFCC
/* 0064C 80B4B18C 8FA2006C */  lw      $v0, 0x006C($sp)
/* 00650 80B4B190 8D8E0000 */  lw      $t6, 0x0000($t4)           ## FFFFFFCC
/* 00654 80B4B194 44805000 */  mtc1    $zero, $f10                ## $f10 = 0.00
/* 00658 80B4B198 3C0F80B5 */  lui     $t7, %hi(func_80B4B240)    ## $t7 = 80B50000
/* 0065C 80B4B19C AC4E0024 */  sw      $t6, 0x0024($v0)           ## 00000024
/* 00660 80B4B1A0 8D8D0004 */  lw      $t5, 0x0004($t4)           ## FFFFFFD0
/* 00664 80B4B1A4 25EFB240 */  addiu   $t7, $t7, %lo(func_80B4B240) ## $t7 = 80B4B240
/* 00668 80B4B1A8 24040051 */  addiu   $a0, $zero, 0x0051         ## $a0 = 00000051
/* 0066C 80B4B1AC AC4D0028 */  sw      $t5, 0x0028($v0)           ## 00000028
/* 00670 80B4B1B0 8D8E0008 */  lw      $t6, 0x0008($t4)           ## FFFFFFD4
/* 00674 80B4B1B4 E44A0068 */  swc1    $f10, 0x0068($v0)          ## 00000068
/* 00678 80B4B1B8 AC4E002C */  sw      $t6, 0x002C($v0)           ## 0000002C
/* 0067C 80B4B1BC A60001E2 */  sh      $zero, 0x01E2($s0)         ## 000001E2
/* 00680 80B4B1C0 0C03D719 */  jal     func_800F5C64
/* 00684 80B4B1C4 AE0F0190 */  sw      $t7, 0x0190($s0)           ## 00000190
/* 00688 80B4B1C8 10000019 */  beq     $zero, $zero, .L80B4B230
/* 0068C 80B4B1CC 8FBF002C */  lw      $ra, 0x002C($sp)
.L80B4B1D0:
/* 00690 80B4B1D0 8618008A */  lh      $t8, 0x008A($s0)           ## 0000008A
/* 00694 80B4B1D4 861900B6 */  lh      $t9, 0x00B6($s0)           ## 000000B6
/* 00698 80B4B1D8 8FA9006C */  lw      $t1, 0x006C($sp)
/* 0069C 80B4B1DC 03191023 */  subu    $v0, $t8, $t9
/* 006A0 80B4B1E0 04400004 */  bltz    $v0, .L80B4B1F4
/* 006A4 80B4B1E4 00021823 */  subu    $v1, $zero, $v0
/* 006A8 80B4B1E8 00021C00 */  sll     $v1, $v0, 16
/* 006AC 80B4B1EC 10000003 */  beq     $zero, $zero, .L80B4B1FC
/* 006B0 80B4B1F0 00031C03 */  sra     $v1, $v1, 16
.L80B4B1F4:
/* 006B4 80B4B1F4 00031C00 */  sll     $v1, $v1, 16
/* 006B8 80B4B1F8 00031C03 */  sra     $v1, $v1, 16
.L80B4B1FC:
/* 006BC 80B4B1FC 2861238E */  slti    $at, $v1, 0x238E
/* 006C0 80B4B200 5020000B */  beql    $at, $zero, .L80B4B230
/* 006C4 80B4B204 8FBF002C */  lw      $ra, 0x002C($sp)
/* 006C8 80B4B208 C5300028 */  lwc1    $f16, 0x0028($t1)          ## 00000028
/* 006CC 80B4B20C C6120028 */  lwc1    $f18, 0x0028($s0)          ## 00000028
/* 006D0 80B4B210 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 006D4 80B4B214 4612803C */  c.lt.s  $f16, $f18
/* 006D8 80B4B218 00000000 */  nop
/* 006DC 80B4B21C 45030004 */  bc1tl   .L80B4B230
/* 006E0 80B4B220 8FBF002C */  lw      $ra, 0x002C($sp)
/* 006E4 80B4B224 0C00BCBD */  jal     func_8002F2F4
/* 006E8 80B4B228 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 006EC 80B4B22C 8FBF002C */  lw      $ra, 0x002C($sp)
.L80B4B230:
/* 006F0 80B4B230 8FB00024 */  lw      $s0, 0x0024($sp)
/* 006F4 80B4B234 8FB10028 */  lw      $s1, 0x0028($sp)
/* 006F8 80B4B238 03E00008 */  jr      $ra
/* 006FC 80B4B23C 27BD0070 */  addiu   $sp, $sp, 0x0070           ## $sp = 00000000
