.late_rodata
glabel D_808B2EB8
    .float 0.12

glabel D_808B2EBC
    .float 0.02

glabel D_808B2EC0
    .float 0.3

glabel D_808B2EC4
 .word 0x409CCCCD, 0x00000000, 0x00000000

.text
glabel BgSpot11Oasis_Update
/* 002D4 808B2AC4 27BDFFB8 */  addiu   $sp, $sp, 0xFFB8           ## $sp = FFFFFFB8
/* 002D8 808B2AC8 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 002DC 808B2ACC 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 002E0 808B2AD0 AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 002E4 808B2AD4 AFA5004C */  sw      $a1, 0x004C($sp)           
/* 002E8 808B2AD8 8E19014C */  lw      $t9, 0x014C($s0)           ## 0000014C
/* 002EC 808B2ADC 0320F809 */  jalr    $ra, $t9                   
/* 002F0 808B2AE0 00000000 */  nop
/* 002F4 808B2AE4 8E0F014C */  lw      $t7, 0x014C($s0)           ## 0000014C
/* 002F8 808B2AE8 3C0E808B */  lui     $t6, %hi(func_808B2980)    ## $t6 = 808B0000
/* 002FC 808B2AEC 25CE2980 */  addiu   $t6, $t6, %lo(func_808B2980) ## $t6 = 808B2980
/* 00300 808B2AF0 55CF0004 */  bnel    $t6, $t7, .L808B2B04       
/* 00304 808B2AF4 92080150 */  lbu     $t0, 0x0150($s0)           ## 00000150
/* 00308 808B2AF8 10000066 */  beq     $zero, $zero, .L808B2C94   
/* 0030C 808B2AFC AE000134 */  sw      $zero, 0x0134($s0)         ## 00000134
/* 00310 808B2B00 92080150 */  lbu     $t0, 0x0150($s0)           ## 00000150
.L808B2B04:
/* 00314 808B2B04 3C18808B */  lui     $t8, %hi(func_808B2CA8)    ## $t8 = 808B0000
/* 00318 808B2B08 27182CA8 */  addiu   $t8, $t8, %lo(func_808B2CA8) ## $t8 = 808B2CA8
/* 0031C 808B2B0C 1100005F */  beq     $t0, $zero, .L808B2C8C     
/* 00320 808B2B10 AE180134 */  sw      $t8, 0x0134($s0)           ## 00000134
/* 00324 808B2B14 3C0143C8 */  lui     $at, 0x43C8                ## $at = 43C80000
/* 00328 808B2B18 44812000 */  mtc1    $at, $f4                   ## $f4 = 400.00
/* 0032C 808B2B1C C60000EC */  lwc1    $f0, 0x00EC($s0)           ## 000000EC
/* 00330 808B2B20 3C01C220 */  lui     $at, 0xC220                ## $at = C2200000
/* 00334 808B2B24 4604003C */  c.lt.s  $f0, $f4                   
/* 00338 808B2B28 00000000 */  nop
/* 0033C 808B2B2C 45020058 */  bc1fl   .L808B2C90                 
/* 00340 808B2B30 240F0001 */  addiu   $t7, $zero, 0x0001         ## $t7 = 00000001
/* 00344 808B2B34 44813000 */  mtc1    $at, $f6                   ## $f6 = -40.00
/* 00348 808B2B38 8FA9004C */  lw      $t1, 0x004C($sp)           
/* 0034C 808B2B3C 3C020001 */  lui     $v0, 0x0001                ## $v0 = 00010000
/* 00350 808B2B40 4600303C */  c.lt.s  $f6, $f0                   
/* 00354 808B2B44 00491021 */  addu    $v0, $v0, $t1              
/* 00358 808B2B48 45020051 */  bc1fl   .L808B2C90                 
/* 0035C 808B2B4C 240F0001 */  addiu   $t7, $zero, 0x0001         ## $t7 = 00000001
/* 00360 808B2B50 8C421DE4 */  lw      $v0, 0x1DE4($v0)           ## 00011DE4
/* 00364 808B2B54 26040024 */  addiu   $a0, $s0, 0x0024           ## $a0 = 00000024
/* 00368 808B2B58 3C0D808B */  lui     $t5, %hi(D_808B2E34)       ## $t5 = 808B0000
/* 0036C 808B2B5C 304A0004 */  andi    $t2, $v0, 0x0004           ## $t2 = 00000000
/* 00370 808B2B60 5140004D */  beql    $t2, $zero, .L808B2C98     
/* 00374 808B2B64 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 00378 808B2B68 920B0151 */  lbu     $t3, 0x0151($s0)           ## 00000151
/* 0037C 808B2B6C 25AD2E34 */  addiu   $t5, $t5, %lo(D_808B2E34)  ## $t5 = 808B2E34
/* 00380 808B2B70 27A60030 */  addiu   $a2, $sp, 0x0030           ## $a2 = FFFFFFE8
/* 00384 808B2B74 000B6080 */  sll     $t4, $t3,  2               
/* 00388 808B2B78 018B6023 */  subu    $t4, $t4, $t3              
/* 0038C 808B2B7C 000C6080 */  sll     $t4, $t4,  2               
/* 00390 808B2B80 0C01DFA7 */  jal     Math_Vec3f_Sum
              ## Vec3f_Add
