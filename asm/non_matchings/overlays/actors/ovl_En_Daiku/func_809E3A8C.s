.late_rodata
glabel D_809E41C0
 .word 0x4622F983
glabel D_809E41C4
 .word 0x41A70A3D, 0x00000000, 0x00000000

.text
glabel func_809E3A8C
/* 00F5C 809E3A8C 27BDFFB8 */  addiu   $sp, $sp, 0xFFB8           ## $sp = FFFFFFB8
/* 00F60 809E3A90 AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 00F64 809E3A94 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 00F68 809E3A98 AFA5004C */  sw      $a1, 0x004C($sp)           
/* 00F6C 809E3A9C 8498001C */  lh      $t8, 0x001C($a0)           ## 0000001C
/* 00F70 809E3AA0 3C0F0001 */  lui     $t7, 0x0001                ## $t7 = 00010000
/* 00F74 809E3AA4 01E57821 */  addu    $t7, $t7, $a1              
/* 00F78 809E3AA8 8DEF1E08 */  lw      $t7, 0x1E08($t7)           ## 00011E08
/* 00F7C 809E3AAC 0018C903 */  sra     $t9, $t8,  4               
/* 00F80 809E3AB0 3328000F */  andi    $t0, $t9, 0x000F           ## $t0 = 00000000
/* 00F84 809E3AB4 000848C0 */  sll     $t1, $t0,  3               
/* 00F88 809E3AB8 01E93021 */  addu    $a2, $t7, $t1              
/* 00F8C 809E3ABC 8CC30004 */  lw      $v1, 0x0004($a2)           ## 00000004
/* 00F90 809E3AC0 8C9901EC */  lw      $t9, 0x01EC($a0)           ## 000001EC
/* 00F94 809E3AC4 3C0D8016 */  lui     $t5, %hi(gSegments)
/* 00F98 809E3AC8 00035100 */  sll     $t2, $v1,  4               
/* 00F9C 809E3ACC 000A5F02 */  srl     $t3, $t2, 28               
/* 00FA0 809E3AD0 000B6080 */  sll     $t4, $t3,  2               
/* 00FA4 809E3AD4 01AC6821 */  addu    $t5, $t5, $t4              
/* 00FA8 809E3AD8 8DAD6FA8 */  lw      $t5, %lo(gSegments)($t5)
/* 00FAC 809E3ADC 3C0100FF */  lui     $at, 0x00FF                ## $at = 00FF0000
/* 00FB0 809E3AE0 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = 00FFFFFF
/* 00FB4 809E3AE4 00194080 */  sll     $t0, $t9,  2               
/* 00FB8 809E3AE8 00617024 */  and     $t6, $v1, $at              
/* 00FBC 809E3AEC 01194023 */  subu    $t0, $t0, $t9              
/* 00FC0 809E3AF0 00084040 */  sll     $t0, $t0,  1               
/* 00FC4 809E3AF4 01AEC021 */  addu    $t8, $t5, $t6              
/* 00FC8 809E3AF8 03081021 */  addu    $v0, $t8, $t0              
/* 00FCC 809E3AFC 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 00FD0 809E3B00 00411021 */  addu    $v0, $v0, $at              
/* 00FD4 809E3B04 844F0000 */  lh      $t7, 0x0000($v0)           ## 00000000
/* 00FD8 809E3B08 84490004 */  lh      $t1, 0x0004($v0)           ## 00000004
/* 00FDC 809E3B0C C4880024 */  lwc1    $f8, 0x0024($a0)           ## 00000024
/* 00FE0 809E3B10 448F2000 */  mtc1    $t7, $f4                   ## $f4 = 0.00
/* 00FE4 809E3B14 44895000 */  mtc1    $t1, $f10                  ## $f10 = 0.00
/* 00FE8 809E3B18 C492002C */  lwc1    $f18, 0x002C($a0)          ## 0000002C
/* 00FEC 809E3B1C 468021A0 */  cvt.s.w $f6, $f4                   
/* 00FF0 809E3B20 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00FF4 809E3B24 AFA60040 */  sw      $a2, 0x0040($sp)           
/* 00FF8 809E3B28 46805420 */  cvt.s.w $f16, $f10                 
/* 00FFC 809E3B2C 46083301 */  sub.s   $f12, $f6, $f8             
/* 01000 809E3B30 46128381 */  sub.s   $f14, $f16, $f18           
/* 01004 809E3B34 E7AC0038 */  swc1    $f12, 0x0038($sp)          
/* 01008 809E3B38 0C03F494 */  jal     Math_atan2f              
/* 0100C 809E3B3C E7AE0034 */  swc1    $f14, 0x0034($sp)          
/* 01010 809E3B40 3C01809E */  lui     $at, %hi(D_809E41C0)       ## $at = 809E0000
/* 01014 809E3B44 C42441C0 */  lwc1    $f4, %lo(D_809E41C0)($at)  
/* 01018 809E3B48 C7AC0038 */  lwc1    $f12, 0x0038($sp)          
/* 0101C 809E3B4C C7AE0034 */  lwc1    $f14, 0x0034($sp)          
/* 01020 809E3B50 46040182 */  mul.s   $f6, $f0, $f4              
/* 01024 809E3B54 3C01809E */  lui     $at, %hi(D_809E41C4)       ## $at = 809E0000
/* 01028 809E3B58 C43241C4 */  lwc1    $f18, %lo(D_809E41C4)($at) 
/* 0102C 809E3B5C 460C6282 */  mul.s   $f10, $f12, $f12           
/* 01030 809E3B60 8FA60040 */  lw      $a2, 0x0040($sp)           
/* 01034 809E3B64 260400B6 */  addiu   $a0, $s0, 0x00B6           ## $a0 = 000000B6
/* 01038 809E3B68 460E7402 */  mul.s   $f16, $f14, $f14           
/* 0103C 809E3B6C 24070FA0 */  addiu   $a3, $zero, 0x0FA0         ## $a3 = 00000FA0
/* 01040 809E3B70 4600320D */  trunc.w.s $f8, $f6                   
/* 01044 809E3B74 46105000 */  add.s   $f0, $f10, $f16            
/* 01048 809E3B78 44054000 */  mfc1    $a1, $f8                   
/* 0104C 809E3B7C 46000084 */  sqrt.s  $f2, $f0                   
/* 01050 809E3B80 00052C00 */  sll     $a1, $a1, 16               
/* 01054 809E3B84 00052C03 */  sra     $a1, $a1, 16               
/* 01058 809E3B88 4612103E */  c.le.s  $f2, $f18                  
/* 0105C 809E3B8C 00000000 */  nop
/* 01060 809E3B90 45020013 */  bc1fl   .L809E3BE0                 
/* 01064 809E3B94 24060001 */  addiu   $a2, $zero, 0x0001         ## $a2 = 00000001
/* 01068 809E3B98 8E0B01EC */  lw      $t3, 0x01EC($s0)           ## 000001EC
/* 0106C 809E3B9C 256C0001 */  addiu   $t4, $t3, 0x0001           ## $t4 = 00000001
/* 01070 809E3BA0 AE0C01EC */  sw      $t4, 0x01EC($s0)           ## 000001EC
/* 01074 809E3BA4 90CE0000 */  lbu     $t6, 0x0000($a2)           ## 00000001
/* 01078 809E3BA8 018E082A */  slt     $at, $t4, $t6              
/* 0107C 809E3BAC 5420000C */  bnel    $at, $zero, .L809E3BE0     
/* 01080 809E3BB0 24060001 */  addiu   $a2, $zero, 0x0001         ## $a2 = 00000001
/* 01084 809E3BB4 8E1901FC */  lw      $t9, 0x01FC($s0)           ## 000001FC
/* 01088 809E3BB8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0108C 809E3BBC 13200003 */  beq     $t9, $zero, .L809E3BCC     
/* 01090 809E3BC0 00000000 */  nop
/* 01094 809E3BC4 0C278E55 */  jal     func_809E3954              
/* 01098 809E3BC8 8FA5004C */  lw      $a1, 0x004C($sp)           
.L809E3BCC:
/* 0109C 809E3BCC 0C00B55C */  jal     Actor_Kill
              
