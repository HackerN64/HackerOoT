glabel func_80B9E748
/* 01538 80B9E748 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 0153C 80B9E74C AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 01540 80B9E750 00803825 */  or      $a3, $a0, $zero            ## $a3 = 00000000
/* 01544 80B9E754 84EE001C */  lh      $t6, 0x001C($a3)           ## 0000001C
/* 01548 80B9E758 00A02025 */  or      $a0, $a1, $zero            ## $a0 = 00000000
/* 0154C 80B9E75C 3C0580BA */  lui     $a1, %hi(D_80B9ED88)       ## $a1 = 80BA0000
/* 01550 80B9E760 000E7903 */  sra     $t7, $t6,  4               
/* 01554 80B9E764 31F80007 */  andi    $t8, $t7, 0x0007           ## $t8 = 00000000
/* 01558 80B9E768 0018C880 */  sll     $t9, $t8,  2               
/* 0155C 80B9E76C 00B92821 */  addu    $a1, $a1, $t9              
/* 01560 80B9E770 0C00D498 */  jal     Gfx_DrawDListOpa
              
/* 01564 80B9E774 8CA5ED88 */  lw      $a1, %lo(D_80B9ED88)($a1)  
/* 01568 80B9E778 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 0156C 80B9E77C 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 01570 80B9E780 03E00008 */  jr      $ra                        
/* 01574 80B9E784 00000000 */  nop
