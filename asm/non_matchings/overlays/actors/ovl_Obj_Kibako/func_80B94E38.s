.late_rodata
glabel D_80B958CC
    .float 0.2

glabel D_80B958D0
    .float 0.1

glabel D_80B958D4
    .float 0.7

.text
glabel func_80B94E38
/* 00198 80B94E38 27BDFF20 */  addiu   $sp, $sp, 0xFF20           ## $sp = FFFFFF20
/* 0019C 80B94E3C F7BE0070 */  sdc1    $f30, 0x0070($sp)          
/* 001A0 80B94E40 3C0140A0 */  lui     $at, 0x40A0                ## $at = 40A00000
/* 001A4 80B94E44 4481F000 */  mtc1    $at, $f30                  ## $f30 = 5.00
/* 001A8 80B94E48 F7BC0068 */  sdc1    $f28, 0x0068($sp)          
/* 001AC 80B94E4C 3C0180B9 */  lui     $at, %hi(D_80B958CC)       ## $at = 80B90000
/* 001B0 80B94E50 C43C58CC */  lwc1    $f28, %lo(D_80B958CC)($at) 
/* 001B4 80B94E54 F7BA0060 */  sdc1    $f26, 0x0060($sp)          
/* 001B8 80B94E58 3C014000 */  lui     $at, 0x4000                ## $at = 40000000
/* 001BC 80B94E5C 4481D000 */  mtc1    $at, $f26                  ## $f26 = 2.00
/* 001C0 80B94E60 AFB60090 */  sw      $s6, 0x0090($sp)           
/* 001C4 80B94E64 F7B80058 */  sdc1    $f24, 0x0058($sp)          
/* 001C8 80B94E68 3C014180 */  lui     $at, 0x4180                ## $at = 41800000
/* 001CC 80B94E6C AFBE0098 */  sw      $s8, 0x0098($sp)           
/* 001D0 80B94E70 AFB70094 */  sw      $s7, 0x0094($sp)           
/* 001D4 80B94E74 AFB5008C */  sw      $s5, 0x008C($sp)           
/* 001D8 80B94E78 AFB40088 */  sw      $s4, 0x0088($sp)           
/* 001DC 80B94E7C AFB30084 */  sw      $s3, 0x0084($sp)           
/* 001E0 80B94E80 AFB20080 */  sw      $s2, 0x0080($sp)           
/* 001E4 80B94E84 AFB1007C */  sw      $s1, 0x007C($sp)           
/* 001E8 80B94E88 3C160500 */  lui     $s6, 0x0500                ## $s6 = 05000000
/* 001EC 80B94E8C 4481C000 */  mtc1    $at, $f24                  ## $f24 = 16.00
/* 001F0 80B94E90 00A0F025 */  or      $s8, $a1, $zero            ## $s8 = 00000000
/* 001F4 80B94E94 AFBF009C */  sw      $ra, 0x009C($sp)           
/* 001F8 80B94E98 AFB00078 */  sw      $s0, 0x0078($sp)           
/* 001FC 80B94E9C F7B60050 */  sdc1    $f22, 0x0050($sp)          
/* 00200 80B94EA0 F7B40048 */  sdc1    $f20, 0x0048($sp)          
/* 00204 80B94EA4 26D65380 */  addiu   $s6, $s6, 0x5380           ## $s6 = 05005380
/* 00208 80B94EA8 24910024 */  addiu   $s1, $a0, 0x0024           ## $s1 = 00000024
/* 0020C 80B94EAC 00009025 */  or      $s2, $zero, $zero          ## $s2 = 00000000
/* 00210 80B94EB0 00009825 */  or      $s3, $zero, $zero          ## $s3 = 00000000
/* 00214 80B94EB4 27B400C8 */  addiu   $s4, $sp, 0x00C8           ## $s4 = FFFFFFE8
/* 00218 80B94EB8 27B500BC */  addiu   $s5, $sp, 0x00BC           ## $s5 = FFFFFFDC
/* 0021C 80B94EBC 2417000C */  addiu   $s7, $zero, 0x000C         ## $s7 = 0000000C
.L80B94EC0:
/* 00220 80B94EC0 00122400 */  sll     $a0, $s2, 16               
/* 00224 80B94EC4 0C01DE1C */  jal     Math_Sins
              ## sins?
