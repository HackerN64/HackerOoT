.late_rodata
glabel jtbl_80A728C4
.word L80A700D0
.word L80A700D0
.word L80A701B0
.word L80A700D8
.word L80A700D0
.word L80A7056C
.word L80A700D0
.word L80A700D0
.word L80A700D0
.word L80A700D0
glabel jtbl_80A728EC
.word L80A70380
.word L80A70564
.word L80A70564
.word L80A70564
.word L80A70564
.word L80A702CC
.word L80A702CC
.word L80A702CC
.word L80A702CC
glabel jtbl_80A72910
.word L80A70318
.word L80A70564
.word L80A70440
.word L80A70564
.word L80A70564
.word L80A7034C
.word L80A70564
.word L80A703F0
.word L80A70564
.word L80A70424
.word L80A70564
.word L80A703B8
.word L80A70564
.word L80A7039C
.word L80A70564
.word L80A70564
.word L80A70564
.word L80A703D4
glabel jtbl_80A72958
.word L80A70474
.word L80A70564
.word L80A70490
.word L80A70564
.word L80A704AC
.word L80A70564
.word L80A704C8
.word L80A70564
.word L80A70564
.word L80A704E4

.text
glabel func_80A70058
/* 00AA8 80A70058 27BDFFB8 */  addiu   $sp, $sp, 0xFFB8           ## $sp = FFFFFFB8
/* 00AAC 80A7005C 3C0F80A7 */  lui     $t7, %hi(D_80A727F0)       ## $t7 = 80A70000
/* 00AB0 80A70060 AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 00AB4 80A70064 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 00AB8 80A70068 AFA40048 */  sw      $a0, 0x0048($sp)           
/* 00ABC 80A7006C AFA5004C */  sw      $a1, 0x004C($sp)           
/* 00AC0 80A70070 25EF27F0 */  addiu   $t7, $t7, %lo(D_80A727F0)  ## $t7 = 80A727F0
/* 00AC4 80A70074 8DF90000 */  lw      $t9, 0x0000($t7)           ## 80A727F0
/* 00AC8 80A70078 8DF80004 */  lw      $t8, 0x0004($t7)           ## 80A727F4
/* 00ACC 80A7007C 27AE003C */  addiu   $t6, $sp, 0x003C           ## $t6 = FFFFFFF4
/* 00AD0 80A70080 3C0980A7 */  lui     $t1, %hi(D_80A727F8)       ## $t1 = 80A70000
/* 00AD4 80A70084 252927F8 */  addiu   $t1, $t1, %lo(D_80A727F8)  ## $t1 = 80A727F8
/* 00AD8 80A70088 ADD90000 */  sw      $t9, 0x0000($t6)           ## FFFFFFF4
/* 00ADC 80A7008C ADD80004 */  sw      $t8, 0x0004($t6)           ## FFFFFFF8
/* 00AE0 80A70090 8D2A0004 */  lw      $t2, 0x0004($t1)           ## 80A727FC
/* 00AE4 80A70094 8D2B0000 */  lw      $t3, 0x0000($t1)           ## 80A727F8
/* 00AE8 80A70098 27A80034 */  addiu   $t0, $sp, 0x0034           ## $t0 = FFFFFFEC
/* 00AEC 80A7009C AD0A0004 */  sw      $t2, 0x0004($t0)           ## FFFFFFF0
/* 00AF0 80A700A0 AD0B0000 */  sw      $t3, 0x0000($t0)           ## FFFFFFEC
/* 00AF4 80A700A4 8FA40048 */  lw      $a0, 0x0048($sp)           
/* 00AF8 80A700A8 0C042F6F */  jal     func_8010BDBC              
/* 00AFC 80A700AC 248420D8 */  addiu   $a0, $a0, 0x20D8           ## $a0 = 000020D8
/* 00B00 80A700B0 2C41000A */  sltiu   $at, $v0, 0x000A           
/* 00B04 80A700B4 10200135 */  beq     $at, $zero, .L80A7058C     
/* 00B08 80A700B8 00026080 */  sll     $t4, $v0,  2               
/* 00B0C 80A700BC 3C0180A7 */  lui     $at, %hi(jtbl_80A728C4)       ## $at = 80A70000
/* 00B10 80A700C0 002C0821 */  addu    $at, $at, $t4              
/* 00B14 80A700C4 8C2C28C4 */  lw      $t4, %lo(jtbl_80A728C4)($at)  
/* 00B18 80A700C8 01800008 */  jr      $t4                        
/* 00B1C 80A700CC 00000000 */  nop
glabel L80A700D0
/* 00B20 80A700D0 1000012F */  beq     $zero, $zero, .L80A70590   
/* 00B24 80A700D4 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
glabel L80A700D8
/* 00B28 80A700D8 8FA3004C */  lw      $v1, 0x004C($sp)           
/* 00B2C 80A700DC 2401709E */  addiu   $at, $zero, 0x709E         ## $at = 0000709E
/* 00B30 80A700E0 9462010E */  lhu     $v0, 0x010E($v1)           ## 0000010E
/* 00B34 80A700E4 1041000E */  beq     $v0, $at, .L80A70120       
/* 00B38 80A700E8 00408025 */  or      $s0, $v0, $zero            ## $s0 = 00000001
/* 00B3C 80A700EC 2401709F */  addiu   $at, $zero, 0x709F         ## $at = 0000709F
/* 00B40 80A700F0 1201000B */  beq     $s0, $at, .L80A70120       
/* 00B44 80A700F4 240170F0 */  addiu   $at, $zero, 0x70F0         ## $at = 000070F0
/* 00B48 80A700F8 12010020 */  beq     $s0, $at, .L80A7017C       
/* 00B4C 80A700FC 240170F1 */  addiu   $at, $zero, 0x70F1         ## $at = 000070F1
/* 00B50 80A70100 1201001E */  beq     $s0, $at, .L80A7017C       
/* 00B54 80A70104 240170F2 */  addiu   $at, $zero, 0x70F2         ## $at = 000070F2
/* 00B58 80A70108 1201001C */  beq     $s0, $at, .L80A7017C       
/* 00B5C 80A7010C 240170F3 */  addiu   $at, $zero, 0x70F3         ## $at = 000070F3
/* 00B60 80A70110 5201001B */  beql    $s0, $at, .L80A70180       
/* 00B64 80A70114 8C680154 */  lw      $t0, 0x0154($v1)           ## 00000154
/* 00B68 80A70118 1000011D */  beq     $zero, $zero, .L80A70590   
/* 00B6C 80A7011C 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
.L80A70120:
/* 00B70 80A70120 806D0215 */  lb      $t5, 0x0215($v1)           ## 00000215
/* 00B74 80A70124 3C078013 */  lui     $a3, %hi(D_801333E0)
/* 00B78 80A70128 24E733E0 */  addiu   $a3, %lo(D_801333E0)
/* 00B7C 80A7012C 15A0001E */  bne     $t5, $zero, .L80A701A8     
/* 00B80 80A70130 2401709F */  addiu   $at, $zero, 0x709F         ## $at = 0000709F
/* 00B84 80A70134 14410003 */  bne     $v0, $at, .L80A70144       
/* 00B88 80A70138 3C058013 */  lui     $a1, %hi(D_801333D4)
/* 00B8C 80A7013C 10000002 */  beq     $zero, $zero, .L80A70148   
/* 00B90 80A70140 24104802 */  addiu   $s0, $zero, 0x4802         ## $s0 = 00004802
.L80A70144:
/* 00B94 80A70144 24104806 */  addiu   $s0, $zero, 0x4806         ## $s0 = 00004806
.L80A70148:
/* 00B98 80A70148 3C0E8013 */  lui     $t6, %hi(D_801333E8)
/* 00B9C 80A7014C 25CE33E8 */  addiu   $t6, %lo(D_801333E8)
/* 00BA0 80A70150 AFAE0014 */  sw      $t6, 0x0014($sp)           
/* 00BA4 80A70154 3204FFFF */  andi    $a0, $s0, 0xFFFF           ## $a0 = 00004806
/* 00BA8 80A70158 24A533D4 */  addiu   $a1, %lo(D_801333D4)
/* 00BAC 80A7015C 24060004 */  addiu   $a2, $zero, 0x0004         ## $a2 = 00000004
/* 00BB0 80A70160 0C03DCE3 */  jal     Audio_PlaySoundGeneral
              
