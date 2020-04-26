glabel func_80A59D70
/* 00140 80A59D70 27BDFF58 */  addiu   $sp, $sp, 0xFF58           ## $sp = FFFFFF58
/* 00144 80A59D74 AFB00030 */  sw      $s0, 0x0030($sp)           
/* 00148 80A59D78 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 0014C 80A59D7C AFBF0054 */  sw      $ra, 0x0054($sp)           
/* 00150 80A59D80 AFBE0050 */  sw      $s8, 0x0050($sp)           
/* 00154 80A59D84 3C053DCC */  lui     $a1, 0x3DCC                ## $a1 = 3DCC0000
/* 00158 80A59D88 0080F025 */  or      $s8, $a0, $zero            ## $s8 = 00000000
/* 0015C 80A59D8C AFB7004C */  sw      $s7, 0x004C($sp)           
/* 00160 80A59D90 AFB60048 */  sw      $s6, 0x0048($sp)           
/* 00164 80A59D94 AFB50044 */  sw      $s5, 0x0044($sp)           
/* 00168 80A59D98 AFB40040 */  sw      $s4, 0x0040($sp)           
/* 0016C 80A59D9C AFB3003C */  sw      $s3, 0x003C($sp)           
/* 00170 80A59DA0 AFB20038 */  sw      $s2, 0x0038($sp)           
/* 00174 80A59DA4 AFB10034 */  sw      $s1, 0x0034($sp)           
/* 00178 80A59DA8 F7B60028 */  sdc1    $f22, 0x0028($sp)          
/* 0017C 80A59DAC F7B40020 */  sdc1    $f20, 0x0020($sp)          
/* 00180 80A59DB0 0C00B58B */  jal     Actor_SetScale
              
/* 00184 80A59DB4 34A5CCCD */  ori     $a1, $a1, 0xCCCD           ## $a1 = 3DCCCCCD
/* 00188 80A59DB8 0C01DE1C */  jal     Math_Sins
              ## sins?
/* 0018C 80A59DBC 87C40016 */  lh      $a0, 0x0016($s8)           ## 00000016
/* 00190 80A59DC0 46000586 */  mov.s   $f22, $f0                  
/* 00194 80A59DC4 0C01DE0D */  jal     Math_Coss
              ## coss?
/* 00198 80A59DC8 87C40016 */  lh      $a0, 0x0016($s8)           ## 00000016
/* 0019C 80A59DCC 27D70150 */  addiu   $s7, $s8, 0x0150           ## $s7 = 00000150
/* 001A0 80A59DD0 46000506 */  mov.s   $f20, $f0                  
/* 001A4 80A59DD4 02E02825 */  or      $a1, $s7, $zero            ## $a1 = 00000150
/* 001A8 80A59DD8 0C0171F8 */  jal     Collider_InitTris              
/* 001AC 80A59DDC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 001B0 80A59DE0 3C1480A6 */  lui     $s4, %hi(D_80A5AFF8)       ## $s4 = 80A60000
/* 001B4 80A59DE4 2694AFF8 */  addiu   $s4, $s4, %lo(D_80A5AFF8)  ## $s4 = 80A5AFF8
/* 001B8 80A59DE8 27CE0170 */  addiu   $t6, $s8, 0x0170           ## $t6 = 00000170
/* 001BC 80A59DEC AFAE0010 */  sw      $t6, 0x0010($sp)           
/* 001C0 80A59DF0 02803825 */  or      $a3, $s4, $zero            ## $a3 = 80A5AFF8
/* 001C4 80A59DF4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 001C8 80A59DF8 02E02825 */  or      $a1, $s7, $zero            ## $a1 = 00000150
/* 001CC 80A59DFC 0C0172EB */  jal     Collider_SetTris              
/* 001D0 80A59E00 03C03025 */  or      $a2, $s8, $zero            ## $a2 = 00000000
/* 001D4 80A59E04 00009025 */  or      $s2, $zero, $zero          ## $s2 = 00000000
/* 001D8 80A59E08 27D30024 */  addiu   $s3, $s8, 0x0024           ## $s3 = 00000024
/* 001DC 80A59E0C 27B60070 */  addiu   $s6, $sp, 0x0070           ## $s6 = FFFFFFC8
/* 001E0 80A59E10 24150024 */  addiu   $s5, $zero, 0x0024         ## $s5 = 00000024
/* 001E4 80A59E14 02C08025 */  or      $s0, $s6, $zero            ## $s0 = FFFFFFC8
.L80A59E18:
/* 001E8 80A59E18 00008825 */  or      $s1, $zero, $zero          ## $s1 = 00000000
.L80A59E1C:
/* 001EC 80A59E1C 8E8F000C */  lw      $t7, 0x000C($s4)           ## 80A5B004
/* 001F0 80A59E20 0012C100 */  sll     $t8, $s2,  4               
/* 001F4 80A59E24 0312C023 */  subu    $t8, $t8, $s2              
/* 001F8 80A59E28 0018C080 */  sll     $t8, $t8,  2               
/* 001FC 80A59E2C 01F8C821 */  addu    $t9, $t7, $t8              
/* 00200 80A59E30 03311021 */  addu    $v0, $t9, $s1              
/* 00204 80A59E34 C4440020 */  lwc1    $f4, 0x0020($v0)           ## 00000020
/* 00208 80A59E38 C4480018 */  lwc1    $f8, 0x0018($v0)           ## 00000018
/* 0020C 80A59E3C 24420018 */  addiu   $v0, $v0, 0x0018           ## $v0 = 00000018
/* 00210 80A59E40 46162182 */  mul.s   $f6, $f4, $f22             
/* 00214 80A59E44 02002025 */  or      $a0, $s0, $zero            ## $a0 = FFFFFFC8
/* 00218 80A59E48 02602825 */  or      $a1, $s3, $zero            ## $a1 = 00000024
/* 0021C 80A59E4C 46144282 */  mul.s   $f10, $f8, $f20            
/* 00220 80A59E50 02003025 */  or      $a2, $s0, $zero            ## $a2 = FFFFFFC8
/* 00224 80A59E54 460A3400 */  add.s   $f16, $f6, $f10            
/* 00228 80A59E58 E6100000 */  swc1    $f16, 0x0000($s0)          ## FFFFFFC8
/* 0022C 80A59E5C C4520004 */  lwc1    $f18, 0x0004($v0)          ## 0000001C
/* 00230 80A59E60 E6120004 */  swc1    $f18, 0x0004($s0)          ## FFFFFFCC
/* 00234 80A59E64 C4440008 */  lwc1    $f4, 0x0008($v0)           ## 00000020
/* 00238 80A59E68 C4460000 */  lwc1    $f6, 0x0000($v0)           ## 00000018
/* 0023C 80A59E6C 46142202 */  mul.s   $f8, $f4, $f20             
/* 00240 80A59E70 00000000 */  nop
/* 00244 80A59E74 46163282 */  mul.s   $f10, $f6, $f22            
/* 00248 80A59E78 460A4401 */  sub.s   $f16, $f8, $f10            
/* 0024C 80A59E7C 0C01DFA7 */  jal     Math_Vec3f_Sum
              ## Vec3f_Add
