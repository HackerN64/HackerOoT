glabel func_809F70E8
/* 00D28 809F70E8 27BDFFD0 */  addiu   $sp, $sp, 0xFFD0           ## $sp = FFFFFFD0
/* 00D2C 809F70EC AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 00D30 809F70F0 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 00D34 809F70F4 8C820190 */  lw      $v0, 0x0190($a0)           ## 00000190
/* 00D38 809F70F8 3C0E809F */  lui     $t6, %hi(func_809F773C)    ## $t6 = 809F0000
/* 00D3C 809F70FC 25CE773C */  addiu   $t6, $t6, %lo(func_809F773C) ## $t6 = 809F773C
/* 00D40 809F7100 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00D44 809F7104 11C20014 */  beq     $t6, $v0, .L809F7158       
/* 00D48 809F7108 00A03025 */  or      $a2, $a1, $zero            ## $a2 = 00000000
/* 00D4C 809F710C 3C0F809F */  lui     $t7, %hi(func_809F77AC)    ## $t7 = 809F0000
/* 00D50 809F7110 25EF77AC */  addiu   $t7, $t7, %lo(func_809F77AC) ## $t7 = 809F77AC
/* 00D54 809F7114 11E20010 */  beq     $t7, $v0, .L809F7158       
/* 00D58 809F7118 3C18809F */  lui     $t8, %hi(func_809F784C)    ## $t8 = 809F0000
/* 00D5C 809F711C 2718784C */  addiu   $t8, $t8, %lo(func_809F784C) ## $t8 = 809F784C
/* 00D60 809F7120 1302000D */  beq     $t8, $v0, .L809F7158       
/* 00D64 809F7124 3C19809F */  lui     $t9, %hi(func_809F7A00)    ## $t9 = 809F0000
/* 00D68 809F7128 27397A00 */  addiu   $t9, $t9, %lo(func_809F7A00) ## $t9 = 809F7A00
/* 00D6C 809F712C 1322000A */  beq     $t9, $v0, .L809F7158       
/* 00D70 809F7130 3C08809F */  lui     $t0, %hi(func_809F7AB8)    ## $t0 = 809F0000
/* 00D74 809F7134 25087AB8 */  addiu   $t0, $t0, %lo(func_809F7AB8) ## $t0 = 809F7AB8
/* 00D78 809F7138 11020007 */  beq     $t0, $v0, .L809F7158       
/* 00D7C 809F713C 3C09809F */  lui     $t1, %hi(func_809F7B3C)    ## $t1 = 809F0000
/* 00D80 809F7140 25297B3C */  addiu   $t1, $t1, %lo(func_809F7B3C) ## $t1 = 809F7B3C
/* 00D84 809F7144 11220004 */  beq     $t1, $v0, .L809F7158       
/* 00D88 809F7148 3C0A809F */  lui     $t2, %hi(func_809F7BE4)    ## $t2 = 809F0000
/* 00D8C 809F714C 254A7BE4 */  addiu   $t2, $t2, %lo(func_809F7BE4) ## $t2 = 809F7BE4
/* 00D90 809F7150 55420004 */  bnel    $t2, $v0, .L809F7164       
/* 00D94 809F7154 90CB1C26 */  lbu     $t3, 0x1C26($a2)           ## 00001C26
.L809F7158:
/* 00D98 809F7158 1000004D */  beq     $zero, $zero, .L809F7290   
/* 00D9C 809F715C 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
/* 00DA0 809F7160 90CB1C26 */  lbu     $t3, 0x1C26($a2)           ## 00001C26
.L809F7164:
/* 00DA4 809F7164 3C0C809F */  lui     $t4, %hi(func_809F73AC)    ## $t4 = 809F0000
/* 00DA8 809F7168 258C73AC */  addiu   $t4, $t4, %lo(func_809F73AC) ## $t4 = 809F73AC
/* 00DAC 809F716C 5160000D */  beql    $t3, $zero, .L809F71A4     
/* 00DB0 809F7170 920301A5 */  lbu     $v1, 0x01A5($s0)           ## 000001A5
/* 00DB4 809F7174 11820008 */  beq     $t4, $v0, .L809F7198       
/* 00DB8 809F7178 3C0D809F */  lui     $t5, %hi(func_809F74C4)    ## $t5 = 809F0000
/* 00DBC 809F717C 25AD74C4 */  addiu   $t5, $t5, %lo(func_809F74C4) ## $t5 = 809F74C4
/* 00DC0 809F7180 15A20003 */  bne     $t5, $v0, .L809F7190       
/* 00DC4 809F7184 3C0E8003 */  lui     $t6, %hi(ActorShadow_DrawCircle)
/* 00DC8 809F7188 25CEB5EC */  addiu   $t6, %lo(ActorShadow_DrawCircle)
/* 00DCC 809F718C AE0E00C0 */  sw      $t6, 0x00C0($s0)           ## 000000C0
.L809F7190:
/* 00DD0 809F7190 0C27DC27 */  jal     func_809F709C              
/* 00DD4 809F7194 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
.L809F7198:
/* 00DD8 809F7198 1000003D */  beq     $zero, $zero, .L809F7290   
/* 00DDC 809F719C 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
/* 00DE0 809F71A0 920301A5 */  lbu     $v1, 0x01A5($s0)           ## 000001A5
.L809F71A4:
/* 00DE4 809F71A4 3C19809F */  lui     $t9, %hi(func_809F73AC)    ## $t9 = 809F0000
/* 00DE8 809F71A8 273973AC */  addiu   $t9, $t9, %lo(func_809F73AC) ## $t9 = 809F73AC
/* 00DEC 809F71AC 306F0002 */  andi    $t7, $v1, 0x0002           ## $t7 = 00000000
/* 00DF0 809F71B0 15E00003 */  bne     $t7, $zero, .L809F71C0     
/* 00DF4 809F71B4 3078FFFD */  andi    $t8, $v1, 0xFFFD           ## $t8 = 00000000
/* 00DF8 809F71B8 10000035 */  beq     $zero, $zero, .L809F7290   
/* 00DFC 809F71BC 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L809F71C0:
/* 00E00 809F71C0 13220004 */  beq     $t9, $v0, .L809F71D4       
/* 00E04 809F71C4 A21801A5 */  sb      $t8, 0x01A5($s0)           ## 000001A5
/* 00E08 809F71C8 3C08809F */  lui     $t0, %hi(func_809F74C4)    ## $t0 = 809F0000
/* 00E0C 809F71CC 250874C4 */  addiu   $t0, $t0, %lo(func_809F74C4) ## $t0 = 809F74C4
/* 00E10 809F71D0 15020003 */  bne     $t0, $v0, .L809F71E0       
.L809F71D4:
/* 00E14 809F71D4 3C098003 */  lui     $t1, %hi(ActorShadow_DrawCircle)
/* 00E18 809F71D8 2529B5EC */  addiu   $t1, %lo(ActorShadow_DrawCircle)
/* 00E1C 809F71DC AE0900C0 */  sw      $t1, 0x00C0($s0)           ## 000000C0
.L809F71E0:
/* 00E20 809F71E0 920200B1 */  lbu     $v0, 0x00B1($s0)           ## 000000B1
/* 00E24 809F71E4 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 00E28 809F71E8 1440000E */  bne     $v0, $zero, .L809F7224     
/* 00E2C 809F71EC 00000000 */  nop
/* 00E30 809F71F0 920A00B0 */  lbu     $t2, 0x00B0($s0)           ## 000000B0
/* 00E34 809F71F4 00C02025 */  or      $a0, $a2, $zero            ## $a0 = 00000000
/* 00E38 809F71F8 1140000A */  beq     $t2, $zero, .L809F7224     
/* 00E3C 809F71FC 00000000 */  nop
/* 00E40 809F7200 0C00CB1F */  jal     func_80032C7C              
/* 00E44 809F7204 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 00E48 809F7208 3C0C809F */  lui     $t4, %hi(func_809F7C48)    ## $t4 = 809F0000
/* 00E4C 809F720C 240B0002 */  addiu   $t3, $zero, 0x0002         ## $t3 = 00000002
/* 00E50 809F7210 258C7C48 */  addiu   $t4, $t4, %lo(func_809F7C48) ## $t4 = 809F7C48
/* 00E54 809F7214 A60B0200 */  sh      $t3, 0x0200($s0)           ## 00000200
/* 00E58 809F7218 AE0C0190 */  sw      $t4, 0x0190($s0)           ## 00000190
/* 00E5C 809F721C 1000001C */  beq     $zero, $zero, .L809F7290   
/* 00E60 809F7220 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
.L809F7224:
/* 00E64 809F7224 5441001A */  bnel    $v0, $at, .L809F7290       
/* 00E68 809F7228 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
/* 00E6C 809F722C 8E020190 */  lw      $v0, 0x0190($s0)           ## 00000190
/* 00E70 809F7230 3C0D809F */  lui     $t5, %hi(func_809F78EC)    ## $t5 = 809F0000
/* 00E74 809F7234 25AD78EC */  addiu   $t5, $t5, %lo(func_809F78EC) ## $t5 = 809F78EC
/* 00E78 809F7238 11A20014 */  beq     $t5, $v0, .L809F728C       
/* 00E7C 809F723C 3C03809F */  lui     $v1, %hi(func_809F786C)    ## $v1 = 809F0000
/* 00E80 809F7240 2463786C */  addiu   $v1, $v1, %lo(func_809F786C) ## $v1 = 809F786C
/* 00E84 809F7244 10620011 */  beq     $v1, $v0, .L809F728C       
/* 00E88 809F7248 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00E8C 809F724C 2405389E */  addiu   $a1, $zero, 0x389E         ## $a1 = 0000389E
/* 00E90 809F7250 0C00BE0A */  jal     Audio_PlayActorSound2
              
