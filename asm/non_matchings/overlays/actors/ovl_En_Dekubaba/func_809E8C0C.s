glabel func_809E8C0C
/* 0343C 809E8C0C 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 03440 809E8C10 AFA40018 */  sw      $a0, 0x0018($sp)           
/* 03444 809E8C14 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 03448 809E8C18 00A02025 */  or      $a0, $a1, $zero            ## $a0 = 00000000
/* 0344C 809E8C1C AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 03450 809E8C20 AFA60020 */  sw      $a2, 0x0020($sp)           
/* 03454 809E8C24 14A10004 */  bne     $a1, $at, .L809E8C38       
/* 03458 809E8C28 AFA70024 */  sw      $a3, 0x0024($sp)           
/* 0345C 809E8C2C 8FA50028 */  lw      $a1, 0x0028($sp)           
/* 03460 809E8C30 0C018A29 */  jal     Collider_UpdateSpheres              
/* 03464 809E8C34 24A50238 */  addiu   $a1, $a1, 0x0238           ## $a1 = 00000238
.L809E8C38:
/* 03468 809E8C38 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 0346C 809E8C3C 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 03470 809E8C40 03E00008 */  jr      $ra                        
/* 03474 809E8C44 00000000 */  nop
