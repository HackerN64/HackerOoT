glabel func_809789A4
/* 00074 809789A4 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 00078 809789A8 AFA40018 */  sw      $a0, 0x0018($sp)           
/* 0007C 809789AC AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 00080 809789B0 00A02025 */  or      $a0, $a1, $zero            ## $a0 = 00000000
/* 00084 809789B4 0C00CD90 */  jal     Actor_GetCollidedExplosive              
/* 00088 809789B8 00C02825 */  or      $a1, $a2, $zero            ## $a1 = 00000000
/* 0008C 809789BC 10400003 */  beq     $v0, $zero, .L809789CC     
/* 00090 809789C0 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 00094 809789C4 10000002 */  beq     $zero, $zero, .L809789D0   
/* 00098 809789C8 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
.L809789CC:
/* 0009C 809789CC 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L809789D0:
/* 000A0 809789D0 03E00008 */  jr      $ra                        
/* 000A4 809789D4 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
