.rdata
glabel D_808A231C
    .asciz "Error : 森の神殿 obj elevator 部屋設定が危険(%s %d)\n"
    .balign 4

glabel D_808A2354
    .asciz "../z_bg_mori_elevator.c"
    .balign 4

.late_rodata
glabel D_808A23C0
 .word 0xC442C000
glabel D_808A23C4
 .word 0xC3898000
glabel D_808A23C8
 .word 0xC3898000
glabel D_808A23CC
 .word 0xC442C000

.text
glabel func_808A1E14
/* 00614 808A1E14 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 00618 808A1E18 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 0061C 808A1E1C AFA50024 */  sw      $a1, 0x0024($sp)           
/* 00620 808A1E20 0C2286C0 */  jal     func_808A1B00              
/* 00624 808A1E24 AFA40020 */  sw      $a0, 0x0020($sp)           
/* 00628 808A1E28 10400020 */  beq     $v0, $zero, .L808A1EAC     
/* 0062C 808A1E2C 8FA60020 */  lw      $a2, 0x0020($sp)           
/* 00630 808A1E30 8FAE0024 */  lw      $t6, 0x0024($sp)           
/* 00634 808A1E34 3C020001 */  lui     $v0, 0x0001                ## $v0 = 00010000
/* 00638 808A1E38 24070002 */  addiu   $a3, $zero, 0x0002         ## $a3 = 00000002
/* 0063C 808A1E3C 004E1021 */  addu    $v0, $v0, $t6              
/* 00640 808A1E40 80421CBC */  lb      $v0, 0x1CBC($v0)           ## 00011CBC
/* 00644 808A1E44 24010011 */  addiu   $at, $zero, 0x0011         ## $at = 00000011
/* 00648 808A1E48 14E20008 */  bne     $a3, $v0, .L808A1E6C       
/* 0064C 808A1E4C 00000000 */  nop
/* 00650 808A1E50 3C01808A */  lui     $at, %hi(D_808A23C0)       ## $at = 808A0000
/* 00654 808A1E54 C42423C0 */  lwc1    $f4, %lo(D_808A23C0)($at)  
/* 00658 808A1E58 00C02025 */  or      $a0, $a2, $zero            ## $a0 = 00000000
/* 0065C 808A1E5C 0C2287FC */  jal     func_808A1FF0              
/* 00660 808A1E60 E4C40168 */  swc1    $f4, 0x0168($a2)           ## 00000168
/* 00664 808A1E64 1000005F */  beq     $zero, $zero, .L808A1FE4   
/* 00668 808A1E68 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L808A1E6C:
/* 0066C 808A1E6C 14410008 */  bne     $v0, $at, .L808A1E90       
/* 00670 808A1E70 3C04808A */  lui     $a0, %hi(D_808A231C)       ## $a0 = 808A0000
/* 00674 808A1E74 3C014369 */  lui     $at, 0x4369                ## $at = 43690000
/* 00678 808A1E78 44813000 */  mtc1    $at, $f6                   ## $f6 = 233.00
/* 0067C 808A1E7C 00C02025 */  or      $a0, $a2, $zero            ## $a0 = 00000000
/* 00680 808A1E80 0C2287FC */  jal     func_808A1FF0              
/* 00684 808A1E84 E4C60168 */  swc1    $f6, 0x0168($a2)           ## 00000168
/* 00688 808A1E88 10000056 */  beq     $zero, $zero, .L808A1FE4   
/* 0068C 808A1E8C 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L808A1E90:
/* 00690 808A1E90 3C05808A */  lui     $a1, %hi(D_808A2354)       ## $a1 = 808A0000
/* 00694 808A1E94 24A52354 */  addiu   $a1, $a1, %lo(D_808A2354)  ## $a1 = 808A2354
/* 00698 808A1E98 2484231C */  addiu   $a0, $a0, %lo(D_808A231C)  ## $a0 = 0000231C
/* 0069C 808A1E9C 0C00084C */  jal     osSyncPrintf
              
