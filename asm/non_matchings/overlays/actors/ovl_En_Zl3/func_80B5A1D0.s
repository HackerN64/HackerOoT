.rdata
glabel D_80B5AA6C
    .asciz "../z_en_zl3.c"
    .balign 4

glabel D_80B5AA7C
    .asciz "../z_en_zl3.c"
    .balign 4

.text
glabel func_80B5A1D0
/* 06E20 80B5A1D0 27BDFF78 */  addiu   $sp, $sp, 0xFF78           ## $sp = FFFFFF78
/* 06E24 80B5A1D4 AFBF002C */  sw      $ra, 0x002C($sp)
/* 06E28 80B5A1D8 AFB10028 */  sw      $s1, 0x0028($sp)
/* 06E2C 80B5A1DC AFB00024 */  sw      $s0, 0x0024($sp)
/* 06E30 80B5A1E0 AFA5008C */  sw      $a1, 0x008C($sp)
/* 06E34 80B5A1E4 84820244 */  lh      $v0, 0x0244($a0)           ## 00000244
/* 06E38 80B5A1E8 3C0F80B6 */  lui     $t7, %hi(D_80B5A43C)       ## $t7 = 80B60000
/* 06E3C 80B5A1EC 3C1980B6 */  lui     $t9, %hi(D_80B5A45C)       ## $t9 = 80B60000
/* 06E40 80B5A1F0 00027080 */  sll     $t6, $v0,  2
/* 06E44 80B5A1F4 01EE7821 */  addu    $t7, $t7, $t6
/* 06E48 80B5A1F8 8DEFA43C */  lw      $t7, %lo(D_80B5A43C)($t7)
/* 06E4C 80B5A1FC 00808825 */  or      $s1, $a0, $zero            ## $s1 = 00000000
/* 06E50 80B5A200 3C0680B6 */  lui     $a2, %hi(D_80B5AA6C)       ## $a2 = 80B60000
/* 06E54 80B5A204 AFAF0078 */  sw      $t7, 0x0078($sp)
/* 06E58 80B5A208 84830248 */  lh      $v1, 0x0248($a0)           ## 00000248
/* 06E5C 80B5A20C 27A40054 */  addiu   $a0, $sp, 0x0054           ## $a0 = FFFFFFCC
/* 06E60 80B5A210 24C6AA6C */  addiu   $a2, $a2, %lo(D_80B5AA6C)  ## $a2 = 80B5AA6C
/* 06E64 80B5A214 0003C080 */  sll     $t8, $v1,  2
/* 06E68 80B5A218 0338C821 */  addu    $t9, $t9, $t8
/* 06E6C 80B5A21C 8F39A45C */  lw      $t9, %lo(D_80B5A45C)($t9)
/* 06E70 80B5A220 2407089D */  addiu   $a3, $zero, 0x089D         ## $a3 = 0000089D
/* 06E74 80B5A224 AFB9006C */  sw      $t9, 0x006C($sp)
/* 06E78 80B5A228 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 06E7C 80B5A22C 0C031AB1 */  jal     Graph_OpenDisps
/* 06E80 80B5A230 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 06E84 80B5A234 8FAB008C */  lw      $t3, 0x008C($sp)
/* 06E88 80B5A238 0C024F61 */  jal     func_80093D84
/* 06E8C 80B5A23C 8D640000 */  lw      $a0, 0x0000($t3)           ## 00000000
/* 06E90 80B5A240 8FA90078 */  lw      $t1, 0x0078($sp)
/* 06E94 80B5A244 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 06E98 80B5A248 3C078016 */  lui     $a3, %hi(gSegments)
/* 06E9C 80B5A24C 00097100 */  sll     $t6, $t1,  4
/* 06EA0 80B5A250 000E7F02 */  srl     $t7, $t6, 28
/* 06EA4 80B5A254 3C0DDB06 */  lui     $t5, 0xDB06                ## $t5 = DB060000
/* 06EA8 80B5A258 244C0008 */  addiu   $t4, $v0, 0x0008           ## $t4 = 00000008
/* 06EAC 80B5A25C AE0C02D0 */  sw      $t4, 0x02D0($s0)           ## 000002D0
/* 06EB0 80B5A260 35AD0020 */  ori     $t5, $t5, 0x0020           ## $t5 = DB060020
/* 06EB4 80B5A264 000FC080 */  sll     $t8, $t7,  2
/* 06EB8 80B5A268 24E76FA8 */  addiu   $a3, %lo(gSegments)
/* 06EBC 80B5A26C 00F82021 */  addu    $a0, $a3, $t8
/* 06EC0 80B5A270 AC4D0000 */  sw      $t5, 0x0000($v0)           ## 00000000
/* 06EC4 80B5A274 8C990000 */  lw      $t9, 0x0000($a0)           ## 00000000
/* 06EC8 80B5A278 3C0800FF */  lui     $t0, 0x00FF                ## $t0 = 00FF0000
/* 06ECC 80B5A27C 3508FFFF */  ori     $t0, $t0, 0xFFFF           ## $t0 = 00FFFFFF
/* 06ED0 80B5A280 01282824 */  and     $a1, $t1, $t0
/* 06ED4 80B5A284 3C068000 */  lui     $a2, 0x8000                ## $a2 = 80000000
/* 06ED8 80B5A288 03255021 */  addu    $t2, $t9, $a1
/* 06EDC 80B5A28C 01465821 */  addu    $t3, $t2, $a2
/* 06EE0 80B5A290 AC4B0004 */  sw      $t3, 0x0004($v0)           ## 00000004
/* 06EE4 80B5A294 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 06EE8 80B5A298 3C0DDB06 */  lui     $t5, 0xDB06                ## $t5 = DB060000
/* 06EEC 80B5A29C 35AD0024 */  ori     $t5, $t5, 0x0024           ## $t5 = DB060024
/* 06EF0 80B5A2A0 244C0008 */  addiu   $t4, $v0, 0x0008           ## $t4 = 00000008
/* 06EF4 80B5A2A4 AE0C02D0 */  sw      $t4, 0x02D0($s0)           ## 000002D0
/* 06EF8 80B5A2A8 AC4D0000 */  sw      $t5, 0x0000($v0)           ## 00000000
/* 06EFC 80B5A2AC 8C8E0000 */  lw      $t6, 0x0000($a0)           ## 00000000
/* 06F00 80B5A2B0 3C0ADB06 */  lui     $t2, 0xDB06                ## $t2 = DB060000
/* 06F04 80B5A2B4 354A0028 */  ori     $t2, $t2, 0x0028           ## $t2 = DB060028
/* 06F08 80B5A2B8 01C57821 */  addu    $t7, $t6, $a1
/* 06F0C 80B5A2BC 01E6C021 */  addu    $t8, $t7, $a2
/* 06F10 80B5A2C0 AC580004 */  sw      $t8, 0x0004($v0)           ## 00000004
/* 06F14 80B5A2C4 8FA4006C */  lw      $a0, 0x006C($sp)
/* 06F18 80B5A2C8 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 06F1C 80B5A2CC 00045900 */  sll     $t3, $a0,  4
/* 06F20 80B5A2D0 000B6702 */  srl     $t4, $t3, 28
/* 06F24 80B5A2D4 24590008 */  addiu   $t9, $v0, 0x0008           ## $t9 = 00000008
/* 06F28 80B5A2D8 AE1902D0 */  sw      $t9, 0x02D0($s0)           ## 000002D0
/* 06F2C 80B5A2DC 000C6880 */  sll     $t5, $t4,  2
/* 06F30 80B5A2E0 00ED7021 */  addu    $t6, $a3, $t5
/* 06F34 80B5A2E4 AC4A0000 */  sw      $t2, 0x0000($v0)           ## 00000000
/* 06F38 80B5A2E8 8DCF0000 */  lw      $t7, 0x0000($t6)           ## 00000000
/* 06F3C 80B5A2EC 0088C024 */  and     $t8, $a0, $t0
/* 06F40 80B5A2F0 3C0CFB00 */  lui     $t4, 0xFB00                ## $t4 = FB000000
/* 06F44 80B5A2F4 01F8C821 */  addu    $t9, $t7, $t8
/* 06F48 80B5A2F8 03265021 */  addu    $t2, $t9, $a2
/* 06F4C 80B5A2FC AC4A0004 */  sw      $t2, 0x0004($v0)           ## 00000004
/* 06F50 80B5A300 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 06F54 80B5A304 3C198011 */  lui     $t9, %hi(D_80116280)
/* 06F58 80B5A308 3C18DB06 */  lui     $t8, 0xDB06                ## $t8 = DB060000
/* 06F5C 80B5A30C 244B0008 */  addiu   $t3, $v0, 0x0008           ## $t3 = 00000008
/* 06F60 80B5A310 AE0B02D0 */  sw      $t3, 0x02D0($s0)           ## 000002D0
/* 06F64 80B5A314 AC4C0000 */  sw      $t4, 0x0000($v0)           ## 00000000
/* 06F68 80B5A318 8E2D0258 */  lw      $t5, 0x0258($s1)           ## 00000258
/* 06F6C 80B5A31C 3718002C */  ori     $t8, $t8, 0x002C           ## $t8 = DB06002C
/* 06F70 80B5A320 27396280 */  addiu   $t9, %lo(D_80116280)
/* 06F74 80B5A324 31AE00FF */  andi    $t6, $t5, 0x00FF           ## $t6 = 00000024
/* 06F78 80B5A328 AC4E0004 */  sw      $t6, 0x0004($v0)           ## 00000004
/* 06F7C 80B5A32C 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 06F80 80B5A330 3C0A80B6 */  lui     $t2, %hi(func_80B59F74)    ## $t2 = 80B60000
/* 06F84 80B5A334 254A9F74 */  addiu   $t2, $t2, %lo(func_80B59F74) ## $t2 = 80B59F74
/* 06F88 80B5A338 244F0008 */  addiu   $t7, $v0, 0x0008           ## $t7 = 00000008
/* 06F8C 80B5A33C AE0F02D0 */  sw      $t7, 0x02D0($s0)           ## 000002D0
/* 06F90 80B5A340 AC590004 */  sw      $t9, 0x0004($v0)           ## 00000004
/* 06F94 80B5A344 AC580000 */  sw      $t8, 0x0000($v0)           ## 00000000
/* 06F98 80B5A348 2622014C */  addiu   $v0, $s1, 0x014C           ## $v0 = 0000014C
/* 06F9C 80B5A34C 8C450004 */  lw      $a1, 0x0004($v0)           ## 00000150
/* 06FA0 80B5A350 8C460020 */  lw      $a2, 0x0020($v0)           ## 0000016C
/* 06FA4 80B5A354 90470002 */  lbu     $a3, 0x0002($v0)           ## 0000014E
/* 06FA8 80B5A358 AFB10018 */  sw      $s1, 0x0018($sp)
/* 06FAC 80B5A35C AFA00014 */  sw      $zero, 0x0014($sp)
/* 06FB0 80B5A360 AFAA0010 */  sw      $t2, 0x0010($sp)
/* 06FB4 80B5A364 8E0B02D0 */  lw      $t3, 0x02D0($s0)           ## 000002D0
/* 06FB8 80B5A368 8FA4008C */  lw      $a0, 0x008C($sp)
/* 06FBC 80B5A36C 0C0289CF */  jal     SkelAnime_DrawSV2
/* 06FC0 80B5A370 AFAB001C */  sw      $t3, 0x001C($sp)
/* 06FC4 80B5A374 AE0202D0 */  sw      $v0, 0x02D0($s0)           ## 000002D0
/* 06FC8 80B5A378 8FAC008C */  lw      $t4, 0x008C($sp)
/* 06FCC 80B5A37C 3C0680B6 */  lui     $a2, %hi(D_80B5AA7C)       ## $a2 = 80B60000
/* 06FD0 80B5A380 24C6AA7C */  addiu   $a2, $a2, %lo(D_80B5AA7C)  ## $a2 = 80B5AA7C
/* 06FD4 80B5A384 27A40054 */  addiu   $a0, $sp, 0x0054           ## $a0 = FFFFFFCC
/* 06FD8 80B5A388 240708BA */  addiu   $a3, $zero, 0x08BA         ## $a3 = 000008BA
/* 06FDC 80B5A38C 0C031AD5 */  jal     Graph_CloseDisps
/* 06FE0 80B5A390 8D850000 */  lw      $a1, 0x0000($t4)           ## 00000000
/* 06FE4 80B5A394 8FBF002C */  lw      $ra, 0x002C($sp)
/* 06FE8 80B5A398 8FB00024 */  lw      $s0, 0x0024($sp)
/* 06FEC 80B5A39C 8FB10028 */  lw      $s1, 0x0028($sp)
/* 06FF0 80B5A3A0 03E00008 */  jr      $ra
/* 06FF4 80B5A3A4 27BD0088 */  addiu   $sp, $sp, 0x0088           ## $sp = 00000000
