.rdata
glabel D_80A11880
    .asciz "yari hikari 1\n"
    .balign 4

glabel D_80A11890
    .asciz "yari hikari 2\n"
    .balign 4

glabel D_80A118A0
    .asciz "FLASH !!\n"
    .balign 4

.late_rodata
glabel D_80A119D4
 .word 0x469C4000
glabel D_80A119D8
 .word 0xBDA3D70A

.text
glabel func_80A10008
/* 00DA8 80A10008 27BDFF80 */  addiu   $sp, $sp, 0xFF80           ## $sp = FFFFFF80
/* 00DAC 80A1000C AFB10038 */  sw      $s1, 0x0038($sp)           
/* 00DB0 80A10010 00808825 */  or      $s1, $a0, $zero            ## $s1 = 00000000
/* 00DB4 80A10014 AFBF004C */  sw      $ra, 0x004C($sp)           
/* 00DB8 80A10018 AFB50048 */  sw      $s5, 0x0048($sp)           
/* 00DBC 80A1001C 3C0480A1 */  lui     $a0, %hi(D_80A11880)       ## $a0 = 80A10000
/* 00DC0 80A10020 00A0A825 */  or      $s5, $a1, $zero            ## $s5 = 00000000
/* 00DC4 80A10024 AFB40044 */  sw      $s4, 0x0044($sp)           
/* 00DC8 80A10028 AFB30040 */  sw      $s3, 0x0040($sp)           
/* 00DCC 80A1002C AFB2003C */  sw      $s2, 0x003C($sp)           
/* 00DD0 80A10030 AFB00034 */  sw      $s0, 0x0034($sp)           
/* 00DD4 80A10034 F7B80028 */  sdc1    $f24, 0x0028($sp)          
/* 00DD8 80A10038 F7B60020 */  sdc1    $f22, 0x0020($sp)          
/* 00DDC 80A1003C F7B40018 */  sdc1    $f20, 0x0018($sp)          
/* 00DE0 80A10040 0C00084C */  jal     osSyncPrintf
              
/* 00DE4 80A10044 24841880 */  addiu   $a0, $a0, %lo(D_80A11880)  ## $a0 = 80A11880
/* 00DE8 80A10048 862E0156 */  lh      $t6, 0x0156($s1)           ## 00000156
/* 00DEC 80A1004C 8E300118 */  lw      $s0, 0x0118($s1)           ## 00000118
/* 00DF0 80A10050 3C0540C0 */  lui     $a1, 0x40C0                ## $a1 = 40C00000
/* 00DF4 80A10054 31CF0001 */  andi    $t7, $t6, 0x0001           ## $t7 = 00000000
/* 00DF8 80A10058 11E00005 */  beq     $t7, $zero, .L80A10070     
/* 00DFC 80A1005C 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00E00 80A10060 0C00B58B */  jal     Actor_SetScale
              
/* 00E04 80A10064 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00E08 80A10068 10000004 */  beq     $zero, $zero, .L80A1007C   
/* 00E0C 80A1006C 8E190200 */  lw      $t9, 0x0200($s0)           ## 00000200
.L80A10070:
/* 00E10 80A10070 0C00B58B */  jal     Actor_SetScale
              
/* 00E14 80A10074 3C0540A8 */  lui     $a1, 0x40A8                ## $a1 = 40A80000
/* 00E18 80A10078 8E190200 */  lw      $t9, 0x0200($s0)           ## 00000200
.L80A1007C:
/* 00E1C 80A1007C AE390024 */  sw      $t9, 0x0024($s1)           ## 00000024
/* 00E20 80A10080 8E180204 */  lw      $t8, 0x0204($s0)           ## 00000204
/* 00E24 80A10084 AE380028 */  sw      $t8, 0x0028($s1)           ## 00000028
/* 00E28 80A10088 8E190208 */  lw      $t9, 0x0208($s0)           ## 00000208
/* 00E2C 80A1008C 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 00E30 80A10090 AE39002C */  sw      $t9, 0x002C($s1)           ## 0000002C
/* 00E34 80A10094 3C0180A1 */  lui     $at, %hi(D_80A119D4)       ## $at = 80A10000
/* 00E38 80A10098 C42419D4 */  lwc1    $f4, %lo(D_80A119D4)($at)  
/* 00E3C 80A1009C 862800B8 */  lh      $t0, 0x00B8($s1)           ## 000000B8
/* 00E40 80A100A0 3C0480A1 */  lui     $a0, %hi(D_80A11890)       ## $a0 = 80A10000
/* 00E44 80A100A4 46040182 */  mul.s   $f6, $f0, $f4              
/* 00E48 80A100A8 24841890 */  addiu   $a0, $a0, %lo(D_80A11890)  ## $a0 = 80A11890
/* 00E4C 80A100AC 4600320D */  trunc.w.s $f8, $f6                   
/* 00E50 80A100B0 440C4000 */  mfc1    $t4, $f8                   
/* 00E54 80A100B4 00000000 */  nop
/* 00E58 80A100B8 010C6821 */  addu    $t5, $t0, $t4              
/* 00E5C 80A100BC 25AE4000 */  addiu   $t6, $t5, 0x4000           ## $t6 = 00004000
/* 00E60 80A100C0 0C00084C */  jal     osSyncPrintf
              
