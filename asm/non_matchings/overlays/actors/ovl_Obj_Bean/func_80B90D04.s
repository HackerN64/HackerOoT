.late_rodata
glabel D_80B91078
    .float 9.58738019108e-05

glabel D_80B9107C
    .float 0.1

.text
glabel func_80B90D04
/* 02284 80B90D04 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 02288 80B90D08 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 0228C 80B90D0C AFA5001C */  sw      $a1, 0x001C($sp)           
/* 02290 80B90D10 8C86002C */  lw      $a2, 0x002C($a0)           ## 0000002C
/* 02294 80B90D14 C48E0028 */  lwc1    $f14, 0x0028($a0)          ## 00000028
/* 02298 80B90D18 C48C0024 */  lwc1    $f12, 0x0024($a0)          ## 00000024
/* 0229C 80B90D1C AFA40018 */  sw      $a0, 0x0018($sp)           
/* 022A0 80B90D20 0C034261 */  jal     Matrix_Translate              
/* 022A4 80B90D24 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 022A8 80B90D28 8FA40018 */  lw      $a0, 0x0018($sp)           
/* 022AC 80B90D2C 3C0180B9 */  lui     $at, %hi(D_80B91078)       ## $at = 80B90000
/* 022B0 80B90D30 C4281078 */  lwc1    $f8, %lo(D_80B91078)($at)  
/* 022B4 80B90D34 848E00B6 */  lh      $t6, 0x00B6($a0)           ## 000000B6
/* 022B8 80B90D38 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 022BC 80B90D3C 448E2000 */  mtc1    $t6, $f4                   ## $f4 = 0.00
/* 022C0 80B90D40 00000000 */  nop
/* 022C4 80B90D44 468021A0 */  cvt.s.w $f6, $f4                   
/* 022C8 80B90D48 46083302 */  mul.s   $f12, $f6, $f8             
/* 022CC 80B90D4C 0C034348 */  jal     Matrix_RotateY              
/* 022D0 80B90D50 00000000 */  nop
/* 022D4 80B90D54 3C0180B9 */  lui     $at, %hi(D_80B9107C)       ## $at = 80B90000
/* 022D8 80B90D58 C42C107C */  lwc1    $f12, %lo(D_80B9107C)($at) 
/* 022DC 80B90D5C 8FA40018 */  lw      $a0, 0x0018($sp)           
/* 022E0 80B90D60 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 022E4 80B90D64 44066000 */  mfc1    $a2, $f12                  
/* 022E8 80B90D68 0C0342A3 */  jal     Matrix_Scale              
/* 022EC 80B90D6C C48E01D4 */  lwc1    $f14, 0x01D4($a0)          ## 000001D4
/* 022F0 80B90D70 3C050600 */  lui     $a1, %hi(D_060001B0)                ## $a1 = 06000000
/* 022F4 80B90D74 24A501B0 */  addiu   $a1, $a1, %lo(D_060001B0)           ## $a1 = 060001B0
/* 022F8 80B90D78 0C00D498 */  jal     Gfx_DrawDListOpa
              
/* 022FC 80B90D7C 8FA4001C */  lw      $a0, 0x001C($sp)           
/* 02300 80B90D80 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 02304 80B90D84 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 02308 80B90D88 03E00008 */  jr      $ra                        
/* 0230C 80B90D8C 00000000 */  nop
