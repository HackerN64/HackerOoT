.rdata
glabel D_80B2D044
    .asciz "../z_en_viewer.c"
    .balign 4

glabel D_80B2D058
    .asciz "../z_en_viewer.c"
    .balign 4

glabel D_80B2D06C
    .asciz "../z_en_viewer.c"
    .balign 4

.text
glabel func_80B2B364
/* 01164 80B2B364 27BDFFC0 */  addiu   $sp, $sp, 0xFFC0           ## $sp = FFFFFFC0
/* 01168 80B2B368 2401000B */  addiu   $at, $zero, 0x000B         ## $at = 0000000B
/* 0116C 80B2B36C AFBF001C */  sw      $ra, 0x001C($sp)           
/* 01170 80B2B370 AFB00018 */  sw      $s0, 0x0018($sp)           
/* 01174 80B2B374 AFA40040 */  sw      $a0, 0x0040($sp)           
/* 01178 80B2B378 AFA60048 */  sw      $a2, 0x0048($sp)           
/* 0117C 80B2B37C 14A10035 */  bne     $a1, $at, .L80B2B454       
/* 01180 80B2B380 AFA7004C */  sw      $a3, 0x004C($sp)           
/* 01184 80B2B384 8C850000 */  lw      $a1, 0x0000($a0)           ## 00000000
/* 01188 80B2B388 3C0680B3 */  lui     $a2, %hi(D_80B2D044)       ## $a2 = 80B30000
/* 0118C 80B2B38C 24C6D044 */  addiu   $a2, $a2, %lo(D_80B2D044)  ## $a2 = 80B2D044
/* 01190 80B2B390 27A4002C */  addiu   $a0, $sp, 0x002C           ## $a0 = FFFFFFEC
/* 01194 80B2B394 24070555 */  addiu   $a3, $zero, 0x0555         ## $a3 = 00000555
/* 01198 80B2B398 0C031AB1 */  jal     Graph_OpenDisps              
/* 0119C 80B2B39C 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 011A0 80B2B3A0 8FAF0040 */  lw      $t7, 0x0040($sp)           
/* 011A4 80B2B3A4 0C024F61 */  jal     func_80093D84              
/* 011A8 80B2B3A8 8DE40000 */  lw      $a0, 0x0000($t7)           ## 00000000
/* 011AC 80B2B3AC 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 011B0 80B2B3B0 3C19DA38 */  lui     $t9, 0xDA38                ## $t9 = DA380000
/* 011B4 80B2B3B4 37390003 */  ori     $t9, $t9, 0x0003           ## $t9 = DA380003
/* 011B8 80B2B3B8 24580008 */  addiu   $t8, $v0, 0x0008           ## $t8 = 00000008
/* 011BC 80B2B3BC AE1802D0 */  sw      $t8, 0x02D0($s0)           ## 000002D0
/* 011C0 80B2B3C0 AC590000 */  sw      $t9, 0x0000($v0)           ## 00000000
/* 011C4 80B2B3C4 8FA80040 */  lw      $t0, 0x0040($sp)           
/* 011C8 80B2B3C8 3C0580B3 */  lui     $a1, %hi(D_80B2D058)       ## $a1 = 80B30000
/* 011CC 80B2B3CC 24A5D058 */  addiu   $a1, $a1, %lo(D_80B2D058)  ## $a1 = 80B2D058
/* 011D0 80B2B3D0 8D040000 */  lw      $a0, 0x0000($t0)           ## 00000000
/* 011D4 80B2B3D4 2406055A */  addiu   $a2, $zero, 0x055A         ## $a2 = 0000055A
/* 011D8 80B2B3D8 0C0346A2 */  jal     Matrix_NewMtx              
/* 011DC 80B2B3DC AFA20028 */  sw      $v0, 0x0028($sp)           
/* 011E0 80B2B3E0 8FA30028 */  lw      $v1, 0x0028($sp)           
/* 011E4 80B2B3E4 3C040601 */  lui     $a0, %hi(D_0600BE90)                ## $a0 = 06010000
/* 011E8 80B2B3E8 2484BE90 */  addiu   $a0, $a0, %lo(D_0600BE90)           ## $a0 = 0600BE90
/* 011EC 80B2B3EC AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 011F0 80B2B3F0 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 011F4 80B2B3F4 00045900 */  sll     $t3, $a0,  4               
/* 011F8 80B2B3F8 000B6702 */  srl     $t4, $t3, 28               
/* 011FC 80B2B3FC 24490008 */  addiu   $t1, $v0, 0x0008           ## $t1 = 00000008
/* 01200 80B2B400 AE0902D0 */  sw      $t1, 0x02D0($s0)           ## 000002D0
/* 01204 80B2B404 000C6880 */  sll     $t5, $t4,  2               
/* 01208 80B2B408 3C0ADE00 */  lui     $t2, 0xDE00                ## $t2 = DE000000
/* 0120C 80B2B40C 3C0E8016 */  lui     $t6, %hi(gSegments)
/* 01210 80B2B410 01CD7021 */  addu    $t6, $t6, $t5              
/* 01214 80B2B414 3C0100FF */  lui     $at, 0x00FF                ## $at = 00FF0000
/* 01218 80B2B418 AC4A0000 */  sw      $t2, 0x0000($v0)           ## 00000000
/* 0121C 80B2B41C 8DCE6FA8 */  lw      $t6, %lo(gSegments)($t6)
/* 01220 80B2B420 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = 00FFFFFF
/* 01224 80B2B424 00817824 */  and     $t7, $a0, $at              
/* 01228 80B2B428 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 0122C 80B2B42C 01CFC021 */  addu    $t8, $t6, $t7              
/* 01230 80B2B430 0301C821 */  addu    $t9, $t8, $at              
/* 01234 80B2B434 AC590004 */  sw      $t9, 0x0004($v0)           ## 00000004
/* 01238 80B2B438 8FA80040 */  lw      $t0, 0x0040($sp)           
/* 0123C 80B2B43C 3C0680B3 */  lui     $a2, %hi(D_80B2D06C)       ## $a2 = 80B30000
/* 01240 80B2B440 24C6D06C */  addiu   $a2, $a2, %lo(D_80B2D06C)  ## $a2 = 80B2D06C
/* 01244 80B2B444 27A4002C */  addiu   $a0, $sp, 0x002C           ## $a0 = FFFFFFEC
/* 01248 80B2B448 2407055C */  addiu   $a3, $zero, 0x055C         ## $a3 = 0000055C
/* 0124C 80B2B44C 0C031AD5 */  jal     Graph_CloseDisps              
/* 01250 80B2B450 8D050000 */  lw      $a1, 0x0000($t0)           ## 00000000
.L80B2B454:
/* 01254 80B2B454 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 01258 80B2B458 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 0125C 80B2B45C 27BD0040 */  addiu   $sp, $sp, 0x0040           ## $sp = 00000000
/* 01260 80B2B460 03E00008 */  jr      $ra                        
/* 01264 80B2B464 00000000 */  nop
