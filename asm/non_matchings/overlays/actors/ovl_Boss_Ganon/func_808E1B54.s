.rdata
glabel D_808F7C80
    .asciz "../z_boss_ganon.c"
    .balign 4

glabel D_808F7C94
    .asciz "../z_boss_ganon.c"
    .balign 4

glabel D_808F7CA8
    .asciz "../z_boss_ganon.c"
    .balign 4

glabel D_808F7CBC
    .asciz "../z_boss_ganon.c"
    .balign 4

glabel D_808F7CD0
    .asciz "../z_boss_ganon.c"
    .balign 4

.late_rodata
glabel D_808F81B0
    .float 0.4

glabel D_808F81B4
    .float 0.35

glabel D_808F81B8
    .float 0.3926991

glabel D_808F81BC
    .float 3.1416

.text
glabel func_808E1B54
/* 0B2E4 808E1B54 27BDFF78 */  addiu   $sp, $sp, 0xFF78           ## $sp = FFFFFF78
/* 0B2E8 808E1B58 AFB40028 */  sw      $s4, 0x0028($sp)           
/* 0B2EC 808E1B5C 00A0A025 */  or      $s4, $a1, $zero            ## $s4 = 00000000
/* 0B2F0 808E1B60 AFBF002C */  sw      $ra, 0x002C($sp)           
/* 0B2F4 808E1B64 AFB30024 */  sw      $s3, 0x0024($sp)           
/* 0B2F8 808E1B68 AFB20020 */  sw      $s2, 0x0020($sp)           
/* 0B2FC 808E1B6C AFB1001C */  sw      $s1, 0x001C($sp)           
/* 0B300 808E1B70 AFB00018 */  sw      $s0, 0x0018($sp)           
/* 0B304 808E1B74 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 0B308 808E1B78 00809825 */  or      $s3, $a0, $zero            ## $s3 = 00000000
/* 0B30C 808E1B7C 3C06808F */  lui     $a2, %hi(D_808F7C80)       ## $a2 = 808F0000
/* 0B310 808E1B80 24C67C80 */  addiu   $a2, $a2, %lo(D_808F7C80)  ## $a2 = 808F7C80
/* 0B314 808E1B84 27A40064 */  addiu   $a0, $sp, 0x0064           ## $a0 = FFFFFFDC
/* 0B318 808E1B88 24072679 */  addiu   $a3, $zero, 0x2679         ## $a3 = 00002679
/* 0B31C 808E1B8C 0C031AB1 */  jal     Graph_OpenDisps              
/* 0B320 808E1B90 00A09025 */  or      $s2, $a1, $zero            ## $s2 = 00000000
/* 0B324 808E1B94 0C024F61 */  jal     func_80093D84              
/* 0B328 808E1B98 8E840000 */  lw      $a0, 0x0000($s4)           ## 00000000
/* 0B32C 808E1B9C 866E01A2 */  lh      $t6, 0x01A2($s3)           ## 000001A2
/* 0B330 808E1BA0 3C018090 */  lui     $at, %hi(D_808F81B4)       ## $at = 80900000
/* 0B334 808E1BA4 31CF0001 */  andi    $t7, $t6, 0x0001           ## $t7 = 00000000
/* 0B338 808E1BA8 51E00008 */  beql    $t7, $zero, .L808E1BCC     
/* 0B33C 808E1BAC C66801CC */  lwc1    $f8, 0x01CC($s3)           ## 000001CC
/* 0B340 808E1BB0 3C018090 */  lui     $at, %hi(D_808F81B0)       ## $at = 80900000
/* 0B344 808E1BB4 C42681B0 */  lwc1    $f6, %lo(D_808F81B0)($at)  
/* 0B348 808E1BB8 C66401CC */  lwc1    $f4, 0x01CC($s3)           ## 000001CC
/* 0B34C 808E1BBC 46062002 */  mul.s   $f0, $f4, $f6              
/* 0B350 808E1BC0 10000006 */  beq     $zero, $zero, .L808E1BDC   
/* 0B354 808E1BC4 4600040D */  trunc.w.s $f16, $f0                  
/* 0B358 808E1BC8 C66801CC */  lwc1    $f8, 0x01CC($s3)           ## 000001CC
.L808E1BCC:
/* 0B35C 808E1BCC C42A81B4 */  lwc1    $f10, %lo(D_808F81B4)($at) 
/* 0B360 808E1BD0 460A4002 */  mul.s   $f0, $f8, $f10             
/* 0B364 808E1BD4 00000000 */  nop
/* 0B368 808E1BD8 4600040D */  trunc.w.s $f16, $f0                  
.L808E1BDC:
/* 0B36C 808E1BDC 8E4302D0 */  lw      $v1, 0x02D0($s2)           ## 000002D0
/* 0B370 808E1BE0 24019B00 */  addiu   $at, $zero, 0x9B00         ## $at = FFFF9B00
/* 0B374 808E1BE4 3C11FA00 */  lui     $s1, 0xFA00                ## $s1 = FA000000
/* 0B378 808E1BE8 440A8000 */  mfc1    $t2, $f16                  
/* 0B37C 808E1BEC 24780008 */  addiu   $t8, $v1, 0x0008           ## $t8 = 00000008
/* 0B380 808E1BF0 AE5802D0 */  sw      $t8, 0x02D0($s2)           ## 000002D0
/* 0B384 808E1BF4 314B00FF */  andi    $t3, $t2, 0x00FF           ## $t3 = 00000000
/* 0B388 808E1BF8 01616025 */  or      $t4, $t3, $at              ## $t4 = FFFF9B00
/* 0B38C 808E1BFC AC6C0004 */  sw      $t4, 0x0004($v1)           ## 00000004
/* 0B390 808E1C00 0C034213 */  jal     Matrix_Push              
/* 0B394 808E1C04 AC710000 */  sw      $s1, 0x0000($v1)           ## 00000000
/* 0B398 808E1C08 C66C0024 */  lwc1    $f12, 0x0024($s3)          ## 00000024
/* 0B39C 808E1C0C C66E0080 */  lwc1    $f14, 0x0080($s3)          ## 00000080
/* 0B3A0 808E1C10 8E66002C */  lw      $a2, 0x002C($s3)           ## 0000002C
/* 0B3A4 808E1C14 0C034261 */  jal     Matrix_Translate              
/* 0B3A8 808E1C18 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 0B3AC 808E1C1C 3C013F40 */  lui     $at, 0x3F40                ## $at = 3F400000
/* 0B3B0 808E1C20 44810000 */  mtc1    $at, $f0                   ## $f0 = 0.75
/* 0B3B4 808E1C24 C6720050 */  lwc1    $f18, 0x0050($s3)          ## 00000050
/* 0B3B8 808E1C28 C6640058 */  lwc1    $f4, 0x0058($s3)           ## 00000058
/* 0B3BC 808E1C2C 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 0B3C0 808E1C30 46009302 */  mul.s   $f12, $f18, $f0            
/* 0B3C4 808E1C34 44817000 */  mtc1    $at, $f14                  ## $f14 = 1.00
/* 0B3C8 808E1C38 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 0B3CC 808E1C3C 46002182 */  mul.s   $f6, $f4, $f0              
/* 0B3D0 808E1C40 44063000 */  mfc1    $a2, $f6                   
/* 0B3D4 808E1C44 0C0342A3 */  jal     Matrix_Scale              
/* 0B3D8 808E1C48 00000000 */  nop
/* 0B3DC 808E1C4C 8E5002D0 */  lw      $s0, 0x02D0($s2)           ## 000002D0
/* 0B3E0 808E1C50 3C0EDA38 */  lui     $t6, 0xDA38                ## $t6 = DA380000
/* 0B3E4 808E1C54 35CE0003 */  ori     $t6, $t6, 0x0003           ## $t6 = DA380003
/* 0B3E8 808E1C58 260D0008 */  addiu   $t5, $s0, 0x0008           ## $t5 = 00000008
/* 0B3EC 808E1C5C AE4D02D0 */  sw      $t5, 0x02D0($s2)           ## 000002D0
/* 0B3F0 808E1C60 3C05808F */  lui     $a1, %hi(D_808F7C94)       ## $a1 = 808F0000
/* 0B3F4 808E1C64 AE0E0000 */  sw      $t6, 0x0000($s0)           ## 00000000
/* 0B3F8 808E1C68 8E840000 */  lw      $a0, 0x0000($s4)           ## 00000000
/* 0B3FC 808E1C6C 24A57C94 */  addiu   $a1, $a1, %lo(D_808F7C94)  ## $a1 = 808F7C94
/* 0B400 808E1C70 0C0346A2 */  jal     Matrix_NewMtx              
/* 0B404 808E1C74 24062693 */  addiu   $a2, $zero, 0x2693         ## $a2 = 00002693
/* 0B408 808E1C78 AE020004 */  sw      $v0, 0x0004($s0)           ## 00000004
/* 0B40C 808E1C7C 8E4302D0 */  lw      $v1, 0x02D0($s2)           ## 000002D0
/* 0B410 808E1C80 3C19808F */  lui     $t9, %hi(D_808F6A98)       ## $t9 = 808F0000
/* 0B414 808E1C84 27396A98 */  addiu   $t9, $t9, %lo(D_808F6A98)  ## $t9 = 808F6A98
/* 0B418 808E1C88 246F0008 */  addiu   $t7, $v1, 0x0008           ## $t7 = 00000008
/* 0B41C 808E1C8C AE4F02D0 */  sw      $t7, 0x02D0($s2)           ## 000002D0
/* 0B420 808E1C90 3C18DE00 */  lui     $t8, 0xDE00                ## $t8 = DE000000
/* 0B424 808E1C94 AC780000 */  sw      $t8, 0x0000($v1)           ## 00000000
/* 0B428 808E1C98 0C034221 */  jal     Matrix_Pull              
/* 0B42C 808E1C9C AC790004 */  sw      $t9, 0x0004($v1)           ## 00000004
/* 0B430 808E1CA0 8E4302D0 */  lw      $v1, 0x02D0($s2)           ## 000002D0
/* 0B434 808E1CA4 3C0A808E */  lui     $t2, %hi(D_808E7DE8)       ## $t2 = 808E0000
/* 0B438 808E1CA8 254A7DE8 */  addiu   $t2, $t2, %lo(D_808E7DE8)  ## $t2 = 808E7DE8
/* 0B43C 808E1CAC 24680008 */  addiu   $t0, $v1, 0x0008           ## $t0 = 00000008
/* 0B440 808E1CB0 AE4802D0 */  sw      $t0, 0x02D0($s2)           ## 000002D0
/* 0B444 808E1CB4 3C09DE00 */  lui     $t1, 0xDE00                ## $t1 = DE000000
/* 0B448 808E1CB8 AC690000 */  sw      $t1, 0x0000($v1)           ## 00000000
/* 0B44C 808E1CBC AC6A0004 */  sw      $t2, 0x0004($v1)           ## 00000004
/* 0B450 808E1CC0 8E4302D0 */  lw      $v1, 0x02D0($s2)           ## 000002D0
/* 0B454 808E1CC4 3C0CE700 */  lui     $t4, 0xE700                ## $t4 = E7000000
/* 0B458 808E1CC8 2401FF00 */  addiu   $at, $zero, 0xFF00         ## $at = FFFFFF00
/* 0B45C 808E1CCC 246B0008 */  addiu   $t3, $v1, 0x0008           ## $t3 = 00000008
/* 0B460 808E1CD0 AE4B02D0 */  sw      $t3, 0x02D0($s2)           ## 000002D0
/* 0B464 808E1CD4 AC600004 */  sw      $zero, 0x0004($v1)         ## 00000004
/* 0B468 808E1CD8 AC6C0000 */  sw      $t4, 0x0000($v1)           ## 00000000
/* 0B46C 808E1CDC 8E4302D0 */  lw      $v1, 0x02D0($s2)           ## 000002D0
/* 0B470 808E1CE0 3C0CFFFF */  lui     $t4, 0xFFFF                ## $t4 = FFFF0000
/* 0B474 808E1CE4 3C0BFB00 */  lui     $t3, 0xFB00                ## $t3 = FB000000
/* 0B478 808E1CE8 246D0008 */  addiu   $t5, $v1, 0x0008           ## $t5 = 00000008
/* 0B47C 808E1CEC AE4D02D0 */  sw      $t5, 0x02D0($s2)           ## 000002D0
/* 0B480 808E1CF0 AC710000 */  sw      $s1, 0x0000($v1)           ## 00000000
/* 0B484 808E1CF4 C66801CC */  lwc1    $f8, 0x01CC($s3)           ## 000001CC
/* 0B488 808E1CF8 3C0D808E */  lui     $t5, %hi(D_808E7E58)       ## $t5 = 808E0000
/* 0B48C 808E1CFC 25AD7E58 */  addiu   $t5, $t5, %lo(D_808E7E58)  ## $t5 = 808E7E58
/* 0B490 808E1D00 4600428D */  trunc.w.s $f10, $f8                  
/* 0B494 808E1D04 00008825 */  or      $s1, $zero, $zero          ## $s1 = 00000000
/* 0B498 808E1D08 44195000 */  mfc1    $t9, $f10                  
/* 0B49C 808E1D0C 00000000 */  nop
/* 0B4A0 808E1D10 332800FF */  andi    $t0, $t9, 0x00FF           ## $t0 = 00000000
/* 0B4A4 808E1D14 01014825 */  or      $t1, $t0, $at              ## $t1 = FFFFFF00
/* 0B4A8 808E1D18 AC690004 */  sw      $t1, 0x0004($v1)           ## 00000004
/* 0B4AC 808E1D1C 8E4302D0 */  lw      $v1, 0x02D0($s2)           ## 000002D0
/* 0B4B0 808E1D20 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 0B4B4 808E1D24 246A0008 */  addiu   $t2, $v1, 0x0008           ## $t2 = 00000008
/* 0B4B8 808E1D28 AE4A02D0 */  sw      $t2, 0x02D0($s2)           ## 000002D0
/* 0B4BC 808E1D2C AC6C0004 */  sw      $t4, 0x0004($v1)           ## 00000004
/* 0B4C0 808E1D30 AC6B0000 */  sw      $t3, 0x0000($v1)           ## 00000000
/* 0B4C4 808E1D34 866201A8 */  lh      $v0, 0x01A8($s3)           ## 000001A8
/* 0B4C8 808E1D38 1441002B */  bne     $v0, $at, .L808E1DE8       
/* 0B4CC 808E1D3C 00000000 */  nop
/* 0B4D0 808E1D40 AFAD0034 */  sw      $t5, 0x0034($sp)           
.L808E1D44:
/* 0B4D4 808E1D44 0C034213 */  jal     Matrix_Push              
/* 0B4D8 808E1D48 00000000 */  nop
/* 0B4DC 808E1D4C 44918000 */  mtc1    $s1, $f16                  ## $f16 = 0.00
/* 0B4E0 808E1D50 3C018090 */  lui     $at, %hi(D_808F81B8)       ## $at = 80900000
/* 0B4E4 808E1D54 C42481B8 */  lwc1    $f4, %lo(D_808F81B8)($at)  
/* 0B4E8 808E1D58 468084A0 */  cvt.s.w $f18, $f16                 
/* 0B4EC 808E1D5C 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 0B4F0 808E1D60 46049302 */  mul.s   $f12, $f18, $f4            
/* 0B4F4 808E1D64 0C034348 */  jal     Matrix_RotateY              
/* 0B4F8 808E1D68 00000000 */  nop
/* 0B4FC 808E1D6C C66C01C8 */  lwc1    $f12, 0x01C8($s3)          ## 000001C8
/* 0B500 808E1D70 0C0343B5 */  jal     Matrix_RotateZ              
/* 0B504 808E1D74 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 0B508 808E1D78 8E5002D0 */  lw      $s0, 0x02D0($s2)           ## 000002D0
/* 0B50C 808E1D7C 3C0FDA38 */  lui     $t7, 0xDA38                ## $t7 = DA380000
/* 0B510 808E1D80 35EF0003 */  ori     $t7, $t7, 0x0003           ## $t7 = DA380003
/* 0B514 808E1D84 260E0008 */  addiu   $t6, $s0, 0x0008           ## $t6 = 00000008
/* 0B518 808E1D88 AE4E02D0 */  sw      $t6, 0x02D0($s2)           ## 000002D0
/* 0B51C 808E1D8C 3C05808F */  lui     $a1, %hi(D_808F7CA8)       ## $a1 = 808F0000
/* 0B520 808E1D90 AE0F0000 */  sw      $t7, 0x0000($s0)           ## 00000000
/* 0B524 808E1D94 8E840000 */  lw      $a0, 0x0000($s4)           ## 00000000
/* 0B528 808E1D98 24A57CA8 */  addiu   $a1, $a1, %lo(D_808F7CA8)  ## $a1 = 808F7CA8
/* 0B52C 808E1D9C 0C0346A2 */  jal     Matrix_NewMtx              
/* 0B530 808E1DA0 240626AB */  addiu   $a2, $zero, 0x26AB         ## $a2 = 000026AB
/* 0B534 808E1DA4 AE020004 */  sw      $v0, 0x0004($s0)           ## 00000004
/* 0B538 808E1DA8 8E4302D0 */  lw      $v1, 0x02D0($s2)           ## 000002D0
/* 0B53C 808E1DAC 3C19DE00 */  lui     $t9, 0xDE00                ## $t9 = DE000000
/* 0B540 808E1DB0 24780008 */  addiu   $t8, $v1, 0x0008           ## $t8 = 00000008
/* 0B544 808E1DB4 AE5802D0 */  sw      $t8, 0x02D0($s2)           ## 000002D0
/* 0B548 808E1DB8 AC790000 */  sw      $t9, 0x0000($v1)           ## 00000000
/* 0B54C 808E1DBC 8FA80034 */  lw      $t0, 0x0034($sp)           
/* 0B550 808E1DC0 0C034221 */  jal     Matrix_Pull              
/* 0B554 808E1DC4 AC680004 */  sw      $t0, 0x0004($v1)           ## 00000004
/* 0B558 808E1DC8 26310001 */  addiu   $s1, $s1, 0x0001           ## $s1 = 00000001
/* 0B55C 808E1DCC 00118C00 */  sll     $s1, $s1, 16               
/* 0B560 808E1DD0 00118C03 */  sra     $s1, $s1, 16               
/* 0B564 808E1DD4 2A210008 */  slti    $at, $s1, 0x0008           
/* 0B568 808E1DD8 1420FFDA */  bne     $at, $zero, .L808E1D44     
/* 0B56C 808E1DDC 00000000 */  nop
/* 0B570 808E1DE0 10000026 */  beq     $zero, $zero, .L808E1E7C   
/* 0B574 808E1DE4 00000000 */  nop
.L808E1DE8:
/* 0B578 808E1DE8 14400024 */  bne     $v0, $zero, .L808E1E7C     
/* 0B57C 808E1DEC 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 0B580 808E1DF0 34211DA0 */  ori     $at, $at, 0x1DA0           ## $at = 00011DA0
/* 0B584 808E1DF4 0C0347F5 */  jal     func_800D1FD4              
/* 0B588 808E1DF8 02812021 */  addu    $a0, $s4, $at              
/* 0B58C 808E1DFC 866900B8 */  lh      $t1, 0x00B8($s3)           ## 000000B8
/* 0B590 808E1E00 3C014700 */  lui     $at, 0x4700                ## $at = 47000000
/* 0B594 808E1E04 44815000 */  mtc1    $at, $f10                  ## $f10 = 32768.00
/* 0B598 808E1E08 44893000 */  mtc1    $t1, $f6                   ## $f6 = 0.00
/* 0B59C 808E1E0C 3C018090 */  lui     $at, %hi(D_808F81BC)       ## $at = 80900000
/* 0B5A0 808E1E10 C43281BC */  lwc1    $f18, %lo(D_808F81BC)($at) 
/* 0B5A4 808E1E14 46803220 */  cvt.s.w $f8, $f6                   
/* 0B5A8 808E1E18 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 0B5AC 808E1E1C 460A4403 */  div.s   $f16, $f8, $f10            
/* 0B5B0 808E1E20 46128302 */  mul.s   $f12, $f16, $f18           
/* 0B5B4 808E1E24 0C0343B5 */  jal     Matrix_RotateZ              
/* 0B5B8 808E1E28 00000000 */  nop
/* 0B5BC 808E1E2C 8E5002D0 */  lw      $s0, 0x02D0($s2)           ## 000002D0
/* 0B5C0 808E1E30 3C0BDA38 */  lui     $t3, 0xDA38                ## $t3 = DA380000
/* 0B5C4 808E1E34 356B0003 */  ori     $t3, $t3, 0x0003           ## $t3 = DA380003
/* 0B5C8 808E1E38 260A0008 */  addiu   $t2, $s0, 0x0008           ## $t2 = 00000008
/* 0B5CC 808E1E3C AE4A02D0 */  sw      $t2, 0x02D0($s2)           ## 000002D0
/* 0B5D0 808E1E40 3C05808F */  lui     $a1, %hi(D_808F7CBC)       ## $a1 = 808F0000
/* 0B5D4 808E1E44 AE0B0000 */  sw      $t3, 0x0000($s0)           ## 00000000
/* 0B5D8 808E1E48 8E840000 */  lw      $a0, 0x0000($s4)           ## 00000000
/* 0B5DC 808E1E4C 24A57CBC */  addiu   $a1, $a1, %lo(D_808F7CBC)  ## $a1 = 808F7CBC
/* 0B5E0 808E1E50 0C0346A2 */  jal     Matrix_NewMtx              
/* 0B5E4 808E1E54 240626B3 */  addiu   $a2, $zero, 0x26B3         ## $a2 = 000026B3
/* 0B5E8 808E1E58 AE020004 */  sw      $v0, 0x0004($s0)           ## 00000004
/* 0B5EC 808E1E5C 8E4302D0 */  lw      $v1, 0x02D0($s2)           ## 000002D0
/* 0B5F0 808E1E60 3C0E808E */  lui     $t6, %hi(D_808E7E58)       ## $t6 = 808E0000
/* 0B5F4 808E1E64 25CE7E58 */  addiu   $t6, $t6, %lo(D_808E7E58)  ## $t6 = 808E7E58
/* 0B5F8 808E1E68 246C0008 */  addiu   $t4, $v1, 0x0008           ## $t4 = 00000008
/* 0B5FC 808E1E6C AE4C02D0 */  sw      $t4, 0x02D0($s2)           ## 000002D0
/* 0B600 808E1E70 3C0DDE00 */  lui     $t5, 0xDE00                ## $t5 = DE000000
/* 0B604 808E1E74 AC6D0000 */  sw      $t5, 0x0000($v1)           ## 00000000
/* 0B608 808E1E78 AC6E0004 */  sw      $t6, 0x0004($v1)           ## 00000004
.L808E1E7C:
/* 0B60C 808E1E7C 3C06808F */  lui     $a2, %hi(D_808F7CD0)       ## $a2 = 808F0000
/* 0B610 808E1E80 24C67CD0 */  addiu   $a2, $a2, %lo(D_808F7CD0)  ## $a2 = 808F7CD0
/* 0B614 808E1E84 27A40064 */  addiu   $a0, $sp, 0x0064           ## $a0 = FFFFFFDC
/* 0B618 808E1E88 8E850000 */  lw      $a1, 0x0000($s4)           ## 00000000
/* 0B61C 808E1E8C 0C031AD5 */  jal     Graph_CloseDisps              
/* 0B620 808E1E90 240726B7 */  addiu   $a3, $zero, 0x26B7         ## $a3 = 000026B7
/* 0B624 808E1E94 8FBF002C */  lw      $ra, 0x002C($sp)           
/* 0B628 808E1E98 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 0B62C 808E1E9C 8FB1001C */  lw      $s1, 0x001C($sp)           
/* 0B630 808E1EA0 8FB20020 */  lw      $s2, 0x0020($sp)           
/* 0B634 808E1EA4 8FB30024 */  lw      $s3, 0x0024($sp)           
/* 0B638 808E1EA8 8FB40028 */  lw      $s4, 0x0028($sp)           
/* 0B63C 808E1EAC 03E00008 */  jr      $ra                        
/* 0B640 808E1EB0 27BD0088 */  addiu   $sp, $sp, 0x0088           ## $sp = 00000000
