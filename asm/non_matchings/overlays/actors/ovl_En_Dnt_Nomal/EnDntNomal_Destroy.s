glabel EnDntNomal_Destroy
/* 00178 809F3438 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 0017C 809F343C AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 00180 809F3440 848E026A */  lh      $t6, 0x026A($a0)           ## 0000026A
/* 00184 809F3444 00803025 */  or      $a2, $a0, $zero            ## $a2 = 00000000
/* 00188 809F3448 00A03825 */  or      $a3, $a1, $zero            ## $a3 = 00000000
/* 0018C 809F344C 15C00006 */  bne     $t6, $zero, .L809F3468     
/* 00190 809F3450 00E02025 */  or      $a0, $a3, $zero            ## $a0 = 00000000
/* 00194 809F3454 00A02025 */  or      $a0, $a1, $zero            ## $a0 = 00000000
/* 00198 809F3458 0C017418 */  jal     Collider_DestroyQuad              
/* 0019C 809F345C 24C50294 */  addiu   $a1, $a2, 0x0294           ## $a1 = 00000294
/* 001A0 809F3460 10000004 */  beq     $zero, $zero, .L809F3474   
/* 001A4 809F3464 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L809F3468:
/* 001A8 809F3468 0C0170EB */  jal     Collider_DestroyCylinder
              
/* 001AC 809F346C 24C50314 */  addiu   $a1, $a2, 0x0314           ## $a1 = 00000314
/* 001B0 809F3470 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L809F3474:
/* 001B4 809F3474 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 001B8 809F3478 03E00008 */  jr      $ra                        
/* 001BC 809F347C 00000000 */  nop
