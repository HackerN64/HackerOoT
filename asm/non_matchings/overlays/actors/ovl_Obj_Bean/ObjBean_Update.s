.rdata
glabel D_80B90FD0
    .asciz "\x1b[36m"
    .balign 4

glabel D_80B90FD8
    .asciz "馬と豆の木リフト衝突！！！\n"
    .balign 4

glabel D_80B90FF4
    .asciz "\x1b[m"
    .balign 4

.text
glabel ObjBean_Update
/* 02048 80B90AC8 27BDFFD0 */  addiu   $sp, $sp, 0xFFD0           ## $sp = FFFFFFD0
/* 0204C 80B90ACC AFBF001C */  sw      $ra, 0x001C($sp)           
/* 02050 80B90AD0 AFB10018 */  sw      $s1, 0x0018($sp)           
/* 02054 80B90AD4 AFB00014 */  sw      $s0, 0x0014($sp)           
/* 02058 80B90AD8 848201B4 */  lh      $v0, 0x01B4($a0)           ## 000001B4
/* 0205C 80B90ADC 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 02060 80B90AE0 00A08825 */  or      $s1, $a1, $zero            ## $s1 = 00000000
/* 02064 80B90AE4 18400002 */  blez    $v0, .L80B90AF0            
/* 02068 80B90AE8 244EFFFF */  addiu   $t6, $v0, 0xFFFF           ## $t6 = FFFFFFFF
/* 0206C 80B90AEC A48E01B4 */  sh      $t6, 0x01B4($a0)           ## 000001B4
.L80B90AF0:
/* 02070 80B90AF0 8E190164 */  lw      $t9, 0x0164($s0)           ## 00000164
/* 02074 80B90AF4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 02078 80B90AF8 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 0207C 80B90AFC 0320F809 */  jalr    $ra, $t9                   
/* 02080 80B90B00 00000000 */  nop
/* 02084 80B90B04 920F01F7 */  lbu     $t7, 0x01F7($s0)           ## 000001F7
/* 02088 80B90B08 31F80004 */  andi    $t8, $t7, 0x0004           ## $t8 = 00000000
/* 0208C 80B90B0C 53000044 */  beql    $t8, $zero, .L80B90C20     
/* 02090 80B90B10 AE0000C0 */  sw      $zero, 0x00C0($s0)         ## 000000C0
/* 02094 80B90B14 0C2E3BBF */  jal     func_80B8EEFC              
/* 02098 80B90B18 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0209C 80B90B1C 3C014316 */  lui     $at, 0x4316                ## $at = 43160000
/* 020A0 80B90B20 44813000 */  mtc1    $at, $f6                   ## $f6 = 150.00
/* 020A4 80B90B24 C6040090 */  lwc1    $f4, 0x0090($s0)           ## 00000090
/* 020A8 80B90B28 3C014420 */  lui     $at, 0x4420                ## $at = 44200000
/* 020AC 80B90B2C 4606203C */  c.lt.s  $f4, $f6                   
/* 020B0 80B90B30 00000000 */  nop
/* 020B4 80B90B34 45020017 */  bc1fl   .L80B90B94                 
/* 020B8 80B90B38 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 020BC 80B90B3C C6080050 */  lwc1    $f8, 0x0050($s0)           ## 00000050
/* 020C0 80B90B40 44815000 */  mtc1    $at, $f10                  ## $f10 = 640.00
/* 020C4 80B90B44 3C013F00 */  lui     $at, 0x3F00                ## $at = 3F000000
/* 020C8 80B90B48 44819000 */  mtc1    $at, $f18                  ## $f18 = 0.50
/* 020CC 80B90B4C 460A4402 */  mul.s   $f16, $f8, $f10            
/* 020D0 80B90B50 26060168 */  addiu   $a2, $s0, 0x0168           ## $a2 = 00000168
/* 020D4 80B90B54 00C02825 */  or      $a1, $a2, $zero            ## $a1 = 00000168
/* 020D8 80B90B58 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 020DC 80B90B5C 46128100 */  add.s   $f4, $f16, $f18            
/* 020E0 80B90B60 4600218D */  trunc.w.s $f6, $f4                   
/* 020E4 80B90B64 44093000 */  mfc1    $t1, $f6                   
/* 020E8 80B90B68 00000000 */  nop
/* 020EC 80B90B6C A60901A8 */  sh      $t1, 0x01A8($s0)           ## 000001A8
/* 020F0 80B90B70 0C0189B7 */  jal     Collider_UpdateCylinder
              
/* 020F4 80B90B74 AFA60024 */  sw      $a2, 0x0024($sp)           
/* 020F8 80B90B78 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 020FC 80B90B7C 34211E60 */  ori     $at, $at, 0x1E60           ## $at = 00011E60
/* 02100 80B90B80 8FA60024 */  lw      $a2, 0x0024($sp)           
/* 02104 80B90B84 02212821 */  addu    $a1, $s1, $at              
/* 02108 80B90B88 0C017713 */  jal     CollisionCheck_SetOC
              ## CollisionCheck_setOC
