.rdata
glabel D_808B1710
    .asciz "Warning : move BG 登録失敗(%s %d)(name %d)(arg_data 0x%04x)\n"
    .balign 4

glabel D_808B1750
    .asciz "../z_bg_spot08_iceblock.c"
    .balign 4

.text
glabel func_808B0968
/* 00008 808B0968 27BDFFC8 */  addiu   $sp, $sp, 0xFFC8           ## $sp = FFFFFFC8
/* 0000C 808B096C AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 00010 808B0970 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 00014 808B0974 AFA5003C */  sw      $a1, 0x003C($sp)           
/* 00018 808B0978 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 0001C 808B097C AFA60040 */  sw      $a2, 0x0040($sp)           
/* 00020 808B0980 AFA00030 */  sw      $zero, 0x0030($sp)         
/* 00024 808B0984 0C010D20 */  jal     DynaPolyActor_Init
              
/* 00028 808B0988 00E02825 */  or      $a1, $a3, $zero            ## $a1 = 00000000
/* 0002C 808B098C 8FA40040 */  lw      $a0, 0x0040($sp)           
/* 00030 808B0990 0C010620 */  jal     CollisionHeader_GetVirtual
              
/* 00034 808B0994 27A50030 */  addiu   $a1, $sp, 0x0030           ## $a1 = FFFFFFF8
/* 00038 808B0998 8FA4003C */  lw      $a0, 0x003C($sp)           
/* 0003C 808B099C 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 00040 808B09A0 8FA70030 */  lw      $a3, 0x0030($sp)           
/* 00044 808B09A4 0C00FA9D */  jal     DynaPoly_SetBgActor
              ## DynaPoly_SetBgActor
/* 00048 808B09A8 24850810 */  addiu   $a1, $a0, 0x0810           ## $a1 = 00000810
/* 0004C 808B09AC 24010032 */  addiu   $at, $zero, 0x0032         ## $at = 00000032
/* 00050 808B09B0 1441000A */  bne     $v0, $at, .L808B09DC       
/* 00054 808B09B4 AE02014C */  sw      $v0, 0x014C($s0)           ## 0000014C
/* 00058 808B09B8 860E001C */  lh      $t6, 0x001C($s0)           ## 0000001C
/* 0005C 808B09BC 3C04808B */  lui     $a0, %hi(D_808B1710)       ## $a0 = 808B0000
/* 00060 808B09C0 3C05808B */  lui     $a1, %hi(D_808B1750)       ## $a1 = 808B0000
/* 00064 808B09C4 86070000 */  lh      $a3, 0x0000($s0)           ## 00000000
/* 00068 808B09C8 24A51750 */  addiu   $a1, $a1, %lo(D_808B1750)  ## $a1 = 808B1750
/* 0006C 808B09CC 24841710 */  addiu   $a0, $a0, %lo(D_808B1710)  ## $a0 = 808B1710
/* 00070 808B09D0 240600D9 */  addiu   $a2, $zero, 0x00D9         ## $a2 = 000000D9
/* 00074 808B09D4 0C00084C */  jal     osSyncPrintf
              
/* 00078 808B09D8 AFAE0010 */  sw      $t6, 0x0010($sp)           
.L808B09DC:
/* 0007C 808B09DC 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 00080 808B09E0 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 00084 808B09E4 27BD0038 */  addiu   $sp, $sp, 0x0038           ## $sp = 00000000
/* 00088 808B09E8 03E00008 */  jr      $ra                        
/* 0008C 808B09EC 00000000 */  nop
