.late_rodata
glabel D_808CA6D8
    .float 0.1

glabel D_808CA6DC
    .float 1.9

glabel D_808CA6E0
    .float 1.7

glabel D_808CA6E4
    .float 1.4

glabel D_808CA6E8
    .float 1.9

glabel D_808CA6EC
    .float 1.1

glabel D_808CA6F0
    .float 1.9

glabel D_808CA6F4
    .float 6.28

glabel D_808CA6F8
 .word 0xC45E8000
glabel D_808CA6FC
 .word 0xC4BE7852
glabel D_808CA700
 .word 0xC54E8000
glabel D_808CA704
    .float 6.28

glabel D_808CA708
 .word 0xC45E8000
glabel D_808CA70C
 .word 0xC4BE7852
glabel D_808CA710
 .word 0xC54E8000
glabel D_808CA714
    .float 0.4

glabel D_808CA718
    .float 6.28

glabel D_808CA71C
 .word 0xC45E8000
glabel D_808CA720
 .word 0xC4BD3852
glabel D_808CA724
 .word 0xC54E8000

.text
glabel BossDodongo_Update
/* 02970 808C3B00 27BDFF50 */  addiu   $sp, $sp, 0xFF50           ## $sp = FFFFFF50
/* 02974 808C3B04 AFBF002C */  sw      $ra, 0x002C($sp)           
/* 02978 808C3B08 AFB10028 */  sw      $s1, 0x0028($sp)           
/* 0297C 808C3B0C AFB00024 */  sw      $s0, 0x0024($sp)           
/* 02980 808C3B10 8CA21C44 */  lw      $v0, 0x1C44($a1)           ## 00001C44
/* 02984 808C3B14 00808825 */  or      $s1, $a0, $zero            ## $s1 = 00000000
/* 02988 808C3B18 AFA2009C */  sw      $v0, 0x009C($sp)           
/* 0298C 808C3B1C AFA20098 */  sw      $v0, 0x0098($sp)           
/* 02990 808C3B20 848E019E */  lh      $t6, 0x019E($a0)           ## 0000019E
/* 02994 808C3B24 848301DA */  lh      $v1, 0x01DA($a0)           ## 000001DA
/* 02998 808C3B28 A08001E2 */  sb      $zero, 0x01E2($a0)         ## 000001E2
/* 0299C 808C3B2C 25CF0001 */  addiu   $t7, $t6, 0x0001           ## $t7 = 00000001
/* 029A0 808C3B30 10600003 */  beq     $v1, $zero, .L808C3B40     
/* 029A4 808C3B34 A48F019E */  sh      $t7, 0x019E($a0)           ## 0000019E
/* 029A8 808C3B38 2478FFFF */  addiu   $t8, $v1, 0xFFFF           ## $t8 = FFFFFFFF
/* 029AC 808C3B3C A49801DA */  sh      $t8, 0x01DA($a0)           ## 000001DA
.L808C3B40:
/* 029B0 808C3B40 862201DC */  lh      $v0, 0x01DC($s1)           ## 000001DC
/* 029B4 808C3B44 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 029B8 808C3B48 10400002 */  beq     $v0, $zero, .L808C3B54     
/* 029BC 808C3B4C 2459FFFF */  addiu   $t9, $v0, 0xFFFF           ## $t9 = FFFFFFFF
/* 029C0 808C3B50 A63901DC */  sh      $t9, 0x01DC($s1)           ## 000001DC
.L808C3B54:
/* 029C4 808C3B54 862201DE */  lh      $v0, 0x01DE($s1)           ## 000001DE
/* 029C8 808C3B58 10400002 */  beq     $v0, $zero, .L808C3B64     
/* 029CC 808C3B5C 244AFFFF */  addiu   $t2, $v0, 0xFFFF           ## $t2 = FFFFFFFF
/* 029D0 808C3B60 A62A01DE */  sh      $t2, 0x01DE($s1)           ## 000001DE
.L808C3B64:
/* 029D4 808C3B64 862201C0 */  lh      $v0, 0x01C0($s1)           ## 000001C0
/* 029D8 808C3B68 10400002 */  beq     $v0, $zero, .L808C3B74     
/* 029DC 808C3B6C 244BFFFF */  addiu   $t3, $v0, 0xFFFF           ## $t3 = FFFFFFFF
/* 029E0 808C3B70 A62B01C0 */  sh      $t3, 0x01C0($s1)           ## 000001C0
.L808C3B74:
/* 029E4 808C3B74 862201C8 */  lh      $v0, 0x01C8($s1)           ## 000001C8
/* 029E8 808C3B78 10400002 */  beq     $v0, $zero, .L808C3B84     
/* 029EC 808C3B7C 244CFFFF */  addiu   $t4, $v0, 0xFFFF           ## $t4 = FFFFFFFF
/* 029F0 808C3B80 A62C01C8 */  sh      $t4, 0x01C8($s1)           ## 000001C8
.L808C3B84:
/* 029F4 808C3B84 0C2313DB */  jal     func_808C4F6C              
/* 029F8 808C3B88 AFA500B4 */  sw      $a1, 0x00B4($sp)           
/* 029FC 808C3B8C 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 02A00 808C3B90 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 02A04 808C3B94 4600203C */  c.lt.s  $f4, $f0                   
/* 02A08 808C3B98 00000000 */  nop
/* 02A0C 808C3B9C 45020006 */  bc1fl   .L808C3BB8                 
/* 02A10 808C3BA0 A62001A4 */  sh      $zero, 0x01A4($s1)         ## 000001A4
/* 02A14 808C3BA4 4600018D */  trunc.w.s $f6, $f0                   
/* 02A18 808C3BA8 440E3000 */  mfc1    $t6, $f6                   
/* 02A1C 808C3BAC 10000002 */  beq     $zero, $zero, .L808C3BB8   
/* 02A20 808C3BB0 A62E01A4 */  sh      $t6, 0x01A4($s1)           ## 000001A4
/* 02A24 808C3BB4 A62001A4 */  sh      $zero, 0x01A4($s1)         ## 000001A4
.L808C3BB8:
/* 02A28 808C3BB8 0C23142A */  jal     func_808C50A8              
/* 02A2C 808C3BBC 8FA500B4 */  lw      $a1, 0x00B4($sp)           
/* 02A30 808C3BC0 44804000 */  mtc1    $zero, $f8                 ## $f8 = 0.00
/* 02A34 808C3BC4 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 02A38 808C3BC8 4600403C */  c.lt.s  $f8, $f0                   
/* 02A3C 808C3BCC 00000000 */  nop
/* 02A40 808C3BD0 45020006 */  bc1fl   .L808C3BEC                 
/* 02A44 808C3BD4 A62001A6 */  sh      $zero, 0x01A6($s1)         ## 000001A6
/* 02A48 808C3BD8 4600028D */  trunc.w.s $f10, $f0                  
/* 02A4C 808C3BDC 44185000 */  mfc1    $t8, $f10                  
/* 02A50 808C3BE0 10000002 */  beq     $zero, $zero, .L808C3BEC   
/* 02A54 808C3BE4 A63801A6 */  sh      $t8, 0x01A6($s1)           ## 000001A6
/* 02A58 808C3BE8 A62001A6 */  sh      $zero, 0x01A6($s1)         ## 000001A6
.L808C3BEC:
/* 02A5C 808C3BEC 0C23147D */  jal     func_808C51F4              
/* 02A60 808C3BF0 8FA500B4 */  lw      $a1, 0x00B4($sp)           
/* 02A64 808C3BF4 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 02A68 808C3BF8 0C231493 */  jal     func_808C524C              
/* 02A6C 808C3BFC 8FA500B4 */  lw      $a1, 0x00B4($sp)           
/* 02A70 808C3C00 8E390190 */  lw      $t9, 0x0190($s1)           ## 00000190
/* 02A74 808C3C04 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 02A78 808C3C08 8FA500B4 */  lw      $a1, 0x00B4($sp)           
/* 02A7C 808C3C0C 0320F809 */  jalr    $ra, $t9                   
/* 02A80 808C3C10 00000000 */  nop
/* 02A84 808C3C14 862A0032 */  lh      $t2, 0x0032($s1)           ## 00000032
/* 02A88 808C3C18 44808000 */  mtc1    $zero, $f16                ## $f16 = 0.00
/* 02A8C 808C3C1C 8E250228 */  lw      $a1, 0x0228($s1)           ## 00000228
/* 02A90 808C3C20 A62A00B6 */  sh      $t2, 0x00B6($s1)           ## 000000B6
/* 02A94 808C3C24 262400BC */  addiu   $a0, $s1, 0x00BC           ## $a0 = 000000BC
/* 02A98 808C3C28 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 02A9C 808C3C2C 3C0742C8 */  lui     $a3, 0x42C8                ## $a3 = 42C80000
/* 02AA0 808C3C30 0C01E0C4 */  jal     Math_SmoothScaleMaxMinF
              
/* 02AA4 808C3C34 E7B00010 */  swc1    $f16, 0x0010($sp)          
/* 02AA8 808C3C38 0C00B638 */  jal     Actor_MoveForward
              
/* 02AAC 808C3C3C 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 02AB0 808C3C40 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 02AB4 808C3C44 0C2314D5 */  jal     func_808C5354              
/* 02AB8 808C3C48 8FA500B4 */  lw      $a1, 0x00B4($sp)           
/* 02ABC 808C3C4C 3C014120 */  lui     $at, 0x4120                ## $at = 41200000
/* 02AC0 808C3C50 44810000 */  mtc1    $at, $f0                   ## $f0 = 10.00
/* 02AC4 808C3C54 3C0141A0 */  lui     $at, 0x41A0                ## $at = 41A00000
/* 02AC8 808C3C58 44819000 */  mtc1    $at, $f18                  ## $f18 = 20.00
/* 02ACC 808C3C5C 240B0004 */  addiu   $t3, $zero, 0x0004         ## $t3 = 00000004
/* 02AD0 808C3C60 44060000 */  mfc1    $a2, $f0                   
/* 02AD4 808C3C64 44070000 */  mfc1    $a3, $f0                   
/* 02AD8 808C3C68 AFAB0014 */  sw      $t3, 0x0014($sp)           
/* 02ADC 808C3C6C 8FA400B4 */  lw      $a0, 0x00B4($sp)           
/* 02AE0 808C3C70 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 02AE4 808C3C74 0C00B92D */  jal     func_8002E4B4              
/* 02AE8 808C3C78 E7B20010 */  swc1    $f18, 0x0010($sp)          
/* 02AEC 808C3C7C 44800000 */  mtc1    $zero, $f0                 ## $f0 = 0.00
/* 02AF0 808C3C80 3C073A83 */  lui     $a3, 0x3A83                ## $a3 = 3A830000
/* 02AF4 808C3C84 34E7126F */  ori     $a3, $a3, 0x126F           ## $a3 = 3A83126F
/* 02AF8 808C3C88 44050000 */  mfc1    $a1, $f0                   
/* 02AFC 808C3C8C 26240208 */  addiu   $a0, $s1, 0x0208           ## $a0 = 00000208
/* 02B00 808C3C90 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 02B04 808C3C94 0C01E0C4 */  jal     Math_SmoothScaleMaxMinF
              
