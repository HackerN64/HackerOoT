glabel func_80A5A658
/* 00A28 80A5A658 27BDFF90 */  addiu   $sp, $sp, 0xFF90           ## $sp = FFFFFF90
/* 00A2C 80A5A65C AFB0001C */  sw      $s0, 0x001C($sp)           
/* 00A30 80A5A660 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00A34 80A5A664 AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 00A38 80A5A668 AFA50074 */  sw      $a1, 0x0074($sp)           
/* 00A3C 80A5A66C AFB10020 */  sw      $s1, 0x0020($sp)           
/* 00A40 80A5A670 3C054150 */  lui     $a1, 0x4150                ## $a1 = 41500000
/* 00A44 80A5A674 24840238 */  addiu   $a0, $a0, 0x0238           ## $a0 = 00000238
/* 00A48 80A5A678 0C01DE80 */  jal     Math_ApproxF
              
/* 00A4C 80A5A67C 3C063F00 */  lui     $a2, 0x3F00                ## $a2 = 3F000000
/* 00A50 80A5A680 C6020238 */  lwc1    $f2, 0x0238($s0)           ## 00000238
/* 00A54 80A5A684 C604005C */  lwc1    $f4, 0x005C($s0)           ## 0000005C
/* 00A58 80A5A688 C6060060 */  lwc1    $f6, 0x0060($s0)           ## 00000060
/* 00A5C 80A5A68C 26040024 */  addiu   $a0, $s0, 0x0024           ## $a0 = 00000024
/* 00A60 80A5A690 46041002 */  mul.s   $f0, $f2, $f4              
/* 00A64 80A5A694 46000305 */  abs.s   $f12, $f0                  
/* 00A68 80A5A698 46061002 */  mul.s   $f0, $f2, $f6              
/* 00A6C 80A5A69C 44066000 */  mfc1    $a2, $f12                  
/* 00A70 80A5A6A0 46000005 */  abs.s   $f0, $f0                   
/* 00A74 80A5A6A4 E7A00064 */  swc1    $f0, 0x0064($sp)           
/* 00A78 80A5A6A8 C6080064 */  lwc1    $f8, 0x0064($s0)           ## 00000064
/* 00A7C 80A5A6AC 46081002 */  mul.s   $f0, $f2, $f8              
/* 00A80 80A5A6B0 46000005 */  abs.s   $f0, $f0                   
/* 00A84 80A5A6B4 E7A00068 */  swc1    $f0, 0x0068($sp)           
/* 00A88 80A5A6B8 0C01DE80 */  jal     Math_ApproxF
              
/* 00A8C 80A5A6BC 8E05022C */  lw      $a1, 0x022C($s0)           ## 0000022C
/* 00A90 80A5A6C0 30510001 */  andi    $s1, $v0, 0x0001           ## $s1 = 00000000
/* 00A94 80A5A6C4 26040028 */  addiu   $a0, $s0, 0x0028           ## $a0 = 00000028
/* 00A98 80A5A6C8 8E050230 */  lw      $a1, 0x0230($s0)           ## 00000230
/* 00A9C 80A5A6CC 0C01DE80 */  jal     Math_ApproxF
              
/* 00AA0 80A5A6D0 8FA60064 */  lw      $a2, 0x0064($sp)           
/* 00AA4 80A5A6D4 02228824 */  and     $s1, $s1, $v0              
/* 00AA8 80A5A6D8 2604002C */  addiu   $a0, $s0, 0x002C           ## $a0 = 0000002C
/* 00AAC 80A5A6DC 8E050234 */  lw      $a1, 0x0234($s0)           ## 00000234
/* 00AB0 80A5A6E0 0C01DE80 */  jal     Math_ApproxF
              