/* 0210C 80B90B8C 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 02110 80B90B90 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
.L80B90B94:
/* 02114 80B90B94 0C2E3AD8 */  jal     func_80B8EB60              
/* 02118 80B90B98 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 0211C 80B90B9C 3C0142B0 */  lui     $at, 0x42B0                ## $at = 42B00000
/* 02120 80B90BA0 44815000 */  mtc1    $at, $f10                  ## $f10 = 88.00
/* 02124 80B90BA4 C6080050 */  lwc1    $f8, 0x0050($s0)           ## 00000050
/* 02128 80B90BA8 3C0A8003 */  lui     $t2, %hi(ActorShadow_DrawCircle)
/* 0212C 80B90BAC 254AB5EC */  addiu   $t2, %lo(ActorShadow_DrawCircle)
/* 02130 80B90BB0 460A4402 */  mul.s   $f16, $f8, $f10            
/* 02134 80B90BB4 AE0A00C0 */  sw      $t2, 0x00C0($s0)           ## 000000C0
/* 02138 80B90BB8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0213C 80B90BBC 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 02140 80B90BC0 0C2E3CA6 */  jal     func_80B8F298              
/* 02144 80B90BC4 E61000C4 */  swc1    $f16, 0x00C4($s0)          ## 000000C4
/* 02148 80B90BC8 10400015 */  beq     $v0, $zero, .L80B90C20     
/* 0214C 80B90BCC 3C0480B9 */  lui     $a0, %hi(D_80B90FD0)       ## $a0 = 80B90000
/* 02150 80B90BD0 0C00084C */  jal     osSyncPrintf
              
/* 02154 80B90BD4 24840FD0 */  addiu   $a0, $a0, %lo(D_80B90FD0)  ## $a0 = 80B90FD0
/* 02158 80B90BD8 3C0480B9 */  lui     $a0, %hi(D_80B90FD8)       ## $a0 = 80B90000
/* 0215C 80B90BDC 0C00084C */  jal     osSyncPrintf
              
/* 02160 80B90BE0 24840FD8 */  addiu   $a0, $a0, %lo(D_80B90FD8)  ## $a0 = 80B90FD8
/* 02164 80B90BE4 3C0480B9 */  lui     $a0, %hi(D_80B90FF4)       ## $a0 = 80B90000
/* 02168 80B90BE8 0C00084C */  jal     osSyncPrintf
              
/* 0216C 80B90BEC 24840FF4 */  addiu   $a0, $a0, %lo(D_80B90FF4)  ## $a0 = 80B90FF4
/* 02170 80B90BF0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 02174 80B90BF4 0C2E3CC9 */  jal     func_80B8F324              
/* 02178 80B90BF8 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 0217C 80B90BFC 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 02180 80B90C00 26250810 */  addiu   $a1, $s1, 0x0810           ## $a1 = 00000810
/* 02184 80B90C04 0C00FAFE */  jal     func_8003EBF8              
/* 02188 80B90C08 8E06014C */  lw      $a2, 0x014C($s0)           ## 0000014C
/* 0218C 80B90C0C 0C2E423B */  jal     func_80B908EC              
/* 02190 80B90C10 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 02194 80B90C14 10000003 */  beq     $zero, $zero, .L80B90C24   
/* 02198 80B90C18 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0219C 80B90C1C AE0000C0 */  sw      $zero, 0x00C0($s0)         ## 000000C0
.L80B90C20:
/* 021A0 80B90C20 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
.L80B90C24:
/* 021A4 80B90C24 0C00B56E */  jal     Actor_SetFocus
              
/* 021A8 80B90C28 3C0540C0 */  lui     $a1, 0x40C0                ## $a1 = 40C00000
/* 021AC 80B90C2C 920B01F7 */  lbu     $t3, 0x01F7($s0)           ## 000001F7
/* 021B0 80B90C30 316C0020 */  andi    $t4, $t3, 0x0020           ## $t4 = 00000000
/* 021B4 80B90C34 5180000D */  beql    $t4, $zero, .L80B90C6C     
/* 021B8 80B90C38 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 021BC 80B90C3C 0C010D5B */  jal     func_8004356C              
/* 021C0 80B90C40 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 021C4 80B90C44 50400006 */  beql    $v0, $zero, .L80B90C60     
/* 021C8 80B90C48 921901F7 */  lbu     $t9, 0x01F7($s0)           ## 000001F7
/* 021CC 80B90C4C 920D01F7 */  lbu     $t5, 0x01F7($s0)           ## 000001F7
/* 021D0 80B90C50 35AE0080 */  ori     $t6, $t5, 0x0080           ## $t6 = 00000080
/* 021D4 80B90C54 10000004 */  beq     $zero, $zero, .L80B90C68   
/* 021D8 80B90C58 A20E01F7 */  sb      $t6, 0x01F7($s0)           ## 000001F7
/* 021DC 80B90C5C 921901F7 */  lbu     $t9, 0x01F7($s0)           ## 000001F7
.L80B90C60:
/* 021E0 80B90C60 332FFF7F */  andi    $t7, $t9, 0xFF7F           ## $t7 = 00000000
/* 021E4 80B90C64 A20F01F7 */  sb      $t7, 0x01F7($s0)           ## 000001F7
.L80B90C68:
/* 021E8 80B90C68 8FBF001C */  lw      $ra, 0x001C($sp)           
.L80B90C6C:
/* 021EC 80B90C6C 8FB00014 */  lw      $s0, 0x0014($sp)           
/* 021F0 80B90C70 8FB10018 */  lw      $s1, 0x0018($sp)           
/* 021F4 80B90C74 03E00008 */  jr      $ra                        
/* 021F8 80B90C78 27BD0030 */  addiu   $sp, $sp, 0x0030           ## $sp = 00000000
