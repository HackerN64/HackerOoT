.late_rodata
glabel D_80AC9608
    .float 0.15

.text
glabel func_80AC652C
/* 0388C 80AC652C 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 03890 80AC6530 AFB00018 */  sw      $s0, 0x0018($sp)           
/* 03894 80AC6534 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 03898 80AC6538 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 0389C 80AC653C 3C073E19 */  lui     $a3, 0x3E19                ## $a3 = 3E190000
/* 038A0 80AC6540 34E7999A */  ori     $a3, $a3, 0x999A           ## $a3 = 3E19999A
/* 038A4 80AC6544 248402D0 */  addiu   $a0, $a0, 0x02D0           ## $a0 = 000002D0
/* 038A8 80AC6548 24050000 */  addiu   $a1, $zero, 0x0000         ## $a1 = 00000000
/* 038AC 80AC654C 0C01E107 */  jal     Math_ApproachF
              
/* 038B0 80AC6550 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 038B4 80AC6554 3C0180AD */  lui     $at, %hi(D_80AC9608)       ## $at = 80AD0000
/* 038B8 80AC6558 C4249608 */  lwc1    $f4, %lo(D_80AC9608)($at)  
/* 038BC 80AC655C C60602D0 */  lwc1    $f6, 0x02D0($s0)           ## 000002D0
/* 038C0 80AC6560 4604303E */  c.le.s  $f6, $f4                   
/* 038C4 80AC6564 00000000 */  nop
/* 038C8 80AC6568 45000004 */  bc1f    .L80AC657C                 
/* 038CC 80AC656C 00000000 */  nop
/* 038D0 80AC6570 44804000 */  mtc1    $zero, $f8                 ## $f8 = 0.00
/* 038D4 80AC6574 00000000 */  nop
/* 038D8 80AC6578 E60802D0 */  swc1    $f8, 0x02D0($s0)           ## 000002D0
.L80AC657C:
/* 038DC 80AC657C 0C2B18E1 */  jal     func_80AC6384              
/* 038E0 80AC6580 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 038E4 80AC6584 44805000 */  mtc1    $zero, $f10                ## $f10 = 0.00
/* 038E8 80AC6588 C61002D0 */  lwc1    $f16, 0x02D0($s0)          ## 000002D0
/* 038EC 80AC658C 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 038F0 80AC6590 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
/* 038F4 80AC6594 46105032 */  c.eq.s  $f10, $f16                 
/* 038F8 80AC6598 00000000 */  nop
/* 038FC 80AC659C 45000003 */  bc1f    .L80AC65AC                 
/* 03900 80AC65A0 00000000 */  nop
/* 03904 80AC65A4 10000001 */  beq     $zero, $zero, .L80AC65AC   
/* 03908 80AC65A8 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
.L80AC65AC:
/* 0390C 80AC65AC 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 03910 80AC65B0 03E00008 */  jr      $ra                        
/* 03914 80AC65B4 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
