glabel func_80AC31F4
/* 00554 80AC31F4 3C038016 */  lui     $v1, %hi(gSaveContext)
/* 00558 80AC31F8 2463E660 */  addiu   $v1, %lo(gSaveContext)
/* 0055C 80AC31FC 8C6E0004 */  lw      $t6, 0x0004($v1)           ## 8015E664
/* 00560 80AC3200 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 00564 80AC3204 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 00568 80AC3208 11C00003 */  beq     $t6, $zero, .L80AC3218     
/* 0056C 80AC320C 24010005 */  addiu   $at, $zero, 0x0005         ## $at = 00000005
/* 00570 80AC3210 10000002 */  beq     $zero, $zero, .L80AC321C   
/* 00574 80AC3214 24020005 */  addiu   $v0, $zero, 0x0005         ## $v0 = 00000005
.L80AC3218:
/* 00578 80AC3218 24020011 */  addiu   $v0, $zero, 0x0011         ## $v0 = 00000011
.L80AC321C:
/* 0057C 80AC321C 1441001A */  bne     $v0, $at, .L80AC3288       
/* 00580 80AC3220 3C0C8012 */  lui     $t4, %hi(gBitFlags+4)
/* 00584 80AC3224 946F0ED8 */  lhu     $t7, 0x0ED8($v1)           ## 8015F538
/* 00588 80AC3228 3C088012 */  lui     $t0, %hi(gUpgradeMasks+8)
/* 0058C 80AC322C 3C0A8012 */  lui     $t2, %hi(gUpgradeShifts+2)
/* 00590 80AC3230 31F80020 */  andi    $t8, $t7, 0x0020           ## $t8 = 00000000
/* 00594 80AC3234 53000006 */  beql    $t8, $zero, .L80AC3250     
/* 00598 80AC3238 8C7900A0 */  lw      $t9, 0x00A0($v1)           ## 8015E700
/* 0059C 80AC323C 0C042DC8 */  jal     func_8010B720              
/* 005A0 80AC3240 24053028 */  addiu   $a1, $zero, 0x3028         ## $a1 = 00003028
/* 005A4 80AC3244 1000001C */  beq     $zero, $zero, .L80AC32B8   
/* 005A8 80AC3248 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 005AC 80AC324C 8C7900A0 */  lw      $t9, 0x00A0($v1)           ## 000000A0
.L80AC3250:
/* 005B0 80AC3250 8D0871B8 */  lw      $t0, %lo(gUpgradeMasks+8)($t0)
/* 005B4 80AC3254 914A71F6 */  lbu     $t2, %lo(gUpgradeShifts+2)($t2)
/* 005B8 80AC3258 03284824 */  and     $t1, $t9, $t0              
/* 005BC 80AC325C 01495807 */  srav    $t3, $t1, $t2              
/* 005C0 80AC3260 11600005 */  beq     $t3, $zero, .L80AC3278     
/* 005C4 80AC3264 00000000 */  nop
/* 005C8 80AC3268 0C042DC8 */  jal     func_8010B720              
/* 005CC 80AC326C 2405302D */  addiu   $a1, $zero, 0x302D         ## $a1 = 0000302D
/* 005D0 80AC3270 10000011 */  beq     $zero, $zero, .L80AC32B8   
/* 005D4 80AC3274 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L80AC3278:
/* 005D8 80AC3278 0C042DC8 */  jal     func_8010B720              
/* 005DC 80AC327C 2405300F */  addiu   $a1, $zero, 0x300F         ## $a1 = 0000300F
/* 005E0 80AC3280 1000000D */  beq     $zero, $zero, .L80AC32B8   
/* 005E4 80AC3284 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L80AC3288:
/* 005E8 80AC3288 8D8C7124 */  lw      $t4, %lo(gBitFlags+4)($t4)
/* 005EC 80AC328C 8C6D00A4 */  lw      $t5, 0x00A4($v1)           ## 000000A4
/* 005F0 80AC3290 018D7024 */  and     $t6, $t4, $t5              
/* 005F4 80AC3294 15C00005 */  bne     $t6, $zero, .L80AC32AC     
/* 005F8 80AC3298 00000000 */  nop
/* 005FC 80AC329C 0C042DC8 */  jal     func_8010B720              
/* 00600 80AC32A0 24053057 */  addiu   $a1, $zero, 0x3057         ## $a1 = 00003057
/* 00604 80AC32A4 10000004 */  beq     $zero, $zero, .L80AC32B8   
/* 00608 80AC32A8 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L80AC32AC:
/* 0060C 80AC32AC 0C042DC8 */  jal     func_8010B720              
/* 00610 80AC32B0 2405305B */  addiu   $a1, $zero, 0x305B         ## $a1 = 0000305B
/* 00614 80AC32B4 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L80AC32B8:
/* 00618 80AC32B8 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 0061C 80AC32BC 03E00008 */  jr      $ra                        
/* 00620 80AC32C0 00000000 */  nop
