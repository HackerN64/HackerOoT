glabel EnTa_Destroy
/* 007DC 80B1427C 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 007E0 80B14280 00803025 */  or      $a2, $a0, $zero            ## $a2 = 00000000
/* 007E4 80B14284 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 007E8 80B14288 AFA5001C */  sw      $a1, 0x001C($sp)           
/* 007EC 80B1428C 00A02025 */  or      $a0, $a1, $zero            ## $a0 = 00000000
/* 007F0 80B14290 24C50264 */  addiu   $a1, $a2, 0x0264           ## $a1 = 00000264
/* 007F4 80B14294 0C0170EB */  jal     Collider_DestroyCylinder
              
/* 007F8 80B14298 AFA60018 */  sw      $a2, 0x0018($sp)           
/* 007FC 80B1429C 8FA60018 */  lw      $a2, 0x0018($sp)           
/* 00800 80B142A0 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 00804 80B142A4 84C2001C */  lh      $v0, 0x001C($a2)           ## 0000001C
/* 00808 80B142A8 10410008 */  beq     $v0, $at, .L80B142CC       
/* 0080C 80B142AC 24010002 */  addiu   $at, $zero, 0x0002         ## $at = 00000002
/* 00810 80B142B0 10410006 */  beq     $v0, $at, .L80B142CC       
/* 00814 80B142B4 8FAE001C */  lw      $t6, 0x001C($sp)           
/* 00818 80B142B8 85CF00A4 */  lh      $t7, 0x00A4($t6)           ## 000000A4
/* 0081C 80B142BC 2401004C */  addiu   $at, $zero, 0x004C         ## $at = 0000004C
/* 00820 80B142C0 15E10002 */  bne     $t7, $at, .L80B142CC       
/* 00824 80B142C4 3C018016 */  lui     $at, %hi(gSaveContext+0x13ce)
/* 00828 80B142C8 A420FA2E */  sh      $zero, %lo(gSaveContext+0x13ce)($at)
.L80B142CC:
/* 0082C 80B142CC 94D802E0 */  lhu     $t8, 0x02E0($a2)           ## 000002E0
/* 00830 80B142D0 33190200 */  andi    $t9, $t8, 0x0200           ## $t9 = 00000000
/* 00834 80B142D4 53200004 */  beql    $t9, $zero, .L80B142E8     
/* 00838 80B142D8 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 0083C 80B142DC 0C03D6D6 */  jal     func_800F5B58              
/* 00840 80B142E0 00000000 */  nop
/* 00844 80B142E4 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L80B142E8:
/* 00848 80B142E8 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 0084C 80B142EC 03E00008 */  jr      $ra                        
/* 00850 80B142F0 00000000 */  nop
