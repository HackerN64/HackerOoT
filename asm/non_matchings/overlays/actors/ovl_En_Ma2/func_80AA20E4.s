glabel func_80AA20E4
/* 00744 80AA20E4 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 00748 80AA20E8 3C030001 */  lui     $v1, 0x0001                ## $v1 = 00010000
/* 0074C 80AA20EC AFBF001C */  sw      $ra, 0x001C($sp)           
/* 00750 80AA20F0 AFA40020 */  sw      $a0, 0x0020($sp)           
/* 00754 80AA20F4 AFA50024 */  sw      $a1, 0x0024($sp)           
/* 00758 80AA20F8 00651821 */  addu    $v1, $v1, $a1              
/* 0075C 80AA20FC 946304C6 */  lhu     $v1, 0x04C6($v1)           ## 000104C6
/* 00760 80AA2100 3C0F80AA */  lui     $t7, %hi(func_80AA204C)    ## $t7 = 80AA0000
/* 00764 80AA2104 8CA21C44 */  lw      $v0, 0x1C44($a1)           ## 00001C44
/* 00768 80AA2108 28610004 */  slti    $at, $v1, 0x0004           
/* 0076C 80AA210C 14200008 */  bne     $at, $zero, .L80AA2130     
/* 00770 80AA2110 25EF204C */  addiu   $t7, $t7, %lo(func_80AA204C) ## $t7 = 80AA204C
/* 00774 80AA2114 AC8F0190 */  sw      $t7, 0x0190($a0)           ## 00000190
/* 00778 80AA2118 8FA80024 */  lw      $t0, 0x0024($sp)           
/* 0077C 80AA211C 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 00780 80AA2120 24190004 */  addiu   $t9, $zero, 0x0004         ## $t9 = 00000004
/* 00784 80AA2124 00280821 */  addu    $at, $at, $t0              
/* 00788 80AA2128 10000023 */  beq     $zero, $zero, .L80AA21B8   
/* 0078C 80AA212C A43904C6 */  sh      $t9, 0x04C6($at)           ## 000104C6
.L80AA2130:
/* 00790 80AA2130 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
/* 00794 80AA2134 1461001C */  bne     $v1, $at, .L80AA21A8       
/* 00798 80AA2138 3C078013 */  lui     $a3, %hi(D_801333E0)
/* 0079C 80AA213C 3C098013 */  lui     $t1, %hi(D_801333E8)
/* 007A0 80AA2140 24E733E0 */  addiu   $a3, %lo(D_801333E0)
/* 007A4 80AA2144 252933E8 */  addiu   $t1, %lo(D_801333E8)
/* 007A8 80AA2148 3C058013 */  lui     $a1, %hi(D_801333D4)
/* 007AC 80AA214C 24A533D4 */  addiu   $a1, %lo(D_801333D4)
/* 007B0 80AA2150 AFA90014 */  sw      $t1, 0x0014($sp)           
/* 007B4 80AA2154 AFA70010 */  sw      $a3, 0x0010($sp)           
/* 007B8 80AA2158 24044802 */  addiu   $a0, $zero, 0x4802         ## $a0 = 00004802
/* 007BC 80AA215C 0C03DCE3 */  jal     Audio_PlaySoundGeneral
              
/* 007C0 80AA2160 24060004 */  addiu   $a2, $zero, 0x0004         ## $a2 = 00000004
/* 007C4 80AA2164 8FA30020 */  lw      $v1, 0x0020($sp)           
/* 007C8 80AA2168 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 007CC 80AA216C 240A001E */  addiu   $t2, $zero, 0x001E         ## $t2 = 0000001E
/* 007D0 80AA2170 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 007D4 80AA2174 A46A0208 */  sh      $t2, 0x0208($v1)           ## 00000208
/* 007D8 80AA2178 944B0F08 */  lhu     $t3, 0x0F08($v0)           ## 8015F568
/* 007DC 80AA217C 3C0D80AA */  lui     $t5, %hi(func_80AA21C8)    ## $t5 = 80AA0000
/* 007E0 80AA2180 25AD21C8 */  addiu   $t5, $t5, %lo(func_80AA21C8) ## $t5 = 80AA21C8
/* 007E4 80AA2184 356C4000 */  ori     $t4, $t3, 0x4000           ## $t4 = 00004000
/* 007E8 80AA2188 A44C0F08 */  sh      $t4, 0x0F08($v0)           ## 8015F568
/* 007EC 80AA218C AC6D0190 */  sw      $t5, 0x0190($v1)           ## 00000190
/* 007F0 80AA2190 8FAF0024 */  lw      $t7, 0x0024($sp)           
/* 007F4 80AA2194 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 007F8 80AA2198 240E0004 */  addiu   $t6, $zero, 0x0004         ## $t6 = 00000004
/* 007FC 80AA219C 002F0821 */  addu    $at, $at, $t7              
/* 00800 80AA21A0 10000005 */  beq     $zero, $zero, .L80AA21B8   
/* 00804 80AA21A4 A42E04C6 */  sh      $t6, 0x04C6($at)           ## 000104C6
.L80AA21A8:
/* 00808 80AA21A8 8C580680 */  lw      $t8, 0x0680($v0)           ## 8015ECE0
/* 0080C 80AA21AC 3C010080 */  lui     $at, 0x0080                ## $at = 00800000
/* 00810 80AA21B0 0301C825 */  or      $t9, $t8, $at              ## $t9 = 00800000
/* 00814 80AA21B4 AC590680 */  sw      $t9, 0x0680($v0)           ## 8015ECE0
.L80AA21B8:
/* 00818 80AA21B8 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 0081C 80AA21BC 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
/* 00820 80AA21C0 03E00008 */  jr      $ra                        
/* 00824 80AA21C4 00000000 */  nop
