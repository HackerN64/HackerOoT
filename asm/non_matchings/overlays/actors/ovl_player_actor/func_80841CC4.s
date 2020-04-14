.late_rodata
glabel D_8085543C
 .word 0x462AA800
glabel D_80855440
 .word 0x3A1D4952

.text
glabel func_80841CC4
/* 0FAB4 80841CC4 3C028085 */  lui     $v0, %hi(D_80853610)       ## $v0 = 80850000
/* 0FAB8 80841CC8 84423610 */  lh      $v0, %lo(D_80853610)($v0)  
/* 0FABC 80841CCC 27BDFFD0 */  addiu   $sp, $sp, 0xFFD0           ## $sp = FFFFFFD0
/* 0FAC0 80841CD0 AFB00028 */  sw      $s0, 0x0028($sp)           
/* 0FAC4 80841CD4 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 0FAC8 80841CD8 AFBF002C */  sw      $ra, 0x002C($sp)           
/* 0FACC 80841CDC AFA60038 */  sw      $a2, 0x0038($sp)           
/* 0FAD0 80841CE0 04400003 */  bltz    $v0, .L80841CF0            
/* 0FAD4 80841CE4 00A03825 */  or      $a3, $a1, $zero            ## $a3 = 00000000
/* 0FAD8 80841CE8 10000002 */  beq     $zero, $zero, .L80841CF4   
/* 0FADC 80841CEC 00401825 */  or      $v1, $v0, $zero            ## $v1 = 80850000
.L80841CF0:
/* 0FAE0 80841CF0 00021823 */  subu    $v1, $zero, $v0            
.L80841CF4:
/* 0FAE4 80841CF4 28610E38 */  slti    $at, $v1, 0x0E38           
/* 0FAE8 80841CF8 10200003 */  beq     $at, $zero, .L80841D08     
/* 0FAEC 80841CFC 2604089C */  addiu   $a0, $s0, 0x089C           ## $a0 = 0000089C
/* 0FAF0 80841D00 1000000D */  beq     $zero, $zero, .L80841D38   
/* 0FAF4 80841D04 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
.L80841D08:
/* 0FAF8 80841D08 2841D556 */  slti    $at, $v0, 0xD556           
/* 0FAFC 80841D0C 50200004 */  beql    $at, $zero, .L80841D20     
/* 0FB00 80841D10 28412AAB */  slti    $at, $v0, 0x2AAB           
/* 0FB04 80841D14 10000008 */  beq     $zero, $zero, .L80841D38   
/* 0FB08 80841D18 2405D556 */  addiu   $a1, $zero, 0xD556         ## $a1 = FFFFD556
/* 0FB0C 80841D1C 28412AAB */  slti    $at, $v0, 0x2AAB           
.L80841D20:
/* 0FB10 80841D20 14200003 */  bne     $at, $zero, .L80841D30     
/* 0FB14 80841D24 00401825 */  or      $v1, $v0, $zero            ## $v1 = 80850000
/* 0FB18 80841D28 10000001 */  beq     $zero, $zero, .L80841D30   
/* 0FB1C 80841D2C 24032AAA */  addiu   $v1, $zero, 0x2AAA         ## $v1 = 00002AAA
.L80841D30:
/* 0FB20 80841D30 00032C00 */  sll     $a1, $v1, 16               
/* 0FB24 80841D34 00052C03 */  sra     $a1, $a1, 16               
.L80841D38:
/* 0FB28 80841D38 24060190 */  addiu   $a2, $zero, 0x0190         ## $a2 = 00000190
/* 0FB2C 80841D3C 0C01DE2B */  jal     Math_ApproxUpdateScaledS
              
