glabel func_80B13AAC
/* 0000C 80B13AAC 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 00010 80B13AB0 00803025 */  or      $a2, $a0, $zero            ## $a2 = 00000000
/* 00014 80B13AB4 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 00018 80B13AB8 00A02025 */  or      $a0, $a1, $zero            ## $a0 = 00000000
/* 0001C 80B13ABC 24050018 */  addiu   $a1, $zero, 0x0018         ## $a1 = 00000018
/* 00020 80B13AC0 0C01B0D8 */  jal     Text_GetFaceReaction              
/* 00024 80B13AC4 AFA60018 */  sw      $a2, 0x0018($sp)           
/* 00028 80B13AC8 3C048016 */  lui     $a0, %hi(gSaveContext)
/* 0002C 80B13ACC 2484E660 */  addiu   $a0, %lo(gSaveContext)
/* 00030 80B13AD0 948313FA */  lhu     $v1, 0x13FA($a0)           ## 8015FA5A
/* 00034 80B13AD4 8FA60018 */  lw      $a2, 0x0018($sp)           
/* 00038 80B13AD8 306E0400 */  andi    $t6, $v1, 0x0400           ## $t6 = 00000000
/* 0003C 80B13ADC 11C00012 */  beq     $t6, $zero, .L80B13B28     
/* 00040 80B13AE0 306F0100 */  andi    $t7, $v1, 0x0100           ## $t7 = 00000000
/* 00044 80B13AE4 11E0000B */  beq     $t7, $zero, .L80B13B14     
/* 00048 80B13AE8 240A2085 */  addiu   $t2, $zero, 0x2085         ## $t2 = 00002085
/* 0004C 80B13AEC 94980EF0 */  lhu     $t8, 0x0EF0($a0)           ## 8015F550
/* 00050 80B13AF0 24082088 */  addiu   $t0, $zero, 0x2088         ## $t0 = 00002088
/* 00054 80B13AF4 24092086 */  addiu   $t1, $zero, 0x2086         ## $t1 = 00002086
/* 00058 80B13AF8 33190004 */  andi    $t9, $t8, 0x0004           ## $t9 = 00000000
/* 0005C 80B13AFC 13200003 */  beq     $t9, $zero, .L80B13B0C     
/* 00060 80B13B00 00000000 */  nop
/* 00064 80B13B04 10000004 */  beq     $zero, $zero, .L80B13B18   
/* 00068 80B13B08 A4C8010E */  sh      $t0, 0x010E($a2)           ## 0000010E
.L80B13B0C:
/* 0006C 80B13B0C 10000002 */  beq     $zero, $zero, .L80B13B18   
/* 00070 80B13B10 A4C9010E */  sh      $t1, 0x010E($a2)           ## 0000010E
.L80B13B14:
/* 00074 80B13B14 A4CA010E */  sh      $t2, 0x010E($a2)           ## 0000010E
.L80B13B18:
/* 00078 80B13B18 948B13FA */  lhu     $t3, 0x13FA($a0)           ## 8015FA5A
/* 0007C 80B13B1C 316CFEFF */  andi    $t4, $t3, 0xFEFF           ## $t4 = 00000000
/* 00080 80B13B20 10000015 */  beq     $zero, $zero, .L80B13B78   
/* 00084 80B13B24 A48C13FA */  sh      $t4, 0x13FA($a0)           ## 8015FA5A
.L80B13B28:
/* 00088 80B13B28 54400013 */  bnel    $v0, $zero, .L80B13B78     
/* 0008C 80B13B2C A4C2010E */  sh      $v0, 0x010E($a2)           ## 0000010E
/* 00090 80B13B30 948D0F06 */  lhu     $t5, 0x0F06($a0)           ## 8015F566
/* 00094 80B13B34 2409207E */  addiu   $t1, $zero, 0x207E         ## $t1 = 0000207E
/* 00098 80B13B38 31AE4000 */  andi    $t6, $t5, 0x4000           ## $t6 = 00000000
/* 0009C 80B13B3C 11C0000B */  beq     $t6, $zero, .L80B13B6C     
/* 000A0 80B13B40 00000000 */  nop
/* 000A4 80B13B44 948F0EF0 */  lhu     $t7, 0x0EF0($a0)           ## 8015F550
/* 000A8 80B13B48 2419208B */  addiu   $t9, $zero, 0x208B         ## $t9 = 0000208B
/* 000AC 80B13B4C 2408207F */  addiu   $t0, $zero, 0x207F         ## $t0 = 0000207F
/* 000B0 80B13B50 31F80004 */  andi    $t8, $t7, 0x0004           ## $t8 = 00000000
/* 000B4 80B13B54 13000003 */  beq     $t8, $zero, .L80B13B64     
/* 000B8 80B13B58 00000000 */  nop
/* 000BC 80B13B5C 10000006 */  beq     $zero, $zero, .L80B13B78   
/* 000C0 80B13B60 A4D9010E */  sh      $t9, 0x010E($a2)           ## 0000010E
.L80B13B64:
/* 000C4 80B13B64 10000004 */  beq     $zero, $zero, .L80B13B78   
/* 000C8 80B13B68 A4C8010E */  sh      $t0, 0x010E($a2)           ## 0000010E
.L80B13B6C:
/* 000CC 80B13B6C 10000002 */  beq     $zero, $zero, .L80B13B78   
/* 000D0 80B13B70 A4C9010E */  sh      $t1, 0x010E($a2)           ## 0000010E
/* 000D4 80B13B74 A4C2010E */  sh      $v0, 0x010E($a2)           ## 0000010E
.L80B13B78:
/* 000D8 80B13B78 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 000DC 80B13B7C 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 000E0 80B13B80 03E00008 */  jr      $ra                        
/* 000E4 80B13B84 00000000 */  nop
