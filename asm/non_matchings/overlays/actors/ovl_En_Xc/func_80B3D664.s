.late_rodata
glabel D_80B42220
    .float 0.01

glabel D_80B42224
    .float 1.2

.text
glabel func_80B3D664
/* 01484 80B3D664 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 01488 80B3D668 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 0148C 80B3D66C 3C014040 */  lui     $at, 0x4040                ## $at = 40400000
/* 01490 80B3D670 44811000 */  mtc1    $at, $f2                   ## $f2 = 3.00
/* 01494 80B3D674 C4800268 */  lwc1    $f0, 0x0268($a0)           ## 00000268
/* 01498 80B3D678 3C0E8016 */  lui     $t6, %hi(gGameInfo)
/* 0149C 80B3D67C 4602003C */  c.lt.s  $f0, $f2                   
/* 014A0 80B3D680 00000000 */  nop
/* 014A4 80B3D684 45020012 */  bc1fl   .L80B3D6D0                 
/* 014A8 80B3D688 44805000 */  mtc1    $zero, $f10                ## $f10 = 0.00
/* 014AC 80B3D68C 8DCEFA90 */  lw      $t6, %lo(gGameInfo)($t6)
/* 014B0 80B3D690 3C0180B4 */  lui     $at, %hi(D_80B42220)       ## $at = 80B40000
/* 014B4 80B3D694 C4282220 */  lwc1    $f8, %lo(D_80B42220)($at)  
/* 014B8 80B3D698 85CF1458 */  lh      $t7, 0x1458($t6)           ## 80161458
/* 014BC 80B3D69C 3C0180B4 */  lui     $at, %hi(D_80B42224)       ## $at = 80B40000
/* 014C0 80B3D6A0 C4302224 */  lwc1    $f16, %lo(D_80B42224)($at) 
/* 014C4 80B3D6A4 448F2000 */  mtc1    $t7, $f4                   ## $f4 = 0.00
/* 014C8 80B3D6A8 00000000 */  nop
/* 014CC 80B3D6AC 468021A0 */  cvt.s.w $f6, $f4                   
/* 014D0 80B3D6B0 46083282 */  mul.s   $f10, $f6, $f8             
/* 014D4 80B3D6B4 46001181 */  sub.s   $f6, $f2, $f0              
/* 014D8 80B3D6B8 46105480 */  add.s   $f18, $f10, $f16           
/* 014DC 80B3D6BC 46029103 */  div.s   $f4, $f18, $f2             
/* 014E0 80B3D6C0 46062202 */  mul.s   $f8, $f4, $f6              
/* 014E4 80B3D6C4 10000004 */  beq     $zero, $zero, .L80B3D6D8   
/* 014E8 80B3D6C8 E4880068 */  swc1    $f8, 0x0068($a0)           ## 00000068
/* 014EC 80B3D6CC 44805000 */  mtc1    $zero, $f10                ## $f10 = 0.00
.L80B3D6D0:
/* 014F0 80B3D6D0 00000000 */  nop
/* 014F4 80B3D6D4 E48A0068 */  swc1    $f10, 0x0068($a0)          ## 00000068
.L80B3D6D8:
/* 014F8 80B3D6D8 0C00B638 */  jal     Actor_MoveForward
              
/* 014FC 80B3D6DC 00000000 */  nop
/* 01500 80B3D6E0 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 01504 80B3D6E4 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 01508 80B3D6E8 03E00008 */  jr      $ra                        
/* 0150C 80B3D6EC 00000000 */  nop
