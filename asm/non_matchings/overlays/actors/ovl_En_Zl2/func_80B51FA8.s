.rdata
glabel D_80B529F4
    .asciz "En_Zl2_inRunning_Check_DemoMode:そんな動作は無い!!!!!!!!\n"
    .balign 4

.text
glabel func_80B51FA8
/* 03618 80B51FA8 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 0361C 80B51FAC AFB00018 */  sw      $s0, 0x0018($sp)           
/* 03620 80B51FB0 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 03624 80B51FB4 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 03628 80B51FB8 AFA5002C */  sw      $a1, 0x002C($sp)           
/* 0362C 80B51FBC 00A02025 */  or      $a0, $a1, $zero            ## $a0 = 00000000
/* 03630 80B51FC0 0C2D3B65 */  jal     func_80B4ED94              
/* 03634 80B51FC4 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 03638 80B51FC8 50400023 */  beql    $v0, $zero, .L80B52058     
/* 0363C 80B51FCC 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 03640 80B51FD0 94460000 */  lhu     $a2, 0x0000($v0)           ## 00000000
/* 03644 80B51FD4 8E030240 */  lw      $v1, 0x0240($s0)           ## 00000240
/* 03648 80B51FD8 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 0364C 80B51FDC 50C3001E */  beql    $a2, $v1, .L80B52058       
/* 03650 80B51FE0 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 03654 80B51FE4 10C10009 */  beq     $a2, $at, .L80B5200C       
/* 03658 80B51FE8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0365C 80B51FEC 24010002 */  addiu   $at, $zero, 0x0002         ## $at = 00000002
/* 03660 80B51FF0 10C1000A */  beq     $a2, $at, .L80B5201C       
/* 03664 80B51FF4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 03668 80B51FF8 2401000E */  addiu   $at, $zero, 0x000E         ## $at = 0000000E
/* 0366C 80B51FFC 10C1000C */  beq     $a2, $at, .L80B52030       
/* 03670 80B52000 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 03674 80B52004 1000000E */  beq     $zero, $zero, .L80B52040   
/* 03678 80B52008 3C0480B5 */  lui     $a0, %hi(D_80B529F4)       ## $a0 = 80B50000
.L80B5200C:
/* 0367C 80B5200C 0C2D47AA */  jal     func_80B51EA8              
/* 03680 80B52010 AFA60020 */  sw      $a2, 0x0020($sp)           
/* 03684 80B52014 1000000E */  beq     $zero, $zero, .L80B52050   
/* 03688 80B52018 8FA60020 */  lw      $a2, 0x0020($sp)           
.L80B5201C:
/* 0368C 80B5201C 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 03690 80B52020 0C2D47AF */  jal     func_80B51EBC              
/* 03694 80B52024 AFA60020 */  sw      $a2, 0x0020($sp)           
/* 03698 80B52028 10000009 */  beq     $zero, $zero, .L80B52050   
/* 0369C 80B5202C 8FA60020 */  lw      $a2, 0x0020($sp)           
.L80B52030:
/* 036A0 80B52030 0C00B55C */  jal     Actor_Kill
              
/* 036A4 80B52034 AFA60020 */  sw      $a2, 0x0020($sp)           
/* 036A8 80B52038 10000005 */  beq     $zero, $zero, .L80B52050   
/* 036AC 80B5203C 8FA60020 */  lw      $a2, 0x0020($sp)           
.L80B52040:
/* 036B0 80B52040 248429F4 */  addiu   $a0, $a0, %lo(D_80B529F4)  ## $a0 = 000029F4
/* 036B4 80B52044 0C00084C */  jal     osSyncPrintf
              
/* 036B8 80B52048 AFA60020 */  sw      $a2, 0x0020($sp)           
/* 036BC 80B5204C 8FA60020 */  lw      $a2, 0x0020($sp)           
.L80B52050:
/* 036C0 80B52050 AE060240 */  sw      $a2, 0x0240($s0)           ## 00000240
/* 036C4 80B52054 8FBF001C */  lw      $ra, 0x001C($sp)           
.L80B52058:
/* 036C8 80B52058 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 036CC 80B5205C 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
/* 036D0 80B52060 03E00008 */  jr      $ra                        
/* 036D4 80B52064 00000000 */  nop
