glabel func_80AB1B68
/* 00DD8 80AB1B68 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 00DDC 80AB1B6C AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 00DE0 80AB1B70 AFA40018 */  sw      $a0, 0x0018($sp)           
/* 00DE4 80AB1B74 24060004 */  addiu   $a2, $zero, 0x0004         ## $a2 = 00000004
/* 00DE8 80AB1B78 0C2AC4E4 */  jal     func_80AB1390              
/* 00DEC 80AB1B7C 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 00DF0 80AB1B80 10400025 */  beq     $v0, $zero, .L80AB1C18     
/* 00DF4 80AB1B84 8FA40018 */  lw      $a0, 0x0018($sp)           
/* 00DF8 80AB1B88 3C014120 */  lui     $at, 0x4120                ## $at = 41200000
/* 00DFC 80AB1B8C 44811000 */  mtc1    $at, $f2                   ## $f2 = 10.00
/* 00E00 80AB1B90 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 00E04 80AB1B94 24820280 */  addiu   $v0, $a0, 0x0280           ## $v0 = 00000280
/* 00E08 80AB1B98 C4440000 */  lwc1    $f4, 0x0000($v0)           ## 00000280
/* 00E0C 80AB1B9C 44813000 */  mtc1    $at, $f6                   ## $f6 = 1.00
/* 00E10 80AB1BA0 3C058016 */  lui     $a1, %hi(gGameInfo)
/* 00E14 80AB1BA4 24A5FA90 */  addiu   $a1, %lo(gGameInfo)
/* 00E18 80AB1BA8 46062200 */  add.s   $f8, $f4, $f6              
/* 00E1C 80AB1BAC 24180009 */  addiu   $t8, $zero, 0x0009         ## $t8 = 00000009
/* 00E20 80AB1BB0 24190001 */  addiu   $t9, $zero, 0x0001         ## $t9 = 00000001
/* 00E24 80AB1BB4 E4480000 */  swc1    $f8, 0x0000($v0)           ## 00000280
/* 00E28 80AB1BB8 8CAE0000 */  lw      $t6, 0x0000($a1)           ## 8015FA90
/* 00E2C 80AB1BBC C4400000 */  lwc1    $f0, 0x0000($v0)           ## 00000280
/* 00E30 80AB1BC0 85CF145E */  lh      $t7, 0x145E($t6)           ## 0000145E
/* 00E34 80AB1BC4 448F5000 */  mtc1    $t7, $f10                  ## $f10 = 0.00
/* 00E38 80AB1BC8 00000000 */  nop
/* 00E3C 80AB1BCC 46805420 */  cvt.s.w $f16, $f10                 
/* 00E40 80AB1BD0 46028480 */  add.s   $f18, $f16, $f2            
/* 00E44 80AB1BD4 4600903E */  c.le.s  $f18, $f0                  
/* 00E48 80AB1BD8 00000000 */  nop
/* 00E4C 80AB1BDC 45000020 */  bc1f    .L80AB1C60                 
/* 00E50 80AB1BE0 00000000 */  nop
/* 00E54 80AB1BE4 AC980278 */  sw      $t8, 0x0278($a0)           ## 00000278
/* 00E58 80AB1BE8 AC99027C */  sw      $t9, 0x027C($a0)           ## 0000027C
/* 00E5C 80AB1BEC 8CA80000 */  lw      $t0, 0x0000($a1)           ## 8015FA90
/* 00E60 80AB1BF0 240300FF */  addiu   $v1, $zero, 0x00FF         ## $v1 = 000000FF
/* 00E64 80AB1BF4 8509145E */  lh      $t1, 0x145E($t0)           ## 0000145E
/* 00E68 80AB1BF8 44892000 */  mtc1    $t1, $f4                   ## $f4 = 0.00
/* 00E6C 80AB1BFC 00000000 */  nop
/* 00E70 80AB1C00 468021A0 */  cvt.s.w $f6, $f4                   
/* 00E74 80AB1C04 46023200 */  add.s   $f8, $f6, $f2              
/* 00E78 80AB1C08 E4480000 */  swc1    $f8, 0x0000($v0)           ## 00000280
/* 00E7C 80AB1C0C AC830284 */  sw      $v1, 0x0284($a0)           ## 00000284
/* 00E80 80AB1C10 10000026 */  beq     $zero, $zero, .L80AB1CAC   
/* 00E84 80AB1C14 A08300C8 */  sb      $v1, 0x00C8($a0)           ## 000000C8
.L80AB1C18:
/* 00E88 80AB1C18 24820280 */  addiu   $v0, $a0, 0x0280           ## $v0 = 00000280
/* 00E8C 80AB1C1C 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 00E90 80AB1C20 44818000 */  mtc1    $at, $f16                  ## $f16 = 1.00
/* 00E94 80AB1C24 C44A0000 */  lwc1    $f10, 0x0000($v0)          ## 00000280
/* 00E98 80AB1C28 44801000 */  mtc1    $zero, $f2                 ## $f2 = 0.00
/* 00E9C 80AB1C2C 46105481 */  sub.s   $f18, $f10, $f16           
/* 00EA0 80AB1C30 E4520000 */  swc1    $f18, 0x0000($v0)          ## 00000280
/* 00EA4 80AB1C34 C4400000 */  lwc1    $f0, 0x0000($v0)           ## 00000280
/* 00EA8 80AB1C38 4602003E */  c.le.s  $f0, $f2                   
/* 00EAC 80AB1C3C 00000000 */  nop
/* 00EB0 80AB1C40 45000007 */  bc1f    .L80AB1C60                 
/* 00EB4 80AB1C44 240A0007 */  addiu   $t2, $zero, 0x0007         ## $t2 = 00000007
/* 00EB8 80AB1C48 AC8A0278 */  sw      $t2, 0x0278($a0)           ## 00000278
/* 00EBC 80AB1C4C AC80027C */  sw      $zero, 0x027C($a0)         ## 0000027C
/* 00EC0 80AB1C50 E4420000 */  swc1    $f2, 0x0000($v0)           ## 00000280
/* 00EC4 80AB1C54 AC800284 */  sw      $zero, 0x0284($a0)         ## 00000284
/* 00EC8 80AB1C58 10000014 */  beq     $zero, $zero, .L80AB1CAC   
/* 00ECC 80AB1C5C A08000C8 */  sb      $zero, 0x00C8($a0)         ## 000000C8
.L80AB1C60:
/* 00ED0 80AB1C60 3C058016 */  lui     $a1, %hi(gGameInfo)
/* 00ED4 80AB1C64 24A5FA90 */  addiu   $a1, %lo(gGameInfo)
/* 00ED8 80AB1C68 8CAB0000 */  lw      $t3, 0x0000($a1)           ## 8015FA90
/* 00EDC 80AB1C6C 3C014120 */  lui     $at, 0x4120                ## $at = 41200000
/* 00EE0 80AB1C70 44811000 */  mtc1    $at, $f2                   ## $f2 = 10.00
/* 00EE4 80AB1C74 856C145E */  lh      $t4, 0x145E($t3)           ## 0000145E
/* 00EE8 80AB1C78 3C01437F */  lui     $at, 0x437F                ## $at = 437F0000
/* 00EEC 80AB1C7C 44818000 */  mtc1    $at, $f16                  ## $f16 = 255.00
/* 00EF0 80AB1C80 448C2000 */  mtc1    $t4, $f4                   ## $f4 = 0.00
/* 00EF4 80AB1C84 00000000 */  nop
/* 00EF8 80AB1C88 468021A0 */  cvt.s.w $f6, $f4                   
/* 00EFC 80AB1C8C 46023200 */  add.s   $f8, $f6, $f2              
/* 00F00 80AB1C90 46080283 */  div.s   $f10, $f0, $f8             
/* 00F04 80AB1C94 46105482 */  mul.s   $f18, $f10, $f16           
/* 00F08 80AB1C98 4600910D */  trunc.w.s $f4, $f18                  
/* 00F0C 80AB1C9C 44022000 */  mfc1    $v0, $f4                   
/* 00F10 80AB1CA0 00000000 */  nop
/* 00F14 80AB1CA4 AC820284 */  sw      $v0, 0x0284($a0)           ## 00000284
/* 00F18 80AB1CA8 A08200C8 */  sb      $v0, 0x00C8($a0)           ## 000000C8
.L80AB1CAC:
/* 00F1C 80AB1CAC 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 00F20 80AB1CB0 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 00F24 80AB1CB4 03E00008 */  jr      $ra                        
/* 00F28 80AB1CB8 00000000 */  nop
