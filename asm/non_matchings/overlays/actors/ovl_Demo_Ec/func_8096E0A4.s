glabel func_8096E0A4
/* 00BF4 8096E0A4 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 00BF8 8096E0A8 AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 00BFC 8096E0AC AFB00020 */  sw      $s0, 0x0020($sp)           
/* 00C00 8096E0B0 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00C04 8096E0B4 0C25B743 */  jal     func_8096DD0C              
/* 00C08 8096E0B8 AFA5002C */  sw      $a1, 0x002C($sp)           
/* 00C0C 8096E0BC 3C060600 */  lui     $a2, 0x0600                ## $a2 = 06000000
/* 00C10 8096E0C0 24C66C90 */  addiu   $a2, $a2, 0x6C90           ## $a2 = 06006C90
/* 00C14 8096E0C4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00C18 8096E0C8 0C25B5CA */  jal     func_8096D728              
/* 00C1C 8096E0CC 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 00C20 8096E0D0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00C24 8096E0D4 0C25B76F */  jal     func_8096DDBC              
/* 00C28 8096E0D8 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 00C2C 8096E0DC 3C050600 */  lui     $a1, 0x0600                ## $a1 = 06000000
/* 00C30 8096E0E0 24A5196C */  addiu   $a1, $a1, 0x196C           ## $a1 = 0600196C
/* 00C34 8096E0E4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00C38 8096E0E8 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 00C3C 8096E0EC 24070000 */  addiu   $a3, $zero, 0x0000         ## $a3 = 00000000
/* 00C40 8096E0F0 0C25B5E7 */  jal     func_8096D79C              
/* 00C44 8096E0F4 AFA00010 */  sw      $zero, 0x0010($sp)         
/* 00C48 8096E0F8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00C4C 8096E0FC 0C25B575 */  jal     func_8096D5D4              
/* 00C50 8096E100 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 00C54 8096E104 3C068003 */  lui     $a2, %hi(ActorShadow_DrawFunc_Circle)
/* 00C58 8096E108 24C6B5EC */  addiu   $a2, %lo(ActorShadow_DrawFunc_Circle)
/* 00C5C 8096E10C 260400B4 */  addiu   $a0, $s0, 0x00B4           ## $a0 = 000000B4
/* 00C60 8096E110 24050000 */  addiu   $a1, $zero, 0x0000         ## $a1 = 00000000
/* 00C64 8096E114 0C00AC78 */  jal     ActorShape_Init
              
/* 00C68 8096E118 3C0741F0 */  lui     $a3, 0x41F0                ## $a3 = 41F00000
/* 00C6C 8096E11C 24020003 */  addiu   $v0, $zero, 0x0003         ## $v0 = 00000003
/* 00C70 8096E120 AE020194 */  sw      $v0, 0x0194($s0)           ## 00000194
/* 00C74 8096E124 AE020198 */  sw      $v0, 0x0198($s0)           ## 00000198
/* 00C78 8096E128 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 00C7C 8096E12C 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 00C80 8096E130 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
/* 00C84 8096E134 03E00008 */  jr      $ra                        
/* 00C88 8096E138 00000000 */  nop
