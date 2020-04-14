.rdata
glabel D_808BE420
    .asciz "../z_bg_vb_sima.c"
    .balign 4

glabel D_808BE434
    .asciz "../z_bg_vb_sima.c"
    .balign 4

glabel D_808BE448
    .asciz "../z_bg_vb_sima.c"
    .balign 4

.text
glabel BgVbSima_Draw
/* 005C4 808BE324 27BDFFC0 */  addiu   $sp, $sp, 0xFFC0           ## $sp = FFFFFFC0
/* 005C8 808BE328 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 005CC 808BE32C AFB00018 */  sw      $s0, 0x0018($sp)           
/* 005D0 808BE330 AFA40040 */  sw      $a0, 0x0040($sp)           
/* 005D4 808BE334 AFA50044 */  sw      $a1, 0x0044($sp)           
/* 005D8 808BE338 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 005DC 808BE33C 3C06808C */  lui     $a2, %hi(D_808BE420)       ## $a2 = 808C0000
/* 005E0 808BE340 24C6E420 */  addiu   $a2, $a2, %lo(D_808BE420)  ## $a2 = 808BE420
/* 005E4 808BE344 27A4002C */  addiu   $a0, $sp, 0x002C           ## $a0 = FFFFFFEC
/* 005E8 808BE348 2407011D */  addiu   $a3, $zero, 0x011D         ## $a3 = 0000011D
/* 005EC 808BE34C 0C031AB1 */  jal     Graph_OpenDisps              
/* 005F0 808BE350 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 005F4 808BE354 8FAF0044 */  lw      $t7, 0x0044($sp)           
/* 005F8 808BE358 0C024F46 */  jal     func_80093D18              
/* 005FC 808BE35C 8DE40000 */  lw      $a0, 0x0000($t7)           ## 00000000
/* 00600 808BE360 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 00604 808BE364 3C19DA38 */  lui     $t9, 0xDA38                ## $t9 = DA380000
/* 00608 808BE368 37390003 */  ori     $t9, $t9, 0x0003           ## $t9 = DA380003
/* 0060C 808BE36C 24580008 */  addiu   $t8, $v0, 0x0008           ## $t8 = 00000008
/* 00610 808BE370 AE1802C0 */  sw      $t8, 0x02C0($s0)           ## 000002C0
/* 00614 808BE374 AC590000 */  sw      $t9, 0x0000($v0)           ## 00000000
/* 00618 808BE378 8FA80044 */  lw      $t0, 0x0044($sp)           
/* 0061C 808BE37C 3C05808C */  lui     $a1, %hi(D_808BE434)       ## $a1 = 808C0000
/* 00620 808BE380 24A5E434 */  addiu   $a1, $a1, %lo(D_808BE434)  ## $a1 = 808BE434
/* 00624 808BE384 8D040000 */  lw      $a0, 0x0000($t0)           ## 00000000
/* 00628 808BE388 24060123 */  addiu   $a2, $zero, 0x0123         ## $a2 = 00000123
/* 0062C 808BE38C 0C0346A2 */  jal     Matrix_NewMtx              
/* 00630 808BE390 AFA20028 */  sw      $v0, 0x0028($sp)           
/* 00634 808BE394 8FA30028 */  lw      $v1, 0x0028($sp)           
/* 00638 808BE398 3C0B0600 */  lui     $t3, 0x0600                ## $t3 = 06000000
/* 0063C 808BE39C 256B0240 */  addiu   $t3, $t3, 0x0240           ## $t3 = 06000240
/* 00640 808BE3A0 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 00644 808BE3A4 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 00648 808BE3A8 3C0ADE00 */  lui     $t2, 0xDE00                ## $t2 = DE000000
/* 0064C 808BE3AC 3C06808C */  lui     $a2, %hi(D_808BE448)       ## $a2 = 808C0000
/* 00650 808BE3B0 24490008 */  addiu   $t1, $v0, 0x0008           ## $t1 = 00000008
/* 00654 808BE3B4 AE0902C0 */  sw      $t1, 0x02C0($s0)           ## 000002C0
/* 00658 808BE3B8 AC4B0004 */  sw      $t3, 0x0004($v0)           ## 00000004
/* 0065C 808BE3BC AC4A0000 */  sw      $t2, 0x0000($v0)           ## 00000000
/* 00660 808BE3C0 8FAC0044 */  lw      $t4, 0x0044($sp)           
/* 00664 808BE3C4 24C6E448 */  addiu   $a2, $a2, %lo(D_808BE448)  ## $a2 = 808BE448
/* 00668 808BE3C8 27A4002C */  addiu   $a0, $sp, 0x002C           ## $a0 = FFFFFFEC
/* 0066C 808BE3CC 24070128 */  addiu   $a3, $zero, 0x0128         ## $a3 = 00000128
/* 00670 808BE3D0 0C031AD5 */  jal     Graph_CloseDisps              
/* 00674 808BE3D4 8D850000 */  lw      $a1, 0x0000($t4)           ## 00000000
/* 00678 808BE3D8 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 0067C 808BE3DC 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 00680 808BE3E0 27BD0040 */  addiu   $sp, $sp, 0x0040           ## $sp = 00000000
/* 00684 808BE3E4 03E00008 */  jr      $ra                        
/* 00688 808BE3E8 00000000 */  nop
/* 0068C 808BE3EC 00000000 */  nop
