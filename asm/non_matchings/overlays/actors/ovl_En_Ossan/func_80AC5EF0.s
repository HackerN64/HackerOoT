.rdata
glabel D_80AC92E8
    .asciz "\x1b[33m★★★ 続けるよ！！ ★★★\x1b[m\n"
    .balign 4

glabel D_80AC930C
    .asciz "\x1b[33m★★★ やめるよ！！ ★★★\x1b[m\n"
    .balign 4

.text
glabel func_80AC5EF0
/* 03250 80AC5EF0 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 03254 80AC5EF4 AFB10018 */  sw      $s1, 0x0018($sp)           
/* 03258 80AC5EF8 00808825 */  or      $s1, $a0, $zero            ## $s1 = 00000000
/* 0325C 80AC5EFC AFBF001C */  sw      $ra, 0x001C($sp)           
/* 03260 80AC5F00 AFB00014 */  sw      $s0, 0x0014($sp)           
/* 03264 80AC5F04 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 03268 80AC5F08 AFA60028 */  sw      $a2, 0x0028($sp)           
/* 0326C 80AC5F0C 0C042F6F */  jal     func_8010BDBC              
/* 03270 80AC5F10 24A420D8 */  addiu   $a0, $a1, 0x20D8           ## $a0 = 000020D8
/* 03274 80AC5F14 24010004 */  addiu   $at, $zero, 0x0004         ## $at = 00000004
/* 03278 80AC5F18 14410043 */  bne     $v0, $at, .L80AC6028       
/* 0327C 80AC5F1C 00401825 */  or      $v1, $v0, $zero            ## $v1 = 00000000
/* 03280 80AC5F20 0C041AF2 */  jal     func_80106BC8              
/* 03284 80AC5F24 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 03288 80AC5F28 5040006A */  beql    $v0, $zero, .L80AC60D4     
/* 0328C 80AC5F2C 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 03290 80AC5F30 0C2B191B */  jal     func_80AC646C              
/* 03294 80AC5F34 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 03298 80AC5F38 922E0252 */  lbu     $t6, 0x0252($s1)           ## 00000252
/* 0329C 80AC5F3C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 032A0 80AC5F40 000E7880 */  sll     $t7, $t6,  2               
/* 032A4 80AC5F44 022FC021 */  addu    $t8, $s1, $t7              
/* 032A8 80AC5F48 8F050200 */  lw      $a1, 0x0200($t8)           ## 00000200
/* 032AC 80AC5F4C 8CB901B0 */  lw      $t9, 0x01B0($a1)           ## 000001B0
/* 032B0 80AC5F50 0320F809 */  jalr    $ra, $t9                   
/* 032B4 80AC5F54 00000000 */  nop
/* 032B8 80AC5F58 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 032BC 80AC5F5C 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 032C0 80AC5F60 0C2B0E21 */  jal     func_80AC3884              
/* 032C4 80AC5F64 26060014 */  addiu   $a2, $s0, 0x0014           ## $a2 = 00000014
/* 032C8 80AC5F68 14400059 */  bne     $v0, $zero, .L80AC60D0     
/* 032CC 80AC5F6C 3C020001 */  lui     $v0, 0x0001                ## $v0 = 00010000
/* 032D0 80AC5F70 00501021 */  addu    $v0, $v0, $s0              
/* 032D4 80AC5F74 904204BD */  lbu     $v0, 0x04BD($v0)           ## 000104BD
/* 032D8 80AC5F78 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 032DC 80AC5F7C 3C0480AD */  lui     $a0, %hi(D_80AC92E8)       ## $a0 = 80AD0000
/* 032E0 80AC5F80 10400005 */  beq     $v0, $zero, .L80AC5F98     
/* 032E4 80AC5F84 00000000 */  nop
/* 032E8 80AC5F88 10410020 */  beq     $v0, $at, .L80AC600C       
/* 032EC 80AC5F8C 3C0480AD */  lui     $a0, %hi(D_80AC930C)       ## $a0 = 80AD0000
/* 032F0 80AC5F90 1000001E */  beq     $zero, $zero, .L80AC600C   
/* 032F4 80AC5F94 00000000 */  nop
.L80AC5F98:
/* 032F8 80AC5F98 0C00084C */  jal     osSyncPrintf
              
/* 032FC 80AC5F9C 248492E8 */  addiu   $a0, $a0, %lo(D_80AC92E8)  ## $a0 = 80AC92E8
/* 03300 80AC5FA0 8FA20028 */  lw      $v0, 0x0028($sp)           
/* 03304 80AC5FA4 34018000 */  ori     $at, $zero, 0x8000         ## $at = 00008000
/* 03308 80AC5FA8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0330C 80AC5FAC 844800B6 */  lh      $t0, 0x00B6($v0)           ## 000000B6
/* 03310 80AC5FB0 8C4A0680 */  lw      $t2, 0x0680($v0)           ## 00000680
/* 03314 80AC5FB4 24050002 */  addiu   $a1, $zero, 0x0002         ## $a1 = 00000002
/* 03318 80AC5FB8 01014821 */  addu    $t1, $t0, $at              
/* 0331C 80AC5FBC 3C012000 */  lui     $at, 0x2000                ## $at = 20000000
/* 03320 80AC5FC0 01415825 */  or      $t3, $t2, $at              ## $t3 = 20000000
/* 03324 80AC5FC4 A44900B6 */  sh      $t1, 0x00B6($v0)           ## 000000B6
/* 03328 80AC5FC8 0C02F124 */  jal     func_800BC490              
/* 0332C 80AC5FCC AC4B0680 */  sw      $t3, 0x0680($v0)           ## 00000680
/* 03330 80AC5FD0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 03334 80AC5FD4 9625010E */  lhu     $a1, 0x010E($s1)           ## 0000010E
/* 03338 80AC5FD8 0C042DA0 */  jal     func_8010B680              
/* 0333C 80AC5FDC 02203025 */  or      $a2, $s1, $zero            ## $a2 = 00000000
/* 03340 80AC5FE0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 03344 80AC5FE4 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 03348 80AC5FE8 0C2B0E4A */  jal     func_80AC3928              
/* 0334C 80AC5FEC 24060001 */  addiu   $a2, $zero, 0x0001         ## $a2 = 00000001
/* 03350 80AC5FF0 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 03354 80AC5FF4 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 03358 80AC5FF8 3C0642C8 */  lui     $a2, 0x42C8                ## $a2 = 42C80000
/* 0335C 80AC5FFC 0C00BCA6 */  jal     func_8002F298              
/* 03360 80AC6000 2407FFFF */  addiu   $a3, $zero, 0xFFFF         ## $a3 = FFFFFFFF
/* 03364 80AC6004 10000033 */  beq     $zero, $zero, .L80AC60D4   
/* 03368 80AC6008 8FBF001C */  lw      $ra, 0x001C($sp)           
.L80AC600C:
/* 0336C 80AC600C 0C00084C */  jal     osSyncPrintf
              
