.late_rodata
glabel D_809379A8
 .word 0xC4228000

.text
glabel func_8092DF40
/* 01970 8092DF40 27BDFFD0 */  addiu   $sp, $sp, 0xFFD0           ## $sp = FFFFFFD0
/* 01974 8092DF44 AFB00028 */  sw      $s0, 0x0028($sp)
/* 01978 8092DF48 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 0197C 8092DF4C AFBF002C */  sw      $ra, 0x002C($sp)
/* 01980 8092DF50 3C040601 */  lui     $a0, 0x0601                ## $a0 = 06010000
/* 01984 8092DF54 0C028800 */  jal     Animation_GetLastFrame

/* 01988 8092DF58 2484B0D8 */  addiu   $a0, $a0, 0xB0D8           ## $a0 = 0600B0D8
/* 0198C 8092DF5C 44822000 */  mtc1    $v0, $f4                   ## $f4 = 0.00
/* 01990 8092DF60 3C01C0A0 */  lui     $at, 0xC0A0                ## $at = C0A00000
/* 01994 8092DF64 44814000 */  mtc1    $at, $f8                   ## $f8 = -5.00
/* 01998 8092DF68 468021A0 */  cvt.s.w $f6, $f4
/* 0199C 8092DF6C 3C050601 */  lui     $a1, 0x0601                ## $a1 = 06010000
/* 019A0 8092DF70 240E0003 */  addiu   $t6, $zero, 0x0003         ## $t6 = 00000003
/* 019A4 8092DF74 AFAE0014 */  sw      $t6, 0x0014($sp)
/* 019A8 8092DF78 24A5B0D8 */  addiu   $a1, $a1, 0xB0D8           ## $a1 = 0600B0D8
/* 019AC 8092DF7C 2604014C */  addiu   $a0, $s0, 0x014C           ## $a0 = 0000014C
/* 019B0 8092DF80 E7A60010 */  swc1    $f6, 0x0010($sp)
/* 019B4 8092DF84 3C063F00 */  lui     $a2, 0x3F00                ## $a2 = 3F000000
/* 019B8 8092DF88 24070000 */  addiu   $a3, $zero, 0x0000         ## $a3 = 00000000
/* 019BC 8092DF8C 0C029468 */  jal     Animation_Change

/* 019C0 8092DF90 E7A80018 */  swc1    $f8, 0x0018($sp)
/* 019C4 8092DF94 3C048094 */  lui     $a0, %hi(D_80938C98)       ## $a0 = 80940000
/* 019C8 8092DF98 8C848C98 */  lw      $a0, %lo(D_80938C98)($a0)
/* 019CC 8092DF9C 0C24CF20 */  jal     func_80933C80
/* 019D0 8092DFA0 24050020 */  addiu   $a1, $zero, 0x0020         ## $a1 = 00000020
/* 019D4 8092DFA4 3C048094 */  lui     $a0, %hi(D_80938C9C)       ## $a0 = 80940000
/* 019D8 8092DFA8 8C848C9C */  lw      $a0, %lo(D_80938C9C)($a0)
/* 019DC 8092DFAC 0C24CF20 */  jal     func_80933C80
/* 019E0 8092DFB0 24050020 */  addiu   $a1, $zero, 0x0020         ## $a1 = 00000020
/* 019E4 8092DFB4 920F03E4 */  lbu     $t7, 0x03E4($s0)           ## 000003E4
/* 019E8 8092DFB8 3C014040 */  lui     $at, 0x4040                ## $at = 40400000
/* 019EC 8092DFBC 44815000 */  mtc1    $at, $f10                  ## $f10 = 3.00
/* 019F0 8092DFC0 35F80001 */  ori     $t8, $t7, 0x0001           ## $t8 = 00000001
/* 019F4 8092DFC4 A21803E4 */  sb      $t8, 0x03E4($s0)           ## 000003E4
/* 019F8 8092DFC8 3C018093 */  lui     $at, %hi(D_809379A8)       ## $at = 80930000
/* 019FC 8092DFCC E60A0068 */  swc1    $f10, 0x0068($s0)          ## 00000068
/* 01A00 8092DFD0 C43079A8 */  lwc1    $f16, %lo(D_809379A8)($at)
/* 01A04 8092DFD4 3C198093 */  lui     $t9, %hi(func_8092DFFC)    ## $t9 = 80930000
/* 01A08 8092DFD8 2739DFFC */  addiu   $t9, $t9, %lo(func_8092DFFC) ## $t9 = 8092DFFC
/* 01A0C 8092DFDC A2000195 */  sb      $zero, 0x0195($s0)         ## 00000195
/* 01A10 8092DFE0 AE190190 */  sw      $t9, 0x0190($s0)           ## 00000190
/* 01A14 8092DFE4 E61003C4 */  swc1    $f16, 0x03C4($s0)          ## 000003C4
/* 01A18 8092DFE8 8FBF002C */  lw      $ra, 0x002C($sp)
/* 01A1C 8092DFEC 8FB00028 */  lw      $s0, 0x0028($sp)
/* 01A20 8092DFF0 27BD0030 */  addiu   $sp, $sp, 0x0030           ## $sp = 00000000
/* 01A24 8092DFF4 03E00008 */  jr      $ra
/* 01A28 8092DFF8 00000000 */  nop
