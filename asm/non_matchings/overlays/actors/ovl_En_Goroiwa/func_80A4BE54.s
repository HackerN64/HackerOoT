glabel func_80A4BE54
/* 001B4 80A4BE54 27BDFFD0 */  addiu   $sp, $sp, 0xFFD0           ## $sp = FFFFFFD0
/* 001B8 80A4BE58 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 001BC 80A4BE5C AFA50034 */  sw      $a1, 0x0034($sp)           
/* 001C0 80A4BE60 8498001C */  lh      $t8, 0x001C($a0)           ## 0000001C
/* 001C4 80A4BE64 3C0F0001 */  lui     $t7, 0x0001                ## $t7 = 00010000
/* 001C8 80A4BE68 01E57821 */  addu    $t7, $t7, $a1              
/* 001CC 80A4BE6C 8DEF1E08 */  lw      $t7, 0x1E08($t7)           ## 00011E08
/* 001D0 80A4BE70 331900FF */  andi    $t9, $t8, 0x00FF           ## $t9 = 00000000
/* 001D4 80A4BE74 001940C0 */  sll     $t0, $t9,  3               
/* 001D8 80A4BE78 01E83021 */  addu    $a2, $t7, $t0              
/* 001DC 80A4BE7C 8CC30004 */  lw      $v1, 0x0004($a2)           ## 00000004
/* 001E0 80A4BE80 849801CE */  lh      $t8, 0x01CE($a0)           ## 000001CE
/* 001E4 80A4BE84 3C0C8016 */  lui     $t4, %hi(gSegments)
/* 001E8 80A4BE88 00034900 */  sll     $t1, $v1,  4               
/* 001EC 80A4BE8C 00095702 */  srl     $t2, $t1, 28               
/* 001F0 80A4BE90 000A5880 */  sll     $t3, $t2,  2               
/* 001F4 80A4BE94 018B6021 */  addu    $t4, $t4, $t3              
/* 001F8 80A4BE98 8D8C6FA8 */  lw      $t4, %lo(gSegments)($t4)
/* 001FC 80A4BE9C 3C0100FF */  lui     $at, 0x00FF                ## $at = 00FF0000
/* 00200 80A4BEA0 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = 00FFFFFF
/* 00204 80A4BEA4 0018C880 */  sll     $t9, $t8,  2               
/* 00208 80A4BEA8 00616824 */  and     $t5, $v1, $at              
/* 0020C 80A4BEAC 0338C823 */  subu    $t9, $t9, $t8              
/* 00210 80A4BEB0 0019C840 */  sll     $t9, $t9,  1               
/* 00214 80A4BEB4 018D7021 */  addu    $t6, $t4, $t5              
/* 00218 80A4BEB8 01D91021 */  addu    $v0, $t6, $t9              
/* 0021C 80A4BEBC 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 00220 80A4BEC0 00411021 */  addu    $v0, $v0, $at              
/* 00224 80A4BEC4 844F0000 */  lh      $t7, 0x0000($v0)           ## 00000000
/* 00228 80A4BEC8 00803825 */  or      $a3, $a0, $zero            ## $a3 = 00000000
/* 0022C 80A4BECC 24840024 */  addiu   $a0, $a0, 0x0024           ## $a0 = 00000024
/* 00230 80A4BED0 448F2000 */  mtc1    $t7, $f4                   ## $f4 = 0.00
/* 00234 80A4BED4 27A5001C */  addiu   $a1, $sp, 0x001C           ## $a1 = FFFFFFEC
/* 00238 80A4BED8 468021A0 */  cvt.s.w $f6, $f4                   
/* 0023C 80A4BEDC E7A6001C */  swc1    $f6, 0x001C($sp)           
/* 00240 80A4BEE0 84480002 */  lh      $t0, 0x0002($v0)           ## 00000002
/* 00244 80A4BEE4 44884000 */  mtc1    $t0, $f8                   ## $f8 = 0.00
/* 00248 80A4BEE8 00000000 */  nop
/* 0024C 80A4BEEC 468042A0 */  cvt.s.w $f10, $f8                  
/* 00250 80A4BEF0 E7AA0020 */  swc1    $f10, 0x0020($sp)          
/* 00254 80A4BEF4 84490004 */  lh      $t1, 0x0004($v0)           ## 00000004
/* 00258 80A4BEF8 AFA70030 */  sw      $a3, 0x0030($sp)           
/* 0025C 80A4BEFC 44898000 */  mtc1    $t1, $f16                  ## $f16 = 0.00
/* 00260 80A4BF00 00000000 */  nop
/* 00264 80A4BF04 468084A0 */  cvt.s.w $f18, $f16                 
/* 00268 80A4BF08 0C01E01A */  jal     Math_Vec3f_Yaw
              
/* 0026C 80A4BF0C E7B20024 */  swc1    $f18, 0x0024($sp)          
/* 00270 80A4BF10 8FA70030 */  lw      $a3, 0x0030($sp)           
/* 00274 80A4BF14 A4E20032 */  sh      $v0, 0x0032($a3)           ## 00000032
/* 00278 80A4BF18 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 0027C 80A4BF1C 27BD0030 */  addiu   $sp, $sp, 0x0030           ## $sp = 00000000
/* 00280 80A4BF20 03E00008 */  jr      $ra                        
/* 00284 80A4BF24 00000000 */  nop
