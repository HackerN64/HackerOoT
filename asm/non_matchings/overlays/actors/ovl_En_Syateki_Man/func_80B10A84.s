glabel func_80B10A84
/* 00214 80B10A84 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 00218 80B10A88 AFB00018 */  sw      $s0, 0x0018($sp)           
/* 0021C 80B10A8C 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00220 80B10A90 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 00224 80B10A94 AFA5002C */  sw      $a1, 0x002C($sp)           
/* 00228 80B10A98 2484014C */  addiu   $a0, $a0, 0x014C           ## $a0 = 0000014C
/* 0022C 80B10A9C 0C02927F */  jal     SkelAnime_FrameUpdateMatrix
              
/* 00230 80B10AA0 A7A00026 */  sh      $zero, 0x0026($sp)         
/* 00234 80B10AA4 920E021C */  lbu     $t6, 0x021C($s0)           ## 0000021C
/* 00238 80B10AA8 87A30026 */  lh      $v1, 0x0026($sp)           
/* 0023C 80B10AAC 8FB8002C */  lw      $t8, 0x002C($sp)           
/* 00240 80B10AB0 11C00004 */  beq     $t6, $zero, .L80B10AC4     
/* 00244 80B10AB4 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 00248 80B10AB8 240FFFFE */  addiu   $t7, $zero, 0xFFFE         ## $t7 = FFFFFFFE
/* 0024C 80B10ABC 00380821 */  addu    $at, $at, $t8              
/* 00250 80B10AC0 A02F1E5C */  sb      $t7, 0x1E5C($at)           ## 00011E5C
.L80B10AC4:
/* 00254 80B10AC4 8FA4002C */  lw      $a0, 0x002C($sp)           
/* 00258 80B10AC8 A7A30026 */  sh      $v1, 0x0026($sp)           
/* 0025C 80B10ACC 0C042F6F */  jal     func_8010BDBC              
/* 00260 80B10AD0 248420D8 */  addiu   $a0, $a0, 0x20D8           ## $a0 = 000020D8
/* 00264 80B10AD4 86190212 */  lh      $t9, 0x0212($s0)           ## 00000212
/* 00268 80B10AD8 87A30026 */  lh      $v1, 0x0026($sp)           
/* 0026C 80B10ADC 8FA4002C */  lw      $a0, 0x002C($sp)           
/* 00270 80B10AE0 5722004E */  bnel    $t9, $v0, .L80B10C1C       
/* 00274 80B10AE4 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 00278 80B10AE8 0C041AF2 */  jal     func_80106BC8              
/* 0027C 80B10AEC A7A30026 */  sh      $v1, 0x0026($sp)           
/* 00280 80B10AF0 10400049 */  beq     $v0, $zero, .L80B10C18     
/* 00284 80B10AF4 87A30026 */  lh      $v1, 0x0026($sp)           
/* 00288 80B10AF8 86080210 */  lh      $t0, 0x0210($s0)           ## 00000210
/* 0028C 80B10AFC 8FA9002C */  lw      $t1, 0x002C($sp)           
/* 00290 80B10B00 3C020001 */  lui     $v0, 0x0001                ## $v0 = 00010000
/* 00294 80B10B04 1500002F */  bne     $t0, $zero, .L80B10BC4     
/* 00298 80B10B08 8FA4002C */  lw      $a0, 0x002C($sp)           
/* 0029C 80B10B0C 00491021 */  addu    $v0, $v0, $t1              
/* 002A0 80B10B10 904204BD */  lbu     $v0, 0x04BD($v0)           ## 000104BD
/* 002A4 80B10B14 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 002A8 80B10B18 3C0A8016 */  lui     $t2, %hi(gSaveContext+0x34)
/* 002AC 80B10B1C 10400005 */  beq     $v0, $zero, .L80B10B34     
/* 002B0 80B10B20 00000000 */  nop
/* 002B4 80B10B24 1041001B */  beq     $v0, $at, .L80B10B94       
/* 002B8 80B10B28 3C0F80B1 */  lui     $t7, %hi(D_80B11696)       ## $t7 = 80B10000
/* 002BC 80B10B2C 10000020 */  beq     $zero, $zero, .L80B10BB0   
/* 002C0 80B10B30 9605010E */  lhu     $a1, 0x010E($s0)           ## 0000010E
.L80B10B34:
/* 002C4 80B10B34 854AE694 */  lh      $t2, %lo(gSaveContext+0x34)($t2)
/* 002C8 80B10B38 240C0002 */  addiu   $t4, $zero, 0x0002         ## $t4 = 00000002
/* 002CC 80B10B3C 24030002 */  addiu   $v1, $zero, 0x0002         ## $v1 = 00000002
/* 002D0 80B10B40 29410014 */  slti    $at, $t2, 0x0014           
/* 002D4 80B10B44 54200008 */  bnel    $at, $zero, .L80B10B68     
/* 002D8 80B10B48 A60C0210 */  sh      $t4, 0x0210($s0)           ## 00000210
/* 002DC 80B10B4C 0C021CC3 */  jal     Rupees_ChangeBy              
/* 002E0 80B10B50 2404FFEC */  addiu   $a0, $zero, 0xFFEC         ## $a0 = FFFFFFEC
/* 002E4 80B10B54 240B0001 */  addiu   $t3, $zero, 0x0001         ## $t3 = 00000001
/* 002E8 80B10B58 A60B0210 */  sh      $t3, 0x0210($s0)           ## 00000210
/* 002EC 80B10B5C 10000002 */  beq     $zero, $zero, .L80B10B68   
/* 002F0 80B10B60 24030001 */  addiu   $v1, $zero, 0x0001         ## $v1 = 00000001
/* 002F4 80B10B64 A60C0210 */  sh      $t4, 0x0210($s0)           ## 00000210
.L80B10B68:
/* 002F8 80B10B68 86020210 */  lh      $v0, 0x0210($s0)           ## 00000210
/* 002FC 80B10B6C 3C0D80B1 */  lui     $t5, %hi(D_80B11690)       ## $t5 = 80B10000
/* 00300 80B10B70 3C0E80B1 */  lui     $t6, %hi(D_80B11698)       ## $t6 = 80B10000
/* 00304 80B10B74 00021040 */  sll     $v0, $v0,  1               
/* 00308 80B10B78 01A26821 */  addu    $t5, $t5, $v0              
/* 0030C 80B10B7C 85AD1690 */  lh      $t5, %lo(D_80B11690)($t5)  
/* 00310 80B10B80 01C27021 */  addu    $t6, $t6, $v0              
/* 00314 80B10B84 A60D010E */  sh      $t5, 0x010E($s0)           ## 0000010E
/* 00318 80B10B88 85CE1698 */  lh      $t6, %lo(D_80B11698)($t6)  
/* 0031C 80B10B8C 10000007 */  beq     $zero, $zero, .L80B10BAC   
/* 00320 80B10B90 A60E0212 */  sh      $t6, 0x0212($s0)           ## 00000212
.L80B10B94:
/* 00324 80B10B94 85EF1696 */  lh      $t7, %lo(D_80B11696)($t7)  
/* 00328 80B10B98 3C1880B1 */  lui     $t8, %hi(D_80B1169E)       ## $t8 = 80B10000
/* 0032C 80B10B9C 24030002 */  addiu   $v1, $zero, 0x0002         ## $v1 = 00000002
/* 00330 80B10BA0 A60F010E */  sh      $t7, 0x010E($s0)           ## 0000010E
/* 00334 80B10BA4 8718169E */  lh      $t8, %lo(D_80B1169E)($t8)  
/* 00338 80B10BA8 A6180212 */  sh      $t8, 0x0212($s0)           ## 00000212
.L80B10BAC:
/* 0033C 80B10BAC 9605010E */  lhu     $a1, 0x010E($s0)           ## 0000010E
.L80B10BB0:
/* 00340 80B10BB0 A7A30026 */  sh      $v1, 0x0026($sp)           
/* 00344 80B10BB4 0C042DC8 */  jal     func_8010B720              
/* 00348 80B10BB8 8FA4002C */  lw      $a0, 0x002C($sp)           
/* 0034C 80B10BBC 10000004 */  beq     $zero, $zero, .L80B10BD0   
/* 00350 80B10BC0 87A30026 */  lh      $v1, 0x0026($sp)           
.L80B10BC4:
/* 00354 80B10BC4 0C041B33 */  jal     func_80106CCC              
/* 00358 80B10BC8 A7A30026 */  sh      $v1, 0x0026($sp)           
/* 0035C 80B10BCC 87A30026 */  lh      $v1, 0x0026($sp)           
.L80B10BD0:
/* 00360 80B10BD0 10600009 */  beq     $v1, $zero, .L80B10BF8     
/* 00364 80B10BD4 3C1980B1 */  lui     $t9, %hi(func_80B109DC)    ## $t9 = 80B10000
/* 00368 80B10BD8 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 0036C 80B10BDC 10610009 */  beq     $v1, $at, .L80B10C04       
/* 00370 80B10BE0 3C0880B1 */  lui     $t0, %hi(func_80B10CD4)    ## $t0 = 80B10000
/* 00374 80B10BE4 24010002 */  addiu   $at, $zero, 0x0002         ## $at = 00000002
/* 00378 80B10BE8 10610009 */  beq     $v1, $at, .L80B10C10       
/* 0037C 80B10BEC 3C0980B1 */  lui     $t1, %hi(func_80B10C2C)    ## $t1 = 80B10000
/* 00380 80B10BF0 1000000A */  beq     $zero, $zero, .L80B10C1C   
/* 00384 80B10BF4 8FBF001C */  lw      $ra, 0x001C($sp)           
.L80B10BF8:
/* 00388 80B10BF8 273909DC */  addiu   $t9, $t9, %lo(func_80B109DC) ## $t9 = 80B109DC
/* 0038C 80B10BFC 10000006 */  beq     $zero, $zero, .L80B10C18   
/* 00390 80B10C00 AE1901FC */  sw      $t9, 0x01FC($s0)           ## 000001FC
.L80B10C04:
/* 00394 80B10C04 25080CD4 */  addiu   $t0, $t0, %lo(func_80B10CD4) ## $t0 = 80B10CD4
/* 00398 80B10C08 10000003 */  beq     $zero, $zero, .L80B10C18   
/* 0039C 80B10C0C AE0801FC */  sw      $t0, 0x01FC($s0)           ## 000001FC
.L80B10C10:
/* 003A0 80B10C10 25290C2C */  addiu   $t1, $t1, %lo(func_80B10C2C) ## $t1 = 80B10C2C
/* 003A4 80B10C14 AE0901FC */  sw      $t1, 0x01FC($s0)           ## 000001FC
.L80B10C18:
/* 003A8 80B10C18 8FBF001C */  lw      $ra, 0x001C($sp)           
.L80B10C1C:
/* 003AC 80B10C1C 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 003B0 80B10C20 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
/* 003B4 80B10C24 03E00008 */  jr      $ra                        
/* 003B8 80B10C28 00000000 */  nop
