glabel func_80A79168
/* 001B8 80A79168 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 001BC 80A7916C AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 001C0 80A79170 AFA5001C */  sw      $a1, 0x001C($sp)           
/* 001C4 80A79174 24050019 */  addiu   $a1, $zero, 0x0019         ## $a1 = 00000019
/* 001C8 80A79178 0C01B0D8 */  jal     Text_GetFaceReaction              
/* 001CC 80A7917C AFA40018 */  sw      $a0, 0x0018($sp)           
/* 001D0 80A79180 8FA40018 */  lw      $a0, 0x0018($sp)           
/* 001D4 80A79184 10400003 */  beq     $v0, $zero, .L80A79194     
/* 001D8 80A79188 3043FFFF */  andi    $v1, $v0, 0xFFFF           ## $v1 = 00000000
/* 001DC 80A7918C 1000000B */  beq     $zero, $zero, .L80A791BC   
/* 001E0 80A79190 00601025 */  or      $v0, $v1, $zero            ## $v0 = 00000000
.L80A79194:
/* 001E4 80A79194 3C0E8016 */  lui     $t6, 0x8016                ## $t6 = 80160000
/* 001E8 80A79198 8DCEE664 */  lw      $t6, -0x199C($t6)          ## 8015E664
/* 001EC 80A7919C 11C00005 */  beq     $t6, $zero, .L80A791B4     
/* 001F0 80A791A0 00000000 */  nop
/* 001F4 80A791A4 0C29E3EC */  jal     func_80A78FB0              
/* 001F8 80A791A8 00000000 */  nop
/* 001FC 80A791AC 10000004 */  beq     $zero, $zero, .L80A791C0   
/* 00200 80A791B0 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L80A791B4:
/* 00204 80A791B4 0C29E404 */  jal     func_80A79010              
/* 00208 80A791B8 00000000 */  nop
.L80A791BC:
/* 0020C 80A791BC 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L80A791C0:
/* 00210 80A791C0 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 00214 80A791C4 03E00008 */  jr      $ra                        
/* 00218 80A791C8 00000000 */  nop


