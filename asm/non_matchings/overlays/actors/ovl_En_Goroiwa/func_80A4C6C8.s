.late_rodata
glabel D_80A4E068
    .float 0.01

.text
glabel func_80A4C6C8
/* 00A28 80A4C6C8 27BDFFD0 */  addiu   $sp, $sp, 0xFFD0           ## $sp = FFFFFFD0
/* 00A2C 80A4C6CC 3C0E8016 */  lui     $t6, %hi(gGameInfo)
/* 00A30 80A4C6D0 8DCEFA90 */  lw      $t6, %lo(gGameInfo)($t6)
/* 00A34 80A4C6D4 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 00A38 80A4C6D8 AFB00018 */  sw      $s0, 0x0018($sp)           
/* 00A3C 80A4C6DC AFA50034 */  sw      $a1, 0x0034($sp)           
/* 00A40 80A4C6E0 85CF116C */  lh      $t7, 0x116C($t6)           ## 8016116C
/* 00A44 80A4C6E4 3C0180A5 */  lui     $at, %hi(D_80A4E068)       ## $at = 80A50000
/* 00A48 80A4C6E8 C428E068 */  lwc1    $f8, %lo(D_80A4E068)($at)  
/* 00A4C 80A4C6EC 448F2000 */  mtc1    $t7, $f4                   ## $f4 = 0.00
/* 00A50 80A4C6F0 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00A54 80A4C6F4 3C063E99 */  lui     $a2, 0x3E99                ## $a2 = 3E990000
/* 00A58 80A4C6F8 468021A0 */  cvt.s.w $f6, $f4                   
/* 00A5C 80A4C6FC 34C6999A */  ori     $a2, $a2, 0x999A           ## $a2 = 3E99999A
/* 00A60 80A4C700 24840068 */  addiu   $a0, $a0, 0x0068           ## $a0 = 00000068
/* 00A64 80A4C704 46083282 */  mul.s   $f10, $f6, $f8             
/* 00A68 80A4C708 44055000 */  mfc1    $a1, $f10                  
/* 00A6C 80A4C70C 0C01DE80 */  jal     Math_ApproxF
              
/* 00A70 80A4C710 00000000 */  nop
/* 00A74 80A4C714 0C00B61A */  jal     func_8002D868              
/* 00A78 80A4C718 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00A7C 80A4C71C 8FB80034 */  lw      $t8, 0x0034($sp)           
/* 00A80 80A4C720 8608001C */  lh      $t0, 0x001C($s0)           ## 0000001C
/* 00A84 80A4C724 3C190001 */  lui     $t9, 0x0001                ## $t9 = 00010000
/* 00A88 80A4C728 0338C821 */  addu    $t9, $t9, $t8              
/* 00A8C 80A4C72C 8F391E08 */  lw      $t9, 0x1E08($t9)           ## 00011E08
/* 00A90 80A4C730 310900FF */  andi    $t1, $t0, 0x00FF           ## $t1 = 00000000
/* 00A94 80A4C734 000950C0 */  sll     $t2, $t1,  3               
/* 00A98 80A4C738 032A1821 */  addu    $v1, $t9, $t2              
/* 00A9C 80A4C73C 8C620004 */  lw      $v0, 0x0004($v1)           ## 00000004
/* 00AA0 80A4C740 860801CE */  lh      $t0, 0x01CE($s0)           ## 000001CE
/* 00AA4 80A4C744 3C0E8016 */  lui     $t6, %hi(gSegments)
/* 00AA8 80A4C748 00025900 */  sll     $t3, $v0,  4               
/* 00AAC 80A4C74C 000B6702 */  srl     $t4, $t3, 28               
/* 00AB0 80A4C750 000C6880 */  sll     $t5, $t4,  2               
/* 00AB4 80A4C754 01CD7021 */  addu    $t6, $t6, $t5              
/* 00AB8 80A4C758 8DCE6FA8 */  lw      $t6, %lo(gSegments)($t6)
/* 00ABC 80A4C75C 3C0100FF */  lui     $at, 0x00FF                ## $at = 00FF0000
/* 00AC0 80A4C760 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = 00FFFFFF
/* 00AC4 80A4C764 00084880 */  sll     $t1, $t0,  2               
/* 00AC8 80A4C768 00417824 */  and     $t7, $v0, $at              
/* 00ACC 80A4C76C 01284823 */  subu    $t1, $t1, $t0              
/* 00AD0 80A4C770 00094840 */  sll     $t1, $t1,  1               
/* 00AD4 80A4C774 01CFC021 */  addu    $t8, $t6, $t7              
/* 00AD8 80A4C778 03093821 */  addu    $a3, $t8, $t1              
/* 00ADC 80A4C77C 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 00AE0 80A4C780 00E13821 */  addu    $a3, $a3, $at              
/* 00AE4 80A4C784 84F90000 */  lh      $t9, 0x0000($a3)           ## 00000000
/* 00AE8 80A4C788 C600005C */  lwc1    $f0, 0x005C($s0)           ## 0000005C
/* 00AEC 80A4C78C AFA70020 */  sw      $a3, 0x0020($sp)           
/* 00AF0 80A4C790 44998000 */  mtc1    $t9, $f16                  ## $f16 = 0.00
/* 00AF4 80A4C794 46000005 */  abs.s   $f0, $f0                   
/* 00AF8 80A4C798 26040024 */  addiu   $a0, $s0, 0x0024           ## $a0 = 00000024
/* 00AFC 80A4C79C 46808420 */  cvt.s.w $f16, $f16                 
/* 00B00 80A4C7A0 44060000 */  mfc1    $a2, $f0                   
/* 00B04 80A4C7A4 44058000 */  mfc1    $a1, $f16                  
/* 00B08 80A4C7A8 0C01DE80 */  jal     Math_ApproxF
              
