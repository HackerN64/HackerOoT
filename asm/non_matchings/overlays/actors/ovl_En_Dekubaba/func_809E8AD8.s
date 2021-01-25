.rdata
glabel D_809E90F4
    .asciz "../z_en_dekubaba.c"
    .balign 4

glabel D_809E9108
    .asciz "../z_en_dekubaba.c"
    .balign 4

glabel D_809E911C
    .asciz "../z_en_dekubaba.c"
    .balign 4

.late_rodata
glabel D_809E91D0
    .float 0.15

.text
glabel func_809E8AD8
/* 03308 809E8AD8 27BDFF70 */  addiu   $sp, $sp, 0xFF70           ## $sp = FFFFFF70
/* 0330C 809E8ADC AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 03310 809E8AE0 AFB10020 */  sw      $s1, 0x0020($sp)           
/* 03314 809E8AE4 AFB0001C */  sw      $s0, 0x001C($sp)           
/* 03318 809E8AE8 AFA50094 */  sw      $a1, 0x0094($sp)           
/* 0331C 809E8AEC 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 03320 809E8AF0 00808825 */  or      $s1, $a0, $zero            ## $s1 = 00000000
/* 03324 809E8AF4 3C06809F */  lui     $a2, %hi(D_809E90F4)       ## $a2 = 809F0000
/* 03328 809E8AF8 24C690F4 */  addiu   $a2, $a2, %lo(D_809E90F4)  ## $a2 = 809E90F4
/* 0332C 809E8AFC 27A40038 */  addiu   $a0, $sp, 0x0038           ## $a0 = FFFFFFA8
/* 03330 809E8B00 24070A84 */  addiu   $a3, $zero, 0x0A84         ## $a3 = 00000A84
/* 03334 809E8B04 0C031AB1 */  jal     Graph_OpenDisps              
/* 03338 809E8B08 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 0333C 809E8B0C 8FAF0094 */  lw      $t7, 0x0094($sp)           
/* 03340 809E8B10 0C025011 */  jal     func_80094044              
/* 03344 809E8B14 8DE40000 */  lw      $a0, 0x0000($t7)           ## 00000000
/* 03348 809E8B18 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 0334C 809E8B1C 3C19FA00 */  lui     $t9, 0xFA00                ## $t9 = FA000000
/* 03350 809E8B20 240800FF */  addiu   $t0, $zero, 0x00FF         ## $t0 = 000000FF
/* 03354 809E8B24 24580008 */  addiu   $t8, $v0, 0x0008           ## $t8 = 00000008
/* 03358 809E8B28 AE1802D0 */  sw      $t8, 0x02D0($s0)           ## 000002D0
/* 0335C 809E8B2C AC480004 */  sw      $t0, 0x0004($v0)           ## 00000004
/* 03360 809E8B30 AC590000 */  sw      $t9, 0x0000($v0)           ## 00000000
/* 03364 809E8B34 8E270010 */  lw      $a3, 0x0010($s1)           ## 00000010
/* 03368 809E8B38 8E26000C */  lw      $a2, 0x000C($s1)           ## 0000000C
/* 0336C 809E8B3C 8E250008 */  lw      $a1, 0x0008($s1)           ## 00000008
/* 03370 809E8B40 8E240234 */  lw      $a0, 0x0234($s1)           ## 00000234
/* 03374 809E8B44 27A90050 */  addiu   $t1, $sp, 0x0050           ## $t1 = FFFFFFC0
/* 03378 809E8B48 0C00E28A */  jal     func_80038A28              
/* 0337C 809E8B4C AFA90010 */  sw      $t1, 0x0010($sp)           
/* 03380 809E8B50 27A40050 */  addiu   $a0, $sp, 0x0050           ## $a0 = FFFFFFC0
/* 03384 809E8B54 0C03424C */  jal     Matrix_Mult              
/* 03388 809E8B58 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 0338C 809E8B5C 3C01809F */  lui     $at, %hi(D_809E91D0)       ## $at = 809F0000
/* 03390 809E8B60 C42691D0 */  lwc1    $f6, %lo(D_809E91D0)($at)  
/* 03394 809E8B64 C6240230 */  lwc1    $f4, 0x0230($s1)           ## 00000230
/* 03398 809E8B68 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 0339C 809E8B6C 44817000 */  mtc1    $at, $f14                  ## $f14 = 1.00
/* 033A0 809E8B70 46062302 */  mul.s   $f12, $f4, $f6             
/* 033A4 809E8B74 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 033A8 809E8B78 44066000 */  mfc1    $a2, $f12                  
/* 033AC 809E8B7C 0C0342A3 */  jal     Matrix_Scale              
/* 033B0 809E8B80 00000000 */  nop
/* 033B4 809E8B84 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 033B8 809E8B88 3C0BDA38 */  lui     $t3, 0xDA38                ## $t3 = DA380000
/* 033BC 809E8B8C 356B0003 */  ori     $t3, $t3, 0x0003           ## $t3 = DA380003
/* 033C0 809E8B90 244A0008 */  addiu   $t2, $v0, 0x0008           ## $t2 = 00000008
/* 033C4 809E8B94 AE0A02D0 */  sw      $t2, 0x02D0($s0)           ## 000002D0
/* 033C8 809E8B98 AC4B0000 */  sw      $t3, 0x0000($v0)           ## 00000000
/* 033CC 809E8B9C 8FAC0094 */  lw      $t4, 0x0094($sp)           
/* 033D0 809E8BA0 3C05809F */  lui     $a1, %hi(D_809E9108)       ## $a1 = 809F0000
/* 033D4 809E8BA4 24A59108 */  addiu   $a1, $a1, %lo(D_809E9108)  ## $a1 = 809E9108
/* 033D8 809E8BA8 24060A96 */  addiu   $a2, $zero, 0x0A96         ## $a2 = 00000A96
/* 033DC 809E8BAC 00408825 */  or      $s1, $v0, $zero            ## $s1 = 00000000
/* 033E0 809E8BB0 0C0346A2 */  jal     Matrix_NewMtx              
/* 033E4 809E8BB4 8D840000 */  lw      $a0, 0x0000($t4)           ## 00000000
/* 033E8 809E8BB8 AE220004 */  sw      $v0, 0x0004($s1)           ## 00000004
/* 033EC 809E8BBC 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 033F0 809E8BC0 3C0F0405 */  lui     $t7, %hi(gCircleShadowDL)                ## $t7 = 04050000
/* 033F4 809E8BC4 25EF9210 */  addiu   $t7, $t7, %lo(gCircleShadowDL)           ## $t7 = 04049210
/* 033F8 809E8BC8 244D0008 */  addiu   $t5, $v0, 0x0008           ## $t5 = 00000008
/* 033FC 809E8BCC AE0D02D0 */  sw      $t5, 0x02D0($s0)           ## 000002D0
/* 03400 809E8BD0 3C0EDE00 */  lui     $t6, 0xDE00                ## $t6 = DE000000
/* 03404 809E8BD4 AC4E0000 */  sw      $t6, 0x0000($v0)           ## 00000000
/* 03408 809E8BD8 AC4F0004 */  sw      $t7, 0x0004($v0)           ## 00000004
/* 0340C 809E8BDC 8FB80094 */  lw      $t8, 0x0094($sp)           
/* 03410 809E8BE0 3C06809F */  lui     $a2, %hi(D_809E911C)       ## $a2 = 809F0000
/* 03414 809E8BE4 24C6911C */  addiu   $a2, $a2, %lo(D_809E911C)  ## $a2 = 809E911C
/* 03418 809E8BE8 27A40038 */  addiu   $a0, $sp, 0x0038           ## $a0 = FFFFFFA8
/* 0341C 809E8BEC 24070A9B */  addiu   $a3, $zero, 0x0A9B         ## $a3 = 00000A9B
/* 03420 809E8BF0 0C031AD5 */  jal     Graph_CloseDisps              
/* 03424 809E8BF4 8F050000 */  lw      $a1, 0x0000($t8)           ## 00000000
/* 03428 809E8BF8 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 0342C 809E8BFC 8FB0001C */  lw      $s0, 0x001C($sp)           
/* 03430 809E8C00 8FB10020 */  lw      $s1, 0x0020($sp)           
/* 03434 809E8C04 03E00008 */  jr      $ra                        
/* 03438 809E8C08 27BD0090 */  addiu   $sp, $sp, 0x0090           ## $sp = 00000000
