glabel func_80A97068
/* 002B8 80A97068 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 002BC 80A9706C 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 002C0 80A97070 944D0EDC */  lhu     $t5, 0x0EDC($v0)           ## 8015F53C
/* 002C4 80A97074 3C0F8012 */  lui     $t7, %hi(gBitFlags+0x48)
/* 002C8 80A97078 31AE0001 */  andi    $t6, $t5, 0x0001           ## $t6 = 00000000
/* 002CC 80A9707C 11C00003 */  beq     $t6, $zero, .L80A9708C     
/* 002D0 80A97080 00000000 */  nop
/* 002D4 80A97084 03E00008 */  jr      $ra                        
/* 002D8 80A97088 24021025 */  addiu   $v0, $zero, 0x1025         ## $v0 = 00001025
.L80A9708C:
/* 002DC 80A9708C 8DEF7168 */  lw      $t7, %lo(gBitFlags+0x48)($t7)
/* 002E0 80A97090 8C5800A4 */  lw      $t8, 0x00A4($v0)           ## 000010C9
/* 002E4 80A97094 01F8C824 */  and     $t9, $t7, $t8              
/* 002E8 80A97098 13200003 */  beq     $t9, $zero, .L80A970A8     
/* 002EC 80A9709C 00000000 */  nop
/* 002F0 80A970A0 03E00008 */  jr      $ra                        
/* 002F4 80A970A4 24021042 */  addiu   $v0, $zero, 0x1042         ## $v0 = 00001042
.L80A970A8:
/* 002F8 80A970A8 03E00008 */  jr      $ra                        
/* 002FC 80A970AC 24021004 */  addiu   $v0, $zero, 0x1004         ## $v0 = 00001004