/* 00E64 80A100C4 A62E00B8 */  sh      $t6, 0x00B8($s1)           ## 000000B8
/* 00E68 80A100C8 862F0158 */  lh      $t7, 0x0158($s1)           ## 00000158
/* 00E6C 80A100CC 3C1880A1 */  lui     $t8, %hi(D_80A117C8)       ## $t8 = 80A10000
/* 00E70 80A100D0 271817C8 */  addiu   $t8, $t8, %lo(D_80A117C8)  ## $t8 = 80A117C8
/* 00E74 80A100D4 55E00042 */  bnel    $t7, $zero, .L80A101E0     
/* 00E78 80A100D8 86390150 */  lh      $t9, 0x0150($s1)           ## 00000150
/* 00E7C 80A100DC 8F090000 */  lw      $t1, 0x0000($t8)           ## 80A117C8
/* 00E80 80A100E0 27B20060 */  addiu   $s2, $sp, 0x0060           ## $s2 = FFFFFFE0
/* 00E84 80A100E4 3C0A80A1 */  lui     $t2, %hi(D_80A117D4)       ## $t2 = 80A10000
/* 00E88 80A100E8 AE490000 */  sw      $t1, 0x0000($s2)           ## FFFFFFE0
/* 00E8C 80A100EC 8F190004 */  lw      $t9, 0x0004($t8)           ## 80A117CC
/* 00E90 80A100F0 254A17D4 */  addiu   $t2, $t2, %lo(D_80A117D4)  ## $t2 = 80A117D4
/* 00E94 80A100F4 27B30054 */  addiu   $s3, $sp, 0x0054           ## $s3 = FFFFFFD4
/* 00E98 80A100F8 AE590004 */  sw      $t9, 0x0004($s2)           ## FFFFFFE4
/* 00E9C 80A100FC 8F090008 */  lw      $t1, 0x0008($t8)           ## 80A117D0
/* 00EA0 80A10100 3C0480A1 */  lui     $a0, %hi(D_80A118A0)       ## $a0 = 80A10000
/* 00EA4 80A10104 248418A0 */  addiu   $a0, $a0, %lo(D_80A118A0)  ## $a0 = 80A118A0
/* 00EA8 80A10108 AE490008 */  sw      $t1, 0x0008($s2)           ## FFFFFFE8
/* 00EAC 80A1010C 8D480000 */  lw      $t0, 0x0000($t2)           ## 80A117D4
/* 00EB0 80A10110 AE680000 */  sw      $t0, 0x0000($s3)           ## FFFFFFD4
/* 00EB4 80A10114 8D4B0004 */  lw      $t3, 0x0004($t2)           ## 80A117D8
/* 00EB8 80A10118 AE6B0004 */  sw      $t3, 0x0004($s3)           ## FFFFFFD8
/* 00EBC 80A1011C 8D480008 */  lw      $t0, 0x0008($t2)           ## 80A117DC
/* 00EC0 80A10120 0C00084C */  jal     osSyncPrintf
              
/* 00EC4 80A10124 AE680008 */  sw      $t0, 0x0008($s3)           ## FFFFFFDC
/* 00EC8 80A10128 3C0142A0 */  lui     $at, 0x42A0                ## $at = 42A00000
/* 00ECC 80A1012C 4481C000 */  mtc1    $at, $f24                  ## $f24 = 80.00
/* 00ED0 80A10130 3C0180A1 */  lui     $at, %hi(D_80A119D8)       ## $at = 80A10000
/* 00ED4 80A10134 C43619D8 */  lwc1    $f22, %lo(D_80A119D8)($at) 
/* 00ED8 80A10138 3C0141A0 */  lui     $at, 0x41A0                ## $at = 41A00000
/* 00EDC 80A1013C 4481A000 */  mtc1    $at, $f20                  ## $f20 = 20.00
/* 00EE0 80A10140 00008025 */  or      $s0, $zero, $zero          ## $s0 = 00000000
/* 00EE4 80A10144 27B4006C */  addiu   $s4, $sp, 0x006C           ## $s4 = FFFFFFEC
.L80A10148:
/* 00EE8 80A10148 0C00CFC8 */  jal     Math_Rand_CenteredFloat
              
/* 00EEC 80A1014C 4600A306 */  mov.s   $f12, $f20                 
/* 00EF0 80A10150 C62A0024 */  lwc1    $f10, 0x0024($s1)          ## 00000024
/* 00EF4 80A10154 4600A306 */  mov.s   $f12, $f20                 
/* 00EF8 80A10158 460A0400 */  add.s   $f16, $f0, $f10            
/* 00EFC 80A1015C 0C00CFC8 */  jal     Math_Rand_CenteredFloat
              
