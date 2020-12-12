.rdata
glabel D_80888F84
    .asciz "../z_bg_hidan_hamstep.c"
    .balign 4

glabel D_80888F9C
    .asciz "../z_bg_hidan_hamstep.c"
    .balign 4

glabel D_80888FB4
    .asciz "../z_bg_hidan_hamstep.c"
    .balign 4

.text
glabel BgHidanHamstep_Draw
/* 00C28 80888C68 27BDFFB8 */  addiu   $sp, $sp, 0xFFB8           ## $sp = FFFFFFB8
/* 00C2C 80888C6C AFBF001C */  sw      $ra, 0x001C($sp)           
/* 00C30 80888C70 AFB00018 */  sw      $s0, 0x0018($sp)           
/* 00C34 80888C74 AFA40048 */  sw      $a0, 0x0048($sp)           
/* 00C38 80888C78 AFA5004C */  sw      $a1, 0x004C($sp)           
/* 00C3C 80888C7C 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 00C40 80888C80 3C068089 */  lui     $a2, %hi(D_80888F84)       ## $a2 = 80890000
/* 00C44 80888C84 24C68F84 */  addiu   $a2, $a2, %lo(D_80888F84)  ## $a2 = 80888F84
/* 00C48 80888C88 27A40034 */  addiu   $a0, $sp, 0x0034           ## $a0 = FFFFFFEC
/* 00C4C 80888C8C 2407030E */  addiu   $a3, $zero, 0x030E         ## $a3 = 0000030E
/* 00C50 80888C90 0C031AB1 */  jal     Graph_OpenDisps              
/* 00C54 80888C94 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 00C58 80888C98 8FAF004C */  lw      $t7, 0x004C($sp)           
/* 00C5C 80888C9C 0C024F46 */  jal     func_80093D18              
/* 00C60 80888CA0 8DE40000 */  lw      $a0, 0x0000($t7)           ## 00000000
/* 00C64 80888CA4 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 00C68 80888CA8 3C19DA38 */  lui     $t9, 0xDA38                ## $t9 = DA380000
/* 00C6C 80888CAC 37390003 */  ori     $t9, $t9, 0x0003           ## $t9 = DA380003
/* 00C70 80888CB0 24580008 */  addiu   $t8, $v0, 0x0008           ## $t8 = 00000008
/* 00C74 80888CB4 AE1802C0 */  sw      $t8, 0x02C0($s0)           ## 000002C0
/* 00C78 80888CB8 AC590000 */  sw      $t9, 0x0000($v0)           ## 00000000
/* 00C7C 80888CBC 8FA8004C */  lw      $t0, 0x004C($sp)           
/* 00C80 80888CC0 3C058089 */  lui     $a1, %hi(D_80888F9C)       ## $a1 = 80890000
/* 00C84 80888CC4 24A58F9C */  addiu   $a1, $a1, %lo(D_80888F9C)  ## $a1 = 80888F9C
/* 00C88 80888CC8 8D040000 */  lw      $a0, 0x0000($t0)           ## 00000000
/* 00C8C 80888CCC 24060313 */  addiu   $a2, $zero, 0x0313         ## $a2 = 00000313
/* 00C90 80888CD0 0C0346A2 */  jal     Matrix_NewMtx              
/* 00C94 80888CD4 AFA20030 */  sw      $v0, 0x0030($sp)           
/* 00C98 80888CD8 8FA30030 */  lw      $v1, 0x0030($sp)           
/* 00C9C 80888CDC 3C068089 */  lui     $a2, %hi(D_80888FB4)       ## $a2 = 80890000
/* 00CA0 80888CE0 3C0DDE00 */  lui     $t5, 0xDE00                ## $t5 = DE000000
/* 00CA4 80888CE4 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 00CA8 80888CE8 8FA90048 */  lw      $t1, 0x0048($sp)           
/* 00CAC 80888CEC 3C18DE00 */  lui     $t8, 0xDE00                ## $t8 = DE000000
/* 00CB0 80888CF0 24C68FB4 */  addiu   $a2, $a2, %lo(D_80888FB4)  ## $a2 = 80888FB4
/* 00CB4 80888CF4 852A001C */  lh      $t2, 0x001C($t1)           ## 0000001C
/* 00CB8 80888CF8 27A40034 */  addiu   $a0, $sp, 0x0034           ## $a0 = FFFFFFEC
/* 00CBC 80888CFC 314B00FF */  andi    $t3, $t2, 0x00FF           ## $t3 = 00000000
/* 00CC0 80888D00 5560000A */  bnel    $t3, $zero, .L80888D2C     
/* 00CC4 80888D04 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 00CC8 80888D08 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 00CCC 80888D0C 3C0E0601 */  lui     $t6, %hi(D_0600A668)                ## $t6 = 06010000
/* 00CD0 80888D10 25CEA668 */  addiu   $t6, $t6, %lo(D_0600A668)           ## $t6 = 0600A668
/* 00CD4 80888D14 244C0008 */  addiu   $t4, $v0, 0x0008           ## $t4 = 00000008
/* 00CD8 80888D18 AE0C02C0 */  sw      $t4, 0x02C0($s0)           ## 000002C0
/* 00CDC 80888D1C AC4E0004 */  sw      $t6, 0x0004($v0)           ## 00000004
/* 00CE0 80888D20 10000008 */  beq     $zero, $zero, .L80888D44   
/* 00CE4 80888D24 AC4D0000 */  sw      $t5, 0x0000($v0)           ## 00000000
/* 00CE8 80888D28 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
.L80888D2C:
/* 00CEC 80888D2C 3C190601 */  lui     $t9, %hi(D_0600A548)                ## $t9 = 06010000
/* 00CF0 80888D30 2739A548 */  addiu   $t9, $t9, %lo(D_0600A548)           ## $t9 = 0600A548
/* 00CF4 80888D34 244F0008 */  addiu   $t7, $v0, 0x0008           ## $t7 = 00000008
/* 00CF8 80888D38 AE0F02C0 */  sw      $t7, 0x02C0($s0)           ## 000002C0
/* 00CFC 80888D3C AC590004 */  sw      $t9, 0x0004($v0)           ## 00000004
/* 00D00 80888D40 AC580000 */  sw      $t8, 0x0000($v0)           ## 00000000
.L80888D44:
/* 00D04 80888D44 8FA8004C */  lw      $t0, 0x004C($sp)           
/* 00D08 80888D48 2407031C */  addiu   $a3, $zero, 0x031C         ## $a3 = 0000031C
/* 00D0C 80888D4C 0C031AD5 */  jal     Graph_CloseDisps              
/* 00D10 80888D50 8D050000 */  lw      $a1, 0x0000($t0)           ## 00000000
/* 00D14 80888D54 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 00D18 80888D58 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 00D1C 80888D5C 27BD0048 */  addiu   $sp, $sp, 0x0048           ## $sp = 00000000
/* 00D20 80888D60 03E00008 */  jr      $ra                        
/* 00D24 80888D64 00000000 */  nop
/* 00D28 80888D68 00000000 */  nop
.L80888D6C:
/* 00D2C 80888D6C 00000000 */  nop
