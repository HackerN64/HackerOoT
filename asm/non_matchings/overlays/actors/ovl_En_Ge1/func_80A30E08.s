glabel func_80A30E08
/* 00498 80A30E08 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 0049C 80A30E0C AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 004A0 80A30E10 948E02AC */  lhu     $t6, 0x02AC($a0)           ## 000002AC
/* 004A4 80A30E14 908202AF */  lbu     $v0, 0x02AF($a0)           ## 000002AF
/* 004A8 80A30E18 35CF0001 */  ori     $t7, $t6, 0x0001           ## $t7 = 00000001
/* 004AC 80A30E1C 18400004 */  blez    $v0, .L80A30E30            
/* 004B0 80A30E20 A48F02AC */  sh      $t7, 0x02AC($a0)           ## 000002AC
/* 004B4 80A30E24 2458FFFF */  addiu   $t8, $v0, 0xFFFF           ## $t8 = FFFFFFFF
/* 004B8 80A30E28 1000002B */  beq     $zero, $zero, .L80A30ED8   
/* 004BC 80A30E2C A09802AF */  sb      $t8, 0x02AF($a0)           ## 000002AF
.L80A30E30:
/* 004C0 80A30E30 00A02025 */  or      $a0, $a1, $zero            ## $a0 = 00000000
/* 004C4 80A30E34 0C01B41D */  jal     func_8006D074              
/* 004C8 80A30E38 AFA5001C */  sw      $a1, 0x001C($sp)           
/* 004CC 80A30E3C 3C048012 */  lui     $a0, %hi(gItemSlots)
/* 004D0 80A30E40 24847464 */  addiu   $a0, %lo(gItemSlots)
/* 004D4 80A30E44 9099000A */  lbu     $t9, 0x000A($a0)           ## 8012746E
/* 004D8 80A30E48 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 004DC 80A30E4C 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 004E0 80A30E50 00594021 */  addu    $t0, $v0, $t9              
/* 004E4 80A30E54 91090074 */  lbu     $t1, 0x0074($t0)           ## 00000074
/* 004E8 80A30E58 240300FF */  addiu   $v1, $zero, 0x00FF         ## $v1 = 000000FF
/* 004EC 80A30E5C 8FA5001C */  lw      $a1, 0x001C($sp)           
/* 004F0 80A30E60 10690005 */  beq     $v1, $t1, .L80A30E78       
/* 004F4 80A30E64 24080026 */  addiu   $t0, $zero, 0x0026         ## $t0 = 00000026
/* 004F8 80A30E68 908A000B */  lbu     $t2, 0x000B($a0)           ## 8012746F
/* 004FC 80A30E6C 004A5821 */  addu    $t3, $v0, $t2              
/* 00500 80A30E70 916C0074 */  lbu     $t4, 0x0074($t3)           ## 00000074
/* 00504 80A30E74 146C0005 */  bne     $v1, $t4, .L80A30E8C       
.L80A30E78:
/* 00508 80A30E78 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 0050C 80A30E7C 00250821 */  addu    $at, $at, $a1              
/* 00510 80A30E80 240D01A5 */  addiu   $t5, $zero, 0x01A5         ## $t5 = 000001A5
/* 00514 80A30E84 1000000D */  beq     $zero, $zero, .L80A30EBC   
/* 00518 80A30E88 A42D1E1A */  sh      $t5, 0x1E1A($at)           ## 00011E1A
.L80A30E8C:
/* 0051C 80A30E8C 944E0EEC */  lhu     $t6, 0x0EEC($v0)           ## 8015F54C
/* 00520 80A30E90 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 00524 80A30E94 00250821 */  addu    $at, $at, $a1              
/* 00528 80A30E98 31CF0080 */  andi    $t7, $t6, 0x0080           ## $t7 = 00000000
/* 0052C 80A30E9C 11E00006 */  beq     $t7, $zero, .L80A30EB8     
/* 00530 80A30EA0 241903B4 */  addiu   $t9, $zero, 0x03B4         ## $t9 = 000003B4
/* 00534 80A30EA4 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 00538 80A30EA8 00250821 */  addu    $at, $at, $a1              
/* 0053C 80A30EAC 241805F8 */  addiu   $t8, $zero, 0x05F8         ## $t8 = 000005F8
/* 00540 80A30EB0 10000002 */  beq     $zero, $zero, .L80A30EBC   
/* 00544 80A30EB4 A4381E1A */  sh      $t8, 0x1E1A($at)           ## 00011E1A
.L80A30EB8:
/* 00548 80A30EB8 A4391E1A */  sh      $t9, 0x1E1A($at)           ## 00011E1A
.L80A30EBC:
/* 0054C 80A30EBC 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 00550 80A30EC0 00250821 */  addu    $at, $at, $a1              
/* 00554 80A30EC4 A0281E5E */  sb      $t0, 0x1E5E($at)           ## 00011E5E
/* 00558 80A30EC8 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 0055C 80A30ECC 00250821 */  addu    $at, $at, $a1              
/* 00560 80A30ED0 24090014 */  addiu   $t1, $zero, 0x0014         ## $t1 = 00000014
/* 00564 80A30ED4 A0291E15 */  sb      $t1, 0x1E15($at)           ## 00011E15
.L80A30ED8:
/* 00568 80A30ED8 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 0056C 80A30EDC 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 00570 80A30EE0 03E00008 */  jr      $ra                        
/* 00574 80A30EE4 00000000 */  nop