/* 00250 80A59E80 E6100008 */  swc1    $f16, 0x0008($s0)          ## FFFFFFD0
/* 00254 80A59E84 2631000C */  addiu   $s1, $s1, 0x000C           ## $s1 = 0000000C
/* 00258 80A59E88 1635FFE4 */  bne     $s1, $s5, .L80A59E1C       
/* 0025C 80A59E8C 2610000C */  addiu   $s0, $s0, 0x000C           ## $s0 = FFFFFFD4
/* 00260 80A59E90 27A80088 */  addiu   $t0, $sp, 0x0088           ## $t0 = FFFFFFE0
/* 00264 80A59E94 AFA80010 */  sw      $t0, 0x0010($sp)           
/* 00268 80A59E98 02E02025 */  or      $a0, $s7, $zero            ## $a0 = 00000150
/* 0026C 80A59E9C 02402825 */  or      $a1, $s2, $zero            ## $a1 = 00000000
/* 00270 80A59EA0 02C03025 */  or      $a2, $s6, $zero            ## $a2 = FFFFFFC8
/* 00274 80A59EA4 0C0189E8 */  jal     func_800627A0              
/* 00278 80A59EA8 27A7007C */  addiu   $a3, $sp, 0x007C           ## $a3 = FFFFFFD4
/* 0027C 80A59EAC 26520001 */  addiu   $s2, $s2, 0x0001           ## $s2 = 00000001
/* 00280 80A59EB0 24010002 */  addiu   $at, $zero, 0x0002         ## $at = 00000002
/* 00284 80A59EB4 5641FFD8 */  bnel    $s2, $at, .L80A59E18       
/* 00288 80A59EB8 02C08025 */  or      $s0, $s6, $zero            ## $s0 = FFFFFFC8
/* 0028C 80A59EBC 0C296839 */  jal     func_80A5A0E4              
/* 00290 80A59EC0 03C02025 */  or      $a0, $s8, $zero            ## $a0 = 00000000
/* 00294 80A59EC4 03C02025 */  or      $a0, $s8, $zero            ## $a0 = 00000000
/* 00298 80A59EC8 0C00B56E */  jal     Actor_SetHeight
              
/* 0029C 80A59ECC 24050000 */  addiu   $a1, $zero, 0x0000         ## $a1 = 00000000
/* 002A0 80A59ED0 8FBF0054 */  lw      $ra, 0x0054($sp)           
/* 002A4 80A59ED4 D7B40020 */  ldc1    $f20, 0x0020($sp)          
/* 002A8 80A59ED8 D7B60028 */  ldc1    $f22, 0x0028($sp)          
/* 002AC 80A59EDC 8FB00030 */  lw      $s0, 0x0030($sp)           
/* 002B0 80A59EE0 8FB10034 */  lw      $s1, 0x0034($sp)           
/* 002B4 80A59EE4 8FB20038 */  lw      $s2, 0x0038($sp)           
/* 002B8 80A59EE8 8FB3003C */  lw      $s3, 0x003C($sp)           
/* 002BC 80A59EEC 8FB40040 */  lw      $s4, 0x0040($sp)           
/* 002C0 80A59EF0 8FB50044 */  lw      $s5, 0x0044($sp)           
/* 002C4 80A59EF4 8FB60048 */  lw      $s6, 0x0048($sp)           
/* 002C8 80A59EF8 8FB7004C */  lw      $s7, 0x004C($sp)           
/* 002CC 80A59EFC 8FBE0050 */  lw      $s8, 0x0050($sp)           
/* 002D0 80A59F00 03E00008 */  jr      $ra                        
/* 002D4 80A59F04 27BD00A8 */  addiu   $sp, $sp, 0x00A8           ## $sp = 00000000
