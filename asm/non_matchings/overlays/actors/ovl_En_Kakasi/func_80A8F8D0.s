.rdata
glabel D_80A8FE70
    .asciz "\x1b[34m☆☆☆☆☆ 終り？ ☆☆☆☆☆ \n\x1b[m"
    .balign 4

.text
glabel func_80A8F8D0
/* 00760 80A8F8D0 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 00764 80A8F8D4 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 00768 80A8F8D8 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 0076C 80A8F8DC AFB00018 */  sw      $s0, 0x0018($sp)           
/* 00770 80A8F8E0 00A11821 */  addu    $v1, $a1, $at              
/* 00774 80A8F8E4 946604C6 */  lhu     $a2, 0x04C6($v1)           ## 000004C6
/* 00778 80A8F8E8 24010004 */  addiu   $at, $zero, 0x0004         ## $at = 00000004
/* 0077C 80A8F8EC 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00780 80A8F8F0 00A03825 */  or      $a3, $a1, $zero            ## $a3 = 00000000
/* 00784 80A8F8F4 14C10023 */  bne     $a2, $at, .L80A8F984       
/* 00788 80A8F8F8 8CA21C44 */  lw      $v0, 0x1C44($a1)           ## 00001C44
/* 0078C 80A8F8FC 906E03DC */  lbu     $t6, 0x03DC($v1)           ## 000003DC
/* 00790 80A8F900 3C0480A9 */  lui     $a0, %hi(D_80A8FE70)       ## $a0 = 80A90000
/* 00794 80A8F904 2484FE70 */  addiu   $a0, $a0, %lo(D_80A8FE70)  ## $a0 = 80A8FE70
/* 00798 80A8F908 55C0001F */  bnel    $t6, $zero, .L80A8F988     
/* 0079C 80A8F90C 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 007A0 80A8F910 0C00084C */  jal     osSyncPrintf
              
/* 007A4 80A8F914 AFA5002C */  sw      $a1, 0x002C($sp)           
/* 007A8 80A8F918 860F019A */  lh      $t7, 0x019A($s0)           ## 0000019A
/* 007AC 80A8F91C 8FA7002C */  lw      $a3, 0x002C($sp)           
/* 007B0 80A8F920 11E00010 */  beq     $t7, $zero, .L80A8F964     
/* 007B4 80A8F924 00E02025 */  or      $a0, $a3, $zero            ## $a0 = 00000000
/* 007B8 80A8F928 00E02025 */  or      $a0, $a3, $zero            ## $a0 = 00000000
/* 007BC 80A8F92C 0C041B33 */  jal     func_80106CCC              
/* 007C0 80A8F930 AFA7002C */  sw      $a3, 0x002C($sp)           
/* 007C4 80A8F934 8FA4002C */  lw      $a0, 0x002C($sp)           
/* 007C8 80A8F938 24184077 */  addiu   $t8, $zero, 0x4077         ## $t8 = 00004077
/* 007CC 80A8F93C 24190005 */  addiu   $t9, $zero, 0x0005         ## $t9 = 00000005
/* 007D0 80A8F940 A618010E */  sh      $t8, 0x010E($s0)           ## 0000010E
/* 007D4 80A8F944 A6190196 */  sh      $t9, 0x0196($s0)           ## 00000196
/* 007D8 80A8F948 3305FFFF */  andi    $a1, $t8, 0xFFFF           ## $a1 = 00004077
/* 007DC 80A8F94C 0C042DA0 */  jal     func_8010B680              
/* 007E0 80A8F950 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 007E4 80A8F954 3C0880A9 */  lui     $t0, %hi(func_80A8F9C8)    ## $t0 = 80A90000
/* 007E8 80A8F958 2508F9C8 */  addiu   $t0, $t0, %lo(func_80A8F9C8) ## $t0 = 80A8F9C8
/* 007EC 80A8F95C 10000015 */  beq     $zero, $zero, .L80A8F9B4   
/* 007F0 80A8F960 AE08014C */  sw      $t0, 0x014C($s0)           ## 0000014C
.L80A8F964:
/* 007F4 80A8F964 0C0200FC */  jal     func_800803F0              
/* 007F8 80A8F968 86050208 */  lh      $a1, 0x0208($s0)           ## 00000208
/* 007FC 80A8F96C 3C0A80A9 */  lui     $t2, %hi(func_80A8F660)    ## $t2 = 80A90000
/* 00800 80A8F970 2409FFFF */  addiu   $t1, $zero, 0xFFFF         ## $t1 = FFFFFFFF
/* 00804 80A8F974 254AF660 */  addiu   $t2, $t2, %lo(func_80A8F660) ## $t2 = 80A8F660
/* 00808 80A8F978 A6090208 */  sh      $t1, 0x0208($s0)           ## 00000208
/* 0080C 80A8F97C 1000000D */  beq     $zero, $zero, .L80A8F9B4   
/* 00810 80A8F980 AE0A014C */  sw      $t2, 0x014C($s0)           ## 0000014C
.L80A8F984:
/* 00814 80A8F984 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
.L80A8F988:
/* 00818 80A8F988 14C1000A */  bne     $a2, $at, .L80A8F9B4       
/* 0081C 80A8F98C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00820 80A8F990 00E02825 */  or      $a1, $a3, $zero            ## $a1 = 00000000
/* 00824 80A8F994 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 00828 80A8F998 0C2A3CC8 */  jal     func_80A8F320              
/* 0082C 80A8F99C AFA20024 */  sw      $v0, 0x0024($sp)           
/* 00830 80A8F9A0 8FA20024 */  lw      $v0, 0x0024($sp)           
/* 00834 80A8F9A4 3C010080 */  lui     $at, 0x0080                ## $at = 00800000
/* 00838 80A8F9A8 8C4B0680 */  lw      $t3, 0x0680($v0)           ## 00000680
/* 0083C 80A8F9AC 01616025 */  or      $t4, $t3, $at              ## $t4 = 00800000
/* 00840 80A8F9B0 AC4C0680 */  sw      $t4, 0x0680($v0)           ## 00000680
.L80A8F9B4:
/* 00844 80A8F9B4 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 00848 80A8F9B8 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 0084C 80A8F9BC 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
/* 00850 80A8F9C0 03E00008 */  jr      $ra                        
/* 00854 80A8F9C4 00000000 */  nop
