.late_rodata
glabel D_809379CC
 .word 0x3C4CCCCD

.text
glabel func_8092F3F0
/* 02E20 8092F3F0 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 02E24 8092F3F4 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 02E28 8092F3F8 AFA40018 */  sw      $a0, 0x0018($sp)           
/* 02E2C 8092F3FC 240E00A0 */  addiu   $t6, $zero, 0x00A0         ## $t6 = 000000A0
/* 02E30 8092F400 A48E0198 */  sh      $t6, 0x0198($a0)           ## 00000198
/* 02E34 8092F404 3C018093 */  lui     $at, %hi(D_809379CC)       ## $at = 80930000
/* 02E38 8092F408 C42C79CC */  lwc1    $f12, %lo(D_809379CC)($at) 
/* 02E3C 8092F40C 0C24BB1D */  jal     func_8092EC74              
/* 02E40 8092F410 24050002 */  addiu   $a1, $zero, 0x0002         ## $a1 = 00000002
/* 02E44 8092F414 8FB90018 */  lw      $t9, 0x0018($sp)           
/* 02E48 8092F418 3C188093 */  lui     $t8, %hi(func_8092F434)    ## $t8 = 80930000
/* 02E4C 8092F41C 2718F434 */  addiu   $t8, $t8, %lo(func_8092F434) ## $t8 = 8092F434
/* 02E50 8092F420 AF380190 */  sw      $t8, 0x0190($t9)           ## 00000190
/* 02E54 8092F424 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 02E58 8092F428 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 02E5C 8092F42C 03E00008 */  jr      $ra                        
/* 02E60 8092F430 00000000 */  nop