/* 0FB30 80841D40 AFA70034 */  sw      $a3, 0x0034($sp)           
/* 0FB34 80841D44 9203015B */  lbu     $v1, 0x015B($s0)           ## 0000015B
/* 0FB38 80841D48 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
/* 0FB3C 80841D4C 8FA40038 */  lw      $a0, 0x0038($sp)           
/* 0FB40 80841D50 1061000A */  beq     $v1, $at, .L80841D7C       
/* 0FB44 80841D54 8FA70034 */  lw      $a3, 0x0034($sp)           
/* 0FB48 80841D58 8602089C */  lh      $v0, 0x089C($s0)           ## 0000089C
/* 0FB4C 80841D5C 1440001A */  bne     $v0, $zero, .L80841DC8     
/* 0FB50 80841D60 00000000 */  nop
/* 0FB54 80841D64 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 0FB58 80841D68 C60606C4 */  lwc1    $f6, 0x06C4($s0)           ## 000006C4
/* 0FB5C 80841D6C 4604303E */  c.le.s  $f6, $f4                   
/* 0FB60 80841D70 00000000 */  nop
/* 0FB64 80841D74 45000014 */  bc1f    .L80841DC8                 
/* 0FB68 80841D78 00000000 */  nop
.L80841D7C:
/* 0FB6C 80841D7C 14E0000A */  bne     $a3, $zero, .L80841DA8     
/* 0FB70 80841D80 260501B4 */  addiu   $a1, $s0, 0x01B4           ## $a1 = 000001B4
/* 0FB74 80841D84 00037080 */  sll     $t6, $v1,  2               
/* 0FB78 80841D88 3C068085 */  lui     $a2, %hi(D_8085392C)       ## $a2 = 80850000
/* 0FB7C 80841D8C 00CE3021 */  addu    $a2, $a2, $t6              
/* 0FB80 80841D90 8CC6392C */  lw      $a2, %lo(D_8085392C)($a2)  
/* 0FB84 80841D94 260501B4 */  addiu   $a1, $s0, 0x01B4           ## $a1 = 000001B4
/* 0FB88 80841D98 0C0290A8 */  jal     func_800A42A0              
/* 0FB8C 80841D9C 8E070868 */  lw      $a3, 0x0868($s0)           ## 00000868
/* 0FB90 80841DA0 1000004C */  beq     $zero, $zero, .L80841ED4   
/* 0FB94 80841DA4 8FBF002C */  lw      $ra, 0x002C($sp)           
.L80841DA8:
/* 0FB98 80841DA8 00037880 */  sll     $t7, $v1,  2               
/* 0FB9C 80841DAC 3C068085 */  lui     $a2, %hi(D_8085392C)       ## $a2 = 80850000
/* 0FBA0 80841DB0 00CF3021 */  addu    $a2, $a2, $t7              
/* 0FBA4 80841DB4 8CC6392C */  lw      $a2, %lo(D_8085392C)($a2)  
/* 0FBA8 80841DB8 0C029097 */  jal     func_800A425C              
/* 0FBAC 80841DBC 8E070868 */  lw      $a3, 0x0868($s0)           ## 00000868
/* 0FBB0 80841DC0 10000044 */  beq     $zero, $zero, .L80841ED4   
/* 0FBB4 80841DC4 8FBF002C */  lw      $ra, 0x002C($sp)           
.L80841DC8:
/* 0FBB8 80841DC8 10400007 */  beq     $v0, $zero, .L80841DE8     
/* 0FBBC 80841DCC 3C018085 */  lui     $at, %hi(D_80855440)       ## $at = 80850000
/* 0FBC0 80841DD0 44824000 */  mtc1    $v0, $f8                   ## $f8 = 0.00
/* 0FBC4 80841DD4 3C018085 */  lui     $at, %hi(D_8085543C)       ## $at = 80850000
/* 0FBC8 80841DD8 C430543C */  lwc1    $f16, %lo(D_8085543C)($at) 
/* 0FBCC 80841DDC 468042A0 */  cvt.s.w $f10, $f8                  
/* 0FBD0 80841DE0 10000005 */  beq     $zero, $zero, .L80841DF8   
/* 0FBD4 80841DE4 46105083 */  div.s   $f2, $f10, $f16            
.L80841DE8:
/* 0FBD8 80841DE8 C61206C4 */  lwc1    $f18, 0x06C4($s0)          ## 000006C4
/* 0FBDC 80841DEC C4245440 */  lwc1    $f4, %lo(D_80855440)($at)  
/* 0FBE0 80841DF0 46049082 */  mul.s   $f2, $f18, $f4             
/* 0FBE4 80841DF4 00000000 */  nop
.L80841DF8:
/* 0FBE8 80841DF8 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 0FBEC 80841DFC 44816000 */  mtc1    $at, $f12                  ## $f12 = 1.00
/* 0FBF0 80841E00 C6000838 */  lwc1    $f0, 0x0838($s0)           ## 00000838
/* 0FBF4 80841E04 3C013F00 */  lui     $at, 0x3F00                ## $at = 3F000000
/* 0FBF8 80841E08 44813000 */  mtc1    $at, $f6                   ## $f6 = 0.50
/* 0FBFC 80841E0C 46000005 */  abs.s   $f0, $f0                   
/* 0FC00 80841E10 44805000 */  mtc1    $zero, $f10                ## $f10 = 0.00
/* 0FC04 80841E14 46060202 */  mul.s   $f8, $f0, $f6              
/* 0FC08 80841E18 3C020400 */  lui     $v0, 0x0400                ## $v0 = 04000000
/* 0FC0C 80841E1C 00034080 */  sll     $t0, $v1,  2               
/* 0FC10 80841E20 3C068085 */  lui     $a2, %hi(D_8085392C)       ## $a2 = 80850000
/* 0FC14 80841E24 24422E90 */  addiu   $v0, $v0, 0x2E90           ## $v0 = 04002E90
/* 0FC18 80841E28 0003C080 */  sll     $t8, $v1,  2               
/* 0FC1C 80841E2C 26190318 */  addiu   $t9, $s0, 0x0318           ## $t9 = 00000318
/* 0FC20 80841E30 46081082 */  mul.s   $f2, $f2, $f8              
/* 0FC24 80841E34 00C83021 */  addu    $a2, $a2, $t0              
/* 0FC28 80841E38 260501B4 */  addiu   $a1, $s0, 0x01B4           ## $a1 = 000001B4
/* 0FC2C 80841E3C 26090318 */  addiu   $t1, $s0, 0x0318           ## $t1 = 00000318
/* 0FC30 80841E40 4602603C */  c.lt.s  $f12, $f2                  
/* 0FC34 80841E44 00000000 */  nop
/* 0FC38 80841E48 45020003 */  bc1fl   .L80841E58                 
/* 0FC3C 80841E4C 460A103C */  c.lt.s  $f2, $f10                  
/* 0FC40 80841E50 46006086 */  mov.s   $f2, $f12                  
/* 0FC44 80841E54 460A103C */  c.lt.s  $f2, $f10                  
.L80841E58:
/* 0FC48 80841E58 00000000 */  nop
/* 0FC4C 80841E5C 45000005 */  bc1f    .L80841E74                 
/* 0FC50 80841E60 00000000 */  nop
/* 0FC54 80841E64 3C020400 */  lui     $v0, 0x0400                ## $v0 = 04000000
/* 0FC58 80841E68 24422E48 */  addiu   $v0, $v0, 0x2E48           ## $v0 = 04002E48
/* 0FC5C 80841E6C 10000001 */  beq     $zero, $zero, .L80841E74   
/* 0FC60 80841E70 46001087 */  neg.s   $f2, $f2                   
.L80841E74:
/* 0FC64 80841E74 54E0000F */  bnel    $a3, $zero, .L80841EB4     
/* 0FC68 80841E78 C6000868 */  lwc1    $f0, 0x0868($s0)           ## 00000868
/* 0FC6C 80841E7C C6000868 */  lwc1    $f0, 0x0868($s0)           ## 00000868
/* 0FC70 80841E80 3C068085 */  lui     $a2, %hi(D_8085392C)       ## $a2 = 80850000
/* 0FC74 80841E84 00D83021 */  addu    $a2, $a2, $t8              
/* 0FC78 80841E88 44070000 */  mfc1    $a3, $f0                   
/* 0FC7C 80841E8C 8CC6392C */  lw      $a2, %lo(D_8085392C)($a2)  
/* 0FC80 80841E90 AFB9001C */  sw      $t9, 0x001C($sp)           
/* 0FC84 80841E94 E7A20018 */  swc1    $f2, 0x0018($sp)           
/* 0FC88 80841E98 AFA20010 */  sw      $v0, 0x0010($sp)           
/* 0FC8C 80841E9C 260501B4 */  addiu   $a1, $s0, 0x01B4           ## $a1 = 000001B4
/* 0FC90 80841EA0 0C0290C7 */  jal     func_800A431C              
/* 0FC94 80841EA4 E7A00014 */  swc1    $f0, 0x0014($sp)           
/* 0FC98 80841EA8 1000000A */  beq     $zero, $zero, .L80841ED4   
/* 0FC9C 80841EAC 8FBF002C */  lw      $ra, 0x002C($sp)           
/* 0FCA0 80841EB0 C6000868 */  lwc1    $f0, 0x0868($s0)           ## 00000868
.L80841EB4:
/* 0FCA4 80841EB4 AFA9001C */  sw      $t1, 0x001C($sp)           
/* 0FCA8 80841EB8 E7A20018 */  swc1    $f2, 0x0018($sp)           
/* 0FCAC 80841EBC 44070000 */  mfc1    $a3, $f0                   
/* 0FCB0 80841EC0 AFA20010 */  sw      $v0, 0x0010($sp)           
/* 0FCB4 80841EC4 8CC6392C */  lw      $a2, %lo(D_8085392C)($a2)  
/* 0FCB8 80841EC8 0C0290EE */  jal     func_800A43B8              
/* 0FCBC 80841ECC E7A00014 */  swc1    $f0, 0x0014($sp)           
/* 0FCC0 80841ED0 8FBF002C */  lw      $ra, 0x002C($sp)           
.L80841ED4:
/* 0FCC4 80841ED4 8FB00028 */  lw      $s0, 0x0028($sp)           
/* 0FCC8 80841ED8 27BD0030 */  addiu   $sp, $sp, 0x0030           ## $sp = 00000000
/* 0FCCC 80841EDC 03E00008 */  jr      $ra                        
/* 0FCD0 80841EE0 00000000 */  nop