/* 02B08 808C3C98 E7A00010 */  swc1    $f0, 0x0010($sp)           
/* 02B0C 808C3C9C 44801000 */  mtc1    $zero, $f2                 ## $f2 = 0.00
/* 02B10 808C3CA0 3C073A83 */  lui     $a3, 0x3A83                ## $a3 = 3A830000
/* 02B14 808C3CA4 34E7126F */  ori     $a3, $a3, 0x126F           ## $a3 = 3A83126F
/* 02B18 808C3CA8 44051000 */  mfc1    $a1, $f2                   
/* 02B1C 808C3CAC 2624020C */  addiu   $a0, $s1, 0x020C           ## $a0 = 0000020C
/* 02B20 808C3CB0 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 02B24 808C3CB4 0C01E0C4 */  jal     Math_SmoothScaleMaxMinF
              
/* 02B28 808C3CB8 E7A20010 */  swc1    $f2, 0x0010($sp)           
/* 02B2C 808C3CBC 862C019E */  lh      $t4, 0x019E($s1)           ## 0000019E
/* 02B30 808C3CC0 318D007F */  andi    $t5, $t4, 0x007F           ## $t5 = 00000000
/* 02B34 808C3CC4 15A00011 */  bne     $t5, $zero, .L808C3D0C     
/* 02B38 808C3CC8 00008025 */  or      $s0, $zero, $zero          ## $s0 = 00000000
.L808C3CCC:
/* 02B3C 808C3CCC 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 02B40 808C3CD0 00000000 */  nop
/* 02B44 808C3CD4 3C013E80 */  lui     $at, 0x3E80                ## $at = 3E800000
/* 02B48 808C3CD8 44812000 */  mtc1    $at, $f4                   ## $f4 = 0.25
/* 02B4C 808C3CDC 3C013F00 */  lui     $at, 0x3F00                ## $at = 3F000000
/* 02B50 808C3CE0 44814000 */  mtc1    $at, $f8                   ## $f8 = 0.50
/* 02B54 808C3CE4 46040182 */  mul.s   $f6, $f0, $f4              
/* 02B58 808C3CE8 00107080 */  sll     $t6, $s0,  2               
/* 02B5C 808C3CEC 26100001 */  addiu   $s0, $s0, 0x0001           ## $s0 = 00000001
/* 02B60 808C3CF0 00108400 */  sll     $s0, $s0, 16               
/* 02B64 808C3CF4 00108403 */  sra     $s0, $s0, 16               
/* 02B68 808C3CF8 2A010032 */  slti    $at, $s0, 0x0032           
/* 02B6C 808C3CFC 022E7821 */  addu    $t7, $s1, $t6              
/* 02B70 808C3D00 46083280 */  add.s   $f10, $f6, $f8             
/* 02B74 808C3D04 1420FFF1 */  bne     $at, $zero, .L808C3CCC     
/* 02B78 808C3D08 E5EA0324 */  swc1    $f10, 0x0324($t7)          ## 00000324
.L808C3D0C:
/* 02B7C 808C3D0C 00008025 */  or      $s0, $zero, $zero          ## $s0 = 00000000
.L808C3D10:
/* 02B80 808C3D10 0010C080 */  sll     $t8, $s0,  2               
/* 02B84 808C3D14 02381021 */  addu    $v0, $s1, $t8              
/* 02B88 808C3D18 C450025C */  lwc1    $f16, 0x025C($v0)          ## 0000025C
/* 02B8C 808C3D1C C4520324 */  lwc1    $f18, 0x0324($v0)          ## 00000324
/* 02B90 808C3D20 26100001 */  addiu   $s0, $s0, 0x0001           ## $s0 = 00000001
/* 02B94 808C3D24 00108400 */  sll     $s0, $s0, 16               
/* 02B98 808C3D28 46128100 */  add.s   $f4, $f16, $f18            
/* 02B9C 808C3D2C 00108403 */  sra     $s0, $s0, 16               
/* 02BA0 808C3D30 2A010032 */  slti    $at, $s0, 0x0032           
/* 02BA4 808C3D34 1420FFF6 */  bne     $at, $zero, .L808C3D10     
/* 02BA8 808C3D38 E444025C */  swc1    $f4, 0x025C($v0)           ## 0000025C
/* 02BAC 808C3D3C 862201C8 */  lh      $v0, 0x01C8($s1)           ## 000001C8
/* 02BB0 808C3D40 104000B6 */  beq     $v0, $zero, .L808C401C     
/* 02BB4 808C3D44 2841000B */  slti    $at, $v0, 0x000B           
/* 02BB8 808C3D48 14200013 */  bne     $at, $zero, .L808C3D98     
/* 02BBC 808C3D4C 26240240 */  addiu   $a0, $s1, 0x0240           ## $a0 = 00000240
/* 02BC0 808C3D50 30590001 */  andi    $t9, $v0, 0x0001           ## $t9 = 00000000
/* 02BC4 808C3D54 13200005 */  beq     $t9, $zero, .L808C3D6C     
/* 02BC8 808C3D58 26240240 */  addiu   $a0, $s1, 0x0240           ## $a0 = 00000240
/* 02BCC 808C3D5C 3C014220 */  lui     $at, 0x4220                ## $at = 42200000
/* 02BD0 808C3D60 44810000 */  mtc1    $at, $f0                   ## $f0 = 40.00
/* 02BD4 808C3D64 10000005 */  beq     $zero, $zero, .L808C3D7C   
/* 02BD8 808C3D68 44803000 */  mtc1    $zero, $f6                 ## $f6 = 0.00
.L808C3D6C:
/* 02BDC 808C3D6C 3C014270 */  lui     $at, 0x4270                ## $at = 42700000
/* 02BE0 808C3D70 44810000 */  mtc1    $at, $f0                   ## $f0 = 60.00
/* 02BE4 808C3D74 00000000 */  nop
/* 02BE8 808C3D78 44803000 */  mtc1    $zero, $f6                 ## $f6 = 0.00
.L808C3D7C:
/* 02BEC 808C3D7C 44050000 */  mfc1    $a1, $f0                   
/* 02BF0 808C3D80 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 02BF4 808C3D84 3C074248 */  lui     $a3, 0x4248                ## $a3 = 42480000
/* 02BF8 808C3D88 0C01E0C4 */  jal     Math_SmoothScaleMaxMinF
              
/* 02BFC 808C3D8C E7A60010 */  swc1    $f6, 0x0010($sp)           
/* 02C00 808C3D90 10000008 */  beq     $zero, $zero, .L808C3DB4   
/* 02C04 808C3D94 8FA300B4 */  lw      $v1, 0x00B4($sp)           
.L808C3D98:
/* 02C08 808C3D98 44804000 */  mtc1    $zero, $f8                 ## $f8 = 0.00
/* 02C0C 808C3D9C 24050000 */  addiu   $a1, $zero, 0x0000         ## $a1 = 00000000
/* 02C10 808C3DA0 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 02C14 808C3DA4 3C074120 */  lui     $a3, 0x4120                ## $a3 = 41200000
/* 02C18 808C3DA8 0C01E0C4 */  jal     Math_SmoothScaleMaxMinF
              