/* 00F00 80A10160 E7B0006C */  swc1    $f16, 0x006C($sp)          
/* 00F04 80A10164 C6320028 */  lwc1    $f18, 0x0028($s1)          ## 00000028
/* 00F08 80A10168 4600A306 */  mov.s   $f12, $f20                 
/* 00F0C 80A1016C 46120100 */  add.s   $f4, $f0, $f18             
/* 00F10 80A10170 0C00CFC8 */  jal     Math_Rand_CenteredFloat
              
/* 00F14 80A10174 E7A40070 */  swc1    $f4, 0x0070($sp)           
/* 00F18 80A10178 C626002C */  lwc1    $f6, 0x002C($s1)           ## 0000002C
/* 00F1C 80A1017C E7B60058 */  swc1    $f22, 0x0058($sp)          
/* 00F20 80A10180 46060200 */  add.s   $f8, $f0, $f6              
/* 00F24 80A10184 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 00F28 80A10188 E7A80074 */  swc1    $f8, 0x0074($sp)           
/* 00F2C 80A1018C 46180282 */  mul.s   $f10, $f0, $f24            
/* 00F30 80A10190 02A02025 */  or      $a0, $s5, $zero            ## $a0 = 00000000
/* 00F34 80A10194 02802825 */  or      $a1, $s4, $zero            ## $a1 = FFFFFFEC
/* 00F38 80A10198 02403025 */  or      $a2, $s2, $zero            ## $a2 = FFFFFFE0
/* 00F3C 80A1019C 02603825 */  or      $a3, $s3, $zero            ## $a3 = FFFFFFD4
/* 00F40 80A101A0 AFA00014 */  sw      $zero, 0x0014($sp)         
/* 00F44 80A101A4 4600540D */  trunc.w.s $f16, $f10                 
/* 00F48 80A101A8 440D8000 */  mfc1    $t5, $f16                  
/* 00F4C 80A101AC 00000000 */  nop
/* 00F50 80A101B0 000D7400 */  sll     $t6, $t5, 16               
/* 00F54 80A101B4 000E7C03 */  sra     $t7, $t6, 16               
/* 00F58 80A101B8 25F80096 */  addiu   $t8, $t7, 0x0096           ## $t8 = 00000096
/* 00F5C 80A101BC 0C00A73C */  jal     func_80029CF0              
/* 00F60 80A101C0 AFB80010 */  sw      $t8, 0x0010($sp)           
/* 00F64 80A101C4 26100001 */  addiu   $s0, $s0, 0x0001           ## $s0 = 00000001
/* 00F68 80A101C8 00108400 */  sll     $s0, $s0, 16               
/* 00F6C 80A101CC 00108403 */  sra     $s0, $s0, 16               
/* 00F70 80A101D0 2A010002 */  slti    $at, $s0, 0x0002           
/* 00F74 80A101D4 1420FFDC */  bne     $at, $zero, .L80A10148     
/* 00F78 80A101D8 00000000 */  nop
/* 00F7C 80A101DC 86390150 */  lh      $t9, 0x0150($s1)           ## 00000150
.L80A101E0:
/* 00F80 80A101E0 57200004 */  bnel    $t9, $zero, .L80A101F4     
/* 00F84 80A101E4 8FBF004C */  lw      $ra, 0x004C($sp)           
/* 00F88 80A101E8 0C00B55C */  jal     Actor_Kill
              
/* 00F8C 80A101EC 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00F90 80A101F0 8FBF004C */  lw      $ra, 0x004C($sp)           
.L80A101F4:
/* 00F94 80A101F4 D7B40018 */  ldc1    $f20, 0x0018($sp)          
/* 00F98 80A101F8 D7B60020 */  ldc1    $f22, 0x0020($sp)          
/* 00F9C 80A101FC D7B80028 */  ldc1    $f24, 0x0028($sp)          
/* 00FA0 80A10200 8FB00034 */  lw      $s0, 0x0034($sp)           
/* 00FA4 80A10204 8FB10038 */  lw      $s1, 0x0038($sp)           
/* 00FA8 80A10208 8FB2003C */  lw      $s2, 0x003C($sp)           
/* 00FAC 80A1020C 8FB30040 */  lw      $s3, 0x0040($sp)           
/* 00FB0 80A10210 8FB40044 */  lw      $s4, 0x0044($sp)           
/* 00FB4 80A10214 8FB50048 */  lw      $s5, 0x0048($sp)           
/* 00FB8 80A10218 03E00008 */  jr      $ra                        
/* 00FBC 80A1021C 27BD0080 */  addiu   $sp, $sp, 0x0080           ## $sp = 00000000
