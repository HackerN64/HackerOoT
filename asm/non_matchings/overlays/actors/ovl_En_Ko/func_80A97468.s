glabel func_80A97468
/* 006B8 80A97468 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 006BC 80A9746C 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 006C0 80A97470 3C0D8012 */  lui     $t5, %hi(gBitFlags)
/* 006C4 80A97474 8DAD7120 */  lw      $t5, %lo(gBitFlags)($t5)
/* 006C8 80A97478 8C4E00A4 */  lw      $t6, 0x00A4($v0)           ## 8015E704
/* 006CC 80A9747C 01AE7824 */  and     $t7, $t5, $t6              
/* 006D0 80A97480 11E00003 */  beq     $t7, $zero, .L80A97490     
/* 006D4 80A97484 00000000 */  nop
/* 006D8 80A97488 03E00008 */  jr      $ra                        
/* 006DC 80A9748C 24021076 */  addiu   $v0, $zero, 0x1076         ## $v0 = 00001076
.L80A97490:
/* 006E0 80A97490 03E00008 */  jr      $ra                        
/* 006E4 80A97494 2402105F */  addiu   $v0, $zero, 0x105F         ## $v0 = 0000105F
glabel L80A97498
/* 006E8 80A97498 03E00008 */  jr      $ra                        
/* 006EC 80A9749C 24021057 */  addiu   $v0, $zero, 0x1057         ## $v0 = 00001057
