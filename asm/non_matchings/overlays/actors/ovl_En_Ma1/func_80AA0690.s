glabel func_80AA0690
/* 00000 80AA0690 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 00004 80AA0694 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 00008 80AA0698 AFA5001C */  sw      $a1, 0x001C($sp)           
/* 0000C 80AA069C 0C01B0D8 */  jal     Text_GetFaceReaction              
/* 00010 80AA06A0 24050017 */  addiu   $a1, $zero, 0x0017         ## $a1 = 00000017
/* 00014 80AA06A4 10400003 */  beq     $v0, $zero, .L80AA06B4     
/* 00018 80AA06A8 3043FFFF */  andi    $v1, $v0, 0xFFFF           ## $v1 = 00000000
/* 0001C 80AA06AC 1000002E */  beq     $zero, $zero, .L80AA0768   
/* 00020 80AA06B0 00601025 */  or      $v0, $v1, $zero            ## $v0 = 00000000
.L80AA06B4:
/* 00024 80AA06B4 3C038016 */  lui     $v1, %hi(gSaveContext)
/* 00028 80AA06B8 2463E660 */  addiu   $v1, %lo(gSaveContext)
/* 0002C 80AA06BC 3C0E8012 */  lui     $t6, %hi(gBitFlags+0x34)
/* 00030 80AA06C0 8DCE7154 */  lw      $t6, %lo(gBitFlags+0x34)($t6)
/* 00034 80AA06C4 8C6F00A4 */  lw      $t7, 0x00A4($v1)           ## 8015E704
/* 00038 80AA06C8 01CFC024 */  and     $t8, $t6, $t7              
/* 0003C 80AA06CC 53000004 */  beql    $t8, $zero, .L80AA06E0     
/* 00040 80AA06D0 94620ED6 */  lhu     $v0, 0x0ED6($v1)           ## 8015F536
/* 00044 80AA06D4 10000024 */  beq     $zero, $zero, .L80AA0768   
/* 00048 80AA06D8 2402204A */  addiu   $v0, $zero, 0x204A         ## $v0 = 0000204A
/* 0004C 80AA06DC 94620ED6 */  lhu     $v0, 0x0ED6($v1)           ## 8015F536
.L80AA06E0:
/* 00050 80AA06E0 30590040 */  andi    $t9, $v0, 0x0040           ## $t9 = 00000040
/* 00054 80AA06E4 13200003 */  beq     $t9, $zero, .L80AA06F4     
/* 00058 80AA06E8 30480020 */  andi    $t0, $v0, 0x0020           ## $t0 = 00000000
/* 0005C 80AA06EC 1000001E */  beq     $zero, $zero, .L80AA0768   
/* 00060 80AA06F0 24022049 */  addiu   $v0, $zero, 0x2049         ## $v0 = 00002049
.L80AA06F4:
/* 00064 80AA06F4 11000009 */  beq     $t0, $zero, .L80AA071C     
/* 00068 80AA06F8 304B0010 */  andi    $t3, $v0, 0x0010           ## $t3 = 00000000
/* 0006C 80AA06FC 94690F08 */  lhu     $t1, 0x0F08($v1)           ## 8015F568
/* 00070 80AA0700 312A0020 */  andi    $t2, $t1, 0x0020           ## $t2 = 00000000
/* 00074 80AA0704 11400003 */  beq     $t2, $zero, .L80AA0714     
/* 00078 80AA0708 00000000 */  nop
/* 0007C 80AA070C 10000016 */  beq     $zero, $zero, .L80AA0768   
/* 00080 80AA0710 24022049 */  addiu   $v0, $zero, 0x2049         ## $v0 = 00002049
.L80AA0714:
/* 00084 80AA0714 10000014 */  beq     $zero, $zero, .L80AA0768   
/* 00088 80AA0718 24022048 */  addiu   $v0, $zero, 0x2048         ## $v0 = 00002048
.L80AA071C:
/* 0008C 80AA071C 11600003 */  beq     $t3, $zero, .L80AA072C     
/* 00090 80AA0720 304C0004 */  andi    $t4, $v0, 0x0004           ## $t4 = 00000000
/* 00094 80AA0724 10000010 */  beq     $zero, $zero, .L80AA0768   
/* 00098 80AA0728 24022047 */  addiu   $v0, $zero, 0x2047         ## $v0 = 00002047
.L80AA072C:
/* 0009C 80AA072C 51800004 */  beql    $t4, $zero, .L80AA0740     
/* 000A0 80AA0730 94620F08 */  lhu     $v0, 0x0F08($v1)           ## 8015F568
/* 000A4 80AA0734 1000000C */  beq     $zero, $zero, .L80AA0768   
/* 000A8 80AA0738 24022044 */  addiu   $v0, $zero, 0x2044         ## $v0 = 00002044
/* 000AC 80AA073C 94620F08 */  lhu     $v0, 0x0F08($v1)           ## 8015F568
.L80AA0740:
/* 000B0 80AA0740 304D0010 */  andi    $t5, $v0, 0x0010           ## $t5 = 00000000
/* 000B4 80AA0744 11A00007 */  beq     $t5, $zero, .L80AA0764     
/* 000B8 80AA0748 304E0800 */  andi    $t6, $v0, 0x0800           ## $t6 = 00000000
/* 000BC 80AA074C 11C00003 */  beq     $t6, $zero, .L80AA075C     
/* 000C0 80AA0750 00000000 */  nop
/* 000C4 80AA0754 10000004 */  beq     $zero, $zero, .L80AA0768   
/* 000C8 80AA0758 24022043 */  addiu   $v0, $zero, 0x2043         ## $v0 = 00002043
.L80AA075C:
/* 000CC 80AA075C 10000002 */  beq     $zero, $zero, .L80AA0768   
/* 000D0 80AA0760 24022042 */  addiu   $v0, $zero, 0x2042         ## $v0 = 00002042
.L80AA0764:
/* 000D4 80AA0764 24022041 */  addiu   $v0, $zero, 0x2041         ## $v0 = 00002041
.L80AA0768:
/* 000D8 80AA0768 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 000DC 80AA076C 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 000E0 80AA0770 03E00008 */  jr      $ra                        
/* 000E4 80AA0774 00000000 */  nop
