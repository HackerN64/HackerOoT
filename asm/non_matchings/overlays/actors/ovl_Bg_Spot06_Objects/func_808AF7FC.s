glabel func_808AF7FC
/* 0107C 808AF7FC 3C0E8016 */  lui     $t6, %hi(gSaveContext+0xee0)
/* 01080 808AF800 95CEF540 */  lhu     $t6, %lo(gSaveContext+0xee0)($t6)
/* 01084 808AF804 3C18808B */  lui     $t8, %hi(func_808AF824)    ## $t8 = 808B0000
/* 01088 808AF808 AFA50004 */  sw      $a1, 0x0004($sp)           
/* 0108C 808AF80C 31CF0200 */  andi    $t7, $t6, 0x0200           ## $t7 = 00000000
/* 01090 808AF810 11E00002 */  beq     $t7, $zero, .L808AF81C     
/* 01094 808AF814 2718F824 */  addiu   $t8, $t8, %lo(func_808AF824) ## $t8 = 808AF824
/* 01098 808AF818 AC980164 */  sw      $t8, 0x0164($a0)           ## 00000164
.L808AF81C:
/* 0109C 808AF81C 03E00008 */  jr      $ra                        
/* 010A0 808AF820 00000000 */  nop
