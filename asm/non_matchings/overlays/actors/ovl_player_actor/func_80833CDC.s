glabel func_80833CDC
/* 01ACC 80833CDC 28A10004 */  slti    $at, $a1, 0x0004           
/* 01AD0 80833CE0 14200003 */  bne     $at, $zero, .L80833CF0     
/* 01AD4 80833CE4 3C020001 */  lui     $v0, 0x0001                ## $v0 = 00010000
/* 01AD8 80833CE8 03E00008 */  jr      $ra                        
/* 01ADC 80833CEC 240200FF */  addiu   $v0, $zero, 0x00FF         ## $v0 = 000000FF
.L80833CF0:
/* 01AE0 80833CF0 00441021 */  addu    $v0, $v0, $a0              
/* 01AE4 80833CF4 80421E5D */  lb      $v0, 0x1E5D($v0)           ## 00001F5C
/* 01AE8 80833CF8 10400007 */  beq     $v0, $zero, .L80833D18     
/* 01AEC 80833CFC 00000000 */  nop
/* 01AF0 80833D00 18400003 */  blez    $v0, .L80833D10            
/* 01AF4 80833D04 240300FF */  addiu   $v1, $zero, 0x00FF         ## $v1 = 000000FF
/* 01AF8 80833D08 03E00008 */  jr      $ra                        
/* 01AFC 80833D0C 24020009 */  addiu   $v0, $zero, 0x0009         ## $v0 = 00000009
.L80833D10:
/* 01B00 80833D10 03E00008 */  jr      $ra                        
/* 01B04 80833D14 00601025 */  or      $v0, $v1, $zero            ## $v0 = 000000FF
.L80833D18:
/* 01B08 80833D18 14A00012 */  bne     $a1, $zero, .L80833D64     
/* 01B0C 80833D1C 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 01B10 80833D20 3C048016 */  lui     $a0, %hi(gSaveContext)
/* 01B14 80833D24 2484E660 */  addiu   $a0, %lo(gSaveContext)
/* 01B18 80833D28 908E13E2 */  lbu     $t6, 0x13E2($a0)           ## 8015FA42
/* 01B1C 80833D2C 240100FF */  addiu   $at, $zero, 0x00FF         ## $at = 000000FF
/* 01B20 80833D30 55C10004 */  bnel    $t6, $at, .L80833D44       
/* 01B24 80833D34 90820068 */  lbu     $v0, 0x0068($a0)           ## 8015E6C8
/* 01B28 80833D38 03E00008 */  jr      $ra                        
/* 01B2C 80833D3C 240200FF */  addiu   $v0, $zero, 0x00FF         ## $v0 = 000000FF
.L80833D40:
/* 01B30 80833D40 90820068 */  lbu     $v0, 0x0068($a0)           ## 8015E6C8
.L80833D44:
/* 01B34 80833D44 24010055 */  addiu   $at, $zero, 0x0055         ## $at = 00000055
/* 01B38 80833D48 14410003 */  bne     $v0, $at, .L80833D58       
/* 01B3C 80833D4C 00402025 */  or      $a0, $v0, $zero            ## $a0 = 000000FF
/* 01B40 80833D50 10000001 */  beq     $zero, $zero, .L80833D58   
/* 01B44 80833D54 2404003D */  addiu   $a0, $zero, 0x003D         ## $a0 = 0000003D
.L80833D58:
/* 01B48 80833D58 00801825 */  or      $v1, $a0, $zero            ## $v1 = 0000003D
/* 01B4C 80833D5C 03E00008 */  jr      $ra                        
/* 01B50 80833D60 00601025 */  or      $v0, $v1, $zero            ## $v0 = 0000003D
.L80833D64:
/* 01B54 80833D64 14A1000B */  bne     $a1, $at, .L80833D94       
/* 01B58 80833D68 3C048016 */  lui     $a0, %hi(gSaveContext)
/* 01B5C 80833D6C 2484E660 */  addiu   $a0, %lo(gSaveContext)
/* 01B60 80833D70 908F13E3 */  lbu     $t7, 0x13E3($a0)           ## 8015FA43
/* 01B64 80833D74 240100FF */  addiu   $at, $zero, 0x00FF         ## $at = 000000FF
/* 01B68 80833D78 51E10004 */  beql    $t7, $at, .L80833D8C       
/* 01B6C 80833D7C 240300FF */  addiu   $v1, $zero, 0x00FF         ## $v1 = 000000FF
/* 01B70 80833D80 03E00008 */  jr      $ra                        
/* 01B74 80833D84 90820069 */  lbu     $v0, 0x0069($a0)           ## 8015E6C9
.L80833D88:
/* 01B78 80833D88 240300FF */  addiu   $v1, $zero, 0x00FF         ## $v1 = 000000FF
.L80833D8C:
/* 01B7C 80833D8C 03E00008 */  jr      $ra                        
/* 01B80 80833D90 00601025 */  or      $v0, $v1, $zero            ## $v0 = 000000FF
.L80833D94:
/* 01B84 80833D94 24010002 */  addiu   $at, $zero, 0x0002         ## $at = 00000002
/* 01B88 80833D98 14A1000C */  bne     $a1, $at, .L80833DCC       
/* 01B8C 80833D9C 3C048016 */  lui     $a0, %hi(gSaveContext)
/* 01B90 80833DA0 3C048016 */  lui     $a0, %hi(gSaveContext)
/* 01B94 80833DA4 2484E660 */  addiu   $a0, %lo(gSaveContext)
/* 01B98 80833DA8 909813E4 */  lbu     $t8, 0x13E4($a0)           ## 8015FA44
/* 01B9C 80833DAC 240100FF */  addiu   $at, $zero, 0x00FF         ## $at = 000000FF
/* 01BA0 80833DB0 53010004 */  beql    $t8, $at, .L80833DC4       
/* 01BA4 80833DB4 240300FF */  addiu   $v1, $zero, 0x00FF         ## $v1 = 000000FF
/* 01BA8 80833DB8 03E00008 */  jr      $ra                        
/* 01BAC 80833DBC 9082006A */  lbu     $v0, 0x006A($a0)           ## 8015E6CA
.L80833DC0:
/* 01BB0 80833DC0 240300FF */  addiu   $v1, $zero, 0x00FF         ## $v1 = 000000FF
.L80833DC4:
/* 01BB4 80833DC4 03E00008 */  jr      $ra                        
/* 01BB8 80833DC8 00601025 */  or      $v0, $v1, $zero            ## $v0 = 000000FF
.L80833DCC:
/* 01BBC 80833DCC 2484E660 */  addiu   $a0, %lo(gSaveContext)
/* 01BC0 80833DD0 909913E5 */  lbu     $t9, 0x13E5($a0)           ## 8015E0A5
/* 01BC4 80833DD4 240100FF */  addiu   $at, $zero, 0x00FF         ## $at = 000000FF
/* 01BC8 80833DD8 53210004 */  beql    $t9, $at, .L80833DEC       
/* 01BCC 80833DDC 240300FF */  addiu   $v1, $zero, 0x00FF         ## $v1 = 000000FF
/* 01BD0 80833DE0 10000002 */  beq     $zero, $zero, .L80833DEC   
/* 01BD4 80833DE4 9083006B */  lbu     $v1, 0x006B($a0)           ## 8015CD2B
/* 01BD8 80833DE8 240300FF */  addiu   $v1, $zero, 0x00FF         ## $v1 = 000000FF
.L80833DEC:
/* 01BDC 80833DEC 00601025 */  or      $v0, $v1, $zero            ## $v0 = 000000FF
/* 01BE0 80833DF0 03E00008 */  jr      $ra                        
/* 01BE4 80833DF4 00000000 */  nop
