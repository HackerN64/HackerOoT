.rdata
glabel D_80B5A6D4
    .asciz "ゼルダ姫のEn_Zl3_Actor_inFinal2_Init通すよ!!!!!!!!!!!!!!!!!!!!!!!!!\n"
    .balign 4

glabel D_80B5A71C
    .asciz "ゼルダ姫のEn_Zl3_Actor_inFinal2_Initは通った!!!!!!!!!!!!!!!!!!!!!!!!!\n"
    .balign 4

.text
glabel func_80B55780
/* 023D0 80B55780 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 023D4 80B55784 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 023D8 80B55788 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 023DC 80B5578C AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 023E0 80B55790 3C0480B6 */  lui     $a0, %hi(D_80B5A6D4)       ## $a0 = 80B60000
/* 023E4 80B55794 AFA5002C */  sw      $a1, 0x002C($sp)           
/* 023E8 80B55798 0C00084C */  jal     osSyncPrintf
              
/* 023EC 80B5579C 2484A6D4 */  addiu   $a0, $a0, %lo(D_80B5A6D4)  ## $a0 = 80B5A6D4
/* 023F0 80B557A0 3C050600 */  lui     $a1, 0x0600                ## $a1 = 06000000
/* 023F4 80B557A4 24A55A0C */  addiu   $a1, $a1, 0x5A0C           ## $a1 = 06005A0C
/* 023F8 80B557A8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 023FC 80B557AC 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 02400 80B557B0 24070000 */  addiu   $a3, $zero, 0x0000         ## $a3 = 00000000
/* 02404 80B557B4 0C2D5385 */  jal     func_80B54E14              
/* 02408 80B557B8 AFA00010 */  sw      $zero, 0x0010($sp)         
/* 0240C 80B557BC 240E0007 */  addiu   $t6, $zero, 0x0007         ## $t6 = 00000007
/* 02410 80B557C0 240F0001 */  addiu   $t7, $zero, 0x0001         ## $t7 = 00000001
/* 02414 80B557C4 3C0480B6 */  lui     $a0, %hi(D_80B5A71C)       ## $a0 = 80B60000
/* 02418 80B557C8 AE0E024C */  sw      $t6, 0x024C($s0)           ## 0000024C
/* 0241C 80B557CC AE0F0250 */  sw      $t7, 0x0250($s0)           ## 00000250
/* 02420 80B557D0 0C00084C */  jal     osSyncPrintf
              
/* 02424 80B557D4 2484A71C */  addiu   $a0, $a0, %lo(D_80B5A71C)  ## $a0 = 80B5A71C
/* 02428 80B557D8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0242C 80B557DC 0C2D4D5A */  jal     func_80B53568              
/* 02430 80B557E0 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 02434 80B557E4 8E180004 */  lw      $t8, 0x0004($s0)           ## 00000004
/* 02438 80B557E8 2401FFFE */  addiu   $at, $zero, 0xFFFE         ## $at = FFFFFFFE
/* 0243C 80B557EC 0301C824 */  and     $t9, $t8, $at              
/* 02440 80B557F0 AE190004 */  sw      $t9, 0x0004($s0)           ## 00000004
/* 02444 80B557F4 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 02448 80B557F8 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 0244C 80B557FC 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
/* 02450 80B55800 03E00008 */  jr      $ra                        
/* 02454 80B55804 00000000 */  nop
