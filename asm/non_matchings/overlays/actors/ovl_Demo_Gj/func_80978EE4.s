.rdata
glabel D_8097BF90
    .asciz "Demo_Gj_Search_Boss_Ganon %d:ガノン発見!!!!\n"
    .balign 4

glabel D_8097BFC0
    .asciz "Demo_Gj_Search_Boss_Ganon %d:ガノン発見出来ず\n"
    .balign 4

.text
glabel func_80978EE4
/* 005B4 80978EE4 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 005B8 80978EE8 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 005BC 80978EEC 8C8E0178 */  lw      $t6, 0x0178($a0)           ## 00000178
/* 005C0 80978EF0 00803025 */  or      $a2, $a0, $zero            ## $a2 = 00000000
/* 005C4 80978EF4 55C00017 */  bnel    $t6, $zero, .L80978F54     
/* 005C8 80978EF8 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 005CC 80978EFC 8CA21C7C */  lw      $v0, 0x1C7C($a1)           ## 00001C7C
/* 005D0 80978F00 3C048098 */  lui     $a0, %hi(D_8097BF90)       ## $a0 = 80980000
/* 005D4 80978F04 2403017A */  addiu   $v1, $zero, 0x017A         ## $v1 = 0000017A
/* 005D8 80978F08 1040000C */  beq     $v0, $zero, .L80978F3C     
/* 005DC 80978F0C 2484BF90 */  addiu   $a0, $a0, %lo(D_8097BF90)  ## $a0 = 8097BF90
/* 005E0 80978F10 844F0000 */  lh      $t7, 0x0000($v0)           ## 00000000
.L80978F14:
/* 005E4 80978F14 546F0007 */  bnel    $v1, $t7, .L80978F34       
/* 005E8 80978F18 8C420124 */  lw      $v0, 0x0124($v0)           ## 00000124
/* 005EC 80978F1C ACC20178 */  sw      $v0, 0x0178($a2)           ## 00000178
/* 005F0 80978F20 0C00084C */  jal     osSyncPrintf
              
/* 005F4 80978F24 84C5001C */  lh      $a1, 0x001C($a2)           ## 0000001C
/* 005F8 80978F28 10000009 */  beq     $zero, $zero, .L80978F50   
/* 005FC 80978F2C 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
/* 00600 80978F30 8C420124 */  lw      $v0, 0x0124($v0)           ## 00000125
.L80978F34:
/* 00604 80978F34 5440FFF7 */  bnel    $v0, $zero, .L80978F14     
/* 00608 80978F38 844F0000 */  lh      $t7, 0x0000($v0)           ## 00000001
.L80978F3C:
/* 0060C 80978F3C 3C048098 */  lui     $a0, %hi(D_8097BFC0)       ## $a0 = 80980000
/* 00610 80978F40 2484BFC0 */  addiu   $a0, $a0, %lo(D_8097BFC0)  ## $a0 = 8097BFC0
/* 00614 80978F44 0C00084C */  jal     osSyncPrintf
              
/* 00618 80978F48 84C5001C */  lh      $a1, 0x001C($a2)           ## 0000001C
/* 0061C 80978F4C 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L80978F50:
/* 00620 80978F50 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L80978F54:
/* 00624 80978F54 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 00628 80978F58 03E00008 */  jr      $ra                        
/* 0062C 80978F5C 00000000 */  nop
