.late_rodata
glabel D_80A4B980
 .word 0x477FFFFD

.text
glabel func_80A4B3F0
/* 02530 80A4B3F0 27BDFF88 */  addiu   $sp, $sp, 0xFF88           ## $sp = FFFFFF88
/* 02534 80A4B3F4 AFBF0074 */  sw      $ra, 0x0074($sp)           
/* 02538 80A4B3F8 AFB30070 */  sw      $s3, 0x0070($sp)           
/* 0253C 80A4B3FC AFB2006C */  sw      $s2, 0x006C($sp)           
/* 02540 80A4B400 AFB10068 */  sw      $s1, 0x0068($sp)           
/* 02544 80A4B404 AFB00064 */  sw      $s0, 0x0064($sp)           
/* 02548 80A4B408 F7BE0058 */  sdc1    $f30, 0x0058($sp)          
/* 0254C 80A4B40C F7BC0050 */  sdc1    $f28, 0x0050($sp)          
/* 02550 80A4B410 F7BA0048 */  sdc1    $f26, 0x0048($sp)          
/* 02554 80A4B414 F7B80040 */  sdc1    $f24, 0x0040($sp)          
/* 02558 80A4B418 F7B60038 */  sdc1    $f22, 0x0038($sp)          
/* 0255C 80A4B41C F7B40030 */  sdc1    $f20, 0x0030($sp)          
/* 02560 80A4B420 848E001C */  lh      $t6, 0x001C($a0)           ## 0000001C
/* 02564 80A4B424 00808825 */  or      $s1, $a0, $zero            ## $s1 = 00000000
/* 02568 80A4B428 00A09025 */  or      $s2, $a1, $zero            ## $s2 = 00000000
/* 0256C 80A4B42C 29C10006 */  slti    $at, $t6, 0x0006           
/* 02570 80A4B430 10200008 */  beq     $at, $zero, .L80A4B454     
/* 02574 80A4B434 02402025 */  or      $a0, $s2, $zero            ## $a0 = 00000000
/* 02578 80A4B438 00A02025 */  or      $a0, $a1, $zero            ## $a0 = 00000000
/* 0257C 80A4B43C 26250024 */  addiu   $a1, $s1, 0x0024           ## $a1 = 00000024
/* 02580 80A4B440 24060028 */  addiu   $a2, $zero, 0x0028         ## $a2 = 00000028
/* 02584 80A4B444 0C01AEB6 */  jal     Audio_PlaySoundAtPosition
              
/* 02588 80A4B448 24073815 */  addiu   $a3, $zero, 0x3815         ## $a3 = 00003815
/* 0258C 80A4B44C 10000006 */  beq     $zero, $zero, .L80A4B468   
/* 02590 80A4B450 3C014170 */  lui     $at, 0x4170                ## $at = 41700000
.L80A4B454:
/* 02594 80A4B454 26250024 */  addiu   $a1, $s1, 0x0024           ## $a1 = 00000024
/* 02598 80A4B458 24060028 */  addiu   $a2, $zero, 0x0028         ## $a2 = 00000028
/* 0259C 80A4B45C 0C01AEB6 */  jal     Audio_PlaySoundAtPosition
              
/* 025A0 80A4B460 24073962 */  addiu   $a3, $zero, 0x3962         ## $a3 = 00003962
/* 025A4 80A4B464 3C014170 */  lui     $at, 0x4170                ## $at = 41700000
.L80A4B468:
/* 025A8 80A4B468 4481F000 */  mtc1    $at, $f30                  ## $f30 = 15.00
/* 025AC 80A4B46C 3C0180A5 */  lui     $at, %hi(D_80A4B980)       ## $at = 80A50000
/* 025B0 80A4B470 C43CB980 */  lwc1    $f28, %lo(D_80A4B980)($at) 
/* 025B4 80A4B474 3C014120 */  lui     $at, 0x4120                ## $at = 41200000
/* 025B8 80A4B478 4481D000 */  mtc1    $at, $f26                  ## $f26 = 10.00
/* 025BC 80A4B47C 00008025 */  or      $s0, $zero, $zero          ## $s0 = 00000000
/* 025C0 80A4B480 26531C24 */  addiu   $s3, $s2, 0x1C24           ## $s3 = 00001C24
.L80A4B484:
/* 025C4 80A4B484 0C00CFC8 */  jal     Rand_CenteredFloat
              
/* 025C8 80A4B488 4600D306 */  mov.s   $f12, $f26                 
/* 025CC 80A4B48C 46000506 */  mov.s   $f20, $f0                  
/* 025D0 80A4B490 0C00CFC8 */  jal     Rand_CenteredFloat
              
