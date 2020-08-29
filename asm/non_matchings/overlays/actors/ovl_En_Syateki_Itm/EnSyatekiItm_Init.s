.rdata
glabel D_80B103E0
    .asciz "\x1b[32m☆☆☆☆☆ エラー原 ☆☆☆☆ \n\x1b[m"
    .balign 4

glabel D_80B10408
    .asciz "\x1b[33m☆☆☆☆☆ エラー原セカンド ☆☆☆☆ \n\x1b[m"
    .balign 4

.text
glabel EnSyatekiItm_Init
/* 00000 80B0F6B0 27BDFFA8 */  addiu   $sp, $sp, 0xFFA8           ## $sp = FFFFFFA8
/* 00004 80B0F6B4 3C01430C */  lui     $at, 0x430C                ## $at = 430C0000
/* 00008 80B0F6B8 44812000 */  mtc1    $at, $f4                   ## $f4 = 140.00
/* 0000C 80B0F6BC 3C01437F */  lui     $at, 0x437F                ## $at = 437F0000
/* 00010 80B0F6C0 44814000 */  mtc1    $at, $f8                   ## $f8 = 255.00
/* 00014 80B0F6C4 44803000 */  mtc1    $zero, $f6                 ## $f6 = 0.00
/* 00018 80B0F6C8 AFB70050 */  sw      $s7, 0x0050($sp)           
/* 0001C 80B0F6CC AFB40044 */  sw      $s4, 0x0044($sp)           
/* 00020 80B0F6D0 AFB30040 */  sw      $s3, 0x0040($sp)           
/* 00024 80B0F6D4 00809825 */  or      $s3, $a0, $zero            ## $s3 = 00000000
/* 00028 80B0F6D8 00A0A025 */  or      $s4, $a1, $zero            ## $s4 = 00000000
/* 0002C 80B0F6DC AFBF0054 */  sw      $ra, 0x0054($sp)           
/* 00030 80B0F6E0 24B71C24 */  addiu   $s7, $a1, 0x1C24           ## $s7 = 00001C24
/* 00034 80B0F6E4 240EC000 */  addiu   $t6, $zero, 0xC000         ## $t6 = FFFFC000
/* 00038 80B0F6E8 AFB6004C */  sw      $s6, 0x004C($sp)           
/* 0003C 80B0F6EC AFB50048 */  sw      $s5, 0x0048($sp)           
/* 00040 80B0F6F0 AFB2003C */  sw      $s2, 0x003C($sp)           
/* 00044 80B0F6F4 AFB10038 */  sw      $s1, 0x0038($sp)           
/* 00048 80B0F6F8 AFB00034 */  sw      $s0, 0x0034($sp)           
/* 0004C 80B0F6FC AFAE0020 */  sw      $t6, 0x0020($sp)           
/* 00050 80B0F700 02E02025 */  or      $a0, $s7, $zero            ## $a0 = 00001C24
/* 00054 80B0F704 02602825 */  or      $a1, $s3, $zero            ## $a1 = 00000000
/* 00058 80B0F708 02803025 */  or      $a2, $s4, $zero            ## $a2 = 00000000
/* 0005C 80B0F70C AFA0001C */  sw      $zero, 0x001C($sp)         
/* 00060 80B0F710 AFA00024 */  sw      $zero, 0x0024($sp)         
/* 00064 80B0F714 AFA00028 */  sw      $zero, 0x0028($sp)         
/* 00068 80B0F718 240700C1 */  addiu   $a3, $zero, 0x00C1         ## $a3 = 000000C1
/* 0006C 80B0F71C E7A40010 */  swc1    $f4, 0x0010($sp)           
/* 00070 80B0F720 E7A80018 */  swc1    $f8, 0x0018($sp)           
/* 00074 80B0F724 0C00C916 */  jal     Actor_SpawnAsChild
              
/* 00078 80B0F728 E7A60014 */  swc1    $f6, 0x0014($sp)           
/* 0007C 80B0F72C 14400008 */  bne     $v0, $zero, .L80B0F750     
/* 00080 80B0F730 AE6201CC */  sw      $v0, 0x01CC($s3)           ## 000001CC
/* 00084 80B0F734 3C0480B1 */  lui     $a0, %hi(D_80B103E0)       ## $a0 = 80B10000
/* 00088 80B0F738 0C00084C */  jal     osSyncPrintf
              
/* 0008C 80B0F73C 248403E0 */  addiu   $a0, $a0, %lo(D_80B103E0)  ## $a0 = 80B103E0
/* 00090 80B0F740 0C00B55C */  jal     Actor_Kill
              
