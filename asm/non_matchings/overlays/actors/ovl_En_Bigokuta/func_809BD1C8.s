glabel func_809BD1C8
/* 00568 809BD1C8 27BDFFA8 */  addiu   $sp, $sp, 0xFFA8           ## $sp = FFFFFFA8
/* 0056C 809BD1CC AFBF003C */  sw      $ra, 0x003C($sp)           
/* 00570 809BD1D0 AFB40038 */  sw      $s4, 0x0038($sp)           
/* 00574 809BD1D4 AFB30034 */  sw      $s3, 0x0034($sp)           
/* 00578 809BD1D8 AFB20030 */  sw      $s2, 0x0030($sp)           
/* 0057C 809BD1DC AFB1002C */  sw      $s1, 0x002C($sp)           
/* 00580 809BD1E0 AFB00028 */  sw      $s0, 0x0028($sp)           
/* 00584 809BD1E4 F7B40020 */  sdc1    $f20, 0x0020($sp)          
/* 00588 809BD1E8 C4840028 */  lwc1    $f4, 0x0028($a0)           ## 00000028
/* 0058C 809BD1EC 3C014270 */  lui     $at, 0x4270                ## $at = 42700000
/* 00590 809BD1F0 4481A000 */  mtc1    $at, $f20                  ## $f20 = 60.00
/* 00594 809BD1F4 00808825 */  or      $s1, $a0, $zero            ## $s1 = 00000000
/* 00598 809BD1F8 00A0A025 */  or      $s4, $a1, $zero            ## $s4 = 00000000
/* 0059C 809BD1FC 00008025 */  or      $s0, $zero, $zero          ## $s0 = 00000000
/* 005A0 809BD200 27B20048 */  addiu   $s2, $sp, 0x0048           ## $s2 = FFFFFFF0
/* 005A4 809BD204 24130004 */  addiu   $s3, $zero, 0x0004         ## $s3 = 00000004
/* 005A8 809BD208 E7A4004C */  swc1    $f4, 0x004C($sp)           
/* 005AC 809BD20C 2A010002 */  slti    $at, $s0, 0x0002           
.L809BD210:
/* 005B0 809BD210 14200003 */  bne     $at, $zero, .L809BD220     
/* 005B4 809BD214 2402FFFF */  addiu   $v0, $zero, 0xFFFF         ## $v0 = FFFFFFFF
/* 005B8 809BD218 10000001 */  beq     $zero, $zero, .L809BD220   
/* 005BC 809BD21C 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
.L809BD220:
/* 005C0 809BD220 44823000 */  mtc1    $v0, $f6                   ## $f6 = 0.00
/* 005C4 809BD224 C6300024 */  lwc1    $f16, 0x0024($s1)          ## 00000024
/* 005C8 809BD228 320E0001 */  andi    $t6, $s0, 0x0001           ## $t6 = 00000000
/* 005CC 809BD22C 46803220 */  cvt.s.w $f8, $f6                   
/* 005D0 809BD230 2402FFFF */  addiu   $v0, $zero, 0xFFFF         ## $v0 = FFFFFFFF
/* 005D4 809BD234 46144282 */  mul.s   $f10, $f8, $f20            
/* 005D8 809BD238 46105480 */  add.s   $f18, $f10, $f16           
/* 005DC 809BD23C 11C00003 */  beq     $t6, $zero, .L809BD24C     
/* 005E0 809BD240 E7B20048 */  swc1    $f18, 0x0048($sp)          
/* 005E4 809BD244 10000001 */  beq     $zero, $zero, .L809BD24C   
/* 005E8 809BD248 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
.L809BD24C:
/* 005EC 809BD24C 44822000 */  mtc1    $v0, $f4                   ## $f4 = 0.00
/* 005F0 809BD250 C62A002C */  lwc1    $f10, 0x002C($s1)          ## 0000002C
/* 005F4 809BD254 240F0001 */  addiu   $t7, $zero, 0x0001         ## $t7 = 00000001
/* 005F8 809BD258 468021A0 */  cvt.s.w $f6, $f4                   
/* 005FC 809BD25C 241807D0 */  addiu   $t8, $zero, 0x07D0         ## $t8 = 000007D0
/* 00600 809BD260 AFB80014 */  sw      $t8, 0x0014($sp)           
/* 00604 809BD264 AFAF0010 */  sw      $t7, 0x0010($sp)           
/* 00608 809BD268 02802025 */  or      $a0, $s4, $zero            ## $a0 = 00000000
/* 0060C 809BD26C 02402825 */  or      $a1, $s2, $zero            ## $a1 = FFFFFFF0
/* 00610 809BD270 46143202 */  mul.s   $f8, $f6, $f20             
/* 00614 809BD274 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 00618 809BD278 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 0061C 809BD27C 460A4400 */  add.s   $f16, $f8, $f10            
/* 00620 809BD280 0C00A527 */  jal     EffectSsGSplash_Spawn              
/* 00624 809BD284 E7B00050 */  swc1    $f16, 0x0050($sp)          
/* 00628 809BD288 26100001 */  addiu   $s0, $s0, 0x0001           ## $s0 = 00000001
/* 0062C 809BD28C 5613FFE0 */  bnel    $s0, $s3, .L809BD210       
/* 00630 809BD290 2A010002 */  slti    $at, $s0, 0x0002           
/* 00634 809BD294 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00638 809BD298 0C00BE0A */  jal     Audio_PlayActorSound2
              
/* 0063C 809BD29C 240539ED */  addiu   $a1, $zero, 0x39ED         ## $a1 = 000039ED
/* 00640 809BD2A0 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00644 809BD2A4 0C00BE0A */  jal     Audio_PlayActorSound2
              
/* 00648 809BD2A8 24053879 */  addiu   $a1, $zero, 0x3879         ## $a1 = 00003879
/* 0064C 809BD2AC 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00650 809BD2B0 02802825 */  or      $a1, $s4, $zero            ## $a1 = 00000000
/* 00654 809BD2B4 2406000A */  addiu   $a2, $zero, 0x000A         ## $a2 = 0000000A
/* 00658 809BD2B8 0C00CFA2 */  jal     func_80033E88              
/* 0065C 809BD2BC 24070008 */  addiu   $a3, $zero, 0x0008         ## $a3 = 00000008
/* 00660 809BD2C0 8FBF003C */  lw      $ra, 0x003C($sp)           
/* 00664 809BD2C4 D7B40020 */  ldc1    $f20, 0x0020($sp)          
/* 00668 809BD2C8 8FB00028 */  lw      $s0, 0x0028($sp)           
/* 0066C 809BD2CC 8FB1002C */  lw      $s1, 0x002C($sp)           
/* 00670 809BD2D0 8FB20030 */  lw      $s2, 0x0030($sp)           
/* 00674 809BD2D4 8FB30034 */  lw      $s3, 0x0034($sp)           
/* 00678 809BD2D8 8FB40038 */  lw      $s4, 0x0038($sp)           
/* 0067C 809BD2DC 03E00008 */  jr      $ra                        
/* 00680 809BD2E0 27BD0058 */  addiu   $sp, $sp, 0x0058           ## $sp = 00000000
