.late_rodata
glabel D_809BF538
 .word 0x43838000

.text
glabel func_809BD3AC
/* 0074C 809BD3AC 3C01809C */  lui     $at, %hi(D_809BF538)       ## $at = 809C0000
/* 00750 809BD3B0 C426F538 */  lwc1    $f6, %lo(D_809BF538)($at)  
/* 00754 809BD3B4 C4840008 */  lwc1    $f4, 0x0008($a0)           ## 00000008
/* 00758 809BD3B8 C48A000C */  lwc1    $f10, 0x000C($a0)          ## 0000000C
/* 0075C 809BD3BC 3C0F809C */  lui     $t7, %hi(func_809BDAE8)    ## $t7 = 809C0000
/* 00760 809BD3C0 46062200 */  add.s   $f8, $f4, $f6              
/* 00764 809BD3C4 240E000A */  addiu   $t6, $zero, 0x000A         ## $t6 = 0000000A
/* 00768 809BD3C8 25EFDAE8 */  addiu   $t7, $t7, %lo(func_809BDAE8) ## $t7 = 809BDAE8
/* 0076C 809BD3CC A48E0196 */  sh      $t6, 0x0196($a0)           ## 00000196
/* 00770 809BD3D0 E4880024 */  swc1    $f8, 0x0024($a0)           ## 00000024
/* 00774 809BD3D4 AC8F0190 */  sw      $t7, 0x0190($a0)           ## 00000190
/* 00778 809BD3D8 03E00008 */  jr      $ra                        
/* 0077C 809BD3DC E48A0028 */  swc1    $f10, 0x0028($a0)          ## 00000028
