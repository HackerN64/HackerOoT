.late_rodata
glabel D_80AEA910
    .float 5000.0

glabel D_80AEA914
    .float -5000.0

.text
glabel func_80AE9880
/* 01440 80AE9880 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 01444 80AE9884 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 01448 80AE9888 AFA5001C */  sw      $a1, 0x001C($sp)           
/* 0144C 80AE988C 90820114 */  lbu     $v0, 0x0114($a0)           ## 00000114
/* 01450 80AE9890 14400005 */  bne     $v0, $zero, .L80AE98A8     
/* 01454 80AE9894 304E0008 */  andi    $t6, $v0, 0x0008           ## $t6 = 00000000
/* 01458 80AE9898 0C2BA311 */  jal     func_80AE8C44              
/* 0145C 80AE989C 00000000 */  nop
/* 01460 80AE98A0 10000012 */  beq     $zero, $zero, .L80AE98EC   
/* 01464 80AE98A4 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L80AE98A8:
/* 01468 80AE98A8 11C00009 */  beq     $t6, $zero, .L80AE98D0     
/* 0146C 80AE98AC 3C0180AF */  lui     $at, %hi(D_80AEA914)       ## $at = 80AF0000
/* 01470 80AE98B0 3C0180AF */  lui     $at, %hi(D_80AEA910)       ## $at = 80AF0000
/* 01474 80AE98B4 C420A910 */  lwc1    $f0, %lo(D_80AEA910)($at)  
/* 01478 80AE98B8 24820040 */  addiu   $v0, $a0, 0x0040           ## $v0 = 00000040
/* 0147C 80AE98BC E4400298 */  swc1    $f0, 0x0298($v0)           ## 000002D8
/* 01480 80AE98C0 E44002D8 */  swc1    $f0, 0x02D8($v0)           ## 00000318
/* 01484 80AE98C4 E4400318 */  swc1    $f0, 0x0318($v0)           ## 00000358
/* 01488 80AE98C8 10000007 */  beq     $zero, $zero, .L80AE98E8   
/* 0148C 80AE98CC E4400258 */  swc1    $f0, 0x0258($v0)           ## 00000298
.L80AE98D0:
/* 01490 80AE98D0 C420A914 */  lwc1    $f0, %lo(D_80AEA914)($at)  
/* 01494 80AE98D4 24820040 */  addiu   $v0, $a0, 0x0040           ## $v0 = 00000040
/* 01498 80AE98D8 E4400298 */  swc1    $f0, 0x0298($v0)           ## 000002D8
/* 0149C 80AE98DC E44002D8 */  swc1    $f0, 0x02D8($v0)           ## 00000318
/* 014A0 80AE98E0 E4400318 */  swc1    $f0, 0x0318($v0)           ## 00000358
/* 014A4 80AE98E4 E4400258 */  swc1    $f0, 0x0258($v0)           ## 00000298
.L80AE98E8:
/* 014A8 80AE98E8 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L80AE98EC:
/* 014AC 80AE98EC 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 014B0 80AE98F0 03E00008 */  jr      $ra                        
/* 014B4 80AE98F4 00000000 */  nop
