.rdata
glabel D_809E4170
    .asciz "../z_en_daiku.c"
    .balign 4

glabel D_809E4180
    .asciz "../z_en_daiku.c"
    .balign 4

.text
glabel EnDaiku_Draw
/* 01278 809E3DA8 27BDFFA8 */  addiu   $sp, $sp, 0xFFA8           ## $sp = FFFFFFA8
/* 0127C 809E3DAC AFBF0024 */  sw      $ra, 0x0024($sp)
/* 01280 809E3DB0 AFA40058 */  sw      $a0, 0x0058($sp)
/* 01284 809E3DB4 AFA5005C */  sw      $a1, 0x005C($sp)
/* 01288 809E3DB8 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 0128C 809E3DBC 3C06809E */  lui     $a2, %hi(D_809E4170)       ## $a2 = 809E0000
/* 01290 809E3DC0 24C64170 */  addiu   $a2, $a2, %lo(D_809E4170)  ## $a2 = 809E4170
/* 01294 809E3DC4 27A40040 */  addiu   $a0, $sp, 0x0040           ## $a0 = FFFFFFE8
/* 01298 809E3DC8 240704CB */  addiu   $a3, $zero, 0x04CB         ## $a3 = 000004CB
/* 0129C 809E3DCC 0C031AB1 */  jal     Graph_OpenDisps
/* 012A0 809E3DD0 AFA50050 */  sw      $a1, 0x0050($sp)
/* 012A4 809E3DD4 8FAF005C */  lw      $t7, 0x005C($sp)
/* 012A8 809E3DD8 0C024F46 */  jal     func_80093D18
/* 012AC 809E3DDC 8DE40000 */  lw      $a0, 0x0000($t7)           ## 00000000
/* 012B0 809E3DE0 8FA90058 */  lw      $t1, 0x0058($sp)
/* 012B4 809E3DE4 8FA80050 */  lw      $t0, 0x0050($sp)
/* 012B8 809E3DE8 3C19FB00 */  lui     $t9, 0xFB00                ## $t9 = FB000000
/* 012BC 809E3DEC 8522001C */  lh      $v0, 0x001C($t1)           ## 0000001C
/* 012C0 809E3DF0 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 012C4 809E3DF4 30420003 */  andi    $v0, $v0, 0x0003           ## $v0 = 00000000
/* 012C8 809E3DF8 14400009 */  bne     $v0, $zero, .L809E3E20
/* 012CC 809E3DFC 00000000 */  nop
/* 012D0 809E3E00 8D0202C0 */  lw      $v0, 0x02C0($t0)           ## 000002C0
/* 012D4 809E3E04 3C0AAA0A */  lui     $t2, 0xAA0A                ## $t2 = AA0A0000
/* 012D8 809E3E08 354A46FF */  ori     $t2, $t2, 0x46FF           ## $t2 = AA0A46FF
/* 012DC 809E3E0C 24580008 */  addiu   $t8, $v0, 0x0008           ## $t8 = 00000008
/* 012E0 809E3E10 AD1802C0 */  sw      $t8, 0x02C0($t0)           ## 000002C0
/* 012E4 809E3E14 AC4A0004 */  sw      $t2, 0x0004($v0)           ## 00000004
/* 012E8 809E3E18 10000020 */  beq     $zero, $zero, .L809E3E9C
/* 012EC 809E3E1C AC590000 */  sw      $t9, 0x0000($v0)           ## 00000000
.L809E3E20:
/* 012F0 809E3E20 14410009 */  bne     $v0, $at, .L809E3E48
/* 012F4 809E3E24 3C0CFB00 */  lui     $t4, 0xFB00                ## $t4 = FB000000
/* 012F8 809E3E28 8D0202C0 */  lw      $v0, 0x02C0($t0)           ## 000002C0
/* 012FC 809E3E2C 3C0DAAC8 */  lui     $t5, 0xAAC8                ## $t5 = AAC80000
/* 01300 809E3E30 35ADFFFF */  ori     $t5, $t5, 0xFFFF           ## $t5 = AAC8FFFF
/* 01304 809E3E34 244B0008 */  addiu   $t3, $v0, 0x0008           ## $t3 = 00000008
/* 01308 809E3E38 AD0B02C0 */  sw      $t3, 0x02C0($t0)           ## 000002C0
/* 0130C 809E3E3C AC4D0004 */  sw      $t5, 0x0004($v0)           ## 00000004
/* 01310 809E3E40 10000016 */  beq     $zero, $zero, .L809E3E9C
/* 01314 809E3E44 AC4C0000 */  sw      $t4, 0x0000($v0)           ## 00000000
.L809E3E48:
/* 01318 809E3E48 24010002 */  addiu   $at, $zero, 0x0002         ## $at = 00000002
/* 0131C 809E3E4C 14410009 */  bne     $v0, $at, .L809E3E74
/* 01320 809E3E50 3C0FFB00 */  lui     $t7, 0xFB00                ## $t7 = FB000000
/* 01324 809E3E54 8D0202C0 */  lw      $v0, 0x02C0($t0)           ## 000002C0
/* 01328 809E3E58 3C1800E6 */  lui     $t8, 0x00E6                ## $t8 = 00E60000
/* 0132C 809E3E5C 371846FF */  ori     $t8, $t8, 0x46FF           ## $t8 = 00E646FF
/* 01330 809E3E60 244E0008 */  addiu   $t6, $v0, 0x0008           ## $t6 = 00000008
/* 01334 809E3E64 AD0E02C0 */  sw      $t6, 0x02C0($t0)           ## 000002C0
/* 01338 809E3E68 AC580004 */  sw      $t8, 0x0004($v0)           ## 00000004
/* 0133C 809E3E6C 1000000B */  beq     $zero, $zero, .L809E3E9C
/* 01340 809E3E70 AC4F0000 */  sw      $t7, 0x0000($v0)           ## 00000000
.L809E3E74:
/* 01344 809E3E74 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
/* 01348 809E3E78 14410008 */  bne     $v0, $at, .L809E3E9C
/* 0134C 809E3E7C 3C0AFB00 */  lui     $t2, 0xFB00                ## $t2 = FB000000
/* 01350 809E3E80 8D0202C0 */  lw      $v0, 0x02C0($t0)           ## 000002C0
/* 01354 809E3E84 3C0BC800 */  lui     $t3, 0xC800                ## $t3 = C8000000
/* 01358 809E3E88 356B96FF */  ori     $t3, $t3, 0x96FF           ## $t3 = C80096FF
/* 0135C 809E3E8C 24590008 */  addiu   $t9, $v0, 0x0008           ## $t9 = 00000008
/* 01360 809E3E90 AD1902C0 */  sw      $t9, 0x02C0($t0)           ## 000002C0
/* 01364 809E3E94 AC4B0004 */  sw      $t3, 0x0004($v0)           ## 00000004
/* 01368 809E3E98 AC4A0000 */  sw      $t2, 0x0000($v0)           ## 00000000
.L809E3E9C:
/* 0136C 809E3E9C 8D250150 */  lw      $a1, 0x0150($t1)           ## 00000150
/* 01370 809E3EA0 8D26016C */  lw      $a2, 0x016C($t1)           ## 0000016C
/* 01374 809E3EA4 9127014E */  lbu     $a3, 0x014E($t1)           ## 0000014E
/* 01378 809E3EA8 3C0C809E */  lui     $t4, %hi(func_809E3EF8)    ## $t4 = 809E0000
/* 0137C 809E3EAC 3C0D809E */  lui     $t5, %hi(func_809E3F7C)    ## $t5 = 809E0000
/* 01380 809E3EB0 25AD3F7C */  addiu   $t5, $t5, %lo(func_809E3F7C) ## $t5 = 809E3F7C
/* 01384 809E3EB4 258C3EF8 */  addiu   $t4, $t4, %lo(func_809E3EF8) ## $t4 = 809E3EF8
/* 01388 809E3EB8 AFAC0010 */  sw      $t4, 0x0010($sp)
/* 0138C 809E3EBC AFAD0014 */  sw      $t5, 0x0014($sp)
/* 01390 809E3EC0 AFA90018 */  sw      $t1, 0x0018($sp)
/* 01394 809E3EC4 0C0286B2 */  jal     SkelAnime_DrawFlexOpa
/* 01398 809E3EC8 8FA4005C */  lw      $a0, 0x005C($sp)
/* 0139C 809E3ECC 8FAE005C */  lw      $t6, 0x005C($sp)
/* 013A0 809E3ED0 3C06809E */  lui     $a2, %hi(D_809E4180)       ## $a2 = 809E0000
/* 013A4 809E3ED4 24C64180 */  addiu   $a2, $a2, %lo(D_809E4180)  ## $a2 = 809E4180
/* 013A8 809E3ED8 27A40040 */  addiu   $a0, $sp, 0x0040           ## $a0 = FFFFFFE8
/* 013AC 809E3EDC 240704E7 */  addiu   $a3, $zero, 0x04E7         ## $a3 = 000004E7
/* 013B0 809E3EE0 0C031AD5 */  jal     Graph_CloseDisps
/* 013B4 809E3EE4 8DC50000 */  lw      $a1, 0x0000($t6)           ## 00000000
/* 013B8 809E3EE8 8FBF0024 */  lw      $ra, 0x0024($sp)
/* 013BC 809E3EEC 27BD0058 */  addiu   $sp, $sp, 0x0058           ## $sp = 00000000
/* 013C0 809E3EF0 03E00008 */  jr      $ra
/* 013C4 809E3EF4 00000000 */  nop