/* 02C1C 808C3DAC E7A80010 */  swc1    $f8, 0x0010($sp)           
/* 02C20 808C3DB0 8FA300B4 */  lw      $v1, 0x00B4($sp)           
.L808C3DB4:
/* 02C24 808C3DB4 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 02C28 808C3DB8 00611021 */  addu    $v0, $v1, $at              
/* 02C2C 808C3DBC 844A0ABA */  lh      $t2, 0x0ABA($v0)           ## 00000ABA
/* 02C30 808C3DC0 55400097 */  bnel    $t2, $zero, .L808C4020     
/* 02C34 808C3DC4 862201BE */  lh      $v0, 0x01BE($s1)           ## 000001BE
/* 02C38 808C3DC8 844B0AB4 */  lh      $t3, 0x0AB4($v0)           ## 00000AB4
/* 02C3C 808C3DCC 240D0001 */  addiu   $t5, $zero, 0x0001         ## $t5 = 00000001
/* 02C40 808C3DD0 55600093 */  bnel    $t3, $zero, .L808C4020     
/* 02C44 808C3DD4 862201BE */  lh      $v0, 0x01BE($s1)           ## 000001BE
/* 02C48 808C3DD8 444CF800 */  cfc1    $t4, $31
/* 02C4C 808C3DDC 44CDF800 */  ctc1    $t5, $31
/* 02C50 808C3DE0 C62A0240 */  lwc1    $f10, 0x0240($s1)          ## 00000240
/* 02C54 808C3DE4 3C01808D */  lui     $at, %hi(D_808CA6D8)       ## $at = 808D0000
/* 02C58 808C3DE8 C420A6D8 */  lwc1    $f0, %lo(D_808CA6D8)($at)  
/* 02C5C 808C3DEC 46005424 */  cvt.w.s $f16, $f10                 
/* 02C60 808C3DF0 3C014F00 */  lui     $at, 0x4F00                ## $at = 4F000000
/* 02C64 808C3DF4 240B0001 */  addiu   $t3, $zero, 0x0001         ## $t3 = 00000001
/* 02C68 808C3DF8 444DF800 */  cfc1    $t5, $31
/* 02C6C 808C3DFC 00000000 */  nop
/* 02C70 808C3E00 31AD0078 */  andi    $t5, $t5, 0x0078           ## $t5 = 00000000
/* 02C74 808C3E04 51A00013 */  beql    $t5, $zero, .L808C3E54     
/* 02C78 808C3E08 440D8000 */  mfc1    $t5, $f16                  
/* 02C7C 808C3E0C 44818000 */  mtc1    $at, $f16                  ## $f16 = 2147483648.00
/* 02C80 808C3E10 240D0001 */  addiu   $t5, $zero, 0x0001         ## $t5 = 00000001
/* 02C84 808C3E14 46105401 */  sub.s   $f16, $f10, $f16           
/* 02C88 808C3E18 44CDF800 */  ctc1    $t5, $31
/* 02C8C 808C3E1C 00000000 */  nop
/* 02C90 808C3E20 46008424 */  cvt.w.s $f16, $f16                 
/* 02C94 808C3E24 444DF800 */  cfc1    $t5, $31
/* 02C98 808C3E28 00000000 */  nop
/* 02C9C 808C3E2C 31AD0078 */  andi    $t5, $t5, 0x0078           ## $t5 = 00000000
/* 02CA0 808C3E30 15A00005 */  bne     $t5, $zero, .L808C3E48     
/* 02CA4 808C3E34 00000000 */  nop
/* 02CA8 808C3E38 440D8000 */  mfc1    $t5, $f16                  
/* 02CAC 808C3E3C 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 02CB0 808C3E40 10000007 */  beq     $zero, $zero, .L808C3E60   
/* 02CB4 808C3E44 01A16825 */  or      $t5, $t5, $at              ## $t5 = 80000000
.L808C3E48:
/* 02CB8 808C3E48 10000005 */  beq     $zero, $zero, .L808C3E60   
/* 02CBC 808C3E4C 240DFFFF */  addiu   $t5, $zero, 0xFFFF         ## $t5 = FFFFFFFF
/* 02CC0 808C3E50 440D8000 */  mfc1    $t5, $f16                  
.L808C3E54:
/* 02CC4 808C3E54 00000000 */  nop
/* 02CC8 808C3E58 05A0FFFB */  bltz    $t5, .L808C3E48            
/* 02CCC 808C3E5C 00000000 */  nop
.L808C3E60:
/* 02CD0 808C3E60 31AE00FF */  andi    $t6, $t5, 0x00FF           ## $t6 = 000000FF
/* 02CD4 808C3E64 A44E0AB6 */  sh      $t6, 0x0AB6($v0)           ## 00000AB6
/* 02CD8 808C3E68 44CCF800 */  ctc1    $t4, $31
/* 02CDC 808C3E6C C6320240 */  lwc1    $f18, 0x0240($s1)          ## 00000240
/* 02CE0 808C3E70 24180001 */  addiu   $t8, $zero, 0x0001         ## $t8 = 00000001
/* 02CE4 808C3E74 3C014F00 */  lui     $at, 0x4F00                ## $at = 4F000000
/* 02CE8 808C3E78 46009102 */  mul.s   $f4, $f18, $f0             
/* 02CEC 808C3E7C 444FF800 */  cfc1    $t7, $31
/* 02CF0 808C3E80 44D8F800 */  ctc1    $t8, $31
/* 02CF4 808C3E84 00000000 */  nop
/* 02CF8 808C3E88 460021A4 */  cvt.w.s $f6, $f4                   
/* 02CFC 808C3E8C 4458F800 */  cfc1    $t8, $31
/* 02D00 808C3E90 00000000 */  nop
/* 02D04 808C3E94 33180078 */  andi    $t8, $t8, 0x0078           ## $t8 = 00000000
/* 02D08 808C3E98 53000013 */  beql    $t8, $zero, .L808C3EE8     
/* 02D0C 808C3E9C 44183000 */  mfc1    $t8, $f6                   
/* 02D10 808C3EA0 44813000 */  mtc1    $at, $f6                   ## $f6 = 2147483648.00
/* 02D14 808C3EA4 24180001 */  addiu   $t8, $zero, 0x0001         ## $t8 = 00000001
/* 02D18 808C3EA8 46062181 */  sub.s   $f6, $f4, $f6              
/* 02D1C 808C3EAC 44D8F800 */  ctc1    $t8, $31
/* 02D20 808C3EB0 00000000 */  nop
/* 02D24 808C3EB4 460031A4 */  cvt.w.s $f6, $f6                   
/* 02D28 808C3EB8 4458F800 */  cfc1    $t8, $31
/* 02D2C 808C3EBC 00000000 */  nop
/* 02D30 808C3EC0 33180078 */  andi    $t8, $t8, 0x0078           ## $t8 = 00000000
/* 02D34 808C3EC4 17000005 */  bne     $t8, $zero, .L808C3EDC     
/* 02D38 808C3EC8 00000000 */  nop
/* 02D3C 808C3ECC 44183000 */  mfc1    $t8, $f6                   
/* 02D40 808C3ED0 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 02D44 808C3ED4 10000007 */  beq     $zero, $zero, .L808C3EF4   
/* 02D48 808C3ED8 0301C025 */  or      $t8, $t8, $at              ## $t8 = 80000000
.L808C3EDC:
/* 02D4C 808C3EDC 10000005 */  beq     $zero, $zero, .L808C3EF4   
/* 02D50 808C3EE0 2418FFFF */  addiu   $t8, $zero, 0xFFFF         ## $t8 = FFFFFFFF
/* 02D54 808C3EE4 44183000 */  mfc1    $t8, $f6                   
.L808C3EE8:
/* 02D58 808C3EE8 00000000 */  nop
/* 02D5C 808C3EEC 0700FFFB */  bltz    $t8, .L808C3EDC            
/* 02D60 808C3EF0 00000000 */  nop
.L808C3EF4:
/* 02D64 808C3EF4 44CFF800 */  ctc1    $t7, $31
/* 02D68 808C3EF8 331900FF */  andi    $t9, $t8, 0x00FF           ## $t9 = 000000FF
/* 02D6C 808C3EFC A4590AB8 */  sh      $t9, 0x0AB8($v0)           ## 00000AB8
/* 02D70 808C3F00 C6280240 */  lwc1    $f8, 0x0240($s1)           ## 00000240
/* 02D74 808C3F04 444AF800 */  cfc1    $t2, $31
/* 02D78 808C3F08 44CBF800 */  ctc1    $t3, $31
/* 02D7C 808C3F0C 3C014F00 */  lui     $at, 0x4F00                ## $at = 4F000000
/* 02D80 808C3F10 460042A4 */  cvt.w.s $f10, $f8                  
/* 02D84 808C3F14 444BF800 */  cfc1    $t3, $31
/* 02D88 808C3F18 00000000 */  nop
/* 02D8C 808C3F1C 316B0078 */  andi    $t3, $t3, 0x0078           ## $t3 = 00000000
/* 02D90 808C3F20 51600013 */  beql    $t3, $zero, .L808C3F70     
/* 02D94 808C3F24 440B5000 */  mfc1    $t3, $f10                  
/* 02D98 808C3F28 44815000 */  mtc1    $at, $f10                  ## $f10 = 2147483648.00
/* 02D9C 808C3F2C 240B0001 */  addiu   $t3, $zero, 0x0001         ## $t3 = 00000001
/* 02DA0 808C3F30 460A4281 */  sub.s   $f10, $f8, $f10            
/* 02DA4 808C3F34 44CBF800 */  ctc1    $t3, $31
/* 02DA8 808C3F38 00000000 */  nop
/* 02DAC 808C3F3C 460052A4 */  cvt.w.s $f10, $f10                 
/* 02DB0 808C3F40 444BF800 */  cfc1    $t3, $31
/* 02DB4 808C3F44 00000000 */  nop
/* 02DB8 808C3F48 316B0078 */  andi    $t3, $t3, 0x0078           ## $t3 = 00000000
/* 02DBC 808C3F4C 15600005 */  bne     $t3, $zero, .L808C3F64     
/* 02DC0 808C3F50 00000000 */  nop
/* 02DC4 808C3F54 440B5000 */  mfc1    $t3, $f10                  
/* 02DC8 808C3F58 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 02DCC 808C3F5C 10000007 */  beq     $zero, $zero, .L808C3F7C   
/* 02DD0 808C3F60 01615825 */  or      $t3, $t3, $at              ## $t3 = 80000000
.L808C3F64:
/* 02DD4 808C3F64 10000005 */  beq     $zero, $zero, .L808C3F7C   
/* 02DD8 808C3F68 240BFFFF */  addiu   $t3, $zero, 0xFFFF         ## $t3 = FFFFFFFF
/* 02DDC 808C3F6C 440B5000 */  mfc1    $t3, $f10                  
.L808C3F70:
/* 02DE0 808C3F70 00000000 */  nop
/* 02DE4 808C3F74 0560FFFB */  bltz    $t3, .L808C3F64            
/* 02DE8 808C3F78 00000000 */  nop
.L808C3F7C:
/* 02DEC 808C3F7C 316C00FF */  andi    $t4, $t3, 0x00FF           ## $t4 = 000000FF
/* 02DF0 808C3F80 A44C0AB0 */  sh      $t4, 0x0AB0($v0)           ## 00000AB0
/* 02DF4 808C3F84 44CAF800 */  ctc1    $t2, $31
/* 02DF8 808C3F88 C6300240 */  lwc1    $f16, 0x0240($s1)          ## 00000240
/* 02DFC 808C3F8C 240E0001 */  addiu   $t6, $zero, 0x0001         ## $t6 = 00000001
/* 02E00 808C3F90 3C014F00 */  lui     $at, 0x4F00                ## $at = 4F000000
/* 02E04 808C3F94 46008482 */  mul.s   $f18, $f16, $f0            
/* 02E08 808C3F98 444DF800 */  cfc1    $t5, $31
/* 02E0C 808C3F9C 44CEF800 */  ctc1    $t6, $31
/* 02E10 808C3FA0 00000000 */  nop
/* 02E14 808C3FA4 46009124 */  cvt.w.s $f4, $f18                  
/* 02E18 808C3FA8 444EF800 */  cfc1    $t6, $31
/* 02E1C 808C3FAC 00000000 */  nop
/* 02E20 808C3FB0 31CE0078 */  andi    $t6, $t6, 0x0078           ## $t6 = 00000000
/* 02E24 808C3FB4 51C00013 */  beql    $t6, $zero, .L808C4004     
/* 02E28 808C3FB8 440E2000 */  mfc1    $t6, $f4                   
/* 02E2C 808C3FBC 44812000 */  mtc1    $at, $f4                   ## $f4 = 2147483648.00
/* 02E30 808C3FC0 240E0001 */  addiu   $t6, $zero, 0x0001         ## $t6 = 00000001
/* 02E34 808C3FC4 46049101 */  sub.s   $f4, $f18, $f4             
/* 02E38 808C3FC8 44CEF800 */  ctc1    $t6, $31
/* 02E3C 808C3FCC 00000000 */  nop
/* 02E40 808C3FD0 46002124 */  cvt.w.s $f4, $f4                   
/* 02E44 808C3FD4 444EF800 */  cfc1    $t6, $31
/* 02E48 808C3FD8 00000000 */  nop
/* 02E4C 808C3FDC 31CE0078 */  andi    $t6, $t6, 0x0078           ## $t6 = 00000000
/* 02E50 808C3FE0 15C00005 */  bne     $t6, $zero, .L808C3FF8     
/* 02E54 808C3FE4 00000000 */  nop
/* 02E58 808C3FE8 440E2000 */  mfc1    $t6, $f4                   
/* 02E5C 808C3FEC 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 02E60 808C3FF0 10000007 */  beq     $zero, $zero, .L808C4010   
/* 02E64 808C3FF4 01C17025 */  or      $t6, $t6, $at              ## $t6 = 80000000
.L808C3FF8:
/* 02E68 808C3FF8 10000005 */  beq     $zero, $zero, .L808C4010   
/* 02E6C 808C3FFC 240EFFFF */  addiu   $t6, $zero, 0xFFFF         ## $t6 = FFFFFFFF
/* 02E70 808C4000 440E2000 */  mfc1    $t6, $f4                   
.L808C4004:
/* 02E74 808C4004 00000000 */  nop
/* 02E78 808C4008 05C0FFFB */  bltz    $t6, .L808C3FF8            
/* 02E7C 808C400C 00000000 */  nop
.L808C4010:
/* 02E80 808C4010 44CDF800 */  ctc1    $t5, $31
/* 02E84 808C4014 31CF00FF */  andi    $t7, $t6, 0x00FF           ## $t7 = 000000FF
/* 02E88 808C4018 A44F0AB2 */  sh      $t7, 0x0AB2($v0)           ## 00000AB2
.L808C401C:
/* 02E8C 808C401C 862201BE */  lh      $v0, 0x01BE($s1)           ## 000001BE
.L808C4020:
/* 02E90 808C4020 8FA300B4 */  lw      $v1, 0x00B4($sp)           
/* 02E94 808C4024 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 02E98 808C4028 1040003B */  beq     $v0, $zero, .L808C4118     
/* 02E9C 808C402C 3C0740A0 */  lui     $a3, 0x40A0                ## $a3 = 40A00000
/* 02EA0 808C4030 284103E8 */  slti    $at, $v0, 0x03E8           
/* 02EA4 808C4034 14200011 */  bne     $at, $zero, .L808C407C     
/* 02EA8 808C4038 2458FFFF */  addiu   $t8, $v0, 0xFFFF           ## $t8 = FFFFFFFF
/* 02EAC 808C403C 44803000 */  mtc1    $zero, $f6                 ## $f6 = 0.00
/* 02EB0 808C4040 26240210 */  addiu   $a0, $s1, 0x0210           ## $a0 = 00000210
/* 02EB4 808C4044 3C0541F0 */  lui     $a1, 0x41F0                ## $a1 = 41F00000
/* 02EB8 808C4048 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 02EBC 808C404C 3C0741A0 */  lui     $a3, 0x41A0                ## $a3 = 41A00000
/* 02EC0 808C4050 0C01E0C4 */  jal     Math_SmoothScaleMaxMinF
              
