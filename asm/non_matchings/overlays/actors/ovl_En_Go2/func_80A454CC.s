.late_rodata
glabel jtbl_80A486F0
    .word L80A45500
    .word L80A4555C
    .word L80A4551C
    .word L80A4555C
    .word L80A4555C
    .word L80A4555C
    .word L80A45500
    .word L80A45500
    .word L80A4555C
    .word L80A4555C
    .word L80A45500
    .word L80A4555C
    .word L80A45500

.text
glabel func_80A454CC
/* 0279C 80A454CC 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 027A0 80A454D0 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 027A4 80A454D4 848E001C */  lh      $t6, 0x001C($a0)           ## 0000001C
/* 027A8 80A454D8 00803825 */  or      $a3, $a0, $zero            ## $a3 = 00000000
/* 027AC 80A454DC 31CF001F */  andi    $t7, $t6, 0x001F           ## $t7 = 00000000
/* 027B0 80A454E0 2DE1000D */  sltiu   $at, $t7, 0x000D           
/* 027B4 80A454E4 1020001D */  beq     $at, $zero, .L80A4555C     
/* 027B8 80A454E8 000F7880 */  sll     $t7, $t7,  2               
/* 027BC 80A454EC 3C0180A5 */  lui     $at, %hi(jtbl_80A486F0)       ## $at = 80A50000
/* 027C0 80A454F0 002F0821 */  addu    $at, $at, $t7              
/* 027C4 80A454F4 8C2F86F0 */  lw      $t7, %lo(jtbl_80A486F0)($at)  
/* 027C8 80A454F8 01E00008 */  jr      $t7                        
/* 027CC 80A454FC 00000000 */  nop
glabel L80A45500
/* 027D0 80A45500 3C0580A5 */  lui     $a1, %hi(D_80A48348)       ## $a1 = 80A50000
/* 027D4 80A45504 24A58348 */  addiu   $a1, $a1, %lo(D_80A48348)  ## $a1 = 80A48348
/* 027D8 80A45508 24E4014C */  addiu   $a0, $a3, 0x014C           ## $a0 = 0000014C
/* 027DC 80A4550C 0C00D3B0 */  jal     func_80034EC0              
/* 027E0 80A45510 24060009 */  addiu   $a2, $zero, 0x0009         ## $a2 = 00000009
/* 027E4 80A45514 10000015 */  beq     $zero, $zero, .L80A4556C   
/* 027E8 80A45518 8FBF0014 */  lw      $ra, 0x0014($sp)           
glabel L80A4551C
/* 027EC 80A4551C 3C188012 */  lui     $t8, %hi(gItemSlots+0x2d)
/* 027F0 80A45520 93187491 */  lbu     $t8, %lo(gItemSlots+0x2d)($t8)
/* 027F4 80A45524 3C028016 */  lui     $v0, %hi(gSaveContext+0x74)
/* 027F8 80A45528 00581021 */  addu    $v0, $v0, $t8              
/* 027FC 80A4552C 9042E6D4 */  lbu     $v0, %lo(gSaveContext+0x74)($v0)
/* 02800 80A45530 28410033 */  slti    $at, $v0, 0x0033           
/* 02804 80A45534 14200009 */  bne     $at, $zero, .L80A4555C     
/* 02808 80A45538 28410037 */  slti    $at, $v0, 0x0037           
/* 0280C 80A4553C 10200007 */  beq     $at, $zero, .L80A4555C     
/* 02810 80A45540 24E4014C */  addiu   $a0, $a3, 0x014C           ## $a0 = 0000014C
/* 02814 80A45544 3C0580A5 */  lui     $a1, %hi(D_80A48348)       ## $a1 = 80A50000
/* 02818 80A45548 24A58348 */  addiu   $a1, $a1, %lo(D_80A48348)  ## $a1 = 80A48348
/* 0281C 80A4554C 0C00D3B0 */  jal     func_80034EC0              
/* 02820 80A45550 24060004 */  addiu   $a2, $zero, 0x0004         ## $a2 = 00000004
/* 02824 80A45554 10000005 */  beq     $zero, $zero, .L80A4556C   
/* 02828 80A45558 8FBF0014 */  lw      $ra, 0x0014($sp)           
glabel L80A4555C
.L80A4555C:
/* 0282C 80A4555C 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 02830 80A45560 00000000 */  nop
/* 02834 80A45564 E4E40168 */  swc1    $f4, 0x0168($a3)           ## 00000168
/* 02838 80A45568 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L80A4556C:
/* 0283C 80A4556C 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 02840 80A45570 03E00008 */  jr      $ra                        
/* 02844 80A45574 00000000 */  nop