/* 00094 80B0F744 02602025 */  or      $a0, $s3, $zero            ## $a0 = 00000000
/* 00098 80B0F748 1000002E */  beq     $zero, $zero, .L80B0F804   
/* 0009C 80B0F74C 8FBF0054 */  lw      $ra, 0x0054($sp)           
.L80B0F750:
/* 000A0 80B0F750 3C1080B1 */  lui     $s0, %hi(D_80B10350)       ## $s0 = 80B10000
/* 000A4 80B0F754 3C1580B1 */  lui     $s5, %hi(D_80B1033C)       ## $s5 = 80B10000
/* 000A8 80B0F758 26B5033C */  addiu   $s5, $s5, %lo(D_80B1033C)  ## $s5 = 80B1033C
/* 000AC 80B0F75C 26100350 */  addiu   $s0, $s0, %lo(D_80B10350)  ## $s0 = 80B10350
/* 000B0 80B0F760 00008825 */  or      $s1, $zero, $zero          ## $s1 = 00000000
/* 000B4 80B0F764 02609025 */  or      $s2, $s3, $zero            ## $s2 = 00000000
/* 000B8 80B0F768 2416000A */  addiu   $s6, $zero, 0x000A         ## $s6 = 0000000A
.L80B0F76C:
/* 000BC 80B0F76C C60A0000 */  lwc1    $f10, 0x0000($s0)          ## 80B10350
/* 000C0 80B0F770 C6100004 */  lwc1    $f16, 0x0004($s0)          ## 80B10354
/* 000C4 80B0F774 C6120008 */  lwc1    $f18, 0x0008($s0)          ## 80B10358
/* 000C8 80B0F778 240F0004 */  addiu   $t7, $zero, 0x0004         ## $t7 = 00000004
/* 000CC 80B0F77C AFAF0028 */  sw      $t7, 0x0028($sp)           
/* 000D0 80B0F780 02E02025 */  or      $a0, $s7, $zero            ## $a0 = 00001C24
/* 000D4 80B0F784 02602825 */  or      $a1, $s3, $zero            ## $a1 = 00000000
/* 000D8 80B0F788 02803025 */  or      $a2, $s4, $zero            ## $a2 = 00000000
/* 000DC 80B0F78C 24070131 */  addiu   $a3, $zero, 0x0131         ## $a3 = 00000131
/* 000E0 80B0F790 AFA0001C */  sw      $zero, 0x001C($sp)         
/* 000E4 80B0F794 AFA00020 */  sw      $zero, 0x0020($sp)         
/* 000E8 80B0F798 AFA00024 */  sw      $zero, 0x0024($sp)         
/* 000EC 80B0F79C E7AA0010 */  swc1    $f10, 0x0010($sp)          
/* 000F0 80B0F7A0 E7B00014 */  swc1    $f16, 0x0014($sp)          
/* 000F4 80B0F7A4 0C00C916 */  jal     Actor_SpawnAsChild
              
/* 000F8 80B0F7A8 E7B20018 */  swc1    $f18, 0x0018($sp)          
/* 000FC 80B0F7AC 14400008 */  bne     $v0, $zero, .L80B0F7D0     
/* 00100 80B0F7B0 AE42019C */  sw      $v0, 0x019C($s2)           ## 0000019C
/* 00104 80B0F7B4 3C0480B1 */  lui     $a0, %hi(D_80B10408)       ## $a0 = 80B10000
/* 00108 80B0F7B8 0C00084C */  jal     osSyncPrintf
              
/* 0010C 80B0F7BC 24840408 */  addiu   $a0, $a0, %lo(D_80B10408)  ## $a0 = 80B10408
/* 00110 80B0F7C0 0C00B55C */  jal     Actor_Kill
              
/* 00114 80B0F7C4 02602025 */  or      $a0, $s3, $zero            ## $a0 = 00000000
/* 00118 80B0F7C8 1000000E */  beq     $zero, $zero, .L80B0F804   
/* 0011C 80B0F7CC 8FBF0054 */  lw      $ra, 0x0054($sp)           
.L80B0F7D0:
/* 00120 80B0F7D0 0011C040 */  sll     $t8, $s1,  1               
/* 00124 80B0F7D4 02B8C821 */  addu    $t9, $s5, $t8              
/* 00128 80B0F7D8 87280000 */  lh      $t0, 0x0000($t9)           ## 00000000
/* 0012C 80B0F7DC 8E49019C */  lw      $t1, 0x019C($s2)           ## 0000019C
/* 00130 80B0F7E0 26310001 */  addiu   $s1, $s1, 0x0001           ## $s1 = 00000001
/* 00134 80B0F7E4 2610000C */  addiu   $s0, $s0, 0x000C           ## $s0 = 80B1035C
/* 00138 80B0F7E8 26520004 */  addiu   $s2, $s2, 0x0004           ## $s2 = 00000004
/* 0013C 80B0F7EC 1636FFDF */  bne     $s1, $s6, .L80B0F76C       
/* 00140 80B0F7F0 A5280150 */  sh      $t0, 0x0150($t1)           ## 00000150
/* 00144 80B0F7F4 3C0A80B1 */  lui     $t2, %hi(func_80B0F838)    ## $t2 = 80B10000
/* 00148 80B0F7F8 254AF838 */  addiu   $t2, $t2, %lo(func_80B0F838) ## $t2 = 80B0F838
/* 0014C 80B0F7FC AE6A014C */  sw      $t2, 0x014C($s3)           ## 0000014C
/* 00150 80B0F800 8FBF0054 */  lw      $ra, 0x0054($sp)           
.L80B0F804:
/* 00154 80B0F804 8FB00034 */  lw      $s0, 0x0034($sp)           
/* 00158 80B0F808 8FB10038 */  lw      $s1, 0x0038($sp)           
/* 0015C 80B0F80C 8FB2003C */  lw      $s2, 0x003C($sp)           
/* 00160 80B0F810 8FB30040 */  lw      $s3, 0x0040($sp)           
/* 00164 80B0F814 8FB40044 */  lw      $s4, 0x0044($sp)           
/* 00168 80B0F818 8FB50048 */  lw      $s5, 0x0048($sp)           
/* 0016C 80B0F81C 8FB6004C */  lw      $s6, 0x004C($sp)           
/* 00170 80B0F820 8FB70050 */  lw      $s7, 0x0050($sp)           
/* 00174 80B0F824 03E00008 */  jr      $ra                        
/* 00178 80B0F828 27BD0058 */  addiu   $sp, $sp, 0x0058           ## $sp = 00000000
