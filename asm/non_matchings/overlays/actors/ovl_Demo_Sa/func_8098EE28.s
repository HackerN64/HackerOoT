glabel func_8098EE28
/* 009C8 8098EE28 27BDFFC8 */  addiu   $sp, $sp, 0xFFC8           ## $sp = FFFFFFC8
/* 009CC 8098EE2C 00A03025 */  or      $a2, $a1, $zero            ## $a2 = 00000000
/* 009D0 8098EE30 00802825 */  or      $a1, $a0, $zero            ## $a1 = 00000000
/* 009D4 8098EE34 AFBF0034 */  sw      $ra, 0x0034($sp)           
/* 009D8 8098EE38 AFA40038 */  sw      $a0, 0x0038($sp)           
/* 009DC 8098EE3C C4A40024 */  lwc1    $f4, 0x0024($a1)           ## 00000024
/* 009E0 8098EE40 3C0E8016 */  lui     $t6, %hi(gGameInfo)
/* 009E4 8098EE44 8DCEFA90 */  lw      $t6, %lo(gGameInfo)($t6)
/* 009E8 8098EE48 E7A40010 */  swc1    $f4, 0x0010($sp)           
/* 009EC 8098EE4C 3C0141C8 */  lui     $at, 0x41C8                ## $at = 41C80000
/* 009F0 8098EE50 85CF1482 */  lh      $t7, 0x1482($t6)           ## 80161482
/* 009F4 8098EE54 44815000 */  mtc1    $at, $f10                  ## $f10 = 25.00
/* 009F8 8098EE58 C4B20028 */  lwc1    $f18, 0x0028($a1)          ## 00000028
/* 009FC 8098EE5C 448F3000 */  mtc1    $t7, $f6                   ## $f6 = 0.00
/* 00A00 8098EE60 24180004 */  addiu   $t8, $zero, 0x0004         ## $t8 = 00000004
/* 00A04 8098EE64 24C41C24 */  addiu   $a0, $a2, 0x1C24           ## $a0 = 00001C24
/* 00A08 8098EE68 46803220 */  cvt.s.w $f8, $f6                   
/* 00A0C 8098EE6C 240700F5 */  addiu   $a3, $zero, 0x00F5         ## $a3 = 000000F5
/* 00A10 8098EE70 460A4400 */  add.s   $f16, $f8, $f10            
/* 00A14 8098EE74 46128100 */  add.s   $f4, $f16, $f18            
/* 00A18 8098EE78 E7A40014 */  swc1    $f4, 0x0014($sp)           
/* 00A1C 8098EE7C C4A6002C */  lwc1    $f6, 0x002C($a1)           ## 0000002C
/* 00A20 8098EE80 AFB80028 */  sw      $t8, 0x0028($sp)           
/* 00A24 8098EE84 AFA00024 */  sw      $zero, 0x0024($sp)         
/* 00A28 8098EE88 AFA00020 */  sw      $zero, 0x0020($sp)         
/* 00A2C 8098EE8C AFA0001C */  sw      $zero, 0x001C($sp)         
/* 00A30 8098EE90 0C00C916 */  jal     Actor_SpawnAttached
              
/* 00A34 8098EE94 E7A60018 */  swc1    $f6, 0x0018($sp)           
/* 00A38 8098EE98 8FBF0034 */  lw      $ra, 0x0034($sp)           
/* 00A3C 8098EE9C 27BD0038 */  addiu   $sp, $sp, 0x0038           ## $sp = 00000000
/* 00A40 8098EEA0 03E00008 */  jr      $ra                        
/* 00A44 8098EEA4 00000000 */  nop