/* 00AB4 80A5A6E4 8FA60068 */  lw      $a2, 0x0068($sp)           
/* 00AB8 80A5A6E8 44805000 */  mtc1    $zero, $f10                ## $f10 = 0.00
/* 00ABC 80A5A6EC 240E001D */  addiu   $t6, $zero, 0x001D         ## $t6 = 0000001D
/* 00AC0 80A5A6F0 02228824 */  and     $s1, $s1, $v0              
/* 00AC4 80A5A6F4 AFAE0014 */  sw      $t6, 0x0014($sp)           
/* 00AC8 80A5A6F8 8FA40074 */  lw      $a0, 0x0074($sp)           
/* 00ACC 80A5A6FC 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 00AD0 80A5A700 3C0640E0 */  lui     $a2, 0x40E0                ## $a2 = 40E00000
/* 00AD4 80A5A704 3C074120 */  lui     $a3, 0x4120                ## $a3 = 41200000
/* 00AD8 80A5A708 0C00B92D */  jal     func_8002E4B4              
/* 00ADC 80A5A70C E7AA0010 */  swc1    $f10, 0x0010($sp)          
/* 00AE0 80A5A710 92020160 */  lbu     $v0, 0x0160($s0)           ## 00000160
/* 00AE4 80A5A714 44800000 */  mtc1    $zero, $f0                 ## $f0 = 0.00
/* 00AE8 80A5A718 8FB80074 */  lw      $t8, 0x0074($sp)           
/* 00AEC 80A5A71C 304F0004 */  andi    $t7, $v0, 0x0004           ## $t7 = 00000000
/* 00AF0 80A5A720 11E00026 */  beq     $t7, $zero, .L80A5A7BC     
/* 00AF4 80A5A724 30490002 */  andi    $t1, $v0, 0x0002           ## $t1 = 00000000
/* 00AF8 80A5A728 8F021C44 */  lw      $v0, 0x1C44($t8)           ## 00001C44
/* 00AFC 80A5A72C 27B1004C */  addiu   $s1, $sp, 0x004C           ## $s1 = FFFFFFDC
/* 00B00 80A5A730 02202025 */  or      $a0, $s1, $zero            ## $a0 = FFFFFFDC
/* 00B04 80A5A734 C4500A40 */  lwc1    $f16, 0x0A40($v0)          ## 00000A40
/* 00B08 80A5A738 27A50034 */  addiu   $a1, $sp, 0x0034           ## $a1 = FFFFFFC4
/* 00B0C 80A5A73C 46008487 */  neg.s   $f18, $f16                 
/* 00B10 80A5A740 E7B20034 */  swc1    $f18, 0x0034($sp)          
/* 00B14 80A5A744 C4440A44 */  lwc1    $f4, 0x0A44($v0)           ## 00000A44
/* 00B18 80A5A748 46002187 */  neg.s   $f6, $f4                   
/* 00B1C 80A5A74C E7A60038 */  swc1    $f6, 0x0038($sp)           
/* 00B20 80A5A750 C4480A48 */  lwc1    $f8, 0x0A48($v0)           ## 00000A48
/* 00B24 80A5A754 46004287 */  neg.s   $f10, $f8                  
/* 00B28 80A5A758 0C296730 */  jal     func_80A59CC0              
/* 00B2C 80A5A75C E7AA003C */  swc1    $f10, 0x003C($sp)          
/* 00B30 80A5A760 2606005C */  addiu   $a2, $s0, 0x005C           ## $a2 = 0000005C
/* 00B34 80A5A764 8CC80000 */  lw      $t0, 0x0000($a2)           ## 0000005C
/* 00B38 80A5A768 27A40040 */  addiu   $a0, $sp, 0x0040           ## $a0 = FFFFFFD0
/* 00B3C 80A5A76C 02202825 */  or      $a1, $s1, $zero            ## $a1 = FFFFFFDC
/* 00B40 80A5A770 AC880000 */  sw      $t0, 0x0000($a0)           ## FFFFFFD0
/* 00B44 80A5A774 8CD90004 */  lw      $t9, 0x0004($a2)           ## 00000060
/* 00B48 80A5A778 AC990004 */  sw      $t9, 0x0004($a0)           ## FFFFFFD4
/* 00B4C 80A5A77C 8CC80008 */  lw      $t0, 0x0008($a2)           ## 00000064
/* 00B50 80A5A780 0C032C30 */  jal     Math3D_Vec3fReflect              
/* 00B54 80A5A784 AC880008 */  sw      $t0, 0x0008($a0)           ## FFFFFFD8
/* 00B58 80A5A788 3C013F00 */  lui     $at, 0x3F00                ## $at = 3F000000
/* 00B5C 80A5A78C 44819000 */  mtc1    $at, $f18                  ## $f18 = 0.50
/* 00B60 80A5A790 C6100238 */  lwc1    $f16, 0x0238($s0)          ## 00000238
/* 00B64 80A5A794 C60C0064 */  lwc1    $f12, 0x0064($s0)          ## 00000064
/* 00B68 80A5A798 C60E005C */  lwc1    $f14, 0x005C($s0)          ## 0000005C
/* 00B6C 80A5A79C 46128102 */  mul.s   $f4, $f16, $f18            
/* 00B70 80A5A7A0 0C034199 */  jal     atan2s
              
