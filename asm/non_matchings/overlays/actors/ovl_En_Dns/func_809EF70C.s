glabel func_809EF70C
/* 003BC 809EF70C 8C8F02C0 */  lw      $t7, 0x02C0($a0)           ## 000002C0
/* 003C0 809EF710 3C0E8016 */  lui     $t6, %hi(gSaveContext+0x34)
/* 003C4 809EF714 85CEE694 */  lh      $t6, %lo(gSaveContext+0x34)($t6)
/* 003C8 809EF718 85F80000 */  lh      $t8, 0x0000($t7)           ## 00000000
/* 003CC 809EF71C 24020004 */  addiu   $v0, $zero, 0x0004         ## $v0 = 00000004
/* 003D0 809EF720 01D8082A */  slt     $at, $t6, $t8              
/* 003D4 809EF724 10200003 */  beq     $at, $zero, .L809EF734     
/* 003D8 809EF728 00000000 */  nop
/* 003DC 809EF72C 03E00008 */  jr      $ra                        
/* 003E0 809EF730 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L809EF734:
/* 003E4 809EF734 03E00008 */  jr      $ra                        
/* 003E8 809EF738 00000000 */  nop