/* 00B0C 80A4C7AC 00000000 */  nop
/* 00B10 80A4C7B0 8FA70020 */  lw      $a3, 0x0020($sp)           
/* 00B14 80A4C7B4 C6000064 */  lwc1    $f0, 0x0064($s0)           ## 00000064
/* 00B18 80A4C7B8 30430001 */  andi    $v1, $v0, 0x0001           ## $v1 = 00000000
/* 00B1C 80A4C7BC 84EA0004 */  lh      $t2, 0x0004($a3)           ## 00000004
/* 00B20 80A4C7C0 46000005 */  abs.s   $f0, $f0                   
/* 00B24 80A4C7C4 AFA30028 */  sw      $v1, 0x0028($sp)           
/* 00B28 80A4C7C8 448A9000 */  mtc1    $t2, $f18                  ## $f18 = 0.00
/* 00B2C 80A4C7CC 44060000 */  mfc1    $a2, $f0                   
/* 00B30 80A4C7D0 2604002C */  addiu   $a0, $s0, 0x002C           ## $a0 = 0000002C
/* 00B34 80A4C7D4 468094A0 */  cvt.s.w $f18, $f18                 
/* 00B38 80A4C7D8 44059000 */  mfc1    $a1, $f18                  
/* 00B3C 80A4C7DC 0C01DE80 */  jal     Math_ApproxF
              
/* 00B40 80A4C7E0 00000000 */  nop
/* 00B44 80A4C7E4 C6040028 */  lwc1    $f4, 0x0028($s0)           ## 00000028
/* 00B48 80A4C7E8 C6060060 */  lwc1    $f6, 0x0060($s0)           ## 00000060
/* 00B4C 80A4C7EC 8FA30028 */  lw      $v1, 0x0028($sp)           
/* 00B50 80A4C7F0 46062200 */  add.s   $f8, $f4, $f6              
/* 00B54 80A4C7F4 00621824 */  and     $v1, $v1, $v0              
/* 00B58 80A4C7F8 00601025 */  or      $v0, $v1, $zero            ## $v0 = 00000000
/* 00B5C 80A4C7FC E6080028 */  swc1    $f8, 0x0028($s0)           ## 00000028
/* 00B60 80A4C800 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 00B64 80A4C804 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 00B68 80A4C808 27BD0030 */  addiu   $sp, $sp, 0x0030           ## $sp = 00000000
/* 00B6C 80A4C80C 03E00008 */  jr      $ra                        
/* 00B70 80A4C810 00000000 */  nop
