glabel func_80AA0EFC
/* 0086C 80AA0EFC 848E01E8 */  lh      $t6, 0x01E8($a0)           ## 000001E8
/* 00870 80AA0F00 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
/* 00874 80AA0F04 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00878 80AA0F08 15C1000C */  bne     $t6, $at, .L80AA0F3C       
/* 0087C 80AA0F0C 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00880 80AA0F10 3C0F80AA */  lui     $t7, %hi(func_80AA0D88)    ## $t7 = 80AA0000
/* 00884 80AA0F14 25EF0D88 */  addiu   $t7, $t7, %lo(func_80AA0D88) ## $t7 = 80AA0D88
/* 00888 80AA0F18 A48001E8 */  sh      $zero, 0x01E8($a0)         ## 000001E8
/* 0088C 80AA0F1C AC8F0190 */  sw      $t7, 0x0190($a0)           ## 00000190
/* 00890 80AA0F20 94580ED6 */  lhu     $t8, 0x0ED6($v0)           ## 8015F536
/* 00894 80AA0F24 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 00898 80AA0F28 00250821 */  addu    $at, $at, $a1              
/* 0089C 80AA0F2C 37190004 */  ori     $t9, $t8, 0x0004           ## $t9 = 00000004
/* 008A0 80AA0F30 A4590ED6 */  sh      $t9, 0x0ED6($v0)           ## 8015F536
/* 008A4 80AA0F34 24080036 */  addiu   $t0, $zero, 0x0036         ## $t0 = 00000036
/* 008A8 80AA0F38 A02803DC */  sb      $t0, 0x03DC($at)           ## 000103DC
.L80AA0F3C:
/* 008AC 80AA0F3C 03E00008 */  jr      $ra                        
/* 008B0 80AA0F40 00000000 */  nop
