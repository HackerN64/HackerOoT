.late_rodata
glabel D_808B7378
 .word 0x44228000, 0x00000000

.text
glabel BgSpot17Bakudankabe_Update
/* 003F0 808B6FB0 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 003F4 808B6FB4 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 003F8 808B6FB8 AFB00018 */  sw      $s0, 0x0018($sp)           
/* 003FC 808B6FBC AFA50024 */  sw      $a1, 0x0024($sp)           
/* 00400 808B6FC0 3C01808B */  lui     $at, %hi(D_808B7378)       ## $at = 808B0000
/* 00404 808B6FC4 C4267378 */  lwc1    $f6, %lo(D_808B7378)($at)  
/* 00408 808B6FC8 C4840090 */  lwc1    $f4, 0x0090($a0)           ## 00000090
/* 0040C 808B6FCC 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00410 808B6FD0 00A02025 */  or      $a0, $a1, $zero            ## $a0 = 00000000
/* 00414 808B6FD4 4606203C */  c.lt.s  $f4, $f6                   
/* 00418 808B6FD8 00000000 */  nop
/* 0041C 808B6FDC 45020015 */  bc1fl   .L808B7034                 
/* 00420 808B6FE0 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 00424 808B6FE4 0C00CDA1 */  jal     func_80033684              
/* 00428 808B6FE8 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 0042C 808B6FEC 10400010 */  beq     $v0, $zero, .L808B7030     
/* 00430 808B6FF0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00434 808B6FF4 0C22DAF0 */  jal     func_808B6BC0              
/* 00438 808B6FF8 8FA50024 */  lw      $a1, 0x0024($sp)           
/* 0043C 808B6FFC 8605001C */  lh      $a1, 0x001C($s0)           ## 0000001C
/* 00440 808B7000 8FA40024 */  lw      $a0, 0x0024($sp)           
/* 00444 808B7004 0C00B2DD */  jal     Flags_SetSwitch
              
/* 00448 808B7008 30A5003F */  andi    $a1, $a1, 0x003F           ## $a1 = 00000000
/* 0044C 808B700C 8FA40024 */  lw      $a0, 0x0024($sp)           
/* 00450 808B7010 26050024 */  addiu   $a1, $s0, 0x0024           ## $a1 = 00000024
/* 00454 808B7014 24060028 */  addiu   $a2, $zero, 0x0028         ## $a2 = 00000028
/* 00458 808B7018 0C01AEB6 */  jal     Audio_PlaySoundAtPosition
              
/* 0045C 808B701C 24072810 */  addiu   $a3, $zero, 0x2810         ## $a3 = 00002810
/* 00460 808B7020 0C01E221 */  jal     func_80078884              
/* 00464 808B7024 24044802 */  addiu   $a0, $zero, 0x4802         ## $a0 = 00004802
/* 00468 808B7028 0C00B55C */  jal     Actor_Kill
              
/* 0046C 808B702C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
.L808B7030:
/* 00470 808B7030 8FBF001C */  lw      $ra, 0x001C($sp)           
.L808B7034:
/* 00474 808B7034 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 00478 808B7038 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
/* 0047C 808B703C 03E00008 */  jr      $ra                        
/* 00480 808B7040 00000000 */  nop
