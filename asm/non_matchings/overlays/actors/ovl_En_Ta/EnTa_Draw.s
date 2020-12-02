.rdata
glabel D_80B16F2C
    .asciz "../z_en_ta.c"
    .balign 4

glabel D_80B16F3C
    .asciz "../z_en_ta.c"
    .balign 4

.text
glabel EnTa_Draw
/* 03240 80B16CE0 27BDFFA8 */  addiu   $sp, $sp, 0xFFA8           ## $sp = FFFFFFA8
/* 03244 80B16CE4 AFBF002C */  sw      $ra, 0x002C($sp)
/* 03248 80B16CE8 AFB00028 */  sw      $s0, 0x0028($sp)
/* 0324C 80B16CEC AFA5005C */  sw      $a1, 0x005C($sp)
/* 03250 80B16CF0 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 03254 80B16CF4 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 03258 80B16CF8 3C0680B1 */  lui     $a2, %hi(D_80B16F2C)       ## $a2 = 80B10000
/* 0325C 80B16CFC 24C66F2C */  addiu   $a2, $a2, %lo(D_80B16F2C)  ## $a2 = 80B16F2C
/* 03260 80B16D00 27A4003C */  addiu   $a0, $sp, 0x003C           ## $a0 = FFFFFFE4
/* 03264 80B16D04 2407094D */  addiu   $a3, $zero, 0x094D         ## $a3 = 0000094D
/* 03268 80B16D08 0C031AB1 */  jal     Graph_OpenDisps
/* 0326C 80B16D0C AFA5004C */  sw      $a1, 0x004C($sp)
/* 03270 80B16D10 8FAF005C */  lw      $t7, 0x005C($sp)
/* 03274 80B16D14 0C0250F2 */  jal     func_800943C8
/* 03278 80B16D18 8DE40000 */  lw      $a0, 0x0000($t7)           ## 00000000
/* 0327C 80B16D1C 8FA8004C */  lw      $t0, 0x004C($sp)
/* 03280 80B16D20 3C19DB06 */  lui     $t9, 0xDB06                ## $t9 = DB060000
/* 03284 80B16D24 37390020 */  ori     $t9, $t9, 0x0020           ## $t9 = DB060020
/* 03288 80B16D28 8D0302C0 */  lw      $v1, 0x02C0($t0)           ## 000002C0
/* 0328C 80B16D2C 3C0480B1 */  lui     $a0, %hi(D_80B16E88)       ## $a0 = 80B10000
/* 03290 80B16D30 3C068016 */  lui     $a2, %hi(gSegments)
/* 03294 80B16D34 24780008 */  addiu   $t8, $v1, 0x0008           ## $t8 = 00000008
/* 03298 80B16D38 AD1802C0 */  sw      $t8, 0x02C0($t0)           ## 000002C0
/* 0329C 80B16D3C AC790000 */  sw      $t9, 0x0000($v1)           ## 00000000
/* 032A0 80B16D40 860902B4 */  lh      $t1, 0x02B4($s0)           ## 000002B4
/* 032A4 80B16D44 24C66FA8 */  addiu   $a2, %lo(gSegments)
/* 032A8 80B16D48 3C0500FF */  lui     $a1, 0x00FF                ## $a1 = 00FF0000
/* 032AC 80B16D4C 00095080 */  sll     $t2, $t1,  2
/* 032B0 80B16D50 008A2021 */  addu    $a0, $a0, $t2
/* 032B4 80B16D54 8C846E88 */  lw      $a0, %lo(D_80B16E88)($a0)
/* 032B8 80B16D58 34A5FFFF */  ori     $a1, $a1, 0xFFFF           ## $a1 = 00FFFFFF
/* 032BC 80B16D5C 3C078000 */  lui     $a3, 0x8000                ## $a3 = 80000000
/* 032C0 80B16D60 00046100 */  sll     $t4, $a0,  4
/* 032C4 80B16D64 000C6F02 */  srl     $t5, $t4, 28
/* 032C8 80B16D68 000D7080 */  sll     $t6, $t5,  2
/* 032CC 80B16D6C 00CE7821 */  addu    $t7, $a2, $t6
/* 032D0 80B16D70 8DF80000 */  lw      $t8, 0x0000($t7)           ## 00000000
/* 032D4 80B16D74 00855824 */  and     $t3, $a0, $a1
/* 032D8 80B16D78 3C040600 */  lui     $a0, 0x0600                ## $a0 = 06000000
/* 032DC 80B16D7C 0178C821 */  addu    $t9, $t3, $t8
/* 032E0 80B16D80 03274821 */  addu    $t1, $t9, $a3
/* 032E4 80B16D84 AC690004 */  sw      $t1, 0x0004($v1)           ## 00000004
/* 032E8 80B16D88 8D0302C0 */  lw      $v1, 0x02C0($t0)           ## 000002C0
/* 032EC 80B16D8C 24846DC0 */  addiu   $a0, $a0, 0x6DC0           ## $a0 = 06006DC0
/* 032F0 80B16D90 00046900 */  sll     $t5, $a0,  4
/* 032F4 80B16D94 000D7702 */  srl     $t6, $t5, 28
/* 032F8 80B16D98 3C0CDB06 */  lui     $t4, 0xDB06                ## $t4 = DB060000
/* 032FC 80B16D9C 246A0008 */  addiu   $t2, $v1, 0x0008           ## $t2 = 00000008
/* 03300 80B16DA0 358C0024 */  ori     $t4, $t4, 0x0024           ## $t4 = DB060024
/* 03304 80B16DA4 000E7880 */  sll     $t7, $t6,  2
/* 03308 80B16DA8 AD0A02C0 */  sw      $t2, 0x02C0($t0)           ## 000002C0
/* 0330C 80B16DAC 00CF5821 */  addu    $t3, $a2, $t7
/* 03310 80B16DB0 AC6C0000 */  sw      $t4, 0x0000($v1)           ## 00000000
/* 03314 80B16DB4 8D780000 */  lw      $t8, 0x0000($t3)           ## 00000000
/* 03318 80B16DB8 0085C824 */  and     $t9, $a0, $a1
/* 0331C 80B16DBC 3C0C80B1 */  lui     $t4, %hi(func_80B16B1C)    ## $t4 = 80B10000
/* 03320 80B16DC0 03194821 */  addu    $t1, $t8, $t9
/* 03324 80B16DC4 01275021 */  addu    $t2, $t1, $a3
/* 03328 80B16DC8 AC6A0004 */  sw      $t2, 0x0004($v1)           ## 00000004
/* 0332C 80B16DCC 9207014E */  lbu     $a3, 0x014E($s0)           ## 0000014E
/* 03330 80B16DD0 8E06016C */  lw      $a2, 0x016C($s0)           ## 0000016C
/* 03334 80B16DD4 8E050150 */  lw      $a1, 0x0150($s0)           ## 00000150
/* 03338 80B16DD8 3C0D80B1 */  lui     $t5, %hi(func_80B16CA0)    ## $t5 = 80B10000
/* 0333C 80B16DDC 25AD6CA0 */  addiu   $t5, $t5, %lo(func_80B16CA0) ## $t5 = 80B16CA0
/* 03340 80B16DE0 258C6B1C */  addiu   $t4, $t4, %lo(func_80B16B1C) ## $t4 = 80B16B1C
/* 03344 80B16DE4 AFAC0010 */  sw      $t4, 0x0010($sp)
/* 03348 80B16DE8 AFAD0014 */  sw      $t5, 0x0014($sp)
/* 0334C 80B16DEC AFB00018 */  sw      $s0, 0x0018($sp)
/* 03350 80B16DF0 0C0286B2 */  jal     SkelAnime_DrawFlexOpa
/* 03354 80B16DF4 8FA4005C */  lw      $a0, 0x005C($sp)
/* 03358 80B16DF8 8FAE005C */  lw      $t6, 0x005C($sp)
/* 0335C 80B16DFC 3C0680B1 */  lui     $a2, %hi(D_80B16F3C)       ## $a2 = 80B10000
/* 03360 80B16E00 24C66F3C */  addiu   $a2, $a2, %lo(D_80B16F3C)  ## $a2 = 80B16F3C
/* 03364 80B16E04 27A4003C */  addiu   $a0, $sp, 0x003C           ## $a0 = FFFFFFE4
/* 03368 80B16E08 24070960 */  addiu   $a3, $zero, 0x0960         ## $a3 = 00000960
/* 0336C 80B16E0C 0C031AD5 */  jal     Graph_CloseDisps
/* 03370 80B16E10 8DC50000 */  lw      $a1, 0x0000($t6)           ## 00000000
/* 03374 80B16E14 8FBF002C */  lw      $ra, 0x002C($sp)
/* 03378 80B16E18 8FB00028 */  lw      $s0, 0x0028($sp)
/* 0337C 80B16E1C 27BD0058 */  addiu   $sp, $sp, 0x0058           ## $sp = 00000000
/* 03380 80B16E20 03E00008 */  jr      $ra
/* 03384 80B16E24 00000000 */  nop
/* 03388 80B16E28 00000000 */  nop
/* 0338C 80B16E2C 00000000 */  nop
