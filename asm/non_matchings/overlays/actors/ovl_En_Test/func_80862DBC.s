glabel func_80862DBC
/* 0376C 80862DBC 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 03770 80862DC0 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 03774 80862DC4 AFB00018 */  sw      $s0, 0x0018($sp)           
/* 03778 80862DC8 AFA50024 */  sw      $a1, 0x0024($sp)           
/* 0377C 80862DCC 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 03780 80862DD0 0C00BE0A */  jal     Audio_PlayActorSound2
              
/* 03784 80862DD4 2405383A */  addiu   $a1, $zero, 0x383A         ## $a1 = 0000383A
/* 03788 80862DD8 240E0002 */  addiu   $t6, $zero, 0x0002         ## $t6 = 00000002
/* 0378C 80862DDC A20E07C8 */  sb      $t6, 0x07C8($s0)           ## 000007C8
/* 03790 80862DE0 8FA60024 */  lw      $a2, 0x0024($sp)           
/* 03794 80862DE4 260407F0 */  addiu   $a0, $s0, 0x07F0           ## $a0 = 000007F0
/* 03798 80862DE8 0C00CB89 */  jal     func_80032E24              
/* 0379C 80862DEC 2405003C */  addiu   $a1, $zero, 0x003C         ## $a1 = 0000003C
/* 037A0 80862DF0 820F0808 */  lb      $t7, 0x0808($s0)           ## 00000808
/* 037A4 80862DF4 A6000014 */  sh      $zero, 0x0014($s0)         ## 00000014
/* 037A8 80862DF8 05E20008 */  bltzl   $t7, .L80862E1C            
/* 037AC 80862DFC 8E190004 */  lw      $t9, 0x0004($s0)           ## 00000004
/* 037B0 80862E00 0C009AC3 */  jal     Effect_GetByIndex              
/* 037B4 80862E04 8E04080C */  lw      $a0, 0x080C($s0)           ## 0000080C
/* 037B8 80862E08 0C008048 */  jal     EffectBlure_AddSpace              
/* 037BC 80862E0C 00402025 */  or      $a0, $v0, $zero            ## $a0 = 00000000
/* 037C0 80862E10 2418FFFF */  addiu   $t8, $zero, 0xFFFF         ## $t8 = FFFFFFFF
/* 037C4 80862E14 A2180808 */  sb      $t8, 0x0808($s0)           ## 00000808
/* 037C8 80862E18 8E190004 */  lw      $t9, 0x0004($s0)           ## 00000004
.L80862E1C:
/* 037CC 80862E1C 8609001C */  lh      $t1, 0x001C($s0)           ## 0000001C
/* 037D0 80862E20 2401FFFE */  addiu   $at, $zero, 0xFFFE         ## $at = FFFFFFFE
/* 037D4 80862E24 03214024 */  and     $t0, $t9, $at              
/* 037D8 80862E28 24010005 */  addiu   $at, $zero, 0x0005         ## $at = 00000005
/* 037DC 80862E2C 15210006 */  bne     $t1, $at, .L80862E48       
/* 037E0 80862E30 AE080004 */  sw      $t0, 0x0004($s0)           ## 00000004
/* 037E4 80862E34 8FA40024 */  lw      $a0, 0x0024($sp)           
/* 037E8 80862E38 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 037EC 80862E3C 24070006 */  addiu   $a3, $zero, 0x0006         ## $a3 = 00000006
/* 037F0 80862E40 0C00CDD2 */  jal     Actor_ChangeCategory
              
/* 037F4 80862E44 24851C24 */  addiu   $a1, $a0, 0x1C24           ## $a1 = 00001C24
.L80862E48:
/* 037F8 80862E48 3C058086 */  lui     $a1, %hi(func_80862E6C)    ## $a1 = 80860000
/* 037FC 80862E4C 24A52E6C */  addiu   $a1, $a1, %lo(func_80862E6C) ## $a1 = 80862E6C
/* 03800 80862E50 0C217D94 */  jal     EnTest_SetupAction              
/* 03804 80862E54 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 03808 80862E58 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 0380C 80862E5C 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 03810 80862E60 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
/* 03814 80862E64 03E00008 */  jr      $ra                        
/* 03818 80862E68 00000000 */  nop
