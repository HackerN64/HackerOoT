glabel func_80801BF0
/* 01060 80801BF0 27BDFF90 */  addiu   $sp, $sp, 0xFF90           ## $sp = FFFFFF90
/* 01064 80801BF4 AFBF0034 */  sw      $ra, 0x0034($sp)           
/* 01068 80801BF8 AFBE0030 */  sw      $s8, 0x0030($sp)           
/* 0106C 80801BFC AFB1002C */  sw      $s1, 0x002C($sp)           
/* 01070 80801C00 AFB00028 */  sw      $s0, 0x0028($sp)           
/* 01074 80801C04 AFA40070 */  sw      $a0, 0x0070($sp)           
/* 01078 80801C08 8C910000 */  lw      $s1, 0x0000($a0)           ## 00000000
/* 0107C 80801C0C 3C068080 */  lui     $a2, %hi(D_80803550)       ## $a2 = 80800000
/* 01080 80801C10 03A0F025 */  or      $s8, $sp, $zero            ## $s8 = FFFFFF90
/* 01084 80801C14 24C63550 */  addiu   $a2, $a2, %lo(D_80803550)  ## $a2 = 80803550
/* 01088 80801C18 27A40054 */  addiu   $a0, $sp, 0x0054           ## $a0 = FFFFFFE4
/* 0108C 80801C1C 240703D1 */  addiu   $a3, $zero, 0x03D1         ## $a3 = 000003D1
/* 01090 80801C20 0C031AB1 */  jal     Graph_OpenDisps              
/* 01094 80801C24 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 01098 80801C28 8E2302C0 */  lw      $v1, 0x02C0($s1)           ## 000002C0
/* 0109C 80801C2C 3C18DB06 */  lui     $t8, 0xDB06                ## $t8 = DB060000
/* 010A0 80801C30 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 010A4 80801C34 246F0008 */  addiu   $t7, $v1, 0x0008           ## $t7 = 00000008
/* 010A8 80801C38 AE2F02C0 */  sw      $t7, 0x02C0($s1)           ## 000002C0
/* 010AC 80801C3C 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 010B0 80801C40 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 010B4 80801C44 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 010B8 80801C48 AC600004 */  sw      $zero, 0x0004($v1)         ## 00000004
/* 010BC 80801C4C 0C025492 */  jal     func_80095248              
/* 010C0 80801C50 AC780000 */  sw      $t8, 0x0000($v1)           ## 00000000
/* 010C4 80801C54 8FD00070 */  lw      $s0, 0x0070($s8)           ## 00000000
/* 010C8 80801C58 241900F0 */  addiu   $t9, $zero, 0x00F0         ## $t9 = 000000F0
/* 010CC 80801C5C 24080140 */  addiu   $t0, $zero, 0x0140         ## $t0 = 00000140
/* 010D0 80801C60 261000A8 */  addiu   $s0, $s0, 0x00A8           ## $s0 = 000000A8
/* 010D4 80801C64 02002025 */  or      $a0, $s0, $zero            ## $a0 = 000000A8
/* 010D8 80801C68 AFC8004C */  sw      $t0, 0x004C($s8)           ## FFFFFFDC
/* 010DC 80801C6C AFD90044 */  sw      $t9, 0x0044($s8)           ## FFFFFFD4
/* 010E0 80801C70 AFC00040 */  sw      $zero, 0x0040($s8)         ## FFFFFFD0
/* 010E4 80801C74 AFC00048 */  sw      $zero, 0x0048($s8)         ## FFFFFFD8
/* 010E8 80801C78 0C02A93F */  jal     View_SetViewport              
/* 010EC 80801C7C 27C50040 */  addiu   $a1, $s8, 0x0040           ## $a1 = FFFFFFD0
/* 010F0 80801C80 02002025 */  or      $a0, $s0, $zero            ## $a0 = 000000A8
/* 010F4 80801C84 0C02AA94 */  jal     func_800AAA50              
/* 010F8 80801C88 2405000F */  addiu   $a1, $zero, 0x000F         ## $a1 = 0000000F
/* 010FC 80801C8C 0C025050 */  jal     func_80094140              
/* 01100 80801C90 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 01104 80801C94 27BDFFD0 */  addiu   $sp, $sp, 0xFFD0           ## $sp = FFFFFF60
/* 01108 80801C98 27B00010 */  addiu   $s0, $sp, 0x0010           ## $s0 = FFFFFF70
/* 0110C 80801C9C 0C03EEE3 */  jal     GfxPrint_Ctor              
/* 01110 80801CA0 02002025 */  or      $a0, $s0, $zero            ## $a0 = FFFFFF70
/* 01114 80801CA4 02002025 */  or      $a0, $s0, $zero            ## $a0 = FFFFFF70
/* 01118 80801CA8 0C03EF07 */  jal     GfxPrint_Open              
/* 0111C 80801CAC 8E2502C0 */  lw      $a1, 0x02C0($s1)           ## 000002C0
/* 01120 80801CB0 8FC40070 */  lw      $a0, 0x0070($s8)           ## 00000000
/* 01124 80801CB4 0C2005FC */  jal     func_808017F0              
/* 01128 80801CB8 02002825 */  or      $a1, $s0, $zero            ## $a1 = FFFFFF70
/* 0112C 80801CBC 0C03EF19 */  jal     GfxPrint_Close              
/* 01130 80801CC0 02002025 */  or      $a0, $s0, $zero            ## $a0 = FFFFFF70
/* 01134 80801CC4 AE2202C0 */  sw      $v0, 0x02C0($s1)           ## 000002C0
/* 01138 80801CC8 0C03EF05 */  jal     GfxPrint_Dtor              
/* 0113C 80801CCC 02002025 */  or      $a0, $s0, $zero            ## $a0 = FFFFFF70
/* 01140 80801CD0 3C068080 */  lui     $a2, %hi(D_80803560)       ## $a2 = 80800000
/* 01144 80801CD4 24C63560 */  addiu   $a2, $a2, %lo(D_80803560)  ## $a2 = 80803560
/* 01148 80801CD8 27C40054 */  addiu   $a0, $s8, 0x0054           ## $a0 = FFFFFFE4
/* 0114C 80801CDC 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 01150 80801CE0 0C031AD5 */  jal     Graph_CloseDisps              
/* 01154 80801CE4 240703EE */  addiu   $a3, $zero, 0x03EE         ## $a3 = 000003EE
/* 01158 80801CE8 8FDF0034 */  lw      $ra, 0x0034($s8)           ## FFFFFFC4
/* 0115C 80801CEC 03C0E825 */  or      $sp, $s8, $zero            ## $sp = FFFFFF90
/* 01160 80801CF0 8FD00028 */  lw      $s0, 0x0028($s8)           ## FFFFFFB8
/* 01164 80801CF4 8FD1002C */  lw      $s1, 0x002C($s8)           ## FFFFFFBC
/* 01168 80801CF8 8FDE0030 */  lw      $s8, 0x0030($s8)           ## FFFFFFC0
/* 0116C 80801CFC 03E00008 */  jr      $ra                        
/* 01170 80801D00 27BD0070 */  addiu   $sp, $sp, 0x0070           ## $sp = 00000000
