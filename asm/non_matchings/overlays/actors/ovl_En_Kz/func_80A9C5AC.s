glabel func_80A9C5AC
/* 0005C 80A9C5AC 3C0E8012 */  lui     $t6, %hi(gItemSlots+0x2d)
/* 00060 80A9C5B0 91CE7491 */  lbu     $t6, %lo(gItemSlots+0x2d)($t6)
/* 00064 80A9C5B4 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00068 80A9C5B8 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 0006C 80A9C5BC 004E7821 */  addu    $t7, $v0, $t6              
/* 00070 80A9C5C0 91F80074 */  lbu     $t8, 0x0074($t7)           ## 00000074
/* 00074 80A9C5C4 AFA50004 */  sw      $a1, 0x0004($sp)           
/* 00078 80A9C5C8 8C831C44 */  lw      $v1, 0x1C44($a0)           ## 00001C44
/* 0007C 80A9C5CC 2B010035 */  slti    $at, $t8, 0x0035           
/* 00080 80A9C5D0 1420001D */  bne     $at, $zero, .L80A9C648     
/* 00084 80A9C5D4 2419000C */  addiu   $t9, $zero, 0x000C         ## $t9 = 0000000C
/* 00088 80A9C5D8 94590F1E */  lhu     $t9, 0x0F1E($v0)           ## 8015F57E
/* 0008C 80A9C5DC 3C098012 */  lui     $t1, %hi(gBitFlags+8)
/* 00090 80A9C5E0 3C0A8012 */  lui     $t2, %hi(gEquipShifts+2)
/* 00094 80A9C5E4 33280200 */  andi    $t0, $t9, 0x0200           ## $t0 = 00000000
/* 00098 80A9C5E8 1500000C */  bne     $t0, $zero, .L80A9C61C     
/* 0009C 80A9C5EC 3C0E8012 */  lui     $t6, %hi(gBitFlags+0x20)
/* 000A0 80A9C5F0 8D297128 */  lw      $t1, %lo(gBitFlags+8)($t1)
/* 000A4 80A9C5F4 914A71F2 */  lbu     $t2, %lo(gEquipShifts+2)($t2)
/* 000A8 80A9C5F8 944C009C */  lhu     $t4, 0x009C($v0)           ## 8015E6FC
/* 000AC 80A9C5FC 01495804 */  sllv    $t3, $t1, $t2              
/* 000B0 80A9C600 016C6824 */  and     $t5, $t3, $t4              
/* 000B4 80A9C604 11A00003 */  beq     $t5, $zero, .L80A9C614     
/* 000B8 80A9C608 00000000 */  nop
/* 000BC 80A9C60C 03E00008 */  jr      $ra                        
/* 000C0 80A9C610 2402401F */  addiu   $v0, $zero, 0x401F         ## $v0 = 0000401F
.L80A9C614:
/* 000C4 80A9C614 03E00008 */  jr      $ra                        
/* 000C8 80A9C618 24024012 */  addiu   $v0, $zero, 0x4012         ## $v0 = 00004012
.L80A9C61C:
/* 000CC 80A9C61C 8DCE7140 */  lw      $t6, %lo(gBitFlags+0x20)($t6)
/* 000D0 80A9C620 8C4F00A4 */  lw      $t7, 0x00A4($v0)           ## 000040B6
/* 000D4 80A9C624 2403401A */  addiu   $v1, $zero, 0x401A         ## $v1 = 0000401A
/* 000D8 80A9C628 01CFC024 */  and     $t8, $t6, $t7              
/* 000DC 80A9C62C 13000004 */  beq     $t8, $zero, .L80A9C640     
/* 000E0 80A9C630 00000000 */  nop
/* 000E4 80A9C634 24034045 */  addiu   $v1, $zero, 0x4045         ## $v1 = 00004045
/* 000E8 80A9C638 03E00008 */  jr      $ra                        
/* 000EC 80A9C63C 3062FFFF */  andi    $v0, $v1, 0xFFFF           ## $v0 = 00004045
.L80A9C640:
/* 000F0 80A9C640 03E00008 */  jr      $ra                        
/* 000F4 80A9C644 3062FFFF */  andi    $v0, $v1, 0xFFFF           ## $v0 = 00004045
.L80A9C648:
/* 000F8 80A9C648 A0790693 */  sb      $t9, 0x0693($v1)           ## 000046D8
/* 000FC 80A9C64C 24024012 */  addiu   $v0, $zero, 0x4012         ## $v0 = 00004012
/* 00100 80A9C650 03E00008 */  jr      $ra                        
/* 00104 80A9C654 00000000 */  nop
