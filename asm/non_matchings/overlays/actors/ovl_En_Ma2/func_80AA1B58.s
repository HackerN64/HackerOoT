glabel func_80AA1B58
/* 001B8 80AA1B58 3C068016 */  lui     $a2, %hi(gSaveContext)
/* 001BC 80AA1B5C 24C6E660 */  addiu   $a2, %lo(gSaveContext)
/* 001C0 80AA1B60 8CCE0004 */  lw      $t6, 0x0004($a2)           ## 8015E664
/* 001C4 80AA1B64 24030001 */  addiu   $v1, $zero, 0x0001         ## $v1 = 00000001
/* 001C8 80AA1B68 546E0004 */  bnel    $v1, $t6, .L80AA1B7C       
/* 001CC 80AA1B6C 94C20ED6 */  lhu     $v0, 0x0ED6($a2)           ## 8015F536
/* 001D0 80AA1B70 03E00008 */  jr      $ra                        
/* 001D4 80AA1B74 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L80AA1B78:
/* 001D8 80AA1B78 94C20ED6 */  lhu     $v0, 0x0ED6($a2)           ## 8015F536
.L80AA1B7C:
/* 001DC 80AA1B7C 30420100 */  andi    $v0, $v0, 0x0100           ## $v0 = 00000000
/* 001E0 80AA1B80 1440000E */  bne     $v0, $zero, .L80AA1BBC     
/* 001E4 80AA1B84 00000000 */  nop
/* 001E8 80AA1B88 84AF00A4 */  lh      $t7, 0x00A4($a1)           ## 000000A4
/* 001EC 80AA1B8C 24010036 */  addiu   $at, $zero, 0x0036         ## $at = 00000036
/* 001F0 80AA1B90 15E1000A */  bne     $t7, $at, .L80AA1BBC       
/* 001F4 80AA1B94 00000000 */  nop
/* 001F8 80AA1B98 8CD80010 */  lw      $t8, 0x0010($a2)           ## 8015E670
/* 001FC 80AA1B9C 17000007 */  bne     $t8, $zero, .L80AA1BBC     
/* 00200 80AA1BA0 00000000 */  nop
/* 00204 80AA1BA4 849900B8 */  lh      $t9, 0x00B8($a0)           ## 000000B8
/* 00208 80AA1BA8 24010005 */  addiu   $at, $zero, 0x0005         ## $at = 00000005
/* 0020C 80AA1BAC 17210003 */  bne     $t9, $at, .L80AA1BBC       
/* 00210 80AA1BB0 00000000 */  nop
/* 00214 80AA1BB4 03E00008 */  jr      $ra                        
/* 00218 80AA1BB8 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
.L80AA1BBC:
/* 0021C 80AA1BBC 1440000E */  bne     $v0, $zero, .L80AA1BF8     
/* 00220 80AA1BC0 00000000 */  nop
/* 00224 80AA1BC4 84A800A4 */  lh      $t0, 0x00A4($a1)           ## 000000A4
/* 00228 80AA1BC8 24010063 */  addiu   $at, $zero, 0x0063         ## $at = 00000063
/* 0022C 80AA1BCC 1501000A */  bne     $t0, $at, .L80AA1BF8       
/* 00230 80AA1BD0 00000000 */  nop
/* 00234 80AA1BD4 8CC90010 */  lw      $t1, 0x0010($a2)           ## 8015E670
/* 00238 80AA1BD8 14690007 */  bne     $v1, $t1, .L80AA1BF8       
/* 0023C 80AA1BDC 00000000 */  nop
/* 00240 80AA1BE0 848A00B8 */  lh      $t2, 0x00B8($a0)           ## 000000B8
/* 00244 80AA1BE4 24010006 */  addiu   $at, $zero, 0x0006         ## $at = 00000006
/* 00248 80AA1BE8 15410003 */  bne     $t2, $at, .L80AA1BF8       
/* 0024C 80AA1BEC 00000000 */  nop
/* 00250 80AA1BF0 03E00008 */  jr      $ra                        
/* 00254 80AA1BF4 24020002 */  addiu   $v0, $zero, 0x0002         ## $v0 = 00000002
.L80AA1BF8:
/* 00258 80AA1BF8 10400005 */  beq     $v0, $zero, .L80AA1C10     
/* 0025C 80AA1BFC 00000000 */  nop
/* 00260 80AA1C00 84AB00A4 */  lh      $t3, 0x00A4($a1)           ## 000000A4
/* 00264 80AA1C04 24010063 */  addiu   $at, $zero, 0x0063         ## $at = 00000063
/* 00268 80AA1C08 51610004 */  beql    $t3, $at, .L80AA1C1C       
/* 0026C 80AA1C0C 848200B8 */  lh      $v0, 0x00B8($a0)           ## 000000B8
.L80AA1C10:
/* 00270 80AA1C10 03E00008 */  jr      $ra                        
/* 00274 80AA1C14 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L80AA1C18:
/* 00278 80AA1C18 848200B8 */  lh      $v0, 0x00B8($a0)           ## 000000B8
.L80AA1C1C:
/* 0027C 80AA1C1C 24010007 */  addiu   $at, $zero, 0x0007         ## $at = 00000007
/* 00280 80AA1C20 54410007 */  bnel    $v0, $at, .L80AA1C40       
/* 00284 80AA1C24 24010008 */  addiu   $at, $zero, 0x0008         ## $at = 00000008
/* 00288 80AA1C28 8CCC0010 */  lw      $t4, 0x0010($a2)           ## 8015E670
/* 0028C 80AA1C2C 55800004 */  bnel    $t4, $zero, .L80AA1C40     
/* 00290 80AA1C30 24010008 */  addiu   $at, $zero, 0x0008         ## $at = 00000008
/* 00294 80AA1C34 03E00008 */  jr      $ra                        
/* 00298 80AA1C38 24020003 */  addiu   $v0, $zero, 0x0003         ## $v0 = 00000003
.L80AA1C3C:
/* 0029C 80AA1C3C 24010008 */  addiu   $at, $zero, 0x0008         ## $at = 00000008
.L80AA1C40:
/* 002A0 80AA1C40 54410007 */  bnel    $v0, $at, .L80AA1C60       
/* 002A4 80AA1C44 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
/* 002A8 80AA1C48 8CCD0010 */  lw      $t5, 0x0010($a2)           ## 8015E670
/* 002AC 80AA1C4C 546D0004 */  bnel    $v1, $t5, .L80AA1C60       
/* 002B0 80AA1C50 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
/* 002B4 80AA1C54 03E00008 */  jr      $ra                        
/* 002B8 80AA1C58 24020003 */  addiu   $v0, $zero, 0x0003         ## $v0 = 00000003
.L80AA1C5C:
/* 002BC 80AA1C5C 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L80AA1C60:
/* 002C0 80AA1C60 03E00008 */  jr      $ra                        
/* 002C4 80AA1C64 00000000 */  nop