/* 02EC4 808C4054 E7A60010 */  swc1    $f6, 0x0010($sp)           
/* 02EC8 808C4058 44804000 */  mtc1    $zero, $f8                 ## $f8 = 0.00
/* 02ECC 808C405C 26240214 */  addiu   $a0, $s1, 0x0214           ## $a0 = 00000214
/* 02ED0 808C4060 3C054120 */  lui     $a1, 0x4120                ## $a1 = 41200000
/* 02ED4 808C4064 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 02ED8 808C4068 3C0741A0 */  lui     $a3, 0x41A0                ## $a3 = 41A00000
/* 02EDC 808C406C 0C01E0C4 */  jal     Math_SmoothScaleMaxMinF
              
/* 02EE0 808C4070 E7A80010 */  swc1    $f8, 0x0010($sp)           
/* 02EE4 808C4074 10000011 */  beq     $zero, $zero, .L808C40BC   
/* 02EE8 808C4078 44809000 */  mtc1    $zero, $f18                ## $f18 = 0.00
.L808C407C:
/* 02EEC 808C407C 44805000 */  mtc1    $zero, $f10                ## $f10 = 0.00
/* 02EF0 808C4080 A63801BE */  sh      $t8, 0x01BE($s1)           ## 000001BE
/* 02EF4 808C4084 26240210 */  addiu   $a0, $s1, 0x0210           ## $a0 = 00000210
/* 02EF8 808C4088 3C05437F */  lui     $a1, 0x437F                ## $a1 = 437F0000
/* 02EFC 808C408C 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 02F00 808C4090 3C0741A0 */  lui     $a3, 0x41A0                ## $a3 = 41A00000
/* 02F04 808C4094 0C01E0C4 */  jal     Math_SmoothScaleMaxMinF
              
/* 02F08 808C4098 E7AA0010 */  swc1    $f10, 0x0010($sp)          
/* 02F0C 808C409C 44808000 */  mtc1    $zero, $f16                ## $f16 = 0.00
/* 02F10 808C40A0 26240214 */  addiu   $a0, $s1, 0x0214           ## $a0 = 00000214
/* 02F14 808C40A4 24050000 */  addiu   $a1, $zero, 0x0000         ## $a1 = 00000000
/* 02F18 808C40A8 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 02F1C 808C40AC 3C0741A0 */  lui     $a3, 0x41A0                ## $a3 = 41A00000
/* 02F20 808C40B0 0C01E0C4 */  jal     Math_SmoothScaleMaxMinF
              
/* 02F24 808C40B4 E7B00010 */  swc1    $f16, 0x0010($sp)          
/* 02F28 808C40B8 44809000 */  mtc1    $zero, $f18                ## $f18 = 0.00
.L808C40BC:
/* 02F2C 808C40BC 26240218 */  addiu   $a0, $s1, 0x0218           ## $a0 = 00000218
/* 02F30 808C40C0 24050000 */  addiu   $a1, $zero, 0x0000         ## $a1 = 00000000
/* 02F34 808C40C4 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 02F38 808C40C8 3C0741A0 */  lui     $a3, 0x41A0                ## $a3 = 41A00000
/* 02F3C 808C40CC 0C01E0C4 */  jal     Math_SmoothScaleMaxMinF
              
/* 02F40 808C40D0 E7B20010 */  swc1    $f18, 0x0010($sp)          
/* 02F44 808C40D4 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 02F48 808C40D8 2624021C */  addiu   $a0, $s1, 0x021C           ## $a0 = 0000021C
/* 02F4C 808C40DC 3C054461 */  lui     $a1, 0x4461                ## $a1 = 44610000
/* 02F50 808C40E0 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 02F54 808C40E4 3C074120 */  lui     $a3, 0x4120                ## $a3 = 41200000
/* 02F58 808C40E8 0C01E0C4 */  jal     Math_SmoothScaleMaxMinF
              
/* 02F5C 808C40EC E7A40010 */  swc1    $f4, 0x0010($sp)           
/* 02F60 808C40F0 44803000 */  mtc1    $zero, $f6                 ## $f6 = 0.00
/* 02F64 808C40F4 3C054489 */  lui     $a1, 0x4489                ## $a1 = 44890000
/* 02F68 808C40F8 34A56000 */  ori     $a1, $a1, 0x6000           ## $a1 = 44896000
/* 02F6C 808C40FC 26240220 */  addiu   $a0, $s1, 0x0220           ## $a0 = 00000220
/* 02F70 808C4100 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 02F74 808C4104 3C074120 */  lui     $a3, 0x4120                ## $a3 = 41200000
/* 02F78 808C4108 0C01E0C4 */  jal     Math_SmoothScaleMaxMinF
              
/* 02F7C 808C410C E7A60010 */  swc1    $f6, 0x0010($sp)           
/* 02F80 808C4110 10000042 */  beq     $zero, $zero, .L808C421C   
/* 02F84 808C4114 8FB8009C */  lw      $t8, 0x009C($sp)           
.L808C4118:
/* 02F88 808C4118 907907AF */  lbu     $t9, 0x07AF($v1)           ## 000007AF
/* 02F8C 808C411C 44808000 */  mtc1    $zero, $f16                ## $f16 = 0.00
/* 02F90 808C4120 26240210 */  addiu   $a0, $s1, 0x0210           ## $a0 = 00000210
/* 02F94 808C4124 44994000 */  mtc1    $t9, $f8                   ## $f8 = 0.00
/* 02F98 808C4128 3C014F80 */  lui     $at, 0x4F80                ## $at = 4F800000
/* 02F9C 808C412C 07210004 */  bgez    $t9, .L808C4140            
/* 02FA0 808C4130 46804220 */  cvt.s.w $f8, $f8                   
/* 02FA4 808C4134 44815000 */  mtc1    $at, $f10                  ## $f10 = 4294967296.00
/* 02FA8 808C4138 00000000 */  nop
/* 02FAC 808C413C 460A4200 */  add.s   $f8, $f8, $f10             
.L808C4140:
/* 02FB0 808C4140 44054000 */  mfc1    $a1, $f8                   
/* 02FB4 808C4144 0C01E0C4 */  jal     Math_SmoothScaleMaxMinF
              
/* 02FB8 808C4148 E7B00010 */  swc1    $f16, 0x0010($sp)          
/* 02FBC 808C414C 8FAA00B4 */  lw      $t2, 0x00B4($sp)           
/* 02FC0 808C4150 44803000 */  mtc1    $zero, $f6                 ## $f6 = 0.00
/* 02FC4 808C4154 26240214 */  addiu   $a0, $s1, 0x0214           ## $a0 = 00000214
/* 02FC8 808C4158 914B07B0 */  lbu     $t3, 0x07B0($t2)           ## 000007B0
/* 02FCC 808C415C 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 02FD0 808C4160 3C0740A0 */  lui     $a3, 0x40A0                ## $a3 = 40A00000
/* 02FD4 808C4164 448B9000 */  mtc1    $t3, $f18                  ## $f18 = 0.00
/* 02FD8 808C4168 3C014F80 */  lui     $at, 0x4F80                ## $at = 4F800000
/* 02FDC 808C416C 05610004 */  bgez    $t3, .L808C4180            
/* 02FE0 808C4170 468094A0 */  cvt.s.w $f18, $f18                 
/* 02FE4 808C4174 44812000 */  mtc1    $at, $f4                   ## $f4 = 4294967296.00
/* 02FE8 808C4178 00000000 */  nop
/* 02FEC 808C417C 46049480 */  add.s   $f18, $f18, $f4            
.L808C4180:
/* 02FF0 808C4180 44059000 */  mfc1    $a1, $f18                  
/* 02FF4 808C4184 0C01E0C4 */  jal     Math_SmoothScaleMaxMinF
              
/* 02FF8 808C4188 E7A60010 */  swc1    $f6, 0x0010($sp)           
/* 02FFC 808C418C 8FAC00B4 */  lw      $t4, 0x00B4($sp)           
/* 03000 808C4190 44808000 */  mtc1    $zero, $f16                ## $f16 = 0.00
/* 03004 808C4194 26240218 */  addiu   $a0, $s1, 0x0218           ## $a0 = 00000218
/* 03008 808C4198 918D07B1 */  lbu     $t5, 0x07B1($t4)           ## 000007B1
/* 0300C 808C419C 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 03010 808C41A0 3C0740A0 */  lui     $a3, 0x40A0                ## $a3 = 40A00000
/* 03014 808C41A4 448D4000 */  mtc1    $t5, $f8                   ## $f8 = 0.00
/* 03018 808C41A8 3C014F80 */  lui     $at, 0x4F80                ## $at = 4F800000
/* 0301C 808C41AC 05A10004 */  bgez    $t5, .L808C41C0            
/* 03020 808C41B0 46804220 */  cvt.s.w $f8, $f8                   
/* 03024 808C41B4 44815000 */  mtc1    $at, $f10                  ## $f10 = 4294967296.00
/* 03028 808C41B8 00000000 */  nop
/* 0302C 808C41BC 460A4200 */  add.s   $f8, $f8, $f10             
.L808C41C0:
/* 03030 808C41C0 44054000 */  mfc1    $a1, $f8                   
/* 03034 808C41C4 0C01E0C4 */  jal     Math_SmoothScaleMaxMinF
              
/* 03038 808C41C8 E7B00010 */  swc1    $f16, 0x0010($sp)          
/* 0303C 808C41CC 8FAE00B4 */  lw      $t6, 0x00B4($sp)           
/* 03040 808C41D0 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 03044 808C41D4 2624021C */  addiu   $a0, $s1, 0x021C           ## $a0 = 0000021C
/* 03048 808C41D8 85CF07B2 */  lh      $t7, 0x07B2($t6)           ## 000007B2
/* 0304C 808C41DC 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 03050 808C41E0 3C0740A0 */  lui     $a3, 0x40A0                ## $a3 = 40A00000
/* 03054 808C41E4 448F9000 */  mtc1    $t7, $f18                  ## $f18 = 0.00
/* 03058 808C41E8 E7A40010 */  swc1    $f4, 0x0010($sp)           
/* 0305C 808C41EC 468094A0 */  cvt.s.w $f18, $f18                 
/* 03060 808C41F0 44059000 */  mfc1    $a1, $f18                  
/* 03064 808C41F4 0C01E0C4 */  jal     Math_SmoothScaleMaxMinF
              
/* 03068 808C41F8 00000000 */  nop
/* 0306C 808C41FC 44803000 */  mtc1    $zero, $f6                 ## $f6 = 0.00
/* 03070 808C4200 26240220 */  addiu   $a0, $s1, 0x0220           ## $a0 = 00000220
/* 03074 808C4204 3C05447A */  lui     $a1, 0x447A                ## $a1 = 447A0000
/* 03078 808C4208 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 0307C 808C420C 3C0740A0 */  lui     $a3, 0x40A0                ## $a3 = 40A00000
/* 03080 808C4210 0C01E0C4 */  jal     Math_SmoothScaleMaxMinF
              
