.late_rodata
glabel D_808B6B14
 .word 0x3B03126E, 0x00000000, 0x00000000

.text
glabel func_808B6680
/* 00240 808B6680 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 00244 808B6684 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 00248 808B6688 AFA5001C */  sw      $a1, 0x001C($sp)           
/* 0024C 808B668C 90820150 */  lbu     $v0, 0x0150($a0)           ## 00000150
/* 00250 808B6690 28410006 */  slti    $at, $v0, 0x0006           
/* 00254 808B6694 14200003 */  bne     $at, $zero, .L808B66A4     
/* 00258 808B6698 244EFFFB */  addiu   $t6, $v0, 0xFFFB           ## $t6 = FFFFFFFB
/* 0025C 808B669C 10000004 */  beq     $zero, $zero, .L808B66B0   
/* 00260 808B66A0 A08E0150 */  sb      $t6, 0x0150($a0)           ## 00000150
.L808B66A4:
/* 00264 808B66A4 0C00B55C */  jal     Actor_Kill
              
/* 00268 808B66A8 AFA40018 */  sw      $a0, 0x0018($sp)           
/* 0026C 808B66AC 8FA40018 */  lw      $a0, 0x0018($sp)           
.L808B66B0:
/* 00270 808B66B0 848F00B6 */  lh      $t7, 0x00B6($a0)           ## 000000B6
/* 00274 808B66B4 3C01808B */  lui     $at, %hi(D_808B6B14)       ## $at = 808B0000
/* 00278 808B66B8 C4840050 */  lwc1    $f4, 0x0050($a0)           ## 00000050
/* 0027C 808B66BC 25F8FFE0 */  addiu   $t8, $t7, 0xFFE0           ## $t8 = FFFFFFE0
/* 00280 808B66C0 A49800B6 */  sh      $t8, 0x00B6($a0)           ## 000000B6
/* 00284 808B66C4 C4266B14 */  lwc1    $f6, %lo(D_808B6B14)($at)  
/* 00288 808B66C8 46062200 */  add.s   $f8, $f4, $f6              
/* 0028C 808B66CC 44054000 */  mfc1    $a1, $f8                   
/* 00290 808B66D0 0C00B58B */  jal     Actor_SetScale
              
/* 00294 808B66D4 00000000 */  nop
/* 00298 808B66D8 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 0029C 808B66DC 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 002A0 808B66E0 03E00008 */  jr      $ra                        
/* 002A4 808B66E4 00000000 */  nop
