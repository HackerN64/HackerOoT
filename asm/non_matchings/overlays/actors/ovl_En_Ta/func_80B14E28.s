.late_rodata
glabel D_80B16F54
 .word 0x4483A000

.text
glabel func_80B14E28
/* 01388 80B14E28 27BDFFC8 */  addiu   $sp, $sp, 0xFFC8           ## $sp = FFFFFFC8
/* 0138C 80B14E2C AFB10018 */  sw      $s1, 0x0018($sp)           
/* 01390 80B14E30 00808825 */  or      $s1, $a0, $zero            ## $s1 = 00000000
/* 01394 80B14E34 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 01398 80B14E38 AFB00014 */  sw      $s0, 0x0014($sp)           
/* 0139C 80B14E3C 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 013A0 80B14E40 0C03008C */  jal     Gameplay_CreateSubCamera              
/* 013A4 80B14E44 00A02025 */  or      $a0, $a1, $zero            ## $a0 = 00000000
/* 013A8 80B14E48 A62202D0 */  sh      $v0, 0x02D0($s1)           ## 000002D0
/* 013AC 80B14E4C 860E07A0 */  lh      $t6, 0x07A0($s0)           ## 000007A0
/* 013B0 80B14E50 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 013B4 80B14E54 24060001 */  addiu   $a2, $zero, 0x0001         ## $a2 = 00000001
/* 013B8 80B14E58 A62E02D2 */  sh      $t6, 0x02D2($s1)           ## 000002D2
/* 013BC 80B14E5C 0C0300C5 */  jal     Gameplay_ChangeCameraStatus              
/* 013C0 80B14E60 862502D2 */  lh      $a1, 0x02D2($s1)           ## 000002D2
/* 013C4 80B14E64 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 013C8 80B14E68 862502D0 */  lh      $a1, 0x02D0($s1)           ## 000002D0
/* 013CC 80B14E6C 0C0300C5 */  jal     Gameplay_ChangeCameraStatus              
/* 013D0 80B14E70 24060007 */  addiu   $a2, $zero, 0x0007         ## $a2 = 00000007
/* 013D4 80B14E74 3C0180B1 */  lui     $at, %hi(D_80B16F54)       ## $at = 80B10000
/* 013D8 80B14E78 C4206F54 */  lwc1    $f0, %lo(D_80B16F54)($at)  
/* 013DC 80B14E7C 3C014130 */  lui     $at, 0x4130                ## $at = 41300000
/* 013E0 80B14E80 44812000 */  mtc1    $at, $f4                   ## $f4 = 11.00
/* 013E4 80B14E84 3C0141B0 */  lui     $at, 0x41B0                ## $at = 41B00000
/* 013E8 80B14E88 44813000 */  mtc1    $at, $f6                   ## $f6 = 22.00
/* 013EC 80B14E8C 3C014234 */  lui     $at, 0x4234                ## $at = 42340000
/* 013F0 80B14E90 44814000 */  mtc1    $at, $f8                   ## $f8 = 45.00
/* 013F4 80B14E94 3C01C220 */  lui     $at, 0xC220                ## $at = C2200000
/* 013F8 80B14E98 44815000 */  mtc1    $at, $f10                  ## $f10 = -40.00
/* 013FC 80B14E9C E7A0002C */  swc1    $f0, 0x002C($sp)           
/* 01400 80B14EA0 E7A00020 */  swc1    $f0, 0x0020($sp)           
/* 01404 80B14EA4 E7A40030 */  swc1    $f4, 0x0030($sp)           
/* 01408 80B14EA8 E7A60034 */  swc1    $f6, 0x0034($sp)           
/* 0140C 80B14EAC E7A80024 */  swc1    $f8, 0x0024($sp)           
/* 01410 80B14EB0 E7AA0028 */  swc1    $f10, 0x0028($sp)          
/* 01414 80B14EB4 862502D0 */  lh      $a1, 0x02D0($s1)           ## 000002D0
/* 01418 80B14EB8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0141C 80B14EBC 27A60020 */  addiu   $a2, $sp, 0x0020           ## $a2 = FFFFFFE8
/* 01420 80B14EC0 0C030136 */  jal     func_800C04D8              
/* 01424 80B14EC4 27A7002C */  addiu   $a3, $sp, 0x002C           ## $a3 = FFFFFFF4
/* 01428 80B14EC8 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 0142C 80B14ECC 8FB00014 */  lw      $s0, 0x0014($sp)           
/* 01430 80B14ED0 8FB10018 */  lw      $s1, 0x0018($sp)           
/* 01434 80B14ED4 03E00008 */  jr      $ra                        
/* 01438 80B14ED8 27BD0038 */  addiu   $sp, $sp, 0x0038           ## $sp = 00000000