/* 03370 80AC6010 2484930C */  addiu   $a0, $a0, %lo(D_80AC930C)  ## $a0 = FFFF930C
/* 03374 80AC6014 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 03378 80AC6018 0C2B0DEA */  jal     func_80AC37A8              
/* 0337C 80AC601C 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 03380 80AC6020 1000002C */  beq     $zero, $zero, .L80AC60D4   
/* 03384 80AC6024 8FBF001C */  lw      $ra, 0x001C($sp)           
.L80AC6028:
/* 03388 80AC6028 24010005 */  addiu   $at, $zero, 0x0005         ## $at = 00000005
/* 0338C 80AC602C 54610029 */  bnel    $v1, $at, .L80AC60D4       
/* 03390 80AC6030 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 03394 80AC6034 0C041AF2 */  jal     func_80106BC8              
/* 03398 80AC6038 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0339C 80AC603C 50400025 */  beql    $v0, $zero, .L80AC60D4     
/* 033A0 80AC6040 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 033A4 80AC6044 0C2B191B */  jal     func_80AC646C              
/* 033A8 80AC6048 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 033AC 80AC604C 922C0252 */  lbu     $t4, 0x0252($s1)           ## 00000252
/* 033B0 80AC6050 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 033B4 80AC6054 000C6880 */  sll     $t5, $t4,  2               
/* 033B8 80AC6058 022D7021 */  addu    $t6, $s1, $t5              
/* 033BC 80AC605C 8DC50200 */  lw      $a1, 0x0200($t6)           ## 00000200
/* 033C0 80AC6060 8CB901B0 */  lw      $t9, 0x01B0($a1)           ## 000001B0
/* 033C4 80AC6064 0320F809 */  jalr    $ra, $t9                   
/* 033C8 80AC6068 00000000 */  nop
/* 033CC 80AC606C 8FA20028 */  lw      $v0, 0x0028($sp)           
/* 033D0 80AC6070 34018000 */  ori     $at, $zero, 0x8000         ## $at = 00008000
/* 033D4 80AC6074 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 033D8 80AC6078 844F00B6 */  lh      $t7, 0x00B6($v0)           ## 000000B6
/* 033DC 80AC607C 8C480680 */  lw      $t0, 0x0680($v0)           ## 00000680
/* 033E0 80AC6080 24050002 */  addiu   $a1, $zero, 0x0002         ## $a1 = 00000002
/* 033E4 80AC6084 01E1C021 */  addu    $t8, $t7, $at              
/* 033E8 80AC6088 3C012000 */  lui     $at, 0x2000                ## $at = 20000000
/* 033EC 80AC608C 01014825 */  or      $t1, $t0, $at              ## $t1 = 20000000
/* 033F0 80AC6090 A45800B6 */  sh      $t8, 0x00B6($v0)           ## 000000B6
/* 033F4 80AC6094 0C02F124 */  jal     func_800BC490              
/* 033F8 80AC6098 AC490680 */  sw      $t1, 0x0680($v0)           ## 00000680
/* 033FC 80AC609C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 03400 80AC60A0 9625010E */  lhu     $a1, 0x010E($s1)           ## 0000010E
/* 03404 80AC60A4 0C042DA0 */  jal     func_8010B680              
/* 03408 80AC60A8 02203025 */  or      $a2, $s1, $zero            ## $a2 = 00000000
/* 0340C 80AC60AC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 03410 80AC60B0 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 03414 80AC60B4 0C2B0E4A */  jal     func_80AC3928              
/* 03418 80AC60B8 24060001 */  addiu   $a2, $zero, 0x0001         ## $a2 = 00000001
/* 0341C 80AC60BC 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 03420 80AC60C0 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 03424 80AC60C4 3C0642C8 */  lui     $a2, 0x42C8                ## $a2 = 42C80000
/* 03428 80AC60C8 0C00BCA6 */  jal     func_8002F298              
/* 0342C 80AC60CC 2407FFFF */  addiu   $a3, $zero, 0xFFFF         ## $a3 = FFFFFFFF
.L80AC60D0:
/* 03430 80AC60D0 8FBF001C */  lw      $ra, 0x001C($sp)           
.L80AC60D4:
/* 03434 80AC60D4 8FB00014 */  lw      $s0, 0x0014($sp)           
/* 03438 80AC60D8 8FB10018 */  lw      $s1, 0x0018($sp)           
/* 0343C 80AC60DC 03E00008 */  jr      $ra                        
/* 03440 80AC60E0 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
