.rdata
glabel D_809FFCA4
    .asciz "../z_en_dy_extra.c"
    .balign 4

glabel D_809FFCB8
    .asciz "../z_en_dy_extra.c"
    .balign 4

glabel D_809FFCCC
    .asciz "../z_en_dy_extra.c"
    .balign 4

.text
glabel EnDyExtra_Draw
/* 00274 809FF964 3C070602 */  lui     $a3, 0x0602                ## $a3 = 06020000
/* 00278 809FF968 24E7BFB0 */  addiu   $a3, $a3, 0xBFB0           ## $a3 = 0601BFB0
/* 0027C 809FF96C 00077900 */  sll     $t7, $a3,  4               
/* 00280 809FF970 000FC702 */  srl     $t8, $t7, 28               
/* 00284 809FF974 0018C880 */  sll     $t9, $t8,  2               
/* 00288 809FF978 3C0A8016 */  lui     $t2, %hi(gSegments)
/* 0028C 809FF97C 27BDFF70 */  addiu   $sp, $sp, 0xFF70           ## $sp = FFFFFF70
/* 00290 809FF980 01595021 */  addu    $t2, $t2, $t9              
/* 00294 809FF984 3C0100FF */  lui     $at, 0x00FF                ## $at = 00FF0000
/* 00298 809FF988 8D4A6FA8 */  lw      $t2, %lo(gSegments)($t2)
/* 0029C 809FF98C 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = 00FFFFFF
/* 002A0 809FF990 00E15824 */  and     $t3, $a3, $at              
/* 002A4 809FF994 AFBF003C */  sw      $ra, 0x003C($sp)           
/* 002A8 809FF998 AFB00038 */  sw      $s0, 0x0038($sp)           
/* 002AC 809FF99C AFA40090 */  sw      $a0, 0x0090($sp)           
/* 002B0 809FF9A0 AFA50094 */  sw      $a1, 0x0094($sp)           
/* 002B4 809FF9A4 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 002B8 809FF9A8 014B3021 */  addu    $a2, $t2, $t3              
/* 002BC 809FF9AC 8CB00000 */  lw      $s0, 0x0000($a1)           ## 00000000
/* 002C0 809FF9B0 00C13021 */  addu    $a2, $a2, $at              
/* 002C4 809FF9B4 A3A00078 */  sb      $zero, 0x0078($sp)         
/* 002C8 809FF9B8 3C014370 */  lui     $at, 0x4370                ## $at = 43700000
/* 002CC 809FF9BC 44813000 */  mtc1    $at, $f6                   ## $f6 = 240.00
/* 002D0 809FF9C0 C4840158 */  lwc1    $f4, 0x0158($a0)           ## 00000158
/* 002D4 809FF9C4 3C01437F */  lui     $at, 0x437F                ## $at = 437F0000
/* 002D8 809FF9C8 44819000 */  mtc1    $at, $f18                  ## $f18 = 255.00
/* 002DC 809FF9CC 46062202 */  mul.s   $f8, $f4, $f6              
/* 002E0 809FF9D0 3C0380A0 */  lui     $v1, %hi(D_809FFC50)       ## $v1 = 80A00000
/* 002E4 809FF9D4 2463FC50 */  addiu   $v1, $v1, %lo(D_809FFC50)  ## $v1 = 809FFC50
/* 002E8 809FF9D8 27A50078 */  addiu   $a1, $sp, 0x0078           ## $a1 = FFFFFFE8
/* 002EC 809FF9DC 2407001B */  addiu   $a3, $zero, 0x001B         ## $a3 = 0000001B
/* 002F0 809FF9E0 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
/* 002F4 809FF9E4 4600428D */  trunc.w.s $f10, $f8                  
/* 002F8 809FF9E8 440E5000 */  mfc1    $t6, $f10                  
/* 002FC 809FF9EC 00000000 */  nop
/* 00300 809FF9F0 A3AE0079 */  sb      $t6, 0x0079($sp)           
/* 00304 809FF9F4 C4900158 */  lwc1    $f16, 0x0158($a0)          ## 00000158
/* 00308 809FF9F8 46128102 */  mul.s   $f4, $f16, $f18            
/* 0030C 809FF9FC 4600218D */  trunc.w.s $f6, $f4                   
/* 00310 809FFA00 44183000 */  mfc1    $t8, $f6                   
/* 00314 809FFA04 00000000 */  nop
/* 00318 809FFA08 A3B8007A */  sb      $t8, 0x007A($sp)           
.L809FFA0C:
/* 0031C 809FFA0C 90640000 */  lbu     $a0, 0x0000($v1)           ## 809FFC50
/* 00320 809FFA10 10800005 */  beq     $a0, $zero, .L809FFA28     
/* 00324 809FFA14 00A4C821 */  addu    $t9, $a1, $a0              
/* 00328 809FFA18 932A0000 */  lbu     $t2, 0x0000($t9)           ## 00000000
/* 0032C 809FFA1C 00025900 */  sll     $t3, $v0,  4               
/* 00330 809FFA20 00CB6821 */  addu    $t5, $a2, $t3              
/* 00334 809FFA24 A1AA000F */  sb      $t2, 0x000F($t5)           ## 0000000F
.L809FFA28:
/* 00338 809FFA28 24420001 */  addiu   $v0, $v0, 0x0001           ## $v0 = 00000001
/* 0033C 809FFA2C 1447FFF7 */  bne     $v0, $a3, .L809FFA0C       
/* 00340 809FFA30 24630001 */  addiu   $v1, $v1, 0x0001           ## $v1 = 809FFC51
/* 00344 809FFA34 3C0680A0 */  lui     $a2, %hi(D_809FFCA4)       ## $a2 = 80A00000
/* 00348 809FFA38 24C6FCA4 */  addiu   $a2, $a2, %lo(D_809FFCA4)  ## $a2 = 809FFCA4
/* 0034C 809FFA3C 27A40064 */  addiu   $a0, $sp, 0x0064           ## $a0 = FFFFFFD4
/* 00350 809FFA40 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 00354 809FFA44 0C031AB1 */  jal     Graph_OpenDisps              
/* 00358 809FFA48 24070126 */  addiu   $a3, $zero, 0x0126         ## $a3 = 00000126
/* 0035C 809FFA4C 8FAE0094 */  lw      $t6, 0x0094($sp)           
/* 00360 809FFA50 0C024F61 */  jal     func_80093D84              
/* 00364 809FFA54 8DC40000 */  lw      $a0, 0x0000($t6)           ## 00000000
/* 00368 809FFA58 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 0036C 809FFA5C 8FA90094 */  lw      $t1, 0x0094($sp)           
/* 00370 809FFA60 3C0FDB06 */  lui     $t7, 0xDB06                ## $t7 = DB060000
/* 00374 809FFA64 244C0008 */  addiu   $t4, $v0, 0x0008           ## $t4 = 00000008
/* 00378 809FFA68 AE0C02D0 */  sw      $t4, 0x02D0($s0)           ## 000002D0
/* 0037C 809FFA6C 35EF0020 */  ori     $t7, $t7, 0x0020           ## $t7 = DB060020
/* 00380 809FFA70 AC4F0000 */  sw      $t7, 0x0000($v0)           ## 00000000
/* 00384 809FFA74 8D23009C */  lw      $v1, 0x009C($t1)           ## 0000009C
/* 00388 809FFA78 8D240000 */  lw      $a0, 0x0000($t1)           ## 00000000
/* 0038C 809FFA7C 24180020 */  addiu   $t8, $zero, 0x0020         ## $t8 = 00000020
/* 00390 809FFA80 00030823 */  subu    $at, $zero, $v1            
/* 00394 809FFA84 000150C0 */  sll     $t2, $at,  3               
/* 00398 809FFA88 24190040 */  addiu   $t9, $zero, 0x0040         ## $t9 = 00000040
/* 0039C 809FFA8C 240B0001 */  addiu   $t3, $zero, 0x0001         ## $t3 = 00000001
/* 003A0 809FFA90 240D0010 */  addiu   $t5, $zero, 0x0010         ## $t5 = 00000010
/* 003A4 809FFA94 240E0010 */  addiu   $t6, $zero, 0x0010         ## $t6 = 00000010
/* 003A8 809FFA98 AFAE0028 */  sw      $t6, 0x0028($sp)           
/* 003AC 809FFA9C AFAD0024 */  sw      $t5, 0x0024($sp)           
/* 003B0 809FFAA0 AFAB0018 */  sw      $t3, 0x0018($sp)           
/* 003B4 809FFAA4 AFB90014 */  sw      $t9, 0x0014($sp)           
/* 003B8 809FFAA8 AFAA0020 */  sw      $t2, 0x0020($sp)           
/* 003BC 809FFAAC AFB80010 */  sw      $t8, 0x0010($sp)           
/* 003C0 809FFAB0 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 003C4 809FFAB4 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 003C8 809FFAB8 AFA20060 */  sw      $v0, 0x0060($sp)           
/* 003CC 809FFABC AFA3001C */  sw      $v1, 0x001C($sp)           
/* 003D0 809FFAC0 0C0253D0 */  jal     Gfx_TwoTexScroll              
/* 003D4 809FFAC4 00033040 */  sll     $a2, $v1,  1               
/* 003D8 809FFAC8 8FA80060 */  lw      $t0, 0x0060($sp)           
/* 003DC 809FFACC 3C0FE700 */  lui     $t7, 0xE700                ## $t7 = E7000000
/* 003E0 809FFAD0 3C19DA38 */  lui     $t9, 0xDA38                ## $t9 = DA380000
/* 003E4 809FFAD4 AD020004 */  sw      $v0, 0x0004($t0)           ## 00000004
/* 003E8 809FFAD8 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 003EC 809FFADC 37390003 */  ori     $t9, $t9, 0x0003           ## $t9 = DA380003
/* 003F0 809FFAE0 3C0580A0 */  lui     $a1, %hi(D_809FFCB8)       ## $a1 = 80A00000
/* 003F4 809FFAE4 244C0008 */  addiu   $t4, $v0, 0x0008           ## $t4 = 00000008
/* 003F8 809FFAE8 AE0C02D0 */  sw      $t4, 0x02D0($s0)           ## 000002D0
/* 003FC 809FFAEC AC4F0000 */  sw      $t7, 0x0000($v0)           ## 00000000
/* 00400 809FFAF0 AC400004 */  sw      $zero, 0x0004($v0)         ## 00000004
/* 00404 809FFAF4 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 00408 809FFAF8 24A5FCB8 */  addiu   $a1, $a1, %lo(D_809FFCB8)  ## $a1 = 809FFCB8
/* 0040C 809FFAFC 24060133 */  addiu   $a2, $zero, 0x0133         ## $a2 = 00000133
/* 00410 809FFB00 24580008 */  addiu   $t8, $v0, 0x0008           ## $t8 = 00000008
/* 00414 809FFB04 AE1802D0 */  sw      $t8, 0x02D0($s0)           ## 000002D0
/* 00418 809FFB08 AC590000 */  sw      $t9, 0x0000($v0)           ## 00000000
/* 0041C 809FFB0C 8FAB0094 */  lw      $t3, 0x0094($sp)           
/* 00420 809FFB10 8D640000 */  lw      $a0, 0x0000($t3)           ## 00000000
/* 00424 809FFB14 0C0346A2 */  jal     Matrix_NewMtx              
/* 00428 809FFB18 AFA20058 */  sw      $v0, 0x0058($sp)           
/* 0042C 809FFB1C 8FA30058 */  lw      $v1, 0x0058($sp)           
/* 00430 809FFB20 3C0DFA00 */  lui     $t5, 0xFA00                ## $t5 = FA000000
/* 00434 809FFB24 35AD0080 */  ori     $t5, $t5, 0x0080           ## $t5 = FA000080
/* 00438 809FFB28 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 0043C 809FFB2C 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 00440 809FFB30 8FA50090 */  lw      $a1, 0x0090($sp)           
/* 00444 809FFB34 3C0F80A0 */  lui     $t7, %hi(D_809FFC40)       ## $t7 = 80A00000
/* 00448 809FFB38 244A0008 */  addiu   $t2, $v0, 0x0008           ## $t2 = 00000008
/* 0044C 809FFB3C AE0A02D0 */  sw      $t2, 0x02D0($s0)           ## 000002D0
/* 00450 809FFB40 AC4D0000 */  sw      $t5, 0x0000($v0)           ## 00000000
/* 00454 809FFB44 84AE0150 */  lh      $t6, 0x0150($a1)           ## 00000150
/* 00458 809FFB48 25EFFC40 */  addiu   $t7, $t7, %lo(D_809FFC40)  ## $t7 = 809FFC40
/* 0045C 809FFB4C 3C0680A0 */  lui     $a2, %hi(D_809FFCCC)       ## $a2 = 80A00000
/* 00460 809FFB50 000E6080 */  sll     $t4, $t6,  2               
/* 00464 809FFB54 018F1821 */  addu    $v1, $t4, $t7              
/* 00468 809FFB58 90790002 */  lbu     $t9, 0x0002($v1)           ## 00000002
/* 0046C 809FFB5C 906D0000 */  lbu     $t5, 0x0000($v1)           ## 00000000
/* 00470 809FFB60 90780001 */  lbu     $t8, 0x0001($v1)           ## 00000001
/* 00474 809FFB64 00195A00 */  sll     $t3, $t9,  8               
/* 00478 809FFB68 000D7600 */  sll     $t6, $t5, 24               
/* 0047C 809FFB6C 016E6025 */  or      $t4, $t3, $t6              ## $t4 = 00000000
/* 00480 809FFB70 0018CC00 */  sll     $t9, $t8, 16               
/* 00484 809FFB74 01995025 */  or      $t2, $t4, $t9              ## $t2 = 00000000
/* 00488 809FFB78 354D00FF */  ori     $t5, $t2, 0x00FF           ## $t5 = 000000FF
/* 0048C 809FFB7C AC4D0004 */  sw      $t5, 0x0004($v0)           ## 00000004
/* 00490 809FFB80 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 00494 809FFB84 3C0EFB00 */  lui     $t6, 0xFB00                ## $t6 = FB000000
/* 00498 809FFB88 3C0C80A0 */  lui     $t4, %hi(D_809FFC48)       ## $t4 = 80A00000
/* 0049C 809FFB8C 244B0008 */  addiu   $t3, $v0, 0x0008           ## $t3 = 00000008
/* 004A0 809FFB90 AE0B02D0 */  sw      $t3, 0x02D0($s0)           ## 000002D0
/* 004A4 809FFB94 AC4E0000 */  sw      $t6, 0x0000($v0)           ## 00000000
/* 004A8 809FFB98 84AF0150 */  lh      $t7, 0x0150($a1)           ## 00000150
/* 004AC 809FFB9C 258CFC48 */  addiu   $t4, $t4, %lo(D_809FFC48)  ## $t4 = 809FFC48
/* 004B0 809FFBA0 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 004B4 809FFBA4 000FC080 */  sll     $t8, $t7,  2               
/* 004B8 809FFBA8 030C1821 */  addu    $v1, $t8, $t4              
/* 004BC 809FFBAC 906A0002 */  lbu     $t2, 0x0002($v1)           ## 00000002
/* 004C0 809FFBB0 906E0000 */  lbu     $t6, 0x0000($v1)           ## 00000000
/* 004C4 809FFBB4 90790001 */  lbu     $t9, 0x0001($v1)           ## 00000001
/* 004C8 809FFBB8 000A6A00 */  sll     $t5, $t2,  8               
/* 004CC 809FFBBC 000E7E00 */  sll     $t7, $t6, 24               
/* 004D0 809FFBC0 01AFC025 */  or      $t8, $t5, $t7              ## $t8 = 809FFCFF
/* 004D4 809FFBC4 00195400 */  sll     $t2, $t9, 16               
/* 004D8 809FFBC8 030A5825 */  or      $t3, $t8, $t2              ## $t3 = 809FFCFF
/* 004DC 809FFBCC 356E0080 */  ori     $t6, $t3, 0x0080           ## $t6 = 809FFCFF
/* 004E0 809FFBD0 AC4E0004 */  sw      $t6, 0x0004($v0)           ## 00000004
/* 004E4 809FFBD4 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 004E8 809FFBD8 3C0C0602 */  lui     $t4, 0x0602                ## $t4 = 06020000
/* 004EC 809FFBDC 258CC160 */  addiu   $t4, $t4, 0xC160           ## $t4 = 0601C160
/* 004F0 809FFBE0 244D0008 */  addiu   $t5, $v0, 0x0008           ## $t5 = 00000008
/* 004F4 809FFBE4 AE0D02D0 */  sw      $t5, 0x02D0($s0)           ## 000002D0
/* 004F8 809FFBE8 3C0FDE00 */  lui     $t7, 0xDE00                ## $t7 = DE000000
/* 004FC 809FFBEC 24C6FCCC */  addiu   $a2, $a2, %lo(D_809FFCCC)  ## $a2 = 809FFCCC
/* 00500 809FFBF0 27A40064 */  addiu   $a0, $sp, 0x0064           ## $a0 = FFFFFFD4
/* 00504 809FFBF4 24070145 */  addiu   $a3, $zero, 0x0145         ## $a3 = 00000145
/* 00508 809FFBF8 AC4F0000 */  sw      $t7, 0x0000($v0)           ## 00000000
/* 0050C 809FFBFC 0C031AD5 */  jal     Graph_CloseDisps              
/* 00510 809FFC00 AC4C0004 */  sw      $t4, 0x0004($v0)           ## 00000004
/* 00514 809FFC04 8FBF003C */  lw      $ra, 0x003C($sp)           
/* 00518 809FFC08 8FB00038 */  lw      $s0, 0x0038($sp)           
/* 0051C 809FFC0C 27BD0090 */  addiu   $sp, $sp, 0x0090           ## $sp = 00000000
/* 00520 809FFC10 03E00008 */  jr      $ra                        
/* 00524 809FFC14 00000000 */  nop
/* 00528 809FFC18 00000000 */  nop
/* 0052C 809FFC1C 00000000 */  nop
