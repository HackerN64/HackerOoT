.late_rodata
glabel D_80A668D4
    .float 0.01

.text
glabel func_80A5EB54
/* 03864 80A5EB54 27BDFFC0 */  addiu   $sp, $sp, 0xFFC0           ## $sp = FFFFFFC0
/* 03868 80A5EB58 3C014140 */  lui     $at, 0x4140                ## $at = 41400000
/* 0386C 80A5EB5C 44812000 */  mtc1    $at, $f4                   ## $f4 = 12.00
/* 03870 80A5EB60 AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 03874 80A5EB64 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 03878 80A5EB68 AFA50044 */  sw      $a1, 0x0044($sp)           
/* 0387C 80A5EB6C 3C014188 */  lui     $at, 0x4188                ## $at = 41880000
/* 03880 80A5EB70 C48201C4 */  lwc1    $f2, 0x01C4($a0)           ## 000001C4
/* 03884 80A5EB74 44813000 */  mtc1    $at, $f6                   ## $f6 = 17.00
/* 03888 80A5EB78 8C8E01F0 */  lw      $t6, 0x01F0($a0)           ## 000001F0
/* 0388C 80A5EB7C 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 03890 80A5EB80 4602303C */  c.lt.s  $f6, $f2                   
/* 03894 80A5EB84 35CF0004 */  ori     $t7, $t6, 0x0004           ## $t7 = 00000004
/* 03898 80A5EB88 AC8F01F0 */  sw      $t7, 0x01F0($a0)           ## 000001F0
/* 0389C 80A5EB8C E4840068 */  swc1    $f4, 0x0068($a0)           ## 00000068
/* 038A0 80A5EB90 4502001D */  bc1fl   .L80A5EC08                 
/* 038A4 80A5EB94 8E0201CC */  lw      $v0, 0x01CC($s0)           ## 000001CC
/* 038A8 80A5EB98 44800000 */  mtc1    $zero, $f0                 ## $f0 = 0.00
/* 038AC 80A5EB9C C48A0060 */  lwc1    $f10, 0x0060($a0)          ## 00000060
/* 038B0 80A5EBA0 3C01C060 */  lui     $at, 0xC060                ## $at = C0600000
/* 038B4 80A5EBA4 44814000 */  mtc1    $at, $f8                   ## $f8 = -3.50
/* 038B8 80A5EBA8 460A0032 */  c.eq.s  $f0, $f10                  
/* 038BC 80A5EBAC 3C01C0C0 */  lui     $at, 0xC0C0                ## $at = C0C00000
/* 038C0 80A5EBB0 E488006C */  swc1    $f8, 0x006C($a0)           ## 0000006C
/* 038C4 80A5EBB4 45020005 */  bc1fl   .L80A5EBCC                 
/* 038C8 80A5EBB8 3C0142B4 */  lui     $at, 0x42B4                ## $at = 42B40000
/* 038CC 80A5EBBC 44818000 */  mtc1    $at, $f16                  ## $f16 = 90.00
/* 038D0 80A5EBC0 00000000 */  nop
/* 038D4 80A5EBC4 E4900060 */  swc1    $f16, 0x0060($a0)          ## 00000060
/* 038D8 80A5EBC8 3C0142B4 */  lui     $at, 0x42B4                ## $at = 42B40000
.L80A5EBCC:
/* 038DC 80A5EBCC 44813000 */  mtc1    $at, $f6                   ## $f6 = 90.00
/* 038E0 80A5EBD0 C6040080 */  lwc1    $f4, 0x0080($s0)           ## 00000080
/* 038E4 80A5EBD4 C6120028 */  lwc1    $f18, 0x0028($s0)          ## 00000028
/* 038E8 80A5EBD8 3C013FC0 */  lui     $at, 0x3FC0                ## $at = 3FC00000
/* 038EC 80A5EBDC 46062200 */  add.s   $f8, $f4, $f6              
/* 038F0 80A5EBE0 4608903C */  c.lt.s  $f18, $f8                  
/* 038F4 80A5EBE4 00000000 */  nop
/* 038F8 80A5EBE8 45000004 */  bc1f    .L80A5EBFC                 
/* 038FC 80A5EBEC 00000000 */  nop
/* 03900 80A5EBF0 44815000 */  mtc1    $at, $f10                  ## $f10 = 1.50
/* 03904 80A5EBF4 1000000E */  beq     $zero, $zero, .L80A5EC30   
/* 03908 80A5EBF8 E60A01C8 */  swc1    $f10, 0x01C8($s0)          ## 000001C8
.L80A5EBFC:
/* 0390C 80A5EBFC 1000000C */  beq     $zero, $zero, .L80A5EC30   
/* 03910 80A5EC00 E60001C8 */  swc1    $f0, 0x01C8($s0)           ## 000001C8
/* 03914 80A5EC04 8E0201CC */  lw      $v0, 0x01CC($s0)           ## 000001CC
.L80A5EC08:
/* 03918 80A5EC08 3C0180A6 */  lui     $at, %hi(D_80A668D4)       ## $at = 80A60000
/* 0391C 80A5EC0C C42668D4 */  lwc1    $f6, %lo(D_80A668D4)($at)  
/* 03920 80A5EC10 84580002 */  lh      $t8, 0x0002($v0)           ## 00000002
/* 03924 80A5EC14 C6040274 */  lwc1    $f4, 0x0274($s0)           ## 00000274
/* 03928 80A5EC18 44988000 */  mtc1    $t8, $f16                  ## $f16 = 0.00
/* 0392C 80A5EC1C 00000000 */  nop
/* 03930 80A5EC20 46808020 */  cvt.s.w $f0, $f16                  
/* 03934 80A5EC24 46060482 */  mul.s   $f18, $f0, $f6             
/* 03938 80A5EC28 46122200 */  add.s   $f8, $f4, $f18             
/* 0393C 80A5EC2C E6080028 */  swc1    $f8, 0x0028($s0)           ## 00000028
.L80A5EC30:
/* 03940 80A5EC30 260401AC */  addiu   $a0, $s0, 0x01AC           ## $a0 = 000001AC
/* 03944 80A5EC34 0C02927F */  jal     SkelAnime_Update
              
