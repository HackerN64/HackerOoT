glabel func_80AA1150
/* 00AC0 80AA1150 8CA21C44 */  lw      $v0, 0x1C44($a1)           ## 00001C44
/* 00AC4 80AA1154 3C010080 */  lui     $at, 0x0080                ## $at = 00800000
/* 00AC8 80AA1158 3C180001 */  lui     $t8, 0x0001                ## $t8 = 00010000
/* 00ACC 80AA115C 8C4E0680 */  lw      $t6, 0x0680($v0)           ## 00000680
/* 00AD0 80AA1160 0305C021 */  addu    $t8, $t8, $a1              
/* 00AD4 80AA1164 24190157 */  addiu   $t9, $zero, 0x0157         ## $t9 = 00000157
/* 00AD8 80AA1168 01C17825 */  or      $t7, $t6, $at              ## $t7 = 00800000
/* 00ADC 80AA116C AC4F0680 */  sw      $t7, 0x0680($v0)           ## 00000680
/* 00AE0 80AA1170 971804C6 */  lhu     $t8, 0x04C6($t8)           ## 000104C6
/* 00AE4 80AA1174 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
/* 00AE8 80AA1178 3408FFF1 */  ori     $t0, $zero, 0xFFF1         ## $t0 = 0000FFF1
/* 00AEC 80AA117C 17010010 */  bne     $t8, $at, .L80AA11C0       
/* 00AF0 80AA1180 2409002A */  addiu   $t1, $zero, 0x002A         ## $t1 = 0000002A
/* 00AF4 80AA1184 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 00AF8 80AA1188 00250821 */  addu    $at, $at, $a1              
/* 00AFC 80AA118C A4391E1A */  sh      $t9, 0x1E1A($at)           ## 00011E1A
/* 00B00 80AA1190 3C018016 */  lui     $at, %hi(gSaveContext+0x1412)
/* 00B04 80AA1194 A428FA72 */  sh      $t0, %lo(gSaveContext+0x1412)($at)
/* 00B08 80AA1198 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 00B0C 80AA119C 00250821 */  addu    $at, $at, $a1              
/* 00B10 80AA11A0 A0291E5E */  sb      $t1, 0x1E5E($at)           ## 00011E5E
/* 00B14 80AA11A4 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 00B18 80AA11A8 00250821 */  addu    $at, $at, $a1              
/* 00B1C 80AA11AC 240A0014 */  addiu   $t2, $zero, 0x0014         ## $t2 = 00000014
/* 00B20 80AA11B0 3C0B80AA */  lui     $t3, %hi(func_80AA11C8)    ## $t3 = 80AA0000
/* 00B24 80AA11B4 A02A1E15 */  sb      $t2, 0x1E15($at)           ## 00011E15
/* 00B28 80AA11B8 256B11C8 */  addiu   $t3, $t3, %lo(func_80AA11C8) ## $t3 = 80AA11C8
/* 00B2C 80AA11BC AC8B0190 */  sw      $t3, 0x0190($a0)           ## 00000190
.L80AA11C0:
/* 00B30 80AA11C0 03E00008 */  jr      $ra                        
/* 00B34 80AA11C4 00000000 */  nop