/* 03084 808C4214 E7A60010 */  swc1    $f6, 0x0010($sp)           
/* 03088 808C4218 8FB8009C */  lw      $t8, 0x009C($sp)           
.L808C421C:
/* 0308C 808C421C 3C01C47A */  lui     $at, 0xC47A                ## $at = C47A0000
/* 03090 808C4220 44815000 */  mtc1    $at, $f10                  ## $f10 = -1000.00
/* 03094 808C4224 C7080028 */  lwc1    $f8, 0x0028($t8)           ## 00000028
/* 03098 808C4228 3C01808D */  lui     $at, %hi(D_808CA6DC)       ## $at = 808D0000
/* 0309C 808C422C 460A403C */  c.lt.s  $f8, $f10                  
/* 030A0 808C4230 00000000 */  nop
/* 030A4 808C4234 45020103 */  bc1fl   .L808C4644                 
/* 030A8 808C4238 862E01C6 */  lh      $t6, 0x01C6($s1)           ## 000001C6
/* 030AC 808C423C A7A0008C */  sh      $zero, 0x008C($sp)         
/* 030B0 808C4240 C6200224 */  lwc1    $f0, 0x0224($s1)           ## 00000224
/* 030B4 808C4244 C430A6DC */  lwc1    $f16, %lo(D_808CA6DC)($at) 
/* 030B8 808C4248 24100001 */  addiu   $s0, $zero, 0x0001         ## $s0 = 00000001
/* 030BC 808C424C 00001825 */  or      $v1, $zero, $zero          ## $v1 = 00000000
/* 030C0 808C4250 4600803C */  c.lt.s  $f16, $f0                  
/* 030C4 808C4254 3C01808D */  lui     $at, %hi(D_808CA6E0)       ## $at = 808D0000
/* 030C8 808C4258 45000003 */  bc1f    .L808C4268                 
/* 030CC 808C425C 00000000 */  nop
/* 030D0 808C4260 1000003D */  beq     $zero, $zero, .L808C4358   
/* 030D4 808C4264 A7A00090 */  sh      $zero, 0x0090($sp)         
.L808C4268:
/* 030D8 808C4268 C432A6E0 */  lwc1    $f18, %lo(D_808CA6E0)($at) 
/* 030DC 808C426C 24100003 */  addiu   $s0, $zero, 0x0003         ## $s0 = 00000003
/* 030E0 808C4270 24190001 */  addiu   $t9, $zero, 0x0001         ## $t9 = 00000001
/* 030E4 808C4274 4600903C */  c.lt.s  $f18, $f0                  
/* 030E8 808C4278 00001825 */  or      $v1, $zero, $zero          ## $v1 = 00000000
/* 030EC 808C427C 3C01808D */  lui     $at, %hi(D_808CA6E4)       ## $at = 808D0000
/* 030F0 808C4280 45000003 */  bc1f    .L808C4290                 
/* 030F4 808C4284 00000000 */  nop
/* 030F8 808C4288 10000033 */  beq     $zero, $zero, .L808C4358   
/* 030FC 808C428C A7B90090 */  sh      $t9, 0x0090($sp)           
.L808C4290:
/* 03100 808C4290 C424A6E4 */  lwc1    $f4, %lo(D_808CA6E4)($at)  
/* 03104 808C4294 24100007 */  addiu   $s0, $zero, 0x0007         ## $s0 = 00000007
/* 03108 808C4298 240A0003 */  addiu   $t2, $zero, 0x0003         ## $t2 = 00000003
/* 0310C 808C429C 4600203C */  c.lt.s  $f4, $f0                   
/* 03110 808C42A0 3C01808D */  lui     $at, %hi(D_808CA6EC)       ## $at = 808D0000
/* 03114 808C42A4 4500000C */  bc1f    .L808C42D8                 
/* 03118 808C42A8 00000000 */  nop
/* 0311C 808C42AC 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 03120 808C42B0 A7AA0090 */  sh      $t2, 0x0090($sp)           
/* 03124 808C42B4 3C01808D */  lui     $at, %hi(D_808CA6E8)       ## $at = 808D0000
/* 03128 808C42B8 C426A6E8 */  lwc1    $f6, %lo(D_808CA6E8)($at)  
/* 0312C 808C42BC 46060202 */  mul.s   $f8, $f0, $f6              
/* 03130 808C42C0 4600428D */  trunc.w.s $f10, $f8                  
/* 03134 808C42C4 44035000 */  mfc1    $v1, $f10                  
/* 03138 808C42C8 00000000 */  nop
/* 0313C 808C42CC 00031C00 */  sll     $v1, $v1, 16               
/* 03140 808C42D0 10000021 */  beq     $zero, $zero, .L808C4358   
/* 03144 808C42D4 00031C03 */  sra     $v1, $v1, 16               
.L808C42D8:
/* 03148 808C42D8 C430A6EC */  lwc1    $f16, %lo(D_808CA6EC)($at) 
/* 0314C 808C42DC 240C0FFF */  addiu   $t4, $zero, 0x0FFF         ## $t4 = 00000FFF
/* 03150 808C42E0 24100001 */  addiu   $s0, $zero, 0x0001         ## $s0 = 00000001
/* 03154 808C42E4 4600803C */  c.lt.s  $f16, $f0                  
/* 03158 808C42E8 240EFFFF */  addiu   $t6, $zero, 0xFFFF         ## $t6 = FFFFFFFF
/* 0315C 808C42EC 24030001 */  addiu   $v1, $zero, 0x0001         ## $v1 = 00000001
/* 03160 808C42F0 4502000E */  bc1fl   .L808C432C                 
/* 03164 808C42F4 A7AE0090 */  sh      $t6, 0x0090($sp)           
/* 03168 808C42F8 24100007 */  addiu   $s0, $zero, 0x0007         ## $s0 = 00000007
/* 0316C 808C42FC 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 03170 808C4300 A7AC0090 */  sh      $t4, 0x0090($sp)           
/* 03174 808C4304 3C01808D */  lui     $at, %hi(D_808CA6F0)       ## $at = 808D0000
/* 03178 808C4308 C432A6F0 */  lwc1    $f18, %lo(D_808CA6F0)($at) 
/* 0317C 808C430C 46120102 */  mul.s   $f4, $f0, $f18             
/* 03180 808C4310 4600218D */  trunc.w.s $f6, $f4                   
/* 03184 808C4314 44033000 */  mfc1    $v1, $f6                   
/* 03188 808C4318 00000000 */  nop
/* 0318C 808C431C 00031C00 */  sll     $v1, $v1, 16               
/* 03190 808C4320 1000000D */  beq     $zero, $zero, .L808C4358   
/* 03194 808C4324 00031C03 */  sra     $v1, $v1, 16               
/* 03198 808C4328 A7AE0090 */  sh      $t6, 0x0090($sp)           
.L808C432C:
/* 0319C 808C432C 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 031A0 808C4330 A7A3008E */  sh      $v1, 0x008E($sp)           
/* 031A4 808C4334 3C014248 */  lui     $at, 0x4248                ## $at = 42480000
/* 031A8 808C4338 44814000 */  mtc1    $at, $f8                   ## $f8 = 50.00
/* 031AC 808C433C 87A3008E */  lh      $v1, 0x008E($sp)           
/* 031B0 808C4340 46080282 */  mul.s   $f10, $f0, $f8             
/* 031B4 808C4344 4600540D */  trunc.w.s $f16, $f10                 
/* 031B8 808C4348 440A8000 */  mfc1    $t2, $f16                  
/* 031BC 808C434C 00000000 */  nop
/* 031C0 808C4350 254BFFCE */  addiu   $t3, $t2, 0xFFCE           ## $t3 = FFFFFFCE
/* 031C4 808C4354 A7AB008C */  sh      $t3, 0x008C($sp)           
.L808C4358:
/* 031C8 808C4358 8FAC0098 */  lw      $t4, 0x0098($sp)           
/* 031CC 808C435C 918D0444 */  lbu     $t5, 0x0444($t4)           ## 00000444
/* 031D0 808C4360 29A1000A */  slti    $at, $t5, 0x000A           
/* 031D4 808C4364 54200003 */  bnel    $at, $zero, .L808C4374     
/* 031D8 808C4368 8626019E */  lh      $a2, 0x019E($s1)           ## 0000019E
/* 031DC 808C436C 2410FFFF */  addiu   $s0, $zero, 0xFFFF         ## $s0 = FFFFFFFF
/* 031E0 808C4370 8626019E */  lh      $a2, 0x019E($s1)           ## 0000019E
.L808C4374:
/* 031E4 808C4374 00D07024 */  and     $t6, $a2, $s0              
/* 031E8 808C4378 55C00035 */  bnel    $t6, $zero, .L808C4450     
/* 031EC 808C437C 87AE0090 */  lh      $t6, 0x0090($sp)           
/* 031F0 808C4380 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 031F4 808C4384 A7A3008E */  sh      $v1, 0x008E($sp)           
/* 031F8 808C4388 3C0143A5 */  lui     $at, 0x43A5                ## $at = 43A50000
/* 031FC 808C438C 44819000 */  mtc1    $at, $f18                  ## $f18 = 330.00
/* 03200 808C4390 00000000 */  nop
/* 03204 808C4394 46120102 */  mul.s   $f4, $f0, $f18             
/* 03208 808C4398 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 0320C 808C439C E7A4007C */  swc1    $f4, 0x007C($sp)           
/* 03210 808C43A0 3C01808D */  lui     $at, %hi(D_808CA6F4)       ## $at = 808D0000
/* 03214 808C43A4 C426A6F4 */  lwc1    $f6, %lo(D_808CA6F4)($at)  
/* 03218 808C43A8 46060302 */  mul.s   $f12, $f0, $f6             
/* 0321C 808C43AC 0C0400A4 */  jal     sinf
              
/* 03220 808C43B0 E7AC0078 */  swc1    $f12, 0x0078($sp)          
/* 03224 808C43B4 C7A8007C */  lwc1    $f8, 0x007C($sp)           
/* 03228 808C43B8 3C01808D */  lui     $at, %hi(D_808CA6F8)       ## $at = 808D0000
/* 0322C 808C43BC C430A6F8 */  lwc1    $f16, %lo(D_808CA6F8)($at) 
/* 03230 808C43C0 46080282 */  mul.s   $f10, $f0, $f8             
/* 03234 808C43C4 3C01808D */  lui     $at, %hi(D_808CA6FC)       ## $at = 808D0000
/* 03238 808C43C8 C424A6FC */  lwc1    $f4, %lo(D_808CA6FC)($at)  
/* 0323C 808C43CC C7AC0078 */  lwc1    $f12, 0x0078($sp)          
/* 03240 808C43D0 E7A40084 */  swc1    $f4, 0x0084($sp)           
/* 03244 808C43D4 46105480 */  add.s   $f18, $f10, $f16           
/* 03248 808C43D8 0C041184 */  jal     cosf
              
