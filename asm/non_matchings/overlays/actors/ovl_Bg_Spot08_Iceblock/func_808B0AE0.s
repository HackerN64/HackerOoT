.late_rodata

glabel D_808B1874
    .float 0.15

glabel D_808B1878
    .float 0.2

glabel D_808B187C
    .float 0.4

.text
glabel func_808B0AE0
/* 00180 808B0AE0 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 00184 808B0AE4 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 00188 808B0AE8 8482001C */  lh      $v0, 0x001C($a0)           ## 0000001C
/* 0018C 808B0AEC 00803825 */  or      $a3, $a0, $zero            ## $a3 = 00000000
/* 00190 808B0AF0 3C01808B */  lui     $at, %hi(D_808B1874)       ## $at = 808B0000
/* 00194 808B0AF4 304200F0 */  andi    $v0, $v0, 0x00F0           ## $v0 = 00000000
/* 00198 808B0AF8 10400008 */  beq     $v0, $zero, .L808B0B1C     
/* 0019C 808B0AFC 00E02025 */  or      $a0, $a3, $zero            ## $a0 = 00000000
/* 001A0 808B0B00 24010010 */  addiu   $at, $zero, 0x0010         ## $at = 00000010
/* 001A4 808B0B04 10410008 */  beq     $v0, $at, .L808B0B28       
/* 001A8 808B0B08 24010020 */  addiu   $at, $zero, 0x0020         ## $at = 00000020
/* 001AC 808B0B0C 1041000A */  beq     $v0, $at, .L808B0B38       
/* 001B0 808B0B10 00000000 */  nop
/* 001B4 808B0B14 1000000B */  beq     $zero, $zero, .L808B0B44   
/* 001B8 808B0B18 00000000 */  nop
.L808B0B1C:
/* 001BC 808B0B1C C4241874 */  lwc1    $f4, %lo(D_808B1874)($at)  
/* 001C0 808B0B20 10000008 */  beq     $zero, $zero, .L808B0B44   
/* 001C4 808B0B24 E7A40018 */  swc1    $f4, 0x0018($sp)           
.L808B0B28:
/* 001C8 808B0B28 3C01808B */  lui     $at, %hi(D_808B1878)       ## $at = 808B0000
/* 001CC 808B0B2C C4261878 */  lwc1    $f6, %lo(D_808B1878)($at)  
/* 001D0 808B0B30 10000004 */  beq     $zero, $zero, .L808B0B44   
/* 001D4 808B0B34 E7A60018 */  swc1    $f6, 0x0018($sp)           
.L808B0B38:
/* 001D8 808B0B38 3C01808B */  lui     $at, %hi(D_808B187C)       ## $at = 808B0000
/* 001DC 808B0B3C C428187C */  lwc1    $f8, %lo(D_808B187C)($at)  
/* 001E0 808B0B40 E7A80018 */  swc1    $f8, 0x0018($sp)           
.L808B0B44:
/* 001E4 808B0B44 0C010D52 */  jal     func_80043548              
/* 001E8 808B0B48 AFA70020 */  sw      $a3, 0x0020($sp)           
/* 001EC 808B0B4C 10400005 */  beq     $v0, $zero, .L808B0B64     
/* 001F0 808B0B50 8FA70020 */  lw      $a3, 0x0020($sp)           
/* 001F4 808B0B54 3C01C080 */  lui     $at, 0xC080                ## $at = C0800000
/* 001F8 808B0B58 44810000 */  mtc1    $at, $f0                   ## $f0 = -4.00
/* 001FC 808B0B5C 10000004 */  beq     $zero, $zero, .L808B0B70   
/* 00200 808B0B60 44050000 */  mfc1    $a1, $f0                   
.L808B0B64:
/* 00204 808B0B64 44800000 */  mtc1    $zero, $f0                 ## $f0 = 0.00
/* 00208 808B0B68 00000000 */  nop
/* 0020C 808B0B6C 44050000 */  mfc1    $a1, $f0                   
.L808B0B70:
/* 00210 808B0B70 24E40194 */  addiu   $a0, $a3, 0x0194           ## $a0 = 00000194
/* 00214 808B0B74 0C01DE80 */  jal     Math_ApproxF
              
/* 00218 808B0B78 8FA60018 */  lw      $a2, 0x0018($sp)           
/* 0021C 808B0B7C 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 00220 808B0B80 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
/* 00224 808B0B84 03E00008 */  jr      $ra                        
/* 00228 808B0B88 00000000 */  nop
