.rdata
glabel D_80AB5010
    .asciz "../z_en_nb_inKenjyanomaDemo02.c"
    .balign 4

glabel D_80AB5030
    .asciz "../z_en_nb_inKenjyanomaDemo02.c"
    .balign 4

.text
glabel func_80AB1E2C
/* 0109C 80AB1E2C 27BDFF88 */  addiu   $sp, $sp, 0xFF88           ## $sp = FFFFFF88
/* 010A0 80AB1E30 AFBF002C */  sw      $ra, 0x002C($sp)
/* 010A4 80AB1E34 AFB00028 */  sw      $s0, 0x0028($sp)
/* 010A8 80AB1E38 AFA40078 */  sw      $a0, 0x0078($sp)
/* 010AC 80AB1E3C AFA5007C */  sw      $a1, 0x007C($sp)
/* 010B0 80AB1E40 84820274 */  lh      $v0, 0x0274($a0)           ## 00000274
/* 010B4 80AB1E44 3C1880AB */  lui     $t8, %hi(D_80AB430C)       ## $t8 = 80AB0000
/* 010B8 80AB1E48 3C0680AB */  lui     $a2, %hi(D_80AB5010)       ## $a2 = 80AB0000
/* 010BC 80AB1E4C 00027880 */  sll     $t7, $v0,  2
/* 010C0 80AB1E50 030FC021 */  addu    $t8, $t8, $t7
/* 010C4 80AB1E54 8F18430C */  lw      $t8, %lo(D_80AB430C)($t8)
/* 010C8 80AB1E58 24C65010 */  addiu   $a2, $a2, %lo(D_80AB5010)  ## $a2 = 80AB5010
/* 010CC 80AB1E5C 27A40050 */  addiu   $a0, $sp, 0x0050           ## $a0 = FFFFFFD8
/* 010D0 80AB1E60 AFB80068 */  sw      $t8, 0x0068($sp)
/* 010D4 80AB1E64 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 010D8 80AB1E68 24070107 */  addiu   $a3, $zero, 0x0107         ## $a3 = 00000107
/* 010DC 80AB1E6C 0C031AB1 */  jal     Graph_OpenDisps
/* 010E0 80AB1E70 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 010E4 80AB1E74 8FA9007C */  lw      $t1, 0x007C($sp)
/* 010E8 80AB1E78 0C024F61 */  jal     func_80093D84
/* 010EC 80AB1E7C 8D240000 */  lw      $a0, 0x0000($t1)           ## 00000000
/* 010F0 80AB1E80 8FA70068 */  lw      $a3, 0x0068($sp)
/* 010F4 80AB1E84 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 010F8 80AB1E88 3C0BDB06 */  lui     $t3, 0xDB06                ## $t3 = DB060000
/* 010FC 80AB1E8C 00076100 */  sll     $t4, $a3,  4
/* 01100 80AB1E90 000C6F02 */  srl     $t5, $t4, 28
/* 01104 80AB1E94 3C0F8016 */  lui     $t7, %hi(gSegments)
/* 01108 80AB1E98 244A0008 */  addiu   $t2, $v0, 0x0008           ## $t2 = 00000008
/* 0110C 80AB1E9C AE0A02D0 */  sw      $t2, 0x02D0($s0)           ## 000002D0
/* 01110 80AB1EA0 25EF6FA8 */  addiu   $t7, %lo(gSegments)
/* 01114 80AB1EA4 000D7080 */  sll     $t6, $t5,  2
/* 01118 80AB1EA8 356B0020 */  ori     $t3, $t3, 0x0020           ## $t3 = DB060020
/* 0111C 80AB1EAC 01CF2021 */  addu    $a0, $t6, $t7
/* 01120 80AB1EB0 AC4B0000 */  sw      $t3, 0x0000($v0)           ## 00000000
/* 01124 80AB1EB4 8C980000 */  lw      $t8, 0x0000($a0)           ## 00000000
/* 01128 80AB1EB8 3C0100FF */  lui     $at, 0x00FF                ## $at = 00FF0000
/* 0112C 80AB1EBC 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = 00FFFFFF
/* 01130 80AB1EC0 00E12824 */  and     $a1, $a3, $at
/* 01134 80AB1EC4 3C068000 */  lui     $a2, 0x8000                ## $a2 = 80000000
/* 01138 80AB1EC8 0305C821 */  addu    $t9, $t8, $a1
/* 0113C 80AB1ECC 03264821 */  addu    $t1, $t9, $a2
/* 01140 80AB1ED0 AC490004 */  sw      $t1, 0x0004($v0)           ## 00000004
/* 01144 80AB1ED4 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 01148 80AB1ED8 3C0BDB06 */  lui     $t3, 0xDB06                ## $t3 = DB060000
/* 0114C 80AB1EDC 356B0024 */  ori     $t3, $t3, 0x0024           ## $t3 = DB060024
/* 01150 80AB1EE0 244A0008 */  addiu   $t2, $v0, 0x0008           ## $t2 = 00000008
/* 01154 80AB1EE4 AE0A02D0 */  sw      $t2, 0x02D0($s0)           ## 000002D0
/* 01158 80AB1EE8 AC4B0000 */  sw      $t3, 0x0000($v0)           ## 00000000
/* 0115C 80AB1EEC 8C8C0000 */  lw      $t4, 0x0000($a0)           ## 00000000
/* 01160 80AB1EF0 3C18FB00 */  lui     $t8, 0xFB00                ## $t8 = FB000000
/* 01164 80AB1EF4 3C0BDB06 */  lui     $t3, 0xDB06                ## $t3 = DB060000
/* 01168 80AB1EF8 01856821 */  addu    $t5, $t4, $a1
/* 0116C 80AB1EFC 01A67021 */  addu    $t6, $t5, $a2
/* 01170 80AB1F00 AC4E0004 */  sw      $t6, 0x0004($v0)           ## 00000004
/* 01174 80AB1F04 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 01178 80AB1F08 8FA80078 */  lw      $t0, 0x0078($sp)
/* 0117C 80AB1F0C 3C0C8011 */  lui     $t4, %hi(D_80116280)
/* 01180 80AB1F10 244F0008 */  addiu   $t7, $v0, 0x0008           ## $t7 = 00000008
/* 01184 80AB1F14 AE0F02D0 */  sw      $t7, 0x02D0($s0)           ## 000002D0
/* 01188 80AB1F18 AC580000 */  sw      $t8, 0x0000($v0)           ## 00000000
/* 0118C 80AB1F1C 8D190284 */  lw      $t9, 0x0284($t0)           ## 00000284
/* 01190 80AB1F20 258C6280 */  addiu   $t4, %lo(D_80116280)
/* 01194 80AB1F24 356B0030 */  ori     $t3, $t3, 0x0030           ## $t3 = DB060030
/* 01198 80AB1F28 332900FF */  andi    $t1, $t9, 0x00FF           ## $t1 = 00000000
/* 0119C 80AB1F2C AC490004 */  sw      $t1, 0x0004($v0)           ## 00000004
/* 011A0 80AB1F30 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 011A4 80AB1F34 244A0008 */  addiu   $t2, $v0, 0x0008           ## $t2 = 00000008
/* 011A8 80AB1F38 AE0A02D0 */  sw      $t2, 0x02D0($s0)           ## 000002D0
/* 011AC 80AB1F3C AC4C0004 */  sw      $t4, 0x0004($v0)           ## 00000004
/* 011B0 80AB1F40 AC4B0000 */  sw      $t3, 0x0000($v0)           ## 00000000
/* 011B4 80AB1F44 2502014C */  addiu   $v0, $t0, 0x014C           ## $v0 = 0000014C
/* 011B8 80AB1F48 8C450004 */  lw      $a1, 0x0004($v0)           ## 00000150
/* 011BC 80AB1F4C 8C460020 */  lw      $a2, 0x0020($v0)           ## 0000016C
/* 011C0 80AB1F50 90470002 */  lbu     $a3, 0x0002($v0)           ## 0000014E
/* 011C4 80AB1F54 AFA00018 */  sw      $zero, 0x0018($sp)
/* 011C8 80AB1F58 AFA00014 */  sw      $zero, 0x0014($sp)
/* 011CC 80AB1F5C AFA00010 */  sw      $zero, 0x0010($sp)
/* 011D0 80AB1F60 8E0D02D0 */  lw      $t5, 0x02D0($s0)           ## 000002D0
/* 011D4 80AB1F64 8FA4007C */  lw      $a0, 0x007C($sp)
/* 011D8 80AB1F68 0C0289CF */  jal     SkelAnime_DrawFlex
/* 011DC 80AB1F6C AFAD001C */  sw      $t5, 0x001C($sp)
/* 011E0 80AB1F70 AE0202D0 */  sw      $v0, 0x02D0($s0)           ## 000002D0
/* 011E4 80AB1F74 8FAE007C */  lw      $t6, 0x007C($sp)
/* 011E8 80AB1F78 3C0680AB */  lui     $a2, %hi(D_80AB5030)       ## $a2 = 80AB0000
/* 011EC 80AB1F7C 24C65030 */  addiu   $a2, $a2, %lo(D_80AB5030)  ## $a2 = 80AB5030
/* 011F0 80AB1F80 27A40050 */  addiu   $a0, $sp, 0x0050           ## $a0 = FFFFFFD8
/* 011F4 80AB1F84 24070122 */  addiu   $a3, $zero, 0x0122         ## $a3 = 00000122
/* 011F8 80AB1F88 0C031AD5 */  jal     Graph_CloseDisps
/* 011FC 80AB1F8C 8DC50000 */  lw      $a1, 0x0000($t6)           ## 00000000
/* 01200 80AB1F90 8FBF002C */  lw      $ra, 0x002C($sp)
/* 01204 80AB1F94 8FB00028 */  lw      $s0, 0x0028($sp)
/* 01208 80AB1F98 27BD0078 */  addiu   $sp, $sp, 0x0078           ## $sp = 00000000
/* 0120C 80AB1F9C 03E00008 */  jr      $ra
/* 01210 80AB1FA0 00000000 */  nop
