glabel func_8096F010
/* 01B60 8096F010 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 01B64 8096F014 AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 01B68 8096F018 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 01B6C 8096F01C 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 01B70 8096F020 0C25B743 */  jal     func_8096DD0C              
/* 01B74 8096F024 AFA5002C */  sw      $a1, 0x002C($sp)           
/* 01B78 8096F028 3C060601 */  lui     $a2, 0x0601                ## $a2 = 06010000
/* 01B7C 8096F02C 24C6BFA8 */  addiu   $a2, $a2, 0xBFA8           ## $a2 = 0600BFA8
/* 01B80 8096F030 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01B84 8096F034 0C25B5CA */  jal     func_8096D728              
/* 01B88 8096F038 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 01B8C 8096F03C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01B90 8096F040 0C25B76F */  jal     func_8096DDBC              
/* 01B94 8096F044 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 01B98 8096F048 3C050601 */  lui     $a1, 0x0601                ## $a1 = 06010000
/* 01B9C 8096F04C 24A5C918 */  addiu   $a1, $a1, 0xC918           ## $a1 = 0600C918
/* 01BA0 8096F050 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01BA4 8096F054 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 01BA8 8096F058 24070000 */  addiu   $a3, $zero, 0x0000         ## $a3 = 00000000
/* 01BAC 8096F05C 0C25B5E7 */  jal     func_8096D79C              
/* 01BB0 8096F060 AFA00010 */  sw      $zero, 0x0010($sp)         
/* 01BB4 8096F064 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01BB8 8096F068 0C25B575 */  jal     func_8096D5D4              
/* 01BBC 8096F06C 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 01BC0 8096F070 3C068003 */  lui     $a2, %hi(ActorShadow_DrawFunc_Circle)
/* 01BC4 8096F074 24C6B5EC */  addiu   $a2, %lo(ActorShadow_DrawFunc_Circle)
/* 01BC8 8096F078 260400B4 */  addiu   $a0, $s0, 0x00B4           ## $a0 = 000000B4
/* 01BCC 8096F07C 24050000 */  addiu   $a1, $zero, 0x0000         ## $a1 = 00000000
/* 01BD0 8096F080 0C00AC78 */  jal     ActorShape_Init
              
/* 01BD4 8096F084 3C0741F0 */  lui     $a3, 0x41F0                ## $a3 = 41F00000
/* 01BD8 8096F088 240E000F */  addiu   $t6, $zero, 0x000F         ## $t6 = 0000000F
/* 01BDC 8096F08C 240F000D */  addiu   $t7, $zero, 0x000D         ## $t7 = 0000000D
/* 01BE0 8096F090 AE0E0194 */  sw      $t6, 0x0194($s0)           ## 00000194
/* 01BE4 8096F094 AE0F0198 */  sw      $t7, 0x0198($s0)           ## 00000198
/* 01BE8 8096F098 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 01BEC 8096F09C 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 01BF0 8096F0A0 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
/* 01BF4 8096F0A4 03E00008 */  jr      $ra                        
/* 01BF8 8096F0A8 00000000 */  nop
