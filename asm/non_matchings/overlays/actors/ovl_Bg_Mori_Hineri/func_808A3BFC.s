.late_rodata
glabel D_808A44B0
    .float -453.0

.text
glabel func_808A3BFC
/* 0042C 808A3BFC 27BDFFD0 */  addiu   $sp, $sp, 0xFFD0           ## $sp = FFFFFFD0
/* 00430 808A3C00 AFA40030 */  sw      $a0, 0x0030($sp)           
/* 00434 808A3C04 8FAE0030 */  lw      $t6, 0x0030($sp)           
/* 00438 808A3C08 3C014313 */  lui     $at, 0x4313                ## $at = 43130000
/* 0043C 808A3C0C 44813000 */  mtc1    $at, $f6                   ## $f6 = 147.00
/* 00440 808A3C10 AFBF002C */  sw      $ra, 0x002C($sp)           
/* 00444 808A3C14 3C01C375 */  lui     $at, 0xC375                ## $at = C3750000
/* 00448 808A3C18 44818000 */  mtc1    $at, $f16                  ## $f16 = -245.00
/* 0044C 808A3C1C C5CA0028 */  lwc1    $f10, 0x0028($t6)          ## 00000028
/* 00450 808A3C20 C5C40024 */  lwc1    $f4, 0x0024($t6)           ## 00000024
/* 00454 808A3C24 3C01808A */  lui     $at, %hi(D_808A44B0)       ## $at = 808A0000
/* 00458 808A3C28 46105480 */  add.s   $f18, $f10, $f16           
/* 0045C 808A3C2C 240F4000 */  addiu   $t7, $zero, 0x4000         ## $t7 = 00004000
/* 00460 808A3C30 241827EE */  addiu   $t8, $zero, 0x27EE         ## $t8 = 000027EE
/* 00464 808A3C34 46062200 */  add.s   $f8, $f4, $f6              
/* 00468 808A3C38 E7B20010 */  swc1    $f18, 0x0010($sp)          
/* 0046C 808A3C3C C42644B0 */  lwc1    $f6, %lo(D_808A44B0)($at)  
/* 00470 808A3C40 C5C4002C */  lwc1    $f4, 0x002C($t6)           ## 0000002C
/* 00474 808A3C44 44074000 */  mfc1    $a3, $f8                   
/* 00478 808A3C48 AFB80024 */  sw      $t8, 0x0024($sp)           
/* 0047C 808A3C4C 46062200 */  add.s   $f8, $f4, $f6              
/* 00480 808A3C50 AFA00020 */  sw      $zero, 0x0020($sp)         
/* 00484 808A3C54 AFAF001C */  sw      $t7, 0x001C($sp)           
/* 00488 808A3C58 AFA00018 */  sw      $zero, 0x0018($sp)         
/* 0048C 808A3C5C E7A80014 */  swc1    $f8, 0x0014($sp)           
/* 00490 808A3C60 24A41C24 */  addiu   $a0, $a1, 0x1C24           ## $a0 = 00001C24
/* 00494 808A3C64 0C00C7D4 */  jal     Actor_Spawn
              ## ActorSpawn
/* 00498 808A3C68 2406000A */  addiu   $a2, $zero, 0x000A         ## $a2 = 0000000A
/* 0049C 808A3C6C 8FA80030 */  lw      $t0, 0x0030($sp)           
/* 004A0 808A3C70 3C19808A */  lui     $t9, %hi(func_808A3BF0)    ## $t9 = 808A0000
/* 004A4 808A3C74 27393BF0 */  addiu   $t9, $t9, %lo(func_808A3BF0) ## $t9 = 808A3BF0
/* 004A8 808A3C78 AD190164 */  sw      $t9, 0x0164($t0)           ## 00000164
/* 004AC 808A3C7C 8FBF002C */  lw      $ra, 0x002C($sp)           
/* 004B0 808A3C80 27BD0030 */  addiu   $sp, $sp, 0x0030           ## $sp = 00000000
/* 004B4 808A3C84 03E00008 */  jr      $ra                        
/* 004B8 808A3C88 00000000 */  nop