/* 00E94 809F7254 AFA30028 */  sw      $v1, 0x0028($sp)           
/* 00E98 809F7258 240E0078 */  addiu   $t6, $zero, 0x0078         ## $t6 = 00000078
/* 00E9C 809F725C A60E01FE */  sh      $t6, 0x01FE($s0)           ## 000001FE
/* 00EA0 809F7260 240F0078 */  addiu   $t7, $zero, 0x0078         ## $t7 = 00000078
/* 00EA4 809F7264 AFAF0010 */  sw      $t7, 0x0010($sp)           
/* 00EA8 809F7268 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00EAC 809F726C 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 00EB0 809F7270 240600C8 */  addiu   $a2, $zero, 0x00C8         ## $a2 = 000000C8
/* 00EB4 809F7274 0C00D09B */  jal     func_8003426C              
/* 00EB8 809F7278 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 00EBC 809F727C 0C27DA88 */  jal     func_809F6A20              
/* 00EC0 809F7280 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00EC4 809F7284 8FB80028 */  lw      $t8, 0x0028($sp)           
/* 00EC8 809F7288 AE180190 */  sw      $t8, 0x0190($s0)           ## 00000190
.L809F728C:
/* 00ECC 809F728C 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L809F7290:
/* 00ED0 809F7290 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 00ED4 809F7294 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 00ED8 809F7298 27BD0030 */  addiu   $sp, $sp, 0x0030           ## $sp = 00000000
/* 00EDC 809F729C 03E00008 */  jr      $ra                        
/* 00EE0 809F72A0 00000000 */  nop
