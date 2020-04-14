.rdata
glabel D_808B2E70
    .asciz "../z_bg_spot11_oasis.c"
    .balign 4

glabel D_808B2E88
    .asciz "../z_bg_spot11_oasis.c"
    .balign 4

glabel D_808B2EA0
    .asciz "../z_bg_spot11_oasis.c"
    .balign 4

.text
glabel func_808B2CA8
/* 004B8 808B2CA8 27BDFF90 */  addiu   $sp, $sp, 0xFF90           ## $sp = FFFFFF90
/* 004BC 808B2CAC 3C0E0001 */  lui     $t6, 0x0001                ## $t6 = 00010000
/* 004C0 808B2CB0 AFBF003C */  sw      $ra, 0x003C($sp)           
/* 004C4 808B2CB4 AFB10038 */  sw      $s1, 0x0038($sp)           
/* 004C8 808B2CB8 AFB00034 */  sw      $s0, 0x0034($sp)           
/* 004CC 808B2CBC AFA40070 */  sw      $a0, 0x0070($sp)           
/* 004D0 808B2CC0 01C57021 */  addu    $t6, $t6, $a1              
/* 004D4 808B2CC4 8DCE1DE4 */  lw      $t6, 0x1DE4($t6)           ## 00011DE4
/* 004D8 808B2CC8 00A08825 */  or      $s1, $a1, $zero            ## $s1 = 00000000
/* 004DC 808B2CCC 3C06808B */  lui     $a2, %hi(D_808B2E70)       ## $a2 = 808B0000
/* 004E0 808B2CD0 AFAE006C */  sw      $t6, 0x006C($sp)           
/* 004E4 808B2CD4 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 004E8 808B2CD8 24C62E70 */  addiu   $a2, $a2, %lo(D_808B2E70)  ## $a2 = 808B2E70
/* 004EC 808B2CDC 27A40058 */  addiu   $a0, $sp, 0x0058           ## $a0 = FFFFFFE8
/* 004F0 808B2CE0 24070147 */  addiu   $a3, $zero, 0x0147         ## $a3 = 00000147
/* 004F4 808B2CE4 0C031AB1 */  jal     Graph_OpenDisps              
/* 004F8 808B2CE8 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 004FC 808B2CEC 0C024F61 */  jal     func_80093D84              
/* 00500 808B2CF0 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 00504 808B2CF4 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 00508 808B2CF8 3C18DA38 */  lui     $t8, 0xDA38                ## $t8 = DA380000
/* 0050C 808B2CFC 37180003 */  ori     $t8, $t8, 0x0003           ## $t8 = DA380003
/* 00510 808B2D00 244F0008 */  addiu   $t7, $v0, 0x0008           ## $t7 = 00000008
/* 00514 808B2D04 AE0F02D0 */  sw      $t7, 0x02D0($s0)           ## 000002D0
/* 00518 808B2D08 AC580000 */  sw      $t8, 0x0000($v0)           ## 00000000
/* 0051C 808B2D0C 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 00520 808B2D10 3C05808B */  lui     $a1, %hi(D_808B2E88)       ## $a1 = 808B0000
/* 00524 808B2D14 24A52E88 */  addiu   $a1, $a1, %lo(D_808B2E88)  ## $a1 = 808B2E88
/* 00528 808B2D18 2406014B */  addiu   $a2, $zero, 0x014B         ## $a2 = 0000014B
/* 0052C 808B2D1C 0C0346A2 */  jal     Matrix_NewMtx              
/* 00530 808B2D20 AFA20054 */  sw      $v0, 0x0054($sp)           
/* 00534 808B2D24 8FA30054 */  lw      $v1, 0x0054($sp)           
/* 00538 808B2D28 3C0ADB06 */  lui     $t2, 0xDB06                ## $t2 = DB060000
/* 0053C 808B2D2C 354A0020 */  ori     $t2, $t2, 0x0020           ## $t2 = DB060020
/* 00540 808B2D30 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 00544 808B2D34 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 00548 808B2D38 8FA9006C */  lw      $t1, 0x006C($sp)           
/* 0054C 808B2D3C 240B007F */  addiu   $t3, $zero, 0x007F         ## $t3 = 0000007F
/* 00550 808B2D40 24590008 */  addiu   $t9, $v0, 0x0008           ## $t9 = 00000008
/* 00554 808B2D44 AE1902D0 */  sw      $t9, 0x02D0($s0)           ## 000002D0
/* 00558 808B2D48 AC4A0000 */  sw      $t2, 0x0000($v0)           ## 00000000
/* 0055C 808B2D4C 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 00560 808B2D50 240C0020 */  addiu   $t4, $zero, 0x0020         ## $t4 = 00000020
/* 00564 808B2D54 240D0020 */  addiu   $t5, $zero, 0x0020         ## $t5 = 00000020
/* 00568 808B2D58 240E0001 */  addiu   $t6, $zero, 0x0001         ## $t6 = 00000001
/* 0056C 808B2D5C 240F0020 */  addiu   $t7, $zero, 0x0020         ## $t7 = 00000020
/* 00570 808B2D60 24180020 */  addiu   $t8, $zero, 0x0020         ## $t8 = 00000020
/* 00574 808B2D64 3123007F */  andi    $v1, $t1, 0x007F           ## $v1 = 00000000
/* 00578 808B2D68 3127007F */  andi    $a3, $t1, 0x007F           ## $a3 = 00000000
/* 0057C 808B2D6C AFA70020 */  sw      $a3, 0x0020($sp)           
/* 00580 808B2D70 01633023 */  subu    $a2, $t3, $v1              
/* 00584 808B2D74 AFA3001C */  sw      $v1, 0x001C($sp)           
/* 00588 808B2D78 AFB80028 */  sw      $t8, 0x0028($sp)           
/* 0058C 808B2D7C AFAF0024 */  sw      $t7, 0x0024($sp)           
/* 00590 808B2D80 AFAE0018 */  sw      $t6, 0x0018($sp)           
/* 00594 808B2D84 AFAD0014 */  sw      $t5, 0x0014($sp)           
/* 00598 808B2D88 AFAC0010 */  sw      $t4, 0x0010($sp)           
/* 0059C 808B2D8C 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 005A0 808B2D90 0C0253D0 */  jal     Gfx_TwoTexScroll              
/* 005A4 808B2D94 AFA20050 */  sw      $v0, 0x0050($sp)           
/* 005A8 808B2D98 8FA80050 */  lw      $t0, 0x0050($sp)           
/* 005AC 808B2D9C 3C0B0600 */  lui     $t3, 0x0600                ## $t3 = 06000000
/* 005B0 808B2DA0 256B0870 */  addiu   $t3, $t3, 0x0870           ## $t3 = 06000870
/* 005B4 808B2DA4 AD020004 */  sw      $v0, 0x0004($t0)           ## 00000004
/* 005B8 808B2DA8 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 005BC 808B2DAC 3C0ADE00 */  lui     $t2, 0xDE00                ## $t2 = DE000000
/* 005C0 808B2DB0 3C06808B */  lui     $a2, %hi(D_808B2EA0)       ## $a2 = 808B0000
/* 005C4 808B2DB4 24590008 */  addiu   $t9, $v0, 0x0008           ## $t9 = 00000008
/* 005C8 808B2DB8 AE1902D0 */  sw      $t9, 0x02D0($s0)           ## 000002D0
/* 005CC 808B2DBC AC4B0004 */  sw      $t3, 0x0004($v0)           ## 00000004
/* 005D0 808B2DC0 AC4A0000 */  sw      $t2, 0x0000($v0)           ## 00000000
/* 005D4 808B2DC4 8E250000 */  lw      $a1, 0x0000($s1)           ## 00000000
/* 005D8 808B2DC8 24C62EA0 */  addiu   $a2, $a2, %lo(D_808B2EA0)  ## $a2 = 808B2EA0
/* 005DC 808B2DCC 27A40058 */  addiu   $a0, $sp, 0x0058           ## $a0 = FFFFFFE8
/* 005E0 808B2DD0 0C031AD5 */  jal     Graph_CloseDisps              
/* 005E4 808B2DD4 2407015A */  addiu   $a3, $zero, 0x015A         ## $a3 = 0000015A
/* 005E8 808B2DD8 8FBF003C */  lw      $ra, 0x003C($sp)           
/* 005EC 808B2DDC 8FB00034 */  lw      $s0, 0x0034($sp)           
/* 005F0 808B2DE0 8FB10038 */  lw      $s1, 0x0038($sp)           
/* 005F4 808B2DE4 03E00008 */  jr      $ra                        
/* 005F8 808B2DE8 27BD0070 */  addiu   $sp, $sp, 0x0070           ## $sp = 00000000
/* 005FC 808B2DEC 00000000 */  nop
