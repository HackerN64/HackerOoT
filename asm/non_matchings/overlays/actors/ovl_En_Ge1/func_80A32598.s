.rdata
glabel D_80A32888
    .asciz "../z_en_ge1.c"
    .balign 4

glabel D_80A32898
    .asciz "../z_en_ge1.c"
    .balign 4

.text
glabel func_80A32598
/* 01C28 80A32598 27BDFFC8 */  addiu   $sp, $sp, 0xFFC8           ## $sp = FFFFFFC8
/* 01C2C 80A3259C AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 01C30 80A325A0 AFA40038 */  sw      $a0, 0x0038($sp)           
/* 01C34 80A325A4 AFA5003C */  sw      $a1, 0x003C($sp)           
/* 01C38 80A325A8 AFA60040 */  sw      $a2, 0x0040($sp)           
/* 01C3C 80A325AC AFA70044 */  sw      $a3, 0x0044($sp)           
/* 01C40 80A325B0 8C850000 */  lw      $a1, 0x0000($a0)           ## 00000000
/* 01C44 80A325B4 3C0680A3 */  lui     $a2, %hi(D_80A32888)       ## $a2 = 80A30000
/* 01C48 80A325B8 24C62888 */  addiu   $a2, $a2, %lo(D_80A32888)  ## $a2 = 80A32888
/* 01C4C 80A325BC 27A40020 */  addiu   $a0, $sp, 0x0020           ## $a0 = FFFFFFE8
/* 01C50 80A325C0 2407058B */  addiu   $a3, $zero, 0x058B         ## $a3 = 0000058B
/* 01C54 80A325C4 0C031AB1 */  jal     Graph_OpenDisps              
/* 01C58 80A325C8 AFA50030 */  sw      $a1, 0x0030($sp)           
/* 01C5C 80A325CC 8FAF003C */  lw      $t7, 0x003C($sp)           
/* 01C60 80A325D0 2401000F */  addiu   $at, $zero, 0x000F         ## $at = 0000000F
/* 01C64 80A325D4 8FA80030 */  lw      $t0, 0x0030($sp)           
/* 01C68 80A325D8 15E10010 */  bne     $t7, $at, .L80A3261C       
/* 01C6C 80A325DC 8FA60048 */  lw      $a2, 0x0048($sp)           
/* 01C70 80A325E0 8D0302C0 */  lw      $v1, 0x02C0($t0)           ## 000002C0
/* 01C74 80A325E4 3C19DE00 */  lui     $t9, 0xDE00                ## $t9 = DE000000
/* 01C78 80A325E8 3C0B80A3 */  lui     $t3, %hi(D_80A3279C)       ## $t3 = 80A30000
/* 01C7C 80A325EC 24780008 */  addiu   $t8, $v1, 0x0008           ## $t8 = 00000008
/* 01C80 80A325F0 AD1802C0 */  sw      $t8, 0x02C0($t0)           ## 000002C0
/* 01C84 80A325F4 AC790000 */  sw      $t9, 0x0000($v1)           ## 00000000
/* 01C88 80A325F8 90C902AE */  lbu     $t1, 0x02AE($a2)           ## 000002AE
/* 01C8C 80A325FC 3C0480A3 */  lui     $a0, %hi(D_80A327A8)       ## $a0 = 80A30000
/* 01C90 80A32600 248427A8 */  addiu   $a0, $a0, %lo(D_80A327A8)  ## $a0 = 80A327A8
/* 01C94 80A32604 00095080 */  sll     $t2, $t1,  2               
/* 01C98 80A32608 016A5821 */  addu    $t3, $t3, $t2              
/* 01C9C 80A3260C 8D6B279C */  lw      $t3, %lo(D_80A3279C)($t3)  
/* 01CA0 80A32610 24C50038 */  addiu   $a1, $a2, 0x0038           ## $a1 = 00000038
/* 01CA4 80A32614 0C0346BD */  jal     Matrix_MultVec3f              
/* 01CA8 80A32618 AC6B0004 */  sw      $t3, 0x0004($v1)           ## 00000004
.L80A3261C:
/* 01CAC 80A3261C 8FAC0038 */  lw      $t4, 0x0038($sp)           
/* 01CB0 80A32620 3C0680A3 */  lui     $a2, %hi(D_80A32898)       ## $a2 = 80A30000
/* 01CB4 80A32624 24C62898 */  addiu   $a2, $a2, %lo(D_80A32898)  ## $a2 = 80A32898
/* 01CB8 80A32628 27A40020 */  addiu   $a0, $sp, 0x0020           ## $a0 = FFFFFFE8
/* 01CBC 80A3262C 24070593 */  addiu   $a3, $zero, 0x0593         ## $a3 = 00000593
/* 01CC0 80A32630 0C031AD5 */  jal     Graph_CloseDisps              
/* 01CC4 80A32634 8D850000 */  lw      $a1, 0x0000($t4)           ## 00000000
/* 01CC8 80A32638 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 01CCC 80A3263C 27BD0038 */  addiu   $sp, $sp, 0x0038           ## $sp = 00000000
/* 01CD0 80A32640 03E00008 */  jr      $ra                        
/* 01CD4 80A32644 00000000 */  nop
