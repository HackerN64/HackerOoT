glabel func_80A78160
/* 03E50 80A78160 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 03E54 80A78164 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 03E58 80A78168 AFA5001C */  sw      $a1, 0x001C($sp)           
/* 03E5C 80A7816C 8C980004 */  lw      $t8, 0x0004($a0)           ## 00000004
/* 03E60 80A78170 3C0E80A7 */  lui     $t6, %hi(func_80A75FA0)    ## $t6 = 80A70000
/* 03E64 80A78174 3C0F80A7 */  lui     $t7, %hi(func_80A76798)    ## $t7 = 80A70000
/* 03E68 80A78178 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 03E6C 80A7817C 25CE5FA0 */  addiu   $t6, $t6, %lo(func_80A75FA0) ## $t6 = 80A75FA0
/* 03E70 80A78180 25EF6798 */  addiu   $t7, $t7, %lo(func_80A76798) ## $t7 = 80A76798
/* 03E74 80A78184 37190005 */  ori     $t9, $t8, 0x0005           ## $t9 = 00000005
/* 03E78 80A78188 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 03E7C 80A7818C AC8E0130 */  sw      $t6, 0x0130($a0)           ## 00000130
/* 03E80 80A78190 AC8F0134 */  sw      $t7, 0x0134($a0)           ## 00000134
/* 03E84 80A78194 AC990004 */  sw      $t9, 0x0004($a0)           ## 00000004
/* 03E88 80A78198 94480EDA */  lhu     $t0, 0x0EDA($v0)           ## 8015F53A
/* 03E8C 80A7819C 3C053C44 */  lui     $a1, 0x3C44                ## $a1 = 3C440000
/* 03E90 80A781A0 34A59BA6 */  ori     $a1, $a1, 0x9BA6           ## $a1 = 3C449BA6
/* 03E94 80A781A4 35090800 */  ori     $t1, $t0, 0x0800           ## $t1 = 00000800
/* 03E98 80A781A8 A4490EDA */  sh      $t1, 0x0EDA($v0)           ## 8015F53A
/* 03E9C 80A781AC 0C00B58B */  jal     Actor_SetScale
              
/* 03EA0 80A781B0 AFA40018 */  sw      $a0, 0x0018($sp)           
/* 03EA4 80A781B4 0C29D227 */  jal     func_80A7489C              
/* 03EA8 80A781B8 8FA40018 */  lw      $a0, 0x0018($sp)           
/* 03EAC 80A781BC 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 03EB0 80A781C0 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 03EB4 80A781C4 03E00008 */  jr      $ra                        
/* 03EB8 80A781C8 00000000 */  nop
