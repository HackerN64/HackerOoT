glabel BgJyaGoroiwa_Init
/* 000F4 80897A64 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 000F8 80897A68 AFA50024 */  sw      $a1, 0x0024($sp)           
/* 000FC 80897A6C AFBF001C */  sw      $ra, 0x001C($sp)           
/* 00100 80897A70 AFB00018 */  sw      $s0, 0x0018($sp)           
/* 00104 80897A74 3C058089 */  lui     $a1, %hi(D_80897FAC)       ## $a1 = 80890000
/* 00108 80897A78 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 0010C 80897A7C 0C01E037 */  jal     Actor_ProcessInitChain
              
/* 00110 80897A80 24A57FAC */  addiu   $a1, $a1, %lo(D_80897FAC)  ## $a1 = 80897FAC
/* 00114 80897A84 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00118 80897A88 0C225E70 */  jal     func_808979C0              
/* 0011C 80897A8C 8FA50024 */  lw      $a1, 0x0024($sp)           
/* 00120 80897A90 A60000B8 */  sh      $zero, 0x00B8($s0)         ## 000000B8
/* 00124 80897A94 860200B8 */  lh      $v0, 0x00B8($s0)           ## 000000B8
/* 00128 80897A98 3C068089 */  lui     $a2, %hi(D_80897FA4)       ## $a2 = 80890000
/* 0012C 80897A9C 24C67FA4 */  addiu   $a2, $a2, %lo(D_80897FA4)  ## $a2 = 80897FA4
/* 00130 80897AA0 26040098 */  addiu   $a0, $s0, 0x0098           ## $a0 = 00000098
/* 00134 80897AA4 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 00138 80897AA8 A60200B6 */  sh      $v0, 0x00B6($s0)           ## 000000B6
/* 0013C 80897AAC 0C0187B5 */  jal     func_80061ED4              
/* 00140 80897AB0 A60200B4 */  sh      $v0, 0x00B4($s0)           ## 000000B4
/* 00144 80897AB4 3C054414 */  lui     $a1, 0x4414                ## $a1 = 44140000
/* 00148 80897AB8 3C068003 */  lui     $a2, %hi(ActorShadow_DrawFunc_Circle)
/* 0014C 80897ABC 24C6B5EC */  addiu   $a2, %lo(ActorShadow_DrawFunc_Circle)
/* 00150 80897AC0 34A5C000 */  ori     $a1, $a1, 0xC000           ## $a1 = 4414C000
/* 00154 80897AC4 260400B4 */  addiu   $a0, $s0, 0x00B4           ## $a0 = 000000B4
/* 00158 80897AC8 0C00AC78 */  jal     ActorShape_Init
              
/* 0015C 80897ACC 3C074110 */  lui     $a3, 0x4110                ## $a3 = 41100000
/* 00160 80897AD0 240E0080 */  addiu   $t6, $zero, 0x0080         ## $t6 = 00000080
/* 00164 80897AD4 A20E00C8 */  sb      $t6, 0x00C8($s0)           ## 000000C8
/* 00168 80897AD8 0C225EC7 */  jal     func_80897B1C              
/* 0016C 80897ADC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00170 80897AE0 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 00174 80897AE4 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 00178 80897AE8 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
/* 0017C 80897AEC 03E00008 */  jr      $ra                        
/* 00180 80897AF0 00000000 */  nop
