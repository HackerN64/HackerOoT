glabel func_80A44D84
/* 02054 80A44D84 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 02058 80A44D88 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 0205C 80A44D8C 80860210 */  lb      $a2, 0x0210($a0)           ## 00000210
/* 02060 80A44D90 8C850208 */  lw      $a1, 0x0208($a0)           ## 00000208
/* 02064 80A44D94 AFA40020 */  sw      $a0, 0x0020($sp)           
/* 02068 80A44D98 0C023948 */  jal     Path_OrientAndGetDistSq              
/* 0206C 80A44D9C 27A7001E */  addiu   $a3, $sp, 0x001E           ## $a3 = FFFFFFFE
/* 02070 80A44DA0 8FA40020 */  lw      $a0, 0x0020($sp)           
/* 02074 80A44DA4 87AE001E */  lh      $t6, 0x001E($sp)           
/* 02078 80A44DA8 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
/* 0207C 80A44DAC A48E0032 */  sh      $t6, 0x0032($a0)           ## 00000032
/* 02080 80A44DB0 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 02084 80A44DB4 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
/* 02088 80A44DB8 03E00008 */  jr      $ra                        
/* 0208C 80A44DBC 00000000 */  nop
