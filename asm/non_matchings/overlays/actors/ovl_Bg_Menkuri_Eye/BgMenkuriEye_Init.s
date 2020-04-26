glabel BgMenkuriEye_Init
/* 00000 8089BC70 27BDFFC8 */  addiu   $sp, $sp, 0xFFC8           ## $sp = FFFFFFC8
/* 00004 8089BC74 AFA5003C */  sw      $a1, 0x003C($sp)           
/* 00008 8089BC78 AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 0000C 8089BC7C AFB00020 */  sw      $s0, 0x0020($sp)           
/* 00010 8089BC80 3C05808A */  lui     $a1, %hi(D_8089C0C4)       ## $a1 = 808A0000
/* 00014 8089BC84 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00018 8089BC88 0C01E037 */  jal     Actor_ProcessInitChain
              
/* 0001C 8089BC8C 24A5C0C4 */  addiu   $a1, $a1, %lo(D_8089C0C4)  ## $a1 = 8089C0C4
/* 00020 8089BC90 26050150 */  addiu   $a1, $s0, 0x0150           ## $a1 = 00000150
/* 00024 8089BC94 AFA5002C */  sw      $a1, 0x002C($sp)           
/* 00028 8089BC98 0C016EFE */  jal     Collider_InitJntSph              
/* 0002C 8089BC9C 8FA4003C */  lw      $a0, 0x003C($sp)           
/* 00030 8089BCA0 3C07808A */  lui     $a3, %hi(D_8089C0B4)       ## $a3 = 808A0000
/* 00034 8089BCA4 260E0170 */  addiu   $t6, $s0, 0x0170           ## $t6 = 00000170
/* 00038 8089BCA8 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 0003C 8089BCAC AFAE0010 */  sw      $t6, 0x0010($sp)           
/* 00040 8089BCB0 24E7C0B4 */  addiu   $a3, $a3, %lo(D_8089C0B4)  ## $a3 = 8089C0B4
/* 00044 8089BCB4 8FA4003C */  lw      $a0, 0x003C($sp)           
/* 00048 8089BCB8 0C017014 */  jal     Collider_SetJntSph              
/* 0004C 8089BCBC 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 00050 8089BCC0 C6040024 */  lwc1    $f4, 0x0024($s0)           ## 00000024
/* 00054 8089BCC4 8E19016C */  lw      $t9, 0x016C($s0)           ## 0000016C
/* 00058 8089BCC8 4600218D */  trunc.w.s $f6, $f4                   
/* 0005C 8089BCCC 44183000 */  mfc1    $t8, $f6                   
/* 00060 8089BCD0 00000000 */  nop
/* 00064 8089BCD4 A7380030 */  sh      $t8, 0x0030($t9)           ## 00000030
/* 00068 8089BCD8 C6080028 */  lwc1    $f8, 0x0028($s0)           ## 00000028
/* 0006C 8089BCDC 8E0A016C */  lw      $t2, 0x016C($s0)           ## 0000016C
/* 00070 8089BCE0 4600428D */  trunc.w.s $f10, $f8                  
/* 00074 8089BCE4 44095000 */  mfc1    $t1, $f10                  
/* 00078 8089BCE8 00000000 */  nop
/* 0007C 8089BCEC A5490032 */  sh      $t1, 0x0032($t2)           ## 00000032
/* 00080 8089BCF0 C610002C */  lwc1    $f16, 0x002C($s0)          ## 0000002C
/* 00084 8089BCF4 8E0D016C */  lw      $t5, 0x016C($s0)           ## 0000016C
/* 00088 8089BCF8 4600848D */  trunc.w.s $f18, $f16                 
/* 0008C 8089BCFC 440C9000 */  mfc1    $t4, $f18                  
/* 00090 8089BD00 00000000 */  nop
/* 00094 8089BD04 A5AC0034 */  sh      $t4, 0x0034($t5)           ## 00000034
/* 00098 8089BD08 8E03016C */  lw      $v1, 0x016C($s0)           ## 0000016C
/* 0009C 8089BD0C 846E002E */  lh      $t6, 0x002E($v1)           ## 0000002E
/* 000A0 8089BD10 A46E0036 */  sh      $t6, 0x0036($v1)           ## 00000036
/* 000A4 8089BD14 8605001C */  lh      $a1, 0x001C($s0)           ## 0000001C
/* 000A8 8089BD18 0C00B2D0 */  jal     Flags_GetSwitch
              
/* 000AC 8089BD1C 8FA4003C */  lw      $a0, 0x003C($sp)           
/* 000B0 8089BD20 14400003 */  bne     $v0, $zero, .L8089BD30     
/* 000B4 8089BD24 240FFFFF */  addiu   $t7, $zero, 0xFFFF         ## $t7 = FFFFFFFF
/* 000B8 8089BD28 3C01808A */  lui     $at, %hi(D_8089C1A0)       ## $at = 808A0000
/* 000BC 8089BD2C AC20C1A0 */  sw      $zero, %lo(D_8089C1A0)($at) 
.L8089BD30:
/* 000C0 8089BD30 A60F014C */  sh      $t7, 0x014C($s0)           ## 0000014C
/* 000C4 8089BD34 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 000C8 8089BD38 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 000CC 8089BD3C 27BD0038 */  addiu   $sp, $sp, 0x0038           ## $sp = 00000000
/* 000D0 8089BD40 03E00008 */  jr      $ra                        
/* 000D4 8089BD44 00000000 */  nop
