.late_rodata
glabel D_80982AE0
    .float 377.0

.text
glabel func_8097FCE4
/* 02674 8097FCE4 27BDFFC8 */  addiu   $sp, $sp, 0xFFC8           ## $sp = FFFFFFC8
/* 02678 8097FCE8 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 0267C 8097FCEC AFA5003C */  sw      $a1, 0x003C($sp)           
/* 02680 8097FCF0 94A21D74 */  lhu     $v0, 0x1D74($a1)           ## 00001D74
/* 02684 8097FCF4 240101F7 */  addiu   $at, $zero, 0x01F7         ## $at = 000001F7
/* 02688 8097FCF8 00803825 */  or      $a3, $a0, $zero            ## $a3 = 00000000
/* 0268C 8097FCFC 10410005 */  beq     $v0, $at, .L8097FD14       
/* 02690 8097FD00 3C0F8016 */  lui     $t7, %hi(gGameInfo)
/* 02694 8097FD04 8DEFFA90 */  lw      $t7, %lo(gGameInfo)($t7)
/* 02698 8097FD08 24010004 */  addiu   $at, $zero, 0x0004         ## $at = 00000004
/* 0269C 8097FD0C 85F81456 */  lh      $t8, 0x1456($t7)           ## 80161456
/* 026A0 8097FD10 17010013 */  bne     $t8, $at, .L8097FD60       
.L8097FD14:
/* 026A4 8097FD14 3C014396 */  lui     $at, 0x4396                ## $at = 43960000
/* 026A8 8097FD18 44813000 */  mtc1    $at, $f6                   ## $f6 = 300.00
/* 026AC 8097FD1C C4E40024 */  lwc1    $f4, 0x0024($a3)           ## 00000024
/* 026B0 8097FD20 3C01440C */  lui     $at, 0x440C                ## $at = 440C0000
/* 026B4 8097FD24 44818000 */  mtc1    $at, $f16                  ## $f16 = 560.00
/* 026B8 8097FD28 46062200 */  add.s   $f8, $f4, $f6              
/* 026BC 8097FD2C 3C018098 */  lui     $at, %hi(D_80982AE0)       ## $at = 80980000
/* 026C0 8097FD30 C4262AE0 */  lwc1    $f6, %lo(D_80982AE0)($at)  
/* 026C4 8097FD34 8FA4003C */  lw      $a0, 0x003C($sp)           
/* 026C8 8097FD38 E7A80020 */  swc1    $f8, 0x0020($sp)           
/* 026CC 8097FD3C C4EA0028 */  lwc1    $f10, 0x0028($a3)          ## 00000028
/* 026D0 8097FD40 27A50020 */  addiu   $a1, $sp, 0x0020           ## $a1 = FFFFFFE8
/* 026D4 8097FD44 3C064000 */  lui     $a2, 0x4000                ## $a2 = 40000000
/* 026D8 8097FD48 46105480 */  add.s   $f18, $f10, $f16           
/* 026DC 8097FD4C E7B20024 */  swc1    $f18, 0x0024($sp)          
/* 026E0 8097FD50 C4E4002C */  lwc1    $f4, 0x002C($a3)           ## 0000002C
/* 026E4 8097FD54 46062201 */  sub.s   $f8, $f4, $f6              
/* 026E8 8097FD58 0C25F671 */  jal     func_8097D9C4              
/* 026EC 8097FD5C E7A80028 */  swc1    $f8, 0x0028($sp)           
.L8097FD60:
/* 026F0 8097FD60 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 026F4 8097FD64 27BD0038 */  addiu   $sp, $sp, 0x0038           ## $sp = 00000000
/* 026F8 8097FD68 03E00008 */  jr      $ra                        
/* 026FC 8097FD6C 00000000 */  nop