/* 025D4 80A4B494 4600D306 */  mov.s   $f12, $f26                 
/* 025D8 80A4B498 46000586 */  mov.s   $f22, $f0                  
/* 025DC 80A4B49C 0C00CFC8 */  jal     Rand_CenteredFloat
              
/* 025E0 80A4B4A0 4600D306 */  mov.s   $f12, $f26                 
/* 025E4 80A4B4A4 46000606 */  mov.s   $f24, $f0                  
/* 025E8 80A4B4A8 0C00CFC8 */  jal     Rand_CenteredFloat
              
/* 025EC 80A4B4AC 4600E306 */  mov.s   $f12, $f28                 
/* 025F0 80A4B4B0 C6240024 */  lwc1    $f4, 0x0024($s1)           ## 00000024
/* 025F4 80A4B4B4 2619000A */  addiu   $t9, $s0, 0x000A           ## $t9 = 0000000A
/* 025F8 80A4B4B8 02602025 */  or      $a0, $s3, $zero            ## $a0 = 00001C24
/* 025FC 80A4B4BC 4604A180 */  add.s   $f6, $f20, $f4             
/* 02600 80A4B4C0 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 02604 80A4B4C4 02403025 */  or      $a2, $s2, $zero            ## $a2 = 00000000
/* 02608 80A4B4C8 2407002B */  addiu   $a3, $zero, 0x002B         ## $a3 = 0000002B
/* 0260C 80A4B4CC E7A60010 */  swc1    $f6, 0x0010($sp)           
/* 02610 80A4B4D0 C6280028 */  lwc1    $f8, 0x0028($s1)           ## 00000028
/* 02614 80A4B4D4 4600018D */  trunc.w.s $f6, $f0                   
/* 02618 80A4B4D8 4608B280 */  add.s   $f10, $f22, $f8            
/* 0261C 80A4B4DC 44183000 */  mfc1    $t8, $f6                   
/* 02620 80A4B4E0 461E5400 */  add.s   $f16, $f10, $f30           
/* 02624 80A4B4E4 E7B00014 */  swc1    $f16, 0x0014($sp)          
/* 02628 80A4B4E8 C632002C */  lwc1    $f18, 0x002C($s1)          ## 0000002C
/* 0262C 80A4B4EC AFB90028 */  sw      $t9, 0x0028($sp)           
/* 02630 80A4B4F0 AFA00024 */  sw      $zero, 0x0024($sp)         
/* 02634 80A4B4F4 4612C100 */  add.s   $f4, $f24, $f18            
/* 02638 80A4B4F8 AFA0001C */  sw      $zero, 0x001C($sp)         
/* 0263C 80A4B4FC AFB80020 */  sw      $t8, 0x0020($sp)           
/* 02640 80A4B500 0C00C916 */  jal     Actor_SpawnAsChild
              
/* 02644 80A4B504 E7A40018 */  swc1    $f4, 0x0018($sp)           
/* 02648 80A4B508 26100001 */  addiu   $s0, $s0, 0x0001           ## $s0 = 00000001
/* 0264C 80A4B50C 00108400 */  sll     $s0, $s0, 16               
/* 02650 80A4B510 00108403 */  sra     $s0, $s0, 16               
/* 02654 80A4B514 2A01000F */  slti    $at, $s0, 0x000F           
/* 02658 80A4B518 1420FFDA */  bne     $at, $zero, .L80A4B484     
/* 0265C 80A4B51C 00000000 */  nop
/* 02660 80A4B520 8FBF0074 */  lw      $ra, 0x0074($sp)           
/* 02664 80A4B524 D7B40030 */  ldc1    $f20, 0x0030($sp)          
/* 02668 80A4B528 D7B60038 */  ldc1    $f22, 0x0038($sp)          
/* 0266C 80A4B52C D7B80040 */  ldc1    $f24, 0x0040($sp)          
/* 02670 80A4B530 D7BA0048 */  ldc1    $f26, 0x0048($sp)          
/* 02674 80A4B534 D7BC0050 */  ldc1    $f28, 0x0050($sp)          
/* 02678 80A4B538 D7BE0058 */  ldc1    $f30, 0x0058($sp)          
/* 0267C 80A4B53C 8FB00064 */  lw      $s0, 0x0064($sp)           
/* 02680 80A4B540 8FB10068 */  lw      $s1, 0x0068($sp)           
/* 02684 80A4B544 8FB2006C */  lw      $s2, 0x006C($sp)           
/* 02688 80A4B548 8FB30070 */  lw      $s3, 0x0070($sp)           
/* 0268C 80A4B54C 03E00008 */  jr      $ra                        
/* 02690 80A4B550 27BD0078 */  addiu   $sp, $sp, 0x0078           ## $sp = 00000000
