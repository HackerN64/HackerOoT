glabel func_8096E1AC
/* 00CFC 8096E1AC 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 00D00 8096E1B0 AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 00D04 8096E1B4 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 00D08 8096E1B8 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00D0C 8096E1BC 0C25B743 */  jal     func_8096DD0C              
/* 00D10 8096E1C0 AFA5002C */  sw      $a1, 0x002C($sp)           
/* 00D14 8096E1C4 3C060600 */  lui     $a2, 0x0600                ## $a2 = 06000000
/* 00D18 8096E1C8 24C600F0 */  addiu   $a2, $a2, 0x00F0           ## $a2 = 060000F0
/* 00D1C 8096E1CC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00D20 8096E1D0 0C25B5CA */  jal     func_8096D728              
/* 00D24 8096E1D4 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 00D28 8096E1D8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00D2C 8096E1DC 0C25B76F */  jal     func_8096DDBC              
/* 00D30 8096E1E0 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 00D34 8096E1E4 3C050600 */  lui     $a1, 0x0600                ## $a1 = 06000000
/* 00D38 8096E1E8 24A55670 */  addiu   $a1, $a1, 0x5670           ## $a1 = 06005670
/* 00D3C 8096E1EC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00D40 8096E1F0 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 00D44 8096E1F4 24070000 */  addiu   $a3, $zero, 0x0000         ## $a3 = 00000000
/* 00D48 8096E1F8 0C25B5E7 */  jal     func_8096D79C              
/* 00D4C 8096E1FC AFA00010 */  sw      $zero, 0x0010($sp)         
/* 00D50 8096E200 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00D54 8096E204 0C25B575 */  jal     func_8096D5D4              
/* 00D58 8096E208 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 00D5C 8096E20C 3C068003 */  lui     $a2, %hi(ActorShadow_DrawFunc_Circle)
/* 00D60 8096E210 24C6B5EC */  addiu   $a2, %lo(ActorShadow_DrawFunc_Circle)
/* 00D64 8096E214 260400B4 */  addiu   $a0, $s0, 0x00B4           ## $a0 = 000000B4
/* 00D68 8096E218 24050000 */  addiu   $a1, $zero, 0x0000         ## $a1 = 00000000
/* 00D6C 8096E21C 0C00AC78 */  jal     ActorShape_Init
              
/* 00D70 8096E220 3C0741F0 */  lui     $a3, 0x41F0                ## $a3 = 41F00000
/* 00D74 8096E224 24020004 */  addiu   $v0, $zero, 0x0004         ## $v0 = 00000004
/* 00D78 8096E228 AE020194 */  sw      $v0, 0x0194($s0)           ## 00000194
/* 00D7C 8096E22C AE020198 */  sw      $v0, 0x0198($s0)           ## 00000198
/* 00D80 8096E230 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 00D84 8096E234 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 00D88 8096E238 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
/* 00D8C 8096E23C 03E00008 */  jr      $ra                        
/* 00D90 8096E240 00000000 */  nop
