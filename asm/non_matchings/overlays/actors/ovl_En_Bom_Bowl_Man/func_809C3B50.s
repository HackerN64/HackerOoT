glabel func_809C3B50
/* 00520 809C3B50 27BDFFC8 */  addiu   $sp, $sp, 0xFFC8           ## $sp = FFFFFFC8
/* 00524 809C3B54 AFB00028 */  sw      $s0, 0x0028($sp)
/* 00528 809C3B58 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 0052C 809C3B5C AFBF002C */  sw      $ra, 0x002C($sp)
/* 00530 809C3B60 2484014C */  addiu   $a0, $a0, 0x014C           ## $a0 = 0000014C
/* 00534 809C3B64 AFA5003C */  sw      $a1, 0x003C($sp)
/* 00538 809C3B68 0C02927F */  jal     SkelAnime_FrameUpdateMatrix

/* 0053C 809C3B6C AFA40034 */  sw      $a0, 0x0034($sp)
/* 00540 809C3B70 8FA4003C */  lw      $a0, 0x003C($sp)
/* 00544 809C3B74 0C042F6F */  jal     func_8010BDBC
/* 00548 809C3B78 248420D8 */  addiu   $a0, $a0, 0x20D8           ## $a0 = 000020D8
/* 0054C 809C3B7C 860E022E */  lh      $t6, 0x022E($s0)           ## 0000022E
/* 00550 809C3B80 55C2003A */  bnel    $t6, $v0, .L809C3C6C
/* 00554 809C3B84 8FBF002C */  lw      $ra, 0x002C($sp)
/* 00558 809C3B88 0C041AF2 */  jal     func_80106BC8
/* 0055C 809C3B8C 8FA4003C */  lw      $a0, 0x003C($sp)
/* 00560 809C3B90 50400036 */  beql    $v0, $zero, .L809C3C6C
/* 00564 809C3B94 8FBF002C */  lw      $ra, 0x002C($sp)
/* 00568 809C3B98 0C041B33 */  jal     func_80106CCC
/* 0056C 809C3B9C 8FA4003C */  lw      $a0, 0x003C($sp)
/* 00570 809C3BA0 3C040600 */  lui     $a0, 0x0600                ## $a0 = 06000000
/* 00574 809C3BA4 0C028800 */  jal     SkelAnime_GetFrameCount

/* 00578 809C3BA8 248472AC */  addiu   $a0, $a0, 0x72AC           ## $a0 = 060072AC
/* 0057C 809C3BAC 44822000 */  mtc1    $v0, $f4                   ## $f4 = 0.00
/* 00580 809C3BB0 3C01C120 */  lui     $at, 0xC120                ## $at = C1200000
/* 00584 809C3BB4 44813000 */  mtc1    $at, $f6                   ## $f6 = -10.00
/* 00588 809C3BB8 46802020 */  cvt.s.w $f0, $f4
/* 0058C 809C3BBC 3C050600 */  lui     $a1, 0x0600                ## $a1 = 06000000
/* 00590 809C3BC0 24A572AC */  addiu   $a1, $a1, 0x72AC           ## $a1 = 060072AC
/* 00594 809C3BC4 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 00598 809C3BC8 24070000 */  addiu   $a3, $zero, 0x0000         ## $a3 = 00000000
/* 0059C 809C3BCC E6000254 */  swc1    $f0, 0x0254($s0)           ## 00000254
/* 005A0 809C3BD0 AFA00014 */  sw      $zero, 0x0014($sp)
/* 005A4 809C3BD4 E7A00010 */  swc1    $f0, 0x0010($sp)
/* 005A8 809C3BD8 8FA40034 */  lw      $a0, 0x0034($sp)
/* 005AC 809C3BDC 0C029468 */  jal     SkelAnime_ChangeAnim

/* 005B0 809C3BE0 E7A60018 */  swc1    $f6, 0x0018($sp)
/* 005B4 809C3BE4 3C014270 */  lui     $at, 0x4270                ## $at = 42700000
/* 005B8 809C3BE8 240F0003 */  addiu   $t7, $zero, 0x0003         ## $t7 = 00000003
/* 005BC 809C3BEC 44816000 */  mtc1    $at, $f12                  ## $f12 = 60.00
/* 005C0 809C3BF0 0C00CFBE */  jal     Math_Rand_ZeroFloat

