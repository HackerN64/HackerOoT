glabel func_80A98B04
/* 01D54 80A98B04 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 01D58 80A98B08 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 01D5C 80A98B0C 8C490004 */  lw      $t1, 0x0004($v0)           ## 8015E664
/* 01D60 80A98B10 3C0A8012 */  lui     $t2, %hi(gBitFlags)
/* 01D64 80A98B14 1520000F */  bne     $t1, $zero, .L80A98B54     
/* 01D68 80A98B18 00000000 */  nop
/* 01D6C 80A98B1C 8D4A7120 */  lw      $t2, %lo(gBitFlags)($t2)
/* 01D70 80A98B20 8C4B00A4 */  lw      $t3, 0x00A4($v0)           ## 8015E704
/* 01D74 80A98B24 014B6024 */  and     $t4, $t2, $t3              
/* 01D78 80A98B28 1580000A */  bne     $t4, $zero, .L80A98B54     
/* 01D7C 80A98B2C 00000000 */  nop
/* 01D80 80A98B30 848D001C */  lh      $t5, 0x001C($a0)           ## 0000001C
/* 01D84 80A98B34 24010006 */  addiu   $at, $zero, 0x0006         ## $at = 00000006
/* 01D88 80A98B38 31AE00FF */  andi    $t6, $t5, 0x00FF           ## $t6 = 00000000
/* 01D8C 80A98B3C 11C10003 */  beq     $t6, $at, .L80A98B4C       
/* 01D90 80A98B40 00000000 */  nop
/* 01D94 80A98B44 03E00008 */  jr      $ra                        
/* 01D98 80A98B48 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L80A98B4C:
/* 01D9C 80A98B4C 03E00008 */  jr      $ra                        
/* 01DA0 80A98B50 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
.L80A98B54:
/* 01DA4 80A98B54 03E00008 */  jr      $ra                        
/* 01DA8 80A98B58 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
