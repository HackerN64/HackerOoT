.late_rodata
glabel D_80B91070
    .float 9.58738019108e-05

glabel D_80B91074
    .float 0.1

.text
glabel func_80B90C7C
/* 021FC 80B90C7C 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 02200 80B90C80 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 02204 80B90C84 AFA5001C */  sw      $a1, 0x001C($sp)           
/* 02208 80B90C88 8C860010 */  lw      $a2, 0x0010($a0)           ## 00000010
/* 0220C 80B90C8C C48E000C */  lwc1    $f14, 0x000C($a0)          ## 0000000C
/* 02210 80B90C90 C48C0008 */  lwc1    $f12, 0x0008($a0)          ## 00000008
/* 02214 80B90C94 AFA40018 */  sw      $a0, 0x0018($sp)           
/* 02218 80B90C98 0C034261 */  jal     Matrix_Translate              
/* 0221C 80B90C9C 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 02220 80B90CA0 8FA40018 */  lw      $a0, 0x0018($sp)           
/* 02224 80B90CA4 3C0180B9 */  lui     $at, %hi(D_80B91070)       ## $at = 80B90000
/* 02228 80B90CA8 C4281070 */  lwc1    $f8, %lo(D_80B91070)($at)  
/* 0222C 80B90CAC 848E0016 */  lh      $t6, 0x0016($a0)           ## 00000016
/* 02230 80B90CB0 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 02234 80B90CB4 448E2000 */  mtc1    $t6, $f4                   ## $f4 = 0.00
/* 02238 80B90CB8 00000000 */  nop
/* 0223C 80B90CBC 468021A0 */  cvt.s.w $f6, $f4                   
/* 02240 80B90CC0 46083302 */  mul.s   $f12, $f6, $f8             
/* 02244 80B90CC4 0C034348 */  jal     Matrix_RotateY              
/* 02248 80B90CC8 00000000 */  nop
/* 0224C 80B90CCC 3C0180B9 */  lui     $at, %hi(D_80B91074)       ## $at = 80B90000
/* 02250 80B90CD0 C42C1074 */  lwc1    $f12, %lo(D_80B91074)($at) 
/* 02254 80B90CD4 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 02258 80B90CD8 44066000 */  mfc1    $a2, $f12                  
/* 0225C 80B90CDC 0C0342A3 */  jal     Matrix_Scale              
/* 02260 80B90CE0 46006386 */  mov.s   $f14, $f12                 
/* 02264 80B90CE4 3C050600 */  lui     $a1, %hi(D_06000650)                ## $a1 = 06000000
/* 02268 80B90CE8 24A50650 */  addiu   $a1, $a1, %lo(D_06000650)           ## $a1 = 06000650
/* 0226C 80B90CEC 0C00D498 */  jal     Gfx_DrawDListOpa
              
/* 02270 80B90CF0 8FA4001C */  lw      $a0, 0x001C($sp)           
/* 02274 80B90CF4 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 02278 80B90CF8 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 0227C 80B90CFC 03E00008 */  jr      $ra                        
/* 02280 80B90D00 00000000 */  nop
