glabel func_8096E9E8
/* 01538 8096E9E8 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 0153C 8096E9EC AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 01540 8096E9F0 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 01544 8096E9F4 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 01548 8096E9F8 0C25B743 */  jal     func_8096DD0C              
/* 0154C 8096E9FC AFA5002C */  sw      $a1, 0x002C($sp)           
/* 01550 8096EA00 3C060600 */  lui     $a2, 0x0600                ## $a2 = 06000000
/* 01554 8096EA04 24C67150 */  addiu   $a2, $a2, 0x7150           ## $a2 = 06007150
/* 01558 8096EA08 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0155C 8096EA0C 0C25B5CA */  jal     func_8096D728              
/* 01560 8096EA10 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 01564 8096EA14 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01568 8096EA18 0C25B76F */  jal     func_8096DDBC              
/* 0156C 8096EA1C 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 01570 8096EA20 3C050600 */  lui     $a1, 0x0600                ## $a1 = 06000000
/* 01574 8096EA24 24A5164C */  addiu   $a1, $a1, 0x164C           ## $a1 = 0600164C
/* 01578 8096EA28 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0157C 8096EA2C 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 01580 8096EA30 24070000 */  addiu   $a3, $zero, 0x0000         ## $a3 = 00000000
/* 01584 8096EA34 0C25B5E7 */  jal     func_8096D79C              
/* 01588 8096EA38 AFA00010 */  sw      $zero, 0x0010($sp)         
/* 0158C 8096EA3C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01590 8096EA40 0C25B575 */  jal     func_8096D5D4              
/* 01594 8096EA44 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 01598 8096EA48 3C068003 */  lui     $a2, %hi(ActorShadow_DrawFunc_Circle)
/* 0159C 8096EA4C 24C6B5EC */  addiu   $a2, %lo(ActorShadow_DrawFunc_Circle)
/* 015A0 8096EA50 260400B4 */  addiu   $a0, $s0, 0x00B4           ## $a0 = 000000B4
/* 015A4 8096EA54 24050000 */  addiu   $a1, $zero, 0x0000         ## $a1 = 00000000
/* 015A8 8096EA58 0C00AC78 */  jal     ActorShape_Init
              
/* 015AC 8096EA5C 3C0741F0 */  lui     $a3, 0x41F0                ## $a3 = 41F00000
/* 015B0 8096EA60 2402000A */  addiu   $v0, $zero, 0x000A         ## $v0 = 0000000A
/* 015B4 8096EA64 AE020194 */  sw      $v0, 0x0194($s0)           ## 00000194
/* 015B8 8096EA68 AE020198 */  sw      $v0, 0x0198($s0)           ## 00000198
/* 015BC 8096EA6C 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 015C0 8096EA70 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 015C4 8096EA74 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
/* 015C8 8096EA78 03E00008 */  jr      $ra                        
/* 015CC 8096EA7C 00000000 */  nop
