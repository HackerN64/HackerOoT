glabel func_80A31A5C
/* 010EC 80A31A5C 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 010F0 80A31A60 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 010F4 80A31A64 AFA5002C */  sw      $a1, 0x002C($sp)           
/* 010F8 80A31A68 0C00BCCD */  jal     func_8002F334              
/* 010FC 80A31A6C AFA40028 */  sw      $a0, 0x0028($sp)           
/* 01100 80A31A70 10400009 */  beq     $v0, $zero, .L80A31A98     
/* 01104 80A31A74 8FA40028 */  lw      $a0, 0x0028($sp)           
/* 01108 80A31A78 8C8E0004 */  lw      $t6, 0x0004($a0)           ## 00000004
/* 0110C 80A31A7C 3C01FFFE */  lui     $at, 0xFFFE                ## $at = FFFE0000
/* 01110 80A31A80 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = FFFEFFFF
/* 01114 80A31A84 3C1880A3 */  lui     $t8, %hi(func_80A3196C)    ## $t8 = 80A30000
/* 01118 80A31A88 2718196C */  addiu   $t8, $t8, %lo(func_80A3196C) ## $t8 = 80A3196C
/* 0111C 80A31A8C 01C17824 */  and     $t7, $t6, $at              
/* 01120 80A31A90 AC8F0004 */  sw      $t7, 0x0004($a0)           ## 00000004
/* 01124 80A31A94 AC9802B4 */  sw      $t8, 0x02B4($a0)           ## 000002B4
.L80A31A98:
/* 01128 80A31A98 949902AC */  lhu     $t9, 0x02AC($a0)           ## 000002AC
/* 0112C 80A31A9C 2406003E */  addiu   $a2, $zero, 0x003E         ## $a2 = 0000003E
/* 01130 80A31AA0 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 01134 80A31AA4 33280002 */  andi    $t0, $t9, 0x0002           ## $t0 = 00000000
/* 01138 80A31AA8 11000014 */  beq     $t0, $zero, .L80A31AFC     
/* 0113C 80A31AAC 3C07461C */  lui     $a3, 0x461C                ## $a3 = 461C0000
/* 01140 80A31AB0 3C098016 */  lui     $t1, %hi(gSaveContext+0xa0)
/* 01144 80A31AB4 3C0A8012 */  lui     $t2, %hi(gUpgradeMasks)
/* 01148 80A31AB8 8D4A71B0 */  lw      $t2, %lo(gUpgradeMasks)($t2)
/* 0114C 80A31ABC 8D29E700 */  lw      $t1, %lo(gSaveContext+0xa0)($t1)
/* 01150 80A31AC0 3C0C8012 */  lui     $t4, %hi(gUpgradeShifts)
/* 01154 80A31AC4 918C71F4 */  lbu     $t4, %lo(gUpgradeShifts)($t4)
/* 01158 80A31AC8 012A5824 */  and     $t3, $t1, $t2              
/* 0115C 80A31ACC 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 01160 80A31AD0 018B1007 */  srav    $v0, $t3, $t4              
/* 01164 80A31AD4 10410005 */  beq     $v0, $at, .L80A31AEC       
/* 01168 80A31AD8 24010002 */  addiu   $at, $zero, 0x0002         ## $at = 00000002
/* 0116C 80A31ADC 10410005 */  beq     $v0, $at, .L80A31AF4       
/* 01170 80A31AE0 00000000 */  nop
/* 01174 80A31AE4 10000005 */  beq     $zero, $zero, .L80A31AFC   
/* 01178 80A31AE8 8FA60024 */  lw      $a2, 0x0024($sp)           
.L80A31AEC:
/* 0117C 80A31AEC 10000003 */  beq     $zero, $zero, .L80A31AFC   
/* 01180 80A31AF0 24060030 */  addiu   $a2, $zero, 0x0030         ## $a2 = 00000030
.L80A31AF4:
/* 01184 80A31AF4 10000001 */  beq     $zero, $zero, .L80A31AFC   
/* 01188 80A31AF8 24060031 */  addiu   $a2, $zero, 0x0031         ## $a2 = 00000031
.L80A31AFC:
/* 0118C 80A31AFC 3C014248 */  lui     $at, 0x4248                ## $at = 42480000
/* 01190 80A31B00 44812000 */  mtc1    $at, $f4                   ## $f4 = 50.00
/* 01194 80A31B04 34E74000 */  ori     $a3, $a3, 0x4000           ## $a3 = 461C4000
/* 01198 80A31B08 0C00BD0D */  jal     func_8002F434              
/* 0119C 80A31B0C E7A40010 */  swc1    $f4, 0x0010($sp)           
/* 011A0 80A31B10 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 011A4 80A31B14 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
/* 011A8 80A31B18 03E00008 */  jr      $ra                        
/* 011AC 80A31B1C 00000000 */  nop
