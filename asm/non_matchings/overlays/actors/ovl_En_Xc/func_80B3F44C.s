glabel func_80B3F44C
/* 0326C 80B3F44C 27BDFFC8 */  addiu   $sp, $sp, 0xFFC8           ## $sp = FFFFFFC8
/* 03270 80B3F450 AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 03274 80B3F454 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 03278 80B3F458 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 0327C 80B3F45C 0C2CF134 */  jal     func_80B3C4D0              
/* 03280 80B3F460 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 03284 80B3F464 5040002F */  beql    $v0, $zero, .L80B3F524     
/* 03288 80B3F468 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 0328C 80B3F46C 8C4E000C */  lw      $t6, 0x000C($v0)           ## 0000000C
/* 03290 80B3F470 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 03294 80B3F474 27A50028 */  addiu   $a1, $sp, 0x0028           ## $a1 = FFFFFFF0
/* 03298 80B3F478 448E2000 */  mtc1    $t6, $f4                   ## $f4 = 0.00
/* 0329C 80B3F47C 24060064 */  addiu   $a2, $zero, 0x0064         ## $a2 = 00000064
/* 032A0 80B3F480 240701F4 */  addiu   $a3, $zero, 0x01F4         ## $a3 = 000001F4
/* 032A4 80B3F484 468021A0 */  cvt.s.w $f6, $f4                   
/* 032A8 80B3F488 E7A60028 */  swc1    $f6, 0x0028($sp)           
/* 032AC 80B3F48C 8C4F0010 */  lw      $t7, 0x0010($v0)           ## 00000010
/* 032B0 80B3F490 448F4000 */  mtc1    $t7, $f8                   ## $f8 = 0.00
/* 032B4 80B3F494 00000000 */  nop
/* 032B8 80B3F498 468042A0 */  cvt.s.w $f10, $f8                  
/* 032BC 80B3F49C E7AA002C */  swc1    $f10, 0x002C($sp)          
/* 032C0 80B3F4A0 8C580014 */  lw      $t8, 0x0014($v0)           ## 00000014
/* 032C4 80B3F4A4 AFA00010 */  sw      $zero, 0x0010($sp)         
/* 032C8 80B3F4A8 44988000 */  mtc1    $t8, $f16                  ## $f16 = 0.00
/* 032CC 80B3F4AC 00000000 */  nop
/* 032D0 80B3F4B0 468084A0 */  cvt.s.w $f18, $f16                 
/* 032D4 80B3F4B4 0C00A511 */  jal     EffectSsGRipple_Spawn              
/* 032D8 80B3F4B8 E7B20030 */  swc1    $f18, 0x0030($sp)          
/* 032DC 80B3F4BC 2419000A */  addiu   $t9, $zero, 0x000A         ## $t9 = 0000000A
/* 032E0 80B3F4C0 AFB90010 */  sw      $t9, 0x0010($sp)           
/* 032E4 80B3F4C4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 032E8 80B3F4C8 27A50028 */  addiu   $a1, $sp, 0x0028           ## $a1 = FFFFFFF0
/* 032EC 80B3F4CC 24060064 */  addiu   $a2, $zero, 0x0064         ## $a2 = 00000064
/* 032F0 80B3F4D0 0C00A511 */  jal     EffectSsGRipple_Spawn              
/* 032F4 80B3F4D4 240701F4 */  addiu   $a3, $zero, 0x01F4         ## $a3 = 000001F4
/* 032F8 80B3F4D8 24080014 */  addiu   $t0, $zero, 0x0014         ## $t0 = 00000014
/* 032FC 80B3F4DC AFA80010 */  sw      $t0, 0x0010($sp)           
/* 03300 80B3F4E0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 03304 80B3F4E4 27A50028 */  addiu   $a1, $sp, 0x0028           ## $a1 = FFFFFFF0
/* 03308 80B3F4E8 24060064 */  addiu   $a2, $zero, 0x0064         ## $a2 = 00000064
/* 0330C 80B3F4EC 0C00A511 */  jal     EffectSsGRipple_Spawn              
/* 03310 80B3F4F0 240701F4 */  addiu   $a3, $zero, 0x01F4         ## $a3 = 000001F4
/* 03314 80B3F4F4 24090001 */  addiu   $t1, $zero, 0x0001         ## $t1 = 00000001
/* 03318 80B3F4F8 AFA90010 */  sw      $t1, 0x0010($sp)           
/* 0331C 80B3F4FC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 03320 80B3F500 27A50028 */  addiu   $a1, $sp, 0x0028           ## $a1 = FFFFFFF0
/* 03324 80B3F504 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 03328 80B3F508 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 0332C 80B3F50C 0C00A527 */  jal     EffectSsGSplash_Spawn              
/* 03330 80B3F510 AFA00014 */  sw      $zero, 0x0014($sp)         
/* 03334 80B3F514 27A40028 */  addiu   $a0, $sp, 0x0028           ## $a0 = FFFFFFF0
/* 03338 80B3F518 0C2CFCFE */  jal     func_80B3F3F8              
/* 0333C 80B3F51C 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 03340 80B3F520 8FBF0024 */  lw      $ra, 0x0024($sp)           
.L80B3F524:
/* 03344 80B3F524 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 03348 80B3F528 27BD0038 */  addiu   $sp, $sp, 0x0038           ## $sp = 00000000
/* 0334C 80B3F52C 03E00008 */  jr      $ra                        
/* 03350 80B3F530 00000000 */  nop