/* 03948 80A5EC38 E7A2002C */  swc1    $f2, 0x002C($sp)           
/* 0394C 80A5EC3C 14400012 */  bne     $v0, $zero, .L80A5EC88     
/* 03950 80A5EC40 C7A2002C */  lwc1    $f2, 0x002C($sp)           
/* 03954 80A5EC44 3C014188 */  lui     $at, 0x4188                ## $at = 41880000
/* 03958 80A5EC48 44815000 */  mtc1    $at, $f10                  ## $f10 = 17.00
/* 0395C 80A5EC4C 00000000 */  nop
/* 03960 80A5EC50 4602503C */  c.lt.s  $f10, $f2                  
/* 03964 80A5EC54 00000000 */  nop
/* 03968 80A5EC58 4502002B */  bc1fl   .L80A5ED08                 
/* 0396C 80A5EC5C 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 03970 80A5EC60 C6060080 */  lwc1    $f6, 0x0080($s0)           ## 00000080
/* 03974 80A5EC64 C6040060 */  lwc1    $f4, 0x0060($s0)           ## 00000060
/* 03978 80A5EC68 3C0142A0 */  lui     $at, 0x42A0                ## $at = 42A00000
/* 0397C 80A5EC6C 44814000 */  mtc1    $at, $f8                   ## $f8 = 80.00
/* 03980 80A5EC70 46043481 */  sub.s   $f18, $f6, $f4             
/* 03984 80A5EC74 C6100028 */  lwc1    $f16, 0x0028($s0)          ## 00000028
/* 03988 80A5EC78 46089280 */  add.s   $f10, $f18, $f8            
/* 0398C 80A5EC7C 460A803C */  c.lt.s  $f16, $f10                 
/* 03990 80A5EC80 00000000 */  nop
/* 03994 80A5EC84 4500001F */  bc1f    .L80A5ED04                 
.L80A5EC88:
/* 03998 80A5EC88 3C078013 */  lui     $a3, %hi(D_801333E0)
/* 0399C 80A5EC8C 3C198013 */  lui     $t9, %hi(D_801333E8)
/* 039A0 80A5EC90 24E733E0 */  addiu   $a3, %lo(D_801333E0)
/* 039A4 80A5EC94 273933E8 */  addiu   $t9, %lo(D_801333E8)
/* 039A8 80A5EC98 AFB90014 */  sw      $t9, 0x0014($sp)           
/* 039AC 80A5EC9C AFA70010 */  sw      $a3, 0x0010($sp)           
/* 039B0 80A5ECA0 24042819 */  addiu   $a0, $zero, 0x2819         ## $a0 = 00002819
/* 039B4 80A5ECA4 260500E4 */  addiu   $a1, $s0, 0x00E4           ## $a1 = 000000E4
/* 039B8 80A5ECA8 0C03DCE3 */  jal     Audio_PlaySoundGeneral
              