/* 00BB4 80A70164 AFA70010 */  sw      $a3, 0x0010($sp)           
/* 00BB8 80A70168 8FB8004C */  lw      $t8, 0x004C($sp)           
/* 00BBC 80A7016C 240F0001 */  addiu   $t7, $zero, 0x0001         ## $t7 = 00000001
/* 00BC0 80A70170 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
/* 00BC4 80A70174 10000106 */  beq     $zero, $zero, .L80A70590   
/* 00BC8 80A70178 A30F0215 */  sb      $t7, 0x0215($t8)           ## 00000215
.L80A7017C:
/* 00BCC 80A7017C 8C680154 */  lw      $t0, 0x0154($v1)           ## 00000154
.L80A70180:
/* 00BD0 80A70180 3C190600 */  lui     $t9, %hi(D_060033B4)                ## $t9 = 06000000
/* 00BD4 80A70184 273933B4 */  addiu   $t9, $t9, %lo(D_060033B4)           ## $t9 = 060033B4
/* 00BD8 80A70188 13280007 */  beq     $t9, $t0, .L80A701A8       
/* 00BDC 80A7018C 2464014C */  addiu   $a0, $v1, 0x014C           ## $a0 = 0000014C
/* 00BE0 80A70190 3C0580A7 */  lui     $a1, %hi(D_80A72050)       ## $a1 = 80A70000
/* 00BE4 80A70194 24A52050 */  addiu   $a1, $a1, %lo(D_80A72050)  ## $a1 = 80A72050
/* 00BE8 80A70198 0C00D3B0 */  jal     func_80034EC0              
/* 00BEC 80A7019C 24060017 */  addiu   $a2, $zero, 0x0017         ## $a2 = 00000017
/* 00BF0 80A701A0 0C03D719 */  jal     func_800F5C64              
/* 00BF4 80A701A4 24040922 */  addiu   $a0, $zero, 0x0922         ## $a0 = 00000922
.L80A701A8:
/* 00BF8 80A701A8 100000F9 */  beq     $zero, $zero, .L80A70590   
/* 00BFC 80A701AC 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
glabel L80A701B0
/* 00C00 80A701B0 8FA7004C */  lw      $a3, 0x004C($sp)           
/* 00C04 80A701B4 94E2010E */  lhu     $v0, 0x010E($a3)           ## 0000010E
/* 00C08 80A701B8 28417048 */  slti    $at, $v0, 0x7048           
/* 00C0C 80A701BC 1420001E */  bne     $at, $zero, .L80A70238     
/* 00C10 80A701C0 00408025 */  or      $s0, $v0, $zero            ## $s0 = 00000001
/* 00C14 80A701C4 2A0170A0 */  slti    $at, $s0, 0x70A0           
/* 00C18 80A701C8 14200010 */  bne     $at, $zero, .L80A7020C     
/* 00C1C 80A701CC 26098F15 */  addiu   $t1, $s0, 0x8F15           ## $t1 = FFFF8F16
/* 00C20 80A701D0 2A0170A5 */  slti    $at, $s0, 0x70A5           
/* 00C24 80A701D4 14200008 */  bne     $at, $zero, .L80A701F8     
/* 00C28 80A701D8 2D210009 */  sltiu   $at, $t1, 0x0009           
/* 00C2C 80A701DC 102000E1 */  beq     $at, $zero, .L80A70564     
/* 00C30 80A701E0 00094880 */  sll     $t1, $t1,  2               
/* 00C34 80A701E4 3C0180A7 */  lui     $at, %hi(jtbl_80A728EC)       ## $at = 80A70000
/* 00C38 80A701E8 00290821 */  addu    $at, $at, $t1              
/* 00C3C 80A701EC 8C2928EC */  lw      $t1, %lo(jtbl_80A728EC)($at)  
/* 00C40 80A701F0 01200008 */  jr      $t1                        
/* 00C44 80A701F4 00000000 */  nop
.L80A701F8:
/* 00C48 80A701F8 240170A4 */  addiu   $at, $zero, 0x70A4         ## $at = 000070A4
/* 00C4C 80A701FC 12010097 */  beq     $s0, $at, .L80A7045C       
/* 00C50 80A70200 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00C54 80A70204 100000E2 */  beq     $zero, $zero, .L80A70590   
/* 00C58 80A70208 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L80A7020C:
/* 00C5C 80A7020C 24017048 */  addiu   $at, $zero, 0x7048         ## $at = 00007048
/* 00C60 80A70210 1201007E */  beq     $s0, $at, .L80A7040C       
/* 00C64 80A70214 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00C68 80A70218 2401709E */  addiu   $at, $zero, 0x709E         ## $at = 0000709E
/* 00C6C 80A7021C 120100BE */  beq     $s0, $at, .L80A70518       
/* 00C70 80A70220 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00C74 80A70224 2401709F */  addiu   $at, $zero, 0x709F         ## $at = 0000709F
/* 00C78 80A70228 120100BF */  beq     $s0, $at, .L80A70528       
/* 00C7C 80A7022C 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00C80 80A70230 100000D7 */  beq     $zero, $zero, .L80A70590   
/* 00C84 80A70234 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L80A70238:
/* 00C88 80A70238 2A017028 */  slti    $at, $s0, 0x7028           
/* 00C8C 80A7023C 14200009 */  bne     $at, $zero, .L80A70264     
/* 00C90 80A70240 260A8FEA */  addiu   $t2, $s0, 0x8FEA           ## $t2 = FFFF8FEB
/* 00C94 80A70244 24017045 */  addiu   $at, $zero, 0x7045         ## $at = 00007045
/* 00C98 80A70248 1201003A */  beq     $s0, $at, .L80A70334       
/* 00C9C 80A7024C 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00CA0 80A70250 24017047 */  addiu   $at, $zero, 0x7047         ## $at = 00007047
/* 00CA4 80A70254 12010044 */  beq     $s0, $at, .L80A70368       
/* 00CA8 80A70258 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00CAC 80A7025C 100000CC */  beq     $zero, $zero, .L80A70590   
/* 00CB0 80A70260 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L80A70264:
/* 00CB4 80A70264 2A01508C */  slti    $at, $s0, 0x508C           
/* 00CB8 80A70268 14200009 */  bne     $at, $zero, .L80A70290     
/* 00CBC 80A7026C 260BAFA9 */  addiu   $t3, $s0, 0xAFA9           ## $t3 = FFFFAFAA
/* 00CC0 80A70270 2D410012 */  sltiu   $at, $t2, 0x0012           
/* 00CC4 80A70274 102000BB */  beq     $at, $zero, .L80A70564     
/* 00CC8 80A70278 000A5080 */  sll     $t2, $t2,  2               
/* 00CCC 80A7027C 3C0180A7 */  lui     $at, %hi(jtbl_80A72910)       ## $at = 80A70000
/* 00CD0 80A70280 002A0821 */  addu    $at, $at, $t2              
/* 00CD4 80A70284 8C2A2910 */  lw      $t2, %lo(jtbl_80A72910)($at)  
/* 00CD8 80A70288 01400008 */  jr      $t2                        
/* 00CDC 80A7028C 00000000 */  nop
.L80A70290:
/* 00CE0 80A70290 2A015061 */  slti    $at, $s0, 0x5061           
/* 00CE4 80A70294 14200005 */  bne     $at, $zero, .L80A702AC     
/* 00CE8 80A70298 2401508B */  addiu   $at, $zero, 0x508B         ## $at = 0000508B
/* 00CEC 80A7029C 12010098 */  beq     $s0, $at, .L80A70500       
/* 00CF0 80A702A0 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00CF4 80A702A4 100000BA */  beq     $zero, $zero, .L80A70590   
/* 00CF8 80A702A8 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L80A702AC:
/* 00CFC 80A702AC 2D61000A */  sltiu   $at, $t3, 0x000A           
/* 00D00 80A702B0 102000AC */  beq     $at, $zero, .L80A70564     
/* 00D04 80A702B4 000B5880 */  sll     $t3, $t3,  2               
/* 00D08 80A702B8 3C0180A7 */  lui     $at, %hi(jtbl_80A72958)       ## $at = 80A70000
/* 00D0C 80A702BC 002B0821 */  addu    $at, $at, $t3              
/* 00D10 80A702C0 8C2B2958 */  lw      $t3, %lo(jtbl_80A72958)($at)  
/* 00D14 80A702C4 01600008 */  jr      $t3                        
/* 00D18 80A702C8 00000000 */  nop
glabel L80A702CC
/* 00D1C 80A702CC 00026040 */  sll     $t4, $v0,  1               
/* 00D20 80A702D0 03AC2021 */  addu    $a0, $sp, $t4              
/* 00D24 80A702D4 3C01FFFF */  lui     $at, 0xFFFF                ## $at = FFFF0000
/* 00D28 80A702D8 00240821 */  addu    $at, $at, $a0              
/* 00D2C 80A702DC 0C021CC3 */  jal     Rupees_ChangeBy              
/* 00D30 80A702E0 84241E54 */  lh      $a0, 0x1E54($at)           ## FFFF1E54
/* 00D34 80A702E4 8FA4004C */  lw      $a0, 0x004C($sp)           
/* 00D38 80A702E8 3C0580A7 */  lui     $a1, %hi(D_80A72050)       ## $a1 = 80A70000
/* 00D3C 80A702EC 24A52050 */  addiu   $a1, $a1, %lo(D_80A72050)  ## $a1 = 80A72050
/* 00D40 80A702F0 24060011 */  addiu   $a2, $zero, 0x0011         ## $a2 = 00000011
/* 00D44 80A702F4 0C00D3B0 */  jal     func_80034EC0              
/* 00D48 80A702F8 2484014C */  addiu   $a0, $a0, 0x014C           ## $a0 = 0000014C
/* 00D4C 80A702FC 8FA40048 */  lw      $a0, 0x0048($sp)           
/* 00D50 80A70300 24060014 */  addiu   $a2, $zero, 0x0014         ## $a2 = 00000014
/* 00D54 80A70304 2407001E */  addiu   $a3, $zero, 0x001E         ## $a3 = 0000001E
/* 00D58 80A70308 0C023B67 */  jal     Player_UpdateBottleHeld              
/* 00D5C 80A7030C 8C851C44 */  lw      $a1, 0x1C44($a0)           ## 00001C44
/* 00D60 80A70310 1000009F */  beq     $zero, $zero, .L80A70590   
/* 00D64 80A70314 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
glabel L80A70318
/* 00D68 80A70318 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00D6C 80A7031C 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00D70 80A70320 944D0F10 */  lhu     $t5, 0x0F10($v0)           ## 8015F570
/* 00D74 80A70324 35AE0001 */  ori     $t6, $t5, 0x0001           ## $t6 = 00000001
/* 00D78 80A70328 A44E0F10 */  sh      $t6, 0x0F10($v0)           ## 8015F570
/* 00D7C 80A7032C 10000098 */  beq     $zero, $zero, .L80A70590   
/* 00D80 80A70330 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L80A70334:
/* 00D84 80A70334 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00D88 80A70338 944F0F10 */  lhu     $t7, 0x0F10($v0)           ## FFFFF570
/* 00D8C 80A7033C 35F80002 */  ori     $t8, $t7, 0x0002           ## $t8 = 00000002
/* 00D90 80A70340 A4580F10 */  sh      $t8, 0x0F10($v0)           ## FFFFF570
/* 00D94 80A70344 10000092 */  beq     $zero, $zero, .L80A70590   
/* 00D98 80A70348 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
glabel L80A7034C
/* 00D9C 80A7034C 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00DA0 80A70350 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00DA4 80A70354 94590F10 */  lhu     $t9, 0x0F10($v0)           ## 8015F570
/* 00DA8 80A70358 37280004 */  ori     $t0, $t9, 0x0004           ## $t0 = 00000004
/* 00DAC 80A7035C A4480F10 */  sh      $t0, 0x0F10($v0)           ## 8015F570
/* 00DB0 80A70360 1000008B */  beq     $zero, $zero, .L80A70590   
/* 00DB4 80A70364 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L80A70368:
/* 00DB8 80A70368 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00DBC 80A7036C 94490F10 */  lhu     $t1, 0x0F10($v0)           ## FFFFF570
/* 00DC0 80A70370 352A0008 */  ori     $t2, $t1, 0x0008           ## $t2 = 00000008
/* 00DC4 80A70374 A44A0F10 */  sh      $t2, 0x0F10($v0)           ## FFFFF570
/* 00DC8 80A70378 10000085 */  beq     $zero, $zero, .L80A70590   
/* 00DCC 80A7037C 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
glabel L80A70380
/* 00DD0 80A70380 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00DD4 80A70384 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00DD8 80A70388 944B0F10 */  lhu     $t3, 0x0F10($v0)           ## 8015F570
/* 00DDC 80A7038C 356C0010 */  ori     $t4, $t3, 0x0010           ## $t4 = 00000010
/* 00DE0 80A70390 A44C0F10 */  sh      $t4, 0x0F10($v0)           ## 8015F570
/* 00DE4 80A70394 1000007E */  beq     $zero, $zero, .L80A70590   
/* 00DE8 80A70398 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
glabel L80A7039C
/* 00DEC 80A7039C 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00DF0 80A703A0 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00DF4 80A703A4 944D0F10 */  lhu     $t5, 0x0F10($v0)           ## 8015F570
/* 00DF8 80A703A8 35AE0020 */  ori     $t6, $t5, 0x0020           ## $t6 = 00000020
/* 00DFC 80A703AC A44E0F10 */  sh      $t6, 0x0F10($v0)           ## 8015F570
/* 00E00 80A703B0 10000077 */  beq     $zero, $zero, .L80A70590   
/* 00E04 80A703B4 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
glabel L80A703B8
/* 00E08 80A703B8 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00E0C 80A703BC 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00E10 80A703C0 944F0F10 */  lhu     $t7, 0x0F10($v0)           ## 8015F570
/* 00E14 80A703C4 35F80040 */  ori     $t8, $t7, 0x0040           ## $t8 = 00000040
/* 00E18 80A703C8 A4580F10 */  sh      $t8, 0x0F10($v0)           ## 8015F570
/* 00E1C 80A703CC 10000070 */  beq     $zero, $zero, .L80A70590   
/* 00E20 80A703D0 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
glabel L80A703D4
/* 00E24 80A703D4 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00E28 80A703D8 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00E2C 80A703DC 94590F10 */  lhu     $t9, 0x0F10($v0)           ## 8015F570
/* 00E30 80A703E0 37280080 */  ori     $t0, $t9, 0x0080           ## $t0 = 00000080
/* 00E34 80A703E4 A4480F10 */  sh      $t0, 0x0F10($v0)           ## 8015F570
/* 00E38 80A703E8 10000069 */  beq     $zero, $zero, .L80A70590   
/* 00E3C 80A703EC 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
glabel L80A703F0
/* 00E40 80A703F0 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00E44 80A703F4 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00E48 80A703F8 94490F10 */  lhu     $t1, 0x0F10($v0)           ## 8015F570
/* 00E4C 80A703FC 352A0100 */  ori     $t2, $t1, 0x0100           ## $t2 = 00000100
/* 00E50 80A70400 A44A0F10 */  sh      $t2, 0x0F10($v0)           ## 8015F570
/* 00E54 80A70404 10000062 */  beq     $zero, $zero, .L80A70590   
/* 00E58 80A70408 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L80A7040C:
/* 00E5C 80A7040C 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00E60 80A70410 944B0F10 */  lhu     $t3, 0x0F10($v0)           ## FFFFF570
/* 00E64 80A70414 356C0200 */  ori     $t4, $t3, 0x0200           ## $t4 = 00000200
/* 00E68 80A70418 A44C0F10 */  sh      $t4, 0x0F10($v0)           ## FFFFF570
/* 00E6C 80A7041C 1000005C */  beq     $zero, $zero, .L80A70590   
/* 00E70 80A70420 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
glabel L80A70424
/* 00E74 80A70424 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00E78 80A70428 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00E7C 80A7042C 944D0F10 */  lhu     $t5, 0x0F10($v0)           ## 8015F570
/* 00E80 80A70430 35AE0400 */  ori     $t6, $t5, 0x0400           ## $t6 = 00000400
/* 00E84 80A70434 A44E0F10 */  sh      $t6, 0x0F10($v0)           ## 8015F570
/* 00E88 80A70438 10000055 */  beq     $zero, $zero, .L80A70590   
/* 00E8C 80A7043C 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
glabel L80A70440
/* 00E90 80A70440 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00E94 80A70444 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00E98 80A70448 944F0F10 */  lhu     $t7, 0x0F10($v0)           ## 8015F570
/* 00E9C 80A7044C 35F82000 */  ori     $t8, $t7, 0x2000           ## $t8 = 00002000
/* 00EA0 80A70450 A4580F10 */  sh      $t8, 0x0F10($v0)           ## 8015F570
/* 00EA4 80A70454 1000004E */  beq     $zero, $zero, .L80A70590   
/* 00EA8 80A70458 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L80A7045C:
/* 00EAC 80A7045C 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00EB0 80A70460 94590F10 */  lhu     $t9, 0x0F10($v0)           ## FFFFF570
/* 00EB4 80A70464 37281000 */  ori     $t0, $t9, 0x1000           ## $t0 = 00001000
/* 00EB8 80A70468 A4480F10 */  sh      $t0, 0x0F10($v0)           ## FFFFF570
/* 00EBC 80A7046C 10000048 */  beq     $zero, $zero, .L80A70590   
/* 00EC0 80A70470 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
glabel L80A70474
/* 00EC4 80A70474 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00EC8 80A70478 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00ECC 80A7047C 94490F24 */  lhu     $t1, 0x0F24($v0)           ## 8015F584
/* 00ED0 80A70480 352A0001 */  ori     $t2, $t1, 0x0001           ## $t2 = 00000001
/* 00ED4 80A70484 A44A0F24 */  sh      $t2, 0x0F24($v0)           ## 8015F584
/* 00ED8 80A70488 10000041 */  beq     $zero, $zero, .L80A70590   
/* 00EDC 80A7048C 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
glabel L80A70490
/* 00EE0 80A70490 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00EE4 80A70494 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00EE8 80A70498 944B0F24 */  lhu     $t3, 0x0F24($v0)           ## 8015F584
/* 00EEC 80A7049C 356C0002 */  ori     $t4, $t3, 0x0002           ## $t4 = 00000002
/* 00EF0 80A704A0 A44C0F24 */  sh      $t4, 0x0F24($v0)           ## 8015F584
/* 00EF4 80A704A4 1000003A */  beq     $zero, $zero, .L80A70590   
/* 00EF8 80A704A8 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
glabel L80A704AC
/* 00EFC 80A704AC 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00F00 80A704B0 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00F04 80A704B4 944D0F24 */  lhu     $t5, 0x0F24($v0)           ## 8015F584
/* 00F08 80A704B8 35AE0004 */  ori     $t6, $t5, 0x0004           ## $t6 = 00000004
/* 00F0C 80A704BC A44E0F24 */  sh      $t6, 0x0F24($v0)           ## 8015F584
/* 00F10 80A704C0 10000033 */  beq     $zero, $zero, .L80A70590   
/* 00F14 80A704C4 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
glabel L80A704C8
/* 00F18 80A704C8 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00F1C 80A704CC 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00F20 80A704D0 944F0F24 */  lhu     $t7, 0x0F24($v0)           ## 8015F584
/* 00F24 80A704D4 35F80008 */  ori     $t8, $t7, 0x0008           ## $t8 = 00000008
/* 00F28 80A704D8 A4580F24 */  sh      $t8, 0x0F24($v0)           ## 8015F584
/* 00F2C 80A704DC 1000002C */  beq     $zero, $zero, .L80A70590   
/* 00F30 80A704E0 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
glabel L80A704E4
/* 00F34 80A704E4 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00F38 80A704E8 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00F3C 80A704EC 94590F24 */  lhu     $t9, 0x0F24($v0)           ## 8015F584
/* 00F40 80A704F0 37280010 */  ori     $t0, $t9, 0x0010           ## $t0 = 00000010
/* 00F44 80A704F4 A4480F24 */  sh      $t0, 0x0F24($v0)           ## 8015F584
/* 00F48 80A704F8 10000025 */  beq     $zero, $zero, .L80A70590   
/* 00F4C 80A704FC 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L80A70500:
/* 00F50 80A70500 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00F54 80A70504 94490F10 */  lhu     $t1, 0x0F10($v0)           ## FFFFF570
/* 00F58 80A70508 352A0800 */  ori     $t2, $t1, 0x0800           ## $t2 = 00000800
/* 00F5C 80A7050C A44A0F10 */  sh      $t2, 0x0F10($v0)           ## FFFFF570
/* 00F60 80A70510 1000001F */  beq     $zero, $zero, .L80A70590   
/* 00F64 80A70514 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L80A70518:
/* 00F68 80A70518 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00F6C 80A7051C A44013C4 */  sh      $zero, 0x13C4($v0)         ## FFFFFA24
/* 00F70 80A70520 1000001B */  beq     $zero, $zero, .L80A70590   
/* 00F74 80A70524 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L80A70528:
/* 00F78 80A70528 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00F7C 80A7052C 944B0F2A */  lhu     $t3, 0x0F2A($v0)           ## FFFFF58A
/* 00F80 80A70530 00E02025 */  or      $a0, $a3, $zero            ## $a0 = 00000000
/* 00F84 80A70534 8FA50048 */  lw      $a1, 0x0048($sp)           
/* 00F88 80A70538 316C0002 */  andi    $t4, $t3, 0x0002           ## $t4 = 00000000
/* 00F8C 80A7053C 11800003 */  beq     $t4, $zero, .L80A7054C     
/* 00F90 80A70540 2410003E */  addiu   $s0, $zero, 0x003E         ## $s0 = 0000003E
/* 00F94 80A70544 10000001 */  beq     $zero, $zero, .L80A7054C   
/* 00F98 80A70548 2410004D */  addiu   $s0, $zero, 0x004D         ## $s0 = 0000004D
.L80A7054C:
/* 00F9C 80A7054C 0C29BDF3 */  jal     func_80A6F7CC              
/* 00FA0 80A70550 02003025 */  or      $a2, $s0, $zero            ## $a2 = 0000004D
/* 00FA4 80A70554 8FAE004C */  lw      $t6, 0x004C($sp)           
/* 00FA8 80A70558 3C0D80A7 */  lui     $t5, %hi(func_80A714C4)    ## $t5 = 80A70000
/* 00FAC 80A7055C 25AD14C4 */  addiu   $t5, $t5, %lo(func_80A714C4) ## $t5 = 80A714C4
/* 00FB0 80A70560 ADCD0190 */  sw      $t5, 0x0190($t6)           ## 00000190
glabel L80A70564
.L80A70564:
/* 00FB4 80A70564 1000000A */  beq     $zero, $zero, .L80A70590   
/* 00FB8 80A70568 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
glabel L80A7056C
/* 00FBC 80A7056C 0C041AF2 */  jal     func_80106BC8              
/* 00FC0 80A70570 8FA40048 */  lw      $a0, 0x0048($sp)           
/* 00FC4 80A70574 14400003 */  bne     $v0, $zero, .L80A70584     
/* 00FC8 80A70578 00000000 */  nop
/* 00FCC 80A7057C 10000004 */  beq     $zero, $zero, .L80A70590   
/* 00FD0 80A70580 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
.L80A70584:
/* 00FD4 80A70584 10000002 */  beq     $zero, $zero, .L80A70590   
/* 00FD8 80A70588 24020002 */  addiu   $v0, $zero, 0x0002         ## $v0 = 00000002
.L80A7058C:
/* 00FDC 80A7058C 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
.L80A70590:
/* 00FE0 80A70590 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 00FE4 80A70594 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 00FE8 80A70598 27BD0048 */  addiu   $sp, $sp, 0x0048           ## $sp = 00000000
/* 00FEC 80A7059C 03E00008 */  jr      $ra                        
/* 00FF0 80A705A0 00000000 */  nop
