.rdata
glabel D_8098C99C
    .asciz "../z_demo_kankyo.c"
    .balign 4

glabel D_8098C9B0
    .asciz "../z_demo_kankyo.c"
    .balign 4

glabel D_8098C9C4
    .asciz "../z_demo_kankyo.c"
    .balign 4

.text
glabel func_8098A9A4
/* 01B24 8098A9A4 27BDFFA8 */  addiu   $sp, $sp, 0xFFA8           ## $sp = FFFFFFA8
/* 01B28 8098A9A8 AFB10020 */  sw      $s1, 0x0020($sp)           
/* 01B2C 8098A9AC 00A08825 */  or      $s1, $a1, $zero            ## $s1 = 00000000
/* 01B30 8098A9B0 AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 01B34 8098A9B4 AFB0001C */  sw      $s0, 0x001C($sp)           
/* 01B38 8098A9B8 AFA40058 */  sw      $a0, 0x0058($sp)           
/* 01B3C 8098A9BC 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 01B40 8098A9C0 3C068099 */  lui     $a2, %hi(D_8098C99C)       ## $a2 = 80990000
/* 01B44 8098A9C4 24C6C99C */  addiu   $a2, $a2, %lo(D_8098C99C)  ## $a2 = 8098C99C
/* 01B48 8098A9C8 27A4003C */  addiu   $a0, $sp, 0x003C           ## $a0 = FFFFFFE4
/* 01B4C 8098A9CC 240705EA */  addiu   $a3, $zero, 0x05EA         ## $a3 = 000005EA
/* 01B50 8098A9D0 0C031AB1 */  jal     Graph_OpenDisps              
/* 01B54 8098A9D4 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 01B58 8098A9D8 922E1D6C */  lbu     $t6, 0x1D6C($s1)           ## 00001D6C
/* 01B5C 8098A9DC 3C0F8016 */  lui     $t7, %hi(gSaveContext+0x1360)
/* 01B60 8098A9E0 11C00005 */  beq     $t6, $zero, .L8098A9F8     
/* 01B64 8098A9E4 00000000 */  nop
/* 01B68 8098A9E8 8DEFF9C0 */  lw      $t7, %lo(gSaveContext+0x1360)($t7)
/* 01B6C 8098A9EC 29E10004 */  slti    $at, $t7, 0x0004           
/* 01B70 8098A9F0 1420002A */  bne     $at, $zero, .L8098AA9C     
/* 01B74 8098A9F4 00000000 */  nop
.L8098A9F8:
/* 01B78 8098A9F8 0C024F61 */  jal     func_80093D84              
/* 01B7C 8098A9FC 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 01B80 8098AA00 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 01B84 8098AA04 3C19DB06 */  lui     $t9, 0xDB06                ## $t9 = DB060000
/* 01B88 8098AA08 37390020 */  ori     $t9, $t9, 0x0020           ## $t9 = DB060020
/* 01B8C 8098AA0C 24580008 */  addiu   $t8, $v0, 0x0008           ## $t8 = 00000008
/* 01B90 8098AA10 AE1802D0 */  sw      $t8, 0x02D0($s0)           ## 000002D0
/* 01B94 8098AA14 AC590000 */  sw      $t9, 0x0000($v0)           ## 00000000
/* 01B98 8098AA18 8E26009C */  lw      $a2, 0x009C($s1)           ## 0000009C
/* 01B9C 8098AA1C 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 01BA0 8098AA20 24080020 */  addiu   $t0, $zero, 0x0020         ## $t0 = 00000020
/* 01BA4 8098AA24 AFA80010 */  sw      $t0, 0x0010($sp)           
/* 01BA8 8098AA28 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 01BAC 8098AA2C 24070040 */  addiu   $a3, $zero, 0x0040         ## $a3 = 00000040
/* 01BB0 8098AA30 AFA20038 */  sw      $v0, 0x0038($sp)           
/* 01BB4 8098AA34 0C0253A7 */  jal     Gfx_TexScroll              
/* 01BB8 8098AA38 30C6007F */  andi    $a2, $a2, 0x007F           ## $a2 = 00000000
/* 01BBC 8098AA3C 8FA30038 */  lw      $v1, 0x0038($sp)           
/* 01BC0 8098AA40 3C0ADA38 */  lui     $t2, 0xDA38                ## $t2 = DA380000
/* 01BC4 8098AA44 354A0003 */  ori     $t2, $t2, 0x0003           ## $t2 = DA380003
/* 01BC8 8098AA48 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 01BCC 8098AA4C 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 01BD0 8098AA50 3C058099 */  lui     $a1, %hi(D_8098C9B0)       ## $a1 = 80990000
/* 01BD4 8098AA54 24A5C9B0 */  addiu   $a1, $a1, %lo(D_8098C9B0)  ## $a1 = 8098C9B0
/* 01BD8 8098AA58 24490008 */  addiu   $t1, $v0, 0x0008           ## $t1 = 00000008
/* 01BDC 8098AA5C AE0902D0 */  sw      $t1, 0x02D0($s0)           ## 000002D0
/* 01BE0 8098AA60 AC4A0000 */  sw      $t2, 0x0000($v0)           ## 00000000
/* 01BE4 8098AA64 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 01BE8 8098AA68 240605F9 */  addiu   $a2, $zero, 0x05F9         ## $a2 = 000005F9
/* 01BEC 8098AA6C 0C0346A2 */  jal     Matrix_NewMtx              
/* 01BF0 8098AA70 AFA20034 */  sw      $v0, 0x0034($sp)           
/* 01BF4 8098AA74 8FA30034 */  lw      $v1, 0x0034($sp)           
/* 01BF8 8098AA78 3C0D0601 */  lui     $t5, %hi(D_06008390)                ## $t5 = 06010000
/* 01BFC 8098AA7C 25AD8390 */  addiu   $t5, $t5, %lo(D_06008390)           ## $t5 = 06008390
/* 01C00 8098AA80 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 01C04 8098AA84 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 01C08 8098AA88 3C0CDE00 */  lui     $t4, 0xDE00                ## $t4 = DE000000
/* 01C0C 8098AA8C 244B0008 */  addiu   $t3, $v0, 0x0008           ## $t3 = 00000008
/* 01C10 8098AA90 AE0B02D0 */  sw      $t3, 0x02D0($s0)           ## 000002D0
/* 01C14 8098AA94 AC4D0004 */  sw      $t5, 0x0004($v0)           ## 00000004
/* 01C18 8098AA98 AC4C0000 */  sw      $t4, 0x0000($v0)           ## 00000000
.L8098AA9C:
/* 01C1C 8098AA9C 3C068099 */  lui     $a2, %hi(D_8098C9C4)       ## $a2 = 80990000
/* 01C20 8098AAA0 24C6C9C4 */  addiu   $a2, $a2, %lo(D_8098C9C4)  ## $a2 = 8098C9C4
/* 01C24 8098AAA4 27A4003C */  addiu   $a0, $sp, 0x003C           ## $a0 = FFFFFFE4
/* 01C28 8098AAA8 8E250000 */  lw      $a1, 0x0000($s1)           ## 00000000
/* 01C2C 8098AAAC 0C031AD5 */  jal     Graph_CloseDisps              
/* 01C30 8098AAB0 240705FE */  addiu   $a3, $zero, 0x05FE         ## $a3 = 000005FE
/* 01C34 8098AAB4 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 01C38 8098AAB8 8FB0001C */  lw      $s0, 0x001C($sp)           
/* 01C3C 8098AABC 8FB10020 */  lw      $s1, 0x0020($sp)           
/* 01C40 8098AAC0 03E00008 */  jr      $ra                        
/* 01C44 8098AAC4 27BD0058 */  addiu   $sp, $sp, 0x0058           ## $sp = 00000000
