glabel func_809C990C
/* 00B4C 809C990C 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 00B50 809C9910 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 00B54 809C9914 AFB10018 */  sw      $s1, 0x0018($sp)           
/* 00B58 809C9918 AFB00014 */  sw      $s0, 0x0014($sp)           
/* 00B5C 809C991C 8482001C */  lh      $v0, 0x001C($a0)           ## 0000001C
/* 00B60 809C9920 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00B64 809C9924 00A08825 */  or      $s1, $a1, $zero            ## $s1 = 00000000
/* 00B68 809C9928 3042001F */  andi    $v0, $v0, 0x001F           ## $v0 = 00000000
/* 00B6C 809C992C 28410014 */  slti    $at, $v0, 0x0014           
/* 00B70 809C9930 14200005 */  bne     $at, $zero, .L809C9948     
/* 00B74 809C9934 28410020 */  slti    $at, $v0, 0x0020           
/* 00B78 809C9938 50200004 */  beql    $at, $zero, .L809C994C     
/* 00B7C 809C993C 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00B80 809C9940 0C00BD7C */  jal     func_8002F5F0              
/* 00B84 809C9944 00000000 */  nop
.L809C9948:
/* 00B88 809C9948 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
.L809C994C:
/* 00B8C 809C994C 0C00B349 */  jal     Flags_GetTempClear
              
/* 00B90 809C9950 82050003 */  lb      $a1, 0x0003($s0)           ## 00000003
/* 00B94 809C9954 50400017 */  beql    $v0, $zero, .L809C99B4     
/* 00B98 809C9958 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 00B9C 809C995C 0C023A62 */  jal     Player_InCsMode              
/* 00BA0 809C9960 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00BA4 809C9964 14400012 */  bne     $v0, $zero, .L809C99B0     
/* 00BA8 809C9968 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00BAC 809C996C 0C00B33C */  jal     Flags_SetClear
              
/* 00BB0 809C9970 82050003 */  lb      $a1, 0x0003($s0)           ## 00000003
/* 00BB4 809C9974 3C05809D */  lui     $a1, %hi(func_809C99C4)    ## $a1 = 809D0000
/* 00BB8 809C9978 24A599C4 */  addiu   $a1, $a1, %lo(func_809C99C4) ## $a1 = 809C99C4
/* 00BBC 809C997C 0C272370 */  jal     func_809C8DC0              
/* 00BC0 809C9980 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00BC4 809C9984 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00BC8 809C9988 0C020120 */  jal     func_80080480              
/* 00BCC 809C998C 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 00BD0 809C9990 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00BD4 809C9994 0C0201CA */  jal     func_80080728              
/* 00BD8 809C9998 92050002 */  lbu     $a1, 0x0002($s0)           ## 00000002
/* 00BDC 809C999C 10400003 */  beq     $v0, $zero, .L809C99AC     
/* 00BE0 809C99A0 240EFFE2 */  addiu   $t6, $zero, 0xFFE2         ## $t6 = FFFFFFE2
/* 00BE4 809C99A4 10000002 */  beq     $zero, $zero, .L809C99B0   
/* 00BE8 809C99A8 AE0001A8 */  sw      $zero, 0x01A8($s0)         ## 000001A8
.L809C99AC:
/* 00BEC 809C99AC AE0E01A8 */  sw      $t6, 0x01A8($s0)           ## 000001A8
.L809C99B0:
/* 00BF0 809C99B0 8FBF001C */  lw      $ra, 0x001C($sp)           
.L809C99B4:
/* 00BF4 809C99B4 8FB00014 */  lw      $s0, 0x0014($sp)           
/* 00BF8 809C99B8 8FB10018 */  lw      $s1, 0x0018($sp)           
/* 00BFC 809C99BC 03E00008 */  jr      $ra                        
/* 00C00 809C99C0 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
