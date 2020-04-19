.rdata
glabel D_80AF7490
    .asciz "../z_en_sa.c"
    .balign 4

glabel D_80AF74A0
    .asciz "../z_en_sa.c"
    .balign 4

.text
glabel EnSa_Draw
/* 01A08 80AF6F68 27BDFFA0 */  addiu   $sp, $sp, 0xFFA0           ## $sp = FFFFFFA0
/* 01A0C 80AF6F6C AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 01A10 80AF6F70 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 01A14 80AF6F74 AFA50064 */  sw      $a1, 0x0064($sp)           
/* 01A18 80AF6F78 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 01A1C 80AF6F7C 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 01A20 80AF6F80 3C0680AF */  lui     $a2, %hi(D_80AF7490)       ## $a2 = 80AF0000
/* 01A24 80AF6F84 24C67490 */  addiu   $a2, $a2, %lo(D_80AF7490)  ## $a2 = 80AF7490
/* 01A28 80AF6F88 27A40048 */  addiu   $a0, $sp, 0x0048           ## $a0 = FFFFFFE8
/* 01A2C 80AF6F8C 240705A4 */  addiu   $a3, $zero, 0x05A4         ## $a3 = 000005A4
/* 01A30 80AF6F90 0C031AB1 */  jal     Graph_OpenDisps              
/* 01A34 80AF6F94 AFA50058 */  sw      $a1, 0x0058($sp)           
/* 01A38 80AF6F98 86020218 */  lh      $v0, 0x0218($s0)           ## 00000218
/* 01A3C 80AF6F9C 240100FF */  addiu   $at, $zero, 0x00FF         ## $at = 000000FF
/* 01A40 80AF6FA0 8FA80058 */  lw      $t0, 0x0058($sp)           
/* 01A44 80AF6FA4 1441004D */  bne     $v0, $at, .L80AF70DC       
/* 01A48 80AF6FA8 3C0500FF */  lui     $a1, 0x00FF                ## $a1 = 00FF0000
/* 01A4C 80AF6FAC 8D0202C0 */  lw      $v0, 0x02C0($t0)           ## 000002C0
/* 01A50 80AF6FB0 3C18DB06 */  lui     $t8, 0xDB06                ## $t8 = DB060000
/* 01A54 80AF6FB4 37180020 */  ori     $t8, $t8, 0x0020           ## $t8 = DB060020
/* 01A58 80AF6FB8 244F0008 */  addiu   $t7, $v0, 0x0008           ## $t7 = 00000008
/* 01A5C 80AF6FBC AD0F02C0 */  sw      $t7, 0x02C0($t0)           ## 000002C0
/* 01A60 80AF6FC0 AC580000 */  sw      $t8, 0x0000($v0)           ## 00000000
/* 01A64 80AF6FC4 86190212 */  lh      $t9, 0x0212($s0)           ## 00000212
/* 01A68 80AF6FC8 3C0980AF */  lui     $t1, %hi(D_80AF7474)       ## $t1 = 80AF0000
/* 01A6C 80AF6FCC 25297474 */  addiu   $t1, $t1, %lo(D_80AF7474)  ## $t1 = 80AF7474
/* 01A70 80AF6FD0 00195080 */  sll     $t2, $t9,  2               
/* 01A74 80AF6FD4 012A5821 */  addu    $t3, $t1, $t2              
/* 01A78 80AF6FD8 8D640000 */  lw      $a0, 0x0000($t3)           ## 00000000
/* 01A7C 80AF6FDC 3C068016 */  lui     $a2, %hi(gSegments)
/* 01A80 80AF6FE0 24C66FA8 */  addiu   $a2, %lo(gSegments)
/* 01A84 80AF6FE4 00046900 */  sll     $t5, $a0,  4               
/* 01A88 80AF6FE8 000D7702 */  srl     $t6, $t5, 28               
/* 01A8C 80AF6FEC 000E7880 */  sll     $t7, $t6,  2               
/* 01A90 80AF6FF0 00CFC021 */  addu    $t8, $a2, $t7              
/* 01A94 80AF6FF4 8F190000 */  lw      $t9, 0x0000($t8)           ## DB060020
/* 01A98 80AF6FF8 34A5FFFF */  ori     $a1, $a1, 0xFFFF           ## $a1 = 00FFFFFF
/* 01A9C 80AF6FFC 00856024 */  and     $t4, $a0, $a1              
/* 01AA0 80AF7000 3C078000 */  lui     $a3, 0x8000                ## $a3 = 80000000
/* 01AA4 80AF7004 01995021 */  addu    $t2, $t4, $t9              
/* 01AA8 80AF7008 01475821 */  addu    $t3, $t2, $a3              
/* 01AAC 80AF700C AC4B0004 */  sw      $t3, 0x0004($v0)           ## 00000004
/* 01AB0 80AF7010 8D0202C0 */  lw      $v0, 0x02C0($t0)           ## 000002C0
/* 01AB4 80AF7014 3C0EDB06 */  lui     $t6, 0xDB06                ## $t6 = DB060000
/* 01AB8 80AF7018 35CE0024 */  ori     $t6, $t6, 0x0024           ## $t6 = DB060024
/* 01ABC 80AF701C 244D0008 */  addiu   $t5, $v0, 0x0008           ## $t5 = 00000008
/* 01AC0 80AF7020 AD0D02C0 */  sw      $t5, 0x02C0($t0)           ## 000002C0
/* 01AC4 80AF7024 AC4E0000 */  sw      $t6, 0x0000($v0)           ## 00000000
/* 01AC8 80AF7028 860F0214 */  lh      $t7, 0x0214($s0)           ## 00000214
/* 01ACC 80AF702C 000FC080 */  sll     $t8, $t7,  2               
/* 01AD0 80AF7030 01386021 */  addu    $t4, $t1, $t8              
/* 01AD4 80AF7034 8D840000 */  lw      $a0, 0x0000($t4)           ## 00000000
/* 01AD8 80AF7038 00045100 */  sll     $t2, $a0,  4               
/* 01ADC 80AF703C 000A5F02 */  srl     $t3, $t2, 28               
/* 01AE0 80AF7040 000B6880 */  sll     $t5, $t3,  2               
/* 01AE4 80AF7044 00CD7021 */  addu    $t6, $a2, $t5              
/* 01AE8 80AF7048 8DCF0000 */  lw      $t7, 0x0000($t6)           ## DB060024
/* 01AEC 80AF704C 0085C824 */  and     $t9, $a0, $a1              
/* 01AF0 80AF7050 3C0BDB06 */  lui     $t3, 0xDB06                ## $t3 = DB060000
/* 01AF4 80AF7054 032FC021 */  addu    $t8, $t9, $t7              
/* 01AF8 80AF7058 03076021 */  addu    $t4, $t8, $a3              
/* 01AFC 80AF705C AC4C0004 */  sw      $t4, 0x0004($v0)           ## 00000004
/* 01B00 80AF7060 8D0202C0 */  lw      $v0, 0x02C0($t0)           ## 000002C0
/* 01B04 80AF7064 356B0028 */  ori     $t3, $t3, 0x0028           ## $t3 = DB060028
/* 01B08 80AF7068 3C0480AF */  lui     $a0, %hi(D_80AF7460)       ## $a0 = 80AF0000
/* 01B0C 80AF706C 244A0008 */  addiu   $t2, $v0, 0x0008           ## $t2 = 00000008
/* 01B10 80AF7070 AD0A02C0 */  sw      $t2, 0x02C0($t0)           ## 000002C0
/* 01B14 80AF7074 AC4B0000 */  sw      $t3, 0x0000($v0)           ## 00000000
/* 01B18 80AF7078 860D0216 */  lh      $t5, 0x0216($s0)           ## 00000216
/* 01B1C 80AF707C 000D7080 */  sll     $t6, $t5,  2               
/* 01B20 80AF7080 008E2021 */  addu    $a0, $a0, $t6              
/* 01B24 80AF7084 8C847460 */  lw      $a0, %lo(D_80AF7460)($a0)  
/* 01B28 80AF7088 00047900 */  sll     $t7, $a0,  4               
/* 01B2C 80AF708C 000FC702 */  srl     $t8, $t7, 28               
/* 01B30 80AF7090 00186080 */  sll     $t4, $t8,  2               
/* 01B34 80AF7094 00CC5021 */  addu    $t2, $a2, $t4              
/* 01B38 80AF7098 8D4B0000 */  lw      $t3, 0x0000($t2)           ## 00000008
/* 01B3C 80AF709C 0085C824 */  and     $t9, $a0, $a1              
/* 01B40 80AF70A0 3C0680AF */  lui     $a2, %hi(func_80AF6D6C)    ## $a2 = 80AF0000
/* 01B44 80AF70A4 032B6821 */  addu    $t5, $t9, $t3              
/* 01B48 80AF70A8 01A77021 */  addu    $t6, $t5, $a3              
/* 01B4C 80AF70AC AC4E0004 */  sw      $t6, 0x0004($v0)           ## 00000004
/* 01B50 80AF70B0 AFB00010 */  sw      $s0, 0x0010($sp)           
/* 01B54 80AF70B4 860F0218 */  lh      $t7, 0x0218($s0)           ## 00000218
/* 01B58 80AF70B8 3C0780AF */  lui     $a3, %hi(func_80AF6F0C)    ## $a3 = 80AF0000
/* 01B5C 80AF70BC 24E76F0C */  addiu   $a3, $a3, %lo(func_80AF6F0C) ## $a3 = 80AF6F0C
/* 01B60 80AF70C0 8FA40064 */  lw      $a0, 0x0064($sp)           
/* 01B64 80AF70C4 24C66D6C */  addiu   $a2, $a2, %lo(func_80AF6D6C) ## $a2 = 80AF6D6C
/* 01B68 80AF70C8 2605014C */  addiu   $a1, $s0, 0x014C           ## $a1 = 0000014C
/* 01B6C 80AF70CC 0C00D2E8 */  jal     func_80034BA0              
/* 01B70 80AF70D0 AFAF0014 */  sw      $t7, 0x0014($sp)           
/* 01B74 80AF70D4 1000004E */  beq     $zero, $zero, .L80AF7210   
/* 01B78 80AF70D8 8FAC0064 */  lw      $t4, 0x0064($sp)           
.L80AF70DC:
/* 01B7C 80AF70DC 1040004B */  beq     $v0, $zero, .L80AF720C     
/* 01B80 80AF70E0 3C0500FF */  lui     $a1, 0x00FF                ## $a1 = 00FF0000
/* 01B84 80AF70E4 8D0202D0 */  lw      $v0, 0x02D0($t0)           ## 000002D0
/* 01B88 80AF70E8 3C0CDB06 */  lui     $t4, 0xDB06                ## $t4 = DB060000
/* 01B8C 80AF70EC 358C0020 */  ori     $t4, $t4, 0x0020           ## $t4 = DB060020
/* 01B90 80AF70F0 24580008 */  addiu   $t8, $v0, 0x0008           ## $t8 = 00000008
/* 01B94 80AF70F4 AD1802D0 */  sw      $t8, 0x02D0($t0)           ## 000002D0
/* 01B98 80AF70F8 AC4C0000 */  sw      $t4, 0x0000($v0)           ## 00000000
/* 01B9C 80AF70FC 860A0212 */  lh      $t2, 0x0212($s0)           ## 00000212
/* 01BA0 80AF7100 3C0980AF */  lui     $t1, %hi(D_80AF7474)       ## $t1 = 80AF0000
/* 01BA4 80AF7104 25297474 */  addiu   $t1, $t1, %lo(D_80AF7474)  ## $t1 = 80AF7474
/* 01BA8 80AF7108 000AC880 */  sll     $t9, $t2,  2               
/* 01BAC 80AF710C 01395821 */  addu    $t3, $t1, $t9              
/* 01BB0 80AF7110 8D640000 */  lw      $a0, 0x0000($t3)           ## 00000000
/* 01BB4 80AF7114 3C068016 */  lui     $a2, %hi(gSegments)
/* 01BB8 80AF7118 24C66FA8 */  addiu   $a2, %lo(gSegments)
/* 01BBC 80AF711C 00047100 */  sll     $t6, $a0,  4               
/* 01BC0 80AF7120 000E7F02 */  srl     $t7, $t6, 28               
/* 01BC4 80AF7124 000FC080 */  sll     $t8, $t7,  2               
/* 01BC8 80AF7128 00D86021 */  addu    $t4, $a2, $t8              
/* 01BCC 80AF712C 8D8A0000 */  lw      $t2, 0x0000($t4)           ## DB060020
/* 01BD0 80AF7130 34A5FFFF */  ori     $a1, $a1, 0xFFFF           ## $a1 = 00FFFFFF
/* 01BD4 80AF7134 00856824 */  and     $t5, $a0, $a1              
/* 01BD8 80AF7138 3C078000 */  lui     $a3, 0x8000                ## $a3 = 80000000
/* 01BDC 80AF713C 01AAC821 */  addu    $t9, $t5, $t2              
/* 01BE0 80AF7140 03275821 */  addu    $t3, $t9, $a3              
/* 01BE4 80AF7144 AC4B0004 */  sw      $t3, 0x0004($v0)           ## 00000004
/* 01BE8 80AF7148 8D0202D0 */  lw      $v0, 0x02D0($t0)           ## 000002D0
/* 01BEC 80AF714C 3C0FDB06 */  lui     $t7, 0xDB06                ## $t7 = DB060000
/* 01BF0 80AF7150 35EF0024 */  ori     $t7, $t7, 0x0024           ## $t7 = DB060024
/* 01BF4 80AF7154 244E0008 */  addiu   $t6, $v0, 0x0008           ## $t6 = 00000008
/* 01BF8 80AF7158 AD0E02D0 */  sw      $t6, 0x02D0($t0)           ## 000002D0
/* 01BFC 80AF715C AC4F0000 */  sw      $t7, 0x0000($v0)           ## 00000000
/* 01C00 80AF7160 86180214 */  lh      $t8, 0x0214($s0)           ## 00000214
/* 01C04 80AF7164 00186080 */  sll     $t4, $t8,  2               
/* 01C08 80AF7168 012C6821 */  addu    $t5, $t1, $t4              
/* 01C0C 80AF716C 8DA40000 */  lw      $a0, 0x0000($t5)           ## 00000000
/* 01C10 80AF7170 0004C900 */  sll     $t9, $a0,  4               
/* 01C14 80AF7174 00195F02 */  srl     $t3, $t9, 28               
/* 01C18 80AF7178 000B7080 */  sll     $t6, $t3,  2               
/* 01C1C 80AF717C 00CE7821 */  addu    $t7, $a2, $t6              
/* 01C20 80AF7180 8DF80000 */  lw      $t8, 0x0000($t7)           ## DB060024
/* 01C24 80AF7184 00855024 */  and     $t2, $a0, $a1              
/* 01C28 80AF7188 3C0BDB06 */  lui     $t3, 0xDB06                ## $t3 = DB060000
/* 01C2C 80AF718C 01586021 */  addu    $t4, $t2, $t8              
/* 01C30 80AF7190 01876821 */  addu    $t5, $t4, $a3              
/* 01C34 80AF7194 AC4D0004 */  sw      $t5, 0x0004($v0)           ## 00000004
/* 01C38 80AF7198 8D0202D0 */  lw      $v0, 0x02D0($t0)           ## 000002D0
/* 01C3C 80AF719C 356B0028 */  ori     $t3, $t3, 0x0028           ## $t3 = DB060028
/* 01C40 80AF71A0 3C0480AF */  lui     $a0, %hi(D_80AF7460)       ## $a0 = 80AF0000
/* 01C44 80AF71A4 24590008 */  addiu   $t9, $v0, 0x0008           ## $t9 = 00000008
/* 01C48 80AF71A8 AD1902D0 */  sw      $t9, 0x02D0($t0)           ## 000002D0
/* 01C4C 80AF71AC AC4B0000 */  sw      $t3, 0x0000($v0)           ## 00000000
/* 01C50 80AF71B0 860E0216 */  lh      $t6, 0x0216($s0)           ## 00000216
/* 01C54 80AF71B4 000E7880 */  sll     $t7, $t6,  2               
/* 01C58 80AF71B8 008F2021 */  addu    $a0, $a0, $t7              
/* 01C5C 80AF71BC 8C847460 */  lw      $a0, %lo(D_80AF7460)($a0)  
/* 01C60 80AF71C0 0004C100 */  sll     $t8, $a0,  4               
/* 01C64 80AF71C4 00186702 */  srl     $t4, $t8, 28               
/* 01C68 80AF71C8 000C6880 */  sll     $t5, $t4,  2               
/* 01C6C 80AF71CC 00CDC821 */  addu    $t9, $a2, $t5              
/* 01C70 80AF71D0 8F2B0000 */  lw      $t3, 0x0000($t9)           ## 00000008
/* 01C74 80AF71D4 00855024 */  and     $t2, $a0, $a1              
/* 01C78 80AF71D8 3C0680AF */  lui     $a2, %hi(func_80AF6D6C)    ## $a2 = 80AF0000
/* 01C7C 80AF71DC 014B7021 */  addu    $t6, $t2, $t3              
/* 01C80 80AF71E0 01C77821 */  addu    $t7, $t6, $a3              
/* 01C84 80AF71E4 AC4F0004 */  sw      $t7, 0x0004($v0)           ## 00000004
/* 01C88 80AF71E8 AFB00010 */  sw      $s0, 0x0010($sp)           
/* 01C8C 80AF71EC 86180218 */  lh      $t8, 0x0218($s0)           ## 00000218
/* 01C90 80AF71F0 3C0780AF */  lui     $a3, %hi(func_80AF6F0C)    ## $a3 = 80AF0000
/* 01C94 80AF71F4 24E76F0C */  addiu   $a3, $a3, %lo(func_80AF6F0C) ## $a3 = 80AF6F0C
/* 01C98 80AF71F8 8FA40064 */  lw      $a0, 0x0064($sp)           
/* 01C9C 80AF71FC 24C66D6C */  addiu   $a2, $a2, %lo(func_80AF6D6C) ## $a2 = 80AF6D6C
/* 01CA0 80AF7200 2605014C */  addiu   $a1, $s0, 0x014C           ## $a1 = 0000014C
/* 01CA4 80AF7204 0C00D331 */  jal     func_80034CC4              
/* 01CA8 80AF7208 AFB80014 */  sw      $t8, 0x0014($sp)           
.L80AF720C:
/* 01CAC 80AF720C 8FAC0064 */  lw      $t4, 0x0064($sp)           
.L80AF7210:
/* 01CB0 80AF7210 3C0680AF */  lui     $a2, %hi(D_80AF74A0)       ## $a2 = 80AF0000
/* 01CB4 80AF7214 24C674A0 */  addiu   $a2, $a2, %lo(D_80AF74A0)  ## $a2 = 80AF74A0
/* 01CB8 80AF7218 27A40048 */  addiu   $a0, $sp, 0x0048           ## $a0 = FFFFFFE8
/* 01CBC 80AF721C 240705D9 */  addiu   $a3, $zero, 0x05D9         ## $a3 = 000005D9
/* 01CC0 80AF7220 0C031AD5 */  jal     Graph_CloseDisps              
/* 01CC4 80AF7224 8D850000 */  lw      $a1, 0x0000($t4)           ## 00000000
/* 01CC8 80AF7228 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 01CCC 80AF722C 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 01CD0 80AF7230 27BD0060 */  addiu   $sp, $sp, 0x0060           ## $sp = 00000000
/* 01CD4 80AF7234 03E00008 */  jr      $ra                        
/* 01CD8 80AF7238 00000000 */  nop
/* 01CDC 80AF723C 00000000 */  nop
