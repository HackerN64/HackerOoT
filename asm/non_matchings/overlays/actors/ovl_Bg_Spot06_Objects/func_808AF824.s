.late_rodata
glabel D_808AFA38
 .word 0xC4A42000
glabel D_808AFA3C
 .word 0x38D1B717
glabel D_808AFA40
    .float 0.001

.text
glabel func_808AF824
/* 010A4 808AF824 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 010A8 808AF828 AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 010AC 808AF82C AFB00020 */  sw      $s0, 0x0020($sp)           
/* 010B0 808AF830 AFA5002C */  sw      $a1, 0x002C($sp)           
/* 010B4 808AF834 3C01808B */  lui     $at, %hi(D_808AFA38)       ## $at = 808B0000
/* 010B8 808AF838 C422FA38 */  lwc1    $f2, %lo(D_808AFA38)($at)  
/* 010BC 808AF83C C480016C */  lwc1    $f0, 0x016C($a0)           ## 0000016C
/* 010C0 808AF840 3C01808B */  lui     $at, %hi(D_808AFA3C)       ## $at = 808B0000
/* 010C4 808AF844 3C0E808B */  lui     $t6, %hi(func_808AEE00)    ## $t6 = 808B0000
/* 010C8 808AF848 46020100 */  add.s   $f4, $f0, $f2              
/* 010CC 808AF84C 3C063DCC */  lui     $a2, 0x3DCC                ## $a2 = 3DCC0000
/* 010D0 808AF850 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 010D4 808AF854 25CEEE00 */  addiu   $t6, $t6, %lo(func_808AEE00) ## $t6 = 808AEE00
/* 010D8 808AF858 E4840028 */  swc1    $f4, 0x0028($a0)           ## 00000028
/* 010DC 808AF85C C426FA3C */  lwc1    $f6, %lo(D_808AFA3C)($at)  
/* 010E0 808AF860 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 010E4 808AF864 34C6CCCD */  ori     $a2, $a2, 0xCCCD           ## $a2 = 3DCCCCCD
/* 010E8 808AF868 4600303E */  c.le.s  $f6, $f0                   
/* 010EC 808AF86C 00000000 */  nop
/* 010F0 808AF870 45020005 */  bc1fl   .L808AF888                 
/* 010F4 808AF874 44810000 */  mtc1    $at, $f0                   ## $f0 = 1.00
/* 010F8 808AF878 E4820028 */  swc1    $f2, 0x0028($a0)           ## 00000028
/* 010FC 808AF87C 1000001C */  beq     $zero, $zero, .L808AF8F0   
/* 01100 808AF880 AC8E0164 */  sw      $t6, 0x0164($a0)           ## 00000164
/* 01104 808AF884 44810000 */  mtc1    $at, $f0                   ## $f0 = 1.00
.L808AF888:
/* 01108 808AF888 3C01808B */  lui     $at, %hi(D_808AFA40)       ## $at = 808B0000
/* 0110C 808AF88C C428FA40 */  lwc1    $f8, %lo(D_808AFA40)($at)  
/* 01110 808AF890 44050000 */  mfc1    $a1, $f0                   
/* 01114 808AF894 44070000 */  mfc1    $a3, $f0                   
/* 01118 808AF898 2604016C */  addiu   $a0, $s0, 0x016C           ## $a0 = 0000016C
/* 0111C 808AF89C 0C01E0C4 */  jal     Math_SmoothScaleMaxMinF
              
/* 01120 808AF8A0 E7A80010 */  swc1    $f8, 0x0010($sp)           
/* 01124 808AF8A4 8FA2002C */  lw      $v0, 0x002C($sp)           
/* 01128 808AF8A8 240FFB57 */  addiu   $t7, $zero, 0xFB57         ## $t7 = FFFFFB57
/* 0112C 808AF8AC 8C5807C0 */  lw      $t8, 0x07C0($v0)           ## 000007C0
/* 01130 808AF8B0 8F190028 */  lw      $t9, 0x0028($t8)           ## 00000028
/* 01134 808AF8B4 A72F0012 */  sh      $t7, 0x0012($t9)           ## 00000012
/* 01138 808AF8B8 C60A0028 */  lwc1    $f10, 0x0028($s0)          ## 00000028
/* 0113C 808AF8BC 8C4A07C0 */  lw      $t2, 0x07C0($v0)           ## 000007C0
/* 01140 808AF8C0 4600540D */  trunc.w.s $f16, $f10                 
/* 01144 808AF8C4 8D4B0028 */  lw      $t3, 0x0028($t2)           ## 00000028
/* 01148 808AF8C8 44098000 */  mfc1    $t1, $f16                  
/* 0114C 808AF8CC 00000000 */  nop
/* 01150 808AF8D0 A5690022 */  sh      $t1, 0x0022($t3)           ## 00000022
/* 01154 808AF8D4 C6120028 */  lwc1    $f18, 0x0028($s0)          ## 00000028
/* 01158 808AF8D8 8C4E07C0 */  lw      $t6, 0x07C0($v0)           ## 000007C0
/* 0115C 808AF8DC 4600910D */  trunc.w.s $f4, $f18                  
/* 01160 808AF8E0 8DD80028 */  lw      $t8, 0x0028($t6)           ## 00000028
/* 01164 808AF8E4 440D2000 */  mfc1    $t5, $f4                   
/* 01168 808AF8E8 00000000 */  nop
/* 0116C 808AF8EC A70D0032 */  sh      $t5, 0x0032($t8)           ## 00000032
.L808AF8F0:
/* 01170 808AF8F0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01174 808AF8F4 0C00BE52 */  jal     func_8002F948              
/* 01178 808AF8F8 2405205E */  addiu   $a1, $zero, 0x205E         ## $a1 = 0000205E
/* 0117C 808AF8FC 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 01180 808AF900 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 01184 808AF904 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
/* 01188 808AF908 03E00008 */  jr      $ra                        
/* 0118C 808AF90C 00000000 */  nop
