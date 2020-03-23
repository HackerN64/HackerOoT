.rdata

glabel D_808B207C

    .asciz "../z_bg_spot09_obj.c"
    .balign 4

glabel D_808B2094

    .asciz "../z_bg_spot09_obj.c"
    .balign 4

glabel D_808B20AC
 .asciz "../z_bg_spot09_obj.c"
 .balign 4

.text

glabel BgSpot09Obj_Draw
/* 003A0 808B1E80 27BDFFC0 */  addiu   $sp, $sp, 0xFFC0           ## $sp = FFFFFFC0
/* 003A4 808B1E84 AFB00014 */  sw      $s0, 0x0014($sp)           
/* 003A8 808B1E88 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 003AC 808B1E8C AFBF001C */  sw      $ra, 0x001C($sp)           
/* 003B0 808B1E90 AFB10018 */  sw      $s1, 0x0018($sp)           
/* 003B4 808B1E94 860E001C */  lh      $t6, 0x001C($s0)           ## 0000001C
/* 003B8 808B1E98 00A08825 */  or      $s1, $a1, $zero            ## $s1 = 00000000
/* 003BC 808B1E9C 00A02025 */  or      $a0, $a1, $zero            ## $a0 = 00000000
/* 003C0 808B1EA0 3C05808B */  lui     $a1, %hi(D_808B1FC8)       ## $a1 = 808B0000
/* 003C4 808B1EA4 000E7880 */  sll     $t7, $t6,  2               
/* 003C8 808B1EA8 00AF2821 */  addu    $a1, $a1, $t7              
/* 003CC 808B1EAC 0C00D498 */  jal     Draw_DListOpa
              
/* 003D0 808B1EB0 8CA51FC8 */  lw      $a1, %lo(D_808B1FC8)($a1)  
/* 003D4 808B1EB4 8618001C */  lh      $t8, 0x001C($s0)           ## 0000001C
/* 003D8 808B1EB8 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
/* 003DC 808B1EBC 27A4002C */  addiu   $a0, $sp, 0x002C           ## $a0 = FFFFFFEC
/* 003E0 808B1EC0 17010024 */  bne     $t8, $at, .L808B1F54       
/* 003E4 808B1EC4 3C06808B */  lui     $a2, %hi(D_808B207C)       ## $a2 = 808B0000
/* 003E8 808B1EC8 8E250000 */  lw      $a1, 0x0000($s1)           ## 00000000
/* 003EC 808B1ECC 24C6207C */  addiu   $a2, $a2, %lo(D_808B207C)  ## $a2 = 808B207C
/* 003F0 808B1ED0 24070184 */  addiu   $a3, $zero, 0x0184         ## $a3 = 00000184
/* 003F4 808B1ED4 0C031AB1 */  jal     func_800C6AC4              
/* 003F8 808B1ED8 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 003FC 808B1EDC 0C024F61 */  jal     func_80093D84              
/* 00400 808B1EE0 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 00404 808B1EE4 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 00408 808B1EE8 3C08DA38 */  lui     $t0, 0xDA38                ## $t0 = DA380000
/* 0040C 808B1EEC 35080003 */  ori     $t0, $t0, 0x0003           ## $t0 = DA380003
/* 00410 808B1EF0 24590008 */  addiu   $t9, $v0, 0x0008           ## $t9 = 00000008
/* 00414 808B1EF4 AE1902D0 */  sw      $t9, 0x02D0($s0)           ## 000002D0
/* 00418 808B1EF8 AC480000 */  sw      $t0, 0x0000($v0)           ## 00000000
/* 0041C 808B1EFC 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 00420 808B1F00 3C05808B */  lui     $a1, %hi(D_808B2094)       ## $a1 = 808B0000
/* 00424 808B1F04 24A52094 */  addiu   $a1, $a1, %lo(D_808B2094)  ## $a1 = 808B2094
/* 00428 808B1F08 24060187 */  addiu   $a2, $zero, 0x0187         ## $a2 = 00000187
/* 0042C 808B1F0C 0C0346A2 */  jal     Matrix_NewMtx              
/* 00430 808B1F10 AFA20028 */  sw      $v0, 0x0028($sp)           
/* 00434 808B1F14 8FA30028 */  lw      $v1, 0x0028($sp)           
/* 00438 808B1F18 3C0B0601 */  lui     $t3, 0x0601                ## $t3 = 06010000
/* 0043C 808B1F1C 256B8010 */  addiu   $t3, $t3, 0x8010           ## $t3 = 06008010
/* 00440 808B1F20 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 00444 808B1F24 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 00448 808B1F28 3C0ADE00 */  lui     $t2, 0xDE00                ## $t2 = DE000000
/* 0044C 808B1F2C 3C06808B */  lui     $a2, %hi(D_808B20AC)       ## $a2 = 808B0000
/* 00450 808B1F30 24490008 */  addiu   $t1, $v0, 0x0008           ## $t1 = 00000008
/* 00454 808B1F34 AE0902D0 */  sw      $t1, 0x02D0($s0)           ## 000002D0
/* 00458 808B1F38 AC4B0004 */  sw      $t3, 0x0004($v0)           ## 00000004
/* 0045C 808B1F3C AC4A0000 */  sw      $t2, 0x0000($v0)           ## 00000000
/* 00460 808B1F40 8E250000 */  lw      $a1, 0x0000($s1)           ## 00000000
/* 00464 808B1F44 24C620AC */  addiu   $a2, $a2, %lo(D_808B20AC)  ## $a2 = 808B20AC
/* 00468 808B1F48 27A4002C */  addiu   $a0, $sp, 0x002C           ## $a0 = FFFFFFEC
/* 0046C 808B1F4C 0C031AD5 */  jal     func_800C6B54              
/* 00470 808B1F50 2407018C */  addiu   $a3, $zero, 0x018C         ## $a3 = 0000018C
.L808B1F54:
/* 00474 808B1F54 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 00478 808B1F58 8FB00014 */  lw      $s0, 0x0014($sp)           
/* 0047C 808B1F5C 8FB10018 */  lw      $s1, 0x0018($sp)           
/* 00480 808B1F60 03E00008 */  jr      $ra                        
/* 00484 808B1F64 27BD0040 */  addiu   $sp, $sp, 0x0040           ## $sp = 00000000
/* 00488 808B1F68 00000000 */  nop
/* 0048C 808B1F6C 00000000 */  nop