/* 0324C 808C43DC E7B20080 */  swc1    $f18, 0x0080($sp)          
/* 03250 808C43E0 C7A6007C */  lwc1    $f6, 0x007C($sp)           
/* 03254 808C43E4 3C01808D */  lui     $at, %hi(D_808CA700)       ## $at = 808D0000
/* 03258 808C43E8 C42AA700 */  lwc1    $f10, %lo(D_808CA700)($at) 
/* 0325C 808C43EC 46060202 */  mul.s   $f8, $f0, $f6              
/* 03260 808C43F0 87A3008E */  lh      $v1, 0x008E($sp)           
/* 03264 808C43F4 87AC008C */  lh      $t4, 0x008C($sp)           
/* 03268 808C43F8 3C0F808D */  lui     $t7, %hi(D_808CA440)       ## $t7 = 808D0000
/* 0326C 808C43FC 0003C880 */  sll     $t9, $v1,  2               
/* 03270 808C4400 3C18808D */  lui     $t8, %hi(D_808CA448)       ## $t8 = 808D0000
/* 03274 808C4404 240A000A */  addiu   $t2, $zero, 0x000A         ## $t2 = 0000000A
/* 03278 808C4408 460A4400 */  add.s   $f16, $f8, $f10            
/* 0327C 808C440C 0323C821 */  addu    $t9, $t9, $v1              
/* 03280 808C4410 01595823 */  subu    $t3, $t2, $t9              
/* 03284 808C4414 2718A448 */  addiu   $t8, $t8, %lo(D_808CA448)  ## $t8 = 808CA448
/* 03288 808C4418 25EFA440 */  addiu   $t7, $t7, %lo(D_808CA440)  ## $t7 = 808CA440
/* 0328C 808C441C 00031080 */  sll     $v0, $v1,  2               
/* 03290 808C4420 258D0064 */  addiu   $t5, $t4, 0x0064           ## $t5 = 00000064
/* 03294 808C4424 E7B00088 */  swc1    $f16, 0x0088($sp)          
/* 03298 808C4428 AFAD0018 */  sw      $t5, 0x0018($sp)           
/* 0329C 808C442C 004F3021 */  addu    $a2, $v0, $t7              
/* 032A0 808C4430 00583821 */  addu    $a3, $v0, $t8              
/* 032A4 808C4434 AFAB0010 */  sw      $t3, 0x0010($sp)           
/* 032A8 808C4438 8FA400B4 */  lw      $a0, 0x00B4($sp)           
/* 032AC 808C443C 27A50080 */  addiu   $a1, $sp, 0x0080           ## $a1 = FFFFFFD0
/* 032B0 808C4440 0C00A6E4 */  jal     EffectSsGMagma2_Spawn              
/* 032B4 808C4444 AFA30014 */  sw      $v1, 0x0014($sp)           
/* 032B8 808C4448 8626019E */  lh      $a2, 0x019E($s1)           ## 0000019E
/* 032BC 808C444C 87AE0090 */  lh      $t6, 0x0090($sp)           
.L808C4450:
/* 032C0 808C4450 3C0A808D */  lui     $t2, %hi(D_808CA428)       ## $t2 = 808D0000
/* 032C4 808C4454 254AA428 */  addiu   $t2, $t2, %lo(D_808CA428)  ## $t2 = 808CA428
/* 032C8 808C4458 00CE7824 */  and     $t7, $a2, $t6              
/* 032CC 808C445C 15E00072 */  bne     $t7, $zero, .L808C4628     
/* 032D0 808C4460 27B8006C */  addiu   $t8, $sp, 0x006C           ## $t8 = FFFFFFBC
/* 032D4 808C4464 8D4B0000 */  lw      $t3, 0x0000($t2)           ## 808CA428
/* 032D8 808C4468 8D590004 */  lw      $t9, 0x0004($t2)           ## 808CA42C
/* 032DC 808C446C 3C0D808D */  lui     $t5, %hi(D_808CA434)       ## $t5 = 808D0000
/* 032E0 808C4470 AF0B0000 */  sw      $t3, 0x0000($t8)           ## FFFFFFBC
/* 032E4 808C4474 8D4B0008 */  lw      $t3, 0x0008($t2)           ## 808CA430
/* 032E8 808C4478 25ADA434 */  addiu   $t5, $t5, %lo(D_808CA434)  ## $t5 = 808CA434
/* 032EC 808C447C AF190004 */  sw      $t9, 0x0004($t8)           ## FFFFFFC0
/* 032F0 808C4480 AF0B0008 */  sw      $t3, 0x0008($t8)           ## FFFFFFC4
/* 032F4 808C4484 8DAF0000 */  lw      $t7, 0x0000($t5)           ## 808CA434
/* 032F8 808C4488 27AC0060 */  addiu   $t4, $sp, 0x0060           ## $t4 = FFFFFFB0
/* 032FC 808C448C 8DAE0004 */  lw      $t6, 0x0004($t5)           ## 808CA438
/* 03300 808C4490 AD8F0000 */  sw      $t7, 0x0000($t4)           ## FFFFFFB0
/* 03304 808C4494 8DAF0008 */  lw      $t7, 0x0008($t5)           ## 808CA43C
/* 03308 808C4498 AD8E0004 */  sw      $t6, 0x0004($t4)           ## FFFFFFB4
/* 0330C 808C449C 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 03310 808C44A0 AD8F0008 */  sw      $t7, 0x0008($t4)           ## FFFFFFB8
/* 03314 808C44A4 3C0143A5 */  lui     $at, 0x43A5                ## $at = 43A50000
/* 03318 808C44A8 44819000 */  mtc1    $at, $f18                  ## $f18 = 330.00
/* 0331C 808C44AC 00000000 */  nop
/* 03320 808C44B0 46120102 */  mul.s   $f4, $f0, $f18             
/* 03324 808C44B4 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 03328 808C44B8 E7A40050 */  swc1    $f4, 0x0050($sp)           
/* 0332C 808C44BC 3C01808D */  lui     $at, %hi(D_808CA704)       ## $at = 808D0000
/* 03330 808C44C0 C426A704 */  lwc1    $f6, %lo(D_808CA704)($at)  
/* 03334 808C44C4 46060302 */  mul.s   $f12, $f0, $f6             
/* 03338 808C44C8 0C0400A4 */  jal     sinf
              
/* 0333C 808C44CC E7AC004C */  swc1    $f12, 0x004C($sp)          
/* 03340 808C44D0 C7A80050 */  lwc1    $f8, 0x0050($sp)           
/* 03344 808C44D4 3C01808D */  lui     $at, %hi(D_808CA708)       ## $at = 808D0000
/* 03348 808C44D8 C430A708 */  lwc1    $f16, %lo(D_808CA708)($at) 
/* 0334C 808C44DC 46080282 */  mul.s   $f10, $f0, $f8             
/* 03350 808C44E0 3C01808D */  lui     $at, %hi(D_808CA70C)       ## $at = 808D0000
/* 03354 808C44E4 C424A70C */  lwc1    $f4, %lo(D_808CA70C)($at)  
/* 03358 808C44E8 C7AC004C */  lwc1    $f12, 0x004C($sp)          
/* 0335C 808C44EC E7A40058 */  swc1    $f4, 0x0058($sp)           
/* 03360 808C44F0 46105480 */  add.s   $f18, $f10, $f16           
/* 03364 808C44F4 0C041184 */  jal     cosf
              
/* 03368 808C44F8 E7B20054 */  swc1    $f18, 0x0054($sp)          
/* 0336C 808C44FC C7A60050 */  lwc1    $f6, 0x0050($sp)           
/* 03370 808C4500 3C01808D */  lui     $at, %hi(D_808CA710)       ## $at = 808D0000
/* 03374 808C4504 C42AA710 */  lwc1    $f10, %lo(D_808CA710)($at) 
/* 03378 808C4508 46060202 */  mul.s   $f8, $f0, $f6              
/* 0337C 808C450C 8FA400B4 */  lw      $a0, 0x00B4($sp)           
/* 03380 808C4510 27A50054 */  addiu   $a1, $sp, 0x0054           ## $a1 = FFFFFFA4
/* 03384 808C4514 460A4400 */  add.s   $f16, $f8, $f10            
/* 03388 808C4518 0C00A54C */  jal     EffectSsGMagma_Spawn              
/* 0338C 808C451C E7B0005C */  swc1    $f16, 0x005C($sp)          
/* 03390 808C4520 00008025 */  or      $s0, $zero, $zero          ## $s0 = 00000000
.L808C4524:
/* 03394 808C4524 3C01808D */  lui     $at, %hi(D_808CA714)       ## $at = 808D0000
/* 03398 808C4528 C432A714 */  lwc1    $f18, %lo(D_808CA714)($at) 
/* 0339C 808C452C 3C013F00 */  lui     $at, 0x3F00                ## $at = 3F000000
/* 033A0 808C4530 44816000 */  mtc1    $at, $f12                  ## $f12 = 0.50
/* 033A4 808C4534 0C00CFC8 */  jal     Math_Rand_CenteredFloat
              
/* 033A8 808C4538 E7B20064 */  swc1    $f18, 0x0064($sp)          
/* 033AC 808C453C 3C013F00 */  lui     $at, 0x3F00                ## $at = 3F000000
/* 033B0 808C4540 44816000 */  mtc1    $at, $f12                  ## $f12 = 0.50
/* 033B4 808C4544 0C00CFC8 */  jal     Math_Rand_CenteredFloat
              
/* 033B8 808C4548 E7A00060 */  swc1    $f0, 0x0060($sp)           
/* 033BC 808C454C 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 033C0 808C4550 E7A00068 */  swc1    $f0, 0x0068($sp)           
/* 033C4 808C4554 3C0143A5 */  lui     $at, 0x43A5                ## $at = 43A50000
/* 033C8 808C4558 44812000 */  mtc1    $at, $f4                   ## $f4 = 330.00
/* 033CC 808C455C 00000000 */  nop
/* 033D0 808C4560 46040182 */  mul.s   $f6, $f0, $f4              
/* 033D4 808C4564 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 033D8 808C4568 E7A60050 */  swc1    $f6, 0x0050($sp)           
/* 033DC 808C456C 3C01808D */  lui     $at, %hi(D_808CA718)       ## $at = 808D0000
/* 033E0 808C4570 C428A718 */  lwc1    $f8, %lo(D_808CA718)($at)  
/* 033E4 808C4574 46080302 */  mul.s   $f12, $f0, $f8             
/* 033E8 808C4578 0C0400A4 */  jal     sinf
              
/* 033EC 808C457C E7AC004C */  swc1    $f12, 0x004C($sp)          
/* 033F0 808C4580 C7AA0050 */  lwc1    $f10, 0x0050($sp)          
/* 033F4 808C4584 3C01808D */  lui     $at, %hi(D_808CA71C)       ## $at = 808D0000
/* 033F8 808C4588 C432A71C */  lwc1    $f18, %lo(D_808CA71C)($at) 
/* 033FC 808C458C 460A0402 */  mul.s   $f16, $f0, $f10            
/* 03400 808C4590 3C01808D */  lui     $at, %hi(D_808CA720)       ## $at = 808D0000
/* 03404 808C4594 C426A720 */  lwc1    $f6, %lo(D_808CA720)($at)  
/* 03408 808C4598 C7AC004C */  lwc1    $f12, 0x004C($sp)          
/* 0340C 808C459C E7A60058 */  swc1    $f6, 0x0058($sp)           
/* 03410 808C45A0 46128100 */  add.s   $f4, $f16, $f18            
/* 03414 808C45A4 0C041184 */  jal     cosf
              