/* 00B74 80A5A7A4 E6040068 */  swc1    $f4, 0x0068($s0)           ## 00000068
/* 00B78 80A5A7A8 A6020032 */  sh      $v0, 0x0032($s0)           ## 00000032
/* 00B7C 80A5A7AC 0C296A85 */  jal     func_80A5AA14              
/* 00B80 80A5A7B0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00B84 80A5A7B4 10000017 */  beq     $zero, $zero, .L80A5A814   
/* 00B88 80A5A7B8 8FBF0024 */  lw      $ra, 0x0024($sp)           
.L80A5A7BC:
/* 00B8C 80A5A7BC 11200006 */  beq     $t1, $zero, .L80A5A7D8     
/* 00B90 80A5A7C0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00B94 80A5A7C4 E6000068 */  swc1    $f0, 0x0068($s0)           ## 00000068
/* 00B98 80A5A7C8 0C296A85 */  jal     func_80A5AA14              
/* 00B9C 80A5A7CC E6000060 */  swc1    $f0, 0x0060($s0)           ## 00000060
/* 00BA0 80A5A7D0 10000010 */  beq     $zero, $zero, .L80A5A814   
/* 00BA4 80A5A7D4 8FBF0024 */  lw      $ra, 0x0024($sp)           
.L80A5A7D8:
/* 00BA8 80A5A7D8 860A0228 */  lh      $t2, 0x0228($s0)           ## 00000228
/* 00BAC 80A5A7DC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00BB0 80A5A7E0 1D400005 */  bgtz    $t2, .L80A5A7F8            
/* 00BB4 80A5A7E4 00000000 */  nop
/* 00BB8 80A5A7E8 0C296A85 */  jal     func_80A5AA14              
/* 00BBC 80A5A7EC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00BC0 80A5A7F0 10000008 */  beq     $zero, $zero, .L80A5A814   
/* 00BC4 80A5A7F4 8FBF0024 */  lw      $ra, 0x0024($sp)           
.L80A5A7F8:
/* 00BC8 80A5A7F8 0C29670C */  jal     func_80A59C30              
/* 00BCC 80A5A7FC 8FA50074 */  lw      $a1, 0x0074($sp)           
/* 00BD0 80A5A800 52200004 */  beql    $s1, $zero, .L80A5A814     
/* 00BD4 80A5A804 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 00BD8 80A5A808 0C296A09 */  jal     func_80A5A824              
/* 00BDC 80A5A80C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00BE0 80A5A810 8FBF0024 */  lw      $ra, 0x0024($sp)           
.L80A5A814:
/* 00BE4 80A5A814 8FB0001C */  lw      $s0, 0x001C($sp)           
/* 00BE8 80A5A818 8FB10020 */  lw      $s1, 0x0020($sp)           
/* 00BEC 80A5A81C 03E00008 */  jr      $ra                        
/* 00BF0 80A5A820 27BD0070 */  addiu   $sp, $sp, 0x0070           ## $sp = 00000000
