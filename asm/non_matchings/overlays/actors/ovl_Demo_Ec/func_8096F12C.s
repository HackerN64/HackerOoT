glabel func_8096F12C
/* 01C7C 8096F12C 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 01C80 8096F130 AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 01C84 8096F134 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 01C88 8096F138 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 01C8C 8096F13C 0C25B743 */  jal     func_8096DD0C              
/* 01C90 8096F140 AFA5002C */  sw      $a1, 0x002C($sp)           
/* 01C94 8096F144 3C060601 */  lui     $a2, 0x0601                ## $a2 = 06010000
/* 01C98 8096F148 24C686D0 */  addiu   $a2, $a2, 0x86D0           ## $a2 = 060086D0
/* 01C9C 8096F14C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01CA0 8096F150 0C25B5CA */  jal     func_8096D728              
/* 01CA4 8096F154 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 01CA8 8096F158 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01CAC 8096F15C 0C25B76F */  jal     func_8096DDBC              
/* 01CB0 8096F160 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 01CB4 8096F164 3C050600 */  lui     $a1, 0x0600                ## $a1 = 06000000
/* 01CB8 8096F168 24A56C40 */  addiu   $a1, $a1, 0x6C40           ## $a1 = 06006C40
/* 01CBC 8096F16C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01CC0 8096F170 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 01CC4 8096F174 24070000 */  addiu   $a3, $zero, 0x0000         ## $a3 = 00000000
/* 01CC8 8096F178 0C25B5E7 */  jal     func_8096D79C              
/* 01CCC 8096F17C AFA00010 */  sw      $zero, 0x0010($sp)         
/* 01CD0 8096F180 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01CD4 8096F184 0C25B575 */  jal     func_8096D5D4              
/* 01CD8 8096F188 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 01CDC 8096F18C 3C068003 */  lui     $a2, %hi(ActorShadow_DrawFunc_Circle)
/* 01CE0 8096F190 24C6B5EC */  addiu   $a2, %lo(ActorShadow_DrawFunc_Circle)
/* 01CE4 8096F194 260400B4 */  addiu   $a0, $s0, 0x00B4           ## $a0 = 000000B4
/* 01CE8 8096F198 24050000 */  addiu   $a1, $zero, 0x0000         ## $a1 = 00000000
/* 01CEC 8096F19C 0C00AC78 */  jal     ActorShape_Init
              
/* 01CF0 8096F1A0 3C0741F0 */  lui     $a3, 0x41F0                ## $a3 = 41F00000
/* 01CF4 8096F1A4 240E0010 */  addiu   $t6, $zero, 0x0010         ## $t6 = 00000010
/* 01CF8 8096F1A8 240F000E */  addiu   $t7, $zero, 0x000E         ## $t7 = 0000000E
/* 01CFC 8096F1AC AE0E0194 */  sw      $t6, 0x0194($s0)           ## 00000194
/* 01D00 8096F1B0 AE0F0198 */  sw      $t7, 0x0198($s0)           ## 00000198
/* 01D04 8096F1B4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01D08 8096F1B8 0C25B5C5 */  jal     func_8096D714              
/* 01D0C 8096F1BC 24050003 */  addiu   $a1, $zero, 0x0003         ## $a1 = 00000003
/* 01D10 8096F1C0 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 01D14 8096F1C4 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 01D18 8096F1C8 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
/* 01D1C 8096F1CC 03E00008 */  jr      $ra                        
/* 01D20 8096F1D0 00000000 */  nop