/* 039BC 80A5ECAC 24060004 */  addiu   $a2, $zero, 0x0004         ## $a2 = 00000004
/* 039C0 80A5ECB0 44806000 */  mtc1    $zero, $f12                ## $f12 = 0.00
/* 039C4 80A5ECB4 240500FF */  addiu   $a1, $zero, 0x00FF         ## $a1 = 000000FF
/* 039C8 80A5ECB8 2406000A */  addiu   $a2, $zero, 0x000A         ## $a2 = 0000000A
/* 039CC 80A5ECBC 0C02A800 */  jal     func_800AA000              
/* 039D0 80A5ECC0 24070050 */  addiu   $a3, $zero, 0x0050         ## $a3 = 00000050
/* 039D4 80A5ECC4 8E0801F0 */  lw      $t0, 0x01F0($s0)           ## 000001F0
/* 039D8 80A5ECC8 2401FFFB */  addiu   $at, $zero, 0xFFFB         ## $at = FFFFFFFB
/* 039DC 80A5ECCC C6040080 */  lwc1    $f4, 0x0080($s0)           ## 00000080
/* 039E0 80A5ECD0 01014824 */  and     $t1, $t0, $at              
/* 039E4 80A5ECD4 3C01C060 */  lui     $at, 0xC060                ## $at = C0600000
/* 039E8 80A5ECD8 44813000 */  mtc1    $at, $f6                   ## $f6 = -3.50
/* 039EC 80A5ECDC AE0901F0 */  sw      $t1, 0x01F0($s0)           ## 000001F0
/* 039F0 80A5ECE0 E6040028 */  swc1    $f4, 0x0028($s0)           ## 00000028
/* 039F4 80A5ECE4 E606006C */  swc1    $f6, 0x006C($s0)           ## 0000006C
/* 039F8 80A5ECE8 8FA40044 */  lw      $a0, 0x0044($sp)           
/* 039FC 80A5ECEC 3C0541C8 */  lui     $a1, 0x41C8                ## $a1 = 41C80000
/* 03A00 80A5ECF0 0C00A295 */  jal     func_80028A54              
/* 03A04 80A5ECF4 26060024 */  addiu   $a2, $s0, 0x0024           ## $a2 = 00000024
/* 03A08 80A5ECF8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 03A0C 80A5ECFC 0C29776C */  jal     func_80A5DDB0              
/* 03A10 80A5ED00 8FA50044 */  lw      $a1, 0x0044($sp)           
.L80A5ED04:
/* 03A14 80A5ED04 8FBF0024 */  lw      $ra, 0x0024($sp)           
.L80A5ED08:
/* 03A18 80A5ED08 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 03A1C 80A5ED0C 27BD0040 */  addiu   $sp, $sp, 0x0040           ## $sp = 00000000
/* 03A20 80A5ED10 03E00008 */  jr      $ra                        
/* 03A24 80A5ED14 00000000 */  nop
