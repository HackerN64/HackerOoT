glabel func_80A46D5C
/* 0402C 80A46D5C 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 04030 80A46D60 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 04034 80A46D64 AFA5001C */  sw      $a1, 0x001C($sp)           
/* 04038 80A46D68 00803025 */  or      $a2, $a0, $zero            ## $a2 = 00000000
/* 0403C 80A46D6C 8CC5015C */  lw      $a1, 0x015C($a2)           ## 0000015C
/* 04040 80A46D70 AFA60018 */  sw      $a2, 0x0018($sp)           
/* 04044 80A46D74 0C0295B2 */  jal     Animation_OnFrame              
/* 04048 80A46D78 2484014C */  addiu   $a0, $a0, 0x014C           ## $a0 = 0000014C
/* 0404C 80A46D7C 1040000B */  beq     $v0, $zero, .L80A46DAC     
/* 04050 80A46D80 8FA60018 */  lw      $a2, 0x0018($sp)           
/* 04054 80A46D84 00C02025 */  or      $a0, $a2, $zero            ## $a0 = 00000000
/* 04058 80A46D88 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 0405C 80A46D8C 0C2916C5 */  jal     func_80A45B14              
/* 04060 80A46D90 AFA60018 */  sw      $a2, 0x0018($sp)           
/* 04064 80A46D94 8FA40018 */  lw      $a0, 0x0018($sp)           
/* 04068 80A46D98 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 0406C 80A46D9C 00000000 */  nop
/* 04070 80A46DA0 E4840168 */  swc1    $f4, 0x0168($a0)           ## 00000168
/* 04074 80A46DA4 0C291769 */  jal     func_80A45DA4              
/* 04078 80A46DA8 8FA5001C */  lw      $a1, 0x001C($sp)           
.L80A46DAC:
/* 0407C 80A46DAC 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 04080 80A46DB0 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 04084 80A46DB4 03E00008 */  jr      $ra                        
/* 04088 80A46DB8 00000000 */  nop
