glabel func_8096EDFC
/* 0194C 8096EDFC 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 01950 8096EE00 AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 01954 8096EE04 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 01958 8096EE08 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 0195C 8096EE0C 0C25B743 */  jal     func_8096DD0C              
/* 01960 8096EE10 AFA5002C */  sw      $a1, 0x002C($sp)           
/* 01964 8096EE14 3C060600 */  lui     $a2, 0x0600                ## $a2 = 06000000
/* 01968 8096EE18 24C60330 */  addiu   $a2, $a2, 0x0330           ## $a2 = 06000330
/* 0196C 8096EE1C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01970 8096EE20 0C25B5CA */  jal     func_8096D728              
/* 01974 8096EE24 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 01978 8096EE28 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0197C 8096EE2C 0C25B76F */  jal     func_8096DDBC              
/* 01980 8096EE30 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 01984 8096EE34 3C050600 */  lui     $a1, 0x0600                ## $a1 = 06000000
/* 01988 8096EE38 24A52254 */  addiu   $a1, $a1, 0x2254           ## $a1 = 06002254
/* 0198C 8096EE3C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01990 8096EE40 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 01994 8096EE44 24070000 */  addiu   $a3, $zero, 0x0000         ## $a3 = 00000000
/* 01998 8096EE48 0C25B5E7 */  jal     func_8096D79C              
/* 0199C 8096EE4C AFA00010 */  sw      $zero, 0x0010($sp)         
/* 019A0 8096EE50 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 019A4 8096EE54 0C25B575 */  jal     func_8096D5D4              
/* 019A8 8096EE58 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 019AC 8096EE5C 3C068003 */  lui     $a2, %hi(ActorShadow_DrawFunc_Circle)
/* 019B0 8096EE60 24C6B5EC */  addiu   $a2, %lo(ActorShadow_DrawFunc_Circle)
/* 019B4 8096EE64 260400B4 */  addiu   $a0, $s0, 0x00B4           ## $a0 = 000000B4
/* 019B8 8096EE68 24050000 */  addiu   $a1, $zero, 0x0000         ## $a1 = 00000000
/* 019BC 8096EE6C 0C00AC78 */  jal     ActorShape_Init
              
/* 019C0 8096EE70 3C0741F0 */  lui     $a3, 0x41F0                ## $a3 = 41F00000
/* 019C4 8096EE74 240E000E */  addiu   $t6, $zero, 0x000E         ## $t6 = 0000000E
/* 019C8 8096EE78 240F000C */  addiu   $t7, $zero, 0x000C         ## $t7 = 0000000C
/* 019CC 8096EE7C AE0E0194 */  sw      $t6, 0x0194($s0)           ## 00000194
/* 019D0 8096EE80 AE0F0198 */  sw      $t7, 0x0198($s0)           ## 00000198
/* 019D4 8096EE84 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 019D8 8096EE88 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 019DC 8096EE8C 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
/* 019E0 8096EE90 03E00008 */  jr      $ra                        
/* 019E4 8096EE94 00000000 */  nop