/* 006A0 808A1EA0 240601DF */  addiu   $a2, $zero, 0x01DF         ## $a2 = 000001DF
/* 006A4 808A1EA4 1000004F */  beq     $zero, $zero, .L808A1FE4   
/* 006A8 808A1EA8 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L808A1EAC:
/* 006AC 808A1EAC 8FA40024 */  lw      $a0, 0x0024($sp)           
/* 006B0 808A1EB0 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 006B4 808A1EB4 24070002 */  addiu   $a3, $zero, 0x0002         ## $a3 = 00000002
/* 006B8 808A1EB8 00811821 */  addu    $v1, $a0, $at              
/* 006BC 808A1EBC 80621CBC */  lb      $v0, 0x1CBC($v1)           ## 00001CBC
/* 006C0 808A1EC0 3C01808A */  lui     $at, %hi(D_808A23C4)       ## $at = 808A0000
/* 006C4 808A1EC4 54E2000F */  bnel    $a3, $v0, .L808A1F04       
/* 006C8 808A1EC8 24010011 */  addiu   $at, $zero, 0x0011         ## $at = 00000011
/* 006CC 808A1ECC C4C80028 */  lwc1    $f8, 0x0028($a2)           ## 00000028
/* 006D0 808A1ED0 C42A23C4 */  lwc1    $f10, %lo(D_808A23C4)($at) 
/* 006D4 808A1ED4 3C014369 */  lui     $at, 0x4369                ## $at = 43690000
/* 006D8 808A1ED8 460A403C */  c.lt.s  $f8, $f10                  
/* 006DC 808A1EDC 00000000 */  nop
/* 006E0 808A1EE0 45020008 */  bc1fl   .L808A1F04                 
/* 006E4 808A1EE4 24010011 */  addiu   $at, $zero, 0x0011         ## $at = 00000011
/* 006E8 808A1EE8 44818000 */  mtc1    $at, $f16                  ## $f16 = 0.00
/* 006EC 808A1EEC 00C02025 */  or      $a0, $a2, $zero            ## $a0 = 00000000
/* 006F0 808A1EF0 0C2287FC */  jal     func_808A1FF0              
/* 006F4 808A1EF4 E4D00168 */  swc1    $f16, 0x0168($a2)          ## 00000168
/* 006F8 808A1EF8 1000003A */  beq     $zero, $zero, .L808A1FE4   
/* 006FC 808A1EFC 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 00700 808A1F00 24010011 */  addiu   $at, $zero, 0x0011         ## $at = 00000011
.L808A1F04:
/* 00704 808A1F04 1441000E */  bne     $v0, $at, .L808A1F40       
/* 00708 808A1F08 3C01808A */  lui     $at, %hi(D_808A23C8)       ## $at = 808A0000
/* 0070C 808A1F0C C43223C8 */  lwc1    $f18, %lo(D_808A23C8)($at) 
/* 00710 808A1F10 C4C40028 */  lwc1    $f4, 0x0028($a2)           ## 00000028
/* 00714 808A1F14 3C01808A */  lui     $at, %hi(D_808A23CC)       ## $at = 808A0000
/* 00718 808A1F18 4604903C */  c.lt.s  $f18, $f4                  
/* 0071C 808A1F1C 00000000 */  nop
/* 00720 808A1F20 45000007 */  bc1f    .L808A1F40                 
/* 00724 808A1F24 00000000 */  nop
/* 00728 808A1F28 C42623CC */  lwc1    $f6, %lo(D_808A23CC)($at)  
/* 0072C 808A1F2C 00C02025 */  or      $a0, $a2, $zero            ## $a0 = 00000000
/* 00730 808A1F30 0C2287FC */  jal     func_808A1FF0              
/* 00734 808A1F34 E4C60168 */  swc1    $f6, 0x0168($a2)           ## 00000168
/* 00738 808A1F38 1000002A */  beq     $zero, $zero, .L808A1FE4   
/* 0073C 808A1F3C 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L808A1F40:
/* 00740 808A1F40 54E20015 */  bnel    $a3, $v0, .L808A1F98       
/* 00744 808A1F44 80781CBC */  lb      $t8, 0x1CBC($v1)           ## 00001CBC
/* 00748 808A1F48 84C5001C */  lh      $a1, 0x001C($a2)           ## 0000001C
/* 0074C 808A1F4C AFA60020 */  sw      $a2, 0x0020($sp)           
/* 00750 808A1F50 AFA30018 */  sw      $v1, 0x0018($sp)           
/* 00754 808A1F54 0C00B2D0 */  jal     Flags_GetSwitch
              
