glabel func_8081F81C
/* 0BFFC 8081F81C 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 0C000 8081F820 AFA50024 */  sw      $a1, 0x0024($sp)           
/* 0C004 8081F824 97AE0026 */  lhu     $t6, 0x0026($sp)           
/* 0C008 8081F828 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 0C00C 8081F82C AFBF001C */  sw      $ra, 0x001C($sp)           
/* 0C010 8081F830 AFA40020 */  sw      $a0, 0x0020($sp)           
/* 0C014 8081F834 00811021 */  addu    $v0, $a0, $at              
/* 0C018 8081F838 3C078013 */  lui     $a3, %hi(D_801333E0)
/* 0C01C 8081F83C 3C0F8013 */  lui     $t7, %hi(D_801333E8)
/* 0C020 8081F840 24E733E0 */  addiu   $a3, %lo(D_801333E0)
/* 0C024 8081F844 A440099A */  sh      $zero, 0x099A($v0)         ## 0000099A
/* 0C028 8081F848 25EF33E8 */  addiu   $t7, %lo(D_801333E8)
/* 0C02C 8081F84C 3C058013 */  lui     $a1, %hi(D_801333D4)
/* 0C030 8081F850 A44E0998 */  sh      $t6, 0x0998($v0)           ## 00000998
/* 0C034 8081F854 AFAF0014 */  sw      $t7, 0x0014($sp)           
/* 0C038 8081F858 AFA70010 */  sw      $a3, 0x0010($sp)           
/* 0C03C 8081F85C 24A533D4 */  addiu   $a1, %lo(D_801333D4)
/* 0C040 8081F860 24044808 */  addiu   $a0, $zero, 0x4808         ## $a0 = 00004808
/* 0C044 8081F864 0C03DCE3 */  jal     Audio_PlaySoundGeneral
              
/* 0C048 8081F868 24060004 */  addiu   $a2, $zero, 0x0004         ## $a2 = 00000004
/* 0C04C 8081F86C 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 0C050 8081F870 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
/* 0C054 8081F874 03E00008 */  jr      $ra                        
/* 0C058 8081F878 00000000 */  nop
