glabel func_80A43D78
/* 01048 80A43D78 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 0104C 80A43D7C AFA40018 */  sw      $a0, 0x0018($sp)           
/* 01050 80A43D80 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 01054 80A43D84 00A03825 */  or      $a3, $a1, $zero            ## $a3 = 00000000
/* 01058 80A43D88 00A02025 */  or      $a0, $a1, $zero            ## $a0 = 00000000
/* 0105C 80A43D8C 8FA50018 */  lw      $a1, 0x0018($sp)           
/* 01060 80A43D90 0C290D1A */  jal     func_80A43468              
/* 01064 80A43D94 AFA7001C */  sw      $a3, 0x001C($sp)           
/* 01068 80A43D98 24010002 */  addiu   $at, $zero, 0x0002         ## $at = 00000002
/* 0106C 80A43D9C 10410009 */  beq     $v0, $at, .L80A43DC4       
/* 01070 80A43DA0 8FA7001C */  lw      $a3, 0x001C($sp)           
/* 01074 80A43DA4 24010004 */  addiu   $at, $zero, 0x0004         ## $at = 00000004
/* 01078 80A43DA8 10410020 */  beq     $v0, $at, .L80A43E2C       
/* 0107C 80A43DAC 8FA40018 */  lw      $a0, 0x0018($sp)           
/* 01080 80A43DB0 24010005 */  addiu   $at, $zero, 0x0005         ## $at = 00000005
/* 01084 80A43DB4 10410058 */  beq     $v0, $at, .L80A43F18       
/* 01088 80A43DB8 8FA40018 */  lw      $a0, 0x0018($sp)           
/* 0108C 80A43DBC 10000070 */  beq     $zero, $zero, .L80A43F80   
/* 01090 80A43DC0 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
.L80A43DC4:
/* 01094 80A43DC4 94E2010E */  lhu     $v0, 0x010E($a3)           ## 0000010E
/* 01098 80A43DC8 24013036 */  addiu   $at, $zero, 0x3036         ## $at = 00003036
/* 0109C 80A43DCC 00E02025 */  or      $a0, $a3, $zero            ## $a0 = 00000000
/* 010A0 80A43DD0 10410006 */  beq     $v0, $at, .L80A43DEC       
/* 010A4 80A43DD4 8FA50018 */  lw      $a1, 0x0018($sp)           
/* 010A8 80A43DD8 24013037 */  addiu   $at, $zero, 0x3037         ## $at = 00003037
/* 010AC 80A43DDC 1041000C */  beq     $v0, $at, .L80A43E10       
/* 010B0 80A43DE0 00000000 */  nop
/* 010B4 80A43DE4 10000066 */  beq     $zero, $zero, .L80A43F80   
/* 010B8 80A43DE8 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L80A43DEC:
/* 010BC 80A43DEC 2406002C */  addiu   $a2, $zero, 0x002C         ## $a2 = 0000002C
/* 010C0 80A43DF0 0C290D09 */  jal     func_80A43424              
/* 010C4 80A43DF4 AFA7001C */  sw      $a3, 0x001C($sp)           
/* 010C8 80A43DF8 8FA7001C */  lw      $a3, 0x001C($sp)           
/* 010CC 80A43DFC 3C0E80A4 */  lui     $t6, %hi(func_80A470E8)    ## $t6 = 80A40000
/* 010D0 80A43E00 25CE70E8 */  addiu   $t6, $t6, %lo(func_80A470E8) ## $t6 = 80A470E8
/* 010D4 80A43E04 24020002 */  addiu   $v0, $zero, 0x0002         ## $v0 = 00000002
/* 010D8 80A43E08 1000005D */  beq     $zero, $zero, .L80A43F80   
/* 010DC 80A43E0C ACEE0190 */  sw      $t6, 0x0190($a3)           ## 00000190
.L80A43E10:
/* 010E0 80A43E10 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 010E4 80A43E14 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 010E8 80A43E18 944F0F18 */  lhu     $t7, 0x0F18($v0)           ## 8015F578
/* 010EC 80A43E1C 35F84000 */  ori     $t8, $t7, 0x4000           ## $t8 = 00004000
/* 010F0 80A43E20 A4580F18 */  sh      $t8, 0x0F18($v0)           ## 8015F578
/* 010F4 80A43E24 10000056 */  beq     $zero, $zero, .L80A43F80   
/* 010F8 80A43E28 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L80A43E2C:
/* 010FC 80A43E2C 0C041AF2 */  jal     func_80106BC8              
/* 01100 80A43E30 AFA7001C */  sw      $a3, 0x001C($sp)           
/* 01104 80A43E34 10400051 */  beq     $v0, $zero, .L80A43F7C     
/* 01108 80A43E38 8FA7001C */  lw      $a3, 0x001C($sp)           
/* 0110C 80A43E3C 94F9010E */  lhu     $t9, 0x010E($a3)           ## 0000010E
/* 01110 80A43E40 24013034 */  addiu   $at, $zero, 0x3034         ## $at = 00003034
/* 01114 80A43E44 8FA80018 */  lw      $t0, 0x0018($sp)           
/* 01118 80A43E48 17210031 */  bne     $t9, $at, .L80A43F10       
/* 0111C 80A43E4C 3C090001 */  lui     $t1, 0x0001                ## $t1 = 00010000
/* 01120 80A43E50 01284821 */  addu    $t1, $t1, $t0              
/* 01124 80A43E54 912904BD */  lbu     $t1, 0x04BD($t1)           ## 000104BD
/* 01128 80A43E58 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 0112C 80A43E5C 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 01130 80A43E60 55200016 */  bnel    $t1, $zero, .L80A43EBC     
/* 01134 80A43E64 944E0F18 */  lhu     $t6, 0x0F18($v0)           ## 8015F578
/* 01138 80A43E68 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 0113C 80A43E6C 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 01140 80A43E70 944A0F18 */  lhu     $t2, 0x0F18($v0)           ## 8015F578
/* 01144 80A43E74 240D3035 */  addiu   $t5, $zero, 0x3035         ## $t5 = 00003035
/* 01148 80A43E78 240C3033 */  addiu   $t4, $zero, 0x3033         ## $t4 = 00003033
/* 0114C 80A43E7C 314B0800 */  andi    $t3, $t2, 0x0800           ## $t3 = 00000000
/* 01150 80A43E80 11600003 */  beq     $t3, $zero, .L80A43E90     
/* 01154 80A43E84 240439EB */  addiu   $a0, $zero, 0x39EB         ## $a0 = 000039EB
/* 01158 80A43E88 10000002 */  beq     $zero, $zero, .L80A43E94   
/* 0115C 80A43E8C A4EC010E */  sh      $t4, 0x010E($a3)           ## 0000010E
.L80A43E90:
/* 01160 80A43E90 A4ED010E */  sh      $t5, 0x010E($a3)           ## 0000010E
.L80A43E94:
/* 01164 80A43E94 94E5010E */  lhu     $a1, 0x010E($a3)           ## 0000010E
/* 01168 80A43E98 24013035 */  addiu   $at, $zero, 0x3035         ## $at = 00003035
/* 0116C 80A43E9C 54A10018 */  bnel    $a1, $at, .L80A43F00       
/* 01170 80A43EA0 8FA40018 */  lw      $a0, 0x0018($sp)           
/* 01174 80A43EA4 0C03E341 */  jal     func_800F8D04              
/* 01178 80A43EA8 AFA7001C */  sw      $a3, 0x001C($sp)           
/* 0117C 80A43EAC 8FA7001C */  lw      $a3, 0x001C($sp)           
/* 01180 80A43EB0 10000012 */  beq     $zero, $zero, .L80A43EFC   
/* 01184 80A43EB4 94E5010E */  lhu     $a1, 0x010E($a3)           ## 0000010E
/* 01188 80A43EB8 944E0F18 */  lhu     $t6, 0x0F18($v0)           ## 00000F18
.L80A43EBC:
/* 0118C 80A43EBC 24193033 */  addiu   $t9, $zero, 0x3033         ## $t9 = 00003033
/* 01190 80A43EC0 24183036 */  addiu   $t8, $zero, 0x3036         ## $t8 = 00003036
/* 01194 80A43EC4 31CF0800 */  andi    $t7, $t6, 0x0800           ## $t7 = 00000000
/* 01198 80A43EC8 11E00003 */  beq     $t7, $zero, .L80A43ED8     
/* 0119C 80A43ECC 240439EB */  addiu   $a0, $zero, 0x39EB         ## $a0 = 000039EB
/* 011A0 80A43ED0 10000002 */  beq     $zero, $zero, .L80A43EDC   
/* 011A4 80A43ED4 A4F8010E */  sh      $t8, 0x010E($a3)           ## 0000010E
.L80A43ED8:
/* 011A8 80A43ED8 A4F9010E */  sh      $t9, 0x010E($a3)           ## 0000010E
.L80A43EDC:
/* 011AC 80A43EDC 94E5010E */  lhu     $a1, 0x010E($a3)           ## 0000010E
/* 011B0 80A43EE0 24013036 */  addiu   $at, $zero, 0x3036         ## $at = 00003036
/* 011B4 80A43EE4 54A10006 */  bnel    $a1, $at, .L80A43F00       
/* 011B8 80A43EE8 8FA40018 */  lw      $a0, 0x0018($sp)           
/* 011BC 80A43EEC 0C03E341 */  jal     func_800F8D04              
/* 011C0 80A43EF0 AFA7001C */  sw      $a3, 0x001C($sp)           
/* 011C4 80A43EF4 8FA7001C */  lw      $a3, 0x001C($sp)           
/* 011C8 80A43EF8 94E5010E */  lhu     $a1, 0x010E($a3)           ## 0000010E
.L80A43EFC:
/* 011CC 80A43EFC 8FA40018 */  lw      $a0, 0x0018($sp)           
.L80A43F00:
/* 011D0 80A43F00 0C042DC8 */  jal     func_8010B720              
/* 011D4 80A43F04 AFA7001C */  sw      $a3, 0x001C($sp)           
/* 011D8 80A43F08 8FA7001C */  lw      $a3, 0x001C($sp)           
/* 011DC 80A43F0C A0E0020C */  sb      $zero, 0x020C($a3)         ## 0000020C
.L80A43F10:
/* 011E0 80A43F10 1000001B */  beq     $zero, $zero, .L80A43F80   
/* 011E4 80A43F14 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
.L80A43F18:
/* 011E8 80A43F18 0C041AF2 */  jal     func_80106BC8              
/* 011EC 80A43F1C AFA7001C */  sw      $a3, 0x001C($sp)           
/* 011F0 80A43F20 10400016 */  beq     $v0, $zero, .L80A43F7C     
/* 011F4 80A43F24 8FA7001C */  lw      $a3, 0x001C($sp)           
/* 011F8 80A43F28 94E2010E */  lhu     $v0, 0x010E($a3)           ## 0000010E
/* 011FC 80A43F2C 24013032 */  addiu   $at, $zero, 0x3032         ## $at = 00003032
/* 01200 80A43F30 240A3034 */  addiu   $t2, $zero, 0x3034         ## $t2 = 00003034
/* 01204 80A43F34 1041000A */  beq     $v0, $at, .L80A43F60       
/* 01208 80A43F38 3145FFFF */  andi    $a1, $t2, 0xFFFF           ## $a1 = 00003034
/* 0120C 80A43F3C 24013033 */  addiu   $at, $zero, 0x3033         ## $at = 00003033
/* 01210 80A43F40 10410007 */  beq     $v0, $at, .L80A43F60       
/* 01214 80A43F44 24013035 */  addiu   $at, $zero, 0x3035         ## $at = 00003035
/* 01218 80A43F48 1441000A */  bne     $v0, $at, .L80A43F74       
/* 0121C 80A43F4C 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 01220 80A43F50 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 01224 80A43F54 94480F18 */  lhu     $t0, 0x0F18($v0)           ## 8015F578
/* 01228 80A43F58 35090800 */  ori     $t1, $t0, 0x0800           ## $t1 = 00000800
/* 0122C 80A43F5C A4490F18 */  sh      $t1, 0x0F18($v0)           ## 8015F578
.L80A43F60:
/* 01230 80A43F60 A4EA010E */  sh      $t2, 0x010E($a3)           ## 0000010E
/* 01234 80A43F64 0C042DC8 */  jal     func_8010B720              
/* 01238 80A43F68 8FA40018 */  lw      $a0, 0x0018($sp)           
/* 0123C 80A43F6C 10000004 */  beq     $zero, $zero, .L80A43F80   
/* 01240 80A43F70 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
.L80A43F74:
/* 01244 80A43F74 10000002 */  beq     $zero, $zero, .L80A43F80   
/* 01248 80A43F78 24020002 */  addiu   $v0, $zero, 0x0002         ## $v0 = 00000002
.L80A43F7C:
/* 0124C 80A43F7C 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
.L80A43F80:
/* 01250 80A43F80 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 01254 80A43F84 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 01258 80A43F88 03E00008 */  jr      $ra                        
/* 0125C 80A43F8C 00000000 */  nop
