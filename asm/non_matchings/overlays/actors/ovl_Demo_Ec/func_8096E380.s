glabel func_8096E380
/* 00ED0 8096E380 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 00ED4 8096E384 AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 00ED8 8096E388 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 00EDC 8096E38C 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00EE0 8096E390 0C25B743 */  jal     func_8096DD0C              
/* 00EE4 8096E394 AFA5002C */  sw      $a1, 0x002C($sp)           
/* 00EE8 8096E398 3C060600 */  lui     $a2, 0x0600                ## $a2 = 06000000
/* 00EEC 8096E39C 24C600F0 */  addiu   $a2, $a2, 0x00F0           ## $a2 = 060000F0
/* 00EF0 8096E3A0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00EF4 8096E3A4 0C25B5CA */  jal     func_8096D728              
/* 00EF8 8096E3A8 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 00EFC 8096E3AC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00F00 8096E3B0 0C25B76F */  jal     func_8096DDBC              
/* 00F04 8096E3B4 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 00F08 8096E3B8 3C050600 */  lui     $a1, 0x0600                ## $a1 = 06000000
/* 00F0C 8096E3BC 24A55670 */  addiu   $a1, $a1, 0x5670           ## $a1 = 06005670
/* 00F10 8096E3C0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00F14 8096E3C4 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 00F18 8096E3C8 24070000 */  addiu   $a3, $zero, 0x0000         ## $a3 = 00000000
/* 00F1C 8096E3CC 0C25B5E7 */  jal     func_8096D79C              
/* 00F20 8096E3D0 AFA00010 */  sw      $zero, 0x0010($sp)         
/* 00F24 8096E3D4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00F28 8096E3D8 0C25B575 */  jal     func_8096D5D4              
/* 00F2C 8096E3DC 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 00F30 8096E3E0 3C068003 */  lui     $a2, %hi(ActorShadow_DrawFunc_Circle)
/* 00F34 8096E3E4 24C6B5EC */  addiu   $a2, %lo(ActorShadow_DrawFunc_Circle)
/* 00F38 8096E3E8 260400B4 */  addiu   $a0, $s0, 0x00B4           ## $a0 = 000000B4
/* 00F3C 8096E3EC 24050000 */  addiu   $a1, $zero, 0x0000         ## $a1 = 00000000
/* 00F40 8096E3F0 0C00AC78 */  jal     ActorShape_Init
              
/* 00F44 8096E3F4 3C0741F0 */  lui     $a3, 0x41F0                ## $a3 = 41F00000
/* 00F48 8096E3F8 24020005 */  addiu   $v0, $zero, 0x0005         ## $v0 = 00000005
/* 00F4C 8096E3FC AE020194 */  sw      $v0, 0x0194($s0)           ## 00000194
/* 00F50 8096E400 AE020198 */  sw      $v0, 0x0198($s0)           ## 00000198
/* 00F54 8096E404 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 00F58 8096E408 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 00F5C 8096E40C 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
/* 00F60 8096E410 03E00008 */  jr      $ra                        
/* 00F64 8096E414 00000000 */  nop
