glabel func_80A3DFBC
/* 008DC 80A3DFBC 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 008E0 80A3DFC0 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 008E4 80A3DFC4 AFB00018 */  sw      $s0, 0x0018($sp)           
/* 008E8 80A3DFC8 808E02BC */  lb      $t6, 0x02BC($a0)           ## 000002BC
/* 008EC 80A3DFCC 3C190001 */  lui     $t9, 0x0001                ## $t9 = 00010000
/* 008F0 80A3DFD0 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 008F4 80A3DFD4 000E7900 */  sll     $t7, $t6,  4               
/* 008F8 80A3DFD8 01EE7821 */  addu    $t7, $t7, $t6              
/* 008FC 80A3DFDC 000F7880 */  sll     $t7, $t7,  2               
/* 00900 80A3DFE0 00AFC021 */  addu    $t8, $a1, $t7              
/* 00904 80A3DFE4 0338C821 */  addu    $t9, $t9, $t8              
/* 00908 80A3DFE8 8F3917B4 */  lw      $t9, 0x17B4($t9)           ## 000117B4
/* 0090C 80A3DFEC 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00910 80A3DFF0 03214021 */  addu    $t0, $t9, $at              
/* 00914 80A3DFF4 3C018016 */  lui     $at, %hi(gSegments+0x18)
/* 00918 80A3DFF8 AC286FC0 */  sw      $t0, %lo(gSegments+0x18)($at)
/* 0091C 80A3DFFC 848902BE */  lh      $t1, 0x02BE($a0)           ## 000002BE
/* 00920 80A3E000 252A0001 */  addiu   $t2, $t1, 0x0001           ## $t2 = 00000001
/* 00924 80A3E004 A48A02BE */  sh      $t2, 0x02BE($a0)           ## 000002BE
/* 00928 80A3E008 AFA50024 */  sw      $a1, 0x0024($sp)           
/* 0092C 80A3E00C 8E19026C */  lw      $t9, 0x026C($s0)           ## 0000026C
/* 00930 80A3E010 0320F809 */  jalr    $ra, $t9                   
/* 00934 80A3E014 00000000 */  nop
/* 00938 80A3E018 860B0030 */  lh      $t3, 0x0030($s0)           ## 00000030
/* 0093C 80A3E01C 860C0032 */  lh      $t4, 0x0032($s0)           ## 00000032
/* 00940 80A3E020 860D0034 */  lh      $t5, 0x0034($s0)           ## 00000034
/* 00944 80A3E024 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00948 80A3E028 A60B0044 */  sh      $t3, 0x0044($s0)           ## 00000044
/* 0094C 80A3E02C A60C0046 */  sh      $t4, 0x0046($s0)           ## 00000046
/* 00950 80A3E030 0C28F676 */  jal     func_80A3D9D8              
/* 00954 80A3E034 A60D0048 */  sh      $t5, 0x0048($s0)           ## 00000048
/* 00958 80A3E038 0C02927F */  jal     SkelAnime_FrameUpdateMatrix
              
/* 0095C 80A3E03C 2604014C */  addiu   $a0, $s0, 0x014C           ## $a0 = 0000014C
/* 00960 80A3E040 8FA40024 */  lw      $a0, 0x0024($sp)           
/* 00964 80A3E044 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 00968 80A3E048 34211E60 */  ori     $at, $at, 0x1E60           ## $at = 00011E60
/* 0096C 80A3E04C 26060270 */  addiu   $a2, $s0, 0x0270           ## $a2 = 00000270
/* 00970 80A3E050 0C017713 */  jal     CollisionCheck_SetOC
              ## CollisionCheck_setOT
/* 00974 80A3E054 00812821 */  addu    $a1, $a0, $at              
/* 00978 80A3E058 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 0097C 80A3E05C 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 00980 80A3E060 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
/* 00984 80A3E064 03E00008 */  jr      $ra                        
/* 00988 80A3E068 00000000 */  nop
