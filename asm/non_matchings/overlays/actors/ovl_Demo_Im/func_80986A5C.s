glabel func_80986A5C
/* 01E7C 80986A5C 3C0E8016 */  lui     $t6, %hi(gGameInfo)
/* 01E80 80986A60 8DCEFA90 */  lw      $t6, %lo(gGameInfo)($t6)
/* 01E84 80986A64 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 01E88 80986A68 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 01E8C 80986A6C 85CF1476 */  lh      $t7, 0x1476($t6)           ## 80161476
/* 01E90 80986A70 3C014302 */  lui     $at, 0x4302                ## $at = 43020000
/* 01E94 80986A74 44814000 */  mtc1    $at, $f8                   ## $f8 = 130.00
/* 01E98 80986A78 448F2000 */  mtc1    $t7, $f4                   ## $f4 = 0.00
/* 01E9C 80986A7C C4820024 */  lwc1    $f2, 0x0024($a0)           ## 00000024
/* 01EA0 80986A80 8CA21C44 */  lw      $v0, 0x1C44($a1)           ## 00001C44
/* 01EA4 80986A84 468021A0 */  cvt.s.w $f6, $f4                   
/* 01EA8 80986A88 C4400024 */  lwc1    $f0, 0x0024($v0)           ## 00000024
/* 01EAC 80986A8C 46083280 */  add.s   $f10, $f6, $f8             
/* 01EB0 80986A90 460A1401 */  sub.s   $f16, $f2, $f10            
/* 01EB4 80986A94 4600803C */  c.lt.s  $f16, $f0                  
/* 01EB8 80986A98 00000000 */  nop
/* 01EBC 80986A9C 45020008 */  bc1fl   .L80986AC0                 
/* 01EC0 80986AA0 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
/* 01EC4 80986AA4 0C02FF21 */  jal     Gameplay_InCsMode              
/* 01EC8 80986AA8 00A02025 */  or      $a0, $a1, $zero            ## $a0 = 00000000
/* 01ECC 80986AAC 54400004 */  bnel    $v0, $zero, .L80986AC0     
/* 01ED0 80986AB0 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
/* 01ED4 80986AB4 10000002 */  beq     $zero, $zero, .L80986AC0   
/* 01ED8 80986AB8 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
/* 01EDC 80986ABC 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L80986AC0:
/* 01EE0 80986AC0 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 01EE4 80986AC4 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 01EE8 80986AC8 03E00008 */  jr      $ra                        
/* 01EEC 80986ACC 00000000 */  nop
