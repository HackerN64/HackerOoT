glabel func_809C4040
/* 00A10 809C4040 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 00A14 809C4044 AFB0001C */  sw      $s0, 0x001C($sp)           
/* 00A18 809C4048 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00A1C 809C404C AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 00A20 809C4050 AFB10020 */  sw      $s1, 0x0020($sp)           
/* 00A24 809C4054 00A08825 */  or      $s1, $a1, $zero            ## $s1 = 00000000
/* 00A28 809C4058 0C02927F */  jal     SkelAnime_FrameUpdateMatrix
              
/* 00A2C 809C405C 2484014C */  addiu   $a0, $a0, 0x014C           ## $a0 = 0000014C
/* 00A30 809C4060 0C042F6F */  jal     func_8010BDBC              
/* 00A34 809C4064 262420D8 */  addiu   $a0, $s1, 0x20D8           ## $a0 = 000020D8
/* 00A38 809C4068 860E022E */  lh      $t6, 0x022E($s0)           ## 0000022E
/* 00A3C 809C406C 55C2005F */  bnel    $t6, $v0, .L809C41EC       
/* 00A40 809C4070 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 00A44 809C4074 0C041AF2 */  jal     func_80106BC8              
/* 00A48 809C4078 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00A4C 809C407C 5040005B */  beql    $v0, $zero, .L809C41EC     
/* 00A50 809C4080 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 00A54 809C4084 0C041B33 */  jal     func_80106CCC              
/* 00A58 809C4088 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00A5C 809C408C 3C020001 */  lui     $v0, 0x0001                ## $v0 = 00010000
/* 00A60 809C4090 00511021 */  addu    $v0, $v0, $s1              
/* 00A64 809C4094 904204BD */  lbu     $v0, 0x04BD($v0)           ## 000104BD
/* 00A68 809C4098 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 00A6C 809C409C 3C0F8016 */  lui     $t7, %hi(gSaveContext+0x34)
/* 00A70 809C40A0 10400005 */  beq     $v0, $zero, .L809C40B8     
/* 00A74 809C40A4 00000000 */  nop
/* 00A78 809C40A8 10410045 */  beq     $v0, $at, .L809C41C0       
/* 00A7C 809C40AC 240A002D */  addiu   $t2, $zero, 0x002D         ## $t2 = 0000002D
/* 00A80 809C40B0 1000004E */  beq     $zero, $zero, .L809C41EC   
/* 00A84 809C40B4 8FBF0024 */  lw      $ra, 0x0024($sp)           
.L809C40B8:
/* 00A88 809C40B8 85EFE694 */  lh      $t7, %lo(gSaveContext+0x34)($t7)
/* 00A8C 809C40BC 24190085 */  addiu   $t9, $zero, 0x0085         ## $t9 = 00000085
/* 00A90 809C40C0 3325FFFF */  andi    $a1, $t9, 0xFFFF           ## $a1 = 00000085
/* 00A94 809C40C4 29E1001E */  slti    $at, $t7, 0x001E           
/* 00A98 809C40C8 14200034 */  bne     $at, $zero, .L809C419C     
/* 00A9C 809C40CC 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00AA0 809C40D0 0C021CC3 */  jal     Rupees_ChangeBy              
/* 00AA4 809C40D4 2404FFE2 */  addiu   $a0, $zero, 0xFFE2         ## $a0 = FFFFFFE2
/* 00AA8 809C40D8 A6000240 */  sh      $zero, 0x0240($s0)         ## 00000240
/* 00AAC 809C40DC 86190240 */  lh      $t9, 0x0240($s0)           ## 00000240
/* 00AB0 809C40E0 24180001 */  addiu   $t8, $zero, 0x0001         ## $t8 = 00000001
/* 00AB4 809C40E4 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 00AB8 809C40E8 A2180258 */  sb      $t8, 0x0258($s0)           ## 00000258
/* 00ABC 809C40EC 00310821 */  addu    $at, $at, $s1              
/* 00AC0 809C40F0 2408000A */  addiu   $t0, $zero, 0x000A         ## $t0 = 0000000A
/* 00AC4 809C40F4 A619023E */  sh      $t9, 0x023E($s0)           ## 0000023E
/* 00AC8 809C40F8 A0281E5D */  sb      $t0, 0x1E5D($at)           ## 00011E5D
/* 00ACC 809C40FC 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00AD0 809C4100 0C00B2DD */  jal     Flags_SetSwitch
              