/* 03418 808C45A8 E7A40054 */  swc1    $f4, 0x0054($sp)           
/* 0341C 808C45AC C7A80050 */  lwc1    $f8, 0x0050($sp)           
/* 03420 808C45B0 3C01808D */  lui     $at, %hi(D_808CA724)       ## $at = 808D0000
/* 03424 808C45B4 C430A724 */  lwc1    $f16, %lo(D_808CA724)($at) 
/* 03428 808C45B8 46080282 */  mul.s   $f10, $f0, $f8             
/* 0342C 808C45BC 3C014000 */  lui     $at, 0x4000                ## $at = 40000000
/* 03430 808C45C0 44816000 */  mtc1    $at, $f12                  ## $f12 = 2.00
/* 03434 808C45C4 46105480 */  add.s   $f18, $f10, $f16           
/* 03438 808C45C8 0C00CFBE */  jal     Math_Rand_ZeroFloat
              
/* 0343C 808C45CC E7B2005C */  swc1    $f18, 0x005C($sp)          
/* 03440 808C45D0 4600010D */  trunc.w.s $f4, $f0                   
/* 03444 808C45D4 240D0050 */  addiu   $t5, $zero, 0x0050         ## $t5 = 00000050
/* 03448 808C45D8 AFAD0014 */  sw      $t5, 0x0014($sp)           
/* 0344C 808C45DC 8FA400B4 */  lw      $a0, 0x00B4($sp)           
/* 03450 808C45E0 440A2000 */  mfc1    $t2, $f4                   
/* 03454 808C45E4 27A50054 */  addiu   $a1, $sp, 0x0054           ## $a1 = FFFFFFA4
/* 03458 808C45E8 27A6006C */  addiu   $a2, $sp, 0x006C           ## $a2 = FFFFFFBC
/* 0345C 808C45EC 000ACC00 */  sll     $t9, $t2, 16               
/* 03460 808C45F0 00195C03 */  sra     $t3, $t9, 16               
/* 03464 808C45F4 256C0006 */  addiu   $t4, $t3, 0x0006           ## $t4 = 00000006
/* 03468 808C45F8 448C3000 */  mtc1    $t4, $f6                   ## $f6 = 0.00
/* 0346C 808C45FC 27A70060 */  addiu   $a3, $sp, 0x0060           ## $a3 = FFFFFFB0
/* 03470 808C4600 46803220 */  cvt.s.w $f8, $f6                   
/* 03474 808C4604 0C2305F2 */  jal     func_808C17C8              
/* 03478 808C4608 E7A80010 */  swc1    $f8, 0x0010($sp)           
/* 0347C 808C460C 26100001 */  addiu   $s0, $s0, 0x0001           ## $s0 = 00000001
/* 03480 808C4610 00108400 */  sll     $s0, $s0, 16               
/* 03484 808C4614 00108403 */  sra     $s0, $s0, 16               
/* 03488 808C4618 2A010004 */  slti    $at, $s0, 0x0004           
/* 0348C 808C461C 1420FFC1 */  bne     $at, $zero, .L808C4524     
/* 03490 808C4620 00000000 */  nop
/* 03494 808C4624 8626019E */  lh      $a2, 0x019E($s1)           ## 0000019E
.L808C4628:
/* 03498 808C4628 3C040300 */  lui     $a0, %hi(D_030021D8)                ## $a0 = 03000000
/* 0349C 808C462C 3C05808C */  lui     $a1, %hi(D_808C73C8)       ## $a1 = 808C0000
/* 034A0 808C4630 24A573C8 */  addiu   $a1, $a1, %lo(D_808C73C8)  ## $a1 = 808C73C8
/* 034A4 808C4634 248421D8 */  addiu   $a0, $a0, %lo(D_030021D8)           ## $a0 = 030021D8
/* 034A8 808C4638 0C230555 */  jal     func_808C1554              
/* 034AC 808C463C 8E270224 */  lw      $a3, 0x0224($s1)           ## 00000224
/* 034B0 808C4640 862E01C6 */  lh      $t6, 0x01C6($s1)           ## 000001C6
.L808C4644:
/* 034B4 808C4644 3C078016 */  lui     $a3, %hi(gSegments)
/* 034B8 808C4648 24E76FA8 */  addiu   $a3, %lo(gSegments)
/* 034BC 808C464C 11C00031 */  beq     $t6, $zero, .L808C4714     
/* 034C0 808C4650 3C0800FF */  lui     $t0, 0x00FF                ## $t0 = 00FF0000
/* 034C4 808C4654 3C02808C */  lui     $v0, %hi(D_808C73C8)       ## $v0 = 808C0000
/* 034C8 808C4658 244273C8 */  addiu   $v0, $v0, %lo(D_808C73C8)  ## $v0 = 808C73C8
/* 034CC 808C465C 00027900 */  sll     $t7, $v0,  4               
/* 034D0 808C4660 3C03808D */  lui     $v1, %hi(D_808C93C8)       ## $v1 = 808D0000
/* 034D4 808C4664 000FC702 */  srl     $t8, $t7, 28               
/* 034D8 808C4668 246393C8 */  addiu   $v1, $v1, %lo(D_808C93C8)  ## $v1 = 808C93C8
/* 034DC 808C466C 00185080 */  sll     $t2, $t8,  2               
/* 034E0 808C4670 00037100 */  sll     $t6, $v1,  4               
/* 034E4 808C4674 00EAC821 */  addu    $t9, $a3, $t2              
/* 034E8 808C4678 000E7F02 */  srl     $t7, $t6, 28               
/* 034EC 808C467C 8F2B0000 */  lw      $t3, 0x0000($t9)           ## 00000000
/* 034F0 808C4680 000FC080 */  sll     $t8, $t7,  2               
/* 034F4 808C4684 3508FFFF */  ori     $t0, $t0, 0xFFFF           ## $t0 = 00FFFFFF
/* 034F8 808C4688 00F85021 */  addu    $t2, $a3, $t8              
/* 034FC 808C468C 8D590000 */  lw      $t9, 0x0000($t2)           ## 00000000
/* 03500 808C4690 00486024 */  and     $t4, $v0, $t0              
/* 03504 808C4694 016C6821 */  addu    $t5, $t3, $t4              
/* 03508 808C4698 3C098000 */  lui     $t1, 0x8000                ## $t1 = 80000000
/* 0350C 808C469C 00685824 */  and     $t3, $v1, $t0              
/* 03510 808C46A0 032B6021 */  addu    $t4, $t9, $t3              
/* 03514 808C46A4 01A92821 */  addu    $a1, $t5, $t1              
/* 03518 808C46A8 01893021 */  addu    $a2, $t4, $t1              
/* 0351C 808C46AC 00002025 */  or      $a0, $zero, $zero          ## $a0 = 00000000
.L808C46B0:
/* 03520 808C46B0 862301C2 */  lh      $v1, 0x01C2($s1)           ## 000001C2
/* 03524 808C46B4 24840001 */  addiu   $a0, $a0, 0x0001           ## $a0 = 00000001
/* 03528 808C46B8 00042400 */  sll     $a0, $a0, 16               
/* 0352C 808C46BC 306307FF */  andi    $v1, $v1, 0x07FF           ## $v1 = 000003C8
/* 03530 808C46C0 00031C00 */  sll     $v1, $v1, 16               
/* 03534 808C46C4 00031C03 */  sra     $v1, $v1, 16               
/* 03538 808C46C8 00031040 */  sll     $v0, $v1,  1               
/* 0353C 808C46CC 00C26821 */  addu    $t5, $a2, $v0              
/* 03540 808C46D0 95AE0000 */  lhu     $t6, 0x0000($t5)           ## 00000000
/* 03544 808C46D4 00A27821 */  addu    $t7, $a1, $v0              
/* 03548 808C46D8 00042403 */  sra     $a0, $a0, 16               
/* 0354C 808C46DC A5EE0000 */  sh      $t6, 0x0000($t7)           ## 00000000
/* 03550 808C46E0 863801C2 */  lh      $t8, 0x01C2($s1)           ## 000001C2
/* 03554 808C46E4 28810014 */  slti    $at, $a0, 0x0014           
/* 03558 808C46E8 270A0025 */  addiu   $t2, $t8, 0x0025           ## $t2 = 00000025
/* 0355C 808C46EC 1420FFF0 */  bne     $at, $zero, .L808C46B0     
/* 03560 808C46F0 A62A01C2 */  sh      $t2, 0x01C2($s1)           ## 000001C2
/* 03564 808C46F4 44800000 */  mtc1    $zero, $f0                 ## $f0 = 0.00
/* 03568 808C46F8 3C073C23 */  lui     $a3, 0x3C23                ## $a3 = 3C230000
/* 0356C 808C46FC 34E7D70A */  ori     $a3, $a3, 0xD70A           ## $a3 = 3C23D70A
/* 03570 808C4700 44050000 */  mfc1    $a1, $f0                   
/* 03574 808C4704 26240224 */  addiu   $a0, $s1, 0x0224           ## $a0 = 00000224
/* 03578 808C4708 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 0357C 808C470C 0C01E0C4 */  jal     Math_SmoothScaleMaxMinF
              
/* 03580 808C4710 E7A00010 */  swc1    $f0, 0x0010($sp)           
.L808C4714:
/* 03584 808C4714 863901BC */  lh      $t9, 0x01BC($s1)           ## 000001BC
/* 03588 808C4718 5720001C */  bnel    $t9, $zero, .L808C478C     
/* 0358C 808C471C 8E2A0190 */  lw      $t2, 0x0190($s1)           ## 00000190
/* 03590 808C4720 8E2C0190 */  lw      $t4, 0x0190($s1)           ## 00000190
/* 03594 808C4724 3C0B808C */  lui     $t3, %hi(func_808C5578)    ## $t3 = 808C0000
/* 03598 808C4728 256B5578 */  addiu   $t3, $t3, %lo(func_808C5578) ## $t3 = 808C5578
/* 0359C 808C472C 116C0006 */  beq     $t3, $t4, .L808C4748       
/* 035A0 808C4730 8FA400B4 */  lw      $a0, 0x00B4($sp)           
/* 035A4 808C4734 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 035A8 808C4738 34211E60 */  ori     $at, $at, 0x1E60           ## $at = 00011E60
/* 035AC 808C473C 00812821 */  addu    $a1, $a0, $at              
/* 035B0 808C4740 0C01767D */  jal     CollisionCheck_SetAC
              ## CollisionCheck_setAC
/* 035B4 808C4744 26260440 */  addiu   $a2, $s1, 0x0440           ## $a2 = 00000440
.L808C4748:
/* 035B8 808C4748 8FA400B4 */  lw      $a0, 0x00B4($sp)           
/* 035BC 808C474C 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 035C0 808C4750 34211E60 */  ori     $at, $at, 0x1E60           ## $at = 00011E60
/* 035C4 808C4754 26260440 */  addiu   $a2, $s1, 0x0440           ## $a2 = 00000440
/* 035C8 808C4758 00818021 */  addu    $s0, $a0, $at              
/* 035CC 808C475C 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000001
/* 035D0 808C4760 0C017713 */  jal     CollisionCheck_SetOC
              ## CollisionCheck_setOT
