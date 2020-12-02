.rdata
glabel D_80A328A8
    .asciz "../z_en_ge1.c"
    .balign 4

glabel D_80A328B8
    .asciz "../z_en_ge1.c"
    .balign 4

.text
glabel EnGe1_Draw
/* 01CD8 80A32648 27BDFFA8 */  addiu   $sp, $sp, 0xFFA8           ## $sp = FFFFFFA8
/* 01CDC 80A3264C AFBF002C */  sw      $ra, 0x002C($sp)
/* 01CE0 80A32650 AFB00028 */  sw      $s0, 0x0028($sp)
/* 01CE4 80A32654 AFA5005C */  sw      $a1, 0x005C($sp)
/* 01CE8 80A32658 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 01CEC 80A3265C 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 01CF0 80A32660 3C0680A3 */  lui     $a2, %hi(D_80A328A8)       ## $a2 = 80A30000
/* 01CF4 80A32664 24C628A8 */  addiu   $a2, $a2, %lo(D_80A328A8)  ## $a2 = 80A328A8
/* 01CF8 80A32668 27A4003C */  addiu   $a0, $sp, 0x003C           ## $a0 = FFFFFFE4
/* 01CFC 80A3266C 240705A2 */  addiu   $a3, $zero, 0x05A2         ## $a3 = 000005A2
/* 01D00 80A32670 0C031AB1 */  jal     Graph_OpenDisps
/* 01D04 80A32674 AFA5004C */  sw      $a1, 0x004C($sp)
/* 01D08 80A32678 8FAF005C */  lw      $t7, 0x005C($sp)
/* 01D0C 80A3267C 0C0250F2 */  jal     func_800943C8
/* 01D10 80A32680 8DE40000 */  lw      $a0, 0x0000($t7)           ## 00000000
/* 01D14 80A32684 8FA5004C */  lw      $a1, 0x004C($sp)
/* 01D18 80A32688 3C19DB06 */  lui     $t9, 0xDB06                ## $t9 = DB060000
/* 01D1C 80A3268C 37390020 */  ori     $t9, $t9, 0x0020           ## $t9 = DB060020
/* 01D20 80A32690 8CA302C0 */  lw      $v1, 0x02C0($a1)           ## 000002C0
/* 01D24 80A32694 3C0480A3 */  lui     $a0, %hi(D_80A327B4)       ## $a0 = 80A30000
/* 01D28 80A32698 3C0E8016 */  lui     $t6, %hi(gSegments)
/* 01D2C 80A3269C 24780008 */  addiu   $t8, $v1, 0x0008           ## $t8 = 00000008
/* 01D30 80A326A0 ACB802C0 */  sw      $t8, 0x02C0($a1)           ## 000002C0
/* 01D34 80A326A4 AC790000 */  sw      $t9, 0x0000($v1)           ## 00000000
/* 01D38 80A326A8 860802A8 */  lh      $t0, 0x02A8($s0)           ## 000002A8
/* 01D3C 80A326AC 3C0100FF */  lui     $at, 0x00FF                ## $at = 00FF0000
/* 01D40 80A326B0 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = 00FFFFFF
/* 01D44 80A326B4 00084880 */  sll     $t1, $t0,  2
/* 01D48 80A326B8 00892021 */  addu    $a0, $a0, $t1
/* 01D4C 80A326BC 8C8427B4 */  lw      $a0, %lo(D_80A327B4)($a0)
/* 01D50 80A326C0 3C0880A3 */  lui     $t0, %hi(func_80A32598)    ## $t0 = 80A30000
/* 01D54 80A326C4 3C1980A3 */  lui     $t9, %hi(func_80A32444)    ## $t9 = 80A30000
/* 01D58 80A326C8 00045900 */  sll     $t3, $a0,  4
/* 01D5C 80A326CC 000B6702 */  srl     $t4, $t3, 28
/* 01D60 80A326D0 000C6880 */  sll     $t5, $t4,  2
/* 01D64 80A326D4 01CD7021 */  addu    $t6, $t6, $t5
/* 01D68 80A326D8 8DCE6FA8 */  lw      $t6, %lo(gSegments)($t6)
/* 01D6C 80A326DC 00815024 */  and     $t2, $a0, $at
/* 01D70 80A326E0 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 01D74 80A326E4 014E7821 */  addu    $t7, $t2, $t6
/* 01D78 80A326E8 01E1C021 */  addu    $t8, $t7, $at
/* 01D7C 80A326EC AC780004 */  sw      $t8, 0x0004($v1)           ## 00000004
/* 01D80 80A326F0 9207019A */  lbu     $a3, 0x019A($s0)           ## 0000019A
/* 01D84 80A326F4 8E0601B8 */  lw      $a2, 0x01B8($s0)           ## 000001B8
/* 01D88 80A326F8 8E05019C */  lw      $a1, 0x019C($s0)           ## 0000019C
/* 01D8C 80A326FC 27392444 */  addiu   $t9, $t9, %lo(func_80A32444) ## $t9 = 80A32444
/* 01D90 80A32700 25082598 */  addiu   $t0, $t0, %lo(func_80A32598) ## $t0 = 80A32598
/* 01D94 80A32704 AFA80014 */  sw      $t0, 0x0014($sp)
/* 01D98 80A32708 AFB90010 */  sw      $t9, 0x0010($sp)
/* 01D9C 80A3270C AFB00018 */  sw      $s0, 0x0018($sp)
/* 01DA0 80A32710 0C0286B2 */  jal     SkelAnime_DrawFlexOpa
/* 01DA4 80A32714 8FA4005C */  lw      $a0, 0x005C($sp)
/* 01DA8 80A32718 8FA9005C */  lw      $t1, 0x005C($sp)
/* 01DAC 80A3271C 3C0680A3 */  lui     $a2, %hi(D_80A328B8)       ## $a2 = 80A30000
/* 01DB0 80A32720 24C628B8 */  addiu   $a2, $a2, %lo(D_80A328B8)  ## $a2 = 80A328B8
/* 01DB4 80A32724 27A4003C */  addiu   $a0, $sp, 0x003C           ## $a0 = FFFFFFE4
/* 01DB8 80A32728 240705B3 */  addiu   $a3, $zero, 0x05B3         ## $a3 = 000005B3
/* 01DBC 80A3272C 0C031AD5 */  jal     Graph_CloseDisps
/* 01DC0 80A32730 8D250000 */  lw      $a1, 0x0000($t1)           ## 00000000
/* 01DC4 80A32734 8FBF002C */  lw      $ra, 0x002C($sp)
/* 01DC8 80A32738 8FB00028 */  lw      $s0, 0x0028($sp)
/* 01DCC 80A3273C 27BD0058 */  addiu   $sp, $sp, 0x0058           ## $sp = 00000000
/* 01DD0 80A32740 03E00008 */  jr      $ra
/* 01DD4 80A32744 00000000 */  nop
/* 01DD8 80A32748 00000000 */  nop
/* 01DDC 80A3274C 00000000 */  nop