/* 010A0 809E3BD0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 010A4 809E3BD4 1000002B */  beq     $zero, $zero, .L809E3C84   
/* 010A8 809E3BD8 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 010AC 809E3BDC 24060001 */  addiu   $a2, $zero, 0x0001         ## $a2 = 00000001
.L809E3BE0:
/* 010B0 809E3BE0 AFA00010 */  sw      $zero, 0x0010($sp)         
/* 010B4 809E3BE4 0C01E1A7 */  jal     Math_SmoothScaleMaxMinS
              
/* 010B8 809E3BE8 E7A2002C */  swc1    $f2, 0x002C($sp)           
/* 010BC 809E3BEC C7A2002C */  lwc1    $f2, 0x002C($sp)           
/* 010C0 809E3BF0 861800B6 */  lh      $t8, 0x00B6($s0)           ## 000000B6
/* 010C4 809E3BF4 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 010C8 809E3BF8 8E0501F0 */  lw      $a1, 0x01F0($s0)           ## 000001F0
/* 010CC 809E3BFC 3C063F19 */  lui     $a2, 0x3F19                ## $a2 = 3F190000
/* 010D0 809E3C00 44071000 */  mfc1    $a3, $f2                   
/* 010D4 809E3C04 A6180032 */  sh      $t8, 0x0032($s0)           ## 00000032
/* 010D8 809E3C08 34C6999A */  ori     $a2, $a2, 0x999A           ## $a2 = 3F19999A
/* 010DC 809E3C0C 26040068 */  addiu   $a0, $s0, 0x0068           ## $a0 = 00000068
/* 010E0 809E3C10 0C01E0C4 */  jal     Math_SmoothScaleMaxMinF
              
