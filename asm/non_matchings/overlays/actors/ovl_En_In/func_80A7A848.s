glabel func_80A7A848
/* 01898 80A7A848 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 0189C 80A7A84C AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 018A0 80A7A850 848E0308 */  lh      $t6, 0x0308($a0)           ## 00000308
/* 018A4 80A7A854 24010002 */  addiu   $at, $zero, 0x0002         ## $at = 00000002
/* 018A8 80A7A858 3C030001 */  lui     $v1, 0x0001                ## $v1 = 00010000
/* 018AC 80A7A85C 15C10034 */  bne     $t6, $at, .L80A7A930       
/* 018B0 80A7A860 00651821 */  addu    $v1, $v1, $a1              
/* 018B4 80A7A864 906304BD */  lbu     $v1, 0x04BD($v1)           ## 000104BD
/* 018B8 80A7A868 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 018BC 80A7A86C 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 018C0 80A7A870 14600005 */  bne     $v1, $zero, .L80A7A888     
/* 018C4 80A7A874 00000000 */  nop
/* 018C8 80A7A878 844F0034 */  lh      $t7, 0x0034($v0)           ## 8015E694
/* 018CC 80A7A87C 29E10032 */  slti    $at, $t7, 0x0032           
/* 018D0 80A7A880 54200006 */  bnel    $at, $zero, .L80A7A89C     
/* 018D4 80A7A884 945813FA */  lhu     $t8, 0x13FA($v0)           ## 8015FA5A
.L80A7A888:
/* 018D8 80A7A888 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 018DC 80A7A88C 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 018E0 80A7A890 14610008 */  bne     $v1, $at, .L80A7A8B4       
/* 018E4 80A7A894 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 018E8 80A7A898 945813FA */  lhu     $t8, 0x13FA($v0)           ## 8015FA5A
.L80A7A89C:
/* 018EC 80A7A89C 3C0880A8 */  lui     $t0, %hi(func_80A7A4C8)    ## $t0 = 80A80000
/* 018F0 80A7A8A0 2508A4C8 */  addiu   $t0, $t0, %lo(func_80A7A4C8) ## $t0 = 80A7A4C8
/* 018F4 80A7A8A4 3319FFF0 */  andi    $t9, $t8, 0xFFF0           ## $t9 = 00000000
/* 018F8 80A7A8A8 A45913FA */  sh      $t9, 0x13FA($v0)           ## 8015FA5A
/* 018FC 80A7A8AC 1000001A */  beq     $zero, $zero, .L80A7A918   
/* 01900 80A7A8B0 AC880190 */  sw      $t0, 0x0190($a0)           ## 00000190
.L80A7A8B4:
/* 01904 80A7A8B4 24060002 */  addiu   $a2, $zero, 0x0002         ## $a2 = 00000002
/* 01908 80A7A8B8 24070026 */  addiu   $a3, $zero, 0x0026         ## $a3 = 00000026
/* 0190C 80A7A8BC AFA40018 */  sw      $a0, 0x0018($sp)           
/* 01910 80A7A8C0 0C29E6EB */  jal     func_80A79BAC              
/* 01914 80A7A8C4 AFA5001C */  sw      $a1, 0x001C($sp)           
/* 01918 80A7A8C8 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 0191C 80A7A8CC 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 01920 80A7A8D0 944913FA */  lhu     $t1, 0x13FA($v0)           ## 8015FA5A
/* 01924 80A7A8D4 3C01FFFF */  lui     $at, 0xFFFF                ## $at = FFFF0000
/* 01928 80A7A8D8 34217FFF */  ori     $at, $at, 0x7FFF           ## $at = FFFF7FFF
/* 0192C 80A7A8DC 312AFFF0 */  andi    $t2, $t1, 0xFFF0           ## $t2 = 00000000
/* 01930 80A7A8E0 354C0002 */  ori     $t4, $t2, 0x0002           ## $t4 = 00000002
/* 01934 80A7A8E4 8FA5001C */  lw      $a1, 0x001C($sp)           
/* 01938 80A7A8E8 01816824 */  and     $t5, $t4, $at              
/* 0193C 80A7A8EC A44C13FA */  sh      $t4, 0x13FA($v0)           ## 8015FA5A
/* 01940 80A7A8F0 35AE8000 */  ori     $t6, $t5, 0x8000           ## $t6 = 00008000
/* 01944 80A7A8F4 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 01948 80A7A8F8 8FA40018 */  lw      $a0, 0x0018($sp)           
/* 0194C 80A7A8FC A44E13FA */  sh      $t6, 0x13FA($v0)           ## 8015FA5A
/* 01950 80A7A900 00250821 */  addu    $at, $at, $a1              
/* 01954 80A7A904 A02004BF */  sb      $zero, 0x04BF($at)         ## 000104BF
/* 01958 80A7A908 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 0195C 80A7A90C 240F0036 */  addiu   $t7, $zero, 0x0036         ## $t7 = 00000036
/* 01960 80A7A910 00250821 */  addu    $at, $at, $a1              
/* 01964 80A7A914 A02F03DC */  sb      $t7, 0x03DC($at)           ## 000103DC
.L80A7A918:
/* 01968 80A7A918 A4800308 */  sh      $zero, 0x0308($a0)         ## 00000308
/* 0196C 80A7A91C 945813FA */  lhu     $t8, 0x13FA($v0)           ## 8015FA5A
/* 01970 80A7A920 3308FFDF */  andi    $t0, $t8, 0xFFDF           ## $t0 = 00000000
/* 01974 80A7A924 A44813FA */  sh      $t0, 0x13FA($v0)           ## 8015FA5A
/* 01978 80A7A928 3109FFBF */  andi    $t1, $t0, 0xFFBF           ## $t1 = 00000000
/* 0197C 80A7A92C A44913FA */  sh      $t1, 0x13FA($v0)           ## 8015FA5A
.L80A7A930:
/* 01980 80A7A930 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 01984 80A7A934 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 01988 80A7A938 03E00008 */  jr      $ra                        
/* 0198C 80A7A93C 00000000 */  nop
