.late_rodata
glabel D_80A9C320
 .word 0x3DF5C290
glabel D_80A9C324
 .word 0x3E23D70B

.text
glabel func_80A9B1FC
/* 0025C 80A9B1FC 3C0180AA */  lui     $at, %hi(D_80A9C320)       ## $at = 80AA0000
/* 00260 80A9B200 C420C320 */  lwc1    $f0, %lo(D_80A9C320)($at)  
/* 00264 80A9B204 3C0180AA */  lui     $at, %hi(D_80A9C324)       ## $at = 80AA0000
/* 00268 80A9B208 C424C324 */  lwc1    $f4, %lo(D_80A9C324)($at)  
/* 0026C 80A9B20C E4800050 */  swc1    $f0, 0x0050($a0)           ## 00000050
/* 00270 80A9B210 E4800058 */  swc1    $f0, 0x0058($a0)           ## 00000058
/* 00274 80A9B214 03E00008 */  jr      $ra                        
/* 00278 80A9B218 E4840054 */  swc1    $f4, 0x0054($a0)           ## 00000054
