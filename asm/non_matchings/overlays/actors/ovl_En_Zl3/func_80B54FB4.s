.rdata
glabel D_80B5A610
    .asciz "ゼルダ姫のEn_Zl3_Actor_inFinal_Init通すよ!!!!!!!!!!!!!!!!!!!!!!!!!\n"
    .balign 4

glabel D_80B5A654
    .asciz "ゼルダ姫のEn_Zl3_Actor_inFinal_Initは通った!!!!!!!!!!!!!!!!!!!!!!!!!\n"
    .balign 4

.text
glabel func_80B54FB4
/* 01C04 80B54FB4 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 01C08 80B54FB8 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 01C0C 80B54FBC 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 01C10 80B54FC0 AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 01C14 80B54FC4 3C0480B6 */  lui     $a0, %hi(D_80B5A610)       ## $a0 = 80B60000
/* 01C18 80B54FC8 AFA5002C */  sw      $a1, 0x002C($sp)           
/* 01C1C 80B54FCC 0C00084C */  jal     osSyncPrintf
              
/* 01C20 80B54FD0 2484A610 */  addiu   $a0, $a0, %lo(D_80B5A610)  ## $a0 = 80B5A610
/* 01C24 80B54FD4 3C050601 */  lui     $a1, 0x0601                ## $a1 = 06010000
/* 01C28 80B54FD8 24A58AD0 */  addiu   $a1, $a1, 0x8AD0           ## $a1 = 06008AD0
/* 01C2C 80B54FDC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01C30 80B54FE0 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 01C34 80B54FE4 24070000 */  addiu   $a3, $zero, 0x0000         ## $a3 = 00000000
/* 01C38 80B54FE8 0C2D5385 */  jal     func_80B54E14              
/* 01C3C 80B54FEC AFA00010 */  sw      $zero, 0x0010($sp)         
/* 01C40 80B54FF0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01C44 80B54FF4 0C2D4D55 */  jal     func_80B53554              
/* 01C48 80B54FF8 24050004 */  addiu   $a1, $zero, 0x0004         ## $a1 = 00000004
/* 01C4C 80B54FFC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01C50 80B55000 0C2D4D5A */  jal     func_80B53568              
/* 01C54 80B55004 24050002 */  addiu   $a1, $zero, 0x0002         ## $a1 = 00000002
/* 01C58 80B55008 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
/* 01C5C 80B5500C AE02024C */  sw      $v0, 0x024C($s0)           ## 0000024C
/* 01C60 80B55010 AE020250 */  sw      $v0, 0x0250($s0)           ## 00000250
/* 01C64 80B55014 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 01C68 80B55018 0C2D53C6 */  jal     func_80B54F18              
/* 01C6C 80B5501C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01C70 80B55020 A60000B8 */  sh      $zero, 0x00B8($s0)         ## 000000B8
/* 01C74 80B55024 860E0034 */  lh      $t6, 0x0034($s0)           ## 00000034
/* 01C78 80B55028 860F00B8 */  lh      $t7, 0x00B8($s0)           ## 000000B8
/* 01C7C 80B5502C 3C0480B6 */  lui     $a0, %hi(D_80B5A654)       ## $a0 = 80B60000
/* 01C80 80B55030 2484A654 */  addiu   $a0, $a0, %lo(D_80B5A654)  ## $a0 = 80B5A654
/* 01C84 80B55034 AE0E03C4 */  sw      $t6, 0x03C4($s0)           ## 000003C4
/* 01C88 80B55038 0C00084C */  jal     osSyncPrintf
              
/* 01C8C 80B5503C A60F0034 */  sh      $t7, 0x0034($s0)           ## 00000034
/* 01C90 80B55040 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 01C94 80B55044 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 01C98 80B55048 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
/* 01C9C 80B5504C 03E00008 */  jr      $ra                        
/* 01CA0 80B55050 00000000 */  nop