/* 00AD4 809C4104 24050038 */  addiu   $a1, $zero, 0x0038         ## $a1 = 00000038
/* 00AD8 809C4108 86090232 */  lh      $t1, 0x0232($s0)           ## 00000232
/* 00ADC 809C410C 240E001B */  addiu   $t6, $zero, 0x001B         ## $t6 = 0000001B
/* 00AE0 809C4110 31C5FFFF */  andi    $a1, $t6, 0xFFFF           ## $a1 = 0000001B
/* 00AE4 809C4114 1520000F */  bne     $t1, $zero, .L809C4154     
/* 00AE8 809C4118 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00AEC 809C411C 860A023C */  lh      $t2, 0x023C($s0)           ## 0000023C
/* 00AF0 809C4120 240B0019 */  addiu   $t3, $zero, 0x0019         ## $t3 = 00000019
/* 00AF4 809C4124 1540000B */  bne     $t2, $zero, .L809C4154     
/* 00AF8 809C4128 00000000 */  nop
/* 00AFC 809C412C A60B010E */  sh      $t3, 0x010E($s0)           ## 0000010E
/* 00B00 809C4130 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00B04 809C4134 0C042DC8 */  jal     func_8010B720              
/* 00B08 809C4138 3165FFFF */  andi    $a1, $t3, 0xFFFF           ## $a1 = 00000019
/* 00B0C 809C413C 3C0D809C */  lui     $t5, %hi(func_809C41FC)    ## $t5 = 809C0000
/* 00B10 809C4140 240C0005 */  addiu   $t4, $zero, 0x0005         ## $t4 = 00000005
/* 00B14 809C4144 25AD41FC */  addiu   $t5, $t5, %lo(func_809C41FC) ## $t5 = 809C41FC
/* 00B18 809C4148 A60C022E */  sh      $t4, 0x022E($s0)           ## 0000022E
/* 00B1C 809C414C 10000026 */  beq     $zero, $zero, .L809C41E8   
/* 00B20 809C4150 AE0D0214 */  sw      $t5, 0x0214($s0)           ## 00000214
.L809C4154:
/* 00B24 809C4154 0C042DC8 */  jal     func_8010B720              
/* 00B28 809C4158 A60E010E */  sh      $t6, 0x010E($s0)           ## 0000010E
/* 00B2C 809C415C 240F0005 */  addiu   $t7, $zero, 0x0005         ## $t7 = 00000005
/* 00B30 809C4160 A60F022E */  sh      $t7, 0x022E($s0)           ## 0000022E
/* 00B34 809C4164 AFA00010 */  sw      $zero, 0x0010($sp)         
/* 00B38 809C4168 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00B3C 809C416C 24051F4A */  addiu   $a1, $zero, 0x1F4A         ## $a1 = 00001F4A
/* 00B40 809C4170 2406FF9D */  addiu   $a2, $zero, 0xFF9D         ## $a2 = FFFFFF9D
/* 00B44 809C4174 0C02003E */  jal     func_800800F8              
/* 00B48 809C4178 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 00B4C 809C417C 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00B50 809C4180 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 00B54 809C4184 0C00B7D5 */  jal     func_8002DF54              
/* 00B58 809C4188 24060008 */  addiu   $a2, $zero, 0x0008         ## $a2 = 00000008
/* 00B5C 809C418C 3C18809C */  lui     $t8, %hi(func_809C4318)    ## $t8 = 809C0000
/* 00B60 809C4190 27184318 */  addiu   $t8, $t8, %lo(func_809C4318) ## $t8 = 809C4318
/* 00B64 809C4194 10000014 */  beq     $zero, $zero, .L809C41E8   
/* 00B68 809C4198 AE180214 */  sw      $t8, 0x0214($s0)           ## 00000214
.L809C419C:
/* 00B6C 809C419C A600023C */  sh      $zero, 0x023C($s0)         ## 0000023C
/* 00B70 809C41A0 0C042DC8 */  jal     func_8010B720              
/* 00B74 809C41A4 A619010E */  sh      $t9, 0x010E($s0)           ## 0000010E
/* 00B78 809C41A8 3C09809C */  lui     $t1, %hi(func_809C41FC)    ## $t1 = 809C0000
/* 00B7C 809C41AC 24080005 */  addiu   $t0, $zero, 0x0005         ## $t0 = 00000005
/* 00B80 809C41B0 252941FC */  addiu   $t1, $t1, %lo(func_809C41FC) ## $t1 = 809C41FC
/* 00B84 809C41B4 A608022E */  sh      $t0, 0x022E($s0)           ## 0000022E
/* 00B88 809C41B8 1000000B */  beq     $zero, $zero, .L809C41E8   
/* 00B8C 809C41BC AE090214 */  sw      $t1, 0x0214($s0)           ## 00000214
.L809C41C0:
/* 00B90 809C41C0 A600023C */  sh      $zero, 0x023C($s0)         ## 0000023C
/* 00B94 809C41C4 A60A010E */  sh      $t2, 0x010E($s0)           ## 0000010E
/* 00B98 809C41C8 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00B9C 809C41CC 0C042DC8 */  jal     func_8010B720              
/* 00BA0 809C41D0 3145FFFF */  andi    $a1, $t2, 0xFFFF           ## $a1 = 00000000
/* 00BA4 809C41D4 3C0C809C */  lui     $t4, %hi(func_809C41FC)    ## $t4 = 809C0000
/* 00BA8 809C41D8 240B0005 */  addiu   $t3, $zero, 0x0005         ## $t3 = 00000005
/* 00BAC 809C41DC 258C41FC */  addiu   $t4, $t4, %lo(func_809C41FC) ## $t4 = 809C41FC
/* 00BB0 809C41E0 A60B022E */  sh      $t3, 0x022E($s0)           ## 0000022E
/* 00BB4 809C41E4 AE0C0214 */  sw      $t4, 0x0214($s0)           ## 00000214
.L809C41E8:
/* 00BB8 809C41E8 8FBF0024 */  lw      $ra, 0x0024($sp)           
.L809C41EC:
/* 00BBC 809C41EC 8FB0001C */  lw      $s0, 0x001C($sp)           
/* 00BC0 809C41F0 8FB10020 */  lw      $s1, 0x0020($sp)           
/* 00BC4 809C41F4 03E00008 */  jr      $ra                        
/* 00BC8 809C41F8 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
