glabel func_80AC6F2C
/* 0428C 80AC6F2C 848F001C */  lh      $t7, 0x001C($a0)           ## 0000001C
/* 04290 80AC6F30 240E0008 */  addiu   $t6, $zero, 0x0008         ## $t6 = 00000008
/* 04294 80AC6F34 2401000A */  addiu   $at, $zero, 0x000A         ## $at = 0000000A
/* 04298 80AC6F38 15E10053 */  bne     $t7, $at, .L80AC7088       
/* 0429C 80AC6F3C A08E01EB */  sb      $t6, 0x01EB($a0)           ## 000001EB
/* 042A0 80AC6F40 3C188012 */  lui     $t8, %hi(gItemSlots+0x21)
/* 042A4 80AC6F44 93187485 */  lbu     $t8, %lo(gItemSlots+0x21)($t8)
/* 042A8 80AC6F48 3C058016 */  lui     $a1, %hi(gSaveContext)
/* 042AC 80AC6F4C 24A5E660 */  addiu   $a1, %lo(gSaveContext)
/* 042B0 80AC6F50 00B8C821 */  addu    $t9, $a1, $t8              
/* 042B4 80AC6F54 93280074 */  lbu     $t0, 0x0074($t9)           ## 00000074
/* 042B8 80AC6F58 2401002C */  addiu   $at, $zero, 0x002C         ## $at = 0000002C
/* 042BC 80AC6F5C 55010033 */  bnel    $t0, $at, .L80AC702C       
/* 042C0 80AC6F60 94A20EF6 */  lhu     $v0, 0x0EF6($a1)           ## 8015F556
/* 042C4 80AC6F64 94A20EF6 */  lhu     $v0, 0x0EF6($a1)           ## 8015F556
/* 042C8 80AC6F68 30490800 */  andi    $t1, $v0, 0x0800           ## $t1 = 00000000
/* 042CC 80AC6F6C 1120000B */  beq     $t1, $zero, .L80AC6F9C     
/* 042D0 80AC6F70 304D0400 */  andi    $t5, $v0, 0x0400           ## $t5 = 00000000
/* 042D4 80AC6F74 94AA0EE4 */  lhu     $t2, 0x0EE4($a1)           ## 8015F544
/* 042D8 80AC6F78 240C0003 */  addiu   $t4, $zero, 0x0003         ## $t4 = 00000003
/* 042DC 80AC6F7C 240270C6 */  addiu   $v0, $zero, 0x70C6         ## $v0 = 000070C6
/* 042E0 80AC6F80 314B8000 */  andi    $t3, $t2, 0x8000           ## $t3 = 00000000
/* 042E4 80AC6F84 15600003 */  bne     $t3, $zero, .L80AC6F94     
/* 042E8 80AC6F88 00000000 */  nop
/* 042EC 80AC6F8C 03E00008 */  jr      $ra                        
/* 042F0 80AC6F90 A08C01EB */  sb      $t4, 0x01EB($a0)           ## 000001EB
.L80AC6F94:
/* 042F4 80AC6F94 03E00008 */  jr      $ra                        
/* 042F8 80AC6F98 240270AC */  addiu   $v0, $zero, 0x70AC         ## $v0 = 000070AC
.L80AC6F9C:
/* 042FC 80AC6F9C 11A0000B */  beq     $t5, $zero, .L80AC6FCC     
/* 04300 80AC6FA0 30590200 */  andi    $t9, $v0, 0x0200           ## $t9 = 00000000
/* 04304 80AC6FA4 94AE0EE4 */  lhu     $t6, 0x0EE4($a1)           ## 8015F544
/* 04308 80AC6FA8 24180001 */  addiu   $t8, $zero, 0x0001         ## $t8 = 00000001
/* 0430C 80AC6FAC 240270C5 */  addiu   $v0, $zero, 0x70C5         ## $v0 = 000070C5
/* 04310 80AC6FB0 31CF4000 */  andi    $t7, $t6, 0x4000           ## $t7 = 00000000
/* 04314 80AC6FB4 15E00003 */  bne     $t7, $zero, .L80AC6FC4     
/* 04318 80AC6FB8 00000000 */  nop
/* 0431C 80AC6FBC 03E00008 */  jr      $ra                        
/* 04320 80AC6FC0 A09801EB */  sb      $t8, 0x01EB($a0)           ## 000001EB
.L80AC6FC4:
/* 04324 80AC6FC4 03E00008 */  jr      $ra                        
/* 04328 80AC6FC8 240270AC */  addiu   $v0, $zero, 0x70AC         ## $v0 = 000070AC
.L80AC6FCC:
/* 0432C 80AC6FCC 1320000B */  beq     $t9, $zero, .L80AC6FFC     
/* 04330 80AC6FD0 304B0100 */  andi    $t3, $v0, 0x0100           ## $t3 = 00000000
/* 04334 80AC6FD4 94A80EE4 */  lhu     $t0, 0x0EE4($a1)           ## 8015F544
/* 04338 80AC6FD8 240A0002 */  addiu   $t2, $zero, 0x0002         ## $t2 = 00000002
/* 0433C 80AC6FDC 240270C4 */  addiu   $v0, $zero, 0x70C4         ## $v0 = 000070C4
/* 04340 80AC6FE0 31092000 */  andi    $t1, $t0, 0x2000           ## $t1 = 00000000
/* 04344 80AC6FE4 15200003 */  bne     $t1, $zero, .L80AC6FF4     
/* 04348 80AC6FE8 00000000 */  nop
/* 0434C 80AC6FEC 03E00008 */  jr      $ra                        
/* 04350 80AC6FF0 A08A01EB */  sb      $t2, 0x01EB($a0)           ## 000001EB
.L80AC6FF4:
/* 04354 80AC6FF4 03E00008 */  jr      $ra                        
/* 04358 80AC6FF8 240270AC */  addiu   $v0, $zero, 0x70AC         ## $v0 = 000070AC
.L80AC6FFC:
/* 0435C 80AC6FFC 51600023 */  beql    $t3, $zero, .L80AC708C     
/* 04360 80AC7000 2402009E */  addiu   $v0, $zero, 0x009E         ## $v0 = 0000009E
/* 04364 80AC7004 94AC0EE4 */  lhu     $t4, 0x0EE4($a1)           ## 8015F544
/* 04368 80AC7008 240270A5 */  addiu   $v0, $zero, 0x70A5         ## $v0 = 000070A5
/* 0436C 80AC700C 318D1000 */  andi    $t5, $t4, 0x1000           ## $t5 = 00000000
/* 04370 80AC7010 15A00003 */  bne     $t5, $zero, .L80AC7020     
/* 04374 80AC7014 00000000 */  nop
/* 04378 80AC7018 03E00008 */  jr      $ra                        
/* 0437C 80AC701C A08001EB */  sb      $zero, 0x01EB($a0)         ## 000001EB
.L80AC7020:
/* 04380 80AC7020 03E00008 */  jr      $ra                        
/* 04384 80AC7024 240270AC */  addiu   $v0, $zero, 0x70AC         ## $v0 = 000070AC
.L80AC7028:
/* 04388 80AC7028 94A20EF6 */  lhu     $v0, 0x0EF6($a1)           ## 8015F556
.L80AC702C:
/* 0438C 80AC702C 304E0800 */  andi    $t6, $v0, 0x0800           ## $t6 = 00000000
/* 04390 80AC7030 11C00003 */  beq     $t6, $zero, .L80AC7040     
/* 04394 80AC7034 304F0400 */  andi    $t7, $v0, 0x0400           ## $t7 = 00000000
/* 04398 80AC7038 03E00008 */  jr      $ra                        
/* 0439C 80AC703C 240270AC */  addiu   $v0, $zero, 0x70AC         ## $v0 = 000070AC
.L80AC7040:
/* 043A0 80AC7040 15E0000F */  bne     $t7, $zero, .L80AC7080     
/* 043A4 80AC7044 00000000 */  nop
/* 043A8 80AC7048 94A30EF4 */  lhu     $v1, 0x0EF4($a1)           ## 8015F554
/* 043AC 80AC704C 30590100 */  andi    $t9, $v0, 0x0100           ## $t9 = 00000000
/* 043B0 80AC7050 30780010 */  andi    $t8, $v1, 0x0010           ## $t8 = 00000000
/* 043B4 80AC7054 1700000A */  bne     $t8, $zero, .L80AC7080     
/* 043B8 80AC7058 00000000 */  nop
/* 043BC 80AC705C 17200008 */  bne     $t9, $zero, .L80AC7080     
/* 043C0 80AC7060 30680008 */  andi    $t0, $v1, 0x0008           ## $t0 = 00000000
/* 043C4 80AC7064 15000003 */  bne     $t0, $zero, .L80AC7074     
/* 043C8 80AC7068 24090004 */  addiu   $t1, $zero, 0x0004         ## $t1 = 00000004
/* 043CC 80AC706C 03E00008 */  jr      $ra                        
/* 043D0 80AC7070 240270A1 */  addiu   $v0, $zero, 0x70A1         ## $v0 = 000070A1
.L80AC7074:
/* 043D4 80AC7074 A08901EB */  sb      $t1, 0x01EB($a0)           ## 000001EB
/* 043D8 80AC7078 03E00008 */  jr      $ra                        
/* 043DC 80AC707C 240270A6 */  addiu   $v0, $zero, 0x70A6         ## $v0 = 000070A6
.L80AC7080:
/* 043E0 80AC7080 03E00008 */  jr      $ra                        
/* 043E4 80AC7084 240270C7 */  addiu   $v0, $zero, 0x70C7         ## $v0 = 000070C7
.L80AC7088:
/* 043E8 80AC7088 2402009E */  addiu   $v0, $zero, 0x009E         ## $v0 = 0000009E
.L80AC708C:
/* 043EC 80AC708C 03E00008 */  jr      $ra                        
/* 043F0 80AC7090 00000000 */  nop
