glabel func_80B14410
/* 00970 80B14410 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00974 80B14414 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00978 80B14418 8C4E0004 */  lw      $t6, 0x0004($v0)           ## 8015E664
/* 0097C 80B1441C 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 00980 80B14420 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 00984 80B14424 11C0000C */  beq     $t6, $zero, .L80B14458     
/* 00988 80B14428 3C0580B1 */  lui     $a1, %hi(func_80B14CAC)    ## $a1 = 80B10000
/* 0098C 80B1442C 3C0580B1 */  lui     $a1, %hi(func_80B14C18)    ## $a1 = 80B10000
/* 00990 80B14430 3C0680B1 */  lui     $a2, %hi(func_80B167C0)    ## $a2 = 80B10000
/* 00994 80B14434 24C667C0 */  addiu   $a2, $a2, %lo(func_80B167C0) ## $a2 = 80B167C0
/* 00998 80B14438 0C2C4EA8 */  jal     func_80B13AA0              
/* 0099C 80B1443C 24A54C18 */  addiu   $a1, $a1, %lo(func_80B14C18) ## $a1 = 80B14C18
/* 009A0 80B14440 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 009A4 80B14444 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 009A8 80B14448 944F0ED6 */  lhu     $t7, 0x0ED6($v0)           ## 8015F536
/* 009AC 80B1444C 35F80008 */  ori     $t8, $t7, 0x0008           ## $t8 = 00000008
/* 009B0 80B14450 1000000A */  beq     $zero, $zero, .L80B1447C   
/* 009B4 80B14454 A4580ED6 */  sh      $t8, 0x0ED6($v0)           ## 8015F536
.L80B14458:
/* 009B8 80B14458 3C0680B1 */  lui     $a2, %hi(func_80B167C0)    ## $a2 = 80B10000
/* 009BC 80B1445C 24C667C0 */  addiu   $a2, $a2, %lo(func_80B167C0) ## $a2 = 80B167C0
/* 009C0 80B14460 0C2C4EA8 */  jal     func_80B13AA0              
/* 009C4 80B14464 24A54CAC */  addiu   $a1, $a1, %lo(func_80B14CAC) ## $a1 = 00004CAC
/* 009C8 80B14468 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 009CC 80B1446C 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 009D0 80B14470 94590EE0 */  lhu     $t9, 0x0EE0($v0)           ## 8015F540
/* 009D4 80B14474 37280400 */  ori     $t0, $t9, 0x0400           ## $t0 = 00000400
/* 009D8 80B14478 A4480EE0 */  sh      $t0, 0x0EE0($v0)           ## 8015F540
.L80B1447C:
/* 009DC 80B1447C 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 009E0 80B14480 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 009E4 80B14484 03E00008 */  jr      $ra                        
/* 009E8 80B14488 00000000 */  nop
