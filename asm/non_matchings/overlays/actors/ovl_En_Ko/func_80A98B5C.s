glabel func_80A98B5C
/* 01DAC 80A98B5C 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 01DB0 80A98B60 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 01DB4 80A98B64 8C4F0004 */  lw      $t7, 0x0004($v0)           ## 8015E664
/* 01DB8 80A98B68 3C188012 */  lui     $t8, %hi(gBitFlags)
/* 01DBC 80A98B6C 55E00012 */  bnel    $t7, $zero, .L80A98BB8     
/* 01DC0 80A98B70 8489001C */  lh      $t1, 0x001C($a0)           ## 0000001C
/* 01DC4 80A98B74 8F187120 */  lw      $t8, %lo(gBitFlags)($t8)
/* 01DC8 80A98B78 8C5900A4 */  lw      $t9, 0x00A4($v0)           ## 8015E704
/* 01DCC 80A98B7C 03194024 */  and     $t0, $t8, $t9              
/* 01DD0 80A98B80 5500000D */  bnel    $t0, $zero, .L80A98BB8     
/* 01DD4 80A98B84 8489001C */  lh      $t1, 0x001C($a0)           ## 0000001C
/* 01DD8 80A98B88 8482001C */  lh      $v0, 0x001C($a0)           ## 0000001C
/* 01DDC 80A98B8C 24010005 */  addiu   $at, $zero, 0x0005         ## $at = 00000005
/* 01DE0 80A98B90 304200FF */  andi    $v0, $v0, 0x00FF           ## $v0 = 00000060
/* 01DE4 80A98B94 10410005 */  beq     $v0, $at, .L80A98BAC       
/* 01DE8 80A98B98 2401000A */  addiu   $at, $zero, 0x000A         ## $at = 0000000A
/* 01DEC 80A98B9C 10410003 */  beq     $v0, $at, .L80A98BAC       
/* 01DF0 80A98BA0 00000000 */  nop
/* 01DF4 80A98BA4 03E00008 */  jr      $ra                        
/* 01DF8 80A98BA8 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L80A98BAC:
/* 01DFC 80A98BAC 03E00008 */  jr      $ra                        
/* 01E00 80A98BB0 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
.L80A98BB4:
/* 01E04 80A98BB4 8489001C */  lh      $t1, 0x001C($a0)           ## 0000001C
.L80A98BB8:
/* 01E08 80A98BB8 2401000A */  addiu   $at, $zero, 0x000A         ## $at = 0000000A
/* 01E0C 80A98BBC 312A00FF */  andi    $t2, $t1, 0x00FF           ## $t2 = 00000000
/* 01E10 80A98BC0 11410003 */  beq     $t2, $at, .L80A98BD0       
/* 01E14 80A98BC4 00000000 */  nop
/* 01E18 80A98BC8 03E00008 */  jr      $ra                        
/* 01E1C 80A98BCC 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L80A98BD0:
/* 01E20 80A98BD0 03E00008 */  jr      $ra                        
/* 01E24 80A98BD4 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
.L80A98BD8:
/* 01E28 80A98BD8 916B7491 */  lbu     $t3, %lo(gItemSlots+0x2d)($t3)
/* 01E2C 80A98BDC 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 01E30 80A98BE0 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 01E34 80A98BE4 004B6021 */  addu    $t4, $v0, $t3              
/* 01E38 80A98BE8 918D0074 */  lbu     $t5, 0x0074($t4)           ## 00000074
/* 01E3C 80A98BEC 24010031 */  addiu   $at, $zero, 0x0031         ## $at = 00000031
/* 01E40 80A98BF0 00001825 */  or      $v1, $zero, $zero          ## $v1 = 00000000
/* 01E44 80A98BF4 15A10003 */  bne     $t5, $at, .L80A98C04       
/* 01E48 80A98BF8 00000000 */  nop
/* 01E4C 80A98BFC 03E00008 */  jr      $ra                        
/* 01E50 80A98C00 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
.L80A98C04:
/* 01E54 80A98C04 03E00008 */  jr      $ra                        
/* 01E58 80A98C08 00601025 */  or      $v0, $v1, $zero            ## $v0 = 00000000
glabel L80A98C0C
.L80A98C0C:
/* 01E5C 80A98C0C 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L80A98C10:
/* 01E60 80A98C10 03E00008 */  jr      $ra                        
/* 01E64 80A98C14 00000000 */  nop
