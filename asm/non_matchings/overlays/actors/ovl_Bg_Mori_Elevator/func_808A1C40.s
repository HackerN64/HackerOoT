.late_rodata
glabel D_808A23B8
    .float 0.001

.text
glabel func_808A1C40
/* 00440 808A1C40 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 00444 808A1C44 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 00448 808A1C48 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 0044C 808A1C4C 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00450 808A1C50 AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 00454 808A1C54 AFA5002C */  sw      $a1, 0x002C($sp)           
/* 00458 808A1C58 3C063D4C */  lui     $a2, 0x3D4C                ## $a2 = 3D4C0000
/* 0045C 808A1C5C 34C6CCCD */  ori     $a2, $a2, 0xCCCD           ## $a2 = 3D4CCCCD
/* 00460 808A1C60 3C054000 */  lui     $a1, 0x4000                ## $a1 = 40000000
/* 00464 808A1C64 24840060 */  addiu   $a0, $a0, 0x0060           ## $a0 = 00000060
/* 00468 808A1C68 3C073F80 */  lui     $a3, 0x3F80                ## $a3 = 3F800000
/* 0046C 808A1C6C 0C228600 */  jal     func_808A1800              
/* 00470 808A1C70 E7A40010 */  swc1    $f4, 0x0010($sp)           
/* 00474 808A1C74 3C013FC0 */  lui     $at, 0x3FC0                ## $at = 3FC00000
/* 00478 808A1C78 44813000 */  mtc1    $at, $f6                   ## $f6 = 1.50
/* 0047C 808A1C7C 3C063DA3 */  lui     $a2, 0x3DA3                ## $a2 = 3DA30000
/* 00480 808A1C80 8E070060 */  lw      $a3, 0x0060($s0)           ## 00000060
/* 00484 808A1C84 34C6D70A */  ori     $a2, $a2, 0xD70A           ## $a2 = 3DA3D70A
/* 00488 808A1C88 26040028 */  addiu   $a0, $s0, 0x0028           ## $a0 = 00000028
/* 0048C 808A1C8C 3C054292 */  lui     $a1, 0x4292                ## $a1 = 42920000
/* 00490 808A1C90 0C228600 */  jal     func_808A1800              
/* 00494 808A1C94 E7A60010 */  swc1    $f6, 0x0010($sp)           
/* 00498 808A1C98 3C01808A */  lui     $at, %hi(D_808A23B8)       ## $at = 808A0000
/* 0049C 808A1C9C C42823B8 */  lwc1    $f8, %lo(D_808A23B8)($at)  
/* 004A0 808A1CA0 46000086 */  mov.s   $f2, $f0                   
/* 004A4 808A1CA4 46000005 */  abs.s   $f0, $f0                   
/* 004A8 808A1CA8 4608003C */  c.lt.s  $f0, $f8                   
/* 004AC 808A1CAC 00000000 */  nop
/* 004B0 808A1CB0 45020009 */  bc1fl   .L808A1CD8                 
/* 004B4 808A1CB4 44051000 */  mfc1    $a1, $f2                   
/* 004B8 808A1CB8 0C228781 */  jal     func_808A1E04              
/* 004BC 808A1CBC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 004C0 808A1CC0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 004C4 808A1CC4 0C00BE0A */  jal     Audio_PlayActorSound2
              
/* 004C8 808A1CC8 2405287A */  addiu   $a1, $zero, 0x287A         ## $a1 = 0000287A
/* 004CC 808A1CCC 10000005 */  beq     $zero, $zero, .L808A1CE4   
/* 004D0 808A1CD0 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 004D4 808A1CD4 44051000 */  mfc1    $a1, $f2                   
.L808A1CD8:
/* 004D8 808A1CD8 0C22863F */  jal     func_808A18FC              
/* 004DC 808A1CDC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 004E0 808A1CE0 8FBF0024 */  lw      $ra, 0x0024($sp)           
.L808A1CE4:
/* 004E4 808A1CE4 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 004E8 808A1CE8 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
/* 004EC 808A1CEC 03E00008 */  jr      $ra                        
/* 004F0 808A1CF0 00000000 */  nop
