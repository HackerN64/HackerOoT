glabel func_80838F5C
/* 06D4C 80838F5C 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 06D50 80838F60 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 06D54 80838F64 3C068085 */  lui     $a2, %hi(func_8084F88C)    ## $a2 = 80850000
/* 06D58 80838F68 AFA40018 */  sw      $a0, 0x0018($sp)           
/* 06D5C 80838F6C AFA5001C */  sw      $a1, 0x001C($sp)           
/* 06D60 80838F70 24C6F88C */  addiu   $a2, $a2, %lo(func_8084F88C) ## $a2 = 8084F88C
/* 06D64 80838F74 0C20D716 */  jal     func_80835C58              
/* 06D68 80838F78 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 06D6C 80838F7C 8FA3001C */  lw      $v1, 0x001C($sp)           
/* 06D70 80838F80 3C01A000 */  lui     $at, 0xA000                ## $at = A0000000
/* 06D74 80838F84 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 06D78 80838F88 8C6E067C */  lw      $t6, 0x067C($v1)           ## 0000067C
/* 06D7C 80838F8C 01C17825 */  or      $t7, $t6, $at              ## $t7 = A0000000
/* 06D80 80838F90 AC6F067C */  sw      $t7, 0x067C($v1)           ## 0000067C
/* 06D84 80838F94 0C030129 */  jal     Gameplay_GetCamera              
/* 06D88 80838F98 8FA40018 */  lw      $a0, 0x0018($sp)           
/* 06D8C 80838F9C 00402025 */  or      $a0, $v0, $zero            ## $a0 = 00000000
/* 06D90 80838FA0 0C0169DF */  jal     func_8005A77C              
/* 06D94 80838FA4 24050021 */  addiu   $a1, $zero, 0x0021         ## $a1 = 00000021
/* 06D98 80838FA8 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 06D9C 80838FAC 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 06DA0 80838FB0 03E00008 */  jr      $ra                        
/* 06DA4 80838FB4 00000000 */  nop
