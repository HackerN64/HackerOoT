.rdata
glabel D_80AB50C4
    .asciz "../z_en_nb_inConfrontion.c"
    .balign 4

glabel D_80AB50E0
    .asciz "../z_en_nb_inConfrontion.c"
    .balign 4

.text
glabel func_80AB2E70
/* 020E0 80AB2E70 27BDFFA0 */  addiu   $sp, $sp, 0xFFA0           ## $sp = FFFFFFA0
/* 020E4 80AB2E74 AFBF0024 */  sw      $ra, 0x0024($sp)
/* 020E8 80AB2E78 AFA40060 */  sw      $a0, 0x0060($sp)
/* 020EC 80AB2E7C AFA50064 */  sw      $a1, 0x0064($sp)
/* 020F0 80AB2E80 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 020F4 80AB2E84 3C0680AB */  lui     $a2, %hi(D_80AB50C4)       ## $a2 = 80AB0000
/* 020F8 80AB2E88 24C650C4 */  addiu   $a2, $a2, %lo(D_80AB50C4)  ## $a2 = 80AB50C4
/* 020FC 80AB2E8C 27A40044 */  addiu   $a0, $sp, 0x0044           ## $a0 = FFFFFFE4
/* 02100 80AB2E90 2407023C */  addiu   $a3, $zero, 0x023C         ## $a3 = 0000023C
/* 02104 80AB2E94 0C031AB1 */  jal     Graph_OpenDisps
/* 02108 80AB2E98 AFA50054 */  sw      $a1, 0x0054($sp)
/* 0210C 80AB2E9C 8FAF0064 */  lw      $t7, 0x0064($sp)
/* 02110 80AB2EA0 0C024F46 */  jal     func_80093D18
/* 02114 80AB2EA4 8DE40000 */  lw      $a0, 0x0000($t7)           ## 00000000
/* 02118 80AB2EA8 8FA80054 */  lw      $t0, 0x0054($sp)
/* 0211C 80AB2EAC 3C040601 */  lui     $a0, 0x0601                ## $a0 = 06010000
/* 02120 80AB2EB0 2484D8E8 */  addiu   $a0, $a0, 0xD8E8           ## $a0 = 0600D8E8
/* 02124 80AB2EB4 8D0202C0 */  lw      $v0, 0x02C0($t0)           ## 000002C0
/* 02128 80AB2EB8 00044900 */  sll     $t1, $a0,  4
/* 0212C 80AB2EBC 00095702 */  srl     $t2, $t1, 28
/* 02130 80AB2EC0 3C19DB06 */  lui     $t9, 0xDB06                ## $t9 = DB060000
/* 02134 80AB2EC4 3C0C8016 */  lui     $t4, %hi(gSegments)
/* 02138 80AB2EC8 24580008 */  addiu   $t8, $v0, 0x0008           ## $t8 = 00000008
/* 0213C 80AB2ECC 258C6FA8 */  addiu   $t4, %lo(gSegments)
/* 02140 80AB2ED0 37390020 */  ori     $t9, $t9, 0x0020           ## $t9 = DB060020
/* 02144 80AB2ED4 000A5880 */  sll     $t3, $t2,  2
/* 02148 80AB2ED8 AD1802C0 */  sw      $t8, 0x02C0($t0)           ## 000002C0
/* 0214C 80AB2EDC 016C2821 */  addu    $a1, $t3, $t4
/* 02150 80AB2EE0 AC590000 */  sw      $t9, 0x0000($v0)           ## 00000000
/* 02154 80AB2EE4 8CAD0000 */  lw      $t5, 0x0000($a1)           ## 00000000
/* 02158 80AB2EE8 3C0100FF */  lui     $at, 0x00FF                ## $at = 00FF0000
/* 0215C 80AB2EEC 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = 00FFFFFF
/* 02160 80AB2EF0 00813024 */  and     $a2, $a0, $at
/* 02164 80AB2EF4 3C078000 */  lui     $a3, 0x8000                ## $a3 = 80000000
/* 02168 80AB2EF8 01A67021 */  addu    $t6, $t5, $a2
/* 0216C 80AB2EFC 01C77821 */  addu    $t7, $t6, $a3
/* 02170 80AB2F00 AC4F0004 */  sw      $t7, 0x0004($v0)           ## 00000004
/* 02174 80AB2F04 8D0202C0 */  lw      $v0, 0x02C0($t0)           ## 000002C0
/* 02178 80AB2F08 3C19DB06 */  lui     $t9, 0xDB06                ## $t9 = DB060000
/* 0217C 80AB2F0C 37390024 */  ori     $t9, $t9, 0x0024           ## $t9 = DB060024
/* 02180 80AB2F10 24580008 */  addiu   $t8, $v0, 0x0008           ## $t8 = 00000008
/* 02184 80AB2F14 AD1802C0 */  sw      $t8, 0x02C0($t0)           ## 000002C0
/* 02188 80AB2F18 AC590000 */  sw      $t9, 0x0000($v0)           ## 00000000
/* 0218C 80AB2F1C 8CA90000 */  lw      $t1, 0x0000($a1)           ## 00000000
/* 02190 80AB2F20 240E00FF */  addiu   $t6, $zero, 0x00FF         ## $t6 = 000000FF
/* 02194 80AB2F24 3C0DFB00 */  lui     $t5, 0xFB00                ## $t5 = FB000000
/* 02198 80AB2F28 01265021 */  addu    $t2, $t1, $a2
/* 0219C 80AB2F2C 01475821 */  addu    $t3, $t2, $a3
/* 021A0 80AB2F30 AC4B0004 */  sw      $t3, 0x0004($v0)           ## 00000004
/* 021A4 80AB2F34 8D0202C0 */  lw      $v0, 0x02C0($t0)           ## 000002C0
/* 021A8 80AB2F38 3C198011 */  lui     $t9, %hi(D_80116280+0x10)
/* 021AC 80AB2F3C 3C18DB06 */  lui     $t8, 0xDB06                ## $t8 = DB060000
/* 021B0 80AB2F40 244C0008 */  addiu   $t4, $v0, 0x0008           ## $t4 = 00000008
/* 021B4 80AB2F44 AD0C02C0 */  sw      $t4, 0x02C0($t0)           ## 000002C0
/* 021B8 80AB2F48 AC4E0004 */  sw      $t6, 0x0004($v0)           ## 00000004
/* 021BC 80AB2F4C AC4D0000 */  sw      $t5, 0x0000($v0)           ## 00000000
/* 021C0 80AB2F50 8D0202C0 */  lw      $v0, 0x02C0($t0)           ## 000002C0
/* 021C4 80AB2F54 37180030 */  ori     $t8, $t8, 0x0030           ## $t8 = DB060030
/* 021C8 80AB2F58 27396290 */  addiu   $t9, %lo(D_80116280+0x10)
/* 021CC 80AB2F5C 244F0008 */  addiu   $t7, $v0, 0x0008           ## $t7 = 00000008
/* 021D0 80AB2F60 AD0F02C0 */  sw      $t7, 0x02C0($t0)           ## 000002C0
/* 021D4 80AB2F64 AC590004 */  sw      $t9, 0x0004($v0)           ## 00000004
/* 021D8 80AB2F68 AC580000 */  sw      $t8, 0x0000($v0)           ## 00000000
/* 021DC 80AB2F6C 8FA30060 */  lw      $v1, 0x0060($sp)
/* 021E0 80AB2F70 8FA40064 */  lw      $a0, 0x0064($sp)
/* 021E4 80AB2F74 2462014C */  addiu   $v0, $v1, 0x014C           ## $v0 = 0000014C
/* 021E8 80AB2F78 8C450004 */  lw      $a1, 0x0004($v0)           ## 00000150
/* 021EC 80AB2F7C 8C460020 */  lw      $a2, 0x0020($v0)           ## 0000016C
/* 021F0 80AB2F80 90470002 */  lbu     $a3, 0x0002($v0)           ## 0000014E
/* 021F4 80AB2F84 AFA00014 */  sw      $zero, 0x0014($sp)
/* 021F8 80AB2F88 AFA00010 */  sw      $zero, 0x0010($sp)
/* 021FC 80AB2F8C 0C0286B2 */  jal     SkelAnime_DrawFlexOpa
/* 02200 80AB2F90 AFA30018 */  sw      $v1, 0x0018($sp)
/* 02204 80AB2F94 8FA90064 */  lw      $t1, 0x0064($sp)
/* 02208 80AB2F98 3C0680AB */  lui     $a2, %hi(D_80AB50E0)       ## $a2 = 80AB0000
/* 0220C 80AB2F9C 24C650E0 */  addiu   $a2, $a2, %lo(D_80AB50E0)  ## $a2 = 80AB50E0
/* 02210 80AB2FA0 27A40044 */  addiu   $a0, $sp, 0x0044           ## $a0 = FFFFFFE4
/* 02214 80AB2FA4 24070251 */  addiu   $a3, $zero, 0x0251         ## $a3 = 00000251
/* 02218 80AB2FA8 0C031AD5 */  jal     Graph_CloseDisps
/* 0221C 80AB2FAC 8D250000 */  lw      $a1, 0x0000($t1)           ## 00000000
/* 02220 80AB2FB0 8FBF0024 */  lw      $ra, 0x0024($sp)
/* 02224 80AB2FB4 27BD0060 */  addiu   $sp, $sp, 0x0060           ## $sp = 00000000
/* 02228 80AB2FB8 03E00008 */  jr      $ra
/* 0222C 80AB2FBC 00000000 */  nop
