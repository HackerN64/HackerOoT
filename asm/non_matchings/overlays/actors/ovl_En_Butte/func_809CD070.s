.late_rodata
glabel D_809CE478
    .float 0.6

.text
glabel func_809CD070
/* 00000 809CD070 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 00004 809CD074 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 00008 809CD078 908E0256 */  lbu     $t6, 0x0256($a0)           ## 00000256
/* 0000C 809CD07C 00803025 */  or      $a2, $a0, $zero            ## $a2 = 00000000
/* 00010 809CD080 00A03825 */  or      $a3, $a1, $zero            ## $a3 = 00000000
/* 00014 809CD084 55C00012 */  bnel    $t6, $zero, .L809CD0D0     
/* 00018 809CD088 A0C00256 */  sb      $zero, 0x0256($a2)         ## 00000256
/* 0001C 809CD08C AFA40018 */  sw      $a0, 0x0018($sp)           
/* 00020 809CD090 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 00024 809CD094 AFA5001C */  sw      $a1, 0x001C($sp)           
/* 00028 809CD098 3C01809D */  lui     $at, %hi(D_809CE478)       ## $at = 809D0000
/* 0002C 809CD09C C424E478 */  lwc1    $f4, %lo(D_809CE478)($at)  
/* 00030 809CD0A0 8FA60018 */  lw      $a2, 0x0018($sp)           
/* 00034 809CD0A4 8FA7001C */  lw      $a3, 0x001C($sp)           
/* 00038 809CD0A8 4604003C */  c.lt.s  $f0, $f4                   
/* 0003C 809CD0AC 240F0001 */  addiu   $t7, $zero, 0x0001         ## $t7 = 00000001
/* 00040 809CD0B0 24180002 */  addiu   $t8, $zero, 0x0002         ## $t8 = 00000002
/* 00044 809CD0B4 45000003 */  bc1f    .L809CD0C4                 
/* 00048 809CD0B8 00000000 */  nop
/* 0004C 809CD0BC 10000004 */  beq     $zero, $zero, .L809CD0D0   
/* 00050 809CD0C0 A0CF0256 */  sb      $t7, 0x0256($a2)           ## 00000256
.L809CD0C4:
/* 00054 809CD0C4 10000002 */  beq     $zero, $zero, .L809CD0D0   
/* 00058 809CD0C8 A0D80256 */  sb      $t8, 0x0256($a2)           ## 00000256
/* 0005C 809CD0CC A0C00256 */  sb      $zero, 0x0256($a2)         ## 00000256
.L809CD0D0:
/* 00060 809CD0D0 84E40000 */  lh      $a0, 0x0000($a3)           ## 00000000
/* 00064 809CD0D4 84E50002 */  lh      $a1, 0x0002($a3)           ## 00000002
/* 00068 809CD0D8 0C01DF64 */  jal     Math_Rand_S16Offset
              
/* 0006C 809CD0DC AFA60018 */  sw      $a2, 0x0018($sp)           
/* 00070 809CD0E0 8FA60018 */  lw      $a2, 0x0018($sp)           
/* 00074 809CD0E4 A4C20254 */  sh      $v0, 0x0254($a2)           ## 00000254
/* 00078 809CD0E8 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 0007C 809CD0EC 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 00080 809CD0F0 03E00008 */  jr      $ra                        
/* 00084 809CD0F4 00000000 */  nop
