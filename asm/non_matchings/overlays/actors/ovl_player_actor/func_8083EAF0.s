.late_rodata
glabel D_808553CC
    .float 1.1

.text
glabel func_8083EAF0
/* 0C8E0 8083EAF0 10A00012 */  beq     $a1, $zero, .L8083EB3C     
/* 0C8E4 8083EAF4 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
/* 0C8E8 8083EAF8 8CAE0004 */  lw      $t6, 0x0004($a1)           ## 00000004
/* 0C8EC 8083EAFC 3C018085 */  lui     $at, %hi(D_808553CC)       ## $at = 80850000
/* 0C8F0 8083EB00 000E7A00 */  sll     $t7, $t6,  8               
/* 0C8F4 8083EB04 05E0000D */  bltz    $t7, .L8083EB3C            
/* 0C8F8 8083EB08 00000000 */  nop
/* 0C8FC 8083EB0C C4840838 */  lwc1    $f4, 0x0838($a0)           ## 00000838
/* 0C900 8083EB10 C42653CC */  lwc1    $f6, %lo(D_808553CC)($at)  
/* 0C904 8083EB14 4606203C */  c.lt.s  $f4, $f6                   
/* 0C908 8083EB18 00000000 */  nop
/* 0C90C 8083EB1C 45010005 */  bc1t    .L8083EB34                 
/* 0C910 8083EB20 00000000 */  nop
/* 0C914 8083EB24 84B80000 */  lh      $t8, 0x0000($a1)           ## 00000000
/* 0C918 8083EB28 240100DA */  addiu   $at, $zero, 0x00DA         ## $at = 000000DA
/* 0C91C 8083EB2C 17010003 */  bne     $t8, $at, .L8083EB3C       
/* 0C920 8083EB30 00000000 */  nop
.L8083EB34:
/* 0C924 8083EB34 03E00008 */  jr      $ra                        
/* 0C928 8083EB38 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L8083EB3C:
/* 0C92C 8083EB3C 03E00008 */  jr      $ra                        
/* 0C930 8083EB40 00000000 */  nop
