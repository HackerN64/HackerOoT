glabel func_80A54038
/* 01198 80A54038 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 0119C 80A5403C AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 011A0 80A54040 AFA40018 */  sw      $a0, 0x0018($sp)           
/* 011A4 80A54044 AFA5001C */  sw      $a1, 0x001C($sp)           
/* 011A8 80A54048 0C02927F */  jal     SkelAnime_FrameUpdateMatrix
              
/* 011AC 80A5404C 2484014C */  addiu   $a0, $a0, 0x014C           ## $a0 = 0000014C
/* 011B0 80A54050 8FA4001C */  lw      $a0, 0x001C($sp)           
/* 011B4 80A54054 0C042F6F */  jal     func_8010BDBC              
/* 011B8 80A54058 248420D8 */  addiu   $a0, $a0, 0x20D8           ## $a0 = 000020D8
/* 011BC 80A5405C 24010005 */  addiu   $at, $zero, 0x0005         ## $at = 00000005
/* 011C0 80A54060 54410014 */  bnel    $v0, $at, .L80A540B4       
/* 011C4 80A54064 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 011C8 80A54068 0C041AF2 */  jal     func_80106BC8              
/* 011CC 80A5406C 8FA4001C */  lw      $a0, 0x001C($sp)           
/* 011D0 80A54070 1040000F */  beq     $v0, $zero, .L80A540B0     
/* 011D4 80A54074 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 011D8 80A54078 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 011DC 80A5407C 944E0F06 */  lhu     $t6, 0x0F06($v0)           ## 8015F566
/* 011E0 80A54080 8FA4001C */  lw      $a0, 0x001C($sp)           
/* 011E4 80A54084 35CF0040 */  ori     $t7, $t6, 0x0040           ## $t7 = 00000040
/* 011E8 80A54088 0C041B33 */  jal     func_80106CCC              
/* 011EC 80A5408C A44F0F06 */  sh      $t7, 0x0F06($v0)           ## 8015F566
/* 011F0 80A54090 8FA4001C */  lw      $a0, 0x001C($sp)           
/* 011F4 80A54094 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 011F8 80A54098 0C00B7D5 */  jal     func_8002DF54              
/* 011FC 80A5409C 24060007 */  addiu   $a2, $zero, 0x0007         ## $a2 = 00000007
/* 01200 80A540A0 8FB90018 */  lw      $t9, 0x0018($sp)           
/* 01204 80A540A4 3C1880A5 */  lui     $t8, %hi(func_80A53908)    ## $t8 = 80A50000
/* 01208 80A540A8 27183908 */  addiu   $t8, $t8, %lo(func_80A53908) ## $t8 = 80A53908
/* 0120C 80A540AC AF38025C */  sw      $t8, 0x025C($t9)           ## 0000025C
.L80A540B0:
/* 01210 80A540B0 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L80A540B4:
/* 01214 80A540B4 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 01218 80A540B8 03E00008 */  jr      $ra                        
/* 0121C 80A540BC 00000000 */  nop
