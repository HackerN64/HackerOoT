.rdata
glabel D_80894FA0
    .asciz "Ｅｒｒｏｒ : Mir_Ray 発生失敗(%s %d)(arg_data 0x%04x)\n"
    .balign 4

glabel D_80894FD8
    .asciz "../z_bg_jya_bombchuiwa.c"
    .balign 4

.text
glabel func_80894A44
/* 005A4 80894A44 27BDFFC8 */  addiu   $sp, $sp, 0xFFC8           ## $sp = FFFFFFC8
/* 005A8 80894A48 3C014319 */  lui     $at, 0x4319                ## $at = 43190000
/* 005AC 80894A4C 44812000 */  mtc1    $at, $f4                   ## $f4 = 153.00
/* 005B0 80894A50 AFBF0034 */  sw      $ra, 0x0034($sp)           
/* 005B4 80894A54 AFB00030 */  sw      $s0, 0x0030($sp)           
/* 005B8 80894A58 AFA5003C */  sw      $a1, 0x003C($sp)           
/* 005BC 80894A5C 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 005C0 80894A60 AC80014C */  sw      $zero, 0x014C($a0)         ## 0000014C
/* 005C4 80894A64 24050004 */  addiu   $a1, $zero, 0x0004         ## $a1 = 00000004
/* 005C8 80894A68 0C22513D */  jal     func_808944F4              
/* 005CC 80894A6C E48401B0 */  swc1    $f4, 0x01B0($a0)           ## 000001B0
/* 005D0 80894A70 C6060028 */  lwc1    $f6, 0x0028($s0)           ## 00000028
/* 005D4 80894A74 8E070024 */  lw      $a3, 0x0024($s0)           ## 00000024
/* 005D8 80894A78 8FA5003C */  lw      $a1, 0x003C($sp)           
/* 005DC 80894A7C E7A60010 */  swc1    $f6, 0x0010($sp)           
/* 005E0 80894A80 C608002C */  lwc1    $f8, 0x002C($s0)           ## 0000002C
/* 005E4 80894A84 AFA00024 */  sw      $zero, 0x0024($sp)         
/* 005E8 80894A88 AFA00020 */  sw      $zero, 0x0020($sp)         
/* 005EC 80894A8C AFA0001C */  sw      $zero, 0x001C($sp)         
/* 005F0 80894A90 AFA00018 */  sw      $zero, 0x0018($sp)         
/* 005F4 80894A94 240600B7 */  addiu   $a2, $zero, 0x00B7         ## $a2 = 000000B7
/* 005F8 80894A98 24A41C24 */  addiu   $a0, $a1, 0x1C24           ## $a0 = 00001C24
/* 005FC 80894A9C 0C00C7D4 */  jal     Actor_Spawn
              ## ActorSpawn
/* 00600 80894AA0 E7A80014 */  swc1    $f8, 0x0014($sp)           
/* 00604 80894AA4 14400007 */  bne     $v0, $zero, .L80894AC4     
/* 00608 80894AA8 3C048089 */  lui     $a0, %hi(D_80894FA0)       ## $a0 = 80890000
/* 0060C 80894AAC 3C058089 */  lui     $a1, %hi(D_80894FD8)       ## $a1 = 80890000
/* 00610 80894AB0 24A54FD8 */  addiu   $a1, $a1, %lo(D_80894FD8)  ## $a1 = 80894FD8
/* 00614 80894AB4 24844FA0 */  addiu   $a0, $a0, %lo(D_80894FA0)  ## $a0 = 80894FA0
/* 00618 80894AB8 2406019A */  addiu   $a2, $zero, 0x019A         ## $a2 = 0000019A
/* 0061C 80894ABC 0C00084C */  jal     osSyncPrintf
              
/* 00620 80894AC0 8607001C */  lh      $a3, 0x001C($s0)           ## 0000001C
.L80894AC4:
/* 00624 80894AC4 8FBF0034 */  lw      $ra, 0x0034($sp)           
/* 00628 80894AC8 8FB00030 */  lw      $s0, 0x0030($sp)           
/* 0062C 80894ACC 27BD0038 */  addiu   $sp, $sp, 0x0038           ## $sp = 00000000
/* 00630 80894AD0 03E00008 */  jr      $ra                        
/* 00634 80894AD4 00000000 */  nop
