glabel func_80B010C4
/* 02E14 80B010C4 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 02E18 80B010C8 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 02E1C 80B010CC AFA50024 */  sw      $a1, 0x0024($sp)           
/* 02E20 80B010D0 0C00BD04 */  jal     Actor_HasParent              
/* 02E24 80B010D4 AFA40020 */  sw      $a0, 0x0020($sp)           
/* 02E28 80B010D8 10400006 */  beq     $v0, $zero, .L80B010F4     
/* 02E2C 80B010DC 8FA40020 */  lw      $a0, 0x0020($sp)           
/* 02E30 80B010E0 3C0E80B0 */  lui     $t6, %hi(func_80B01134)    ## $t6 = 80B00000
/* 02E34 80B010E4 25CE1134 */  addiu   $t6, $t6, %lo(func_80B01134) ## $t6 = 80B01134
/* 02E38 80B010E8 AC800118 */  sw      $zero, 0x0118($a0)         ## 00000118
/* 02E3C 80B010EC 1000000D */  beq     $zero, $zero, .L80B01124   
/* 02E40 80B010F0 AC8E0274 */  sw      $t6, 0x0274($a0)           ## 00000274
.L80B010F4:
/* 02E44 80B010F4 3C0F8016 */  lui     $t7, %hi(gSaveContext+0x3f)
/* 02E48 80B010F8 91EFE69F */  lbu     $t7, %lo(gSaveContext+0x3f)($t7)
/* 02E4C 80B010FC 3C0141D0 */  lui     $at, 0x41D0                ## $at = 41D00000
/* 02E50 80B01100 44810000 */  mtc1    $at, $f0                   ## $f0 = 26.00
/* 02E54 80B01104 3C0680B0 */  lui     $a2, %hi(D_80B016C4)       ## $a2 = 80B00000
/* 02E58 80B01108 000FC080 */  sll     $t8, $t7,  2               
/* 02E5C 80B0110C 00D83021 */  addu    $a2, $a2, $t8              
/* 02E60 80B01110 44070000 */  mfc1    $a3, $f0                   
/* 02E64 80B01114 8CC616C4 */  lw      $a2, %lo(D_80B016C4)($a2)  
/* 02E68 80B01118 8FA50024 */  lw      $a1, 0x0024($sp)           
/* 02E6C 80B0111C 0C00BD0D */  jal     func_8002F434              
/* 02E70 80B01120 E7A00010 */  swc1    $f0, 0x0010($sp)           
.L80B01124:
/* 02E74 80B01124 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 02E78 80B01128 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
/* 02E7C 80B0112C 03E00008 */  jr      $ra                        
/* 02E80 80B01130 00000000 */  nop
