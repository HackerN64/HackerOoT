glabel func_80B518C0
/* 02F30 80B518C0 3C020600 */  lui     $v0, 0x0600                ## $v0 = 06000000
/* 02F34 80B518C4 24424900 */  addiu   $v0, $v0, 0x4900           ## $v0 = 06004900
/* 02F38 80B518C8 00027100 */  sll     $t6, $v0,  4               
/* 02F3C 80B518CC 000E7F02 */  srl     $t7, $t6, 28               
/* 02F40 80B518D0 000FC080 */  sll     $t8, $t7,  2               
/* 02F44 80B518D4 3C198016 */  lui     $t9, %hi(gSegments)
/* 02F48 80B518D8 0338C821 */  addu    $t9, $t9, $t8              
/* 02F4C 80B518DC 3C0100FF */  lui     $at, 0x00FF                ## $at = 00FF0000
/* 02F50 80B518E0 8F396FA8 */  lw      $t9, %lo(gSegments)($t9)
/* 02F54 80B518E4 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = 00FFFFFF
/* 02F58 80B518E8 00414024 */  and     $t0, $v0, $at              
/* 02F5C 80B518EC 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 02F60 80B518F0 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 02F64 80B518F4 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 02F68 80B518F8 03282821 */  addu    $a1, $t9, $t0              
/* 02F6C 80B518FC 00A12821 */  addu    $a1, $a1, $at              
/* 02F70 80B51900 AFA00010 */  sw      $zero, 0x0010($sp)         
/* 02F74 80B51904 AFA40020 */  sw      $a0, 0x0020($sp)           
/* 02F78 80B51908 24060002 */  addiu   $a2, $zero, 0x0002         ## $a2 = 00000002
/* 02F7C 80B5190C 0C2D3F40 */  jal     func_80B4FD00              
/* 02F80 80B51910 3C07C100 */  lui     $a3, 0xC100                ## $a3 = C1000000
/* 02F84 80B51914 8FA40020 */  lw      $a0, 0x0020($sp)           
/* 02F88 80B51918 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 02F8C 80B5191C 24090020 */  addiu   $t1, $zero, 0x0020         ## $t1 = 00000020
/* 02F90 80B51920 240A0001 */  addiu   $t2, $zero, 0x0001         ## $t2 = 00000001
/* 02F94 80B51924 240B00FF */  addiu   $t3, $zero, 0x00FF         ## $t3 = 000000FF
/* 02F98 80B51928 AC89019C */  sw      $t1, 0x019C($a0)           ## 0000019C
/* 02F9C 80B5192C AC8A01A0 */  sw      $t2, 0x01A0($a0)           ## 000001A0
/* 02FA0 80B51930 A08B00C8 */  sb      $t3, 0x00C8($a0)           ## 000000C8
/* 02FA4 80B51934 E484027C */  swc1    $f4, 0x027C($a0)           ## 0000027C
/* 02FA8 80B51938 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 02FAC 80B5193C 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
/* 02FB0 80B51940 03E00008 */  jr      $ra                        
/* 02FB4 80B51944 00000000 */  nop
