.rdata
glabel D_80970630
    .asciz "\x1b[31mDemo_Ec_Actor_ct:arg_dataがおかしい!!!!!!!!!!!!\n\x1b[m"
    .balign 4

.text
glabel DemoEc_Init
/* 00020 8096D4D0 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 00024 8096D4D4 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 00028 8096D4D8 AFA40018 */  sw      $a0, 0x0018($sp)           
/* 0002C 8096D4DC AFA5001C */  sw      $a1, 0x001C($sp)           
/* 00030 8096D4E0 8482001C */  lh      $v0, 0x001C($a0)           ## 0000001C
/* 00034 8096D4E4 00802825 */  or      $a1, $a0, $zero            ## $a1 = 00000000
/* 00038 8096D4E8 3C048097 */  lui     $a0, %hi(D_80970630)       ## $a0 = 80970000
/* 0003C 8096D4EC 04400002 */  bltz    $v0, .L8096D4F8            
/* 00040 8096D4F0 28410023 */  slti    $at, $v0, 0x0023           
/* 00044 8096D4F4 14200007 */  bne     $at, $zero, .L8096D514     
.L8096D4F8:
/* 00048 8096D4F8 24840630 */  addiu   $a0, $a0, %lo(D_80970630)  ## $a0 = 80970630
/* 0004C 8096D4FC 0C00084C */  jal     osSyncPrintf
              
/* 00050 8096D500 AFA50018 */  sw      $a1, 0x0018($sp)           
/* 00054 8096D504 0C00B55C */  jal     Actor_Kill
              
/* 00058 8096D508 8FA40018 */  lw      $a0, 0x0018($sp)           
/* 0005C 8096D50C 10000004 */  beq     $zero, $zero, .L8096D520   
/* 00060 8096D510 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L8096D514:
/* 00064 8096D514 ACA00194 */  sw      $zero, 0x0194($a1)         ## 00000194
/* 00068 8096D518 ACA00198 */  sw      $zero, 0x0198($a1)         ## 00000198
/* 0006C 8096D51C 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L8096D520:
/* 00070 8096D520 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 00074 8096D524 03E00008 */  jr      $ra                        
/* 00078 8096D528 00000000 */  nop
