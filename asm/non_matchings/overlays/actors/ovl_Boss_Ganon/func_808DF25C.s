.rdata
glabel D_808F7ADC
    .asciz "../z_boss_ganon.c"
    .balign 4

glabel D_808F7AF0
    .asciz "../z_boss_ganon.c"
    .balign 4

glabel D_808F7B04
    .asciz "../z_boss_ganon.c"
    .balign 4

glabel D_808F7B18
    .asciz "../z_boss_ganon.c"
    .balign 4

.text
glabel func_808DF25C
/* 089EC 808DF25C 27BDFF90 */  addiu   $sp, $sp, 0xFF90           ## $sp = FFFFFF90
/* 089F0 808DF260 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 089F4 808DF264 AFB10018 */  sw      $s1, 0x0018($sp)           
/* 089F8 808DF268 AFB00014 */  sw      $s0, 0x0014($sp)           
/* 089FC 808DF26C AFA50074 */  sw      $a1, 0x0074($sp)           
/* 08A00 808DF270 8CB00000 */  lw      $s0, 0x0000($a1)           ## 00000000
/* 08A04 808DF274 00808825 */  or      $s1, $a0, $zero            ## $s1 = 00000000
/* 08A08 808DF278 3C06808F */  lui     $a2, %hi(D_808F7ADC)       ## $a2 = 808F0000
/* 08A0C 808DF27C 24C67ADC */  addiu   $a2, $a2, %lo(D_808F7ADC)  ## $a2 = 808F7ADC
/* 08A10 808DF280 27A40050 */  addiu   $a0, $sp, 0x0050           ## $a0 = FFFFFFE0
/* 08A14 808DF284 24071D34 */  addiu   $a3, $zero, 0x1D34         ## $a3 = 00001D34
/* 08A18 808DF288 0C031AB1 */  jal     Graph_OpenDisps              
/* 08A1C 808DF28C 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 08A20 808DF290 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 08A24 808DF294 C6260254 */  lwc1    $f6, 0x0254($s1)           ## 00000254
/* 08A28 808DF298 8FAF0074 */  lw      $t7, 0x0074($sp)           
/* 08A2C 808DF29C 4606203C */  c.lt.s  $f4, $f6                   
/* 08A30 808DF2A0 00000000 */  nop
/* 08A34 808DF2A4 4502008E */  bc1fl   .L808DF4E0                 
/* 08A38 808DF2A8 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 08A3C 808DF2AC 0C024F61 */  jal     func_80093D84              
/* 08A40 808DF2B0 8DE40000 */  lw      $a0, 0x0000($t7)           ## 00000000
/* 08A44 808DF2B4 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 08A48 808DF2B8 3C19FA00 */  lui     $t9, 0xFA00                ## $t9 = FA000000
/* 08A4C 808DF2BC 2408FFFF */  addiu   $t0, $zero, 0xFFFF         ## $t0 = FFFFFFFF
/* 08A50 808DF2C0 24580008 */  addiu   $t8, $v0, 0x0008           ## $t8 = 00000008
/* 08A54 808DF2C4 AE1802D0 */  sw      $t8, 0x02D0($s0)           ## 000002D0
/* 08A58 808DF2C8 AC480004 */  sw      $t0, 0x0004($v0)           ## 00000004
/* 08A5C 808DF2CC AC590000 */  sw      $t9, 0x0000($v0)           ## 00000000
/* 08A60 808DF2D0 862901A2 */  lh      $t1, 0x01A2($s1)           ## 000001A2
/* 08A64 808DF2D4 3C08DE00 */  lui     $t0, 0xDE00                ## $t0 = DE000000
/* 08A68 808DF2D8 312A0001 */  andi    $t2, $t1, 0x0001           ## $t2 = 00000000
/* 08A6C 808DF2DC 11400009 */  beq     $t2, $zero, .L808DF304     
/* 08A70 808DF2E0 3C09808E */  lui     $t1, %hi(D_808E7DE8)       ## $t1 = 808E0000
/* 08A74 808DF2E4 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 08A78 808DF2E8 3C0CFB00 */  lui     $t4, 0xFB00                ## $t4 = FB000000
/* 08A7C 808DF2EC 3C0DFFFF */  lui     $t5, 0xFFFF                ## $t5 = FFFF0000
/* 08A80 808DF2F0 244B0008 */  addiu   $t3, $v0, 0x0008           ## $t3 = 00000008
/* 08A84 808DF2F4 AE0B02D0 */  sw      $t3, 0x02D0($s0)           ## 000002D0
/* 08A88 808DF2F8 AC4D0004 */  sw      $t5, 0x0004($v0)           ## 00000004
/* 08A8C 808DF2FC 10000008 */  beq     $zero, $zero, .L808DF320   
/* 08A90 808DF300 AC4C0000 */  sw      $t4, 0x0000($v0)           ## 00000000
.L808DF304:
/* 08A94 808DF304 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 08A98 808DF308 3C0FFB00 */  lui     $t7, 0xFB00                ## $t7 = FB000000
/* 08A9C 808DF30C 3C1864FF */  lui     $t8, 0x64FF                ## $t8 = 64FF0000
/* 08AA0 808DF310 244E0008 */  addiu   $t6, $v0, 0x0008           ## $t6 = 00000008
/* 08AA4 808DF314 AE0E02D0 */  sw      $t6, 0x02D0($s0)           ## 000002D0
/* 08AA8 808DF318 AC580004 */  sw      $t8, 0x0004($v0)           ## 00000004
/* 08AAC 808DF31C AC4F0000 */  sw      $t7, 0x0000($v0)           ## 00000000
.L808DF320:
/* 08AB0 808DF320 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 08AB4 808DF324 25297DE8 */  addiu   $t1, $t1, %lo(D_808E7DE8)  ## $t1 = 808E7DE8
/* 08AB8 808DF328 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 08ABC 808DF32C 24590008 */  addiu   $t9, $v0, 0x0008           ## $t9 = 00000008
/* 08AC0 808DF330 AE1902D0 */  sw      $t9, 0x02D0($s0)           ## 000002D0
/* 08AC4 808DF334 AC490004 */  sw      $t1, 0x0004($v0)           ## 00000004
/* 08AC8 808DF338 AC480000 */  sw      $t0, 0x0000($v0)           ## 00000000
/* 08ACC 808DF33C 8E260268 */  lw      $a2, 0x0268($s1)           ## 00000268
/* 08AD0 808DF340 C62E0264 */  lwc1    $f14, 0x0264($s1)          ## 00000264
/* 08AD4 808DF344 0C034261 */  jal     Matrix_Translate              
/* 08AD8 808DF348 C62C0260 */  lwc1    $f12, 0x0260($s1)          ## 00000260
/* 08ADC 808DF34C 8FA40074 */  lw      $a0, 0x0074($sp)           
/* 08AE0 808DF350 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 08AE4 808DF354 34211DA0 */  ori     $at, $at, 0x1DA0           ## $at = 00011DA0
/* 08AE8 808DF358 0C0347F5 */  jal     func_800D1FD4              
/* 08AEC 808DF35C 00812021 */  addu    $a0, $a0, $at              
/* 08AF0 808DF360 C62C0254 */  lwc1    $f12, 0x0254($s1)          ## 00000254
/* 08AF4 808DF364 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 08AF8 808DF368 44066000 */  mfc1    $a2, $f12                  
/* 08AFC 808DF36C 0C0342A3 */  jal     Matrix_Scale              
/* 08B00 808DF370 46006386 */  mov.s   $f14, $f12                 
/* 08B04 808DF374 C62C0258 */  lwc1    $f12, 0x0258($s1)          ## 00000258
/* 08B08 808DF378 0C0343B5 */  jal     Matrix_RotateZ              
/* 08B0C 808DF37C 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 08B10 808DF380 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 08B14 808DF384 3C0BDA38 */  lui     $t3, 0xDA38                ## $t3 = DA380000
/* 08B18 808DF388 356B0003 */  ori     $t3, $t3, 0x0003           ## $t3 = DA380003
/* 08B1C 808DF38C 244A0008 */  addiu   $t2, $v0, 0x0008           ## $t2 = 00000008
/* 08B20 808DF390 AE0A02D0 */  sw      $t2, 0x02D0($s0)           ## 000002D0
/* 08B24 808DF394 3C05808F */  lui     $a1, %hi(D_808F7AF0)       ## $a1 = 808F0000
/* 08B28 808DF398 AC4B0000 */  sw      $t3, 0x0000($v0)           ## 00000000
/* 08B2C 808DF39C 24A57AF0 */  addiu   $a1, $a1, %lo(D_808F7AF0)  ## $a1 = 808F7AF0
/* 08B30 808DF3A0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 08B34 808DF3A4 24061D56 */  addiu   $a2, $zero, 0x1D56         ## $a2 = 00001D56
/* 08B38 808DF3A8 0C0346A2 */  jal     Matrix_NewMtx              
/* 08B3C 808DF3AC AFA2003C */  sw      $v0, 0x003C($sp)           
/* 08B40 808DF3B0 8FA3003C */  lw      $v1, 0x003C($sp)           
/* 08B44 808DF3B4 3C0E808E */  lui     $t6, %hi(D_808E7E58)       ## $t6 = 808E0000
/* 08B48 808DF3B8 25CE7E58 */  addiu   $t6, $t6, %lo(D_808E7E58)  ## $t6 = 808E7E58
/* 08B4C 808DF3BC AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 08B50 808DF3C0 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 08B54 808DF3C4 3C0DDE00 */  lui     $t5, 0xDE00                ## $t5 = DE000000
/* 08B58 808DF3C8 24040050 */  addiu   $a0, $zero, 0x0050         ## $a0 = 00000050
/* 08B5C 808DF3CC 244C0008 */  addiu   $t4, $v0, 0x0008           ## $t4 = 00000008
/* 08B60 808DF3D0 AE0C02D0 */  sw      $t4, 0x02D0($s0)           ## 000002D0
/* 08B64 808DF3D4 AC4E0004 */  sw      $t6, 0x0004($v0)           ## 00000004
/* 08B68 808DF3D8 AC4D0000 */  sw      $t5, 0x0000($v0)           ## 00000000
/* 08B6C 808DF3DC 862F01A2 */  lh      $t7, 0x01A2($s1)           ## 000001A2
/* 08B70 808DF3E0 3C08E700 */  lui     $t0, 0xE700                ## $t0 = E7000000
/* 08B74 808DF3E4 3C0AFA00 */  lui     $t2, 0xFA00                ## $t2 = FA000000
/* 08B78 808DF3E8 31F80001 */  andi    $t8, $t7, 0x0001           ## $t8 = 00000000
/* 08B7C 808DF3EC 13000003 */  beq     $t8, $zero, .L808DF3FC     
/* 08B80 808DF3F0 24019B00 */  addiu   $at, $zero, 0x9B00         ## $at = FFFF9B00
/* 08B84 808DF3F4 10000001 */  beq     $zero, $zero, .L808DF3FC   
/* 08B88 808DF3F8 24040064 */  addiu   $a0, $zero, 0x0064         ## $a0 = 00000064
.L808DF3FC:
/* 08B8C 808DF3FC 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 08B90 808DF400 308B00FF */  andi    $t3, $a0, 0x00FF           ## $t3 = 00000064
/* 08B94 808DF404 01616025 */  or      $t4, $t3, $at              ## $t4 = FFFF9B64
/* 08B98 808DF408 24590008 */  addiu   $t9, $v0, 0x0008           ## $t9 = 00000008
/* 08B9C 808DF40C AE1902D0 */  sw      $t9, 0x02D0($s0)           ## 000002D0
/* 08BA0 808DF410 AC400004 */  sw      $zero, 0x0004($v0)         ## 00000004
/* 08BA4 808DF414 AC480000 */  sw      $t0, 0x0000($v0)           ## 00000000
/* 08BA8 808DF418 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 08BAC 808DF41C 44807000 */  mtc1    $zero, $f14                ## $f14 = 0.00
/* 08BB0 808DF420 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 08BB4 808DF424 24490008 */  addiu   $t1, $v0, 0x0008           ## $t1 = 00000008
/* 08BB8 808DF428 AE0902D0 */  sw      $t1, 0x02D0($s0)           ## 000002D0
/* 08BBC 808DF42C AC4C0004 */  sw      $t4, 0x0004($v0)           ## 00000004
/* 08BC0 808DF430 AC4A0000 */  sw      $t2, 0x0000($v0)           ## 00000000
/* 08BC4 808DF434 8E260268 */  lw      $a2, 0x0268($s1)           ## 00000268
/* 08BC8 808DF438 0C034261 */  jal     Matrix_Translate              
/* 08BCC 808DF43C C62C0260 */  lwc1    $f12, 0x0260($s1)          ## 00000260
/* 08BD0 808DF440 3C013F40 */  lui     $at, 0x3F40                ## $at = 3F400000
/* 08BD4 808DF444 44815000 */  mtc1    $at, $f10                  ## $f10 = 0.75
/* 08BD8 808DF448 C6280254 */  lwc1    $f8, 0x0254($s1)           ## 00000254
/* 08BDC 808DF44C 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 08BE0 808DF450 44817000 */  mtc1    $at, $f14                  ## $f14 = 1.00
/* 08BE4 808DF454 460A4302 */  mul.s   $f12, $f8, $f10            
/* 08BE8 808DF458 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 08BEC 808DF45C 44066000 */  mfc1    $a2, $f12                  
/* 08BF0 808DF460 0C0342A3 */  jal     Matrix_Scale              
/* 08BF4 808DF464 00000000 */  nop
/* 08BF8 808DF468 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 08BFC 808DF46C 3C0EDA38 */  lui     $t6, 0xDA38                ## $t6 = DA380000
/* 08C00 808DF470 35CE0003 */  ori     $t6, $t6, 0x0003           ## $t6 = DA380003
/* 08C04 808DF474 244D0008 */  addiu   $t5, $v0, 0x0008           ## $t5 = 00000008
/* 08C08 808DF478 AE0D02D0 */  sw      $t5, 0x02D0($s0)           ## 000002D0
/* 08C0C 808DF47C AC4E0000 */  sw      $t6, 0x0000($v0)           ## 00000000
/* 08C10 808DF480 8FAF0074 */  lw      $t7, 0x0074($sp)           
/* 08C14 808DF484 3C05808F */  lui     $a1, %hi(D_808F7B04)       ## $a1 = 808F0000
/* 08C18 808DF488 24A57B04 */  addiu   $a1, $a1, %lo(D_808F7B04)  ## $a1 = 808F7B04
/* 08C1C 808DF48C 8DE40000 */  lw      $a0, 0x0000($t7)           ## 00000000
/* 08C20 808DF490 24061D6B */  addiu   $a2, $zero, 0x1D6B         ## $a2 = 00001D6B
/* 08C24 808DF494 0C0346A2 */  jal     Matrix_NewMtx              
/* 08C28 808DF498 AFA2002C */  sw      $v0, 0x002C($sp)           
/* 08C2C 808DF49C 8FA3002C */  lw      $v1, 0x002C($sp)           
/* 08C30 808DF4A0 3C08808F */  lui     $t0, %hi(D_808F6A98)       ## $t0 = 808F0000
/* 08C34 808DF4A4 25086A98 */  addiu   $t0, $t0, %lo(D_808F6A98)  ## $t0 = 808F6A98
/* 08C38 808DF4A8 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 08C3C 808DF4AC 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 08C40 808DF4B0 3C19DE00 */  lui     $t9, 0xDE00                ## $t9 = DE000000
/* 08C44 808DF4B4 3C06808F */  lui     $a2, %hi(D_808F7B18)       ## $a2 = 808F0000
/* 08C48 808DF4B8 24580008 */  addiu   $t8, $v0, 0x0008           ## $t8 = 00000008
/* 08C4C 808DF4BC AE1802D0 */  sw      $t8, 0x02D0($s0)           ## 000002D0
/* 08C50 808DF4C0 24C67B18 */  addiu   $a2, $a2, %lo(D_808F7B18)  ## $a2 = 808F7B18
/* 08C54 808DF4C4 27A40050 */  addiu   $a0, $sp, 0x0050           ## $a0 = FFFFFFE0
/* 08C58 808DF4C8 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 08C5C 808DF4CC 24071D6E */  addiu   $a3, $zero, 0x1D6E         ## $a3 = 00001D6E
/* 08C60 808DF4D0 AC480004 */  sw      $t0, 0x0004($v0)           ## 00000004
/* 08C64 808DF4D4 0C031AD5 */  jal     Graph_CloseDisps              
/* 08C68 808DF4D8 AC590000 */  sw      $t9, 0x0000($v0)           ## 00000000
/* 08C6C 808DF4DC 8FBF001C */  lw      $ra, 0x001C($sp)           
.L808DF4E0:
/* 08C70 808DF4E0 8FB00014 */  lw      $s0, 0x0014($sp)           
/* 08C74 808DF4E4 8FB10018 */  lw      $s1, 0x0018($sp)           
/* 08C78 808DF4E8 03E00008 */  jr      $ra                        
/* 08C7C 808DF4EC 27BD0070 */  addiu   $sp, $sp, 0x0070           ## $sp = 00000000