/* 00394 808B2B84 018D2821 */  addu    $a1, $t4, $t5              
/* 00398 808B2B88 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 0039C 808B2B8C 00000000 */  nop
/* 003A0 808B2B90 3C014248 */  lui     $at, 0x4248                ## $at = 42480000
/* 003A4 808B2B94 44814000 */  mtc1    $at, $f8                   ## $f8 = 50.00
/* 003A8 808B2B98 3C01808B */  lui     $at, %hi(D_808B2EB8)       ## $at = 808B0000
/* 003AC 808B2B9C C42A2EB8 */  lwc1    $f10, %lo(D_808B2EB8)($at) 
/* 003B0 808B2BA0 3C01808B */  lui     $at, %hi(D_808B2EBC)       ## $at = 808B0000
/* 003B4 808B2BA4 C4322EBC */  lwc1    $f18, %lo(D_808B2EBC)($at) 
/* 003B8 808B2BA8 460A0402 */  mul.s   $f16, $f0, $f10            
/* 003BC 808B2BAC 8FA4004C */  lw      $a0, 0x004C($sp)           
/* 003C0 808B2BB0 27A50030 */  addiu   $a1, $sp, 0x0030           ## $a1 = FFFFFFE8
/* 003C4 808B2BB4 24060000 */  addiu   $a2, $zero, 0x0000         ## $a2 = 00000000
/* 003C8 808B2BB8 3C074170 */  lui     $a3, 0x4170                ## $a3 = 41700000
/* 003CC 808B2BBC E7A80010 */  swc1    $f8, 0x0010($sp)           
/* 003D0 808B2BC0 46128100 */  add.s   $f4, $f16, $f18            
/* 003D4 808B2BC4 0C00A4F9 */  jal     EffectSsBubble_Spawn              
/* 003D8 808B2BC8 E7A40014 */  swc1    $f4, 0x0014($sp)           
/* 003DC 808B2BCC 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 003E0 808B2BD0 00000000 */  nop
/* 003E4 808B2BD4 3C01808B */  lui     $at, %hi(D_808B2EC0)       ## $at = 808B0000
/* 003E8 808B2BD8 C4262EC0 */  lwc1    $f6, %lo(D_808B2EC0)($at)  
/* 003EC 808B2BDC 4606003C */  c.lt.s  $f0, $f6                   
/* 003F0 808B2BE0 00000000 */  nop
/* 003F4 808B2BE4 4502002C */  bc1fl   .L808B2C98                 
/* 003F8 808B2BE8 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 003FC 808B2BEC 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 00400 808B2BF0 00000000 */  nop
/* 00404 808B2BF4 3C01808B */  lui     $at, %hi(D_808B2EC4)       ## $at = 808B0000
/* 00408 808B2BF8 C4282EC4 */  lwc1    $f8, %lo(D_808B2EC4)($at)  
/* 0040C 808B2BFC 240E0001 */  addiu   $t6, $zero, 0x0001         ## $t6 = 00000001
/* 00410 808B2C00 3C014F00 */  lui     $at, 0x4F00                ## $at = 4F000000
/* 00414 808B2C04 46080282 */  mul.s   $f10, $f0, $f8             
/* 00418 808B2C08 4459F800 */  cfc1    $t9, $31
/* 0041C 808B2C0C 44CEF800 */  ctc1    $t6, $31
/* 00420 808B2C10 00000000 */  nop
/* 00424 808B2C14 46005424 */  cvt.w.s $f16, $f10                 
/* 00428 808B2C18 444EF800 */  cfc1    $t6, $31
/* 0042C 808B2C1C 00000000 */  nop
/* 00430 808B2C20 31CE0078 */  andi    $t6, $t6, 0x0078           ## $t6 = 00000000
/* 00434 808B2C24 51C00013 */  beql    $t6, $zero, .L808B2C74     
/* 00438 808B2C28 440E8000 */  mfc1    $t6, $f16                  
/* 0043C 808B2C2C 44818000 */  mtc1    $at, $f16                  ## $f16 = 2147483648.00
/* 00440 808B2C30 240E0001 */  addiu   $t6, $zero, 0x0001         ## $t6 = 00000001
/* 00444 808B2C34 46105401 */  sub.s   $f16, $f10, $f16           
/* 00448 808B2C38 44CEF800 */  ctc1    $t6, $31
/* 0044C 808B2C3C 00000000 */  nop
/* 00450 808B2C40 46008424 */  cvt.w.s $f16, $f16                 
/* 00454 808B2C44 444EF800 */  cfc1    $t6, $31
/* 00458 808B2C48 00000000 */  nop
/* 0045C 808B2C4C 31CE0078 */  andi    $t6, $t6, 0x0078           ## $t6 = 00000000
/* 00460 808B2C50 15C00005 */  bne     $t6, $zero, .L808B2C68     
/* 00464 808B2C54 00000000 */  nop
/* 00468 808B2C58 440E8000 */  mfc1    $t6, $f16                  
/* 0046C 808B2C5C 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 00470 808B2C60 10000007 */  beq     $zero, $zero, .L808B2C80   
/* 00474 808B2C64 01C17025 */  or      $t6, $t6, $at              ## $t6 = 80000000
.L808B2C68:
/* 00478 808B2C68 10000005 */  beq     $zero, $zero, .L808B2C80   
/* 0047C 808B2C6C 240EFFFF */  addiu   $t6, $zero, 0xFFFF         ## $t6 = FFFFFFFF
/* 00480 808B2C70 440E8000 */  mfc1    $t6, $f16                  
.L808B2C74:
/* 00484 808B2C74 00000000 */  nop
/* 00488 808B2C78 05C0FFFB */  bltz    $t6, .L808B2C68            
/* 0048C 808B2C7C 00000000 */  nop
.L808B2C80:
/* 00490 808B2C80 44D9F800 */  ctc1    $t9, $31
/* 00494 808B2C84 10000003 */  beq     $zero, $zero, .L808B2C94   
/* 00498 808B2C88 A20E0151 */  sb      $t6, 0x0151($s0)           ## 00000151
.L808B2C8C:
/* 0049C 808B2C8C 240F0001 */  addiu   $t7, $zero, 0x0001         ## $t7 = 00000001
.L808B2C90:
/* 004A0 808B2C90 A20F0150 */  sb      $t7, 0x0150($s0)           ## 00000150
.L808B2C94:
/* 004A4 808B2C94 8FBF0024 */  lw      $ra, 0x0024($sp)           
.L808B2C98:
/* 004A8 808B2C98 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 004AC 808B2C9C 27BD0048 */  addiu   $sp, $sp, 0x0048           ## $sp = 00000000
/* 004B0 808B2CA0 03E00008 */  jr      $ra                        
/* 004B4 808B2CA4 00000000 */  nop
