glabel func_80A43F90
/* 01260 80A43F90 AFA50004 */  sw      $a1, 0x0004($sp)           
/* 01264 80A43F94 3C058016 */  lui     $a1, %hi(gSaveContext)
/* 01268 80A43F98 24A5E660 */  addiu   $a1, %lo(gSaveContext)
/* 0126C 80A43F9C 90AE003E */  lbu     $t6, 0x003E($a1)           ## 8015E69E
/* 01270 80A43FA0 8C831C44 */  lw      $v1, 0x1C44($a0)           ## 00001C44
/* 01274 80A43FA4 240F000F */  addiu   $t7, $zero, 0x000F         ## $t7 = 0000000F
/* 01278 80A43FA8 11C00004 */  beq     $t6, $zero, .L80A43FBC     
/* 0127C 80A43FAC 3C188012 */  lui     $t8, %hi(gItemSlots+0x2d)
/* 01280 80A43FB0 A06F0693 */  sb      $t7, 0x0693($v1)           ## 00000693
/* 01284 80A43FB4 03E00008 */  jr      $ra                        
/* 01288 80A43FB8 2402305E */  addiu   $v0, $zero, 0x305E         ## $v0 = 0000305E
.L80A43FBC:
/* 0128C 80A43FBC 93187491 */  lbu     $t8, %lo(gItemSlots+0x2d)($t8)
/* 01290 80A43FC0 2408000F */  addiu   $t0, $zero, 0x000F         ## $t0 = 0000000F
/* 01294 80A43FC4 00B8C821 */  addu    $t9, $a1, $t8              
/* 01298 80A43FC8 93220074 */  lbu     $v0, 0x0074($t9)           ## 00000074
/* 0129C 80A43FCC 28410037 */  slti    $at, $v0, 0x0037           
/* 012A0 80A43FD0 54200005 */  bnel    $at, $zero, .L80A43FE8     
/* 012A4 80A43FD4 28410034 */  slti    $at, $v0, 0x0034           
/* 012A8 80A43FD8 A0680693 */  sb      $t0, 0x0693($v1)           ## 00000693
/* 012AC 80A43FDC 03E00008 */  jr      $ra                        
/* 012B0 80A43FE0 2402305E */  addiu   $v0, $zero, 0x305E         ## $v0 = 0000305E
.L80A43FE4:
/* 012B4 80A43FE4 28410034 */  slti    $at, $v0, 0x0034           
.L80A43FE8:
/* 012B8 80A43FE8 14200005 */  bne     $at, $zero, .L80A44000     
/* 012BC 80A43FEC 240A000B */  addiu   $t2, $zero, 0x000B         ## $t2 = 0000000B
/* 012C0 80A43FF0 2409000E */  addiu   $t1, $zero, 0x000E         ## $t1 = 0000000E
/* 012C4 80A43FF4 A0690693 */  sb      $t1, 0x0693($v1)           ## 00000693
/* 012C8 80A43FF8 03E00008 */  jr      $ra                        
/* 012CC 80A43FFC 24023058 */  addiu   $v0, $zero, 0x3058         ## $v0 = 00003058
.L80A44000:
/* 012D0 80A44000 A06A0693 */  sb      $t2, 0x0693($v1)           ## 00000693
/* 012D4 80A44004 24023053 */  addiu   $v0, $zero, 0x3053         ## $v0 = 00003053
/* 012D8 80A44008 03E00008 */  jr      $ra                        
/* 012DC 80A4400C 00000000 */  nop