/* 035D4 808C4764 AFA60034 */  sw      $a2, 0x0034($sp)           
/* 035D8 808C4768 8E2F0190 */  lw      $t7, 0x0190($s1)           ## 00000190
/* 035DC 808C476C 3C03808C */  lui     $v1, %hi(func_808C3704)    ## $v1 = 808C0000
/* 035E0 808C4770 24633704 */  addiu   $v1, $v1, %lo(func_808C3704) ## $v1 = 808C3704
/* 035E4 808C4774 146F0004 */  bne     $v1, $t7, .L808C4788       
/* 035E8 808C4778 8FA60034 */  lw      $a2, 0x0034($sp)           
/* 035EC 808C477C 8FA400B4 */  lw      $a0, 0x00B4($sp)           
/* 035F0 808C4780 0C0175E7 */  jal     CollisionCheck_SetAT
              ## CollisionCheck_setAT
/* 035F4 808C4784 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000001
.L808C4788:
/* 035F8 808C4788 8E2A0190 */  lw      $t2, 0x0190($s1)           ## 00000190
.L808C478C:
/* 035FC 808C478C 3C18808C */  lui     $t8, %hi(func_808C3224)    ## $t8 = 808C0000
/* 03600 808C4790 3C03808C */  lui     $v1, %hi(func_808C3704)    ## $v1 = 808C0000
/* 03604 808C4794 27183224 */  addiu   $t8, $t8, %lo(func_808C3224) ## $t8 = 808C3224
/* 03608 808C4798 170A0005 */  bne     $t8, $t2, .L808C47B0       
/* 0360C 808C479C 24633704 */  addiu   $v1, $v1, %lo(func_808C3704) ## $v1 = 808C3704
/* 03610 808C47A0 44800000 */  mtc1    $zero, $f0                 ## $f0 = 0.00
/* 03614 808C47A4 8E39045C */  lw      $t9, 0x045C($s1)           ## 0000045C
/* 03618 808C47A8 10000006 */  beq     $zero, $zero, .L808C47C4   
/* 0361C 808C47AC E7200038 */  swc1    $f0, 0x0038($t9)           ## 00000038
.L808C47B0:
/* 03620 808C47B0 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 03624 808C47B4 44815000 */  mtc1    $at, $f10                  ## $f10 = 1.00
/* 03628 808C47B8 8E2B045C */  lw      $t3, 0x045C($s1)           ## 0000045C
/* 0362C 808C47BC 44800000 */  mtc1    $zero, $f0                 ## $f0 = 0.00
/* 03630 808C47C0 E56A0038 */  swc1    $f10, 0x0038($t3)          ## 00000038
.L808C47C4:
/* 03634 808C47C4 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 03638 808C47C8 44811000 */  mtc1    $at, $f2                   ## $f2 = 1.00
/* 0363C 808C47CC 24100006 */  addiu   $s0, $zero, 0x0006         ## $s0 = 00000006
/* 03640 808C47D0 2402000C */  addiu   $v0, $zero, 0x000C         ## $v0 = 0000000C
.L808C47D4:
/* 03644 808C47D4 5202000E */  beql    $s0, $v0, .L808C4810       
/* 03648 808C47D8 26100001 */  addiu   $s0, $s0, 0x0001           ## $s0 = 00000007
/* 0364C 808C47DC 8E2C0190 */  lw      $t4, 0x0190($s1)           ## 00000190
/* 03650 808C47E0 546C0007 */  bnel    $v1, $t4, .L808C4800       
/* 03654 808C47E4 8E38045C */  lw      $t8, 0x045C($s1)           ## 0000045C
/* 03658 808C47E8 8E2D045C */  lw      $t5, 0x045C($s1)           ## 0000045C
/* 0365C 808C47EC 00107180 */  sll     $t6, $s0,  6               
/* 03660 808C47F0 01AE7821 */  addu    $t7, $t5, $t6              
/* 03664 808C47F4 10000005 */  beq     $zero, $zero, .L808C480C   
/* 03668 808C47F8 E5E00038 */  swc1    $f0, 0x0038($t7)           ## 00000038
/* 0366C 808C47FC 8E38045C */  lw      $t8, 0x045C($s1)           ## 0000045C
.L808C4800:
/* 03670 808C4800 00105180 */  sll     $t2, $s0,  6               
/* 03674 808C4804 030AC821 */  addu    $t9, $t8, $t2              
/* 03678 808C4808 E7220038 */  swc1    $f2, 0x0038($t9)           ## 00000038
.L808C480C:
/* 0367C 808C480C 26100001 */  addiu   $s0, $s0, 0x0001           ## $s0 = 00000008
.L808C4810:
/* 03680 808C4810 00108400 */  sll     $s0, $s0, 16               
/* 03684 808C4814 00108403 */  sra     $s0, $s0, 16               
/* 03688 808C4818 2A010013 */  slti    $at, $s0, 0x0013           
/* 0368C 808C481C 1420FFED */  bne     $at, $zero, .L808C47D4     
/* 03690 808C4820 00000000 */  nop
/* 03694 808C4824 44808000 */  mtc1    $zero, $f16                ## $f16 = 0.00
/* 03698 808C4828 C6320244 */  lwc1    $f18, 0x0244($s1)          ## 00000244
/* 0369C 808C482C 3C028016 */  lui     $v0, %hi(gGameInfo)
/* 036A0 808C4830 2442FA90 */  addiu   $v0, %lo(gGameInfo)
/* 036A4 808C4834 46128032 */  c.eq.s  $f16, $f18                 
/* 036A8 808C4838 26240244 */  addiu   $a0, $s1, 0x0244           ## $a0 = 00000244
/* 036AC 808C483C 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 036B0 808C4840 3C074000 */  lui     $a3, 0x4000                ## $a3 = 40000000
/* 036B4 808C4844 45030033 */  bc1tl   .L808C4914                 
/* 036B8 808C4848 8C4E0000 */  lw      $t6, 0x0000($v0)           ## 8015FA90
/* 036BC 808C484C 3C028016 */  lui     $v0, %hi(gGameInfo)
/* 036C0 808C4850 2442FA90 */  addiu   $v0, %lo(gGameInfo)
/* 036C4 808C4854 8C4C0000 */  lw      $t4, 0x0000($v0)           ## 8015FA90
/* 036C8 808C4858 240B0001 */  addiu   $t3, $zero, 0x0001         ## $t3 = 00000001
/* 036CC 808C485C 240D00FF */  addiu   $t5, $zero, 0x00FF         ## $t5 = 000000FF
/* 036D0 808C4860 A58B0454 */  sh      $t3, 0x0454($t4)           ## 00000454
/* 036D4 808C4864 8C4E0000 */  lw      $t6, 0x0000($v0)           ## 8015FA90
/* 036D8 808C4868 240F0050 */  addiu   $t7, $zero, 0x0050         ## $t7 = 00000050
/* 036DC 808C486C 4459F800 */  cfc1    $t9, $31
/* 036E0 808C4870 A5CD0456 */  sh      $t5, 0x0456($t6)           ## 00000456
/* 036E4 808C4874 8C580000 */  lw      $t8, 0x0000($v0)           ## 8015FA90
/* 036E8 808C4878 44CBF800 */  ctc1    $t3, $31
/* 036EC 808C487C 3C014F00 */  lui     $at, 0x4F00                ## $at = 4F000000
/* 036F0 808C4880 A70F0458 */  sh      $t7, 0x0458($t8)           ## 808C367C
/* 036F4 808C4884 8C4A0000 */  lw      $t2, 0x0000($v0)           ## 8015FA90
/* 036F8 808C4888 A540045A */  sh      $zero, 0x045A($t2)         ## 0000045A
/* 036FC 808C488C C6240244 */  lwc1    $f4, 0x0244($s1)           ## 00000244
/* 03700 808C4890 460021A4 */  cvt.w.s $f6, $f4                   
/* 03704 808C4894 444BF800 */  cfc1    $t3, $31
/* 03708 808C4898 00000000 */  nop
/* 0370C 808C489C 316B0078 */  andi    $t3, $t3, 0x0078           ## $t3 = 00000000
/* 03710 808C48A0 51600013 */  beql    $t3, $zero, .L808C48F0     
/* 03714 808C48A4 440B3000 */  mfc1    $t3, $f6                   
/* 03718 808C48A8 44813000 */  mtc1    $at, $f6                   ## $f6 = 2147483648.00
/* 0371C 808C48AC 240B0001 */  addiu   $t3, $zero, 0x0001         ## $t3 = 00000001
/* 03720 808C48B0 46062181 */  sub.s   $f6, $f4, $f6              
/* 03724 808C48B4 44CBF800 */  ctc1    $t3, $31
/* 03728 808C48B8 00000000 */  nop
/* 0372C 808C48BC 460031A4 */  cvt.w.s $f6, $f6                   
/* 03730 808C48C0 444BF800 */  cfc1    $t3, $31
/* 03734 808C48C4 00000000 */  nop
/* 03738 808C48C8 316B0078 */  andi    $t3, $t3, 0x0078           ## $t3 = 00000000
/* 0373C 808C48CC 15600005 */  bne     $t3, $zero, .L808C48E4     
/* 03740 808C48D0 00000000 */  nop
/* 03744 808C48D4 440B3000 */  mfc1    $t3, $f6                   
/* 03748 808C48D8 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 0374C 808C48DC 10000007 */  beq     $zero, $zero, .L808C48FC   
/* 03750 808C48E0 01615825 */  or      $t3, $t3, $at              ## $t3 = 80000000
.L808C48E4:
/* 03754 808C48E4 10000005 */  beq     $zero, $zero, .L808C48FC   
/* 03758 808C48E8 240BFFFF */  addiu   $t3, $zero, 0xFFFF         ## $t3 = FFFFFFFF
/* 0375C 808C48EC 440B3000 */  mfc1    $t3, $f6                   
.L808C48F0:
/* 03760 808C48F0 00000000 */  nop
/* 03764 808C48F4 0560FFFB */  bltz    $t3, .L808C48E4            
/* 03768 808C48F8 00000000 */  nop
.L808C48FC:
/* 0376C 808C48FC 8C4D0000 */  lw      $t5, 0x0000($v0)           ## 8015FA90
/* 03770 808C4900 44D9F800 */  ctc1    $t9, $31
/* 03774 808C4904 316C00FF */  andi    $t4, $t3, 0x00FF           ## $t4 = 000000FF
/* 03778 808C4908 10000003 */  beq     $zero, $zero, .L808C4918   
/* 0377C 808C490C A5AC045C */  sh      $t4, 0x045C($t5)           ## 0000055B
/* 03780 808C4910 8C4E0000 */  lw      $t6, 0x0000($v0)           ## 8015FA90
.L808C4914:
/* 03784 808C4914 A5C00454 */  sh      $zero, 0x0454($t6)         ## 00000454
.L808C4918:
/* 03788 808C4918 44050000 */  mfc1    $a1, $f0                   
/* 0378C 808C491C 0C01E0C4 */  jal     Math_SmoothScaleMaxMinF
              
/* 03790 808C4920 E7A00010 */  swc1    $f0, 0x0010($sp)           
/* 03794 808C4924 0C231B2D */  jal     func_808C6CB4              
/* 03798 808C4928 8FA400B4 */  lw      $a0, 0x00B4($sp)           
/* 0379C 808C492C 8FBF002C */  lw      $ra, 0x002C($sp)           
/* 037A0 808C4930 8FB00024 */  lw      $s0, 0x0024($sp)           
/* 037A4 808C4934 8FB10028 */  lw      $s1, 0x0028($sp)           
/* 037A8 808C4938 03E00008 */  jr      $ra                        
/* 037AC 808C493C 27BD00B0 */  addiu   $sp, $sp, 0x00B0           ## $sp = 00000000
