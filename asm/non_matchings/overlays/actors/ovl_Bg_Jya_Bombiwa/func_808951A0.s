.rdata
glabel D_80895770
    .asciz "Warning : move BG 登録失敗(%s %d)(name %d)(arg_data 0x%04x)\n"
    .balign 4

glabel D_808957B0
    .asciz "../z_bg_jya_bombiwa.c"
    .balign 4

.text
glabel func_808951A0
/* 00000 808951A0 27BDFFC8 */  addiu   $sp, $sp, 0xFFC8           ## $sp = FFFFFFC8
/* 00004 808951A4 AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 00008 808951A8 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 0000C 808951AC AFA5003C */  sw      $a1, 0x003C($sp)           
/* 00010 808951B0 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00014 808951B4 AFA60040 */  sw      $a2, 0x0040($sp)           
/* 00018 808951B8 AFA00030 */  sw      $zero, 0x0030($sp)         
/* 0001C 808951BC 0C010D20 */  jal     DynaPolyInfo_SetActorMove
              
/* 00020 808951C0 00E02825 */  or      $a1, $a3, $zero            ## $a1 = 00000000
/* 00024 808951C4 8FA40040 */  lw      $a0, 0x0040($sp)           
/* 00028 808951C8 0C010620 */  jal     DynaPolyInfo_Alloc
              
/* 0002C 808951CC 27A50030 */  addiu   $a1, $sp, 0x0030           ## $a1 = FFFFFFF8
/* 00030 808951D0 8FA4003C */  lw      $a0, 0x003C($sp)           
/* 00034 808951D4 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 00038 808951D8 8FA70030 */  lw      $a3, 0x0030($sp)           
/* 0003C 808951DC 0C00FA9D */  jal     DynaPolyInfo_RegisterActor
              ## DynaPolyInfo_setActor
/* 00040 808951E0 24850810 */  addiu   $a1, $a0, 0x0810           ## $a1 = 00000810
/* 00044 808951E4 24010032 */  addiu   $at, $zero, 0x0032         ## $at = 00000032
/* 00048 808951E8 1441000A */  bne     $v0, $at, .L80895214       
/* 0004C 808951EC AE02014C */  sw      $v0, 0x014C($s0)           ## 0000014C
/* 00050 808951F0 860E001C */  lh      $t6, 0x001C($s0)           ## 0000001C
/* 00054 808951F4 3C048089 */  lui     $a0, %hi(D_80895770)       ## $a0 = 80890000
/* 00058 808951F8 3C058089 */  lui     $a1, %hi(D_808957B0)       ## $a1 = 80890000
/* 0005C 808951FC 86070000 */  lh      $a3, 0x0000($s0)           ## 00000000
/* 00060 80895200 24A557B0 */  addiu   $a1, $a1, %lo(D_808957B0)  ## $a1 = 808957B0
/* 00064 80895204 24845770 */  addiu   $a0, $a0, %lo(D_80895770)  ## $a0 = 80895770
/* 00068 80895208 240600AE */  addiu   $a2, $zero, 0x00AE         ## $a2 = 000000AE
/* 0006C 8089520C 0C00084C */  jal     osSyncPrintf
              
/* 00070 80895210 AFAE0010 */  sw      $t6, 0x0010($sp)           
.L80895214:
/* 00074 80895214 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 00078 80895218 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 0007C 8089521C 27BD0038 */  addiu   $sp, $sp, 0x0038           ## $sp = 00000000
/* 00080 80895220 03E00008 */  jr      $ra                        
/* 00084 80895224 00000000 */  nop
