.late_rodata
glabel D_8090DBAC
    .float 40000.0

.text
glabel func_808FFA24
/* 02AE4 808FFA24 8CA21C64 */  lw      $v0, 0x1C64($a1)           ## 00001C64
/* 02AE8 808FFA28 3C018091 */  lui     $at, %hi(D_8090DBAC)       ## $at = 80910000
/* 02AEC 808FFA2C 24080016 */  addiu   $t0, $zero, 0x0016         ## $t0 = 00000016
/* 02AF0 808FFA30 10400022 */  beq     $v0, $zero, .L808FFABC     
/* 02AF4 808FFA34 24070011 */  addiu   $a3, $zero, 0x0011         ## $a3 = 00000011
/* 02AF8 808FFA38 C42CDBAC */  lwc1    $f12, %lo(D_8090DBAC)($at) 
/* 02AFC 808FFA3C 24060010 */  addiu   $a2, $zero, 0x0010         ## $a2 = 00000010
/* 02B00 808FFA40 240501B1 */  addiu   $a1, $zero, 0x01B1         ## $a1 = 000001B1
/* 02B04 808FFA44 844E0000 */  lh      $t6, 0x0000($v0)           ## 00000000
.L808FFA48:
/* 02B08 808FFA48 54AE001A */  bnel    $a1, $t6, .L808FFAB4       
/* 02B0C 808FFA4C 8C420124 */  lw      $v0, 0x0124($v0)           ## 00000124
/* 02B10 808FFA50 8443001C */  lh      $v1, 0x001C($v0)           ## 0000001C
/* 02B14 808FFA54 306300FF */  andi    $v1, $v1, 0x00FF           ## $v1 = 00000000
/* 02B18 808FFA58 50C30006 */  beql    $a2, $v1, .L808FFA74       
/* 02B1C 808FFA5C C4840024 */  lwc1    $f4, 0x0024($a0)           ## 00000024
/* 02B20 808FFA60 50E30004 */  beql    $a3, $v1, .L808FFA74       
/* 02B24 808FFA64 C4840024 */  lwc1    $f4, 0x0024($a0)           ## 00000024
/* 02B28 808FFA68 55030012 */  bnel    $t0, $v1, .L808FFAB4       
/* 02B2C 808FFA6C 8C420124 */  lw      $v0, 0x0124($v0)           ## 00000124
/* 02B30 808FFA70 C4840024 */  lwc1    $f4, 0x0024($a0)           ## 00000024
.L808FFA74:
/* 02B34 808FFA74 C4460024 */  lwc1    $f6, 0x0024($v0)           ## 00000024
/* 02B38 808FFA78 C488002C */  lwc1    $f8, 0x002C($a0)           ## 0000002C
/* 02B3C 808FFA7C C44A002C */  lwc1    $f10, 0x002C($v0)          ## 0000002C
/* 02B40 808FFA80 46062001 */  sub.s   $f0, $f4, $f6              
/* 02B44 808FFA84 460A4081 */  sub.s   $f2, $f8, $f10             
/* 02B48 808FFA88 46000402 */  mul.s   $f16, $f0, $f0             
/* 02B4C 808FFA8C 00000000 */  nop
/* 02B50 808FFA90 46021482 */  mul.s   $f18, $f2, $f2             
/* 02B54 808FFA94 46128100 */  add.s   $f4, $f16, $f18            
/* 02B58 808FFA98 460C203C */  c.lt.s  $f4, $f12                  
/* 02B5C 808FFA9C 00000000 */  nop
/* 02B60 808FFAA0 45000003 */  bc1f    .L808FFAB0                 
/* 02B64 808FFAA4 00000000 */  nop
/* 02B68 808FFAA8 03E00008 */  jr      $ra                        
/* 02B6C 808FFAAC 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
.L808FFAB0:
/* 02B70 808FFAB0 8C420124 */  lw      $v0, 0x0124($v0)           ## 00000125
.L808FFAB4:
/* 02B74 808FFAB4 5440FFE4 */  bnel    $v0, $zero, .L808FFA48     
/* 02B78 808FFAB8 844E0000 */  lh      $t6, 0x0000($v0)           ## 00000001
.L808FFABC:
/* 02B7C 808FFABC 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
/* 02B80 808FFAC0 03E00008 */  jr      $ra                        
/* 02B84 808FFAC4 00000000 */  nop