/* 00758 808A1F58 30A5003F */  andi    $a1, $a1, 0x003F           ## $a1 = 00000000
/* 0075C 808A1F5C 8FA30018 */  lw      $v1, 0x0018($sp)           
/* 00760 808A1F60 8FA60020 */  lw      $a2, 0x0020($sp)           
/* 00764 808A1F64 1040000B */  beq     $v0, $zero, .L808A1F94     
/* 00768 808A1F68 24070002 */  addiu   $a3, $zero, 0x0002         ## $a3 = 00000002
/* 0076C 808A1F6C 8CCF016C */  lw      $t7, 0x016C($a2)           ## 0000016C
/* 00770 808A1F70 3C014292 */  lui     $at, 0x4292                ## $at = 42920000
/* 00774 808A1F74 55E00008 */  bnel    $t7, $zero, .L808A1F98     
/* 00778 808A1F78 80781CBC */  lb      $t8, 0x1CBC($v1)           ## 00001CBC
/* 0077C 808A1F7C 44814000 */  mtc1    $at, $f8                   ## $f8 = 73.00
/* 00780 808A1F80 00C02025 */  or      $a0, $a2, $zero            ## $a0 = 00000000
/* 00784 808A1F84 0C22870C */  jal     func_808A1C30              
/* 00788 808A1F88 E4C80168 */  swc1    $f8, 0x0168($a2)           ## 00000168
/* 0078C 808A1F8C 10000015 */  beq     $zero, $zero, .L808A1FE4   
/* 00790 808A1F90 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L808A1F94:
/* 00794 808A1F94 80781CBC */  lb      $t8, 0x1CBC($v1)           ## 00001CBC
.L808A1F98:
/* 00798 808A1F98 8FA40024 */  lw      $a0, 0x0024($sp)           
/* 0079C 808A1F9C 54F80011 */  bnel    $a3, $t8, .L808A1FE4       
/* 007A0 808A1FA0 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 007A4 808A1FA4 84C5001C */  lh      $a1, 0x001C($a2)           ## 0000001C
/* 007A8 808A1FA8 AFA60020 */  sw      $a2, 0x0020($sp)           
/* 007AC 808A1FAC 0C00B2D0 */  jal     Flags_GetSwitch
              
/* 007B0 808A1FB0 30A5003F */  andi    $a1, $a1, 0x003F           ## $a1 = 00000000
/* 007B4 808A1FB4 1440000A */  bne     $v0, $zero, .L808A1FE0     
/* 007B8 808A1FB8 8FA60020 */  lw      $a2, 0x0020($sp)           
/* 007BC 808A1FBC 8CD9016C */  lw      $t9, 0x016C($a2)           ## 0000016C
/* 007C0 808A1FC0 3C014369 */  lui     $at, 0x4369                ## $at = 43690000
/* 007C4 808A1FC4 53200007 */  beql    $t9, $zero, .L808A1FE4     
/* 007C8 808A1FC8 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 007CC 808A1FCC 44815000 */  mtc1    $at, $f10                  ## $f10 = 233.00
/* 007D0 808A1FD0 00C02025 */  or      $a0, $a2, $zero            ## $a0 = 00000000
/* 007D4 808A1FD4 E4CA0168 */  swc1    $f10, 0x0168($a2)          ## 00000168
/* 007D8 808A1FD8 0C22873D */  jal     func_808A1CF4              
/* 007DC 808A1FDC 8FA50024 */  lw      $a1, 0x0024($sp)           
.L808A1FE0:
/* 007E0 808A1FE0 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L808A1FE4:
/* 007E4 808A1FE4 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
/* 007E8 808A1FE8 03E00008 */  jr      $ra                        
/* 007EC 808A1FEC 00000000 */  nop
