glabel func_8096FFBC
/* 02B0C 8096FFBC 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 02B10 8096FFC0 AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 02B14 8096FFC4 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 02B18 8096FFC8 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 02B1C 8096FFCC 0C25B743 */  jal     func_8096DD0C              
/* 02B20 8096FFD0 AFA5002C */  sw      $a1, 0x002C($sp)           
/* 02B24 8096FFD4 3C060601 */  lui     $a2, 0x0601                ## $a2 = 06010000
/* 02B28 8096FFD8 24C68D90 */  addiu   $a2, $a2, 0x8D90           ## $a2 = 06008D90
/* 02B2C 8096FFDC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 02B30 8096FFE0 0C25B5CA */  jal     func_8096D728              
/* 02B34 8096FFE4 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 02B38 8096FFE8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 02B3C 8096FFEC 0C25B76F */  jal     func_8096DDBC              
/* 02B40 8096FFF0 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 02B44 8096FFF4 3C050601 */  lui     $a1, 0x0601                ## $a1 = 06010000
/* 02B48 8096FFF8 24A59EE0 */  addiu   $a1, $a1, 0x9EE0           ## $a1 = 06009EE0
/* 02B4C 8096FFFC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 02B50 80970000 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 02B54 80970004 24070000 */  addiu   $a3, $zero, 0x0000         ## $a3 = 00000000
/* 02B58 80970008 0C25B5E7 */  jal     func_8096D79C              
/* 02B5C 8097000C AFA00010 */  sw      $zero, 0x0010($sp)         
/* 02B60 80970010 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 02B64 80970014 0C25B575 */  jal     func_8096D5D4              
/* 02B68 80970018 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 02B6C 8097001C 3C068003 */  lui     $a2, %hi(ActorShadow_DrawFunc_Circle)
/* 02B70 80970020 24C6B5EC */  addiu   $a2, %lo(ActorShadow_DrawFunc_Circle)
/* 02B74 80970024 260400B4 */  addiu   $a0, $s0, 0x00B4           ## $a0 = 000000B4
/* 02B78 80970028 24050000 */  addiu   $a1, $zero, 0x0000         ## $a1 = 00000000
/* 02B7C 8097002C 0C00AC78 */  jal     ActorShape_Init
              
/* 02B80 80970030 3C0741F0 */  lui     $a3, 0x41F0                ## $a3 = 41F00000
/* 02B84 80970034 240E001C */  addiu   $t6, $zero, 0x001C         ## $t6 = 0000001C
/* 02B88 80970038 240F0017 */  addiu   $t7, $zero, 0x0017         ## $t7 = 00000017
/* 02B8C 8097003C AE0E0194 */  sw      $t6, 0x0194($s0)           ## 00000194
/* 02B90 80970040 AE0F0198 */  sw      $t7, 0x0198($s0)           ## 00000198
/* 02B94 80970044 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 02B98 80970048 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 02B9C 8097004C 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
/* 02BA0 80970050 03E00008 */  jr      $ra                        
/* 02BA4 80970054 00000000 */  nop