/* 00228 80B94EC8 00042403 */  sra     $a0, $a0, 16               
/* 0022C 80B94ECC 00122400 */  sll     $a0, $s2, 16               
/* 00230 80B94ED0 46000506 */  mov.s   $f20, $f0                  
/* 00234 80B94ED4 0C01DE0D */  jal     Math_Coss
              ## coss?
/* 00238 80B94ED8 00042403 */  sra     $a0, $a0, 16               
/* 0023C 80B94EDC 4618A102 */  mul.s   $f4, $f20, $f24            
/* 00240 80B94EE0 46000586 */  mov.s   $f22, $f0                  
/* 00244 80B94EE4 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 00248 80B94EE8 E7A400C8 */  swc1    $f4, 0x00C8($sp)           
/* 0024C 80B94EEC 461E0182 */  mul.s   $f6, $f0, $f30             
/* 00250 80B94EF0 C7B000C8 */  lwc1    $f16, 0x00C8($sp)          
/* 00254 80B94EF4 4618B282 */  mul.s   $f10, $f22, $f24           
/* 00258 80B94EF8 00000000 */  nop
/* 0025C 80B94EFC 461C8482 */  mul.s   $f18, $f16, $f28           
/* 00260 80B94F00 461A3200 */  add.s   $f8, $f6, $f26             
/* 00264 80B94F04 E7AA00D0 */  swc1    $f10, 0x00D0($sp)          
/* 00268 80B94F08 E7A800CC */  swc1    $f8, 0x00CC($sp)           
/* 0026C 80B94F0C 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 00270 80B94F10 E7B200BC */  swc1    $f18, 0x00BC($sp)          
/* 00274 80B94F14 3C0140C0 */  lui     $at, 0x40C0                ## $at = 40C00000
/* 00278 80B94F18 44812000 */  mtc1    $at, $f4                   ## $f4 = 6.00
/* 0027C 80B94F1C C7AA00D0 */  lwc1    $f10, 0x00D0($sp)          
/* 00280 80B94F20 C7B200C8 */  lwc1    $f18, 0x00C8($sp)          
/* 00284 80B94F24 46040182 */  mul.s   $f6, $f0, $f4              
/* 00288 80B94F28 461A3200 */  add.s   $f8, $f6, $f26             
/* 0028C 80B94F2C 461C5402 */  mul.s   $f16, $f10, $f28           
/* 00290 80B94F30 E7A800C0 */  swc1    $f8, 0x00C0($sp)           
/* 00294 80B94F34 C7A800CC */  lwc1    $f8, 0x00CC($sp)           
/* 00298 80B94F38 E7B000C4 */  swc1    $f16, 0x00C4($sp)          
/* 0029C 80B94F3C C6240000 */  lwc1    $f4, 0x0000($s1)           ## 00000024
/* 002A0 80B94F40 46049180 */  add.s   $f6, $f18, $f4             
/* 002A4 80B94F44 E7A600C8 */  swc1    $f6, 0x00C8($sp)           
/* 002A8 80B94F48 C6300004 */  lwc1    $f16, 0x0004($s1)          ## 00000028
/* 002AC 80B94F4C 46104480 */  add.s   $f18, $f8, $f16            
/* 002B0 80B94F50 E7B200CC */  swc1    $f18, 0x00CC($sp)          
/* 002B4 80B94F54 C6240008 */  lwc1    $f4, 0x0008($s1)           ## 0000002C
/* 002B8 80B94F58 46045180 */  add.s   $f6, $f10, $f4             
/* 002BC 80B94F5C 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 002C0 80B94F60 E7A600D0 */  swc1    $f6, 0x00D0($sp)           
/* 002C4 80B94F64 3C0180B9 */  lui     $at, %hi(D_80B958D0)       ## $at = 80B90000
/* 002C8 80B94F68 C42858D0 */  lwc1    $f8, %lo(D_80B958D0)($at)  
/* 002CC 80B94F6C 3C0180B9 */  lui     $at, %hi(D_80B958D4)       ## $at = 80B90000
/* 002D0 80B94F70 4608003C */  c.lt.s  $f0, $f8                   
/* 002D4 80B94F74 00000000 */  nop
/* 002D8 80B94F78 45000003 */  bc1f    .L80B94F88                 
/* 002DC 80B94F7C 00000000 */  nop
/* 002E0 80B94F80 10000009 */  beq     $zero, $zero, .L80B94FA8   
/* 002E4 80B94F84 24100060 */  addiu   $s0, $zero, 0x0060         ## $s0 = 00000060
.L80B94F88:
/* 002E8 80B94F88 C43058D4 */  lwc1    $f16, %lo(D_80B958D4)($at) 
/* 002EC 80B94F8C 24100020 */  addiu   $s0, $zero, 0x0020         ## $s0 = 00000020
/* 002F0 80B94F90 4610003C */  c.lt.s  $f0, $f16                  
/* 002F4 80B94F94 00000000 */  nop
/* 002F8 80B94F98 45000003 */  bc1f    .L80B94FA8                 
/* 002FC 80B94F9C 00000000 */  nop
/* 00300 80B94FA0 10000001 */  beq     $zero, $zero, .L80B94FA8   
/* 00304 80B94FA4 24100040 */  addiu   $s0, $zero, 0x0040         ## $s0 = 00000040
.L80B94FA8:
/* 00308 80B94FA8 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 0030C 80B94FAC 00000000 */  nop
/* 00310 80B94FB0 3C0141F0 */  lui     $at, 0x41F0                ## $at = 41F00000
/* 00314 80B94FB4 44819000 */  mtc1    $at, $f18                  ## $f18 = 30.00
/* 00318 80B94FB8 3C014120 */  lui     $at, 0x4120                ## $at = 41200000
/* 0031C 80B94FBC 44812000 */  mtc1    $at, $f4                   ## $f4 = 10.00
/* 00320 80B94FC0 46120282 */  mul.s   $f10, $f0, $f18            
/* 00324 80B94FC4 240EFF38 */  addiu   $t6, $zero, 0xFF38         ## $t6 = FFFFFF38
/* 00328 80B94FC8 240F000A */  addiu   $t7, $zero, 0x000A         ## $t7 = 0000000A
/* 0032C 80B94FCC 2418000A */  addiu   $t8, $zero, 0x000A         ## $t8 = 0000000A
/* 00330 80B94FD0 24090020 */  addiu   $t1, $zero, 0x0020         ## $t1 = 00000020
/* 00334 80B94FD4 240A003C */  addiu   $t2, $zero, 0x003C         ## $t2 = 0000003C
/* 00338 80B94FD8 240BFFFF */  addiu   $t3, $zero, 0xFFFF         ## $t3 = FFFFFFFF
/* 0033C 80B94FDC 46045180 */  add.s   $f6, $f10, $f4             
/* 00340 80B94FE0 240C0003 */  addiu   $t4, $zero, 0x0003         ## $t4 = 00000003
/* 00344 80B94FE4 AFAC0038 */  sw      $t4, 0x0038($sp)           
/* 00348 80B94FE8 AFAB0034 */  sw      $t3, 0x0034($sp)           
/* 0034C 80B94FEC 4600320D */  trunc.w.s $f8, $f6                   
/* 00350 80B94FF0 AFAA0030 */  sw      $t2, 0x0030($sp)           
/* 00354 80B94FF4 AFA9002C */  sw      $t1, 0x002C($sp)           
/* 00358 80B94FF8 AFB8001C */  sw      $t8, 0x001C($sp)           
/* 0035C 80B94FFC 44084000 */  mfc1    $t0, $f8                   
/* 00360 80B95000 AFAF0018 */  sw      $t7, 0x0018($sp)           
/* 00364 80B95004 AFAE0010 */  sw      $t6, 0x0010($sp)           
/* 00368 80B95008 03C02025 */  or      $a0, $s8, $zero            ## $a0 = 00000000
/* 0036C 80B9500C 02802825 */  or      $a1, $s4, $zero            ## $a1 = FFFFFFE8
/* 00370 80B95010 02A03025 */  or      $a2, $s5, $zero            ## $a2 = FFFFFFDC
/* 00374 80B95014 02203825 */  or      $a3, $s1, $zero            ## $a3 = 00000024
/* 00378 80B95018 AFB00014 */  sw      $s0, 0x0014($sp)           
/* 0037C 80B9501C AFA00020 */  sw      $zero, 0x0020($sp)         
/* 00380 80B95020 AFA00028 */  sw      $zero, 0x0028($sp)         
/* 00384 80B95024 AFB6003C */  sw      $s6, 0x003C($sp)           
/* 00388 80B95028 0C00A7A3 */  jal     func_80029E8C
              