/* 005C4 809C3BF4 A60F0238 */  sh      $t7, 0x0238($s0)           ## 00000238
/* 005C8 809C3BF8 4600020D */  trunc.w.s $f8, $f0
/* 005CC 809C3BFC 3C0B8016 */  lui     $t3, %hi(gSaveContext+0xed8)
/* 005D0 809C3C00 24180018 */  addiu   $t8, $zero, 0x0018         ## $t8 = 00000018
/* 005D4 809C3C04 3C0D8016 */  lui     $t5, %hi(gGameInfo)
/* 005D8 809C3C08 44094000 */  mfc1    $t1, $f8
/* 005DC 809C3C0C 24190004 */  addiu   $t9, $zero, 0x0004         ## $t9 = 00000004
/* 005E0 809C3C10 3305FFFF */  andi    $a1, $t8, 0xFFFF           ## $a1 = 00000018
/* 005E4 809C3C14 252A0014 */  addiu   $t2, $t1, 0x0014           ## $t2 = 00000014
/* 005E8 809C3C18 A60A0236 */  sh      $t2, 0x0236($s0)           ## 00000236
/* 005EC 809C3C1C 956BF538 */  lhu     $t3, %lo(gSaveContext+0xed8)($t3)
/* 005F0 809C3C20 316C0020 */  andi    $t4, $t3, 0x0020           ## $t4 = 00000000
/* 005F4 809C3C24 5580000A */  bnel    $t4, $zero, .L809C3C50
/* 005F8 809C3C28 A618010E */  sh      $t8, 0x010E($s0)           ## 0000010E
/* 005FC 809C3C2C 8DADFA90 */  lw      $t5, %lo(gGameInfo)($t5)
/* 00600 809C3C30 3C0F809C */  lui     $t7, %hi(func_809C3C7C)    ## $t7 = 809C0000
/* 00604 809C3C34 25EF3C7C */  addiu   $t7, $t7, %lo(func_809C3C7C) ## $t7 = 809C3C7C
/* 00608 809C3C38 85AE12D8 */  lh      $t6, 0x12D8($t5)           ## 801612D8
/* 0060C 809C3C3C 55C00004 */  bnel    $t6, $zero, .L809C3C50
/* 00610 809C3C40 A618010E */  sh      $t8, 0x010E($s0)           ## 0000010E
/* 00614 809C3C44 10000008 */  beq     $zero, $zero, .L809C3C68
/* 00618 809C3C48 AE0F0214 */  sw      $t7, 0x0214($s0)           ## 00000214
/* 0061C 809C3C4C A618010E */  sh      $t8, 0x010E($s0)           ## 0000010E
.L809C3C50:
/* 00620 809C3C50 A619022E */  sh      $t9, 0x022E($s0)           ## 0000022E
/* 00624 809C3C54 0C042DC8 */  jal     func_8010B720
/* 00628 809C3C58 8FA4003C */  lw      $a0, 0x003C($sp)
/* 0062C 809C3C5C 3C08809C */  lui     $t0, %hi(func_809C4040)    ## $t0 = 809C0000
/* 00630 809C3C60 25084040 */  addiu   $t0, $t0, %lo(func_809C4040) ## $t0 = 809C4040
/* 00634 809C3C64 AE080214 */  sw      $t0, 0x0214($s0)           ## 00000214
.L809C3C68:
/* 00638 809C3C68 8FBF002C */  lw      $ra, 0x002C($sp)
.L809C3C6C:
/* 0063C 809C3C6C 8FB00028 */  lw      $s0, 0x0028($sp)
/* 00640 809C3C70 27BD0038 */  addiu   $sp, $sp, 0x0038           ## $sp = 00000000
/* 00644 809C3C74 03E00008 */  jr      $ra
/* 00648 809C3C78 00000000 */  nop
