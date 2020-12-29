.late_rodata
glabel D_808D6478
    .float -850.0

.text
glabel BossFd2_Init
/* 00430 808D2AA0 27BDFFC0 */  addiu   $sp, $sp, 0xFFC0           ## $sp = FFFFFFC0
/* 00434 808D2AA4 AFA50044 */  sw      $a1, 0x0044($sp)
/* 00438 808D2AA8 AFBF002C */  sw      $ra, 0x002C($sp)
/* 0043C 808D2AAC AFB00028 */  sw      $s0, 0x0028($sp)
/* 00440 808D2AB0 3C05808D */  lui     $a1, %hi(D_808D6190)       ## $a1 = 808D0000
/* 00444 808D2AB4 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00448 808D2AB8 0C01E037 */  jal     Actor_ProcessInitChain

/* 0044C 808D2ABC 24A56190 */  addiu   $a1, $a1, %lo(D_808D6190)  ## $a1 = 808D6190
/* 00450 808D2AC0 3C053BE5 */  lui     $a1, 0x3BE5                ## $a1 = 3BE50000
/* 00454 808D2AC4 34A56040 */  ori     $a1, $a1, 0x6040           ## $a1 = 3BE56040
/* 00458 808D2AC8 0C00B58B */  jal     Actor_SetScale

/* 0045C 808D2ACC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00460 808D2AD0 3C01808D */  lui     $at, %hi(D_808D6478)       ## $at = 808D0000
/* 00464 808D2AD4 C4246478 */  lwc1    $f4, %lo(D_808D6478)($at)
/* 00468 808D2AD8 3C01C411 */  lui     $at, 0xC411                ## $at = C4110000
/* 0046C 808D2ADC 44813000 */  mtc1    $at, $f6                   ## $f6 = -580.00
/* 00470 808D2AE0 C6080054 */  lwc1    $f8, 0x0054($s0)           ## 00000054
/* 00474 808D2AE4 260400B4 */  addiu   $a0, $s0, 0x00B4           ## $a0 = 000000B4
/* 00478 808D2AE8 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 0047C 808D2AEC 46083283 */  div.s   $f10, $f6, $f8
/* 00480 808D2AF0 24070000 */  addiu   $a3, $zero, 0x0000         ## $a3 = 00000000
/* 00484 808D2AF4 E6040028 */  swc1    $f4, 0x0028($s0)           ## 00000028
/* 00488 808D2AF8 44055000 */  mfc1    $a1, $f10
/* 0048C 808D2AFC 0C00AC78 */  jal     ActorShape_Init

/* 00490 808D2B00 00000000 */  nop
/* 00494 808D2B04 3C060601 */  lui     $a2, 0x0601                ## $a2 = 06010000
/* 00498 808D2B08 3C070601 */  lui     $a3, %hi(D_0600C8EC)                ## $a3 = 06010000
/* 0049C 808D2B0C 24E7C8EC */  addiu   $a3, $a3, %lo(D_0600C8EC)           ## $a3 = 0600C8EC
/* 004A0 808D2B10 24C61A78 */  addiu   $a2, $a2, 0x1A78           ## $a2 = 06011A78
/* 004A4 808D2B14 8FA40044 */  lw      $a0, 0x0044($sp)
/* 004A8 808D2B18 2605014C */  addiu   $a1, $s0, 0x014C           ## $a1 = 0000014C
/* 004AC 808D2B1C AFA00010 */  sw      $zero, 0x0010($sp)
/* 004B0 808D2B20 AFA00014 */  sw      $zero, 0x0014($sp)
/* 004B4 808D2B24 0C0291BE */  jal     SkelAnime_InitFlex
/* 004B8 808D2B28 AFA00018 */  sw      $zero, 0x0018($sp)
/* 004BC 808D2B2C 860E001C */  lh      $t6, 0x001C($s0)           ## 0000001C
/* 004C0 808D2B30 3C0F808D */  lui     $t7, %hi(func_808D4748)    ## $t7 = 808D0000
/* 004C4 808D2B34 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 004C8 808D2B38 15C00005 */  bne     $t6, $zero, .L808D2B50
/* 004CC 808D2B3C 25EF4748 */  addiu   $t7, $t7, %lo(func_808D4748) ## $t7 = 808D4748
/* 004D0 808D2B40 0C234AF4 */  jal     func_808D2BD0
/* 004D4 808D2B44 8FA50044 */  lw      $a1, 0x0044($sp)
/* 004D8 808D2B48 10000003 */  beq     $zero, $zero, .L808D2B58
/* 004DC 808D2B4C 2605141C */  addiu   $a1, $s0, 0x141C           ## $a1 = 0000141C
.L808D2B50:
/* 004E0 808D2B50 AE0F0190 */  sw      $t7, 0x0190($s0)           ## 00000190
/* 004E4 808D2B54 2605141C */  addiu   $a1, $s0, 0x141C           ## $a1 = 0000141C
.L808D2B58:
/* 004E8 808D2B58 AFA50034 */  sw      $a1, 0x0034($sp)
/* 004EC 808D2B5C 0C016EFE */  jal     Collider_InitJntSph
/* 004F0 808D2B60 8FA40044 */  lw      $a0, 0x0044($sp)
/* 004F4 808D2B64 3C07808D */  lui     $a3, %hi(D_808D6114)       ## $a3 = 808D0000
/* 004F8 808D2B68 2618143C */  addiu   $t8, $s0, 0x143C           ## $t8 = 0000143C
/* 004FC 808D2B6C 8FA50034 */  lw      $a1, 0x0034($sp)
/* 00500 808D2B70 AFB80010 */  sw      $t8, 0x0010($sp)
/* 00504 808D2B74 24E76114 */  addiu   $a3, $a3, %lo(D_808D6114)  ## $a3 = 808D6114
/* 00508 808D2B78 8FA40044 */  lw      $a0, 0x0044($sp)
/* 0050C 808D2B7C 0C017014 */  jal     Collider_SetJntSph
/* 00510 808D2B80 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 00514 808D2B84 8FBF002C */  lw      $ra, 0x002C($sp)
/* 00518 808D2B88 8FB00028 */  lw      $s0, 0x0028($sp)
/* 0051C 808D2B8C 27BD0040 */  addiu   $sp, $sp, 0x0040           ## $sp = 00000000
/* 00520 808D2B90 03E00008 */  jr      $ra
/* 00524 808D2B94 00000000 */  nop