/* 0038C 80B9502C AFA80024 */  sw      $t0, 0x0024($sp)           
/* 00390 80B95030 26524E20 */  addiu   $s2, $s2, 0x4E20           ## $s2 = 00004E20
/* 00394 80B95034 00129400 */  sll     $s2, $s2, 16               
/* 00398 80B95038 26730001 */  addiu   $s3, $s3, 0x0001           ## $s3 = 00000001
/* 0039C 80B9503C 1677FFA0 */  bne     $s3, $s7, .L80B94EC0       
/* 003A0 80B95040 00129403 */  sra     $s2, $s2, 16               
/* 003A4 80B95044 240D0032 */  addiu   $t5, $zero, 0x0032         ## $t5 = 00000032
/* 003A8 80B95048 240E008C */  addiu   $t6, $zero, 0x008C         ## $t6 = 0000008C
/* 003AC 80B9504C 240F0001 */  addiu   $t7, $zero, 0x0001         ## $t7 = 00000001
/* 003B0 80B95050 AFAF0018 */  sw      $t7, 0x0018($sp)           
/* 003B4 80B95054 AFAE0014 */  sw      $t6, 0x0014($sp)           
/* 003B8 80B95058 AFAD0010 */  sw      $t5, 0x0010($sp)           
/* 003BC 80B9505C 03C02025 */  or      $a0, $s8, $zero            ## $a0 = 00000000
/* 003C0 80B95060 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000024
/* 003C4 80B95064 3C064220 */  lui     $a2, 0x4220                ## $a2 = 42200000
/* 003C8 80B95068 0C00CD20 */  jal     func_80033480              
/* 003CC 80B9506C 24070003 */  addiu   $a3, $zero, 0x0003         ## $a3 = 00000003
/* 003D0 80B95070 8FBF009C */  lw      $ra, 0x009C($sp)           
/* 003D4 80B95074 D7B40048 */  ldc1    $f20, 0x0048($sp)          
/* 003D8 80B95078 D7B60050 */  ldc1    $f22, 0x0050($sp)          
/* 003DC 80B9507C D7B80058 */  ldc1    $f24, 0x0058($sp)          
/* 003E0 80B95080 D7BA0060 */  ldc1    $f26, 0x0060($sp)          
/* 003E4 80B95084 D7BC0068 */  ldc1    $f28, 0x0068($sp)          
/* 003E8 80B95088 D7BE0070 */  ldc1    $f30, 0x0070($sp)          
/* 003EC 80B9508C 8FB00078 */  lw      $s0, 0x0078($sp)           
/* 003F0 80B95090 8FB1007C */  lw      $s1, 0x007C($sp)           
/* 003F4 80B95094 8FB20080 */  lw      $s2, 0x0080($sp)           
/* 003F8 80B95098 8FB30084 */  lw      $s3, 0x0084($sp)           
/* 003FC 80B9509C 8FB40088 */  lw      $s4, 0x0088($sp)           
/* 00400 80B950A0 8FB5008C */  lw      $s5, 0x008C($sp)           
/* 00404 80B950A4 8FB60090 */  lw      $s6, 0x0090($sp)           
/* 00408 80B950A8 8FB70094 */  lw      $s7, 0x0094($sp)           
/* 0040C 80B950AC 8FBE0098 */  lw      $s8, 0x0098($sp)           
/* 00410 80B950B0 03E00008 */  jr      $ra                        
/* 00414 80B950B4 27BD00E0 */  addiu   $sp, $sp, 0x00E0           ## $sp = 00000000
