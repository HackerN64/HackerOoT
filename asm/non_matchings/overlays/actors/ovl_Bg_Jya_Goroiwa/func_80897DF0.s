.late_rodata
glabel D_80897FEC
    .float 0.1

.text
glabel func_80897DF0
/* 00480 80897DF0 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 00484 80897DF4 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 00488 80897DF8 AFA5001C */  sw      $a1, 0x001C($sp)           
/* 0048C 80897DFC 848E01B6 */  lh      $t6, 0x01B6($a0)           ## 000001B6
/* 00490 80897E00 25CF0001 */  addiu   $t7, $t6, 0x0001           ## $t7 = 00000001
/* 00494 80897E04 A48F01B6 */  sh      $t7, 0x01B6($a0)           ## 000001B6
/* 00498 80897E08 849801B6 */  lh      $t8, 0x01B6($a0)           ## 000001B6
/* 0049C 80897E0C 2B01003D */  slti    $at, $t8, 0x003D           
/* 004A0 80897E10 54200008 */  bnel    $at, $zero, .L80897E34     
/* 004A4 80897E14 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 004A8 80897E18 0C225EC7 */  jal     func_80897B1C              
/* 004AC 80897E1C AFA40018 */  sw      $a0, 0x0018($sp)           
/* 004B0 80897E20 3C018089 */  lui     $at, %hi(D_80897FEC)       ## $at = 80890000
/* 004B4 80897E24 8FA40018 */  lw      $a0, 0x0018($sp)           
/* 004B8 80897E28 C4247FEC */  lwc1    $f4, %lo(D_80897FEC)($at)  
/* 004BC 80897E2C E48401B0 */  swc1    $f4, 0x01B0($a0)           ## 000001B0
/* 004C0 80897E30 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L80897E34:
/* 004C4 80897E34 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 004C8 80897E38 03E00008 */  jr      $ra                        
/* 004CC 80897E3C 00000000 */  nop