/* 010E4 809E3C14 E7A40010 */  swc1    $f4, 0x0010($sp)           
/* 010E8 809E3C18 0C00B638 */  jal     Actor_MoveForward
              
/* 010EC 809E3C1C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 010F0 809E3C20 44800000 */  mtc1    $zero, $f0                 ## $f0 = 0.00
/* 010F4 809E3C24 24080004 */  addiu   $t0, $zero, 0x0004         ## $t0 = 00000004
/* 010F8 809E3C28 AFA80014 */  sw      $t0, 0x0014($sp)           
/* 010FC 809E3C2C 44060000 */  mfc1    $a2, $f0                   
/* 01100 809E3C30 44070000 */  mfc1    $a3, $f0                   
/* 01104 809E3C34 8FA4004C */  lw      $a0, 0x004C($sp)           
/* 01108 809E3C38 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 0110C 809E3C3C 0C00B92D */  jal     func_8002E4B4              
/* 01110 809E3C40 E7A00010 */  swc1    $f0, 0x0010($sp)           
/* 01114 809E3C44 8E0F01FC */  lw      $t7, 0x01FC($s0)           ## 000001FC
/* 01118 809E3C48 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0111C 809E3C4C 11E0000A */  beq     $t7, $zero, .L809E3C78     
/* 01120 809E3C50 00000000 */  nop
/* 01124 809E3C54 0C278E27 */  jal     func_809E389C              
/* 01128 809E3C58 8FA5004C */  lw      $a1, 0x004C($sp)           
/* 0112C 809E3C5C 8E020200 */  lw      $v0, 0x0200($s0)           ## 00000200
/* 01130 809E3C60 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01134 809E3C64 2449FFFF */  addiu   $t1, $v0, 0xFFFF           ## $t1 = FFFFFFFF
/* 01138 809E3C68 1C400003 */  bgtz    $v0, .L809E3C78            
/* 0113C 809E3C6C AE090200 */  sw      $t1, 0x0200($s0)           ## 00000200
/* 01140 809E3C70 0C278E55 */  jal     func_809E3954              
/* 01144 809E3C74 8FA5004C */  lw      $a1, 0x004C($sp)           
.L809E3C78:
/* 01148 809E3C78 0C02927F */  jal     SkelAnime_FrameUpdateMatrix
              
/* 0114C 809E3C7C 2604014C */  addiu   $a0, $s0, 0x014C           ## $a0 = 0000014C
/* 01150 809E3C80 8FBF0024 */  lw      $ra, 0x0024($sp)           
.L809E3C84:
/* 01154 809E3C84 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 01158 809E3C88 27BD0048 */  addiu   $sp, $sp, 0x0048           ## $sp = 00000000
/* 0115C 809E3C8C 03E00008 */  jr      $ra                        
/* 01160 809E3C90 00000000 */  nop
