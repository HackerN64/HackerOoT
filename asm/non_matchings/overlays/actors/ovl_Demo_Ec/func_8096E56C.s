glabel func_8096E56C
/* 010BC 8096E56C 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 010C0 8096E570 AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 010C4 8096E574 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 010C8 8096E578 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 010CC 8096E57C 0C25B743 */  jal     func_8096DD0C              
/* 010D0 8096E580 AFA5002C */  sw      $a1, 0x002C($sp)           
/* 010D4 8096E584 3C060600 */  lui     $a2, 0x0600                ## $a2 = 06000000
/* 010D8 8096E588 24C600F0 */  addiu   $a2, $a2, 0x00F0           ## $a2 = 060000F0
/* 010DC 8096E58C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 010E0 8096E590 0C25B5CA */  jal     func_8096D728              
/* 010E4 8096E594 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 010E8 8096E598 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 010EC 8096E59C 0C25B76F */  jal     func_8096DDBC              
/* 010F0 8096E5A0 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 010F4 8096E5A4 3C050600 */  lui     $a1, 0x0600                ## $a1 = 06000000
/* 010F8 8096E5A8 24A55EA8 */  addiu   $a1, $a1, 0x5EA8           ## $a1 = 06005EA8
/* 010FC 8096E5AC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01100 8096E5B0 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 01104 8096E5B4 24070000 */  addiu   $a3, $zero, 0x0000         ## $a3 = 00000000
/* 01108 8096E5B8 0C25B5E7 */  jal     func_8096D79C              
/* 0110C 8096E5BC AFA00010 */  sw      $zero, 0x0010($sp)         
/* 01110 8096E5C0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01114 8096E5C4 0C25B575 */  jal     func_8096D5D4              
/* 01118 8096E5C8 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 0111C 8096E5CC 3C068003 */  lui     $a2, %hi(ActorShadow_DrawFunc_Circle)
/* 01120 8096E5D0 24C6B5EC */  addiu   $a2, %lo(ActorShadow_DrawFunc_Circle)
/* 01124 8096E5D4 260400B4 */  addiu   $a0, $s0, 0x00B4           ## $a0 = 000000B4
/* 01128 8096E5D8 24050000 */  addiu   $a1, $zero, 0x0000         ## $a1 = 00000000
/* 0112C 8096E5DC 0C00AC78 */  jal     ActorShape_Init
              
/* 01130 8096E5E0 3C0741F0 */  lui     $a3, 0x41F0                ## $a3 = 41F00000
/* 01134 8096E5E4 24020006 */  addiu   $v0, $zero, 0x0006         ## $v0 = 00000006
/* 01138 8096E5E8 AE020194 */  sw      $v0, 0x0194($s0)           ## 00000194
/* 0113C 8096E5EC AE020198 */  sw      $v0, 0x0198($s0)           ## 00000198
/* 01140 8096E5F0 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 01144 8096E5F4 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 01148 8096E5F8 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
/* 0114C 8096E5FC 03E00008 */  jr      $ra                        
/* 01150 8096E600 00000000 */  nop
